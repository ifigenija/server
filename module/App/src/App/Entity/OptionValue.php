<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
/**
 * Description of ParamValue
 * @ORM\Entity
 * @author boris
 */
class OptionValue         extends \Max\Entity\Base

{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     */
    private $id;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $value;

    /**
     * @ORM\Column(type="boolean", nullable=true, options={"default":false})
     */
    private $global;

    /**


    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Option")
     * @ORM\JoinColumn(name="option_id", referencedColumnName="id")
     */
    private $option;

    /**
     * 
     * 
     */
    private $user;
    
    
    //put your code here
    
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
