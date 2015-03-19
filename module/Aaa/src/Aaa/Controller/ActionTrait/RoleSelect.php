<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
namespace Aaa\Controller\ActionTrait;

use Aaa\Entity\User;
use Zend\View\Model\ViewModel;
/**
 * Description of RoleList
 *
 * @author boris
 */
trait RoleSelect
{

    public function roleList($object, $action= 'pregled')
    {
        $parent = $this->getEntityId('parent', TRUE);
        $vloge = $this->getRepository('Aaa\Entity\Role')->getRoleLevel($parent);

        $vm = new ViewModel([
            'vloge' => $vloge,
            'object' => $object,
            'action' => $action
        ]);
        $vm->setTemplate('aaa/role/role-list');
        return $vm;
    }

    /**
     * Seznam dodeljenih vlog in dodajanje / odstranjevanje vlog
     * @param type $object
     * @return ViewModel
     */
    public function assignedRoles($object, $action = 'pregled')
    {
        $sr = $this->getRepository();

        if ($object instanceof User) {
            $vloge = $object->getHierRoles();
            $meth = 'Roles';
        } else {
            $vloge = $object->getChildren();
            $meth = 'Children';
        }

        if ($this->request->isPost()) {
            $data = $this->request->getPost();
            if (array_key_exists('removeSelectedBtn', $data)) {
                $meth = 'remove' . $meth;
                $sr->$meth($object, $data['izbor']);
            }

            if (array_key_exists('addSelectedBtn', $data)) {
                $meth = 'add' . $meth;
                $sr->$meth($object, $data['izbor']);
            }
            $this->flashShrani($object);
        }
        $vm = new ViewModel([
            'vloge' => $vloge,
            'object' => $object,
            'action' => $action
        ]);
        $vm->setTemplate('aaa/role/assigned-roles');
        return $vm;
    }

}
