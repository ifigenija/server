<?php

use Max\Exception\MaxException;

/*
 * Licenca GPL V3 or later
 *  
 */

namespace Max\Expect;

/**
 * TRait za expect funckcionalnost  
 * Inspirirano z asserti v testing frameworkih 
 *
 * @author boris
 */
trait ExpectTrait
{

    /**
     * Osnovni expect statement. pričakujem resnico Če resnice ni 
     * izpolnjena potem sprožim exception 
     * 
     * @param bool $truth
     * @param string $message
     * @param type $code
     * @throws MaxException
     */
    protected function expect($truth, $msgFormat, $code = 970001, $params = [])
    {
        if (!$truth) {

            if ($params) {
                $msg = vsprintf($msgFormat, $params);
            } else {
                $msg = $msgFormat;
            }
            throw new \Max\Exception\MaxException($msg, $code);
        }
    }

}
