<?php

namespace DoctrineORMModule\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20151210170541 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('ALTER TABLE oseba ALTER sifra TYPE VARCHAR(255)');
        $this->addSql('ALTER TABLE popa ALTER sifra TYPE VARCHAR(255)');
        $this->addSql('ALTER TABLE pogodba ALTER sifra TYPE VARCHAR(255)');
        $this->addSql('ALTER TABLE enotaprograma ADD stDogodkov INT DEFAULT 0');
        $this->addSql('ALTER TABLE produkcijskahisa ALTER sifra TYPE VARCHAR(255)');
        $this->addSql('ALTER TABLE programskaenotasklopa ADD stDogodkov INT DEFAULT 1 NOT NULL');
        $this->addSql('ALTER TABLE zapis ADD contributor VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE zapis ADD type VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE zapis ADD format VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE mapa ALTER javnidostop DROP NOT NULL');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE Pogodba ALTER sifra TYPE VARCHAR(7)');
        $this->addSql('ALTER TABLE Oseba ALTER sifra TYPE VARCHAR(4)');
        $this->addSql('ALTER TABLE ProdukcijskaHisa ALTER sifra TYPE VARCHAR(4)');
        $this->addSql('ALTER TABLE popa ALTER sifra TYPE VARCHAR(4)');
        $this->addSql('ALTER TABLE EnotaPrograma DROP stDogodkov');
        $this->addSql('ALTER TABLE ProgramskaEnotaSklopa DROP stDogodkov');
        $this->addSql('ALTER TABLE Mapa ALTER javniDostop SET NOT NULL');
        $this->addSql('ALTER TABLE Zapis DROP contributor');
        $this->addSql('ALTER TABLE Zapis DROP type');
        $this->addSql('ALTER TABLE Zapis DROP format');
    }
}
