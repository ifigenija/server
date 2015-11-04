<?php

namespace DoctrineORMModule\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20151104101328 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE TABLE DogodekTehnicni (id UUID NOT NULL, PRIMARY KEY(id))');
        $this->addSql('ALTER TABLE dogodek ADD tehnicni_id UUID DEFAULT NULL');
        $this->addSql('ALTER TABLE dogodek ADD CONSTRAINT FK_11E93B5D590AD7D9 FOREIGN KEY (tehnicni_id) REFERENCES DogodekTehnicni (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_11E93B5D590AD7D9 ON dogodek (tehnicni_id)');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE Dogodek DROP CONSTRAINT FK_11E93B5D590AD7D9');
        $this->addSql('DROP TABLE DogodekTehnicni');
        $this->addSql('DROP INDEX UNIQ_11E93B5D590AD7D9');
        $this->addSql('ALTER TABLE Dogodek DROP tehnicni_id');
    }
}
