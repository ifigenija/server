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
namespace Aaa\Factory;

use Aaa\Authentication\Storage\DbalStorage;
use DoctrineModule\Service\AbstractFactory;
use Zend\Authentication\AuthenticationService;
use Zend\Authentication\Storage\Chain;
use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

/**
 * Factory to create authentication service object.
 *
 * @license MIT
 * @link    http://www.doctrine-project.org/
 * @since   0.1.0
 * @author  Tim Roediger <superdweebie@gmail.com>
 */
class AuthenticationServiceFactory implements FactoryInterface
{
    /**
     *
     * @param \Zend\ServiceManager\ServiceLocatorInterface $serviceLocator
     * @return \Zend\Authentication\AuthenticationService
     */
    public function createService(ServiceLocatorInterface $serviceLocator)
    {

        $chain = new Chain();
        $chain->add($serviceLocator->get('doctrine.authenticationstorage.orm_default'),0);
        $conn = $serviceLocator->get('doctrine.connection.orm_default');
        $chain->add(new DbalStorage($conn),2);
        return new AuthenticationService(

            $chain,
            $serviceLocator->get('doctrine.authenticationadapter.orm_default')
        );
    }

    /**
     * {@inheritDoc}
     */
    public function getOptionsClass()
    {
        throw new \BadMethodCallException('Not implemented');
    }
}
