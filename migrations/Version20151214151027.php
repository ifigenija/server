<?php

namespace DoctrineORMModule\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20151214151027
        extends AbstractMigration
{

    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('ALTER TABLE funkcija ADD alterCount INT DEFAULT 0 NOT NULL');
        $this->addSql('ALTER TABLE programdela ADD stIzvPonPremKoprZamejo NUMERIC(15, 2) DEFAULT \'0\'');
        $this->addSql('ALTER TABLE programdela ADD stIzvPonPremKoprGost NUMERIC(15, 2) DEFAULT \'0\'');
        $this->addSql('ALTER TABLE programdela ADD stIzvPonPrejKoprZamejo NUMERIC(15, 2) DEFAULT \'0\'');
        $this->addSql('ALTER TABLE programdela ADD stIzvPonPrejKoprGost NUMERIC(15, 2) DEFAULT \'0\'');
        $this->addSql('ALTER TABLE programdela ADD stObiskPonPrejKopr INT DEFAULT 0');
        $this->addSql('ALTER TABLE programdela ADD stObiskPonPrejKoprInt INT DEFAULT 0');
        $this->addSql('ALTER TABLE programdela ADD stObiskPonPremGostKopr INT DEFAULT 0');
        $this->addSql('ALTER TABLE programdela ADD stObiskPonPrejGostKopr INT DEFAULT 0');
        $this->addSql('ALTER TABLE programdela ADD stObiskPonPremZamejoKopr INT DEFAULT 0');
        $this->addSql('ALTER TABLE programdela ADD stObiskPonPrejZamejoKopr INT DEFAULT 0');

        /*
         * ročno dodano:
         */
        $this->addSql('update programdela set
                        stIzvPonPremKoprZamejo     = 
                         ( select sum(PonoviKoprZamejo)   from enotaprograma 
                                 where tip=\'ponovitevpremiere\' and program_dela_id=programdela.id)
                       ,stIzvPonPremKoprGost       =
                         ( select sum(PonoviKoprGost)   from enotaprograma 
                                 where tip=\'ponovitevpremiere\' and program_dela_id=programdela.id)
                       ,stIzvPonPrejKoprZamejo     =
                         ( select sum(PonoviKoprZamejo)   from enotaprograma 
                                 where tip=\'ponovitevprejsnjih\' and program_dela_id=programdela.id)
                        ,stIzvPonPrejKoprGost       =
                         ( select sum(PonoviKoprGost)   from enotaprograma 
                                 where tip=\'ponovitevprejsnjih\' and program_dela_id=programdela.id)
                        ,stObiskPonPrejKopr         =
                         ( select sum(ObiskKopr)   from enotaprograma 
                                 where tip=\'ponovitevprejsnjih\' and program_dela_id=programdela.id)

                        ,stObiskPonPremGostKopr     =  
                         ( select sum(ObiskKoprGost)   from enotaprograma 
                                 where tip=\'ponovitevpremiere\' and program_dela_id=programdela.id)
                        ,stObiskPonPrejGostKopr     =
                         ( select sum(ObiskKoprGost)   from enotaprograma 
                                 where tip=\'ponovitevprejsnjih\' and program_dela_id=programdela.id)
                        ,stObiskPonPremZamejoKopr   =
                         ( select sum(ObiskKoprZamejo)   from enotaprograma 
                                 where tip=\'ponovitevpremiere\' and program_dela_id=programdela.id)
                        ,stObiskPonPrejZamejoKopr   =
                         ( select sum(ObiskKoprZamejo)   from enotaprograma 
                                 where tip=\'ponovitevprejsnjih\' and program_dela_id=programdela.id)

                        ,stObiskPonPrejKoprInt      =
                         (select sum(obiskkoprint) from enotaprograma 
                           where program_dela_id=programdela.id 
                              and  tip=\'gostovanje\'
                              and (select count(*)from enotaprograma as ep
                                          where program_dela_id=programdela.id 
                                              and tip=\'premiera\' 
                                              and ep.uprizoritev_id=enotaprograma.uprizoritev_id) 
                               =0)
                     ;');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE Funkcija DROP alterCount');
        $this->addSql('ALTER TABLE ProgramDela DROP stIzvPonPremKoprZamejo');
        $this->addSql('ALTER TABLE ProgramDela DROP stIzvPonPremKoprGost');
        $this->addSql('ALTER TABLE ProgramDela DROP stIzvPonPrejKoprZamejo');
        $this->addSql('ALTER TABLE ProgramDela DROP stIzvPonPrejKoprGost');
        $this->addSql('ALTER TABLE ProgramDela DROP stObiskPonPrejKopr');
        $this->addSql('ALTER TABLE ProgramDela DROP stObiskPonPrejKoprInt');
        $this->addSql('ALTER TABLE ProgramDela DROP stObiskPonPremGostKopr');
        $this->addSql('ALTER TABLE ProgramDela DROP stObiskPonPrejGostKopr');
        $this->addSql('ALTER TABLE ProgramDela DROP stObiskPonPremZamejoKopr');
        $this->addSql('ALTER TABLE ProgramDela DROP stObiskPonPrejZamejoKopr');
    }

}
