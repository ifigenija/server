<?php

namespace Jobs\Repository;

use Codeception\Util\Stub;
use Jobs\Entity\Job;
use Jobs\Exception\BadTaskDataException;

class JobManagerCest {


    /**
     * @var JobManager
     */
    protected $jm;

    /**
     * @var Job
     */
    protected $job;

    /**
     * Nastavim vse potrebno, da lahko produciram repositorije
     * Repositorijem, ki to potrebujejo nastavim service locator
     */
    protected function getJobManager(\UnitTester $I)
    {
        $this->jm = $I->grabServiceManager()->get('jobmanager.service');
        return $this->jm;
    }

    /**
     * @param \UnitTester $I
     */
    public function testCreateJob(\UnitTester $I)
    {
        $I->impersonate();

        $data = array(
            'podatek' => 'OK'
        );
        $metadata = array(
            'name' => 'Testni job',
            'task' => '\TestAssets\Task\DummyTestTask',
            'data' => $data
        );
    $jm = $this->getJobManager($I);
        $job = $this->job = $jm->createJob($metadata);
        $I->assertTrue( $job instanceof \Jobs\Entity\Job);
        $I->assertEquals('console@ifigenija.si', $job->getUser()->getEmail());
    }

    /**
     * Test print joba
     * @param \UnitTester $I
     */
    public function testCreateJobBadDataJob(\UnitTester $I)
    {
        $I->impersonate();
        $data = array(
            'podatek' => 'napakaPriPreverjanjuPodatkov'
        );
        $metadata = array(
            'name' => 'Testni job',
            'task' => '\TestAssets\Task\DummyTestTask',
            'data' => $data
        );

        try {
            $job = $this->jm->createJob($metadata);
            $I->assertTrue(false, "pričakoval napako, pa je ni");
        } catch (BadTaskDataException $e) {
            $I->assertTrue($e instanceof BadTaskDataException);
        }
    }

    /**
     * Test normalnega poganjanja job-a
     * @depends testCreateJob
     * @param \UnitTester $I
     */
    public function testRunJob(\UnitTester $I)
    {
        $I->impersonate();

        $data = array(
            'podatek' => 'OK'
        );
        $metadata = array(
            'name' => 'Testni job 123',
            'task' => '\TestAssets\Task\DummyTestTask',
            'data' => $data,
            'sync' => true
        );
        $jm = $this->getJobManager($I);
        $this->job = $job = $jm->createJob($metadata);
        $I->assertTrue($job instanceof \Jobs\Entity\Job);
    }

    /**
     * Test resetiranja joba
     * @depends testRunJob
     * @param \UnitTester $I
     */
    public function testResetJob(\UnitTester $I)
    {
        $job = $this->job;
        $this->jm->resetJob($job);

        $I->assertEquals(0, $job->getStatus());
        $I->assertEquals(0, count($job->getReports()));
        $I->assertEquals(0, strlen($job->getLog()));
        $I->assertEmpty($job->getAlert());
    }

    /**
     * Test branja metapodatkov iz anotacij taska
     *
     *
     */
    public function testGetTaskMeta(\UnitTester $I)
    {
        $jobId = $this->job->getId();

        $em = $I->grabEntityManager();
        $em->clear();
        $jm = $this->getJobManager($I);
        $job = $jm->find($jobId);
        $meta = $jm->getTaskMeta($job);
        $I->assertTrue($meta instanceof \Jobs\Annotation\Task\Meta);
        $I->assertEquals($meta->name, "dummy task");
        $I->assertEquals($meta->acl, "test.acl.xx");
        $em->remove($job);
        $em->flush();
        $job = $jm->find($jobId);
        $I->assertEmpty($job);
    }

}
