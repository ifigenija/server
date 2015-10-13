<?php

namespace DoctrineORMModule\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20151013160827 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE TABLE TipPopa (id UUID NOT NULL, ime VARCHAR(255) NOT NULL, opis TEXT DEFAULT NULL, sort INT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_1D3070055CCA980 ON TipPopa (ime)');
        $this->addSql('ALTER TABLE popa ADD tipkli_id UUID DEFAULT NULL');
        $this->addSql('ALTER TABLE popa ADD CONSTRAINT FK_1C7ADBA589552CB2 FOREIGN KEY (tipkli_id) REFERENCES TipPopa (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_1C7ADBA589552CB2 ON popa (tipkli_id)');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE popa DROP CONSTRAINT FK_1C7ADBA589552CB2');
        $this->addSql('DROP TABLE TipPopa');
        $this->addSql('DROP INDEX IDX_1C7ADBA589552CB2');
        $this->addSql('ALTER TABLE popa DROP tipkli_id');
    }
}
