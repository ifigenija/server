<?php

/*
 * Licenca GPL V3 or later
 * SELECT truncate_tables('testniuser');
 * set XDEBUG_CONFIG=idekey=netbeans-xdebug
 * crpalka prestavi "Proizvodnja\Entity\DelovniNalog" "5c89d8b6-0c67-4d7c-83ce-0a17a96683c4" > izpis.txt
 * crpalka prestavi "Tehnologija\Entity\PakiranjeProdukta" "289dcfa2-5070-4528-a9dc-fa260065289d" > izpis.txt
 * crpalka prestavi "Proizvodnja\Entity\DelovniNalog" "c5e9d507-7dd7-4c7b-8fbd-5e8297ce465f" > izpis.txt
 * 
 * crpalka prestaviVse "Aaa\Entity\Permission"
 * crpalka prestaviVse "Aaa\Entity\Role"
 * crpalka prestaviVse "Aaa\Entity\User"
 * crpalka prestaviVse "Aaa\Entity\Group"
 * 
 * crpalka precrpaj "Proizvodnja-DelovniNalog" "14-574-1"
 */

namespace Crpalka\Service;

use Doctrine\Common\Util\ClassUtils;
use Doctrine\ORM\EntityManager;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\ServiceManager\ServiceLocatorAwareTrait;

class CrpalkaService
    implements ServiceLocatorAwareInterface
{

    use ServiceLocatorAwareTrait;

    /**
     * @var \Doctrine\ORM\EntityManager
     */
    protected $emIzvor;
    /**
     * @var \Doctrine\ORM\EntityManager
     */
    protected $emCilj;
    protected $logger;
    protected $poljeEntitet;
    protected $poljePravil;
    protected $poljeOwningSide;
    protected $poljeNeOwningSide;
    protected $poljeIdent;
    protected $entityMetadataFactory;

    public function getEntityMetadataFactory()
    {
        return $this->entityMetadataFactory;
    }

    public function setEntityMetadataFactory($entityMetadataFactory)
    {
        $this->entityMetadataFactory = $entityMetadataFactory;
        return $this;
    }

    public function getPoljeIdent()
    {
        return $this->poljeIdent;
    }

    public function setPoljeIdent($poljeIdent)
    {
        $this->poljeIdent = $poljeIdent;
        return $this;
    }

    public function getPoljeOwningSide()
    {
        return $this->poljeOwningSide;
    }

    public function getPoljeNeOwningSide()
    {
        return $this->poljeNeOwningSide;
    }

    public function setPoljeOwningSide($poljeOwningSide)
    {
        $this->poljeOwningSide = $poljeOwningSide;
        return $this;
    }

    public function setPoljeNeOwningSide($poljeNeOwningSide)
    {
        $this->poljeNeOwningSide = $poljeNeOwningSide;
        return $this;
    }

    public function getEmIzvor()
    {
        return $this->emIzvor;
    }

    public function getEmCilj()
    {
        return $this->emCilj;
    }

    public function getPoljePravil()
    {
        return $this->poljePravil;
    }

    public function getLogger()
    {
        return $this->logger;
    }

    public function getPoljeEntitet()
    {
        return $this->poljeEntitet;
    }

    public function setEmIzvor($emIzvor)
    {
        $this->emIzvor = $emIzvor;
        return $this;
    }

    public function setEmCilj($emCilj)
    {
        $this->emCilj = $emCilj;
        return $this;
    }

    public function setPoljePravil($poljePravil)
    {
        $this->poljePravil = $poljePravil;
        return $this;
    }

    public function setLogger($logger)
    {
        $this->logger = $logger;
        return $this;
    }

    public function setPoljeEntitet($poljeEntitet)
    {
        $this->poljeEntitet = $poljeEntitet;
        return $this;
    }

    /**
     * Metoda prečrpa podatke določenega ID-ja znotraj podane entitete
     * 
     * @param string $entiteta
     * @param string $id
     */
    public function precrpajBazo($entiteta, $id)
    {
        $kljuc = "";
        $emCilj = $this->emCilj;
        $this->poljeEntitet->clear();
        $this->prepisiBazo($entiteta, $id, $kljuc);
        $emCilj->flush();
    }

    /**
     * Metoda prečrpa vse podatke znotraj podane entitete
     * 
     * @param type $nizEntiteta
     */
    public function precrpajVseBazo($nizEntiteta)
    {
        $vseEntitete = $this->emIzvor->getRepository($nizEntiteta)->findAll();
        $stevilo = count($vseEntitete);

        //gremo čez vse entitete in jih prečrpamo v ciljno bazo
        $stevec = 1;
        foreach ($vseEntitete as $entiteta) {
            $this->precrpajBazo($nizEntiteta, $entiteta->getId());
            
            echo 'Precrpanih '.$stevec.' od '.$stevilo.' entitet. Dokoncano '.bcmul(bcdiv($stevec, $stevilo, 4), 100, 4).'%'."\r";
            $stevec++;
        }
    }

    /**
     * Metoda preveri ali nadaljujemo z akcijo(pot=nadaljujem pot, owningside,neowning = zapišem property ali ne)
     * 
     * @param string $kljuc
     * @param array $poljePravil
     * @param boolean $owningside
     * @return boolean
     */
    private function nadaljuj($kljuc, $poljePravil, $owningside)
    {
        //Če je pravilo znotraj kljuca, potem se preveri vrednost pravila
        foreach ($poljePravil as $pravilo) {
            if (mb_strpos($kljuc, $pravilo) !== false) {
                return $this->poljePravil->get($pravilo);
            }
        }
        //če ni pravila v kljucu se vzame privzeta vrednost
        return $owningside;
    }

    /**
     * Metoda razveji in se ob pravilno podanih podatkih kliče metoda, ki preveri pravila
     * 
     * @param string $kljucPot
     * @param string $parameter
     * @param string $owningSide
     * @return boolean|NULL
     */
    private function preveriPravila($kljucPot, $parameter, $owningSide)
    {
        if ($parameter == "pravila") {
            return $this->nadaljuj($kljucPot, $this->poljePravil->getKeys(), true);
        } else if ($parameter == "owningside" && $owningSide) {
            return $this->nadaljuj($kljucPot, $this->poljeOwningSide->getKeys(), $owningSide);
        } else if ($parameter == "owningside" && !$owningSide) {
            return $this->nadaljuj($kljucPot, $this->poljeNeOwningSide->getKeys(), $owningSide);
        } else {
            $this->logger->error("Ni nastavljen parameter pri pravilu");
            return NULL;
        }
    }

    /**
     * Metoda gre novo globje in ko pride nazaj se vpraša ali je property owning side, če je se zapiše če ni se ne zapiše(pravila lahko povozijo to)
     * 
     * @param int $type
     * @param object $NEntitete
     * @param string $targetEntity
     * @param string $kljucPot
     * @param boolean $owningSide
     * @param object $novaEntiteta
     * @param string $fieldName
     */
    private function naslednjiNivo($type, $NEntitete, $targetEntity, $kljucPot, $owningSide, $novaEntiteta, $fieldName)
    {
        $stevec = mb_substr_count($kljucPot, '.');
        $this->logger->info($stevec . " " . "NASLEDNJI  NIVO ");
        //preverimo ali je oneToMany oneToOne predno gremo nivo nižje
        if ($type == 2 || $type == 1) {
            $NEntiteta = $NEntitete;
            $ent = $this->prepisiBazo($targetEntity
                , $NEntiteta->getId()
                , $kljucPot);
            //preverimo ali obstaja pravilo, ki bi nam spremenilo privzete vrednosti
            if ($this->preveriPravila($kljucPot, "owningside", $owningSide) && $ent) {
                $this->logger->info($stevec . " " . "Nova entiteta: " . $novaEntiteta . " " . $novaEntiteta->getId() . " " . "Ent: " . $ent . " " . $ent->getId());
                $this->setProperty($novaEntiteta, $fieldName, $ent); //$this->poljeEntitet->get($ent->getId()));
            }
        }
        //preverimo ali je manyToMany ali oneToMany predno gremo nivo nižje
        else if ($type == 4 || $type == 8) {
            foreach ($NEntitete as $NEntiteta) {
                $ent = $this->prepisiBazo($targetEntity
                    , $NEntiteta->getId()
                    , $kljucPot);
                //preverimo ali obstaja pravilo, ki bi nam spremenilo privzete vrednosti
                if ($this->preveriPravila($kljucPot, "owningside", $owningSide) && $ent) {
                    $this->logger->info($stevec . " " . "Nova entiteta: " . $novaEntiteta . " " . $novaEntiteta->getId() . " " . "Ent: " . $ent . " " . $ent->getId());
                    $this->addProperty($novaEntiteta, $fieldName, $ent); //$this->poljeEntitet->get($ent->getId()));
                }
            }
        }
        $this->logger->info($stevec . " " . "IZHOD  NIVO ");
    }

    /**
     * Metoda nastavi propertije, ki niso asociacije in vrne novoentiteto iz ciljne baze
     * 
     * @param object $testnaEntiteta 
     * @param string $imeEntitete
     * @param object $izvornaEntiteta
     * @return object
     */
    private function nastaviPropertije($testnaEntiteta, $imeEntitete, $izvornaEntiteta)
    {
        $emIzvr = $this->emIzvor;

        $emCilj = $this->emCilj;

        if (!$testnaEntiteta) {

            //imena vseh propertijev pridobimo da določimo samo propertije, ki nimajo asociacij
            $imeaPropertijev = $emIzvr->getClassMetadata($imeEntitete)->getFieldNames();
            $meta = $emIzvr->getClassMetadata(get_class($izvornaEntiteta));
            $ime = $meta->getName();

            $ImenaAsociacije = $emIzvr->getClassMetadata($imeEntitete)->getAssociationNames();


            $testnaEntiteta = new $ime();

            foreach ($imeaPropertijev as $imePropertija) {
                //preverimo, da ni property v polju asociacij
                if (!$this->preveriVsebnost($imePropertija, $ImenaAsociacije)) {
                    $vrednost = $this->getProperty($izvornaEntiteta, $imePropertija);
                    if ($meta->isUniqueField($imePropertija)) {
                        $vrednost = $vrednost . '-' . getenv('APP_ENV');
                    }
                    $this->setProperty($testnaEntiteta, $imePropertija, $vrednost);

                }
            }

            //na koncu pa še persistamo, da se shrane v bazo
            $emCilj->persist($testnaEntiteta);
        }

        return $testnaEntiteta;
    }

    /**
     * Metoda prepise drevo s koreno drevesa v podani entiteti
     *
     * @param string $imeEntitete
     * @param string $idEntitete
     * @param string $kljuc
     * @return object
     */
    private function prepisiBazo($imeEntitete, $idEntitete, $kljuc)
    {
        /* @var $emIzvr EntityManager */

        //pridobi iz pravila ali iscemo po identu
        //pridobi metapodatke
        //pridobi ime identa
        //pridobi vrednost identa
        //isci po identu po repositorju določene entitete
        //vrni id od najdene entitete

        $emIzvr = $this->emIzvor;
        $emCilj = $this->emCilj;
        $spremembaID = "";
        $stevec = mb_substr_count($kljuc, '.');

        $entiteta = $emIzvr->find($imeEntitete, $idEntitete);
        $imeEntitete = ClassUtils::getRealClass(get_class($entiteta));

        if ($this->poljeIdent->containsKey($imeEntitete)) {
            $this->logger->info($stevec . " " . "iscem ident " . $imeEntitete . " " . $idEntitete);

            $metaData = $this->entityMetadataFactory->factory($imeEntitete);
            $property = $metaData->getIdent();

            $entiteta = $emIzvr->find($imeEntitete, $idEntitete);
            $vrednost = $this->getProperty($entiteta, $property);

            $vseEntitete = $this->emCilj->getRepository($imeEntitete)->findAll();

            foreach ($vseEntitete as $entiteta) {
                if ($this->getProperty($entiteta, $property) == $vrednost) {
                    $spremembaID = $idEntitete;
                    $idEntitete = $this->getProperty($entiteta, "id");
                    $this->logger->info($stevec . " " . "spreminjam id " . $imeEntitete . " " . $idEntitete);
                    break;
                }
            }
        }

        //preverimo ali smo že obdelali entiteto s podanim idjem
        if (!$this->poljeEntitet->containsKey($idEntitete)) {

            $kljuc = $kljuc . "." . $this->pridobiIme($imeEntitete);

            if ($spremembaID == "") {
                $IzvornaEntiteta = $emIzvr->find($imeEntitete, $idEntitete);
            } else {
                $IzvornaEntiteta = $emIzvr->find($imeEntitete, $spremembaID);
            }
            $this->logger->info($stevec . " " . "izvorna entiteta " . $IzvornaEntiteta . " " . $imeEntitete);

            $testnaEntiteta = $emCilj->find($imeEntitete, $idEntitete);
            $this->logger->info($stevec . " " . "ponorna entiteta " . $testnaEntiteta . " " . $imeEntitete);
            //nastavimo propertije, ki nimajo asociacij

            $novaEntiteta = $this->nastaviPropertije($testnaEntiteta, $imeEntitete, $IzvornaEntiteta);
            $this->poljeEntitet->set($idEntitete, $novaEntiteta);
            $this->logger->info($stevec . " " . "nova entiteta " . $novaEntiteta . " " . $imeEntitete);

            if ($spremembaID == "") {
                $asociacije = $emIzvr->getClassMetadata($imeEntitete)->getAssociationMappings();
                //nastavimo vse propertije, ki imajo asociacijo
                foreach ($asociacije as $asociacija) {
                    $fieldName = $asociacija['fieldName'];
                    $targetEntity = $asociacija['targetEntity'];
                    $type = $asociacija['type'];
                    $owningSide = $asociacija['isOwningSide'];
                    $kljucPot = $kljuc . "(" . $fieldName . ")";

                    //pridobimo entiteto, ki je v nivoju nižje
                    $naslednjaEntitete = $this->getProperty($IzvornaEntiteta, $fieldName);

                    //preverimo pravilo za podan property, ali ga želimo obdelati ali ne
                    $nadaljuj = $this->preveriPravila($kljucPot, "pravila", true);

                    if ($naslednjaEntitete != null && $nadaljuj) {
                        $this->naslednjiNivo($type
                            , $naslednjaEntitete
                            , $targetEntity
                            , $kljucPot, $owningSide
                            , $novaEntiteta
                            , $fieldName);
                    }
                }
            } else {
                $this->logger->info($stevec . " " . "preskakujem " . $novaEntiteta->getId());
                //$novaEntiteta = $emCilj->find($imeEntitete, $idEntitete);
                $this->logger->info($stevec . " " . "nova entiteta: " . $novaEntiteta->getId());
            }

            $emCilj->persist($novaEntiteta);

            $this->logger->info($stevec . " " . "VSTAVO V BAZO" . " ID " . $novaEntiteta->getId());
            $this->logger->info($stevec . " " . "Entiteta: "
                . $imeEntitete
                . " ID: "
                . $idEntitete
                . " Kljuc: "
                . $kljuc);

            $this->logger->info($stevec . " " . "IZHOD IZ PREPISI");
            return $novaEntiteta;
        }

        return $emCilj->find($imeEntitete, $idEntitete);
    }

    /**
     * Metoda, pridobi vrednost propertja
     * 
     * @param object $entiteta
     * @param string $property
     * @return mixed vrne vrednost propertija
     */
    private function getProperty($entiteta, $property)
    {
        return $entiteta->$property;
    }

    /**
     * Metoda, priredi propertji na podano vrednost
     * 
     * Entiteta - objekt
     * property - niz propertija
     * vrednost - mešani tipi
     * 
     * @param object $entiteta
     * @param string $property
     * @param mixed $vrednost
     */
    private function setProperty($entiteta, $property, $vrednost)
    {
        return $entiteta->__set($property, $vrednost);
    }

    /**
     * Metoda, ki doda novo vrednost obstoječemu arraycollectionu določenega propertija iz entitete.
     * 
     * Entiteta- objekt
     * property - niz propertija
     * vrednost - mešani tipi
     * 
     * @param object $entiteta 
     * @param string $property
     * @param mixed $vrednost
     */
    private function addProperty($entiteta, $property, $vrednost)
    {
        $polje = $this->getProperty($entiteta, $property);
        if ($polje != NULL) {
            if (!$polje->contains($vrednost)) {
                $polje->add($vrednost);
                $this->setProperty($entiteta, $property, $polje);
            }
        }
    }

    /**
     * Metoda vrne samo ime entitete
     * @param string $entiteta
     * @return string
     */
    private function pridobiIme($entiteta)
    {
        return explode('\\', $entiteta)[2];
    }

    /**
     * Metoda vrne ali je vrednost znotraj podanega polja
     * @param mixed $vrednost2
     * @param array $polje1
     * @return boolean
     */
    private function preveriVsebnost($vrednost2, $polje1)
    {
        foreach ($polje1 as $vrednost1) {
            if ($vrednost1 == $vrednost2) {
                return true;
            }
        }
        return false;
    }

}
