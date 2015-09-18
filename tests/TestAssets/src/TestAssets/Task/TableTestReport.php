<?php

/*
 * Licenca GPL V3 or later
 *  
 */

namespace TestAssets\Task;


use Max\Exception\MaxException;
use Jobs\Annotation\Task as Task;
use Jobs\Task\AbstractPrinterTask;
use TestAssets\Entity\Dokument;
use TestAssets\Entity\Pozicija;


/**
 * Description of DocumentPrinterTask
 * @Task\Meta(name="Test Izpis Table", acl="neki.permission")
 * @author boris
 */
class TableTestReport extends AbstractPrinterTask {

    /**
     * 
     * @var Dokument
     */
    protected $entity;
    
    
    public function taskBody() {
        $entities = [];

        $stor = new Dokument();
        $stor->setNaziv('Prevoz')
            ->setSifra('001');

        $obj = new Pozicija();
        $obj->setDatum(new \DateTime)
            ->setOpis('tralala')
            ->setZnesek(100)
            ->setDokument($stor)
            ->setZaporedna(1);
        $entities[] = $obj;

        $obj = new Pozicija();
        $obj->setDatum(new \DateTime)
            ->setZnesek(100)
            ->setOpis('99899')
            ->setDokument($stor)->setZaporedna(3);
        $entities[] = $obj;

        $obj = new Pozicija();
        $obj->setDatum(new \DateTime)
            ->setZnesek(200)
            ->setOpis('998999')
            ->setDokument($stor)->setZaporedna(2);
        $entities[] = $obj;

        $obj = new Pozicija();
        $obj->setDatum(new \DateTime)
            ->setZnesek(100)
            ->setDokument($stor)
            ->setZaporedna(2);
        $entities[] = $obj;


        $tableDef = [
            'title'  => 'naslov 123',
            'groups' => [
                'main' => [
                    'pozicija'       => [
                        'title' => 'Poz.',
                        'type'  => 'pozicija',
                        'align' => 'right',
                        'width' => '3%'
                    ],
                    'opis'           => ['width' => "10%"],
                    'dokument.naziv' => ['twidth' => '10%'],
                    'znesek'         => ['width' => '5%', 'final' => 'sum'],
                ]
            ]
        ];

        $err = $this->addTableReport('test123', $tableDef, $entities);
        if ($err) throw new \Exception($err);
        $err = $this->finishReport('xxxx');
        if ($err) throw new \Exception($err);
    }

    public function checkData() { 
        parent::checkData();
    }
}
