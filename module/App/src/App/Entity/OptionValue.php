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
     * @ORM\ManyToOne(targetEntity="Aaa\Entity\User")
     * @ORM\JoinColumn(name="user_id", referencedColumnName="id")
     */
    private $user;
    
    
    //put your code here
}
