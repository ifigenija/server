<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
namespace Max\Ann\Entity;
/**
 * Filter rule za privzeto iskanje 
 * @Annotation
 * @Target({"CLASS"})
 * @author boris
 */
class Filter
{
    /**
     *
     * @var type 
     */
    public $field;
    /**
     *
     * @var type 
     */    
    public $operator;
}
