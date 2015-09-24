<?php

namespace ProgramDela\Task;

use Jobs\Task\AbstractPrinterTask;
use Max\Exception\MaxException;
use ProgramDela\Entity\ProgramDela;
use Jobs\Annotation\Task as Task;

/**
 * Task za izpis reporta dobavnice
 *
 *  @Task\Meta(name="Program dela", acl="ProgramDela-write")
 */
class ProgramDelaReport
        extends AbstractPrinterTask
{

    /**
     *
     * @var ProgramDela
     */
    protected $entity;

    public function taskBody()
    {
        $ps = $this->getServiceLocator()->get('mpdf.printer');
        $zs = $this->getServiceLocator()->get('zapisi.service');
                
        $title   = "Program dela " . $this->entity->getSifra();
        $prgdela = $this->entity;

        $printer = $ps->getMPdf();

        // Splošno za program dela - nastavim header in footer + zavihek 'splošno' iz vnosne forme
        $this->addDocumentReport('program-dela', $title, $this->entity);
        
        // Premiere
        foreach ($prgdela->premiere as $premiera) {
            $this->addDocumentReport('premiera', $title, $premiera);
            // dodam zapise 
            $myzapisi = $zs->getZapiseZaLastnika($premiera->id);
            foreach ($myzapisi as $myzapis) {
                $this->addDocumentAttachment('zapisi', $title, $myzapis->zapis);
            }
            $printer->AddPage();
        }
      
        // Ponovitve premier
        foreach ($prgdela->ponovitvePremiere as $ponovitevPremiere) {
            $this->addDocumentReport('ponovitve-premier', $title, $ponovitevPremiere);
            // dodam zapise 
            $myzapisi = $zs->getZapiseZaLastnika($ponovitevPremiere->id);
            foreach ($myzapisi as $myzapis) {
                $this->addDocumentAttachment('zapisi', $title, $myzapis);
            }
            $printer->AddPage();
        }
      
        // Ponovitve prejšnjih uprizoritev
        foreach ($prgdela->ponovitvePremiere as $ponovitevPrejsnje) {
            $this->addDocumentReport('ponovitve-prejsnjih', $title, $ponovitevPrejsnje);
            // dodam zapise 
            $myzapisi = $zs->getZapiseZaLastnika($ponovitevPrejsnje->id);
            foreach ($myzapisi as $myzapis) {
                $this->addDocumentAttachment('zapisi', $title, $myzapis);
            }
            $printer->AddPage();
        }

        // Gostujoče uprizoritve
        foreach ($prgdela->gostujoci as $gostujoce) {
            $this->addDocumentReport('gostujoce', $title, $gostujoce);
            // dodam zapise 
            $myzapisi = $zs->getZapiseZaLastnika($gostujoce->id);
            foreach ($myzapisi as $myzapis) {
                $this->addDocumentAttachment('zapisi', $title, $myzapis);
            }
            $printer->AddPage();
        }
        
        // Mednarodna gostovanja 
        foreach ($prgdela->gostovanja as $gostovanje) {
            $this->addDocumentReport('mednarodna', $title, $gostovanje);
            // dodam zapise 
            $myzapisi = $zs->getZapiseZaLastnika($gostovanje->id);
            foreach ($myzapisi as $myzapis) {
                $this->addDocumentAttachment('zapisi', $title, $myzapis);
            }
            $printer->AddPage();
        }
        $this->finishReport($title);
    }

    public function checkData()
    {
        parent::checkData();
        $rep          = $this->em->getRepository('\ProgramDela\Entity\ProgramDela');
        $this->entity = $rep->find($this->data['id']);

        if (!$this->entity) {
            throw new MaxException('Program dela ne obstaja', 1000688);
        }
    }
}
