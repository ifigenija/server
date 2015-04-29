<?php

/**
 * (copyleft) Licenca
 */

namespace Max\Ann\Entity;

/**
 * Revizija služi za nastavitve logiranje revizij specifičnih fieldov
 *
 * @Annotation
 * @Target({"PROPERTY", "CLASS"})
 * Ustvarjeno: 13.9.2013
 */
class Tracking {

    /**
     * Ali RevisionListener zapisuje spremembe tega fielda
     * @var boolean
     */
    public $log = true;
}

