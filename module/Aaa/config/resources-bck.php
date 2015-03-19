<?php


return [
        'ZfcRbac\Guard\ControllerGuard' => [
            [
                'controller' => 'aaa\user',
                'actions' => ['login', 'logout'],
                'roles' => ['*']
            ],
            [
                'controller' => 'aaa\user',
                'actions' => ['pregled', 'index'],
                'roles' => ['tip-beri-vse', 'administrator-dostopov']
            ],
            [
                'controller' => 'aaa\user',
                'actions' => ['uredi', 'brisi', 'dodaj', 'addRole', 'removeRole'],
                'roles' => ['tip-beri-vse', 'administrator-dostopov']
            ],
            [
                'controller' => 'aaa\user',
                'actions' => ['changePassword'],
                'roles' => ['prijavljen-uporabnik']
            ],
            [
                'controller' => 'aaa\group',
                'actions' => ['pregled', 'index'],
                'roles' => ['tip-beri-vse', 'administrator-dostopov']
            ],
            [
                'controller' => 'aaa\group',
                'actions' => ['uredi', 'addUser', 'removeUser', 'dodaj'],
                'roles' => ['administrator-dostopov']
            ],
            [
                'controller' => 'aaa\role',
                'actions' => ['pregled', 'index'],
                'roles' => ['tip-beri-vse', 'administrator-dostopov']
            ],
            [
                'controller' => 'aaa\role',
                'actions' => ['uredi', 'addPermission', 'removePermission', 'dodaj'],
                'roles' => ['administrator-dostopov']            
            ],

            
            
            
            
            
               
            [
                'controller' => 'logistika\cenikrest',
                'actions' => ['index'],
                'roles' => ['tip-vse']
            ],
            [
                'controller' => 'logistika\dobava',
                'actions' => ['dodaj', 'index', 'indexPrint', 'paketi', 'odstraniPaket', 'odstraniVsePakete', 'pakiranje', 'priponke', 'pregled', 'uredi', 'dodajTujiPaket', 'odstraniTujiPaket', 'paketiPripravljeni', 'vrniVPripravljanjePaketov', 'tiskajEtikete', 'fiksiraj'],
                'roles' => ['tip-vse']
            ],           
            [
                'controller' => 'logistika\lokacije',
                'actions' => ['index', 'manager'],
                'roles' => ['tip-vse']
            ],
            [
                'controller' => 'logistika\lokacijerest',
                'actions' => ['index'],
                'roles' => ['tip-vse']
            ],
            [
                'controller' => 'logistika\matdokument',
                'actions' => ['pregled', 'kolicinskiPrevzem', 'print'],
                'roles' => ['tip-vse']
            ],
            [
                'controller' => 'logistika\matdokumentrest',
                'actions' => ['index'],
                'roles' => ['tip-vse']
            ],
            [
                'controller' => 'logistika\pakiraj',
                'actions' => ['index', 'brisiPoreklo', 'dolociNadpaket', 'dopolniPaket', 'endpakTrans', 'info', 'tiskajEtiketo', 'nepredani', 'operacija', 'pakiraj', 'pausepak', 'pocistiStanje', 'predajZbirno', 'prekliciPakiranje', 'premakniPakete', 'premakniPoreklo', 'pretvori', 'razstaviPakiranje', 'seznam', 'popis', 'pakirajNovi', 'startpak', 'zakljuci', 'sestavljanje', 'sestavljanjeNadpaket', 'sestavljanjeOdstrani'],
                'roles' => ['tip-vse']
            ],
            [
                'controller' => 'logistika\prikazlokacijerest',
                'actions' => ['index'],
                'roles' => ['tip-vse']
            ],
            [
                'controller' => 'logistika\statistika',
                'actions' => ['index', 'zalogaIzpis'],
                'roles' => ['tip-vse']
            ],
            [
                'controller' => 'logistika\task',
                'actions' => ['TiskEtiketPaketov'],
                'roles' => ['tip-vse']
            ],
            [
                'controller' => 'logistika\zaloga',
                'actions' => ['index', 'kartica'],
                'roles' => ['tip-vse']
            ],
            [
                'controller' => 'logistika\zalogarest',
                'actions' => ['index'],
                'roles' => ['tip-vse']
            ],
        
            
            
            
            
            
            
              [
                'controller' => 'narocila\narocilodob',
                'actions' => ['index', 'pregled', 'print'],
                'roles' => ['narocila-vse']
            ],
            [
                'controller' => 'narocila\narocilodob',
                'actions' => ['ustvariPrevzem', 'ustvari'],
                'roles' => ['narocila-vse']
            ],
            [
                'controller' => 'narocila\narocilodobrest',
                'roles' => ['narocila-vse']
            ],
            [
                'controller' => 'narocila\narocilokup',
                'actions' => ['index', 'pregled', 'ustvari'],
                'roles' => ['narocila-vse']
            ],
            [
                'controller' => 'narocila\narocilokuprest',
                'roles' => ['narocila-vse']
            ],
            [
                'controller' => 'narocila\ponudba',
                'actions' => ['index', 'pregled', 'print'],
                'roles' => ['narocila-vse']
            ],
            [
                'controller' => 'narocila\ponudbarest',
                'roles' => ['narocila-vse']
            ],
                   
                   
                   
                                     
            [
                'controller' => 'proizvodnja\delo',
                'actions' => ['deloPoDelavcu', 'deloPoDelavcuPrekrivanjeUr', 'deloPoDn', 'index'],
                'roles' => ['proizvodnja-vse']
            ],
            [
                'controller' => 'proizvodnja\dn',
                'actions' => ['brisiPorekloPaketov', 'brisiRazpisanePakete', 'index', 'odprti', 'pregled', 'tiskajEtiketeJob'],
                'roles' => ['proizvodnja-vse']
            ],
            [
                'controller' => 'proizvodnja\koledar',
                'actions' => ['index', 'tehkoledar'],
                'roles' => ['proizvodnja-vse']
            ],
            [
                'controller' => 'proizvodnja\koledarrest',
                'actions' => ['index', 'delovneUre'],
                'roles' => ['proizvodnja-vse']
            ],
            [
                'controller' => 'proizvodnja\plan',
                'actions' => ['index', 'view'],
                'roles' => ['proizvodnja-vse']
            ],
            [
                'controller' => 'proizvodnja\poslovniplan',
                'actions' => ['index', 'preracunaj', 'prometPoObdobjih', 'prometPoKlas', 'zasedenost', 'zasedenostDash', 'zasedenostLetno', 'ureZaTehen', 'urePoKlas', 'urePoStatus', 'urePoStatusZaTe', 'prometStoritev', 'prometStoritevDob', 'prometStoritevObd', 'prometMat', 'prometMatPoKupcih', 'prometMatPoObdobjih', 'prometMatPoStatus', 'gibanjeZaloge', 'potrebePoDelavcih'],
                'roles' => ['proizvodnja-vse']
            ],
            [
                'controller' => 'proizvodnja\pp',
                'roles' => ['proizvodnja-vse']
            ],
            [
                'controller' => 'proizvodnja\ppartikla',
                'roles' => ['proizvodnja-vse']
            ],
            [
                'controller' => 'proizvodnja\ppkadri',
                'roles' => ['proizvodnja-vse']
            ],
            [
                'controller' => 'proizvodnja\ppnapoved',
                'roles' => ['proizvodnja-vse']
            ],
            [
                'controller' => 'proizvodnja\ppnarocilo',
                'roles' => ['proizvodnja-vse']
            ],
            [
                'controller' => 'proizvodnja\ppobdobje',
                'roles' => ['proizvodnja-vse']
            ],
            [
                'controller' => 'proizvodnja\ppproizvodnja',
                'roles' => ['proizvodnja-vse']
            ],
            [
                'controller' => 'proizvodnja\ppuretehen',
                'roles' => ['proizvodnja-vse']
            ],
            [
                'controller' => 'proizvodnja\statustehen',
                'actions' => ['index'],
                'roles' => ['proizvodnja-vse']
            ],
            [
                'controller' => 'proizvodnja\tekoledarrest',
                'actions' => ['index', 'delovneUre'],
                'roles' => ['proizvodnja-vse']
            ],
        
            
            

 
            [
                'controller' => 'tip\paginatorMeta',
                'roles' => ['prijavljen-uporabnik']
            ],
            [
                'controller' => 'tip\formMeta',
                'roles' => ['prijavljen-uporabnik']
            ],
            [
                'controller' => 'tip\kontekst',
                'roles' => ['prijavljen-uporabnik']
            ],
            [
                'controller' => 'tip\tiskalniki',
                'roles' => ['prijavljen-uporabnik']
            ],
            [
                'controller' => 'tip\revizije',
                'roles' => ['revizijska-sled']
            ],            
            [
                'controller' => 'tip\index',
                'roles' => ['prijavljen-uporabnik']
            ],
            
            
            
            
            [
                'controller' => 'workflow\job',
                'roles' => ['prijavljen-uporabnik']
            ],
            [
                'controller' => 'workflow\jobrest',
                'roles' => ['prijavljen-uporabnik']
            ]
        ]
    
    
    ];



















/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

return [
  'ACL' => [
        'type1' => [
            ['value' => 'Narocila\Ponudba\index', 'name' => 'Ponudbe - Seznam ponudb kupcem', 'skupina' => 'narocila'],
            ['value' => 'Narocila\Ponudba\pregled', 'name' => 'Ponudbe - Pregled ponudbe kupcem', 'skupina' => 'narocila'],
            ['value' => 'Narocila\Ponudba\print', 'name' => 'Ponudbe - Printanje ponudb kupcem', 'skupina' => 'narocila'],
            ['value' => 'Narocila\NarociloDob\index', 'name' => 'Naročila - Pregled naročil dobaviteljem', 'skupina' => 'narocila'],
            ['value' => 'Narocila\NarociloDob\pregled', 'name' => 'Naročila - Pregled naročila dobavitelju', 'skupina' => 'narocila'],
            ['value' => 'Narocila\NarociloDob\ustvariPrevzem', 'name' => 'Naročila - Ustvari prevzem iz naročila', 'skupina' => 'narocila'],
            ['value' => 'Narocila\NarociloDob\ustvari', 'name' => 'Naročila - Ustvari novo naročilo dobavitelju', 'skupina' => 'narocila'],
            ['value' => 'Narocila\NarociloDobRest\index', 'name' => 'Naročila dobaviteljem - REST akcije', 'skupina' => 'narocila'],
            ['value' => 'Narocila\NarociloKup\index', 'name' => 'Naročila - Pregled naročil kupcev', 'skupina' => 'narocila'],
            ['value' => 'Narocila\NarociloKup\pregled', 'name' => 'Naročila - Pregled naročila kupca', 'skupina' => 'narocila'],
            ['value' => 'Narocila\NarociloKup\ustvari', 'name' => 'Naročila - Ustvari novo naročilo kupca', 'skupina' => 'narocila'],
            ['value' => 'Narocila\NarociloKupRest\index', 'name' => 'Naročila kupcev - REST akcije', 'skupina' => 'narocila'],
            ['value' => 'Narocila\PonudbaRest\index', 'name' => 'Ponudbe - REST akcije', 'skupina' => 'narocila'],
            // Logistika
            ['value' => 'Logistika\Dobava\dodaj', 'name' => 'Logistika - dodajanje dobav', 'skupina' => 'log'],
            ['value' => 'Logistika\Dobava\index', 'name' => 'Logistika - pregled dobav', 'skupina' => 'log'],
            ['value' => 'Logistika\Dobava\indexPrint', 'name' => 'Logistika - printanje dobav', 'skupina' => 'log'],
            ['value' => 'Logistika\Dobava\paketi', 'name' => 'Logistika - paketi za dobavo/dn', 'skupina' => 'log'],
            ['value' => 'Logistika\Dobava\odstraniPaket', 'name' => 'Logistika - dodaj paket na dobavo', 'skupina' => 'log'],
            ['value' => 'Logistika\Dobava\odstraniVsePakete', 'name' => 'Logistika - odstrani vse pakete', 'skupina' => 'log'],
            ['value' => 'Logistika\Dobava\pakiranje', 'name' => 'Logistika - dodaj/odstrani pakiranje na dobavi', 'skupina' => 'log'],
            ['value' => 'Logistika\Dobava\priponke', 'name' => 'Logistika - upravljanje priponk', 'skupina' => 'log'],
            ['value' => 'Logistika\Dobava\pregled', 'name' => 'Logistika - pregled dobave', 'skupina' => 'log'],
            ['value' => 'Logistika\Dobava\uredi', 'name' => 'Logistika - urejanje dobave', 'skupina' => 'log'],
            ['value' => 'Logistika\Dobava\dodajTujiPaket', 'name' => 'Logistika - dodaj tuji paket na dobavo', 'skupina' => 'log'],
            ['value' => 'Logistika\Dobava\odstraniTujiPaket', 'name' => 'Logistika - odstrani tuji paket iz dobave', 'skupina' => 'log'],
            ['value' => 'Logistika\Dobava\paketiPripravljeni', 'name' => 'Logistika - označi, da so paketi na dobavi pripravljeni', 'skupina' => 'log'],
            ['value' => 'Logistika\Dobava\vrniVPripravljanjePaketov', 'name' => 'Logistika - vrni se v pripravljenje paketov dobave', 'skupina' => 'log'],
            ['value' => 'Logistika\Dobava\tiskajEtikete', 'name' => 'Logistika - tiskalnje logističnih etiket za dobavo', 'skupina' => 'log'],
            ['value' => 'Logistika\Dobava\fiksiraj', 'name' => 'Logistika - fiksiranje dobave', 'skupina' => 'log'],
            
            ['value' => 'Logistika\Matdokument\pregled', 'name' => 'Logistika - Pregled materialnega dokumenta', 'skupina' => 'log'],
            ['value' => 'Logistika\Matdokument\kolicinskiPrevzem', 'name' => 'Logistika - AJAX akcija količinskega prevzema', 'skupina' => 'log'],
            ['value' => 'Logistika\Matdokument\print', 'name' => 'Logistika - Printanje materialnih dokumetov', 'skupina' => 'log'],
            ['value' => 'Logistika\MatdokumentRest\index', 'name' => 'Logistika - REST akcije materialnih dokumentov', 'skupina' => 'log'],
            ['value' => 'Logistika\LogiDokumentDobavnica\index' , 'name' => 'Logistika - REST akcije materialnih dokumentov dobavnic', 'skupina' => 'log'],
            ['value' => 'Logistika\LogiDokumentIzdajnica\index', 'name' => 'Logistika - REST akcije materialnih dokumentov izdajnic', 'skupina' => 'log'],
            ['value' => 'Logistika\LogiDokumentPredajnica\index', 'name' => 'Logistika - REST akcije materialnih dokumentov predajnic', 'skupina' => 'log'],
            ['value' => 'Logistika\LogiDokumentPrevrednotenje\index', 'name' => 'Logistika - REST akcije materialnih dokumentov prevrednotenja', 'skupina' => 'log'],
            ['value' => 'Logistika\LogiDokumentPremik\index', 'name' => 'Logistika - REST akcije materialnih dokumentov premikov', 'skupina' => 'log'],
            ['value' => 'Logistika\LogiDokumentPrevzemnica\index', 'name' => 'Logistika - REST akcije materialnih dokumentov prevzemnic', 'skupina' => 'log'],
            ['value' => 'Logistika\CenikRest\index', 'name' => 'Logistika - REST akcije cenika', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\index', 'name' => 'Logistika - Pregled pakirnih operacij', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\brisiPoreklo', 'name' => 'Logistika - Brisanje porekla', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\dolociNadpaket', 'name' => 'Logistika - Določitev nad paketa', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\dopolniPaket', 'name' => 'Logistika - Dopolnitev paketa', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\endpakTrans', 'name' => 'Logistika - Zaključek transakcije pakiranja', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\info', 'name' => 'Logistika - Pregled informacij o paketu', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\tiskajEtiketo', 'name' => 'Logistika - Tiskaj etiketo posameznega paketa', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\nepredani', 'name' => 'Logistika - Pregled nepredanih paketov', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\operacija', 'name' => 'Logistika - Urejanje operacije pakiranja', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\pakiraj', 'name' => 'Logistika - Pakiranje', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\pausepak', 'name' => 'Logistika - Prekinitev pakiranja', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\pocistiStanje', 'name' => 'Logistika - Počisti stanje', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\predajZbirno', 'name' => 'Logistika - Predaja', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\prekliciPakiranje', 'name' => 'Logistika - Preklic pakiranja', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\premakniPakete', 'name' => 'Logistika - premakni pakete', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\premakniPoreklo', 'name' => 'Logistika - premakni poreklo', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\pretvori', 'name' => 'Logistika - pretvori pakete', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\razstaviPakiranje', 'name' => 'Logistika - razstavi pakiranje', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\seznam', 'name' => 'Logistika - Ssznam pakiranj', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\popis', 'name' => 'Logistika - Popis paketov - začasno', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\pakirajNovi', 'name' => 'Logistika - Popis paketov - vnos podatkiv o novem paketu', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\startpak', 'name' => 'Logistika - začni pakiranje', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\zakljuci', 'name' => 'Logistika - končaj pakiranje', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\sestavljanje', 'name' => 'Logistika - sestavi pakiranje', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\sestavljanjeNadpaket', 'name' => 'Logistika - sestavi pakiranje', 'skupina' => 'log'],
            ['value' => 'Logistika\Pakiraj\sestavljanjeOdstrani', 'name' => 'Logistika - odstrani iz seznama paketov', 'skupina' => 'log'],
            ['value' => 'Logistika\Task\TiskEtiketPaketov', 'name' => 'Logistika - opravila - sproži tiskanje etiket - ', 'skupina' => 'log'],
            ['value' => 'Logistika\LokacijeRest\index', 'name' => 'Rest akcije za Logistične lokacije ', 'skupina' => 'log'],
            ['value' => 'Logistika\Lokacije\index', 'name' => 'Pregled lokacij', 'skupina' => 'log'],
            ['value' => 'Logistika\Lokacije\manager', 'name' => 'Akcija za upravljanje lokacij ', 'skupina' => 'log'],
            ['value' => 'Logistika\Zaloga\index', 'name' => 'Logistika - pregled zalog', 'skupina' => 'log'],
            ['value' => 'Logistika\ZalogaRest\index', 'name' => 'Rest vmesnik za pregled zaloge', 'skupina' => 'log'],
            ['value' => 'Logistika\Zaloga\kartica', 'name' => 'Logistika - kartica artiklov', 'skupina' => 'log'],
            ['value' => 'Logistika\PrikazLokacijeRest\index', 'name' => 'REST controller za prikaz lokacij (markerji)', 'skupina' => 'sistem'],
            ['value' => 'Logistika\Statistika\index', 'name' => 'Prikaz raznih statistik', 'skupina' => 'sistem'],
            ['value' => 'Logistika\Statistika\zalogaIzpis', 'name' => 'Izpis izdobav po zalogah', 'skupina' => 'sistem'],
            ['value' => 'Proizvodnja\Delo\deloPoDelavcu', 'name' => 'Proizvodnja - delo po delavcu', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\Delo\deloPoDelavcuPrekrivanjeUr', 'name' => 'Proizvodnja - delo po delavcu - prekrivanje ur', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\Delo\deloPoDn', 'name' => 'Proizvodnja - delo po delovnem nalogu', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\Delo\index', 'name' => 'Proizvodnja - pregled podatkov o delu', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\Delo\Zakljuci', 'name' => 'Proizvodnja - zaključitev operacije', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\Dn\brisiPorekloPaketov', 'name' => 'Proizvodnja - brisanje porekla paketov', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\Dn\brisiRazpisanePakete', 'name' => 'Proizvodnja - brisanje razpisa paketov', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\Dn\index', 'name' => 'Proizvodnja - pregled delovnin nalogov', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\Dn\odprti', 'name' => 'Proizvodnja - pregled odprtih delovnih nalogov', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\Dn\pregled', 'name' => 'Proizvodnja - pregled delovnega naloga', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\Dn\tiskajEtiketeJob', 'name' => 'Proizvodnja - Tiskaj etikete delovnega naloga preko job managerja', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\Koledar\index', 'name' => 'Koledar', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\Koledar\tehkoledar', 'name' => 'Koledar', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\Plan\index', 'name' => 'Proizvodnja - plan', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\Plan\view', 'name' => 'Proizvodnja - pregled plana', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\StatusTehen\index', 'name' => 'Trenutni status tehnoloških enot', 'skupina' => 'pro'],
            // poslovni plan
            ['value' => 'Proizvodnja\PoslovniPlan\index', 'name' => 'Proizvodnja - poslovni plan', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PoslovniPlan\preracunaj', 'name' => 'Plan Kapacitet - json akcija za proženje preračuna', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PoslovniPlan\prometPoObdobjih', 'name' => 'Plan Kapacitet - promet po obdobjih', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PoslovniPlan\prometPoKlas', 'name' => 'Plan Kapacitet - promet po kupcih', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PoslovniPlan\zasedenost', 'name' => 'Plan Kapacitet - zasedenost tehnoloških', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PoslovniPlan\zasedenostDash', 'name' => 'Plan Kapacitet - zasedenost tehnoloških za dashboard', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PoslovniPlan\zasedenostLetno', 'name' => 'Plan Kapacitet - zasedenost tehnoloških letno plan', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PoslovniPlan\ureZaTehen', 'name' => 'Plan Kapacitet - vsote ur za poslovni plan', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PoslovniPlan\urePoKlas', 'name' => 'Plan Kapacitet - vsote ur za poslovni plan', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PoslovniPlan\urePoStatus', 'name' => 'Plan Kapacitet - vsote ur za poslovni plan po statusu', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PoslovniPlan\urePoStatusZaTe', 'name' => 'Plan Kapacitet - vsote ur za poslovni plan po statusu združeno po Tehen', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PoslovniPlan\prometStoritev', 'name' => 'Plan Kapacitet - promet storitev po obdobjih', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PoslovniPlan\prometStoritevDob', 'name' => 'Plan Kapacitet - promet storitev za dobavitelja', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PoslovniPlan\prometStoritevObd', 'name' => 'Plan Kapacitet - promet storitev za obdobje', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PoslovniPlan\prometMat', 'name' => 'Plan Kapacitet - promet materiala', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PoslovniPlan\prometMatPoKupcih', 'name' => 'Plan Kapacitet - promet materiala po kupcih', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PoslovniPlan\prometMatPoObdobjih', 'name' => 'Plan Kapacitet - promet materiala po obdobjih', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PoslovniPlan\prometMatPoStatus', 'name' => 'Plan Kapacitet - promet materiala po statusih', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PoslovniPlan\gibanjeZaloge', 'name' => 'Plan Kapacitet - gibanje zaloge', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PoslovniPlan\potrebePoDelavcih', 'name' => 'Plan Kapacitet - gibanje zaloge', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\Pp\index', 'name' => 'Proizvodnja - Rest vmesnik za poslovni plan', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PpArtikla\index', 'name' => 'Proizvodnja - Rest vmesnik za artikle v poslovnem planu ', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PpNarocilo\index', 'name' => 'Proizvodnja - Rest vmesnik za naročila v poslovnem planu', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PpProizvodnja\index', 'name' => 'Proizvodnja - Rest vmesnik za proizvodne postavke v poslovnem planu', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PpObdobje\index', 'name' => 'Proizvodnja - Rest vmesnik za Obdobja poslovnega plana', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PpNapoved\index', 'name' => 'Proizvodnja - Rest vmesnik za napoved v poslvnem planu', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PpUreTehen\index', 'name' => 'Proizvodnja - Rest vmesnik na ure po obdobjih poslovnega plana', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\PpKadri\index', 'name' => 'Proizvodnja - Rest vmesnik za kadrovske resurde', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\koledarRest\index', 'name' => 'REST dostop do koledarja', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\tekoledarRest\index', 'name' => 'REST dostop do tehnološkega koledarja', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\koledarRest\delovneUre', 'name' => 'REST akcija za pridobitev delovnih ur na koledarju', 'skupina' => 'pro'],
            ['value' => 'Proizvodnja\tekoledarRest\delovneUre', 'name' => 'REST akcija za pridobitev delovnih ur na koledarju', 'skupina' => 'pro'],
            // šifranti
            ['value' => 'Sifrant\Kontaktna\index', 'name' => 'Šifranti - Kontaktne osebe', 'controller' => 'Crud', 'entity' => 'Kontaktna', 'skupina' => 'sif'],
            ['value' => 'Sifrant\StevilcenjeDokumenta\index', 'name' => 'Šifranti - številčenje dokumenta', 'controller' => 'Crud', 'entity' => 'StevilcenjeDokumenta', 'skupina' => 'sif'],
            ['value' => 'Sifrant\StevilcenjeDokumenta\pregled', 'name' => 'Šifranti - pregled številčenj dokumentov', 'controller' => 'Crud', 'entity' => 'StevilcenjeDokumenta', 'skupina' => 'sif'],
            ['value' => 'Sifrant\StevilcenjeDokumenta\uredi', 'name' => 'Šifranti - urejanje številčenj dokumentov', 'controller' => 'Crud', 'entity' => 'StevilcenjeDokumenta', 'skupina' => 'sif'],
            ['value' => 'Sifrant\StevilcenjeDokumenta\dodaj', 'name' => 'Šifranti - dodajanje številčenj dokumentov', 'controller' => 'Crud', 'entity' => 'StevilcenjeDokumenta', 'skupina' => 'sif'],
            ['value' => 'Sifrant\StevilcenjeDokumenta\brisi', 'name' => 'Šifranti - brisanje številčenj dokumentov', 'controller' => 'Crud', 'entity' => 'StevilcenjeDokumenta', 'skupina' => 'sif'],
            ['value' => 'Sifrant\StevilcenjePoSkl\index', 'name' => 'Šifranti - številčenje dokumenta - po skladišču', 'controller' => 'Crud', 'entity' => 'StevilcenjePoSkl', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Drzava\index', 'name' => 'Šifranti - države', 'controller' => 'Crud', 'entity' => 'Drzava', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Drzava\pregled', 'name' => 'Šifranti - pregled držav', 'controller' => 'Crud', 'entity' => 'Drzava', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Drzava\uredi', 'name' => 'Šifranti - urejanje držav', 'controller' => 'Crud', 'entity' => 'Drzava', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Drzava\dodaj', 'name' => 'Šifranti - dodajanje držav', 'controller' => 'Crud', 'entity' => 'Drzava', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Drzava\brisi', 'name' => 'Šifranti - brisanje držav', 'controller' => 'Crud', 'entity' => 'Drzava', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Klasifikacija\index', 'name' => 'Šifranti - klasifikacije', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Klas\manager', 'name' => 'Šifranti - klasifikacije - upravljanje', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Klasifikacija\pregled', 'name' => 'Šifranti - pregled klasifikacij', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Klasifikacija\uredi', 'name' => 'Šifranti - urejanje klasifikacij', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Klasifikacija\dodaj', 'name' => 'Šifranti - dodajanje klasifikacij', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Klasifikacija\brisi', 'name' => 'Šifranti - brisanje klasifikacij', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Popa\index', 'name' => 'Šifranti - poslovni partnerji', 'controller' => 'Crud', 'entity' => 'Popa', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Popa\pregled', 'name' => 'Šifranti - pregled poslovnih partnerjev', 'controller' => 'Crud', 'entity' => 'Popa', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Popa\dodaj', 'name' => 'Šifranti - dodajanje poslovnih partnerjev', 'controller' => 'Crud', 'entity' => 'Popa', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Popa\uredi', 'name' => 'Šifranti - urejanje poslovnih partnerjev', 'controller' => 'Crud', 'entity' => 'Popa', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Popa\brisi', 'name' => 'Šifranti - brisanje poslovnih partnerjev', 'controller' => 'Crud', 'entity' => 'Popa', 'skupina' => 'sif'],
            ['value' => 'Sifrant\PostniNaslov\uredi', 'name' => 'Šifranti - urejanje poštnih naslovov', 'controller' => 'Crud', 'entity' => 'PostniNaslov', 'skupina' => 'sif'],
            ['value' => 'Sifrant\PostniNaslov\uredi', 'name' => 'Šifranti - urejanje poštnih naslovov', 'controller' => 'Crud', 'entity' => 'PostniNaslov', 'skupina' => 'sif'],
            ['value' => 'Sifrant\PostniNaslov\pregled', 'name' => 'Šifranti - pregled poštnih naslovov', 'controller' => 'Crud', 'entity' => 'PostniNaslov', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Kontaktna\uredi', 'name' => 'Šifranti - urejanje kontaktnih oseb', 'controller' => 'Crud', 'entity' => 'Kontaktna', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Kontaktna\pregled', 'name' => 'Šifranti - pregled kontaktnih oseb', 'controller' => 'Crud', 'entity' => 'Kontaktna', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Kontaktna\dodaj', 'name' => 'Šifranti - dodajanje kontaktnih oseb', 'controller' => 'Crud', 'entity' => 'Kontaktna', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Kontaktna\brisi', 'name' => 'Šifranti - brisanje kontaktnih oseb', 'controller' => 'Crud', 'entity' => 'Kontaktna', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Logistika-OdvisniStroski\index', 'name' => 'Šifranti - odvisni stroški', 'controller' => 'Crud', 'entity' => 'Logistika-OdvisniStroski', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Logistika-OdvisniStroski\pregled', 'name' => 'Šifranti - pregled odvisnih stroškov', 'controller' => 'Crud', 'entity' => 'Logistika-OdvisniStroski', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Logistika-OdvisniStroski\uredi', 'name' => 'Šifranti - urejanje odvisnih stroškov', 'controller' => 'Crud', 'entity' => 'Logistika-OdvisniStroski', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Logistika-OdvisniStroski\dodaj', 'name' => 'Šifranti - dodajanje odvisnih stroškov', 'controller' => 'Crud', 'entity' => 'Logistika-OdvisniStroski', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Logistika-OdvisniStroski\brisi', 'name' => 'Šifranti - brisanje odvisnih stroškov', 'controller' => 'Crud', 'entity' => 'Logistika-OdvisniStroski', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Sifra\index', 'name' => 'Šifranti - Šifre', 'controller' => 'Crud', 'entity' => 'Sifra', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Sifra\dodaj', 'name' => 'Šifranti - dodajanje šifer', 'controller' => 'Crud', 'entity' => 'Sifra', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Sifre\index', 'name' => 'Šifranti - šifre po klasifikaciji', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Sifre\klas', 'name' => 'Šifranti - šifre po klasifikaciji', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Sifre\pregled', 'name' => 'Šifranti - pregled šifer', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Artikel\index', 'name' => 'Šifranti - artikli', 'controller' => 'Crud', 'entity' => 'Artikel', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Artikel\dodaj', 'name' => 'Šifranti - artikli', 'controller' => 'Crud', 'entity' => 'Artikel', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Artikel\pregled', 'name' => 'Šifranti - pregled artiklov', 'controller' => 'Crud', 'entity' => 'Artikel', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Artikel\uredi', 'name' => 'Šifranti - urejanje artiklov', 'controller' => 'Crud', 'entity' => 'Artikel', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Artikel\brisi', 'name' => 'Šifranti - brisanje artiklov', 'controller' => 'Crud', 'entity' => 'Artikel', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Tehen\index', 'name' => 'Šifranti - tehnološke enote', 'controller' => 'Crud', 'entity' => 'Tehen', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Tehen\pregled', 'name' => 'Šifranti - pregled tehnoloških enot', 'controller' => 'Crud', 'entity' => 'Tehen', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Tehen\dodaj', 'name' => 'Šifranti - dodajanje tehnoloških enot', 'controller' => 'Crud', 'entity' => 'Tehen', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Tehen\uredi', 'name' => 'Šifranti - urejanje tehnoloških enot', 'controller' => 'Crud', 'entity' => 'Tehen', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Tehen\brisi', 'name' => 'Šifranti - brisanje tehnoloških enot', 'controller' => 'Crud', 'entity' => 'Tehen', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Delavec\index', 'name' => 'Šifranti - delavci', 'controller' => 'Crud', 'entity' => 'Delavec', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Delavec\pregled', 'name' => 'Šifranti - pregled delavcev', 'controller' => 'Crud', 'entity' => 'Delavec', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Delavec\dodaj', 'name' => 'Šifranti - dodajanje delavcev', 'controller' => 'Crud', 'entity' => 'Delavec', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Delavec\uredi', 'name' => 'Šifranti - urejanje delavcev', 'controller' => 'Crud', 'entity' => 'Delavec', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Delavec\brisi', 'name' => 'Šifranti - brisanje delavcev', 'controller' => 'Crud', 'entity' => 'Delavec', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Operacija\index', 'name' => 'Šifranti - operacije', 'controller' => 'Crud', 'entity' => 'Operacija', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Operacija\pregled', 'name' => 'Šifranti - pregled operacij', 'controller' => 'Crud', 'entity' => 'Operacija', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Operacija\dodaj', 'name' => 'Šifranti - dodajanje operacij', 'controller' => 'Crud', 'entity' => 'Operacija', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Operacija\uredi', 'name' => 'Šifranti - urejanje operacij', 'controller' => 'Crud', 'entity' => 'Operacija', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Operacija\brisi', 'name' => 'Šifranti - brisanje operacij', 'controller' => 'Crud', 'entity' => 'Operacija', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Skladisce\index', 'name' => 'Šifranti - skladišča', 'controller' => 'Crud', 'entity' => 'Skladisce', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Skladisce\pregled', 'name' => 'Šifranti - pregled skladišč', 'controller' => 'Crud', 'entity' => 'Skladisce', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Skladisce\dodaj', 'name' => 'Šifranti - dodajanje skladišč', 'controller' => 'Crud', 'entity' => 'Skladisce', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Skladisce\uredi', 'name' => 'Šifranti - urejanje skladišč', 'controller' => 'Crud', 'entity' => 'Skladisce', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Skladisce\brisi', 'name' => 'Šifranti - brisanje skladišč', 'controller' => 'Crud', 'entity' => 'Skladisce', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Sklop\index', 'name' => 'Šifranti - Sklopi', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Sklop\pregled', 'name' => 'Šifranti - pregled sklopov', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Sklop\dodaj', 'name' => 'Šifranti - dodajanje sklopov', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Sklop\uredi', 'name' => 'Šifranti - urejanje sklopov', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Sklop\brisi', 'name' => 'Šifranti - brisanje sklopov', 'skupina' => 'sif'],
            ['value' => 'Sifrant\SklopPozi\uredi', 'name' => 'Šifranti - urejanje pozicij sklopov', 'skupina' => 'sif'],
            ['value' => 'Sifrant\SklopPozi\urediMV', 'name' => 'Šifranti - urejanje pozicij sklopov', 'skupina' => 'sif'],
            ['value' => 'Sifrant\SklopPozi\dodaj', 'name' => 'Šifranti - dodajanje pozicij sklopov', 'skupina' => 'sif'],
            ['value' => 'Sifrant\SklopPozi\brisi', 'name' => 'Šifranti - brisanje pozicij sklopov', 'skupina' => 'sif'],
            ['value' => 'Sifrant\StatusNar\index', 'name' => 'Šifranti - statusi naročil - pregled', 'controller' => 'Crud', 'entity' => 'StatusNar', 'skupina' => 'sif'],
            ['value' => 'Sifrant\StatusNar\pregled', 'name' => 'Šifranti - pregled statusov naročil', 'controller' => 'Crud', 'entity' => 'StatusNar', 'skupina' => 'sif'],
            ['value' => 'Sifrant\StatusNar\dodaj', 'name' => 'Šifranti - dodajanje statusov naročil', 'controller' => 'Crud', 'entity' => 'StatusNar', 'skupina' => 'sif'],
            ['value' => 'Sifrant\StatusNar\uredi', 'name' => 'Šifranti - urejanje statusov naročil', 'controller' => 'Crud', 'entity' => 'StatusNar', 'skupina' => 'sif'],
            ['value' => 'Sifrant\StatusNar\brisi', 'name' => 'Šifranti - brisanje statusov naročil', 'controller' => 'Crud', 'entity' => 'StatusNar', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Tdok\index', 'name' => 'Šifranti - vrste dokumentov', 'controller' => 'Crud', 'entity' => 'Tdok', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Tdok\pregled', 'name' => 'Šifranti - pregled vrst dokumentov', 'controller' => 'Crud', 'entity' => 'Tdok', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Tdok\dodaj', 'name' => 'Šifranti - dodajanje vrst dokumentov', 'controller' => 'Crud', 'entity' => 'Tdok', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Tdok\uredi', 'name' => 'Šifranti - urejanje vrst dokumentov', 'controller' => 'Crud', 'entity' => 'Tdok', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Tdok\brisi', 'name' => 'Šifranti - brisanje vrst dokumentov', 'controller' => 'Crud', 'entity' => 'Tdok', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Tiskalnik\index', 'name' => 'Seznam tiskalnikov', 'controller' => 'Crud', 'entity' => 'Tiskalnik', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Tiskalnik\dodaj', 'name' => 'Dodajanje novega tiskalnika', 'controller' => 'Crud', 'entity' => 'Tiskalnik', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Tiskalnik\pregled', 'name' => 'Pregled tiskalnika', 'controller' => 'Crud', 'entity' => 'Tiskalnik', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Tiskalnik\uredi', 'name' => 'Spremeni tiskalnik', 'controller' => 'Crud', 'entity' => 'Tiskalnik', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Tiskalnik\brisi', 'name' => 'Briši tiskalnik', 'controller' => 'Crud', 'entity' => 'Tiskalnik', 'skupina' => 'sif'],
            ['value' => 'Sifrant\Checklist-ChecklistVzorec\index', 'name' => 'Sifrant - REST akcije checklist vzorcev', 'entity' => 'Checklist-ChecklistVzorec', 'skupina' => 'sif'],
            ['value' => 'Tehnologija\Dokument\barcode', 'name' => 'Tehnologija - črtne kode', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Dokument\index', 'name' => 'Tehnologija - seznam dokumentov', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Dokument\pregled', 'name' => 'Tehnologija - pregled dokumentov', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Dokument\preview', 'name' => 'Tehnologija - predogled dokumentov', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Embalaza\brisi', 'name' => 'Tehnologija - brisanje embalaže', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Embalaza\dodaj', 'name' => 'Tehnologija - dodajanje embalaže', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Embalaza\dodajkoncno', 'name' => 'Tehnologija - dodajanje končne embalaže', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Embalaza\index', 'name' => 'Tehnologija - pregled embalaž', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Embalaza\uredi', 'name' => 'Tehnologija - urejanje embalaže', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\KalkKoso\index', 'name' => 'Tehnologija- Seznam kalkulacijskih kosovnice', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\KalkKoso\pregled', 'name' => 'Tehnologija- Pregled Kalkulacijske kosovnice', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Kk\index', 'name' => 'Tehnologija- Rest vmesnik za kalkulacijske kosovnice', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\KkMaterial\index', 'name' => 'Tehnologija- Rest vmesnik za postavke kalk kosovnice - material', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\KkStoritev\index', 'name' => 'Tehnologija- Rest vmesnik za postavke kalk kosovnice - storitev', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\KkOperacija\index', 'name' => 'Tehnologija- Rest vmesnik za postavke kalk kosovnice - operacije', 'skupina' => 'teh'],
            ['value' => 'Sifrant\Tehnologija-Etiketa\brisi', 'name' => 'Tehnologija - brisanje etikete', 'skupina' => 'teh'],
            ['value' => 'Sifrant\Tehnologija-Etiketa\dodaj', 'name' => 'Tehnologija - dodajanje etikete', 'skupina' => 'teh'],
            ['value' => 'Sifrant\Tehnologija-Etiketa\index', 'name' => 'Tehnologija - pregled etiket', 'skupina' => 'teh'],
            ['value' => 'Sifrant\Tehnologija-Etiketa\pregled', 'name' => 'Tehnologija - pregled etikete', 'skupina' => 'teh'],
            ['value' => 'Sifrant\Tehnologija-Etiketa\uredi', 'name' => 'Tehnologija - urejanje etikete', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Etikete\tiskajZebra', 'name' => 'Tehnologija - tiskaj zebra etikete', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Koso\getKosoJson', 'name' => 'Tehnologija - podatki kosovnice v json obliki', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Koso\index', 'name' => 'Tehnologija - pregled kosovnic', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Koso\pregled', 'name' => 'Tehnologija - pregled kosovnice', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Koso\sinoptika', 'name' => 'Tehnologija - kosovnica - sinoptika', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Nsl\index', 'name' => 'Tehnologija - pregled nastavnih listov', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Nsl\pregled', 'name' => 'Tehnologija - Pregled nastavnega lista', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Pakiranje\dodaj', 'name' => 'Tehnologija - dodajanje pakiranja', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Pakiranje\index', 'name' => 'Tehnologija - seznam pakiranj', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Pakiranje\pregled', 'name' => 'Tehnologija - pregled pakiranj', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Pakiranje\struktura', 'name' => 'Tehnologija - struktura pakiranja', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Pakiranje\uredi', 'name' => 'Tehnologija - uredi pakiranje', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Pakiranje\kloniraj', 'name' => 'Tehnologija - kloniraj pakiranje', 'skupina' => 'teh'],
            ['value' => 'Tehnologija\Pakiranje\brisi', 'name' => 'Tehnologija - briši pakiranje', 'skupina' => 'teh'],
            ['value' => 'Tip\Cache\deleteAll', 'name' => 'Brisanje predpomnilnika', 'skupina' => 'sistem'],
            ['value' => 'Tip\Cache\index', 'name' => 'Pregled stanja predpomnilnika', 'skupina' => 'sistem'],
            ['value' => 'Tip\Group\brisi', 'name' => 'Brisanje skupin uporabnikov', 'skupina' => 'sistem'],
            ['value' => 'Tip\Group\odstraniUporabnika', 'name' => 'Brisanje uporabnika iz skupine', 'skupina' => 'sistem'],
            ['value' => 'Tip\Group\dodajUporabnika', 'name' => 'Dodajanje uporabnika v skupino', 'skupina' => 'sistem'],
            ['value' => 'Tip\Group\odstraniVlogo', 'name' => 'Brisanje vloge ki je dodeljena skupini skupine', 'skupina' => 'sistem'],
            ['value' => 'Tip\Group\dodajVlogo', 'name' => 'Dodeljevanje vloge skupini', 'skupina' => 'sistem'],
            ['value' => 'Tip\Group\dodaj', 'name' => 'Dodajanje skupin uporabnikov', 'skupina' => 'sistem'],
            ['value' => 'Tip\Group\index', 'name' => 'Pregled skupin uporabnikov', 'skupina' => 'sistem'],
            ['value' => 'Tip\Group\uredi', 'name' => 'Urejanje skupin uporabnikov', 'skupina' => 'sistem'],
            ['value' => 'Tip\Group\pregled', 'name' => 'Pregled skupine uporabnikov', 'skupina' => 'sistem'],
            ['value' => 'Tip\Group\getList', 'name' => 'Rest geList metoda za skupine uporabnikov', 'skupina' => 'sistem'],
            ['value' => 'Tip\Index\index', 'name' => 'Domov', 'skupina' => 'sistem'],
            ['value' => 'Tip\Lookup\index', 'name' => 'Rest vmesnik ta iskanje entitet', 'skupina' => 'sistem'],
            ['value' => 'Tip\Opcije\index', 'name' => 'Tip - izbirne opcije', 'skupina' => 'sistem'],
            ['value' => 'Tip\Opcije\pregled', 'name' => 'Tip - pregled izbirnih opcij', 'skupina' => 'sistem'],
            ['value' => 'Tip\Opcije\dodaj', 'name' => 'Tip - dodajanje izbirnih opcij', 'skupina' => 'sistem'],
            ['value' => 'Tip\Opcije\uredi', 'name' => 'Tip - urejanje izbirnih opcij', 'skupina' => 'sistem'],
            ['value' => 'Tip\Opcije\brisi', 'name' => 'Tip - brisanje izbirnih opcij', 'skupina' => 'sistem'],
            ['value' => 'Tip\Redirect\back', 'name' => 'Preusmeritev', 'skupina' => 'sistem'],
            ['value' => 'Tip\Resource\index', 'name' => 'Tip - dovoljenja', 'skupina' => 'sistem'],
            ['value' => 'Tip\Resource\dodaj', 'name' => 'Tip - dodajanje dovoljenj', 'skupina' => 'sistem'],
            ['value' => 'Tip\Resource\pregled', 'name' => 'Tip - pregled dovoljenja', 'skupina' => 'sistem'],
            ['value' => 'Tip\Resource\uredi', 'name' => 'Tip - urejanje dovoljenj', 'skupina' => 'sistem'],
            ['value' => 'Tip\Resource\brisi', 'name' => 'Tip - brisanje dovoljenj', 'skupina' => 'sistem'],
            ['value' => 'Tip\Role\index', 'name' => 'Tip - vloge', 'skupina' => 'sistem'],
            ['value' => 'Tip\Role\dodaj', 'name' => 'Tip - dodajanje vlog', 'skupina' => 'sistem'],
            ['value' => 'Tip\Role\uredi', 'name' => 'Tip - urejanje vlog', 'skupina' => 'sistem'],
            ['value' => 'Tip\Role\brisi', 'name' => 'Tip - brisanje vlog', 'skupina' => 'sistem'],
            ['value' => 'Tip\Role\pregled', 'name' => 'Tip - pregled vloge', 'skupina' => 'sistem'],
            ['value' => 'Tip\User\index', 'name' => 'Tip - uporabniki', 'skupina' => 'sistem'],
            ['value' => 'Tip\User\brisi', 'name' => 'Tip - brisanje uporabnika', 'skupina' => 'sistem'],
            ['value' => 'Tip\User\dodaj', 'name' => 'Tip - dodajanje uporabnika', 'skupina' => 'sistem'],
            ['value' => 'Tip\User\enable', 'name' => 'Tip - omogoči/onemogoči uporabnika', 'skupina' => 'sistem'],
            ['value' => 'Tip\User\group', 'name' => 'Tip - dodajanje uporabnika v skupino', 'skupina' => 'sistem'],
            ['value' => 'Tip\User\login', 'name' => 'Tip - prijava uporabnika', 'skupina' => 'sistem'],
            ['value' => 'Tip\User\logout', 'name' => 'Tip - odjava uporabnika', 'skupina' => 'sistem'],
            ['value' => 'Tip\User\changePassword', 'name' => 'Spremeba gesla uporabnika', 'skupina' => 'sistem'],
            ['value' => 'Tip\User\password', 'name' => 'Menjava gesla', 'skupina' => 'sistem'],
            ['value' => 'Tip\User\uredi', 'name' => 'Urejanje uporabnikov', 'skupina' => 'sistem'],
            ['value' => 'Tip\User\pregled', 'name' => 'Pregled uporabnika', 'skupina' => 'sistem'],
            ['value' => 'Tip\User\getList', 'name' => 'Rest get list metoda za uporabnike', 'skupina' => 'sistem'],
            ['value' => 'Tip\Errors\norights', 'name' => 'No rights stran', 'skupina' => 'sistem'],
            ['value' => 'Tip\Datoteke\filemanager', 'name' => 'Upravitelj datotek', 'skupina' => 'sistem'],
            ['value' => 'Tip\Datoteke\index', 'name' => 'REST Akcije za datoteke', 'skupina' => 'sistem'],
            ['value' => 'Tip\Datoteke\nalozi', 'name' => 'Prenos nove datoteke na sistem', 'skupina' => 'sistem'],
            ['value' => 'Tip\Datoteke\prenesi', 'name' => 'Prenos datoteke na klienta', 'skupina' => 'sistem'],
            ['value' => 'Tip\Priponke\index', 'name' => 'REST Akcije za Priponke', 'skupina' => 'sistem'],
            ['value' => 'Tip\Priponke\uredi-priponke', 'name' => 'Akcija za urejanje priponk', 'skupina' => 'sif'],
            ['value' => 'Tip\Avtorizacija\index', 'name' => 'Avtorizacije (dovoljenja, vloge, skupine)', 'skupina' => 'sistem'],
            ['value' => 'Tip\Kontekst\index', 'name' => 'Dostop do kontekstov', 'skupina' => 'sistem'],
            ['value' => 'Tip\Mape\index', 'name' => 'Dostop do Map - strukture VFS', 'skupina' => 'sistem'],
            ['value' => 'Tip\Revizije\index', 'name' => 'Pregled zogovine spremeb na objektu', 'skupina' => 'sistem'],
            ['value' => 'Tip\PaginatorMeta\index', 'name' => 'Metapodatki o paginatorjih', 'skupina' => 'sistem'],
            ['value' => 'Tip\FormMeta\index', 'name' => 'Metapodatki o formah', 'skupina' => 'sistem'],
            ['value' => 'Tip\Index\restricted', 'name' => 'Restricted page za mobilni barcode scanner', 'skupina' => 'sistem'],
            ['value' => 'Tip\Tiskalniki\index', 'name' => 'REST controller za tiskalnike', 'skupina' => 'sistem'],
            ['value' => 'Tip\Tiskalniki\tiskaj', 'name' => 'Akcija za tiskanje datotek', 'skupina' => 'sistem'],
            ['value' => 'Workflow\JobREST\index', 'name' => 'REST akcije za job manager', 'skupina' => 'sistem'],
            ['value' => 'Workflow\JobREST\manager', 'name' => 'Job manager info', 'skupina' => 'sistem'],
        ],
        'type2' => [
            ['name' => 'Admin', 'value' => 'master', 'type' => '2', 'skupina' => 'admin'],
            ['name' => 'Globalni konteksti', 'value' => 'kontekst-master', 'type' => '2', "skupina" => 'admin'],            
        ],
      ]
    
    ];