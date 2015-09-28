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

        $prgdela = $this->entity;
        $title   = "Program dela " . $prgdela->getSifra();

        $printer = $ps->getMPdf();

        // Splošno za program dela - nastavim header in footer + zavihek 'splošno' iz vnosne forme
        $this->addDocumentReport('program-dela', $title, $this->entity);

        // Sklop 1
        // Premiere
        $this->reportSklopPrograma($printer, $prgdela->getPremiere(), 'premiera', 'Premiere');
        // Ponovitve premier
        $this->reportSklopPrograma($printer, $prgdela->getPonovitvePremiere(), 'ponovitve-premier', 'Ponovitve premier');
        // Ponovitve prejšnjih
        $this->reportSklopPrograma($printer, $prgdela->getPonovitvePrejsnjih(), 'ponovitve-prejsnjih', 'Ponovitve uprizoritev');
        // Gostujoče
        $this->reportSklopPrograma($printer, $prgdela->getGostujoci(), 'gostujoce', 'Gostujoče uprizoritve');
        // Sklop 2
        // Mednarodna gostovanja
        $this->reportSklopPrograma($printer, $prgdela->getGostovanja(), 'mednarodna', 'Mednarodna gostovanja');
        // Festivali 
        $this->reportSklopPrograma($printer, $prgdela->getProgramiFestival(), 'festivali', 'Festivali');
        // Razno
        $this->reportSklopPrograma($printer, $prgdela->getProgramiRazno(), 'razno', 'Razno');
        // Izjemni dogodki
        $this->reportSklopPrograma($printer, $prgdela->getIzjemni(), 'izjemni', 'Izjemni dogodki');
        // Kazalniki
        $this->addDocumentReport('kazalniki', $title, $this->entity);
        // Kazalniki - priloga
        $printer->AddPage();
        $this->addDocumentReport('kazalniki-priloga', $title, $this->entity);
        
        $this->finishReport($title);
    }

    /**
     * Izpis posameznega sklopa programa dela
     * 
     * @param object $printer   tiskalnik (mPdf) 
     * @param object $sklopi    vsebinski sklopi programa dela (premiere. ponovitve, festivali...)
     * @param string $tmpl      ime predloge
     * @param string $naslov    naslov reporta
     */
    public function reportSklopPrograma($printer, $sklopi, $tmpl, $naslov)
    {
        $zs = $this->getServiceLocator()->get('zapisi.service');

        foreach ($sklopi as $sklop) {
            $this->addDocumentReport($tmpl, $naslov, $sklop);
            // dodam zapise 
            $myzapisi = $zs->getZapiseZaLastnika($sklop->id);
            foreach ($myzapisi as $myzapis) {
                $this->addDocumentAttachment($printer, 'zapisi', $naslov, $myzapis);
            }
            $printer->AddPage();
        }
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
