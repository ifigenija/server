<?php

/**
 * (copyleft) Licenca
 */

namespace Max\Factory;

use Doctrine\Common\Annotations\AnnotationReader;
use Doctrine\Common\Annotations\CachedReader;
use Doctrine\ORM\EntityManager;
use Max\Ann\Entity\Acl;
use Max\Ann\Entity\I18n;
use Max\Ann\Entity\Id;
use Max\Ann\Entity\Search;
use Max\Ann\Entity\Tracking;
use Max\Ann\Entity\Ui;
use Max\Ann\EntityMetadata;
use ReflectionClass;
use Zend\Filter\Word\CamelCaseToSeparator;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

/**
 *  Naredi novi metadata objekt entity class.
 * uporablja se kot service 'metadata.factory'
 * Proizvaja nove \Max\Ann\EntityMetadata objekte z metodo factory($entityName)
 *
 * @author Boris Lašič <boris@max.si>
 * Ustvarjeno: 18.3.2013
 */
class EntityMetadataFactory
        implements ServiceLocatorAwareInterface
{

    /**
     * Maping imen, ki jih uporabljam za defaultne labele
     *
     * @var array<string>
     */
    protected $nameMap = [
    ];

    /**
     * Service Manager
     *
     * @var ServiceLocatorInterface
     */
    protected $serviceLocator;

    /**
     * entity Manager
     *
     * @var EntityManager
     */
    protected $em;

    /**
     * Pridobi service locator
     *
     * @return ServiceLocatorInterface
     */
    public function getServiceLocator()
    {
        return $this->serviceLocator;
    }

    /**
     * Nastavi service locator
     * @param ServiceLocatorInterface $serviceLocator
     */
    public function setServiceLocator(ServiceLocatorInterface $serviceLocator)
    {
        $this->serviceLocator = $serviceLocator;
    }

    /**
     * Vrne specializiran Metadata objekt z naloženimi anotacijami
     *
     * @param string $entityName
     * @return EntityMetadata
     */
    public function factory($entityName)
    {

        $this->em = $this->serviceLocator->get('\Doctrine\ORM\EntityManager');
        $cache = $this->em->getConfiguration()->getMetadataCacheImpl();
        // pogledam, če so metapodatki v cache
        if ($cache->contains('ifi-meta' . $entityName)) {
            $meta = $cache->fetch('ifi-meta-' . $entityName);
        } else {

            // pripravim novo instanco Metadata v katero polnim annotacije
            $meta = new EntityMetadata($entityName);

            // naložim metapodatke iz anotacij
            $reader = new AnnotationReader();

            $annotationReader = new CachedReader($reader, $cache);

            $reflClass = new ReflectionClass($entityName);

            $classAnn = $annotationReader->getClassAnnotations($reflClass);

            $this->set($meta, $classAnn);

            // poskušam dobiti manjkajoče podatke iz defaultov
            $this->getClassDefaults($meta);
            $ui = [];
            $i18n = [];
            $rev = [];
            // metapodatki za propertije
            foreach ($reflClass->getProperties() as $p) {

                $propAnn = $annotationReader->getPropertyAnnotations($p);
                if ($propAnn) {
                    foreach ($propAnn as $ann) {
                        if ($ann instanceof I18n) {
                            $i18n[$p->name] = $ann;
                        }
                        if ($ann instanceof Ui) {
                            $ui[$p->name] = $ann;
                        }
                        if ($ann instanceof Tracking) {
                            $rev[$p->name] = $ann;
                        }
                    }

                    if (!isset($i18n[$p->name])) {
                        $i = new I18n();
                        $i->label = $this->getPropertyDefaults($p->name);
                        $i18n[$p->name] = $i;
                    }

                    if (!isset($trc[$p->name])) {
                        $trc[$p->name] = new Tracking();
                    }
                }
            }
            $meta->setPropertyI18n($i18n);
            $meta->setPropertyUi($ui);
            $meta->setPropertyTracking($trc);

            // shranim metapodatke za entiteto v cache
            $cache->save('ifi-meta-' . $entityName, $meta);
        }

        $meta->setMapping($this->em->getClassMetadata($entityName));


        return $meta;
    }

    /**
     * 
     * @param EntiyMeta $meta
     * @param array $classAnn
     */
    public function set($meta, $classAnn)
    {
        // metapodatki za class
        if ($classAnn) {
            foreach ($classAnn as $ann) {

                if ($ann instanceof I18n) {
                    $meta->setI18n($ann);
                }
                if ($ann instanceof Ui) {
                    $meta->setUi($ann);
                }

                if ($ann instanceof Id) {
                    $meta->setId($ann);
                }

                if ($ann instanceof Search) {
                    $meta->setSearch($ann);
                }
                if ($ann instanceof Acl) {
                        $meta->setAcl($ann);
                }
                if ($ann instanceof Tracking) {
                    $meta->setTracking($ann);
                }
            }
        }
    }

    /**
     * Napolni metapodatke z privzetimi vrednosmi, kjer jih ni na anotacijah
     *
     * @param type $entityName
     * @param \Max\Ann\Entity $meta
     */
    public function getClassDefaults(EntityMetadata $meta)
    {

        $a = explode('\\', $meta->getEntityName());
        $ent = array_pop($a);

        // če ni i18n na entiteti
        if (!$meta->getI18n()) {
            $i18n = new I18n();
            $i18n->label = $ent;
            $meta->setI18n($i18n);
        }

        if (!$meta->acl) {
            $acl = new Acl;
            $acl->base = $ent;
            $meta->setAcl($acl);
        } 
        if (!$meta->acl->base) {
            $meta->acl->base = $ent;
        }
        // če ni i18n na entiteti
        if (!$meta->getId()) {
            $id = new Id();
            $meta->setId($id);
        }
        // če ni i18n na entiteti
        if (!$meta->getTracking()) {
            $id = new Tracking();
            $meta->setTracking($id);
        }
    }

    /**
     * Vrne string s privzeto labelo za property
     *
     * @param $name
     * @return string
     */
    public function getPropertyDefaults($name)
    {
        $f = new CamelCaseToSeparator(' ');
        if (array_key_exists($name, $this->nameMap)) {
            return $this->nameMap[$name];
        } else {
            return ucfirst($f->filter($name));
        }
    }

    /**
     * 
     * Vrne array z imeni 
     */
    public function getAllEntityConfig()
    {
        $this->em = $this->serviceLocator->get('\Doctrine\ORM\EntityManager');
        $cache = $this->em->getConfiguration()->getMetadataCacheImpl();
        $cacheId = 'entity-config-1123';
        // pogledam, če so metapodatki v cache
        if ($cache->contains($cacheId)) {
            $config = $cache->fetch($cacheId);
        } else {
            $entites = $this->em->getConfiguration()->getMetadataDriverImpl()->getAllClassNames();
            $config = [];
            foreach ($entites as $class) {
                $array = explode('\\', $class);
                $name = array_pop($array);
                $config[$name] = $this->factory($class)->getId()->prefix;
            }
            $cache->save($cacheId, $config);
        }
        return $config;
    }

}
