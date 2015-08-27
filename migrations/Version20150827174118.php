<?php

namespace DoctrineORMModule\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20150827174118 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('ALTER TABLE uprizoritev ADD naslovIzvirnika VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE uprizoritev ADD podnaslovIzvirnika VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE uprizoritev ADD krstna BOOLEAN DEFAULT NULL');
        $this->addSql('ALTER TABLE uprizoritev ADD prvaSlovenska BOOLEAN DEFAULT NULL');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE Uprizoritev DROP naslovIzvirnika');
        $this->addSql('ALTER TABLE Uprizoritev DROP podnaslovIzvirnika');
        $this->addSql('ALTER TABLE Uprizoritev DROP krstna');
        $this->addSql('ALTER TABLE Uprizoritev DROP prvaSlovenska');
    }
}
