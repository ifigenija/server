<?php

use Codeception\Util\Stub;
use TestAssets\Entity\Document;
use TestAssets\Fixtures\PrintingTdokFixture;
use TestAssets\Report\DocumentTestReport;

use Workflow\Entity\Job;

/**
 * Test za  AbstractPrinterTaskTest
 *
 * @author boris
 */
class AbstractPrinterTaskTest
    extends \AbstractTest
{

    protected function _after()
    {
        $tf = new PrintingTdokFixture();
        $tf->tearDown($this->em);
    }

    protected function _before()
    {
        $this->mockNastavitve();
    }

    public function testGetRenderer()
    {

        $job = new Job();
        $job->setData([
                'id' => ''
            ])
            ->setName('Testni izpis')
            ->setTask('TestAssets\Report\DocumentTestReport');

        $task = new DocumentTestReport($job, $this->em);
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
            ->setTask('TestAssets\Report\DocumentTestReport');

        $task = new DocumentTestReport($job, $this->em);
        $task->setServiceLocator($this->sm);

        $tr = $this->sm->get('translator');
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

        $task = new DocumentTestReport($job, $this->em);
        $task->setServiceLocator($this->sm);

        $task->render('template-krneki', ['xx' => '123456XXX22222']);

        $html = $task->getHtml();
        $this->assertCount(1, $html);

        $this->assertContains('123456XXX22222', $html[0]);
    }

    public function testAddDocumentReport()
    {

        $tf = new PrintingTdokFixture();
        $tf->tearDown($this->em);

        $ref = $tf->load($this->em);

        $newT = function($t) {
            $job = new Job();
            $job->setData([
                    'id' => ''
                ])
                ->setName('Testni izpis')
                ->setTask('TestAssets\Report\DocumentTestReport');

            $task = new DocumentTestReport($job, $t->em);
            $task->setServiceLocator($t->sm);
            $task->setMakePdf(false);
            $task->setSendToPrinter(false);
            return $task;
        };

        $this->mockmPdfPrinter();

        $stev = 'xxxxxxXXXXXXxxxxxZZZZZZzzzzz';
        $doc = new \TestAssets\Entity\Document();
        $doc->setStevilka($stev);


        // template za vrsto dokumenta 
        $task = $newT($this);
        $x = uniqid();
        $doc->setDok($ref['tdok-08']);
        $task->addDocumentReport('test-' . $x, $doc);
        $html = $task->getHtml();
        $this->assertContains('T08', $html[0]);
        $this->assertContains($stev, $html[0]);


        // template za šifro  dokumenta
        $task = $newT($this);
        $x = uniqid();
        $doc->setDok($ref['tdok-09']);
        $task->addDocumentReport('test-' . $x, $doc);
        $html = $task->getHtml();
        $this->assertContains('T_TST', $html[0]);
        $this->assertContains($stev, $html[0]);

        // template v bazi - nastavljen na tdok 
        $task = $newT($this);
        $x = uniqid();
        $doc->setDok($ref['tdok-07']);
        $task->addDocumentReport('test-' . $x, $doc);
        $html = $task->getHtml();
        $this->assertContains('DB_TEMPLATE', $html[0]);
        $this->assertContains($stev, $html[0]);
    }

    public function testCheckData()
    {
        $job = new Job();
        $job->setData([
                'id' => 'XXXX',
                'toPrinter' => 'e9e018ad-d913-4a96-8509-ea41fa82e30a'
            ])
            ->setName('Testni izpis')
            ->setTask('TestAssets\Report\DocumentTestReport');

        $task = new DocumentTestReport($job, $this->em);
        $task->setServiceLocator($this->sm);

        $task->checkData();

        $this->assertTrue($task->getSendToPrinter());
        $this->assertNotEmpty($task->getPrinterId());
        $this->assertFalse($task->getMakePdf());
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
                'id' => 'XXXX',
                'toPrinter' => 'e9e018ad-d913-4a96-8509-ea41fa82e30a'
            ])
            ->setName('Testni izpis')
            ->setTask('TestAssets\Report\DocumentTestReport');

        $task = new DocumentTestReport($job, $this->em);
        $task->setServiceLocator($this->sm);

        // task bo imel več dokumentov
        $task->setMultiple(true);


        $task->addHtml('<html><body>prvidokument</body></html>');
        $task->addHtml('<html><body>drugidokument</body></html>');

        $this->mockCupsZaMultiple();
        $this->mockmPdfPrinter();
        $task->checkData();
        $error = $task->finishReport('Testni Izpis');
    }


    /**
     * Testiram izpis tabele 
     */
    public function testAddTableReport()
    {

        $entities = [];

        $stor = new Logistika\Entity\OdvisniStroski();
        $stor->setNaziv('Prevoz')
            ->setSifra('001');

        $obj = new \Logistika\Entity\PostavkaStroska();
        $obj->setDatumKd(new \DateTime)
            ->setKlientDok('9989')
            ->setZnesek(100)
            ->setStoritev($stor);
        $entities[] = $obj;

        $obj = new \Logistika\Entity\PostavkaStroska();
        $obj->setDatumKd(new \DateTime)
            ->setZnesek(100)
            ->setKlientDok('99899')
            ->setStoritev($stor);
        $entities[] = $obj;

        $obj = new \Logistika\Entity\PostavkaStroska();
        $obj->setDatumKd(new \DateTime)
            ->setZnesek(200)
            ->setKlientDok('998999')
            ->setStoritev($stor);
        $entities[] = $obj;

        $obj = new \Logistika\Entity\PostavkaStroska();
        $obj->setDatumKd(new \DateTime)
            ->setZnesek(100)
            ->setStoritev($stor);
        $entities[] = $obj;

        $tableDef = [
            'title' => 'naslov 123',
            'groups' => [
                'main' => [
                    'pozicija' => [
                        'title' => 'Poz.',
                        'type' => 'pozicija',
                        'align' => 'right',
                        'width' => '3%'
                    ],
                    'storitev.naziv' => ['twidth' => '10%'],
                    'znesek' => ['width' => '5%', 'final' => 'sum'],
                ]
            ]
        ];

        $this->mockmPdfPrinter();

        $this->tester->impersonate();
        $user = $this->em->getRepository('Aaa\Entity\User')->findOneByUsername('admin');
        $job = new Job();
        $job->setData([
                'id' => 'XXXX',
                'toPrinter' => 'e9e018ad-d913-4a96-8509-ea41fa82e30a',
                'makePdf' => true
            ])
            ->setUser($user)
            ->setName('Testni izpis')
            ->setTask('TestAssets\Report\DocumentTestReport');

        $task = new DocumentTestReport($job, $this->em);
        $task->setServiceLocator($this->sm);
       
       $task->addTableReport('test123', $tableDef, $entities);
     
       $html = $task->getHtml()[0];
       
       $this->assertContains('tralala', $html);
       $this->assertContains('<table', $html);
       $this->assertContains('>500,00</td', $html);
       
       $err = $task->finishReport('xxxx');
       codecept_debug($err);
       $this->assertEmpty($err);
       
       $out = $job->getReports();
       $this->assertCount(2, $out);
       $this->assertInstanceOf('Zapisi\Entity\Datoteka', $out[0]);

    }

}
