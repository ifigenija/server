<?php

/**
 * (copyleft) Licenca
 */
namespace Max\Annotation\Entity;

/**
 * Vloge potrebne za posamezne opreacije nad entitetami
 *
 * @Annotation
 * @Target("CLASS")
 * @author Boris Lašič <boris@max.si>
 * Ustvarjeno: 18.3.2013
 */
class Acl {

    /**
     * dovoljenje, ki je dovolj za omejen pregled - pomoč pri vnosih
     * @var string
     */
    public $look = 'guest';

    /**
     * dovoljenje, ki je potrebno za pregled
     * @var string
     */
    public $read= 'pregled';

    /**
     * dovoljenje, potrebno za
     * @var string
     */
    public $create = 'master';

    /**
     * @var string
     */
    public $update = 'master';

    /**
     * @var string
     */
    public $delete = 'master';

}
