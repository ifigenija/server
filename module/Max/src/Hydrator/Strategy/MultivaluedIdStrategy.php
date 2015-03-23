<?php

/*
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * This software consists of voluntary contributions made by many individuals
 * and is licensed under the MIT license. For more information, see
 * <http://www.doctrine-project.org>.
 */

namespace Max\Stdlib\Hydrator\Strategy;

use InvalidArgumentException;
use Doctrine\Common\Collections\Collection;
use Doctrine\Common\Persistence\Mapping\ClassMetadata;
use Zend\Stdlib\Hydrator\Strategy\StrategyInterface;

/**
 * @license MIT
 * @link    http://www.doctrine-project.org/
 * @since   0.7.0
 * @author  Michael Gallego <mic.gallego@gmail.com>
 */
class MultivaluedIdStrategy extends \DoctrineModule\Stdlib\Hydrator\Strategy\AllowRemoveByReference implements StrategyInterface {

    /**
     * {@inheritDoc}
     */
    public function extract($value) {
        $arr = [];
        if (null !== $value) {
        foreach($value as $object) {
            $arr[]  = $object->getId();
        }
        }
        return $arr;
    }


}

