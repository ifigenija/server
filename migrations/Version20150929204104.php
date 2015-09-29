<?php

namespace DoctrineORMModule\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20150929204104
        extends AbstractMigration
{

    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('ALTER TABLE predstava ADD objavljenZacetek TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT NULL');
        $this->addSql('ALTER TABLE dogodek DROP planiranzacetek');
        $this->addSql('ALTER TABLE tipfunkcije ADD sort INT DEFAULT NULL');
        $this->addSql('ALTER TABLE uprizoritev ADD jeKoprodukcija BOOLEAN DEFAULT NULL');
        $this->addSql('ALTER TABLE enotaprograma ADD prizorisce VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE enotaprograma ADD trajanje VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE programskaenotasklopa ADD obiskDoma INT DEFAULT 0 NOT NULL');

        /**
         * ročno dodano:
         */
        /**
         * application.tenant.maticnopodjetje
         *      sedaj id od popa
         */
        $this->addSql('update option set defaultvalue=\'s:36:"\'||(select id from popa where sifra=(select substring((select defaultvalue from option where name like \'application.tenant.maticnopodjetje\') from 6 for 4))) ||\'";\'  where name like \'application.tenant.maticnopodjetje\';');

        /**
         * tip funkcije sort
         */
        $this->addSql('update tipfunkcije set sort=150 where sifra=\'01\';');
        $this->addSql('update tipfunkcije set sort=160 where sifra=\'02\';');
        $this->addSql('update tipfunkcije set sort=20 where sifra=\'03\';');
        $this->addSql('update tipfunkcije set sort=30 where sifra=\'04\';');
        $this->addSql('update tipfunkcije set sort=40 where sifra=\'05\';');
        $this->addSql('update tipfunkcije set sort=60 where sifra=\'06\';');
        $this->addSql('update tipfunkcije set sort=70 where sifra=\'07\';');
        $this->addSql('update tipfunkcije set sort=90 where sifra=\'08\';');
        $this->addSql('update tipfunkcije set sort=100 where sifra=\'09\';');
        $this->addSql('update tipfunkcije set sort=110 where sifra=\'10\';');
        $this->addSql('update tipfunkcije set sort=50 where sifra=\'11\';');
        $this->addSql('update tipfunkcije set sort=80 where sifra=\'12\';');
        $this->addSql('update tipfunkcije set sort=130 where sifra=\'13\';');
        $this->addSql('update tipfunkcije set sort=120 where sifra=\'14\';');
        $this->addSql('update tipfunkcije set sort=10 where sifra=\'15\';');
        $this->addSql('update tipfunkcije set sort=140 where sifra=\'16\';');
        $this->addSql('update tipfunkcije set sort=180 where sifra=\'17\';');
        $this->addSql('update tipfunkcije set sort=170 where sifra=\'18\';');
        /**
         * dogodek.status
         *          610s:            label: Odpovedan
         */
        $this->addSql('UPDATE option SET defaultvalue=\'a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}\' where name like \'dogodek.status\';');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE Predstava DROP objavljenZacetek');
        $this->addSql('ALTER TABLE TipFunkcije DROP sort');
        $this->addSql('ALTER TABLE Dogodek ADD planiranzacetek TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT NULL');
        $this->addSql('ALTER TABLE Uprizoritev DROP jeKoprodukcija');
        $this->addSql('ALTER TABLE EnotaPrograma DROP prizorisce');
        $this->addSql('ALTER TABLE EnotaPrograma DROP trajanje');
        $this->addSql('ALTER TABLE ProgramskaEnotaSklopa DROP obiskDoma');

        /**
         * ročno dodano:
         */
        /**
         * application.tenant.maticnopodjetje
         *      sifra od popa
         */
        $this->addSql('update option set defaultvalue=\'s:36:"\'||(select id from popa where sifra=(select substring((select defaultvalue from option where name like \'application.tenant.maticnopodjetje\') from 6 for 4))) ||\'";\'  where name like \'application.tenant.maticnopodjetje\';');
    }

}
