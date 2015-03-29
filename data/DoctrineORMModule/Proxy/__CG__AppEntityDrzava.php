<?php

namespace DoctrineORMModule\Proxy\__CG__\App\Entity;

/**
 * DO NOT EDIT THIS FILE - IT WAS CREATED BY DOCTRINE'S PROXY GENERATOR
 */
class Drzava extends \App\Entity\Drzava implements \Doctrine\ORM\Proxy\Proxy
{
    /**
     * @var \Closure the callback responsible for loading properties in the proxy object. This callback is called with
     *      three parameters, being respectively the proxy object to be initialized, the method that triggered the
     *      initialization process and an array of ordered parameters that were passed to that method.
     *
     * @see \Doctrine\Common\Persistence\Proxy::__setInitializer
     */
    public $__initializer__;

    /**
     * @var \Closure the callback responsible of loading properties that need to be copied in the cloned object
     *
     * @see \Doctrine\Common\Persistence\Proxy::__setCloner
     */
    public $__cloner__;

    /**
     * @var boolean flag indicating if this object was already initialized
     *
     * @see \Doctrine\Common\Persistence\Proxy::__isInitialized
     */
    public $__isInitialized__ = false;

    /**
     * @var array properties to be lazy loaded, with keys being the property
     *            names and values being their default values
     *
     * @see \Doctrine\Common\Persistence\Proxy::__getLazyProperties
     */
    public static $lazyPropertiesDefaults = array();



    /**
     * @param \Closure $initializer
     * @param \Closure $cloner
     */
    public function __construct($initializer = null, $cloner = null)
    {

        $this->__initializer__ = $initializer;
        $this->__cloner__      = $cloner;
    }

    /**
     * {@inheritDoc}
     * @param string $name
     */
    public function __get($name)
    {
        $this->__initializer__ && $this->__initializer__->__invoke($this, '__get', array($name));

        return parent::__get($name);
    }

    /**
     * {@inheritDoc}
     * @param string $name
     * @param mixed  $value
     */
    public function __set($name, $value)
    {
        $this->__initializer__ && $this->__initializer__->__invoke($this, '__set', array($name, $value));

        return parent::__set($name, $value);
    }



    /**
     * 
     * @return array
     */
    public function __sleep()
    {
        if ($this->__isInitialized__) {
            return array('__isInitialized__', 'id', 'sifra', 'sifraDolg', 'isoNum', 'isoNaziv', 'naziv', 'opomba', 'upor', 'datKnj');
        }

        return array('__isInitialized__', 'id', 'sifra', 'sifraDolg', 'isoNum', 'isoNaziv', 'naziv', 'opomba', 'upor', 'datKnj');
    }

    /**
     * 
     */
    public function __wakeup()
    {
        if ( ! $this->__isInitialized__) {
            $this->__initializer__ = function (Drzava $proxy) {
                $proxy->__setInitializer(null);
                $proxy->__setCloner(null);

                $existingProperties = get_object_vars($proxy);

                foreach ($proxy->__getLazyProperties() as $property => $defaultValue) {
                    if ( ! array_key_exists($property, $existingProperties)) {
                        $proxy->$property = $defaultValue;
                    }
                }
            };

        }
    }

    /**
     * 
     */
    public function __clone()
    {
        $this->__cloner__ && $this->__cloner__->__invoke($this, '__clone', array());
    }

    /**
     * Forces initialization of the proxy
     */
    public function __load()
    {
        $this->__initializer__ && $this->__initializer__->__invoke($this, '__load', array());
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     */
    public function __isInitialized()
    {
        return $this->__isInitialized__;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     */
    public function __setInitialized($initialized)
    {
        $this->__isInitialized__ = $initialized;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     */
    public function __setInitializer(\Closure $initializer = null)
    {
        $this->__initializer__ = $initializer;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     */
    public function __getInitializer()
    {
        return $this->__initializer__;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     */
    public function __setCloner(\Closure $cloner = null)
    {
        $this->__cloner__ = $cloner;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific cloning logic
     */
    public function __getCloner()
    {
        return $this->__cloner__;
    }

    /**
     * {@inheritDoc}
     * @internal generated method: use only when explicitly handling proxy specific loading logic
     * @static
     */
    public function __getLazyProperties()
    {
        return self::$lazyPropertiesDefaults;
    }

    
    /**
     * {@inheritDoc}
     */
    public function getSifra()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getSifra', array());

        return parent::getSifra();
    }

    /**
     * {@inheritDoc}
     */
    public function setSifra($sifra)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setSifra', array($sifra));

        return parent::setSifra($sifra);
    }

    /**
     * {@inheritDoc}
     */
    public function getNaziv()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getNaziv', array());

        return parent::getNaziv();
    }

    /**
     * {@inheritDoc}
     */
    public function setNaziv($naziv)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setNaziv', array($naziv));

        return parent::setNaziv($naziv);
    }

    /**
     * {@inheritDoc}
     */
    public function getId()
    {
        if ($this->__isInitialized__ === false) {
            return  parent::getId();
        }


        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getId', array());

        return parent::getId();
    }

    /**
     * {@inheritDoc}
     */
    public function setId($id)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setId', array($id));

        return parent::setId($id);
    }

    /**
     * {@inheritDoc}
     */
    public function getUpor()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getUpor', array());

        return parent::getUpor();
    }

    /**
     * {@inheritDoc}
     */
    public function setUpor($upor)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setUpor', array($upor));

        return parent::setUpor($upor);
    }

    /**
     * {@inheritDoc}
     */
    public function getDatKnj()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getDatKnj', array());

        return parent::getDatKnj();
    }

    /**
     * {@inheritDoc}
     */
    public function setDatKnj($datKnj)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setDatKnj', array($datKnj));

        return parent::setDatKnj($datKnj);
    }

    /**
     * {@inheritDoc}
     */
    public function getSifraDolg()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getSifraDolg', array());

        return parent::getSifraDolg();
    }

    /**
     * {@inheritDoc}
     */
    public function setSifraDolg($sifraDolg)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setSifraDolg', array($sifraDolg));

        return parent::setSifraDolg($sifraDolg);
    }

    /**
     * {@inheritDoc}
     */
    public function getIsoNum()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getIsoNum', array());

        return parent::getIsoNum();
    }

    /**
     * {@inheritDoc}
     */
    public function setIsoNum($isoNum)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setIsoNum', array($isoNum));

        return parent::setIsoNum($isoNum);
    }

    /**
     * {@inheritDoc}
     */
    public function getIsoNaziv()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getIsoNaziv', array());

        return parent::getIsoNaziv();
    }

    /**
     * {@inheritDoc}
     */
    public function setIsoNaziv($isoNaziv)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setIsoNaziv', array($isoNaziv));

        return parent::setIsoNaziv($isoNaziv);
    }

    /**
     * {@inheritDoc}
     */
    public function getOpomba()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getOpomba', array());

        return parent::getOpomba();
    }

    /**
     * {@inheritDoc}
     */
    public function setOpomba($opomba)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setOpomba', array($opomba));

        return parent::setOpomba($opomba);
    }

    /**
     * {@inheritDoc}
     */
    public function exchangeArray($data = array (
))
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'exchangeArray', array($data));

        return parent::exchangeArray($data);
    }

    /**
     * {@inheritDoc}
     */
    public function getArrayCopy()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getArrayCopy', array());

        return parent::getArrayCopy();
    }

    /**
     * {@inheritDoc}
     */
    public function copy()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'copy', array());

        return parent::copy();
    }

    /**
     * {@inheritDoc}
     */
    public function __toString()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, '__toString', array());

        return parent::__toString();
    }

    /**
     * {@inheritDoc}
     */
    public function validate($mode = 'update')
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'validate', array($mode));

        return parent::validate($mode);
    }

    /**
     * {@inheritDoc}
     */
    public function lahkoBrisem()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'lahkoBrisem', array());

        return parent::lahkoBrisem();
    }

}
