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
        $this->reportSklopPrograma($printer, $prgdela->getPremiere(), 'premiera', $title);
        // Ponovitve premier
        $this->reportSklopPrograma($printer, $prgdela->getPonovitvePremiere(), 'ponovitve-premier', $title);
        // Ponovitve prejšnjih
        $this->reportSklopPrograma($printer, $prgdela->getPonovitvePrejsnjih(), 'ponovitve-prejsnjih', $title);
        // Gostujoče
        $this->reportSklopPrograma($printer, $prgdela->getGostujoci(), 'gostujoce', $title);
        // Sklop 2
        // Mednarodna gostovanja
        $this->reportSklopPrograma($printer, $prgdela->getGostovanja(), 'mednarodna', $title);
        // Festivali 
        $this->reportSklopPrograma($printer, $prgdela->getProgramiFestival(), 'festivali', $title);
        // Razno
        $this->reportSklopPrograma($printer, $prgdela->getProgramiRazno(), 'razno', $title);
        // Izjemni dogodki
        $this->reportSklopPrograma($printer, $prgdela->getIzjemni(), 'izjemni', $title);
        // Kazalniki
        $this->addDocumentReport('kazalniki', $title, $this->entity);
        // Kazalniki - priloga
        $printer->AddPage();
        $this->addDocumentReport('kazalniki-priloga', $title, $this->entity);
        // Postavka C2
        $printer->AddPage();
        // $this->addDocumentReport('postavke-c2', 'Postavke C2', $prgdela->getPostavkeC2());

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
