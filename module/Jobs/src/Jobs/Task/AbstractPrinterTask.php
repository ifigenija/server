<?php

namespace Jobs\Task;

use DateTime;
use Max\Consts;
use Max\Exception\MaxException;
use Tip\Printing\Cups;
use Tip\Printing\Model\TableModel;
use Tip\Printing\mPdfPrinter;
use Tip\Repository\Popa;
use Zend\Config\Config;
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
     * pdf template za report (ozadje)
     *
     * @var string
     */
    protected $tmpl = '';

    /**
     * Ali naj naredimo html in ga pripnemo na na Job, ki je sprožil tiskanje
     * @var bool
     */
    protected $makeHtml = false;

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
        $template = $this->getTemplate($templateName);
        $config   = $this->getTemplateConfig($name);
        $this->setTmpl($config['background']);
        // če imam template za ozadje, ne potrebujem headerja in footerja
        $isHeaderFooter = !$this->tmpl;

        $variables = array_merge([
            '_tpl'        => $template,
            'ishf'        => $isHeaderFooter,
            '_css'        => '',
            'firma'       => $this->getFirma(),
            'orientation' => $config['orientation'],
            'margins'     => $config['margins'],
            'pageSize'    => $config['page_size'],
            'title'       => $title,
            'model'       => $entity,
            'date'        => new DateTime()
        ], $vars);


        $html = $this->render('printlayout/document', $variables, $title);

        return $this->printOut($html);
    }


    /**
     *  Ustvari PDF report iz tabele
     *
     * @param array $title naslov reporta
     * @param array $table definicija tabele
     * @param array $entities seznam entitet (podatki)
     * @param array $vars seznam spremenljivk ki jih pošljemo v template
     * @return bool|string
     */
    public function addTableReport($title, $table, $entities, $vars = [])
    {
        $variables = array_merge([
            'title'    => $title,
            'date'     => new \DateTime(),
            'entities' => $entities,
            'firma'    => $this->getFirma(),
            'table'    => $table
        ], $vars);

        $html = $this->render('printlayout/table', $variables, $title);
        return $this->printOut($html);

    }


    /**
     * Ustvari PDF report (izriše izpolnjen template, in doda report)
     *
     * @param string $template pod to templatea za izpis
     * @param array $vars seznam spremenljivk ki jih pošljemo v template
     * @param string $title
     * @return string
     * @throws \Exception
     */
    public function render($template, $vars, $title = 'report')
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
        $html = $this->renderer->render($model);

        // vrnem originalni locale nazaj 
        $this->setTranslatorLocale($old);

        if ($this->isMakeHtml()) {
            $file = tempnam(sys_get_temp_dir(), 'html_');
            file_put_contents($file, $html);
            chmod($file, 0777);
            $date = new DateTime();
            $t    = "{$title}_" . $date->format('d.m.Y') . "'.html'";
            $this->addReport($title, [
                'name' => $file,
                'type' => 'text/html'
            ], $title);
        }
        return $html;
    }

    /**
     *
     * @param string $html
     * @return string
     */
    public function printOut($html)
    {
        /**
         * @var $pdfPrinter \Jobs\Printing\mPdfPrinter
         */
        $pdfPrinter = $this->getServiceLocator()->get('mpdf.printer');

        try {
            $pdfPrinter->printOut($html, $this->getTmpl());
        } catch (\Exception $e) {
            return $e->getMessage();
        }
        return '';
    }

    /**
     * Zaključi report in naredi pdf, če je zahtevan
     * @param string $titlestr
     * @return string
     */
    public function finishReport($titlestr)
    {
        /**
         * @var $pdfPrinter \Jobs\Printing\mPdfPrinter
         */
        $pdfPrinter = $this->getServiceLocator()->get('mpdf.printer');

        $out = '';
        try {
            $date = new DateTime();
            $path = $pdfPrinter->finishReport();

            $name     = $this->escapeFilename($titlestr);
            $filename = "{$name}_{$date->format('Ymd')}.pdf";

            // če je zahtevana izdelava pdf-ja, potem pdf pripnemo na
            // job. Pdf je tako ali tako že narejen.
            if ($this->isMakePdf()) {
                $this->addReport("{$titlestr} {$date->format('d.m.Y')}", [
                    'name' => $path,
                    'type' => 'application/pdf'
                ], $filename);
            }
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
        $old        = $translator->getLocale();
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

        $resolver->attach(new TemplateMapResolver($map))// this will be consulted first
        ->attach(new TemplatePathStack(['script_paths' => $stack]));

        $factory = new ViewHelperManagerFactory();

        // naredimo nove instance helper managerja in 
        // prijavimo vse konfigurirane helperje
        // To je zato, ker je globalni view helper manager 
        // že injectan za rendererjem na view-ju in pride do 
        // konflikta 
        $helpers       = $factory->createService($this->getServiceLocator());
        $config        = $this->getServiceLocator()->get('Config');
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
        return new \App\Entity\Popa();
//        $nast = $this->getServiceLocator()->get('options.service');
//        $firma = $nast->getOptions('application.tenant.maticnopodjetje');
//        $rep = $this->em->getRepository('App\Entity\Popa');
//        return $rep->findOneBySifra($firma);
    }

    /**
     * Poišče fallback template za dokument. Generira ime predloge iz $vrsta
     * proerty-ja na Tdok.
     *
     * @param string $name
     * @return string
     * @throws MaxException
     */
    public function getTemplate($name)
    {
        if (!$this->renderer) {
            $this->renderer = $this->getRenderer();
        }
        $file = $this->renderer->resolver($name);
        if ($file) {
            return $name;
        }
        // Če pridem do sem potem ne bo mogoče izpisati dokumenta
        throw new MaxException('Ne najdem predloge za dokument ' . $name, 770008);
    }

    /**
     * Prbere konfiguracijo predloge iz konfiga aplikacije
     *
     * @param string $name
     * @return array
     */
    private function getTemplateConfig($name)
    {
        /** @var Config $cfg */
        $cfg = $this->getServiceLocator()->get('Config');

        $tempalteConfig = $cfg->report_template_config->get($name, []);
        $defaultConfig  = new Config([
            'orientation' => "Portrait",
            'page_size'   => "A4",
            'backgroud'   => ''
        ]);

        return $defaultConfig->merge($tempalteConfig)->toArray();
    }

    /**
     *  Default implementacija checkData, nastavi parametre makePdf in
     *
     */
    public function checkData()
    {
        if (!empty($this->data['makeHtml'])) {
            $this->makeHtml = true;
        } else {
            $this->makeHtml = false;
        }
        if (!empty($this->data['makePdf'])) {
            $this->makePdf = true;
        } else {
            $this->makePdf = false;
        }
    }

    /**
     * @return boolean
     */
    public function isMakePdf()
    {
        return $this->makePdf;
    }

    public function setMakePdf($makePdf)
    {
        $this->makePdf = $makePdf;
        return $this;
    }

    /**
     * @param string $tmpl
     * @return $this
     */
    public function setTmpl($tmpl)
    {
        $this->tmpl = $tmpl;
        return $this;
    }

    public function getTmpl()
    {
        return $this->tmpl;
    }

    /**
     * @return boolean
     */
    public function isMakeHtml()
    {
        return $this->makeHtml;
    }

    /**
     * @param boolean $makeHtml
     * @return AbstractPrinterTask
     */
    public function setMakeHtml($makeHtml)
    {
        $this->makeHtml = $makeHtml;
        return $this;
    }

}
