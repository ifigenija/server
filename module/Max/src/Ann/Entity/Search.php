<?php

/**
 * (copyleft) Licenca
 */

namespace Max\Ann\Entity;

/**
 * Lookup definicije  za entity anotacije
 *
 * @Annotation
 * @Target("CLASS")
 * @author Boris Lašič <boris@max.si>
 * Ustvarjeno: 16.3.2013
 */
class Search
{

    /**
     * Identifikacijsko polje
     *
     * @var array<\Max\Ann\Entity\Filter>
     */
    public $filters = [];
    

}

