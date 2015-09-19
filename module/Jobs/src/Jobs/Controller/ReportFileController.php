<?php
/**
 * Created by PhpStorm.
 * User: boris
 * Date: 18. 09. 15
 * Time: 15.23
 */

namespace Jobs\Controller;


use Jobs\Entity\Report;
use Max\Controller\Traits\EntityTrait;
use Max\Controller\Traits\JsonErrorsTrait;
use Max\Exception\ParamsException;
use Max\Exception\UnauthException;
use Zend\Http\Headers;
use Zend\Http\Response\Stream;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class ReportFileController extends AbstractActionController
{

    use EntityTrait;
    use JsonErrorsTrait;


    /**
     * Akcija za download reporta
     *
     * @return Stream
     * @throws ParamsException
     * @throws UnauthException
     */
    public function prenesiAction()
    {
        $id = $this->params()->fromRoute('id');
        if (!$id) {
            throw new ParamsException('Id je obvezen!', 7700601);
        }
        /* @var $dr \Jobs\Repository\Reports */
        $dr = $this->getRepository('Jobs\Entity\Report');

        /** @var Report $object */
        $object = $dr->find($id);

        if (!$object) {
            $this->response->setStatusCode(404);
            throw new ParamsException('Poročilo ne obstaja', 7700602);
        }

        $user = $object->getJob()->getUser();

        if ($user !== $this->getAuth()->getIdentity()) {
            if (!$this->isGranted('Job-admin')) {
                throw new UnauthException('Nimate dovoljenja za dostop do reporta', 7700604);
            }
        }

        $filename = ($object->getFileName());
        if (!file_exists($filename)) {
            $this->response->setStatusCode(404);
            return new ViewModel(['message' => 'Ne najdem datoteke v shrambi!']);
        }

        try {
            $object->countTransfer();
            $this->getEm()->flush();
        } catch (\Exception $e) {
            ;
        }
        $response = new Stream();
        $response->setStream(fopen($filename, 'r'));
        $response->setStatusCode(200);
        $response->setStreamName($object->getFilename());

        $headers = new Headers();

        if ($this->params()->fromQuery('download') == 1) {
            $headers->addHeaders([
                'Content-Disposition' => 'attachment; filename="' . $object->getFilename() . '"',
            ]);
        } else {
            $headers->addHeaders([
                'Content-Disposition' => 'inline; filename="' . $object->getFilename() . '"',
            ]);

        }
        $headers->addHeaders([
            'Content-Type' => $object->getFormat(),
            'Content-Length' => $object->getSize()
        ]);

        $response->setHeaders($headers);
        return $response;
    }

}
