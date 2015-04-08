<?php

/*
 * Licenca GPL V3 or later
 *  
 */
namespace Max\Form\Element;
/**
 * Description of EntitySelect
 *
 * @author boris
 */
class LookupSelect extends \Max\Form\Element\EntityToOne
{
        /**
     * Seed attributes
     *
     * @var array
     */
    protected $attributes = [
        'type' => 'lookupSelect'
    ];
}
