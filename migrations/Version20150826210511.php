<?php

namespace DoctrineORMModule\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20150826210511 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE TABLE VrstaStroska (id UUID NOT NULL, skupina INT NOT NULL, podskupina INT DEFAULT NULL, naziv VARCHAR(255) DEFAULT NULL, opis TEXT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('ALTER TABLE popa DROP tipkli');
        $this->addSql('ALTER TABLE prostor ADD popa_id UUID DEFAULT NULL');
        $this->addSql('ALTER TABLE prostor ADD naslov_id UUID DEFAULT NULL');
        $this->addSql('ALTER TABLE prostor ADD CONSTRAINT FK_952DD2196BEEDE51 FOREIGN KEY (popa_id) REFERENCES popa (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE prostor ADD CONSTRAINT FK_952DD21969E8D4 FOREIGN KEY (naslov_id) REFERENCES PostniNaslovi (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_952DD2196BEEDE51 ON prostor (popa_id)');
        $this->addSql('CREATE INDEX IDX_952DD21969E8D4 ON prostor (naslov_id)');
        $this->addSql('ALTER TABLE strosekuprizoritve ADD vrstaStroska_id UUID DEFAULT NULL');
        $this->addSql('ALTER TABLE strosekuprizoritve ADD CONSTRAINT FK_11FFE6E05C75296C FOREIGN KEY (vrstaStroska_id) REFERENCES VrstaStroska (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_11FFE6E05C75296C ON strosekuprizoritve (vrstaStroska_id)');
        $this->addSql('ALTER TABLE enotaprograma ADD obiskKopr INT DEFAULT 0 NOT NULL');
        $this->addSql('ALTER TABLE enotaprograma ADD obiskKoprInt INT DEFAULT 0 NOT NULL');
        $this->addSql('ALTER TABLE enotaprograma ADD ponoviKopr INT DEFAULT  0 NOT NULL');
        $this->addSql('ALTER TABLE enotaprograma ADD ponoviKoprInt INT DEFAULT 0 NOT NULL');
        $this->addSql('ALTER TABLE enotaprograma ADD kpe NUMERIC(15, 2) DEFAULT \'0\' NOT NULL');
        $this->addSql('ALTER TABLE produkcijadelitev ADD kpe NUMERIC(15, 2) DEFAULT \'0\' NOT NULL');
        $this->addSql('ALTER TABLE produkcijadelitev DROP zaproseno');
        $this->addSql('ALTER TABLE programdela ADD stIzvPonPremDoma INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stIzvPonPremZamejo INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stIzvPonPremGost INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stIzvPonPremKopr INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stIzvPonPremInt INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stIzvPonPremKoprInt INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stIzvPonPrejDoma INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stIzvPonPrejZamejo INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stIzvPonPrejGost INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stIzvPonPrejKopr INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stIzvPonPrejInt INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stIzvPonPrejKoprInt INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stObiskPrem INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stObiskPonPrem INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stObiskPonPremDoma INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stObiskPonPremKopr INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stObiskPonPremKoprInt INT DEFAULT NULL');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE StrosekUprizoritve DROP CONSTRAINT FK_11FFE6E05C75296C');
        $this->addSql('DROP TABLE VrstaStroska');
        $this->addSql('ALTER TABLE ProdukcijaDelitev ADD zaproseno NUMERIC(15, 2) DEFAULT NULL');
        $this->addSql('ALTER TABLE ProdukcijaDelitev DROP kpe');
        $this->addSql('ALTER TABLE popa ADD tipkli VARCHAR(20) DEFAULT NULL');
        $this->addSql('ALTER TABLE ProgramDela DROP stIzvPonPremDoma');
        $this->addSql('ALTER TABLE ProgramDela DROP stIzvPonPremZamejo');
        $this->addSql('ALTER TABLE ProgramDela DROP stIzvPonPremGost');
        $this->addSql('ALTER TABLE ProgramDela DROP stIzvPonPremKopr');
        $this->addSql('ALTER TABLE ProgramDela DROP stIzvPonPremInt');
        $this->addSql('ALTER TABLE ProgramDela DROP stIzvPonPremKoprInt');
        $this->addSql('ALTER TABLE ProgramDela DROP stIzvPonPrejDoma');
        $this->addSql('ALTER TABLE ProgramDela DROP stIzvPonPrejZamejo');
        $this->addSql('ALTER TABLE ProgramDela DROP stIzvPonPrejGost');
        $this->addSql('ALTER TABLE ProgramDela DROP stIzvPonPrejKopr');
        $this->addSql('ALTER TABLE ProgramDela DROP stIzvPonPrejInt');
        $this->addSql('ALTER TABLE ProgramDela DROP stIzvPonPrejKoprInt');
        $this->addSql('ALTER TABLE ProgramDela DROP stObiskPrem');
        $this->addSql('ALTER TABLE ProgramDela DROP stObiskPonPrem');
        $this->addSql('ALTER TABLE ProgramDela DROP stObiskPonPremDoma');
        $this->addSql('ALTER TABLE ProgramDela DROP stObiskPonPremKopr');
        $this->addSql('ALTER TABLE ProgramDela DROP stObiskPonPremKoprInt');
        $this->addSql('ALTER TABLE EnotaPrograma DROP obiskKopr');
        $this->addSql('ALTER TABLE EnotaPrograma DROP obiskKoprInt');
        $this->addSql('ALTER TABLE EnotaPrograma DROP ponoviKopr');
        $this->addSql('ALTER TABLE EnotaPrograma DROP ponoviKoprInt');
        $this->addSql('ALTER TABLE EnotaPrograma DROP kpe');
        $this->addSql('DROP INDEX IDX_11FFE6E05C75296C');
        $this->addSql('ALTER TABLE StrosekUprizoritve DROP vrstaStroska_id');
        $this->addSql('ALTER TABLE Prostor DROP CONSTRAINT FK_952DD2196BEEDE51');
        $this->addSql('ALTER TABLE Prostor DROP CONSTRAINT FK_952DD21969E8D4');
        $this->addSql('DROP INDEX IDX_952DD2196BEEDE51');
        $this->addSql('DROP INDEX IDX_952DD21969E8D4');
        $this->addSql('ALTER TABLE Prostor DROP popa_id');
        $this->addSql('ALTER TABLE Prostor DROP naslov_id');
    }
}
