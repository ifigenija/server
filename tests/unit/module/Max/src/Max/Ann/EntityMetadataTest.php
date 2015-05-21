<?php

/**
 * testiram ali pridejo napolnjeni metapodatki z factory-a
 */
class EntityMetadataTest
        extends \AbstractTest
{

    /**
     * @var EntityMetadata
     */
    protected $object;

    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     */
    protected function _before()
    {
        $f = $this->sm->get('entity.metadata.factory');

        $this->object = $f->factory('Aaa\Entity\User');
    }

    /**
     * @covers Tip\Annotation\EntityMetadata::getMapping

     */
    public function testGetMapping()
    {

        $m = $this->object->getMapping();
        $this->assertInstanceOf('Doctrine\Common\Persistence\Mapping\ClassMetadata', $m);
    }

    /**
     * @covers Tip\Annotation\EntityMetadata::getEntityName
     *
     */
    public function testGetEntityName()
    {
        $m = $this->object->getEntityName();
        $this->assertEquals('Aaa\Entity\User', $m);
    }

    /**
     * @covers Tip\Annotation\EntityMetadata::getClassI18n
     *
     */
    public function testGetId()
    {
        $i = $this->object->getId();
        $this->assertInstanceOf('Max\Ann\Entity\Id', $i);
    }

    /**
     * @covers Tip\Annotation\EntityMetadata::getClassI18n
     *
     */
    public function testGetTracking()
    {
        $i = $this->object->getTracking();
        $this->assertInstanceOf('Max\Ann\Entity\Tracking', $i);
    }

    /**
     * @covers Tip\Annotation\EntityMetadata::getClassI18n
     *
     */
    public function testGetI18n()
    {
        $i = $this->object->getI18n();
        $this->assertInstanceOf('Max\Ann\Entity\I18n', $i);
        $this->assertEquals('Uporabniki', $i->plural);
    }

    /**
     * @covers Tip\Annotation\EntityMetadata::getFieldI18n

     */
    public function testGetFieldI18n()
    {
        $i = $this->object->getFieldI18n('email');

        $this->assertInstanceOf('Max\Ann\Entity\I18n', $i);
        $this->assertEquals('Email', $i->label);
    }

    /**
     * @covers Tip\Annotation\EntityMetadata::getFieldUi

     */
    public function testGetFieldUi()
    {
        $i = $this->object->getFieldUi('email');

        $this->assertInstanceOf('Max\Ann\Entity\Ui', $i);
        $this->assertEquals('email', $i->type);
    }

    /**
     * @covers Tip\Annotation\EntityMetadata::getLookup
     *
     */
    public function testGetAcl()
    {
        $i = $this->object->getAcl();

        $this->assertInstanceOf('Max\Ann\Entity\Acl', $i);
    }

}
