<?php

namespace Max\Form;
/*
 * Vmesnik, ki ga implementirajo fieldseti, elementi in forme, da jim lahko povemo
 * ali gre za change ali new operacijo
 *
 * @author boris
 */
interface FormModeInterface {

    public function getMode();

    public function setMode($value);
    
}


