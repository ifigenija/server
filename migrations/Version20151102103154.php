<?php

namespace DoctrineORMModule\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20151102103154 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('ALTER TABLE programdela ADD sredstvaVlozekGostiteljaPrem NUMERIC(12, 2) DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD sredstvaVlozekGostiteljaPonPrem NUMERIC(12, 2) DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD sredstvaVlozekGostiteljaPonPrej NUMERIC(12, 2) DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD sredstvaVlozekGostiteljaGostujo NUMERIC(12, 2) DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD sredstvaVlozekGostiteljaInt NUMERIC(12, 2) DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD sredstvaVlozekGostiteljaFest NUMERIC(12, 2) DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD sredstvaVlozekGostiteljaRazno NUMERIC(12, 2) DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD sredstvaVlozekGostiteljaIzjem NUMERIC(12, 2) DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD sredstvaLastnaPrem NUMERIC(12, 2) DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD sredstvaLastnaPonPrem NUMERIC(12, 2) DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD sredstvaLastnaPonPrej NUMERIC(12, 2) DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD sredstvaLastnaGostujo NUMERIC(12, 2) DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD sredstvaLastnaInt NUMERIC(12, 2) DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD sredstvaLastnaFest NUMERIC(12, 2) DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD sredstvaLastnaRazno NUMERIC(12, 2) DEFAULT NULL');
        $this->addSql('ALTER TABLE programdela ADD sredstvaLastnaIzjem NUMERIC(12, 2) DEFAULT NULL');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE ProgramDela DROP sredstvaVlozekGostiteljaPrem');
        $this->addSql('ALTER TABLE ProgramDela DROP sredstvaVlozekGostiteljaPonPrem');
        $this->addSql('ALTER TABLE ProgramDela DROP sredstvaVlozekGostiteljaPonPrej');
        $this->addSql('ALTER TABLE ProgramDela DROP sredstvaVlozekGostiteljaGostujo');
        $this->addSql('ALTER TABLE ProgramDela DROP sredstvaVlozekGostiteljaInt');
        $this->addSql('ALTER TABLE ProgramDela DROP sredstvaVlozekGostiteljaFest');
        $this->addSql('ALTER TABLE ProgramDela DROP sredstvaVlozekGostiteljaRazno');
        $this->addSql('ALTER TABLE ProgramDela DROP sredstvaVlozekGostiteljaIzjem');
        $this->addSql('ALTER TABLE ProgramDela DROP sredstvaLastnaPrem');
        $this->addSql('ALTER TABLE ProgramDela DROP sredstvaLastnaPonPrem');
        $this->addSql('ALTER TABLE ProgramDela DROP sredstvaLastnaPonPrej');
        $this->addSql('ALTER TABLE ProgramDela DROP sredstvaLastnaGostujo');
        $this->addSql('ALTER TABLE ProgramDela DROP sredstvaLastnaInt');
        $this->addSql('ALTER TABLE ProgramDela DROP sredstvaLastnaFest');
        $this->addSql('ALTER TABLE ProgramDela DROP sredstvaLastnaRazno');
        $this->addSql('ALTER TABLE ProgramDela DROP sredstvaLastnaIzjem');
    }
}
