<?php

/*
 * Licenca GPL V3 or later
 *  
 */

namespace Crpalka\Controller;

use App\Filter\DecorateEntity;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Tools\SchemaTool;
use Zend\Mvc\Controller\AbstractActionController;

class CrpalkaController
    extends AbstractActionController
{

    public function precrpajAction()
    {

        //deklaracija crpalka servisa(cs) in pridobitev parametrov
        $cs = $this->serviceLocator->get("crpalka.service.factory");
        $globina = $this->params('globina');
        $id = $this->params('id');
        $entiteta = $this->params('entity');

        $f = new DecorateEntity();
        $f->$this->setServiceLocator($this->getServiceLocator());
        $entityClass = $f->filter($entiteta);
        
        // če id ni guid, potem poiščem entiteto po identu  
        if (!preg_match('/^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$/', $id)) {
            $id = $this->getByIdent($entityClass, $id);
        }

        $cs->precrpajBazo($entityClass, $id, $globina);
    }

    public function precrpajVseAction()
    {
        //deklaracija crpalka servisa(cs) in pridobitev parametrov
        $cs = $this->serviceLocator->get('crpalka.service.factory');
        $entiteta = $this->params('entity');

        $f = new \App\Filter\DecorateEntity();
        $f->setServiceLocator($this->serviceLocator);
        $cs->precrpajVseBazo($f->filter($entiteta));
    }

    public function schemaUpdateAction()
    {
        /* @var $em EntityManager */
        $em = $this->serviceLocator->get("doctrine.entitymanager.orm_dest");

        $metadata = $em->getMetadataFactory()->getAllMetadata();

        $shemaTool = new SchemaTool($em);

        $shemaTool->updateSchema($metadata, true);
    }

    /**
     * Poiščem entiteto po identu in vrnem id objekta
     * @param string $entiteta
     * @param string $ident
     * @return string
     * @throws \Exception
     */
    private function getByIdent($entiteta, $ident)
    {
        /* @var $mf \Max\Factory\EntityMetadataFactory */
        $mf = $this->serviceLocator->get('entity.metadata.factory');
        $meta = $mf->factory($entiteta);

        $identField = $meta->getIdent();

        if (!$identField) {
            throw new \Exception('Entiteta nima ident polja', 400);
        }

        /* @var $em EntityManager */
        $em = $this->serviceLocator->get("doctrine.entitymanager.orm_default");

        $rep = $em->getRepository($entiteta);

        $obj = $rep->findOneBy([$identField => $ident]);
        if ($obj) {
            return $obj->getId();
        }

        throw new \Exception("Ne najdem entitete $entiteta s $identField = $ident");
    }

}
