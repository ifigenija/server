<?php

/*
 * Licenca GPL V3 or later
 *  
 */

namespace Max\Expect;

use Max\Consts;
use Max\Exception\MaxException;

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
    protected function expect($truth, $code = 970001, $msgFormat, $params = [])
    {
        if (!$truth) {

            if ($params) {
                array_unshift($params, $msgFormat);
                $msg = call_user_func(['\sprintf', $params]);
            } else {
                $msg = $msgFormat;
            }
            throw new MaxException($msg, $code);
        }
    }

}
