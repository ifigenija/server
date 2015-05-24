<?php

namespace Stevilcenje\Service;

use DateTime;
use Doctrine\DBAL\Connection;
use Exception;
use Max\Consts;
use Max\Exception\MaxException;
use PDO;
use Stevilcenje\Entity\Stevilcenje;
use Stevilcenje\Exception\StevilcenjeNiDefinirano;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

/**
 * Izvaja generiranje številk dokumenta
 *
 * @author boris
 */
class StevilcenjeService
        implements ServiceLocatorAwareInterface
{

    protected $serviceLocator;

    /**
     *
     * @var Connectiong
     */
    protected $conn;

    public function getServiceLocator()
    {
        return $this->serviceLocator;
    }

    public function setServiceLocator(ServiceLocatorInterface $serviceLocator)
    {
        $this->serviceLocator = $serviceLocator;
        $this->conn           = $serviceLocator->get('doctrine.connection.ormdefault');
    }

    /**
     * Generira eno številko dokumenta glede na vhodne paprametre
     *
     * @param integer $count 
     * @param string $dok
     * @param integer|DateTime $leto
     * @return string
     * @throws MaxException
     */
    public function generateMultiple($count, $dok, $leto = null)
    {
        if (is_object($leto)) {
            $leto = (integer) $leto->format('Y');
        }

        $trys    = 0;
        $numbers = [];
        while ($trys < 2) {

            $this->conn->beginTransaction();
            try {
                list($stanje, $stevilcenje) = $this->getStanjeInStevilcenje($dok, $leto);
                $last = $this->getNextNumber($stanje, $count);
                $this->conn->commit();
                for ($num = $last - $count + 1; $num <= $last; $num++) {
                    array_push($numbers, $this->executeStrategy($num, $stevilcenje, $leto));
                }
                return $numbers;
            } catch (StevilcenjeNiDefinirano $e) {
                $this->conn->rollBack();
                throw $e;
            } catch (Exception $e) {
                $this->conn->rollBack();
                usleep(1000);
                $trys++;
            }
        }
        throw new MaxException('Timeout pri generiranju številke dokumenta', 1000641);
    }

    /**
     * Generira eno številko dokumenta glede na vhodne paprametre
     *
     * @param string $dok
     * @param integer|DateTime $leto
     * @return string
     * @throws MaxException
     */
    public function generate($dok, $leto = null)
    {
        if (is_object($leto)) {
            $leto = (integer) $leto->format('Y');
        }

        $trys = 0;
        while ($trys < 2) {
            list($stanje, $stevilcenje) = $this->getStanjeInStevilcenje($dok, $leto);
            $this->conn->beginTransaction();
            try {
                $num    = $this->getNextNumber($stanje, 1);
                $this->conn->commit();
                $number = $this->executeStrategy($num, $stevilcenje, $leto);
                return $number;
            } catch (StevilcenjeNiDefinirano $e) {
                $this->conn->rollBack();
                throw $e;
            } catch (Exception $e) {
                codecept_debug($e->getMessage());
                $this->conn->rollBack();
                usleep(1000);
                $trys++;
            }
        }
        throw new MaxException('Timeout pri generiranju številke dokumenta', 1000640);
    }

    /**
     * Iz vhodnih podatkov generira string trenutne številke
     *
     * @param integer $num trenutna številka
     * @paramg \Tip\Entity\StevilcenjeDokumenta $stevilcenje
     * @param integer $leto
     * @return string
     */
    public function executeStrategy($num, $stevilcenje, $leto = null)
    {

        $dolz = $stevilcenje->getDolzina();
        $fmt  = $stevilcenje->getFormat();

        $strnum = sprintf("%0{$dolz}d", $num);

        $fmt = str_replace('%l', (string) $leto, $fmt);
        $fmt = $stevilcenje->getPrefix() . $fmt;
        $fmt = $fmt . $stevilcenje->getSuffix();
        $fmt = str_replace('%n', $strnum, $fmt);

        return $fmt;
    }

    /**
     * Sestavi strategijo
     *
     * @param string $name
     * @param integer $leto
     * @return array
     * @throws StevilcenjeNiDefinirano
     */
    public function getStanjeInStevilcenje($name, $leto)
    {
        $em   = $this->serviceLocator->get('doctrine.entitymanager.orm_default');
        $sklr = $em->getRepository('Stevilcenje\Entity\StevilcenjeKonfig');
        $dok  = $sklr->findOneByDok($name);

        if (!$dok) {
            throw new StevilcenjeNiDefinirano('številčenje ni konfigurirano ' . $name, 1000638);
        }

        $stevilcenje = $dok->getStevilcenje();

        if (!$stevilcenje) {
            throw new StevilcenjeNiDefinirano('Na dokumentu ni določenega številčenja', 1000638);
        }

        if ($stevilcenje->getGlobalno()) {
            $objId = $stevilcenje->getId();
        } else {
            $objId = $dok->getId();
        }

        if (!$stevilcenje->getPoLetih()) {
            $leto = 0;
        } else {
            if (!$leto) {
                throw new StevilcenjeNiDefinirano('Številčenje je razmejeno po letih, leto pa ni podano', 1000637);
            }
        }

        $curr = $this->getCurrent($objId, $leto);
        if (!$curr) {
            $curr = $this->createTrenutno($objId, $leto, $stevilcenje->getZacetek());
        }

        return [$curr, $stevilcenje];
    }

    /**
     * Sestavi strategijo za globalno številčenje
     *
     * @param Stevilcenje $stv
     * @param integer $leto
     * @return StevilcenjeTrenutne
     * @throws StevilcenjeNiDefinirano
     */
    public function getGlobalStanjeId(Stevilcenje $stv, $leto)
    {

        if (!$stv->getGlobalno()) {
            throw new StevilcenjeNiDefinirano('Številčenje ni globalno', 1000636);
        }

        $objId = $stv->getId();

        if (!$stv->getPoLetih()) {
            $leto = 0;
        } else {
            if (!$leto) {
                throw new StevilcenjeNiDefinirano('Številčenje je razmejeno po letih, leto pani podano', 1000635);
            }
        }

        $curr = $this->getCurrent($objId, $leto);
        if (!$curr) {
            $curr = $this->createTrenutno($objId, $leto, $stv->getZacetek());
        }
        return $objId;
    }

    /**
     * Generiraj globalno številko vezano direktno na številčenje
     * 
     * 
     * @param string $sifra  - šifra številčenja 
     * @param DateTime|integer $leto
     */
    public function generateGlobal($sifra = 'tmp', $leto = null)
    {

        if (is_object($leto)) {
            $leto = (integer) $leto->format('Y');
        }

        $em  = $this->serviceLocator->get('doctrine.entitymanager.orm_default');
        $str = $em->getRepository('Stevilcenje\Entity\Stevilcenje');

        if (preg_match(Consts::UUID_RE, $sifra)) {
            $stev = $em->find($sifra);
        } else {
            $stev = $str->findOneBySifra($sifra);
        }

        if (!$stev) {
            throw new StevilcenjeNiDefinirano('Številčenje s tako oznako ne obstaja', 1000634);
        }

        $trys = 0;
        while ($trys < 2) {

            $trenutni = $this->getGlobalStanjeId($stev, $leto);
            $this->conn->beginTransaction();
            try {
                $num    = $this->getNextNumber($trenutni, 1);
                $this->conn->commit();
                $number = $this->executeStrategy($num, $stev, $leto);
                return $number;
            } catch (StevilcenjeNiDefinirano $e) {
                $this->conn->rollBack();
                throw $e;
            } catch (Exception $e) {
                echo ($e->getMessage());
                $this->conn->rollBack();
                usleep(1000);
                $trys++;
            }
        }
        throw new MaxException('Timeout pri generiranju številke dokumenta', 1000633);
    }

    /**
     * Poveča števec trenutnih številk za $count
     * @param object $tren
     * @param integer $count
     * @return integer
     */
    public function getNextNumber($tren, $count = 1)
    {
        $this->conn->executeUpdate("update stevilcenjestanje a set stevilka = stevilka + ? where objId = ?", [$count, $tren], [\PDO::PARAM_INT, \PDO::PARAM_STR]);
        $num = $this->conn->fetchColumn('select a.stevilka from stevilcenjestanje a where a.objId = ? ', [$tren], 0);

        return $num;
    }

    /**
     * Ustvari vnos v tabeli trenutnega številčenja in vrne objekt s trenutnimi vrednostmi
     *
     * @param string $objId
     * @param integer $leto
     * @param integer $start
     * @return object
     */
    public function createTrenutno($objId, $leto, $start)
    {
        $id = $this->uuidv4();

        $a = [
            'id'       => $id,
            'objId'    => $objId,
            'stevilka' => $start,
            'leto'     => $leto
        ];

        $this->conn->insert('StevilcenjeStanje', $a, [
            \PDO::PARAM_STR
            , \PDO::PARAM_STR
            , \PDO::PARAM_INT
            , \PDO::PARAM_INT
        ]);

        return $id;
    }

    public function uuidv4()
    {
        return sprintf('%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
                // 32 bits for "time_low"
                mt_rand(0, 0xffff), mt_rand(0, 0xffff),
                // 16 bits for "time_mid"
                mt_rand(0, 0xffff),
                // 16 bits for "time_hi_and_version",
                // four most significant bits holds version number 4
                mt_rand(0, 0x0fff) | 0x4000,
                // 16 bits, 8 bits for "clk_seq_hi_res",
                // 8 bits for "clk_seq_low",
                // two most significant bits holds zero and one for variant DCE1.1
                mt_rand(0, 0x3fff) | 0x8000,
                // 48 bits for "node"
                mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff)
        );
    }

    /**
     * Pridobi trenutno številčenje za id objekta.
     *
     * @param string $objId - guid objekta
     * @return object|null vrne objekt s trenutnim številčenjem ali pa null
     */
    public function getCurrent($objId, $leto)
    {

        $qb = $this->conn->createQueryBuilder();
        $e  = $qb->expr();
        $qb->select('t.id');
        $qb->from('stevilcenjestanje', 't');
        $qb->andWhere($e->eq('t.objId', ':id'));
        $qb->andWhere($e->eq('t.leto', ':leto'));
        $qb->setParameter('id', $objId);
        $qb->setParameter('leto', $leto);


        $sql = $qb->getSQL();
        try {
            $stmt = $qb->execute($sql);
            $res  = $stmt->fetchColumn(0);

            return $res;
        } catch (\Exception $e) {
            return false;
        }
    }

}
