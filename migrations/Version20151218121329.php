<?php

namespace DoctrineORMModule\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20151218121329
        extends AbstractMigration
{

    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs

        /*
         * ročno dodano:
         */
        $this->addSql('delete from permission where name=\'Oseba-vse\';');
        $this->addSql('delete from permission where name=\'StevilcenjeKonfig-read\';');
        $this->addSql('delete from permission where name=\'StevilcenjeKonfig-write\';');
        $this->addSql('delete from permission where name=\'Stevilcenje-read\';');
        $this->addSql('delete from permission where name=\'Stevilcenje-write\';');
        $this->addSql('delete from permission where name=\'StevilcenjeStanje-read\';');
        $this->addSql('delete from permission where name=\'StevilcenjeStanje-write\';');
        $this->addSql('delete from permission2role where role_id=(select role.id from role where role.name=\'planer\');');
        $this->addSql('delete from permission2role where role_id=(select role.id from role where role.name=\'kadrovska\');');
        $this->addSql('delete from permission2role where role_id=(select role.id from role where role.name=\'arhivar\');');
        $this->addSql('delete from permission2role where role_id=(select role.id from role where role.name=\'igralec\');');
        $this->addSql('delete from permission2role where role_id=(select role.id from role where role.name=\'prisotnost\');');
        $this->addSql('delete from role2user where role_id=(select role.id from role where role.name=\'planer\');');
        $this->addSql('delete from role2user where role_id=(select role.id from role where role.name=\'kadrovska\');');
        $this->addSql('delete from role2user where role_id=(select role.id from role where role.name=\'arhivar\');');
        $this->addSql('delete from role2user where role_id=(select role.id from role where role.name=\'igralec\');');
        $this->addSql('delete from role2user where role_id=(select role.id from role where role.name=\'prisotnost\');');
        $this->addSql('delete from role where name=\'planer\';');
        $this->addSql('delete from role where name=\'kadrovska\';');
        $this->addSql('delete from role where name=\'arhivar\';');
        $this->addSql('delete from role where name=\'igralec\';');
        $this->addSql('delete from role where name=\'prisotnost\';');

        /**
         * $$ ročne akcije za narediti:
         *  
         * bin/util populate Roles   
         * (psql) select *from role order by role.name;
         * (psql) select role.name, permission.name from permission2role 
         *              join permission on permission.id=permission_id 
         *              join role on role.id=role_id 
         *              order by role.name,permission.name;
         */
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE SCHEMA public');
    }

}
