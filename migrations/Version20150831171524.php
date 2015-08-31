<?php

namespace DoctrineORMModule\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20150831171524 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('ALTER TABLE dogodek ADD allDay BOOLEAN DEFAULT \'false\' NOT NULL');
        $this->addSql('ALTER TABLE dogodek ALTER status TYPE VARCHAR(20)');
        $this->addSql('ALTER TABLE dogodek ALTER status DROP DEFAULT');
        $this->addSql('ALTER TABLE dogodek RENAME COLUMN ime TO title');
        $this->addSql('ALTER INDEX zacetek RENAME TO dogodki_zacetek');
        $this->addSql('ALTER INDEX konec RENAME TO dogodki_konec');
        $this->addSql('ALTER TABLE prostor ADD sePlanira BOOLEAN DEFAULT \'false\' NOT NULL');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE Dogodek DROP allDay');
        $this->addSql('ALTER TABLE Dogodek ALTER status TYPE INT');
        $this->addSql('ALTER TABLE Dogodek ALTER status DROP DEFAULT');
        $this->addSql('ALTER TABLE Dogodek ALTER status TYPE INT');
        $this->addSql('ALTER TABLE Dogodek RENAME COLUMN title TO ime');
        $this->addSql('ALTER INDEX dogodki_konec RENAME TO konec');
        $this->addSql('ALTER INDEX dogodki_zacetek RENAME TO zacetek');
        $this->addSql('ALTER TABLE Prostor DROP sePlanira');
    }
}
