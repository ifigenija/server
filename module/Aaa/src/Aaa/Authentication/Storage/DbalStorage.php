<?php
/**
 * Created by PhpStorm.
 * User: boris
 * Date: 27. 10. 15
 * Time: 18:17
 */

namespace Aaa\Authentication\Storage;


use Zend\Authentication\Storage\StorageInterface;

class DbalStorage implements StorageInterface
{

    private $cache;

    /**
     * Returns true if and only if storage is empty
     *
     * @throws \Zend\Authentication\Exception\ExceptionInterface If it is impossible to determine whether storage is empty
     * @return bool
     */
    public function isEmpty()
    {
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
            return new \Aaa\Entity\User();
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
        $this->cache = $contents;
        error_log($contents->getId());
        error_log(session_id());
    }

    /**
     * Clears contents from storage
     *
     * @throws \Zend\Authentication\Exception\ExceptionInterface If clearing contents from storage is impossible
     * @return void
     */
    public function clear()
    {
        // TODO: Implement clear() method.
    }


}