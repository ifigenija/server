<?php

namespace Jobs\View\Helper;

use Max\Exception\MaxException;
use Jobs\Printing\Model\TableModel;
use Jobs\Printing\Model\TableCell;
use Traversable;
use Zend\Filter\StripTags;
use Zend\I18n\Translator\Translator;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\ServiceManager\ServiceLocatorAwareTrait;
use Zend\View\Helper\AbstractHelper;

class Table extends AbstractHelper implements ServiceLocatorAwareInterface {

    use ServiceLocatorAwareTrait;
    
    /**
     * @var TableModel
     */
    protected $def;
    

    /**
     * 
     * @var Translator
     */
    protected $tr;
    
    /**
     * Vstopna točka v view helper
     * 
     * @param Table|array $def
     * @param array|Traversable $entities
     * @return string
     * @throws MaxException
     */
    public function __invoke($def, $entities) {
        
        if (is_array($def)) {
            $this->def = new TableModel($this->getServiceLocator(), $def);
        } elseif ($def instanceof TableModel) {
            $this->def = $def;
        } else {
            throw new MaxException('Definicija tabele ni veljavna', 7710006);
        }
        
        $this->tr = $this->view->plugin('translate')->getTranslator();
        
        if ($entities instanceof Traversable) {
            $entities = iterator_to_array($entities);
        }
        
        $html = '';
        if (count($entities) > 0) {
            // če entity class tabele ni določen, ga lahko dobimo iz podatkov
            $first = reset($entities);
            if ($this->def->getEntityClass() === null && is_object($first)) {
                $this->def->setEntityClass(get_class($first));
            }

            $groups = $this->groupEntities($entities);
            foreach ($groups as $group) {
                $html .= $this->makeTable($group);
            }
        }
        
        return $html;
    }
    
    /**
     * Naredi tabelo - v odvisnosti od "type" atributa 
     * v definiciji naredi horizontalno ali pa vertikalno tabelo 
     * 
     * @param array|Traversable $entities
     * @return string
     */
    private function makeTable($entities) {
        switch ($this->def->getType()) {
            case 'horizontal':
                return $this->makeHorizontalTable($entities);
            case 'vertical':
                return $this->makeVerticalTable($entities);
            default:
                return '';
        }
    }
    
    private function makeHorizontalTable($entities) {
        $html = '<table class="horizontal">';
        
        // naslov tabele
        if ($this->def->getTitle()) { $html .= $this->makeTitle($entities); }
        
        // definicija stolpcev
        $html .= $this->makeColGroup();
        
        // glava tabele
        $html .= '<thead>';
        if ($this->def->getHeaderTitle()) { $html .= $this->makeHeaderTitle($entities); }
        $html .= $this->makeHeaderCols();
        $html .= '</thead>';
        
        // podatki
        $len = count($entities);
        foreach ($entities as $i => $entity) {
            // skupine naj se ne lomijo med stranmi
            $html .= '<tbody class="page-break-avoid">';
            
            $html .= $this->makeGroups($entity);
            
            // zadnja vrstice ne zaključimo saj mora biti skupaj s final vrstico
            if ($i !== $len - 1) { $html .= '</tbody>'; }
        }
        
        // final vrstica (za seštevke ipd.)
        if ($len > 0) {
            $html .= '<tr>';
            if ($this->def->hasFinal()) {
                $groups = $this->def->getGroups();
                foreach (reset($groups) as $cell) {
                    $html .= $this->makeFinalCell($cell, $entities);
                }
            }
            $html .= '</tr>';
            $html .= '</tbody>';
        }

        $html .= '</table>';
        return $html;
    }
    
    private function makeVerticalTable($entities) {
        $html = '<table class="vertical">';
        
        // naslov tabele
        if ($this->def->getTitle()) { $html .= $this->makeTitle($entities); }
        
        // podatki (podpira samo eno skupino)
        foreach ($this->def->getGroups()[0] as $cell) {
            $html .= '<tr>';
            
            // naslovna celica
            $html .= $this->makeHeader($cell);
            
            // podatkovne celice
            foreach ($entities as $entity) {
                $html .= $this->makeCell($cell, $entity);
            }
            
            // final celica (za seštevke)
            if ($this->def->hasFinal()) {
                $html .= $this->makeFinalCell($cell, $entities);
            }
            
            $html .= '</tr>';
        }
        
        $html .= '</table>';
        return $html;
    }
    
    /**
     * Naslov html tabele
     * 
     * @param Traversable $entities
     * @return string
     */
    private function makeTitle($entities) {
        $value = $this->format($this->def->getTitle(), null, $entities);
        return $this->makeEl('caption', $this->tr->translate($value));
    }
    
    /**
     * Header tabele
     * 
     * @param Traversable $entities
     * @return string
     */
    private function makeHeaderTitle($entities) {
        $groups = $this->def->getGroups();
        $colspan = count(reset($groups));
        $value = $this->format($this->def->getHeaderTitle(), null, $entities);
        $header = $this->makeEl('th', $this->tr->translate($value), [
            'colspan' => $colspan,
            'class' => 'cell-type-header-title'
        ]);
        return "<tr>{$header}</tr>";
    }
    
    /**
     * 
     * 
     * @return string
     */
    private function makeHeaderCols() {
       $html = '<tr>';
       $groups = $this->def->getGroups();
       $cells = \reset($groups);
       foreach ($cells as $cell) {
            $html .= $this->makeHeader($cell);
        }
       $html .= '</tr>';
       return $html;
    }

    /**
     * @param TableCell $cell
     * @return string
     */
    private function makeHeader(TableCell $cell) {
        return $this->makeEl('th', $this->format($this->tr->translate($cell->getTitle())), [
            'class' => $cell->getFullClassString(),
            'style' => $this->resolveAlignment($cell)
        ]);
    }

    /**
     * @return string
     */
    private function makeColGroup() {
        $html = '<colgroup>';
        $groups = $this->def->getGroups();
        $cells = \reset($groups);
        foreach ($cells as $cell) {
            $html .= $this->makeCol($cell);
        }
        $html .= '</colgroup>';
        return $html;
    }

    /**
     * @param TableCell $cell
     * @return string
     */
    private function makeCol(TableCell $cell) {
        return $this->makeEl('col', [
            'class' => $cell->getFullClassString(),
            'style' => "width: {$cell->getWidth()}"
        ]);
    }

    /**
     * @param $entity
     * @return string
     * @throws MaxException
     */
    private function makeGroups($entity) {
        $html = '';
        $data = [];
        
        // zgradimo vse skupine vrstic
        $groups = $this->def->getGroups();
        foreach ($groups as $key => $group) {
            $data[$key] = $this->extractGroupData($group, $entity);
        }
        
        // preštejemo vrstice v skupinah
        $lenghts = array_map(function($x) { return count($x); }, $data);
        
        // izpišemo skupino
        foreach ($data as $groupKey => $group) {
            foreach ($group as $row) {
                $html .= '<tr>';
                foreach ($row as $key => $value) {
                    $cell = $groups[$groupKey][$key];
                    $html .= $this->makeEl('td', $value, [
                        'colspan' => $cell->getColspan(),
                        'rowspan' => $this->resolveRowspan($cell->getRowspan(), $lenghts),
                        'class' => $cell->getFullClassString(),
                        'style' => $this->resolveAlignment($cell)
                    ]);
                }
                $html .= '</tr>';
            }
        }
        
        return $html;
    }
    
    private function resolveAlignment(TableCell $cell) {
        $halign = null;
        $valign = null;
        $parts = explode(' ', $cell->getAlign());
        
        foreach ($parts as $part) {
            switch (trim($part)) {
                case 'left':
                    $halign = 'left';   break;
                case 'right':
                    $halign = 'right';  break;
                case 'center';
                    $halign = 'center'; break;
                case 'top':
                    $valign = 'top';    break;
                case 'middle':
                    $valign = 'middle'; break;
                case 'bottom':
                    $valign = 'bottom'; break;
            }
        }
        
        $css  = $halign ? "text-align: {$halign}; " : '';
        $css .= $valign ? "vertical-align: {$valign}; " : '';
        return $css ?: null;
    }
    
    private function resolveRowspan($span, $lenghts) {
        if (is_int($span)) { return (int) $span; }
        
        // preporst parser za seštevanje
        // podpira cela števila (int) in referenco na na skupino (&kljucSkupine)
        $parts = explode('+', $span);
        foreach ($parts as $i => $part) {
            $part = trim($part);
            
            if (!$part) {
                // ignoriramo prazne vrstice
                $parts[$i] = 0;
            } else if ($part[0] === '&') {
                // če imamo referenco na skupino, preštejemo koliko vrstic zasede
                $key = substr($part, 1);
                if (isset($lenghts[$key])) {
                    $parts[$i] = $lenghts[$key];
                } else {
                    throw new MaxException("Neuspešno resolvanje parametra rowspan. Skupina '{$part}' ne obstaja", 7710003);
                }
            } else if (!is_int($part)) {
                throw new MaxException("Neuspešno resolvanje parametra rowspan. Neznan argument '{$part}'", 7710004);
            }
        }
        return array_sum($parts) ?: 1;
    }
    
    private function extractGroupData($group, $entity) {
        $arrays = []; // katere celice so array
        $data = [];   // tabela
        
        // podatke tabeliramo v $data[row][cell]
        foreach ($group as $key => $cell) {
            $col = $this->getField($cell, $entity);
            if (is_array($col)) {
                $arrays[] = $key;
            } else {
                $col = [$col];
            }
            
            foreach ($col as $i => $value) {
                if ($cell->getRepeat() === null) {
                    $data[$i][$key] = $value;
                }
            }
        }
        
        // prazne celice
        foreach ($arrays as $key) {
            for ($i = 0; $i < count($data); $i++) {
                if (!array_key_exists($key, $data[$i])) {
                    $data[$i][$key] = null;
                }
            }
        }
  
        // odstranimo vrstice kjer so vse celice null
        $data = array_filter($data, function($row) {
            foreach ($row as $value) {
                if ($value !== null) { return true; }
            }
            return false;
        });
        
        // elemente ki imajo 'repeat' ponovimo v vsaki vrstici
        $result = [];
        foreach ($group as $key => $cell) {
            $repeatKey = $cell->getRepeat();
            $repeatValue = $repeatKey ? $this->getField($cell, $entity) : null;
            
            for ($i = 0; $i < count($data); $i++) {
                // kopiramo polje če obstaja
                if (array_key_exists($key, $data[$i])) {
                    $result[$i][$key] = $data[$i][$key];
                }
                
                // ponovimo 'repeat' celice
                if ($repeatKey) {
                   if (isset($data[$i][$repeatKey])) {
                        $result[$i][$key] = $repeatValue;
                    } else {
                        $result[$i][$key] = null;
                    } 
                }
                
            }
        }
        
        return $result;
    }

    private function makeCell(TableCell $cell, $value) {
        if (is_object($value)) {
            // če je $value entiteta, dobimo iz nje string vrednost
            $value = $this->getField($cell, $value);
        }
        
        return $this->makeEl('td', $value, [
            'colspan' => $cell->getColspan(),
            'rowspan' => $cell->getRowspan(),
            'class' => $cell->getFullClassString(),
            'style' => $this->resolveAlignment($cell)
        ]);
    }

    /**
     * @param TableCell $cell
     * @param array $entities
     * @return string
     */
    private function makeFinalCell(TableCell $cell, $entities) {
        $final = null;
        $func = $cell->getFinal();
        if ($func) {
            foreach ($entities as $entity) {
                $value = $this->get($entity, $cell->getField(), ['format' => false]);
                $final = $func($final, $value, $entity);
            }
        }
        
        $value = $this->format($final, $cell->getType());
        $class = $cell->getFullClassString();
        
        return $this->makeEl('td', $value, [
            'class' => "cell-type-final {$class}"
        ]);
    }
    
    private function getField(TableCell $cell, $entity) {
        return $this->get($entity, $cell->getField(), ['type' => $cell->getType()]);
    }
    
    private function getDiscriminatorField($entity) {
        return $this->get($entity, $this->def->getDiscriminator(), ['lookup' => 'ident']);
    }
    
    private function groupEntities($entities) {
        $result = [];
        $group = [];
        $prev = null;
        
        if (!$this->def->getDiscriminator()) { return [$entities]; }
        
        // grupiraj po diskriminatorju
        foreach ($entities as $i => $entity) {
            $value = $this->getDiscriminatorField($entity);
            
            if ($i !== 0 && $value != $prev) {
                $result[] = $group;
                $group = [];
            }
            
            $group[] = $entity;
            $prev = $value;
        }
        
        // če ostane neobravnavana skupina jo daj
        if (!empty($group)) { $result[] = $group; }
        
        return $result;
    }


    /**
     * Ustvari html element
     *
     *  $tf->makeEl('div', 'Vsebina', ['class' => 'neke']);
     *  $tf->makeEl('div', 'Vsebina');
     *  $tf->makeEl('div', ['class' => 'neke']);
     *  $tf->makeEl('br');
     *
     * @param string $el    html element
     * @param string $arg1  vrednost
     * @param array $arg2   html argumenti
     * @return string
     */
    public function makeEl($el, $arg1 = null, $arg2 = [])
    {
        $value = null;
        $args = null;

        if (is_array($arg1)) {
            $args = $arg1;
        } else {
            $value = $arg1;
            $args = $arg2;
        }

        // začetek elementa
        $html = "<{$el}";

        // atributi
        foreach ($args as $k => $v) {
            if ($v !== null) {
                $html .= " {$k}=\"{$v}\"";
            }
        }
        $f = new StripTags(['allowTags' => ['sub', 'sup', 'br', 'p', 'strong', ]]);
        if ($value === null) {
            // konec elementa brez vrednosti
            $html .= ' />';
        } else {
            // konec elementa z vrednostjo
            $html .= '>';
            $html .= $f->filter($value);
            $html .= "</{$el}>";
        }

        return $html;
    }


    /**
     * Extracta field iz entitete po stringu ali funkciji
     *
     * Opcije:
     *  - format: ali formatiramo v string ali vrnemo tako kot je
     *  - type: tip formatiranja
     *  - lookup: po katerem polju delamo lookup (label / ident)
     *
     * $value = $tf->get($entity, 'maticna');
     * $value = $tf->get($entity, 'maticna.sifra');
     * $array = $tf->get($entityArray, 'collection.field');
     * $mixed = $tf->get($entity, function($entity) { return $entity->getFoo(); });
     *
     * @param mixed $entity entiteta ali hash table ali seznam teh
     * @param string $arg pot do fielda
     * @param array $options
     * @return mixed
     */
    public function get($entity, $arg = '', $options = [])
    {
        if ($entity === null) {
            return null;
        }

        $options = array_merge([
            'format' => true,
            'type' => null,
            'lookup' => 'label',
        ], $options);

        $result = null;
        if (is_callable($arg)) {
            $result = $arg($entity);
        } else if (is_string($arg)) {
            $result = $this->resolveField($entity, $arg);
        } else {
            return null;
        }

        if ($result === null) {
            return null;
        }

        // če je rezultat entiteta, dodatno resolvamo po lookup anotaciji
        if ($options['lookup']) {
            if (is_array($result)) {
                if (isset($result[0]) && $result[0] instanceof Base) {
                    $result = array_map(function($x) use ($options) {
                        return $this->resolveLookup($x, $options['lookup']);
                    }, $result);
                }
            } else if ($result instanceof Base) {
                $result = $this->resolveLookup($result, $options['lookup']);
            }
        }

        // če imamo vključeno formatiranje, formatiramo v string
        if ($options['format']) {
            if (is_array($result)) {
                $result = array_map(function($x) use ($options) {
                    return $this->format($x, $options['type']);
                }, $result);
            } else {
                $result = $this->format($result, $options['type']);
            }
        }

        return $result;
    }


    /**
     * Formatira vrednost v string
     *
     * @param mixed $value      vrednost ki pretvarjamo
     * @param string $fromType  tip formatiranja, če ga ne podamo ga funkcija ugotovi sama
     * @param mixed $args       dodatni argumenti ki so poslani v closure, če je $value tipa function
     * @return string
     */
    public function format($value, $fromType = null, $args = null)
    {
        if ($value === '' || $value === null) {
            return '';
        }

        if (is_callable($value)) {
            return $this->format($value($args), $fromType, $args);
        }

        // formatiraj izpis
        switch ($fromType) {
            // doctrinovi tipi
            case 'string':
            case 'text':
                return (string) $value;
            case 'integer':
            case 'int':
                return (string) (int) $value;
            case 'decimal':
                return $this->num($value);
            case 'date':
                return $value->format('d.m.Y');
            // custom
            case 'pozicija':
                return (int) $value . '.';
        }

        // poskusi avtomatsko formatirati izpis
        if ($value instanceof \DateTime) {
            return $value->format('d.m.Y H:i');
        } else if (is_string($value)) {
            return $value;
        } else if (is_numeric($value) || is_object($value)) {
            return (string) $value;
        }

        return '';
    }

    /**
     * Formatiran izpis splošne številke
     * @param float $data
     * @param int $digits
     * @return string
     */
    public function num($data, $digits = 2)
    {
        $locale = \Locale::getDefault();

        $format = new \NumberFormatter($locale, \NumberFormatter::DECIMAL);
        $format->setAttribute(\NumberFormatter::FRACTION_DIGITS, $digits);
        return $format->format($data, \NumberFormatter::TYPE_DOUBLE);
    }


    /**
     * Pomožna funkcija za extractanje fielda iz entitete
     *
     * $value = $tf->resolveField($entity, 'maticna');
     * $value = $tf->resolveField($entity, 'maticna.sifra');
     * $array = $tf->resolveField($entityArray, 'collection.field');
     *
     * @param mixed $obj    entiteta ali hash table ali seznam teh
     * @param string $path  pot do fielda
     * @return mixed
     */
    public function resolveField($obj, $path)
    {
        if (!$obj) {
            return null;
        }
        if (!$path) {
            return $obj;
        }

        $parts = explode('.', $path);
        $first = $parts[0];
        $rest = implode('.', array_slice($parts, 1));

        if ($obj instanceof \Traversable) {
            $obj = iterator_to_array($obj);
        }

        $method = 'get' . ucfirst($first);
        if (is_array($obj)) {
            if (array_keys($obj) === range(0, count($obj) - 1)) {
                // array je sekvenčni (seznam elementov)
                return array_map(function($x) use ($method, $rest) {
                    return $this->resolveField($x->$method(), $rest);
                }, $obj);
            } else if (array_key_exists($path, $obj)) {
                // array je associativni (hash table propertijev)
                return $obj[$path];
            } else {
                return null;
            }
        } else if (method_exists($obj, $method)) {
            return $this->resolveField($obj->$method(), $rest);
        } else {
            return null;
        }
    }

    /**
     * Resolva entiteto po lookup metadata
     *
     * @param Object $entity
     * @param string $lookupType
     * @return mixed
     */
    public function resolveLookup($entity, $lookupType = 'label')
    {
        $sl = $this->serviceLocator->getServiceLocator();
        $em = $sl->get('doctrine.entitymanager.orm_default');

        $class = get_class($entity);
        $rep = $em->getRepository($class);
        $rep->setServiceLocator($sl);

        $lookup = $rep->getMeta()->getLookup();
        $field = $lookup->$lookupType;
        $method = 'get' . ucfirst($field);

        if (method_exists($entity, $method)) {
            return $entity->$method();
        } else {
            return null;
        }
    }
}