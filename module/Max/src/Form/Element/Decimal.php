<?php

namespace Tip\Form\Element;

use Zend\Form\Element\Text;
use Zend\InputFilter\InputProviderInterface;
use Zend\Validator\NotEmpty;
use Zend\Validator\StringLength;

/**
 * Description of Daterange
 *
 * @author boris
 */
class Decimal extends Text implements InputProviderInterface {

    /**
     * Seed attributes
     *
     * @var array
     */
    protected $attributes = [
        'type' => 'text',
        'class' => 'decimal-polje'
    ];
    protected $validators;

    /**
     *
     * @var \Doctrine\ORM\Mapping\ClassMetadata;
     */
    protected $metadata;

    protected function getValidators() {

        if (null === $this->validators) {
            $chain = new \Zend\Validator\ValidatorChain();

            if ($this->options['required']) {
                $chain->addValidator(new NotEmpty(), true);
            }


            $chain->addValidator(new \Zend\I18n\Validator\Float(), true);


            $this->validators = $chain;
        }
        return $this->validators;

        return;
    }

    /**
     * Nastavi opcije za polje decimal.
     * Privzeto je to ikona asterisk in required
     *
     * @param  array|\Traversable $options
     * @return ElementInterface
     */
    public function setOptions($options) {
        parent::setOptions($options);

        if (!isset($this->options['required'])) {
            $this->options['required'] = true;
        }

        if (!isset($this->options['prependIcon'])) {
            $this->options['prependIcon'] = 'icon-asterisk';
        }

        if (!isset($this->options['positive'])) {
            $this->options['positive'] = 'true';
        }

        $this->setAttribute('data-attach', 'spinner');
        return $this;
    }

    /**
     * Provide default input rules for this element
     *
     * Attaches the captcha as a validator.
     *
     * @return array
     */
    public function getInputSpecification() {
        $locale = \Locale::getDefault();
        $spec = [
            'name' => $this->getName(),
            'filters' => [
                new \Zend\I18n\Filter\NumberParse($locale)
            ],
            'required' => $this->getOption('required'),
            'validators' => $this->getValidators()
        ];

        return $spec;
    }

    public function setValue($value) {

        $locale = \Locale::getDefault();
        $format = new \NumberFormatter($locale, \NumberFormatter::DECIMAL);
        $format->setAttribute(\NumberFormatter::MIN_FRACTION_DIGITS, 2);
        if (intl_is_failure($format->getErrorCode())) {
            throw new Exception\InvalidArgumentException("Invalid locale string given");
        }

        if (is_numeric($value)) {
            $this->value = $format->format($value);
        } elseif (is_string($value) && strlen($value) > 0) {
         //   echo $this->getName() . ' ' . $value .PHP_EOL;
            $parsedFloat = $format->parse($value, \NumberFormatter::TYPE_DOUBLE);
            if (intl_is_failure($format->getErrorCode())) {
                throw new \InvalidArgumentException($this->getName() . ': Vrednost ni decimalna');
            }

            $decimalSep = $format->getSymbol(\NumberFormatter::DECIMAL_SEPARATOR_SYMBOL);
            $groupingSep = $format->getSymbol(\NumberFormatter::GROUPING_SEPARATOR_SYMBOL);

            $valueFiltered = str_replace($groupingSep, '', $value);
            $valueFiltered = str_replace($decimalSep, '.', $valueFiltered);

            while (strpos($valueFiltered, '.') !== false && (substr($valueFiltered, -1) == '0' || substr($valueFiltered, -1) == '.')
            ) {
                $valueFiltered = substr($valueFiltered, 0, strlen($valueFiltered) - 1);
            }

            if (strval($parsedFloat) !== $valueFiltered) {
                throw new \InvalidArgumentException('Vrednost ni decimalna');
            }

            $this->value = $value;
        } else {
            $this->value = null;
        }
    }

}


