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

    /**
     * Pošlje vsebino html ali seznam v mPdf
     *
     * @param $docs
     * @param $tmpl
     * @return string
     *
     */
    public function printOut($docs, $tmpl)
    {

        $config = $this->getServiceLocator()->get('Config');
        if (!empty($config['tip']['debug_print_html'])) {
            $this->debug = $config['tip']['debug_print_html'];
        }

        if (is_string($docs)) {
            $docs = [$docs];
        }

        $printer = new \mPDF();

        if ($tmpl) {
            $printer->SetImportUse();
            $printer->SetDocTemplate($tmpl, true);
        }

        foreach ($docs as $html) {

            $printer->WriteHTML($html);

            if ($this->debug) {
                $file = tempnam(sys_get_temp_dir(), 'html_');
                file_put_contents($file, $html);
                chmod($file, 0777);
            }
        }

        $out_file = tempnam(sys_get_temp_dir(), 'pdf_');
        $printer->Output($out_file, 'F');

        return $out_file;
    }

}
