<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * 
 *       value      : vrednost opcije
 *       global     : ali ta vrednost ("value") velja globalno in ne za userja
 * 
 * @todo: property username to be implemented
 * 
 * @ORM\Entity(repositoryClass="App\Repository\OptionValues")
 * @author boris
 */
class OptionValue
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $value;

    /**
     * @ORM\Column(type="boolean", nullable=true, options={"default":false})
     */
    private $global = false;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Option")
     * @ORM\JoinColumn(name="option_id", referencedColumnName="id")
     */
    private $option;

    /**
     * 
     * 
     * @ORM\ManyToOne(targetEntity="Aaa\Entity\User")
     * @ORM\JoinColumn(name="user_id", referencedColumnName="id")
     */
    private $user;

    //put your code here


    public function addOption($option)
    {
        $this->option=$option;
        return $this;
    }

    public function addUser($user)
    {
        $this->user=$user;
        return $this;
    }


    function getId()
    {
        return $this->id;
    }

    function getValue()
    {
        return unserialize($this->value);
    }

    function getGlobal()
    {
        return $this->global;
    }

    function getOption()
    {
        return $this->option;
    }

    function getUser()
    {
        return $this->user;
    }

    function setId($id)
    {
        $this->id = $id;
    }

    function setValue($value)
    {
        $this->value = serialize($value);
    }

    function setGlobal($global)
    {
        $this->global = $global;
    }

    function setOption($option)
    {
        $this->option = $option;
    }

    function setUser($user)
    {
        $this->user = $user;
    }

}
