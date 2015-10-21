<?php

namespace DoctrineORMModule\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20151021092904 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE TABLE OrganizacijskaEnota (id UUID NOT NULL, parent_id UUID DEFAULT NULL, vodja_id UUID DEFAULT NULL, namestnik_id UUID DEFAULT NULL, sifra VARCHAR(2) DEFAULT NULL, naziv VARCHAR(50) DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_5E2FDC29559828A3 ON OrganizacijskaEnota (sifra)');
        $this->addSql('CREATE INDEX IDX_5E2FDC29727ACA70 ON OrganizacijskaEnota (parent_id)');
        $this->addSql('CREATE INDEX IDX_5E2FDC29289ED596 ON OrganizacijskaEnota (vodja_id)');
        $this->addSql('CREATE INDEX IDX_5E2FDC29F0020ED7 ON OrganizacijskaEnota (namestnik_id)');
        $this->addSql('CREATE TABLE predstava_abonma (predstava_id UUID NOT NULL, abonma_id UUID NOT NULL, PRIMARY KEY(predstava_id, abonma_id))');
        $this->addSql('CREATE INDEX IDX_D9ECE16B5AC894AA ON predstava_abonma (predstava_id)');
        $this->addSql('CREATE INDEX IDX_D9ECE16BBE74B11 ON predstava_abonma (abonma_id)');
        $this->addSql('CREATE TABLE TipVaje (id UUID NOT NULL, sifra VARCHAR(255) NOT NULL, ime VARCHAR(255) NOT NULL, opis TEXT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_99664B14559828A3 ON TipVaje (sifra)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_99664B1455CCA980 ON TipVaje (ime)');
        $this->addSql('ALTER TABLE OrganizacijskaEnota ADD CONSTRAINT FK_5E2FDC29727ACA70 FOREIGN KEY (parent_id) REFERENCES OrganizacijskaEnota (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE OrganizacijskaEnota ADD CONSTRAINT FK_5E2FDC29289ED596 FOREIGN KEY (vodja_id) REFERENCES Zaposlitev (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE OrganizacijskaEnota ADD CONSTRAINT FK_5E2FDC29F0020ED7 FOREIGN KEY (namestnik_id) REFERENCES Zaposlitev (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE predstava_abonma ADD CONSTRAINT FK_D9ECE16B5AC894AA FOREIGN KEY (predstava_id) REFERENCES Predstava (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE predstava_abonma ADD CONSTRAINT FK_D9ECE16BBE74B11 FOREIGN KEY (abonma_id) REFERENCES Abonma (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE predstava ADD dezurni_id UUID DEFAULT NULL');
        $this->addSql('ALTER TABLE predstava ADD zaporednaSez INT DEFAULT NULL');
        $this->addSql('ALTER TABLE predstava ADD CONSTRAINT FK_602F6E461174BB0E FOREIGN KEY (dezurni_id) REFERENCES Oseba (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_602F6E461174BB0E ON predstava (dezurni_id)');
        $this->addSql('ALTER TABLE vaja ADD tipvaje_id UUID DEFAULT NULL');
        $this->addSql('ALTER TABLE vaja DROP vrsta');
        $this->addSql('ALTER TABLE vaja ADD CONSTRAINT FK_2390FC964AD2A6EA FOREIGN KEY (tipvaje_id) REFERENCES TipVaje (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_2390FC964AD2A6EA ON vaja (tipvaje_id)');
        $this->addSql('ALTER TABLE terminstoritve ADD dezurni BOOLEAN DEFAULT NULL');
        $this->addSql('ALTER TABLE terminstoritve ADD gost BOOLEAN DEFAULT NULL');
        $this->addSql('ALTER TABLE zaposlitev ADD organizacijskaEnota_id UUID DEFAULT NULL');
        $this->addSql('ALTER TABLE zaposlitev ADD CONSTRAINT FK_B24490415F1E9D88 FOREIGN KEY (organizacijskaEnota_id) REFERENCES OrganizacijskaEnota (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_B24490415F1E9D88 ON zaposlitev (organizacijskaEnota_id)');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE OrganizacijskaEnota DROP CONSTRAINT FK_5E2FDC29727ACA70');
        $this->addSql('ALTER TABLE Zaposlitev DROP CONSTRAINT FK_B24490415F1E9D88');
        $this->addSql('ALTER TABLE Vaja DROP CONSTRAINT FK_2390FC964AD2A6EA');
        $this->addSql('DROP TABLE OrganizacijskaEnota');
        $this->addSql('DROP TABLE predstava_abonma');
        $this->addSql('DROP TABLE TipVaje');
        $this->addSql('DROP INDEX IDX_2390FC964AD2A6EA');
        $this->addSql('ALTER TABLE Vaja ADD vrsta VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE Vaja DROP tipvaje_id');
        $this->addSql('ALTER TABLE Predstava DROP CONSTRAINT FK_602F6E461174BB0E');
        $this->addSql('DROP INDEX IDX_602F6E461174BB0E');
        $this->addSql('ALTER TABLE Predstava DROP dezurni_id');
        $this->addSql('ALTER TABLE Predstava DROP zaporednaSez');
        $this->addSql('ALTER TABLE TerminStoritve DROP dezurni');
        $this->addSql('ALTER TABLE TerminStoritve DROP gost');
        $this->addSql('DROP INDEX IDX_B24490415F1E9D88');
        $this->addSql('ALTER TABLE Zaposlitev DROP organizacijskaEnota_id');
    }
}
