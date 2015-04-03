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
     * Ime polja za klienta
     * @var string 
     */
    public $field;

    /**
     * eq | like | ...
     * @var string 
     */
    public $operator = 'eq';

    /**
     * Tip filtra
     * @var string
     */
    public $type = 'text';

    /**
     *
     * @var type 
     */
    public $targetEntity = '';

    /**
     * A je vrednost filtra zahtevana 
     * @var boolean
     */
    public $required;

    /**
     * s pikami ločena pot do polja, ki ga filtriramo
     * @var $string
     */
    public $path;

}
