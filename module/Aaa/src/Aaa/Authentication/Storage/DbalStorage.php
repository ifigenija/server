<?php
/**
 * Created by PhpStorm.
 * User: boris
 * Date: 27. 10. 15
 * Time: 18:17
 */

namespace Aaa\Authentication\Storage;


use Aaa\Entity\User;
use Doctrine\DBAL\Connection;
use Zend\Authentication\Storage\StorageInterface;

class DbalStorage implements StorageInterface
{

    private $cache;

    /**
     * @var DBALConnection
     */
    private $conn;

    /**
     * @param Connection $connection
     */
    public function __construct(Connection $connection)
    {
        $this->conn = $connection;
    }

    /**
     * Returns true if and only if storage is empty
     *
     * @throws \Zend\Authentication\Exception\ExceptionInterface If it is impossible to determine whether storage is empty
     * @return bool
     */
    public function isEmpty()
    {
        $dat  = (new \DateTime())->modify('-1 day')->format('Y-m-d H:i:s');
        $stmt = $this->conn->query("select count(*) from authstorage where sessionId ='" . session_id() . "' and deleted = 'FALSE' and datum > '" . $dat . "' ");
        $col  = $stmt->fetchColumn();

        if (count($col) && $col[0]) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * Returns the contents of storage
     *
     * Behavior is undefined when storage is empty.
     *
     * @throws \Zend\Authentication\Exception\ExceptionInterface If reading contents from storage is impossible
     * @return mixed
     */
    public function read()
    {
        if ($this->cache) {
            return $this->cache;
        } else {
            return new User();
        }
    }

    /**
     * Writes $contents to storage
     *
     * @param  mixed $contents
     * @throws \Zend\Authentication\Exception\ExceptionInterface If writing $contents to storage is impossible
     * @return void
     */
    public function write($contents)
    {

        if ($this->cache !== $contents) {
            $this->cache = $contents;
            $dat         = (new \DateTime())->format('Y-m-d H:i:s');
            $sessionId   = session_id();
            $userId      = $contents->getId();
            $ip          = isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : '';
            if ($sessionId && $ip) {
                $this->conn->executeQuery("insert into authstorage (sessionId, upor, datum, \"ip\") values ('$sessionId', '$userId', '$dat', '$ip')");
            }
        }


    }

    /**
     * Clears contents from storage
     *
     * @throws \Zend\Authentication\Exception\ExceptionInterface If clearing contents from storage is impossible
     * @return void
     */
    public function clear()
    {
        $this->conn->executeUpdate("update  authstorage set deleted = true where sessionId ='" . session_id() . "' ");
    }


}