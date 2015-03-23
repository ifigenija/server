<?php

namespace Tip\Entity;

use Doctrine\Common\Util\ClassUtils;
use Tip\Exception\TipException;

/**
 * Base class za entitete.
 *
 * @author boris
 */
class Base
{

    /**
     * Magic getter
     * @param mixed $name
     * @return mixed
     */
    public function __get($name)
    {
        return $this->$name;
    }

    /**
     * Magic setter
     * @param mixed $name
     * @param mixed $value
     */
    public function __set($name, $value)
    {
        $this->$name = $value;
    }

    /**
     *
     * @param type $data
     * @return Base
     */
    public function exchangeArray($data = [])
    {
        if (!empty($data)) {
            foreach ($data as $key => $value) {
                $this->__set($key, $value);
            }
        }
        return $this;
    }

    /**
     * obect -> array
     * @return array
     */
    public function getArrayCopy()
    {
        return get_object_vars($this);
    }

    /**
     * Ustvari kopijo entitete brez id
     * @return object
     */
    public function copy()
    {
        $class= ClassUtils::getRealClass(ClassUtils::getClass($this));
        $entity = new $class;
        $entity->exchangeArray($this->getArrayCopy());
        $entity->id = null;
        return $entity;
    }

    public function __toString()
    {
        return $this->id;
    }

    /**
     * 
     * Če je truth false sproži exception s sporočilom in kodo
     * 
     * @param boolean $truth
     * @param string $message
     * @param string $code
     * @throws TipException
     */
    protected function expect($truth, $message = '', $code = 'TIP-CNS-0000')
    {
        if (!$truth) {
            throw new TipException("Pogoj: {$message}", $code);
        }
    }

    
    /**
     * Entiteta implementira to funkcijo, da preveri veljavnost entitete ob 
     * kreiranju ali pa posodabljanju. Kliče se iz repozitorija.
     * Če model ne ustreza sproži exception 
     * 
     * @param string $mode  create ali update
      * @return boolean
     */
    public function validate($mode = 'update')
    {
        return true;
    }
    
    /**
     * Entiteta naj implementira to metodo za preverjanje možnosti brisanja
     * in eventuelno odstranjevanje odvisnosti.
     * Če želitš preprečiti brisanje vrži exception. Uporabljaj $->expect()
     * 
     * @return boolean Description
     */
    public function lahkoBrisem() {
        return true;
    }

}
