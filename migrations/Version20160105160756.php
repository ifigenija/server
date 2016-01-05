<?php

namespace DoctrineORMModule\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20160105160756
        extends AbstractMigration
{

    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE TABLE Dodatek (id UUID NOT NULL, tipdodatka_id UUID DEFAULT NULL, trajanje INT DEFAULT NULL, terminStoritve_id UUID DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_AAB095CE5E15BDBD ON Dodatek (terminStoritve_id)');
        $this->addSql('CREATE INDEX IDX_AAB095CE789DD25A ON Dodatek (tipdodatka_id)');
        $this->addSql('CREATE TABLE TipDodatka (id UUID NOT NULL, sifra VARCHAR(255) NOT NULL, ime VARCHAR(255) NOT NULL, opis TEXT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_466F660B559828A3 ON TipDodatka (sifra)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_466F660B55CCA980 ON TipDodatka (ime)');
        $this->addSql('ALTER TABLE Dodatek ADD CONSTRAINT FK_AAB095CE5E15BDBD FOREIGN KEY (terminStoritve_id) REFERENCES TerminStoritve (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE Dodatek ADD CONSTRAINT FK_AAB095CE789DD25A FOREIGN KEY (tipdodatka_id) REFERENCES TipDodatka (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE zaposlitev DROP tip');
        $this->addSql('ALTER TABLE zaposlitev DROP malica');

        /**
         * $$ ročne akcije za narediti:
         *  
         * bin/util populate TipDodatka
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
        $this->addSql('ALTER TABLE Dodatek DROP CONSTRAINT FK_AAB095CE789DD25A');
        $this->addSql('DROP TABLE Dodatek');
        $this->addSql('DROP TABLE TipDodatka');
        $this->addSql('ALTER TABLE Zaposlitev ADD tip INT DEFAULT NULL');
        $this->addSql('ALTER TABLE Zaposlitev ADD malica VARCHAR(255) DEFAULT NULL');
    }

}
