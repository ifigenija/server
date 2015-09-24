<?php

namespace DoctrineORMModule\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20150923181744
        extends AbstractMigration
{

    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE TABLE Report (id UUID NOT NULL, job_id UUID DEFAULT NULL, title VARCHAR(255) NOT NULL, filename VARCHAR(255) NOT NULL, transfers INT NOT NULL, size INT DEFAULT NULL, format VARCHAR(255) DEFAULT NULL, hash UUID DEFAULT NULL, createdAt TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_C38372B2BE04EA9 ON Report (job_id)');
        $this->addSql('CREATE TABLE Job (id UUID NOT NULL, user_id UUID DEFAULT NULL, name VARCHAR(50) NOT NULL, task VARCHAR(50) NOT NULL, status INT NOT NULL, log TEXT DEFAULT NULL, datum TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, casIzvedbe TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, izveden TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT NULL, data TEXT DEFAULT NULL, alert BOOLEAN DEFAULT NULL, hidden BOOLEAN DEFAULT NULL, upor VARCHAR(10) DEFAULT NULL, datKnj TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_C395A618A76ED395 ON Job (user_id)');
        $this->addSql('CREATE INDEX IDX_C395A618941027CC ON Job (casIzvedbe)');
        $this->addSql('CREATE INDEX IDX_C395A6181BB9E62C ON Job (datum)');
        $this->addSql('CREATE INDEX IDX_C395A618AECF5AF0 ON Job (izveden)');
        $this->addSql('COMMENT ON COLUMN Job.data IS \'(DC2Type:object)\'');
        $this->addSql('CREATE TABLE AvtorBesedila (id UUID NOT NULL, besedilo_id UUID DEFAULT NULL, oseba_id UUID DEFAULT NULL, tipAvtorja VARCHAR(255) NOT NULL, zaporedna INT DEFAULT NULL, aliVNaslovu BOOLEAN DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_7AB77B79F35157B1 ON AvtorBesedila (besedilo_id)');
        $this->addSql('CREATE INDEX IDX_7AB77B7910389148 ON AvtorBesedila (oseba_id)');
        $this->addSql('ALTER TABLE Report ADD CONSTRAINT FK_C38372B2BE04EA9 FOREIGN KEY (job_id) REFERENCES Job (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE Job ADD CONSTRAINT FK_C395A618A76ED395 FOREIGN KEY (user_id) REFERENCES uporabniki (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE AvtorBesedila ADD CONSTRAINT FK_7AB77B79F35157B1 FOREIGN KEY (besedilo_id) REFERENCES Besedilo (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE AvtorBesedila ADD CONSTRAINT FK_7AB77B7910389148 FOREIGN KEY (oseba_id) REFERENCES Oseba (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE zasedenost ADD oseba_id UUID DEFAULT NULL');
        $this->addSql('ALTER TABLE zasedenost ADD CONSTRAINT FK_F44A386D10389148 FOREIGN KEY (oseba_id) REFERENCES Oseba (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_F44A386D10389148 ON zasedenost (oseba_id)');
        $this->addSql('ALTER TABLE besedilo RENAME COLUMN prevajalec TO podnaslovIzvirnika');
        $this->addSql('ALTER TABLE pogodba ADD procentOdInkasa NUMERIC(12, 2) DEFAULT NULL');
        $this->addSql('ALTER TABLE pogodba RENAME COLUMN aktivna TO jeProcentOdInkasa');
        $this->addSql('ALTER TABLE programdela ADD stIzvPremDoma INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stIzvPremKopr INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stObiskPremDoma INT DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD stObiskPremKopr INT DEFAULT NULL');

        /**
         * ročno dodano:
         */
        $this->addSql('UPDATE option SET defaultvalue=\'a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}\' where name like \'funkcija.velikost\';');
        $this->addSql('INSERT INTO option (id,name,type,defaultvalue,peruser,readonly,public,role,description) VALUES (\'00000000-5602-c44f-8534-ec38b23617eb\' ,\'avtorbesedila.tipavtorja\' ,\'array\' ,\'a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}\' ,false ,true ,false , null ,\'Tip stroška\');');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE Report DROP CONSTRAINT FK_C38372B2BE04EA9');
        $this->addSql('DROP TABLE Report');
        $this->addSql('DROP TABLE Job');
        $this->addSql('DROP TABLE AvtorBesedila');
        $this->addSql('ALTER TABLE Zasedenost DROP CONSTRAINT FK_F44A386D10389148');
        $this->addSql('DROP INDEX IDX_F44A386D10389148');
        $this->addSql('ALTER TABLE Zasedenost DROP oseba_id');
        $this->addSql('ALTER TABLE Pogodba DROP procentOdInkasa');
        $this->addSql('ALTER TABLE Pogodba RENAME COLUMN jeprocentodinkasa TO aktivna');
        $this->addSql('ALTER TABLE Besedilo RENAME COLUMN podnaslovizvirnika TO prevajalec');
        $this->addSql('ALTER TABLE ProgramDela DROP stIzvPremDoma');
        $this->addSql('ALTER TABLE ProgramDela DROP stIzvPremKopr');
        $this->addSql('ALTER TABLE ProgramDela DROP stObiskPremDoma');
        $this->addSql('ALTER TABLE ProgramDela DROP stObiskPremKopr');

        /**
         * ročno dodano:
         */
        $this->addSql('delete from option where name like \'avtorbesedila.tipavtorja\';');
    }

}
