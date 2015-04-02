<?php

/**
 * (copyleft) Licenca
 */

namespace Max\Ann\Entity;

/**
 * Anotacija, ki se uporablja za definicijo dela ključa, 
 * ki identificira entiteto
 *
 * @Annotation
 * @Target("CLASS")
 * @author Boris Lašič <boris@max.si>
 */
class Id
{

    /**
     * 4 mestni hexa ključ entitete
     * 
     * @var string
     */
    protected $prefix;    
    

}

