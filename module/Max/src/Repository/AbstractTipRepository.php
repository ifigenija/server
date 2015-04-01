<?php

/**
 * (copyleft) Licenca
 */

namespace Max\Repository;

use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Tools\Pagination\Paginator;
use Doctrine\ORM\UnitOfWork;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Annotation\EntityMetadata;
use Max\Entity\Base;
use Max\Exception\MaxException;
use Max\Filter\StripEntity;
use Max\Stdlib\Hydrator\Json;
use stdClass;
use Zend\Paginator\Paginator as Paginator2;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use ZfcRbac\Service\AuthorizationService;

/**
 * AbstractMaxRepository implementira metode iz PagingInterface in LookupInterface.
 * To so privzete implementacije, ki imajo odvisnost v anotacijah.
 * Za entiteo priskrbi metapodatke iz metadata-factoy
 *
 * @author Boris Lašič <boris@max.si>
 *         Ustvarjeno: 16.3.2013
 */
class AbstractMaxRepository
        extends EntityRepository
        implements ServiceLocatorAwareInterface
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
     * Sortirne opcije, združene v array po imenih.
     * ['default'=>[field => [alias, label]]
     * label ni nujen, če ima entitea polje s tem imenom.
     *
     * @var array
     */
    protected $sortOptions = [];

    /**
     * trenutno izbran sort order za dotične paginatorje.
     *
     * @var array
     */
    protected $paginatorSort = [];

    /**
     * trenutno izbran sort order za dotične paginatorje.
     *
     * @var array
     */
    protected $paginatorFields = [];

    /**
     *
     * @return \Max\Annotation\EntityMetadata;
     */
    public function getMeta()
    {
        if ($this->meta == null) {
            $f = $this->serviceLocator->get('entity.metadata.factory');
            $this->meta = $f->factory($this->getEntityName());
        }
        return $this->meta;
    }

    /**
     *
     * @return AuthorizationService
     */
    public function getAuthorizationService()
    {
        return $this->serviceLocator->get('ZfcRbac\Service\AuthorizationService');
    }

    /**
     * filtrira entiteto v lookup vrednost {id: xxx, ident: xxx, label: xxx}
     *
     * @param mixed $value Objekt, ki je instanca entitete z anotacijo lookup
     * @return array
     */
    public function filterForSelect($value)
    {

        $lookup = $this->getMeta()->getLookup();
        $ident = $this->resolveField($lookup->ident, $value);
        $label = $this->resolveField($lookup->label, $value);
        $ret = '';
        if ($ident) {
            $ret = $ident ? $ident . ($label ? ', ' . $label : '') : '';
        } else {
            $ret = $label ? : '';
        }

        return $ret;
    }

    /**
     * Vrne vrednost
     * @param type $name
     * @param type $value
     * @return type
     */
    public function resolveFieldMeta($name, $alias = '')
    {
        $meta = $this->getMeta();
        $map = $this->getClassMetadata();
        if (strpos($name, '.')) {
            list ($assoc, $field) = explode('.', $name);
            $assClass = $map->getAssociationTargetClass($assoc);
            if ($map->hasAssociation($assoc) && $map->isSingleValuedAssociation($assoc)) {
                $map = $this->getEntityManager()->getClassMetadata($map->getAssociationTargetClass($assoc));
            } else {
                throw new MaxException('Asociacija ne obstaja ', 'TIP-LKP-0006');
            }

            $f = $this->serviceLocator->get('entity.metadata.factory');
            $meta = $f->factory($assClass);
        } else {
            $field = $name;
        }

        if (!$meta->hasField($field)) {
            if (!$meta->getMapping()->hasAssociation($field) && !$meta->getMapping()->isSingleValuedAssociation($field) && !$map->getReflectionClass()->hasMethod('get' . ucfirst($name))) {
                throw new MaxException(
                "Razrešeno polje ne obstaja ali pa je asociacija. ({$field})"
                , 'TIP-LKP-0007');
            }

            $result = [
                'label' => $field,
                'cell' => 'string',
                'name' => $field
            ];
        } else {
            $cellType = $meta->getFieldUi($field) ? $meta->getFieldUi($field)->type : $map->getFieldMapping($field)['type'];
            $result = [
                'label' => $meta->getFieldI18n($field)->label,
                'cell' => $this->filterGridMetaType($cellType),
                'name' => $alias ? $alias : $name
            ];
            if ($cellType == 'select') {
                if ($meta->getFieldUi($field)->opts) {
                    $opts = $this->serviceLocator
                            ->get('options.service')
                            ->getOptions($meta->getFieldUi($field)->opts);
                    $result['optionValues'] = $opts;
                }
            }
        }
        return $result;
    }

    public function filterGridMetaType($type)
    {
        switch ($type) {
            case 'decimal':
            case 'kolicina':
            case 'znesek':
            case 'integer':
            case 'cena':
                return 'number';
                break;
            case 'text':
                return 'TextArea';
                break;
            case 'checkbox':
                return 'boolean';
                break;
            case 'select':
            case 'hidden':
            case 'date':
            case 'datetime':
                return $type;
                break;
            default:
                return 'string';
        }
    }

    /**
     * Default implementacija
     *
     * @param type $id
     * @param type $filter
     */
    public function lookupid($id, $filter = true)
    {
        $ent = $this->find($id);

        if ($ent) {
            if ($filter) {
                return $this->filterForLookup($ent);
            } else {
                $hydr = $this->getJsonHydrator();
                $arr = $hydr->extract($ent);
                return $arr;
            }
        }
    }

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

        return new Paginator2(new DoctrinePaginator(new Paginator($qb)));
        ;
    }

    /**
     * 
     * 
     * @param array $options filter opcije
     * @param string $name ime paginatorja
     * @return \Zend\Paginator\Adapter\AdapterInterface
     */
    public function getPaginator(array $options, $name = "default")
    {
        return new \DoctrineModule\Paginator\Adapter\Collection($this->findAll());
    }

    /**
     * Vrne imena paginatorjev, ki jih repozitorij podpira
     *
     * @return string
     */
    public function getPaginatorNames()
    {
        return array_keys($this->paginatorFields);
    }

    /**
     * Podprte sort opcije za paginator.
     * Manjkajoče labele potegne iz anotacij @Max\I18n
     *
     * @param type $name
     * @return array
     */
    public function getSortOptions($name = 'default')
    {
        if (isset($this->sortOptions[$name])) {
            $opts = $this->sortOptions[$name];
            foreach ($opts as $f => $v) {
                // če ni labele grem v metadata po njo
                if (!isset($v['label'])) {
                    $i18n = $this->getMeta()->getFieldI18n($f);
                    if ($i18n && $i18n->label) {
                        $this->sortOptions[$name][$f]['label'] = $i18n->label;
                    } else {
                        $this->sortOptions[$name][$f]['label'] = ucfirst($f);
                    }
                }
            }
            return $this->sortOptions[$name];
        } else {
            return [];
        }
    }

    /**
     * Vrne definicije polj za imenovan paginator
     *
     * @param string $name
     * @return array
     */
    public function getTableFields($name = 'default')
    {
        $meta = $this->getMeta();
        $fields = array_keys($this->paginatorFields[$name]);
        $config = [];
        foreach ($fields as $fieldName) {

            $column = $this->resolveFieldMeta($fieldName);
            $def = $this->paginatorFields[$name][$fieldName];
            foreach (array_keys($def) as $d) {
                $column[$d] = $def[$d];
            }

            if (!isset($column['sortable'])) {
                $column['sortable'] = array_key_exists($fieldName, $this->sortOptions[$name]);
            }

            $config[] = $column;
        }

        return $config;
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
                throw new MaxException(sprintf('Sort opcije za paginator  %s manjkajo', $name), 'TIP-CNT-00298');
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
        $this->expectAuthorized($object, 'create');
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
        $this->expect($isNew, 'Entiteta ni nova', 'TIP-REP-0003');
    }

    /**
     * Privzeti postopek posodabljanja 
     * preveri avtorizacijo in 
     * 
     * @param Base $object
     */
    public function update($object)
    {
        $this->expectAuthorized($object, 'update');
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
        $this->expectAuthorized($object, 'delete');
        $object->lahkoBrisem();
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
        $object->validate($mode);
    }

    /**
     * Vrne json hidrator za entiteto
     *
     * @return Json
     */
    public function getJsonHydrator($options = [])
    {
        $hydr = new Json($this->getEntityManager()
                , $this->getEntityName()
                , $options
                , $this->getServiceLocator());
        return $hydr;
    }

    /**
     * Preveri atorizacijo 
     * @param type $object
     * @param type $op
     */
    public function expectAuthorized($object, $op)
    {
        $auth = $this->getAuthorizationService();
        $f = new StripEntity();
        $ent = $f->filter($this->getEntityName());
        $perm = $ent . '-' . $op;
        $this->expect($auth->isGranted($perm, $object), 'Dostop do dokumenta onemogočen' . $perm, 'TIP-MAT-0090');
    }

}
