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
    public $filters = 'sifra';

    /**
     * Opisno polje za lookup
     *
     * @var string
     */
    public $label = 'naziv';

    /**
     * Seznam polj, po katerih se išče
     *
     * @var array<string>
     */
    public $search = ['sifra', 'naziv'];

    /**
     * Seznam polj, ki se vrnejo če gre za non filtered lookup
     * @var array<string>
     */
    public $extra = [];

    /**
     * Seznam polj, ki so vključeni v rezultat lookup-a ampak niso prikazani v tabeli
     * @var array<string>
     */
    public $hidden = [];
    
    /**
     * Seznam polj, ki morajo imeti parameter pri requestu
     * @var array<string>
     */
    public $required = [];
    
    

}

