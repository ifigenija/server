<?php

/**
 * (copyleft) Licenca
 */

namespace Max\Ann;

use Doctrine\Common\Annotations\AnnotationReader;
use Doctrine\Common\Annotations\CachedReader;
use Doctrine\ORM\EntityManager;
use ReflectionClass;
use Max\Ann\Entity\Acl;
use Max\Ann\Entity\I18n;
use Max\Ann\Entity\Lookup;
use Max\Ann\Entity\Ui;
use Max\Ann\Entity\Revizija;
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
        'sifra' => 'Šifra',
        'maticna' => 'Matična',
        'stevilka' => 'Številka',
        'stev' => 'Številka',
        'pos' => 'Pozicija',
        'pomozni' => 'Pomožni',
        'oper' => 'Operacija',
        'razKol' => 'Razpisana Količina',
        'kolicina' => 'Količina',
        'zacetek' => 'Začetek',
        'dok' => 'Max dokumenta',
        'posta' => 'Pošta',
        'postaNaziv' => 'Kraj',
        'drzava' => 'Država',
        'kw' => 'Teden',
        'datKnj' => 'Zadnja sprememba',
        'upor' => 'Uporabnik',
        'datDog' => 'Datum dogodka',
        'delKol' => 'Delovna količina',
        'norEta' => 'Norma etalon',
        'expires' => 'Veljavnost',
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
     * @return Max\Ann\EntityMetadata
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
            $meta = new \Max\Ann\EntityMetadata($entityName);

            // naložim metapodatke iz anotacij
            $reader = new AnnotationReader();

            $annotationReader = new CachedReader($reader, $cache);

            $reflClass = new ReflectionClass($entityName);

            $classAnn = $annotationReader->getClassAnnotations($reflClass);

            $meta->setMapping($this->em->getClassMetadata($entityName));
            // metapodatki za class
            if ($classAnn) {
                foreach ($classAnn as $ann) {
                    if ($ann instanceof I18n) {
                        $meta->setI18n($ann);
                    }
                    if ($ann instanceof Ui) {
                        $meta->setUi($ann);
                    }
                    if ($ann instanceof Lookup) {
                        $meta->setLookup($ann);
                    }
                    if ($ann instanceof Acl) {
                        $meta->setAcl($ann);
                    }
                    if ($ann instanceof Tracking) {
                        $meta->setTracking($ann);
                    }
                }
            }
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
            $meta->setPropertyRevizija($trc);

            // shranim metapodatke za entiteto v cache
            $cache->save('ifi-meta-' . $entityName, $meta);
        }
        return $meta;
    }

    /**
     * Napolni metapodatke z privzetimi vrednosmi, kjer jih ni na anotacijah
     *
     * @param type $entityName
     * @param \Max\Ann\Entity $meta
     */
    public function getClassDefaults(\Max\Ann\EntityMetadata $meta)
    {

        // če ni i18n na entiteti
        if (!$meta->getI18n()) {
            $f = new CamelCaseToSeparator(' ');
            $ent = str_replace('Max\Entity\\', '', $meta->getEntityName());
            $ent = $f->filter($ent);
            $i18n = new I18n();
            $i18n->label = $ent;
            $meta->setI18n($i18n);
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

}
