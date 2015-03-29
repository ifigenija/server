<?php

use Aaa\Entity\Role;
use Aaa\Entity\User;
use Codeception\TestCase\Test;
use Codeception\Util\Stub;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\EntityManager;
use Tip\Entity\Popa;
use Tip\Entity\PostniNaslov;
use Zend\Authentication\Storage\NonPersistent;
use Zend\ServiceManager\ServiceManager;

abstract class AbstractTest
    extends Test
{

    protected $actor = 'tester';

    /**
     * @var \UnitTester
     */
    protected $tester;

    /**
     * @var ServiceManager
     */
    private $sm;

    /**
     * @var EntityManager
     */
    private $em;

    public function __get($name)
    {
        $I = $this->tester;
        if ($name == 'sm') {
            return $I->grabServiceManager();
        }
        if ($name == 'em') {
            return $I->grabEntityManager();
        }

        throw new \Exception('getter-error-abstract-test');
    }

    protected function setIdentityConsole()
    {

        $authService = $this->tester
            ->grabServiceManager()
            ->get('Zend\Authentication\AuthenticationService');
        $user = $this->tester
            ->grabEntityManager()
            ->getRepository('Aaa\Entity\User')
            ->findOneByUsername('console');

        $authService->getStorage()->write($user);
    }

    public function mockWeasyPrinter()
    {
        $stub = Stub::make('\Tip\Printing\WeasyPrinter', [
                'printOut' => function($docs) {

                    if (is_string($docs)) {
                        $docs = [$docs];
                    }
                    $file = tempnam(sys_get_temp_dir(), 'html_');
                    // shranimo HTML vsebine
                    foreach ($docs as $html) {
                        file_put_contents($file, $html, FILE_APPEND);
                    };
                    return $file;
                }
            ]);
            $this->tester
                ->grabServiceManager()
                ->setAllowOverride(true);
            $this->tester
                ->grabServiceManager()
                ->setService('weasy.printer', $stub);
        }

        public function mockNastavitve()
        {
            $weasyStub = Stub::make('\Tip\Service\Nastavitve', [
                    'getFirma' => function() {
                        $popa = new Popa();
                        $naslov = new PostniNaslov();
                        $popa->setNaziv('tralala')
                            ->setSifra('12334')
                            ->setTel('333333')
                            ->setEmail('xxxx@12.xxx')
                            ->setNaslovi(new ArrayCollection([
                                $naslov->setPrivzeti(true)
                                ->setNaziv('xxx')
                                ->setUlica('ulica 2')
                                ->setKlient($popa)
                                ->setPosta('xxxx')
                            ]))

                        ;
                        return $popa;
                    },
                ]);
                $this->tester
                    ->grabServiceManager()
                    ->setAllowOverride(true);
                $this->tester
                    ->grabServiceManager()
                    ->setService('nastavitve.service', $weasyStub);
            }

        }
        