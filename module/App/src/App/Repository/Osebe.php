<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Repository;

/**
 * Description of Drzave
 *
 * @author boris
 */
class Osebe extends \Max\Repository\AbstractMaxRepository
{
    
    public function getPaginator(array $options, $name = "default")
    {
        return parent::getPaginator($options, $name);
    }

}
