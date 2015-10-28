<?php

namespace DoctrineORMModule\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20151028083119 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE TABLE Praznik (id UUID NOT NULL, ime VARCHAR(255) NOT NULL, dan VARCHAR(255) NOT NULL, mesec INT NOT NULL, leto INT DEFAULT NULL, delaProst BOOLEAN NOT NULL, PRIMARY KEY(id))');
        $this->addSql('ALTER TABLE oseba ADD twitter VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE oseba ADD skype VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE oseba ADD fb VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE organizacijskaenota ALTER sifra SET NOT NULL');
        $this->addSql('ALTER TABLE organizacijskaenota ALTER sifra TYPE VARCHAR(255)');
        $this->addSql('ALTER TABLE zaposlitev ALTER sifra TYPE VARCHAR(4)');
//        $this->addSql('CREATE UNIQUE INDEX UNIQ_B2449041559828A3 ON zaposlitev (sifra)');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE SCHEMA public');
        $this->addSql('DROP TABLE Praznik');
        $this->addSql('ALTER TABLE Oseba DROP twitter');
        $this->addSql('ALTER TABLE Oseba DROP skype');
        $this->addSql('ALTER TABLE Oseba DROP fb');
//        $this->addSql('DROP INDEX UNIQ_B2449041559828A3');
        $this->addSql('ALTER TABLE Zaposlitev ALTER sifra TYPE VARCHAR(10)');
        $this->addSql('ALTER TABLE OrganizacijskaEnota ALTER sifra DROP NOT NULL');
        $this->addSql('ALTER TABLE OrganizacijskaEnota ALTER sifra TYPE VARCHAR(2)');
    }
}
