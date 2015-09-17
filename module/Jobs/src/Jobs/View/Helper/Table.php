<?php

namespace Jobs\View\Helper;

use Max\Exception\MaxException;
use Jobs\Printing\Model\TableModel;
use Jobs\Printing\Model\TableCell;
use Traversable;
use Zend\I18n\Translator\Translator;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\ServiceManager\ServiceLocatorAwareTrait;
use Zend\View\Helper\AbstractHelper;

class Table extends AbstractHelper implements ServiceLocatorAwareInterface {

    use ServiceLocatorAwareTrait;
    
    /**
     * @var Table
     */
    protected $def;
    
    /**
     * @var Tipformat
     */
    protected $tf;
    
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
        
        $this->tf = $this->view->plugin('tipformat');
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
        $value = $this->tf->format($this->def->getTitle(), null, $entities);
        return $this->tf->makeEl('caption', $this->tr->translate($value));
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
        $value = $this->tf->format($this->def->getHeaderTitle(), null, $entities);
        $header = $this->tf->makeEl('th', $this->tr->translate($value), [
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
        return $this->tf->makeEl('th', $this->tf->format($this->tr->translate($cell->getTitle())), [
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
        return $this->tf->makeEl('col', [
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
                    $html .= $this->tf->makeEl('td', $value, [
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
        
        return $this->tf->makeEl('td', $value, [
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
                $value = $this->tf->get($entity, $cell->getField(), ['format' => false]);
                $final = $func($final, $value, $entity);
            }
        }
        
        $value = $this->tf->format($final, $cell->getType());
        $class = $cell->getFullClassString();
        
        return $this->tf->makeEl('td', $value, [
            'class' => "cell-type-final {$class}"
        ]);
    }
    
    private function getField(TableCell $cell, $entity) {
        return $this->tf->get($entity, $cell->getField(), ['type' => $cell->getType()]);
    }
    
    private function getDiscriminatorField($entity) {
        return $this->tf->get($entity, $this->def->getDiscriminator(), ['lookup' => 'ident']);
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
    

}