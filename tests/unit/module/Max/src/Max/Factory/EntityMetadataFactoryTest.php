<?php

/**
 * (copyleft) Licenca
 */

/**

 *
 * @author Boris Lašič <boris@max.si>
 * 
 */
class EntityMetadataFactoryTest
        extends AbstractTest
{

    /**
     * Testiraj, da lahko dobim EntityMetadataFactory iz service managerja
     * @group factorytest
     */
    public function testPridobiMetadataFactoryIzServiceManagerja()
    {
        $factoy = $this->sm->get('entity.metadata.factory');
        $this->assertInstanceOf('Max\Factory\EntityMetadataFactory', $factoy);
        return $factoy;
    }

    /**
     * Testira ali pravilno delajo metode Za privzete vrednosti
     * @depends testPridobiMetadataFactoryIzServiceManagerja
     */
    public function testGetClassDefaults($factory)
    {

        $meta = new \Max\Ann\EntityMetadata('Aaa\Entity\User');
        $factory->getClassDefaults($meta);

        $label = $meta->i18n->label;
        $this->assertEquals('User', $label);
        $this->assertEquals('0000', $meta->id->prefix);
    }

    /**
     * Testira ali pravilno delajo metode Za privzete vrednosti
     * @depends testPridobiMetadataFactoryIzServiceManagerja
     */
    public function testGetPropertyDefaults($factory)
    {

        $label = $factory->getPropertyDefaults('datKnj');

        $this->assertEquals('Dat Knj', $label);

        $label = $factory->getPropertyDefaults('tipJePravi');
        $this->assertEquals('Tip Je Pravi', $label);
    }

    /**
     * Testiraj, ali smo dobili pave metapodatke za entity skladišče
     * @depends testPridobiMetadataFactoryIzServiceManagerja
     */
    public function testPridobiMetadataZa($factory)
    {
        $meta = $factory->factory('Aaa\Entity\User');

        $this->assertInstanceOf('Max\Ann\EntityMetadata', $meta);

        $this->assertEquals('Aaa\Entity\User', $meta->getEntityName());

        $this->assertEquals('Uporabnik', $meta->getI18n()->label);
    }

    /**
     * Testiraj, ali smo dobili pave metapodatke za entity skladišče
     * @depends testPridobiMetadataFactoryIzServiceManagerja
     */
    public function testPridobiMetadataZaUporabnika($factory)
    {
        $meta = $factory->factory('Aaa\Entity\User');

        $this->assertInstanceOf('Max\Ann\EntityMetadata', $meta);

        $this->assertEquals('Aaa\Entity\User', $meta->getEntityName());

        $this->assertEquals('Uporabnik', $meta->getI18n()->label);
    }

    public function testGetEntityConfig()
    {
        $factory = $this->sm->get('entity.metadata.factory');
        $config = $factory->getAllEntityConfig();
        
        $this->assertNotEmpty($config);
        $this->assertEquals('0001', $config['User']);
        $this->assertEquals('0003', $config['Permission']);
        $this->assertEquals('0000', $config['Revizija']);
        
    }

}

