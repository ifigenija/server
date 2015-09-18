<?php

namespace TestAssets\Task;

use Jobs\Task\AbstractTask;

use Jobs\Annotation\Task as Task;
/**
 * 
 * @Task\Meta(name="dummy task", acl="test.acl.xx")
 *
 */
class DummyTestTask
    extends AbstractTask
{

    public function taskBody()
    {
       if ($this->data['podatek'] == 'sproziNapako') {
           throw new \Exception('napaka izvajanje');           
       }
    }

    public function checkData()
    {
       if ($this->data['podatek'] == 'napakaPriPreverjanjuPodatkov' ) {
           throw new \Exception('napaka preverjanje');
       }
       
    }

}
