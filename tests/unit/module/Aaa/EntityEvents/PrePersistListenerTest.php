<?php

/**
 * testiram ali pridejo napolnjeni metapodatki z factory-a
 */
class PrePersistListenerTest
        extends \AbstractTest
{

    public function testGetNewId()
    {
         $factory = $this->sm->get('entity.metadata.factory');
        $config = $factory->getAllEntityConfig();
        
        $list = new \App\EntityEvents\PrePersistListener($config);
        
        $this->assertEquals('00010000', substr($list->getNewID('User'),0,8));
        $this->assertEquals('00030000', substr($list->getNewID('Permission'),0,8));
        $this->assertEquals('00000000', substr($list->getNewID('Revizija'),0,8));
    }

}
