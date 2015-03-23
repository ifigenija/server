<?php

/**
 * (copyleft) Licenca
 */

namespace Tip\Annotation\Entity;

/**
 * Ui služi na pomoč pri prebiranju form elementa. V Ui lahko specificiramo tip elementa
 * ki se uporablja za property
 *
 * @Annotation
 * @Target("PROPERTY")
 * @author Boris Lašič <boris@max.si>
 * Ustvarjeno: 18.3.2013
 */
class Ui {

    /**
     * Tip form elementa, ki se uporablja za to polje. String se poišče preko
     * form element managerja. Lahko ja class ali pa ime registriranega form elementa
     * privzeto
     * @var string
     */
    public $type = '';

    /**
     * Ikona za na začetek polja
     * @var string
     */
    public $icon = '';

    /**
     * Css class
     * @var string
     */
    public $class = '';

    /**
     * Ciljna entiteta za lookupe na guid poljih
     *
     * @var string
     */
    public $targetEntity = '';
    
    /**
     * Filtriranje lookupa na entiteti
     * 
     * @var array 
     */
    public $filters;

    /**
     * master property, če gre za odvisnost.
     * @var string
     */
    public $master;

    /**
     * Skupina v katero spada form element
     *
     * @var string
     *
     */
    public $group = 'default';

    /**
     * Ali se polje na entiteti smatra za ident.
     * Ident se uporablja kot identifikator v seznamih
     *  @var boolean
     */
    public $ident = false;

    /**
     * Ali se polje na entiteti smatra za ident.
     * Ident se uporablja kot identifikator v seznamih
     *  @var boolean
     */
    public $required;

    /**
     * Ime kolekcije izbirnih opcij za property
     * @var string
     */
    public $opts;

    /**
     * Prazna opcija pri select poljih
     * @var string
     */
    public $empty;
    
    /**
     * Ali grupiramo select po flags fieldu
     * @var boolean
     */
    public $grouped = false;

}

