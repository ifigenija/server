<?php

use Codeception\Util\Stub;
use Jobs\Entity\Job;
use TestAssets\Entity\Dokument;
use TestAssets\Entity\Pozicija;
use TestAssets\Task\DokumentTestReport;

/**
 * Test za  AbstractPrinterTaskTest
 *
 * @author boris
 */
class AbstractPrinterTaskTest
    extends \AbstractTest
{

    static $html = '';

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

        $this->mockmPdfPrinter();

        $this->tester->impersonate();

        $stev = 'xxxxxxXXXXXXxxxxxZZZZZZzzzzz';
        $doc  = new Dokument();
        $doc->setStevilka($stev);

        /** @var \Jobs\Repository\JobManager $jm */
        $jm  = $this->sm->get('jobmanager.service');
        $job = new Job();

        $jm->configureJob($job, [
                'task' => 'TestAssets\Task\DokumentTestReport',
                'data' =>
                    [
                        'makePdf'  => true,
                        'makeHtml' => false,
                    ]
            ]
        );

        $jm->runJob($job, true);

        $out = $job->getReports();
        $this->assertCount(1, $out);
        $this->assertContains('naziv report', AbstractPrinterTaskTest::$html);
        $this->assertContains('1233312 CCCCC', AbstractPrinterTaskTest::$html);
    }

    public function mockmPdfPrinter()
    {
        $stub = Stub::make('\Jobs\Printing\mPdfPrinter', [
            'printOut'     => function ($html) {
                AbstractPrinterTaskTest::$html .= $html;
                return '';
            },
            'finishReport' => function () {
                $out = tempnam(sys_get_temp_dir(), 'pdf_');
                file_put_contents($out, AbstractPrinterTaskTest::$html);
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

    public function testFinishReport()
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
        $this->assertEquals("", $error, 'ni napake');
    }


    /**
     * Testiram izpis tabele
     */
    public function testAddTableReport()
    {
        $this->mockmPdfPrinter();

        $this->tester->impersonate();

        /** @var \Jobs\Repository\JobManager $jm */
        $jm  = $this->sm->get('jobmanager.service');
        $job = new Job();

        $jm->configureJob($job, [
                'task' => 'TestAssets\Task\TableTestReport',
                'name' => 'testni izpis',
                'data' =>
                    [
                        'id'       => 'XXXX',
                        'makePdf'  => true,
                        'makeHtml' => false,
                    ]
            ]
        );

        $jm->runJob($job, true);

        $out = $job->getReports();
        $this->assertCount(1, $out);
        $html = $out[0]->readContent();
        $this->assertInstanceOf('Jobs\Entity\Report', $out[0]);
        $this->assertContains('">500,00</td', $html );
        codecept_debug($html);


    }

}
