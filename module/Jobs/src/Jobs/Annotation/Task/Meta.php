<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Jobs\Annotation\Task;

/**
 * Ui služi na pomoč pri prebiranju form elementa. V Ui lahko specificiramo tip elementa
 * ki se uporablja za property
 *
 * @Annotation
 * @Target("CLASS")
 * @author Boris Lašič <boris@max.si>
 */
class Meta
{
    /**
     * 
     * @var string
     */
    public $name = '';
    

    /**
     * @var string 
     */
    public $acl = '';
}
