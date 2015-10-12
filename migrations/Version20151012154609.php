<?php

namespace DoctrineORMModule\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20151012154609 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('ALTER TABLE enotaprograma ADD stHonorarnihZun INT DEFAULT 0');
        $this->addSql('ALTER TABLE enotaprograma ADD stHonorarnihZunIgr INT DEFAULT 0');
        $this->addSql('ALTER TABLE enotaprograma ADD stHonorarnihZunIgrTujJZ INT DEFAULT 0');
        $this->addSql('ALTER TABLE enotaprograma ADD stHonorarnihZunSamoz INT DEFAULT 0');
        $this->addSql('ALTER TABLE enotaprograma ADD obiskKoprGost INT DEFAULT 0 NOT NULL');
        $this->addSql('ALTER TABLE enotaprograma ADD obiskKoprZamejo INT DEFAULT 0 NOT NULL');
        $this->addSql('ALTER TABLE enotaprograma ADD ponoviKoprZamejo NUMERIC(15, 2) DEFAULT \'0\' NOT NULL');
        $this->addSql('ALTER TABLE enotaprograma ADD ponoviKoprGost NUMERIC(15, 2) DEFAULT \'0\' NOT NULL');
        $this->addSql('ALTER TABLE enotaprograma ADD avtor VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE enotaprograma ADD reziser VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE enotaprograma ADD datum DATE DEFAULT NULL');
        $this->addSql('ALTER TABLE enotaprograma ADD soustvarjalci VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE enotaprograma DROP sthonorarnih');
        $this->addSql('ALTER TABLE enotaprograma DROP sthonorarnihigr');
        $this->addSql('ALTER TABLE enotaprograma DROP sthonorarnihigrtujjz');
        $this->addSql('ALTER TABLE enotaprograma DROP sthonorarnihigrsamoz');
        $this->addSql('ALTER TABLE enotaprograma ALTER ponovizamejo TYPE NUMERIC(15, 2)');
        $this->addSql('ALTER TABLE enotaprograma ALTER ponovizamejo SET DEFAULT \'0\'');
        $this->addSql('ALTER TABLE enotaprograma ALTER ponovigost TYPE NUMERIC(15, 2)');
        $this->addSql('ALTER TABLE enotaprograma ALTER ponovigost SET DEFAULT \'0\'');
        $this->addSql('ALTER TABLE programdela ADD stPremierVelikih INT DEFAULT 0');
        $this->addSql('ALTER TABLE programdela ADD stPremierMalih INT DEFAULT 0');
        $this->addSql('ALTER TABLE programdela ADD stPremierMalihKopr INT DEFAULT 0');
        $this->addSql('ALTER TABLE programdela ADD stPremierVelikihKopr INT DEFAULT 0');
        $this->addSql('ALTER TABLE programdela ADD stPremierSredKopr INT DEFAULT 0');
        $this->addSql('ALTER TABLE programdela ADD stHonorarnihZun INT DEFAULT 0');
        $this->addSql('ALTER TABLE programdela ADD stHonorarnihZunIgr INT DEFAULT 0');
        $this->addSql('ALTER TABLE programdela ADD stHonorarnihZunIgrTujJZ INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stHonorarnihZunSamoz INT DEFAULT 0');
        $this->addSql('ALTER TABLE programdela DROP sthonorarnih');
        $this->addSql('ALTER TABLE programdela DROP sthonorarnihigr');
        $this->addSql('ALTER TABLE programdela DROP sthonorarnihigrtujjz');
        $this->addSql('ALTER TABLE programdela DROP sthonorarnihigrsamoz');
        $this->addSql('ALTER TABLE programdela ALTER stizvnekomerc TYPE NUMERIC(15, 2)');
        $this->addSql('ALTER TABLE programdela ALTER stizvnekomerc SET DEFAULT \'0\'');
        $this->addSql('ALTER TABLE programdela ALTER stizvponprem TYPE NUMERIC(15, 2)');
        $this->addSql('ALTER TABLE programdela ALTER stizvponprem SET DEFAULT \'0\'');
        $this->addSql('ALTER TABLE programdela ALTER stizvponprej TYPE NUMERIC(15, 2)');
        $this->addSql('ALTER TABLE programdela ALTER stizvponprej SET DEFAULT \'0\'');
        $this->addSql('ALTER TABLE programdela ALTER stizvostalihnek TYPE NUMERIC(15, 2)');
        $this->addSql('ALTER TABLE programdela ALTER stizvostalihnek SET DEFAULT \'0\'');
        $this->addSql('ALTER TABLE programdela ALTER stizvgostovanjslo TYPE NUMERIC(15, 2)');
        $this->addSql('ALTER TABLE programdela ALTER stizvgostovanjslo SET DEFAULT \'0\'');
        $this->addSql('ALTER TABLE programdela ALTER stizvgostovanjzam TYPE NUMERIC(15, 2)');
        $this->addSql('ALTER TABLE programdela ALTER stizvgostovanjzam SET DEFAULT \'0\'');
        $this->addSql('ALTER TABLE programdela ALTER stizvponpremzamejo TYPE NUMERIC(15, 2)');
        $this->addSql('ALTER TABLE programdela ALTER stizvponpremzamejo SET DEFAULT \'0\'');
        $this->addSql('ALTER TABLE programdela ALTER stizvponpremgost TYPE NUMERIC(15, 2)');
        $this->addSql('ALTER TABLE programdela ALTER stizvponpremgost SET DEFAULT \'0\'');
        $this->addSql('ALTER TABLE programdela ALTER stizvponprejzamejo TYPE NUMERIC(15, 2)');
        $this->addSql('ALTER TABLE programdela ALTER stizvponprejzamejo SET DEFAULT \'0\'');
        $this->addSql('ALTER TABLE programdela ALTER stizvponprejgost TYPE NUMERIC(15, 2)');
        $this->addSql('ALTER TABLE programdela ALTER stizvponprejgost SET DEFAULT \'0\'');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE ProgramDela ADD sthonorarnihigr INT DEFAULT NULL');
        $this->addSql('ALTER TABLE ProgramDela ADD sthonorarnihigrtujjz INT DEFAULT NULL');
        $this->addSql('ALTER TABLE ProgramDela ADD sthonorarnihigrsamoz INT DEFAULT NULL');
        $this->addSql('ALTER TABLE ProgramDela DROP stPremierVelikih');
        $this->addSql('ALTER TABLE ProgramDela DROP stPremierMalih');
        $this->addSql('ALTER TABLE ProgramDela DROP stPremierMalihKopr');
        $this->addSql('ALTER TABLE ProgramDela DROP stPremierVelikihKopr');
        $this->addSql('ALTER TABLE ProgramDela DROP stPremierSredKopr');
        $this->addSql('ALTER TABLE ProgramDela DROP stHonorarnihZun');
        $this->addSql('ALTER TABLE ProgramDela DROP stHonorarnihZunIgr');
        $this->addSql('ALTER TABLE ProgramDela DROP stHonorarnihZunSamoz');
        $this->addSql('ALTER TABLE ProgramDela ALTER stIzvNekomerc TYPE INT');
        $this->addSql('ALTER TABLE ProgramDela ALTER stIzvNekomerc DROP DEFAULT');
        $this->addSql('ALTER TABLE ProgramDela ALTER stIzvPonPrem TYPE INT');
        $this->addSql('ALTER TABLE ProgramDela ALTER stIzvPonPrem DROP DEFAULT');
        $this->addSql('ALTER TABLE ProgramDela ALTER stIzvPonPremZamejo TYPE INT');
        $this->addSql('ALTER TABLE ProgramDela ALTER stIzvPonPremZamejo DROP DEFAULT');
        $this->addSql('ALTER TABLE ProgramDela ALTER stIzvPonPremGost TYPE INT');
        $this->addSql('ALTER TABLE ProgramDela ALTER stIzvPonPremGost DROP DEFAULT');
        $this->addSql('ALTER TABLE ProgramDela ALTER stIzvPonPrej TYPE INT');
        $this->addSql('ALTER TABLE ProgramDela ALTER stIzvPonPrej DROP DEFAULT');
        $this->addSql('ALTER TABLE ProgramDela ALTER stIzvPonPrejZamejo TYPE INT');
        $this->addSql('ALTER TABLE ProgramDela ALTER stIzvPonPrejZamejo DROP DEFAULT');
        $this->addSql('ALTER TABLE ProgramDela ALTER stIzvPonPrejGost TYPE INT');
        $this->addSql('ALTER TABLE ProgramDela ALTER stIzvPonPrejGost DROP DEFAULT');
        $this->addSql('ALTER TABLE ProgramDela ALTER stIzvOstalihNek TYPE INT');
        $this->addSql('ALTER TABLE ProgramDela ALTER stIzvOstalihNek DROP DEFAULT');
        $this->addSql('ALTER TABLE ProgramDela ALTER stIzvGostovanjSlo TYPE INT');
        $this->addSql('ALTER TABLE ProgramDela ALTER stIzvGostovanjSlo DROP DEFAULT');
        $this->addSql('ALTER TABLE ProgramDela ALTER stIzvGostovanjZam TYPE INT');
        $this->addSql('ALTER TABLE ProgramDela ALTER stIzvGostovanjZam DROP DEFAULT');
        $this->addSql('ALTER TABLE ProgramDela RENAME COLUMN sthonorarnihzunigrtujjz TO sthonorarnih');
        $this->addSql('ALTER TABLE EnotaPrograma ADD sthonorarnih INT DEFAULT NULL');
        $this->addSql('ALTER TABLE EnotaPrograma ADD sthonorarnihigr INT DEFAULT NULL');
        $this->addSql('ALTER TABLE EnotaPrograma ADD sthonorarnihigrtujjz INT DEFAULT NULL');
        $this->addSql('ALTER TABLE EnotaPrograma ADD sthonorarnihigrsamoz INT DEFAULT NULL');
        $this->addSql('ALTER TABLE EnotaPrograma DROP stHonorarnihZun');
        $this->addSql('ALTER TABLE EnotaPrograma DROP stHonorarnihZunIgr');
        $this->addSql('ALTER TABLE EnotaPrograma DROP stHonorarnihZunIgrTujJZ');
        $this->addSql('ALTER TABLE EnotaPrograma DROP stHonorarnihZunSamoz');
        $this->addSql('ALTER TABLE EnotaPrograma DROP obiskKoprGost');
        $this->addSql('ALTER TABLE EnotaPrograma DROP obiskKoprZamejo');
        $this->addSql('ALTER TABLE EnotaPrograma DROP ponoviKoprZamejo');
        $this->addSql('ALTER TABLE EnotaPrograma DROP ponoviKoprGost');
        $this->addSql('ALTER TABLE EnotaPrograma DROP avtor');
        $this->addSql('ALTER TABLE EnotaPrograma DROP reziser');
        $this->addSql('ALTER TABLE EnotaPrograma DROP datum');
        $this->addSql('ALTER TABLE EnotaPrograma DROP soustvarjalci');
        $this->addSql('ALTER TABLE EnotaPrograma ALTER ponoviZamejo TYPE INT');
        $this->addSql('ALTER TABLE EnotaPrograma ALTER ponoviZamejo SET DEFAULT 0');
        $this->addSql('ALTER TABLE EnotaPrograma ALTER ponoviGost TYPE INT');
        $this->addSql('ALTER TABLE EnotaPrograma ALTER ponoviGost SET DEFAULT 0');
    }
}
