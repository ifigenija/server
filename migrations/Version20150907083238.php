<?php

namespace DoctrineORMModule\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20150907083238 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('ALTER TABLE oseba ALTER email TYPE VARCHAR(255)');
        $this->addSql('ALTER TABLE tipfunkcije ADD sifra VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE tipfunkcije ALTER ime SET NOT NULL');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_3F50510D559828A3 ON tipfunkcije (sifra)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_3F50510D55CCA980 ON tipfunkcije (ime)');
        $this->addSql('ALTER TABLE zaposlitev ADD delovnoMesto VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE programdela DROP CONSTRAINT fk_c81bc37f3a0e32e3');
        $this->addSql('DROP INDEX idx_c81bc37f3a0e32e3');
        $this->addSql('ALTER TABLE programdela DROP sezona_id');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE SCHEMA public');
        $this->addSql('DROP INDEX UNIQ_3F50510D559828A3');
        $this->addSql('DROP INDEX UNIQ_3F50510D55CCA980');
        $this->addSql('ALTER TABLE TipFunkcije DROP sifra');
        $this->addSql('ALTER TABLE TipFunkcije ALTER ime DROP NOT NULL');
        $this->addSql('ALTER TABLE Oseba ALTER email TYPE VARCHAR(40)');
        $this->addSql('ALTER TABLE Zaposlitev DROP delovnoMesto');
        $this->addSql('ALTER TABLE ProgramDela ADD sezona_id UUID DEFAULT NULL');
        $this->addSql('ALTER TABLE ProgramDela ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX idx_c81bc37f3a0e32e3 ON ProgramDela (sezona_id)');
    }
}
