<?php

/**
 * (copyleft) Licenca
 */
namespace Max\Ann\Entity;

/**
 * Vloge potrebne za posamezne opreacije nad entitetami
 *
 * @Annotation
 * @Target("CLASS")
 * @author Boris Lašič <boris@max.si>

 */
class Acl {

    /**
     * osnova za izračun dovoljenja na entiteti. k temu se doda akcija
     * @var string
     */
    public $base = '';

    
    /**
     * dovoljenje, ki je potrebno za seznam / get list 
     * @var string
     */
    public $list= 'list';
    
    /**
     * dovoljenje, ki je potrebno za pregled / get 
     * @var string
     */
    public $read= 'read';

    /**
     * dovoljenje, potrebno za ustvarjanje entitete / post 
     * @var string
     */
    public $create = 'create';

    /**
     * podaljšek akcije pri posodabljanju / put 
     * @var string
     */
    public $update = 'update';

    /**
     * podaljšek akcije pri brisanju / delete
     * @var string
     */
    public $delete = 'delete';

}
