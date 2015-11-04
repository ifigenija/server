<?php

/*
 * Licenca GPL V3 or later
 *  
 */
namespace Crpalka\Service;

use Doctrine\Common\Collections\ArrayCollection;
use Zend\Log\Logger;
use Zend\Log\Writer;
use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;
/**
 * Description of CrpalkaServiceFactory
 *
 * @author boris
 */
class CrpalkaServiceFactory implements FactoryInterface
{
    /**
     * Metoda inicializira crpalka service(cs) predno se začne cs uporabljat
     * 
     * @param ServiceLocatorInterface $serviceLocator
     * @return \Crpalka\Service\CrpalkaService
     */
    public function createService(ServiceLocatorInterface $serviceLocator)
    {
        //pridobitev configuracije
        $options = $serviceLocator->get('Config');
        
        //parsanje potrebnih podatkov
        $poti = $options['crpalka']['pravila']['pot'];
        $owningSide = $options['crpalka']['pravila']['owningside'];
        $NeOwningSide = $options['crpalka']['pravila']['neowningside'];
        $ident = $options['crpalka']['pravila']['ident'];
        
        $service  = new CrpalkaService();
        
        //inicializacija propertijev
        $service->setEmIzvor($serviceLocator->get("doctrine.entitymanager.orm_default"));
        $service->setEmCilj($serviceLocator->get("doctrine.entitymanager.orm_dest"));
        $service->setEntityMetadataFactory($serviceLocator->get("entity.metadata.factory"));
        

        $service->setPoljeEntitet(new ArrayCollection());
        $service->setPoljePravil(new ArrayCollection($poti));
        $service->setPoljeOwningSide(new ArrayCollection($owningSide));
        $service->setPoljeNeOwningSide(new ArrayCollection($NeOwningSide));
        $service->setPoljeIdent(new ArrayCollection($ident));
        
        //deklaracija in inicializacija loggerja
        $logger = new Logger();
        $log = __DIR__ . '/../../../../../data/crpalka.log';
        $writer = new Writer\Stream($log);
        $logger->addWriter($writer);
        $logger->registerErrorHandler($logger);
        
        $service->setLogger($logger);
        return $service;
    }

}
