<?php

/**
 * (copyleft) Licenca
 */

namespace Max\Annotation\Entity;

/**
 * Revizja služi za nastavitve logiranje revizij specifičnih fieldov
 *
 * @Annotation
 * @Target("PROPERTY")
 * Ustvarjeno: 13.9.2013
 */
class Revizija {

    /**
     * Ali RevisionListener zapisuje spremembe tega fielda
     * @var boolean
     */
    public $log = true;
}

