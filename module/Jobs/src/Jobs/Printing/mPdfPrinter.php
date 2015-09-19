<?php

namespace Jobs\Printing;

use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\ServiceManager\ServiceLocatorAwareTrait;

class mPdfPrinter
    implements ServiceLocatorAwareInterface
{

    use ServiceLocatorAwareTrait;

    private $cleanup = [];
    private $debug = false;
    private $printer = null;

    function __destruct()
    {
        foreach ($this->cleanup as $file) {
            if (is_file($file)) {
                if (!$this->debug) {
                    unlink($file);
                }
            }
        }
    }

    public function getMPdf()
    {
        if ($this->printer === null) {
            $this->printer = new \mPDF();
        }
        return $this->printer;
    }

    /**
     * Pošlje vsebino html ali seznam v mPdf
     *
     * @param string $html
     * @param string $tmpl
     * @return boolean
     *
     */
    public function printOut($html, $tmpl = null)
    {


        $printer = $this->getMPdf();

        if ($tmpl) {
            $printer->SetImportUse();
            $printer->SetDocTemplate($tmpl, true);
        }

        if ($this->debug) {
            $file = tempnam(sys_get_temp_dir(), 'html_');
            file_put_contents($file, $html);
            chmod($file, 0777);
        }
        $printer->WriteHTML($html);

        return true;
    }

    /**
     * Zaključi report, zapiše pdf in vrne ime datoteke
     * @return string
     */
    public function finishReport()
    {
        $out = tempnam(sys_get_temp_dir(), 'pdf_');
        $this->printer->Output($out, 'F');
        $this->printer = null;
        return $out;
    }

    /**
     * @return boolean
     */
    public function isDebug()
    {
        return $this->debug;
    }

    /**
     * @param boolean $debug
     */
    public function setDebug($debug)
    {
        $this->debug = $debug;
    }




}
