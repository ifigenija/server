<?php

namespace Jobs\Repository;

use Codeception\Util\Stub;

class JobManagerTest
    extends \AbstractTest
{

    /**
     *
     * @var UnitTester
     */
    protected $tester;
    /**
     * @var JobManager
     */
    protected $jm;

    /**
     * Nastavim vse potrebno, da lahko produciram repositorije
     * Repositorijem, ki to potrebujejo nastavim service locator
     */
    protected function _before()
    {
        $this->jm =$this->sm->get('jobmanager.service');
    }

    /**
     *
     */
    public function testCreateJob()
    {
        $this->tester->impersonate();

        $data = array(
            'podatek' => 'OK'
        );
        $metadata = array(
            'name' => 'Testni job',
            'task' => '\TestAssets\Task\DummyTestTask',
            'data' => $data
        );

        $job = $this->jm->createJob($metadata);
        $this->assertInstanceOf('\Jobs\Entity\Job', $job);
        $this->assertEquals('console@ifigenija.si', $job->getUser()->getEmail());
        $this->em->remove($job);
        $this->em->flush();
    }

    /**
     * Test print joba
     * @expectedException \Jobs\Exception\BadTaskDataException
     */
    public function testCreateJobBadDataJob()
    {
        $this->tester->impersonate();
        $data = array(
            'podatek' => 'napakaPriPreverjanjuPodatkov'
        );
        $metadata = array(
            'name' => 'Testni job',
            'task' => '\TestAssets\Task\DummyTestTask',
            'data' => $data
        );

        $job = $this->jm->createJob($metadata);
        $this->assertInstanceOf('\Jobs\Entity\Job', $job);
        $this->em->remove($job);
        $this->em->clear();
    }

    /**
     * Test normalnega poganjanja job-a
     * @return type
     */
    public function testRunJob()
    {
        $this->tester->impersonate();

        $data = array(
            'podatek' => 'OK'
        );
        $metadata = array(
            'name' => 'Testni job 123',
            'task' => '\TestAssets\Task\DummyTestTask',
            'data' => $data,
            'sync' => true
        );

        $job = $this->jm->createJob($metadata);
        $this->assertInstanceOf('\Jobs\Entity\Job', $job);
        $this->em->clear();
        return $job;
    }

    /**
     * Test resetiranja joba
     * @depends testRunJob
     */
    public function testResetJob($job)
    {
        $this->jm->resetJob($job);

        $this->assertEquals(0, $job->getStatus());
        $this->assertCount(0, $job->getReports());
        $this->assertEquals(0, strlen($job->getLog()));
        $this->assertNull($job->getAlert());
        return $job;
    }

    /**
     * Test branja metapodatkov iz anotacij taska
     *
     * @depends testResetJob
     */
    public function testGetTaskMeta($job)
    {
        $jobId = $job->getId();

        $this->em->clear();

        $job = $this->jm->find($jobId);
        $meta = $this->jm->getTaskMeta($job);
        $this->assertInstanceOf('\Jobs\Annotation\Task\Meta', $meta);
        $this->assertEquals($meta->name, "dummy task");
        $this->assertEquals($meta->acl, "test.acl.xx");
        $this->em->remove($job);
        $this->em->flush();

        $job = $this->jm->find($jobId);
        $this->assertNull($job);
    }

}
