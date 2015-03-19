<?php

/**
 * (copyleft) Licenca
 */

namespace Aaa\Navigation;

/**
 *
 *
 */
class Role extends Toolbar
{

    public function getUrediDovoljenjaPages()
    {
        $this->aaaAction('uredi', 'Uredi vloge');
        return parent::getUrediPages();
    }

    public function getPregledPages()
    {
        $this->aaaAction('uredi', 'Uredi');
        $this->aaaAction('urediDovoljenja', 'Uredi dovoljenja');
        return parent::getPregledPages();
    }

    public function getUrediPages()
    {
        $this->aaaAction('urediDovoljenja', 'Uredi dovoljenja');
        return parent::getUrediPages();
    }

}
