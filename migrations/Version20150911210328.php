<?php

namespace DoctrineORMModule\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20150911210328 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE TABLE PostavkaCDve (id UUID NOT NULL, skupina VARCHAR(2) NOT NULL, podskupina INT DEFAULT NULL, naziv VARCHAR(255) DEFAULT NULL, vrPremiere NUMERIC(15, 2) DEFAULT NULL, vrPonovitvePremier NUMERIC(15, 2) DEFAULT NULL, vrPonovitvePrejsnjih NUMERIC(15, 2) DEFAULT NULL, vrGostovanjaZamejstvo NUMERIC(15, 2) DEFAULT NULL, vrFestivali NUMERIC(15, 2) DEFAULT NULL, vrGostovanjaInt NUMERIC(15, 2) DEFAULT NULL, vrOstalo NUMERIC(15, 2) DEFAULT NULL, programDela_id UUID DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_DBA42FE79E3ADF2C ON PostavkaCDve (programDela_id)');
        $this->addSql('ALTER TABLE PostavkaCDve ADD CONSTRAINT FK_DBA42FE79E3ADF2C FOREIGN KEY (programDela_id) REFERENCES ProgramDela (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('DROP INDEX uniq_11e93b5dcc3aa562');
        $this->addSql('ALTER TABLE dogodek ALTER status TYPE VARCHAR(4)');
        $this->addSql('ALTER TABLE dogodek ALTER razred TYPE VARCHAR(4)');
        $this->addSql('ALTER TABLE dogodek ALTER allday DROP NOT NULL');
        $this->addSql('CREATE INDEX IDX_11E93B5DCC3AA562 ON dogodek (prostor_id)');
        $this->addSql('ALTER TABLE prostor ADD jeMaticniOder BOOLEAN DEFAULT NULL');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_EC773670CA2E5FCB ON besedilo (stevilka)');
        $this->addSql('ALTER TABLE pogodba ADD jeAvtorskePravice BOOLEAN DEFAULT NULL');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE SCHEMA public');
        $this->addSql('DROP TABLE PostavkaCDve');
        $this->addSql('DROP INDEX IDX_11E93B5DCC3AA562');
        $this->addSql('ALTER TABLE Dogodek ALTER allDay SET NOT NULL');
        $this->addSql('ALTER TABLE Dogodek ALTER status TYPE VARCHAR(20)');
        $this->addSql('ALTER TABLE Dogodek ALTER razred TYPE VARCHAR(10)');
        $this->addSql('CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON Dogodek (prostor_id)');
        $this->addSql('ALTER TABLE Pogodba DROP jeAvtorskePravice');
        $this->addSql('DROP INDEX UNIQ_EC773670CA2E5FCB');
        $this->addSql('ALTER TABLE Prostor DROP jeMaticniOder');
    }
}
