<?php

/**
 * (copyleft) Licenca
 */

namespace Tip\Annotation;

use Doctrine\Common\Annotations\AnnotationReader;
use Doctrine\Common\Annotations\CachedReader;
use Doctrine\ORM\EntityManager;
use ReflectionClass;
use Tip\Annotation\Entity\Acl;
use Tip\Annotation\Entity\I18n;
use Tip\Annotation\Entity\Lookup;
use Tip\Annotation\Entity\Ui;
use Tip\Annotation\Entity\Revizija;
use Zend\Filter\Word\CamelCaseToSeparator;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

/**
 *  Naredi novi metadata objekt entity class.
 * uporablja se kot service 'metadata.factory'
 * Proizvaja nove \Tip\Annotation\EntityMetadata objekte z metodo factory($entityName)
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
        'dok' => 'Tip dokumenta',
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
     * @return Tip\Annotation\EntityMetadata
     */
    public function factory($entityName)
    {

        $this->em = $this->serviceLocator->get('\Doctrine\ORM\EntityManager');
        $cache = $this->em->getConfiguration()->getMetadataCacheImpl();
        // pogledam, če so metapodatki v cache
        if ($cache->contains('tip-anotacije-' . $entityName)) {
            $meta = $cache->fetch('tip-anotacije-' . $entityName);
        } else {

            // pripravim novo instanco Metadata v katero polnim annotacije
            $meta = new \Tip\Annotation\EntityMetadata($entityName);

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
                    if ($ann instanceof Revizija) {
                        $meta->setRevizija($ann);
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
                        if ($ann instanceof Revizija) {
                            $rev[$p->name] = $ann;
                        }
                    }

                    if (!isset($i18n[$p->name])) {
                        $i = new I18n();
                        $i->label = $this->getPropertyDefaults($p->name);
                        $i18n[$p->name] = $i;
                    }

                    if (!isset($rev[$p->name])) {
                        $rev[$p->name] = new Revizija();
                    }
                }
            }
            $meta->setPropertyI18n($i18n);
            $meta->setPropertyUi($ui);
            $meta->setPropertyRevizija($rev);

            // shranim metapodatke za entiteto v cache
            $cache->save('tip-anotacije-' . $entityName, $meta);
        }
        return $meta;
    }

    /**
     * Napolni metapodatke z privzetimi vrednosmi, kjer jih ni na anotacijah
     *
     * @param type $entityName
     * @param \Tip\Annotation\Entity $meta
     */
    public function getClassDefaults(\Tip\Annotation\EntityMetadata $meta)
    {

        // če ni i18n na entiteti
        if (!$meta->getI18n()) {
            $f = new CamelCaseToSeparator(' ');
            $ent = str_replace('Tip\Entity\\', '', $meta->getEntityName());
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
