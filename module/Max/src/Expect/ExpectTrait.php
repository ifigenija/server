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
     * @param type $truth
     * @param type $message
     * @param type $code
     * @throws MaxException
     */
    protected function expect($truth, $message = '', $code = 'TIP-TASK-0000')
    {
        if (!$truth) {
            throw new MaxException("Pogoj: {$message}", $code);
        }
    }

    /**
     * Preveri avtorizacijo za akcijo na objektu, glede na vrsto entitete
     * @param string $id
     * @param string $message sporočilo ob napaki 
     * @param string $code koda napake 
     */
    protected function expectUUID($id, $message, $code)
    {
        $match = preg_match(Consts::UUID_RE, $id);
        $this->expect($match, $message, $code);
    }
}
