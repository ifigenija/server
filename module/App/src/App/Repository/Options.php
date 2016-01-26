<?php

/**
 * Licenca GPLv3 or later
 */

namespace App\Repository;

use Doctrine\ORM\Query;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;

/**
 * 
 *
 * @author rado
 */
class Options
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        'default' => [
            'description' => ['alias' => 'description']
        ]
    ];

    public function getPaginator(array $options, $name = 'default')
    {
        $seznam =  $this->findBy(['readOnly' => false]);
        
        return new \DoctrineModule\Paginator\Adapter\Collection(new \Doctrine\Common\Collections\ArrayCollection($seznam));
    }

}
