<?php

namespace Tip\Form\Element;

use Tip\Filter\IsoDateFilter;
use Zend\Filter\Null;
use Zend\Form\Element\Date as ZendDate;
use Zend\Validator\Callback;
use Zend\Validator\NotEmpty;
use Zend\Validator\ValidatorChain;

/**
 * Date polje, ki pretvori string v date objekt
 *
 * @author boris
 */
class Date
    extends ZendDate
{

    /**
     * Seed attributes
     *
     * @var array
     */
    protected $attributes = [
        'type' => 'date',
        'class' => 'datum-polje'
    ];
    protected $format = 'd.m.Y';

    protected function getDateValidators()
    {

        $chain = new ValidatorChain();
        if ($this->getOption('required')) {
            $chain->addValidator(new NotEmpty(), true);
        }
        $chain->addValidator(new Callback([$this, 'dateOrNull']));
        $this->validators = $chain;

        return $this->validators;
    }

    public function dateOrNull($value)
    {
        return is_a($value, '\DateTime') || $value === '' || $value === null;
    }

    public function setValue($value)
    {

        parent::setValue($value);
    }

    /*
     * Set options for an element. Accepted options are:
     * - label: label to associate with the element
     * - label_attributes: attributes to use when the label is rendered
     * - format: datetime format - php format value
     *
     * @param  array|\Traversable $options
     * @return DateTime|ElementInterface
     */

    public function setOptions($options)
    {

        parent::setOptions($options);
        if (isset($this->options['format'])) {
            $this->setFormat($this->options['format']);
        }
        $this->setAttribute('data-attach', 'datepicker');
        $this->options['prependIcon'] = 'icon-calendar';


        return $this;
    }

    /**
     * Provide default input rules for this element
     *
     * Attaches the captcha as a validator.
     *
     * @return array
     */
    public function getInputSpecification()
    {
        $spec = [
            'name' => $this->getName(),
            'filters' => [
                ['name' => 'StringTrim'],
                new IsoDateFilter(),
                new Null([Null::TYPE_BOOLEAN]),
            ],
            'required' => $this->getOption('required'),
            'validators' => $this->getDateValidators()
        ];

        return $spec;
    }

    public function getValue($returnFormattedValue = true)
    {
        $value = parent::getValue();
        if ($value instanceof PhpDateTime) {
            if ($returnFormattedValue) {
                return $value->format($this->getFormat());
            }
            return $value;
        } else {
            if (is_string($value)) {
                if (!empty($value)) {
                    $f = new IsoDateFilter();
                    $date = $f->filter($value);
                    return $returnFormattedValue ? $date->format($this->getFormat()) : $date;
                } else {
                    return '';
                }
            }
        }
    }

}
