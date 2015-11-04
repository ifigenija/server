<?php

namespace ProgramDela\Task;

use App\Task\IfiPrinterTask;
use Max\Exception\MaxException;
use ProgramDela\Entity\ProgramDela;
use Jobs\Annotation\Task as Task;

/**
 * Task za izpis reporta dobavnice
 *
 *  @Task\Meta(name="Program dela", acl="ProgramDela-write")
 */
class ProgramDelaReport
        extends IfiPrinterTask
{

    /**
     *
     * @var ProgramDela\Entity\ProgramDela $prgdela 
     * @var Jobs\Printing\mPdfPrinter $printer 
     */
    protected $entity;

    public function taskBody()
    {
        $ps = $this->getServiceLocator()->get('mpdf.printer');

        $prgdela = $this->entity;
        $title   = $prgdela->getNaziv() ? $prgdela->getNaziv() : 'Program dela' ;

        $printer = $ps->getMPdf();

        // Osnutek, če Program dela ni zaključen
        if ($prgdela->getZakljuceno() == false) {
            $printer->setWatermarkText('Osnutek', 0.1);
            $printer->showWatermarkText = true;
        } else {
            $printer->showWatermarkText = false;
        }

        $jePs1   = $this->data['jePs1'];
        $jePs2   = $this->data['jePs2'];
        $jeKaz   = $this->data['jeKaz'];
        $jeC2    = $this->data['jeC2'];
        $jeZapis = !$this->data['jeZapis'];
        
        $vars = [
            'jePs1' => $jePs1,
            'jePs2' => $jePs2,
            'jeKaz' => $jeKaz,
            'jeC2'  => $jeC2,
            'jeZapis' => $jeZapis
        ];
        
        // Splošno za program dela - nastavim header in footer + zavihek 'splošno' iz vnosne forme
        $this->addDocumentReport('program-dela', $title, $prgdela, $vars);

        // Programski sklop 1
        if ($jePs1) {
            // Premiere
            $this->reportSklopPrograma($printer, $prgdela->premiere, 'premiera', $title, $jeZapis);
            // Ponovitve premier
            $this->reportSklopPrograma($printer, $prgdela->ponovitvePremiere, 'ponovitve-premier', $title, $jeZapis);
            // Ponovitve prejšnjih
            $this->reportSklopPrograma($printer, $prgdela->ponovitvePrejsnjih, 'ponovitve-prejsnjih', $title, $jeZapis);
            // Gostujoče
            $this->reportSklopPrograma($printer, $prgdela->gostujoci, 'gostujoce', $title, $jeZapis);
        }

        // Programski sklop 2
        if ($jePs2) {
            // Mednarodna gostovanja
            $this->reportSklopPrograma($printer, $prgdela->gostovanja, 'mednarodna', $title, $jeZapis);
            // Festivali 
            $this->reportSklopPrograma($printer, $prgdela->programiFestival, 'festivali', $title, $jeZapis);
            // Razno
            $this->reportSklopPrograma($printer, $prgdela->programiRazno, 'razno', $title, $jeZapis);
            // Izjemni dogodki
            $this->reportSklopPrograma($printer, $prgdela->izjemni, 'izjemni', $title, $jeZapis);
        }

        // Kazalniki
        if ($jeKaz) {
            $this->addDocumentReport('kazalniki', $title, $prgdela);
            // Kazalniki - priloga 
            $this->addDocumentReport('kazalniki-priloga', $title, $prgdela);
        }

        // Postavke C2
        if ($jeC2) {
            $this->addDocumentReport('postavke-c2', $title, $prgdela);
        }
        $this->finishReport($title);
        $this->cleanupTmp();
    }

    /**
     * Izpis posameznega sklopa programa dela
     * 
     * @param object $printer   tiskalnik (mPdf) 
     * @param object $sklopi    vsebinski sklopi programa dela (premiere. ponovitve, festivali...)
     * @param string $tmpl      ime predloge
     * @param string $naslov    naslov reporta
     */
    public function reportSklopPrograma($printer, $sklopi, $tmpl, $naslov, $jeZapis)
    {
        $zs = $this->getServiceLocator()->get('zapisi.service');

        foreach ($sklopi as $sklop) {
            $this->addDocumentReport($tmpl, $naslov, $sklop);

            // dodam zapise 
            if ($jeZapis) {
                $myzapisi = $zs->getZapiseZaLastnika($sklop->id);
                foreach ($myzapisi as $myzapis) {
                    $this->addDocumentAttachment($printer, 'zapisi', $naslov, $myzapis);
                }
            }
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
