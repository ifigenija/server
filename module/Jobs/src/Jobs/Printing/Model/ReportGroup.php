<?php

namespace Jobs\Printing\Model;

use Doctrine\ORM\QueryBuilder;
use Doctrine\ORM\Query;
use Max\Entity\Base;
use Max\Exception\MaxException;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

class ReportGroup implements ServiceLocatorAwareInterface
{

    /**
     * Naslov report skupine
     * 
     * @var $naslov string|callback
     */
    public $naslov;

    /**
     * Metapodatki (stolpci/rezultati) skupine
     * 
     * @var ReportItem[]
     */
    protected $reportItems = [];

    /**
     * Vhodni podatki
     * 
     * @var $data array|QueryBuilder
     */
    protected $data;

    /**
     * Anonimna funkcija, ki vrne true, če se začne nov report group
     * 
     * @var callable
     */
    public $discriminator;

    /**
     * Števec za iteracijo po podaktih
     * 
     * @var int
     */
    protected $counter;

    public function __construct($options = null)
    {
        if (is_array($options)) {
            if (isset($options['data']))
                $this->data = $options['data'];

            if (isset($options['discriminator']))
                $this->discriminator = $options['discriminator'];

            if (isset($options['naslov'])) {
                $this->naslov = $options['naslov'];
            }

            if (isset($options['reportItems'])) {
                if (is_array($options['reportItems']))
                    foreach ($options['reportItems'] as $reportItem)
                        $this->reportItems[] = new ReportItem($reportItem);
            }
        }
        $this->counter = 0;
    }

    public function getOutput()
    {
        $em = $this->getServiceLocator()->get('doctrine.entitymanager.orm_default');

        // Če delam z objekti, pridobi naslove stolpcev
        if (count($this->data) && $this->data[0] instanceof Base) {
            foreach ($this->getReportItems() as $inum => $item) {
                if (is_string($item->getValue()) && !$item->getNaslov()) {
                    $properties = preg_split('/\./', $item->getValue());

                    $object = $this->data[0];

                    $mf = $em->getMetadataFactory();
                    $meta = $mf->getMetadataFor(get_class($object));

                    $repo = $em->getRepository(get_class($object));
                    $repo->setServiceLocator($this->getServiceLocator());

                    if ($meta->hasField($properties[0]) || $meta->hasAssociation($properties[0])) {
                        $naslov = $repo->getMeta()->getFieldI18n($properties[0])->label;
                        $this->reportItems[$inum]->setNaslov($naslov);
                    }
                }
            }
        }

        if ($this->counter >= count($this->data))
            return false;

        $naslov = $this->naslov;
        if (is_callable($naslov))
            $naslovstr = $naslov($this->data[$this->counter]);
        else
            $naslovstr = $naslov;

        $output = [
            'naslov' => $naslovstr,
            'final' => [],
            'rows' => []
        ];

        // Inicializacija izhoda
        foreach ($this->reportItems as $num => $item) {
            $output['final'][$num] = null;
            $output['class'][$num] = null;
        }

        $row = null;
        $discriminator = $this->discriminator;
        $values = [];
        while ($this->counter < count($this->data)) {
            $values_old = $values;
            $values = [];

            $row_old = $row;
            $row = $this->data[$this->counter];

            // Ločevanje skupin glede na pogoj
            if (is_callable($discriminator)) {
                if ($row_old && $discriminator($row, $row_old))
                    break;
            } elseif (is_string($discriminator)) {
                if ($row instanceof Base && $row_old) {
                    $call = 'get' . ucfirst($discriminator);
                    if ($row->$call() != $row_old->$call())
                        break;
                } elseif ($row_old) {
                    if ($row_old[$discriminator] != $row[$discriminator])
                        break;
                }
            } else {
                throw new MaxException('Diskriminator je neveljaven', 'TIP-PRT-0104');
            }

            // Inicializacija razredov izpisa
            foreach ($this->reportItems as $num => $item) {
                $output['class'][$num] = null;
            }

            foreach ($this->reportItems as $num => $item) {
                // Pridobi "staro" vrednost
                $old = isset($values_old[$num]) ? $values_old[$num] : null;

                $value = null;
                $getValue = $item->getValue();
                if (is_callable($getValue)) {
                    $value = $getValue($row, $old);
                } elseif (is_string($getValue)) {
                    if (is_array($row)) { // Query result
                        $value = $row[$getValue];
                    } elseif ($row instanceof Base) { // Object property
                        $properties = preg_split('/\./', $item->getValue());

                        $object = $row;
                        $mf = $em->getMetadataFactory();
                        $meta = $mf->getMetadataFor(get_class($object));
                        $type = null;

                        foreach ($properties as $property) {
                            $getter = 'get' . ucfirst($property);
                            if ($meta->hasAssociation($property)) {
                                $object = $object->$getter();
                                $meta = $mf->getMetadataFor(get_class($object));
                            } elseif ($meta->hasField($property)) {
                                $object = $object->$getter();
                                $meta = $meta->getFieldMapping($property);
                            } else {
                                throw new MaxException("Vrednost polja ni bila najdena v podatkih: {$item->getValue()}", 'TIP-PRT-0102');
                            }
                        }
                        $value = $object;
                    } else {
                        throw new MaxException("Vrednost polja neveljavna", 'TIP-PRT-0103');
                    }
                }

                // Prepoznam vrsto podatka ter primerno določim column class in obliko izpisa
                $class = $output['class'][$num];
                switch ($class) {
                    case null:
                        if (is_numeric($value))
                            $output['class'][$num] = 'number';
                        elseif ($value instanceof \DateTime)
                            $output['class'][$num] = 'date';
                        else
                            $output['class'][$num] = false;
                        break;
                    case 'number':
                        if (!is_numeric($value))
                            $output['class'][$num] = false;
                        break;
                    case 'date':
                        if (!$value instanceof \DateTime)
                            $output['class'][$num] = false;
                        break;
                }
                if ($value instanceof \DateTime)
                    $value = $value->format('d.m.Y');

                // Shrani pridobljeno vrednost
                $values[$num] = $value;

                // Če ima stolpec tudi izpis vrednosti na koncu (števci itd.), jo posodobim in shranim
                $final = $item->getFinal();
                if (is_callable($final)) {
                    $old = $output['final'][$num];
                    $output['final'][$num] = $final($row, $old);
                }
            }

            // Vrni vrednost navadnega polja
            $output['rows'][] = $values;
            $this->counter ++;
        }

        return $output;
    }

    public function addReportItem($item)
    {
        if ($item instanceof ReportItem)
            $this->reportItems[] = $item;
        else
            $this->reportItems[] = new ReportItem($item);
    }

    public function getReportItems()
    {
        return $this->reportItems;
    }

    public function setData($data)
    {
        if (is_array($data))
            $this->data = $data;
        elseif ($data instanceof QueryBuilder)
            $this->data = $data->getQuery()->getResult();
        elseif ($data instanceof Query)
            $this->data = $data->getResult();
        else
            throw new MaxException('Tip podatkov za tiskanje reporta neznan', 'TIP-PRT-0101');
    }

    public function getData()
    {
        return $this->data;
    }

    public function setServiceLocator(ServiceLocatorInterface $serviceLocator)
    {
        $this->serviceLocator = $serviceLocator;
        return $this;
    }

    public function getServiceLocator()
    {
        return $this->serviceLocator;
    }

    public function getMaxWidth()
    {
        $max = 0;
        foreach ($this->getReportItems() as $item)
            $max += $item->getWidth();

        return $max;
    }

    public function getNaslov()
    {
        return $this->naslov;
    }

    public function setNaslov($naslov)
    {
        $this->naslov = $naslov;
        return $this;
    }

    public function getDiscriminator()
    {
        return $this->discriminator;
    }

    public function setDiscriminator($discriminator)
    {
        $this->discriminator = $discriminator;
        return $this;
    }

}
