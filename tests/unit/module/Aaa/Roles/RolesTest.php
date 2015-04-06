<?php
namespace module\Aaa\Roles;
use \UnitTester;

class RolesTest extends \AbstractTest
{
    public function _before()
    {
        
    }

    public function _after()
    {
    }

    // tests
    public function testGetRoles()
    {
        $auth = $this->sm->get('ZfcRbac\Service\AuthorizationService');
        $i = $auth->getIdentity()->getRoles();
        $this->assertTrue($auth->isGranted('Drzava-list'));
        
    }
}