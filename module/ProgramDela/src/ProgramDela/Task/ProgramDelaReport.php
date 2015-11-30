<?php

namespace ProgramDela\Task;

use App\Task\IfiPrinterTask;
use Max\Exception\MaxException;
use ProgramDela\Entity\ProgramDela;
use Jobs\Annotation\Task as Task;

/**
 * Task za izpis reporta dobavnice
 *
 *  @Task\Meta(name="Program dela", acl="ProgramDela-read")
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
        $prgdela = $this->entity;
        $title   = $prgdela->getNaziv() ? $prgdela->getNaziv() : 'Program dela';

        // Dobim printer 
        $ps = $this->getServiceLocator()->get('mpdf.printer');
        $printer = $ps->getMPdf();
        // Osnutek, če Program dela ni zaključen
        if ($prgdela->getZakljuceno() == false) {
            $printer->setWatermarkText('Osnutek', 0.1);
            $printer->showWatermarkText = true;
        } else {
            $printer->showWatermarkText = false;
        }

        // Filter izpisa
        $jePs1   = $this->data['jePs1'];
        $jePs2   = $this->data['jePs2'];
        $jeKaz   = $this->data['jeKaz'];
        $jeC2    = $this->data['jeC2'];
        $jeZapis = !$this->data['jeZapis'];

        $kajizp = [
            'jePs1'   => $jePs1,
            'jePs2'   => $jePs2,
            'jeKaz'   => $jeKaz,
            'jeC2'    => $jeC2,
            'jeZapis' => $jeZapis
        ];

        if ($jeKaz) {
            // Kazalniki glavni dokument izpišem pred dejanskim izpisom programa dela
            $html = $this->render('kazalniki', [
                'title' => $title,
                'model' => $prgdela,
                'ishf'  => false,
                '_css'  => 'style.css',
            ]);
            $this->printOut($html);
            $this->finishReport($title.'-kazalniki glavni dokument-');
            $this->cleanupTmp();
        }

        $this->html = [];
        
        // Zaradi dveh reportov (kazalniki in ostalo), moram še enkrat
        // po printer
        $printer = $ps->getMPdf();
        // Osnutek, če Program dela ni zaključen
        if ($prgdela->getZakljuceno() == false) {
            $printer->setWatermarkText('Osnutek', 0.1);
            $printer->showWatermarkText = true;
        } else {
            $printer->showWatermarkText = false;
        }

        // Splošno - osnovne nastavitve HTML in naslovnica 
        $html = $this->render('program-dela', array_merge([
            'title'       => $title,
            'ishf'        => true,
            '_css'        => 'style.css',
            'firma'       => $this->getFirma(),
            'orientation' => $config['orientation'],
            'margins'     => $config['margins'],
            'pageSize'    => $config['page_size'],
            'naslov'      => $title,
            'model'       => $prgdela,
            'ishf'        => true,
                        ], $kajizp));
        $this->printOut($html);

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

        // Kazalniki  - še preostanek kazalnikov (priloga 2), glavni dokument izpisan na vrhu
        if ($jeKaz) {
            // Kazalniki - priloga 
            $html = $this->render('kazalniki-priloga', [
                'title' => $title,
                'model' => $prgdela,
                'ishf'  => false,
                '_css'  => 'style.css',
            ]);
            $this->printOut($html);
        }

        // Postavke C2
        if ($jeC2) {
            $html = $this->render('postavke-c2', [
                'title' => $title,
                'model' => $prgdela,
                'ishf'  => false,
                '_css'  => 'style.css',
            ]);
            $this->printOut($html);
        }
        // zaključek html-ja
        $html = $this->render('outro', []);
        $this->printOut($html);

        $this->finishReport($title.'-priloge-');
        $this->cleanupTmp();
    }

    /**
     * Izpis posameznega sklopa programa dela
     * 
     * @param object $printer   tiskalnik (mPdf) 
     * @param object $sklopi    vsebinski sklopi programa dela (premiere. ponovitve, festivali...)
     * @param string $tmpl      ime predloge
     * @param string $naslov    naslov reporta
     * @param boolean $jeZapis   ali izpisujem priloge
     */
    public function reportSklopPrograma($printer, $sklopi, $tmpl, $naslov, $jeZapis)
    {
        $zs = $this->getServiceLocator()->get('zapisi.service');

        foreach ($sklopi as $sklop) {
            // $this->addDocumentReport($tmpl, $naslov, $sklop);
            $html = $this->render($tmpl, [
                'title' => $naslov,
                'model' => $sklop,
                'ishf'  => true,
                '_css'  => 'style.css',
            ]);
            $this->printOut($html);

            // dodam zapise 
            if ($jeZapis) {
                $myzapisi = $zs->getZapiseZaLastnika($sklop->id);

                // najprej tekstovni del prilog
                $count = 1;
                foreach ($myzapisi as $myzapis) {
                    $this->addAttachmentTxt($printer, 'zapisi', $naslov, $myzapis, $count);
                    $count++;
                }

                // potem priloženi dokumenti
                $count = 1;
                foreach ($myzapisi as $myzapis) {
                    $this->addAttachmentDoc($printer, $myzapis, $count);
                    $count++;
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
