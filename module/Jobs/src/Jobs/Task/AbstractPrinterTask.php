<?php

namespace Jobs\Task;

use DateTime;
use Max\Consts;
use Max\Exception\MaxException;
use Tip\Printing\Cups;
use Tip\Printing\Model\TableModel;
use Tip\Printing\mPdfPrinter;
use Tip\Repository\Popa;
use Zend\I18n\Translator\Translator;
use Zend\Mvc\Service\ViewHelperManagerFactory;
use Zend\ServiceManager\ServiceLocatorInterface;
use Zend\View\Model\ViewModel;
use Zend\View\Renderer\PhpRenderer;
use Zend\View\Resolver\AggregateResolver;
use Zend\View\Resolver\TemplateMapResolver;
use Zend\View\Resolver\TemplatePathStack;

abstract class AbstractPrinterTask
    extends AbstractTask
{

    /**
     * @var PhpRenderer
     */
    protected $renderer;

    /**
     *
     * @var boolean
     */
    protected $multiple = false;

    /**
     * Vsebine vseh renderiranih reportov
     * 
     * @var array
     */
    protected $html = [];

    /**
     * pdf template za report (ozadje)
     * 
     * @var string
     */
    protected $tmpl = '';

    /**
     * Ali naj report pošljemo neposredno v tiskanje 
     * @var boolean
     */
    protected $sendToPrinter = false;

    /**
     * Id tiskalnika iz \Tip\Entity\Tiskalnik
     * @var string
     * 
     */
   protected $printerId = '';

    /**
     * 
     * Ali naj naredimo pdf in ga pripnemo na na Job, ki je sprožil tiskanje 
     * 
     * @var boolean
     */
    protected $makePdf = true;

    public function setServiceLocator(ServiceLocatorInterface $serviceLocator)
    {
        parent::setServiceLocator($serviceLocator);
        return $this;
    }

    /**
     * Ustvari PDF report iz vzorca definiranega v Tdok entitete
     *
     * @param string $templateName ime predloge dokumenta
     * @param string $title naslov tabele - array dven elementov [vrsta-dokumenta, številka]
     * @param object $entity entiteta
     * @param array $vars seznam spremenljivk ki jih pošljemo v view
     * @return bool|string
     * @throws MaxException
     */
    public function addDocumentReport($templateName, $title, $entity, $vars = [])
    {
        $template = $dokr->getTemplate($templateName);
        if (!$template) {
            $template = $this->getFallbackDocumentTemplate($templateName);
        }
        
        $this->setTmpl($dokr->getBckpdf($tdok));
        // če imam template za ozadje, ne potrebujem headerja in footerja
        $isHeaderFooter = !$this->tmpl;
             
        $variables = array_merge([
            '_tpl' => $template,
            'ishf' => $isHeaderFooter,
            '_css' => $dokr->getStyle($tdok),
            'firma' => $this->getFirma(),
            'orientation' => $tdok->getOrientation(),
            'margins' => explode(",", $tdok->getPagemargins()),
            'pageSize' => $tdok->getPageSize(),
            'title' => $title,
            'model' => $entity,
            'date' => new DateTime()
            ], $vars);

        
        $this->render('printlayout/document', $variables);

        if (!$this->multiple) {
            return $this->finishReport($title);
        }
        return false;
    }

    protected function getTdok($entity)
    {
        return $entity->getDok();
    }

    /**
     *  Ustvari PDF report iz tabele
     *
     * @param array $title naslov reporta
     * @param TableModel $table definicija tabele
     * @param array $entities seznam entitet (podatki)
     * @param array $vars seznam spremenljivk ki jih pošljemo v template
     * @return bool|string
     */
    public function addTableReport($title, $table, $entities, $vars = [])
    {
        $variables  = array_merge([
            'title' => $title,
            'date'  => new DateTime(),
            'entities' => $entities,
            'firma' => $this->getFirma(),
            'table' => $table
            ], $vars);

        $this->render('printlayout/table', $variables);
        if (!$this->multiple) {
            return $this->finishReport($title);
        }
        return false;
    }

    /**
     * Doda html za izpis v finish metodi
     *
     * @param $html
     *
     */
    public function addHtml($html)
    {
        $this->html[] = $html;
    }

    /**
     * Ustvari PDF report (izriše izpolnjen template, in doda report)
     *
     * @param string $template pod to templatea za izpis
     * @param array $vars seznam spremenljivk ki jih pošljemo v template
     * @throws \Exception
     *
     *
     */
    public function render($template, $vars)
    {
        // nastavim language za report
        // default implementacija ne prestavi ničesar, samo vrne trenutni jezik
        $old = $this->setTranslatorLocale($this->getReportLocale());

        $model = new ViewModel();
        $model->setTemplate($template);
        $model->setVariables($vars);

        if (!$this->renderer) {
            $this->renderer = $this->getRenderer();
        }
        $modelHelper = $this->renderer->plugin('view_model');
        $modelHelper->setRoot($model);

        // Zgeneriramo HTML in ga dodamo v vrsto za izpise 
        $this->addHtml($this->renderer->render($model));

        // vrnem originalni locale nazaj 
        $this->setTranslatorLocale($old);
    }

    /**
     *
     * @param string $title
     * @return bool|string
     */
    public function finishReport($title)
    {
       /** 
        * 
        * Iz html naredimo PDF dokument
        * @var $pdfPrinter mPdfPrinter 
        * 
        */
        $pdfPrinter = $this->getServiceLocator()->get('mpdf.printer');

        if (is_array($title)) {
            $titlestr = $title[0] . $title[1];
        } else {
            $titlestr = $title;
        }
            
        $path = $pdfPrinter->printOut($this->html, $this->tmpl);
        try {
            $date = new DateTime();

            $name = $this->escapeFilename($titlestr);
            $filename = "{$name}_{$date->format('Ymd')}.pdf";


            // če je zahtevan izpis potem pošljemo pripravljen pdf na tiskalnik
            if ($this->getSendToPrinter()) {
                $this->sendToPrinter($this->getPrinterId(), $path);
            }

            // če je zahtevana izdelava pdf-ja, potem pdf pripnemo na 
            // job. Pdf je tako ali tako že narejen.
            if ($this->getMakePdf()) {
                $this->addReport("{$titlestr} {$date->format('d.m.Y')}", [
                    'name' => $path,
                    'type' => 'application/pdf'
                    ], $filename);
            }
            $out = false;
        } catch (\Exception $e) {
            $out = $e->getMessage();
        } finally {
            // cleanup pdf datoteke, če ni bila prenešena na datoteko  
            if (is_file($path)) {
                unlink($path);
            }
        }
        return $out;
    }

    /**
     * Jezik spremenimo tako, da nastavimo locale v translator service;
     * @param string $locale če je locale prazen se ne zgodi nič
     * @return string Vrne locale, ki je bil nastavljen pred klicem 
     */
    public function setTranslatorLocale($locale = '')
    {
        /* @var $translator Translator */
        $translator = $this->serviceLocator->get('translator');
        $old = $translator->getLocale();
        if ($locale) {
            $translator->setLocale($locale);
        }
        return $old;
    }

    /**
     * Izvedeni razredi naj implementirajo to medodo, če morajo 
     * spremeniti jezik dokumenta 
     */
    protected function getReportLocale()
    {
        return null;
    }

    /**
     * Pošljemo datoteko na tiskalnik preko cups servisa
     * @param $tiskalnikId
     * @param $path
     */
    protected function sendToPrinter($tiskalnikId, $path)
    {
        /* @var $cups Cups */
        $cups = $this->serviceLocator->get('cups.printer');
        $cups->printDatoteka($tiskalnikId, $path);
    }

    /**
     * Vse znake pretvori v ASCII, simbole pa zamenja s podčrtajem (_)
     * 
     * @param string $name
     * @return string
     */
    public function escapeFilename($name)
    {
        $ascii = strtolower(iconv("UTF-8", "ASCII//TRANSLIT", $name));
        return preg_replace('/[^a-z0-9]+/i', '_', $ascii);
    }

    /**
     * Ustvari instanco PHP rendererja s konfiguriranimi potmi za predloge
     * @param null $dbPath
     * @return PhpRenderer
     */
    public function getRenderer($dbPath = null)
    {

        $renderer = new PhpRenderer();
        $resolver = new AggregateResolver();

        $renderer->setResolver($resolver);
        $config = $this->serviceLocator->get('Config');

        $templates = $config['report_renderer'];

        $stack = isset($templates['template_path_stack']) ? $templates['template_path_stack'] : [];

        if ($dbPath) {
            $stack[] = $dbPath;
        }

//        dodamo pot do predlog, ki so shranjene v bazi
//        array_unshift($stack, getcwd() . 'data/tmp/');

        $map = $templates['template_map'];

        $resolver->attach(new TemplateMapResolver($map))    // this will be consulted first
            ->attach(new TemplatePathStack(['script_paths' => $stack]));

        $factory = new ViewHelperManagerFactory();

        // naredimo nove instance helper managerja in 
        // prijavimo vse konfigurirane helperje
        // To je zato, ker je globalni view helper manager 
        // že injectan za rendererjem na view-ju in pride do 
        // konflikta 
        $helpers = $factory->createService($this->getServiceLocator());
        $config = $this->getServiceLocator()->get('Config');
        $helper_config = $config['view_helpers'];

        foreach ($helper_config['invokables'] as $name => $service) {
            $helpers->setInvokableClass($name, $service);
        }

        foreach ($helper_config['factories'] as $name => $factory) {
            $helpers->setFactory($name, $factory);
        }

        $renderer->setHelperPluginManager($helpers);

        return $renderer;
    }

    /**
     * Iz nastavitev potegne firmo za kateri delamo report
     * 
     * @return Popa
     */
    public function getFirma()
    {
        $nast = $this->getServiceLocator()->get('nastavitve.service');
        return $nast->getFirma();
    }

    /**
     * Poišče fallback template za dokument. Generira ime predloge iz $vrsta
     * proerty-ja na Tdok.
     *
     * @param Tdok $tdok
     * @return string
     * @throws MaxException
     */
    public function getFallbackDocumentTemplate(Tdok $tdok)
    {

        $sif = 'template-' . $tdok->getSifra();
        $bySifra = $this->renderer->resolver($sif);
        if ($bySifra) {
            return $sif;
        }

        $tip = 'template-' . $tdok->getVrsta();
        $byTip = $this->renderer->resolver($tip);
        if ($byTip) {
            return $tip;
        }

        // Če pridem do sem potem ne bo mogoče izpisati dokumenta
        throw new MaxException('Ne najdem predloge za dokument ' . $tdok->getVrsta(), 'TIP-PRT-0077');
    }

    /**
     *  Default implementacija checkData, 
     * ki skrbi za preverjanje podatkov o tem, kam se bo izpis odložil, ali se bo 
     * poslal neposredno na tiskalnik ali pa samo naredil pdf.  
     * 
     */
    public function checkData()
    {
        if (!empty($this->data['toPrinter'])) {
            if (preg_match(Consts::UUID_RE, $this->data['toPrinter'])) {
                $this->setSendToPrinter(true);
                if (!empty($this->data['makePdf'])) {
                    $this->makePdf = true;
                } else {
                    $this->makePdf = false;
                }
                $this->setPrinterId($this->data['toPrinter']);
            }
        }
    }

    public function getSendToPrinter()
    {
        return $this->sendToPrinter;
    }

    public function getPrinterId()
    {
        return $this->printerId;
    }

    public function getMakePdf()
    {
        return $this->makePdf;
    }

    public function setSendToPrinter($sendToPrinter)
    {
        $this->sendToPrinter = $sendToPrinter;
        return $this;
    }

    public function setPrinterId($printerId)
    {
        $this->printerId = $printerId;
        return $this;
    }

    public function setMakePdf($makePdf)
    {
        $this->makePdf = $makePdf;
        return $this;
    }

    public function getMultiple()
    {
        return $this->multiple;
    }

    public function getHtml()
    {
        return $this->html;
    }

    public function setMultiple($multiple)
    {
        $this->multiple = $multiple;
        return $this;
    }

    public function setHtml($html)
    {
        $this->html = $html;
        return $this;
    }

    public function setTmpl($tmpl)
    {
        $this->tmpl = $tmpl;
        return $this;
    }

    public function getTmpl()
    {
        return $this->tmpl;
    }

}
