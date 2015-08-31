<?php

namespace DoctrineORMModule\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20150831215248 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('ALTER TABLE dogodek DROP CONSTRAINT fk_11e93b5d10398482');
        $this->addSql('ALTER TABLE predstava DROP CONSTRAINT fk_602f6e466f7e7a33');
        $this->addSql('CREATE TABLE DogodekSplosni (id UUID NOT NULL, PRIMARY KEY(id))');
        $this->addSql('DROP TABLE dogodekizven');
        $this->addSql('DROP TABLE gostujoca');
        $this->addSql('DROP INDEX uniq_11e93b5d10398482');
        $this->addSql('ALTER TABLE dogodek ADD allDay BOOLEAN DEFAULT \'false\' NOT NULL');
        $this->addSql('ALTER TABLE dogodek ALTER status TYPE VARCHAR(20)');
        $this->addSql('ALTER TABLE dogodek ALTER status DROP DEFAULT');
        $this->addSql('ALTER TABLE dogodek RENAME COLUMN dogodek_izven_id TO dogodek_splosni_id');
        $this->addSql('ALTER TABLE dogodek RENAME COLUMN ime TO title');
        $this->addSql('ALTER TABLE dogodek ADD CONSTRAINT FK_11E93B5DBBC7A989 FOREIGN KEY (dogodek_splosni_id) REFERENCES DogodekSplosni (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_11E93B5DBBC7A989 ON dogodek (dogodek_splosni_id)');
        $this->addSql('CREATE INDEX dogodki_razred ON dogodek (razred)');
        $this->addSql('ALTER INDEX zacetek RENAME TO dogodki_zacetek');
        $this->addSql('ALTER INDEX konec RENAME TO dogodki_konec');
        $this->addSql('DROP INDEX idx_602f6e466f7e7a33');
        $this->addSql('ALTER TABLE predstava DROP gostujoc_id');
        $this->addSql('ALTER TABLE vaja ADD vrsta VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE prostor ADD sePlanira BOOLEAN DEFAULT \'false\' NOT NULL');
        $this->addSql('ALTER TABLE programdela ADD stObiskPonPremGost INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stObiskPonPremZamejo INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stObiskPonPremInt INT DEFAULT NULL');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE Dogodek DROP CONSTRAINT FK_11E93B5DBBC7A989');
        $this->addSql('CREATE TABLE dogodekizven (id UUID NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE TABLE gostujoca (id UUID NOT NULL, uprizoritev_id UUID DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX idx_4a45d07962b4ffca ON gostujoca (uprizoritev_id)');
        $this->addSql('ALTER TABLE gostujoca ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('DROP TABLE DogodekSplosni');
        $this->addSql('ALTER TABLE Predstava ADD gostujoc_id UUID DEFAULT NULL');
        $this->addSql('ALTER TABLE Predstava ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX idx_602f6e466f7e7a33 ON Predstava (gostujoc_id)');
        $this->addSql('ALTER TABLE Vaja DROP vrsta');
        $this->addSql('DROP INDEX UNIQ_11E93B5DBBC7A989');
        $this->addSql('DROP INDEX dogodki_razred');
        $this->addSql('ALTER TABLE Dogodek DROP allDay');
        $this->addSql('ALTER TABLE Dogodek ALTER status TYPE INT');
        $this->addSql('ALTER TABLE Dogodek ALTER status DROP DEFAULT');
        $this->addSql('ALTER TABLE Dogodek ALTER status TYPE INT');
        $this->addSql('ALTER TABLE Dogodek RENAME COLUMN dogodek_splosni_id TO dogodek_izven_id');
        $this->addSql('ALTER TABLE Dogodek RENAME COLUMN title TO ime');
        $this->addSql('ALTER TABLE Dogodek ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON Dogodek (dogodek_izven_id)');
        $this->addSql('ALTER INDEX dogodki_konec RENAME TO konec');
        $this->addSql('ALTER INDEX dogodki_zacetek RENAME TO zacetek');
        $this->addSql('ALTER TABLE Prostor DROP sePlanira');
        $this->addSql('ALTER TABLE ProgramDela DROP stObiskPonPremGost');
        $this->addSql('ALTER TABLE ProgramDela DROP stObiskPonPremZamejo');
        $this->addSql('ALTER TABLE ProgramDela DROP stObiskPonPremInt');
    }
}
