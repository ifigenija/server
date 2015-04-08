<?php

/**
 * (copyleft) Licenca
 */

namespace Max\Repository;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\UnitOfWork;
use DoctrineModule\Paginator\Adapter\Collection;
use Max\Ann\EntityMetadata;
use Max\Entity\Base;
use Max\Exception\MaxException;
use Max\Filter\StripEntity;
use Max\Stdlib\Hydrator\Json;
use stdClass;
use Zend\Paginator\Adapter\AdapterInterface;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use ZfcRbac\Service\AuthorizationService;

/**
 * AbstractMaxRepository implementira metode iz PagingInterface in LookupInterface.
 * To so privzete implementacije, ki imajo odvisnost v anotacijah.
 * Za entiteo priskrbi metapodatke iz metadata-factoy
 *
 * @author Boris Lašič <boris@max.si>

 */
class AbstractMaxRepository
        extends EntityRepository implements CrudInterface
{

    use \Zend\ServiceManager\ServiceLocatorAwareTrait;

use \Max\Expect\ExpectTrait;

    /**
     * Metadata helper odgovoren za to entiteto
     *
     * @var EntityMetadata
     */
    protected $meta;

    /**
     * Service za authorizacije 
     * 
     * @var AuthorizationService
     */
    protected $auth;

    /**
     * Service za authorizacije 
     * Konfiguracija seznama, ki pride iz controllerja 
     * 
     * @var array
     */
    protected $paginatorConfig;

    /**
     * Išče seznam entitet po ključih.
     *
     * @param array<string> $ids seznam id-jev
     * @param boolean $filer Filtriraj v seznam za lookup
     */
    public function findByIds($ids, $filter = false)
    {
        $qb = $this->createQueryBuilder('qb');

        $qb->andWhere($qb->expr()->in('qb.id', $ids));

        return $qb->getQuery()->getResult();
    }

    /**
     * 
     * 
     * @param array $options filter opcije
     * @param string $name ime paginatorja
     * @return AdapterInterface
     */
    public function getPaginator(array $options, $name = "default")
    {
        return new Collection(new ArrayCollection($this->findAll()));
    }

    /**
     * Nastavi sort za dotični paginator
     * $sort je lahko string z imenom polja ali pa sort objekt
     *
     * @param string|stdObject $sort
     * @param string $direction
     * @param string $name
     */
    public function setSort($srt, $direction, $name = 'default')
    {
        $getAlias = function ($field) use ($name) {
            if (isset($this->sortOptions[$name][$field]['alias'])) {
                return $this->sortOptions[$name][$field]['alias'];
            } else {
                return $field;
            }
        };

        if (strtolower($direction) == 'up') {
            $direction = 'ASC';
        }
        if (strtolower($direction) == 'down') {
            $direction = 'DESC';
        }
        if (isset($this->sortOptions[$name])) {
            if (is_object($srt)) {
                if (array_key_exists($srt->field, $this->sortOptions[$name])) {
                    $sort = new stdClass();
                    $sort->order = $getAlias($srt->field);
                    $sort->dir = $direction;
                    $sort->field = $srt->field;

                    $this->paginatorSort[$name] = $sort;
                }
            } else {
                if ($srt == null) {
                    $a = array_keys($this->sortOptions[$name]);
                    $srt = array_shift($a);
                }
                $sort = new stdClass();
                $sort->order = $getAlias($srt);
                $sort->dir = isset($this->sortOptions[$name][$srt]['dir']) ? $this->sortOptions[$name][$srt]['dir'] : $direction;
                $sort->field = $srt;
                $this->paginatorSort[$name] = $sort;
            }
        } else {
            throw new MaxException('Sort opcije ne obstajajo', 'TIP-CRD-296');
        }

        return $this;
    }

    /**
     * Vrni trenutni sort - če sort ni nastavljen, potem nastavi sort po prvem polju
     * v $this->sortOptions[$name].
     *
     * @param string $name
     * @return \stdClass;
     */
    public function getSort($name = 'default')
    {
        if (!isset($this->paginatorSort[$name])) {
            if (!isset($this->sortOptions[$name])) {             
                throw new MaxException('Sort opcije manjkajo', 1000077);
            }
            $keys = array_keys($this->sortOptions[$name]);
            $firstField = reset($keys);
            $sort = new stdClass();
            $sort->field = $firstField;

            if (isset($this->sortOptions[$name][$firstField]['dir']))
                $sort->dir = $this->sortOptions[$name][$firstField]['dir'];
            else
                $sort->dir = 'ASC';

            if (!($sort->dir === 'ASC' || $sort->dir === 'DESC'))
                $sort->dir = 'ASC';

            $sort->order = $this->sortOptions[$name][$firstField]['alias'];
            $this->paginatorSort[$name] = $sort;
        }
        $clone = clone $this->paginatorSort[$name];
        $clone->options = $this->getSortOptions($name);
        return $clone;
    }

    public function getSortJson($name = 'default')
    {
        $s = $this->getSort($name);
        return [
            'sortKey' => $s->field,
            'order' => strtolower($s->dir)
        ];
    }

    /**
     * vrne "order by .
     * ..." string s trenutnim sortom, ki suporablja
     * pri genriranju paginatorjev.
     */
    public function getOrderString($name = 'default')
    {
        $sort = $this->getSort($name);
        return "Order by $sort->order $sort->dir";
    }

    /**
     * Opravila pri ustvarjanju nove entitete
     * 
     * @param Base $object
     */
    public function create($object)
    {
        $this->expectNew($object);
        $this->validate($object, 'create');
        $this->getEntityManager()->persist($object);
    }

    /**
     * Preveri če je entiteta nova ali pa je že upravjanja v entity managerju
     * 
     * @param Base $object  
     */
    public function expectNew(Base $object)
    {
        $isNew = UnitOfWork::STATE_NEW === $this->getEntityManager()->getUnitOfWork()->getEntityState($object);
        $this->expect($isNew, 'Entiteta ni nova', 1000032);
    }

    /**
     * Privzeti postopek posodabljanja 
     * preveri avtorizacijo in 
     * 
     * @param Base $object
     */
    public function update($object)
    {
        $this->validate($object, 'update');
    }

    /**
     * Privzeti postopek brisanja
     * preverimo avtorizacijo in predpogoje brisanja
     * 
     * @param Base $object
     */
    public function delete($object)
    {
        if (method_exists($object, $lahko_brisem)) {
            $object->lahkoBrisem();
        }
        $this->getEntityManager()->remove($entity);
    }

    /**
     * Privzeta validacija se izvede preko metode, ki je implementirana na 
     * entitetit
     * 
     * @param Base $object
     * @param string $mode
     */
    public function validate($object, $mode = 'update')
    {
        if (method_exists($object, 'validate')) {
            $object->validate($mode);
        }
    }

    /**
     * Preveri avtorizacijo v kontekstu objekta 
     * @param string $perm
     * @param Base $object
     */
    public function expectAuthorized($perm, $object, $code = 1000034)
    {
        
        $this->expect($this->auth->isGranted($perm, $object), 'Ni dostopa ' . $perm, $code);
    }

    function getMeta()
    {
        return $this->meta;
    }

    function getAuth()
    {
        return $this->auth;
    }

    function getPaginatorConfig()
    {
        return $this->paginatorConfig;
    }

    function setMeta(EntityMetadata $meta)
    {
        $this->meta = $meta;
    }

    function setAuth(AuthorizationService $auth)
    {
        $this->auth = $auth;
    }

    function setPaginatorConfig($paginatorConfig)
    {
        $this->paginatorConfig = $paginatorConfig;
    }


}
