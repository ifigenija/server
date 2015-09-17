<?php

namespace Jobs\Printing\Model;

class ReportItem
{
    /**
     * Naslov stolpca/podatka
     * 
     * @var string
     */
    protected $naslov;
    
    /**
     * CSS razred stolpca
     * 
     * @var string
     */
    protected $class;
    
    /**
     * Širina stolpca (relativna, glede na širino vseh)
     * 
     * @var int
     */
    protected $width = 1;
    
    /**
     * Pridobitev vrednosti.
     * Če je string, je ime propertyja razreda
     * ali stolpec queryja, lahko pa je tudi callback, ki vrne vrednost
     * (sprejme 2 parametra, $row za trenutno in $old za staro vrednost)
     * 
     * @var $value string|callback
     */
    public $value;
    
    /**
     * Vrednost, ki se v stolpcu prikaže na koncu
     * To je za razne vsote, števce, itd.
     *
     * @var callback
     */
    protected $final = null;

    public function __construct($options = null)
    {
        if (is_array($options)) {
            if (isset($options['final']))
                $this->final = $options['final'];
            
            if (isset($options['naslov']))
                $this->naslov = $options['naslov'];
            
            if (isset($options['class']))
                $this->class = $options['class'];
            
            if (isset($options['value']))
                $this->value = $options['value'];
            
            if (isset($options['width']))
                $this->width = $options['width'];
        } elseif (is_string($options)) {
            $this->value = $options;
        }
    }

    public function setFinal($final)
    {
        $this->final = $final;
    }

    public function getFinal()
    {
        return $this->final;
    }

    public function setNaslov($naslov)
    {
        $this->naslov = $naslov;
    }

    public function getNaslov()
    {
        return $this->naslov;
    }

    public function setClass($class)
    {
        $this->class = $class;
    }

    public function getClass()
    {
        return $this->class;
    }

    public function setValue($val)
    {
        $this->value = $val;
    }

    public function getValue()
    {
        return $this->value;
    }

    public function setWidth($width)
    {
        $this->width = $width;
    }

    public function getWidth()
    {
        return $this->width;
    }
}