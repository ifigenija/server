<?php

namespace DoctrineORMModule\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20151229153831
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
        $this->addSql('update funkcija set altercount='
                .'(select count(*) from alternacija where alternacija.funkcija_id=funkcija.id);');
        $this->addSql('update funkcija set alternacija_id=' .
                '( select alternacija.id from alternacija ' .
                'where alternacija.funkcija_id=funkcija.id and alternacija.privzeti=true);');
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
