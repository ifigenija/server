<?php

/**
 * (copyleft) Licenca
 */
namespace Max\Ann\Entity;
/**
 * Služi za anotacijo entitet in njihovih polj. Nastavimo lahko labele, hinte, description plural
 * @Annotation
 * @Target({"CLASS","PROPERTY"})
 * @author Boris Lašič <boris@max.si>
 * Ustvarjeno: 18.3.2013
 */
class I18n {

    /**
     * @var string
     */
    public $label;

    /**
     * @var string
     */
    public $plural = '';

    /**
     * @var string
     */
    public $hint = '';

    /**
     * @var string
     */
    public $description = '';

}

