<?php

use Codeception\Util\Stub;
use TestAssets\Entity\Dokument;
use TestAssets\Entity\Pozicija;
use TestAssets\Task\DokumentTestReport;

use Jobs\Entity\Job;

/**
 * Test za  AbstractPrinterTaskTest
 *
 * @author boris
 */
class AbstractPrinterTaskTest
    extends \AbstractTest
{
    static $html = '';

    public function mockmPdfPrinter()
    {
        $stub = Stub::make('\Jobs\Printing\mPdfPrinter', [
            'printOut' => function ($html) {
                AbstractPrinterTaskTest::$html .= $html;
                return '';
            },
            'finishReport' => function () {
                $out = tempnam(sys_get_temp_dir(), 'pdf_');
                file_put_contents($out,AbstractPrinterTaskTest::$html);
                AbstractPrinterTaskTest::$html;
                return $out;
            }

        ]);
        $this->tester
            ->grabServiceManager()
            ->setAllowOverride(true);
        $this->tester
            ->grabServiceManager()
            ->setService('mpdf.printer', $stub);
    }


    public function testGetRenderer()
    {

        $job = new Job();
        $job->setData([
            'id' => ''
        ])
            ->setName('Testni izpis')
            ->setTask('TestAssets\Task\DocumentTestReport');

        $task = new DokumentTestReport($job, $this->em);
        $task->setServiceLocator($this->sm);

        $renderer = $task->getRenderer();

        $this->assertInstanceOf('Zend\View\Renderer\PhpRenderer', $renderer);
        $this->assertFalse($renderer->resolver('xxx.neobstoječi.template'));
        $this->assertStringEndsWith('.phtml', $renderer->resolver('printlayout/document'));
        $this->assertStringEndsWith('.css', $renderer->resolver('printlayout/style'));
        $this->assertStringEndsWith('.phtml', $renderer->resolver('printlayout/table'));
    }

    public function testSetTranslatorLocale()
    {
        $job = new Job();
        $job->setData([
            'id' => ''
        ])
            ->setName('Testni izpis')
            ->setTask('TestAssets\Task\DocumentTestReport');

        $task = new DokumentTestReport($job, $this->em);
        $task->setServiceLocator($this->sm);

        $tr   = $this->sm->get('translator');
        $orig = $tr->translate('Šifra');

        $oldLang = $task->setTranslatorLocale('en_US');

        $this->assertEquals('ID', $tr->translate('Šifra'));
        $task->setTranslatorLocale($oldLang);

        $this->assertEquals($orig, $tr->translate('Šifra'));


        $locale = $task->setTranslatorLocale(null);
        $this->assertEquals($locale, $oldLang);


        $locale = $task->setTranslatorLocale('');
        $this->assertEquals($locale, $oldLang);
    }

    public function testRenderTemplate()
    {
        $job = new Job();
        $job->setData([
            'id' => ''
        ])
            ->setName('Testni izpis')
            ->setTask('TestAssets\Report\DocumentTestReport');

        $task = new DokumentTestReport($job, $this->em);
        $task->setServiceLocator($this->sm);

        $html = $task->render('test-report1', ['xx' => '123456XXX22222']);

        $this->assertContains('123456XXX22222', $html);
    }

    public function testAddDocumentReport()
    {


        $newT = function ($t) {
            $job = new Job();
            $job->setData([
                'id' => ''
            ])
                ->setName('Testni izpis')
                ->setTask('TestAssets\Report\DokumentTestReport');

            $task = new DokumentTestReport($job, $t->em);
            $task->setServiceLocator($t->sm);
            $task->setMakePdf(false);
            return $task;
        };

        $this->mockmPdfPrinter();

        $stev = 'xxxxxxXXXXXXxxxxxZZZZZZzzzzz';
        $doc  = new Dokument();
        $doc->setStevilka($stev);


        /** @var DokumentTestReport $task */
        $task = $newT($this);
        $err = $task->addDocumentReport('test-report', "naslov report", $doc);

        $this->assertEmpty($err, 'napaka');
        $this->assertContains('naslov report', AbstractPrinterTaskTest::$html);
        $this->assertContains($stev, AbstractPrinterTaskTest::$html);
    }


    /**
     *
     * Test zaključka reporta, ko se html-ji združijo in pošljejo
     *  na tiskalnik ali pripnejo na job
     */
    public function testFinishReportSendToPrinter()
    {


// naredim task
        $job = new Job();
        $job->setData([
            'id'        => 'XXXX',
            'toPrinter' => 'e9e018ad-d913-4a96-8509-ea41fa82e30a'
        ])
            ->setName('Testni izpis')
            ->setTask('TestAssets\Report\DocumentTestReport');

        $task = new DokumentTestReport($job, $this->em);
        $task->setServiceLocator($this->sm);


        $this->mockmPdfPrinter();

        $task->printOut('<html><body>prvidokument</body></html>');
        $task->printOut('<html><body>drugidokument</body></html>');

        $task->checkData();
        $error = $task->finishReport('Testni Izpis');
        $this->assertEquals("",$error,'ni napake');
    }


    /**
     * Testiram izpis tabele
     */
    public function testAddTableReport()
    {

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
                    'opis' => ['width' => "10%"],
                    'dokument.naziv' => ['twidth' => '10%'],
                    'znesek'         => ['width' => '5%', 'final' => 'sum'],
                ]
            ]
        ];

        $this->mockmPdfPrinter();

        $this->tester->impersonate();
        $user = $this->em->getRepository('Aaa\Entity\User')->findOneByEmail('admin@ifigenija.si');
        $job  = new Job();
        $job->setData([
            'id'      => 'XXXX',
            'makePdf' => true,
            'makeHtml' => true,
        ])
            ->setUser($user)
            ->setName('Testni izpis')
            ->setTask('TestAssets\Report\DocumentTestReport');

        $task = new DokumentTestReport($job, $this->em);
        $task->setMakeHtml(true);
        $task->setServiceLocator($this->sm);

        $html = $task->addTableReport('test123', $tableDef, $entities);
        codecept_debug($html);

        $this->assertContains('tralala', AbstractPrinterTaskTest::$html);
        $this->assertContains('<table', AbstractPrinterTaskTest::$html);
        $this->assertContains('>500,00</td', AbstractPrinterTaskTest::$html);

        $err = $task->finishReport('xxxx');

        $out = $job->getReports();
        $this->assertCount(2, $out);
        $this->assertInstanceOf('Jobs\Entity\Report', $out[0]);

    }

}
