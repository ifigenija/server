<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Form;

/**
 * Description of StrosekForm
 *
 * @author boris
 */
class StrosekForm
        extends \Max\Form\JsonForm
{

    public function init()
    {
        parent::init();

        $this->setEntityClass('Produkcija\Entity\StrosekUprizoritve');

        $this->addWithMeta("naziv");
        $this->addWithMeta("vrednostDo");
        $this->addWithMeta("vrednostNa");
        $this->addWithMeta("tipstroska");
        $this->addWithMeta("opis");
        $this->addWithMeta("popa");
        $this->add([
            "name"    => "vrstaStroska",
            "type"    => "optionalselect",
            "options" => [
                "label" => "Vrsta stroška",
                'targetEntity' => 'Produkcija\Entity\VrstaStroska',
                'value_options' => $this->loadVrsteOptions(),
                'required' => false,
                "empty_option" => "Izberite vrsto stroška"
            ]
        ]);
        $this->addWithMeta("sort");
        $this->addWithMeta("uprizoritev");
    }

    /**
     * Naloži opcije za vrste stroška 
     */
    public function loadVrsteOptions()
    {
        /* @var $rep \Produkcija\Repository\VrsteStroska */
        $em = $this->getServiceLocator()->getServiceLocator()->get("doctrine.entity_manager.orm_default");

        $rep       = $em->getRepository('Produkcija\Entity\VrstaStroska');
        $vrste     = $rep->findBy([], ['skupina' => "ASC", "podskupina" => "ASC"]);
        $trensk    = null;
        $trengroup = "";
        $groups    = ["Brez vrednosti" => ['options' => ['' => 'Določite vrsto stroška'], 'label' => "Brez vrednosti"]];
        foreach ($vrste as $vrsta) {          
            
            if ($trensk === null || $trensk !== $vrsta->getSkupina()) {
                $trensk             = $vrsta->getSkupina();
                $trengroup          = $vrsta->getNaziv();
                $groups[$trengroup] = ['label' => $trengroup, 'options' => []];
                continue;
            }
            $groups[$trengroup]['options'][$vrsta->getId()] = $vrsta->getNaziv();
            /* @var $vrsta \Produkcija\Entity\VrstaStroska */
            $vrsta->getSkupina();
        }
        return $groups;
    }

}
