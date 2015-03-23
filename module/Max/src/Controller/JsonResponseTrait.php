<?php

/*
 * Licenca GPL V3 or later
 *  
 */

namespace Tip\Controller\ActionTrait;

/**
 * Description of JsonResponseTrait
 *
 * @author boris
 */
trait JsonResponseTrait
{

    /**
     * Vrne filtriran nivo klasifikacije iz query parametra
     * @return \Tip\Entity\Klasifikacija
     */
    public function getNivo()
    {
        return $this->filterNivo($this->params()->fromQuery('nivo', 'l2'));
    }

    private function filterNivo($nivo)
    {
        if ($nivo && !preg_match('/l0|l1|l2|l3|raw/', $nivo)) {
            $nivo = 'l2';
        } else {
            return $nivo;
        }
    }

    private function getGrouping(array $groups, $required = false)
    {

        $form = $this->getForm('\Tip\Form\Filter\DetailFilter');
        $valOpts = [];
        foreach ($groups as $group) {
            $valOpts[$group] = $group;
        }
        $form->get('group')->setValueOptions($valOpts);
        $data = $this->params()->fromQuery();
        if ($data) {
            $form->setData($data);
            if ($form->isValid()) {
                return $form->getData();
            } else {
                $this->flashFormMessages($form);
            }
        }
        if ($required) {
            throw new \Tip\Exception\TipException('Grouping podatki so obvezni', 'TIP-FRM-0244');
        }
        return [];
    }

    /**
     * 
     * Preveri master query parameter z detail formo. 
     * Iščemo parametre id, group, nivo. Vsi so required
     * 
     * @param array $groups
     * @param boolean $required ali je master forma obvezna
     * @return array
     * @throws \Tip\Exception\TipException
     */
    private function getMaster(array $groups, $required = false)
    {

        $form = $this->getForm('\Tip\Form\Filter\DetailFilter');
        $valOpts = [];
        foreach ($groups as $group) {
            $valOpts[$group] = $group;
        }
        $form->get('group')->setValueOptions($valOpts);
        $data = $this->params()->fromQuery('master');
        if ($data) {
            $form->setData($data);
            if ($form->isValid()) {
                return $form->getData();
            }
        }
        if ($required) {
            throw new \Tip\Exception\TipException('Master podatki so obvezni', 'TIP-FRM-0254');
        }
        return [];
    }

    public function onePageResponse($data, $meta)
    {

        $response = ['data' => $data,
            'state' => [
                'currentPage' => 1,
                'totalRecords' => count($data)
            ],
        ];
        if (!empty($meta)) {
            $response ['meta'] = $meta;
        }
        return new \Zend\View\Model\JsonModel($response);
    }

}
