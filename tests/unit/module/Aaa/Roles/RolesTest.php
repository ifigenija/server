<?php
namespace module\Aaa\Roles;
use \UnitTester;

class RolesTest extends \AbstractTest
{
    
        /**
     * @var \UnitTester
     */
    protected $tester;
    
    public function _before()
    {
        
    }

    public function _after()
    {
    }

    // tests
    public function testGetRoles()
    {
        $this->tester->impersonate('console@ifigenija.si');
        
        $auth = $this->sm->get('ZfcRbac\Service\AuthorizationService');
        
        
        $i = $auth->getIdentity()->getRoles();
        $this->assertTrue($auth->isGranted('Drzava-list'));
        
    }
}