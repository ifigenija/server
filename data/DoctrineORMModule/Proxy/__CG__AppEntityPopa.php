<?php

namespace DoctrineORMModule\Proxy\__CG__\App\Entity;

/**
 * DO NOT EDIT THIS FILE - IT WAS CREATED BY DOCTRINE'S PROXY GENERATOR
 */
class Popa extends \App\Entity\Popa implements \Doctrine\ORM\Proxy\Proxy
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
            return array('__isInitialized__', 'id', 'sifra', 'tipkli', 'stakli', 'naziv', 'naziv1', 'panoga', 'tel', 'fax', 'email', 'url', 'opomba', 'rokPlacilaK', 'rokPlacilaD', 'dniPotrditve', 'rabat', 'drzava', '' . "\0" . 'App\\Entity\\Popa' . "\0" . 'oseba', 'naslovi', '' . "\0" . 'App\\Entity\\Popa' . "\0" . 'pogodba', '' . "\0" . 'App\\Entity\\Popa' . "\0" . 'kupec', 'potnik', 'potnikKontakt', 'izjava', 'idddv', 'maticna', 'zavezanec', 'jeeu', 'datZav', 'datnZav', 'upor', 'datKnj', 'kontaktne');
        }

        return array('__isInitialized__', 'id', 'sifra', 'tipkli', 'stakli', 'naziv', 'naziv1', 'panoga', 'tel', 'fax', 'email', 'url', 'opomba', 'rokPlacilaK', 'rokPlacilaD', 'dniPotrditve', 'rabat', 'drzava', '' . "\0" . 'App\\Entity\\Popa' . "\0" . 'oseba', 'naslovi', '' . "\0" . 'App\\Entity\\Popa' . "\0" . 'pogodba', '' . "\0" . 'App\\Entity\\Popa' . "\0" . 'kupec', 'potnik', 'potnikKontakt', 'izjava', 'idddv', 'maticna', 'zavezanec', 'jeeu', 'datZav', 'datnZav', 'upor', 'datKnj', 'kontaktne');
    }

    /**
     * 
     */
    public function __wakeup()
    {
        if ( ! $this->__isInitialized__) {
            $this->__initializer__ = function (Popa $proxy) {
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
    public function __toString()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, '__toString', array());

        return parent::__toString();
    }

    /**
     * {@inheritDoc}
     */
    public function addNaslovi($emb)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'addNaslovi', array($emb));

        return parent::addNaslovi($emb);
    }

    /**
     * {@inheritDoc}
     */
    public function removeNaslovi($emb)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'removeNaslovi', array($emb));

        return parent::removeNaslovi($emb);
    }

    /**
     * {@inheritDoc}
     */
    public function addKontaktne($emb)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'addKontaktne', array($emb));

        return parent::addKontaktne($emb);
    }

    /**
     * {@inheritDoc}
     */
    public function removeKontaktne($emb)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'removeKontaktne', array($emb));

        return parent::removeKontaktne($emb);
    }

    /**
     * {@inheritDoc}
     */
    public function getKlasifikacija()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getKlasifikacija', array());

        return parent::getKlasifikacija();
    }

    /**
     * {@inheritDoc}
     */
    public function setKlasifikacija($klasifikacija)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setKlasifikacija', array($klasifikacija));

        return parent::setKlasifikacija($klasifikacija);
    }

    /**
     * {@inheritDoc}
     */
    public function getKontaktne()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getKontaktne', array());

        return parent::getKontaktne();
    }

    /**
     * {@inheritDoc}
     */
    public function setKontaktne($kontaktne)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setKontaktne', array($kontaktne));

        return parent::setKontaktne($kontaktne);
    }

    /**
     * {@inheritDoc}
     */
    public function getId()
    {
        if ($this->__isInitialized__ === false) {
            return (int)  parent::getId();
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
    public function getMaxkli()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getMaxkli', array());

        return parent::getMaxkli();
    }

    /**
     * {@inheritDoc}
     */
    public function setMaxkli($Maxkli)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setMaxkli', array($Maxkli));

        return parent::setMaxkli($Maxkli);
    }

    /**
     * {@inheritDoc}
     */
    public function getStakli()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getStakli', array());

        return parent::getStakli();
    }

    /**
     * {@inheritDoc}
     */
    public function setStakli($stakli)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setStakli', array($stakli));

        return parent::setStakli($stakli);
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
    public function getNaziv1()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getNaziv1', array());

        return parent::getNaziv1();
    }

    /**
     * {@inheritDoc}
     */
    public function setNaziv1($naziv1)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setNaziv1', array($naziv1));

        return parent::setNaziv1($naziv1);
    }

    /**
     * {@inheritDoc}
     */
    public function getPanoga()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getPanoga', array());

        return parent::getPanoga();
    }

    /**
     * {@inheritDoc}
     */
    public function setPanoga($panoga)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setPanoga', array($panoga));

        return parent::setPanoga($panoga);
    }

    /**
     * {@inheritDoc}
     */
    public function getTel()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getTel', array());

        return parent::getTel();
    }

    /**
     * {@inheritDoc}
     */
    public function setTel($tel)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setTel', array($tel));

        return parent::setTel($tel);
    }

    /**
     * {@inheritDoc}
     */
    public function getFax()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getFax', array());

        return parent::getFax();
    }

    /**
     * {@inheritDoc}
     */
    public function setFax($fax)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setFax', array($fax));

        return parent::setFax($fax);
    }

    /**
     * {@inheritDoc}
     */
    public function getEmail()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getEmail', array());

        return parent::getEmail();
    }

    /**
     * {@inheritDoc}
     */
    public function setEmail($email)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setEmail', array($email));

        return parent::setEmail($email);
    }

    /**
     * {@inheritDoc}
     */
    public function getTrr1()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getTrr1', array());

        return parent::getTrr1();
    }

    /**
     * {@inheritDoc}
     */
    public function setTrr1($trr1)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setTrr1', array($trr1));

        return parent::setTrr1($trr1);
    }

    /**
     * {@inheritDoc}
     */
    public function getTrr2()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getTrr2', array());

        return parent::getTrr2();
    }

    /**
     * {@inheritDoc}
     */
    public function setTrr2($trr2)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setTrr2', array($trr2));

        return parent::setTrr2($trr2);
    }

    /**
     * {@inheritDoc}
     */
    public function getTrr3()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getTrr3', array());

        return parent::getTrr3();
    }

    /**
     * {@inheritDoc}
     */
    public function setTrr3($trr3)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setTrr3', array($trr3));

        return parent::setTrr3($trr3);
    }

    /**
     * {@inheritDoc}
     */
    public function getTrr4()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getTrr4', array());

        return parent::getTrr4();
    }

    /**
     * {@inheritDoc}
     */
    public function setTrr4($trr4)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setTrr4', array($trr4));

        return parent::setTrr4($trr4);
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
    public function getRokPlacilaK()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getRokPlacilaK', array());

        return parent::getRokPlacilaK();
    }

    /**
     * {@inheritDoc}
     */
    public function setRokPlacilaK($rokPlacilaK)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setRokPlacilaK', array($rokPlacilaK));

        return parent::setRokPlacilaK($rokPlacilaK);
    }

    /**
     * {@inheritDoc}
     */
    public function getRokPlacilaD()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getRokPlacilaD', array());

        return parent::getRokPlacilaD();
    }

    /**
     * {@inheritDoc}
     */
    public function setRokPlacilaD($rokPlacilaD)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setRokPlacilaD', array($rokPlacilaD));

        return parent::setRokPlacilaD($rokPlacilaD);
    }

    /**
     * {@inheritDoc}
     */
    public function getDniPotrditve()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getDniPotrditve', array());

        return parent::getDniPotrditve();
    }

    /**
     * {@inheritDoc}
     */
    public function setDniPotrditve($dniPotrditve)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setDniPotrditve', array($dniPotrditve));

        return parent::setDniPotrditve($dniPotrditve);
    }

    /**
     * {@inheritDoc}
     */
    public function getRabat()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getRabat', array());

        return parent::getRabat();
    }

    /**
     * {@inheritDoc}
     */
    public function setRabat($rabat)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setRabat', array($rabat));

        return parent::setRabat($rabat);
    }

    /**
     * {@inheritDoc}
     */
    public function getDrzava()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getDrzava', array());

        return parent::getDrzava();
    }

    /**
     * {@inheritDoc}
     */
    public function setDrzava($drzava)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setDrzava', array($drzava));

        return parent::setDrzava($drzava);
    }

    /**
     * {@inheritDoc}
     */
    public function getPotnik()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getPotnik', array());

        return parent::getPotnik();
    }

    /**
     * {@inheritDoc}
     */
    public function setPotnik($potnik)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setPotnik', array($potnik));

        return parent::setPotnik($potnik);
    }

    /**
     * {@inheritDoc}
     */
    public function getIzjava()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getIzjava', array());

        return parent::getIzjava();
    }

    /**
     * {@inheritDoc}
     */
    public function setIzjava($izjava)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setIzjava', array($izjava));

        return parent::setIzjava($izjava);
    }

    /**
     * {@inheritDoc}
     */
    public function getIdddv()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getIdddv', array());

        return parent::getIdddv();
    }

    /**
     * {@inheritDoc}
     */
    public function setIdddv($idddv)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setIdddv', array($idddv));

        return parent::setIdddv($idddv);
    }

    /**
     * {@inheritDoc}
     */
    public function getMaticna()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getMaticna', array());

        return parent::getMaticna();
    }

    /**
     * {@inheritDoc}
     */
    public function setMaticna($maticna)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setMaticna', array($maticna));

        return parent::setMaticna($maticna);
    }

    /**
     * {@inheritDoc}
     */
    public function getZavezanec()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getZavezanec', array());

        return parent::getZavezanec();
    }

    /**
     * {@inheritDoc}
     */
    public function setZavezanec($zavezanec)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setZavezanec', array($zavezanec));

        return parent::setZavezanec($zavezanec);
    }

    /**
     * {@inheritDoc}
     */
    public function getJeeu()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getJeeu', array());

        return parent::getJeeu();
    }

    /**
     * {@inheritDoc}
     */
    public function setJeeu($jeeu)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setJeeu', array($jeeu));

        return parent::setJeeu($jeeu);
    }

    /**
     * {@inheritDoc}
     */
    public function getDatZav()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getDatZav', array());

        return parent::getDatZav();
    }

    /**
     * {@inheritDoc}
     */
    public function setDatZav($datZav)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setDatZav', array($datZav));

        return parent::setDatZav($datZav);
    }

    /**
     * {@inheritDoc}
     */
    public function getDatnZav()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getDatnZav', array());

        return parent::getDatnZav();
    }

    /**
     * {@inheritDoc}
     */
    public function setDatnZav($datnZav)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setDatnZav', array($datnZav));

        return parent::setDatnZav($datnZav);
    }

    /**
     * {@inheritDoc}
     */
    public function getUrl()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getUrl', array());

        return parent::getUrl();
    }

    /**
     * {@inheritDoc}
     */
    public function setUrl($url)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setUrl', array($url));

        return parent::setUrl($url);
    }

    /**
     * {@inheritDoc}
     */
    public function getNaslovi()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getNaslovi', array());

        return parent::getNaslovi();
    }

    /**
     * {@inheritDoc}
     */
    public function setNaslovi($naslovi)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setNaslovi', array($naslovi));

        return parent::setNaslovi($naslovi);
    }

    /**
     * {@inheritDoc}
     */
    public function getPotnikKontakt()
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'getPotnikKontakt', array());

        return parent::getPotnikKontakt();
    }

    /**
     * {@inheritDoc}
     */
    public function setPotnikKontakt($potnikKontakt)
    {

        $this->__initializer__ && $this->__initializer__->__invoke($this, 'setPotnikKontakt', array($potnikKontakt));

        return parent::setPotnikKontakt($potnikKontakt);
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
