--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.3.5
-- Started on 2015-03-23 14:18:57 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 170 (class 1259 OID 825529)
-- Name: cena; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cena (
    id uuid NOT NULL,
    maticna_id uuid,
    klient_id uuid,
    valuta_id uuid,
    status character varying(3) NOT NULL,
    opis character varying(40) DEFAULT NULL::character varying,
    veljaod date,
    veljado date,
    faktor numeric(14,4) DEFAULT NULL::numeric,
    osnova numeric(16,6) DEFAULT NULL::numeric,
    cena numeric(16,6) DEFAULT NULL::numeric,
    kolicinaod numeric(16,3) DEFAULT NULL::numeric,
    kolicinado numeric(16,3) DEFAULT NULL::numeric,
    minnarocilo numeric(16,3) DEFAULT NULL::numeric,
    rabatods numeric(16,6) DEFAULT NULL::numeric,
    rokplacila integer NOT NULL,
    pariteta character varying(20) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 171 (class 1259 OID 825543)
-- Name: cenovnirazpon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cenovnirazpon (
    id uuid NOT NULL,
    kalkulacija_id uuid,
    ponudba_id uuid,
    kolicina numeric(12,3) DEFAULT NULL::numeric,
    cena numeric(15,5) DEFAULT NULL::numeric,
    znesek numeric(16,2) DEFAULT NULL::numeric,
    cenadela numeric(15,5) DEFAULT NULL::numeric,
    dodatekdela numeric(15,5) DEFAULT NULL::numeric,
    odstotekdela numeric(6,2) DEFAULT NULL::numeric,
    cenamateriala numeric(15,5) DEFAULT NULL::numeric,
    dodatekmateriala numeric(15,5) DEFAULT NULL::numeric,
    odstotekmateriala numeric(6,2) DEFAULT NULL::numeric,
    cenaprevoza numeric(15,5) DEFAULT NULL::numeric,
    dodatekprevoza numeric(15,5) DEFAULT NULL::numeric,
    odstotekprevoza numeric(6,2) DEFAULT NULL::numeric,
    tk numeric(15,5) DEFAULT NULL::numeric,
    setup numeric(15,5) DEFAULT NULL::numeric,
    provizija numeric(6,2) DEFAULT NULL::numeric,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 172 (class 1259 OID 825563)
-- Name: checklistvzorec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE checklistvzorec (
    id uuid NOT NULL,
    naziv character varying(50) NOT NULL,
    tip character varying(3) DEFAULT NULL::character varying,
    upor character varying(255) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 173 (class 1259 OID 825569)
-- Name: checklistvzorecpostavka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE checklistvzorecpostavka (
    id uuid NOT NULL,
    dokument_id uuid,
    naziv character varying(50) NOT NULL,
    element character varying(3) DEFAULT NULL::character varying,
    pozicija numeric(10,0) DEFAULT NULL::numeric,
    upor character varying(255) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 174 (class 1259 OID 825576)
-- Name: datoteka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datoteka (
    id uuid NOT NULL,
    lastnik_id uuid,
    stevilka character varying(20) DEFAULT NULL::character varying,
    naziv character varying(200) NOT NULL,
    caskreiranja timestamp(0) without time zone NOT NULL,
    casspremembe timestamp(0) without time zone NOT NULL,
    filename character varying(255) DEFAULT NULL::character varying,
    stprenosov integer NOT NULL,
    size integer,
    mimetype character varying(255) DEFAULT NULL::character varying,
    hash uuid,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 175 (class 1259 OID 825587)
-- Name: deko; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE deko (
    id uuid NOT NULL,
    datum date NOT NULL,
    opis character varying(30) NOT NULL,
    zacetek timestamp(0) without time zone NOT NULL,
    konec timestamp(0) without time zone NOT NULL,
    ure numeric(5,2) NOT NULL,
    kw character varying(7) NOT NULL,
    status integer NOT NULL,
    stizmen integer NOT NULL,
    leto integer NOT NULL,
    mesec integer NOT NULL,
    dan integer NOT NULL,
    teden integer NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    tehen_id uuid,
    tip integer NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 825597)
-- Name: dogodek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodek (
    id uuid NOT NULL,
    tip_id uuid,
    class character varying(100) NOT NULL,
    targetid uuid NOT NULL,
    data text NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 177 (class 1259 OID 825605)
-- Name: dokumentmat; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dokumentmat (
    id uuid NOT NULL,
    dok_id uuid,
    skladisce_id uuid,
    valuta_id uuid,
    drzava_id uuid,
    klient_id uuid,
    nalog uuid,
    prejemnik_id uuid,
    sklv_id uuid,
    napoved boolean,
    potrjen boolean,
    stevilka character varying(255) NOT NULL,
    datdog date NOT NULL,
    znesek numeric(16,6) DEFAULT NULL::numeric,
    izrav numeric(10,0) DEFAULT NULL::numeric,
    znesekvaluta numeric(16,6) DEFAULT NULL::numeric,
    pripis text,
    kurz numeric(16,6) DEFAULT NULL::numeric,
    upor character varying(255) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    vd character varying(1) NOT NULL,
    statusprevzema integer,
    rabatods numeric(16,6) DEFAULT NULL::numeric,
    rabat numeric(16,6) DEFAULT NULL::numeric,
    rabatvaluta numeric(16,6) DEFAULT NULL::numeric,
    klientdok character varying(15) DEFAULT NULL::character varying,
    datumkd date,
    naslovklienta_id uuid,
    naslovprejemnika_id uuid,
    ovrednoten boolean,
    original_id uuid,
    jezik character varying(5) DEFAULT NULL::character varying
);


--
-- TOC entry 178 (class 1259 OID 825621)
-- Name: drza; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE drza (
    id uuid NOT NULL,
    sifra character varying(2) NOT NULL,
    sifradolg character varying(3) DEFAULT NULL::character varying,
    isonum character varying(3) DEFAULT NULL::character varying,
    isonaziv character varying(50) DEFAULT NULL::character varying,
    naziv character varying(50) NOT NULL,
    opomba text,
    upor character varying(10) NOT NULL,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 179 (class 1259 OID 825631)
-- Name: embalaza; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE embalaza (
    id uuid NOT NULL,
    pakiranje_id uuid,
    maticna_id uuid,
    etiketa_id uuid,
    parent_id uuid,
    opis character varying(100) NOT NULL,
    tip integer NOT NULL,
    imaserijsko boolean NOT NULL,
    brezrazpisa boolean NOT NULL,
    normativ numeric(10,3) NOT NULL,
    prefix character varying(5) DEFAULT NULL::character varying,
    current integer,
    obmocjezacetek integer,
    obmocjekonec integer,
    tipgeneriranja character varying(10) NOT NULL,
    kolicina numeric(10,3) NOT NULL,
    upor character varying(10) NOT NULL,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 180 (class 1259 OID 825636)
-- Name: etikete; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE etikete (
    id uuid NOT NULL,
    tip integer NOT NULL,
    alias character varying(10) NOT NULL,
    naziv character varying(100) DEFAULT NULL::character varying,
    kolon integer,
    vrst integer,
    style text,
    template text NOT NULL,
    classname character varying(50) NOT NULL,
    upor character varying(10) NOT NULL,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 181 (class 1259 OID 825644)
-- Name: group_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE group_user (
    group_id uuid NOT NULL,
    user_id uuid NOT NULL
);


--
-- TOC entry 182 (class 1259 OID 825647)
-- Name: izbirneopcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE izbirneopcije (
    id uuid NOT NULL,
    object character varying(50) NOT NULL,
    value character varying(50) NOT NULL,
    label character varying(40) NOT NULL,
    sort integer NOT NULL,
    flags character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 183 (class 1259 OID 825653)
-- Name: izmetpodrobno; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE izmetpodrobno (
    id uuid NOT NULL,
    vrstaizmeta character varying(3) NOT NULL,
    kolicina numeric(12,2) NOT NULL,
    vrednostmateriala numeric(12,2) NOT NULL,
    vrednostdela numeric(12,2) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    izvedbapodrobno_id uuid
);


--
-- TOC entry 184 (class 1259 OID 825658)
-- Name: job; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE job (
    id uuid NOT NULL,
    user_id uuid,
    name character varying(50) NOT NULL,
    task character varying(50) NOT NULL,
    status integer NOT NULL,
    log text,
    datum timestamp(0) without time zone NOT NULL,
    casizvedbe timestamp(0) without time zone NOT NULL,
    izveden timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    data text,
    alert boolean,
    hidden boolean,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 3914 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 185 (class 1259 OID 825667)
-- Name: job_datoteka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE job_datoteka (
    job_id uuid NOT NULL,
    datoteka_id uuid NOT NULL
);


--
-- TOC entry 186 (class 1259 OID 825670)
-- Name: kakovostniprevzem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kakovostniprevzem (
    id uuid NOT NULL,
    prevzeto boolean NOT NULL,
    komentar character varying(255) DEFAULT NULL::character varying,
    kolicina numeric(10,0) DEFAULT NULL::numeric,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    postavkanarocila_id uuid
);


--
-- TOC entry 187 (class 1259 OID 825678)
-- Name: kalkkoso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kalkkoso (
    id uuid NOT NULL,
    koncni_id uuid,
    stevilka character varying(255) NOT NULL,
    datum date,
    naziv character varying(100) DEFAULT NULL::character varying,
    opis text,
    provizija numeric(5,2) DEFAULT NULL::numeric,
    vrednostmateriala numeric(12,4) DEFAULT NULL::numeric,
    dodatekmateriala numeric(12,4) DEFAULT NULL::numeric,
    odstotekmateriala numeric(5,2) DEFAULT NULL::numeric,
    vrednostdela numeric(12,4) DEFAULT NULL::numeric,
    dodatekdela numeric(12,4) DEFAULT NULL::numeric,
    odstotekdela numeric(5,2) DEFAULT NULL::numeric,
    vrednostdodelave numeric(12,4) DEFAULT NULL::numeric,
    vrednostprevoza numeric(12,4) DEFAULT NULL::numeric,
    lot numeric(12,3) DEFAULT NULL::numeric,
    nastavitve numeric(12,4) DEFAULT NULL::numeric,
    vrednostnastavitev numeric(12,4) DEFAULT NULL::numeric,
    cenaizdelka numeric(12,4) DEFAULT NULL::numeric,
    potrjen boolean,
    aktivna boolean,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    dok_id uuid
);


--
-- TOC entry 188 (class 1259 OID 825700)
-- Name: klas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE klas (
    id uuid NOT NULL,
    parent_id uuid,
    skl_id uuid,
    sifra character varying(4) NOT NULL,
    level integer NOT NULL,
    l0 uuid NOT NULL,
    l1 uuid,
    l2 uuid,
    l3 uuid,
    naziv character varying(200) NOT NULL,
    tipm character varying(1) NOT NULL,
    glomat character varying(1) NOT NULL,
    em character varying(3) DEFAULT NULL::character varying,
    tarifa character varying(3) DEFAULT NULL::character varying,
    konton character varying(6) DEFAULT NULL::character varying,
    kontop character varying(6) DEFAULT NULL::character varying,
    konto character varying(6) DEFAULT NULL::character varying,
    nevrac character varying(1) NOT NULL,
    vizd character varying(1) NOT NULL,
    jerez character varying(1) NOT NULL,
    cats character varying(15) DEFAULT NULL::character varying,
    komercialni character varying(200) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 189 (class 1259 OID 825715)
-- Name: kontekst; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kontekst (
    id uuid NOT NULL,
    uporabnik_id uuid,
    kontekst character varying(100) NOT NULL,
    ime character varying(255) NOT NULL,
    global boolean NOT NULL,
    auto boolean NOT NULL,
    data text NOT NULL
);


--
-- TOC entry 190 (class 1259 OID 825721)
-- Name: kose; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kose (
    id uuid NOT NULL,
    popa_id uuid,
    naslov_id uuid,
    pozkose character varying(3) NOT NULL,
    naziv character varying(40) NOT NULL,
    dela character varying(40) DEFAULT NULL::character varying,
    tel character varying(20) NOT NULL,
    fax character varying(20) DEFAULT NULL::character varying,
    mobi character varying(20) DEFAULT NULL::character varying,
    email character varying(40) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 191 (class 1259 OID 825730)
-- Name: koso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE koso (
    id uuid NOT NULL,
    maticna_id uuid,
    parent_id uuid,
    poz character varying(3) NOT NULL,
    stazaklj character varying(1) NOT NULL,
    datzak date,
    kolicina numeric(12,4) NOT NULL,
    alternativa character varying(1) NOT NULL,
    statussinoptike character varying(1) NOT NULL,
    datumsinoptike date,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 192 (class 1259 OID 825735)
-- Name: kost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kost (
    id uuid NOT NULL,
    kos_id uuid,
    operacija_id uuid,
    tehen_id uuid,
    klient_id uuid,
    delavec_id uuid,
    poz character varying(2) NOT NULL,
    kdodela character varying(1) NOT NULL,
    stevdel character varying(1) NOT NULL,
    pripcas numeric(12,4) NOT NULL,
    opis text,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 193 (class 1259 OID 825743)
-- Name: kost_norme; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kost_norme (
    kosooper_id uuid NOT NULL,
    norma_id uuid NOT NULL
);


--
-- TOC entry 194 (class 1259 OID 825746)
-- Name: lastnostlokacije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE lastnostlokacije (
    id uuid NOT NULL,
    sifra character varying(3) NOT NULL,
    naziv character varying(255) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 195 (class 1259 OID 825751)
-- Name: lokacije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE lokacije (
    id uuid NOT NULL,
    root_id uuid,
    parent_id uuid,
    isleaf boolean NOT NULL,
    barcode character varying(30) NOT NULL,
    naziv character varying(50) NOT NULL,
    opis text,
    vrsta character varying(1) NOT NULL,
    status character varying(1) NOT NULL,
    upor character varying(10) NOT NULL,
    datknj timestamp(0) without time zone NOT NULL,
    privzetiprikaz_id uuid
);


--
-- TOC entry 196 (class 1259 OID 825757)
-- Name: lokacije_lastnosti; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE lokacije_lastnosti (
    lokacija_id uuid NOT NULL,
    lastnostlokacije_id uuid NOT NULL
);


--
-- TOC entry 197 (class 1259 OID 825760)
-- Name: mapa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa (
    id uuid NOT NULL,
    lastnik_id uuid,
    parent_id uuid,
    ime character varying(200) NOT NULL,
    caskreiranja timestamp(0) without time zone NOT NULL,
    casspremembe timestamp(0) without time zone NOT NULL,
    javnidostop character varying(4) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 198 (class 1259 OID 825766)
-- Name: mapa_datoteka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_datoteka (
    mapa_id uuid NOT NULL,
    datoteka_id uuid NOT NULL
);


--
-- TOC entry 199 (class 1259 OID 825769)
-- Name: mapaacl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapaacl (
    id uuid NOT NULL,
    mapa_id uuid,
    skupina_id uuid,
    dostop character varying(10) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 200 (class 1259 OID 825774)
-- Name: matt; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE matt (
    id uuid NOT NULL,
    klasifikacija_id uuid,
    podklasifikacija_id uuid,
    klasdela_id uuid,
    aktivna character varying(1) NOT NULL,
    sifra character varying(15) NOT NULL,
    naziv character varying(50) NOT NULL,
    pomozni character varying(50) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    tipsif character varying(255) NOT NULL,
    kratki character varying(6) DEFAULT NULL::character varying,
    linija character varying(2) DEFAULT NULL::character varying,
    sn character varying(7) DEFAULT NULL::character varying,
    kvadratura numeric(10,2) DEFAULT NULL::numeric,
    pripcas numeric(10,2) DEFAULT NULL::numeric,
    akt boolean,
    vrsta character varying(1) DEFAULT NULL::character varying,
    skupina character varying(3) DEFAULT NULL::character varying,
    jensl character varying(1) DEFAULT NULL::character varying,
    jeizp boolean,
    procentplaniranja numeric(10,2) DEFAULT NULL::numeric,
    primoc numeric(10,2) DEFAULT NULL::numeric,
    kalurpos numeric(10,2) DEFAULT NULL::numeric,
    sifpla character varying(15) DEFAULT NULL::character varying,
    inttel character varying(6) DEFAULT NULL::character varying,
    aktiven character varying(1) DEFAULT NULL::character varying,
    zaizpis character varying(1) DEFAULT NULL::character varying,
    statusdel character varying(1) DEFAULT NULL::character varying,
    cenaure numeric(10,2) DEFAULT NULL::numeric,
    cenakom numeric(12,6) DEFAULT NULL::numeric,
    jear character varying(1) DEFAULT NULL::character varying,
    jeanl character varying(1) DEFAULT NULL::character varying,
    jeakk character varying(1) DEFAULT NULL::character varying,
    jencp character varying(1) DEFAULT NULL::character varying,
    jepakiranje character varying(1) DEFAULT NULL::character varying,
    jefiksnicas boolean,
    fiksnicas numeric(10,4) DEFAULT NULL::numeric,
    kajsklo character varying(4) DEFAULT NULL::character varying,
    stasklo character varying(1) DEFAULT NULL::character varying,
    em character varying(3) DEFAULT NULL::character varying,
    status character varying(3) DEFAULT NULL::character varying,
    tarddv character varying(2) DEFAULT NULL::character varying,
    teza numeric(10,3) DEFAULT NULL::numeric,
    cats character varying(8) DEFAULT NULL::character varying,
    standard character varying(255) DEFAULT NULL::character varying,
    viz character varying(1) DEFAULT NULL::character varying,
    morack character varying(1) DEFAULT NULL::character varying,
    tipm character varying(1) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 825818)
-- Name: matz; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE matz (
    id uuid NOT NULL,
    skl_id uuid,
    sifra_id uuid,
    zalzac numeric(10,0) DEFAULT NULL::numeric,
    zaltre numeric(10,0) DEFAULT NULL::numeric,
    zalinv numeric(10,0) DEFAULT NULL::numeric,
    zaldob numeric(10,0) DEFAULT NULL::numeric,
    zalsla numeric(10,0) DEFAULT NULL::numeric,
    cenapla numeric(10,0) DEFAULT NULL::numeric,
    cenazac numeric(10,0) DEFAULT NULL::numeric,
    zneszac numeric(10,0) DEFAULT NULL::numeric,
    datinv date,
    status character varying(255) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    upor character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 825835)
-- Name: nard; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nard (
    id uuid NOT NULL,
    dok_id uuid,
    klient_id uuid,
    kontaktna_id uuid,
    prejemnik_id uuid,
    drzava_id uuid,
    valuta_id uuid,
    stevilka character varying(255) DEFAULT NULL::character varying,
    ponudbadob character varying(30) DEFAULT NULL::character varying,
    jezik character varying(5) DEFAULT NULL::character varying,
    datumdogodka date,
    datumponudbe date,
    dniplacila numeric(5,0) DEFAULT NULL::numeric,
    dnipotrditve numeric(5,0) DEFAULT NULL::numeric,
    rabatprocent numeric(5,2) DEFAULT NULL::numeric,
    rabatvrednost numeric(12,2) DEFAULT NULL::numeric,
    text text,
    tecaj numeric(16,6) DEFAULT NULL::numeric,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    naslovklienta_id uuid,
    naslovprejemnika_id uuid,
    statusnarocila character varying(3) NOT NULL,
    potrjen boolean NOT NULL,
    vrednost numeric(12,2) DEFAULT NULL::numeric,
    rabatvaluta numeric(12,2) DEFAULT NULL::numeric,
    vrednostvaluta numeric(12,2) DEFAULT NULL::numeric
);


--
-- TOC entry 203 (class 1259 OID 825858)
-- Name: nark; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nark (
    id uuid NOT NULL,
    dok_id uuid,
    klient_id uuid,
    prejemnik_id uuid,
    drzava_id uuid,
    valuta_id uuid,
    stevilka character varying(9) DEFAULT NULL::character varying,
    jezik character varying(5) DEFAULT NULL::character varying,
    narocilokupca character varying(50) DEFAULT NULL::character varying,
    datumdogodka date,
    datumnarocila date,
    vrednost numeric(12,2) DEFAULT NULL::numeric,
    text text,
    tecaj numeric(16,6) DEFAULT NULL::numeric,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    naslovklienta_id uuid,
    naslovprejemnika_id uuid,
    statusnarocila character varying(3) NOT NULL,
    kontaktna_id uuid,
    potrjen boolean NOT NULL,
    vrednostvaluta numeric(12,2) DEFAULT NULL::numeric
);


--
-- TOC entry 204 (class 1259 OID 825871)
-- Name: nasl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nasl (
    id uuid NOT NULL,
    maticna_id uuid,
    oper_id uuid,
    tehen_id uuid,
    opis text NOT NULL,
    stansl character varying(1) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 205 (class 1259 OID 825879)
-- Name: nastavitve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nastavitve (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    namespace character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    value text NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 825885)
-- Name: nastavni_sklopi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nastavni_sklopi (
    nastavni_id uuid NOT NULL,
    sklop_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 825888)
-- Name: norme; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE norme (
    id uuid NOT NULL,
    tip character varying(1) NOT NULL,
    datdog date NOT NULL,
    norma numeric(9,3) NOT NULL,
    ts numeric(7,2) NOT NULL,
    tm numeric(7,2) NOT NULL,
    mi numeric(5,2) NOT NULL,
    opomba text NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 208 (class 1259 OID 825896)
-- Name: odst; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE odst (
    id uuid NOT NULL,
    sifra character varying(3) NOT NULL,
    naziv character varying(50) NOT NULL,
    upor character varying(10) NOT NULL,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 209 (class 1259 OID 825900)
-- Name: operacija_tehen; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE operacija_tehen (
    operacija_id uuid NOT NULL,
    tehen_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 825903)
-- Name: paketiproduktov; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE paketiproduktov (
    id uuid NOT NULL,
    embalaza_id uuid,
    parent_id uuid,
    dobava_id uuid,
    lokacija_id uuid,
    status integer NOT NULL,
    barcode character varying(20) NOT NULL,
    caspakiranja timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    caszapakiranja timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    casdobave timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    kolicina numeric(10,3) NOT NULL,
    caspremika timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    popis character varying(3) DEFAULT NULL::character varying,
    upor character varying(10) NOT NULL,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    alienparent_id uuid
);


--
-- TOC entry 211 (class 1259 OID 825912)
-- Name: pakiranjeprodukta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pakiranjeprodukta (
    id uuid NOT NULL,
    maticna_id uuid,
    embalaza_id uuid,
    etiketa_id uuid,
    naziv character varying(50) NOT NULL,
    veljaod date,
    veljado date,
    status character varying(2) NOT NULL,
    upor character varying(10) NOT NULL,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 212 (class 1259 OID 825916)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    builtin boolean NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 213 (class 1259 OID 825924)
-- Name: permission_allrole; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission_allrole (
    permission_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 825927)
-- Name: ponk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ponk (
    id uuid NOT NULL,
    dok_id uuid,
    klient_id uuid,
    kontaktna_id uuid,
    prejemnik_id uuid,
    valuta_id uuid,
    potrjen boolean NOT NULL,
    stevilka character varying(255) NOT NULL,
    statusponudbe character varying(3) DEFAULT NULL::character varying NOT NULL,
    kupcevaoznaka character varying(30) DEFAULT NULL::character varying,
    datumdogodka date,
    vrednost numeric(12,2) DEFAULT NULL::numeric,
    text text,
    tecaj numeric(16,6) DEFAULT NULL::numeric,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    naslovklienta_id uuid,
    naslovprejemnika_id uuid,
    jezik character varying(5) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 825939)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    klasifikacija_id uuid,
    drzava_id uuid,
    potnik_id uuid,
    sifra character varying(4) NOT NULL,
    tipkli character varying(1) NOT NULL,
    stakli character varying(2) NOT NULL,
    naziv character varying(60) NOT NULL,
    naziv1 character varying(60) NOT NULL,
    panoga character varying(60) NOT NULL,
    tel character varying(20) NOT NULL,
    fax character varying(20) DEFAULT NULL::character varying,
    email character varying(50) NOT NULL,
    url character varying(100) DEFAULT NULL::character varying,
    trr1 character varying(25) DEFAULT NULL::character varying,
    trr2 character varying(25) DEFAULT NULL::character varying,
    trr3 character varying(25) DEFAULT NULL::character varying,
    trr4 character varying(25) DEFAULT NULL::character varying,
    opomba text,
    rokplacilak integer,
    rokplacilad integer,
    dnipotrditve integer,
    rabat numeric(6,2) DEFAULT NULL::numeric,
    potnikkontakt uuid,
    izjava character varying(60) DEFAULT NULL::character varying,
    idddv character varying(18) DEFAULT NULL::character varying,
    maticna character varying(20) DEFAULT NULL::character varying,
    zavezanec character varying(1) NOT NULL,
    jeeu character varying(1) NOT NULL,
    datzav date,
    datnzav date,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 216 (class 1259 OID 825957)
-- Name: porekloproduktov; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE porekloproduktov (
    id uuid NOT NULL,
    paket_id uuid,
    nalog_id uuid,
    predajnica_id uuid,
    kolicina numeric(10,3) NOT NULL,
    predan boolean,
    upor character varying(10) NOT NULL,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 217 (class 1259 OID 825961)
-- Name: poslovniplan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE poslovniplan (
    id uuid NOT NULL,
    naziv character varying(100) NOT NULL,
    zacetek date NOT NULL,
    konec date NOT NULL,
    status character varying(1) NOT NULL,
    statuspreracunov boolean NOT NULL,
    tipobdobja character varying(1) NOT NULL,
    obdobij integer NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 218 (class 1259 OID 825966)
-- Name: poslovniplanartikla; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE poslovniplanartikla (
    id uuid NOT NULL,
    plan_id uuid,
    artikel_id uuid,
    kalkulacija_id uuid,
    cena numeric(16,6) DEFAULT NULL::numeric,
    planiranakolicina numeric(14,2) NOT NULL,
    zacetnazaloga numeric(14,2) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 219 (class 1259 OID 825972)
-- Name: poslovniplankadri; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE poslovniplankadri (
    id uuid NOT NULL,
    obdobje_id uuid,
    skupina character varying(3) NOT NULL,
    planzaposlenih numeric(14,2) DEFAULT NULL::numeric,
    zaposlenih numeric(14,2) DEFAULT NULL::numeric,
    planbolniske numeric(14,2) DEFAULT NULL::numeric,
    bolniske numeric(14,2) DEFAULT NULL::numeric,
    plandopusti numeric(14,2) DEFAULT NULL::numeric,
    dopusti numeric(14,2) DEFAULT NULL::numeric,
    korekcija numeric(14,2) DEFAULT NULL::numeric,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 220 (class 1259 OID 825984)
-- Name: poslovniplannapoved; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE poslovniplannapoved (
    id uuid NOT NULL,
    narocilo_id uuid,
    obdobje_id uuid,
    kolicina numeric(14,2) NOT NULL,
    planiranakolicina numeric(14,2) NOT NULL,
    planstatus character varying(3) NOT NULL,
    status character varying(3) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 221 (class 1259 OID 825989)
-- Name: poslovniplannarocilo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE poslovniplannarocilo (
    id uuid NOT NULL,
    ppartikla_id uuid,
    narocilo_id uuid,
    klient_id uuid,
    zacetek date NOT NULL,
    konec date NOT NULL,
    stevilodobav integer NOT NULL,
    skupnakolicina numeric(14,2) NOT NULL,
    prodajnacena numeric(14,2) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 222 (class 1259 OID 825994)
-- Name: poslovniplanobdobje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE poslovniplanobdobje (
    id uuid NOT NULL,
    plan_id uuid,
    zacetek date NOT NULL,
    konec date NOT NULL,
    oznaka character varying(8) NOT NULL,
    planiranfondur numeric(14,2) NOT NULL,
    plandni numeric(14,2) NOT NULL,
    dni numeric(14,2) NOT NULL,
    fondur numeric(14,2) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 223 (class 1259 OID 825999)
-- Name: poslovniplanproizvodnja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE poslovniplanproizvodnja (
    id uuid NOT NULL,
    ppartikla_id uuid,
    obdobje_id uuid,
    kalkulacija_id uuid,
    nalog_id uuid,
    kolicina numeric(14,2) NOT NULL,
    planiranakolicina numeric(14,2) NOT NULL,
    status character varying(3) NOT NULL,
    planstatus character varying(3) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 224 (class 1259 OID 826004)
-- Name: poslovniplanuretehen; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE poslovniplanuretehen (
    id uuid NOT NULL,
    obdobje_id uuid,
    tehen_id uuid,
    planfondur numeric(14,2) NOT NULL,
    fondur numeric(14,2) NOT NULL,
    ur numeric(14,2) NOT NULL,
    planur numeric(14,2) NOT NULL,
    nastavitve numeric(14,2) NOT NULL,
    plannastavitev numeric(14,2) NOT NULL,
    planurljudi numeric(14,2) NOT NULL,
    urljudi numeric(14,2) NOT NULL,
    vrednost numeric(14,2) NOT NULL,
    planvrednost numeric(14,2) NOT NULL,
    preracunid character varying(13) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 225 (class 1259 OID 826009)
-- Name: post; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE post (
    id uuid NOT NULL,
    sifra character varying(20) NOT NULL,
    naziv character varying(40) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 226 (class 1259 OID 826014)
-- Name: postavkakalkkoso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkakalkkoso (
    id uuid NOT NULL,
    dokument_id uuid,
    polizdelek_id uuid,
    tehen_id uuid,
    operacija_id uuid,
    material_id uuid,
    cenik_id uuid,
    klient_id uuid,
    nivo character varying(4) NOT NULL,
    opis character varying(40) NOT NULL,
    pozicija integer,
    normativ numeric(12,3) DEFAULT NULL::numeric,
    kolicina numeric(12,3) DEFAULT NULL::numeric,
    cena numeric(15,5) DEFAULT NULL::numeric,
    vrednost numeric(15,5) DEFAULT NULL::numeric,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    tippostavke character varying(255) NOT NULL,
    pripravljalnicas numeric(12,4) DEFAULT NULL::numeric,
    faktorljudi numeric(12,3) DEFAULT NULL::numeric,
    strojnicas numeric(12,2) DEFAULT NULL::numeric,
    manipulativnicas numeric(12,2) DEFAULT NULL::numeric,
    "interval" numeric(5,2) DEFAULT NULL::numeric,
    ne numeric(5,2) DEFAULT NULL::numeric,
    kanban character varying(1) DEFAULT NULL::character varying,
    vrednostsetupa numeric(12,3) DEFAULT NULL::numeric
);


--
-- TOC entry 227 (class 1259 OID 826030)
-- Name: postavkamat; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkamat (
    id uuid NOT NULL,
    skladisce_id uuid,
    dokument_id uuid,
    maticna_id uuid,
    polizdelek_id uuid,
    delavec_id uuid,
    sklv_id uuid,
    pozicija numeric(10,0) DEFAULT NULL::numeric,
    flek character varying(255) DEFAULT NULL::character varying,
    teza numeric(14,4) DEFAULT NULL::numeric,
    cena numeric(16,6) DEFAULT NULL::numeric,
    cenavaluta numeric(16,2) DEFAULT NULL::numeric,
    kolicina numeric(16,3) DEFAULT NULL::numeric NOT NULL,
    znesek numeric(16,2) DEFAULT NULL::numeric,
    znesekvaluta numeric(16,2) DEFAULT NULL::numeric,
    znesekobr numeric(16,2) DEFAULT NULL::numeric,
    cenaobr numeric(16,6) DEFAULT NULL::numeric,
    tarifa character varying(255) DEFAULT NULL::character varying,
    koldobro numeric(14,4) DEFAULT NULL::numeric,
    znesdobro numeric(16,6) DEFAULT NULL::numeric,
    znesobrdobro numeric(16,6) DEFAULT NULL::numeric,
    kolbreme numeric(14,4) DEFAULT NULL::numeric,
    znesbreme numeric(16,6) DEFAULT NULL::numeric,
    znesobrbreme numeric(16,6) DEFAULT NULL::numeric,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    vd character varying(1) NOT NULL,
    vhodnastevilka character varying(30) DEFAULT NULL::character varying,
    rabatods numeric(16,6) DEFAULT NULL::numeric,
    rabat numeric(16,6) DEFAULT NULL::numeric,
    rabatvaluta numeric(16,6) DEFAULT NULL::numeric,
    znesekstr numeric(16,2) DEFAULT NULL::numeric,
    izjava character varying(20) DEFAULT NULL::character varying,
    proforma numeric(10,0) DEFAULT NULL::numeric,
    poreklo character varying(255) DEFAULT NULL::character varying,
    sarza character varying(255) DEFAULT NULL::character varying,
    vezand_id uuid,
    znesekmat numeric(16,6) DEFAULT NULL::numeric,
    znesekdel numeric(16,6) DEFAULT NULL::numeric,
    znesekkoop numeric(16,6) DEFAULT NULL::numeric,
    vezanalog_id uuid,
    vezaizd_id uuid,
    vezank_id uuid,
    original_id uuid,
    vezarazpis_id uuid
);


--
-- TOC entry 228 (class 1259 OID 826067)
-- Name: postavkastroska; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkastroska (
    id uuid NOT NULL,
    dokument_id uuid,
    storitev_id uuid,
    klient_id uuid,
    klientdok character varying(15) DEFAULT NULL::character varying,
    datumkd date,
    znesek numeric(16,6) DEFAULT NULL::numeric,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 229 (class 1259 OID 826074)
-- Name: postninaslovi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postninaslovi (
    id uuid NOT NULL,
    klient_id uuid,
    drzava_id uuid,
    naziv character varying(50) DEFAULT NULL::character varying,
    nazivdva character varying(50) DEFAULT NULL::character varying,
    ulica character varying(50) DEFAULT NULL::character varying,
    ulicadva character varying(50) DEFAULT NULL::character varying,
    posta character varying(50) DEFAULT NULL::character varying,
    postanaziv character varying(50) DEFAULT NULL::character varying,
    pokrajina character varying(50) DEFAULT NULL::character varying,
    jeeu character varying(1) DEFAULT NULL::character varying,
    privzeti boolean,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 230 (class 1259 OID 826087)
-- Name: pozin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pozin (
    id uuid NOT NULL,
    dok_id uuid,
    klient_id uuid,
    maticna_id uuid,
    delavec_id uuid,
    kos_id uuid,
    pakiranje_id uuid,
    stevilka character varying(13) NOT NULL,
    tip character varying(1) NOT NULL,
    datdog date NOT NULL,
    status character varying(3) NOT NULL,
    datzap date,
    datzac date,
    datfmea date,
    potkw character varying(7) DEFAULT NULL::character varying,
    potkw2 character varying(7) DEFAULT NULL::character varying,
    kolicina numeric(12,3) NOT NULL,
    opis text,
    opisd text,
    jeopd boolean,
    jeris character varying(1) DEFAULT NULL::character varying,
    jensl character varying(1) DEFAULT NULL::character varying,
    jednos character varying(1) DEFAULT NULL::character varying,
    jerazpis character varying(1) DEFAULT NULL::character varying,
    jedelo character varying(1) DEFAULT NULL::character varying,
    jeure character varying(1) DEFAULT NULL::character varying,
    datrazpisa date,
    jekos character varying(1) DEFAULT NULL::character varying,
    jesur character varying(1) DEFAULT NULL::character varying,
    jend character varying(1) DEFAULT NULL::character varying,
    jest character varying(1) DEFAULT NULL::character varying,
    jeemb character varying(1) DEFAULT NULL::character varying,
    jevo character varying(1) DEFAULT NULL::character varying,
    jeoo character varying(1) DEFAULT NULL::character varying,
    jemo character varying(1) DEFAULT NULL::character varying,
    jemq character varying(1) DEFAULT NULL::character varying,
    jeqa character varying(1) DEFAULT NULL::character varying,
    datzkos date,
    datikos date,
    datzrtd date,
    datzsin date,
    datirtd date,
    datisin date,
    datzdpd date,
    datidpd date,
    ppi character varying(7) DEFAULT NULL::character varying,
    ppr character varying(7) DEFAULT NULL::character varying,
    jegs character varying(1) DEFAULT NULL::character varying,
    jezk character varying(1) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    kalkkoso_id uuid
);


--
-- TOC entry 231 (class 1259 OID 826117)
-- Name: pozizd; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pozizd (
    id uuid NOT NULL,
    skladisce_id uuid,
    maticna_id uuid,
    klient_id uuid,
    prejemnik_id uuid,
    pakiranje_id uuid,
    dobavnica_id uuid,
    stevilka integer NOT NULL,
    status integer NOT NULL,
    kolicina numeric(12,3) NOT NULL,
    pogodba character varying(30) NOT NULL,
    kw character varying(7) DEFAULT NULL::character varying,
    datizdobave date,
    datpku date,
    datdog date NOT NULL,
    sifpog character varying(4) DEFAULT NULL::character varying,
    upor character varying(10) NOT NULL,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    naslovdostave_id uuid
);


--
-- TOC entry 232 (class 1259 OID 826123)
-- Name: poznd; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE poznd (
    id uuid NOT NULL,
    nalog_id uuid,
    dokument_id uuid,
    maticna_id uuid,
    pozicija numeric(10,0) DEFAULT NULL::numeric,
    zeljeniteden character varying(7) DEFAULT NULL::character varying,
    datumzeljeni date,
    izdelaniteden character varying(7) DEFAULT NULL::character varying,
    lpmteden character varying(7) DEFAULT NULL::character varying,
    dokumentpotrditve character varying(10) DEFAULT NULL::character varying,
    potrjeniteden1 character varying(7) DEFAULT NULL::character varying,
    potrjeniteden2 character varying(7) DEFAULT NULL::character varying,
    datumpotrditve1 date,
    datumpotrditve2 date,
    zbirnapozicija character varying(3) DEFAULT NULL::character varying,
    dniplacila numeric(5,0) DEFAULT NULL::numeric,
    kolicina numeric(12,3) DEFAULT NULL::numeric,
    pridobavitelju numeric(12,4) DEFAULT NULL::numeric,
    teza numeric(12,5) DEFAULT NULL::numeric,
    cena numeric(15,5) DEFAULT NULL::numeric,
    cenakg numeric(12,5) DEFAULT NULL::numeric,
    rabatprocent numeric(6,2) DEFAULT NULL::numeric,
    rabat numeric(12,2) DEFAULT NULL::numeric,
    opis character varying(50) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    statusnarocila character varying(3) NOT NULL,
    vezarazpis_id uuid,
    cenavaluta numeric(16,2) DEFAULT NULL::numeric,
    cenakgvaluta numeric(12,5) DEFAULT NULL::numeric,
    rabatvaluta numeric(16,6) DEFAULT NULL::numeric,
    znesek numeric(16,2) DEFAULT NULL::numeric,
    znesekvaluta numeric(16,2) DEFAULT NULL::numeric
);


--
-- TOC entry 233 (class 1259 OID 826148)
-- Name: poznk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE poznk (
    id uuid NOT NULL,
    dokument_id uuid,
    nalog_id uuid,
    maticna_id uuid,
    pozicija numeric(10,0) DEFAULT NULL::numeric,
    zeljeniteden character varying(7) DEFAULT NULL::character varying,
    datumzeljeni date,
    dokumentpotrditve character varying(10) DEFAULT NULL::character varying,
    dniplacila numeric(5,0) DEFAULT NULL::numeric,
    datumplacila date,
    statusizdelka character varying(1) DEFAULT NULL::character varying,
    datumizdobave date,
    datumacceptance date,
    mojdatumizdobave date,
    pariteta character varying(50) DEFAULT NULL::character varying,
    nacinplacila character varying(50) DEFAULT NULL::character varying,
    rokizdelave character varying(50) DEFAULT NULL::character varying,
    kolicina numeric(12,3) DEFAULT NULL::numeric,
    provizija numeric(6,2) DEFAULT NULL::numeric,
    cena numeric(15,5) DEFAULT NULL::numeric,
    tecaj numeric(16,6) DEFAULT NULL::numeric,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    postavkaponudbe_id uuid,
    statusnarocila character varying(3) NOT NULL,
    statuspredaje character varying(3) NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 826165)
-- Name: pozpk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pozpk (
    id uuid NOT NULL,
    dokument_id uuid,
    kalkulacija_id uuid,
    maticna_id uuid,
    pozicija numeric(10,0) DEFAULT NULL::numeric,
    statusprodukta character varying(3) DEFAULT NULL::character varying,
    dniplacila numeric(5,0) DEFAULT NULL::numeric,
    nacinplacila character varying(50) DEFAULT NULL::character varying,
    rokizdelave character varying(50) DEFAULT NULL::character varying,
    pariteta character varying(50) DEFAULT NULL::character varying,
    datumzeljeni date,
    letnakolicina numeric(12,3) DEFAULT NULL::numeric,
    stevilolet numeric(4,0) DEFAULT NULL::numeric,
    tecaj numeric(16,6) DEFAULT NULL::numeric,
    naziv text NOT NULL,
    enotamere character varying(3) DEFAULT NULL::character varying,
    text text,
    jeprint character varying(1) DEFAULT NULL::character varying,
    datumprint date,
    jekosovnica character varying(1) DEFAULT NULL::character varying,
    datumkosovnica date,
    istkosovnica date,
    jematerial character varying(1) DEFAULT NULL::character varying,
    datummaterial date,
    istmaterial date,
    kolicina numeric(12,3) DEFAULT NULL::numeric,
    cena numeric(15,5) DEFAULT NULL::numeric,
    znesek numeric(16,2) DEFAULT NULL::numeric,
    cenadela numeric(15,5) DEFAULT NULL::numeric,
    dodatekdela numeric(15,5) DEFAULT NULL::numeric,
    odstotekdela numeric(6,2) DEFAULT NULL::numeric,
    cenamateriala numeric(15,5) DEFAULT NULL::numeric,
    dodatekmateriala numeric(15,5) DEFAULT NULL::numeric,
    odstotekmateriala numeric(6,2) DEFAULT NULL::numeric,
    cenaprevoza numeric(15,5) DEFAULT NULL::numeric,
    dodatekprevoza numeric(15,5) DEFAULT NULL::numeric,
    odstotekprevoza numeric(6,2) DEFAULT NULL::numeric,
    tk numeric(15,5) DEFAULT NULL::numeric,
    setup numeric(15,5) DEFAULT NULL::numeric,
    provizija numeric(6,2) DEFAULT NULL::numeric,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 235 (class 1259 OID 826201)
-- Name: prejsnjelokacije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prejsnjelokacije (
    id uuid NOT NULL,
    paket_id uuid,
    lokacija_id uuid,
    casodloga timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    odlozil character varying(10) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 236 (class 1259 OID 826207)
-- Name: prejsnjipaketi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prejsnjipaketi (
    id uuid NOT NULL,
    paket_id uuid,
    parent uuid NOT NULL,
    caszapakiranja timestamp(0) without time zone NOT NULL,
    casodpakiranja timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    zapakiral character varying(10) DEFAULT NULL::character varying,
    odpakiral character varying(10) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 237 (class 1259 OID 826215)
-- Name: prikazlokacije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prikazlokacije (
    id uuid NOT NULL,
    lokacija_id uuid,
    zemljevid_id uuid,
    koordinatax integer NOT NULL,
    koordinatay integer NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 238 (class 1259 OID 826220)
-- Name: priponka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE priponka (
    id uuid NOT NULL,
    tdok_id uuid,
    datoteka_id uuid,
    mapa_id uuid,
    lastnik uuid NOT NULL,
    classlastnika character varying(200) NOT NULL,
    naziv character varying(200) NOT NULL,
    jemapa boolean NOT NULL,
    zaklenjena boolean NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 239 (class 1259 OID 826241)
-- Name: promo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE promo (
    id uuid NOT NULL,
    izvedba_id uuid,
    delavec_id uuid,
    zastoj_id uuid,
    izmena character varying(1) NOT NULL,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    ure numeric(12,2) NOT NULL,
    delkol numeric(10,2) NOT NULL,
    noreta numeric(10,4) NOT NULL,
    ts numeric(8,3) NOT NULL,
    tc numeric(8,3) NOT NULL,
    tn numeric(8,3) NOT NULL,
    izmet numeric(10,2) NOT NULL,
    dobrih numeric(12,2) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    tip character varying(255) NOT NULL,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    uredok numeric(12,2) DEFAULT NULL::numeric,
    zapop numeric(10,2) DEFAULT NULL::numeric,
    zepop numeric(10,2) DEFAULT NULL::numeric,
    norma numeric(10,4) DEFAULT NULL::numeric,
    uredokonca numeric(12,2) DEFAULT NULL::numeric,
    kilometrov numeric(12,2) DEFAULT NULL::numeric
);


--
-- TOC entry 240 (class 1259 OID 826254)
-- Name: razk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE razk (
    id uuid NOT NULL,
    nalog_id uuid,
    maticna_id uuid,
    parent_id uuid,
    kolicina numeric(12,4) NOT NULL,
    kolicinaizdaje numeric(12,4) DEFAULT NULL::numeric,
    kolicinanaroci numeric(12,4) DEFAULT NULL::numeric,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    statusnarocil character varying(3) NOT NULL,
    statusizdaje character varying(3) NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 826261)
-- Name: razpiskost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE razpiskost (
    id uuid NOT NULL,
    kos_id uuid,
    operacija_id uuid,
    tehen_id uuid,
    klient_id uuid,
    delavec_id uuid,
    poz character varying(2) NOT NULL,
    kdodela character varying(1) NOT NULL,
    status character varying(3) DEFAULT NULL::character varying,
    pripcas numeric(12,4) NOT NULL,
    kolicina numeric(12,3) NOT NULL,
    norma numeric(8,3) NOT NULL,
    datraz date NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 242 (class 1259 OID 826267)
-- Name: revizije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE revizije (
    id integer NOT NULL,
    razred character varying(100) NOT NULL,
    objectid uuid NOT NULL,
    upor uuid,
    datum timestamp(0) without time zone NOT NULL,
    tip character varying(3) NOT NULL,
    data text NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 826273)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3915 (class 0 OID 0)
-- Dependencies: 243
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 244 (class 1259 OID 826275)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    builtin boolean NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 245 (class 1259 OID 826283)
-- Name: role_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role_permission (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 246 (class 1259 OID 826286)
-- Name: role_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role_role (
    role_source uuid NOT NULL,
    role_target uuid NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 826289)
-- Name: serijskestevilke; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE serijskestevilke (
    id uuid NOT NULL,
    maticna_id uuid,
    paket_id uuid,
    stevilka character varying(30) NOT NULL,
    upor character varying(10) NOT NULL,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 248 (class 1259 OID 826293)
-- Name: sifdog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sifdog (
    id uuid NOT NULL,
    sifra character varying(3) NOT NULL,
    naziv character varying(30) NOT NULL,
    prioriteta character varying(1) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 249 (class 1259 OID 826298)
-- Name: skl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE skl (
    id uuid NOT NULL,
    lokacija_id uuid,
    sifra character varying(2) NOT NULL,
    naziv character varying(50) NOT NULL,
    tipm character varying(1) NOT NULL,
    glomat character varying(1) DEFAULT NULL::character varying,
    izrab uuid,
    prevzemipremission text,
    zbirno boolean NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    lokacijavhoda_id uuid,
    metodaobracuna character varying(10) NOT NULL,
    metodacrpanja character varying(10) NOT NULL,
    poslujelokacijsko boolean NOT NULL
);


--
-- TOC entry 265 (class 1259 OID 1330438)
-- Name: skladiscenjeizdaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE skladiscenjeizdaja (
    id uuid NOT NULL,
    poreklo_id uuid,
    kolicina numeric(12,3) NOT NULL,
    status character varying(3) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    izhodnidokument_id uuid
);


--
-- TOC entry 266 (class 1259 OID 1330447)
-- Name: skladiscenjepremik; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE skladiscenjepremik (
    id uuid NOT NULL,
    izvor_id uuid,
    cilj_id uuid,
    iz_id uuid,
    na_id uuid,
    kolicina numeric(12,3) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 267 (class 1259 OID 1330458)
-- Name: skladiscenjezaloga; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE skladiscenjezaloga (
    id uuid NOT NULL,
    lokacija_id uuid,
    zaloga_id uuid,
    datum timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    kolicinadobro numeric(12,3) NOT NULL,
    prostazaloga numeric(12,3) NOT NULL,
    status character varying(1) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    izvornidokument_id uuid,
    vhodnidokument_id uuid
);


--
-- TOC entry 250 (class 1259 OID 826305)
-- Name: sklo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sklo (
    id uuid NOT NULL,
    sklop_id uuid,
    maticnadrzalo character varying(15) DEFAULT NULL::character varying,
    kolicinadrzalo numeric(8,2) DEFAULT NULL::numeric,
    kolicinaorodje numeric(8,2) DEFAULT NULL::numeric,
    kolicinapomozno1 numeric(8,2) DEFAULT NULL::numeric,
    kolicinapomozno2 numeric(8,2) DEFAULT NULL::numeric,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    maticnaorodje_id uuid,
    maticnapomozno1_id uuid,
    maticnapomozno2_id uuid
);


--
-- TOC entry 251 (class 1259 OID 826315)
-- Name: skupine; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE skupine (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 252 (class 1259 OID 826328)
-- Name: statustehen; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE statustehen (
    id uuid NOT NULL,
    tehen_id uuid,
    statusenote character varying(3) NOT NULL,
    datumstatusa timestamp(0) without time zone NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    trenutnaoperacija_id uuid
);


--
-- TOC entry 253 (class 1259 OID 826333)
-- Name: stevilcenjedokumenta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjedokumenta (
    id uuid NOT NULL,
    sifra character varying(8) NOT NULL,
    naziv character varying(100) NOT NULL,
    prefix character varying(5) DEFAULT NULL::character varying,
    suffix character varying(5) DEFAULT NULL::character varying,
    zacetek integer NOT NULL,
    dolzina integer NOT NULL,
    format character varying(20) NOT NULL,
    globalno boolean,
    poletih boolean,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 254 (class 1259 OID 826340)
-- Name: stevilcenjeposkl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjeposkl (
    id uuid NOT NULL,
    skl_id uuid,
    dok_id uuid,
    stevilcenje_id uuid,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 255 (class 1259 OID 826345)
-- Name: stevilcenjetrenutne; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjetrenutne (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer,
    stevilka integer NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 256 (class 1259 OID 826350)
-- Name: tdok; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tdok (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    sifra character varying(3) NOT NULL,
    vrsta character varying(5) DEFAULT NULL::character varying,
    stevilci character varying(1) DEFAULT NULL::character varying,
    kratki character varying(5) NOT NULL,
    naziv character varying(30) NOT NULL,
    stevilcipriponke boolean,
    template text,
    style text,
    headerimage character varying(255) DEFAULT NULL::character varying,
    footerimage character varying(255) DEFAULT NULL::character varying,
    pagesize character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 257 (class 1259 OID 826363)
-- Name: tipdogodka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdogodka (
    id uuid NOT NULL,
    name character varying(50) NOT NULL,
    opis character varying(255) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 258 (class 1259 OID 826368)
-- Name: tiskalniki; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tiskalniki (
    id uuid NOT NULL,
    tip integer NOT NULL,
    razred character varying(10) NOT NULL,
    naziv character varying(50) NOT NULL,
    naslov character varying(50) NOT NULL,
    lokacija character varying(50) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 259 (class 1259 OID 826374)
-- Name: uporabniki; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE uporabniki (
    id uuid NOT NULL,
    username character varying(10) NOT NULL,
    name character varying(255) NOT NULL,
    surname character varying(255) DEFAULT NULL::character varying,
    email character varying(255) NOT NULL,
    password character varying(90) NOT NULL,
    enabled boolean NOT NULL,
    apikey character varying(90) DEFAULT NULL::character varying,
    expires date,
    defaultroute text,
    defaultrouteparams text,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 260 (class 1259 OID 826384)
-- Name: user_hierroles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_hierroles (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 261 (class 1259 OID 826387)
-- Name: user_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_role (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 262 (class 1259 OID 826390)
-- Name: valuta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE valuta (
    id uuid NOT NULL,
    sifra character varying(3) NOT NULL,
    oznaka character varying(3) NOT NULL,
    upor character varying(10) NOT NULL,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 263 (class 1259 OID 826394)
-- Name: zbirur; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zbirur (
    id uuid NOT NULL,
    nalog_id uuid,
    razpis_id uuid,
    operacija_id uuid,
    tehen_id uuid,
    delavec_id uuid,
    klient_id uuid,
    zapraz integer NOT NULL,
    stserije numeric(2,0) NOT NULL,
    poz character varying(2) DEFAULT NULL::character varying,
    kajjeoper character varying(1) NOT NULL,
    zdo timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    kdo timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    uredo numeric(8,2) NOT NULL,
    urezps numeric(8,3) DEFAULT NULL::numeric,
    urezast numeric(8,2) NOT NULL,
    dobrih numeric(10,2) NOT NULL,
    izmet numeric(8,2) NOT NULL,
    poprav numeric(8,2) NOT NULL,
    kolicina numeric(12,4) NOT NULL,
    razkol numeric(12,4) NOT NULL,
    delkol numeric(12,4) NOT NULL,
    norma numeric(12,4) NOT NULL,
    zapplan numeric(7,0) NOT NULL,
    stadeu character varying(1) NOT NULL,
    stapla character varying(1) DEFAULT NULL::character varying,
    statuspla character varying(3) NOT NULL,
    statusizv character varying(3) NOT NULL,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    staqa character varying(3) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    razpiskos_id uuid,
    kdodela character varying(1) NOT NULL,
    pripcas numeric(12,4) DEFAULT NULL::numeric,
    zps timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    kps timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    statusdod character varying(1) DEFAULT NULL::character varying,
    dobaviteljevasifra character varying(40) DEFAULT NULL::character varying,
    datzel date,
    dobdod character varying(30) DEFAULT NULL::character varying,
    embkol numeric(12,4) DEFAULT NULL::numeric,
    prekol numeric(12,4) DEFAULT NULL::numeric,
    ostanekdodelave numeric(12,4) DEFAULT NULL::numeric,
    plakol numeric(12,4) DEFAULT NULL::numeric,
    recnasid uuid,
    recpreid uuid
);


--
-- TOC entry 264 (class 1259 OID 826416)
-- Name: zbirur_norme; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zbirur_norme (
    izvedba_id uuid NOT NULL,
    norma_id uuid NOT NULL
);


--
-- TOC entry 2931 (class 2604 OID 826419)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3810 (class 0 OID 825529)
-- Dependencies: 170
-- Data for Name: cena; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cena (id, maticna_id, klient_id, valuta_id, status, opis, veljaod, veljado, faktor, osnova, cena, kolicinaod, kolicinado, minnarocilo, rabatods, rokplacila, pariteta, upor, datknj) FROM stdin;
d9cb8fdd-9a58-4691-864f-1c7fdf717a52	6ce0c380-ec67-4c64-8245-236715159d31	a3a70ec8-47f5-4ef8-ae35-ab0d29b11284	\N	100		2013-10-01	\N	1.0000	5.446700	5.446700	23.000	43.000	25.000	0.000000	0		DARINKA	2013-05-15 12:30:00
59fbfa1f-008a-4962-8540-0a731983bb18	ad729aa8-2672-43cb-8616-a8a2a2640917	8f2a808e-b1b3-4aa2-baeb-a929cae06131	\N	100		2008-01-01	\N	1.0000	1.847500	1.847500	0.000	0.000	0.000	0.000000	0		DARINK	\N
cf66b4c7-0a89-4971-8d16-77852f3386d1	0098f83c-8c63-464b-839d-26210de36b70	ace6bb6d-ea26-412a-b57e-c5f56272e790	\N	100		2013-09-30	\N	1.0000	2.729500	2.729500	0.000	0.000	0.000	0.000000	0		DARINKA	2013-10-15 08:41:00
0a591bf1-2949-468a-887a-029209891155	30566084-b545-458a-9eb7-78a3dafa61e7	8cc97f11-1004-45be-8736-6e11835799ab	\N	100		2011-01-01	\N	1.0000	10.500000	9.450000	9.000	99.000	10.000	10.000000	0		DARINK	\N
fa349066-7f8f-4b45-a195-6411b5bc8688	595086ad-1eb0-4df6-8c43-de50a4515602	3884a30d-8984-4b6c-a7e0-ba773e24ebad	\N	100		2010-09-01	\N	0.2000	8.230000	1.646000	0.000	0.000	5.000	0.000000	0		DARINK	\N
8607f3be-061d-49d8-903c-f3a2133a6837	cc70af25-37c4-479b-89ef-242c0f373694	3884a30d-8984-4b6c-a7e0-ba773e24ebad	\N	100		2011-08-01	\N	1.0000	0.750000	0.750000	0.000	0.000	36.000	0.000000	0		DARINK	\N
735ac579-f583-4f11-92bd-56432880e2bd	ad9787a2-d5f5-4664-9da1-97e0b6b2802d	36207b57-0450-4b91-9ebd-a16094f88653	\N	100	p.e-29092014 dš	2014-09-29	\N	17.9738	4.590000	82.499742	0.000	0.000	0.000	0.000000	0		DARINKA	2014-09-29 09:39:00
d0b79d9a-9be3-45d0-909c-d52809714c46	989dce14-e801-46ff-8b39-80ce399c119f	1b16c29a-1ae8-41ad-92b9-2e357cf34b43	\N	100		2014-04-07	\N	1.3258	4.960000	6.575968	0.000	0.000	2640.000	0.000000	0	GS	DARINKA	2014-04-08 11:58:00
fd531cb3-5fad-4479-bfe2-6bf367daa966	f62c9914-442d-46a3-ac9e-97a58edde29c	8bf7f038-c672-4f36-9e6e-5cadbea62b06	\N	101	2015c-7835 100t	2015-01-01	\N	1.0000	1.450000	1.450000	0.000	0.000	0.000	0.000000	0	1,887/kg	DARINKA	2014-09-18 16:07:00
bc5e2bd8-dd61-49db-8362-ede23faff363	3ce91059-1c4b-49a6-853b-8895d5e2980e	3884a30d-8984-4b6c-a7e0-ba773e24ebad	\N	100		2014-05-01	\N	0.5000	5.076000	2.538000	0.000	0.000	20.000	0.000000	0		DARINKA	2014-05-23 09:47:00
c03cb0b4-c8db-4fe2-ba24-77b990d4eafc	2b803331-0cbd-46df-bdcf-82c6a35b966d	a3a70ec8-47f5-4ef8-ae35-ab0d29b11284	\N	100	2014 KK	2013-10-01	\N	1.0000	0.278600	0.278600	90.000	188.000	100.000	0.000000	0		DARINKA	2014-01-13 11:41:00
087450b7-597f-4ebe-8289-ca04eceb2135	fe7f4103-a524-40be-9ba8-84c65478bde1	a3a70ec8-47f5-4ef8-ae35-ab0d29b11284	\N	100	2014 KK	2013-10-01	\N	1.0000	1.436600	1.436600	44.000	88.000	50.000	0.000000	0		DARINKA	2014-01-13 11:47:00
d2dcb35c-d1d6-49b4-81c2-42ef018773de	1692dd6f-dfa5-4190-88a0-27082c0d55a9	073b22f7-3070-45d6-9df8-242d5df7e760	\N	100		2012-04-10	\N	1.0000	0.000000	0.000000	0.000	0.000	0.000	0.000000	0		DARINK	\N
\.


--
-- TOC entry 3811 (class 0 OID 825543)
-- Dependencies: 171
-- Data for Name: cenovnirazpon; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cenovnirazpon (id, kalkulacija_id, ponudba_id, kolicina, cena, znesek, cenadela, dodatekdela, odstotekdela, cenamateriala, dodatekmateriala, odstotekmateriala, cenaprevoza, dodatekprevoza, odstotekprevoza, tk, setup, provizija, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3812 (class 0 OID 825563)
-- Dependencies: 172
-- Data for Name: checklistvzorec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY checklistvzorec (id, naziv, tip, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3813 (class 0 OID 825569)
-- Dependencies: 173
-- Data for Name: checklistvzorecpostavka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY checklistvzorecpostavka (id, dokument_id, naziv, element, pozicija, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3814 (class 0 OID 825576)
-- Dependencies: 174
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, lastnik_id, stevilka, naziv, caskreiranja, casspremembe, filename, stprenosov, size, mimetype, hash, upor, datknj) FROM stdin;
a928a791-4fcb-4612-b575-b2e815d6e7b0	bedcb99b-3716-41b4-bb85-83637ca60c3c	\N	Kalkulacija 004039 08.03.2015	2015-03-08 15:29:44	2015-03-08 15:29:44	kalkulacija_004039_20150308.pdf	1	21971	application/pdf	aae6f5f5-e815-4d82-38ab-1029b7fdcc48	admin	2015-03-08 15:29:46
6a4e1d08-6c89-483e-86d0-c7d1f8cd5633	bedcb99b-3716-41b4-bb85-83637ca60c3c	\N	Kalkulacija 004039 08.03.2015	2015-03-08 17:27:07	2015-03-08 17:27:07	kalkulacija_004039_20150308.pdf	1	21971	application/pdf	aae6f5f5-e815-4d82-38ab-1029b7fdcc48	admin	2015-03-08 17:27:11
\.


--
-- TOC entry 3815 (class 0 OID 825587)
-- Dependencies: 175
-- Data for Name: deko; Type: TABLE DATA; Schema: public; Owner: -
--

COPY deko (id, datum, opis, zacetek, konec, ure, kw, status, stizmen, leto, mesec, dan, teden, upor, datknj, tehen_id, tip) FROM stdin;
\.


--
-- TOC entry 3816 (class 0 OID 825597)
-- Dependencies: 176
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, tip_id, class, targetid, data, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3817 (class 0 OID 825605)
-- Dependencies: 177
-- Data for Name: dokumentmat; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dokumentmat (id, dok_id, skladisce_id, valuta_id, drzava_id, klient_id, nalog, prejemnik_id, sklv_id, napoved, potrjen, stevilka, datdog, znesek, izrav, znesekvaluta, pripis, kurz, upor, datknj, vd, statusprevzema, rabatods, rabat, rabatvaluta, klientdok, datumkd, naslovklienta_id, naslovprejemnika_id, ovrednoten, original_id, jezik) FROM stdin;
0d6c8a9b-60b0-4dcb-9be4-48a332b5c4ea	9fe156ab-98c9-4b76-94a8-392d169f6393	36eef80e-30ab-49be-a957-cbd16d09700d	bf01064f-d315-457a-96a9-cef957085ee8	\N	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	\N	\N	f	f	TMP201501004	2015-03-02	0.000000	\N	0.000000	\N	1.000000	admin	2015-03-02 13:56:48	1	0	\N	0.000000	\N	123	2015-03-05	\N	\N	f	\N	sl_SI
\.


--
-- TOC entry 3818 (class 0 OID 825621)
-- Dependencies: 178
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba, upor, datknj) FROM stdin;
1e6dcb94-b9bd-4637-84ff-b3efab4e98d1	AF	AFG	004	Afghanistan 	Afganistan	\N	console	2015-01-07 18:44:42
ee953b2c-2bf9-44ed-9769-cce12e215801	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.	console	2015-01-07 18:44:42
7f1f3d4a-7b04-4e5a-aa59-99a6c038bdd3	AL	ALB	008	Albania 	Albanija	\N	console	2015-01-07 18:44:42
d4232c71-8d33-48bc-99a2-eff83b25c422	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.	console	2015-01-07 18:44:42
84a02780-aa9e-4ab3-bf60-350697ee6e05	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.	console	2015-01-07 18:44:42
6eee0592-5fb1-4146-b916-7a60ecfb5d70	AD	AND	020	Andorra 	Andora	\N	console	2015-01-07 18:44:42
349f7f0a-f330-4564-a2d9-54b2f9696fc5	AO	AGO	024	Angola 	Angola	\N	console	2015-01-07 18:44:42
16dba640-94ab-4aad-b18e-9ec87510614e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.	console	2015-01-07 18:44:42
776e7d62-04d5-4047-a410-8f38c804dd60	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.	console	2015-01-07 18:44:42
8ded4c63-d630-4eae-9c81-521685bded0d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.	console	2015-01-07 18:44:42
c3c91979-da56-476b-85af-34625001ca6e	AR	ARG	032	Argentina 	Argenitna	\N	console	2015-01-07 18:44:42
61743f54-adae-4452-9cdb-5b6dc0613e8d	AM	ARM	051	Armenia 	Armenija	\N	console	2015-01-07 18:44:42
5cdd7836-b478-4817-80ae-24a6f99dafd4	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.	console	2015-01-07 18:44:42
60954318-7914-4f2a-bcce-e71b626095e4	AU	AUS	036	Australia 	Avstralija	\N	console	2015-01-07 18:44:42
040eded5-e9c1-4bf2-b633-e090fe412814	AT	AUT	040	Austria 	Avstrija	\N	console	2015-01-07 18:44:42
3781c74c-c456-4c81-b998-a424b9e6c727	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N	console	2015-01-07 18:44:42
7f86ceee-1db2-4d77-b18d-eef829644260	BS	BHS	044	Bahamas 	Bahami	\N	console	2015-01-07 18:44:42
a20c832e-9224-4c78-ac2c-032236f8acf3	BH	BHR	048	Bahrain 	Bahrajn	\N	console	2015-01-07 18:44:42
901688f8-385e-474a-85b4-77dca6b7e536	BD	BGD	050	Bangladesh 	Bangladeš	\N	console	2015-01-07 18:44:42
0a1f13c1-d8d7-48ac-9606-3250ec228337	BB	BRB	052	Barbados 	Barbados	\N	console	2015-01-07 18:44:42
a06d5a96-36f0-41e6-b69d-32f64eb6ec97	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.	console	2015-01-07 18:44:42
0615fdbf-6215-4249-87df-986a8af3bbea	BE	BEL	056	Belgium 	Belgija	\N	console	2015-01-07 18:44:42
c9ad7ce4-9f01-4366-babf-d289ff86b380	BZ	BLZ	084	Belize 	Belize	\N	console	2015-01-07 18:44:42
9c89f502-81bd-488a-9870-675a99f479e5	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).	console	2015-01-07 18:44:42
791d6b46-fc98-4ea7-b7bd-15b29127f771	BM	BMU	060	Bermuda 	Bermudi	\N	console	2015-01-07 18:44:42
03e382c9-edbc-4b90-9734-ed1b706f27f1	BT	BTN	064	Bhutan 	Butan	\N	console	2015-01-07 18:44:42
2c8dc7f4-5e35-4462-bfb8-4b288741bbb5	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N	console	2015-01-07 18:44:42
986d1e03-088f-4324-9670-cde3aea9bee4	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.	console	2015-01-07 18:44:42
36de72c6-c163-43f0-91ba-86407ae0438b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N	console	2015-01-07 18:44:43
9e2f892f-37e1-42d0-9f58-83675e222168	BW	BWA	072	Botswana 	Bocvana	\N	console	2015-01-07 18:44:43
0bdf9295-4ead-4191-8e76-098e7f3e06d6	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.	console	2015-01-07 18:44:43
efeef326-bade-4ce6-ac9e-da6dcdf228c9	BR	BRA	076	Brazil 	Brazilija	\N	console	2015-01-07 18:44:43
98d719c6-3717-484f-bd66-e2f9c39d8e30	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N	console	2015-01-07 18:44:43
847123b9-eac3-4650-bdbf-cd9446ea3d86	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.	console	2015-01-07 18:44:43
5ddb638b-968c-413b-96b3-5a44e473c62e	BG	BGR	100	Bulgaria 	Bolgarija	\N	console	2015-01-07 18:44:43
e87bd537-4e58-4c63-80a5-e952eea972a9	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).	console	2015-01-07 18:44:43
75b8bf0e-6fdf-4489-b3fb-4ea50156a52d	BI	BDI	108	Burundi 	Burundi 	\N	console	2015-01-07 18:44:43
07c20a6a-d7cd-4ccc-9a1b-8b456e1a5033	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.	console	2015-01-07 18:44:43
ded603da-fbea-4813-8def-8036c68ee6ec	CM	CMR	120	Cameroon 	Kamerun	\N	console	2015-01-07 18:44:43
1885fa7b-1964-498c-a9da-47aed013044f	CA	CAN	124	Canada 	Kanada	\N	console	2015-01-07 18:44:43
7406af96-6ae0-470b-bb32-65b09f5b6e99	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.	console	2015-01-07 18:44:43
507aca26-ca22-4c69-b378-960be4d8ebde	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N	console	2015-01-07 18:44:43
c5cda082-aff6-45fd-98b0-58843b014af0	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.	console	2015-01-07 18:44:43
65f5d8f9-6955-4188-adca-137e98b864f4	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.	console	2015-01-07 18:44:43
78822bfe-d6fa-432a-8312-d865556690b3	CL	CHL	152	Chile 	Čile	\N	console	2015-01-07 18:44:43
b774cdf8-7d12-4230-ad65-cad56fc07cfb	CN	CHN	156	China 	Kitajska	\N	console	2015-01-07 18:44:43
e5efec44-ea4e-40db-a6cd-127fac195508	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.	console	2015-01-07 18:44:43
05a8b6aa-1632-4d06-8af3-5a3744ce9e9d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.	console	2015-01-07 18:44:43
8603cfe8-3176-4c05-b174-23ecd3a7424c	CO	COL	170	Colombia 	Kolumbija	\N	console	2015-01-07 18:44:43
e450cf57-7211-46bc-a90e-e13a8513eb28	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.	console	2015-01-07 18:44:43
eb61c043-ba67-4896-9027-189ed89dd1bb	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).	console	2015-01-07 18:44:43
69987bde-a0da-42f5-94f0-427a32e1e523	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.	console	2015-01-07 18:44:43
c2987320-a18c-4ce3-912b-b3adab37aa3c	CK	COK	184	Cook Islands 	Cookovi otoki	\N	console	2015-01-07 18:44:43
d32555d5-1b73-4084-8fb3-ebc6e36653c8	CR	CRI	188	Costa Rica 	Kostarika	\N	console	2015-01-07 18:44:43
e7ba222e-d241-454c-86a1-8df2c64f5e53	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N	console	2015-01-07 18:44:43
03095c07-4ce9-4306-bf5d-e4d2ad91dc31	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.	console	2015-01-07 18:44:43
99fdb082-7a20-4a35-ba66-bf8b697d4899	CU	CUB	192	Cuba 	Kuba	\N	console	2015-01-07 18:44:43
24595b92-4a90-4a53-8d25-1c65cce7f1f5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.	console	2015-01-07 18:44:43
7cefb6e0-5a3c-427a-8760-907310e6fbf4	CY	CYP	196	Cyprus 	Ciper	\N	console	2015-01-07 18:44:43
b98cb043-8691-412d-8540-b39a64500af9	CZ	CZE	203	Czech Republic 	Češka	\N	console	2015-01-07 18:44:43
8fcf87b0-4040-4435-83f9-95517de3878a	DK	DNK	208	Denmark 	Danska	\N	console	2015-01-07 18:44:43
3ea32222-0c13-4624-8f9b-641607942fa5	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).	console	2015-01-07 18:44:43
dea4831f-9578-4914-9f70-50d01b941772	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.	console	2015-01-07 18:44:43
f573f853-c109-4368-abe8-b77ef65280d4	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N	console	2015-01-07 18:44:43
49646dba-811e-403a-bb4b-d7998a2d19af	EC	ECU	218	Ecuador 	Ekvador	\N	console	2015-01-07 18:44:43
70a1c3b1-b26d-48b4-af2c-df942bb7f78e	EG	EGY	818	Egypt 	Egipt	\N	console	2015-01-07 18:44:43
dc7849fb-96b4-4ed0-8795-04fabadab7e6	SV	SLV	222	El Salvador 	Salvador	\N	console	2015-01-07 18:44:43
3a50cb5b-c16d-4805-b295-7b55053793da	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.	console	2015-01-07 18:44:43
b0fc51a5-3cb2-42f2-8aab-132007f46365	ER	ERI	232	Eritrea 	Eritreja	\N	console	2015-01-07 18:44:43
a6da2943-5849-44df-b5bc-7ca4e5e8ebfc	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.	console	2015-01-07 18:44:43
63d32db7-9a98-4435-acfc-131422fbe695	ET	ETH	231	Ethiopia 	Etiopija	\N	console	2015-01-07 18:44:43
8dc5afaa-a8cd-4558-b2ec-f670a01d5b3b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.	console	2015-01-07 18:44:43
2f4926e5-16a2-498b-bfdc-d2b76ab04277	FO	FLK	238	Faroe Islands 	Ferski otoki	\N	console	2015-01-07 18:44:43
60032cff-63be-4cc0-ab0f-6199b96ebca7	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.	console	2015-01-07 18:44:43
4437677d-8bdb-41af-b450-c29823e37283	FI	FIN	246	Finland 	Finska	\N	console	2015-01-07 18:44:43
f832f171-a36f-418b-80c3-52774f726bcf	FR	FRA	250	France 	Francija	\N	console	2015-01-07 18:44:43
1d95bbee-9d93-48fa-96a1-ae4f0894ab84	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.	console	2015-01-07 18:44:43
543e9846-cc14-4f21-b36f-fd501132e934	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.	console	2015-01-07 18:44:43
28574e8b-b144-4ee0-b8ea-4f2440c8b31c	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.	console	2015-01-07 18:44:43
97a51b63-556a-4ba9-ade2-b599d1eb1e59	GA	GAB	266	Gabon 	Gabon	\N	console	2015-01-07 18:44:43
c25b4cd2-76d6-4c5c-9512-0bb2baf33ce8	GM	GMB	270	Gambia 	Gambija	\N	console	2015-01-07 18:44:43
3cfd710f-4b17-47c4-9938-5214c1922ec0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.	console	2015-01-07 18:44:43
de8cc0bd-67b3-45a0-a5e2-abba85eac259	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.	console	2015-01-07 18:44:43
c372a7e0-2b14-4394-a43b-059b3495be36	GH	GHA	288	Ghana 	Gana	\N	console	2015-01-07 18:44:43
732a1828-8e57-4fdf-8ab5-ff5102d5ad09	GI	GIB	292	Gibraltar 	Gibraltar	\N	console	2015-01-07 18:44:43
5cd4cde9-7f11-4490-9b52-8abe6dd9ca80	GR	GRC	300	Greece 	Grčija	\N	console	2015-01-07 18:44:43
288d8bf5-79b4-42bd-a5ee-6990e245b4fb	GL	GRL	304	Greenland 	Grenlandija	\N	console	2015-01-07 18:44:43
ec40550a-5311-4860-8618-f927cbae52b9	GD	GRD	308	Grenada 	Grenada	\N	console	2015-01-07 18:44:43
b1318aa3-6f8d-47d7-b215-6de6302de5cc	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.	console	2015-01-07 18:44:43
24390833-ebe1-458c-a71a-31447f35ad19	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).	console	2015-01-07 18:44:43
f94401d4-050c-4f87-ae9c-704d420266a4	GT	GTM	320	Guatemala 	Gvatemala	\N	console	2015-01-07 18:44:43
84802060-6215-4358-9e74-86ef54acd5e5	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.	console	2015-01-07 18:44:43
1ea0bbd7-a613-4301-893b-555324144695	GN	GIN	324	Guinea 	Gvineja	\N	console	2015-01-07 18:44:43
afc9ece5-0141-4f36-95f3-9fc67802db60	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N	console	2015-01-07 18:44:43
0b2392ec-27ef-429d-b4bc-7ab0718b1b99	GY	GUY	328	Guyana 	Gvajana	\N	console	2015-01-07 18:44:43
576a9a66-f0c5-407a-babe-7741a61fb16a	HT	HTI	332	Haiti 	Haiti	\N	console	2015-01-07 18:44:43
c98791e2-8192-4300-9ffa-440c5505fc5b	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.	console	2015-01-07 18:44:43
5216d5e7-fcde-4edd-b6f9-2cb23084a6dc	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).	console	2015-01-07 18:44:43
ef9e1337-0098-49a7-830b-6b21378ac8dd	HN	HND	340	Honduras 	Honduras	\N	console	2015-01-07 18:44:43
b692fc1a-0c3a-4e14-9883-82a958afbaf7	HK	HKG	344	Hong Kong 	Hong Kong	\N	console	2015-01-07 18:44:43
8d2f6f39-518c-4f54-a44b-25b5a4cf64c2	HU	HUN	348	Hungary 	Madžarska	\N	console	2015-01-07 18:44:43
9b5ca0d7-abca-41ea-8748-01fef9e185b7	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.	console	2015-01-07 18:44:43
53909547-518f-42f9-b71f-e82920f823d0	IN	IND	356	India 	Indija	\N	console	2015-01-07 18:44:43
5ee1a713-a874-43c5-a93b-ad65237177c4	ID	IDN	360	Indonesia 	Indonezija	\N	console	2015-01-07 18:44:43
953eea92-2cc5-4173-9668-921055600f39	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N	console	2015-01-07 18:44:43
fd9bd00b-05af-47cf-83bf-a9a19fec1675	IQ	IRQ	368	Iraq 	Irak	\N	console	2015-01-07 18:44:43
901f01d6-c2ac-4983-9a3e-102e1cfc2ebd	IE	IRL	372	Ireland 	Irska	\N	console	2015-01-07 18:44:43
3934c2da-28ed-4a89-bd9b-6e444a87b4b0	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.	console	2015-01-07 18:44:43
570cc4ea-7621-4ac3-b321-fb2a3eddf44f	IL	ISR	376	Israel 	Izrael	\N	console	2015-01-07 18:44:43
b2f11199-2ee5-48c0-a055-9279ff65c05f	IT	ITA	380	Italy 	Italija	\N	console	2015-01-07 18:44:43
4af0f02c-29e3-4940-88e1-6e33b594c16b	JM	JAM	388	Jamaica 	Jamajka	\N	console	2015-01-07 18:44:43
1c290086-2429-4ffe-833c-edd0c0898cdb	JP	JPN	392	Japan 	Japonska	\N	console	2015-01-07 18:44:43
883fb405-dc0c-4a83-84f7-77da740baba0	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.	console	2015-01-07 18:44:43
9c96e936-02a6-44aa-9309-6011cb891112	JO	JOR	400	Jordan 	Jordanija	\N	console	2015-01-07 18:44:43
ad9f9342-d002-4ae3-ae37-51a48bc2462d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.	console	2015-01-07 18:44:43
c23d404f-472b-4f35-a49a-44fe0a67e32a	KE	KEN	404	Kenya 	Kenija	\N	console	2015-01-07 18:44:43
c5240d55-5690-4df5-aac2-c28ab45689a1	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.	console	2015-01-07 18:44:43
144c67eb-d1f0-417a-bdd6-3813291e4e33	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).	console	2015-01-07 18:44:43
87cdf735-920c-4983-8547-11970e9b7116	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).	console	2015-01-07 18:44:43
761b7677-f6e3-43ab-93e5-b672377364a7	KW	KWT	414	Kuwait 	Kuvajt	\N	console	2015-01-07 18:44:43
8296cdc8-14fb-400b-ba07-2386841da0b6	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N	console	2015-01-07 18:44:43
027fec49-1679-4083-ab06-886b084cfd2e	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N	console	2015-01-07 18:44:43
03a7e4ae-371e-44e1-aaad-d6d9110cff30	LV	LVA	428	Latvia 	Latvija	\N	console	2015-01-07 18:44:43
9d41896f-991e-4f22-a673-39e6d01f6b6a	LB	LBN	422	Lebanon 	Libanon	\N	console	2015-01-07 18:44:43
3eb0b7df-a319-4806-b9e6-45703bcceac7	LS	LSO	426	Lesotho 	Lesoto	\N	console	2015-01-07 18:44:43
691cd528-fafb-4a50-bdd9-76384ad67da6	LR	LBR	430	Liberia 	Liberija	\N	console	2015-01-07 18:44:43
114c7ca9-0018-451e-8448-ac18c0ccbad0	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.	console	2015-01-07 18:44:43
4f0db7e0-9f96-4eb7-9177-5c132cb64763	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N	console	2015-01-07 18:44:43
1d0cd012-e3d4-42bd-94a8-bc44b773c607	LT	LTU	440	Lithuania 	Litva	\N	console	2015-01-07 18:44:43
41a455bb-c482-4e5a-8e35-c67a823abc5f	LU	LUX	442	Luxembourg 	Luksemburg	\N	console	2015-01-07 18:44:43
59893aea-1449-43b0-87e1-c3f6b5a00969	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.	console	2015-01-07 18:44:43
193db829-c4ce-46b0-b551-6c15bcd0a19b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.	console	2015-01-07 18:44:43
9f2e5a7e-434b-4b82-b05a-180d0acaff77	MG	MDG	450	Madagascar 	Madagaskar	\N	console	2015-01-07 18:44:43
5d5a943a-9642-47c6-9a71-ec2faf05c827	MW	MWI	454	Malawi 	Malavi	\N	console	2015-01-07 18:44:43
829f64af-f422-4aeb-bb94-2c162b2899e3	MY	MYS	458	Malaysia 	Malezija	\N	console	2015-01-07 18:44:43
d656b146-7120-4394-b0d9-4ceef96a3c8b	MV	MDV	462	Maldives 	Maldivi	\N	console	2015-01-07 18:44:43
8d02118e-ff75-477e-aca1-054838ea8d3c	ML	MLI	466	Mali 	Mali	\N	console	2015-01-07 18:44:43
0f43d673-6e63-4906-b099-9708aaa52d5b	MT	MLT	470	Malta 	Malta	\N	console	2015-01-07 18:44:43
d0166c91-c85a-4843-ab52-cfa5c812b676	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.	console	2015-01-07 18:44:43
5bca3cbe-ff9b-4e05-a681-77fa3be19e49	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.	console	2015-01-07 18:44:43
feb1b603-0222-4c11-ab8d-e2adc579e82c	MR	MRT	478	Mauritania 	Mavretanija	\N	console	2015-01-07 18:44:43
b30608f1-177d-41b5-9ce5-8be2145f703c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.	console	2015-01-07 18:44:43
2677a045-c039-4110-bdd3-a20fa22bb82e	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.	console	2015-01-07 18:44:43
10117592-6de5-448e-96ea-bce7fe7428cc	MX	MEX	484	Mexico 	Mehika	\N	console	2015-01-07 18:44:43
693039aa-6105-4e9c-9488-97b75e3aad7c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.	console	2015-01-07 18:44:43
a0fcdb2d-4085-4d7d-9730-24cad23ae229	MD	MDA	498	Moldova, Republic of 	Moldavija	\N	console	2015-01-07 18:44:43
22f6e61f-5d04-4d4d-92f4-16af12b2e1f8	MC	MCO	492	Monaco 	Monako	\N	console	2015-01-07 18:44:43
fdb24fdf-d540-43fe-9e51-a3a5b2317a2d	MN	MNG	496	Mongolia 	Mongolija	\N	console	2015-01-07 18:44:43
f3dccbfd-0a26-4202-ba53-0e6bea303d8d	ME	MNE	499	Montenegro 	Črna Gora	\N	console	2015-01-07 18:44:43
c56d85db-ec69-4723-8e46-c676b5cea110	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.	console	2015-01-07 18:44:43
92a923c8-42c6-40ca-ae2b-6ae456494303	MA	MAR	504	Morocco 	Maroko	\N	console	2015-01-07 18:44:43
468f782a-8d46-4c80-85f1-d4da194e4e99	MZ	MOZ	508	Mozambique 	Mozambik	\N	console	2015-01-07 18:44:43
53ee8eb2-81bb-46c6-bbec-d942c3758088	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).	console	2015-01-07 18:44:43
302e29b9-313a-4c85-bb92-55365dc8a59e	NA	NAM	516	Namibia 	Namibija	\N	console	2015-01-07 18:44:43
f63facb3-dee2-44c8-a0a4-116871c87576	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.	console	2015-01-07 18:44:43
ca36b82a-cd69-461d-9edd-04f01733ad9f	NP	NPL	524	Nepal 	Nepal	\N	console	2015-01-07 18:44:43
b37e35b0-d10b-4751-8644-cab73466643e	NL	NLD	528	Netherlands 	Nizozemska	\N	console	2015-01-07 18:44:43
e75dce94-30cc-4111-9ded-b6a1190422c9	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.	console	2015-01-07 18:44:43
17cf45af-81e7-4b77-807f-3c50eda00675	NZ	NZL	554	New Zealand 	Nova Zelandija	\N	console	2015-01-07 18:44:43
0660e5ae-561f-49f9-a4f2-8633680c3e50	NI	NIC	558	Nicaragua 	Nikaragva	\N	console	2015-01-07 18:44:43
43b9825d-afe2-4f74-987d-371df02675e3	NE	NER	562	Niger 	Niger 	\N	console	2015-01-07 18:44:43
1cc7c277-4b93-4466-aa51-7c1c29884471	NG	NGA	566	Nigeria 	Nigerija	\N	console	2015-01-07 18:44:43
173f414c-232e-42f2-95ba-c1ab788b0325	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.	console	2015-01-07 18:44:43
1d116e2d-fbd2-460a-9d85-fd0720b11b12	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.	console	2015-01-07 18:44:43
5fe4f6e0-82a8-4c8e-b7e3-0693f5e6b18e	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.	console	2015-01-07 18:44:43
6a11975f-d815-457b-926f-83d90fcffc23	NO	NOR	578	Norway 	Norveška	\N	console	2015-01-07 18:44:43
aca502ab-9554-42cb-9c95-ac8fae60d350	OM	OMN	512	Oman 	Oman	\N	console	2015-01-07 18:44:43
15a6ff34-c650-4ed9-8638-537d1d0c7a29	PK	PAK	586	Pakistan 	Pakistan	\N	console	2015-01-07 18:44:43
6e29575d-52e2-4415-bc04-82b53f409b75	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.	console	2015-01-07 18:44:43
a9d3bfcc-adfc-46fd-ae4a-6e61072cffbe	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.	console	2015-01-07 18:44:43
df8c3d16-dd8a-4850-9ed7-5160b4b7d187	PA	PAN	591	Panama 	Panama	\N	console	2015-01-07 18:44:43
9f1a4d10-4f2f-409e-aed6-cd5a9fdb1d1f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N	console	2015-01-07 18:44:43
d8b3c3f5-df72-4062-bee6-b78a3feadc96	PY	PRY	600	Paraguay 	Paragvaj	\N	console	2015-01-07 18:44:43
7923c769-3a53-40cb-8274-c9d85db54cfb	PE	PER	604	Peru 	Peru	\N	console	2015-01-07 18:44:43
a72b03b2-dc80-4e77-94ef-ffac57aa24f7	PH	PHL	608	Philippines 	Filipini	\N	console	2015-01-07 18:44:43
cc74bf5e-e298-4326-91f7-4b4e26c3e674	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.	console	2015-01-07 18:44:43
d0338783-e16b-4f87-8702-537658425082	PL	POL	616	Poland 	Poljska	\N	console	2015-01-07 18:44:43
a2a570e1-0c79-4cd1-b9ec-3682ae606228	PT	PRT	620	Portugal 	Portugalska	\N	console	2015-01-07 18:44:43
109cc271-869b-49be-8199-f7a969bfed80	PR	PRI	630	Puerto Rico 	Portoriko	\N	console	2015-01-07 18:44:43
431eb66b-2f28-4b95-a7f7-6772fa33576c	QA	QAT	634	Qatar 	Katar	\N	console	2015-01-07 18:44:43
83ff990f-7133-4f8a-8fb0-7f9d14c1aa82	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.	console	2015-01-07 18:44:43
6dd0ac48-5014-43a7-a736-85a3d3bb342a	RO	ROU	642	Romania 	Romunija	\N	console	2015-01-07 18:44:43
374c6409-eb8e-4307-a55a-5cf931a7e092	RU	RUS	643	Russian Federation 	Ruska federacija	\N	console	2015-01-07 18:44:43
76d87f83-2ed6-4a7e-8b6a-1750efb2b012	RW	RWA	646	Rwanda 	Ruanda	\N	console	2015-01-07 18:44:43
46c7ff05-2bad-4a5e-a2a2-212254783f40	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.	console	2015-01-07 18:44:43
720c0155-8a07-4171-8e5a-34b51cfec05a	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.	console	2015-01-07 18:44:43
34e779df-ece4-42c0-8af5-8e12ae7e62e6	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.	console	2015-01-07 18:44:43
e7d956fe-00e3-4488-badf-c6aab2ce935c	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.	console	2015-01-07 18:44:43
069523d4-1a29-4ef4-9c68-1fe57c0f2bcb	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.	console	2015-01-07 18:44:43
c4faafdf-f432-4d5b-90f6-3e221a734e58	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.	console	2015-01-07 18:44:43
6e7cd039-6354-4f15-ac78-401dd4840008	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.	console	2015-01-07 18:44:43
406fdb7f-c34f-4f73-a3c6-f3cacab627fa	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).	console	2015-01-07 18:44:43
4f27edec-11cb-49da-9bc2-4f572feaab7c	SM	SMR	674	San Marino 	San Marino	\N	console	2015-01-07 18:44:43
b5268c53-96dd-4812-8161-95661eaeab69	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.	console	2015-01-07 18:44:43
cf7a41c0-cc09-4356-8750-8119e31219a5	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N	console	2015-01-07 18:44:43
4b155c83-f00b-4271-af25-b9a2de7fa5b2	SN	SEN	686	Senegal 	Senegal	\N	console	2015-01-07 18:44:43
c7197125-b480-448f-8574-500202c461a5	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.	console	2015-01-07 18:44:43
0d765bcb-7d72-41b7-b30e-342e82a82c88	SC	SYC	690	Seychelles 	Sejšeli	\N	console	2015-01-07 18:44:43
bd185585-d0c0-4cbe-9959-d2528d181a71	SL	SLE	694	Sierra Leone 	Siera Leone	\N	console	2015-01-07 18:44:43
63afa0a3-e27c-49a1-99c3-0203d020a0ab	SG	SGP	702	Singapore 	Singapur	\N	console	2015-01-07 18:44:43
0c690bd1-ea6b-48e4-812a-93f4284d3790	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.	console	2015-01-07 18:44:43
23d5b6c6-915f-45dc-b84c-d94dee95ecd7	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.	console	2015-01-07 18:44:43
d5baaf48-5378-4934-9e05-e6040f88268c	SI	SVN	705	Slovenia 	Slovenija	\N	console	2015-01-07 18:44:43
4352b4da-e5f9-4e48-9c6c-825b7c32a0ad	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.	console	2015-01-07 18:44:43
48cb425f-18ee-4cd0-b09c-9a072b162f92	SO	SOM	706	Somalia 	Somalija	\N	console	2015-01-07 18:44:43
14a37e27-4d10-45c7-b842-a0223ec01014	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.	console	2015-01-07 18:44:43
f5835b80-b389-4f92-b6b7-3965e9e892f5	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.	console	2015-01-07 18:44:43
d4522b5f-8eaa-445d-b11e-c1578ef48d96	SS	SSD	728	South Sudan 	Južni Sudan	\N	console	2015-01-07 18:44:43
e2eb6e84-aeb1-4d18-b75c-cb06b8b05c78	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.	console	2015-01-07 18:44:43
319f4cec-7e0d-476e-9872-35491da3e057	LK	LKA	144	Sri Lanka 	Šri Lanka	\N	console	2015-01-07 18:44:43
fac1e60b-2577-430f-a57c-149c78afa3a7	SD	SDN	729	Sudan 	Sudan	\N	console	2015-01-07 18:44:43
30d5c34a-ad72-4f90-89af-b5be0123b128	SR	SUR	740	Suriname 	Surinam	\N	console	2015-01-07 18:44:43
31a82f52-23bd-49f1-97b4-738b552d31f7	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.	console	2015-01-07 18:44:43
b7adc78c-dc00-4685-87ed-d448ec759c0b	SZ	SWZ	748	Swaziland 	Svazi	\N	console	2015-01-07 18:44:43
2fb5d8b9-094a-4412-a975-251bfa2905fa	SE	SWE	752	Sweden 	Švedska	\N	console	2015-01-07 18:44:43
5b591fe0-e515-4faa-8c7a-4590195b6d95	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.	console	2015-01-07 18:44:43
b7b584a4-44c4-49e8-9e17-96a7b6a0f6a5	SY	SYR	760	Syrian Arab Republic 	Sirija	\N	console	2015-01-07 18:44:43
aac064f4-e3ef-49eb-b860-392af3d38f4a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N	console	2015-01-07 18:44:43
c56b7df7-fe3d-43ed-bf63-125b48976ec7	TJ	TJK	762	Tajikistan 	Tadžikistan	\N	console	2015-01-07 18:44:43
c0491df8-4da3-495f-a088-944a01c703e9	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N	console	2015-01-07 18:44:43
a7a7ddbd-5dd8-48ac-abb9-138d25ce7540	TH	THA	764	Thailand 	Tajska	\N	console	2015-01-07 18:44:43
83b3b498-fdbd-4ba4-aba2-a1107f9c019c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.	console	2015-01-07 18:44:43
56c0babf-6953-4b47-a4e9-37822db67cdf	TG	TGO	768	Togo 	Togo	\N	console	2015-01-07 18:44:43
82f9532f-4559-432e-a5ed-a9e1f840c08d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.	console	2015-01-07 18:44:43
8bb86690-88d5-4aa8-880c-356573ed9c5d	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.	console	2015-01-07 18:44:43
cc77a237-943c-4cdf-b227-1a607985c78a	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N	console	2015-01-07 18:44:43
f97049f4-402c-41f8-ae09-dfedf650b519	TN	TUN	788	Tunisia 	Tunizija	\N	console	2015-01-07 18:44:43
0f963089-9f70-420d-8e35-a2e903f6e613	TR	TUR	792	Turkey 	Turčija	\N	console	2015-01-07 18:44:43
c928b961-c433-449f-a957-ae5b13dd34ed	TM	TKM	795	Turkmenistan 	Turkmenistan	\N	console	2015-01-07 18:44:43
5f81ff1e-3f67-4e4f-8948-12b26da4579e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.	console	2015-01-07 18:44:43
2a5d19fe-e26c-48b5-94e6-ff8b292e2e51	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.	console	2015-01-07 18:44:43
44a76537-e51a-48f0-94ca-87eb936ba774	UG	UGA	800	Uganda 	Uganda	\N	console	2015-01-07 18:44:43
503bc723-1795-4e9d-af3f-6b732f2036af	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 	console	2015-01-07 18:44:43
cb73303b-3690-4854-ad67-025834bbd328	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N	console	2015-01-07 18:44:43
4d25dda8-6384-4bf7-8ec2-7ea9ac6118cb	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 	console	2015-01-07 18:44:43
111648bf-dc85-44ac-b90a-fbc1a9807023	US	USA	840	United States 	Združene države Amerike	\N	console	2015-01-07 18:44:43
336b85a8-0d76-440b-b632-369a1d7e7d53	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.	console	2015-01-07 18:44:43
08eec389-4d5d-4af9-88f2-8dfe7660f051	UY	URY	858	Uruguay 	Urugvaj	\N	console	2015-01-07 18:44:43
ea14eeb5-f2a8-49a2-829a-2ebff14419ee	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N	console	2015-01-07 18:44:43
0a9f5db9-3605-4158-86c1-dfdfb2c152b3	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).	console	2015-01-07 18:44:43
ef962771-98f1-4c32-9152-98786eb8769c	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N	console	2015-01-07 18:44:43
b326e04b-9688-4464-b470-d29a1ac7811a	VN	VNM	704	Viet Nam 	Vietnam	\N	console	2015-01-07 18:44:43
0cd7ee90-aa21-41e7-b771-0b5b1d4d4fd9	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.	console	2015-01-07 18:44:43
69c57cc4-e2ee-46d0-9347-3141140e7908	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N	console	2015-01-07 18:44:43
59a2f834-4f10-454f-b106-cdf242c695bc	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.	console	2015-01-07 18:44:43
2bf901df-fcf8-408d-bd9a-24ce4367df75	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).	console	2015-01-07 18:44:43
93d3fbd7-891e-4d52-b7e5-3a212b3f33a1	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.	console	2015-01-07 18:44:43
e6a121a5-44bf-4a67-85ea-9167f95f082d	ZM	ZMB	894	Zambia 	Zambija	\N	console	2015-01-07 18:44:43
888cdb93-0293-4568-99fd-81f95d9a1f37	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).	console	2015-01-07 18:44:43
\.


--
-- TOC entry 3819 (class 0 OID 825631)
-- Dependencies: 179
-- Data for Name: embalaza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY embalaza (id, pakiranje_id, maticna_id, etiketa_id, parent_id, opis, tip, imaserijsko, brezrazpisa, normativ, prefix, current, obmocjezacetek, obmocjekonec, tipgeneriranja, kolicina, upor, datknj) FROM stdin;
24560481-053b-4524-a560-48114dc52456	24560404-dd89-4524-a560-404ed2552456	6b2ebe89-5208-4170-af11-74f214a7e501	49be0613-5b14-4eda-9ec7-9c2087d300e0	\N	Paleta	1	f	t	1.000	P264	18	1	\N	PREFIX	60.000	admin	2015-01-26 20:06:15
24560958-77c0-4524-a560-958875952456	24560404-dd89-4524-a560-404ed2552456	1faa7822-2116-4d07-8f0d-6d5690d05e3e	760f3d91-f5d0-41d2-8b1c-cd6acd9abc6a	24560481-053b-4524-a560-48114dc52456	Karton	4	f	t	12.000	K264	207	1	\N	PREFIX	5.000	admin	2015-01-26 20:06:15
\.


--
-- TOC entry 3820 (class 0 OID 825636)
-- Dependencies: 180
-- Data for Name: etikete; Type: TABLE DATA; Schema: public; Owner: -
--

COPY etikete (id, tip, alias, naziv, kolon, vrst, style, template, classname, upor, datknj) FROM stdin;
c92bb3bf-02d6-4017-a87e-ca039da2be03	1	ETID	Identifikacijska etiketa pdf	3	6	body {\n   font-family: "Trebuchet MS", Helvetica, sans-serif;\n}\n.label {\n   padding-top: 35px;\n   padding-left: 45px;\n   padding-right: 5px;\n   padding-bottom: 5px;\n}\n.label > table {\n   margin-left: auto;\n   margin-right: auto;\n}\ntr.naziv {\n   font-size: 0.6em;\n}\ntr.naziv td {\n   padding-left: 15px;\n}\ntr.koda {\n   font-size: 0.6em;\n}\ntr.koda > td {\n   text-align: center;\n   font-weight: bold;\n}	<!BarcodeOpt barHeight 25!>\n<!BarcodeOpt drawText false!>\n<table>\n<tr><td colspan="2"><!Barcode code128 <?= $kos->getBarcode() ?>!></td></tr>\n<tr class="koda"><td>KODA</td><td><?= $kos->getBarcode() ?></td></tr>\n<tr class="naziv"><td colspan = "2"><?= $artikel->getSifra() ?></td></tr>\n<tr class="naziv"><td colspan="2"><?= $artikel->getNaziv() ?></td></tr>\n</table>	pdf	console	2015-01-07 18:44:43
64e999fc-3583-449a-8897-d94c5599c803	2	ETLOG	Logistična etiketa pdf	2	2	body {\n   font-family: "Trebuchet MS", Helvetica, sans-serif;\n}\n.label {\n   padding: 10px 10px 0px 10px;\n}\nh1 {\n   font-size: 0.8em;\n}\n.naslov td {\n   font-size: 0.6em;\n}\nh2 {\n   font-size: 0.6em;\n}\n.izdelki td, .izdelki th {\n   font-size: 0.6em;\n}\np.paket, p.datDob {\n   font-weight: bold;\n   font-size: 0.5em;\n   padding-left: 150px;\n   margin-top: 0px;\n   margin-bottom: 0px;\n}\n.line {\n   width: 85%;\n}\ntd.alignRight {\n   text-align: right;\n}	<h1>LP MYCRON</h1>\n<div class="line">\n<hr />\n</div>\n<table class="naslov">\n<tr><td><?= $dobava->getKlient()->getNaziv() ?></td></tr>\n<tr><td><?= $dobava->getKlient()->getTel() ?></td></tr>\n<tr><td><?= $dobava->getKlient()->getEmail() ?></td></tr>\n<tr><td><?= $dobava->getKlient()->getDrzava()->getNaziv() ?></td></tr>\n<tr><td>&nbsp;</td></tr>\n<tr><td><?= $dobava->getPrejemnik()->getNaziv() ?></td></tr>\n<tr><td><?= $dobava->getPrejemnik()->getNaziv1() ?></td></tr>\n<tr><td><?= $dobava->getNaslovDostave()->getUlica() ?> <?= $dobava->getNaslovDostave()->getHisnaStevilka() ?></td></tr>\n<tr><td><?= $dobava->getNaslovDostave()->getPosta() ?> <?= $dobava->getNaslovDostave()->getPostaNaziv() ?></td></tr>\n<tr><td><?= $dobava->getNaslovDostave()->getPokrajina() ?></td></tr>\n<tr><td><?= $dobava->getNaslovDostave()->getDrzava()->getNaziv() ?></td></tr>\n</table>\n<div class="line">\n<hr />\n</div>\n<h2>Dobava <?= $dobava->getStevilka() ?></h2>\n<table class="izdelki">\n<tr>\n<th>Paket</th>\n<th>Izdelek</th>\n<th>Kolicina</th>\n<th>Teža</th>\n<th>Datum pakiranja</th>\n</tr>\n<?php foreach ($dobava->getPaketi() as $pak) {\n   echo '<tr>';\n      echo '<td>' .  $pak->getBarcode() . '</td>';\n      echo '<td>' .  $pak->getEmbalaza()->getPakiranje()->getMaticna()->getSifra() . '</td>';\n      echo '<td class="alignRight">' .  intval($pak->getKolicina()) . '</td>';\n      echo '<td class="alignRight">' .  $pak->getTeza() . ' kg</td>';\n      echo '<td class="alignRight">' .  $pak->getCasPakiranja()->format('d.m.Y') . '</td>';\n   echo '</tr>';\n} ?>\n</table>\n<p class="paket">Paket <!StevPaketa>/<!MaxPaketov>\n<p class="datDob">Datum dobave: <?= $dobava->getDatIzdobave()->format('d. m. Y'); ?>	pdf	console	2015-01-07 18:44:43
760f3d91-f5d0-41d2-8b1c-cd6acd9abc6a	1	ETIDZ	Identifikacijska etiketa zebra	\N	\N	\N	^XA~TA020~JSN^LT0^MMT^MNW^MTD^POI^PMN^LH10,0^JMA^PR2,2^MD0^JUS^LRN^CI0^XZ\n^XA^DFIDENT^FS^LL0472\n^PW799\n^FT192,96^XG001.GRF,1,1^FS\n^FO9,11^GB765,87,1^FS\n^BY2,3,61^FT235,419^BCN,,N,N\n<?= '>:' . $kos->getBarcode() . 'ð' ?>\n^FO,18^FS\n^FT14,367^ACN,18,10^FH\\^FDBOXID:^FS\n^FO,18^FS\n^FT15,328^ACN,18,10^FH\\^FDPCS PER BOX:^FS\n^FO,18^FS\n^FT16,290^ACN,18,10^FH\\\n^FO,18^FS\n^FT15,251^ACN,18,10^FH\\^FDPART NAME:^FS\n^FO,18^FS\n^FT233,171^ACN,18,10^FH\\\n^FO,18^FS\n^FT233,150^ACN,18,10^FH\\\n^FO,18^FS\n^FT233,126^ACN,18,10^FH\\\n^FO,18^FS\n^FT15,213^ACN,18,10^FH\\^FDMANUFACTURER CODE:^FS\n^FO,18^FS\n^FT15,126^ACN,18,10^FH\\^FDMANUFACTURER:^FS\n^FO,18^FS\n^FT280,444^A0N,28,40^FH\\<?= $kos->getBarcode() ?>\n^FO,33^FS\n^FT235,328^A0N,28,40^FH\\<?= intval($pakiranje->getKolicina()) ?>\n^FO,33^FS\n^FT235,289^A0N,28,40^FH\\\n^FO,33^FS\n^FT235,251^A0N,28,40^FH\\<?= $artikel->getNaziv() ?>\n^FO,33^FS\n^FT235,214^A0N,28,40^FH\\<?= $artikel->getSifra() ?>\n^PQ1,0,1,Y^XZ\n^XA^ID000.GRF^FS^XZ	zebra	console	2015-01-07 18:44:43
925fc331-5e73-4627-bef0-41158ea3337b	2	ETLOGZ	Logistična etiketa zebra	\N	\N	\N	^XA~TA020~JSN^LT0^MMT^MNW^MTD^POI^PMN^LH10,0^JMA^PR2,2^MD0^JUS^LRN^CI0^XZ\n^XA^DFLOG1^FS^LL0472\n^PW799\n^FO9,11^GB765,87,1^FS\n^FO,33^FS\n^FT28,418^A0N,28,40^FH\\<?= $dobava->getNaslovDostave()->getDrzava()->getNaziv() ?>\n^FO,33^FS\n^FT28,372^A0N,28,40^FH\\<?= $dobava->getNaslovDostave()->getPosta() . ' ' . $dobava->getNaslovDostave()->getPostaNaziv() ?>\n^FO,33^FS\n^FT28,326^A0N,28,40^FH\\<?= $dobava->getNaslovDostave()->getUlica() . ' ' . $dobava->getNaslovDostave()->getHisnaStevilka() ?>\n^FO,34^FS\n^FT28,280^A0N,28,28^FH\\<?= $dobava->getPrejemnik()->getNaziv1() ?>\n^FO,42^FS\n^FT28,193^A0N,34,33^FH\\<?= $dobava->getPrejemnik()->getNaziv() ?>\n^FO,64^FS\n^FT279,73^A0N,51,50^FH\\^FDCUSTOMER^FS\n^PQ1,0,1,Y^XZ\n\n^XA^DFLOG2^FS^LL0472\n^PW799\n^FO9,11^GB765,87,1^FS\n^FO,18^FS\n^FT19,418^ACN,18,10^FH\\^FDSHIPPING DATE:^FS\n^FO,18^FS\n^FT19,380^ACN,18,10^FH\\^FDPCS PER BOX:^FS\n^FO,18^FS\n^FT19,342^ACN,18,10^FH\\^FDBOXES PER PALETTE:^FS\n^FO,18^FS\n^FT19,249^ACN,18,10^FH\\^FDPART NAME:^FS\n^FO,18^FS\n^FT19,211^ACN,18,10^FH\\^FDCust. order Nr.:^FS\n^FO,18^FS\n^FT19,168^ACN,18,10^FH\\^FDSUPPLIER NR.:^FS\n^FO,18^FS\n^FT634,36^ACN,18,10^FH\\^FDPALETTE NR.:^FS\n^FO,31^FS\n^FT652,74^A0N,28,40^FH\\<!StevPaketaOdMax>\n^FO,33^FS\n^FT236,418^A0N,28,40^FH\\<?= $dobava->getDatIzdobave()->format('d/m/y') ?>\n^FO,33^FS\n^FT236,379^A0N,28,40^FH\\<?= intval(($kos->getEmbalaza()->getChildren()->count()) ? $kos->getEmbalaza()->getChildren()[0]->getKolicina() : $kos->getEmbalaza()->getKolicina()) ?>\n^FO,33^FS\n^FT236,341^A0N,28,40^FH\\<?= ($kos->getEmbalaza()->getChildren()->count()) ? intval($kos->getEmbalaza()->getChildren()[0]->getNormativ()) : 1 ?>\n^FO,42^FS\n^FT236,257^A0N,34,33^FH\\<?= $pakiranje->getMaticna()->getNaziv() ?>\n^FO,33^FS\n^FT236,172^A0N,28,40^FH\\<?= $dobava->getKlient()->getIdddv() ?>\n^FO,42^FS\n^FT236,219^A0N,34,33^FH\\<?= $dobava->getPogodba() ?>\n^FO,64^FS\n^FT279,73^A0N,51,50^FH\\^FDLOGISTICS^FS\n^PQ1,0,1,Y^XZ	zebra	console	2015-01-07 18:44:43
49be0613-5b14-4eda-9ec7-9c2087d300e0	1	ETIDZK	Identifikacijska etiketa zebra za vmesne in končne embalaže	\N	\N	\N	^XA~TA020~JSN^LT0^MMT^MNW^MTD^POI^PMN^LH10,0^JMA^PR2,2^MD0^JUS^LRN^CI0^XZ\n^XA^DFIDENT^FS^LL0472\n^PW799\n^FT192,96^XG001.GRF,1,1^FS\n^FO9,11^GB765,87,1^FS\n^BY2,3,61^FT235,419^BCN,,N,N\n<?= '>:' . $kos->getBarcode() . 'ð' ?>\n^FO,18^FS\n^FT14,367^ACN,18,10^FH\\^FDBOXID:^FS\n^FO,18^FS\n^FT15,328^ACN,18,10^FH\\\n^FO,18^FS\n^FT16,290^ACN,18,10^FH\\\n^FO,18^FS\n^FT15,251^ACN,18,10^FH\\^FDPART NAME:^FS\n^FO,18^FS\n^FT233,171^ACN,18,10^FH\\\n^FO,18^FS\n^FT233,150^ACN,18,10^FH\\\n^FO,18^FS\n^FT233,126^ACN,18,10^FH\\\n^FO,18^FS\n^FT15,213^ACN,18,10^FH\\^FDMANUFACTURER CODE:^FS\n^FO,18^FS\n^FT15,126^ACN,18,10^FH\\^FDMANUFACTURER:^FS\n^FO,18^FS\n^FT280,444^A0N,28,40^FH\\<?= $kos->getBarcode() ?>\n^FO,33^FS\n^FT235,328^A0N,28,40^FH\\\n^FO,33^FS\n^FT235,289^A0N,28,40^FH\\\n^FO,33^FS\n^FT235,251^A0N,28,40^FH\\<?= $artikel->getNaziv() ?>\n^FO,33^FS\n^FT235,214^A0N,28,40^FH\\<?= $artikel->getSifra() ?>\n^PQ1,0,1,Y^XZ\n^XA^ID000.GRF^FS^XZ	zebra	console	2015-01-07 18:44:43
\.


--
-- TOC entry 3821 (class 0 OID 825644)
-- Dependencies: 181
-- Data for Name: group_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY group_user (group_id, user_id) FROM stdin;
5d37f8c4-0b78-471a-8da0-c2de3ae5859b	bedcb99b-3716-41b4-bb85-83637ca60c3c
\.


--
-- TOC entry 3822 (class 0 OID 825647)
-- Dependencies: 182
-- Data for Name: izbirneopcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY izbirneopcije (id, object, value, label, sort, flags, upor, datknj) FROM stdin;
3ae8d58e-eb83-48cf-85a7-11150ac0bc9e	artikel.tipm	M	Material	1		console	2015-01-07 18:44:43
668fe5d5-99ee-4998-9cc2-d1dfd51edafb	artikel.tipm	G	Gotovi Izdelek	2		console	2015-01-07 18:44:43
fa13d040-62b3-43c6-9264-0a797cd7fbec	artikel.tipm	P	Polizdelek	2		console	2015-01-07 18:44:43
96f5ab1f-88a5-406c-974f-e127d645831a	artikel.tipm	O	Orodje	3		console	2015-01-07 18:44:43
d9bdaf7a-0e86-4550-8ba0-4cfa1f6f16fe	artikel.tipm	D	Drobni inventar	4		console	2015-01-07 18:44:43
cce46af0-b27b-4636-bfe1-cdd7555e32c2	artikel.tipm	Z	Zaščitno sredstvo	5		console	2015-01-07 18:44:43
59db4899-1c01-4d68-b5cc-14d86e4aa517	artikel.tipm	1	Potrošni material - orodje	6		console	2015-01-07 18:44:43
5e0e2187-997d-480b-87a8-c18bd6582449	artikel.tipm	2	Rezervni del	7		console	2015-01-07 18:44:43
08df7783-ae8c-403f-b7cd-07d72beae9df	artikel.tipm	3	Osnovno sredstvo	8		console	2015-01-07 18:44:43
f18b69d7-6a6f-4204-b9fe-7bb8925060f1	artikel.tipm	4	Poslovni partner	9		console	2015-01-07 18:44:43
99330661-9b45-424c-8e53-f2fa0edf4829	artikel.status	Pi	Pilotna serija	1		console	2015-01-07 18:44:43
28a81489-b8d5-4023-ab37-e1daea2f4160	artikel.status	Pr	Prototipna serija	2		console	2015-01-07 18:44:43
8de43f87-2054-46c1-a6d5-6d2be68a9ad5	artikel.status	S1	Serijska proizvodnja 1	3		console	2015-01-07 18:44:43
64f15619-3531-449c-a611-d24949d25656	artikel.status	S2	Serijska proizvodnja 2	4		console	2015-01-07 18:44:43
6947ef49-85b6-4fc8-a167-14819f055ce1	artikel.status	S3	Serijska proizvodnja 3	5		console	2015-01-07 18:44:43
5266c6be-a3db-48c0-bc55-49169c646835	artikel.status	S4	Serijska proizvodnja 4	6		console	2015-01-07 18:44:43
6282387e-b10a-4fe2-8bf2-d2ab5c665438	artikel.status	S5	Serijska proizvodnja 5	7		console	2015-01-07 18:44:43
93f29192-abc9-4c26-825a-a7c11af5cb7c	artikel.status	S6	Serijska proizvodnja 6	8		console	2015-01-07 18:44:43
6fe7b7de-33fd-47ca-ba7c-eb8f6d32ca44	artikel.status	S7	Serijska proizvodnja 7	9		console	2015-01-07 18:44:43
befbcea2-ec77-4938-ad70-a9a9b173a8de	artikel.status	S8	Serijska proizvodnja 8	10		console	2015-01-07 18:44:43
93725944-9bb1-48c6-af77-674741eb4288	artikel.status	S9	Serijska proizvodnja 9	11		console	2015-01-07 18:44:43
5d92320b-6ddf-4a35-b540-efcc2c34bb6b	artikel.status	D1	Sprememba dokumentacije	12		console	2015-01-07 18:44:43
2b5a43ad-668d-489a-aa24-e4df90bb9f46	dobava.status	1	Planirano	1		console	2015-01-07 18:44:43
7fc9ebf2-1487-4201-8d61-1c42c7c25740	dobava.status	2	Fiksirano	2		console	2015-01-07 18:44:43
ee05252f-3e1f-4926-a44e-08aba917315c	dobava.status	3	V pakiranju	3		console	2015-01-07 18:44:43
302dc44d-9968-4b2b-9a47-4eab2efc5e7b	dobava.status	4	Pripravljeno	4		console	2015-01-07 18:44:43
619833ce-9d79-4167-b76d-3d68653c25fa	dobava.status	5	Z dobavnico	5		console	2015-01-07 18:44:43
dba8d1b0-a0cb-4d6c-a84f-d8e41ae1a67d	dobava.status	6	Izdobavljeno	6		console	2015-01-07 18:44:43
e2945a7c-7d70-4317-b7cf-01ffb508b654	lokacija.status	1	Aktivna	1		console	2015-01-07 18:44:43
f5ac6e4e-5731-466c-8979-0d271d92f6b7	lokacija.status	2	Neaktivna	2		console	2015-01-07 18:44:43
30f39cd5-f745-40a7-9018-03662de6b000	lokacija.status	3	Onemogočena	3		console	2015-01-07 18:44:43
757f01d3-88a0-43aa-af97-878aa2e18c33	lokacija.vrsta	1	Globalna lokacija	1		console	2015-01-07 18:44:43
e9393e81-3f33-4bef-8e9d-9b1adfecc423	lokacija.vrsta	2	Podlokacija	2		console	2015-01-07 18:44:43
be633981-1d85-4063-b1b3-12efb6bd9fdf	lokacija.vrsta	3	Končna lokacija	3		console	2015-01-07 18:44:43
7a9cae11-81f8-4894-975c-0cbe29f64af7	popa.tipkli	D	Dobavitelj	1		console	2015-01-07 18:44:43
89c30ccc-55d0-4953-85ce-a7360294c949	popa.tipkli	K	Kupec	2		console	2015-01-07 18:44:43
c4ced83d-b070-45ad-ad51-0e1f3ed55de8	popa.tipkli	E	Evidenčni partner	3		console	2015-01-07 18:44:43
ac8106a4-257b-40be-8f42-e6730576c860	popa.stakli	AK	Aktiven	1		console	2015-01-07 18:44:43
67a7802f-e684-4355-92dd-a127b09fb27d	popa.stakli	NA	Neaktiven	2		console	2015-01-07 18:44:43
270a15a3-a25b-4ef5-a853-ef986c85b92f	tehen.vrsta	N	Nerazporejeno	0		console	2015-01-07 18:44:43
f5c3eb95-15b9-40d3-8138-e46c726d6cc3	tehen.vrsta	lc	Linija Cleaner	1		console	2015-01-07 18:44:43
d541150f-fdea-4403-b364-b8c6b1204021	tehen.vrsta	str	Stružnice	2		console	2015-01-07 18:44:43
4ec786e2-0561-4491-b714-308221292bf2	tehen.vrsta	avt	Stružnice - avtomati	3		console	2015-01-07 18:44:43
fcd39037-eb0f-4088-b4d8-e06637b231e0	tehen.vrsta	oc	Obdelovalni centri	4		console	2015-01-07 18:44:43
66669d17-5c79-4b91-b020-99cba345206f	tehen.vrsta	ost	Ostalo	5		console	2015-01-07 18:44:43
68989798-8d6a-4d5e-a5ee-149b8def1dd8	tehen.vrsta	M	Montaža	6		console	2015-01-07 18:44:43
75bbb9fe-9532-4ab7-a92d-0999ab001c5d	tehen.vrsta	Z	Žage	7		console	2015-01-07 18:44:43
eef6b3f2-e00a-4e31-bb29-f86aa9159b8b	tehen.vrsta	D	Merilni	8		console	2015-01-07 18:44:43
23f1f3c5-790c-4d43-8893-5813df3c148d	pakiranjeprodukta.status	1	Privzeti	1		console	2015-01-07 18:44:43
dc751a4c-b102-4c77-a317-60af8e5135e1	pakiranjeprodukta.status	2	Aktiven	2		console	2015-01-07 18:44:43
5742f2dd-ad44-4212-94f1-a1bf14bfd572	pakiranjeprodukta.status	3	Neaktiven	3		console	2015-01-07 18:44:43
a58769af-05b1-49cf-863a-865c7a7ac831	tdok.kajdok	M	Materialni	1		console	2015-01-07 18:44:43
77b0f6f4-d318-4d57-bd41-b54b51601774	tdok.kajdok	D	Proizvodni (DN)	2		console	2015-01-07 18:44:43
0a139ff7-8d1c-4303-ac9f-32e77f6bc79b	tdok.kajdok	N	Naročanje	3		console	2015-01-07 18:44:43
eea89bd7-6163-46ba-b804-dc1b13006ace	tdok.kajdok	T	Tehnologija	4		console	2015-01-07 18:44:43
923282bb-f9f0-4f50-9f20-4646edd9c9cc	tdok.kajdok	O	Ostalo	4		console	2015-01-07 18:44:43
904c095e-f441-41e9-a9b2-220281dcd552	tdok.vrsta	N_PK	Ponudba kupcu	1	Naročila	console	2015-01-07 18:44:43
657e197d-ea42-4e71-aa67-bcc035ef5da4	tdok.vrsta	N_NK	Naročilo kupca	2	Naročila	console	2015-01-07 18:44:43
e931c02b-9355-4318-b0ca-84163adfe686	tdok.vrsta	N_PD	Povpraševanje dobavitelju	3	Naročila	console	2015-01-07 18:44:43
23fb57f7-d272-4219-a6b1-6ea31d66f0eb	tdok.vrsta	N_ND	Naročilo dobavitelju	4	Naročila	console	2015-01-07 18:44:43
4d521ee8-1fb0-4a02-9884-9901e7298038	tdok.vrsta	N_RE	Reklamacija	5	Naročila	console	2015-01-07 18:44:43
a97d355b-1a77-4e4f-badd-2c836a61a63e	tdok.vrsta	M_PVR	Prevrednotenje	6	Materialno	console	2015-01-07 18:44:43
5c8eca59-96f0-45d5-abb7-80f13c2cdb7b	tdok.vrsta	M_PVZ	Prevzemnica	7	Materialno	console	2015-01-07 18:44:43
7fc9385d-a495-4925-a0e7-a8fc9951d407	tdok.vrsta	M_PRD	Predajnica	8	Materialno	console	2015-01-07 18:44:43
af5314c0-8481-4569-bb15-37294b5e7d43	tdok.vrsta	M_IZD	Izdajnica	9	Materialno	console	2015-01-07 18:44:43
ee43efdb-a245-4a3d-a3fb-561e92bb4bfa	tdok.vrsta	M_DOB	Dobavnica	10	Materialno	console	2015-01-07 18:44:43
8de0c621-c9fc-4b1c-9ca0-d055f27620b2	tdok.vrsta	M_PMK	Medskladiščnica	11	Materialno	console	2015-01-07 18:44:43
7188f8ae-3df3-4436-82e5-7f10b7b4d056	tdok.vrsta	D_AR	DN za artikle	12	Delovni nalog	console	2015-01-07 18:44:43
b50ed1dd-ccef-43bc-925e-32cc4943384d	tdok.vrsta	D_SR	DN za osnovna sredstva	13	Delovni nalog	console	2015-01-07 18:44:43
ec6053a0-54fb-4469-a2e7-e0ec3a6c0195	tdok.vrsta	T_DL	Delovni list	14	Tehnologija	console	2015-01-07 18:44:43
cd089ea8-e287-4c39-ab59-e0da8445e945	tdok.vrsta	T_ID	Identifikacija	15	Tehnologija	console	2015-01-07 18:44:43
320910da-7778-4cb9-89c5-f53332346dc0	tdok.vrsta	T_ZM	Zahtevnica materiala	16	Tehnologija	console	2015-01-07 18:44:43
711feab2-7fe0-4dfc-b3f0-4a88a7a5d981	tdok.vrsta	T_ZG	Zahtevnica gotovih izdelkov	17	Tehnologija	console	2015-01-07 18:44:43
2a8f1bd3-0717-45cd-992a-f81c384cc0b2	tdok.vrsta	T_NM	Naročilnica materiala	18	Tehnologija	console	2015-01-07 18:44:43
e46ae8a8-4016-4158-88b3-36e774419fd6	tdok.vrsta	T_RS	Risba	19	Tehnologija	console	2015-01-07 18:44:43
5d8a8b2b-dd26-47eb-b0ae-1208944ac391	tdok.vrsta	T_NC	NC programi	20	Tehnologija	console	2015-01-07 18:44:43
3d3fe767-7cb8-401c-bfe6-279ed98d720f	tdok.vrsta	T_MP	Merilni protokol	21	Tehnologija	console	2015-01-07 18:44:43
d2782b52-fbd4-452b-a424-0d1a6c70ddd3	tdok.vrsta	T_DN	Delovno navodilo	22	Tehnologija	console	2015-01-07 18:44:43
c737512b-d051-4293-8872-f99f577e52b5	tdok.vrsta	T_NS	Nastavni listi	23	Tehnologija	console	2015-01-07 18:44:43
3ee1f792-3cda-4f21-bde5-cf5296a3d84a	tdok.imageSize	none	Brez	1		console	2015-01-07 18:44:43
a065aad4-7e74-4a2c-a578-ad4d5dd594c5	tdok.imageSize	small	Majhen	2		console	2015-01-07 18:44:43
030247b2-ecc2-4848-a1e5-ba0116643af5	tdok.imageSize	big	Veliki	3		console	2015-01-07 18:44:43
15b38be0-3c13-4433-80fa-4206158287c0	tdok.pageSize	A4 Portrait	A4 Pokončno	1		console	2015-01-07 18:44:43
11080eea-d949-4af6-946c-c1f016e9e8f3	tdok.pageSize	A4 Landscape	A4 Ležeče	2		console	2015-01-07 18:44:43
7054ba4a-1632-4b69-b6b9-b38dc7d65792	tdok.pageSize	A5 Landscape	A5 ležeče	3		console	2015-01-07 18:44:43
da2848fd-7222-4f29-ae01-3a72906ac7d0	tdok.pageSize	A5 Portrait	A5 Pokončno	4		console	2015-01-07 18:44:43
def990e2-786a-4150-a061-cc738c39dbe1	zaloge.vrsta	AK0	Aktivni po planu	1		console	2015-01-07 18:44:43
d89b1e64-2a79-46f0-83f2-5b207de946c5	zaloge.vrsta	AK1	Aktivni po prometu	2		console	2015-01-07 18:44:43
86fb8d4c-2c01-4520-a493-ca626bc52f14	zaloge.vrsta	N	Neaktivni	2		console	2015-01-07 18:44:43
70fbb137-66e3-4a9d-af8d-17b9e96b2d09	zaloge.vrsta	Z	Zaloga brez gibanja	3		console	2015-01-07 18:44:43
e2bd24e6-df6b-4c6b-80a9-8f0aacdf5288	sklop.vrsta	1SVO	Sklop vpenjalnega orodja	1		console	2015-01-07 18:44:43
3975e15e-8fc9-4765-a059-60c0b9ce0574	sklop.vrsta	2SOO	Sklop obdelovalnega orodja	2		console	2015-01-07 18:44:43
10a6a590-d0da-4e98-a426-59d0797051a5	sklop.vrsta	3SMO	Sklop merilnega orodja	3		console	2015-01-07 18:44:43
24120ea2-31a0-4f88-a124-742e5654d660	sklop.vrsta	4SAD	Sklop adapterjev držal	4		console	2015-01-07 18:44:43
5e088183-bccf-4bbd-ac5e-0bab20922fa7	embalaza.tip	1	Končno pakiranje	1		console	2015-01-07 18:44:43
ce1ba58c-7b20-4812-8810-f72e7bb1f368	embalaza.tip	2	Vmesno pakiranje	2		console	2015-01-07 18:44:43
33496a4b-b2a8-4e73-946c-10bfd6458be1	embalaza.tip	3	Pomožni material	3		console	2015-01-07 18:44:43
21082449-2118-47fb-aea9-3530d9fb9ff1	embalaza.tip	4	Osnovno pakiranje	4		console	2015-01-07 18:44:43
033c6e8d-a6fb-4861-9bc3-c2d2e72fe179	dn.tip	1	Nalog za proizvodnjo	1		console	2015-01-07 18:44:43
17b9a5d6-5213-446f-8379-f8a45bd6cfaf	dn.tip	2	Nalog za izd. O.S.	2		console	2015-01-07 18:44:43
e9a95b9e-d7db-48da-8142-6a09a8ab2619	dn.status	000	Odprt	1		console	2015-01-07 18:44:43
c9c9ea37-cb1f-4425-8ab4-a76b9b2ab907	dn.status	100	Razpisan	2		console	2015-01-07 18:44:43
1aeff103-9518-4150-b48f-6e4e9a83996c	dn.status	200	Planiran	3		console	2015-01-07 18:44:43
e77936f7-7bd0-4d97-bca1-cb13b9087064	dn.status	300	V delu	4		console	2015-01-07 18:44:43
4fc223bc-5541-4244-bdd4-1cfbf2bcd4ba	dn.status	900	Zaprt	4		console	2015-01-07 18:44:43
8469ac64-f4bf-431c-bb4a-8a7f267a2814	embalaza.tipgeneriranja	NONE	Brez samodejnega generiranja	1		console	2015-01-07 18:44:43
be977fe4-6a42-4847-bc8c-c1fc0f5b643d	embalaza.tipgeneriranja	PREFIX	Na osnovi predpone	2		console	2015-01-07 18:44:43
d3e7b833-1945-4957-8716-2f19a6b3adab	embalaza.tipgeneriranja	RANGE	Iz območja	4		console	2015-01-07 18:44:43
a3751bae-d371-494d-98ad-3f57ca9d2165	embalaza.tipgeneriranja	GLOBAL	Globalni števec	3		console	2015-01-07 18:44:43
d3e24bfb-ae4a-43dd-8fca-54316b9c457b	etiketa.tip	1	Identifikacjska	1		console	2015-01-07 18:44:43
13c76956-2cf3-4d07-b9c6-879d300c30e6	etiketa.tip	2	Logistična	2		console	2015-01-07 18:44:43
482e0ac1-bf81-4ceb-a3b2-8fb4b62e1705	stevilcenje.reset	1	Letno	1		console	2015-01-07 18:44:43
e885cae5-d252-4d0d-940c-e1e66213d099	stevilcenje.reset	2	Se nadaljuje	2		console	2015-01-07 18:44:43
a70da9b5-f7f9-4a60-9f68-99305d84d741	etiketa.classname	zebra	zebra	1		console	2015-01-07 18:44:43
493c3e7f-e10f-4c6d-86da-bfc5dede3e03	etiketa.classname	pdf	pdf	2		console	2015-01-07 18:44:43
bd5d5d77-9a86-408e-aaae-cbc448e62d68	paketproduktov.status	1	Razpisan	1		console	2015-01-07 18:44:43
de383fa9-5753-48aa-8e86-f1ccd3b95650	paketproduktov.status	2	Izpisane etikete	2		console	2015-01-07 18:44:43
9dfe449f-9ec1-434e-a3ef-693fc51d98c4	paketproduktov.status	3	Pakirano/ni na skladišču	3		console	2015-01-07 18:44:43
5ed1e83e-c454-41f6-b8c7-fbe307ab1939	paketproduktov.status	4	V skladišču	4		console	2015-01-07 18:44:43
7852d52c-f62f-4d43-ae2a-071a4a62aaec	paketproduktov.status	5	V procesu dobave	5		console	2015-01-07 18:44:43
9c93eb59-2a30-45e1-96ed-bcde03ba98ef	paketproduktov.status	6	Dobavljen	6		console	2015-01-07 18:44:43
aafce995-a1e8-4da4-8aad-01bff538aee6	delovneure.status	K	Končano	1	\N	console	2015-01-07 18:44:43
4a33372a-0138-42d3-906b-0b73370e2283	delovneure.status	N	Serija	2	\N	console	2015-01-07 18:44:43
2b2173eb-69cc-444b-963a-5cfff17895d7	delovneure.status	P	V pakiranju	2	\N	console	2015-01-07 18:44:43
9e6bd7f1-086a-450b-aee8-a64f625bd6e0	tiskalnik.tip	1	datoteka	1	\N	console	2015-01-07 18:44:43
88aa662c-21e3-4d71-b1e5-6ca82f897c0b	tiskalnik.tip	2	CUPS	2	\N	console	2015-01-07 18:44:43
460e28b7-a9aa-4db1-93fe-3ff5c010c579	tiskalnik.razred	GEN	Generični tiskalnik	1	\N	console	2015-01-07 18:44:43
02a0955e-4f2f-4eee-8c22-12c58e29e83d	tiskalnik.razred	ZEB	Tiskalnik za nalepke	2	\N	console	2015-01-07 18:44:43
07ff6313-21d3-43a4-b900-b0a799bdd786	statusNar.tip	N_PK	ponudba kupcu	1	\N	console	2015-01-07 18:44:43
ad915dd4-c3bf-4a9d-a0cf-db7ad1b52317	statusNar.tip	N_NK	naročilo kupca	2	\N	console	2015-01-07 18:44:43
37881f4c-324e-4792-837a-2d45bf948cfe	statusNar.tip	N_PD	povpraševanje dobavitelju	3	\N	console	2015-01-07 18:44:43
cef439ff-3d6f-4918-bda1-c076b56beb34	statusNar.tip	N_ND	naročilo dobavitelju	4	\N	console	2015-01-07 18:44:43
c54fdb03-51fb-476d-8fae-5fe39114b2a1	statusNar.tip	N_RE	reklamacija	4	\N	console	2015-01-07 18:44:43
19629e67-5da7-4997-8a0f-722978297fe8	tehen.status	000	Neaktiven	1		console	2015-01-07 18:44:43
9735c3d7-f6d8-4139-af60-70d1a9a11349	tehen.status	100	Čakanje na nastavitev	2		console	2015-01-07 18:44:43
2ccdf492-4239-4777-880e-5b6542e5bcf3	tehen.status	200	Nastavitev	3		console	2015-01-07 18:44:43
9a35d5b5-6e46-498d-b584-d34d1dc2f233	tehen.status	300	Čakanje na delo	4		console	2015-01-07 18:44:43
212f6af4-968d-4b15-b5b8-836dca70d464	tehen.status	400	Delo	5		console	2015-01-07 18:44:43
d7cecf77-e881-488e-a832-64ed1b9c3589	tehen.status	500	zastoj	6		console	2015-01-07 18:44:43
e94f0764-34a4-4ba6-910a-577e4c18ad15	tehen.status	600	Alarm	7		console	2015-01-07 18:44:43
afae3a4b-d0d6-4f2d-958a-e087068fbea5	tehen.status	700	V okvari	8		console	2015-01-07 18:44:43
e9ba39e1-806a-43f6-9699-9c4a5ac50a61	ponudba.status	100	Ponudba odprta	1		console	2015-01-07 18:44:43
88be00dc-bbc8-405f-96fb-1954f86f1d62	ponudba.status	200	Prejeto naročilo	2		console	2015-01-07 18:44:43
e882d619-a3c7-4274-b14e-59c8a382fd05	ponudba.status	900	Zaprto brez naročila	3		console	2015-01-07 18:44:43
a2431aa5-11ca-4ad0-8d16-2ffeff7d1965	ponudba.status	910	Nezmožnost izdelave	4		console	2015-01-07 18:44:43
481eae15-ffa3-4db5-a018-f6c7863aaa1c	ponudba.status	920	Ne nudimo	5		console	2015-01-07 18:44:43
289c35b0-842c-44e9-b30c-929f5ef8df84	ponudba.statusprodukta	100	Brez posebnosti	1		console	2015-01-07 18:44:43
08ae1ccf-fdf6-4e99-a5ca-6c27e11e30ad	ponudba.statusprodukta	200	Pogodbeni produkti	2		console	2015-01-07 18:44:43
cc384f83-1a46-42a8-910d-43e0eff355e9	ponudba.statusprodukta	300	Optimirani produkti	3		console	2015-01-07 18:44:43
f75bda4f-106b-4f16-9468-877762289d2d	ponudba.statusprodukta	400	Vzorčni produkti	4		console	2015-01-07 18:44:43
c1935ae9-646e-42fd-9c77-75e6bcf6d29b	poslovniplan.tipObdobja	y	Leto	1		console	2015-01-07 18:44:43
c9f34a51-a1c1-49ba-ae18-fd5fa484c89a	poslovniplan.tipObdobja	m	Mesec	3		console	2015-01-07 18:44:43
6033065b-4dcf-4987-92ad-9c45460991bb	poslovniplan.tipObdobja	w	Teden	4		console	2015-01-07 18:44:43
19f3cc93-2ed1-4803-834e-523a29e69226	poslovniplan.status	1	V pripravi	1		console	2015-01-07 18:44:43
6f7294ae-2da5-4c45-b6c4-61bf1bd7b625	poslovniplan.status	2	Plan fiksiran	2		console	2015-01-07 18:44:43
e1f6094f-da12-4e9c-a018-95949c947d06	poslovniplan.status	9	Arhiviran	3		console	2015-01-07 18:44:43
83c49eb5-4390-425f-ae78-0c934e03d076	poslovniplan.statusPro	FX	0 Fiksna naročila	1		console	2015-01-07 18:44:43
cfeb171f-b18d-4bc7-b4af-63f84d4a92f7	poslovniplan.statusPro	DS	1 Delivery Schedule	2		console	2015-01-07 18:44:43
4d75225d-5376-4eaf-9c36-e75b088caf46	poslovniplan.statusPro	SP	2 Posamezno naročilo-pogodba	3		console	2015-01-07 18:44:43
32a19579-42e5-46a2-8fa8-acb787975e01	poslovniplan.statusPro	SO	3 Posamezno naročilo	4		console	2015-01-07 18:44:43
fc9c728b-4f53-45c7-bc10-5ec94b02a950	poslovniplan.statusPro	BP	4 Balansiranje	5		console	2015-01-07 18:44:43
552fb6ae-901b-47c9-b88d-cc704e32e40e	poslovniplan.statusPro	SV	5 Špule / valji	6		console	2015-01-07 18:44:43
11c1b128-9ccf-4926-904a-c55a07f2f089	poslovniplan.statusPro	OP	6 Odprta ponudba	7		console	2015-01-07 18:44:43
376f22c1-b3e8-4e44-a65f-0db6ca524b3b	poslovniplan.statusPro	R1	7 Razvojni fiksni 	8		console	2015-01-07 18:44:43
e032aeb6-5538-4eb8-acbe-5904566ae3b0	poslovniplan.statusPro	R2	8 Razvojni brez termina	9		console	2015-01-07 18:44:43
a00b0118-7dd2-4443-8c96-960238b5c88a	poslovniplan.statusPro	R3	9 Razvojni plan	10		console	2015-01-07 18:44:43
fdb9bf8a-a2fc-4a3a-8c66-69c99c255d7e	poslovniplan.statusPro	00	Brez	11		console	2015-01-07 18:44:43
b55ae906-441f-40a8-91da-8667850294c9	cenik.status	100	Aktivna	1		console	2015-01-07 18:44:43
85936ea2-4e64-4293-9442-9189651ab77e	cenik.status	101	Alter	2		console	2015-01-07 18:44:43
e3aac655-b463-412e-bd15-9b5c01d928af	cenik.status	102	Alter 2	3		console	2015-01-07 18:44:43
5c59809f-fd32-4c28-96eb-ae31e46d8768	cenik.status	103	Pomožna	4		console	2015-01-07 18:44:43
95f9a47a-3b44-495e-8863-e2f2dfae2fa9	cenik.status	200	Neaktivna	5		console	2015-01-07 18:44:43
f02c593f-28a7-49f9-96a5-745d2fc127d1	razpis.statusOperacije	100	Razpisano	1		console	2015-01-07 18:44:43
552e80b7-8052-4b6b-b8a9-ff9cb08989a7	razpis.statusOperacije	200	Planirano	2		console	2015-01-07 18:44:43
8dca64a6-4a41-464f-84b4-7b46ee784395	razpis.statusOperacije	300	V delu	3		console	2015-01-07 18:44:43
8f95c85e-821b-4b00-94ae-0091bc621b3d	razpis.statusOperacije	400	Čakanje	4		console	2015-01-07 18:44:43
52554a27-f22c-4e87-84f6-a6117acea3d5	razpis.statusOperacije	900	Končana	5		console	2015-01-07 18:44:43
2162d390-80d7-4181-bf00-f592d6935eac	izvedba.statusIzvedbe	100	Brez	1		console	2015-01-07 18:44:43
e1f02691-1087-46c4-9a8f-0ed552d26a17	izvedba.statusIzvedbe	200	Čakanje na nastavitev	2		console	2015-01-07 18:44:43
f9606ccf-b6dd-4436-b094-c83aef51af4f	izvedba.statusIzvedbe	300	Nastavitev	3		console	2015-01-07 18:44:43
694e315f-28ab-4521-bd03-887dc84072fe	izvedba.statusIzvedbe	400	Čakanje na delo	4		console	2015-01-07 18:44:43
fbdb8a69-ad96-4c10-8aca-b3327b960b1e	izvedba.statusIzvedbe	500	Delo	5		console	2015-01-07 18:44:43
13951666-fe07-4ffc-bd72-218972385fad	izvedba.statusIzvedbe	600	Popravilo	6		console	2015-01-07 18:44:43
68449291-e733-4cd5-8587-556c6c8186d3	izvedba.statusIzvedbe	700	Čakanje/Zastoj	7		console	2015-01-07 18:44:43
534b13f0-3a55-40f7-91b0-52de9f1b279f	izvedba.statusIzvedbe	910	Zaključena/Prekinjena	8		console	2015-01-07 18:44:43
b37a0e70-7d26-4c42-ad7e-66647fcd1dac	izvedba.statusIzvedbe	900	Zaključena	9		console	2015-01-07 18:44:43
cd92c989-2e7d-4d62-b74b-bf60b7181a7d	izvedba.statusPlana	100	Brez	1		console	2015-01-07 18:44:43
fe188d4f-f53f-432b-8cff-0a1534f551f4	izvedba.statusPlana	200	Okvirno	2		console	2015-01-07 18:44:43
663d4768-c3a1-40aa-b4ac-e9b4bc779fa0	izvedba.statusPlana	300	Fiksirano	3		console	2015-01-07 18:44:43
aaeb4cee-c6ac-4fc7-893d-67aa447ee69a	izvedba.statusPlana	900	Končana	4		console	2015-01-07 18:44:43
d6ab978b-07b8-4def-a921-f3bde165e6f9	izvedba.statusQa	100	brez	1		console	2015-01-07 18:44:43
9adbd033-9728-406a-8e10-8705a642cc8c	izvedba.statusQa	200	Se izvaja	2		console	2015-01-07 18:44:43
2ef488e3-5a1f-4a2b-8461-14e110b29a09	izvedba.statusQa	800	Ni ok	5		console	2015-01-07 18:44:43
164f1e80-12c3-464b-84af-8118df19c008	izvedba.statusQa	900	OK	6		console	2015-01-07 18:44:43
44672590-3919-4b27-ad94-cf338495ec58	izmet.vrsta	DEL	Delavčev	1		console	2015-01-07 18:44:43
0002ec46-552b-4a70-bc54-97be6b5fbcc5	izmet.vrsta	OBD	Obdelovalni	2		console	2015-01-07 18:44:43
b56c1f86-8b93-4bda-aced-2a306ea97477	izmet.vrsta	MAT	Materialni	3		console	2015-01-07 18:44:43
1320ebbd-1ace-48ea-8d40-0fb64032459e	izmet.vrsta	VZR	Vzorčni	4		console	2015-01-07 18:44:43
84dbee6c-633d-44e3-8057-2256970e9e13	izmet.vrsta	MAN	Manjko	5		console	2015-01-07 18:44:43
fb3f82b9-dbdd-4cd0-85be-cf61d3d70069	izmet.vrsta	NST	Nastavitev	6		console	2015-01-07 18:44:43
66b7f506-b026-4892-919d-9b045925eb80	izmet.vrsta	REK	Reklamacija	7		console	2015-01-07 18:44:43
b0eafbdc-e8ec-4c2c-9ce5-f3cf538673f5	checklist.tip	PRE	Prevzemnice	1		console	2015-01-07 18:44:43
0a8f756c-181f-4640-a172-b894ea85fed1	checklist.tip	PRO	Proizvodnja	2		console	2015-01-07 18:44:43
7310411d-bcf4-46a9-a125-128d484c1efc	checklist.element	CHK	Checkbox	1		console	2015-01-07 18:44:43
fd6b563e-5c6f-4a26-8e72-0263a2ee0933	checklist.element	NUM	Število	2		console	2015-01-07 18:44:43
00e9eb30-91b5-4502-aafe-34f8be6b5b24	checklist.element	TXT	Tekst	3		console	2015-01-07 18:44:43
e95459c1-aa94-4f31-b95c-85be7ce3c2cd	checklist.element	DAT	Datum	4		console	2015-01-07 18:44:43
1a8237ab-35eb-4a7a-be6c-24f6227c95f6	checklist.element	ANM	Polje števil	5		console	2015-01-07 18:44:43
5240f764-dac5-45d1-a48f-06dcd51f25d6	izvedba.statusQa	900	OK	6		console	2015-01-26 08:09:35
503cdad0-26b5-46f4-a9d0-d7d6566f815a	skl.metodaObracuna	fifo	Fifo	1		console	2015-02-13 12:02:48
ce1125ed-3b87-47e2-9b69-feacc8463235	skl.metodaObracuna	dejansko	Po dejanski ceni	2		console	2015-02-13 12:02:48
abe92b08-3514-42e9-82d1-9c816c25c8fa	skl.metodaCrpanja	fifo	Fifo	1		console	2015-02-13 12:02:48
ad7a3391-b7eb-48e9-8b4d-806e95b5fc0f	skl.metodaCrpanja	manual	Ročno	2		console	2015-02-13 12:02:48
0f340b7b-7217-4c76-bdb6-9a31bbba638f	skladiscenje.statusZaloge	A	Na zalogi	1		console	2015-02-13 12:02:48
bce6bbcf-db8c-49bf-82d1-5481674be17c	skladiscenje.statusZaloge	Z	Počrpano	2		console	2015-02-13 12:02:48
f3e004f9-478f-443b-a107-65dda9222e19	skladiscenje.statusIzdaje	100	Brez	1		console	2015-02-13 12:02:48
064ced81-13f8-4b1c-a75d-1433779358e5	skladiscenje.statusIzdaje	200	Okvirno	2		console	2015-02-13 12:02:48
dd78b67e-6e0e-49f4-9646-35a67ce325c9	skladiscenje.statusIzdaje	300	Fiksirano	3		console	2015-02-13 12:02:48
cccee4b7-68b6-40f9-ac71-ec724b6eacba	skladiscenje.statusIzdaje	900	Končana	4		console	2015-02-13 12:02:48
80704c2d-53a6-4fbd-8600-713eb649ee7c	dokument.jezik	sl_SI	Slovenski	1		console	2015-02-25 14:55:21
26be1ff5-5272-451c-8cdd-a54a256f5263	dokument.jezik	en_US	Angleški	2		console	2015-02-25 14:55:21
cea2c22d-f8a7-472d-bce4-5f3af8def31b	dokument.jezik	de_DE	Nemški	3		console	2015-02-25 14:55:21
4864449e-43cc-409c-a0b5-e30536d37b73	tdok.vrsta	T_KK	Kosovnica	23	Tehnologija	console	2015-03-08 13:24:02
d72f5e58-ecc5-43c7-87ff-cc60e0c9f481	razpis.statusIzdaje	100	Čaka	1		console	2015-03-08 13:24:02
967a75b2-8267-47cb-95e0-47d63ef4e1fb	razpis.statusIzdaje	200	Čaka izdajo	2		console	2015-03-08 13:24:02
11d92550-3647-4e91-b4f7-6a2aea766b12	razpis.statusIzdaje	300	Delno izdano	3		console	2015-03-08 13:24:02
4e72d4da-04c8-48ef-bee5-23b92db5a83a	razpis.statusIzdaje	900	Izdano	5		console	2015-03-08 13:24:02
015b63fc-15d9-4210-9489-6eb2d910e7f5	razpis.statusNarocila	100	Čaka	1		console	2015-03-08 13:24:02
df4f3242-82ae-403b-af6d-4cd2c509f450	razpis.statusNarocila	200	Naročeno	2		console	2015-03-08 13:24:02
e458b1d3-2ca3-40d6-9354-1d9e3f57fe8a	razpis.statusNarocila	900	Dobavljeno	5		console	2015-03-08 13:24:02
54f6bb88-699b-4262-986b-d49057035ee8	narocilodob.status	000	Naročilo vnešeno	1		console	2015-03-08 13:24:02
f600e73b-ad8d-4332-951c-8101db3e0983	narocilodob.status	100	Ni potrditve	2		console	2015-03-08 13:24:02
396bff76-68cb-4440-b9bc-2f4022b9f290	narocilodob.status	110	Neposlano	9		console	2015-03-08 13:24:02
45858a1e-9ddf-4482-a96a-b9a7572fa705	narocilodob.status	200	Potrjeno	3		console	2015-03-08 13:24:02
3f6b78a8-5ffb-4197-a098-5fff1d77daaa	narocilodob.status	210	Zaloga pri dobavitelju	7		console	2015-03-08 13:24:02
221a6a64-3882-4388-a0b8-467f14b81b95	narocilodob.status	220	Delno izdobavljeno	4		console	2015-03-08 13:24:02
ff9b3265-616b-41e2-95ef-8683bce7d983	narocilodob.status	230	Količinski prevzem	8		console	2015-03-08 13:24:02
4e3d2004-04fc-43e3-96e9-08f0223d82cb	narocilodob.status	300	Zaprto	5		console	2015-03-08 13:24:02
bb7309f7-1857-4ef7-9661-3f5149973e4c	narocilodob.status	400	Storno	6		console	2015-03-08 13:24:02
529f5c2a-691e-4850-aac7-289c83ac248f	narocilokup.status	200	Ni Potrditve	1		console	2015-03-08 13:24:02
8c5e0245-df80-4830-aec5-0af33ce7684c	narocilokup.status	201	1. Potrditev	2		console	2015-03-08 13:24:02
61cfcfe3-e45f-4ee9-9bbb-0320385cf23c	narocilokup.status	202	2. Potrditev	9		console	2015-03-08 13:24:02
b221acbe-dcd3-41b7-bc97-94814f909c5f	narocilokup.status	203	Delno izdobavljeno	3		console	2015-03-08 13:24:02
4fe08699-64f0-42c6-9607-3cdd4b13453d	narocilokup.status	204	Zaprto	7		console	2015-03-08 13:24:02
17faaef4-84cd-49f3-9a61-afd754975c75	narocilokup.statusPredaje	205	DN Delno Predan	4		console	2015-03-08 13:24:02
21b4f246-f273-4048-a67b-49a5d6e1c13d	narocilokup.statusPredaje	206	DN Predan	8		console	2015-03-08 13:24:02
3878adf4-76e8-45a4-a709-e2c7d580f754	tdok.vrsta	O_PR	Priponka	25	Ostalo	console	2015-03-08 13:24:02
279d5247-cd98-4aee-b025-409cf0c9ddef	tdok.vrsta	O_GS	Globalni števec črnih kod	26	Ostalo	console	2015-03-08 13:24:02
\.


--
-- TOC entry 3823 (class 0 OID 825653)
-- Dependencies: 183
-- Data for Name: izmetpodrobno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY izmetpodrobno (id, vrstaizmeta, kolicina, vrednostmateriala, vrednostdela, upor, datknj, izvedbapodrobno_id) FROM stdin;
abcdab54-73cd-3c98-2fa5-473cd3c9928a	NST	2.00	0.00	0.00	JOZEF	2014-11-24 06:54:00	ac55482e-b89e-45cd-bb80-44acfe5b436f
abcdab54-7c06-b33f-dcb5-47c06b340dcb	OBD	1.00	0.00	0.00	JOZEF	2014-11-28 06:42:00	72087d21-0da5-4a48-9ad7-ec2efe65908c
abcdab54-8836-eebf-3235-48836eec02c1	VZR	1.00	0.00	0.00	JOZEF	2014-12-10 11:18:00	f4d11ac2-dc36-4a09-b623-0fa4717d1c63
\.


--
-- TOC entry 3824 (class 0 OID 825658)
-- Dependencies: 184
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
e7554d43-34e7-4cdf-8cf7-4f7b08b5f122	fb27d1e8-54a3-4644-95fd-bdf0a2f1d750	Posodobi user cache	Aaa\\Task\\UpdateUserCacheTask	2	Posodabjam uporabnikaconsole\nPosodabjam uporabnikaAdministrator\nPosodabljam permission Aaa-User-delete\nPosodabljam permission Aaa-User-read\nPosodabljam permission Aaa-User-update\nPosodabljam permission Aaa-User-create\nPosodabljam permission Aaa-User-lookup\nPosodabljam permission Aaa-Role-delete\nPosodabljam permission Aaa-Role-read\nPosodabljam permission Aaa-Role-update\nPosodabljam permission Aaa-Role-create\nPosodabljam permission Aaa-Role-lookup\nPosodabljam permission Aaa-Permission-delete\nPosodabljam permission Aaa-Permission-read\nPosodabljam permission Aaa-Permission-update\nPosodabljam permission Aaa-Permission-create\nPosodabljam permission Aaa-Permission-lookup\nPosodabljam permission Aaa-Group-delete\nPosodabljam permission Aaa-Group-read\nPosodabljam permission Aaa-Group-update\nPosodabljam permission Aaa-Group-create\nPosodabljam permission Aaa-Group-lookup\nPosodabljam permission Aaa-Revizija-delete\nPosodabljam permission Aaa-Revizija-read\nPosodabljam permission Aaa-Revizija-update\nPosodabljam permission Aaa-Revizija-create\nPosodabljam permission Aaa-Revizija-lookup\nPosodabljam permission Sifra-delete\nPosodabljam permission Sifra-read\nPosodabljam permission Sifra-update\nPosodabljam permission Sifra-create\nPosodabljam permission Sifra-lookup\nPosodabljam permission Artikel-delete\nPosodabljam permission Artikel-read\nPosodabljam permission Artikel-update\nPosodabljam permission Artikel-create\nPosodabljam permission Artikel-lookup\nPosodabljam permission Checklist-ChecklistVzorec-delete\nPosodabljam permission Checklist-ChecklistVzorec-read\nPosodabljam permission Checklist-ChecklistVzorec-update\nPosodabljam permission Checklist-ChecklistVzorec-create\nPosodabljam permission Checklist-ChecklistVzorec-lookup\nPosodabljam permission Checklist-ChecklistVzorecPostavka-delete\nPosodabljam permission Checklist-ChecklistVzorecPostavka-read\nPosodabljam permission Checklist-ChecklistVzorecPostavka-update\nPosodabljam permission Checklist-ChecklistVzorecPostavka-create\nPosodabljam permission Checklist-ChecklistVzorecPostavka-lookup\nPosodabljam permission Delavec-delete\nPosodabljam permission Delavec-read\nPosodabljam permission Delavec-update\nPosodabljam permission Delavec-create\nPosodabljam permission Delavec-lookup\nPosodabljam permission Drzava-delete\nPosodabljam permission Drzava-read\nPosodabljam permission Drzava-update\nPosodabljam permission Drzava-create\nPosodabljam permission Drzava-lookup\nPosodabljam permission IzbirnaOpcija-delete\nPosodabljam permission IzbirnaOpcija-read\nPosodabljam permission IzbirnaOpcija-update\nPosodabljam permission IzbirnaOpcija-create\nPosodabljam permission IzbirnaOpcija-lookup\nPosodabljam permission Job-Job-delete\nPosodabljam permission Job-Job-read\nPosodabljam permission Job-Job-update\nPosodabljam permission Job-Job-create\nPosodabljam permission Job-Job-lookup\nPosodabljam permission Klasifikacija-delete\nPosodabljam permission Klasifikacija-read\nPosodabljam permission Klasifikacija-update\nPosodabljam permission Klasifikacija-create\nPosodabljam permission Klasifikacija-lookup\nPosodabljam permission Kontaktna-delete\nPosodabljam permission Kontaktna-read\nPosodabljam permission Kontaktna-update\nPosodabljam permission Kontaktna-create\nPosodabljam permission Kontaktna-lookup\nPosodabljam permission Kontekst-delete\nPosodabljam permission Kontekst-read\nPosodabljam permission Kontekst-update\nPosodabljam permission Kontekst-create\nPosodabljam permission Kontekst-lookup\nPosodabljam permission Nastavitev-delete\nPosodabljam permission Nastavitev-read\nPosodabljam permission Nastavitev-update\nPosodabljam permission Nastavitev-create\nPosodabljam permission Nastavitev-lookup\nPosodabljam permission Operacija-delete\nPosodabljam permission Operacija-read\nPosodabljam permission Operacija-update\nPosodabljam permission Operacija-create\nPosodabljam permission Operacija-lookup\nPosodabljam permission Popa-delete\nPosodabljam permission Popa-read\nPosodabljam permission Popa-update\nPosodabljam permission Popa-create\nPosodabljam permission Popa-lookup\nPosodabljam permission Posta-delete\nPosodabljam permission Posta-read\nPosodabljam permission Posta-update\nPosodabljam permission Posta-create\nPosodabljam permission Posta-lookup\nPosodabljam permission PostniNaslov-delete\nPosodabljam permission PostniNaslov-read\nPosodabljam permission PostniNaslov-update\nPosodabljam permission PostniNaslov-create\nPosodabljam permission PostniNaslov-lookup\nPosodabljam permission Skladisce-delete\nPosodabljam permission Skladisce-read\nPosodabljam permission Skladisce-update\nPosodabljam permission Skladisce-create\nPosodabljam permission Skladisce-lookup\nPosodabljam permission StevilcenjeDokumenta-delete\nPosodabljam permission StevilcenjeDokumenta-read\nPosodabljam permission StevilcenjeDokumenta-update\nPosodabljam permission StevilcenjeDokumenta-create\nPosodabljam permission StevilcenjeDokumenta-lookup\nPosodabljam permission StevilcenjePoSkl-delete\nPosodabljam permission StevilcenjePoSkl-read\nPosodabljam permission StevilcenjePoSkl-update\nPosodabljam permission StevilcenjePoSkl-create\nPosodabljam permission StevilcenjePoSkl-lookup\nPosodabljam permission StevilcenjeTrenutne-delete\nPosodabljam permission StevilcenjeTrenutne-read\nPosodabljam permission StevilcenjeTrenutne-update\nPosodabljam permission StevilcenjeTrenutne-create\nPosodabljam permission StevilcenjeTrenutne-lookup\nPosodabljam permission Tdok-delete\nPosodabljam permission Tdok-read\nPosodabljam permission Tdok-update\nPosodabljam permission Tdok-create\nPosodabljam permission Tdok-lookup\nPosodabljam permission Tehen-delete\nPosodabljam permission Tehen-read\nPosodabljam permission Tehen-update\nPosodabljam permission Tehen-create\nPosodabljam permission Tehen-lookup\nPosodabljam permission Tiskalnik-delete\nPosodabljam permission Tiskalnik-read\nPosodabljam permission Tiskalnik-update\nPosodabljam permission Tiskalnik-create\nPosodabljam permission Tiskalnik-lookup\nPosodabljam permission Valuta-delete\nPosodabljam permission Valuta-read\nPosodabljam permission Valuta-update\nPosodabljam permission Valuta-create\nPosodabljam permission Valuta-lookup\nPosodabljam permission Vfs-Datoteka-delete\nPosodabljam permission Vfs-Datoteka-read\nPosodabljam permission Vfs-Datoteka-update\nPosodabljam permission Vfs-Datoteka-create\nPosodabljam permission Vfs-Datoteka-lookup\nPosodabljam permission Vfs-Mapa-delete\nPosodabljam permission Vfs-Mapa-read\nPosodabljam permission Vfs-Mapa-update\nPosodabljam permission Vfs-Mapa-create\nPosodabljam permission Vfs-Mapa-lookup\nPosodabljam permission Vfs-MapaAcl-delete\nPosodabljam permission Vfs-MapaAcl-read\nPosodabljam permission Vfs-MapaAcl-update\nPosodabljam permission Vfs-MapaAcl-create\nPosodabljam permission Vfs-MapaAcl-lookup\nPosodabljam permission Vfs-Priponka-delete\nPosodabljam permission Vfs-Priponka-read\nPosodabljam permission Vfs-Priponka-update\nPosodabljam permission Vfs-Priponka-create\nPosodabljam permission Vfs-Priponka-lookup\nPosodabljam permission Narocila-CenovniRazpon-delete\nPosodabljam permission Narocila-CenovniRazpon-read\nPosodabljam permission Narocila-CenovniRazpon-update\nPosodabljam permission Narocila-CenovniRazpon-create\nPosodabljam permission Narocila-CenovniRazpon-lookup\nPosodabljam permission Narocila-DokumentNarociloDob-delete\nPosodabljam permission Narocila-DokumentNarociloDob-read\nPosodabljam permission Narocila-DokumentNarociloDob-update\nPosodabljam permission Narocila-DokumentNarociloDob-create\nPosodabljam permission Narocila-DokumentNarociloDob-lookup\nPosodabljam permission Narocila-DokumentNarociloKup-delete\nPosodabljam permission Narocila-DokumentNarociloKup-read\nPosodabljam permission Narocila-DokumentNarociloKup-update\nPosodabljam permission Narocila-DokumentNarociloKup-create\nPosodabljam permission Narocila-DokumentNarociloKup-lookup\nPosodabljam permission Narocila-DokumentPonudba-delete\nPosodabljam permission Narocila-DokumentPonudba-read\nPosodabljam permission Narocila-DokumentPonudba-update\nPosodabljam permission Narocila-DokumentPonudba-create\nPosodabljam permission Narocila-DokumentPonudba-lookup\nPosodabljam permission Narocila-KakovostniPrevzem-delete\nPosodabljam permission Narocila-KakovostniPrevzem-read\nPosodabljam permission Narocila-KakovostniPrevzem-update\nPosodabljam permission Narocila-KakovostniPrevzem-create\nPosodabljam permission Narocila-KakovostniPrevzem-lookup\nPosodabljam permission Narocila-PostavkaNarociloDob-delete\nPosodabljam permission Narocila-PostavkaNarociloDob-read\nPosodabljam permission Narocila-PostavkaNarociloDob-update\nPosodabljam permission Narocila-PostavkaNarociloDob-create\nPosodabljam permission Narocila-PostavkaNarociloDob-lookup\nPosodabljam permission Narocila-PostavkaNarociloKup-delete\nPosodabljam permission Narocila-PostavkaNarociloKup-read\nPosodabljam permission Narocila-PostavkaNarociloKup-update\nPosodabljam permission Narocila-PostavkaNarociloKup-create\nPosodabljam permission Narocila-PostavkaNarociloKup-lookup\nPosodabljam permission Narocila-PostavkaPonudba-delete\nPosodabljam permission Narocila-PostavkaPonudba-read\nPosodabljam permission Narocila-PostavkaPonudba-update\nPosodabljam permission Narocila-PostavkaPonudba-create\nPosodabljam permission Narocila-PostavkaPonudba-lookup\nPosodabljam permission Narocila-StatusNar-delete\nPosodabljam permission Narocila-StatusNar-read\nPosodabljam permission Narocila-StatusNar-update\nPosodabljam permission Narocila-StatusNar-create\nPosodabljam permission Narocila-StatusNar-lookup\nPosodabljam permission Tehnologija-Embalaza-delete\nPosodabljam permission Tehnologija-Embalaza-read\nPosodabljam permission Tehnologija-Embalaza-update\nPosodabljam permission Tehnologija-Embalaza-create\nPosodabljam permission Tehnologija-Embalaza-lookup\nPosodabljam permission Tehnologija-Etiketa-delete\nPosodabljam permission Tehnologija-Etiketa-read\nPosodabljam permission Tehnologija-Etiketa-update\nPosodabljam permission Tehnologija-Etiketa-create\nPosodabljam permission Tehnologija-Etiketa-lookup\nPosodabljam permission Tehnologija-KalkKoso-delete\nPosodabljam permission Tehnologija-KalkKoso-read\nPosodabljam permission Tehnologija-KalkKoso-update\nPosodabljam permission Tehnologija-KalkKoso-create\nPosodabljam permission Tehnologija-KalkKoso-lookup\nPosodabljam permission Tehnologija-PostavkaKalkKoso-delete\nPosodabljam permission Tehnologija-PostavkaKalkKoso-read\nPosodabljam permission Tehnologija-PostavkaKalkKoso-update\nPosodabljam permission Tehnologija-PostavkaKalkKoso-create\nPosodabljam permission Tehnologija-PostavkaKalkKoso-lookup\nPosodabljam permission Tehnologija-KalkKosoMaterial-delete\nPosodabljam permission Tehnologija-KalkKosoMaterial-read\nPosodabljam permission Tehnologija-KalkKosoMaterial-update\nPosodabljam permission Tehnologija-KalkKosoMaterial-create\nPosodabljam permission Tehnologija-KalkKosoMaterial-lookup\nPosodabljam permission Tehnologija-KalkKosoOperacija-delete\nPosodabljam permission Tehnologija-KalkKosoOperacija-read\nPosodabljam permission Tehnologija-KalkKosoOperacija-update\nPosodabljam permission Tehnologija-KalkKosoOperacija-create\nPosodabljam permission Tehnologija-KalkKosoOperacija-lookup\nPosodabljam permission Tehnologija-KalkKosoStoritev-delete\nPosodabljam permission Tehnologija-KalkKosoStoritev-read\nPosodabljam permission Tehnologija-KalkKosoStoritev-update\nPosodabljam permission Tehnologija-KalkKosoStoritev-create\nPosodabljam permission Tehnologija-KalkKosoStoritev-lookup\nPosodabljam permission Tehnologija-Koso-delete\nPosodabljam permission Tehnologija-Koso-read\nPosodabljam permission Tehnologija-Koso-update\nPosodabljam permission Tehnologija-Koso-create\nPosodabljam permission Tehnologija-Koso-lookup\nPosodabljam permission Tehnologija-KosoOper-delete\nPosodabljam permission Tehnologija-KosoOper-read\nPosodabljam permission Tehnologija-KosoOper-update\nPosodabljam permission Tehnologija-KosoOper-create\nPosodabljam permission Tehnologija-KosoOper-lookup\nPosodabljam permission Tehnologija-Nastavni-delete\nPosodabljam permission Tehnologija-Nastavni-read\nPosodabljam permission Tehnologija-Nastavni-update\nPosodabljam permission Tehnologija-Nastavni-create\nPosodabljam permission Tehnologija-Nastavni-lookup\nPosodabljam permission Tehnologija-Norma-delete\nPosodabljam permission Tehnologija-Norma-read\nPosodabljam permission Tehnologija-Norma-update\nPosodabljam permission Tehnologija-Norma-create\nPosodabljam permission Tehnologija-Norma-lookup\nPosodabljam permission Tehnologija-PakiranjeProdukta-delete\nPosodabljam permission Tehnologija-PakiranjeProdukta-read\nPosodabljam permission Tehnologija-PakiranjeProdukta-update\nPosodabljam permission Tehnologija-PakiranjeProdukta-create\nPosodabljam permission Tehnologija-PakiranjeProdukta-lookup\nPosodabljam permission Tehnologija-Sklop-delete\nPosodabljam permission Tehnologija-Sklop-read\nPosodabljam permission Tehnologija-Sklop-update\nPosodabljam permission Tehnologija-Sklop-create\nPosodabljam permission Tehnologija-Sklop-lookup\nPosodabljam permission Tehnologija-SklopPozi-delete\nPosodabljam permission Tehnologija-SklopPozi-read\nPosodabljam permission Tehnologija-SklopPozi-update\nPosodabljam permission Tehnologija-SklopPozi-create\nPosodabljam permission Tehnologija-SklopPozi-lookup\nPosodabljam permission Proizvodnja-DelovniNalog-delete\nPosodabljam permission Proizvodnja-DelovniNalog-read\nPosodabljam permission Proizvodnja-DelovniNalog-update\nPosodabljam permission Proizvodnja-DelovniNalog-create\nPosodabljam permission Proizvodnja-DelovniNalog-lookup\nPosodabljam permission Proizvodnja-Izvedba-delete\nPosodabljam permission Proizvodnja-Izvedba-read\nPosodabljam permission Proizvodnja-Izvedba-update\nPosodabljam permission Proizvodnja-Izvedba-create\nPosodabljam permission Proizvodnja-Izvedba-lookup\nPosodabljam permission Proizvodnja-IzvDelavec-delete\nPosodabljam permission Proizvodnja-IzvDelavec-read\nPosodabljam permission Proizvodnja-IzvDelavec-update\nPosodabljam permission Proizvodnja-IzvDelavec-create\nPosodabljam permission Proizvodnja-IzvDelavec-lookup\nPosodabljam permission Proizvodnja-IzvDodelava-delete\nPosodabljam permission Proizvodnja-IzvDodelava-read\nPosodabljam permission Proizvodnja-IzvDodelava-update\nPosodabljam permission Proizvodnja-IzvDodelava-create\nPosodabljam permission Proizvodnja-IzvDodelava-lookup\nPosodabljam permission Proizvodnja-IzvedbaPodrobno-delete\nPosodabljam permission Proizvodnja-IzvedbaPodrobno-read\nPosodabljam permission Proizvodnja-IzvedbaPodrobno-update\nPosodabljam permission Proizvodnja-IzvedbaPodrobno-create\nPosodabljam permission Proizvodnja-IzvedbaPodrobno-lookup\nPosodabljam permission Proizvodnja-IzvedbaDelo-delete\nPosodabljam permission Proizvodnja-IzvedbaDelo-read\nPosodabljam permission Proizvodnja-IzvedbaDelo-update\nPosodabljam permission Proizvodnja-IzvedbaDelo-create\nPosodabljam permission Proizvodnja-IzvedbaDelo-lookup\nPosodabljam permission Proizvodnja-IzvedbaNastavitev-delete\nPosodabljam permission Proizvodnja-IzvedbaNastavitev-read\nPosodabljam permission Proizvodnja-IzvedbaNastavitev-update\nPosodabljam permission Proizvodnja-IzvedbaNastavitev-create\nPosodabljam permission Proizvodnja-IzvedbaNastavitev-lookup\nPosodabljam permission Proizvodnja-IzvedbaPopravilo-delete\nPosodabljam permission Proizvodnja-IzvedbaPopravilo-read\nPosodabljam permission Proizvodnja-IzvedbaPopravilo-update\nPosodabljam permission Proizvodnja-IzvedbaPopravilo-create\nPosodabljam permission Proizvodnja-IzvedbaPopravilo-lookup\nPosodabljam permission Proizvodnja-IzvedbaZastoj-delete\nPosodabljam permission Proizvodnja-IzvedbaZastoj-read\nPosodabljam permission Proizvodnja-IzvedbaZastoj-update\nPosodabljam permission Proizvodnja-IzvedbaZastoj-create\nPosodabljam permission Proizvodnja-IzvedbaZastoj-lookup\nPosodabljam permission Proizvodnja-IzvTehen-delete\nPosodabljam permission Proizvodnja-IzvTehen-read\nPosodabljam permission Proizvodnja-IzvTehen-update\nPosodabljam permission Proizvodnja-IzvTehen-create\nPosodabljam permission Proizvodnja-IzvTehen-lookup\nPosodabljam permission Proizvodnja-Koledar-delete\nPosodabljam permission Proizvodnja-Koledar-read\nPosodabljam permission Proizvodnja-Koledar-update\nPosodabljam permission Proizvodnja-Koledar-create\nPosodabljam permission Proizvodnja-Koledar-lookup\nPosodabljam permission Proizvodnja-PoslovniPlan-delete\nPosodabljam permission Proizvodnja-PoslovniPlan-read\nPosodabljam permission Proizvodnja-PoslovniPlan-update\nPosodabljam permission Proizvodnja-PoslovniPlan-create\nPosodabljam permission Proizvodnja-PoslovniPlan-lookup\nPosodabljam permission Proizvodnja-PoslovniPlanArtikla-delete\nPosodabljam permission Proizvodnja-PoslovniPlanArtikla-read\nPosodabljam permission Proizvodnja-PoslovniPlanArtikla-update\nPosodabljam permission Proizvodnja-PoslovniPlanArtikla-create\nPosodabljam permission Proizvodnja-PoslovniPlanArtikla-lookup\nPosodabljam permission Proizvodnja-PoslovniPlanKadri-delete\nPosodabljam permission Proizvodnja-PoslovniPlanKadri-read\nPosodabljam permission Proizvodnja-PoslovniPlanKadri-update\nPosodabljam permission Proizvodnja-PoslovniPlanKadri-create\nPosodabljam permission Proizvodnja-PoslovniPlanKadri-lookup\nPosodabljam permission Proizvodnja-PoslovniPlanNapoved-delete\nPosodabljam permission Proizvodnja-PoslovniPlanNapoved-read\nPosodabljam permission Proizvodnja-PoslovniPlanNapoved-update\nPosodabljam permission Proizvodnja-PoslovniPlanNapoved-create\nPosodabljam permission Proizvodnja-PoslovniPlanNapoved-lookup\nPosodabljam permission Proizvodnja-PoslovniPlanNarocilo-delete\nPosodabljam permission Proizvodnja-PoslovniPlanNarocilo-read\nPosodabljam permission Proizvodnja-PoslovniPlanNarocilo-update\nPosodabljam permission Proizvodnja-PoslovniPlanNarocilo-create\nPosodabljam permission Proizvodnja-PoslovniPlanNarocilo-lookup\nPosodabljam permission Proizvodnja-PoslovniPlanObdobje-delete\nPosodabljam permission Proizvodnja-PoslovniPlanObdobje-read\nPosodabljam permission Proizvodnja-PoslovniPlanObdobje-update\nPosodabljam permission Proizvodnja-PoslovniPlanObdobje-create\nPosodabljam permission Proizvodnja-PoslovniPlanObdobje-lookup\nPosodabljam permission Proizvodnja-PoslovniPlanProizvodnja-delete\nPosodabljam permission Proizvodnja-PoslovniPlanProizvodnja-read\nPosodabljam permission Proizvodnja-PoslovniPlanProizvodnja-update\nPosodabljam permission Proizvodnja-PoslovniPlanProizvodnja-create\nPosodabljam permission Proizvodnja-PoslovniPlanProizvodnja-lookup\nPosodabljam permission Proizvodnja-PoslovniPlanUreTehen-delete\nPosodabljam permission Proizvodnja-PoslovniPlanUreTehen-read\nPosodabljam permission Proizvodnja-PoslovniPlanUreTehen-update\nPosodabljam permission Proizvodnja-PoslovniPlanUreTehen-create\nPosodabljam permission Proizvodnja-PoslovniPlanUreTehen-lookup\nPosodabljam permission Proizvodnja-RazpisanaOperacija-delete\nPosodabljam permission Proizvodnja-RazpisanaOperacija-read\nPosodabljam permission Proizvodnja-RazpisanaOperacija-update\nPosodabljam permission Proizvodnja-RazpisanaOperacija-create\nPosodabljam permission Proizvodnja-RazpisanaOperacija-lookup\nPosodabljam permission Proizvodnja-RazpisKoso-delete\nPosodabljam permission Proizvodnja-RazpisKoso-read\nPosodabljam permission Proizvodnja-RazpisKoso-update\nPosodabljam permission Proizvodnja-RazpisKoso-create\nPosodabljam permission Proizvodnja-RazpisKoso-lookup\nPosodabljam permission Proizvodnja-StatusTehen-delete\nPosodabljam permission Proizvodnja-StatusTehen-read\nPosodabljam permission Proizvodnja-StatusTehen-update\nPosodabljam permission Proizvodnja-StatusTehen-create\nPosodabljam permission Proizvodnja-StatusTehen-lookup\nPosodabljam permission Proizvodnja-Tekoledar-delete\nPosodabljam permission Proizvodnja-Tekoledar-read\nPosodabljam permission Proizvodnja-Tekoledar-update\nPosodabljam permission Proizvodnja-Tekoledar-create\nPosodabljam permission Proizvodnja-Tekoledar-lookup\nPosodabljam permission Proizvodnja-Zastoj-delete\nPosodabljam permission Proizvodnja-Zastoj-read\nPosodabljam permission Proizvodnja-Zastoj-update\nPosodabljam permission Proizvodnja-Zastoj-create\nPosodabljam permission Proizvodnja-Zastoj-lookup\nPosodabljam permission Logistika-Cena-delete\nPosodabljam permission Logistika-Cena-read\nPosodabljam permission Logistika-Cena-update\nPosodabljam permission Logistika-Cena-create\nPosodabljam permission Logistika-Cena-lookup\nPosodabljam permission Logistika-Dobava-delete\nPosodabljam permission Logistika-Dobava-read\nPosodabljam permission Logistika-Dobava-update\nPosodabljam permission Logistika-Dobava-create\nPosodabljam permission Logistika-Dobava-lookup\nPosodabljam permission Logistika-DokumentMat-delete\nPosodabljam permission Logistika-DokumentMat-read\nPosodabljam permission Logistika-DokumentMat-update\nPosodabljam permission Logistika-DokumentMat-create\nPosodabljam permission Logistika-DokumentMat-lookup\nPosodabljam permission Logistika-DokumentDobavnica-delete\nPosodabljam permission Logistika-DokumentDobavnica-read\nPosodabljam permission Logistika-DokumentDobavnica-update\nPosodabljam permission Logistika-DokumentDobavnica-create\nPosodabljam permission Logistika-DokumentDobavnica-lookup\nPosodabljam permission Logistika-DokumentIzdajnica-delete\nPosodabljam permission Logistika-DokumentIzdajnica-read\nPosodabljam permission Logistika-DokumentIzdajnica-update\nPosodabljam permission Logistika-DokumentIzdajnica-create\nPosodabljam permission Logistika-DokumentIzdajnica-lookup\nPosodabljam permission Logistika-DokumentPredajnica-delete\nPosodabljam permission Logistika-DokumentPredajnica-read\nPosodabljam permission Logistika-DokumentPredajnica-update\nPosodabljam permission Logistika-DokumentPredajnica-create\nPosodabljam permission Logistika-DokumentPredajnica-lookup\nPosodabljam permission Logistika-DokumentPremik-delete\nPosodabljam permission Logistika-DokumentPremik-read\nPosodabljam permission Logistika-DokumentPremik-update\nPosodabljam permission Logistika-DokumentPremik-create\nPosodabljam permission Logistika-DokumentPremik-lookup\nPosodabljam permission Logistika-DokumentPrevrednotenje-delete\nPosodabljam permission Logistika-DokumentPrevrednotenje-read\nPosodabljam permission Logistika-DokumentPrevrednotenje-update\nPosodabljam permission Logistika-DokumentPrevrednotenje-create\nPosodabljam permission Logistika-DokumentPrevrednotenje-lookup\nPosodabljam permission Logistika-DokumentPrevzemnica-delete\nPosodabljam permission Logistika-DokumentPrevzemnica-read\nPosodabljam permission Logistika-DokumentPrevzemnica-update\nPosodabljam permission Logistika-DokumentPrevzemnica-create\nPosodabljam permission Logistika-DokumentPrevzemnica-lookup\nPosodabljam permission Logistika-LastnostLokacije-delete\nPosodabljam permission Logistika-LastnostLokacije-read\nPosodabljam permission Logistika-LastnostLokacije-update\nPosodabljam permission Logistika-LastnostLokacije-create\nPosodabljam permission Logistika-LastnostLokacije-lookup\nPosodabljam permission Logistika-Lokacija-delete\nPosodabljam permission Logistika-Lokacija-read\nPosodabljam permission Logistika-Lokacija-update\nPosodabljam permission Logistika-Lokacija-create\nPosodabljam permission Logistika-Lokacija-lookup\nPosodabljam permission Logistika-OdvisniStroski-delete\nPosodabljam permission Logistika-OdvisniStroski-read\nPosodabljam permission Logistika-OdvisniStroski-update\nPosodabljam permission Logistika-OdvisniStroski-create\nPosodabljam permission Logistika-OdvisniStroski-lookup\nPosodabljam permission Logistika-PaketProduktov-delete\nPosodabljam permission Logistika-PaketProduktov-read\nPosodabljam permission Logistika-PaketProduktov-update\nPosodabljam permission Logistika-PaketProduktov-create\nPosodabljam permission Logistika-PaketProduktov-lookup\nPosodabljam permission Logistika-PorekloProduktov-delete\nPosodabljam permission Logistika-PorekloProduktov-read\nPosodabljam permission Logistika-PorekloProduktov-update\nPosodabljam permission Logistika-PorekloProduktov-create\nPosodabljam permission Logistika-PorekloProduktov-lookup\nPosodabljam permission Logistika-PostavkaMat-delete\nPosodabljam permission Logistika-PostavkaMat-read\nPosodabljam permission Logistika-PostavkaMat-update\nPosodabljam permission Logistika-PostavkaMat-create\nPosodabljam permission Logistika-PostavkaMat-lookup\nPosodabljam permission Logistika-PostavkaDobavnica-delete\nPosodabljam permission Logistika-PostavkaDobavnica-read\nPosodabljam permission Logistika-PostavkaDobavnica-update\nPosodabljam permission Logistika-PostavkaDobavnica-create\nPosodabljam permission Logistika-PostavkaDobavnica-lookup\nPosodabljam permission Logistika-PostavkaIzdajnica-delete\nPosodabljam permission Logistika-PostavkaIzdajnica-read\nPosodabljam permission Logistika-PostavkaIzdajnica-update\nPosodabljam permission Logistika-PostavkaIzdajnica-create\nPosodabljam permission Logistika-PostavkaIzdajnica-lookup\nPosodabljam permission Logistika-PostavkaPredajnica-delete\nPosodabljam permission Logistika-PostavkaPredajnica-read\nPosodabljam permission Logistika-PostavkaPredajnica-update\nPosodabljam permission Logistika-PostavkaPredajnica-create\nPosodabljam permission Logistika-PostavkaPredajnica-lookup\nPosodabljam permission Logistika-PostavkaPremik-delete\nPosodabljam permission Logistika-PostavkaPremik-read\nPosodabljam permission Logistika-PostavkaPremik-update\nPosodabljam permission Logistika-PostavkaPremik-create\nPosodabljam permission Logistika-PostavkaPremik-lookup\nPosodabljam permission Logistika-PostavkaPrevrednotenje-delete\nPosodabljam permission Logistika-PostavkaPrevrednotenje-read\nPosodabljam permission Logistika-PostavkaPrevrednotenje-update\nPosodabljam permission Logistika-PostavkaPrevrednotenje-create\nPosodabljam permission Logistika-PostavkaPrevrednotenje-lookup\nPosodabljam permission Logistika-PostavkaPrevzemnica-delete\nPosodabljam permission Logistika-PostavkaPrevzemnica-read\nPosodabljam permission Logistika-PostavkaPrevzemnica-update\nPosodabljam permission Logistika-PostavkaPrevzemnica-create\nPosodabljam permission Logistika-PostavkaPrevzemnica-lookup\nPosodabljam permission Logistika-PostavkaStroska-delete\nPosodabljam permission Logistika-PostavkaStroska-read\nPosodabljam permission Logistika-PostavkaStroska-update\nPosodabljam permission Logistika-PostavkaStroska-create\nPosodabljam permission Logistika-PostavkaStroska-lookup\nPosodabljam permission Logistika-PrejsnjaLokacija-delete\nPosodabljam permission Logistika-PrejsnjaLokacija-read\nPosodabljam permission Logistika-PrejsnjaLokacija-update\nPosodabljam permission Logistika-PrejsnjaLokacija-create\nPosodabljam permission Logistika-PrejsnjaLokacija-lookup\nPosodabljam permission Logistika-PrejsnjiPaket-delete\nPosodabljam permission Logistika-PrejsnjiPaket-read\nPosodabljam permission Logistika-PrejsnjiPaket-update\nPosodabljam permission Logistika-PrejsnjiPaket-create\nPosodabljam permission Logistika-PrejsnjiPaket-lookup\nPosodabljam permission Logistika-PrikazLokacije-delete\nPosodabljam permission Logistika-PrikazLokacije-read\nPosodabljam permission Logistika-PrikazLokacije-update\nPosodabljam permission Logistika-PrikazLokacije-create\nPosodabljam permission Logistika-PrikazLokacije-lookup\nPosodabljam permission Logistika-PrometSkladiscenja-delete\nPosodabljam permission Logistika-PrometSkladiscenja-read\nPosodabljam permission Logistika-PrometSkladiscenja-update\nPosodabljam permission Logistika-PrometSkladiscenja-create\nPosodabljam permission Logistika-PrometSkladiscenja-lookup\nPosodabljam permission Logistika-PrometSkladiscenjaIzdaja-delete\nPosodabljam permission Logistika-PrometSkladiscenjaIzdaja-read\nPosodabljam permission Logistika-PrometSkladiscenjaIzdaja-update\nPosodabljam permission Logistika-PrometSkladiscenjaIzdaja-create\nPosodabljam permission Logistika-PrometSkladiscenjaIzdaja-lookup\nPosodabljam permission Logistika-PrometSkladiscenjaPrejem-delete\nPosodabljam permission Logistika-PrometSkladiscenjaPrejem-read\nPosodabljam permission Logistika-PrometSkladiscenjaPrejem-update\nPosodabljam permission Logistika-PrometSkladiscenjaPrejem-create\nPosodabljam permission Logistika-PrometSkladiscenjaPrejem-lookup\nPosodabljam permission Logistika-PrometSkladiscenjaPremik-delete\nPosodabljam permission Logistika-PrometSkladiscenjaPremik-read\nPosodabljam permission Logistika-PrometSkladiscenjaPremik-update\nPosodabljam permission Logistika-PrometSkladiscenjaPremik-create\nPosodabljam permission Logistika-PrometSkladiscenjaPremik-lookup\nPosodabljam permission Logistika-Serijska-delete\nPosodabljam permission Logistika-Serijska-read\nPosodabljam permission Logistika-Serijska-update\nPosodabljam permission Logistika-Serijska-create\nPosodabljam permission Logistika-Serijska-lookup\nPosodabljam permission Logistika-Zaloga-delete\nPosodabljam permission Logistika-Zaloga-read\nPosodabljam permission Logistika-Zaloga-update\nPosodabljam permission Logistika-Zaloga-create\nPosodabljam permission Logistika-Zaloga-lookup\n	2015-01-07 18:45:09	2015-01-07 18:45:09	2015-01-07 18:45:10	a:0:{}	t	f	\N	\N
e3a9ed35-052a-4505-aff3-becb35a72315	bedcb99b-3716-41b4-bb85-83637ca60c3c	Kalkulacijska kosovnica	\\Tehnologija\\Report\\KalkKosoReport	1	\N	2015-03-08 15:10:24	2015-03-08 15:10:24	\N	a:4:{s:4:"sync";b:1;s:3:"pdf";b:1;s:5:"print";b:0;s:2:"id";s:36:"0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f";}	\N	f	\N	\N
08b8bad1-30ec-4969-9165-4deb7fd45cba	bedcb99b-3716-41b4-bb85-83637ca60c3c	Kalkulacijska kosovnica	\\Tehnologija\\Report\\KalkKosoReport	3	Napaka pri izvajanju joba (110001): Dokument nima nastavljenega TDok\n#0 /Users/boris/tip2/module/Tehnologija/src/Tehnologija/Report/KalkKosoReport.php(24): Tip\\Task\\AbstractPrinterTask->addDocumentReport('Kalkulacija 004...', Object(Tehnologija\\Entity\\KalkKoso))\n#1 /Users/boris/tip2/module/Tip/src/Tip/Task/AbstractTask.php(61): Tehnologija\\Report\\KalkKosoReport->taskBody()\n#2 /Users/boris/tip2/module/Workflow/src/Workflow/Repository/JobManager.php(199): Tip\\Task\\AbstractTask->runTask(false)\n#3 /Users/boris/tip2/module/Workflow/src/Workflow/Repository/JobManager.php(181): Workflow\\Repository\\JobManager->runJob(Object(Workflow\\Entity\\Job))\n#4 /Users/boris/tip2/module/Tip/src/Tip/Service/AbstractTipService.php(161): Workflow\\Repository\\JobManager->createJob(Array)\n#5 /Users/boris/tip2/module/Tip/src/Tip/Service/AbstractTipService.php(200): Tip\\Service\\AbstractTipService->addJob(Array, Array)\n#6 /Users/boris/tip2/module/Tehnologija/src/Tehnologija/Service/KalkKosoRpcService.php(148): Tip\\Service\\AbstractTipService->docPrint('\\\\Tehnologija\\\\Re...', '0c4af8d0-9f1e-4...', Array)\n#7 [internal function]: Tehnologija\\Service\\KalkKosoRpcService->tiskajDokument('0c4af8d0-9f1e-4...', Array)\n#8 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/Server/AbstractServer.php(154): call_user_func_array(Array, Array)\n#9 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/Json/Server/Server.php(558): Zend\\Server\\AbstractServer->_dispatch(Object(Zend\\Server\\Method\\Definition), Array)\n#10 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/Json/Server/Server.php(171): Zend\\Json\\Server\\Server->_handle()\n#11 /Users/boris/tip2/module/Tip/src/Tip/Controller/AbstractRpcController.php(38): Zend\\Json\\Server\\Server->handle()\n#12 /Users/boris/tip2/module/Tehnologija/src/Tehnologija/Controller/TehRpcController.php(24): Tip\\Controller\\AbstractRpcController->handleJsonRpcCall(Object(Tehnologija\\Service\\KalkKosoRpcService))\n#13 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/Mvc/Controller/AbstractActionController.php(83): Tehnologija\\Controller\\TehRpcController->kalkKosoAction()\n#14 [internal function]: Zend\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Zend\\Mvc\\MvcEvent))\n#15 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/EventManager/EventManager.php(468): call_user_func(Array, Object(Zend\\Mvc\\MvcEvent))\n#16 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/EventManager/EventManager.php(207): Zend\\EventManager\\EventManager->triggerListeners('dispatch', Object(Zend\\Mvc\\MvcEvent), Object(Closure))\n#17 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/Mvc/Controller/AbstractController.php(117): Zend\\EventManager\\EventManager->trigger('dispatch', Object(Zend\\Mvc\\MvcEvent), Object(Closure))\n#18 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/Mvc/DispatchListener.php(114): Zend\\Mvc\\Controller\\AbstractController->dispatch(Object(Zend\\Http\\PhpEnvironment\\Request), Object(Zend\\Http\\PhpEnvironment\\Response))\n#19 [internal function]: Zend\\Mvc\\DispatchListener->onDispatch(Object(Zend\\Mvc\\MvcEvent))\n#20 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/EventManager/EventManager.php(468): call_user_func(Array, Object(Zend\\Mvc\\MvcEvent))\n#21 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/EventManager/EventManager.php(207): Zend\\EventManager\\EventManager->triggerListeners('dispatch', Object(Zend\\Mvc\\MvcEvent), Object(Closure))\n#22 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/Mvc/Application.php(313): Zend\\EventManager\\EventManager->trigger('dispatch', Object(Zend\\Mvc\\MvcEvent), Object(Closure))\n#23 /Users/boris/tip2/public/index.php(15): Zend\\Mvc\\Application->run()\n#24 {main}\n	2015-03-08 15:14:21	2015-03-08 15:14:21	2015-03-08 15:14:21	a:4:{s:4:"sync";b:1;s:3:"pdf";b:1;s:5:"print";b:0;s:2:"id";s:36:"0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f";}	f	f	\N	\N
6ff0a744-81ae-416a-a8f7-c8a6f209ead4	bedcb99b-3716-41b4-bb85-83637ca60c3c	Kalkulacijska kosovnica	\\Tehnologija\\Report\\KalkKosoReport	3	Napaka pri izvajanju joba (110001): Dokument nima nastavljenega TDok\n#0 /Users/boris/tip2/module/Tehnologija/src/Tehnologija/Report/KalkKosoReport.php(24): Tip\\Task\\AbstractPrinterTask->addDocumentReport('Kalkulacija 004...', Object(Tehnologija\\Entity\\KalkKoso))\n#1 /Users/boris/tip2/module/Tip/src/Tip/Task/AbstractTask.php(61): Tehnologija\\Report\\KalkKosoReport->taskBody()\n#2 /Users/boris/tip2/module/Workflow/src/Workflow/Repository/JobManager.php(199): Tip\\Task\\AbstractTask->runTask(false)\n#3 /Users/boris/tip2/module/Workflow/src/Workflow/Repository/JobManager.php(181): Workflow\\Repository\\JobManager->runJob(Object(Workflow\\Entity\\Job))\n#4 /Users/boris/tip2/module/Tip/src/Tip/Service/AbstractTipService.php(161): Workflow\\Repository\\JobManager->createJob(Array)\n#5 /Users/boris/tip2/module/Tip/src/Tip/Service/AbstractTipService.php(200): Tip\\Service\\AbstractTipService->addJob(Array, Array)\n#6 /Users/boris/tip2/module/Tehnologija/src/Tehnologija/Service/KalkKosoRpcService.php(148): Tip\\Service\\AbstractTipService->docPrint('\\\\Tehnologija\\\\Re...', '0c4af8d0-9f1e-4...', Array)\n#7 [internal function]: Tehnologija\\Service\\KalkKosoRpcService->tiskajDokument('0c4af8d0-9f1e-4...', Array)\n#8 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/Server/AbstractServer.php(154): call_user_func_array(Array, Array)\n#9 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/Json/Server/Server.php(558): Zend\\Server\\AbstractServer->_dispatch(Object(Zend\\Server\\Method\\Definition), Array)\n#10 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/Json/Server/Server.php(171): Zend\\Json\\Server\\Server->_handle()\n#11 /Users/boris/tip2/module/Tip/src/Tip/Controller/AbstractRpcController.php(38): Zend\\Json\\Server\\Server->handle()\n#12 /Users/boris/tip2/module/Tehnologija/src/Tehnologija/Controller/TehRpcController.php(24): Tip\\Controller\\AbstractRpcController->handleJsonRpcCall(Object(Tehnologija\\Service\\KalkKosoRpcService))\n#13 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/Mvc/Controller/AbstractActionController.php(83): Tehnologija\\Controller\\TehRpcController->kalkKosoAction()\n#14 [internal function]: Zend\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Zend\\Mvc\\MvcEvent))\n#15 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/EventManager/EventManager.php(468): call_user_func(Array, Object(Zend\\Mvc\\MvcEvent))\n#16 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/EventManager/EventManager.php(207): Zend\\EventManager\\EventManager->triggerListeners('dispatch', Object(Zend\\Mvc\\MvcEvent), Object(Closure))\n#17 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/Mvc/Controller/AbstractController.php(117): Zend\\EventManager\\EventManager->trigger('dispatch', Object(Zend\\Mvc\\MvcEvent), Object(Closure))\n#18 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/Mvc/DispatchListener.php(114): Zend\\Mvc\\Controller\\AbstractController->dispatch(Object(Zend\\Http\\PhpEnvironment\\Request), Object(Zend\\Http\\PhpEnvironment\\Response))\n#19 [internal function]: Zend\\Mvc\\DispatchListener->onDispatch(Object(Zend\\Mvc\\MvcEvent))\n#20 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/EventManager/EventManager.php(468): call_user_func(Array, Object(Zend\\Mvc\\MvcEvent))\n#21 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/EventManager/EventManager.php(207): Zend\\EventManager\\EventManager->triggerListeners('dispatch', Object(Zend\\Mvc\\MvcEvent), Object(Closure))\n#22 /Users/boris/tip2/vendor/zendframework/zendframework/library/Zend/Mvc/Application.php(313): Zend\\EventManager\\EventManager->trigger('dispatch', Object(Zend\\Mvc\\MvcEvent), Object(Closure))\n#23 /Users/boris/tip2/public/index.php(15): Zend\\Mvc\\Application->run()\n#24 {main}\n	2015-03-08 15:19:14	2015-03-08 15:19:14	2015-03-08 15:19:14	a:4:{s:4:"sync";b:1;s:3:"pdf";b:1;s:5:"print";b:0;s:2:"id";s:36:"0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f";}	f	f	\N	\N
74cd4ef1-94a6-404a-bfc7-4485d3af221e	bedcb99b-3716-41b4-bb85-83637ca60c3c	Kalkulacijska kosovnica	\\Tehnologija\\Report\\KalkKosoReport	1	\N	2015-03-08 15:27:19	2015-03-08 15:27:19	\N	a:4:{s:4:"sync";b:1;s:3:"pdf";b:1;s:5:"print";b:0;s:2:"id";s:36:"0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f";}	\N	f	\N	\N
25879b25-97eb-479f-8f65-659881888327	bedcb99b-3716-41b4-bb85-83637ca60c3c	Kalkulacijska kosovnica	\\Tehnologija\\Report\\KalkKosoReport	1	\N	2015-03-08 15:28:37	2015-03-08 15:28:37	\N	a:4:{s:4:"sync";b:1;s:3:"pdf";b:1;s:5:"print";b:0;s:2:"id";s:36:"0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f";}	\N	f	\N	\N
d800d555-6854-403a-9e9f-85373f6b828f	bedcb99b-3716-41b4-bb85-83637ca60c3c	Kalkulacijska kosovnica	\\Tehnologija\\Report\\KalkKosoReport	1	\N	2015-03-08 15:28:38	2015-03-08 15:28:38	\N	a:4:{s:4:"sync";b:1;s:3:"pdf";b:1;s:5:"print";b:0;s:2:"id";s:36:"0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f";}	\N	f	\N	\N
f467df53-c9ac-4379-842a-395a912441aa	bedcb99b-3716-41b4-bb85-83637ca60c3c	Kalkulacijska kosovnica	\\Tehnologija\\Report\\KalkKosoReport	1	\N	2015-03-08 15:29:25	2015-03-08 15:29:25	\N	a:4:{s:4:"sync";b:1;s:3:"pdf";b:1;s:5:"print";b:0;s:2:"id";s:36:"0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f";}	\N	f	\N	\N
fba12b49-8763-4621-8fcc-0234d1c4548f	bedcb99b-3716-41b4-bb85-83637ca60c3c	Kalkulacijska kosovnica	\\Tehnologija\\Report\\KalkKosoReport	2	\N	2015-03-08 15:29:42	2015-03-08 15:29:42	2015-03-08 15:29:44	a:4:{s:4:"sync";b:1;s:3:"pdf";b:1;s:5:"print";b:0;s:2:"id";s:36:"0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f";}	f	f	\N	\N
a8260fa2-c9f9-41e2-96aa-97a8f3e9a88e	bedcb99b-3716-41b4-bb85-83637ca60c3c	Kalkulacijska kosovnica	\\Tehnologija\\Report\\KalkKosoReport	2	\N	2015-03-08 17:27:05	2015-03-08 17:27:05	2015-03-08 17:27:07	a:4:{s:4:"sync";b:1;s:3:"pdf";b:1;s:5:"print";b:0;s:2:"id";s:36:"0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f";}	f	f	\N	\N
\.


--
-- TOC entry 3825 (class 0 OID 825667)
-- Dependencies: 185
-- Data for Name: job_datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job_datoteka (job_id, datoteka_id) FROM stdin;
fba12b49-8763-4621-8fcc-0234d1c4548f	a928a791-4fcb-4612-b575-b2e815d6e7b0
a8260fa2-c9f9-41e2-96aa-97a8f3e9a88e	6a4e1d08-6c89-483e-86d0-c7d1f8cd5633
\.


--
-- TOC entry 3826 (class 0 OID 825670)
-- Dependencies: 186
-- Data for Name: kakovostniprevzem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kakovostniprevzem (id, prevzeto, komentar, kolicina, upor, datknj, postavkanarocila_id) FROM stdin;
\.


--
-- TOC entry 3827 (class 0 OID 825678)
-- Dependencies: 187
-- Data for Name: kalkkoso; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kalkkoso (id, koncni_id, stevilka, datum, naziv, opis, provizija, vrednostmateriala, dodatekmateriala, odstotekmateriala, vrednostdela, dodatekdela, odstotekdela, vrednostdodelave, vrednostprevoza, lot, nastavitve, vrednostnastavitev, cenaizdelka, potrjen, aktivna, upor, datknj, dok_id) FROM stdin;
d9294d76-a20d-45ec-908b-d875ff053434	5b0938f5-a60f-40b2-94a6-495ac4cdec29	003546	2014-06-06	\N	PN-2014	0.00	46.6800	0.0000	0.00	11.0576	0.0001	0.00	0.0000	0.0000	120.000	8.6400	296.1018	67.4400	t	f	JOZEH	2014-06-06 06:54:00	d5933181-39c4-4ccb-b3c6-cc051765ea55
27767f63-b6f1-4d53-b00b-e47c3f33e6b9	c3ee5653-2a56-47a1-8daf-6230dfef28d8	003919	2014-09-02	\N	POPRAVILO LEDERER	0.00	1.0700	0.0000	0.00	0.0902	0.0000	0.00	1.0500	0.0000	2018.000	0.3000	0.0902	0.0000	t	t	NADZORNIK	2014-09-02 13:09:00	d5933181-39c4-4ccb-b3c6-cc051765ea55
c4e38cdc-ee1b-41c9-b165-028227fa5807	3c6f062a-ca22-4824-b125-405dd7aae10b	004065	2014-10-15	\N	OFFER 14/148-1	0.00	2.7100	0.0000	0.00	4.1578	0.0001	0.00	0.0000	157.0000	1000.000	5.0100	155.0747	0.0000	f	t	admin	2015-03-09 07:09:42	d5933181-39c4-4ccb-b3c6-cc051765ea55
4fcdf94e-8090-4ec3-8775-5aceedca346f	767b8e74-b6e9-4af0-98b0-8a847d935929	004024	2014-09-24	\N	KK1 - PN 2015	0.00	6.6000	0.0000	0.00	5.3361	1.6416	0.00	5.1500	0.0000	240.000	7.2000	262.0918	0.0000	f	t	admin	2015-03-09 07:58:34	d5933181-39c4-4ccb-b3c6-cc051765ea55
0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f	dec86cd0-9691-49ae-a985-f07e72c6784f	004039	2014-09-30	\N	DN 14/628-1, PO 83922	0.00	0.0200	0.0000	0.00	5.3282	0.3440	0.00	0.0000	35.0000	380.000	2.6000	82.3561	5.8800	f	t	admin	2015-03-11 12:32:33	d5933181-39c4-4ccb-b3c6-cc051765ea55
\.


--
-- TOC entry 3828 (class 0 OID 825700)
-- Dependencies: 188
-- Data for Name: klas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY klas (id, parent_id, skl_id, sifra, level, l0, l1, l2, l3, naziv, tipm, glomat, em, tarifa, konton, kontop, konto, nevrac, vizd, jerez, cats, komercialni, upor, datknj) FROM stdin;
9b0d0da8-23b0-4e1d-a271-0931462a64cc	\N	\N	5	0	9b0d0da8-23b0-4e1d-a271-0931462a64cc	\N	\N	\N	Poslovni partnerji	4	D	\N	\N	\N	\N	\N				\N	\N	console	2015-01-07 18:44:42
43c6db7e-02a3-4347-abda-b3108b6c0833	bbdab35f-fa7b-46b4-91f5-2b7c332d7870	7995c508-70bd-45c7-8d81-15d6a481badc	1108	3	1b66c2b0-0922-4142-971e-d0c6ced5b615	79d8a553-a350-4fb7-9d18-3fe06c3de758	bbdab35f-fa7b-46b4-91f5-2b7c332d7870	43c6db7e-02a3-4347-abda-b3108b6c0833	ODREZI IZ ALUMINIJA			KOM	D3	309000	400000	310000				7608 20 99	ALU CEVI	DAVOR	\N
d7d1bb6e-b48e-4dac-bd0d-2c72cb2c4715	78eab4fa-0b10-46c3-8ab6-67801df1b617	898e76e2-0656-494c-b609-a8ae993d21ed	219	2	d9baa32e-8937-4d71-8bf2-ea8c6459800d	78eab4fa-0b10-46c3-8ab6-67801df1b617	d7d1bb6e-b48e-4dac-bd0d-2c72cb2c4715	\N	ZUNAJ ZAŠČITENA, ODREZANA CEV				D3	490000	630000	602000						DAVOR	\N
1b66c2b0-0922-4142-971e-d0c6ced5b615	\N	7995c508-70bd-45c7-8d81-15d6a481badc	1	0	1b66c2b0-0922-4142-971e-d0c6ced5b615	\N	\N	\N	SUROVINE	M	D		D3	309000	400000	310000						BORIS	\N
0ade1f35-dcfb-49f5-8b2b-bf93d031e0d6	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	\N	706	2	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	0ade1f35-dcfb-49f5-8b2b-bf93d031e0d6	\N	ZUNANJE KOOPERACIJE				D3	3333		3333						DAVOR	\N
7453b33b-0f00-4a82-9eae-1e63ee41c18d	2428a7f3-5086-46d8-bb2e-9efff70f53d9	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	96	1	2428a7f3-5086-46d8-bb2e-9efff70f53d9	7453b33b-0f00-4a82-9eae-1e63ee41c18d	\N	\N	MERILA	3	D	KOM	D3	040009	050009	040009						SIMON	\N
802f95e7-7fbe-48bb-9469-a671f2435233	78eab4fa-0b10-46c3-8ab6-67801df1b617	898e76e2-0656-494c-b609-a8ae993d21ed	213	2	d9baa32e-8937-4d71-8bf2-ea8c6459800d	78eab4fa-0b10-46c3-8ab6-67801df1b617	802f95e7-7fbe-48bb-9469-a671f2435233	\N	ZUNAJ NASTRUŽENA, ODREZANA CEV				D3	490000	630000	602000						NADZO	\N
fb6984b9-66bc-49d8-b1ef-ebbb9582b569	fca6f7f8-9839-4c5d-93ed-173ba1625110	\N	7030	3	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	fca6f7f8-9839-4c5d-93ed-173ba1625110	fb6984b9-66bc-49d8-b1ef-ebbb9582b569	ZUNANJE STRUŽENJE Al-u CEVI				D3	3333		3333						KLAUD	\N
0b3ef834-40d3-4a9f-80a2-4f9a7b49fc4e	78eab4fa-0b10-46c3-8ab6-67801df1b617	898e76e2-0656-494c-b609-a8ae993d21ed	215	2	d9baa32e-8937-4d71-8bf2-ea8c6459800d	78eab4fa-0b10-46c3-8ab6-67801df1b617	0b3ef834-40d3-4a9f-80a2-4f9a7b49fc4e	\N	NASTRUŽENA S 2 STRANI, ODREZANA CEV				D3	490000	630000	602000						NADZO	\N
33d23a5e-742e-435b-afad-9187575f186a	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	\N	701	2	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	33d23a5e-742e-435b-afad-9187575f186a	\N	STRUŽENJE ODREZOV,RAZREZOV,ODKOVKOV,ODLITKOV				D3	3333		3333						DAVOR	\N
e205a18d-e5ee-4338-8471-f0cc02233069	61bf2de9-ba6c-4148-8176-b95a5a834be3	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	9545	3	2428a7f3-5086-46d8-bb2e-9efff70f53d9	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	61bf2de9-ba6c-4148-8176-b95a5a834be3	e205a18d-e5ee-4338-8471-f0cc02233069	STROJI ZA MONTAŽO	3	D	KOM	D3	040000	050000	040000			D			MAKS	\N
abd8146d-52a1-482f-a3f9-6bd45fa3e0d5	\N	c80a7e77-1b96-4476-b2ff-dddb4dfa315f	0	0	abd8146d-52a1-482f-a3f9-6bd45fa3e0d5	\N	\N	\N	KONČNI IZDELKI	G	S		D3		700000	630000						DAVOR	\N
90c75900-585a-4d5f-85ca-1428122a6cd7	78eab4fa-0b10-46c3-8ab6-67801df1b617	898e76e2-0656-494c-b609-a8ae993d21ed	214	2	d9baa32e-8937-4d71-8bf2-ea8c6459800d	78eab4fa-0b10-46c3-8ab6-67801df1b617	90c75900-585a-4d5f-85ca-1428122a6cd7	\N	NASTRUŽENA S 1 STRANI, ODREZANA CEV				D3	490000	630000	602000						NADZO	\N
9aa63bec-5a33-4fca-8063-4a6c3c0fe993	d7d1bb6e-b48e-4dac-bd0d-2c72cb2c4715	898e76e2-0656-494c-b609-a8ae993d21ed	2192	3	d9baa32e-8937-4d71-8bf2-ea8c6459800d	78eab4fa-0b10-46c3-8ab6-67801df1b617	d7d1bb6e-b48e-4dac-bd0d-2c72cb2c4715	9aa63bec-5a33-4fca-8063-4a6c3c0fe993	ZUNAJ ZAŠČITENI ALU CILINDRIČNI VALJ			KOM	D3	490000	630000	602000						DAVOR	\N
2428a7f3-5086-46d8-bb2e-9efff70f53d9	\N	\N	9	0	2428a7f3-5086-46d8-bb2e-9efff70f53d9	\N	\N	\N	DROBNI INVENTAR + OSNOVNA SREDSTVA		D		D3									IRENA	\N
f298d56e-21f5-4185-95cc-c7cc3027f5c1	0ade1f35-dcfb-49f5-8b2b-bf93d031e0d6	\N	7060	3	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	0ade1f35-dcfb-49f5-8b2b-bf93d031e0d6	f298d56e-21f5-4185-95cc-c7cc3027f5c1	POVRŠINSKA ZAŠČITA				D3	3333		3333						NADZO	\N
e02fdb0b-2186-48e9-b2bd-26c5ebdffabc	56d5c329-6adf-4248-bc21-7365343be3d3	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	9686	3	2428a7f3-5086-46d8-bb2e-9efff70f53d9	7453b33b-0f00-4a82-9eae-1e63ee41c18d	56d5c329-6adf-4248-bc21-7365343be3d3	e02fdb0b-2186-48e9-b2bd-26c5ebdffabc	TRIKOORDINATNE MERILNE PRIPRAVE	3	D	KOM	D3	040009	050009	040009			M			ALES	\N
56d5c329-6adf-4248-bc21-7365343be3d3	7453b33b-0f00-4a82-9eae-1e63ee41c18d	28a4c9cb-ae42-44d4-8aac-22104e9b9a61	968	2	2428a7f3-5086-46d8-bb2e-9efff70f53d9	7453b33b-0f00-4a82-9eae-1e63ee41c18d	56d5c329-6adf-4248-bc21-7365343be3d3	\N	MERILNE PRIPRAVE	3	D		D3	309000	404015	310005			M			SIMON	\N
c7740145-3576-4be5-a11d-ba57ce60a3f0	\N	18d94cf5-a87d-4671-bf80-1b441e95d8e1	7	0	c7740145-3576-4be5-a11d-ba57ce60a3f0	\N	\N	\N	TEHNOLOŠKA KOSOVNICA	S	S	KOM	D3	309000	404008	320000						KLAUD	\N
08e27fcb-7af0-49ff-b3ba-dad85812fdf3	802f95e7-7fbe-48bb-9469-a671f2435233	898e76e2-0656-494c-b609-a8ae993d21ed	2136	3	d9baa32e-8937-4d71-8bf2-ea8c6459800d	78eab4fa-0b10-46c3-8ab6-67801df1b617	802f95e7-7fbe-48bb-9469-a671f2435233	08e27fcb-7af0-49ff-b3ba-dad85812fdf3	ZUNAJ NASTRUŽEN ODREZAN ALU PROFIL			KOM	D3	490000	630000	602000						DAVOR	\N
cdb0442a-10fc-49c9-8e15-624eab30fda9	0b3ef834-40d3-4a9f-80a2-4f9a7b49fc4e	898e76e2-0656-494c-b609-a8ae993d21ed	2152	3	d9baa32e-8937-4d71-8bf2-ea8c6459800d	78eab4fa-0b10-46c3-8ab6-67801df1b617	0b3ef834-40d3-4a9f-80a2-4f9a7b49fc4e	cdb0442a-10fc-49c9-8e15-624eab30fda9	NASTRUZENI KRATKI KONEC CILINDRIČNEGA ALU VALJA			KOM	D3	490000	630000	602000						DAVOR	\N
a346ef87-c92c-4bfa-b3bf-c3dc7838fe90	33d23a5e-742e-435b-afad-9187575f186a	\N	7015	3	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	33d23a5e-742e-435b-afad-9187575f186a	a346ef87-c92c-4bfa-b3bf-c3dc7838fe90	STRUŽENJE NKK AL-u				D3	3333		3333						KLAUD	\N
0cc32b03-8ab3-41bb-9c35-0aa8ef7b8753	\N	898e76e2-0656-494c-b609-a8ae993d21ed	3	0	0cc32b03-8ab3-41bb-9c35-0aa8ef7b8753	\N	\N	\N	SKLOPI IZ POLIZ., KONČNIH IZD. IN KUPLJENIH DELOV	P	S		D3	490000	630000	602000						BORIS	\N
ea9b84b7-bec7-42ea-84ea-35a50878c37f	90c75900-585a-4d5f-85ca-1428122a6cd7	898e76e2-0656-494c-b609-a8ae993d21ed	2142	3	d9baa32e-8937-4d71-8bf2-ea8c6459800d	78eab4fa-0b10-46c3-8ab6-67801df1b617	90c75900-585a-4d5f-85ca-1428122a6cd7	ea9b84b7-bec7-42ea-84ea-35a50878c37f	NASTRUZENI DOLGI KONEC CILINDRIČNEGA ALU VALJA			KOM	D3	490000	630000	602000						DAVOR	\N
1edf2efe-21d4-46de-9180-9cd023da3750	33d23a5e-742e-435b-afad-9187575f186a	\N	7014	3	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	33d23a5e-742e-435b-afad-9187575f186a	1edf2efe-21d4-46de-9180-9cd023da3750	STRUŽENJE NDK AL-u				D3	3333		3333						KLAUD	\N
39c79d4c-1ecc-44c8-a3e6-ecaba4f17ea0	\N	c80a7e77-1b96-4476-b2ff-dddb4dfa315f	090	2	abd8146d-52a1-482f-a3f9-6bd45fa3e0d5	c923e640-d81d-4951-85c3-d8a101007972	39c79d4c-1ecc-44c8-a3e6-ecaba4f17ea0	\N	ALU IZDELKI				D3		700000	630000						NADZO	\N
01a99bea-5148-49c4-8f42-bb321935a6c7	5d855bac-6f53-4795-a769-a03441c1ed97	898e76e2-0656-494c-b609-a8ae993d21ed	2049	3	d9baa32e-8937-4d71-8bf2-ea8c6459800d	e083749f-3c20-4f0a-9247-e4c4ee73b6f7	5d855bac-6f53-4795-a769-a03441c1ed97	01a99bea-5148-49c4-8f42-bb321935a6c7	STRUŽENA 1.STRAN ODREZANE PALICE ZA LOHN POSEL			KOM	D3	490000	630000	602000						DAVOR	\N
910d892f-86cf-4520-9f69-99305251f311	33d23a5e-742e-435b-afad-9187575f186a	\N	7018	3	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	33d23a5e-742e-435b-afad-9187575f186a	910d892f-86cf-4520-9f69-99305251f311	STRUŽENJE ODREZOV IN RAZREZOV				D3	3333		3333						NADZO	\N
d1bf2a12-bd59-480c-8949-51f4e9d54dbb	27ce1b63-bf00-4938-a14c-bf8488b57221	898e76e2-0656-494c-b609-a8ae993d21ed	2009	3	d9baa32e-8937-4d71-8bf2-ea8c6459800d	e083749f-3c20-4f0a-9247-e4c4ee73b6f7	27ce1b63-bf00-4938-a14c-bf8488b57221	d1bf2a12-bd59-480c-8949-51f4e9d54dbb	ODREZANA DOLŽINA PALICE ZA LOHN POSEL			KOM	D3	490000	630000	602000						SIMON	\N
b224fd74-1b2e-451f-84c0-fe4b8e05e74e	39c79d4c-1ecc-44c8-a3e6-ecaba4f17ea0	c80a7e77-1b96-4476-b2ff-dddb4dfa315f	0900	3	abd8146d-52a1-482f-a3f9-6bd45fa3e0d5	c923e640-d81d-4951-85c3-d8a101007972	39c79d4c-1ecc-44c8-a3e6-ecaba4f17ea0	b224fd74-1b2e-451f-84c0-fe4b8e05e74e	REZANI, STRUŽENI			KOM	D3		700000	630000				8448 33 100	ALU OHIŠJA / DELI STROJEV	FMARJ	\N
d9baa32e-8937-4d71-8bf2-ea8c6459800d	\N	898e76e2-0656-494c-b609-a8ae993d21ed	2	0	d9baa32e-8937-4d71-8bf2-ea8c6459800d	\N	\N	\N	POLIZDELKI IZ SUROVINE	P	S		D3	490000	630000	602000						BORIS	\N
26353a0f-4cd7-4ef2-a962-ea30578ed4ec	044d5ff1-32e0-4f32-9e4a-54d60a9d9787	7995c508-70bd-45c7-8d81-15d6a481badc	1900	3	1b66c2b0-0922-4142-971e-d0c6ced5b615	ac848816-ad41-4fdd-91bc-cf49d6b98cd2	044d5ff1-32e0-4f32-9e4a-54d60a9d9787	26353a0f-4cd7-4ef2-a962-ea30578ed4ec	KARTONI,VREČKE,PENE			KOM	D3	309000	400002	310000						FMARJ	\N
044d5ff1-32e0-4f32-9e4a-54d60a9d9787	ac848816-ad41-4fdd-91bc-cf49d6b98cd2	7995c508-70bd-45c7-8d81-15d6a481badc	190	2	1b66c2b0-0922-4142-971e-d0c6ced5b615	ac848816-ad41-4fdd-91bc-cf49d6b98cd2	044d5ff1-32e0-4f32-9e4a-54d60a9d9787	\N	EMBALAŽA				D3	309000	400000	310000						DAVOR	\N
ac848816-ad41-4fdd-91bc-cf49d6b98cd2	1b66c2b0-0922-4142-971e-d0c6ced5b615	7995c508-70bd-45c7-8d81-15d6a481badc	19	1	1b66c2b0-0922-4142-971e-d0c6ced5b615	ac848816-ad41-4fdd-91bc-cf49d6b98cd2	\N	\N	EMBALAŽA,ČISTILNI IN VEZNI ELEMENTI				D3	309000	400000	310000						DAVOR	\N
e6746b26-4294-438b-b394-cce461c2c79f	044d5ff1-32e0-4f32-9e4a-54d60a9d9787	7995c508-70bd-45c7-8d81-15d6a481badc	1901	3	1b66c2b0-0922-4142-971e-d0c6ced5b615	ac848816-ad41-4fdd-91bc-cf49d6b98cd2	044d5ff1-32e0-4f32-9e4a-54d60a9d9787	e6746b26-4294-438b-b394-cce461c2c79f	KRPE,SILIKAGEL ZA PAKIRANJE			KG	D3	309000	400002	310000						SIMON	\N
548f8f43-18bf-44c4-a70b-211c2af13d8d	044d5ff1-32e0-4f32-9e4a-54d60a9d9787	7995c508-70bd-45c7-8d81-15d6a481badc	1902	3	1b66c2b0-0922-4142-971e-d0c6ced5b615	ac848816-ad41-4fdd-91bc-cf49d6b98cd2	044d5ff1-32e0-4f32-9e4a-54d60a9d9787	548f8f43-18bf-44c4-a70b-211c2af13d8d	NEPOVRATNE PALETE IN ZABOJI			KOM	D3	309000	400002	310000						FMARJ	\N
a58ebfa5-fca6-41cd-bcc7-ad380104cc4d	044d5ff1-32e0-4f32-9e4a-54d60a9d9787	7995c508-70bd-45c7-8d81-15d6a481badc	1904	3	1b66c2b0-0922-4142-971e-d0c6ced5b615	ac848816-ad41-4fdd-91bc-cf49d6b98cd2	044d5ff1-32e0-4f32-9e4a-54d60a9d9787	a58ebfa5-fca6-41cd-bcc7-ad380104cc4d	GUMICE			KG	D3	309000	400002	310000						SIMON	\N
ebbadce3-d4d9-42b1-9669-8ef9f0d64306	044d5ff1-32e0-4f32-9e4a-54d60a9d9787	7995c508-70bd-45c7-8d81-15d6a481badc	1905	3	1b66c2b0-0922-4142-971e-d0c6ced5b615	ac848816-ad41-4fdd-91bc-cf49d6b98cd2	044d5ff1-32e0-4f32-9e4a-54d60a9d9787	ebbadce3-d4d9-42b1-9669-8ef9f0d64306	RAZTEGLJIVA FOLIJA			KG	D3	309000	400002	310000						SIMON	\N
d225dfd1-1130-4fe2-883f-469ffd326d29	044d5ff1-32e0-4f32-9e4a-54d60a9d9787	7995c508-70bd-45c7-8d81-15d6a481badc	1906	3	1b66c2b0-0922-4142-971e-d0c6ced5b615	ac848816-ad41-4fdd-91bc-cf49d6b98cd2	044d5ff1-32e0-4f32-9e4a-54d60a9d9787	d225dfd1-1130-4fe2-883f-469ffd326d29	LEPILNI TRAKOVI,LEPILA,BARVE	M	D	KOM	D3	309000	400000	310000						NADZO	\N
563c6dad-29df-4ef7-a692-dcb6ead9373f	7bedf8f5-144a-485d-aef2-a70c1d6a468f	7995c508-70bd-45c7-8d81-15d6a481badc	1002	3	1b66c2b0-0922-4142-971e-d0c6ced5b615	36688ab7-a546-458a-b5dc-268087981730	7bedf8f5-144a-485d-aef2-a70c1d6a468f	563c6dad-29df-4ef7-a692-dcb6ead9373f	PALICE IZ AlZnMgCu 0.5/1.5			M	D3	309000	400000	310000					ALU PALICE	FMARJ	\N
7bedf8f5-144a-485d-aef2-a70c1d6a468f	36688ab7-a546-458a-b5dc-268087981730	7995c508-70bd-45c7-8d81-15d6a481badc	100	2	1b66c2b0-0922-4142-971e-d0c6ced5b615	36688ab7-a546-458a-b5dc-268087981730	7bedf8f5-144a-485d-aef2-a70c1d6a468f	\N	ALU PALICE				D3	309000	400000	310000						NADZO	\N
36688ab7-a546-458a-b5dc-268087981730	1b66c2b0-0922-4142-971e-d0c6ced5b615	7995c508-70bd-45c7-8d81-15d6a481badc	10	1	1b66c2b0-0922-4142-971e-d0c6ced5b615	36688ab7-a546-458a-b5dc-268087981730	\N	\N	PALICE				D3	309000	400000	310000						NADZO	\N
9834d79a-cdac-4eb2-890b-d1114ce46857	bbdab35f-fa7b-46b4-91f5-2b7c332d7870	7995c508-70bd-45c7-8d81-15d6a481badc	1102	3	1b66c2b0-0922-4142-971e-d0c6ced5b615	79d8a553-a350-4fb7-9d18-3fe06c3de758	bbdab35f-fa7b-46b4-91f5-2b7c332d7870	9834d79a-cdac-4eb2-890b-d1114ce46857	CEVI IZ DIN-AlZnMgCu0.5 F47 -1725/46/07-50049/3.1B			M	D3	309000	400000	310000				7608 20 99	ALU CEVI	SIMON	\N
bbdab35f-fa7b-46b4-91f5-2b7c332d7870	79d8a553-a350-4fb7-9d18-3fe06c3de758	7995c508-70bd-45c7-8d81-15d6a481badc	110	2	1b66c2b0-0922-4142-971e-d0c6ced5b615	79d8a553-a350-4fb7-9d18-3fe06c3de758	bbdab35f-fa7b-46b4-91f5-2b7c332d7870	\N	ALU CEVI				D3	309000	400000	310000						NADZO	\N
79d8a553-a350-4fb7-9d18-3fe06c3de758	1b66c2b0-0922-4142-971e-d0c6ced5b615	7995c508-70bd-45c7-8d81-15d6a481badc	11	1	1b66c2b0-0922-4142-971e-d0c6ced5b615	79d8a553-a350-4fb7-9d18-3fe06c3de758	\N	\N	CEVI-Dz-Dn				D3	309000	400000	310000						NADZO	\N
716bc84b-7eac-40b2-813d-1369cb457e60	30399ae5-9f9c-47d8-92d8-b5d8fed0e849	c80a7e77-1b96-4476-b2ff-dddb4dfa315f	0004	3	abd8146d-52a1-482f-a3f9-6bd45fa3e0d5	d4a9f008-a7e3-4400-a05a-7b82bcacebc4	30399ae5-9f9c-47d8-92d8-b5d8fed0e849	716bc84b-7eac-40b2-813d-1369cb457e60	VARJENA ALU ŠPULA 2 X			KOM	D3		700000	630000				7616 99 909	ALU TULCI	SIMON	\N
30399ae5-9f9c-47d8-92d8-b5d8fed0e849	d4a9f008-a7e3-4400-a05a-7b82bcacebc4	c80a7e77-1b96-4476-b2ff-dddb4dfa315f	000	2	abd8146d-52a1-482f-a3f9-6bd45fa3e0d5	d4a9f008-a7e3-4400-a05a-7b82bcacebc4	30399ae5-9f9c-47d8-92d8-b5d8fed0e849	\N	ALU ŠPULE				D3		700000	630000						NADZO	\N
d4a9f008-a7e3-4400-a05a-7b82bcacebc4	abd8146d-52a1-482f-a3f9-6bd45fa3e0d5	c80a7e77-1b96-4476-b2ff-dddb4dfa315f	00	1	abd8146d-52a1-482f-a3f9-6bd45fa3e0d5	d4a9f008-a7e3-4400-a05a-7b82bcacebc4	\N	\N	ŠPULE				D3		700000	630000						NADZO	\N
36e42c1f-1a64-4991-9a66-47d07f73c49c	2cb481cc-5a03-4d23-9695-2a27ee73ff82	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	9517	3	2428a7f3-5086-46d8-bb2e-9efff70f53d9	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	2cb481cc-5a03-4d23-9695-2a27ee73ff82	36e42c1f-1a64-4991-9a66-47d07f73c49c	AVT. PODAJALNE NAPRAVE	3	D	KOM	D3	040000	050000	040000						DAVOR	\N
2cb481cc-5a03-4d23-9695-2a27ee73ff82	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	951	2	2428a7f3-5086-46d8-bb2e-9efff70f53d9	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	2cb481cc-5a03-4d23-9695-2a27ee73ff82	\N	STRUŽNICE CNC	3	D		D3	040000	050000	040000						DAVOR	\N
6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	2428a7f3-5086-46d8-bb2e-9efff70f53d9	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	95	1	2428a7f3-5086-46d8-bb2e-9efff70f53d9	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	\N	\N	STROJI IN PROGRAMSKA OPREMA	3	D	KOM	D3	040000	050000	040000						MAKS	\N
5723775d-6d2e-46bc-9e6e-a1e5b81c4595	d4c82cae-e810-4cec-864a-1bc0b20a28da	\N	7099	3	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	d4c82cae-e810-4cec-864a-1bc0b20a28da	5723775d-6d2e-46bc-9e6e-a1e5b81c4595	POMOŽNE OPERACIJE				D3	3333								DAVOR	\N
d4c82cae-e810-4cec-864a-1bc0b20a28da	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	\N	709	2	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	d4c82cae-e810-4cec-864a-1bc0b20a28da	\N	POMOŽNE OPERACIJE				D3	3333		3333						NADZO	\N
0dc809a3-6e4a-41b4-9f5c-0b71479c73de	c7740145-3576-4be5-a11d-ba57ce60a3f0	\N	70	1	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	\N	\N	DELOVNE OPERACIJE				D3	3333		3333						KLAUD	\N
c2d51685-2f21-4350-b7c2-dd4fdaa68b91	0ab29f0f-895a-4b8d-a525-bee71966a957	898e76e2-0656-494c-b609-a8ae993d21ed	3400	3	0cc32b03-8ab3-41bb-9c35-0aa8ef7b8753	9f85c40f-d452-49f2-904b-f71044fafd6e	0ab29f0f-895a-4b8d-a525-bee71966a957	c2d51685-2f21-4350-b7c2-dd4fdaa68b91	WUCHTANE ŠPULE			KOM	D3	490000	630000	602000						NADZO	\N
0ab29f0f-895a-4b8d-a525-bee71966a957	9f85c40f-d452-49f2-904b-f71044fafd6e	898e76e2-0656-494c-b609-a8ae993d21ed	340	2	0cc32b03-8ab3-41bb-9c35-0aa8ef7b8753	9f85c40f-d452-49f2-904b-f71044fafd6e	0ab29f0f-895a-4b8d-a525-bee71966a957	\N	WUCHTANE ŠPULE				D3	490000	630000	602000						NADZO	\N
9f85c40f-d452-49f2-904b-f71044fafd6e	0cc32b03-8ab3-41bb-9c35-0aa8ef7b8753	898e76e2-0656-494c-b609-a8ae993d21ed	34	1	0cc32b03-8ab3-41bb-9c35-0aa8ef7b8753	9f85c40f-d452-49f2-904b-f71044fafd6e	\N	\N	BALANSIRANI,ČIŠČENI SKLOPI	P	S	KOM	D3	490000	630000	602000						DAVOR	\N
c2bfdb3a-9d34-4921-9397-24e1e5b15d9f	61bf2de9-ba6c-4148-8176-b95a5a834be3	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	9543	3	2428a7f3-5086-46d8-bb2e-9efff70f53d9	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	61bf2de9-ba6c-4148-8176-b95a5a834be3	c2bfdb3a-9d34-4921-9397-24e1e5b15d9f	STROJ ZA BALANSIRANJE	3	D	KOM	D3	040000	050000	040000			M			MAKS	\N
61bf2de9-ba6c-4148-8176-b95a5a834be3	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	954	2	2428a7f3-5086-46d8-bb2e-9efff70f53d9	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	61bf2de9-ba6c-4148-8176-b95a5a834be3	\N	VRTALNI STROJI IN STISKALNICE	3	D	KOM	D3	040000	050000	040000						NADZO	\N
16c0cc56-5963-48e7-8238-2fef97d5dad7	95e1ff67-482f-4e08-9987-c55ea937d30a	\N	7086	3	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	95e1ff67-482f-4e08-9987-c55ea937d30a	16c0cc56-5963-48e7-8238-2fef97d5dad7	BALANSIRANJE				D3	3333		3333						KLAUD	\N
95e1ff67-482f-4e08-9987-c55ea937d30a	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	\N	708	2	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	95e1ff67-482f-4e08-9987-c55ea937d30a	\N	MONTAŽNE OPERACIJE				D3	3333		3333						NADZO	\N
6c1687b2-6f1f-4635-bcd1-581cf26054b1	12262323-cde4-455d-bf70-69acb03afa75	898e76e2-0656-494c-b609-a8ae993d21ed	3206	3	0cc32b03-8ab3-41bb-9c35-0aa8ef7b8753	800056b1-9489-4604-b7e5-514101a51eae	12262323-cde4-455d-bf70-69acb03afa75	6c1687b2-6f1f-4635-bcd1-581cf26054b1	STRUZENJE NOTRI ŠPULE LAGER O/U ZAPORED			KOM	D3	490000	630000	602000						DAVOR	\N
12262323-cde4-455d-bf70-69acb03afa75	800056b1-9489-4604-b7e5-514101a51eae	898e76e2-0656-494c-b609-a8ae993d21ed	320	2	0cc32b03-8ab3-41bb-9c35-0aa8ef7b8753	800056b1-9489-4604-b7e5-514101a51eae	12262323-cde4-455d-bf70-69acb03afa75	\N	TORNO VARJENA ALU ŠPUL				D3	490000	630000	602000						NADZO	\N
800056b1-9489-4604-b7e5-514101a51eae	0cc32b03-8ab3-41bb-9c35-0aa8ef7b8753	898e76e2-0656-494c-b609-a8ae993d21ed	32	1	0cc32b03-8ab3-41bb-9c35-0aa8ef7b8753	800056b1-9489-4604-b7e5-514101a51eae	\N	\N	TORNO VARJENI SKLOPI				D3	490000	630000	602000						DAVOR	\N
d739acde-871d-4957-88ae-a0578483eef0	2cb481cc-5a03-4d23-9695-2a27ee73ff82	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	9510	3	2428a7f3-5086-46d8-bb2e-9efff70f53d9	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	2cb481cc-5a03-4d23-9695-2a27ee73ff82	d739acde-871d-4957-88ae-a0578483eef0	CNC STRUŽNICE IN OSOVINE	3	D	KOM	D3	040000	050000	040000						DAVOR	\N
c8f18e98-f770-47a1-8084-2ed42a3cb12d	232fafd2-72f4-46fb-bc21-ad3e47506687	\N	7044	3	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	232fafd2-72f4-46fb-bc21-ad3e47506687	c8f18e98-f770-47a1-8084-2ed42a3cb12d	NOTRANJE STRUŽENJE Al-u ŠPUL				D3	3333		3333						KLAUD	\N
232fafd2-72f4-46fb-bc21-ad3e47506687	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	\N	704	2	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	232fafd2-72f4-46fb-bc21-ad3e47506687	\N	NOTRANJE STRUŽENJE				D3	3333		3333						KLAUD	\N
8dbfb7f1-0e85-4e05-b385-272a0fcfeb56	8699e9de-1c6d-4ceb-85ca-0ecc68fd26f1	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	9500	3	2428a7f3-5086-46d8-bb2e-9efff70f53d9	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	8699e9de-1c6d-4ceb-85ca-0ecc68fd26f1	8dbfb7f1-0e85-4e05-b385-272a0fcfeb56	1 m STRUŽNICE KLASIČNE	3	D	KOM	D3	040000	050000	040000						DAVOR	\N
8699e9de-1c6d-4ceb-85ca-0ecc68fd26f1	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	950	2	2428a7f3-5086-46d8-bb2e-9efff70f53d9	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	8699e9de-1c6d-4ceb-85ca-0ecc68fd26f1	\N	STRUŽNICE KLASIČNE	3	D		D3	040000	050000	040000						DAVOR	\N
7fefc350-9384-435e-b221-e095638dd5b8	12262323-cde4-455d-bf70-69acb03afa75	898e76e2-0656-494c-b609-a8ae993d21ed	3202	3	0cc32b03-8ab3-41bb-9c35-0aa8ef7b8753	800056b1-9489-4604-b7e5-514101a51eae	12262323-cde4-455d-bf70-69acb03afa75	7fefc350-9384-435e-b221-e095638dd5b8	ZUNAJ STRUŽENA ALU ŠPULA			KOM	D3	490000	630000	602000						NADZO	\N
9849102b-7c0c-4645-a943-6b79267ebc40	fca6f7f8-9839-4c5d-93ed-173ba1625110	\N	7035	3	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	fca6f7f8-9839-4c5d-93ed-173ba1625110	9849102b-7c0c-4645-a943-6b79267ebc40	ZUNANJE STRUŽENJE Al-u ŠPULE				D3	3333		3333						KLAUD	\N
fca6f7f8-9839-4c5d-93ed-173ba1625110	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	\N	703	2	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	fca6f7f8-9839-4c5d-93ed-173ba1625110	\N	ZUNANJE STRUŽENJE				D3	3333		3333						KLAUD	\N
c987a433-6e29-49d3-bff9-3831f2564cb7	61bf2de9-ba6c-4148-8176-b95a5a834be3	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	9544	3	2428a7f3-5086-46d8-bb2e-9efff70f53d9	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	61bf2de9-ba6c-4148-8176-b95a5a834be3	c987a433-6e29-49d3-bff9-3831f2564cb7	SREDILNI STROJ	3	D	KOM	D3	040000	050000	040000			D			NADZO	\N
7f0389bb-ecc6-4ae7-8ec8-33451751c99a	d4c82cae-e810-4cec-864a-1bc0b20a28da	\N	7090	3	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	d4c82cae-e810-4cec-864a-1bc0b20a28da	7f0389bb-ecc6-4ae7-8ec8-33451751c99a	SREDINJENJE				D3	3333		3333						NADZO	\N
928f8acc-0c07-4b9c-8973-5dca7042e8ec	12262323-cde4-455d-bf70-69acb03afa75	898e76e2-0656-494c-b609-a8ae993d21ed	3207	3	0cc32b03-8ab3-41bb-9c35-0aa8ef7b8753	800056b1-9489-4604-b7e5-514101a51eae	12262323-cde4-455d-bf70-69acb03afa75	928f8acc-0c07-4b9c-8973-5dca7042e8ec	TORNO VARJENJE FLANČEV O/U ZAPORED			KOM	D3	490000	630000	602000						DAVOR	\N
058859d0-d87f-449f-98f7-de3250114940	1dde1340-880e-4dc8-a5f6-6dc64266aa69	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	9590	3	2428a7f3-5086-46d8-bb2e-9efff70f53d9	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	1dde1340-880e-4dc8-a5f6-6dc64266aa69	058859d0-d87f-449f-98f7-de3250114940	VARILNI STROJI	3	D	KOM	D3	040000	050000	040000			R			DAVOR	\N
1dde1340-880e-4dc8-a5f6-6dc64266aa69	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	\N	959	2	2428a7f3-5086-46d8-bb2e-9efff70f53d9	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	1dde1340-880e-4dc8-a5f6-6dc64266aa69	\N	DRUGI STROJI					040000	050000	040000						FMARJ	\N
a8a0ef55-6a3d-4d73-a6b8-6ac55611fd3a	a4fc527d-b579-4ced-935c-6964305aa859	\N	7020	3	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	a4fc527d-b579-4ced-935c-6964305aa859	a8a0ef55-6a3d-4d73-a6b8-6ac55611fd3a	VARJENJE Al-u ŠPULE				D3	3333		3333						KLAUD	\N
a4fc527d-b579-4ced-935c-6964305aa859	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	\N	702	2	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	a4fc527d-b579-4ced-935c-6964305aa859	\N	VARJENJE				D3	3333		3333						KLAUD	\N
28b50d32-1bdc-4fa4-a1fa-210a748f466d	5d855bac-6f53-4795-a769-a03441c1ed97	898e76e2-0656-494c-b609-a8ae993d21ed	2047	3	d9baa32e-8937-4d71-8bf2-ea8c6459800d	e083749f-3c20-4f0a-9247-e4c4ee73b6f7	5d855bac-6f53-4795-a769-a03441c1ed97	28b50d32-1bdc-4fa4-a1fa-210a748f466d	STRUZENI FLANČI ZA RS ŠPULE O/U ENAKA			KOM	D3	490000	630000	602000						DAVOR	\N
5d855bac-6f53-4795-a769-a03441c1ed97	e083749f-3c20-4f0a-9247-e4c4ee73b6f7	898e76e2-0656-494c-b609-a8ae993d21ed	204	2	d9baa32e-8937-4d71-8bf2-ea8c6459800d	e083749f-3c20-4f0a-9247-e4c4ee73b6f7	5d855bac-6f53-4795-a769-a03441c1ed97	\N	STRUŽENA S 1 STRANI, ODREZANA PALICA				D3	490000	630000	602000						NADZO	\N
e083749f-3c20-4f0a-9247-e4c4ee73b6f7	d9baa32e-8937-4d71-8bf2-ea8c6459800d	898e76e2-0656-494c-b609-a8ae993d21ed	20	1	d9baa32e-8937-4d71-8bf2-ea8c6459800d	e083749f-3c20-4f0a-9247-e4c4ee73b6f7	\N	\N	OBDELANE PALICE				D3	490000	630000	602000						NADZO	\N
c7971d2b-3020-4b6e-8d9a-68b37d8e18e9	61bf2de9-ba6c-4148-8176-b95a5a834be3	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	9541	3	2428a7f3-5086-46d8-bb2e-9efff70f53d9	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	61bf2de9-ba6c-4148-8176-b95a5a834be3	c7971d2b-3020-4b6e-8d9a-68b37d8e18e9	STEBERNI VRTALNI STROJI	3	D	KOM	D3	040000	050000	040000			V			MAKS	\N
41ad6e6c-f76e-460a-aa57-7dc324e0632c	d4c82cae-e810-4cec-864a-1bc0b20a28da	\N	7091	3	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	d4c82cae-e810-4cec-864a-1bc0b20a28da	41ad6e6c-f76e-460a-aa57-7dc324e0632c	GREZENJE				D3	3333		3333						NADZO	\N
12b02f4a-b140-4319-8df2-0bfdac1d38c6	27ce1b63-bf00-4938-a14c-bf8488b57221	898e76e2-0656-494c-b609-a8ae993d21ed	2007	3	d9baa32e-8937-4d71-8bf2-ea8c6459800d	e083749f-3c20-4f0a-9247-e4c4ee73b6f7	27ce1b63-bf00-4938-a14c-bf8488b57221	12b02f4a-b140-4319-8df2-0bfdac1d38c6	REZANI FLANČI ZA RS ALU ŠPULE			KOM	D3	490000	630000	602000						DAVOR	\N
27ce1b63-bf00-4938-a14c-bf8488b57221	e083749f-3c20-4f0a-9247-e4c4ee73b6f7	898e76e2-0656-494c-b609-a8ae993d21ed	200	2	d9baa32e-8937-4d71-8bf2-ea8c6459800d	e083749f-3c20-4f0a-9247-e4c4ee73b6f7	27ce1b63-bf00-4938-a14c-bf8488b57221	\N	REZANA PALICA NA DOLŽINO				D3	490000	630000	602000						NADZO	\N
0d321dc9-6f2e-4e7c-b734-83c631d0c2d5	02225479-90c5-4d8f-b17e-4c1017b98ad7	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	9560	3	2428a7f3-5086-46d8-bb2e-9efff70f53d9	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	02225479-90c5-4d8f-b17e-4c1017b98ad7	0d321dc9-6f2e-4e7c-b734-83c631d0c2d5	TRAČNA ŽAGA	3	D	KOM	D3	040000	050000	040000						MAKS	\N
02225479-90c5-4d8f-b17e-4c1017b98ad7	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	956	2	2428a7f3-5086-46d8-bb2e-9efff70f53d9	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	02225479-90c5-4d8f-b17e-4c1017b98ad7	\N	ŽAGE	3	D		D3	040000	050000	040000						DAVOR	\N
ce12eaad-6caa-47b7-a9b3-969d85802ea9	36dd7929-b4fb-4e17-8da5-bbbf48d17d17	\N	7001	3	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	36dd7929-b4fb-4e17-8da5-bbbf48d17d17	ce12eaad-6caa-47b7-a9b3-969d85802ea9	RAZREZI NA TŽ				D3	3333		3333						KLAUD	\N
36dd7929-b4fb-4e17-8da5-bbbf48d17d17	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	\N	700	2	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	36dd7929-b4fb-4e17-8da5-bbbf48d17d17	\N	OBDELAVA SUROVINE				D3	3333		3333						NADZO	\N
bdf5a205-28b5-4f8a-b63b-1ce1081adf1b	ae8139e5-3f69-46f3-b80c-ef68149a2241	898e76e2-0656-494c-b609-a8ae993d21ed	2100	3	d9baa32e-8937-4d71-8bf2-ea8c6459800d	78eab4fa-0b10-46c3-8ab6-67801df1b617	ae8139e5-3f69-46f3-b80c-ef68149a2241	bdf5a205-28b5-4f8a-b63b-1ce1081adf1b	ODREZANA CEV ZA RS-ALU ŠPULE			KOM	D3	490000	630000	602000						DAVOR	\N
ae8139e5-3f69-46f3-b80c-ef68149a2241	78eab4fa-0b10-46c3-8ab6-67801df1b617	898e76e2-0656-494c-b609-a8ae993d21ed	210	2	d9baa32e-8937-4d71-8bf2-ea8c6459800d	78eab4fa-0b10-46c3-8ab6-67801df1b617	ae8139e5-3f69-46f3-b80c-ef68149a2241	\N	REZANA CEV NA DOLŽINO				D3	490000	630000	602000						NADZO	\N
78eab4fa-0b10-46c3-8ab6-67801df1b617	d9baa32e-8937-4d71-8bf2-ea8c6459800d	898e76e2-0656-494c-b609-a8ae993d21ed	21	1	d9baa32e-8937-4d71-8bf2-ea8c6459800d	78eab4fa-0b10-46c3-8ab6-67801df1b617	\N	\N	OBDELANE CEVI				D3	490000	630000	602000						NADZO	\N
017d2a1d-331e-46a4-88a7-f33e563b9ad9	02225479-90c5-4d8f-b17e-4c1017b98ad7	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	9561	3	2428a7f3-5086-46d8-bb2e-9efff70f53d9	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	02225479-90c5-4d8f-b17e-4c1017b98ad7	017d2a1d-331e-46a4-88a7-f33e563b9ad9	KROŽNA ŽAGA	3	D	KOM	D3	040000	050000	040000						DAVOR	\N
4219a270-b6d0-479f-ab45-33a75ab51184	36dd7929-b4fb-4e17-8da5-bbbf48d17d17	\N	7000	3	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	36dd7929-b4fb-4e17-8da5-bbbf48d17d17	4219a270-b6d0-479f-ab45-33a75ab51184	RAZREZI NA KŽ				D3	3333		3333						KLAUD	\N
08d0fa25-5c14-4f3a-a46d-1155877658b4	d9baa32e-8937-4d71-8bf2-ea8c6459800d	c80a7e77-1b96-4476-b2ff-dddb4dfa315f	022	2	abd8146d-52a1-482f-a3f9-6bd45fa3e0d5	0222481d-48fb-423f-bd49-48ec8419c28b	08d0fa25-5c14-4f3a-a46d-1155877658b4	\N	ESAMBLIRANI VALJI				D3		700000	630000						DAVOR	\N
0f0b0e8d-4dd6-4846-a5f0-fd02ae83076f	ac848816-ad41-4fdd-91bc-cf49d6b98cd2	7995c508-70bd-45c7-8d81-15d6a481badc	192	2	1b66c2b0-0922-4142-971e-d0c6ced5b615	ac848816-ad41-4fdd-91bc-cf49d6b98cd2	0f0b0e8d-4dd6-4846-a5f0-fd02ae83076f	\N	VEZNI ELEMENTI			KOM	D3	309000	400000	310000						NADZO	\N
8d66efeb-8f20-406d-ae43-5b980ff16407	2428a7f3-5086-46d8-bb2e-9efff70f53d9	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	98	1	2428a7f3-5086-46d8-bb2e-9efff70f53d9	8d66efeb-8f20-406d-ae43-5b980ff16407	\N	\N	EMBALAŽA, NOTRANJI TRANSPORT, PISARNIŠKI INVENTAR	3	D	KOM	D3									IRENA	\N
7eaefb40-5f31-4f4b-9a78-65f1d33fbd6d	0cc32b03-8ab3-41bb-9c35-0aa8ef7b8753	898e76e2-0656-494c-b609-a8ae993d21ed	30	1	0cc32b03-8ab3-41bb-9c35-0aa8ef7b8753	7eaefb40-5f31-4f4b-9a78-65f1d33fbd6d	\N	\N	VPREŠANE BRIZGANE PLASTIKE				D3	490000	630000	602000						DAVOR	\N
04585d1f-1523-4178-83c1-6465796c39e1	95e1ff67-482f-4e08-9987-c55ea937d30a	\N	7080	3	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	95e1ff67-482f-4e08-9987-c55ea937d30a	04585d1f-1523-4178-83c1-6465796c39e1	PREŠANJE				D3	3333		3333						DAVOR	\N
17f489c5-7f2b-4cfd-95df-ea6edec39d41	fca6f7f8-9839-4c5d-93ed-173ba1625110	\N	7036	3	c7740145-3576-4be5-a11d-ba57ce60a3f0	0dc809a3-6e4a-41b4-9f5c-0b71479c73de	fca6f7f8-9839-4c5d-93ed-173ba1625110	17f489c5-7f2b-4cfd-95df-ea6edec39d41	ZUNANJE STRUŽENJE SPLOŠNO				D3	3333		3333						NADZO	\N
0b0ccc88-aac8-44c6-96d7-635329612154	61bf2de9-ba6c-4148-8176-b95a5a834be3	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	9542	3	2428a7f3-5086-46d8-bb2e-9efff70f53d9	6f4fa1ed-e925-4dcc-9c49-8bf07c061f3a	61bf2de9-ba6c-4148-8176-b95a5a834be3	0b0ccc88-aac8-44c6-96d7-635329612154	STISKALNICA  (PNEV.+ HIDRAVLIČNA)	3	D	KOM	D3	040000	050000	040000			V			MAKS	\N
083a68a1-ecd3-4f89-ac83-87a12445ea4c	5d855bac-6f53-4795-a769-a03441c1ed97	898e76e2-0656-494c-b609-a8ae993d21ed	2044	3	d9baa32e-8937-4d71-8bf2-ea8c6459800d	e083749f-3c20-4f0a-9247-e4c4ee73b6f7	5d855bac-6f53-4795-a769-a03441c1ed97	083a68a1-ecd3-4f89-ac83-87a12445ea4c	STRUŽENA 1STRAN DOLGEGA KONCA ZA VALJE			KOM	D3	490000	630000	602000						DAVOR	\N
4f34aa35-e828-4d9c-9a0c-37eff0ac061e	\N	7995c508-70bd-45c7-8d81-15d6a481badc	6	0	4f34aa35-e828-4d9c-9a0c-37eff0ac061e	\N	\N	\N	ORGANIZACIJA PO ISO 9001	1	D	KG	D3	3333		3333						DAVOR	\N
95e45a7f-3df4-4887-bc3a-fa41641265dd	08d0fa25-5c14-4f3a-a46d-1155877658b4	c80a7e77-1b96-4476-b2ff-dddb4dfa315f	0221	3	abd8146d-52a1-482f-a3f9-6bd45fa3e0d5	0222481d-48fb-423f-bd49-48ec8419c28b	08d0fa25-5c14-4f3a-a46d-1155877658b4	95e45a7f-3df4-4887-bc3a-fa41641265dd	ALUMINIJASTI ESAMBLIRANI VALJI			KOM	D3		700000	630000				9009 90 000	ALUMINIJASTI ESAMBLIRANI VALJI	SIMON	\N
7498c42d-397f-4586-82a6-dc9a9f3dc94e	0f0b0e8d-4dd6-4846-a5f0-fd02ae83076f	7995c508-70bd-45c7-8d81-15d6a481badc	1922	3	1b66c2b0-0922-4142-971e-d0c6ced5b615	ac848816-ad41-4fdd-91bc-cf49d6b98cd2	0f0b0e8d-4dd6-4846-a5f0-fd02ae83076f	7498c42d-397f-4586-82a6-dc9a9f3dc94e	LEŽAJI			KOM	D3	309000	400001	310000				8482	KROGLIČNI LEŽAJI	FMARJ	\N
11d58e80-b2d5-4915-a30a-b729901b482c	d77b043c-75fa-4156-83dc-a9e3e47649b7	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	9800	3	2428a7f3-5086-46d8-bb2e-9efff70f53d9	8d66efeb-8f20-406d-ae43-5b980ff16407	d77b043c-75fa-4156-83dc-a9e3e47649b7	11d58e80-b2d5-4915-a30a-b729901b482c	EUR-O BOKSI	3	D	KOM	D3	040007	050007	040007						FMARJ	\N
d77b043c-75fa-4156-83dc-a9e3e47649b7	8d66efeb-8f20-406d-ae43-5b980ff16407	ce7f0fa2-1995-419b-b9e9-137bcee1c37c	980	2	2428a7f3-5086-46d8-bb2e-9efff70f53d9	8d66efeb-8f20-406d-ae43-5b980ff16407	d77b043c-75fa-4156-83dc-a9e3e47649b7	\N	EMB. ZA NOT. TRANSPORT, SKLADIŠČENJE IN IDENTIF.	3	D		D3	040007	050007	040007						KLAUD	\N
c0cacb60-a165-455b-8b60-eecfc6bf2df4	5316ea8c-d858-42f1-b25e-16ce27c97d2d	898e76e2-0656-494c-b609-a8ae993d21ed	3065	3	0cc32b03-8ab3-41bb-9c35-0aa8ef7b8753	7eaefb40-5f31-4f4b-9a78-65f1d33fbd6d	5316ea8c-d858-42f1-b25e-16ce27c97d2d	c0cacb60-a165-455b-8b60-eecfc6bf2df4	1,2.STRAN-NAPREŠANI LEŽAJI NA/V VALJ			KOM	D3	490000	630000	602000						DAVOR	\N
5316ea8c-d858-42f1-b25e-16ce27c97d2d	7eaefb40-5f31-4f4b-9a78-65f1d33fbd6d	898e76e2-0656-494c-b609-a8ae993d21ed	306	2	0cc32b03-8ab3-41bb-9c35-0aa8ef7b8753	7eaefb40-5f31-4f4b-9a78-65f1d33fbd6d	5316ea8c-d858-42f1-b25e-16ce27c97d2d	\N	ESAMBLIRANJE VALJEV				D3	490000	630000	602000						DAVOR	\N
7b9ffb62-422b-4b41-a44f-a43b37edd260	5316ea8c-d858-42f1-b25e-16ce27c97d2d	898e76e2-0656-494c-b609-a8ae993d21ed	3066	3	0cc32b03-8ab3-41bb-9c35-0aa8ef7b8753	7eaefb40-5f31-4f4b-9a78-65f1d33fbd6d	5316ea8c-d858-42f1-b25e-16ce27c97d2d	7b9ffb62-422b-4b41-a44f-a43b37edd260	VPREŠANI KONCI VALJEV			KOM	D3	490000	630000	602000						DAVOR	\N
bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	6654c8ad-1967-499a-a7e2-74ed77e406ba	\N	6190	3	4f34aa35-e828-4d9c-9a0c-37eff0ac061e	e1b5ad72-05bd-41ef-ae01-6e33045f45ab	6654c8ad-1967-499a-a7e2-74ed77e406ba	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	ZAPOSLENI V LP MYCRON				D3									BORIS	\N
6654c8ad-1967-499a-a7e2-74ed77e406ba	e1b5ad72-05bd-41ef-ae01-6e33045f45ab	\N	619	2	4f34aa35-e828-4d9c-9a0c-37eff0ac061e	e1b5ad72-05bd-41ef-ae01-6e33045f45ab	6654c8ad-1967-499a-a7e2-74ed77e406ba	\N	QM-QM				D3									MARTI	\N
e1b5ad72-05bd-41ef-ae01-6e33045f45ab	4f34aa35-e828-4d9c-9a0c-37eff0ac061e	\N	61	1	4f34aa35-e828-4d9c-9a0c-37eff0ac061e	e1b5ad72-05bd-41ef-ae01-6e33045f45ab	\N	\N	ORGANIGRAM				D3	3333		3333						MARTI	\N
14c51583-5f82-4d2c-881f-1c04d63dcae6	3d3ae294-b8dc-47a3-ab08-f3d26a244773	\N	6180	3	4f34aa35-e828-4d9c-9a0c-37eff0ac061e	e1b5ad72-05bd-41ef-ae01-6e33045f45ab	3d3ae294-b8dc-47a3-ab08-f3d26a244773	14c51583-5f82-4d2c-881f-1c04d63dcae6	V-DFV-QS PROIZVODNJE				D3	3333		3333						MARTI	\N
3d3ae294-b8dc-47a3-ab08-f3d26a244773	e1b5ad72-05bd-41ef-ae01-6e33045f45ab	\N	618	2	4f34aa35-e828-4d9c-9a0c-37eff0ac061e	e1b5ad72-05bd-41ef-ae01-6e33045f45ab	3d3ae294-b8dc-47a3-ab08-f3d26a244773	\N	SLUŽBA KAKOVOSTI-QS				D3									MARTI	\N
04f5360b-246b-44ec-8751-9ebd35f40698	7fbaf260-14cb-4702-8800-794d53153103	\N	6152	3	4f34aa35-e828-4d9c-9a0c-37eff0ac061e	e1b5ad72-05bd-41ef-ae01-6e33045f45ab	7fbaf260-14cb-4702-8800-794d53153103	04f5360b-246b-44ec-8751-9ebd35f40698	TS-P-CNC STRUŽNICE				D3	3333		3333						MARTI	\N
7fbaf260-14cb-4702-8800-794d53153103	e1b5ad72-05bd-41ef-ae01-6e33045f45ab	\N	615	2	4f34aa35-e828-4d9c-9a0c-37eff0ac061e	e1b5ad72-05bd-41ef-ae01-6e33045f45ab	7fbaf260-14cb-4702-8800-794d53153103	\N	PROIZVODNJA-P				D3									MARTI	\N
6e9dee0d-e176-444e-8641-7d1b19c3f04f	6654c8ad-1967-499a-a7e2-74ed77e406ba	\N	6191	3	4f34aa35-e828-4d9c-9a0c-37eff0ac061e	e1b5ad72-05bd-41ef-ae01-6e33045f45ab	6654c8ad-1967-499a-a7e2-74ed77e406ba	6e9dee0d-e176-444e-8641-7d1b19c3f04f	ZUNANJI SODELAVCI V LP MYCRON				D3									BORIS	\N
775fe90b-5949-4975-bd28-2d43e3c094b2	7fbaf260-14cb-4702-8800-794d53153103	7995c508-70bd-45c7-8d81-15d6a481badc	6158	3	4f34aa35-e828-4d9c-9a0c-37eff0ac061e	e1b5ad72-05bd-41ef-ae01-6e33045f45ab	7fbaf260-14cb-4702-8800-794d53153103	775fe90b-5949-4975-bd28-2d43e3c094b2	TS-P-PROGRAMERJI	G	S	KOM	D3	3333		3333						MARTI	\N
c5277a22-75ae-46fd-aac7-147fd5e65426	7fbaf260-14cb-4702-8800-794d53153103	\N	6155	3	4f34aa35-e828-4d9c-9a0c-37eff0ac061e	e1b5ad72-05bd-41ef-ae01-6e33045f45ab	7fbaf260-14cb-4702-8800-794d53153103	c5277a22-75ae-46fd-aac7-147fd5e65426	TS-P-MONTAŽA				D3	3333		3333						MARTI	\N
41be114e-0d9f-448e-98fe-234aae77e820	7fbaf260-14cb-4702-8800-794d53153103	\N	6151	3	4f34aa35-e828-4d9c-9a0c-37eff0ac061e	e1b5ad72-05bd-41ef-ae01-6e33045f45ab	7fbaf260-14cb-4702-8800-794d53153103	41be114e-0d9f-448e-98fe-234aae77e820	TS-P-VARJENJE				D3	3333		3333						MARTI	\N
45324827-585d-4c9a-8450-182ee22ac94e	12262323-cde4-455d-bf70-69acb03afa75	898e76e2-0656-494c-b609-a8ae993d21ed	3208	3	0cc32b03-8ab3-41bb-9c35-0aa8ef7b8753	800056b1-9489-4604-b7e5-514101a51eae	12262323-cde4-455d-bf70-69acb03afa75	45324827-585d-4c9a-8450-182ee22ac94e	ELOXIRANI SKLOPI ŠPULE			KOM	D3	490000	630000	602000						DAVOR	\N
\.


--
-- TOC entry 3829 (class 0 OID 825715)
-- Dependencies: 189
-- Data for Name: kontekst; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontekst (id, uporabnik_id, kontekst, ime, global, auto, data) FROM stdin;
\.


--
-- TOC entry 3830 (class 0 OID 825721)
-- Dependencies: 190
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, popa_id, naslov_id, pozkose, naziv, dela, tel, fax, mobi, email, upor, datknj) FROM stdin;
3be16763-a73e-4111-8192-12899a1b3e88	a3a70ec8-47f5-4ef8-ae35-ab0d29b11284	\N	  2	Proizvodnja		02 818 20 19	02 818 20 89			NINA	\N
1614a01a-03f8-4ddc-9024-7f9641ba0e28	a3a70ec8-47f5-4ef8-ae35-ab0d29b11284	\N	  3	Centrala		02 844 35 70	02 818 20 89			NINA	\N
ea2ae2c5-ac5f-45b1-8a0f-6546193c07ad	a3a70ec8-47f5-4ef8-ae35-ab0d29b11284	\N	  4	Finance		02 844 35 72	02 818 20 89			NINA	\N
450dd24f-8a5b-41ae-988d-8a3d9944956c	a3a70ec8-47f5-4ef8-ae35-ab0d29b11284	\N	  5	Ga. Milena KOLAR	komerciala	02 844 35 75, 74	02 818 20 89		komerciala@msk.si	NINA	\N
f250682b-4afe-453d-9046-b5735fe2c174	a3a70ec8-47f5-4ef8-ae35-ab0d29b11284	\N	  6	Ga. Ida BRAČIČ	Finance	02 844 35 72			ida.bracic@msk.si	NINA	\N
806051ed-5539-4172-b7b0-55e71dbfe6c4	a3a70ec8-47f5-4ef8-ae35-ab0d29b11284	\N	  1	G. Srečko JUHART	Samostojni komercialist	02 844 35 70,8181614	02 818 20 89	041 681 571	srecko.juhart@msk.si	NINA	\N
b16f2bf4-d127-4cdc-8492-41ed96c5e0cb	8f2a808e-b1b3-4aa2-baeb-a929cae06131	\N	  1	G. Stopar	Komercialist		01 5373 287	041 698 186		DARIN	\N
0614e88d-3558-4bfc-9f19-644bc980b560	8f2a808e-b1b3-4aa2-baeb-a929cae06131	\N	  2	Skladišče Vrbljene		01 286 23 22				DARIN	\N
27c3c95b-6cd1-41b3-973c-3e59416e5c5e	8f2a808e-b1b3-4aa2-baeb-a929cae06131	\N	  3	G. Avramovič	Skladišče Ljubljana	01 561 22 21	01 537 33 19			DARIN	\N
a1b403d2-ece0-44be-ad94-746fd74ce3a4	8cc97f11-1004-45be-8736-6e11835799ab	\N	  1	G. Boris BULIČ		04 28 01 888	04 28 01 881	041 654 115		DARIN	\N
30cb20a0-36ec-4d6a-be0e-2161fa5e3542	3884a30d-8984-4b6c-a7e0-ba773e24ebad	\N	  3	G. Rudi KRANER	Prodajni zastopnik	+386 2 471 60 10	+386 2 471 60 13	+386 41 419 243	rudi.kraner@volja.net	NINA	2013-12-12 12:08:00
5edee875-84e7-4ab9-a455-730ab5dc9988	3884a30d-8984-4b6c-a7e0-ba773e24ebad	\N	  1	Ga. Vera LOVŠE	Veleprodaja	+386 2 471 60 10	+386 02 471 60 13		vera.lovse@mk-trgovina.si	NINA	\N
0b2495b3-4026-4b21-a4ec-d0e32496db00	3884a30d-8984-4b6c-a7e0-ba773e24ebad	\N	  2	G. Slavko GOLOVERŠNIK	komercialist	02 471 60 28			slavko.goloversnik@mk-trgovina.si	NINA	2013-10-29 10:50:00
ce7ed342-167d-4642-a35b-14071148e43f	36207b57-0450-4b91-9ebd-a16094f88653	\N	  1	Mr.Dejan HERVOL	Prodaja	040 515 922		040 515 922	dejan.hervol@kloeckner.at	VIDA	\N
1a2f94ec-630f-4b8e-8007-3fba50399248	36207b57-0450-4b91-9ebd-a16094f88653	\N	  2	Mrs.Sandra NOBIS		+43 6216 7730	+43 6216 7730 82		Sandra.Nobis@kloeckner.at	VIDA	\N
653c6f16-be59-465d-b08f-b55b53cd1789	1b16c29a-1ae8-41ad-92b9-2e357cf34b43	\N	  1	Mr.Rafal HOLEKSA	Export Department	+48 33 844 62 13	+48 33 844 6969		rholeksa@grupakety.com	VIDA	\N
f9d109b9-509a-4e32-8076-77da87af8eb2	1b16c29a-1ae8-41ad-92b9-2e357cf34b43	\N	  2	Mr. Alexander WITZKE	Export Department	+48 33 844 61 29	+48 33 844 69 69	+48 881 917 141	awitzke@grupakety.com	VIDA	\N
e6e6ff92-b67e-4f49-b99c-85fade3df0f0	8bf7f038-c672-4f36-9e6e-5cadbea62b06	\N	  2	Mr. Jacek ZIMOLAG	Plant Manager	+48 32 625 80 05		+48 601 273 380	jacek.zimolag@sapagroup.com	NINA	2014-04-01 14:11:00
93a03d41-9198-49e3-99b3-605ff133bd06	8bf7f038-c672-4f36-9e6e-5cadbea62b06	\N	  7	Mrs. Izabela BARUD					izabela.barud@sapagroup.com	NINA	2014-06-23 14:25:00
4b096600-d413-42fb-ab69-00cc3dfa53a5	8bf7f038-c672-4f36-9e6e-5cadbea62b06	\N	  1	Mrs. Monika  MINK	Sales Coordinator	+48 32 625 80 27	+48 32 625 80 30		monika.mink@sapagroup.com	NINA	\N
958852a2-8461-4004-9654-ef6110506758	8bf7f038-c672-4f36-9e6e-5cadbea62b06	\N	  2	Hr. Tomasz URBANSKI	Packing Manager	+48 32 625 8067	+48 32 625 8001	+48 695 70 70 38	tomasz.urbanski@hydro.com	NINA	\N
c1f84922-b3af-4a47-9929-84f2c68ee0ce	8bf7f038-c672-4f36-9e6e-5cadbea62b06	\N	  3	Fr. Agnieszka GRUSZCZYNSKA	Sales Coordinator	+48 32 625 80 23	+48 32 625 8030		agnieszka.gruszczynska@hydro.com	NINA	\N
c981137d-2549-46ec-9be6-447527b6c225	8bf7f038-c672-4f36-9e6e-5cadbea62b06	\N	  4	Mr. Marcin KAMINSKI	Quality Engineer	+48 32 625 80 69			marcin.kaminski@sapagroup.com	NINA	2014-04-01 14:11:00
d3d4a249-eddc-4bb4-8235-fcc89706b4d7	8bf7f038-c672-4f36-9e6e-5cadbea62b06	\N	  3	Mrs. Katarzyna PIEKARSKA	Internal Sales and Marketing M	+48 32 625 80 28		+48 605 666 454	katarzyna.piekarska@sapagroup.com	NINA	2014-04-01 14:11:00
d110ede7-16d2-45c2-b31d-8eeb106ce2b3	8bf7f038-c672-4f36-9e6e-5cadbea62b06	\N	  5	Mrs. Magdalena MULA	Accounting	+48 32 625 80 35	+48 32 625 80 60		magdalena.mula@sapagroup.com	NINA	2014-04-01 14:11:00
2209a57d-ee4f-4d2b-9355-ddc3e8fe5c4d	8bf7f038-c672-4f36-9e6e-5cadbea62b06	\N	  6	Mr. Grzegorz BISTA	Koordynator ds. logistyki	+48 32 625 80 41	+48 32 625 80 50		grzegorz.bista@sapagroup.com	NINA	2014-04-01 14:11:00
38335c59-cf27-46ef-9c94-29cbeb1b4090	962692fe-50c5-478c-83bc-f2d238348ab7	\N	  1	Boštjan BERGOČ	Direktor	01 500 30 30	01 519 70 70	041 620 561	zlindra@siol.net	VALER	\N
9c6c88b8-c621-4e95-afdf-59aec4550a74	073b22f7-3070-45d6-9df8-242d5df7e760	\N	  3	Hr. THOMA	Arbeitsvorbereitung/Leiter	+49 8461 6415-51	+49 8461 6415-64		Jochen.Thoma@biersack.de	NINA	\N
d8985079-6637-4068-88bd-2dba4df0dd90	073b22f7-3070-45d6-9df8-242d5df7e760	\N	  4	Hr. JAKSCH	Arbeitsvorbereitung	+49 8461 6415-51	+49 8461 6415-64			NINA	\N
25cd0565-a17c-49f4-8d8b-bb5b6c47c61b	073b22f7-3070-45d6-9df8-242d5df7e760	\N	  5	Hr. WAZNSCH	Qualitetsicherung	+49 8461 6415-52	+49 8461 6415-64			NINA	\N
b1cc65d5-d493-449c-933b-7c639d86a555	073b22f7-3070-45d6-9df8-242d5df7e760	\N	  6	Hr. WAGNER	Leitung Werk II	+49 8461 6415-56	+49 8461 6415-64			NINA	\N
7fe900e1-ab36-472a-91ca-04c20662dc1c	073b22f7-3070-45d6-9df8-242d5df7e760	\N	  7	Fr. BIERSACK	Buchhaltung	+49 8461 6415-13	+49 8461 6415-64			NINA	\N
db5b7e4f-f729-4b5f-9b87-43c790d4b081	073b22f7-3070-45d6-9df8-242d5df7e760	\N	  8	Fr. KRZEL	Buchhaltung	+49 8461 6415-11	+49 8461 6415-64			NINA	\N
a66c48c7-5e49-43f6-8584-576e27ebe2da	073b22f7-3070-45d6-9df8-242d5df7e760	\N	  2	Hr. Manfred BIERSACK	Kaufmennische Leitung/EDV	+49 8461 6415-17	+49 8461 6415-64		manfred.biersack@biersack.de	NINA	\N
8ec16b28-7c79-432d-a64e-c67ceb46af61	073b22f7-3070-45d6-9df8-242d5df7e760	\N	 13	Fr. Sabrina MUELLER	Beschaffung	+49 846 164 15 14	+49 846 164 15 64		sabrina.mueller@biersack.de	NINA	2014-04-11 13:26:00
5ecd71c9-1f77-4e06-a04d-2cd88029ca03	073b22f7-3070-45d6-9df8-242d5df7e760	\N	  9	Fr. Katharina GROSSHAUSER	Arbeitsvorbereitung	+49 8461 641 527	+49 8461 641 565		katharina.grosshauser@biersack.de	NINA	\N
98abd53a-eb19-47d8-8f67-7957a2f754c1	073b22f7-3070-45d6-9df8-242d5df7e760	\N	 10	Hr.Ludwig HAMBERGER		+49 8461 64 15 26			ludwig.hamberger@biersack.de	NINA	\N
c691c430-6e60-4678-9694-677b3545ef81	073b22f7-3070-45d6-9df8-242d5df7e760	\N	 11	Hr. Michael BIERSACK	Projektabwicklung	+49 8461 6415 59			michael.biersack@biersack.de	NINA	\N
31ec7fc5-c921-4410-9c16-0d4e3e837a00	073b22f7-3070-45d6-9df8-242d5df7e760	\N	  1	Hr. Karl-Heinz BIERSACK	technische Leitung/Angebote	+49 8461 641 516	+49 8461 641 566	+49 1718 656 881	karl-heinz.biersack@biersack.de	NINA	\N
b516a540-b449-4e37-9e07-95113ab07709	073b22f7-3070-45d6-9df8-242d5df7e760	\N	 12	Hr. Dominik BIERSACK	Geschaeftsleitung	+49 8461 64 15 12			dominik.biersack@biersack.de	NINA	2013-08-30 08:38:00
896eed73-47ef-4159-b7c4-bc0c0f96b22f	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 11	VHOD 37	Zahteve TAF	FAX:+31 77 3595364	+31 77 359 5313			NINA	\N
708b202f-3cb5-4353-8e53-0c2c51201f62	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 12	VHOD 37	Logistika	FAX:+31 77 3595334	+31 77 359 5313			NINA	\N
a6e8b9db-e2be-4a91-a4d6-8f2996bfb1c5	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	  8	VHOD 15/60	Zahteve TAF	FAX:+31 77 3595335	+31 77 359 5313			NINA	\N
1ae3530f-1186-4bdc-acf5-621ad205406a	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	  9	VHOD 15/60	Logistika	FAX:+31 77 3595415	+31 77 359 5313			NINA	\N
c463d25d-c5fc-4b8b-84c1-ae722a7c3bc3	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 10	VHOD 37	Poročilo o meritvah	FAX:+31 77 3595364	+31 77 359 5313			NINA	\N
ff05bd09-8d2a-4c5f-b416-42edbe128053	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 35	Fr. BECKERS	Export Administrator	+31 77 359 2132				NINA	\N
53406321-7cff-4506-b4f1-42a9c1b3e2bc	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 28	Ing. M.H. CARIS	Mechanical Engineering	+31 77 359 38 78	+31 77 359 54 71		mcar@oce.nl	NINA	\N
80df30ac-5fb9-4cd5-b34c-cca77423689b	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 29	Ing. Frank NOTTELMAN	Mechanical Engineering	+31 77 359 30 61	+31 77 359 54 71		fno@oce.nl	NINA	\N
22639f3e-f2e4-4943-a28b-e22bd202e430	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 21	Hr. Jac HUNNEKENS	Manufacturing & Quality Assura	+31 77 359 23 67	+31 77 359 53 76		jhu@oce.nl	NINA	\N
55f46825-23d4-43c9-baeb-d34c2249f36b	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 25	Hr. Wim AERDTS	Manufacturing & Quality Assura	+31 77 359 35 31	+31 77 359 53 74		wae@oce.nl	NINA	\N
aa0f55f2-f59f-4a94-9a86-55353eca7a49	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 26	Hr. Gregor KLEMENČIČ	Industrial Desing Department	+31 77 359 52 11	+31 77 359 53 37		gkle@oce.nl	NINA	\N
2d783e7c-a6e0-462f-927d-820a49d77919	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 23	Hr. Ir. I.H.W. SLITS	Mechanical Engineer	+31 77 359 36 60	+31 77 359 54 71		isli@oce.nl	NINA	\N
75f21b31-2aae-4e5f-9eb8-3a19b25224d4	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	  3	Hr. Frans MOELANDS	Quality Assurance	+31 77 359 38 14	+31 77 359 53 76		fmo@oce.nl	NINA	\N
aba66229-e219-4cab-82ea-97e603fc0857	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 32	Hr.Leon KETELSLEGERS	Purchasing Account Manager	+31 773 592 311		+31 641 596 680	leon.ketelslegers@oce.com	NINA	\N
23dec7bd-139e-44ae-b1d4-b3d845f89e2b	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 16	Ing. J.H.A. van der WIELEN	Manufacturing & Quality Assura	+31 77 359 47 74	+31 77 359 53 82		jvdw@oce.nl	NINA	\N
720a6e3f-8657-4685-8cf7-16a6df263312	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 34	Hr. Ir. Tjebbe M.C. SMIT	Purchasing Manager Machines	+31 77 359 44 47	+31 77 359 54 16		tsm@oce.nl	NINA	\N
f4a0475c-920d-4cc1-984c-4e3d0a38e636	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 36	Hr. John CLABBERS	Logistic Operator	+31 77 359 27 75	+31 77 359 54 54		jcl@oce.nl	NINA	\N
4432da95-04f4-4ce2-b173-b62fcbf61f30	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 20	Ing. Frank LOMMERS	Mechanical Engineering	+31 77 359 35 87	+31 77 359 54 71		fl@oce.nl	NINA	\N
09ecd75c-2d5e-4c67-8960-0f648a01be65	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 18	Hr. Jan LOMMEN		+31 77 359 43 49	+31 77 359 53 21			NINA	\N
275297b7-3966-41c8-bc86-4f56d6591b3c	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 39	Hr. Luc DIRCKS	Mechanical Engineering	+31 77 359 21 13	+31 77 359 54 77		luc.dircksŚoce.com	NINA	\N
b113377d-4561-4f69-b61e-c8b07a300cd3	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 45	Hr. Hans VAN LEUVEN	MQ Engineer DDS2 MQ	+31 77 359 28 11	+31 77 359 53 88	+31 6 536 856 18	hans.vanleuvenŚoce.com	NINA	\N
c268bb13-ee77-453a-af28-04f8d70a5d5e	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 46	Hr. Ing. Robert FLIETSTRA	Mechanical Engineering	+31 77 359 59 94	+31 77 359 54 71		robert.flietstraŚoce.com	NINA	\N
14ddfe1e-60b8-48ca-84d9-1cbe5cf3fe82	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 47	Fr. Ing. Judith SPEE	Mechanical Engineer	+31 77 359 57 67	+31 77 359 54 71		jspe@oce.nl	NINA	\N
a310f9ea-2cda-412e-b83a-7eb18c0d0ff3	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 48	Hr. Jan VERSTEGEN	Logistics Engineer	+31 77 359 23 90	+31 77 359 53 76		jfv@oce.nl	NINA	\N
4a2154c2-b81f-4c6f-9084-5f1b59dfff45	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 40	Hr. Peter HOUWEN	Manufacturing OAE & LM/ WFPS	+31 77 359 50 29	+31 77 359 53 64		phh@oce.nl	NINA	\N
9b816d55-1adb-404f-9fd3-d8df6759dbbe	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 42	Hr. Geert ROOX		+31 77 359 24 97	+31 77 359 54 08			NINA	\N
2d954c02-e2e2-4e8b-b4e4-bc218b7de444	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 44	Hr. Ir. Aloysius TAN	Manucfacturing & Quality	+31 77 359 31 29	+31 77 359 53 88		tan@oce.nl	NINA	\N
77edde72-d1c9-4827-b4cf-95d2332c1831	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 43	Hr. Norbert VAN REUTH	Medewerker Mechanical Eng.	+31 77 359 32 60	+31 77 359 54 77		reut@oce.nl	NINA	\N
6c906f0c-2e1a-49f6-8a1d-af14465860f2	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 41	Hr. K C LOO	Purchasing Manager	+65 6470 1500/1628	+65 6846 2387		kc.loo@oce.com.sg	NINA	\N
2b162af3-8cc8-4b9c-914c-878d637cb6fb	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 52	Hr. J.M.V. LOGISTER (Jos)	Products & Processes	+31 77 359 36 74	+31 77 359 54 77		jos.logister@oce.com	NINA	\N
06780e75-3342-44ab-89c5-c2f75ead32c8	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 50	Hr. Paul FRISSEN	Quality Engineer	+31 77 359 36 45	+31 77 359 49 12		paul.frissen@oce.com	NINA	\N
796edd85-139a-4c96-b906-37783c36bfc6	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 51	Hr. Math BROEREN	Purchaser	+31 77 359 33 20	+31 77 359 54 52		math.broeren@oce.com	NINA	\N
7ede3540-2cfd-4430-91ac-c0a76564910f	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 58	Hr. Mathijs VAN RENS	Manufacturing & Quality Ass.	+31 77 359 23 68	+31 77 359 53 74		thijs.vanrens@oce.com	NINA	\N
5f90ce00-21c6-498a-bb5b-9f801d37ef95	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 53	Hr.Ton ( A.J.M.) VAN GENT	Products & Processes	+31 77 359 34 09	+31 77 359 54 77		ton.vangent@oce.com	NINA	\N
396f8ef4-bbbd-4a0c-ad33-b2394e620f73	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 54	Hr. Arian BRAND	Mechanical Engineering	+31 77 359 44 79	+31 77 359 54 71		arian.brand@oce.com	NINA	\N
015b1ec0-6bd8-42af-a5f5-ea384f1af0cf	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 55	Hr. Lucas DE GROOT	Manufacturing & Quality	+31 77 359 42 20			lucas.degroot@oce.com	NINA	\N
b48625ce-4095-48c5-8056-a027d75b0e9e	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 57	Hr. Frans KUSTERS	Manufacturing & Quality Engin.	+31 77 359 23 54	+31 77 359 53 74		frans.kusters@oce.com	NINA	\N
72bc8d75-77fb-4f11-a0c7-cda897562d52	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 56	Fr. Simone VAN DEN BERCKEN	Opomini					NINA	\N
1f26fcd4-fff8-49e8-8c3d-a506f49a9177	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 60	Hr. Hans GOEDHART	Purchasing	+31 077 359 13 48	+31 077 359 53 10		hans.goedhart@oce.com	NINA	\N
e3a0407e-a44e-4549-9747-f450658854f6	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 59	Hr. Roger CREMERS	Logistics Engineer	+31 77 359 39 05	+31 77 359 54 15		roger.cremers@oce.com	NINA	\N
94bad788-ee9a-42ab-a8bc-93577f245741	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 62	Hr. Pieter VERSTEIJNEN	Purchasing Department	+31 773 59 60 12	+31 773 59 53 10		pieter.versteijnen@oce.com	NINA	\N
83d2fb0c-e68e-49f2-84d9-f28d23b717ec	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 63	Hr. John VOGELS	Logistics Planner	+31 77 359 44 53			john.vogels@oce.com	NINA	\N
b2c28862-79ff-437d-bda6-1e5dcce1aa4c	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 64	Hr. Istvan PENZES	Vodja financ				istvan.penzes@oce.com	NINA	\N
2ea27596-f196-4d25-bed2-24fadb4f2f81	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 65	Hr. Rene STEUNS	Vodja funkcij				rene.steuns@oce.com	NINA	\N
7a8591fc-ed88-437c-a6d8-f16646ad8b45	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 66	Fr. Linda JANSEN	Purchasing	+31773 593 774			Linda.Jansen@oce.com	NINA	\N
6263c131-b6fc-4324-869a-05ed1aff9b97	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 69	Hr. Susan DELSING		+31 773 593 774			susan.delsing@oce.com	NINA	\N
adf10009-c5c2-4568-9004-072d59357cee	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 68	Hr. Lodewijk VAN LIEMPD	Logistika	+31(0)77-3593132			lodewijk.vanliempd@oce.com	NINA	\N
80ecd6a7-0e31-4ed7-81f7-52b02b06ed9b	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 71	Hr. Hay JANSSEN	Mechanical Engineer	+31 77 359 33 30			hay.janssen@oce.com	NINA	\N
d8945993-674d-48a5-8362-a7f4f9517263	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 73	Hr. Mark WIERTS	MQ Engineer Machines & Logisti	+31 773 59 36 97			mark.wierts@oce.com	NINA	2013-02-01 09:25:00
59249400-6346-4a20-afc5-1fd698292046	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	  7	VHOD 15/60	Poročila o meritvah	FAX:+31 77 3595321	+31 77 359 5313			NINA	\N
b4292d8c-5209-46f6-a1e6-1d2de6df27f3	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 14	h						NINA	\N
87d0b8ad-44ad-4900-a904-aa30b38ede3b	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 15	Ing. E.P.A. DRIESSEN	Mechanical Engineering	+31 77 359 48 29	+31 77 359 54 71		epd@oce.nl	NINA	\N
693e6e48-6ebf-470e-a511-2a7c01e1d064	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 19	Hr. Leo LENDERS	Manufacturing&Quality Assuranc	+31 77 359 27 17	+31 77 359 5376			NINA	\N
6be9282d-a896-49b8-92c2-c79807f9aae7	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 22	Hr. Peter van DUIJNHOVEN	Manufactoring & Quality Assura	+31 77 359 34 60	+31 77 359 53 88		pvdu@oce.nl	NINA	\N
88d1c533-9251-4942-a7b9-5918d2b79141	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 30	Hr. Ir. Jan STOEVENBELT	Manufacturing&Quality Assuranc	+31 77 359 32 04	+31 77 359 53 88		stoe@oce.nl	NINA	\N
2f364c62-2b2a-4a74-a790-84c380dec36c	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 33	Hr. Peter BAETEN	QM  Granada 435	+31 77 359 31 73	+31 77 359 53 64		bae@oce.nl	NINA	\N
628737ad-4993-406f-958b-2b9f6ac4ddd5	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 37	Hr.Will  NELLEN	Konstrukteur - MATRIX PLATE	+31 77 359 28 85		+31 610 900 818	wil.nellen@oce.com	NINA	\N
c339dec7-7f92-4760-bc46-dfe85fd9334b	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 72	Hr. Emil SPEE	Purchasing Account Manager	+31 77 359 19 84	+31 77 359 53 10	+31 6 232 268 33	emil.spee@oce.com	NINA	\N
7f27eee9-8e6c-4e6f-abc2-75d7bbfcef2f	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	  2	Hr. Anton VAN HOREN	Purchasing Department	+31 77 359 23 24	+31 77 359 53 13			NINA	\N
d4162c80-96e7-47e8-9d3d-867cf7453483	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	  4	VHOD 2	Poročila o meritvah	FAX:+31 77 3595419	+31 77 359 53 13			NINA	\N
0e60f892-8985-4830-ba91-10edcfc2db14	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 13	Hr. H. BRAUER	Purchasing Department	+31 77 359 28 79	+31 77 359 53 10		henk.brauer@oce.com	NINA	\N
5e41e149-6e1b-4676-893c-17f6a27cbe29	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 27	Hr. Stefan HERMANS	Purchasing Department	+31 77 359 32 17	+31 77 359 53 10		stefan.hermans@oce.com	NINA	\N
eb73bfb6-0b2a-4535-ae80-5ea1f180fbb4	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	  6	VHOD 2	Logistika	FAX:+31 77 3595453	+31 77 359 5313			NINA	\N
57bd1c25-093f-4c7b-a5f5-f1ae0d16883a	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 17	Ing. Sten HILBERTS	Manufacturing & Quality Assura	+31 77 359 51 32	+31 77 359 53 82		thil@oce.nl	NINA	\N
9876a84f-ada9-4e0a-8f43-1e231f25df47	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 31	Hr. Sraar HENDERICKS	Mechanical Engineering	+31 77 359 43 63	+31 77 359 54 71		ghd@oce.nl	NINA	\N
0aede941-048e-43c8-9bd2-c3e60175b388	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 38	Hr. Piet GERRITS	Manufactur.&QS DDS-1 za056,405	+31 77 359 45 28	+31 77 354 53 74		gerr@oce.nl	NINA	\N
d925406e-017e-40f8-a104-693001679573	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 61	Hr. Marco COOLEN	Purchasing Director Machines	+31 077 359 23 22	+31 077 359 54 16		marco.coolen@oce.com         m	NINA	\N
93369117-5836-428f-a8b8-62ba010cb099	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 74	Hr. Kristian VAN CASTEREN	Logistics Engineer M&L Inbound	+31 77 359 20 78	+31 77 359 54 15		kristian.vancasteren@oce.com	NINA	2013-10-09 12:55:00
6c8b7862-b2b9-499e-925a-78c1b0cc2adf	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 75	Hr. Perry VAN DE VEN	MQ Engineer, M&L Machines/QA	+31 77 359 28 48			perry.vandeven@oce.com	NINA	2014-05-26 10:41:00
63ca2845-30d0-4d9a-a662-f37b1cf3140d	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	  5	b						NINA	\N
c821bcee-f0f1-4e0c-a5d6-0bba598fda45	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 70	Hr. Guido MOORE	Mechanical Engineer R&D	+31 77 359 5167	+31 77 359 5471		guido.moore@oce.com	NINA	\N
3d8fdb77-9eda-4aae-9f8c-d2f7271cb603	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	  1	Hr. Math BOUWENS	Purchaser Mechanical Parts	+31 77 359 28 92	+31 77 359 53 13		math.bouwens@oce.com	NINA	\N
c03cdb6b-2279-40a8-b0ce-9be4de14ef9e	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 24	Hr. Drs. Erik de VISSER	Manufacturing & Logistics Mach	+31 77 359 42 13	+31 77 359 54 15		ecdv@oce.nl	NINA	\N
4caacb95-7c3e-43b0-9c47-4560532c699d	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 49	Hr. Peter AERTS	Mechanical Engineer MD3,Resear	+31 77 359 45 68	+31 77 359 54 71		peter.wa.aerts@oce.com	NINA	\N
7d42bdb5-280c-4d06-9b74-fa311ef40bdc	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 67	Hr. Rens THIJSSEN	Logistics Engineer	+31(0)77 359 4209	+31(0)77 359 5300		rens.thijssen@oce.com	NINA	\N
516aa806-e3ca-46fb-9686-06a81083bdd0	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 76	Fr. Ankie BARTELET DE HAART	Medewerker accounts payable Fi	+31 77 359 25 45			ankie.bartelet-dehaart@oce.com	NINA	2014-09-03 10:41:00
83c38a4f-4e25-49ab-869f-acf5494fac10	28328b8d-0141-4a40-80b8-3c50ff505a9e	\N	 77	Hr. Nikola SCHWEIZER	Teamlead AP/AR/Banks, FSSC	+31 77 359 27 18	+31 77 359 54 08		nikola.schweizer@oce.com	NINA	2014-09-03 10:41:00
c7e82a28-b195-4a6e-adda-150d0befd13d	99ae9c63-dc9f-455d-b9ef-6c40f73019b1	\N	  1	G. Zdenko BERNHARD	direktor	02 779 81 21	02 773 04 51		zdenkoŽsimam-info.si	DARIN	\N
e97e260d-7e00-4fea-a013-1f0b7eb190f3	19e34484-e0b3-4814-8277-e8a50ea69100	\N	  1	Hr. ROLAND EMBERGER	LEITER PRODUKTENTWICKLUNG	+49 7331 20 06 0	+49 7331 20 06 29				\N
0074762c-fd9b-4c74-ad29-5b10b24248ff	19e34484-e0b3-4814-8277-e8a50ea69100	\N	  2	Hr. REINHOLD BANTLEON	PRODUKTIONSLEITER	+49 7331 20 06 36	+49 7331 20 06 29				\N
3bb21bea-7fb5-4ad1-89a8-80eda963daf4	19e34484-e0b3-4814-8277-e8a50ea69100	\N	  3	Hr. ERNST ZIMMERMANN	TECHN. BETRIEBSLEITER	+49 7331 20 06 0	+49 7331 20 06 29				\N
86f7a07e-757a-435e-93a0-e11dc8272ee6	81e90677-7b9a-4fd0-8045-45120d9c554a	\N	  5	G. Emil ŠEGA	Vodja komercialnega sektorja	062 811 048 PRIVAT	062 810 015		emil.sega@aha-emmi.si	NINA	\N
3e3446a4-2514-4a34-88f2-484d2e7496e4	81e90677-7b9a-4fd0-8045-45120d9c554a	\N	  4	G. Mihael SPINDLER		062 811 328 PRIVAT	062 810 015		mihael.spindler@aha-emmi.si	NINA	\N
8ff92e29-bf40-4d26-ac68-8151d00305f8	81e90677-7b9a-4fd0-8045-45120d9c554a	\N	  3	Ga. Darinka SOVINC	Komerciala prodaja	02 805 02 00	02 805 02 30		darinka.sovinc@aha-emmi.si	NINA	\N
5b728439-01e8-48bb-8168-7c1c517448a3	81e90677-7b9a-4fd0-8045-45120d9c554a	\N	  7	G. Damjan LESKOVAR		02 805 02 32		040 619 745	damjan.leskovar@aha-emmi.si	NINA	\N
db004d4a-0bed-4dd1-a034-4eb8f0379631	81e90677-7b9a-4fd0-8045-45120d9c554a	\N	  8	G. Matej JELENKO	Vodja službe kakovosti	02 805 02 50	02 805 02 30	041 866 514	matej.jelenko@aha-emmi.si	NINA	\N
38e5574c-540f-4600-8088-58cd380c7e82	81e90677-7b9a-4fd0-8045-45120d9c554a	\N	 10	G. Roman STEGNE					roman.stegne@aha-emmi.si	NINA	\N
03dd25f4-7f71-41d1-8c35-8f9c6e2d756c	81e90677-7b9a-4fd0-8045-45120d9c554a	\N	 11	G. Gregor JURAK	Vodja komercialnega sektorja	02 805 02 31	02 805 02 30	031 618 667	gregor.jurak@aha-emmi.si	NINA	\N
1a5e932c-f1c6-4bb0-86bb-c437e8c5546e	81e90677-7b9a-4fd0-8045-45120d9c554a	\N	 14	G. Uroš SKRIPAČ					uros.skripac@aha-emmi.si	NINA	\N
64bad580-8e38-4b3b-b4d6-2e7be90c8f72	81e90677-7b9a-4fd0-8045-45120d9c554a	\N	 13	Ga. Sandra DRAŠKOVIČ		02 805 02 63			sandra.draskovic@aha-emmi.si	NINA	\N
7b6105fa-e0d9-4eab-9b40-3bb3c2c9a8de	81e90677-7b9a-4fd0-8045-45120d9c554a	\N	 12	G. Andrej GOVEDIČ	Tehnična podpora	02 805 02 47			andrej.govedic@aha-emmi.si	NINA	\N
a8a78435-5f3c-4809-95d6-8405b5e15a07	81e90677-7b9a-4fd0-8045-45120d9c554a	\N	  1	Ga. Minka RAJH BRUMEC	Prodaja	+386 2 805 02 17	+386 2 805 02 30		minka.brumec@aha-emmi.si	NINA	\N
deb93b37-a35a-4fe4-b3bd-e2fd58948251	81e90677-7b9a-4fd0-8045-45120d9c554a	\N	  6	G. Gvido SMOLAR	Vodja tehničnega sektorja				gvido.smolar@aha-emmi.si	NINA	\N
ef03020f-caca-4bc8-a987-3cd80714ba63	81e90677-7b9a-4fd0-8045-45120d9c554a	\N	  9	G. Ivan KORENT	Vodja p.c. aluminij	02 805 02 33	02 805 02 30		ivan.korent@aha-emmi.si	NINA	\N
03c05200-6840-4571-8a07-01cf68c26df4	81e90677-7b9a-4fd0-8045-45120d9c554a	\N	 15	Ga. Jožica ŠPANINGER	Vodja finančnega sektorja	02 805 02 53		031 704 044	jozica.spaninger@aha-emmi.si	NINA	\N
50257055-5b09-49c2-b05a-d1741612a3cf	81e90677-7b9a-4fd0-8045-45120d9c554a	\N	 16	Ga. Darja ONIČ	Komerciala-sprejem naročil	02 80 50 246			salesservice@aha-emmi.si	NINA	\N
b0ecfeee-15d9-4838-8086-c7f49fa378d0	81e90677-7b9a-4fd0-8045-45120d9c554a	\N	  2	Ga. Silva BABŠEK	Direktorica komerciale/Commerc	+386 2 805 02 31	+386 2 805 02 30	+386 41 644 560	silva.babsek@aha-emmi.si	NINA	\N
09bb9357-b910-43ab-b13d-4b69c66632df	81e90677-7b9a-4fd0-8045-45120d9c554a	\N	 17	Ga. Polonca FRIDRIH	Vodja nabave	+386 2 805 02 16	+386 2 805 02 30	+386 31 533 228	polonca@aha-emmi.si	NINA	2014-02-07 07:46:00
71ef79fa-143f-4894-8c56-4add67f9827e	81e90677-7b9a-4fd0-8045-45120d9c554a	\N	 18	Ga. Petra ŠTEFANIČ	Prodaja	+386 2 805 02 61	+386 2 805 02 30	+386 41 339 644	petra.stefanic@aha-emmi.si	NINA	2015-01-09 12:46:00
b61af88f-c2a8-459a-8be8-ec9b253506f3	96ec7e31-1be6-402a-88b5-4c686b9d19b3	\N	  1	Hr. Harold BOUW	Najava prevozov	+31 77 389 2314	+31 389 22 00			NINA	\N
\.


--
-- TOC entry 3831 (class 0 OID 825730)
-- Dependencies: 191
-- Data for Name: koso; Type: TABLE DATA; Schema: public; Owner: -
--

COPY koso (id, maticna_id, parent_id, poz, stazaklj, datzak, kolicina, alternativa, statussinoptike, datumsinoptike, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3832 (class 0 OID 825735)
-- Dependencies: 192
-- Data for Name: kost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kost (id, kos_id, operacija_id, tehen_id, klient_id, delavec_id, poz, kdodela, stevdel, pripcas, opis, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3833 (class 0 OID 825743)
-- Dependencies: 193
-- Data for Name: kost_norme; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kost_norme (kosooper_id, norma_id) FROM stdin;
\.


--
-- TOC entry 3834 (class 0 OID 825746)
-- Dependencies: 194
-- Data for Name: lastnostlokacije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lastnostlokacije (id, sifra, naziv, upor, datknj) FROM stdin;
6f8efd8a-2770-4115-95b1-4230d9a14241	HLD	Hlajeno področje	console	2015-01-07 18:44:42
0f7b701d-10a3-4d19-8fbb-1e0b33f88aa7	VIL	Viličar na voljo	console	2015-01-07 18:44:42
61148bfe-dd3a-48fd-9535-2f48c8236bdb	POL	Polica	console	2015-01-07 18:44:42
3f3f8541-5a12-48b0-9543-61ffe6686be6	REG	Regal	console	2015-01-07 18:44:42
cebb4d35-524a-45a3-8df4-3450a6e6883e	SIL	Silos	console	2015-01-07 18:44:42
e7c42a8c-dd7d-4e36-895b-5ea89c5a5c9b	SKL	Skladiščni prostor	console	2015-01-07 18:44:42
c3552b03-87af-4859-9595-d43ef42e2e74	PRV	Prevzemni prostor	console	2015-01-07 18:44:42
68d9040f-6071-445f-8364-b8ca927ecd82	ODP	Odpremni prostor	console	2015-01-07 18:44:42
ea0d0e29-5c77-4632-9e92-e1035bfe3d74	VRT	Vrata	console	2015-01-07 18:44:42
de8198ed-ad0e-4d67-a761-689321cb598d	RMP	Nakladalna rampa za tovornjake	console	2015-01-07 18:44:42
\.


--
-- TOC entry 3835 (class 0 OID 825751)
-- Dependencies: 195
-- Data for Name: lokacije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lokacije (id, root_id, parent_id, isleaf, barcode, naziv, opis, vrsta, status, upor, datknj, privzetiprikaz_id) FROM stdin;
e5cd802f-719b-4d26-bfad-f7006a50d042	e5cd802f-719b-4d26-bfad-f7006a50d042	\N	f	00000000	Moje podjetje	Glavna lokacija podjetja	1	1	console	2015-01-07 18:44:43	\N
14e5e47b-05eb-4bb2-9386-f8e0a85d12e3	e5cd802f-719b-4d26-bfad-f7006a50d042	e5cd802f-719b-4d26-bfad-f7006a50d042	t	00000001	Vhod materialov	\N	2	1	console	2015-01-07 18:44:43	\N
f2ebe460-9ef6-4db9-b199-632413e2f2be	e5cd802f-719b-4d26-bfad-f7006a50d042	e5cd802f-719b-4d26-bfad-f7006a50d042	t	00000002	Skladišče materialov	\N	2	1	console	2015-01-07 18:44:43	\N
32e7b647-e33c-4573-9860-edf20c86e890	e5cd802f-719b-4d26-bfad-f7006a50d042	e5cd802f-719b-4d26-bfad-f7006a50d042	t	00000003	Odprema blaga	\N	2	1	console	2015-01-07 18:44:43	\N
\.


--
-- TOC entry 3836 (class 0 OID 825757)
-- Dependencies: 196
-- Data for Name: lokacije_lastnosti; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lokacije_lastnosti (lokacija_id, lastnostlokacije_id) FROM stdin;
\.


--
-- TOC entry 3837 (class 0 OID 825760)
-- Dependencies: 197
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
6a69eada-c91b-4412-9da7-2683837db1a3	\N	\N	Korenska mapa	2015-01-07 18:44:43	2015-01-07 18:44:43	R	console	2015-01-07 18:44:43
34e815f4-487f-4b11-8a83-d8718c7a0eda	\N	\N	Sistem	2015-01-07 18:44:43	2015-01-07 18:44:43	\N	console	2015-01-07 18:44:43
41ab55f2-2cca-4232-8e03-943e73905d82	\N	34e815f4-487f-4b11-8a83-d8718c7a0eda	Zemljevidi	2015-01-07 18:44:43	2015-01-07 18:44:43	R	console	2015-01-07 18:44:43
\.


--
-- TOC entry 3838 (class 0 OID 825766)
-- Dependencies: 198
-- Data for Name: mapa_datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_datoteka (mapa_id, datoteka_id) FROM stdin;
\.


--
-- TOC entry 3839 (class 0 OID 825769)
-- Dependencies: 199
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, skupina_id, dostop, upor, datknj) FROM stdin;
684d4064-bf1b-4f9c-922c-4d45b7f4f6dc	6a69eada-c91b-4412-9da7-2683837db1a3	5d37f8c4-0b78-471a-8da0-c2de3ae5859b	RWAD	console	2015-01-07 18:44:43
b4ab4073-36d1-4a99-9024-6e2a0bf6bce0	34e815f4-487f-4b11-8a83-d8718c7a0eda	5d37f8c4-0b78-471a-8da0-c2de3ae5859b	RWAD	console	2015-01-07 18:44:43
d9bc33e0-819a-4f17-aae6-45018fa81be2	41ab55f2-2cca-4232-8e03-943e73905d82	5d37f8c4-0b78-471a-8da0-c2de3ae5859b	RWAD	console	2015-01-07 18:44:43
\.


--
-- TOC entry 3840 (class 0 OID 825774)
-- Dependencies: 200
-- Data for Name: matt; Type: TABLE DATA; Schema: public; Owner: -
--

COPY matt (id, klasifikacija_id, podklasifikacija_id, klasdela_id, aktivna, sifra, naziv, pomozni, upor, datknj, tipsif, kratki, linija, sn, kvadratura, pripcas, akt, vrsta, skupina, jensl, jeizp, procentplaniranja, primoc, kalurpos, sifpla, inttel, aktiven, zaizpis, statusdel, cenaure, cenakom, jear, jeanl, jeakk, jencp, jepakiranje, jefiksnicas, fiksnicas, kajsklo, stasklo, em, status, tarddv, teza, cats, standard, viz, morack, tipm) FROM stdin;
5412de6c-529c-4577-a29c-67c110a21b11	36e42c1f-1a64-4991-9a66-47d07f73c49c	\N	\N	A	9517980003	PAKIRNICA	KVADRATURA 123 m2	JOZEH	\N	tehen	PAK	01		14.92	0.30	t	M	M		f	95.00	0.00	11.16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1ff96024-417c-4dd1-8007-fa305dbcd0ae	c2bfdb3a-9d34-4921-9397-24e1e5b15d9f	\N	\N	A	9543970001	WM BALANSIRNI STROJ M181-AUD2431	L1978-BALANSIRANJE	JOZEH	\N	tehen	WM	01		14.92	0.40	t	M	M	D	f	95.00	0.50	11.16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e0d03644-d34b-4a2c-9978-237d93c8cb7b	d739acde-871d-4957-88ae-a0578483eef0	\N	\N	A	9510970015	CNC-15 SL-150/No.573	L1997	JOZEH	\N	tehen	CNC-15	01	1	45.39	1.41	t	C	str	D	t	85.72	19.00	31.21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
39d77065-bb51-4787-91cc-81b2e3e3c180	8dbfb7f1-0e85-4e05-b385-272a0fcfeb56	\N	\N	A	9500970000	ROČNE OBDELAVE		JOZEH	\N	tehen	ROČNA	01		14.92	0.08	t	M	M		f	95.00	0.00	11.16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
097023fb-39a9-463b-bf25-29405e383c59	c987a433-6e29-49d3-bff9-3831f2564cb7	\N	\N	A	9544970001	SS SREDILNI STROJ		JOZEH	\N	tehen	SS	01		14.92	0.30	t	M	M	D	f	85.00	0.70	11.16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b4fc828d-48ac-41cc-8c3b-9e41514ca6e2	058859d0-d87f-449f-98f7-de3250114940	\N	\N	A	9590970001	RS TORNI VARILNI STROJ RS15		JOZEH	\N	tehen	RS-15	01		64.66	1.12	t	C	ost	D	t	86.37	40.00	29.11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a337fd2c-038f-4273-9805-202893bbb252	c7971d2b-3020-4b6e-8d9a-68b37d8e18e9	\N	\N	A	9541970004	SVS GB30VE-1508-GILARDON		JOZEH	\N	tehen	SVS-G	01		14.92	0.50	t	M	M	D	f	85.00	1.80	11.16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
afa895f0-9b1c-4324-a617-f6669c39e7b6	0d321dc9-6f2e-4e7c-b734-83c631d0c2d5	\N	\N	A	9560970001	TZ-270 HB		JOZEH	\N	tehen	TZ	01		46.46	0.20	t	Z	Z	D	f	90.00	7.00	36.38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
205d9e0e-ec3c-4619-9b64-89d5cf5f1c0a	017d2a1d-331e-46a4-88a7-f33e563b9ad9	\N	\N	A	9561970001	KZA-034 LMS	L1977-LMS II/034-17810	JOZEH	\N	tehen	KZ	01		30.88	0.17	t	M	M	D	f	90.00	5.00	11.16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15e6b593-dc80-49e4-8530-a98f11866a09	5723775d-6d2e-46bc-9e6e-a1e5b81c4595	\N	\N	A	7099990002	PO-KONTROLA + PAKIRANJE		ZVONK	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1.00	1.000000					D	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7e8742ca-cf04-4468-b7e8-1988d0e64266	5723775d-6d2e-46bc-9e6e-a1e5b81c4595	\N	\N	A	7099980007	PO-ETIKETIRANJE,ZAVIJANJE Z STREČ FOL.		DAVOR	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.000000					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f55b9878-f120-4e20-b648-13be5a02b865	16c0cc56-5963-48e7-8238-2fef97d5dad7	\N	\N	A	7086970001	BALANSIRANJE		KLAUD	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.000000					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
928ad152-b8e6-495c-9c32-fc63853f0c5c	c8f18e98-f770-47a1-8084-2ed42a3cb12d	\N	\N	A	7044970001	NOTRANJE STRUŽENJE Al-u ŠPUL		KLAUD	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.000000					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
902ad846-ec69-4a11-98e9-c075a2b2c62c	5723775d-6d2e-46bc-9e6e-a1e5b81c4595	\N	\N	A	7099980005	PO-PAKIRANJE		DAVOR	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.000000					D	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
bbf89b86-b7fa-405c-8571-1fdb7c171aba	9849102b-7c0c-4645-a943-6b79267ebc40	\N	\N	A	7035970001	ZUNANJE STRUŽENJE Al-u ŠPULE		KLAUD	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.000000					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
550596ee-b3a9-4472-a4ff-c5b959aff1ee	7f0389bb-ecc6-4ae7-8ec8-33451751c99a	\N	\N	A	7090970001	SREDINJENJE		NADZO	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.000000					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f8c5c819-4f50-4716-bdcb-4c4fd7a6abf3	a8a0ef55-6a3d-4d73-a6b8-6ac55611fd3a	\N	\N	A	7020970001	VARJENJE Al-u ŠPULE		KLAUD	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.000000					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
88af9fce-3468-4127-a3f6-d5d01f0b1eff	41ad6e6c-f76e-460a-aa57-7dc324e0632c	\N	\N	A	7091970001	GREZENJE		NADZO	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.000000					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
61ef3229-cbfa-4a3b-ba16-6c79722c3ee8	ce12eaad-6caa-47b7-a9b3-969d85802ea9	\N	\N	A	7001970001	RAZREZI NA TŽ		KLAUD	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.000000					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
896be847-cc72-422a-be66-d88f8dcbe101	4219a270-b6d0-479f-ab45-33a75ab51184	\N	\N	A	7000970001	RAZREZI NA KŽ		KLAUD	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.000000					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6ce0c380-ec67-4c64-8245-236715159d31	26353a0f-4cd7-4ef2-a962-ea30578ed4ec	\N	\N	A	1900970001	765-480-483	KVALITETA "3K"	VALERIJA	2013-08-07 12:25:00	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D1	1.935				D	M
ad729aa8-2672-43cb-8616-a8a2a2640917	e6746b26-4294-438b-b394-cce461c2c79f	\N	\N	A	1901970001	*400-400-400	KRPE-REGENERACIJA	DARIN	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KG		D3	0.000				D	M
0098f83c-8c63-464b-839d-26210de36b70	548f8f43-18bf-44c4-a70b-211c2af13d8d	\N	\N	A	1902970001	1200-800 Paleta		VALERIJA	2013-11-20 14:25:00	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	22.000				N	M
30566084-b545-458a-9eb7-78a3dafa61e7	a58ebfa5-fca6-41cd-bcc7-ad380104cc4d	\N	\N	A	1904970001	SATES 30/32x2mm	MALE GUMICE-RDEČE	DARIN	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KG		D3	0.000				N	M
595086ad-1eb0-4df6-8c43-de50a4515602	ebbadce3-d4d9-42b1-9669-8ef9f0d64306	\N	\N	A	1905970001	ROČNA STRECH FOLIJA 23MY 500MM		DARIN	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KG		D3	0.000				N	M
cc70af25-37c4-479b-89ef-242c0f373694	d225dfd1-1130-4fe2-883f-469ffd326d29	\N	\N	A	1906970001	SELOTEJP PROZOREN PP 48x66		DARIN	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				N	M
ad9787a2-d5f5-4664-9da1-97e0b6b2802d	563c6dad-29df-4ef7-a692-dcb6ead9373f	\N	\N	A	1002050003	80 AlZnMgCu 1.5 F51	ZA PLOŠ. RS ŠPUL+MATICE	DARINKA	2013-04-08 13:39:00	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	M		D1	13.974	76042910			D	M
989dce14-e801-46ff-8b39-80ce399c119f	9834d79a-cdac-4eb2-890b-d1114ce46857	\N	\N	A	1102970003	37,6-28,4	CEVI ZA RS ŠPULE	DARIN	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	M		D1	1.326	76082089			D	M
3c6f062a-ca22-4824-b125-405dd7aae10b	716bc84b-7eac-40b2-813d-1369cb457e60	\N	\N	A	0004000001	140-75-36-30 R2		ALENK	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D1	0.234	76169990			D	G
ea9a67c4-9933-4cae-a41c-4f08fb258926	c2d51685-2f21-4350-b7c2-dd4fdaa68b91	\N	\N	A	3400000002	WŠ-140-75-36-30 R2		FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM			0.000				D	P
776463f5-60be-4820-b796-30dd2ba66633	6c1687b2-6f1f-4635-bcd1-581cf26054b1	\N	\N	A	3206000002	140-75-36-30/30 ZAPORED	IZ RS ŠPULE	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM			0.000				D	P
90ae2d92-4304-4cc6-ac18-4e2a2459d3b2	7fefc350-9384-435e-b221-e095638dd5b8	\N	\N	A	3202000002	140-75-36-RS	140-75-36-36 R2	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM			0.000				D	P
a443c473-0347-4857-8e91-e3d8cc729e6c	928f8acc-0c07-4b9c-8973-5dca7042e8ec	\N	\N	A	3207050003	137-80-37,8 RS AlZnMgCu 1,5 F51	140-X-36-30 R2	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D1	0.000				D	P
f6551d60-fe63-4449-b515-e742484e4882	28b50d32-1bdc-4fa4-a1fa-210a748f466d	\N	\N	A	2047050003	ϕ80-8-ϕ40	AlZnMgCu 1,5 ZA FLANČE	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D1	0.000				D	P
bc9fe230-2361-4afd-afc9-ec7824e49f29	12b02f4a-b140-4319-8df2-0bfdac1d38c6	\N	\N	A	2007050003	80-8,0	AlZnMgCu 1,5 ZA FLANČE	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D1	0.000				D	P
9fbd7d57-47e9-441d-b032-d3fd9fe8b58e	bdf5a205-28b5-4f8a-b63b-1ce1081adf1b	\N	\N	A	2100970001	37,6-28,4-151	HUB 140mm AlZnMgCu 0,5	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D1	0.000				D	P
150bec91-e999-4a7c-a083-c7fb3e1f66be	f298d56e-21f5-4185-95cc-c7cc3027f5c1	\N	\N	A	7060100001	KROMIRANJE		MILAN	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	1.000000					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
38782643-df23-4004-b404-e66522e307ef	5723775d-6d2e-46bc-9e6e-a1e5b81c4595	\N	\N	A	7099980004	PO-IZDAJA ARTIKLOV NA DODELAVO		DAVOR	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.000000					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3e817a11-44e7-4c24-8ca1-102b5b0ed989	5723775d-6d2e-46bc-9e6e-a1e5b81c4595	\N	\N	A	7099980003	PO-KONTROLA		DAVOR	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.000000					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7618549d-0e96-46b1-8489-010246249839	fb6984b9-66bc-49d8-b1ef-ebbb9582b569	\N	\N	A	7030970001	ZUNANJE STRUŽENJE Al-u CEVI		KLAUD	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.000000					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
eca306b5-8fbf-44f6-9ded-d79661f9019a	a346ef87-c92c-4bfa-b3bf-c3dc7838fe90	\N	\N	A	7015970001	STRUŽENJE NKK AL-u		KLAUD	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.000000					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
fb0bc1aa-bb9b-48c8-b829-e4cac5130136	5723775d-6d2e-46bc-9e6e-a1e5b81c4595	\N	\N	A	7099050001	PO-PESKANJE		SRECK	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	23.00	23.000000					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
820a5ec9-b962-48b9-9f9f-876a9474cf33	1edf2efe-21d4-46de-9180-9cd023da3750	\N	\N	A	7014970001	STRUŽENJE NDK AL-u		KLAUD	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.000000					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2e31b671-0412-4258-9931-c0c6e83e58d1	e02fdb0b-2186-48e9-b2bd-26c5ebdffabc	\N	\N	A	9686070001	DEA - 3D GLOBAL PERFORMANCE 09.15.08	3D MERILNI STROJ	JOZEH	\N	tehen	DEA-1	01		0.00	0.50	t	D	D		t	90.00	0.00	36.33	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
84d5afa6-ddb1-4e22-a7b2-3911e91df836	d739acde-871d-4957-88ae-a0578483eef0	\N	\N	A	9510980001	CNC-16 SL-150/No.584	L1997	JOZEH	\N	tehen	CNC-16	03		42.41	1.40	t	C	str	D	t	86.67	42.00	31.21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d6928715-05a0-45d8-af04-e282b2716819	d739acde-871d-4957-88ae-a0578483eef0	\N	\N	A	9510970014	CNC-14 SL-150/No.479	L1997	JOZEH	\N	tehen	CNC-14	05	1	49.78	1.48	t	C	str	D	t	85.29	18.00	31.21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8c1dc211-b081-4820-a39b-f0309897a4ee	e205a18d-e5ee-4338-8471-f0cc02233069	\N	\N	A	9545050002	PESKALNIK BLAST 3 SOFTLINE/TZP 33 SX		SRECK	\N	tehen	PESKAN	16		20.00	0.50	t	M	M	D	t	95.00	6.00	11.16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f62c9914-442d-46a3-ac9e-97a58edde29c	43c6db7e-02a3-4347-abda-b3108b6c0833	\N	\N	A	1108100019	33,2-17,0-427,5 HAC18145	6060 T66 AlMgSi0,5 F22	DARIN	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.482	76042100			D	M
767b8e74-b6e9-4af0-98b0-8a847d935929	9aa63bec-5a33-4fca-8063-4a6c3c0fe993	\N	\N	A	2192110005	Cr-1000061099/07	OCE-1060124037/02 (038)	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				D	P
f35ac8ec-134f-4e54-908a-59169a99d9f1	08e27fcb-7af0-49ff-b3ba-dad85812fdf3	\N	\N	A	2136110005	SV-1000061099/07	OCE-1060124037/02 (038)	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				D	P
ec7c2886-e67a-43c8-9c2a-3b09b75fb196	cdb0442a-10fc-49c9-8e15-624eab30fda9	\N	\N	A	2152110003	NDK+NKK-1000061099/07	OCE-1060124037/02 (038)	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				D	P
0d90b520-3c00-4947-9bc1-e6a183c37c74	9aa63bec-5a33-4fca-8063-4a6c3c0fe993	\N	\N	A	2192050007	PE-1000061099/05,7	OCE-1060023171/03(170.461	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				D	P
efb21f62-1f5a-40ef-92bc-86b2862344db	cdb0442a-10fc-49c9-8e15-624eab30fda9	\N	\N	A	2152050008	NKK-1000061099/05,7 predstr.	OCE-1060023171/03(170.461	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				D	P
b66e80c6-eb53-408b-82d3-1b572e66aa2c	ea9b84b7-bec7-42ea-84ea-35a50878c37f	\N	\N	A	2142050006	NDK-1000061099/05,7 predstr.	OCE-1060023171/03(170.461	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				D	P
c140e80e-3650-4db9-9419-8784e4603d79	36e42c1f-1a64-4991-9a66-47d07f73c49c	\N	\N	A	9517990001	QS-KONTROLA	KVADRATURA ??? m2	JOZEH	\N	tehen	QS-K	03		87.04	0.10	t	o	N		f	95.00	0.00	11.16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
fc47bf9e-9f4b-4b3d-9432-9b64882a511f	d739acde-871d-4957-88ae-a0578483eef0	\N	\N	A	9510110002	CNC-25 STRUŽNICA DURA TURN 2050 Mc	MSX-504 (DT205KC0760)	JOZEH	\N	tehen	CNC-25	16	01	15.00	1.60	t	C	str	D	t	87.79	26.50	39.78	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
550d2e69-cdda-4f77-865b-9373beb5ff92	910d892f-86cf-4520-9f69-99305251f311	\N	\N	A	7018970001	STRUŽENJE ODREZOV IN RAZREZOV		NADZO	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.000000					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3ce91059-1c4b-49a6-853b-8895d5e2980e	26353a0f-4cd7-4ef2-a962-ea30578ed4ec	\N	\N	A	1900030002	IND. BRISAČA BELA 250-390mm	3838952012355	DARINKA	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				N	M
2b803331-0cbd-46df-bdcf-82c6a35b966d	26353a0f-4cd7-4ef2-a962-ea30578ed4ec	\N	\N	A	1900060008	425-305 vložek	KVALITETA "TRS/B=KŠ/B"	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				D	M
fe7f4103-a524-40be-9ba8-84c65478bde1	26353a0f-4cd7-4ef2-a962-ea30578ed4ec	\N	\N	A	1900970003	430-310-200	KVALITETA "2KŠ"	VALERIJA	2013-06-03 14:13:00	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.655				D	M
1692dd6f-dfa5-4190-88a0-27082c0d55a9	563c6dad-29df-4ef7-a692-dcb6ead9373f	\N	\N	A	1002110001	90 7075 T73; T7351	AlZnMgCu 1,5	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	M		D3	0.000	76042910			D	M
dec86cd0-9691-49ae-a985-f07e72c6784f	b224fd74-1b2e-451f-84c0-fe4b8e05e74e	\N	\N	A	0900110002	B-530208-001 Frame A350	Biersack	MARTI	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.023	88039090			D	G
9e5b4291-119e-477b-a70e-49232fa18164	01a99bea-5148-49c4-8f42-bb321935a6c7	\N	\N	A	2049110021	NDK-B-530208-001		FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				D	P
4aaa238e-efea-464b-aa7e-b84e03b200d5	d1bf2a12-bd59-480c-8949-51f4e9d54dbb	\N	\N	A	2009110011	ϕ90-25	B-530208	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				D	P
16cd68f0-b7ea-4ff8-a08f-bce170e35e0d	e205a18d-e5ee-4338-8471-f0cc02233069	\N	\N	A	9545030005	MONTAŽNA LINIJA 4	LINIJA RAZMAŠČEVANJA	JOZEH	\N	tehen	ML-4	15		14.92	0.50	t	M	M	D	f	95.00	0.00	23.58	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6471aa67-d6e4-4e1e-8ecd-f3019a3029ce	d739acde-871d-4957-88ae-a0578483eef0	\N	\N	A	9510980002	CNC-17 CL-25B	L1998	JOZEH	\N	tehen	CNC-17	01		44.77	1.21	t	C	str	D	t	87.93	36.00	31.21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1802ab66-fc41-4b48-bbcd-275349b90841	0b0ccc88-aac8-44c6-96d7-635329612154	\N	\N	A	9542970001	PP STISKALNICA PNEVMATSKA		JOZEH	\N	tehen	STI.P	01		14.92	0.60	t	M	M	D	f	85.00	1.30	11.16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
cc5716e0-6041-486b-8093-b09a78be0869	36e42c1f-1a64-4991-9a66-47d07f73c49c	\N	\N	A	9517980002	SKLADIŠČE SUROVINE		DAVOR	\N	tehen	SKL-M	01		1.00	0.00	t	o	N		f	0.00	0.00	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
01f03303-7d4d-4459-a077-a060d7dee7e8	04585d1f-1523-4178-83c1-6465796c39e1	\N	\N	A	7080970001	PREŠANJE		NADZO	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.000000					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14219006-80f4-4ee3-9c12-a6aa41543b6b	17f489c5-7f2b-4cfd-95df-ea6edec39d41	\N	\N	A	7036970001	ZUNANJE STRUŽENJE SPLOŠNO		NADZO	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.000000					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
26b45014-aa19-4cd6-b96b-74efb9d33a6c	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	\N	14c51583-5f82-4d2c-881f-1c04d63dcae6	A	6190980004	ARNUŠ DRAGICA		KLAUD	\N	delavec	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		N	N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ec6d2a28-bc38-4070-9488-f8f75a3b3848	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	\N	04f5360b-246b-44ec-8751-9ebd35f40698	A	6190050004	ŠTABUC MARJAN		ALES	\N	delavec	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		D	D	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
56eec53b-2c75-48de-a23b-ab46def9c829	6e9dee0d-e176-444e-8641-7d1b19c3f04f	\N	6e9dee0d-e176-444e-8641-7d1b19c3f04f	A	6191110030	KRAJNC ANA		KLAUD	\N	delavec	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		D	N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5ee2488f-295a-4c35-92b9-a8711237355e	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	\N	04f5360b-246b-44ec-8751-9ebd35f40698	A	6190980055	KOKOL TATJANA		KLAUD	\N	delavec	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		D	D	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6e089693-54b1-46fc-a582-a7b54a8fd3d1	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	\N	04f5360b-246b-44ec-8751-9ebd35f40698	A	6190980125	ZOREC RADOVAN		KLAUD	\N	delavec	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		D	D	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c9888a0a-b0d5-4d73-9681-862169c49706	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	\N	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	A	6190130003	KOROŠEC MARJANA		KLAUDIA	2013-06-04 09:09:00	delavec	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		D	D	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
31acb437-e866-4a28-a61c-f0d72808fe07	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	\N	775fe90b-5949-4975-bd28-2d43e3c094b2	A	6190000021	EMERŠIČ FRANC		KLAUD	\N	delavec	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		D	N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8e0750e5-1cf2-4bdd-b22b-00a5eb22f9b4	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	\N	c5277a22-75ae-46fd-aac7-147fd5e65426	A	6190980012	STAJNKO VINKO		KLAUD	\N	delavec	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		D	N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f97563c3-c3ef-4451-8e6f-63231af34c5c	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	\N	41be114e-0d9f-448e-98fe-234aae77e820	A	6190980114	POPUŠEK BOŠTJAN		KLAUD	\N	delavec	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		D	D	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ba46a2fa-50df-4b6e-84ba-2a6b2b30ca0a	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	\N	04f5360b-246b-44ec-8751-9ebd35f40698	A	6190980044	LAH DAVORIN		KLAUD	\N	delavec	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			D	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
247d57ed-7e02-4ac3-b60e-62bc44396c86	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	\N	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	A	6190070008	ŠKRLEC MATEJA		KLAUDIA	\N	delavec	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		D	N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
95ff938e-9e8f-413e-93bb-8f5ad9c77f6c	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	\N	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	A	6190110002	RORŠEK VIDA		KLAUD	\N	delavec	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		D	D	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
76d55b8c-48f1-4c6b-a652-80aa882e40d4	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	\N	04f5360b-246b-44ec-8751-9ebd35f40698	A	6190980067	FLORJANIČ ROMAN		KLAUD	\N	delavec	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		D	N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
bed3ad66-7fd9-4c1f-9281-1394b7d1f8ca	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	\N	c5277a22-75ae-46fd-aac7-147fd5e65426	A	6190980046	MARINIČ SLAVICA		KLAUD	\N	delavec	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		D	N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6cc52532-03ea-4d27-9674-89612359ca8b	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	\N	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	A	6190140014	JUS VANJA		KLAUDIA	2014-12-10 12:25:00	delavec	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5b0938f5-a60f-40b2-94a6-495ac4cdec29	95e45a7f-3df4-4887-bc3a-fa41641265dd	\N	\N	A	0221080001	OCE-1060068264/01	oce-1000097536/01	FMARJAN	2013-04-17 15:16:00	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	3.030	84439990			D	G
1faa7822-2116-4d07-8f0d-6d5690d05e3e	26353a0f-4cd7-4ef2-a962-ea30578ed4ec	\N	\N	A	1900080002	480-243-150 Notranja dim.	KVALITETA "TRSRT/BC"(757)	VALERIJA	2013-05-31 12:02:00	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.407				D	M
a4cfc97f-83be-4c8e-83d7-569b5ab36342	26353a0f-4cd7-4ef2-a962-ea30578ed4ec	\N	\N	A	1900080007	155-650 0,16mm PA/PE Vrečka	odprtina na 155mm	DARINKA	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				D	M
e80f5680-6c2d-41ea-9240-b6cef515bbd7	7498c42d-397f-4586-82a6-dc9a9f3dc94e	\N	\N	A	1922080001	oce-1000097519/1 61911-2Z-DIN620/C2-P5	OCE-1060068263/01 Sp.227	DARIN	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.185	84821090			D	M
7e5a1e5b-793d-4573-add3-9cad364b8474	43c6db7e-02a3-4347-abda-b3108b6c0833	\N	\N	A	1108100015	75,0-47,0-43 HAC18146	6060 T66 AlMgSi0,5 F22	DARIN	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.311	76082081			D	M
b0919598-bf06-492a-b3d9-4470bd60efe3	43c6db7e-02a3-4347-abda-b3108b6c0833	\N	\N	A	1108100008	81-40-422,5 HAC23581	6060 T66 AlMgSi0,5 F22	DARIN	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	2.777	76042100			D	M
6b2ebe89-5208-4170-af11-74f214a7e501	11d58e80-b2d5-4915-a30a-b729901b482c	\N	\N	A	9800970002	1200x800 EURO PALETA LESENA		VALERIJA	2013-09-25 11:05:00	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D1	22.000				D	3
769d4aa4-b6fb-41d0-aaa1-e9bfc94a8dd1	c0cacb60-a165-455b-8b60-eecfc6bf2df4	\N	\N	A	3065080002	NL-OCE-1000097536/01	OCE-1060068264/01	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				D	P
0a28e70c-41fa-44ed-872a-621745db5525	08e27fcb-7af0-49ff-b3ba-dad85812fdf3	\N	\N	A	2136060003	ϕ80-ϕ55m6-472,4 VIJAČNICA OCE-1000090084	OCE-1060047895/01 (894)	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				D	P
820ecbab-08a1-47e6-8cee-e6ad464a37c2	cdb0442a-10fc-49c9-8e15-624eab30fda9	\N	\N	A	2152060002	NKK-1000090084/02	OCE-1060047895/01	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				D	P
0582b3b4-4e35-4ad6-9a61-6b083d11acec	ea9b84b7-bec7-42ea-84ea-35a50878c37f	\N	\N	A	2142060001	NDK-1000090084/02	OCE-1060047895/01	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				D	P
5e618bda-58a1-4ccf-8f57-d9520d61f771	7b9ffb62-422b-4b41-a44f-a43b37edd260	\N	\N	A	3066060001	N2K-OCE-1000090084/02	OCE-1060047895/01	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				D	P
f1131225-bbd3-4119-a261-5edf14ae7301	083a68a1-ecd3-4f89-ac83-87a12445ea4c	\N	\N	A	2044050005	ϕ75-ϕ73m6-20-42,2 OCE-1000072335/03	OCE-1060026505/03	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				D	P
4ba32d29-fe3c-44cf-84e9-d2e27edbe103	cdb0442a-10fc-49c9-8e15-624eab30fda9	\N	\N	A	2152060003	NKK-1000090058/02	PROFIL-1000090044/01	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				D	P
37032156-6150-41a1-b0fb-70e273271c0a	ea9b84b7-bec7-42ea-84ea-35a50878c37f	\N	\N	A	2142060002	NDK-1000090058/02	PROFIL-1000090044/01	FMARJ	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				D	P
e247503a-aadb-4798-ad12-4cb22c0b18c0	5723775d-6d2e-46bc-9e6e-a1e5b81c4595	\N	\N	N	7099990001	PO-QS KONTROLA		admin	2015-01-26 20:11:59	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1.00	1.000000	N	N	N	N	D	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11b2c5b4-a5e4-4c7b-9ed3-cb2ac110397e	5723775d-6d2e-46bc-9e6e-a1e5b81c4595	\N	\N	A	7099980999	PO-IZDAJA SUROVINE		ALES	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.000000	N	N	N	N	D	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
80537ea0-e9a1-424f-aa72-0c1152ee1b90	f298d56e-21f5-4185-95cc-c7cc3027f5c1	\N	\N	A	7060970006	ELOXIRANJE		NADZO	\N	oper	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.000000					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e18c3cce-1542-49bd-8cdb-92e2fa787382	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	\N	bd35b1cf-c405-47dd-8c6e-ae22e32ddba2	A	6190140005	JUS VANJA		KLAUDIA	2014-05-27 12:15:00	delavec	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		N	N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c3ee5653-2a56-47a1-8daf-6230dfef28d8	716bc84b-7eac-40b2-813d-1369cb457e60	\N	\N	A	0004140001	140-73-36-30 R2 (NS)(BLACK ELOX.)		VALERIJA	2014-03-25 16:58:00	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.211	76169990			D	G
0f4cbc1e-0b18-49aa-b6f3-02618641f5af	e6746b26-4294-438b-b394-cce461c2c79f	\N	\N	A	1901100001	ODPADNI FILC 100g V ROLI-ŠIRINA 20cm	1m2=0,1Kg /1m=0,02Kg	DARINKA	\N	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KG		D3	0.000				N	M
19506682-9740-4cb7-94df-caf0cb1e6c19	716bc84b-7eac-40b2-813d-1369cb457e60	\N	\N	A	0004140005	140-73-36-30 R2 (NS)(NATUR ELOX.)		VALERIJA	2014-07-08 08:14:00	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.211	76169990			D	G
170845d8-2e55-4716-9210-1803a9c3af38	45324827-585d-4c9a-8450-182ee22ac94e	\N	\N	A	3208140003	ELOX.SCHWARZ-140-73-36-30/30 R2 iz natur	popravilo	FMARJAN	2014-08-20 13:08:00	artikel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	KOM		D3	0.000				D	P
\.


--
-- TOC entry 3841 (class 0 OID 825818)
-- Dependencies: 201
-- Data for Name: matz; Type: TABLE DATA; Schema: public; Owner: -
--

COPY matz (id, skl_id, sifra_id, zalzac, zaltre, zalinv, zaldob, zalsla, cenapla, cenazac, zneszac, datinv, status, datknj, upor) FROM stdin;
99776359-d054-449b-9c0e-6184eaff33ab	7995c508-70bd-45c7-8d81-15d6a481badc	3c6f062a-ca22-4824-b125-405dd7aae10b	100	100	0	0	0	0	1	100	\N	AK0	2015-03-19 12:59:21	admin
af4f6a15-a1d3-4efd-9851-d9f9c5990c2b	898e76e2-0656-494c-b609-a8ae993d21ed	3c6f062a-ca22-4824-b125-405dd7aae10b	100	100	0	0	0	0	1	100	\N	AK0	2015-03-19 12:59:33	admin
\.


--
-- TOC entry 3842 (class 0 OID 825835)
-- Dependencies: 202
-- Data for Name: nard; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nard (id, dok_id, klient_id, kontaktna_id, prejemnik_id, drzava_id, valuta_id, stevilka, ponudbadob, jezik, datumdogodka, datumponudbe, dniplacila, dnipotrditve, rabatprocent, rabatvrednost, text, tecaj, upor, datknj, naslovklienta_id, naslovprejemnika_id, statusnarocila, potrjen, vrednost, rabatvaluta, vrednostvaluta) FROM stdin;
\.


--
-- TOC entry 3843 (class 0 OID 825858)
-- Dependencies: 203
-- Data for Name: nark; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nark (id, dok_id, klient_id, prejemnik_id, drzava_id, valuta_id, stevilka, jezik, narocilokupca, datumdogodka, datumnarocila, vrednost, text, tecaj, upor, datknj, naslovklienta_id, naslovprejemnika_id, statusnarocila, kontaktna_id, potrjen, vrednostvaluta) FROM stdin;
\.


--
-- TOC entry 3844 (class 0 OID 825871)
-- Dependencies: 204
-- Data for Name: nasl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nasl (id, maticna_id, oper_id, tehen_id, opis, stansl, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3845 (class 0 OID 825879)
-- Dependencies: 205
-- Data for Name: nastavitve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nastavitve (id, user_id, namespace, name, value) FROM stdin;
\.


--
-- TOC entry 3846 (class 0 OID 825885)
-- Dependencies: 206
-- Data for Name: nastavni_sklopi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nastavni_sklopi (nastavni_id, sklop_id) FROM stdin;
\.


--
-- TOC entry 3847 (class 0 OID 825888)
-- Dependencies: 207
-- Data for Name: norme; Type: TABLE DATA; Schema: public; Owner: -
--

COPY norme (id, tip, datdog, norma, ts, tm, mi, opomba, upor, datknj) FROM stdin;
8662b838-85d1-4871-9197-0f00a749675f	5	2014-11-20	50.704	51.00	20.00	1.00		JOZEH	2014-11-21 07:33:00
d0def767-6efc-4ff6-a135-986b0cd31097	5	2014-11-24	30.769	102.00	15.00	1.00		JOZEH	2014-11-27 10:47:00
fdb62830-1375-4949-b304-5e18ba869d24	5	2014-11-25	30.769	102.00	15.00	1.00		JOZEH	2014-11-27 10:47:00
a1271dec-9c37-4cb2-9f77-8cf84cdc9d0f	5	2014-11-25	71.856	50.00	0.10	1.00		JOZEH	2014-11-27 10:47:00
41fb80cf-8612-44bc-8003-ae342a37701b	5	2014-11-25	55.385	50.00	15.00	1.00		JOZEH	2014-11-27 10:47:00
a02f73ab-3a04-4a63-9552-0b2f3eaa7cb8	5	2014-11-25	55.385	50.00	15.00	1.00		JOZEH	2014-11-27 10:47:00
a9b5d1e9-8402-4936-88d8-59d1e385dd0f	5	2014-11-27	11.215	310.00	11.00	1.00		JOZEH	2014-11-28 07:27:00
07e8363f-87e1-4592-bbaf-faeb3a894401	5	2014-11-28	10.682	326.00	11.00	1.00		JOZEH	2014-12-03 10:01:00
a6fedb76-6200-405d-8b40-79ed3b4df304	5	2014-11-28	28.324	127.00	0.10	1.00		JOZEH	2014-12-03 10:08:00
\.


--
-- TOC entry 3848 (class 0 OID 825896)
-- Dependencies: 208
-- Data for Name: odst; Type: TABLE DATA; Schema: public; Owner: -
--

COPY odst (id, sifra, naziv, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3849 (class 0 OID 825900)
-- Dependencies: 209
-- Data for Name: operacija_tehen; Type: TABLE DATA; Schema: public; Owner: -
--

COPY operacija_tehen (operacija_id, tehen_id) FROM stdin;
\.


--
-- TOC entry 3850 (class 0 OID 825903)
-- Dependencies: 210
-- Data for Name: paketiproduktov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY paketiproduktov (id, embalaza_id, parent_id, dobava_id, lokacija_id, status, barcode, caspakiranja, caszapakiranja, casdobave, kolicina, caspremika, popis, upor, datknj, alienparent_id) FROM stdin;
8af640f2-0588-477c-8c3d-2c711c87cc72	24560481-053b-4524-a560-48114dc52456	\N	\N	\N	2	P26400016	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
8b940383-13b0-413e-9f32-c8f8153e3e82	24560481-053b-4524-a560-48114dc52456	\N	\N	\N	2	P26400017	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
22b3ed20-840e-4d98-a4af-aa7857fb0c22	24560481-053b-4524-a560-48114dc52456	\N	\N	\N	2	P26400018	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
78f706a2-151f-4de2-91ad-0a4702887c88	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400182	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
88352f30-68cb-4967-a622-37ad88c571e3	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400183	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
17810c7b-1fa0-49a9-b6dc-ad1196f13698	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400184	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
73743fa2-ed57-49ed-9dc1-421942d015d4	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400185	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
92446a25-f397-4ce8-a3ad-19e14dcca7c2	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400186	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
e0f15c62-ffc3-45ec-b579-1af69de0d6ca	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400187	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
b43333dc-c86a-4b68-9c9f-70c41f487cd2	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400188	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
0be7c8d8-ffd9-4c0b-bf99-231d5a51d68b	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400189	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
953ecfbd-4cff-4ac4-bd3e-4954a862ec2d	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400190	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
7e3ce725-aef1-4948-912d-dd7390cbc442	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400191	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
13cda1e5-01bb-451f-a10e-6d5a10c760e0	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400192	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
eb50cfbb-9a3d-481b-9f5e-9443c4dd45ae	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400193	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
a1c84a96-86ce-44cc-851b-075679b22aaf	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400194	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
cfb2a23d-fe8e-42a6-bf7b-e17c60b6e081	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400195	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
73f33d5f-2306-44e6-ac4d-147d9db9b379	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400196	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
9549d613-a948-497b-b91c-ca2aba5f3f00	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400197	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
c03cd58d-f41a-495d-beac-fa7d9f4923b7	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400198	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
abb89436-6422-49a4-81c9-5e14ccf628ac	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400199	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
8d17bd53-438e-45a7-8915-2a54b2bd580d	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400200	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
073ccb6e-8cec-4155-994e-6cd6ae5a066c	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400201	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
6cfd24fb-ff5a-4222-b94c-f2d5b283a6b9	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400202	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
1369f2b5-9ee0-4d2b-ad0c-077def3d1338	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400203	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
3f70f69d-a96b-494d-b1bb-1302b7defcd4	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400204	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
2fa57e5b-d7ff-4fde-9116-fafef223f0cb	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400205	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
569b8d33-647f-47cf-8388-7ebe4e26e561	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400206	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
fd395420-7f24-4aee-9078-df9b6b24b81c	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400207	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:06:15	\N
8771cebf-41ec-4f62-b3c0-dcb5dbb3ddea	24560958-77c0-4524-a560-958875952456	\N	\N	\N	2	K26400181	\N	\N	\N	0.000	\N	\N	admin	2015-01-26 20:23:51	\N
\.


--
-- TOC entry 3851 (class 0 OID 825912)
-- Dependencies: 211
-- Data for Name: pakiranjeprodukta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pakiranjeprodukta (id, maticna_id, embalaza_id, etiketa_id, naziv, veljaod, veljado, status, upor, datknj) FROM stdin;
24560404-dd89-4524-a560-404ed2552456	5b0938f5-a60f-40b2-94a6-495ac4cdec29	24560481-053b-4524-a560-48114dc52456	\N	Privzeto pakiranje	2013-09-27	\N	1	 	\N
\.


--
-- TOC entry 3852 (class 0 OID 825916)
-- Dependencies: 212
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin, upor, datknj) FROM stdin;
dfb6aa3f-e387-49d7-aa3e-ad3e2e02b924	Aaa-User-delete	Aaa - Uporabnik - Briši	t	console	2015-01-07 18:44:42
49c6d318-aa38-4a34-a059-08cb71d8ec72	Aaa-User-read	Aaa - Uporabnik - Beri	t	console	2015-01-07 18:44:42
88e3d9bc-4a06-47f5-b6ff-9dc16809f214	Aaa-User-update	Aaa - Uporabnik - Posodobi	t	console	2015-01-07 18:44:42
75360a7a-d2ea-4a6d-b926-f0e928efcb6d	Aaa-User-create	Aaa - Uporabnik - Ustvari	t	console	2015-01-07 18:44:42
aa3e12ff-c916-4c76-9941-29c4835ac9f7	Aaa-User-lookup	Aaa - Uporabnik - Iskanje	t	console	2015-01-07 18:44:42
aa310f15-d8b2-481f-bbec-a22af2e88167	Aaa-Role-delete	Aaa - Vloga - Briši	t	console	2015-01-07 18:44:42
1fe05776-300a-4664-9fce-a47945b732d3	Aaa-Role-read	Aaa - Vloga - Beri	t	console	2015-01-07 18:44:42
57aad98a-2ee2-4942-983b-52919a0949dc	Aaa-Role-update	Aaa - Vloga - Posodobi	t	console	2015-01-07 18:44:42
b12018ec-20b9-4e2e-a9a6-caf1b7a4abbc	Aaa-Role-create	Aaa - Vloga - Ustvari	t	console	2015-01-07 18:44:42
ab77c227-9266-45ff-a048-ee318bb823a0	Aaa-Role-lookup	Aaa - Vloga - Iskanje	t	console	2015-01-07 18:44:42
3bbbaf45-cae7-448c-86a3-e41916fae284	Aaa-Permission-delete	Aaa - Dovoljenje - Briši	t	console	2015-01-07 18:44:42
dda2a223-6993-4ab2-859c-31e9878f280d	Aaa-Permission-read	Aaa - Dovoljenje - Beri	t	console	2015-01-07 18:44:42
4d951a8f-992b-4e3b-beed-c72a7de5f725	Aaa-Permission-update	Aaa - Dovoljenje - Posodobi	t	console	2015-01-07 18:44:42
9d26032a-6fb5-40cc-a5d3-b24aa38bcaf3	Aaa-Permission-create	Aaa - Dovoljenje - Ustvari	t	console	2015-01-07 18:44:42
0db67d5f-2d8c-4eec-863a-c966c6baac3e	Aaa-Permission-lookup	Aaa - Dovoljenje - Iskanje	t	console	2015-01-07 18:44:42
a0257fc7-35be-4e75-a007-6fbc3222df4c	Aaa-Group-delete	Aaa - Skupina uporabnikov - Briši	t	console	2015-01-07 18:44:42
736b50b6-da19-485a-991b-f2ec13e6ce66	Aaa-Group-read	Aaa - Skupina uporabnikov - Beri	t	console	2015-01-07 18:44:42
7804ee50-54e3-48b0-9bc2-d773c4404961	Aaa-Group-update	Aaa - Skupina uporabnikov - Posodobi	t	console	2015-01-07 18:44:42
f08a157d-e040-48a0-8483-dac95f0dfa77	Aaa-Group-create	Aaa - Skupina uporabnikov - Ustvari	t	console	2015-01-07 18:44:42
0b6443c5-e670-4135-85b1-50fa458f806b	Aaa-Group-lookup	Aaa - Skupina uporabnikov - Iskanje	t	console	2015-01-07 18:44:42
6fc7f277-14b8-4807-b4fd-7e8a39a05434	Aaa-Revizija-delete	Aaa - Aaa\\Entity\\Revizija - Briši	t	console	2015-01-07 18:44:42
b95299f9-2160-4c08-9f4c-689d4bc1d09f	Aaa-Revizija-read	Aaa - Aaa\\Entity\\Revizija - Beri	t	console	2015-01-07 18:44:42
6ab15339-172a-4a04-bffa-09e9de5c9381	Aaa-Revizija-update	Aaa - Aaa\\Entity\\Revizija - Posodobi	t	console	2015-01-07 18:44:42
0252b39e-51bf-4e91-b679-2208b640ab88	Aaa-Revizija-create	Aaa - Aaa\\Entity\\Revizija - Ustvari	t	console	2015-01-07 18:44:42
fe114021-be8d-46b5-b479-64393c8753ad	Aaa-Revizija-lookup	Aaa - Aaa\\Entity\\Revizija - Iskanje	t	console	2015-01-07 18:44:42
55a63ab4-1c16-48fb-88e9-223a6be744af	Sifra-delete	Šifranti - Generična šifra - Briši	t	console	2015-01-07 18:44:42
aeb72519-5454-4fef-9165-f810abe052e8	Sifra-read	Šifranti - Generična šifra - Beri	t	console	2015-01-07 18:44:42
bc51c1a5-86ac-4579-95d1-aed2a513455d	Sifra-update	Šifranti - Generična šifra - Posodobi	t	console	2015-01-07 18:44:42
84bab079-25b8-47de-a802-75357caf4f45	Sifra-create	Šifranti - Generična šifra - Ustvari	t	console	2015-01-07 18:44:42
d342ebd3-60d1-40f9-b487-d8584a51aebf	Sifra-lookup	Šifranti - Generična šifra - Iskanje	t	console	2015-01-07 18:44:42
1559e09a-8036-4246-93d2-531ca7e95622	Artikel-delete	Šifranti - Artikel - Briši	t	console	2015-01-07 18:44:42
d1e5c4ba-5852-4a4b-984a-e88bfd54052b	Artikel-read	Šifranti - Artikel - Beri	t	console	2015-01-07 18:44:42
cd996888-1aae-4453-b159-b2d9897771ec	Artikel-update	Šifranti - Artikel - Posodobi	t	console	2015-01-07 18:44:42
e5c4ef6b-9539-4f5c-8790-623eafca63a3	Artikel-create	Šifranti - Artikel - Ustvari	t	console	2015-01-07 18:44:42
1f1b0327-1264-42f3-990a-c2724fd8fac7	Artikel-lookup	Šifranti - Artikel - Iskanje	t	console	2015-01-07 18:44:42
316bc864-fa9e-42d1-8712-48e8bef070f5	Checklist-ChecklistVzorec-delete	Checklist - Checklist vzorec - Briši	t	console	2015-01-07 18:44:42
344f5710-a4d3-46c0-b620-cb0c094d9713	Checklist-ChecklistVzorec-read	Checklist - Checklist vzorec - Beri	t	console	2015-01-07 18:44:42
8237ecf9-1700-41b9-a371-bf7c048d1c84	Checklist-ChecklistVzorec-update	Checklist - Checklist vzorec - Posodobi	t	console	2015-01-07 18:44:42
c442d2aa-6ad9-4c79-9aad-a113b243d158	Checklist-ChecklistVzorec-create	Checklist - Checklist vzorec - Ustvari	t	console	2015-01-07 18:44:42
71e6b15b-6b05-4267-bbb4-ccda8180419c	Checklist-ChecklistVzorec-lookup	Checklist - Checklist vzorec - Iskanje	t	console	2015-01-07 18:44:42
8badbffa-e07a-4923-9627-1134fe1ab076	Checklist-ChecklistVzorecPostavka-delete	Checklist - Checklist\\Checklist Vzorec Postavka - Briši	t	console	2015-01-07 18:44:42
04f0c05d-951f-431d-8a9c-427fa2081bbe	Checklist-ChecklistVzorecPostavka-read	Checklist - Checklist\\Checklist Vzorec Postavka - Beri	t	console	2015-01-07 18:44:42
052612d4-c80c-4584-857f-d66ec938871a	Checklist-ChecklistVzorecPostavka-update	Checklist - Checklist\\Checklist Vzorec Postavka - Posodobi	t	console	2015-01-07 18:44:42
27aa67cc-a6fa-44ec-87b0-bdea5072e044	Checklist-ChecklistVzorecPostavka-create	Checklist - Checklist\\Checklist Vzorec Postavka - Ustvari	t	console	2015-01-07 18:44:42
dc171568-015d-414c-add7-1fa88522ddf2	Checklist-ChecklistVzorecPostavka-lookup	Checklist - Checklist\\Checklist Vzorec Postavka - Iskanje	t	console	2015-01-07 18:44:42
0e90ac70-20ad-432a-8bbd-dba99cbbe0e4	Delavec-delete	Šifranti - Delavec - Briši	t	console	2015-01-07 18:44:42
d6d21de1-dbf5-4f64-9039-e683ba486144	Delavec-read	Šifranti - Delavec - Beri	t	console	2015-01-07 18:44:42
bcccb118-96d3-4943-8a5a-3afd24def55d	Delavec-update	Šifranti - Delavec - Posodobi	t	console	2015-01-07 18:44:42
b56f40a7-fa6b-4e0e-9b0b-6cc33cdf684e	Delavec-create	Šifranti - Delavec - Ustvari	t	console	2015-01-07 18:44:42
c713134e-0f2a-419a-b13f-ffc9492473f8	Delavec-lookup	Šifranti - Delavec - Iskanje	t	console	2015-01-07 18:44:42
b21e2a65-1e66-4d78-9fe5-6537927e76a3	Drzava-delete	Šifranti - Država - Briši	t	console	2015-01-07 18:44:42
6b4a8c0d-b7e1-4526-b7b0-fdfe8d4593e2	Drzava-read	Šifranti - Država - Beri	t	console	2015-01-07 18:44:42
5c294aa3-d47a-47cd-a0f0-5b672f8680a0	Drzava-update	Šifranti - Država - Posodobi	t	console	2015-01-07 18:44:42
244f9180-f1b5-4cd0-84ca-7972853601d5	Drzava-create	Šifranti - Država - Ustvari	t	console	2015-01-07 18:44:42
775ad633-d3fc-4997-bd43-d69537522cb8	Drzava-lookup	Šifranti - Država - Iskanje	t	console	2015-01-07 18:44:42
2a8d8144-89c9-485e-bc0e-404e92dc6b59	IzbirnaOpcija-delete	Šifranti - Izbirna opcija - Briši	t	console	2015-01-07 18:44:42
69c4725d-7fbd-4e5f-89e6-0ee7f624a005	IzbirnaOpcija-read	Šifranti - Izbirna opcija - Beri	t	console	2015-01-07 18:44:42
1995efd1-aa54-484e-90f9-738208b877f8	IzbirnaOpcija-update	Šifranti - Izbirna opcija - Posodobi	t	console	2015-01-07 18:44:42
6bb6427a-9a5b-4d79-aad4-ca73767d00ca	IzbirnaOpcija-create	Šifranti - Izbirna opcija - Ustvari	t	console	2015-01-07 18:44:42
1d87dab2-84e4-4b73-ab60-113185d0cb4c	IzbirnaOpcija-lookup	Šifranti - Izbirna opcija - Iskanje	t	console	2015-01-07 18:44:42
a5aacad4-98e7-4d93-acaf-08d23761b63c	Job-Job-delete	Job - Job - Briši	t	console	2015-01-07 18:44:42
1b476c9a-8f85-4240-b220-d3bad3a5a2c3	Job-Job-read	Job - Job - Beri	t	console	2015-01-07 18:44:42
01ad2234-b775-4b88-8738-91cd86ee73b5	Job-Job-update	Job - Job - Posodobi	t	console	2015-01-07 18:44:42
6ef2eb32-2aa6-4203-b8a9-44737933eaa3	Job-Job-create	Job - Job - Ustvari	t	console	2015-01-07 18:44:42
867ac4e3-d741-4980-a384-c42340e75c99	Job-Job-lookup	Job - Job - Iskanje	t	console	2015-01-07 18:44:42
4f2d8559-18dc-47a7-8ec6-334a84566247	Klasifikacija-delete	Šifranti - Klasifikacija - Briši	t	console	2015-01-07 18:44:42
b9a73aa6-436f-4d49-ac3c-b655b738c283	Klasifikacija-read	Šifranti - Klasifikacija - Beri	t	console	2015-01-07 18:44:42
d299439f-b9d0-48f0-aa07-d0ead8d73ade	Klasifikacija-update	Šifranti - Klasifikacija - Posodobi	t	console	2015-01-07 18:44:42
3773d7e9-339a-47ed-9d27-1ab3670e2f54	Klasifikacija-create	Šifranti - Klasifikacija - Ustvari	t	console	2015-01-07 18:44:42
bbab2e84-2b12-4af6-90a0-875122298042	Klasifikacija-lookup	Šifranti - Klasifikacija - Iskanje	t	console	2015-01-07 18:44:42
0496adb6-e4b1-4415-a2be-53c21d6256f3	Kontaktna-delete	Šifranti - Kontaktna oseba - Briši	t	console	2015-01-07 18:44:42
b6ed540e-9492-4cdf-a07d-d9ab1c281d60	Kontaktna-read	Šifranti - Kontaktna oseba - Beri	t	console	2015-01-07 18:44:42
12bd0c51-2eba-4f2b-93cd-86a6fbf51d55	Kontaktna-update	Šifranti - Kontaktna oseba - Posodobi	t	console	2015-01-07 18:44:42
5c69756e-5cd7-4bef-8f24-64d7f26b4a58	Kontaktna-create	Šifranti - Kontaktna oseba - Ustvari	t	console	2015-01-07 18:44:42
ff7550e4-0870-4cac-8f63-f9bbc97be21e	Kontaktna-lookup	Šifranti - Kontaktna oseba - Iskanje	t	console	2015-01-07 18:44:42
2fcb5473-0593-4773-b9be-d4ada2417ed4	Kontekst-delete	Šifranti - Iskalni kontekst - Briši	t	console	2015-01-07 18:44:42
8ef99ebf-2997-47c8-a3fa-8fe848302582	Kontekst-read	Šifranti - Iskalni kontekst - Beri	t	console	2015-01-07 18:44:42
5f5437d3-bb40-43b9-abc4-800ac526a067	Kontekst-update	Šifranti - Iskalni kontekst - Posodobi	t	console	2015-01-07 18:44:42
f31610e2-f5cc-4432-85e8-ec59973ca561	Kontekst-create	Šifranti - Iskalni kontekst - Ustvari	t	console	2015-01-07 18:44:42
b10fdb95-bd97-444a-a07d-3b526ad1f608	Kontekst-lookup	Šifranti - Iskalni kontekst - Iskanje	t	console	2015-01-07 18:44:42
180b60e7-262d-4d60-a63c-1db6c3c22411	Nastavitev-delete	Šifranti - Nastavitev - Briši	t	console	2015-01-07 18:44:42
67837964-5f77-47ad-9b67-b4eb4f8ab1da	Nastavitev-read	Šifranti - Nastavitev - Beri	t	console	2015-01-07 18:44:42
b59d0c6e-58c6-4d09-96f8-517162d15bb3	Nastavitev-update	Šifranti - Nastavitev - Posodobi	t	console	2015-01-07 18:44:42
717c2aae-fc5c-44cc-8b64-cca714baecee	Nastavitev-create	Šifranti - Nastavitev - Ustvari	t	console	2015-01-07 18:44:42
8f63f960-90d9-4438-9a21-4e4c79cd1774	Nastavitev-lookup	Šifranti - Nastavitev - Iskanje	t	console	2015-01-07 18:44:42
580d7894-8144-4c71-b1a7-4b9fef54c2ce	Operacija-delete	Šifranti - Operacija - Briši	t	console	2015-01-07 18:44:42
73f21710-66a5-4e0c-b77e-e029784e93b4	Operacija-read	Šifranti - Operacija - Beri	t	console	2015-01-07 18:44:42
b973b93b-0de7-4cba-ae94-16e831eff099	Operacija-update	Šifranti - Operacija - Posodobi	t	console	2015-01-07 18:44:42
5915bd62-b3b4-4e47-963b-3489fc50c7a0	Operacija-create	Šifranti - Operacija - Ustvari	t	console	2015-01-07 18:44:42
9be35b68-d9ab-4816-9089-c315a9d9f8c6	Operacija-lookup	Šifranti - Operacija - Iskanje	t	console	2015-01-07 18:44:42
2224f9a5-397c-4961-bb3c-4bd2da022d01	Popa-delete	Šifranti - Poslovni partner - Briši	t	console	2015-01-07 18:44:42
ed7e2733-c9d0-4623-b620-c10c1a9ac465	Popa-read	Šifranti - Poslovni partner - Beri	t	console	2015-01-07 18:44:42
2a58b034-3007-41c7-aa41-425d2152e7d6	Popa-update	Šifranti - Poslovni partner - Posodobi	t	console	2015-01-07 18:44:42
9d8deafe-7592-4d3e-90cf-349dada38495	Popa-create	Šifranti - Poslovni partner - Ustvari	t	console	2015-01-07 18:44:42
b02c81ca-d2fb-40ee-b5fb-72439229e7aa	Popa-lookup	Šifranti - Poslovni partner - Iskanje	t	console	2015-01-07 18:44:42
d0527226-241f-4e34-b017-eb67f60d6920	Posta-delete	Šifranti - Pošta - Briši	t	console	2015-01-07 18:44:42
5a99082d-57b1-4c08-ad6b-c389512231ca	Posta-read	Šifranti - Pošta - Beri	t	console	2015-01-07 18:44:42
a111a171-e285-47c2-a064-a0d37c1cb2b5	Posta-update	Šifranti - Pošta - Posodobi	t	console	2015-01-07 18:44:42
9c051ad8-7003-4acd-8a60-8b53151b2d85	Posta-create	Šifranti - Pošta - Ustvari	t	console	2015-01-07 18:44:42
833d9ba2-f5f7-4434-a590-e9baa8a481e2	Posta-lookup	Šifranti - Pošta - Iskanje	t	console	2015-01-07 18:44:42
9cf3695b-94d2-47f6-a143-f61abceb26fc	PostniNaslov-delete	Šifranti - Poštni naslov - Briši	t	console	2015-01-07 18:44:42
280ff5e4-6f3b-428b-9931-7de1597e16a0	PostniNaslov-read	Šifranti - Poštni naslov - Beri	t	console	2015-01-07 18:44:42
ef1e75e0-863f-4e63-a062-3f1e0d11e7f9	PostniNaslov-update	Šifranti - Poštni naslov - Posodobi	t	console	2015-01-07 18:44:42
8c755fc0-73f9-44fb-80a1-d60e94563117	PostniNaslov-create	Šifranti - Poštni naslov - Ustvari	t	console	2015-01-07 18:44:42
602f6846-18a8-4bd1-9e19-5592c843e61b	PostniNaslov-lookup	Šifranti - Poštni naslov - Iskanje	t	console	2015-01-07 18:44:42
747d9fae-dfbd-4530-b48c-2ff10943ff6e	Skladisce-delete	Šifranti - Skladišče - Briši	t	console	2015-01-07 18:44:42
9d5bad06-237c-4d12-b869-4b099e80ad15	Skladisce-read	Šifranti - Skladišče - Beri	t	console	2015-01-07 18:44:42
6ca81382-2ea4-4619-88fa-29d80a51082f	Skladisce-update	Šifranti - Skladišče - Posodobi	t	console	2015-01-07 18:44:42
7f372e1a-5e2c-4ac9-8eeb-fdf438e93610	Skladisce-create	Šifranti - Skladišče - Ustvari	t	console	2015-01-07 18:44:42
8aad7b2b-7a0e-482a-9b41-bd7cc1a63d7a	Skladisce-lookup	Šifranti - Skladišče - Iskanje	t	console	2015-01-07 18:44:42
7a2e24a5-77b4-49d0-a2e6-a172ecbf3a39	StevilcenjeDokumenta-delete	Šifranti - Številčenje - Briši	t	console	2015-01-07 18:44:42
4b040f25-2357-42d6-b115-9ac617a80232	StevilcenjeDokumenta-read	Šifranti - Številčenje - Beri	t	console	2015-01-07 18:44:42
9dd174d1-1c52-43f3-9c6a-2f61b250bcf8	StevilcenjeDokumenta-update	Šifranti - Številčenje - Posodobi	t	console	2015-01-07 18:44:42
a97ac0f0-b344-4313-98a2-b8e5e1f27ce2	StevilcenjeDokumenta-create	Šifranti - Številčenje - Ustvari	t	console	2015-01-07 18:44:42
d366d0fa-a0f1-4f15-87ef-20826c23a6f3	StevilcenjeDokumenta-lookup	Šifranti - Številčenje - Iskanje	t	console	2015-01-07 18:44:42
674d3ad1-26da-4be2-9222-35c2a9806a51	StevilcenjePoSkl-delete	Šifranti - Številčenje - Briši	t	console	2015-01-07 18:44:42
b0286e82-ce8a-4607-9bf2-99a895572733	StevilcenjePoSkl-read	Šifranti - Številčenje - Beri	t	console	2015-01-07 18:44:42
92a4d8f6-b10e-4121-bccd-2745950af9f2	StevilcenjePoSkl-update	Šifranti - Številčenje - Posodobi	t	console	2015-01-07 18:44:42
4454ff6f-239f-423b-ab55-d71cd0550d0a	StevilcenjePoSkl-create	Šifranti - Številčenje - Ustvari	t	console	2015-01-07 18:44:42
82c12ebe-3a5e-4c7b-84d7-194bb51d1d06	StevilcenjePoSkl-lookup	Šifranti - Številčenje - Iskanje	t	console	2015-01-07 18:44:42
f328644e-c865-4929-ab0d-7b1f18ddbb07	StevilcenjeTrenutne-delete	Šifranti - Številčenje - Briši	t	console	2015-01-07 18:44:42
1ad38ef3-0a94-41a9-8a48-3d546d87b579	StevilcenjeTrenutne-read	Šifranti - Številčenje - Beri	t	console	2015-01-07 18:44:42
a7f785be-fae0-4c30-81fe-4c7740e2c9c4	StevilcenjeTrenutne-update	Šifranti - Številčenje - Posodobi	t	console	2015-01-07 18:44:42
e6aec7d7-b382-444c-8021-b1d8a54401c4	StevilcenjeTrenutne-create	Šifranti - Številčenje - Ustvari	t	console	2015-01-07 18:44:42
55237165-e0be-4374-a90b-8410ba020018	StevilcenjeTrenutne-lookup	Šifranti - Številčenje - Iskanje	t	console	2015-01-07 18:44:42
f77d021a-6821-4ca2-806c-5eec74e980e6	Tdok-delete	Šifranti - Vrsta dokumenta - Briši	t	console	2015-01-07 18:44:42
cb57c8b2-b98d-4fa6-9d7a-524b0351aba4	Tdok-read	Šifranti - Vrsta dokumenta - Beri	t	console	2015-01-07 18:44:42
18d1879c-bbec-4c91-a4df-e67e2636da83	Tdok-update	Šifranti - Vrsta dokumenta - Posodobi	t	console	2015-01-07 18:44:42
80e75040-98ac-4682-bd6e-c05b12d74fa6	Tdok-create	Šifranti - Vrsta dokumenta - Ustvari	t	console	2015-01-07 18:44:42
4c7e2ce8-b353-407a-b739-7361038286ee	Tdok-lookup	Šifranti - Vrsta dokumenta - Iskanje	t	console	2015-01-07 18:44:42
104ce38a-2fdc-4a2c-8db1-c47f28c0b684	Tehen-delete	Šifranti - Tehnološka enota - Briši	t	console	2015-01-07 18:44:42
cbbad234-3d82-45ba-969a-ab573558ef26	Tehen-read	Šifranti - Tehnološka enota - Beri	t	console	2015-01-07 18:44:42
af8c8653-c3a3-4e67-97cb-e89a649d28c5	Tehen-update	Šifranti - Tehnološka enota - Posodobi	t	console	2015-01-07 18:44:42
48f752ab-9a5b-4229-a12a-1ef7c0681e3e	Tehen-create	Šifranti - Tehnološka enota - Ustvari	t	console	2015-01-07 18:44:42
321c1ddf-4108-490e-a51f-392635ed0cf0	Tehen-lookup	Šifranti - Tehnološka enota - Iskanje	t	console	2015-01-07 18:44:42
cac705ab-0581-4980-af1b-debc6dad9080	Tiskalnik-delete	Šifranti - Tiskalnik - Briši	t	console	2015-01-07 18:44:42
62c719c8-52eb-4619-8911-b691dde1b9b3	Tiskalnik-read	Šifranti - Tiskalnik - Beri	t	console	2015-01-07 18:44:42
c6910223-191a-451f-93b2-5cc637b358cd	Tiskalnik-update	Šifranti - Tiskalnik - Posodobi	t	console	2015-01-07 18:44:42
ab467c6d-48ec-4904-b286-d92f9b2f6d9b	Tiskalnik-create	Šifranti - Tiskalnik - Ustvari	t	console	2015-01-07 18:44:42
131af4b9-356b-4fd5-ac60-46a63dcda98f	Tiskalnik-lookup	Šifranti - Tiskalnik - Iskanje	t	console	2015-01-07 18:44:42
7b70a59e-7979-4a19-87f6-97274e0b729f	Valuta-delete	Šifranti - Valuta - Briši	t	console	2015-01-07 18:44:42
3995353e-fa52-4cdd-b6fe-43db2fdd7cc7	Valuta-read	Šifranti - Valuta - Beri	t	console	2015-01-07 18:44:42
617bda52-86d6-404f-a8ad-95bd03d4e6bd	Valuta-update	Šifranti - Valuta - Posodobi	t	console	2015-01-07 18:44:42
d35f2577-c215-469d-ab48-3e35740f6927	Valuta-create	Šifranti - Valuta - Ustvari	t	console	2015-01-07 18:44:42
cfe723f5-9d36-4948-89d7-6cc244e93c58	Valuta-lookup	Šifranti - Valuta - Iskanje	t	console	2015-01-07 18:44:42
b389ceaa-b6c0-43f7-a5a6-e18215e3c96b	Vfs-Datoteka-delete	Vfs - Priponka - Briši	t	console	2015-01-07 18:44:42
3c5a60ca-cfa1-4c1d-9000-06862c13590a	Vfs-Datoteka-read	Vfs - Priponka - Beri	t	console	2015-01-07 18:44:42
bbdb81c8-ae24-4208-8b71-a9d2c6be6927	Vfs-Datoteka-update	Vfs - Priponka - Posodobi	t	console	2015-01-07 18:44:42
66f16523-76fe-43f6-9b14-e5c0add654ab	Vfs-Datoteka-create	Vfs - Priponka - Ustvari	t	console	2015-01-07 18:44:42
f39b17e2-ac37-48d9-9199-d32437523747	Vfs-Datoteka-lookup	Vfs - Priponka - Iskanje	t	console	2015-01-07 18:44:42
a8683152-1f3e-48e1-81da-89e33cf780f9	Vfs-Mapa-delete	Vfs - Mapa - Briši	t	console	2015-01-07 18:44:42
d18004ec-5179-4bf0-a5b8-2a9b3ee2249a	Vfs-Mapa-read	Vfs - Mapa - Beri	t	console	2015-01-07 18:44:42
4db752dc-208d-46d1-b188-6ee2e2d54c66	Vfs-Mapa-update	Vfs - Mapa - Posodobi	t	console	2015-01-07 18:44:42
5ef61e99-acf6-40c6-acc8-1a1b6d41f428	Vfs-Mapa-create	Vfs - Mapa - Ustvari	t	console	2015-01-07 18:44:42
a6f268cb-78f5-4173-a979-538ad052d8f4	Vfs-Mapa-lookup	Vfs - Mapa - Iskanje	t	console	2015-01-07 18:44:42
e0f52aa9-c018-4220-9870-edfef454e9d0	Vfs-MapaAcl-delete	Vfs - Dovoljenje mape - Briši	t	console	2015-01-07 18:44:42
789679bd-81d6-4821-ab97-7e22f1272a37	Vfs-MapaAcl-read	Vfs - Dovoljenje mape - Beri	t	console	2015-01-07 18:44:42
5f106837-e97f-40f4-8a7e-ed754820bd5d	Vfs-MapaAcl-update	Vfs - Dovoljenje mape - Posodobi	t	console	2015-01-07 18:44:42
4d3bf19a-df58-47a2-9658-323d7e855742	Vfs-MapaAcl-create	Vfs - Dovoljenje mape - Ustvari	t	console	2015-01-07 18:44:42
5923e3eb-7b48-4551-9167-59ee3f8d479e	Vfs-MapaAcl-lookup	Vfs - Dovoljenje mape - Iskanje	t	console	2015-01-07 18:44:42
771c3784-db21-42e6-8034-e845f9698f49	Vfs-Priponka-delete	Vfs - Priponka - Briši	t	console	2015-01-07 18:44:42
053545c2-a5c8-40b7-a7b7-1de1fe82af81	Vfs-Priponka-read	Vfs - Priponka - Beri	t	console	2015-01-07 18:44:42
d31eb03a-f74a-40dc-bd14-6126e4adbc4a	Vfs-Priponka-update	Vfs - Priponka - Posodobi	t	console	2015-01-07 18:44:42
8ede29d0-4296-4d49-bf71-002ebe7348b6	Vfs-Priponka-create	Vfs - Priponka - Ustvari	t	console	2015-01-07 18:44:42
4bbd03cb-4ee9-4956-96e1-8429fe6ba83e	Vfs-Priponka-lookup	Vfs - Priponka - Iskanje	t	console	2015-01-07 18:44:42
e9a85287-e471-4449-9026-cef32b75f149	Narocila-CenovniRazpon-delete	Narocila - Cenovni razpon - Briši	t	console	2015-01-07 18:44:42
ac8b118d-e866-4e53-8f2e-7d428252f45a	Narocila-CenovniRazpon-read	Narocila - Cenovni razpon - Beri	t	console	2015-01-07 18:44:42
b93b7a33-7224-4054-a59b-dfc60518b39e	Narocila-CenovniRazpon-update	Narocila - Cenovni razpon - Posodobi	t	console	2015-01-07 18:44:42
280d6761-47e9-4c9e-94ef-7a1fb06823f2	Narocila-CenovniRazpon-create	Narocila - Cenovni razpon - Ustvari	t	console	2015-01-07 18:44:42
ea43b6ec-c628-4e40-81c8-302b3ef4d04c	Narocila-CenovniRazpon-lookup	Narocila - Cenovni razpon - Iskanje	t	console	2015-01-07 18:44:42
4076ea3f-646d-4eba-af99-52c79825d406	Narocila-DokumentNarociloDob-delete	Narocila - Naročilo dobavitelju - Briši	t	console	2015-01-07 18:44:42
d462d1c9-9e5d-41f0-88b1-9d4bede1f1c3	Narocila-DokumentNarociloDob-read	Narocila - Naročilo dobavitelju - Beri	t	console	2015-01-07 18:44:42
72577657-2a36-45e6-98b7-e0e8e25fecd4	Narocila-DokumentNarociloDob-update	Narocila - Naročilo dobavitelju - Posodobi	t	console	2015-01-07 18:44:42
b437e592-aad4-494b-856f-25174e2ce643	Narocila-DokumentNarociloDob-create	Narocila - Naročilo dobavitelju - Ustvari	t	console	2015-01-07 18:44:42
bf203d6c-64b8-4074-854b-32172d8a0b25	Narocila-DokumentNarociloDob-lookup	Narocila - Naročilo dobavitelju - Iskanje	t	console	2015-01-07 18:44:42
a7e18e8d-fb3d-4273-ba3b-2c681cce9135	Narocila-DokumentNarociloKup-delete	Narocila - Naročilo kupca - Briši	t	console	2015-01-07 18:44:42
981d3676-85b4-49c5-aa76-5cabb848b8d6	Narocila-DokumentNarociloKup-read	Narocila - Naročilo kupca - Beri	t	console	2015-01-07 18:44:42
602b3f09-e572-4796-8f87-749ffd21212e	Narocila-DokumentNarociloKup-update	Narocila - Naročilo kupca - Posodobi	t	console	2015-01-07 18:44:42
2eb67d03-a66b-47d1-ad6e-69a749cbf2a8	Narocila-DokumentNarociloKup-create	Narocila - Naročilo kupca - Ustvari	t	console	2015-01-07 18:44:42
6dc643fe-7b4f-49be-8333-e1c50d088b0d	Narocila-DokumentNarociloKup-lookup	Narocila - Naročilo kupca - Iskanje	t	console	2015-01-07 18:44:42
5f48ed44-eeb2-42a5-85dd-36a513e812fb	Narocila-DokumentPonudba-delete	Narocila - Ponudba - Briši	t	console	2015-01-07 18:44:42
afe55761-ab84-4c04-a2ce-3a8b79fa24cc	Narocila-DokumentPonudba-read	Narocila - Ponudba - Beri	t	console	2015-01-07 18:44:42
2ac1e22e-6b4a-42a3-93fa-c9d6349e2bb6	Narocila-DokumentPonudba-update	Narocila - Ponudba - Posodobi	t	console	2015-01-07 18:44:42
20b4bf60-3f52-437d-adb8-df0bd16972ea	Narocila-DokumentPonudba-create	Narocila - Ponudba - Ustvari	t	console	2015-01-07 18:44:42
d720f23f-fdd8-4ea5-b5f9-cc452ff2f078	Narocila-DokumentPonudba-lookup	Narocila - Ponudba - Iskanje	t	console	2015-01-07 18:44:42
df117c80-b659-4da0-bbc1-dd7870ca56ad	Narocila-KakovostniPrevzem-delete	Narocila - Kakovostni prevzem - Briši	t	console	2015-01-07 18:44:42
4b044112-b559-4440-b661-0524bad59dd2	Narocila-KakovostniPrevzem-read	Narocila - Kakovostni prevzem - Beri	t	console	2015-01-07 18:44:42
e91397bd-2906-41b5-a756-d2c5cedc0063	Narocila-KakovostniPrevzem-update	Narocila - Kakovostni prevzem - Posodobi	t	console	2015-01-07 18:44:42
83d543dd-419a-4d71-8887-03438064c14a	Narocila-KakovostniPrevzem-create	Narocila - Kakovostni prevzem - Ustvari	t	console	2015-01-07 18:44:42
82ef7620-ae61-49dc-9093-032098f24548	Narocila-KakovostniPrevzem-lookup	Narocila - Kakovostni prevzem - Iskanje	t	console	2015-01-07 18:44:42
42a63bde-861d-4dc9-ba27-88aaa8b7bed4	Narocila-PostavkaNarociloDob-delete	Narocila - Postavka naročila dobavitelju - Briši	t	console	2015-01-07 18:44:42
8ded0e0c-c774-4b13-a1ad-87b791896c17	Narocila-PostavkaNarociloDob-read	Narocila - Postavka naročila dobavitelju - Beri	t	console	2015-01-07 18:44:42
dd23c2c6-9173-4ced-acc7-13ae64046879	Narocila-PostavkaNarociloDob-update	Narocila - Postavka naročila dobavitelju - Posodobi	t	console	2015-01-07 18:44:42
f0eda371-a18a-4dc3-8320-a8f0a9a1db14	Narocila-PostavkaNarociloDob-create	Narocila - Postavka naročila dobavitelju - Ustvari	t	console	2015-01-07 18:44:42
f5f83a42-36ef-4f4e-870f-7492342328f0	Narocila-PostavkaNarociloDob-lookup	Narocila - Postavka naročila dobavitelju - Iskanje	t	console	2015-01-07 18:44:42
9d9af45a-3313-46a8-ab18-878ecf2fb005	Narocila-PostavkaNarociloKup-delete	Narocila - Postavka naročila kupca - Briši	t	console	2015-01-07 18:44:42
e946d402-15eb-4542-90d3-50cb02254454	Narocila-PostavkaNarociloKup-read	Narocila - Postavka naročila kupca - Beri	t	console	2015-01-07 18:44:42
28b9ec34-619a-4834-b2f5-0fed0f986235	Narocila-PostavkaNarociloKup-update	Narocila - Postavka naročila kupca - Posodobi	t	console	2015-01-07 18:44:42
26c24c74-eff1-4092-b78f-2299e7095b81	Narocila-PostavkaNarociloKup-create	Narocila - Postavka naročila kupca - Ustvari	t	console	2015-01-07 18:44:42
3e9d5c65-2511-41e9-9618-d4e8133a6533	Narocila-PostavkaNarociloKup-lookup	Narocila - Postavka naročila kupca - Iskanje	t	console	2015-01-07 18:44:42
829b7480-640c-410c-8716-1b20eac6cbbe	Narocila-PostavkaPonudba-delete	Narocila - Postavka ponudbe - Briši	t	console	2015-01-07 18:44:42
bba5d490-c2e9-4b98-bcc9-fac1008be0d7	Narocila-PostavkaPonudba-read	Narocila - Postavka ponudbe - Beri	t	console	2015-01-07 18:44:42
00a4bcec-8c08-4069-b92e-8f72119ff435	Narocila-PostavkaPonudba-update	Narocila - Postavka ponudbe - Posodobi	t	console	2015-01-07 18:44:42
82b352b1-0b0f-4233-8693-a81722b47ad0	Narocila-PostavkaPonudba-create	Narocila - Postavka ponudbe - Ustvari	t	console	2015-01-07 18:44:42
808dffa4-5765-4dc0-8fa4-effcc8a07064	Narocila-PostavkaPonudba-lookup	Narocila - Postavka ponudbe - Iskanje	t	console	2015-01-07 18:44:42
07f9cac9-ebb6-49a6-92df-87127e958aa9	Narocila-StatusNar-delete	Narocila - Status naročila - Briši	t	console	2015-01-07 18:44:42
d08b3cde-abe3-4b8a-9ba0-8fcdc3ca6a4a	Narocila-StatusNar-read	Narocila - Status naročila - Beri	t	console	2015-01-07 18:44:42
b437ecd3-0d92-487c-b560-f4bf5328eb30	Narocila-StatusNar-update	Narocila - Status naročila - Posodobi	t	console	2015-01-07 18:44:42
2ce6bbb2-14c0-47b9-99c1-ef2266b88390	Narocila-StatusNar-create	Narocila - Status naročila - Ustvari	t	console	2015-01-07 18:44:42
47331c17-574c-4028-b8a4-279c44b51328	Narocila-StatusNar-lookup	Narocila - Status naročila - Iskanje	t	console	2015-01-07 18:44:42
906fa2b7-1cc9-44b9-af0c-c496df3ded43	Tehnologija-Embalaza-delete	Tehnologija - Embalažna enota - Briši	t	console	2015-01-07 18:44:42
07ab077e-cd03-43fb-be7b-53f02d7b9c70	Tehnologija-Embalaza-read	Tehnologija - Embalažna enota - Beri	t	console	2015-01-07 18:44:42
47e8d27a-c2f9-40e5-96dc-1801b32de754	Tehnologija-Embalaza-update	Tehnologija - Embalažna enota - Posodobi	t	console	2015-01-07 18:44:42
4580fda2-2562-4c91-b2ac-92be83722648	Tehnologija-Embalaza-create	Tehnologija - Embalažna enota - Ustvari	t	console	2015-01-07 18:44:42
2a167ba2-cb2c-4662-9bd5-a505e5644ee6	Tehnologija-Embalaza-lookup	Tehnologija - Embalažna enota - Iskanje	t	console	2015-01-07 18:44:42
ec5a9561-34ea-40e6-b670-c81345a145e7	Tehnologija-Etiketa-delete	Tehnologija - Etiketa - Briši	t	console	2015-01-07 18:44:42
9d21c84d-81ce-428a-8121-0384dd4b3ba5	Tehnologija-Etiketa-read	Tehnologija - Etiketa - Beri	t	console	2015-01-07 18:44:42
5f68d364-9cca-46ea-957e-5d5b384cc2ff	Tehnologija-Etiketa-update	Tehnologija - Etiketa - Posodobi	t	console	2015-01-07 18:44:42
4718151a-8e58-490d-bad9-5954330f595c	Tehnologija-Etiketa-create	Tehnologija - Etiketa - Ustvari	t	console	2015-01-07 18:44:42
8c6981ec-bfb5-4946-84e7-116af996c5e3	Tehnologija-Etiketa-lookup	Tehnologija - Etiketa - Iskanje	t	console	2015-01-07 18:44:42
05f5dbae-667e-4b89-9afc-00abd18ad6c5	Tehnologija-KalkKoso-delete	Tehnologija - Kalkulacijska kosovnica - Briši	t	console	2015-01-07 18:44:42
b8cb3dee-c2c3-497f-952c-df2f381b45d1	Tehnologija-KalkKoso-read	Tehnologija - Kalkulacijska kosovnica - Beri	t	console	2015-01-07 18:44:42
96f53bc2-16aa-44ac-81e4-2cd429eb1a96	Tehnologija-KalkKoso-update	Tehnologija - Kalkulacijska kosovnica - Posodobi	t	console	2015-01-07 18:44:42
c342f9a3-6803-44fc-b2da-e16cdba2dd9d	Tehnologija-KalkKoso-create	Tehnologija - Kalkulacijska kosovnica - Ustvari	t	console	2015-01-07 18:44:42
91f99199-5eef-47ea-8160-6cdd9a70db20	Tehnologija-KalkKoso-lookup	Tehnologija - Kalkulacijska kosovnica - Iskanje	t	console	2015-01-07 18:44:42
fe60e022-ce8a-49ff-aa92-17be4d8ac3bc	Tehnologija-PostavkaKalkKoso-delete	Tehnologija - Postavka kalkulacijske kosovnice - Briši	t	console	2015-01-07 18:44:42
721db569-3662-4e3e-9317-200a99d0d186	Tehnologija-PostavkaKalkKoso-read	Tehnologija - Postavka kalkulacijske kosovnice - Beri	t	console	2015-01-07 18:44:42
cc9ec4f6-76f1-4887-b6a9-a4a6d6ed27e9	Tehnologija-PostavkaKalkKoso-update	Tehnologija - Postavka kalkulacijske kosovnice - Posodobi	t	console	2015-01-07 18:44:42
63368a51-6c1c-413f-827f-d30d52195dfa	Tehnologija-PostavkaKalkKoso-create	Tehnologija - Postavka kalkulacijske kosovnice - Ustvari	t	console	2015-01-07 18:44:42
ca9d8cb9-82ad-4661-a943-73cc7a5e5476	Tehnologija-PostavkaKalkKoso-lookup	Tehnologija - Postavka kalkulacijske kosovnice - Iskanje	t	console	2015-01-07 18:44:42
966a137e-a48a-437c-8239-d077f1036963	Tehnologija-KalkKosoMaterial-delete	Tehnologija - Material kalkulacijske kosovnice - Briši	t	console	2015-01-07 18:44:42
5198ec8a-65b0-4a69-99e2-ee51310d5f2b	Tehnologija-KalkKosoMaterial-read	Tehnologija - Material kalkulacijske kosovnice - Beri	t	console	2015-01-07 18:44:42
5572fcf2-c09c-41fe-aa43-f125581a7c9e	Tehnologija-KalkKosoMaterial-update	Tehnologija - Material kalkulacijske kosovnice - Posodobi	t	console	2015-01-07 18:44:42
cb5c3491-c372-4de8-9e6a-4b4da5b6e73f	Tehnologija-KalkKosoMaterial-create	Tehnologija - Material kalkulacijske kosovnice - Ustvari	t	console	2015-01-07 18:44:42
19775252-5768-4532-8c16-c110369cc13c	Tehnologija-KalkKosoMaterial-lookup	Tehnologija - Material kalkulacijske kosovnice - Iskanje	t	console	2015-01-07 18:44:42
2d85497e-1d4c-4c3e-971e-ac0af4d801e6	Tehnologija-KalkKosoOperacija-delete	Tehnologija - Operacija kalkulacijske kosovnice - Briši	t	console	2015-01-07 18:44:42
234ac055-bf6d-4244-8165-64a7074f2eb0	Tehnologija-KalkKosoOperacija-read	Tehnologija - Operacija kalkulacijske kosovnice - Beri	t	console	2015-01-07 18:44:42
99356455-6c7a-462b-a123-cfb866a15f3d	Tehnologija-KalkKosoOperacija-update	Tehnologija - Operacija kalkulacijske kosovnice - Posodobi	t	console	2015-01-07 18:44:42
5c8e9381-1b58-4e0d-b4be-b629e4e802f9	Tehnologija-KalkKosoOperacija-create	Tehnologija - Operacija kalkulacijske kosovnice - Ustvari	t	console	2015-01-07 18:44:42
b20d8f7e-3467-4272-95af-853d8334a74e	Tehnologija-KalkKosoOperacija-lookup	Tehnologija - Operacija kalkulacijske kosovnice - Iskanje	t	console	2015-01-07 18:44:42
04e28e20-e96f-4a25-afe9-934ff38b800a	Tehnologija-KalkKosoStoritev-delete	Tehnologija - Material kalkulacijske kosovnice - Briši	t	console	2015-01-07 18:44:42
c0c14309-bfd7-4449-b2f0-b2d987b69198	Tehnologija-KalkKosoStoritev-read	Tehnologija - Material kalkulacijske kosovnice - Beri	t	console	2015-01-07 18:44:42
8c5b1e5b-f575-4513-98df-0bd4752b662e	Tehnologija-KalkKosoStoritev-update	Tehnologija - Material kalkulacijske kosovnice - Posodobi	t	console	2015-01-07 18:44:42
d1975b7b-dc7f-4ed1-afd0-221d7bff8b10	Tehnologija-KalkKosoStoritev-create	Tehnologija - Material kalkulacijske kosovnice - Ustvari	t	console	2015-01-07 18:44:42
a6c8eb23-94a1-4fdc-b210-9df7a3b51b02	Tehnologija-KalkKosoStoritev-lookup	Tehnologija - Material kalkulacijske kosovnice - Iskanje	t	console	2015-01-07 18:44:42
41dccca6-5299-4766-afb0-a07c8ba888aa	Tehnologija-Koso-delete	Tehnologija - Kosovnica - polizdelki in materiali - Briši	t	console	2015-01-07 18:44:42
48b8ab6e-2d8e-4d78-b851-47f38c6f7793	Tehnologija-Koso-read	Tehnologija - Kosovnica - polizdelki in materiali - Beri	t	console	2015-01-07 18:44:42
cba99773-79fa-4f0b-8676-bbb5593e01ca	Tehnologija-Koso-update	Tehnologija - Kosovnica - polizdelki in materiali - Posodobi	t	console	2015-01-07 18:44:42
3f59ef0b-17cc-49bc-8e42-271155586419	Tehnologija-Koso-create	Tehnologija - Kosovnica - polizdelki in materiali - Ustvari	t	console	2015-01-07 18:44:42
29f0e6ab-7a61-495f-8895-766fe1f0041e	Tehnologija-Koso-lookup	Tehnologija - Kosovnica - polizdelki in materiali - Iskanje	t	console	2015-01-07 18:44:42
d837b463-39c9-4e67-a5cd-b82337d7e32f	Tehnologija-KosoOper-delete	Tehnologija - Kosovnica - operacije - Briši	t	console	2015-01-07 18:44:42
aa2a7f0e-0dfb-47dd-8bf8-99a78cd6557a	Tehnologija-KosoOper-read	Tehnologija - Kosovnica - operacije - Beri	t	console	2015-01-07 18:44:42
5317a7d3-ded0-4299-999c-02dae4634f06	Tehnologija-KosoOper-update	Tehnologija - Kosovnica - operacije - Posodobi	t	console	2015-01-07 18:44:42
36f2cbe3-c625-4233-9bc2-742ae3eaa6ea	Tehnologija-KosoOper-create	Tehnologija - Kosovnica - operacije - Ustvari	t	console	2015-01-07 18:44:42
fb31a518-f559-42f0-9080-7f3640a364ce	Tehnologija-KosoOper-lookup	Tehnologija - Kosovnica - operacije - Iskanje	t	console	2015-01-07 18:44:42
23d7f614-a4c0-46af-874b-5f84093aa91d	Tehnologija-Nastavni-delete	Tehnologija - Nastavni list - Briši	t	console	2015-01-07 18:44:42
9e68a7d8-5bc1-4b09-a9f0-89991b1520bb	Tehnologija-Nastavni-read	Tehnologija - Nastavni list - Beri	t	console	2015-01-07 18:44:42
78a8b8c7-4a81-4e6c-87a1-0c783401d9b3	Tehnologija-Nastavni-update	Tehnologija - Nastavni list - Posodobi	t	console	2015-01-07 18:44:42
71c56524-a061-4089-86dd-9f968d9ba2f3	Tehnologija-Nastavni-create	Tehnologija - Nastavni list - Ustvari	t	console	2015-01-07 18:44:42
285fc079-f392-43b1-b5f6-67a9c6a46c31	Tehnologija-Nastavni-lookup	Tehnologija - Nastavni list - Iskanje	t	console	2015-01-07 18:44:42
2fe771cd-c7ae-481e-9534-f4bc52d14cec	Tehnologija-Norma-delete	Tehnologija - Norma - Briši	t	console	2015-01-07 18:44:42
6b3c9867-981c-43ea-93a2-fd6bab08fc3c	Tehnologija-Norma-read	Tehnologija - Norma - Beri	t	console	2015-01-07 18:44:42
9ea36717-ddc5-482f-b87b-f8b16797d4ca	Tehnologija-Norma-update	Tehnologija - Norma - Posodobi	t	console	2015-01-07 18:44:42
8f1bfa72-f4e3-48cf-a420-5c45b60c2ca3	Tehnologija-Norma-create	Tehnologija - Norma - Ustvari	t	console	2015-01-07 18:44:42
e3a0afec-ce02-4500-a74a-7be5d9a1fde0	Tehnologija-Norma-lookup	Tehnologija - Norma - Iskanje	t	console	2015-01-07 18:44:42
d1d207a9-2821-4a3c-9b61-fd932344375c	Tehnologija-PakiranjeProdukta-delete	Tehnologija - Specifikacija pakiranja produkta - Briši	t	console	2015-01-07 18:44:42
743675ef-bdab-4a30-a705-34b852cb47fd	Tehnologija-PakiranjeProdukta-read	Tehnologija - Specifikacija pakiranja produkta - Beri	t	console	2015-01-07 18:44:42
b0ecf943-5ef2-4cbe-9dd9-52598f7ebb9c	Tehnologija-PakiranjeProdukta-update	Tehnologija - Specifikacija pakiranja produkta - Posodobi	t	console	2015-01-07 18:44:42
0716ace0-5b99-4178-a5f6-5ba07b23409b	Tehnologija-PakiranjeProdukta-create	Tehnologija - Specifikacija pakiranja produkta - Ustvari	t	console	2015-01-07 18:44:42
88511906-fc03-467e-9e69-1349ef764372	Tehnologija-PakiranjeProdukta-lookup	Tehnologija - Specifikacija pakiranja produkta - Iskanje	t	console	2015-01-07 18:44:42
8e03e3bf-e819-45ff-a1ea-ad2fbd6d5e92	Tehnologija-Sklop-delete	Tehnologija - Sklop orodij - Briši	t	console	2015-01-07 18:44:42
43844e08-24ee-4e57-9f71-3f92ea87b61c	Tehnologija-Sklop-read	Tehnologija - Sklop orodij - Beri	t	console	2015-01-07 18:44:42
87a5aeff-fc74-44b3-9ff4-719249ccb2f2	Tehnologija-Sklop-update	Tehnologija - Sklop orodij - Posodobi	t	console	2015-01-07 18:44:42
fa2fca4e-9b69-4382-bae9-b6239ca8039f	Tehnologija-Sklop-create	Tehnologija - Sklop orodij - Ustvari	t	console	2015-01-07 18:44:42
7f922894-3c5f-492c-9c95-d13fcbc358bb	Tehnologija-Sklop-lookup	Tehnologija - Sklop orodij - Iskanje	t	console	2015-01-07 18:44:42
70db63bf-c94e-4de5-a78a-202ba2affb07	Tehnologija-SklopPozi-delete	Tehnologija - Postavka sklopa orodij - Briši	t	console	2015-01-07 18:44:42
858edc1c-61a7-4769-b561-cc0c2ace2c83	Tehnologija-SklopPozi-read	Tehnologija - Postavka sklopa orodij - Beri	t	console	2015-01-07 18:44:42
f4d48760-9459-4a7b-b24a-657282ca631a	Tehnologija-SklopPozi-update	Tehnologija - Postavka sklopa orodij - Posodobi	t	console	2015-01-07 18:44:42
329453f1-11fb-4275-85eb-14fe0489a96a	Tehnologija-SklopPozi-create	Tehnologija - Postavka sklopa orodij - Ustvari	t	console	2015-01-07 18:44:42
b5bfe7b3-91f5-4227-937e-96af62e5158e	Tehnologija-SklopPozi-lookup	Tehnologija - Postavka sklopa orodij - Iskanje	t	console	2015-01-07 18:44:42
c32d2b53-3e35-4cdb-98c3-2d9999199537	Proizvodnja-DelovniNalog-delete	Proizvodnja - Delovni nalog - Briši	t	console	2015-01-07 18:44:42
b484a29a-4184-42c1-8c34-494eab67efd9	Proizvodnja-DelovniNalog-read	Proizvodnja - Delovni nalog - Beri	t	console	2015-01-07 18:44:42
5dfc1e6c-a8bd-4e3f-a457-ebdae55a3587	Proizvodnja-DelovniNalog-update	Proizvodnja - Delovni nalog - Posodobi	t	console	2015-01-07 18:44:42
dbe2560a-1087-47b0-ae19-d7e85f7149e2	Proizvodnja-DelovniNalog-create	Proizvodnja - Delovni nalog - Ustvari	t	console	2015-01-07 18:44:42
5e0e121d-49b2-4bff-9973-6dd5ef43a4fb	Proizvodnja-DelovniNalog-lookup	Proizvodnja - Delovni nalog - Iskanje	t	console	2015-01-07 18:44:42
f0535d22-1521-4f88-a1bc-689980a885b1	Proizvodnja-Izvedba-delete	Proizvodnja - Delo po DN - Briši	t	console	2015-01-07 18:44:42
e0fb7953-5f28-49dd-a238-548cbcbd36f8	Proizvodnja-Izvedba-read	Proizvodnja - Delo po DN - Beri	t	console	2015-01-07 18:44:42
5c2525e6-07b4-4ea3-84d7-39d21f72ec00	Proizvodnja-Izvedba-update	Proizvodnja - Delo po DN - Posodobi	t	console	2015-01-07 18:44:42
f699e8f2-d81d-41c0-8405-ad16037f6a1b	Proizvodnja-Izvedba-create	Proizvodnja - Delo po DN - Ustvari	t	console	2015-01-07 18:44:42
b906362e-a33e-4856-a5c1-310b42b9841e	Proizvodnja-Izvedba-lookup	Proizvodnja - Delo po DN - Iskanje	t	console	2015-01-07 18:44:42
ca48e657-41f5-4ccf-a3e7-00937726afc8	Proizvodnja-IzvDelavec-delete	Proizvodnja - Podatki o izvedbi, kadar dela delavec (brez tehnološke enote) - Briši	t	console	2015-01-07 18:44:42
4cb25f9b-32ae-4913-9345-9e8ea4a049b3	Proizvodnja-IzvDelavec-read	Proizvodnja - Podatki o izvedbi, kadar dela delavec (brez tehnološke enote) - Beri	t	console	2015-01-07 18:44:42
68ef13d3-7274-4dcb-ad0d-e493a2a9ed4c	Proizvodnja-IzvDelavec-update	Proizvodnja - Podatki o izvedbi, kadar dela delavec (brez tehnološke enote) - Posodobi	t	console	2015-01-07 18:44:42
3110b42e-0710-46c3-94df-bbd4286a5146	Proizvodnja-IzvDelavec-create	Proizvodnja - Podatki o izvedbi, kadar dela delavec (brez tehnološke enote) - Ustvari	t	console	2015-01-07 18:44:42
31ae475c-c6c2-4926-a7b6-da49815cb963	Proizvodnja-IzvDelavec-lookup	Proizvodnja - Podatki o izvedbi, kadar dela delavec (brez tehnološke enote) - Iskanje	t	console	2015-01-07 18:44:42
8fa1402f-2385-4095-a507-0202f2fc439b	Proizvodnja-IzvDodelava-delete	Proizvodnja - Podatki o planu in izvedbi dodelave - Briši	t	console	2015-01-07 18:44:42
f73d28eb-a901-4e41-9adb-b5942c0754ab	Proizvodnja-IzvDodelava-read	Proizvodnja - Podatki o planu in izvedbi dodelave - Beri	t	console	2015-01-07 18:44:42
7932fc6b-f0df-40ef-9730-cde36a8ef7af	Proizvodnja-IzvDodelava-update	Proizvodnja - Podatki o planu in izvedbi dodelave - Posodobi	t	console	2015-01-07 18:44:42
d3acbd67-9bde-44be-aaf2-54a78df9f25d	Proizvodnja-IzvDodelava-create	Proizvodnja - Podatki o planu in izvedbi dodelave - Ustvari	t	console	2015-01-07 18:44:42
29e310e4-0722-43e4-9115-d615e2f9dac6	Proizvodnja-IzvDodelava-lookup	Proizvodnja - Podatki o planu in izvedbi dodelave - Iskanje	t	console	2015-01-07 18:44:42
8f7cbbb1-346f-4adb-a9c0-a050139f171c	Proizvodnja-IzvedbaPodrobno-delete	Proizvodnja - Izvedba operacije - podrobno - Briši	t	console	2015-01-07 18:44:42
7b811ad9-5671-4079-a86e-e1bfd2289061	Proizvodnja-IzvedbaPodrobno-read	Proizvodnja - Izvedba operacije - podrobno - Beri	t	console	2015-01-07 18:44:42
0c68e89c-22bb-4b35-b44b-34d7407d5ae8	Proizvodnja-IzvedbaPodrobno-update	Proizvodnja - Izvedba operacije - podrobno - Posodobi	t	console	2015-01-07 18:44:42
eb777f04-f80d-40e9-b271-ced3dc5ecc1a	Proizvodnja-IzvedbaPodrobno-create	Proizvodnja - Izvedba operacije - podrobno - Ustvari	t	console	2015-01-07 18:44:42
7b8f5580-7730-4a0f-9004-a7ef827df79e	Proizvodnja-IzvedbaPodrobno-lookup	Proizvodnja - Izvedba operacije - podrobno - Iskanje	t	console	2015-01-07 18:44:42
df857980-7759-443f-b777-2562e21e89c1	Proizvodnja-IzvedbaDelo-delete	Proizvodnja - Izvedba operacije - delo  - Briši	t	console	2015-01-07 18:44:42
ce67d980-321f-4c10-b6a7-998e24ea230a	Proizvodnja-IzvedbaDelo-read	Proizvodnja - Izvedba operacije - delo  - Beri	t	console	2015-01-07 18:44:42
0b6e83ca-55d2-4f4c-b043-e7112da0de6d	Proizvodnja-IzvedbaDelo-update	Proizvodnja - Izvedba operacije - delo  - Posodobi	t	console	2015-01-07 18:44:42
9135267f-8794-41ed-9e6b-a570241a69c0	Proizvodnja-IzvedbaDelo-create	Proizvodnja - Izvedba operacije - delo  - Ustvari	t	console	2015-01-07 18:44:42
849555e9-8fda-44b8-b322-88714c9dbfbc	Proizvodnja-IzvedbaDelo-lookup	Proizvodnja - Izvedba operacije - delo  - Iskanje	t	console	2015-01-07 18:44:42
83972177-41cf-4d97-8079-0b3a184f6cb7	Proizvodnja-IzvedbaNastavitev-delete	Proizvodnja - Izvedba operacije - nastavitev stroja - Briši	t	console	2015-01-07 18:44:42
8c860a3b-0dc5-4d90-b97c-5071276610a0	Proizvodnja-IzvedbaNastavitev-read	Proizvodnja - Izvedba operacije - nastavitev stroja - Beri	t	console	2015-01-07 18:44:42
334dab96-b7ea-449f-8dc5-00fbfea46970	Proizvodnja-IzvedbaNastavitev-update	Proizvodnja - Izvedba operacije - nastavitev stroja - Posodobi	t	console	2015-01-07 18:44:42
2b92147a-0bc6-4d82-98c3-90a78f2dfe51	Proizvodnja-IzvedbaNastavitev-create	Proizvodnja - Izvedba operacije - nastavitev stroja - Ustvari	t	console	2015-01-07 18:44:42
cb2c173a-cbc8-47aa-a310-de320e11c9a3	Proizvodnja-IzvedbaNastavitev-lookup	Proizvodnja - Izvedba operacije - nastavitev stroja - Iskanje	t	console	2015-01-07 18:44:42
da4213e0-32c0-4d8d-8610-afc7879d4128	Proizvodnja-IzvedbaPopravilo-delete	Proizvodnja - Izvedba operacije - popravilo - Briši	t	console	2015-01-07 18:44:42
6ac60398-e07a-4e41-bb73-c3e082342468	Proizvodnja-IzvedbaPopravilo-read	Proizvodnja - Izvedba operacije - popravilo - Beri	t	console	2015-01-07 18:44:42
cb01c428-7bc9-4b9a-bb14-4104908ec765	Proizvodnja-IzvedbaPopravilo-update	Proizvodnja - Izvedba operacije - popravilo - Posodobi	t	console	2015-01-07 18:44:42
c2978b2b-8743-432a-938f-fc84cc85c5e8	Proizvodnja-IzvedbaPopravilo-create	Proizvodnja - Izvedba operacije - popravilo - Ustvari	t	console	2015-01-07 18:44:42
a072e693-0f00-46b9-a019-69d0fc77d26c	Proizvodnja-IzvedbaPopravilo-lookup	Proizvodnja - Izvedba operacije - popravilo - Iskanje	t	console	2015-01-07 18:44:42
b486d855-e9d4-4b5f-8aa3-176e62f76b65	Proizvodnja-IzvedbaZastoj-delete	Proizvodnja - Izvedba operacije - zastoj - Briši	t	console	2015-01-07 18:44:42
10eedddf-d88d-49e6-9705-9f926d11808c	Proizvodnja-IzvedbaZastoj-read	Proizvodnja - Izvedba operacije - zastoj - Beri	t	console	2015-01-07 18:44:42
542c6b0e-50ad-44be-81e1-10a0748415f9	Proizvodnja-IzvedbaZastoj-update	Proizvodnja - Izvedba operacije - zastoj - Posodobi	t	console	2015-01-07 18:44:42
6ad9097e-47e2-4f09-a34c-6e7a390edade	Proizvodnja-IzvedbaZastoj-create	Proizvodnja - Izvedba operacije - zastoj - Ustvari	t	console	2015-01-07 18:44:42
340c33f9-44c1-4a4e-818e-e0fcbe98970b	Proizvodnja-IzvedbaZastoj-lookup	Proizvodnja - Izvedba operacije - zastoj - Iskanje	t	console	2015-01-07 18:44:42
868e5098-ef8e-46bd-bf24-c77d432a98f0	Proizvodnja-IzvTehen-delete	Proizvodnja - Podatki o delu in izvedbi operacij na tehnoloških enotah - Briši	t	console	2015-01-07 18:44:42
3fd5fc4c-d916-4d8d-a802-b6351f2a16bb	Proizvodnja-IzvTehen-read	Proizvodnja - Podatki o delu in izvedbi operacij na tehnoloških enotah - Beri	t	console	2015-01-07 18:44:42
aa56ba3a-3cec-4f31-90cb-aa84c2d65589	Proizvodnja-IzvTehen-update	Proizvodnja - Podatki o delu in izvedbi operacij na tehnoloških enotah - Posodobi	t	console	2015-01-07 18:44:42
8a6d4dc9-c895-44fe-bb7f-5d380b6cd6b9	Proizvodnja-IzvTehen-create	Proizvodnja - Podatki o delu in izvedbi operacij na tehnoloških enotah - Ustvari	t	console	2015-01-07 18:44:42
1f892741-d5c7-45cf-8631-f66fa16bf4eb	Proizvodnja-IzvTehen-lookup	Proizvodnja - Podatki o delu in izvedbi operacij na tehnoloških enotah - Iskanje	t	console	2015-01-07 18:44:42
3d1be982-16f0-43c2-8c43-8474015ca9d2	Proizvodnja-Koledar-delete	Proizvodnja - Delovni koledar proizvodnje - Briši	t	console	2015-01-07 18:44:42
13d40ae1-5122-48f7-9670-d8b157f5414c	Proizvodnja-Koledar-read	Proizvodnja - Delovni koledar proizvodnje - Beri	t	console	2015-01-07 18:44:42
1417a22d-6d78-4462-adad-7e1160be0ba8	Proizvodnja-Koledar-update	Proizvodnja - Delovni koledar proizvodnje - Posodobi	t	console	2015-01-07 18:44:42
eb6b88d9-8474-40cb-a2bc-23c18f5fcf06	Proizvodnja-Koledar-create	Proizvodnja - Delovni koledar proizvodnje - Ustvari	t	console	2015-01-07 18:44:42
ad9a0952-25e6-45bb-8315-5d9966a8f3d9	Proizvodnja-Koledar-lookup	Proizvodnja - Delovni koledar proizvodnje - Iskanje	t	console	2015-01-07 18:44:42
630157d6-90e6-4110-9e44-62d834f7a086	Proizvodnja-PoslovniPlan-delete	Proizvodnja - Plan kapacitet - Briši	t	console	2015-01-07 18:44:42
2a7337a2-db7d-4577-822f-183bc75ec621	Proizvodnja-PoslovniPlan-read	Proizvodnja - Plan kapacitet - Beri	t	console	2015-01-07 18:44:42
92ff55c2-64ea-4563-96a2-b525d6d72429	Proizvodnja-PoslovniPlan-update	Proizvodnja - Plan kapacitet - Posodobi	t	console	2015-01-07 18:44:42
66f02079-a1fa-4a73-a059-87b96f600168	Proizvodnja-PoslovniPlan-create	Proizvodnja - Plan kapacitet - Ustvari	t	console	2015-01-07 18:44:42
8ca28a9b-8160-49d3-a618-5b64a19b8a81	Proizvodnja-PoslovniPlan-lookup	Proizvodnja - Plan kapacitet - Iskanje	t	console	2015-01-07 18:44:42
a6148d3c-959f-43bd-8f19-cb3709a6af5e	Proizvodnja-PoslovniPlanArtikla-delete	Proizvodnja - Plan kapcitet - Artikli v proizvodnji - Briši	t	console	2015-01-07 18:44:42
80935b37-f253-45cb-a8a1-9bef80591dc7	Proizvodnja-PoslovniPlanArtikla-read	Proizvodnja - Plan kapcitet - Artikli v proizvodnji - Beri	t	console	2015-01-07 18:44:42
42ddeaaa-d333-48a1-8a88-3c2bb7409efc	Proizvodnja-PoslovniPlanArtikla-update	Proizvodnja - Plan kapcitet - Artikli v proizvodnji - Posodobi	t	console	2015-01-07 18:44:42
88f191c3-4fed-4aa3-ab1d-00da7c805d33	Proizvodnja-PoslovniPlanArtikla-create	Proizvodnja - Plan kapcitet - Artikli v proizvodnji - Ustvari	t	console	2015-01-07 18:44:42
a9e7edd9-5201-4d4e-b3f5-ff4dac83aa01	Proizvodnja-PoslovniPlanArtikla-lookup	Proizvodnja - Plan kapcitet - Artikli v proizvodnji - Iskanje	t	console	2015-01-07 18:44:42
a9edd434-0270-4cdf-861b-8c179d67a795	Proizvodnja-PoslovniPlanKadri-delete	Proizvodnja - Plan kapacitet - kadrovske kapacitete - Briši	t	console	2015-01-07 18:44:42
463cc201-c090-4f42-bb75-2db8b174015b	Proizvodnja-PoslovniPlanKadri-read	Proizvodnja - Plan kapacitet - kadrovske kapacitete - Beri	t	console	2015-01-07 18:44:42
d17be867-a665-4b82-acf3-a6e915ee8722	Proizvodnja-PoslovniPlanKadri-update	Proizvodnja - Plan kapacitet - kadrovske kapacitete - Posodobi	t	console	2015-01-07 18:44:42
9e358e40-6412-429e-8be3-6bcce4e7f5a3	Proizvodnja-PoslovniPlanKadri-create	Proizvodnja - Plan kapacitet - kadrovske kapacitete - Ustvari	t	console	2015-01-07 18:44:42
b1e84991-de8a-4f18-b1e7-886aa489fe86	Proizvodnja-PoslovniPlanKadri-lookup	Proizvodnja - Plan kapacitet - kadrovske kapacitete - Iskanje	t	console	2015-01-07 18:44:42
e918fe0a-175d-40a0-a5e8-41160bbc6342	Proizvodnja-PoslovniPlanNapoved-delete	Proizvodnja - Plan kapacitet - napoved odjema produktov - Briši	t	console	2015-01-07 18:44:42
da400c88-b1be-4a01-9248-4a3fd0e8500e	Proizvodnja-PoslovniPlanNapoved-read	Proizvodnja - Plan kapacitet - napoved odjema produktov - Beri	t	console	2015-01-07 18:44:42
f0eb491c-a2bb-46bf-890f-7e22d95623e9	Proizvodnja-PoslovniPlanNapoved-update	Proizvodnja - Plan kapacitet - napoved odjema produktov - Posodobi	t	console	2015-01-07 18:44:42
2ef36c2c-df8b-4eb4-ae2b-7e2471b3db20	Proizvodnja-PoslovniPlanNapoved-create	Proizvodnja - Plan kapacitet - napoved odjema produktov - Ustvari	t	console	2015-01-07 18:44:42
51a430c9-7b89-4574-b030-84aa19e45130	Proizvodnja-PoslovniPlanNapoved-lookup	Proizvodnja - Plan kapacitet - napoved odjema produktov - Iskanje	t	console	2015-01-07 18:44:42
ae248fc7-33b4-4fa5-8bbe-8e13d7b68d2b	Proizvodnja-PoslovniPlanNarocilo-delete	Proizvodnja - Plan kapcitet - naročilo - Briši	t	console	2015-01-07 18:44:42
65fdea8d-69ab-4a3b-8562-00f752ddfd3b	Proizvodnja-PoslovniPlanNarocilo-read	Proizvodnja - Plan kapcitet - naročilo - Beri	t	console	2015-01-07 18:44:42
2ed970fa-01d0-4d3c-a261-2ab18cc01470	Proizvodnja-PoslovniPlanNarocilo-update	Proizvodnja - Plan kapcitet - naročilo - Posodobi	t	console	2015-01-07 18:44:42
719d29e6-2c99-4d1f-8dc0-60dd47dfb30f	Proizvodnja-PoslovniPlanNarocilo-create	Proizvodnja - Plan kapcitet - naročilo - Ustvari	t	console	2015-01-07 18:44:42
9b0ef083-e834-4900-b387-47e92cf553e5	Proizvodnja-PoslovniPlanNarocilo-lookup	Proizvodnja - Plan kapcitet - naročilo - Iskanje	t	console	2015-01-07 18:44:42
8ee0f149-8bd0-4ede-8103-e1fcdc63c380	Proizvodnja-PoslovniPlanObdobje-delete	Proizvodnja - Plan kapacitet - obdobje plana - Briši	t	console	2015-01-07 18:44:42
cb329aa9-c097-48af-985a-5827f5ba9f30	Proizvodnja-PoslovniPlanObdobje-read	Proizvodnja - Plan kapacitet - obdobje plana - Beri	t	console	2015-01-07 18:44:42
5ed4bd1e-073f-4866-913c-c7a7c14fb08f	Proizvodnja-PoslovniPlanObdobje-update	Proizvodnja - Plan kapacitet - obdobje plana - Posodobi	t	console	2015-01-07 18:44:42
caab37e6-83e5-4eed-86ce-a1dfc95a65dd	Proizvodnja-PoslovniPlanObdobje-create	Proizvodnja - Plan kapacitet - obdobje plana - Ustvari	t	console	2015-01-07 18:44:42
fa6a1d41-b052-46fd-9811-daa2e9053716	Proizvodnja-PoslovniPlanObdobje-lookup	Proizvodnja - Plan kapacitet - obdobje plana - Iskanje	t	console	2015-01-07 18:44:42
ee86691b-f480-4dad-ad6e-c03c6d8611f7	Proizvodnja-PoslovniPlanProizvodnja-delete	Proizvodnja - Plan kapacitet - proizvodnja artikla v obdobju - Briši	t	console	2015-01-07 18:44:42
cc72b17c-f70d-4330-923d-847d75b4db24	Proizvodnja-PoslovniPlanProizvodnja-read	Proizvodnja - Plan kapacitet - proizvodnja artikla v obdobju - Beri	t	console	2015-01-07 18:44:42
95e3caaf-07ba-4c3a-b9f3-7bdafd8fe564	Proizvodnja-PoslovniPlanProizvodnja-update	Proizvodnja - Plan kapacitet - proizvodnja artikla v obdobju - Posodobi	t	console	2015-01-07 18:44:42
5d22db48-1ac7-4123-a660-ab2e838c0034	Proizvodnja-PoslovniPlanProizvodnja-create	Proizvodnja - Plan kapacitet - proizvodnja artikla v obdobju - Ustvari	t	console	2015-01-07 18:44:42
f117b622-cc0a-4fce-9f61-f4577bc7668e	Proizvodnja-PoslovniPlanProizvodnja-lookup	Proizvodnja - Plan kapacitet - proizvodnja artikla v obdobju - Iskanje	t	console	2015-01-07 18:44:42
01d201cb-7d41-4c7d-8529-b028b028c599	Proizvodnja-PoslovniPlanUreTehen-delete	Proizvodnja - Plan kapacitet - tehnolški koledar - Briši	t	console	2015-01-07 18:44:42
8687023d-e250-4597-8d0a-86d813d32727	Proizvodnja-PoslovniPlanUreTehen-read	Proizvodnja - Plan kapacitet - tehnolški koledar - Beri	t	console	2015-01-07 18:44:42
3384045c-50fe-4080-8bd8-bd0dbfc6dd88	Proizvodnja-PoslovniPlanUreTehen-update	Proizvodnja - Plan kapacitet - tehnolški koledar - Posodobi	t	console	2015-01-07 18:44:42
e1d5ca17-239d-4b08-9aed-087a0a0d854c	Proizvodnja-PoslovniPlanUreTehen-create	Proizvodnja - Plan kapacitet - tehnolški koledar - Ustvari	t	console	2015-01-07 18:44:42
863c17f6-b2f9-426e-ad86-4df1b0fa7476	Proizvodnja-PoslovniPlanUreTehen-lookup	Proizvodnja - Plan kapacitet - tehnolški koledar - Iskanje	t	console	2015-01-07 18:44:42
ae8e8025-c068-490d-a81b-638c43ffd493	Proizvodnja-RazpisanaOperacija-delete	Proizvodnja - Razpisana kosovnica - operacija - Briši	t	console	2015-01-07 18:44:42
d3e3601e-a6da-4854-8f27-1d127034b5b9	Proizvodnja-RazpisanaOperacija-read	Proizvodnja - Razpisana kosovnica - operacija - Beri	t	console	2015-01-07 18:44:42
2b9f8a28-1bc5-414e-9569-ba078d958c88	Proizvodnja-RazpisanaOperacija-update	Proizvodnja - Razpisana kosovnica - operacija - Posodobi	t	console	2015-01-07 18:44:42
d73d319b-9818-43b2-be70-a76e336f49b8	Proizvodnja-RazpisanaOperacija-create	Proizvodnja - Razpisana kosovnica - operacija - Ustvari	t	console	2015-01-07 18:44:42
977ba2dc-32c1-4f86-a67f-46f70a7dfad9	Proizvodnja-RazpisanaOperacija-lookup	Proizvodnja - Razpisana kosovnica - operacija - Iskanje	t	console	2015-01-07 18:44:42
da738e12-7086-4faa-8be3-88b9d6d2dffe	Proizvodnja-RazpisKoso-delete	Proizvodnja - Razpisana kosovnica - materiali in polizdelki - Briši	t	console	2015-01-07 18:44:42
672e4b92-e70a-4f4f-b842-b18967525561	Proizvodnja-RazpisKoso-read	Proizvodnja - Razpisana kosovnica - materiali in polizdelki - Beri	t	console	2015-01-07 18:44:42
f164d371-ccdd-403e-9971-1cddf1ab6b89	Proizvodnja-RazpisKoso-update	Proizvodnja - Razpisana kosovnica - materiali in polizdelki - Posodobi	t	console	2015-01-07 18:44:42
85b90345-9b10-4660-8d7d-81a2c47a8bf4	Proizvodnja-RazpisKoso-create	Proizvodnja - Razpisana kosovnica - materiali in polizdelki - Ustvari	t	console	2015-01-07 18:44:42
524aad82-edfa-42c4-aa82-03c68c6677de	Proizvodnja-RazpisKoso-lookup	Proizvodnja - Razpisana kosovnica - materiali in polizdelki - Iskanje	t	console	2015-01-07 18:44:42
e5c3e4e8-bb8d-45d8-a1da-1717e655ce99	Proizvodnja-StatusTehen-delete	Proizvodnja - Stanje tehnološke enote - Briši	t	console	2015-01-07 18:44:42
6bea3bab-ab48-4c1a-953e-92d72b917624	Proizvodnja-StatusTehen-read	Proizvodnja - Stanje tehnološke enote - Beri	t	console	2015-01-07 18:44:42
7db639d2-8531-4a14-967e-4afc7da10d3a	Proizvodnja-StatusTehen-update	Proizvodnja - Stanje tehnološke enote - Posodobi	t	console	2015-01-07 18:44:42
c2242c9f-f787-4caa-a6e9-79e929c7f61f	Proizvodnja-StatusTehen-create	Proizvodnja - Stanje tehnološke enote - Ustvari	t	console	2015-01-07 18:44:42
4975d1a9-6563-45b3-b794-0afc16f64913	Proizvodnja-StatusTehen-lookup	Proizvodnja - Stanje tehnološke enote - Iskanje	t	console	2015-01-07 18:44:42
2378ee71-569f-49f5-aa69-38aa9f84f1ec	Proizvodnja-Tekoledar-delete	Proizvodnja - Tehnološki koledar - Briši	t	console	2015-01-07 18:44:42
7346018e-ec54-4c2b-8d6d-0cc8003abeab	Proizvodnja-Tekoledar-read	Proizvodnja - Tehnološki koledar - Beri	t	console	2015-01-07 18:44:42
c2966949-98d0-4795-8487-4eac1ad7b3bc	Proizvodnja-Tekoledar-update	Proizvodnja - Tehnološki koledar - Posodobi	t	console	2015-01-07 18:44:42
343e3d75-cbb8-4970-aea4-7fdb99ead68e	Proizvodnja-Tekoledar-create	Proizvodnja - Tehnološki koledar - Ustvari	t	console	2015-01-07 18:44:42
a933bf11-5ca2-4361-aac7-5dfd28f6ab47	Proizvodnja-Tekoledar-lookup	Proizvodnja - Tehnološki koledar - Iskanje	t	console	2015-01-07 18:44:42
45824b5b-a7cb-4e09-8761-50375f42d42a	Proizvodnja-Zastoj-delete	Proizvodnja - Vrsta zastoja - Briši	t	console	2015-01-07 18:44:42
da24584b-b8b5-4ba6-9707-9553813dd009	Proizvodnja-Zastoj-read	Proizvodnja - Vrsta zastoja - Beri	t	console	2015-01-07 18:44:42
2f9ff4e4-bb48-4f17-ad54-240ec4bb45ac	Proizvodnja-Zastoj-update	Proizvodnja - Vrsta zastoja - Posodobi	t	console	2015-01-07 18:44:42
02e278b5-fd2e-4f47-a7ae-2b9812f5ec04	Proizvodnja-Zastoj-create	Proizvodnja - Vrsta zastoja - Ustvari	t	console	2015-01-07 18:44:42
fe0b3793-f9b7-4b72-990e-00a248c8b1b3	Proizvodnja-Zastoj-lookup	Proizvodnja - Vrsta zastoja - Iskanje	t	console	2015-01-07 18:44:42
9378c41d-0007-47d4-8695-aa59e63d0efb	Logistika-Cena-delete	Logistika - Cena v ceniku - Briši	t	console	2015-01-07 18:44:42
13234e0f-1430-4abd-a50e-0118a8aa7440	Logistika-Cena-read	Logistika - Cena v ceniku - Beri	t	console	2015-01-07 18:44:42
a740c082-e149-49f1-9301-0fb2d8289541	Logistika-Cena-update	Logistika - Cena v ceniku - Posodobi	t	console	2015-01-07 18:44:42
debab475-9542-4c77-beaa-c7f09911f91d	Logistika-Cena-create	Logistika - Cena v ceniku - Ustvari	t	console	2015-01-07 18:44:42
c813309c-7459-4141-9d59-81b134f20a15	Logistika-Cena-lookup	Logistika - Cena v ceniku - Iskanje	t	console	2015-01-07 18:44:42
ccfa3ac9-c5a3-4478-97e3-f9d6b4e1823d	Logistika-Dobava-delete	Logistika - Dobava - Briši	t	console	2015-01-07 18:44:42
0970f278-f13b-4b30-b50d-f2685cafee18	Logistika-Dobava-read	Logistika - Dobava - Beri	t	console	2015-01-07 18:44:42
003d27a8-4056-4f61-a6ce-6e9078c82ada	Logistika-Dobava-update	Logistika - Dobava - Posodobi	t	console	2015-01-07 18:44:42
d0933d10-e1c8-41f5-8a01-220bf0b32b16	Logistika-Dobava-create	Logistika - Dobava - Ustvari	t	console	2015-01-07 18:44:42
54308885-af15-463e-944e-b8c9182505eb	Logistika-Dobava-lookup	Logistika - Dobava - Iskanje	t	console	2015-01-07 18:44:42
393ecf9f-bb86-4742-99f6-ad7c4d6c1470	Logistika-DokumentMat-delete	Logistika - Dokument materialnega poslovanja - Briši	t	console	2015-01-07 18:44:42
f93358c5-e645-4278-8c8c-f108463b1b3b	Logistika-DokumentMat-read	Logistika - Dokument materialnega poslovanja - Beri	t	console	2015-01-07 18:44:42
24778713-d67d-47cd-b0bc-748373c0b97f	Logistika-DokumentMat-update	Logistika - Dokument materialnega poslovanja - Posodobi	t	console	2015-01-07 18:44:42
bcaa3201-3e50-4865-acf0-23c0601be584	Logistika-DokumentMat-create	Logistika - Dokument materialnega poslovanja - Ustvari	t	console	2015-01-07 18:44:42
8bf521cc-e0b8-485e-8876-c9b74bd9351f	Logistika-DokumentMat-lookup	Logistika - Dokument materialnega poslovanja - Iskanje	t	console	2015-01-07 18:44:42
6a64622f-989c-4787-b9cf-66988a37598d	Logistika-DokumentDobavnica-delete	Logistika - Dobavnica - Briši	t	console	2015-01-07 18:44:42
37c99649-4e33-4f11-b275-cdd9dadd6bf6	Logistika-DokumentDobavnica-read	Logistika - Dobavnica - Beri	t	console	2015-01-07 18:44:42
4544b83f-67e8-4b5a-8edd-f1d852849084	Logistika-DokumentDobavnica-update	Logistika - Dobavnica - Posodobi	t	console	2015-01-07 18:44:42
53525e3f-563c-4be5-ac49-5cfc3abf3132	Logistika-DokumentDobavnica-create	Logistika - Dobavnica - Ustvari	t	console	2015-01-07 18:44:42
326ca080-5075-40dd-9641-f197e68c8d0e	Logistika-DokumentDobavnica-lookup	Logistika - Dobavnica - Iskanje	t	console	2015-01-07 18:44:42
572ccfd2-ef77-4bdd-99d3-32c657fad753	Logistika-DokumentIzdajnica-delete	Logistika - Izdajnica - Briši	t	console	2015-01-07 18:44:42
d4eb0e2a-1980-4c6e-9fde-25a843a77bec	Logistika-DokumentIzdajnica-read	Logistika - Izdajnica - Beri	t	console	2015-01-07 18:44:42
817f58e4-9acb-4599-bfd8-18875a8b68d1	Logistika-DokumentIzdajnica-update	Logistika - Izdajnica - Posodobi	t	console	2015-01-07 18:44:42
ea153afb-0ec6-4382-8c96-2c3e9bb6a10a	Logistika-DokumentIzdajnica-create	Logistika - Izdajnica - Ustvari	t	console	2015-01-07 18:44:42
f319c08d-500e-42c7-b968-2adb725276ff	Logistika-DokumentIzdajnica-lookup	Logistika - Izdajnica - Iskanje	t	console	2015-01-07 18:44:42
13eef389-09d2-4879-8986-a2b35f26a0b5	Logistika-DokumentPredajnica-delete	Logistika - Predajnica - Briši	t	console	2015-01-07 18:44:42
1a73551e-59cd-4e68-af6c-43450cc920c0	Logistika-DokumentPredajnica-read	Logistika - Predajnica - Beri	t	console	2015-01-07 18:44:42
eed20a71-7576-431d-8e53-052e7ff27407	Logistika-DokumentPredajnica-update	Logistika - Predajnica - Posodobi	t	console	2015-01-07 18:44:42
55aa7349-66b5-451e-b393-0fc8eb660f6b	Logistika-DokumentPredajnica-create	Logistika - Predajnica - Ustvari	t	console	2015-01-07 18:44:42
1031a3ce-5a73-421e-bfa8-f472b5c378e7	Logistika-DokumentPredajnica-lookup	Logistika - Predajnica - Iskanje	t	console	2015-01-07 18:44:42
0d9598f9-b233-43a3-ab21-49ddb7eaabda	Logistika-DokumentPremik-delete	Logistika - Premik - Briši	t	console	2015-01-07 18:44:42
4a098879-04d8-4cb2-987b-d3a1569ed6cb	Logistika-DokumentPremik-read	Logistika - Premik - Beri	t	console	2015-01-07 18:44:42
cc6e3628-66ac-49cd-aa54-cdd28e0b6b83	Logistika-DokumentPremik-update	Logistika - Premik - Posodobi	t	console	2015-01-07 18:44:42
4732f0f4-e9f0-4c4b-889e-6fbd92377c87	Logistika-DokumentPremik-create	Logistika - Premik - Ustvari	t	console	2015-01-07 18:44:42
c2f21b0c-3528-43ee-b443-aed17e31408d	Logistika-DokumentPremik-lookup	Logistika - Premik - Iskanje	t	console	2015-01-07 18:44:42
b9fcae78-fd41-4640-ba38-ef195da5aebb	Logistika-DokumentPrevrednotenje-delete	Logistika - Prevrednotenje - Briši	t	console	2015-01-07 18:44:42
96b3a884-9b82-49a3-b19b-530a07df0d25	Logistika-DokumentPrevrednotenje-read	Logistika - Prevrednotenje - Beri	t	console	2015-01-07 18:44:42
6dbfefb6-6af5-470c-8bbc-d6f230606dd7	Logistika-DokumentPrevrednotenje-update	Logistika - Prevrednotenje - Posodobi	t	console	2015-01-07 18:44:42
15b2fc17-1103-452b-afad-eeaae04b59a5	Logistika-DokumentPrevrednotenje-create	Logistika - Prevrednotenje - Ustvari	t	console	2015-01-07 18:44:42
27a1d35c-6550-4ae7-9fac-767f855c3706	Logistika-DokumentPrevrednotenje-lookup	Logistika - Prevrednotenje - Iskanje	t	console	2015-01-07 18:44:42
632aba0f-12ad-4b45-a6d6-a23b282ef868	Logistika-DokumentPrevzemnica-delete	Logistika - Prevzemnica - Briši	t	console	2015-01-07 18:44:42
a30711e5-ffa5-47fa-99cc-d7d6a1b092be	Logistika-DokumentPrevzemnica-read	Logistika - Prevzemnica - Beri	t	console	2015-01-07 18:44:42
9a48ccc1-5fd1-45a4-ac61-2f4bc61597aa	Logistika-DokumentPrevzemnica-update	Logistika - Prevzemnica - Posodobi	t	console	2015-01-07 18:44:42
bd4c9e48-eda3-4124-aadf-aca8a84d3e29	Logistika-DokumentPrevzemnica-create	Logistika - Prevzemnica - Ustvari	t	console	2015-01-07 18:44:42
084fa87b-2d7b-4dc4-a649-057512f59417	Logistika-DokumentPrevzemnica-lookup	Logistika - Prevzemnica - Iskanje	t	console	2015-01-07 18:44:42
1b21e8ea-f5f4-463a-b332-cfa6f936a9ae	Logistika-LastnostLokacije-delete	Logistika - Lastnosti lokacije - Briši	t	console	2015-01-07 18:44:42
397676ae-4e16-4b1e-8b5e-cf8974180628	Logistika-LastnostLokacije-read	Logistika - Lastnosti lokacije - Beri	t	console	2015-01-07 18:44:42
4605620b-d5fb-4d03-9f4e-c6e4faa87c16	Logistika-LastnostLokacije-update	Logistika - Lastnosti lokacije - Posodobi	t	console	2015-01-07 18:44:42
d27d498c-fb31-42ad-9af7-a5eaea7e5c71	Logistika-LastnostLokacije-create	Logistika - Lastnosti lokacije - Ustvari	t	console	2015-01-07 18:44:42
6a77186a-5deb-468f-b506-7da7ef1e9e34	Logistika-LastnostLokacije-lookup	Logistika - Lastnosti lokacije - Iskanje	t	console	2015-01-07 18:44:42
8b97bc5c-e72a-4640-91c5-9a0e0b7b7a17	Logistika-Lokacija-delete	Logistika - Skladiščna Lokacija - Briši	t	console	2015-01-07 18:44:42
51c16557-4e72-4d74-acdf-5c642d06cc88	Logistika-Lokacija-read	Logistika - Skladiščna Lokacija - Beri	t	console	2015-01-07 18:44:42
eb668c95-4fd2-453a-9a2f-c4cc08df75cc	Logistika-Lokacija-update	Logistika - Skladiščna Lokacija - Posodobi	t	console	2015-01-07 18:44:42
2779c4b0-e9de-45aa-bdba-09003b38ed24	Logistika-Lokacija-create	Logistika - Skladiščna Lokacija - Ustvari	t	console	2015-01-07 18:44:42
829d0298-6c11-4408-b210-3e2555b40859	Logistika-Lokacija-lookup	Logistika - Skladiščna Lokacija - Iskanje	t	console	2015-01-07 18:44:42
5f05597f-a348-4fbd-8a8e-04fbcb8e7817	Logistika-OdvisniStroski-delete	Logistika - Vrsta stroška - Briši	t	console	2015-01-07 18:44:42
67122c68-3952-4223-91dc-605701c6e056	Logistika-OdvisniStroski-read	Logistika - Vrsta stroška - Beri	t	console	2015-01-07 18:44:42
e52a9f46-e257-4227-9a58-6a31470caa17	Logistika-OdvisniStroski-update	Logistika - Vrsta stroška - Posodobi	t	console	2015-01-07 18:44:42
fd380982-ba24-40a7-9964-397bd3fb8279	Logistika-OdvisniStroski-create	Logistika - Vrsta stroška - Ustvari	t	console	2015-01-07 18:44:42
59c133cd-521c-4c70-9789-9c3efee4e9a9	Logistika-OdvisniStroski-lookup	Logistika - Vrsta stroška - Iskanje	t	console	2015-01-07 18:44:42
6a83c32f-f611-4006-a4e2-6bed5d5de403	Logistika-PaketProduktov-delete	Logistika - Paket produktov - Briši	t	console	2015-01-07 18:44:42
2cd7d0d6-bc75-4964-be3d-d5eab00e18c4	Logistika-PaketProduktov-read	Logistika - Paket produktov - Beri	t	console	2015-01-07 18:44:42
1fa99d12-2475-4f97-b7c8-b1c1b910e6b8	Logistika-PaketProduktov-update	Logistika - Paket produktov - Posodobi	t	console	2015-01-07 18:44:42
bb0f413e-c866-48f4-af85-a977931b99cb	Logistika-PaketProduktov-create	Logistika - Paket produktov - Ustvari	t	console	2015-01-07 18:44:42
c75b27b8-76d1-484f-b579-bb26cc8ff12a	Logistika-PaketProduktov-lookup	Logistika - Paket produktov - Iskanje	t	console	2015-01-07 18:44:42
3a521187-e6f1-4848-912c-b153b3b26f3d	Logistika-PorekloProduktov-delete	Logistika - Poreklo produkta v paketu - Briši	t	console	2015-01-07 18:44:42
6ef96a3f-33bc-4f6f-abda-059cf4e41c59	Logistika-PorekloProduktov-read	Logistika - Poreklo produkta v paketu - Beri	t	console	2015-01-07 18:44:42
ce428fbd-d832-4ab7-9a3f-bb0fc2b075cf	Logistika-PorekloProduktov-update	Logistika - Poreklo produkta v paketu - Posodobi	t	console	2015-01-07 18:44:42
167c7024-c879-4d6c-a734-81dd2d33657d	Logistika-PorekloProduktov-create	Logistika - Poreklo produkta v paketu - Ustvari	t	console	2015-01-07 18:44:42
72da0486-9341-4960-9519-429429e964ad	Logistika-PorekloProduktov-lookup	Logistika - Poreklo produkta v paketu - Iskanje	t	console	2015-01-07 18:44:42
f5e03990-7b3a-4112-bb80-c046bf906600	Logistika-PostavkaMat-delete	Logistika - Postavka materialnega dokumenta - Briši	t	console	2015-01-07 18:44:42
b60e76ed-d4de-45ae-9570-73baa388f022	Logistika-PostavkaMat-read	Logistika - Postavka materialnega dokumenta - Beri	t	console	2015-01-07 18:44:42
b67ad53c-dddb-4488-a7a5-ca9e29f729b0	Logistika-PostavkaMat-update	Logistika - Postavka materialnega dokumenta - Posodobi	t	console	2015-01-07 18:44:42
f0bc5500-d730-4aff-938d-ffbdae92e8f5	Logistika-PostavkaMat-create	Logistika - Postavka materialnega dokumenta - Ustvari	t	console	2015-01-07 18:44:42
65a42552-e5a6-4ad1-aaac-10043b10ad4c	Logistika-PostavkaMat-lookup	Logistika - Postavka materialnega dokumenta - Iskanje	t	console	2015-01-07 18:44:42
f9cd4b8d-c260-4a0f-ad07-61337baf15ef	Logistika-PostavkaDobavnica-delete	Logistika - Postavka dobavnice - Briši	t	console	2015-01-07 18:44:42
102f30b1-ce59-45f4-b799-58549ab851e5	Logistika-PostavkaDobavnica-read	Logistika - Postavka dobavnice - Beri	t	console	2015-01-07 18:44:42
c6867f52-d81d-4d08-9786-c434185d59d7	Logistika-PostavkaDobavnica-update	Logistika - Postavka dobavnice - Posodobi	t	console	2015-01-07 18:44:42
87359c31-20e3-48f9-b574-c69e1cb28412	Logistika-PostavkaDobavnica-create	Logistika - Postavka dobavnice - Ustvari	t	console	2015-01-07 18:44:42
29e78711-f510-477e-9428-c7ca619eed88	Logistika-PostavkaDobavnica-lookup	Logistika - Postavka dobavnice - Iskanje	t	console	2015-01-07 18:44:42
aa2b1978-d69a-4f17-9a5a-e7c9c754efd6	Logistika-PostavkaIzdajnica-delete	Logistika - Postavka izdajnice - Briši	t	console	2015-01-07 18:44:42
590b873b-c2be-485a-a64a-d21f08a2dcc5	Logistika-PostavkaIzdajnica-read	Logistika - Postavka izdajnice - Beri	t	console	2015-01-07 18:44:42
f74e3216-e463-4df9-ae43-77db8017ec92	Logistika-PostavkaIzdajnica-update	Logistika - Postavka izdajnice - Posodobi	t	console	2015-01-07 18:44:42
fc371d66-750f-406f-b82c-9688072277ea	Logistika-PostavkaIzdajnica-create	Logistika - Postavka izdajnice - Ustvari	t	console	2015-01-07 18:44:42
50bcf559-abba-4e6a-9a27-a1c57975e4df	Logistika-PostavkaIzdajnica-lookup	Logistika - Postavka izdajnice - Iskanje	t	console	2015-01-07 18:44:42
c61e24cf-c114-4983-b032-38121bb7888c	Logistika-PostavkaPredajnica-delete	Logistika - Postavka predajnice - Briši	t	console	2015-01-07 18:44:42
30af1095-b787-4bac-baf4-8541c7205eb1	Logistika-PostavkaPredajnica-read	Logistika - Postavka predajnice - Beri	t	console	2015-01-07 18:44:42
0f814b9e-8d69-45f7-8f36-ff5a31df9e02	Logistika-PostavkaPredajnica-update	Logistika - Postavka predajnice - Posodobi	t	console	2015-01-07 18:44:42
df5df055-a3b0-4cc4-82fe-61a488909083	Logistika-PostavkaPredajnica-create	Logistika - Postavka predajnice - Ustvari	t	console	2015-01-07 18:44:42
c208b971-9362-4e0f-8731-16d318f417df	Logistika-PostavkaPredajnica-lookup	Logistika - Postavka predajnice - Iskanje	t	console	2015-01-07 18:44:42
a2d6e7bc-d417-473e-b919-8462cd72ede0	Logistika-PostavkaPremik-delete	Logistika - Postavka premika - Briši	t	console	2015-01-07 18:44:42
54e7c292-83de-43bc-841e-7793ec238f86	Logistika-PostavkaPremik-read	Logistika - Postavka premika - Beri	t	console	2015-01-07 18:44:42
40d32b14-b0d0-4f06-958e-7ebe225cafa0	Logistika-PostavkaPremik-update	Logistika - Postavka premika - Posodobi	t	console	2015-01-07 18:44:42
14025bb5-606b-431b-9d07-212863b4217b	Logistika-PostavkaPremik-create	Logistika - Postavka premika - Ustvari	t	console	2015-01-07 18:44:42
fd2b90f9-bfd1-47e0-a90c-2d9666b5aaf9	Logistika-PostavkaPremik-lookup	Logistika - Postavka premika - Iskanje	t	console	2015-01-07 18:44:42
9dde6808-23a4-41b2-9956-b63cc77a1e0f	Logistika-PostavkaPrevrednotenje-delete	Logistika - Postavka prevrednotenja - Briši	t	console	2015-01-07 18:44:42
0353027a-cd88-4f1b-98fd-cea554e6cd42	Logistika-PostavkaPrevrednotenje-read	Logistika - Postavka prevrednotenja - Beri	t	console	2015-01-07 18:44:42
5d0694b2-d1ff-4bde-afd0-7091e284df63	Logistika-PostavkaPrevrednotenje-update	Logistika - Postavka prevrednotenja - Posodobi	t	console	2015-01-07 18:44:42
657e49ad-ec73-408f-85f2-8b6e8b892153	Logistika-PostavkaPrevrednotenje-create	Logistika - Postavka prevrednotenja - Ustvari	t	console	2015-01-07 18:44:42
c6694269-af27-417b-854b-6bb1f04a1b18	Logistika-PostavkaPrevrednotenje-lookup	Logistika - Postavka prevrednotenja - Iskanje	t	console	2015-01-07 18:44:42
0a205a35-a38c-4fa3-b421-30e5889fc564	Logistika-PostavkaPrevzemnica-delete	Logistika - Postavka prevzemnice - Briši	t	console	2015-01-07 18:44:42
70af8de6-7d61-464b-8514-5f7aa2b009c4	Logistika-PostavkaPrevzemnica-read	Logistika - Postavka prevzemnice - Beri	t	console	2015-01-07 18:44:42
8ea2a7b5-ee78-4d72-8d1f-4491360dede8	Logistika-PostavkaPrevzemnica-update	Logistika - Postavka prevzemnice - Posodobi	t	console	2015-01-07 18:44:42
ac890ea8-9ba7-4324-970b-76c9983d26e1	Logistika-PostavkaPrevzemnica-create	Logistika - Postavka prevzemnice - Ustvari	t	console	2015-01-07 18:44:42
699b4d96-0d82-4167-95da-efc239fdf777	Logistika-PostavkaPrevzemnica-lookup	Logistika - Postavka prevzemnice - Iskanje	t	console	2015-01-07 18:44:42
0c3aed0e-a0a3-4b93-ba23-827a5e06fad5	Logistika-PostavkaStroska-delete	Logistika - Postavka stroška na prevzemu - Briši	t	console	2015-01-07 18:44:42
d7772956-0c03-4c15-be6d-b8046063aa5c	Logistika-PostavkaStroska-read	Logistika - Postavka stroška na prevzemu - Beri	t	console	2015-01-07 18:44:42
b806cd8e-707e-45ca-b411-15a7c5118573	Logistika-PostavkaStroska-update	Logistika - Postavka stroška na prevzemu - Posodobi	t	console	2015-01-07 18:44:42
b59a7bc3-fb50-4522-9213-ae3e650d3c68	Logistika-PostavkaStroska-create	Logistika - Postavka stroška na prevzemu - Ustvari	t	console	2015-01-07 18:44:42
65ed4baa-25ff-4ffa-8c9e-e1af3f84f62d	Logistika-PostavkaStroska-lookup	Logistika - Postavka stroška na prevzemu - Iskanje	t	console	2015-01-07 18:44:42
fa4115be-914f-4fee-80e8-788c524e1900	Logistika-PrejsnjaLokacija-delete	Logistika - Zgodovina premikov po lokacijah - Briši	t	console	2015-01-07 18:44:42
03f19ac6-7ed4-48b4-8c76-b5e05d9103f5	Logistika-PrejsnjaLokacija-read	Logistika - Zgodovina premikov po lokacijah - Beri	t	console	2015-01-07 18:44:42
c9c6bac0-71a4-4df8-a92d-7f47fdd3ac7c	Logistika-PrejsnjaLokacija-update	Logistika - Zgodovina premikov po lokacijah - Posodobi	t	console	2015-01-07 18:44:42
04436fa6-eee2-4604-96e5-4d2dec60e1ce	Logistika-PrejsnjaLokacija-create	Logistika - Zgodovina premikov po lokacijah - Ustvari	t	console	2015-01-07 18:44:42
1dd2ee28-d6ae-4682-8bd7-f03838177ab2	Logistika-PrejsnjaLokacija-lookup	Logistika - Zgodovina premikov po lokacijah - Iskanje	t	console	2015-01-07 18:44:42
154c1183-3aef-4422-b9e3-561f039faee1	Logistika-PrejsnjiPaket-delete	Logistika - Zgodovina pakiranja produktov v pakete - Briši	t	console	2015-01-07 18:44:42
d053dbc9-adc8-46b8-a81d-e772cf845ff6	Logistika-PrejsnjiPaket-read	Logistika - Zgodovina pakiranja produktov v pakete - Beri	t	console	2015-01-07 18:44:42
5aadcdd5-0037-4fa8-b447-a8bacad21685	Logistika-PrejsnjiPaket-update	Logistika - Zgodovina pakiranja produktov v pakete - Posodobi	t	console	2015-01-07 18:44:42
bb3a4ddb-d668-4660-9f9f-ed104231d378	Logistika-PrejsnjiPaket-create	Logistika - Zgodovina pakiranja produktov v pakete - Ustvari	t	console	2015-01-07 18:44:42
fbc0da4a-8299-4a0d-a851-22a2df9592f1	Logistika-PrejsnjiPaket-lookup	Logistika - Zgodovina pakiranja produktov v pakete - Iskanje	t	console	2015-01-07 18:44:42
4ed65747-721b-4adf-a540-8c596e70e082	Logistika-PrikazLokacije-delete	Logistika - Prikaz lokacije na zemljevidu - Briši	t	console	2015-01-07 18:44:42
1d9875de-c755-4649-b5bb-b22274eb4da2	Logistika-PrikazLokacije-read	Logistika - Prikaz lokacije na zemljevidu - Beri	t	console	2015-01-07 18:44:42
6f91dc61-8fc3-4fa6-897a-d6e889302918	Logistika-PrikazLokacije-update	Logistika - Prikaz lokacije na zemljevidu - Posodobi	t	console	2015-01-07 18:44:42
1aa25f23-47ea-44b3-a0cf-aae03b28e540	Logistika-PrikazLokacije-create	Logistika - Prikaz lokacije na zemljevidu - Ustvari	t	console	2015-01-07 18:44:42
62822760-41a0-4c3e-8f81-11c6cd5b0d6d	Logistika-PrikazLokacije-lookup	Logistika - Prikaz lokacije na zemljevidu - Iskanje	t	console	2015-01-07 18:44:42
01cce311-8b86-4b81-bec1-8c503097ff73	Logistika-PrometSkladiscenja-delete	Logistika - Sledljivost blaga po skladišču - Briši	t	console	2015-01-07 18:44:42
223e8897-3e31-422e-b468-fb944d559ef0	Logistika-PrometSkladiscenja-read	Logistika - Sledljivost blaga po skladišču - Beri	t	console	2015-01-07 18:44:42
a595c568-fb1b-4a0a-9d09-7acbd3d72b96	Logistika-PrometSkladiscenja-update	Logistika - Sledljivost blaga po skladišču - Posodobi	t	console	2015-01-07 18:44:42
23b5f846-43be-4754-accf-716db349e2b2	Logistika-PrometSkladiscenja-create	Logistika - Sledljivost blaga po skladišču - Ustvari	t	console	2015-01-07 18:44:42
55b61856-0e26-4340-9334-6bbdc88f06e0	Logistika-PrometSkladiscenja-lookup	Logistika - Sledljivost blaga po skladišču - Iskanje	t	console	2015-01-07 18:44:42
e6ed547f-584d-49ab-85ec-9cecde0603f1	Logistika-PrometSkladiscenjaIzdaja-delete	Logistika - Vnos izdaje v sledljivost blaga - Briši	t	console	2015-01-07 18:44:42
2c318bf9-1d4d-4f35-973c-1a82da608f9b	Logistika-PrometSkladiscenjaIzdaja-read	Logistika - Vnos izdaje v sledljivost blaga - Beri	t	console	2015-01-07 18:44:42
cfc9949c-7c7b-45ba-80e9-86df851657b0	Logistika-PrometSkladiscenjaIzdaja-update	Logistika - Vnos izdaje v sledljivost blaga - Posodobi	t	console	2015-01-07 18:44:42
ab9a355a-533b-4929-8e85-4db6b40943bb	Logistika-PrometSkladiscenjaIzdaja-create	Logistika - Vnos izdaje v sledljivost blaga - Ustvari	t	console	2015-01-07 18:44:42
0b9c8d86-2170-4344-a369-48567737d530	Logistika-PrometSkladiscenjaIzdaja-lookup	Logistika - Vnos izdaje v sledljivost blaga - Iskanje	t	console	2015-01-07 18:44:42
225dd6b6-7ea5-4faa-824f-c9d040f20e06	Logistika-PrometSkladiscenjaPrejem-delete	Logistika - Vnos prejema v sledljivost blaga - Briši	t	console	2015-01-07 18:44:42
716d9fa5-a5bb-452e-b682-79abd7eb4c31	Logistika-PrometSkladiscenjaPrejem-read	Logistika - Vnos prejema v sledljivost blaga - Beri	t	console	2015-01-07 18:44:42
8b3985c3-170c-4eb4-bacf-43e54625afc9	Logistika-PrometSkladiscenjaPrejem-update	Logistika - Vnos prejema v sledljivost blaga - Posodobi	t	console	2015-01-07 18:44:42
6a405973-f8bc-4b67-8540-dbb50f130f8b	Logistika-PrometSkladiscenjaPrejem-create	Logistika - Vnos prejema v sledljivost blaga - Ustvari	t	console	2015-01-07 18:44:42
7d7c9518-085a-4bb6-a0a6-fb54e0248b34	Logistika-PrometSkladiscenjaPrejem-lookup	Logistika - Vnos prejema v sledljivost blaga - Iskanje	t	console	2015-01-07 18:44:42
da05a461-4b93-4ab3-82bf-94fbbe3746cc	Logistika-PrometSkladiscenjaPremik-delete	Logistika - Sledljivost blaga - premik - Briši	t	console	2015-01-07 18:44:42
35910f92-038b-48f7-ae59-c21c19b68f26	Logistika-PrometSkladiscenjaPremik-read	Logistika - Sledljivost blaga - premik - Beri	t	console	2015-01-07 18:44:42
ab368b53-f28d-4222-91b7-84a4584ab850	Logistika-PrometSkladiscenjaPremik-update	Logistika - Sledljivost blaga - premik - Posodobi	t	console	2015-01-07 18:44:42
24ea258a-f78d-4236-b352-332ca2b811f6	Logistika-PrometSkladiscenjaPremik-create	Logistika - Sledljivost blaga - premik - Ustvari	t	console	2015-01-07 18:44:42
29d4fa11-e107-4b9e-ae95-cbf9faff9f8e	Logistika-PrometSkladiscenjaPremik-lookup	Logistika - Sledljivost blaga - premik - Iskanje	t	console	2015-01-07 18:44:42
614be964-9efa-43af-839c-d0eeae084215	Logistika-Serijska-delete	Logistika - Serijska številka - Briši	t	console	2015-01-07 18:44:42
4b7240d3-442f-4d89-85c1-a81c4f1d929d	Logistika-Serijska-read	Logistika - Serijska številka - Beri	t	console	2015-01-07 18:44:42
d78b8688-8c2a-4444-8605-61e325ae1ef6	Logistika-Serijska-update	Logistika - Serijska številka - Posodobi	t	console	2015-01-07 18:44:42
e7f22729-4cea-4877-8ffb-dd9a29dd2d29	Logistika-Serijska-create	Logistika - Serijska številka - Ustvari	t	console	2015-01-07 18:44:42
27323a32-7a1a-40a4-bafb-0c45273a10d3	Logistika-Serijska-lookup	Logistika - Serijska številka - Iskanje	t	console	2015-01-07 18:44:42
61025284-88f3-4102-819b-5f7a0f031550	Logistika-Zaloga-delete	Logistika - Stanje zaloge - Briši	t	console	2015-01-07 18:44:42
fccfd549-0ca3-4e2a-b6c0-77035c9c292c	Logistika-Zaloga-read	Logistika - Stanje zaloge - Beri	t	console	2015-01-07 18:44:42
b033b107-5d4e-4ce8-bb21-20973648b646	Logistika-Zaloga-update	Logistika - Stanje zaloge - Posodobi	t	console	2015-01-07 18:44:42
0b3a9040-706e-4cbb-921d-096f7c0fa6ce	Logistika-Zaloga-create	Logistika - Stanje zaloge - Ustvari	t	console	2015-01-07 18:44:42
8148a588-7f88-483e-835e-342567ca2f55	Logistika-Zaloga-lookup	Logistika - Stanje zaloge - Iskanje	t	console	2015-01-07 18:44:42
1a13a684-8684-494c-9169-cc7ddd478363	Logistika-SkladiscenjeIzdaja-delete	Logistika - Vnos izdaje v sledljivost blaga - Briši	t	console	2015-02-25 14:48:16
f2092319-afd7-4533-8a00-9c2fe1414109	Logistika-SkladiscenjeIzdaja-read	Logistika - Vnos izdaje v sledljivost blaga - Beri	t	console	2015-02-25 14:48:16
2f391583-5af1-4107-9999-d57eace71746	Logistika-SkladiscenjeIzdaja-update	Logistika - Vnos izdaje v sledljivost blaga - Posodobi	t	console	2015-02-25 14:48:16
a3a77ef6-690d-46f7-8259-21d723233099	Logistika-SkladiscenjeIzdaja-create	Logistika - Vnos izdaje v sledljivost blaga - Ustvari	t	console	2015-02-25 14:48:16
70be1e66-fda5-444a-b664-0d8380ed56ab	Logistika-SkladiscenjeIzdaja-lookup	Logistika - Vnos izdaje v sledljivost blaga - Iskanje	t	console	2015-02-25 14:48:16
b676370e-4a21-447d-834d-432d84230ff1	Logistika-SkladiscenjePremik-delete	Logistika - Sledljivost blaga - premik - Briši	t	console	2015-02-25 14:48:16
1ac10b4c-91f9-423f-8ad7-c2d6b4144ec9	Logistika-SkladiscenjePremik-read	Logistika - Sledljivost blaga - premik - Beri	t	console	2015-02-25 14:48:16
425e12f2-c80a-4eb9-bf4a-6da72bf94288	Logistika-SkladiscenjePremik-update	Logistika - Sledljivost blaga - premik - Posodobi	t	console	2015-02-25 14:48:16
df7945d2-a78c-434c-8b59-8306088c5aa0	Logistika-SkladiscenjePremik-create	Logistika - Sledljivost blaga - premik - Ustvari	t	console	2015-02-25 14:48:16
1e3b6efa-f288-4ae3-a99a-d354182942b3	Logistika-SkladiscenjePremik-lookup	Logistika - Sledljivost blaga - premik - Iskanje	t	console	2015-02-25 14:48:16
\.


--
-- TOC entry 3853 (class 0 OID 825924)
-- Dependencies: 213
-- Data for Name: permission_allrole; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission_allrole (permission_id, role_id) FROM stdin;
\.


--
-- TOC entry 3854 (class 0 OID 825927)
-- Dependencies: 214
-- Data for Name: ponk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ponk (id, dok_id, klient_id, kontaktna_id, prejemnik_id, valuta_id, potrjen, stevilka, statusponudbe, kupcevaoznaka, datumdogodka, vrednost, text, tecaj, upor, datknj, naslovklienta_id, naslovprejemnika_id, jezik) FROM stdin;
9b0ebc19-e79d-4b58-8e84-1431406edaa8	b211ef14-d398-45ba-8670-2ffc94ec89e6	28328b8d-0141-4a40-80b8-3c50ff505a9e	2f364c62-2b2a-4a74-a790-84c380dec36c	28328b8d-0141-4a40-80b8-3c50ff505a9e	bf01064f-d315-457a-96a9-cef957085ee8	f	TMP201501001	100		2015-02-25	0.00		\N	admin	2015-02-25 18:51:15	543794e0-adbf-dabc-dab5-43794e0afbd2	543794e0-adbf-dabc-dab5-43794e0afbd2	\N
69e0b69d-e840-4de8-b59d-2efa67b7fb9a	b211ef14-d398-45ba-8670-2ffc94ec89e6	28328b8d-0141-4a40-80b8-3c50ff505a9e	516aa806-e3ca-46fb-9686-06a81083bdd0	28328b8d-0141-4a40-80b8-3c50ff505a9e	bf01064f-d315-457a-96a9-cef957085ee8	t	2015-2	100		2015-02-25	1265.00		\N	admin	2015-02-26 10:34:29	543794e0-adbf-dabc-dab5-43794e0afbd2	543794e0-adbf-dabc-dab5-43794e0afbd2	\N
\.


--
-- TOC entry 3855 (class 0 OID 825939)
-- Dependencies: 215
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, klasifikacija_id, drzava_id, potnik_id, sifra, tipkli, stakli, naziv, naziv1, panoga, tel, fax, email, url, trr1, trr2, trr3, trr4, opomba, rokplacilak, rokplacilad, dnipotrditve, rabat, potnikkontakt, izjava, idddv, maticna, zavezanec, jeeu, datzav, datnzav, upor, datknj) FROM stdin;
99ae9c63-dc9f-455d-b9ef-6c40f73019b1	9b0d0da8-23b0-4e1d-a271-0931462a64cc	d5baaf48-5378-4934-9e05-e6040f88268c	\N	2078	D	AK	SIMAM INFO d.o.o.	informacijski sistemi		02 779 81 21	02 773 04 51		\N	042020000524416					0	15	0	0.00	\N		78031117		D		1999-07-01	\N	MATJA	\N
28328b8d-0141-4a40-80b8-3c50ff505a9e	9b0d0da8-23b0-4e1d-a271-0931462a64cc	b37e35b0-d10b-4751-8644-cab73466643e	\N	0492	K	AK	OCE - TECHNOLOGIES B.V.	P.O. Box 47		+31 773 59 28 92	+31 773 59 53 13		\N						45	45	0	0.00	\N		001568620B01		D		1999-07-01	\N	VIDA	\N
19e34484-e0b3-4814-8277-e8a50ea69100	9b0d0da8-23b0-4e1d-a271-0931462a64cc	de8cc0bd-67b3-45a0-a5e2-abba85eac259	\N	0441	K	AK	JOERG LEDERER	ELASTIC - GARNE		+49 7331 20 06 0	+49 7331 20 06 29		\N						0	0	0	0.00	\N		147041909		N		\N	\N	MATJA	\N
81e90677-7b9a-4fd0-8045-45120d9c554a	9b0d0da8-23b0-4e1d-a271-0931462a64cc	d5baaf48-5378-4934-9e05-e6040f88268c	\N	2034	D	AK	AHA EMMI d.o.o.	Predelava aluminija		02 805 05 00	02 805 02 30	info@aha-emmi.si	\N	044300000166760					0	45	2	0.00	\N		17403014	2236460	D		1999-07-01	\N	NINA	\N
073b22f7-3070-45d6-9df8-242d5df7e760	9b0d0da8-23b0-4e1d-a271-0931462a64cc	de8cc0bd-67b3-45a0-a5e2-abba85eac259	\N	0614	K	AK	BIERSACK MASCHINENBAU GmbH			+49 8461 641 50	+49 8461 6415 66		\N						0	0	0	0.00	\N		131772717		N		1999-07-01	\N	NINA	\N
1b16c29a-1ae8-41ad-92b9-2e357cf34b43	9b0d0da8-23b0-4e1d-a271-0931462a64cc	d0338783-e16b-4f87-8702-537658425082	\N	1488	D	AK	KETY	GRUPA KETY S.A.		+48 33 844 6000	+48 33 844 6498	ppniak@gk-kety.com.pl	\N						0	30	3	0.00	\N		5490001468		N		1999-07-01	\N	VIDA	\N
36207b57-0450-4b91-9ebd-a16094f88653	9b0d0da8-23b0-4e1d-a271-0931462a64cc	040eded5-e9c1-4bf2-b633-e090fe412814	\N	1802	D	AK	METALL-UND SERVICE-CENTER GmbH			+43 6216 7730 35	+43 6216 7730 82	office@metall-center.at	\N						60	60	7	0.00	\N		U53227100		N		1999-07-01	\N	NINA	\N
3884a30d-8984-4b6c-a7e0-ba773e24ebad	9b0d0da8-23b0-4e1d-a271-0931462a64cc	d5baaf48-5378-4934-9e05-e6040f88268c	\N	0954	D	AK	MLADINSKA KNJIGA TRGOVINA d.o.o.			02 471 60 23	02 471 60 13	info@mk-trgovina.si	\N	051008010170927					0	60	0	0.00	\N		48494216	5171555	D		1999-07-01	\N	NINA	\N
8bf7f038-c672-4f36-9e6e-5cadbea62b06	9b0d0da8-23b0-4e1d-a271-0931462a64cc	d0338783-e16b-4f87-8702-537658425082	\N	1787	D	AK	SAPA EXTRUSION CHRZANOW Sp. z o.o.				+48 32 625 80 00		\N						0	90	7	0.00	\N		6771019207		N		1999-07-01	\N	VIDA	\N
8cc97f11-1004-45be-8736-6e11835799ab	9b0d0da8-23b0-4e1d-a271-0931462a64cc	d5baaf48-5378-4934-9e05-e6040f88268c	\N	2044	D	AK	GUMITEHNA d.o.o.			04 280 18 88	04 280 18 81	info@gumitehna.si	\N	330000001684590					0	30	0	0.00	\N		72269804	1358405	D		1999-07-01	\N	NINA	\N
8f2a808e-b1b3-4aa2-baeb-a929cae06131	9b0d0da8-23b0-4e1d-a271-0931462a64cc	d5baaf48-5378-4934-9e05-e6040f88268c	\N	1826	D	AK	DINOS d.d.			01 561 06 30	01 561 25 82	dinos.holding@siol.net	\N	029220016508813					0	0	0	0.00	\N		44905793	5003318	D		2005-05-01	\N	MATJA	\N
962692fe-50c5-478c-83bc-f2d238348ab7	9b0d0da8-23b0-4e1d-a271-0931462a64cc	d5baaf48-5378-4934-9e05-e6040f88268c	\N	2216	D	AK	ŽLINDRA d.o.o.	Podjetje za galvansko obdelavo		01 500 30 30	01 519 70 70	zlindra@siol.net	\N	340001009511859					0	30	2	0.00	\N		58760415	2113333	D		1999-07-01	\N	VIDA	\N
a3a70ec8-47f5-4ef8-ae35-ab0d29b11284	9b0d0da8-23b0-4e1d-a271-0931462a64cc	d5baaf48-5378-4934-9e05-e6040f88268c	\N	0845	D	AK	MSK d.o.o.	Kartonaža		02 844 35 70	02 818 20 89	msk.kapun@siol.net	\N		010000000400014				0	70	5	0.00	\N		69461104	5375525	D		1999-07-01	\N	NINA	\N
ace6bb6d-ea26-412a-b57e-c5f56272e790	9b0d0da8-23b0-4e1d-a271-0931462a64cc	d5baaf48-5378-4934-9e05-e6040f88268c	\N	1692	D	AK	AGRONABAVA d.o.o.	Trgovina in storitve		02 761 07 73, 74	02 761 07 74	agronabava@teleing.com	\N	042020000526162	031821000241458				0	30	0	0.00	\N		98677527		D		1999-07-01	\N	DARINKA	\N
96ec7e31-1be6-402a-88b5-4c686b9d19b3	9b0d0da8-23b0-4e1d-a271-0931462a64cc	b37e35b0-d10b-4751-8644-cab73466643e	\N	2095	K	AK	DSV SOLUTIONS VENLO, INDUSTRIAL ESTATE:	TRADE PORT NOORD		.	.	.	\N						0	0	0	0.00	\N				N		1999-07-01	\N	VALER	\N
\.


--
-- TOC entry 3856 (class 0 OID 825957)
-- Dependencies: 216
-- Data for Name: porekloproduktov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY porekloproduktov (id, paket_id, nalog_id, predajnica_id, kolicina, predan, upor, datknj) FROM stdin;
4c6060ec-8dc3-45fc-938d-b9d4ee1276f6	78f706a2-151f-4de2-91ad-0a4702887c88	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
0d9e3919-87e9-49da-964a-c7a585fb68c5	88352f30-68cb-4967-a622-37ad88c571e3	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
461a0f25-a441-463b-944d-199fc6686ded	17810c7b-1fa0-49a9-b6dc-ad1196f13698	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
91ec278f-6f14-41d9-8e97-6ee986851219	73743fa2-ed57-49ed-9dc1-421942d015d4	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
e08f7ada-5a78-4af2-a94e-2ae1f793059e	92446a25-f397-4ce8-a3ad-19e14dcca7c2	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
532e5db8-e96d-4745-a506-f4fbe737c9e0	e0f15c62-ffc3-45ec-b579-1af69de0d6ca	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
c2d34f3b-5e2c-4462-bb5c-5ca56d5c4ad5	b43333dc-c86a-4b68-9c9f-70c41f487cd2	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
461c5d29-e11b-4db7-8368-d40cf258c330	0be7c8d8-ffd9-4c0b-bf99-231d5a51d68b	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
ab209422-c549-4953-9db0-bd170b7dc38a	953ecfbd-4cff-4ac4-bd3e-4954a862ec2d	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
060db5f7-a9fb-4ddb-9f95-b2117d9b8872	7e3ce725-aef1-4948-912d-dd7390cbc442	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
05de6c93-36e1-4bb5-b452-5e1fcc222ae1	13cda1e5-01bb-451f-a10e-6d5a10c760e0	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
2ebae828-dc0c-41cb-8cfd-52d46c718f72	eb50cfbb-9a3d-481b-9f5e-9443c4dd45ae	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
2d8c142c-cdd3-401a-a068-7fcdd961d270	a1c84a96-86ce-44cc-851b-075679b22aaf	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
be27886b-2cf6-4633-9df1-00b2f354391c	cfb2a23d-fe8e-42a6-bf7b-e17c60b6e081	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
d59f27bf-3f31-41fc-af08-d6683bd6aedc	73f33d5f-2306-44e6-ac4d-147d9db9b379	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
c3990ca5-45de-4a93-beb4-0212b2144b49	9549d613-a948-497b-b91c-ca2aba5f3f00	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
303a7819-e4f1-40e6-b097-afd3bc698c42	c03cd58d-f41a-495d-beac-fa7d9f4923b7	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
650a0d51-363b-4077-9ac9-5d8c9f6fd8c6	abb89436-6422-49a4-81c9-5e14ccf628ac	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
a5e28cb8-25f0-411f-9f91-49f04d02e71c	8d17bd53-438e-45a7-8915-2a54b2bd580d	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
d5d9745d-7e78-434c-9192-b02c8ab41ee5	073ccb6e-8cec-4155-994e-6cd6ae5a066c	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
43d8f85a-7ac7-4205-811e-2544020467e9	6cfd24fb-ff5a-4222-b94c-f2d5b283a6b9	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
fd0cb160-29f1-43bb-b22a-aebab211d723	1369f2b5-9ee0-4d2b-ad0c-077def3d1338	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
e52619a2-56cc-4adb-9518-27910a7996e5	3f70f69d-a96b-494d-b1bb-1302b7defcd4	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
dc70c08b-bc76-4a1a-9c1c-0407481b591e	2fa57e5b-d7ff-4fde-9116-fafef223f0cb	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
ce1ff710-2760-4b20-8c0f-07a37b8c5b20	569b8d33-647f-47cf-8388-7ebe4e26e561	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
4bd5b15c-f831-4e2a-a173-c431cc8ab17d	fd395420-7f24-4aee-9078-df9b6b24b81c	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	0.000	\N	admin	2015-01-26 20:06:15
bdb32252-0fe8-4dd6-a798-d2950a939796	8771cebf-41ec-4f62-b3c0-dcb5dbb3ddea	59634fd0-05df-4e56-99dd-ceaca396df6c	\N	5.000	\N	admin	2015-01-26 20:23:51
\.


--
-- TOC entry 3857 (class 0 OID 825961)
-- Dependencies: 217
-- Data for Name: poslovniplan; Type: TABLE DATA; Schema: public; Owner: -
--

COPY poslovniplan (id, naziv, zacetek, konec, status, statuspreracunov, tipobdobja, obdobij, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3858 (class 0 OID 825966)
-- Dependencies: 218
-- Data for Name: poslovniplanartikla; Type: TABLE DATA; Schema: public; Owner: -
--

COPY poslovniplanartikla (id, plan_id, artikel_id, kalkulacija_id, cena, planiranakolicina, zacetnazaloga, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3859 (class 0 OID 825972)
-- Dependencies: 219
-- Data for Name: poslovniplankadri; Type: TABLE DATA; Schema: public; Owner: -
--

COPY poslovniplankadri (id, obdobje_id, skupina, planzaposlenih, zaposlenih, planbolniske, bolniske, plandopusti, dopusti, korekcija, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3860 (class 0 OID 825984)
-- Dependencies: 220
-- Data for Name: poslovniplannapoved; Type: TABLE DATA; Schema: public; Owner: -
--

COPY poslovniplannapoved (id, narocilo_id, obdobje_id, kolicina, planiranakolicina, planstatus, status, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3861 (class 0 OID 825989)
-- Dependencies: 221
-- Data for Name: poslovniplannarocilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY poslovniplannarocilo (id, ppartikla_id, narocilo_id, klient_id, zacetek, konec, stevilodobav, skupnakolicina, prodajnacena, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3862 (class 0 OID 825994)
-- Dependencies: 222
-- Data for Name: poslovniplanobdobje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY poslovniplanobdobje (id, plan_id, zacetek, konec, oznaka, planiranfondur, plandni, dni, fondur, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3863 (class 0 OID 825999)
-- Dependencies: 223
-- Data for Name: poslovniplanproizvodnja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY poslovniplanproizvodnja (id, ppartikla_id, obdobje_id, kalkulacija_id, nalog_id, kolicina, planiranakolicina, status, planstatus, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3864 (class 0 OID 826004)
-- Dependencies: 224
-- Data for Name: poslovniplanuretehen; Type: TABLE DATA; Schema: public; Owner: -
--

COPY poslovniplanuretehen (id, obdobje_id, tehen_id, planfondur, fondur, ur, planur, nastavitve, plannastavitev, planurljudi, urljudi, vrednost, planvrednost, preracunid, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3865 (class 0 OID 826009)
-- Dependencies: 225
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: -
--

COPY post (id, sifra, naziv, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3866 (class 0 OID 826014)
-- Dependencies: 226
-- Data for Name: postavkakalkkoso; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkakalkkoso (id, dokument_id, polizdelek_id, tehen_id, operacija_id, material_id, cenik_id, klient_id, nivo, opis, pozicija, normativ, kolicina, cena, vrednost, upor, datknj, tippostavke, pripravljalnicas, faktorljudi, strojnicas, manipulativnicas, "interval", ne, kanban, vrednostsetupa) FROM stdin;
10d5a6a3-84f3-481d-88fd-e2b9c206cd31	c4e38cdc-ee1b-41c9-b165-028227fa5807	6ce0c380-ec67-4c64-8245-236715159d31	\N	\N	6ce0c380-ec67-4c64-8245-236715159d31	d9cb8fdd-9a58-4691-864f-1c7fdf717a52	\N	1		3	1.000	0.003	5.44670	0.01740	GERTI	2014-10-15 13:55:00	M	\N	\N	\N	\N	\N	\N		\N
2e41ac6c-998c-41a9-9abc-4eac53fc3e00	c4e38cdc-ee1b-41c9-b165-028227fa5807	ad729aa8-2672-43cb-8616-a8a2a2640917	\N	\N	ad729aa8-2672-43cb-8616-a8a2a2640917	59fbfa1f-008a-4962-8540-0a731983bb18	\N	1		4	1.000	0.013	1.84750	0.02350	GERTI	2014-10-15 13:55:00	M	\N	\N	\N	\N	\N	\N		\N
76ea2297-6eaf-4bcd-a460-286ccc0c97c4	c4e38cdc-ee1b-41c9-b165-028227fa5807	0098f83c-8c63-464b-839d-26210de36b70	\N	\N	0098f83c-8c63-464b-839d-26210de36b70	cf66b4c7-0a89-4971-8d16-77852f3386d1	\N	1		5	1.000	0.001	2.72950	0.00140	GERTI	2014-10-15 13:55:00	M	\N	\N	\N	\N	\N	\N		\N
382fa383-5ff0-4253-9293-da9531eabe74	c4e38cdc-ee1b-41c9-b165-028227fa5807	30566084-b545-458a-9eb7-78a3dafa61e7	\N	\N	30566084-b545-458a-9eb7-78a3dafa61e7	0a591bf1-2949-468a-887a-029209891155	\N	1		6	1.000	0.000	10.50000	0.00000	GERTI	2014-10-15 13:55:00	M	\N	\N	\N	\N	\N	\N		\N
8ce36bb5-099e-4895-b237-d076d5442c88	c4e38cdc-ee1b-41c9-b165-028227fa5807	595086ad-1eb0-4df6-8c43-de50a4515602	\N	\N	595086ad-1eb0-4df6-8c43-de50a4515602	fa349066-7f8f-4b45-a195-6411b5bc8688	\N	1		7	1.000	0.000	1.64600	0.00000	GERTI	2014-10-15 13:55:00	M	\N	\N	\N	\N	\N	\N		\N
5a1ec172-a63c-41a1-93fb-3e23ea3d880f	c4e38cdc-ee1b-41c9-b165-028227fa5807	cc70af25-37c4-479b-89ef-242c0f373694	\N	\N	cc70af25-37c4-479b-89ef-242c0f373694	8607f3be-061d-49d8-903c-f3a2133a6837	\N	1		8	1.000	0.000	0.75000	0.00000	GERTI	2014-10-15 13:55:00	M	\N	\N	\N	\N	\N	\N		\N
5b11d007-0035-4886-9aed-6ca1b20cf99f	c4e38cdc-ee1b-41c9-b165-028227fa5807	ad9787a2-d5f5-4664-9da1-97e0b6b2802d	\N	\N	ad9787a2-d5f5-4664-9da1-97e0b6b2802d	735ac579-f583-4f11-92bd-56432880e2bd	\N	7		17	1.000	0.020	82.49970	1.65000	GERTI	2014-10-15 13:55:00	M	\N	\N	\N	\N	\N	\N		\N
46993b1e-0751-49f7-a800-7a7dc89e9f87	c4e38cdc-ee1b-41c9-b165-028227fa5807	989dce14-e801-46ff-8b39-80ce399c119f	\N	\N	989dce14-e801-46ff-8b39-80ce399c119f	d0b79d9a-9be3-45d0-909c-d52809714c46	\N	6		19	1.000	0.155	6.57600	1.01660	GERTI	2014-10-15 13:55:00	M	\N	\N	\N	\N	\N	\N		\N
70f5d2e4-c42f-48e0-8279-fe41868227f7	c4e38cdc-ee1b-41c9-b165-028227fa5807	3c6f062a-ca22-4824-b125-405dd7aae10b	5412de6c-529c-4577-a29c-67c110a21b11	15e6b593-dc80-49e4-8530-a98f11866a09	\N	\N	\N	0		1	1.000	31.684	15.34000	0.13500	GERTI	2014-10-15 13:55:00	O	0.3000	1.000	30.00	0.10	1.00	95.00	\N	\N
73edfe65-2bfb-4c0a-a0c3-4a72a3317606	c4e38cdc-ee1b-41c9-b165-028227fa5807	3c6f062a-ca22-4824-b125-405dd7aae10b	5412de6c-529c-4577-a29c-67c110a21b11	7e8742ca-cf04-4468-b7e8-1988d0e64266	\N	\N	\N	0		2	1.000	0.000	15.34000	0.00000	GERTI	2014-10-15 13:55:00	O	0.3000	1.000	0.00	0.00	1.00	95.00	\N	\N
0151e033-8439-4a31-b0f4-427acd86e110	c4e38cdc-ee1b-41c9-b165-028227fa5807	ea9a67c4-9933-4cae-a41c-4f08fb258926	1ff96024-417c-4dd1-8007-fa305dbcd0ae	f55b9878-f120-4e20-b648-13be5a02b865	\N	\N	\N	1		9	1.000	42.211	15.34000	0.17990	GERTI	2014-10-15 13:55:00	O	0.4000	1.000	40.00	0.10	1.00	95.00	\N	\N
9259fe97-4c9f-4dd9-98cc-bca6f30a1c48	c4e38cdc-ee1b-41c9-b165-028227fa5807	776463f5-60be-4820-b796-30dd2ba66633	e0d03644-d34b-4a2c-9978-237d93c8cb7b	928ad152-b8e6-495c-9c32-fc63853f0c5c	\N	\N	\N	2		10	1.000	118.992	39.09000	1.29210	GERTI	2014-10-15 13:55:00	O	1.4100	1.000	72.00	30.00	1.00	85.72	\N	\N
433e24de-94da-413c-b2ed-a28ee3d94daa	c4e38cdc-ee1b-41c9-b165-028227fa5807	776463f5-60be-4820-b796-30dd2ba66633	39d77065-bb51-4787-91cc-81b2e3e3c180	902ad846-ec69-4a11-98e9-c075a2b2c62c	\N	\N	\N	2		11	1.000	0.000	15.34000	0.00000	GERTI	2014-10-15 13:55:00	O	0.0800	1.000	0.00	0.00	1.00	95.00	\N	\N
74bf3293-6c8c-41d5-924a-91bfb3a3bdfa	c4e38cdc-ee1b-41c9-b165-028227fa5807	90ae2d92-4304-4cc6-ac18-4e2a2459d3b2	e0d03644-d34b-4a2c-9978-237d93c8cb7b	bbf89b86-b7fa-405c-8571-1fdb7c171aba	\N	\N	\N	3		12	1.000	96.827	39.09000	1.05140	GERTI	2014-10-15 13:55:00	O	1.4100	1.000	62.00	21.00	1.00	85.72	\N	\N
20c40e03-68cc-4e48-92ee-f30cc9775a6c	c4e38cdc-ee1b-41c9-b165-028227fa5807	90ae2d92-4304-4cc6-ac18-4e2a2459d3b2	097023fb-39a9-463b-bf25-29405e383c59	550596ee-b3a9-4472-a4ff-c5b959aff1ee	\N	\N	\N	3		13	1.000	0.000	15.34000	0.00000	GERTI	2014-10-15 13:55:00	O	0.3000	1.000	0.00	0.00	1.00	85.00	\N	\N
02123516-a757-4ccf-9f30-03a20bb4656b	c4e38cdc-ee1b-41c9-b165-028227fa5807	a443c473-0347-4857-8e91-e3d8cc729e6c	b4fc828d-48ac-41cc-8c3b-9e41514ca6e2	f8c5c819-4f50-4716-bdcb-4c4fd7a6abf3	\N	\N	\N	4		14	1.000	69.469	39.09000	0.75430	GERTI	2014-10-15 13:55:00	O	1.1200	1.000	35.00	25.00	1.00	86.37	\N	\N
08fda5e2-0ab7-4d98-8356-efcb5e806a75	c4e38cdc-ee1b-41c9-b165-028227fa5807	f6551d60-fe63-4449-b515-e742484e4882	a337fd2c-038f-4273-9805-202893bbb252	88af9fce-3468-4127-a3f6-d5d01f0b1eff	\N	\N	\N	5		15	2.000	0.000	15.34000	0.00000	GERTI	2014-10-15 13:55:00	O	0.5000	1.000	0.00	0.00	1.00	85.00	\N	\N
4c59bfda-46fb-4072-a712-3f9fa9089543	c4e38cdc-ee1b-41c9-b165-028227fa5807	bc9fe230-2361-4afd-afc9-ec7824e49f29	afa895f0-9b1c-4324-a617-f6669c39e7b6	61ef3229-cbfa-4a3b-ba16-6c79722c3ee8	\N	\N	\N	6		16	2.000	58.889	20.45000	0.66900	GERTI	2014-10-15 13:55:00	O	0.2000	1.000	45.00	8.00	1.00	90.00	\N	\N
6fe46851-9309-4b1a-b2b0-ba5ecff711f4	c4e38cdc-ee1b-41c9-b165-028227fa5807	9fbd7d57-47e9-441d-b032-d3fd9fe8b58e	205d9e0e-ec3c-4619-9b64-89d5cf5f1c0a	896be847-cc72-422a-be66-d88f8dcbe101	\N	\N	\N	5		18	1.000	17.889	15.34000	0.07620	GERTI	2014-10-15 13:55:00	O	0.1700	1.000	16.00	0.10	1.00	90.00	\N	\N
4581cedf-9efb-4109-99bb-915b535d6b1d	4fcdf94e-8090-4ec3-8775-5aceedca346f	f62c9914-442d-46a3-ac9e-97a58edde29c	\N	\N	f62c9914-442d-46a3-ac9e-97a58edde29c	fd531cb3-5fad-4479-bfe2-6bf367daa966	\N	6		11	1.000	1.000	1.45000	1.45000	GERTI	2014-09-24 09:41:00	M	\N	\N	\N	\N	\N	\N		\N
87096409-e2be-4fc1-a4f2-0cac913d6e42	4fcdf94e-8090-4ec3-8775-5aceedca346f	767b8e74-b6e9-4af0-98b0-8a847d935929	\N	150bec91-e999-4a7c-a083-c7fb3e1f66be	\N	\N	962692fe-50c5-478c-83bc-f2d238348ab7	0		2	1.000	1.000	5.15000	5.15000	GERTI	2014-09-24 09:41:00	D	\N	\N	\N	\N	\N	\N	\N	\N
b8be4758-f100-4ccc-805f-17425d4582a8	4fcdf94e-8090-4ec3-8775-5aceedca346f	767b8e74-b6e9-4af0-98b0-8a847d935929	5412de6c-529c-4577-a29c-67c110a21b11	38782643-df23-4004-b404-e66522e307ef	\N	\N	\N	0		1	1.000	0.000	15.34000	0.00000	GERTI	2014-09-24 09:41:00	O	0.3000	1.000	0.00	0.00	1.00	95.00	\N	\N
fad0de23-8123-4b1a-9375-9d658b07b27a	4fcdf94e-8090-4ec3-8775-5aceedca346f	767b8e74-b6e9-4af0-98b0-8a847d935929	5412de6c-529c-4577-a29c-67c110a21b11	e247503a-aadb-4798-ad12-4cb22c0b18c0	\N	\N	\N	0		3	1.000	0.000	15.34000	0.00000	GERTI	2014-09-24 09:41:00	O	0.3000	1.000	0.00	0.00	1.00	95.00	\N	\N
6d7eda05-4c96-470e-87b9-b88aac479cdf	4fcdf94e-8090-4ec3-8775-5aceedca346f	767b8e74-b6e9-4af0-98b0-8a847d935929	2e31b671-0412-4258-9931-c0c6e83e58d1	3e817a11-44e7-4c24-8ca1-102b5b0ed989	\N	\N	\N	0		4	1.000	94.444	39.11000	1.02600	GERTI	2014-09-24 09:41:00	O	0.5000	1.000	225.00	30.00	3.00	90.00	\N	\N
60680be5-72df-4726-a75c-02543af4a01a	4fcdf94e-8090-4ec3-8775-5aceedca346f	f35ac8ec-134f-4e54-908a-59169a99d9f1	84d5afa6-ddb1-4e22-a7b2-3911e91df836	7618549d-0e96-46b1-8489-010246249839	\N	\N	\N	1		5	1.000	260.759	39.09000	2.83140	GERTI	2014-09-24 09:41:00	O	1.4000	1.000	215.00	11.00	1.00	86.67	\N	\N
d1ae0764-114a-4f2c-aa27-4ade4a941cba	4fcdf94e-8090-4ec3-8775-5aceedca346f	f35ac8ec-134f-4e54-908a-59169a99d9f1	2e31b671-0412-4258-9931-c0c6e83e58d1	e247503a-aadb-4798-ad12-4cb22c0b18c0	\N	\N	\N	1		6	1.000	56.667	39.11000	0.61560	GERTI	2014-09-24 09:41:00	O	0.5000	1.000	225.00	30.00	5.00	90.00	\N	\N
c0fff61f-18ba-480c-a2f8-79cecbbc78c9	4fcdf94e-8090-4ec3-8775-5aceedca346f	ec7c2886-e67a-43c8-9c2a-3b09b75fb196	d6928715-05a0-45d8-af04-e282b2716819	eca306b5-8fbf-44f6-9ded-d79661f9019a	\N	\N	\N	2		7	1.000	93.798	39.09000	1.01850	GERTI	2014-09-24 09:41:00	O	1.4800	1.000	55.00	25.00	1.00	85.29	\N	\N
6da66a77-3a89-4bd3-84b3-905891ae92fb	4fcdf94e-8090-4ec3-8775-5aceedca346f	0d90b520-3c00-4947-9bc1-e6a183c37c74	8c1dc211-b081-4820-a39b-f0309897a4ee	fb0bc1aa-bb9b-48c8-b829-e4cac5130136	\N	\N	\N	3		8	1.000	26.421	23.00000	0.16880	GERTI	2014-09-24 09:41:00	O	0.5000	1.000	25.00	0.10	1.00	95.00	\N	\N
12dbcdae-3e68-4081-8f2c-9112a81749ef	4fcdf94e-8090-4ec3-8775-5aceedca346f	efb21f62-1f5a-40ef-92bc-86b2862344db	e0d03644-d34b-4a2c-9978-237d93c8cb7b	eca306b5-8fbf-44f6-9ded-d79661f9019a	\N	\N	\N	4		9	1.000	60.663	39.09000	0.65870	GERTI	2014-09-24 09:41:00	O	1.4100	1.000	37.00	15.00	1.00	85.72	\N	\N
89038d34-8e62-4d93-8e8f-9d7f56d9ddec	4fcdf94e-8090-4ec3-8775-5aceedca346f	b66e80c6-eb53-408b-82d3-1b572e66aa2c	e0d03644-d34b-4a2c-9978-237d93c8cb7b	820a5ec9-b962-48b9-9f9f-876a9474cf33	\N	\N	\N	5		10	1.000	60.663	39.09000	0.65870	GERTI	2014-09-24 09:41:00	O	1.4100	1.000	37.00	15.00	1.00	85.72	\N	\N
798131fa-8170-4d97-8fa6-e90d18fd2554	0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f	3ce91059-1c4b-49a6-853b-8895d5e2980e	\N	\N	3ce91059-1c4b-49a6-853b-8895d5e2980e	bc5e2bd8-dd61-49db-8362-ede23faff363	\N	1		5	1.000	0.001	2.53800	0.00150	GERTI	2014-09-30 08:06:00	M	\N	\N	\N	\N	\N	\N		\N
c1a9df88-879b-4309-86cb-7f6e0c43aac2	0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f	2b803331-0cbd-46df-bdcf-82c6a35b966d	\N	\N	2b803331-0cbd-46df-bdcf-82c6a35b966d	c03cb0b4-c8db-4fe2-ba24-77b990d4eafc	\N	1		6	1.000	0.050	0.27860	0.01390	GERTI	2014-09-30 08:06:00	M	\N	\N	\N	\N	\N	\N		\N
96b6db46-8041-4325-b216-b6b47e5a12d8	0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f	fe7f4103-a524-40be-9ba8-84c65478bde1	\N	\N	fe7f4103-a524-40be-9ba8-84c65478bde1	087450b7-597f-4ebe-8289-ca04eceb2135	\N	1		7	1.000	0.006	1.43660	0.00790	GERTI	2014-09-30 08:06:00	M	\N	\N	\N	\N	\N	\N		\N
75060b66-14a9-415b-8944-a1f06a616fff	0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f	0098f83c-8c63-464b-839d-26210de36b70	\N	\N	0098f83c-8c63-464b-839d-26210de36b70	cf66b4c7-0a89-4971-8d16-77852f3386d1	\N	1		8	1.000	0.000	2.72950	0.00110	GERTI	2014-09-30 08:06:00	M	\N	\N	\N	\N	\N	\N		\N
2f1fee6e-423a-4534-b99f-b0c71bcb4671	0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f	595086ad-1eb0-4df6-8c43-de50a4515602	\N	\N	595086ad-1eb0-4df6-8c43-de50a4515602	fa349066-7f8f-4b45-a195-6411b5bc8688	\N	1		9	1.000	0.000	1.64600	0.00000	GERTI	2014-09-30 08:06:00	M	\N	\N	\N	\N	\N	\N		\N
2d75ee37-d318-4fec-8ff8-a1a58088dc0b	0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f	cc70af25-37c4-479b-89ef-242c0f373694	\N	\N	cc70af25-37c4-479b-89ef-242c0f373694	8607f3be-061d-49d8-903c-f3a2133a6837	\N	1		10	1.000	0.000	0.75000	0.00000	GERTI	2014-09-30 08:06:00	M	\N	\N	\N	\N	\N	\N		\N
e01d87c7-e8e3-47e9-8d50-8c9404516333	0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f	1692dd6f-dfa5-4190-88a0-27082c0d55a9	\N	\N	1692dd6f-dfa5-4190-88a0-27082c0d55a9	d2dcb35c-d1d6-49b4-81c2-42ef018773de	\N	3		13	1.000	0.027	0.00000	0.00000	GERTI	2014-09-30 08:06:00	M	\N	\N	\N	\N	\N	\N		\N
360989bf-7c4b-4fd3-bed5-47469eef6e70	0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f	dec86cd0-9691-49ae-a985-f07e72c6784f	c140e80e-3650-4db9-9419-8784e4603d79	e247503a-aadb-4798-ad12-4cb22c0b18c0	\N	\N	\N	0		1	1.000	0.000	15.34000	0.00000	GERTI	2014-09-30 08:06:00	O	0.1000	1.000	0.00	0.00	1.00	95.00	\N	\N
28a317a1-dcc6-434f-ad20-ffff074bcb81	0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f	dec86cd0-9691-49ae-a985-f07e72c6784f	5412de6c-529c-4577-a29c-67c110a21b11	15e6b593-dc80-49e4-8530-a98f11866a09	\N	\N	\N	0		2	1.000	15.895	15.34000	0.06770	GERTI	2014-09-30 08:06:00	O	0.3000	1.000	15.00	0.10	1.00	95.00	\N	\N
0aca8467-eb17-466e-afa7-c32b4a28b176	0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f	dec86cd0-9691-49ae-a985-f07e72c6784f	5412de6c-529c-4577-a29c-67c110a21b11	7e8742ca-cf04-4468-b7e8-1988d0e64266	\N	\N	\N	0		3	1.000	0.000	15.34000	0.00000	GERTI	2014-09-30 08:06:00	O	0.3000	1.000	0.00	0.00	1.00	95.00	\N	\N
dac10755-15f4-40b9-ad86-8400e90e4dd5	0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f	dec86cd0-9691-49ae-a985-f07e72c6784f	2e31b671-0412-4258-9931-c0c6e83e58d1	3e817a11-44e7-4c24-8ca1-102b5b0ed989	\N	\N	\N	0		4	1.000	31.667	39.11000	0.34400	GERTI	2014-09-30 08:06:00	O	0.5000	1.000	390.00	180.00	20.00	90.00	\N	\N
528e5ecf-a564-4eec-8dca-be56a26f32d4	0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f	9e5b4291-119e-477b-a70e-49232fa18164	fc47bf9e-9f4b-4b3d-9432-9b64882a511f	550d2e69-cdda-4f77-865b-9373beb5ff92	\N	\N	\N	1		11	1.000	467.024	39.09000	5.07110	GERTI	2014-09-30 08:06:00	O	1.6000	1.000	390.00	20.00	1.00	87.79	\N	\N
bb8adffd-4c99-4416-a749-235e4b480f56	0c4af8d0-9f1e-44d6-a742-1ff3ce30c02f	4aaa238e-efea-464b-aa7e-b84e03b200d5	afa895f0-9b1c-4324-a617-f6669c39e7b6	61ef3229-cbfa-4a3b-ba16-6c79722c3ee8	\N	\N	\N	2		12	1.000	33.333	20.45000	0.18940	GERTI	2014-09-30 08:06:00	O	0.2000	1.000	20.00	10.00	1.00	90.00	\N	\N
dd2c4cd7-2aaf-4647-a6e7-938f03701c94	d9294d76-a20d-45ec-908b-d875ff053434	1faa7822-2116-4d07-8f0d-6d5690d05e3e	\N	\N	1faa7822-2116-4d07-8f0d-6d5690d05e3e	\N	\N	1		2	1.000	0.200	1.71230	0.34250	JOZEH	2014-06-06 06:54:00	M	\N	\N	\N	\N	\N	\N		\N
1f10a886-782a-46bf-9cb6-52efaaac65c1	d9294d76-a20d-45ec-908b-d875ff053434	a4cfc97f-83be-4c8e-83d7-569b5ab36342	\N	\N	a4cfc97f-83be-4c8e-83d7-569b5ab36342	\N	\N	1		3	1.000	1.000	0.27780	0.27780	JOZEH	2014-06-06 06:54:00	M	\N	\N	\N	\N	\N	\N		\N
a4a4430c-7610-405b-8eb8-eb34e6f098f6	d9294d76-a20d-45ec-908b-d875ff053434	cc70af25-37c4-479b-89ef-242c0f373694	\N	\N	cc70af25-37c4-479b-89ef-242c0f373694	\N	\N	1		4	1.000	0.000	0.75000	0.00000	JOZEH	2014-06-06 06:54:00	M	\N	\N	\N	\N	\N	\N		\N
0d21aca8-0c9e-4d3b-833a-f87680467f63	d9294d76-a20d-45ec-908b-d875ff053434	e80f5680-6c2d-41ea-9240-b6cef515bbd7	\N	\N	e80f5680-6c2d-41ea-9240-b6cef515bbd7	\N	\N	2		6	1.000	2.000	18.10000	36.20000	JOZEH	2014-06-06 06:54:00	M	\N	\N	\N	\N	\N	\N		\N
f1730d1b-fd19-4201-a144-5001c801bd34	d9294d76-a20d-45ec-908b-d875ff053434	7e5a1e5b-793d-4573-add3-9cad364b8474	\N	\N	7e5a1e5b-793d-4573-add3-9cad364b8474	\N	\N	7		12	1.000	2.000	0.97000	1.94000	JOZEH	2014-06-06 06:54:00	M	\N	\N	\N	\N	\N	\N		\N
fe59a0a8-51c6-4d99-aa38-216b55e5240e	d9294d76-a20d-45ec-908b-d875ff053434	b0919598-bf06-492a-b3d9-4470bd60efe3	\N	\N	b0919598-bf06-492a-b3d9-4470bd60efe3	\N	\N	8		15	1.000	1.000	7.92000	7.92000	JOZEH	2014-06-06 06:54:00	M	\N	\N	\N	\N	\N	\N		\N
3c5c492c-6ca7-427a-84c7-b39692e21833	d9294d76-a20d-45ec-908b-d875ff053434	6b2ebe89-5208-4170-af11-74f214a7e501	\N	\N	6b2ebe89-5208-4170-af11-74f214a7e501	\N	\N	1		16	1.000	0.017	0.00000	0.00000	JOZEH	2014-06-06 06:54:00	M	\N	\N	\N	\N	\N	\N		\N
6a1733df-74d7-43cc-810f-6f950d426722	d9294d76-a20d-45ec-908b-d875ff053434	5b0938f5-a60f-40b2-94a6-495ac4cdec29	c140e80e-3650-4db9-9419-8784e4603d79	e247503a-aadb-4798-ad12-4cb22c0b18c0	\N	\N	\N	0		1	1.000	0.000	15.34000	0.00000	JOZEH	2014-06-06 06:54:00	O	0.1000	1.000	0.00	0.00	1.00	95.00	\N	\N
4271d973-687c-4678-95cf-1f6373c93a2d	d9294d76-a20d-45ec-908b-d875ff053434	769d4aa4-b6fb-41d0-aaa1-e9bfc94a8dd1	16cd68f0-b7ea-4ff8-a08f-bce170e35e0d	01f03303-7d4d-4459-a077-a060d7dee7e8	\N	\N	\N	1		5	1.000	133.789	32.18000	1.19590	JOZEH	2014-06-06 06:54:00	O	0.5000	2.000	127.00	0.10	1.00	95.00	\N	\N
18c6b36f-ac3d-4ca3-8ffe-c2a768e61abf	d9294d76-a20d-45ec-908b-d875ff053434	0a28e70c-41fa-44ed-872a-621745db5525	84d5afa6-ddb1-4e22-a7b2-3911e91df836	14219006-80f4-4ee3-9c12-a6aa41543b6b	\N	\N	\N	2		7	1.000	341.038	39.09000	3.70310	JOZEH	2014-06-06 06:54:00	O	1.4400	1.000	290.00	11.00	1.00	88.26	\N	\N
9f0d936f-97e1-41ec-9ded-aa46ea6ee9f9	d9294d76-a20d-45ec-908b-d875ff053434	820ecbab-08a1-47e6-8cee-e6ad464a37c2	6471aa67-d6e4-4e1e-8ecd-f3019a3029ce	eca306b5-8fbf-44f6-9ded-d79661f9019a	\N	\N	\N	3		8	1.000	73.797	39.09000	0.80140	JOZEH	2014-06-06 06:54:00	O	1.2200	1.000	50.00	15.00	1.00	88.08	\N	\N
99694e44-ce82-4216-9872-1c27c6b17c65	d9294d76-a20d-45ec-908b-d875ff053434	0582b3b4-4e35-4ad6-9a61-6b083d11acec	6471aa67-d6e4-4e1e-8ecd-f3019a3029ce	820a5ec9-b962-48b9-9f9f-876a9474cf33	\N	\N	\N	4		9	1.000	73.797	39.09000	0.80140	JOZEH	2014-06-06 06:54:00	O	1.2200	1.000	50.00	15.00	1.00	88.08	\N	\N
96e7a8d5-c6fc-4ee4-afe8-31dd09df5fdc	d9294d76-a20d-45ec-908b-d875ff053434	5e618bda-58a1-4ccf-8f57-d9520d61f771	1802ab66-fc41-4b48-bbcd-275349b90841	01f03303-7d4d-4459-a077-a060d7dee7e8	\N	\N	\N	5		10	1.000	58.941	10.22000	0.16730	JOZEH	2014-06-06 06:54:00	O	0.6000	1.000	50.00	0.10	1.00	85.00	\N	\N
ca414be9-961b-44c7-9dc4-5f30950861a2	d9294d76-a20d-45ec-908b-d875ff053434	f1131225-bbd3-4119-a261-5edf14ae7301	6471aa67-d6e4-4e1e-8ecd-f3019a3029ce	550d2e69-cdda-4f77-865b-9373beb5ff92	\N	\N	\N	6		11	2.000	69.255	39.09000	1.50390	JOZEH	2014-06-06 06:54:00	O	1.2200	1.000	51.00	10.00	1.00	88.08	\N	\N
686989b9-1d63-402e-8eb4-8b1553bd1c8c	d9294d76-a20d-45ec-908b-d875ff053434	4ba32d29-fe3c-44cf-84e9-d2e27edbe103	6471aa67-d6e4-4e1e-8ecd-f3019a3029ce	eca306b5-8fbf-44f6-9ded-d79661f9019a	\N	\N	\N	6		13	1.000	132.834	39.09000	1.44230	JOZEH	2014-06-06 06:54:00	O	1.2200	1.000	102.00	15.00	1.00	88.08	\N	\N
f581d7d4-9115-495a-98c3-1018e56e1a57	d9294d76-a20d-45ec-908b-d875ff053434	37032156-6150-41a1-b0fb-70e273271c0a	6471aa67-d6e4-4e1e-8ecd-f3019a3029ce	820a5ec9-b962-48b9-9f9f-876a9474cf33	\N	\N	\N	7		14	1.000	132.834	39.09000	1.44230	JOZEH	2014-06-06 06:54:00	O	1.2200	1.000	102.00	15.00	1.00	88.08	\N	\N
844966e7-7e71-40d1-bb1a-ed3e64c8cbb5	27767f63-b6f1-4d53-b00b-e47c3f33e6b9	c3ee5653-2a56-47a1-8daf-6230dfef28d8	5412de6c-529c-4577-a29c-67c110a21b11	15e6b593-dc80-49e4-8530-a98f11866a09	\N	\N	\N	0		1	1.000	21.158	15.34000	0.09020	NADZORNIK	2014-09-02 13:09:00	O	0.3000	1.000	20.00	0.10	1.00	95.00	\N	\N
736d6727-c704-44ca-9059-687c6af88fc5	27767f63-b6f1-4d53-b00b-e47c3f33e6b9	c3ee5653-2a56-47a1-8daf-6230dfef28d8	5412de6c-529c-4577-a29c-67c110a21b11	7e8742ca-cf04-4468-b7e8-1988d0e64266	\N	\N	\N	0		2	1.000	0.000	15.34000	0.00000	NADZORNIK	2014-09-02 13:09:00	O	0.3000	1.000	0.00	0.00	1.00	95.00	\N	\N
3e1e4630-026f-4ead-a531-8ff33e78afd2	27767f63-b6f1-4d53-b00b-e47c3f33e6b9	170845d8-2e55-4716-9210-1803a9c3af38	5412de6c-529c-4577-a29c-67c110a21b11	38782643-df23-4004-b404-e66522e307ef	\N	\N	\N	1		9	1.000	0.000	15.34000	0.00000	NADZORNIK	2014-09-02 13:09:00	O	0.3000	1.000	0.00	0.00	1.00	95.00	\N	\N
7605b084-f41d-4946-b0f0-e32d74a51ed7	27767f63-b6f1-4d53-b00b-e47c3f33e6b9	6ce0c380-ec67-4c64-8245-236715159d31	\N	\N	6ce0c380-ec67-4c64-8245-236715159d31	\N	\N	1		3	1.000	0.003	5.44670	0.01470	NADZORNIK	2014-09-02 13:09:00	M	\N	\N	\N	\N	\N	\N		\N
59c57de7-28c3-4cf1-8f9c-76cf4f014b43	27767f63-b6f1-4d53-b00b-e47c3f33e6b9	0f4cbc1e-0b18-49aa-b6f3-02618641f5af	\N	\N	0f4cbc1e-0b18-49aa-b6f3-02618641f5af	\N	\N	1		4	1.000	0.001	1.74000	0.00140	NADZORNIK	2014-09-02 13:09:00	M	\N	\N	\N	\N	\N	\N		\N
ba27d8ed-6ebb-49a5-9be9-8c05339e5225	27767f63-b6f1-4d53-b00b-e47c3f33e6b9	0098f83c-8c63-464b-839d-26210de36b70	\N	\N	0098f83c-8c63-464b-839d-26210de36b70	\N	\N	1		5	1.000	0.000	2.72950	0.00110	NADZORNIK	2014-09-02 13:09:00	M	\N	\N	\N	\N	\N	\N		\N
4d6dbd2d-9efc-48e2-8638-ca32c04d5b16	27767f63-b6f1-4d53-b00b-e47c3f33e6b9	30566084-b545-458a-9eb7-78a3dafa61e7	\N	\N	30566084-b545-458a-9eb7-78a3dafa61e7	\N	\N	1		6	1.000	0.000	10.50000	0.00000	NADZORNIK	2014-09-02 13:09:00	M	\N	\N	\N	\N	\N	\N		\N
d0042426-33df-4047-812a-08d83cead306	27767f63-b6f1-4d53-b00b-e47c3f33e6b9	595086ad-1eb0-4df6-8c43-de50a4515602	\N	\N	595086ad-1eb0-4df6-8c43-de50a4515602	\N	\N	1		7	1.000	0.000	1.64600	0.00000	NADZORNIK	2014-09-02 13:09:00	M	\N	\N	\N	\N	\N	\N		\N
f1650b7f-48f5-46df-9f92-54cd1b66b48d	27767f63-b6f1-4d53-b00b-e47c3f33e6b9	cc70af25-37c4-479b-89ef-242c0f373694	\N	\N	cc70af25-37c4-479b-89ef-242c0f373694	\N	\N	1		8	1.000	0.000	0.75000	0.00000	NADZORNIK	2014-09-02 13:09:00	M	\N	\N	\N	\N	\N	\N		\N
20e939fe-611a-4dd8-9798-9ec6a3ce98a7	27767f63-b6f1-4d53-b00b-e47c3f33e6b9	19506682-9740-4cb7-94df-caf0cb1e6c19	\N	\N	19506682-9740-4cb7-94df-caf0cb1e6c19	\N	\N	2		11	1.000	1.000	0.00000	0.00000	NADZORNIK	2014-09-02 13:09:00	M	\N	\N	\N	\N	\N	\N		\N
472f5b10-2d9f-44f4-8bba-3431d0f871e8	27767f63-b6f1-4d53-b00b-e47c3f33e6b9	170845d8-2e55-4716-9210-1803a9c3af38	\N	80537ea0-e9a1-424f-aa72-0c1152ee1b90	\N	\N	81e90677-7b9a-4fd0-8045-45120d9c554a	1		10	1.000	1.000	1.05000	1.05000	NADZORNIK	2014-09-02 13:09:00	D	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3867 (class 0 OID 826030)
-- Dependencies: 227
-- Data for Name: postavkamat; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkamat (id, skladisce_id, dokument_id, maticna_id, polizdelek_id, delavec_id, sklv_id, pozicija, flek, teza, cena, cenavaluta, kolicina, znesek, znesekvaluta, znesekobr, cenaobr, tarifa, koldobro, znesdobro, znesobrdobro, kolbreme, znesbreme, znesobrbreme, upor, datknj, vd, vhodnastevilka, rabatods, rabat, rabatvaluta, znesekstr, izjava, proforma, poreklo, sarza, vezand_id, znesekmat, znesekdel, znesekkoop, vezanalog_id, vezaizd_id, vezank_id, original_id, vezarazpis_id) FROM stdin;
\.


--
-- TOC entry 3868 (class 0 OID 826067)
-- Dependencies: 228
-- Data for Name: postavkastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkastroska (id, dokument_id, storitev_id, klient_id, klientdok, datumkd, znesek, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3869 (class 0 OID 826074)
-- Dependencies: 229
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti, upor, datknj) FROM stdin;
54379515-b23b-8abc-dab5-4379515b334d	99ae9c63-dc9f-455d-b9ef-6c40f73019b1	d5baaf48-5378-4934-9e05-e6040f88268c	Privzeti naslov		Osojnikova 3		2250	PTUJ		N	t	replic	\N
543794e0-adbf-dabc-dab5-43794e0afbd2	28328b8d-0141-4a40-80b8-3c50ff505a9e	b37e35b0-d10b-4751-8644-cab73466643e	Privzeti naslov		St. Urbanusweg 43		5900	MA VENLO		N	t	replic	\N
543794df-5dc1-2abc-dab5-43794df5fb4c	19e34484-e0b3-4814-8277-e8a50ea69100	de8cc0bd-67b3-45a0-a5e2-abba85eac259	Privzeti naslov		Hauptstrasse 115		73340	AMSTETTEN		N	t	replic	\N
54379514-baba-6abc-dab5-4379514bbb3c	81e90677-7b9a-4fd0-8045-45120d9c554a	d5baaf48-5378-4934-9e05-e6040f88268c	Privzeti naslov		Kolodvorska ulica 37 a		2310	Slovenska Bistrica		N	t	replic	\N
543794e4-2282-3abc-dab5-43794e4237c0	073b22f7-3070-45d6-9df8-242d5df7e760	de8cc0bd-67b3-45a0-a5e2-abba85eac259	Privzeti naslov		Meisenweg 8		92339	BEILNGRIES		N	t	replic	\N
543794fc-2a24-0abc-dab5-43794fc2b1e5	1b16c29a-1ae8-41ad-92b9-2e357cf34b43	d0338783-e16b-4f87-8702-537658425082	Privzeti naslov		Ul. Kosciuszki 111		32650	Kety		N	t	replic	\N
5437950f-b435-cabc-dab5-437950fb52e9	36207b57-0450-4b91-9ebd-a16094f88653	040eded5-e9c1-4bf2-b633-e090fe412814	Privzeti naslov		Steindorferstrasse 7		5202	NEUMARKT/WALLERSEE		N	t	replic	\N
543794ed-9814-aabc-dab5-43794ed990d8	3884a30d-8984-4b6c-a7e0-ba773e24ebad	d5baaf48-5378-4934-9e05-e6040f88268c	Privzeti naslov		Slovenska c 29		1000	Ljubljana		N	t	replic	\N
5437950f-661a-4abc-dab5-437950f67139	8bf7f038-c672-4f36-9e6e-5cadbea62b06	d0338783-e16b-4f87-8702-537658425082	Privzeti naslov		Ul.Hydro 1		32500	CHRZANOW		N	t	replic	\N
54379514-f06c-6abc-dab5-4379514f1661	8cc97f11-1004-45be-8736-6e11835799ab	d5baaf48-5378-4934-9e05-e6040f88268c	Privzeti naslov		Hrastje 15		4000	Kranj		N	t	replic	\N
54379510-3efc-6abc-dab5-43795103ff62	8f2a808e-b1b3-4aa2-baeb-a929cae06131	d5baaf48-5378-4934-9e05-e6040f88268c	Privzeti naslov		Šlandrova ulica 6		1000	Ljubljana		N	t	replic	\N
54379518-b11a-dabc-dab5-4379518b20ae	962692fe-50c5-478c-83bc-f2d238348ab7	d5baaf48-5378-4934-9e05-e6040f88268c	Privzeti naslov		Kumerdejeva 11		1000	Ljubljana		N	t	replic	\N
543794ea-9b8c-2abc-dab5-43794ea9d7fd	a3a70ec8-47f5-4ef8-ae35-ab0d29b11284	d5baaf48-5378-4934-9e05-e6040f88268c	Privzeti naslov		Kolodvorska 25		2310	Slovenska Bistrica		N	t	replic	\N
54379500-f208-cabc-dab5-4379500f30ca	ace6bb6d-ea26-412a-b57e-c5f56272e790	d5baaf48-5378-4934-9e05-e6040f88268c	Privzeti naslov		Bukovci 32a,		2281	MARKOVCI PRI PTUJU		N	t	replic	\N
54379516-15fe-babc-dab5-437951616f4b	96ec7e31-1be6-402a-88b5-4c686b9d19b3	b37e35b0-d10b-4751-8644-cab73466643e	Privzeti naslov		Popeweg 50 (Gate 90)		5928.	SC VENLO		N	t	replic	\N
\.


--
-- TOC entry 3870 (class 0 OID 826087)
-- Dependencies: 230
-- Data for Name: pozin; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pozin (id, dok_id, klient_id, maticna_id, delavec_id, kos_id, pakiranje_id, stevilka, tip, datdog, status, datzap, datzac, datfmea, potkw, potkw2, kolicina, opis, opisd, jeopd, jeris, jensl, jednos, jerazpis, jedelo, jeure, datrazpisa, jekos, jesur, jend, jest, jeemb, jevo, jeoo, jemo, jemq, jeqa, datzkos, datikos, datzrtd, datzsin, datirtd, datisin, datzdpd, datidpd, ppi, ppr, jegs, jezk, upor, datknj, kalkkoso_id) FROM stdin;
59634fd0-05df-4e56-99dd-ceaca396df6c	e78de104-7dbd-484f-b202-9f5e176bae76	28328b8d-0141-4a40-80b8-3c50ff505a9e	5b0938f5-a60f-40b2-94a6-495ac4cdec29	\N	1cc01efe-176d-49ee-a5f0-cf69856cf6fe	24560404-dd89-4524-a560-404ed2552456	14-587-1	1	2014-09-04	300	\N	\N	\N	\N	\N	134.000		 \n6191.98.0002      SALZBRUNN GERTI               \nDne: 07/11/14   Ob: 09:49:49\n------------------------------------------------------------------------\nSprememba razpisane količine.\nStara količina:     120.00 Nova količina:     134.00\n 	t	1	1		D	D	D	2014-09-09	1	1		1							2014-09-09	2014-09-09	\N	2014-10-13	\N	2014-10-27	2014-09-09	2014-09-09	1452	1448	1		admin	2015-01-26 20:01:54	d9294d76-a20d-45ec-908b-d875ff053434
2ba83bdd-9fba-4ed8-b9de-0101074f89c5	e78de104-7dbd-484f-b202-9f5e176bae76	19e34484-e0b3-4814-8277-e8a50ea69100	c3ee5653-2a56-47a1-8daf-6230dfef28d8	\N	0475af84-60e8-4843-a68e-8eeeedd5894b	\N	14-574-1	1	2014-08-08	900	2014-09-17	\N	\N	\N	\N	2018.000		\N	f	1	1		D	D	D	2014-08-21	1	1	1	1	1						2014-08-20	2014-08-20	2014-08-22	2014-08-21	\N	2014-08-23	2014-08-20	2014-08-20	1439	1434	1		GERTI	2014-08-08 12:58:00	27767f63-b6f1-4d53-b00b-e47c3f33e6b9
\.


--
-- TOC entry 3871 (class 0 OID 826117)
-- Dependencies: 231
-- Data for Name: pozizd; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pozizd (id, skladisce_id, maticna_id, klient_id, prejemnik_id, pakiranje_id, dobavnica_id, stevilka, status, kolicina, pogodba, kw, datizdobave, datpku, datdog, sifpog, upor, datknj, naslovdostave_id) FROM stdin;
34d6d921-bf64-4fc1-b569-98b5f7aa8fb8	c80a7e77-1b96-4476-b2ff-dddb4dfa315f	5b0938f5-a60f-40b2-94a6-495ac4cdec29	28328b8d-0141-4a40-80b8-3c50ff505a9e	96ec7e31-1be6-402a-88b5-4c686b9d19b3	\N	\N	2555	2	60.000	154/44680032	2015-05	2015-01-30	\N	2015-01-30	\N	GERTI	2014-06-04 07:01:00	54379516-15fe-babc-dab5-437951616f4b
\.


--
-- TOC entry 3872 (class 0 OID 826123)
-- Dependencies: 232
-- Data for Name: poznd; Type: TABLE DATA; Schema: public; Owner: -
--

COPY poznd (id, nalog_id, dokument_id, maticna_id, pozicija, zeljeniteden, datumzeljeni, izdelaniteden, lpmteden, dokumentpotrditve, potrjeniteden1, potrjeniteden2, datumpotrditve1, datumpotrditve2, zbirnapozicija, dniplacila, kolicina, pridobavitelju, teza, cena, cenakg, rabatprocent, rabat, opis, upor, datknj, statusnarocila, vezarazpis_id, cenavaluta, cenakgvaluta, rabatvaluta, znesek, znesekvaluta) FROM stdin;
\.


--
-- TOC entry 3873 (class 0 OID 826148)
-- Dependencies: 233
-- Data for Name: poznk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY poznk (id, dokument_id, nalog_id, maticna_id, pozicija, zeljeniteden, datumzeljeni, dokumentpotrditve, dniplacila, datumplacila, statusizdelka, datumizdobave, datumacceptance, mojdatumizdobave, pariteta, nacinplacila, rokizdelave, kolicina, provizija, cena, tecaj, upor, datknj, postavkaponudbe_id, statusnarocila, statuspredaje) FROM stdin;
\.


--
-- TOC entry 3874 (class 0 OID 826165)
-- Dependencies: 234
-- Data for Name: pozpk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pozpk (id, dokument_id, kalkulacija_id, maticna_id, pozicija, statusprodukta, dniplacila, nacinplacila, rokizdelave, pariteta, datumzeljeni, letnakolicina, stevilolet, tecaj, naziv, enotamere, text, jeprint, datumprint, jekosovnica, datumkosovnica, istkosovnica, jematerial, datummaterial, istmaterial, kolicina, cena, znesek, cenadela, dodatekdela, odstotekdela, cenamateriala, dodatekmateriala, odstotekmateriala, cenaprevoza, dodatekprevoza, odstotekprevoza, tk, setup, provizija, upor, datknj) FROM stdin;
43481b1d-6338-4272-8955-86616839d41b	69e0b69d-e840-4de8-b59d-2efa67b7fb9a	\N	5b0938f5-a60f-40b2-94a6-495ac4cdec29	0	200	\N				\N	\N	\N	\N	OCE-1060068264/01	KOM		\N	\N	\N	\N	\N	\N	\N	\N	20.000	50.00000	1265.00	50.00000	0.00000	0.00	0.00000	0.00000	0.00	55.00000	0.00000	0.00	50.00000	50.00000	10.00	admin	2015-02-26 10:34:29
\.


--
-- TOC entry 3875 (class 0 OID 826201)
-- Dependencies: 235
-- Data for Name: prejsnjelokacije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prejsnjelokacije (id, paket_id, lokacija_id, casodloga, odlozil, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3876 (class 0 OID 826207)
-- Dependencies: 236
-- Data for Name: prejsnjipaketi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prejsnjipaketi (id, paket_id, parent, caszapakiranja, casodpakiranja, zapakiral, odpakiral, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3877 (class 0 OID 826215)
-- Dependencies: 237
-- Data for Name: prikazlokacije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prikazlokacije (id, lokacija_id, zemljevid_id, koordinatax, koordinatay, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3878 (class 0 OID 826220)
-- Dependencies: 238
-- Data for Name: priponka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY priponka (id, tdok_id, datoteka_id, mapa_id, lastnik, classlastnika, naziv, jemapa, zaklenjena, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3879 (class 0 OID 826241)
-- Dependencies: 239
-- Data for Name: promo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY promo (id, izvedba_id, delavec_id, zastoj_id, izmena, zacetek, ure, delkol, noreta, ts, tc, tn, izmet, dobrih, upor, datknj, tip, konec, uredok, zapop, zepop, norma, uredokonca, kilometrov) FROM stdin;
d100ee35-1416-4c0a-bd57-11cc4be91837	c3682249-54bf-428c-a841-4e6c7aaa0fa9	26b45014-aa19-4cd6-b96b-74efb9d33a6c	\N		2014-11-20 06:20:00	0.00	268.00	0.0000	0.000	0.000	0.000	0.00	0.00	JOZEF	2014-11-24 09:34:00	1	\N	\N	\N	\N	\N	\N	\N
ac55482e-b89e-45cd-bb80-44acfe5b436f	90a94a02-0c54-4618-b5e4-1aa225e034ef	ec6d2a28-bc38-4070-9488-f8f75a3b3848	\N		2014-11-20 15:00:00	3.75	268.00	50.7042	51.000	71.000	0.000	2.00	0.00	JOZEF	2014-11-24 06:54:00	1	\N	\N	\N	\N	\N	\N	\N
dce6497b-4d80-46f7-89f5-5b6bf997d491	67ac9e8f-d102-432c-b0ac-f06d3a1f520e	26b45014-aa19-4cd6-b96b-74efb9d33a6c	\N		2014-11-24 11:44:00	0.00	134.00	0.0000	0.000	0.000	0.000	0.00	0.00	JOZEF	2014-11-26 10:18:00	1	\N	\N	\N	\N	\N	\N	\N
3ca9f1d8-7cb2-4102-91af-606cf00bc915	2bfbe7d3-367f-484d-bd24-d04e6729f2c1	6e089693-54b1-46fc-a582-a7b54a8fd3d1	\N		2014-11-24 22:00:00	3.00	134.00	55.3846	50.000	65.000	0.000	0.00	0.00	JOZEF	2014-11-25 06:36:00	1	\N	\N	\N	\N	\N	\N	\N
2363d7e4-39a0-4d6d-b034-5eb1b342df4f	6848c3fe-4f0e-499e-9d3b-99bf8a6b0a91	31acb437-e866-4a28-a61c-f0d72808fe07	\N		2014-11-25 06:09:00	0.08	134.00	55.3846	50.000	65.000	0.000	0.00	0.00	JOZEF	2014-11-26 06:41:00	1	\N	\N	\N	\N	\N	\N	\N
4f159852-cf7f-4cde-8b25-eae86f43cdd5	0f2e17be-24e6-4f90-8afa-0f2b928df32d	8e0750e5-1cf2-4bdd-b22b-00a5eb22f9b4	\N		2014-11-25 10:15:00	0.00	134.00	71.8563	50.000	50.100	0.000	0.00	0.00	JOZEF	2014-11-27 08:06:00	1	\N	\N	\N	\N	\N	\N	\N
a0f7e817-21a3-4ef6-b7d9-7a0864749695	aa71af30-7617-428c-b63e-8cd982a8eea9	31acb437-e866-4a28-a61c-f0d72808fe07	\N		2014-11-25 12:30:00	1.67	134.00	55.3846	50.000	65.000	0.000	0.00	0.00	JOZEF	2014-11-26 06:42:00	1	\N	\N	\N	\N	\N	\N	\N
7c8d6437-d6bc-44db-beed-bb5b6d42e7a4	0485bf19-cac3-4b18-a14f-30f08622f625	ba46a2fa-50df-4b6e-84ba-2a6b2b30ca0a	\N		2014-11-25 17:00:00	0.17	134.00	55.3846	50.000	65.000	0.000	0.00	0.00	JOZEF	2014-11-26 06:44:00	1	\N	\N	\N	\N	\N	\N	\N
b85d3d2d-ba6d-4ab2-9f61-97b61b439d7b	62f2ec44-9f99-48a1-b35b-e5062d93d7bf	31acb437-e866-4a28-a61c-f0d72808fe07	\N		2014-11-27 11:15:00	2.00	134.00	11.2150	310.000	321.000	0.000	0.00	0.00	JOZEF	2014-11-28 06:42:00	1	\N	\N	\N	\N	\N	\N	\N
ea3f8d69-eed7-46ff-8f2c-eeb137783202	3b87133a-6075-4715-a6d7-efa701b879b3	31acb437-e866-4a28-a61c-f0d72808fe07	\N		2014-11-28 06:00:00	0.08	129.00	11.9601	290.000	301.000	0.000	0.00	0.00	JOZEF	2014-12-01 07:12:00	1	\N	\N	\N	\N	\N	\N	\N
88f5a821-3a5e-4a4d-ad87-e840ad8a7ff8	bee23a02-5636-446a-b4ad-92c52eec3083	76d55b8c-48f1-4c6b-a652-80aa882e40d4	\N		2014-11-26 06:00:00	0.00	134.00	0.0000	0.000	0.000	0.000	0.00	0.00	JOZEF	2014-12-10 11:19:00	1	\N	\N	\N	\N	\N	\N	\N
3e8a7353-4848-46b9-b3cc-abfda1eb3efc	bc988c76-978c-4590-ac57-3393d0b7e4c2	bed3ad66-7fd9-4c1f-9281-1394b7d1f8ca	\N		2014-11-28 11:15:00	0.00	134.00	28.3242	127.000	127.100	0.000	0.00	0.00	JOZEF	2014-12-01 12:58:00	1	\N	\N	\N	\N	\N	\N	\N
ec779b86-eef3-495c-8fc5-91d2276ccbf4	bc988c76-978c-4590-ac57-3393d0b7e4c2	bed3ad66-7fd9-4c1f-9281-1394b7d1f8ca	\N		2014-11-28 11:15:00	0.00	134.00	28.3242	127.000	127.100	0.000	0.00	0.00	JOZEF	2014-12-10 10:52:00	1	\N	\N	\N	\N	\N	\N	\N
9189f5ff-afa5-486e-82b4-7e39a37084b4	faa4a706-3d40-47e0-a830-c4fe96941c57	26b45014-aa19-4cd6-b96b-74efb9d33a6c	\N		2014-11-28 06:00:00	0.00	134.00	0.0000	0.000	0.000	0.000	0.00	0.00	JOZEF	2014-12-10 11:21:00	1	\N	\N	\N	\N	\N	\N	\N
3afa3b15-2803-4ca6-98ce-9214dca0307c	c3682249-54bf-428c-a841-4e6c7aaa0fa9	26b45014-aa19-4cd6-b96b-74efb9d33a6c	\N		2014-11-20 06:20:00	0.50	268.00	0.0000	0.000	0.000	0.000	0.00	268.00	JOZEF	2014-11-24 09:34:00	2	\N	\N	\N	\N	\N	\N	\N
6e024984-de4e-45e3-8dbd-ee93b40fd38e	90a94a02-0c54-4618-b5e4-1aa225e034ef	56eec53b-2c75-48de-a23b-ab46def9c829	\N		2014-11-20 22:00:00	8.00	268.00	50.7042	51.000	71.000	0.000	0.00	207.00	JOZEF	2014-11-21 06:36:00	2	\N	\N	\N	\N	\N	\N	\N
7773c427-2116-46f8-8289-e5e810b7af8f	90a94a02-0c54-4618-b5e4-1aa225e034ef	5ee2488f-295a-4c35-92b9-a8711237355e	\N		2014-11-21 06:00:00	0.83	268.00	50.7042	51.000	71.000	0.000	0.00	60.00	JOZEF	2014-11-24 06:54:00	2	\N	\N	\N	\N	\N	\N	\N
a9ee7468-16da-402c-8e2e-fd27f6cb181b	67ac9e8f-d102-432c-b0ac-f06d3a1f520e	26b45014-aa19-4cd6-b96b-74efb9d33a6c	\N		2014-11-24 11:44:00	0.75	134.00	0.0000	0.000	0.000	0.000	0.00	134.00	JOZEF	2014-11-26 10:18:00	2	\N	\N	\N	\N	\N	\N	\N
7a8f8f6b-6d77-451b-bb1a-5992007c119f	2bfbe7d3-367f-484d-bd24-d04e6729f2c1	6e089693-54b1-46fc-a582-a7b54a8fd3d1	\N		2014-11-25 01:15:00	4.75	134.00	55.3846	50.000	65.000	0.000	0.00	126.00	JOZEF	2014-11-25 06:36:00	2	\N	\N	\N	\N	\N	\N	\N
ceb70d79-f0c7-4b70-81ed-d8e9ebc43d33	2bfbe7d3-367f-484d-bd24-d04e6729f2c1	c9888a0a-b0d5-4d73-9681-862169c49706	\N		2014-11-25 06:00:00	0.17	134.00	55.3846	50.000	65.000	0.000	0.00	7.00	JOZEF	2014-11-26 06:41:00	2	\N	\N	\N	\N	\N	\N	\N
f250b2fa-e00e-4b11-a741-91d23c44092a	6848c3fe-4f0e-499e-9d3b-99bf8a6b0a91	c9888a0a-b0d5-4d73-9681-862169c49706	\N		2014-11-25 06:20:00	6.17	134.00	55.3846	50.000	65.000	0.000	0.00	133.00	JOZEF	2014-11-26 06:41:00	2	\N	\N	\N	\N	\N	\N	\N
3adf8e39-ee55-42f5-85e4-63d91c13f9f7	0f2e17be-24e6-4f90-8afa-0f2b928df32d	8e0750e5-1cf2-4bdd-b22b-00a5eb22f9b4	\N		2014-11-25 10:15:00	2.00	134.00	71.8563	50.000	50.100	0.000	0.00	134.00	JOZEF	2014-11-27 08:06:00	2	\N	\N	\N	\N	\N	\N	\N
ed3dfede-f364-40ad-bc2b-3fb6757b693e	aa71af30-7617-428c-b63e-8cd982a8eea9	f97563c3-c3ef-4451-8e6f-63231af34c5c	\N		2014-11-25 14:19:00	2.67	134.00	55.3846	50.000	65.000	0.000	0.00	133.00	JOZEF	2014-11-26 06:44:00	2	\N	\N	\N	\N	\N	\N	\N
d3095ff0-fd08-466b-9868-c46c89880190	0485bf19-cac3-4b18-a14f-30f08622f625	f97563c3-c3ef-4451-8e6f-63231af34c5c	\N		2014-11-25 17:14:00	3.17	134.00	55.3846	50.000	65.000	0.000	0.00	133.00	JOZEF	2014-11-26 06:44:00	2	\N	\N	\N	\N	\N	\N	\N
72087d21-0da5-4a48-9ad7-ec2efe65908c	62f2ec44-9f99-48a1-b35b-e5062d93d7bf	247d57ed-7e02-4ac3-b60e-62bc44396c86	\N		2014-11-27 13:19:00	0.67	134.00	11.2150	310.000	321.000	0.000	1.00	3.00	JOZEF	2014-11-28 06:42:00	2	\N	\N	\N	\N	\N	\N	\N
50222e68-9708-458e-8322-937af24641d0	3b87133a-6075-4715-a6d7-efa701b879b3	247d57ed-7e02-4ac3-b60e-62bc44396c86	\N		2014-11-28 06:09:00	7.83	129.00	11.9601	290.000	301.000	0.000	0.00	69.00	JOZEF	2014-12-01 07:12:00	2	\N	\N	\N	\N	\N	\N	\N
84ea6757-06c4-46ee-bdbd-4ce3ee611c20	3b87133a-6075-4715-a6d7-efa701b879b3	95ff938e-9e8f-413e-93bb-8f5ad9c77f6c	\N		2014-12-01 06:00:00	4.33	129.00	11.9601	290.000	301.000	0.000	0.00	35.00	JOZEF	2014-12-02 06:42:00	2	\N	\N	\N	\N	\N	\N	\N
b0284b8d-52c2-475a-b1ca-4c1dd9c5bb0a	3b87133a-6075-4715-a6d7-efa701b879b3	5ee2488f-295a-4c35-92b9-a8711237355e	\N		2014-12-01 10:19:00	2.33	129.00	11.9601	290.000	301.000	0.000	0.00	24.00	JOZEF	2014-12-02 06:42:00	2	\N	\N	\N	\N	\N	\N	\N
e0f5a82e-b976-4669-b025-bc84b0edb03a	bee23a02-5636-446a-b4ad-92c52eec3083	76d55b8c-48f1-4c6b-a652-80aa882e40d4	\N		2014-11-26 06:00:00	0.17	134.00	0.0000	0.000	0.000	0.000	0.00	132.00	JOZEF	2014-12-10 11:21:00	2	\N	\N	\N	\N	\N	\N	\N
be26b27a-3ce8-48e2-823b-4be655fda9ef	bc988c76-978c-4590-ac57-3393d0b7e4c2	bed3ad66-7fd9-4c1f-9281-1394b7d1f8ca	\N		2014-11-28 11:15:00	0.75	134.00	28.3242	127.000	127.100	0.000	0.00	9.00	JOZEF	2014-12-01 12:58:00	2	\N	\N	\N	\N	\N	\N	\N
459aeaa4-d945-4d2e-82de-5881b08679fd	bc988c76-978c-4590-ac57-3393d0b7e4c2	6cc52532-03ea-4d27-9674-89612359ca8b	\N		2014-12-04 06:00:00	8.00	134.00	28.3242	127.000	127.100	0.000	0.00	62.00	JOZEF	2014-12-10 13:03:00	2	\N	\N	\N	\N	\N	\N	\N
f4d11ac2-dc36-4a09-b623-0fa4717d1c63	bc988c76-978c-4590-ac57-3393d0b7e4c2	bed3ad66-7fd9-4c1f-9281-1394b7d1f8ca	\N		2014-12-04 07:00:00	7.00	134.00	28.3242	127.000	127.100	0.000	1.00	61.00	JOZEF	2014-12-10 11:18:00	2	\N	\N	\N	\N	\N	\N	\N
52e6383c-27de-488f-bb39-787e76dbcdc0	faa4a706-3d40-47e0-a830-c4fe96941c57	26b45014-aa19-4cd6-b96b-74efb9d33a6c	\N		2014-11-28 06:00:00	0.17	134.00	0.0000	0.000	0.000	0.000	0.00	132.00	JOZEF	2014-12-10 11:21:00	2	\N	\N	\N	\N	\N	\N	\N
d3cc4297-f44f-4aa6-a422-eca38173c404	90a94a02-0c54-4618-b5e4-1aa225e034ef	ec6d2a28-bc38-4070-9488-f8f75a3b3848	\N	C	2014-11-20 00:00:00	0.50	268.00	50.7042	51.000	71.000	0.000	0.00	0.00	JOZEF	2014-11-21 06:37:00	3	\N	\N	\N	\N	\N	\N	\N
440c6e9c-9abd-4c5c-9752-41d1ea566259	90a94a02-0c54-4618-b5e4-1aa225e034ef	56eec53b-2c75-48de-a23b-ab46def9c829	\N	C	2014-11-21 00:00:00	0.50	268.00	50.7042	51.000	71.000	0.000	0.00	0.00	JOZEF	2014-11-21 06:36:00	3	\N	\N	\N	\N	\N	\N	\N
6e1816af-3274-49b3-9f32-720364a6dfce	90a94a02-0c54-4618-b5e4-1aa225e034ef	56eec53b-2c75-48de-a23b-ab46def9c829	\N	C	2014-11-21 00:00:00	0.08	268.00	50.7042	51.000	71.000	0.000	0.00	0.00	JOZEF	2014-11-21 06:36:00	3	\N	\N	\N	\N	\N	\N	\N
f2c0311a-6b9b-4b8c-b468-5824bc05f31c	2bfbe7d3-367f-484d-bd24-d04e6729f2c1	6e089693-54b1-46fc-a582-a7b54a8fd3d1	\N	C	2014-11-25 00:00:00	0.50	134.00	55.3846	50.000	65.000	0.000	0.00	0.00	JOZEF	2014-11-25 06:36:00	3	\N	\N	\N	\N	\N	\N	\N
926d4d37-cc4f-4883-89ad-b468065626d1	2bfbe7d3-367f-484d-bd24-d04e6729f2c1	6e089693-54b1-46fc-a582-a7b54a8fd3d1	\N	C	2014-11-25 00:00:00	0.08	134.00	55.3846	50.000	65.000	0.000	0.00	0.00	JOZEF	2014-11-25 06:36:00	3	\N	\N	\N	\N	\N	\N	\N
7bf2d326-075b-4a25-a173-b30fc7e2160f	2bfbe7d3-367f-484d-bd24-d04e6729f2c1	6e089693-54b1-46fc-a582-a7b54a8fd3d1	\N	C	2014-11-25 00:00:00	0.25	134.00	55.3846	50.000	65.000	0.000	0.00	0.00	JOZEF	2014-11-25 06:36:00	3	\N	\N	\N	\N	\N	\N	\N
063f0a33-5d2d-46e1-9692-5d1ea92ffb4a	2bfbe7d3-367f-484d-bd24-d04e6729f2c1	6e089693-54b1-46fc-a582-a7b54a8fd3d1	\N	C	2014-11-25 00:00:00	0.17	134.00	55.3846	50.000	65.000	0.000	0.00	0.00	JOZEF	2014-11-25 06:37:00	3	\N	\N	\N	\N	\N	\N	\N
10628a47-f55f-4d5b-b6d9-c9a7aa7ed99f	2bfbe7d3-367f-484d-bd24-d04e6729f2c1	6e089693-54b1-46fc-a582-a7b54a8fd3d1	\N	C	2014-11-25 00:00:00	0.25	134.00	55.3846	50.000	65.000	0.000	0.00	0.00	JOZEF	2014-11-25 06:36:00	3	\N	\N	\N	\N	\N	\N	\N
415d028c-bcf7-4e29-8267-597e362cb2ba	2bfbe7d3-367f-484d-bd24-d04e6729f2c1	6e089693-54b1-46fc-a582-a7b54a8fd3d1	\N	C	2014-11-25 00:00:00	0.50	134.00	55.3846	50.000	65.000	0.000	0.00	0.00	JOZEF	2014-11-25 06:36:00	3	\N	\N	\N	\N	\N	\N	\N
1767117b-15a2-4c8e-847a-b5595fc270cf	6848c3fe-4f0e-499e-9d3b-99bf8a6b0a91	c9888a0a-b0d5-4d73-9681-862169c49706	\N	C	2014-11-25 00:00:00	0.50	134.00	55.3846	50.000	65.000	0.000	0.00	0.00	JOZEF	2014-11-26 06:41:00	3	\N	\N	\N	\N	\N	\N	\N
cf7392ab-7469-4d2a-b85e-bcdca7aa13e6	6848c3fe-4f0e-499e-9d3b-99bf8a6b0a91	c9888a0a-b0d5-4d73-9681-862169c49706	\N	C	2014-11-25 00:00:00	0.25	134.00	55.3846	50.000	65.000	0.000	0.00	0.00	JOZEF	2014-11-26 06:41:00	3	\N	\N	\N	\N	\N	\N	\N
0a33e8ed-6444-47e4-ba6a-40070c113711	6848c3fe-4f0e-499e-9d3b-99bf8a6b0a91	c9888a0a-b0d5-4d73-9681-862169c49706	\N	C	2014-11-25 00:00:00	0.50	134.00	55.3846	50.000	65.000	0.000	0.00	0.00	JOZEF	2014-11-26 06:41:00	3	\N	\N	\N	\N	\N	\N	\N
a3132f8f-4498-4b4f-83d7-7de63ccfb1f9	6848c3fe-4f0e-499e-9d3b-99bf8a6b0a91	c9888a0a-b0d5-4d73-9681-862169c49706	\N	C	2014-11-25 00:00:00	0.25	134.00	55.3846	50.000	65.000	0.000	0.00	0.00	JOZEF	2014-11-26 06:41:00	3	\N	\N	\N	\N	\N	\N	\N
cad80d28-ca41-4b5d-bf6d-18a8b29b9657	6848c3fe-4f0e-499e-9d3b-99bf8a6b0a91	c9888a0a-b0d5-4d73-9681-862169c49706	\N	C	2014-11-25 00:00:00	0.17	134.00	55.3846	50.000	65.000	0.000	0.00	0.00	JOZEF	2014-11-26 06:41:00	3	\N	\N	\N	\N	\N	\N	\N
bbba9196-49ab-4d4c-accf-5b98267a2bbe	aa71af30-7617-428c-b63e-8cd982a8eea9	f97563c3-c3ef-4451-8e6f-63231af34c5c	\N	C	2014-11-25 00:00:00	0.08	134.00	55.3846	50.000	65.000	0.000	0.00	0.00	JOZEF	2014-11-26 06:44:00	3	\N	\N	\N	\N	\N	\N	\N
e21f229d-b67d-4434-81ae-3b305cd07865	aa71af30-7617-428c-b63e-8cd982a8eea9	f97563c3-c3ef-4451-8e6f-63231af34c5c	\N	C	2014-11-25 00:00:00	0.08	134.00	55.3846	50.000	65.000	0.000	0.00	0.00	JOZEF	2014-11-26 06:44:00	3	\N	\N	\N	\N	\N	\N	\N
0b7fdf40-59bc-4d4b-9505-71ead50720e0	aa71af30-7617-428c-b63e-8cd982a8eea9	f97563c3-c3ef-4451-8e6f-63231af34c5c	\N	C	2014-11-25 00:00:00	0.08	134.00	55.3846	50.000	65.000	0.000	0.00	0.00	JOZEF	2014-11-26 06:44:00	3	\N	\N	\N	\N	\N	\N	\N
6e671861-83f3-42c1-bfb2-02e64cb799de	0485bf19-cac3-4b18-a14f-30f08622f625	f97563c3-c3ef-4451-8e6f-63231af34c5c	\N	C	2014-11-25 00:00:00	0.50	134.00	55.3846	50.000	65.000	0.000	0.00	0.00	JOZEF	2014-11-26 06:44:00	3	\N	\N	\N	\N	\N	\N	\N
f6472b87-6bb1-47e9-9ef6-15831d44c376	62f2ec44-9f99-48a1-b35b-e5062d93d7bf	247d57ed-7e02-4ac3-b60e-62bc44396c86	\N	C	2014-11-27 00:00:00	0.17	134.00	11.2150	310.000	321.000	0.000	0.00	0.00	JOZEF	2014-11-28 06:42:00	3	\N	\N	\N	\N	\N	\N	\N
110029c2-6ba9-4085-a89d-e09ede8025f8	62f2ec44-9f99-48a1-b35b-e5062d93d7bf	247d57ed-7e02-4ac3-b60e-62bc44396c86	\N	C	2014-11-27 00:00:00	0.17	134.00	11.2150	310.000	321.000	0.000	0.00	0.00	JOZEF	2014-11-28 06:42:00	3	\N	\N	\N	\N	\N	\N	\N
2f1a9d85-fa1a-42d6-aa48-0be38fac6ef6	62f2ec44-9f99-48a1-b35b-e5062d93d7bf	247d57ed-7e02-4ac3-b60e-62bc44396c86	\N	C	2014-11-27 00:00:00	0.08	134.00	11.2150	310.000	321.000	0.000	0.00	0.00	JOZEF	2014-11-28 06:42:00	3	\N	\N	\N	\N	\N	\N	\N
599047c3-f0aa-4008-a09e-878925a251c3	3b87133a-6075-4715-a6d7-efa701b879b3	247d57ed-7e02-4ac3-b60e-62bc44396c86	\N	C	2014-11-28 00:00:00	0.50	129.00	11.9601	290.000	301.000	0.000	0.00	0.00	JOZEF	2014-12-01 07:12:00	3	\N	\N	\N	\N	\N	\N	\N
e14411ce-c61e-4c59-a490-b7c9fe7c96f8	3b87133a-6075-4715-a6d7-efa701b879b3	247d57ed-7e02-4ac3-b60e-62bc44396c86	\N	C	2014-11-28 00:00:00	0.25	129.00	11.9601	290.000	301.000	0.000	0.00	0.00	JOZEF	2014-12-01 07:12:00	3	\N	\N	\N	\N	\N	\N	\N
e83141fd-2a98-4bdd-b54a-451bf529589a	3b87133a-6075-4715-a6d7-efa701b879b3	247d57ed-7e02-4ac3-b60e-62bc44396c86	\N	C	2014-11-28 00:00:00	0.25	129.00	11.9601	290.000	301.000	0.000	0.00	0.00	JOZEF	2014-12-01 07:12:00	3	\N	\N	\N	\N	\N	\N	\N
ee31078d-17e8-4f64-91bd-8e487a9fe351	3b87133a-6075-4715-a6d7-efa701b879b3	247d57ed-7e02-4ac3-b60e-62bc44396c86	\N	C	2014-11-28 00:00:00	0.17	129.00	11.9601	290.000	301.000	0.000	0.00	0.00	JOZEF	2014-12-01 07:12:00	3	\N	\N	\N	\N	\N	\N	\N
853f7894-2303-43b4-90a4-71beb2a1c23d	3b87133a-6075-4715-a6d7-efa701b879b3	95ff938e-9e8f-413e-93bb-8f5ad9c77f6c	\N	C	2014-12-01 00:00:00	0.17	129.00	11.9601	290.000	301.000	0.000	0.00	0.00	JOZEF	2014-12-02 06:42:00	3	\N	\N	\N	\N	\N	\N	\N
65b11ff4-3b2c-4dbc-8783-9dede6fa3353	3b87133a-6075-4715-a6d7-efa701b879b3	95ff938e-9e8f-413e-93bb-8f5ad9c77f6c	\N	C	2014-12-01 00:00:00	0.17	129.00	11.9601	290.000	301.000	0.000	0.00	0.00	JOZEF	2014-12-02 06:42:00	3	\N	\N	\N	\N	\N	\N	\N
599eaae4-a449-4981-b34a-d89437141f2a	3b87133a-6075-4715-a6d7-efa701b879b3	5ee2488f-295a-4c35-92b9-a8711237355e	\N	C	2014-12-01 00:00:00	0.08	129.00	11.9601	290.000	301.000	0.000	0.00	0.00	JOZEF	2014-12-02 06:42:00	3	\N	\N	\N	\N	\N	\N	\N
8b6a5381-b827-4b03-8065-48a1b05ebadf	3b87133a-6075-4715-a6d7-efa701b879b3	5ee2488f-295a-4c35-92b9-a8711237355e	\N	C	2014-12-01 00:00:00	0.17	129.00	11.9601	290.000	301.000	0.000	0.00	0.00	JOZEF	2014-12-02 06:42:00	3	\N	\N	\N	\N	\N	\N	\N
144fa34a-6923-4041-8b55-49214d0bd0d7	3b87133a-6075-4715-a6d7-efa701b879b3	95ff938e-9e8f-413e-93bb-8f5ad9c77f6c	\N	C	2014-12-01 00:00:00	0.08	129.00	11.9601	290.000	301.000	0.000	0.00	0.00	JOZEF	2014-12-02 06:42:00	3	\N	\N	\N	\N	\N	\N	\N
2f09f9a8-3c9a-4b2e-bafb-5dc6f6e891ad	3b87133a-6075-4715-a6d7-efa701b879b3	95ff938e-9e8f-413e-93bb-8f5ad9c77f6c	\N	C	2014-12-01 00:00:00	0.08	129.00	11.9601	290.000	301.000	0.000	0.00	0.00	JOZEF	2014-12-02 06:42:00	3	\N	\N	\N	\N	\N	\N	\N
8caa3358-c597-473c-b1c6-5d0831d82d70	3b87133a-6075-4715-a6d7-efa701b879b3	95ff938e-9e8f-413e-93bb-8f5ad9c77f6c	\N	C	2014-12-01 00:00:00	0.50	129.00	11.9601	290.000	301.000	0.000	0.00	0.00	JOZEF	2014-12-02 06:42:00	3	\N	\N	\N	\N	\N	\N	\N
0e766b8a-6460-4985-b952-2f3256427c4a	90a94a02-0c54-4618-b5e4-1aa225e034ef	ec6d2a28-bc38-4070-9488-f8f75a3b3848	\N		2014-11-20 18:44:00	0.50	268.00	50.7042	51.000	71.000	0.000	0.00	1.00	JOZEF	2014-11-24 06:54:00	5	\N	\N	\N	\N	\N	\N	\N
288fe44b-847a-4c6c-880a-827b391fc07a	2bfbe7d3-367f-484d-bd24-d04e6729f2c1	6e089693-54b1-46fc-a582-a7b54a8fd3d1	\N		2014-11-25 01:00:00	0.25	134.00	55.3846	50.000	65.000	0.000	0.00	1.00	JOZEF	2014-11-25 06:36:00	5	\N	\N	\N	\N	\N	\N	\N
a53352eb-e88f-4aa1-9e29-17a47c814da9	6848c3fe-4f0e-499e-9d3b-99bf8a6b0a91	31acb437-e866-4a28-a61c-f0d72808fe07	\N		2014-11-25 06:15:00	0.08	134.00	55.3846	50.000	65.000	0.000	0.00	1.00	JOZEF	2014-11-26 06:41:00	5	\N	\N	\N	\N	\N	\N	\N
65ae3f83-d2db-44d3-a2ea-7c11fc916da3	aa71af30-7617-428c-b63e-8cd982a8eea9	31acb437-e866-4a28-a61c-f0d72808fe07	\N		2014-11-25 14:09:00	0.17	134.00	55.3846	50.000	65.000	0.000	0.00	1.00	JOZEF	2014-11-26 06:42:00	5	\N	\N	\N	\N	\N	\N	\N
3f5da38b-62c1-4e13-bf1a-66f79f028b8d	0485bf19-cac3-4b18-a14f-30f08622f625	ba46a2fa-50df-4b6e-84ba-2a6b2b30ca0a	\N		2014-11-25 17:10:00	0.08	134.00	55.3846	50.000	65.000	0.000	0.00	1.00	JOZEF	2014-11-26 06:44:00	5	\N	\N	\N	\N	\N	\N	\N
8328c8da-e672-427c-9ac1-2ea21cc1970c	62f2ec44-9f99-48a1-b35b-e5062d93d7bf	31acb437-e866-4a28-a61c-f0d72808fe07	\N		2014-11-27 13:15:00	0.08	134.00	11.2150	310.000	321.000	0.000	0.00	1.00	JOZEF	2014-11-28 06:42:00	5	\N	\N	\N	\N	\N	\N	\N
bbda3b7b-234b-4bc5-bd0c-f1d88383ad81	3b87133a-6075-4715-a6d7-efa701b879b3	31acb437-e866-4a28-a61c-f0d72808fe07	\N		2014-11-28 06:04:00	0.08	129.00	11.9601	290.000	301.000	0.000	0.00	1.00	JOZEF	2014-12-01 07:12:00	5	\N	\N	\N	\N	\N	\N	\N
7d6b4256-a333-4fb4-b464-b39d9edc1198	dbde03a1-1224-42f7-8933-30faeb942e26	bed3ad66-7fd9-4c1f-9281-1394b7d1f8ca	\N		2014-09-11 08:30:00	0.00	2018.00	0.0000	0.000	0.000	0.000	0.00	0.00	JOZEF	2014-09-16 13:00:00	1	\N	\N	\N	\N	\N	\N	\N
ef530d62-68b8-4e6e-b117-d158a7784b46	fdf818e7-f2d5-4488-8154-55713f7efec5	bed3ad66-7fd9-4c1f-9281-1394b7d1f8ca	\N		2014-09-10 06:00:00	0.00	2018.00	179.1045	20.000	20.100	0.000	0.00	0.00	JOZEF	2014-09-16 12:58:00	1	\N	\N	\N	\N	\N	\N	\N
bad0055b-3996-41c0-8ad1-1636130e1ac7	5cf89f3c-4ecc-4552-8548-f3b0033f2e47	26b45014-aa19-4cd6-b96b-74efb9d33a6c	\N		2014-09-11 06:00:00	0.00	2018.00	0.0000	0.000	0.000	0.000	0.00	0.00	JOZEF	2014-09-16 13:01:00	1	\N	\N	\N	\N	\N	\N	\N
98f5028e-3894-4112-9cc9-d356002472e8	dbde03a1-1224-42f7-8933-30faeb942e26	bed3ad66-7fd9-4c1f-9281-1394b7d1f8ca	\N		2014-09-11 08:30:00	0.17	2018.00	0.0000	0.000	0.000	0.000	0.00	2018.00	JOZEF	2014-09-16 13:00:00	2	\N	\N	\N	\N	\N	\N	\N
3f9c7166-ef51-4ff0-9874-b566b2b49831	fdf818e7-f2d5-4488-8154-55713f7efec5	e18c3cce-1542-49bd-8cdb-92e2fa787382	\N		2014-09-10 06:00:00	8.00	2018.00	179.1045	20.000	20.100	0.000	0.00	780.00	JOZEF	2014-09-16 12:58:00	2	\N	\N	\N	\N	\N	\N	\N
a84c4182-80b0-4f90-ac70-820d8154ad41	fdf818e7-f2d5-4488-8154-55713f7efec5	bed3ad66-7fd9-4c1f-9281-1394b7d1f8ca	\N		2014-09-10 06:00:00	8.00	2018.00	179.1045	20.000	20.100	0.000	0.00	780.00	JOZEF	2014-09-16 12:58:00	2	\N	\N	\N	\N	\N	\N	\N
3705ebb1-e4cd-4cd4-be0b-3003f5f5da9d	fdf818e7-f2d5-4488-8154-55713f7efec5	bed3ad66-7fd9-4c1f-9281-1394b7d1f8ca	\N		2014-09-11 06:00:00	2.50	2018.00	179.1045	20.000	20.100	0.000	0.00	229.00	JOZEF	2014-09-16 13:00:00	2	\N	\N	\N	\N	\N	\N	\N
5acce1bd-9eaa-4e28-a8b0-dd5e16fd53d3	fdf818e7-f2d5-4488-8154-55713f7efec5	e18c3cce-1542-49bd-8cdb-92e2fa787382	\N		2014-09-11 06:00:00	2.50	2018.00	179.1045	20.000	20.100	0.000	0.00	229.00	JOZEF	2014-09-16 12:58:00	2	\N	\N	\N	\N	\N	\N	\N
d7d7b6e2-afe9-48e8-bf48-dd3ef5c20300	5cf89f3c-4ecc-4552-8548-f3b0033f2e47	26b45014-aa19-4cd6-b96b-74efb9d33a6c	\N		2014-09-11 06:00:00	0.17	2018.00	0.0000	0.000	0.000	0.000	0.00	2018.00	JOZEF	2014-09-16 13:01:00	2	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3880 (class 0 OID 826254)
-- Dependencies: 240
-- Data for Name: razk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razk (id, nalog_id, maticna_id, parent_id, kolicina, kolicinaizdaje, kolicinanaroci, upor, datknj, statusnarocil, statusizdaje) FROM stdin;
1cc01efe-176d-49ee-a5f0-cf69856cf6fe	59634fd0-05df-4e56-99dd-ceaca396df6c	5b0938f5-a60f-40b2-94a6-495ac4cdec29	\N	1.0000	\N	\N	GERTI	2014-09-09 03:53:00	900	900
52a2f669-5e07-4339-b27c-779d2a5b1667	59634fd0-05df-4e56-99dd-ceaca396df6c	769d4aa4-b6fb-41d0-aaa1-e9bfc94a8dd1	1cc01efe-176d-49ee-a5f0-cf69856cf6fe	1.0000	\N	\N	GERTI	\N	900	900
6bbdb304-73a5-4335-ae73-2f7d8b9e8de9	59634fd0-05df-4e56-99dd-ceaca396df6c	0a28e70c-41fa-44ed-872a-621745db5525	52a2f669-5e07-4339-b27c-779d2a5b1667	1.0000	\N	\N	GERTI	\N	900	900
e598cc65-9a64-4183-a81f-739cfc034bef	59634fd0-05df-4e56-99dd-ceaca396df6c	820ecbab-08a1-47e6-8cee-e6ad464a37c2	6bbdb304-73a5-4335-ae73-2f7d8b9e8de9	1.0000	\N	\N	GERTI	\N	900	900
14114474-8505-4465-8b06-a14ff34626af	59634fd0-05df-4e56-99dd-ceaca396df6c	0582b3b4-4e35-4ad6-9a61-6b083d11acec	e598cc65-9a64-4183-a81f-739cfc034bef	1.0000	\N	\N	GERTI	\N	900	900
bc024ce8-2187-45ec-8182-ab96e57da144	59634fd0-05df-4e56-99dd-ceaca396df6c	5e618bda-58a1-4ccf-8f57-d9520d61f771	14114474-8505-4465-8b06-a14ff34626af	1.0000	\N	\N	GERTI	\N	900	900
7cee13b6-a76c-4425-a5a2-1655794a0b3a	59634fd0-05df-4e56-99dd-ceaca396df6c	f1131225-bbd3-4119-a261-5edf14ae7301	bc024ce8-2187-45ec-8182-ab96e57da144	2.0000	\N	\N	GERTI	\N	900	900
7133d045-ed57-4248-bd8a-7f6158945bc6	59634fd0-05df-4e56-99dd-ceaca396df6c	7e5a1e5b-793d-4573-add3-9cad364b8474	7cee13b6-a76c-4425-a5a2-1655794a0b3a	1.0000	268.0000	0.0000	GERTI	\N	900	900
e1534c60-edb3-4e1b-af14-7ec56438e687	59634fd0-05df-4e56-99dd-ceaca396df6c	4ba32d29-fe3c-44cf-84e9-d2e27edbe103	bc024ce8-2187-45ec-8182-ab96e57da144	1.0000	\N	\N	GERTI	\N	900	900
93e11aed-08d9-4ea6-91f4-9aec784fa7c4	59634fd0-05df-4e56-99dd-ceaca396df6c	37032156-6150-41a1-b0fb-70e273271c0a	e1534c60-edb3-4e1b-af14-7ec56438e687	1.0000	\N	\N	GERTI	\N	900	900
268f801f-260f-4ca7-9fc3-fec130bb59e5	59634fd0-05df-4e56-99dd-ceaca396df6c	b0919598-bf06-492a-b3d9-4470bd60efe3	93e11aed-08d9-4ea6-91f4-9aec784fa7c4	1.0000	134.0000	0.0000	GERTI	\N	900	900
bc9a5854-5f09-4537-ad63-bd08882d2d2f	59634fd0-05df-4e56-99dd-ceaca396df6c	e80f5680-6c2d-41ea-9240-b6cef515bbd7	52a2f669-5e07-4339-b27c-779d2a5b1667	2.0000	268.0000	0.0000	GERTI	\N	900	900
30fd9e40-8012-4b8a-b47d-37a67f5a8c0c	59634fd0-05df-4e56-99dd-ceaca396df6c	1faa7822-2116-4d07-8f0d-6d5690d05e3e	1cc01efe-176d-49ee-a5f0-cf69856cf6fe	0.2000	26.8000	0.0000	GERTI	\N	900	900
1ab1fdd4-2d64-4733-be19-607f6c6cdf08	59634fd0-05df-4e56-99dd-ceaca396df6c	a4cfc97f-83be-4c8e-83d7-569b5ab36342	1cc01efe-176d-49ee-a5f0-cf69856cf6fe	1.0000	134.0000	0.0000	GERTI	\N	900	900
7b696cf7-cbb4-415c-8d4c-5a1951d674ae	59634fd0-05df-4e56-99dd-ceaca396df6c	6b2ebe89-5208-4170-af11-74f214a7e501	1cc01efe-176d-49ee-a5f0-cf69856cf6fe	0.0166	2.2240	0.0000	GERTI	\N	900	900
164e1fd4-fadc-4db5-92f7-dcadcd9770c5	59634fd0-05df-4e56-99dd-ceaca396df6c	cc70af25-37c4-479b-89ef-242c0f373694	1cc01efe-176d-49ee-a5f0-cf69856cf6fe	0.0000	0.0000	0.0000	GERTI	\N	900	900
0475af84-60e8-4843-a68e-8eeeedd5894b	2ba83bdd-9fba-4ed8-b9de-0101074f89c5	c3ee5653-2a56-47a1-8daf-6230dfef28d8	\N	1.0000	\N	\N	GERTI	2014-08-21 08:43:00	900	900
3819a0f6-f0fe-4c9f-8efd-7d3adf7f29ca	2ba83bdd-9fba-4ed8-b9de-0101074f89c5	170845d8-2e55-4716-9210-1803a9c3af38	0475af84-60e8-4843-a68e-8eeeedd5894b	1.0000	\N	\N	GERTI	\N	900	900
236faaff-83e8-48fd-a05c-7e0559504985	2ba83bdd-9fba-4ed8-b9de-0101074f89c5	19506682-9740-4cb7-94df-caf0cb1e6c19	3819a0f6-f0fe-4c9f-8efd-7d3adf7f29ca	1.0000	2018.0000	0.0000	GERTI	\N	900	900
245e36f4-a3d6-402d-b9ed-c9dc2873f7e1	2ba83bdd-9fba-4ed8-b9de-0101074f89c5	6ce0c380-ec67-4c64-8245-236715159d31	0475af84-60e8-4843-a68e-8eeeedd5894b	0.0027	5.4490	0.0000	GERTI	\N	900	900
9ec3b0f0-b618-44b7-91cc-de3fac49caff	2ba83bdd-9fba-4ed8-b9de-0101074f89c5	0f4cbc1e-0b18-49aa-b6f3-02618641f5af	0475af84-60e8-4843-a68e-8eeeedd5894b	0.0008	1.6140	0.0000	GERTI	\N	900	900
4f4acc43-20c1-46a7-a9e3-b0b2642ed6c6	2ba83bdd-9fba-4ed8-b9de-0101074f89c5	0098f83c-8c63-464b-839d-26210de36b70	0475af84-60e8-4843-a68e-8eeeedd5894b	0.0004	0.8070	0.0000	GERTI	\N	900	900
d7d82f62-2693-4670-9452-0988c4577be5	2ba83bdd-9fba-4ed8-b9de-0101074f89c5	30566084-b545-458a-9eb7-78a3dafa61e7	0475af84-60e8-4843-a68e-8eeeedd5894b	0.0000	0.0000	0.0000	GERTI	\N	900	900
e32ac630-c9bc-4c4c-bbbf-23f3fba75dd0	2ba83bdd-9fba-4ed8-b9de-0101074f89c5	595086ad-1eb0-4df6-8c43-de50a4515602	0475af84-60e8-4843-a68e-8eeeedd5894b	0.0000	0.0000	0.0000	GERTI	\N	900	900
446a6c8c-047c-4dd6-84c1-5048e70ee8b6	2ba83bdd-9fba-4ed8-b9de-0101074f89c5	cc70af25-37c4-479b-89ef-242c0f373694	0475af84-60e8-4843-a68e-8eeeedd5894b	0.0000	0.0000	0.0000	GERTI	\N	900	900
\.


--
-- TOC entry 3881 (class 0 OID 826261)
-- Dependencies: 241
-- Data for Name: razpiskost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpiskost (id, kos_id, operacija_id, tehen_id, klient_id, delavec_id, poz, kdodela, status, pripcas, kolicina, norma, datraz, upor, datknj) FROM stdin;
27ea0551-acf5-4910-882f-b6cdfe8ccdd1	7cee13b6-a76c-4425-a5a2-1655794a0b3a	11b2c5b4-a5e4-4c7b-9ed3-cb2ac110397e	cc5716e0-6041-486b-8093-b09a78be0869	\N	\N	1	T	\N	0.0000	268.000	0.200	2014-09-09	GERTI	2014-09-09 03:53:00
c0af5069-adf9-4e91-9d8a-6c852cae126a	7cee13b6-a76c-4425-a5a2-1655794a0b3a	550d2e69-cdda-4f77-865b-9373beb5ff92	6471aa67-d6e4-4e1e-8ecd-f3019a3029ce	\N	\N	1	T	\N	1.2200	268.000	59.020	2014-09-09	GERTI	2014-09-09 03:53:00
ce42094a-fb6b-46cf-ab23-31fa6d77eee3	93e11aed-08d9-4ea6-91f4-9aec784fa7c4	11b2c5b4-a5e4-4c7b-9ed3-cb2ac110397e	cc5716e0-6041-486b-8093-b09a78be0869	\N	\N	1	T	\N	0.0000	134.000	0.200	2014-09-09	GERTI	2014-09-09 03:53:00
1350d2e3-26d3-4f4c-a280-a3d996b2a053	93e11aed-08d9-4ea6-91f4-9aec784fa7c4	820a5ec9-b962-48b9-9f9f-876a9474cf33	6471aa67-d6e4-4e1e-8ecd-f3019a3029ce	\N	\N	1	T	\N	1.2200	134.000	29.021	2014-09-09	GERTI	2014-09-09 03:53:00
f9caeb1c-522e-40c2-a740-dad8a6cacee0	e1534c60-edb3-4e1b-af14-7ec56438e687	eca306b5-8fbf-44f6-9ded-d79661f9019a	6471aa67-d6e4-4e1e-8ecd-f3019a3029ce	\N	\N	1	T	\N	1.2200	134.000	31.398	2014-09-09	GERTI	2014-09-09 03:53:00
e8711dc5-917e-4909-89fa-ae4dad8c876d	bc024ce8-2187-45ec-8182-ab96e57da144	01f03303-7d4d-4459-a077-a060d7dee7e8	1802ab66-fc41-4b48-bbcd-275349b90841	\N	\N	1	T	\N	0.6000	134.000	87.790	2014-09-09	GERTI	2014-09-09 03:53:00
9fae225c-d5e3-49ca-acd5-996bcf2ae914	14114474-8505-4465-8b06-a14ff34626af	820a5ec9-b962-48b9-9f9f-876a9474cf33	6471aa67-d6e4-4e1e-8ecd-f3019a3029ce	\N	\N	1	T	\N	1.2200	134.000	52.667	2014-09-09	GERTI	2014-09-09 03:53:00
44546b72-506d-4605-bc4d-756bdf0ebc4e	e598cc65-9a64-4183-a81f-739cfc034bef	eca306b5-8fbf-44f6-9ded-d79661f9019a	6471aa67-d6e4-4e1e-8ecd-f3019a3029ce	\N	\N	1	T	\N	1.2200	134.000	52.500	2014-09-09	GERTI	2014-09-09 03:53:00
9941b6f3-79a2-40f4-b611-f9509168936c	6bbdb304-73a5-4335-ae73-2f7d8b9e8de9	14219006-80f4-4ee3-9c12-a6aa41543b6b	84d5afa6-ddb1-4e22-a7b2-3911e91df836	\N	\N	1	T	\N	1.4400	134.000	11.158	2014-09-09	GERTI	2014-09-09 03:53:00
5ab83d6d-de2d-4b90-a461-0725e38181c3	52a2f669-5e07-4339-b27c-779d2a5b1667	11b2c5b4-a5e4-4c7b-9ed3-cb2ac110397e	cc5716e0-6041-486b-8093-b09a78be0869	\N	\N	1	T	\N	0.0000	134.000	0.200	2014-09-09	GERTI	2014-09-09 03:53:00
5dbaced4-1b20-40c4-b8f0-ba7b32efb3d2	52a2f669-5e07-4339-b27c-779d2a5b1667	01f03303-7d4d-4459-a077-a060d7dee7e8	16cd68f0-b7ea-4ff8-a08f-bce170e35e0d	\N	\N	1	T	\N	0.5000	134.000	28.324	2014-09-09	GERTI	2014-09-09 03:53:00
0f04f778-81eb-4501-83f3-fc14140a009e	1cc01efe-176d-49ee-a5f0-cf69856cf6fe	11b2c5b4-a5e4-4c7b-9ed3-cb2ac110397e	cc5716e0-6041-486b-8093-b09a78be0869	\N	\N	1	T	\N	0.0000	134.000	0.200	2014-09-09	GERTI	2014-09-09 03:53:00
537d5324-09fd-4ceb-b1d9-6242e18ce78c	1cc01efe-176d-49ee-a5f0-cf69856cf6fe	e247503a-aadb-4798-ad12-4cb22c0b18c0	c140e80e-3650-4db9-9419-8784e4603d79	\N	\N	1	T	\N	0.1000	134.000	0.000	2014-09-09	GERTI	2014-09-09 03:53:00
4204193a-419f-4ae5-a596-495bca458594	1cc01efe-176d-49ee-a5f0-cf69856cf6fe	11b2c5b4-a5e4-4c7b-9ed3-cb2ac110397e	cc5716e0-6041-486b-8093-b09a78be0869	\N	\N	1	T	\N	0.0000	134.000	0.200	2014-09-09	GERTI	2014-09-09 03:53:00
49d30f79-e605-406b-8193-06d9cbdeb12f	1cc01efe-176d-49ee-a5f0-cf69856cf6fe	11b2c5b4-a5e4-4c7b-9ed3-cb2ac110397e	cc5716e0-6041-486b-8093-b09a78be0869	\N	\N	1	T	\N	0.0000	134.000	0.200	2014-09-09	GERTI	2014-09-09 03:53:00
a618f0a7-5033-48d9-b60a-4fad4dcba7f3	1cc01efe-176d-49ee-a5f0-cf69856cf6fe	11b2c5b4-a5e4-4c7b-9ed3-cb2ac110397e	cc5716e0-6041-486b-8093-b09a78be0869	\N	\N	1	T	\N	0.0000	134.000	0.200	2014-09-09	GERTI	2014-09-09 03:53:00
d81a9476-a3e5-413a-9053-3a0bf5b7e760	3819a0f6-f0fe-4c9f-8efd-7d3adf7f29ca	80537ea0-e9a1-424f-aa72-0c1152ee1b90	\N	81e90677-7b9a-4fd0-8045-45120d9c554a	\N	2	P	900	0.0000	2018.000	1.000	2014-08-21	GERTI	2014-08-21 08:43:00
00026513-62f3-4493-be04-98e51bdb8e7d	3819a0f6-f0fe-4c9f-8efd-7d3adf7f29ca	38782643-df23-4004-b404-e66522e307ef	5412de6c-529c-4577-a29c-67c110a21b11	\N	\N	1	T	900	0.3000	2018.000	0.000	2014-08-21	GERTI	2014-08-21 08:43:00
588a4e30-ee52-4919-a8c6-98d60882a7b1	3819a0f6-f0fe-4c9f-8efd-7d3adf7f29ca	11b2c5b4-a5e4-4c7b-9ed3-cb2ac110397e	cc5716e0-6041-486b-8093-b09a78be0869	\N	\N	1	T	900	0.0000	2018.000	0.200	2014-08-21	GERTI	2014-08-21 08:43:00
38722b40-1b3d-4195-b0a7-b4ba3f1e39bc	0475af84-60e8-4843-a68e-8eeeedd5894b	11b2c5b4-a5e4-4c7b-9ed3-cb2ac110397e	cc5716e0-6041-486b-8093-b09a78be0869	\N	\N	1	T	900	0.0000	2018.000	0.200	2014-08-21	GERTI	2014-08-21 08:43:00
043aa9f2-c19e-4acd-ad8c-b71cafef7394	0475af84-60e8-4843-a68e-8eeeedd5894b	11b2c5b4-a5e4-4c7b-9ed3-cb2ac110397e	cc5716e0-6041-486b-8093-b09a78be0869	\N	\N	1	T	900	0.0000	2018.000	0.200	2014-08-21	GERTI	2014-08-21 08:43:00
f33b38c5-8c2a-48dd-9c9a-0ff7c3e802ad	0475af84-60e8-4843-a68e-8eeeedd5894b	11b2c5b4-a5e4-4c7b-9ed3-cb2ac110397e	cc5716e0-6041-486b-8093-b09a78be0869	\N	\N	1	T	900	0.0000	2018.000	0.200	2014-08-21	GERTI	2014-08-21 08:43:00
5714e29d-2ae5-4823-81cf-8eb863802583	0475af84-60e8-4843-a68e-8eeeedd5894b	11b2c5b4-a5e4-4c7b-9ed3-cb2ac110397e	cc5716e0-6041-486b-8093-b09a78be0869	\N	\N	1	T	900	0.0000	2018.000	0.200	2014-08-21	GERTI	2014-08-21 08:43:00
872a58e1-88e7-45ff-bc61-705cfc1fced0	0475af84-60e8-4843-a68e-8eeeedd5894b	7e8742ca-cf04-4468-b7e8-1988d0e64266	5412de6c-529c-4577-a29c-67c110a21b11	\N	\N	2	T	900	0.3000	2018.000	0.000	2014-08-21	GERTI	2014-08-21 08:43:00
f1b0df23-0c9f-4952-a0e5-c56826a10fed	0475af84-60e8-4843-a68e-8eeeedd5894b	15e6b593-dc80-49e4-8530-a98f11866a09	5412de6c-529c-4577-a29c-67c110a21b11	\N	\N	1	T	900	0.3000	2018.000	179.105	2014-08-21	GERTI	2014-08-21 08:43:00
a0f3853a-7631-436f-842a-ea7a6190daca	0475af84-60e8-4843-a68e-8eeeedd5894b	11b2c5b4-a5e4-4c7b-9ed3-cb2ac110397e	cc5716e0-6041-486b-8093-b09a78be0869	\N	\N	1	T	900	0.0000	2018.000	0.200	2014-08-21	GERTI	2014-08-21 08:43:00
3a7926df-ccc2-427f-8676-4e70429b6a39	0475af84-60e8-4843-a68e-8eeeedd5894b	11b2c5b4-a5e4-4c7b-9ed3-cb2ac110397e	cc5716e0-6041-486b-8093-b09a78be0869	\N	\N	1	T	900	0.0000	2018.000	0.200	2014-08-21	GERTI	2014-08-21 08:43:00
\.


--
-- TOC entry 3882 (class 0 OID 826267)
-- Dependencies: 242
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 3916 (class 0 OID 0)
-- Dependencies: 243
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 3884 (class 0 OID 826275)
-- Dependencies: 244
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin, upor, datknj) FROM stdin;
6d1046f2-4b36-44a1-b2d3-1ed452b3b117	tip-vse		t	anon	2015-01-07 18:44:41
3cd85d14-b28a-4a62-b7bf-da2c306764ab	guest		t	anon	2015-01-07 18:44:41
e4113413-19db-453d-ba3a-ffe99273b476	prijavljen-uporabnik		t	anon	2015-01-07 18:44:41
1ab2765f-52bc-4996-9771-c15d7abc90cd	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t	console	2015-01-07 18:44:43
95b6c15b-12da-4f5a-a322-c2e2a39bcb9c	tehnologija-vse	Polni dostop do vsega iz tehnologije.	t	console	2015-01-07 18:44:43
6b70dc75-44fd-45a9-aa82-ea35916c62d4	logistika-vse	Polni dostop do vsega iz logistike.	t	console	2015-01-07 18:44:43
c18ae1a9-0e35-4519-8157-4ff3a6ff693f	proizvodnja-vse	Polni dostop do vsega iz tehnologije.	t	console	2015-01-07 18:44:43
6bc93fb8-ac4b-483f-8854-f14dfaa8be0e	sifranti-vse	Polni dostop do vseh matičnih podatkov.	t	console	2015-01-07 18:44:43
c3472880-2bd1-4341-8fa5-b37501d9febe	tip-beri-vse	Omogoča bralni dostop do celotne aplikacije	t	console	2015-01-07 18:44:43
c1bdb86a-13e8-4f00-be5e-a72dbf528d22	vfs-admin	Omogoča polni dostop do naloženih dokumentov in datotek	t	console	2015-01-07 18:44:43
\.


--
-- TOC entry 3885 (class 0 OID 826283)
-- Dependencies: 245
-- Data for Name: role_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role_permission (role_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3886 (class 0 OID 826286)
-- Dependencies: 246
-- Data for Name: role_role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role_role (role_source, role_target) FROM stdin;
\.


--
-- TOC entry 3887 (class 0 OID 826289)
-- Dependencies: 247
-- Data for Name: serijskestevilke; Type: TABLE DATA; Schema: public; Owner: -
--

COPY serijskestevilke (id, maticna_id, paket_id, stevilka, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3888 (class 0 OID 826293)
-- Dependencies: 248
-- Data for Name: sifdog; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sifdog (id, sifra, naziv, prioriteta, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3889 (class 0 OID 826298)
-- Dependencies: 249
-- Data for Name: skl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY skl (id, lokacija_id, sifra, naziv, tipm, glomat, izrab, prevzemipremission, zbirno, upor, datknj, lokacijavhoda_id, metodaobracuna, metodacrpanja, poslujelokacijsko) FROM stdin;
36eef80e-30ab-49be-a957-cbd16d09700d	\N	00	zbirno	M	D	\N	\N	t	NADZO	\N	\N	fifo	fifo	t
7995c508-70bd-45c7-8d81-15d6a481badc	\N	10	SUROVINE11111	M	D	\N	\N	f	admin	2014-12-18 07:54:26	\N	fifo	fifo	t
c80a7e77-1b96-4476-b2ff-dddb4dfa315f	\N	30	GOTOVI IZDELKI	G	S	\N	\N	f	IRENA	\N	\N	fifo	fifo	t
ce7f0fa2-1995-419b-b9e9-137bcee1c37c	\N	80	OSNOVNA SREDSTVA	3	D	fe3e9c92-9afa-434e-aadd-7f4ef0825130	\N	f	NADZO	\N	\N	fifo	fifo	t
18d94cf5-a87d-4671-bf80-1b441e95d8e1	\N	70	DROBNI INVENTAR	D	D	d0f5a284-ab40-4045-91c4-240744bf7283	\N	f	NADZORNIK	\N	\N	fifo	fifo	t
898e76e2-0656-494c-b609-a8ae993d21ed	\N	20	POLIZDELKI	P	S	\N	\N	f	NADZORNIK	\N	\N	fifo	fifo	t
28a4c9cb-ae42-44d4-8aac-22104e9b9a61	\N	50	POTROŠNI MATERIAL	1	D	49483c43-fb43-4b3a-bf27-d043737632af	\N	f	IRENA	\N	\N	fifo	fifo	t
\.


--
-- TOC entry 3905 (class 0 OID 1330438)
-- Dependencies: 265
-- Data for Name: skladiscenjeizdaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY skladiscenjeizdaja (id, poreklo_id, kolicina, status, upor, datknj, izhodnidokument_id) FROM stdin;
\.


--
-- TOC entry 3906 (class 0 OID 1330447)
-- Dependencies: 266
-- Data for Name: skladiscenjepremik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY skladiscenjepremik (id, izvor_id, cilj_id, iz_id, na_id, kolicina, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3907 (class 0 OID 1330458)
-- Dependencies: 267
-- Data for Name: skladiscenjezaloga; Type: TABLE DATA; Schema: public; Owner: -
--

COPY skladiscenjezaloga (id, lokacija_id, zaloga_id, datum, kolicinadobro, prostazaloga, status, upor, datknj, izvornidokument_id, vhodnidokument_id) FROM stdin;
\.


--
-- TOC entry 3890 (class 0 OID 826305)
-- Dependencies: 250
-- Data for Name: sklo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sklo (id, sklop_id, maticnadrzalo, kolicinadrzalo, kolicinaorodje, kolicinapomozno1, kolicinapomozno2, upor, datknj, maticnaorodje_id, maticnapomozno1_id, maticnapomozno2_id) FROM stdin;
\.


--
-- TOC entry 3891 (class 0 OID 826315)
-- Dependencies: 251
-- Data for Name: skupine; Type: TABLE DATA; Schema: public; Owner: -
--

COPY skupine (id, name, description, upor, datknj) FROM stdin;
5d37f8c4-0b78-471a-8da0-c2de3ae5859b	administratorji	Skupina administratorjev	console	2015-01-07 18:44:43
\.


--
-- TOC entry 3892 (class 0 OID 826328)
-- Dependencies: 252
-- Data for Name: statustehen; Type: TABLE DATA; Schema: public; Owner: -
--

COPY statustehen (id, tehen_id, statusenote, datumstatusa, upor, datknj, trenutnaoperacija_id) FROM stdin;
ab369c72-797f-4013-a257-885f9c1f80dd	5412de6c-529c-4577-a29c-67c110a21b11	000	2014-12-22 14:25:04	ANONYMOUS	2014-12-22 14:25:04	\N
30c20f41-f6a4-41e0-952b-558f243c718c	1ff96024-417c-4dd1-8007-fa305dbcd0ae	000	2014-12-22 14:25:04	ANONYMOUS	2014-12-22 14:25:04	\N
6c1f327f-34ce-4a31-a1c5-6145be526cee	e0d03644-d34b-4a2c-9978-237d93c8cb7b	000	2014-12-22 14:25:04	ANONYMOUS	2014-12-22 14:25:04	\N
4f5c0e17-cb31-4791-ac7b-3c82b2fec78d	39d77065-bb51-4787-91cc-81b2e3e3c180	000	2014-12-22 14:25:04	ANONYMOUS	2014-12-22 14:25:04	\N
60f74c2a-962a-464a-923d-6a35d7353e4f	097023fb-39a9-463b-bf25-29405e383c59	000	2014-12-22 14:25:04	ANONYMOUS	2014-12-22 14:25:04	\N
cc6aefd0-48ec-4e25-a474-3889c8fbe2c2	b4fc828d-48ac-41cc-8c3b-9e41514ca6e2	000	2014-12-22 14:25:04	ANONYMOUS	2014-12-22 14:25:04	\N
4bf733e2-c4dc-4244-bb06-29273d42c7dd	a337fd2c-038f-4273-9805-202893bbb252	000	2014-12-22 14:25:04	ANONYMOUS	2014-12-22 14:25:04	\N
3f8f7cf8-ba7d-4dfb-ae2d-f59c731736e2	afa895f0-9b1c-4324-a617-f6669c39e7b6	000	2014-12-22 14:25:04	ANONYMOUS	2014-12-22 14:25:04	\N
61dc0a79-ab51-482b-9429-4c5f88339797	205d9e0e-ec3c-4619-9b64-89d5cf5f1c0a	000	2014-12-22 14:25:04	ANONYMOUS	2014-12-22 14:25:04	\N
2187ce9b-b63c-4ec6-88a0-2be593f309e8	2e31b671-0412-4258-9931-c0c6e83e58d1	000	2014-12-22 14:25:04	ANONYMOUS	2014-12-22 14:25:04	\N
a1569593-ca1a-49ce-b696-4c192fd9079c	84d5afa6-ddb1-4e22-a7b2-3911e91df836	000	2014-12-22 14:25:04	ANONYMOUS	2014-12-22 14:25:04	\N
990c4c08-0391-441a-bbbb-2009c3baed24	d6928715-05a0-45d8-af04-e282b2716819	000	2014-12-22 14:25:04	ANONYMOUS	2014-12-22 14:25:04	\N
9d35df14-46f7-47ef-9c1e-737ff5e18a1f	8c1dc211-b081-4820-a39b-f0309897a4ee	000	2014-12-22 14:25:04	ANONYMOUS	2014-12-22 14:25:04	\N
d39a5a84-ac0b-4523-9186-7eaf151b2134	c140e80e-3650-4db9-9419-8784e4603d79	000	2014-12-22 14:25:04	ANONYMOUS	2014-12-22 14:25:04	\N
30026eeb-b9cf-4dcc-b9a4-4acec39e521a	fc47bf9e-9f4b-4b3d-9432-9b64882a511f	000	2014-12-22 14:25:04	ANONYMOUS	2014-12-22 14:25:04	\N
\.


--
-- TOC entry 3893 (class 0 OID 826333)
-- Dependencies: 253
-- Data for Name: stevilcenjedokumenta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjedokumenta (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih, upor, datknj) FROM stdin;
96479f85-0715-4533-ac9c-0e570e2b5f72	PRI	Privzeto številčenje	\N	\N	1	1	%l-%n	f	t	console	2015-01-07 18:44:42
b65f1784-c71c-4205-bcc5-5fa2f59e5a81	BCD	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f	console	2015-01-07 18:44:42
9c0c4e7d-26b7-44e9-96ae-959f1caccbc5	KALK_K	Globalno številčenje kalkulacijskih kosovnic	\N	\N	4000	6	%n	t	f	console	2015-01-07 18:44:42
b4603a3e-dce3-4d83-8feb-e179da35912c	TMP	Globalno številčenje kalkulacijskih kosovnic	TMP	\N	1000	5	%l%n	t	t	console	2015-01-26 08:09:34
\.


--
-- TOC entry 3894 (class 0 OID 826340)
-- Dependencies: 254
-- Data for Name: stevilcenjeposkl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjeposkl (id, skl_id, dok_id, stevilcenje_id, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3895 (class 0 OID 826345)
-- Dependencies: 255
-- Data for Name: stevilcenjetrenutne; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjetrenutne (id, objid, leto, stevilka, upor, datknj) FROM stdin;
5d078259-20c0-4e69-8f7c-92f0067a3b71	b211ef14-d398-45ba-8670-2ffc94ec89e6	2015	2	admin	2015-02-26 10:34:29
0946a8b6-b585-48b5-aed9-ff3f94bcf4f2	b4603a3e-dce3-4d83-8feb-e179da35912c	2015	1005	admin	2015-02-25 18:51:15
\.


--
-- TOC entry 3896 (class 0 OID 826350)
-- Dependencies: 256
-- Data for Name: tdok; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tdok (id, stevilcenje_id, sifra, vrsta, stevilci, kratki, naziv, stevilcipriponke, template, style, headerimage, footerimage, pagesize, upor, datknj) FROM stdin;
cfe4c1c8-18a6-40b1-a801-9bdc115e79ea	96479f85-0715-4533-ac9c-0e570e2b5f72	PRP	O_PR	\N	PRIP	Generična priponka	t			\N	\N	\N	console	2015-01-07 18:44:43
23c55f69-4d6a-4229-bd9b-6553d4c786fb	96479f85-0715-4533-ac9c-0e570e2b5f72	120	M_IZD		I-M	IZDAJNICA MATERIALA	f			\N	\N	\N	console	2015-01-07 18:44:43
9fe156ab-98c9-4b76-94a8-392d169f6393	96479f85-0715-4533-ac9c-0e570e2b5f72	100	M_PVZ	1	PRE	PREVZEMNICA	f			\N	\N	\N	console	2015-01-07 18:44:43
e78de104-7dbd-484f-b202-9f5e176bae76	96479f85-0715-4533-ac9c-0e570e2b5f72	000	D_AR		DNP	DN ZA PROIZVODNJO ARTIKLOV	f			\N	\N	\N	console	2015-01-07 18:44:43
d5933181-39c4-4ccb-b3c6-cc051765ea55	9c0c4e7d-26b7-44e9-96ae-959f1caccbc5	310	T_KK		KK	KALKULACIJSKA KOSOVNICA	f			\N	\N	\N	console	2015-01-07 18:44:43
dc23c51c-7819-4c31-bb63-5b06f59c08dd	b65f1784-c71c-4205-bcc5-5fa2f59e5a81	BCD	O_GS	\N	BCODE	Globalni števec črtnih kod	t			\N	\N	\N	console	2015-01-07 18:44:43
8585e300-a6d4-4631-b5c0-ff9b51b6da5e	96479f85-0715-4533-ac9c-0e570e2b5f72	140	M_PRD		PRE	PREDAJNICA	f			none	none	A4 Portrait	admin	2015-02-13 16:36:37
9b69e84f-4b54-4e87-af46-99f599e24489	96479f85-0715-4533-ac9c-0e570e2b5f72	180	M_DOB		DOB	DOBAVNICA	f	<?= $tf->naslov($model->getKlient()); ?>\r\n<br />\r\n<?= $tf->naslov($model->getPrejemnik()); ?>\r\n<?= $makeTable($table, $model->getPostavke()); ?>		none	none	A5 Landscape	admin	2015-02-13 16:38:30
b211ef14-d398-45ba-8670-2ffc94ec89e6	96479f85-0715-4533-ac9c-0e570e2b5f72	200	N_PK	\N	P-K	Ponudba kupcu	f			none	none	A4 Portrait	admin	2015-02-25 13:16:47
542cd8c6-b739-41b1-a52c-74da7211c881	96479f85-0715-4533-ac9c-0e570e2b5f72	160	M_PMK		MED	MEDSKLADIŠČNICA	f			none	none	A4 Portrait	admin	2015-03-02 13:44:18
9e26fb67-1f13-454a-b5d1-d7eca0238900	96479f85-0715-4533-ac9c-0e570e2b5f72	260	N_ND	\N	N-D	Naročilo dobavitelju	f			none	none	A4 Portrait	admin	2015-03-11 12:24:51
\.


--
-- TOC entry 3897 (class 0 OID 826363)
-- Dependencies: 257
-- Data for Name: tipdogodka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdogodka (id, name, opis, upor, datknj) FROM stdin;
2756e51b-c105-46a0-a839-ba3638a0b01f	ponudba.brisi	Ponudba izbrisana	console	2015-01-07 18:44:42
8778b06f-aa69-4084-96df-3aac28140fad	ponudba.potrdi	Ponudba potrjena	console	2015-01-07 18:44:42
85b475da-4479-41d8-aca5-88ce20fa5047	ponudba.preklici	Ponudba preklicana	console	2015-01-07 18:44:42
\.


--
-- TOC entry 3898 (class 0 OID 826368)
-- Dependencies: 258
-- Data for Name: tiskalniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tiskalniki (id, tip, razred, naziv, naslov, lokacija, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3899 (class 0 OID 826374)
-- Dependencies: 259
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, username, name, surname, email, password, enabled, apikey, expires, defaultroute, defaultrouteparams, upor, datknj) FROM stdin;
fb27d1e8-54a3-4644-95fd-bdf0a2f1d750	console	console	console	console@locahost	$2y$05$NS4xMjkyMTcwMzExMjAxROQPhdBDtEXAgKsYlc6S5KEksZOXnOoyK	t	\N	\N	\N	\N	anon	2015-01-07 18:44:41
bedcb99b-3716-41b4-bb85-83637ca60c3c	admin	Administrator		rootmail@max.si	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	\N	console	2015-01-07 18:45:09
\.


--
-- TOC entry 3900 (class 0 OID 826384)
-- Dependencies: 260
-- Data for Name: user_hierroles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY user_hierroles (user_id, role_id) FROM stdin;
fb27d1e8-54a3-4644-95fd-bdf0a2f1d750	6d1046f2-4b36-44a1-b2d3-1ed452b3b117
bedcb99b-3716-41b4-bb85-83637ca60c3c	6d1046f2-4b36-44a1-b2d3-1ed452b3b117
bedcb99b-3716-41b4-bb85-83637ca60c3c	e4113413-19db-453d-ba3a-ffe99273b476
bedcb99b-3716-41b4-bb85-83637ca60c3c	1ab2765f-52bc-4996-9771-c15d7abc90cd
\.


--
-- TOC entry 3901 (class 0 OID 826387)
-- Dependencies: 261
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY user_role (user_id, role_id) FROM stdin;
fb27d1e8-54a3-4644-95fd-bdf0a2f1d750	6d1046f2-4b36-44a1-b2d3-1ed452b3b117
bedcb99b-3716-41b4-bb85-83637ca60c3c	6d1046f2-4b36-44a1-b2d3-1ed452b3b117
bedcb99b-3716-41b4-bb85-83637ca60c3c	e4113413-19db-453d-ba3a-ffe99273b476
bedcb99b-3716-41b4-bb85-83637ca60c3c	1ab2765f-52bc-4996-9771-c15d7abc90cd
\.


--
-- TOC entry 3902 (class 0 OID 826390)
-- Dependencies: 262
-- Data for Name: valuta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY valuta (id, sifra, oznaka, upor, datknj) FROM stdin;
bf01064f-d315-457a-96a9-cef957085ee8	978	EUR	console	2015-01-07 18:44:42
db39d8cd-0e4f-431b-98f2-f7b1df7ad82f	036	AUD	console	2015-01-07 18:44:42
502fdd7d-15d9-4213-bb98-6fa9e3ac9d43	124	CAD	console	2015-01-07 18:44:42
bed43408-d4fe-4299-afd2-82829a233e38	191	HRK	console	2015-01-07 18:44:42
2dc2724f-eb9d-467e-bca6-4e4bb7f721ab	203	CZK	console	2015-01-07 18:44:42
42b2ac9e-5871-4916-befe-da6f90642544	208	DKK	console	2015-01-07 18:44:42
7b40b62c-913f-4a30-acbd-eb5f570ab6c1	348	HUF	console	2015-01-07 18:44:42
2cf450c8-97fd-4b97-bbbd-e1679d781585	392	JPY	console	2015-01-07 18:44:42
40bc0876-cdca-4474-b4e0-001ed8780a76	578	NOK	console	2015-01-07 18:44:42
e7e37ae3-64c9-4426-bdf3-64f87e2cf5a2	703	SKK	console	2015-01-07 18:44:42
bcc707ed-466e-4e44-86ca-d0d04614abed	752	SEK	console	2015-01-07 18:44:42
e6629aae-28d9-4281-9c9c-b64a68ae0760	756	CHF	console	2015-01-07 18:44:42
293deade-abc0-47e8-bf4e-944c52eb6e3b	807	MKD	console	2015-01-07 18:44:42
e016f341-9a03-43bb-850e-1f8331d1078c	826	GBP	console	2015-01-07 18:44:42
df0d5ffc-a2bb-4fab-8cb9-155f8794df99	840	USD	console	2015-01-07 18:44:42
aad4c739-83b4-41a7-ada0-a058fadf740d	977	BAM	console	2015-01-07 18:44:42
e71fb246-46c9-4bb8-ae46-4646c42eb53f	985	PLN	console	2015-01-07 18:44:42
909fa226-54f0-4619-846c-64e12d907ff4	643	RUB	console	2015-01-07 18:44:42
62dbe08e-179f-4616-be3f-88590cc4ce3c	941	RSD	console	2015-01-07 18:44:42
1f35b951-6bcc-49dd-bf18-59a89b045da6	975	BGN	console	2015-01-07 18:44:42
\.


--
-- TOC entry 3903 (class 0 OID 826394)
-- Dependencies: 263
-- Data for Name: zbirur; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zbirur (id, nalog_id, razpis_id, operacija_id, tehen_id, delavec_id, klient_id, zapraz, stserije, poz, kajjeoper, zdo, kdo, uredo, urezps, urezast, dobrih, izmet, poprav, kolicina, razkol, delkol, norma, zapplan, stadeu, stapla, statuspla, statusizv, zacetek, konec, staqa, upor, datknj, razpiskos_id, kdodela, pripcas, zps, kps, statusdod, dobaviteljevasifra, datzel, dobdod, embkol, prekol, ostanekdodelave, plakol, recnasid, recpreid) FROM stdin;
c3682249-54bf-428c-a841-4e6c7aaa0fa9	59634fd0-05df-4e56-99dd-ceaca396df6c	27ea0551-acf5-4910-882f-b6cdfe8ccdd1	11b2c5b4-a5e4-4c7b-9ed3-cb2ac110397e	cc5716e0-6041-486b-8093-b09a78be0869	\N	\N	14	1	1	1	2014-11-20 06:20:00	2014-11-20 06:50:00	0.50	0.000	0.00	268.00	0.00	0.00	134.0000	268.0000	268.0000	536.0000	3805	K		900	900	\N	\N	900	JOZEF	2014-09-09 03:53:00	7cee13b6-a76c-4425-a5a2-1655794a0b3a	T	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
90a94a02-0c54-4618-b5e4-1aa225e034ef	59634fd0-05df-4e56-99dd-ceaca396df6c	c0af5069-adf9-4e91-9d8a-6c852cae126a	550d2e69-cdda-4f77-865b-9373beb5ff92	e0d03644-d34b-4a2c-9978-237d93c8cb7b	\N	\N	15	1	1	1	2014-11-20 18:44:00	2014-11-21 06:50:00	9.33	3.750	1.08	268.00	2.00	0.00	134.0000	268.0000	268.0000	28.7245	1	K	D	900	900	2014-11-20 18:27:00	2014-11-21 11:21:00	900	JOZEF	2014-09-09 03:53:00	7cee13b6-a76c-4425-a5a2-1655794a0b3a	T	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
67ac9e8f-d102-432c-b0ac-f06d3a1f520e	59634fd0-05df-4e56-99dd-ceaca396df6c	ce42094a-fb6b-46cf-ab23-31fa6d77eee3	11b2c5b4-a5e4-4c7b-9ed3-cb2ac110397e	cc5716e0-6041-486b-8093-b09a78be0869	\N	\N	17	1	1	1	2014-11-24 11:44:00	2014-11-24 12:30:00	0.75	0.000	0.00	134.00	0.00	0.00	134.0000	134.0000	134.0000	178.6667	3806	K		900	900	\N	\N	900	JOZEF	2014-09-09 03:53:00	93e11aed-08d9-4ea6-91f4-9aec784fa7c4	T	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2bfbe7d3-367f-484d-bd24-d04e6729f2c1	59634fd0-05df-4e56-99dd-ceaca396df6c	1350d2e3-26d3-4f4c-a280-a3d996b2a053	820a5ec9-b962-48b9-9f9f-876a9474cf33	6471aa67-d6e4-4e1e-8ecd-f3019a3029ce	\N	\N	18	1	1	1	2014-11-25 01:00:00	2014-11-25 06:09:00	5.17	3.000	1.75	134.00	0.00	0.00	134.0000	134.0000	134.0000	25.9188	1	K	D	900	900	2014-11-25 01:00:00	2014-11-25 06:17:00	900	JOZEF	2014-09-09 03:53:00	93e11aed-08d9-4ea6-91f4-9aec784fa7c4	T	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6848c3fe-4f0e-499e-9d3b-99bf8a6b0a91	59634fd0-05df-4e56-99dd-ceaca396df6c	f9caeb1c-522e-40c2-a740-dad8a6cacee0	eca306b5-8fbf-44f6-9ded-d79661f9019a	6471aa67-d6e4-4e1e-8ecd-f3019a3029ce	\N	\N	16	1	1	1	2014-11-25 06:15:00	2014-11-25 12:30:00	6.25	0.080	1.67	134.00	0.00	0.00	134.0000	134.0000	134.0000	21.4400	2	K		900	900	2014-11-25 06:17:00	2014-11-25 12:27:00	900	JOZEF	2014-09-09 03:53:00	e1534c60-edb3-4e1b-af14-7ec56438e687	T	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0f2e17be-24e6-4f90-8afa-0f2b928df32d	59634fd0-05df-4e56-99dd-ceaca396df6c	e8711dc5-917e-4909-89fa-ae4dad8c876d	01f03303-7d4d-4459-a077-a060d7dee7e8	1802ab66-fc41-4b48-bbcd-275349b90841	\N	\N	13	1	1	1	2014-11-25 10:15:00	2014-11-25 12:15:00	2.00	0.000	0.00	134.00	0.00	0.00	134.0000	134.0000	134.0000	67.0000	11	K		900	900	\N	\N	900	JOZEF	2014-09-09 03:53:00	bc024ce8-2187-45ec-8182-ab96e57da144	T	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
aa71af30-7617-428c-b63e-8cd982a8eea9	59634fd0-05df-4e56-99dd-ceaca396df6c	9fae225c-d5e3-49ca-acd5-996bcf2ae914	820a5ec9-b962-48b9-9f9f-876a9474cf33	6471aa67-d6e4-4e1e-8ecd-f3019a3029ce	\N	\N	12	1	1	1	2014-11-25 14:09:00	2014-11-25 17:00:00	2.84	1.670	0.24	134.00	0.00	0.00	134.0000	134.0000	134.0000	47.1831	3	K		900	900	2014-11-25 12:27:00	2014-11-26 08:25:00	900	JOZEF	2014-09-09 03:53:00	14114474-8505-4465-8b06-a14ff34626af	T	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0485bf19-cac3-4b18-a14f-30f08622f625	59634fd0-05df-4e56-99dd-ceaca396df6c	44546b72-506d-4605-bc4d-756bdf0ebc4e	eca306b5-8fbf-44f6-9ded-d79661f9019a	6471aa67-d6e4-4e1e-8ecd-f3019a3029ce	\N	\N	11	1	1	1	2014-11-25 17:10:00	2014-11-25 20:25:00	3.25	0.170	0.50	134.00	0.00	0.00	134.0000	134.0000	134.0000	41.2308	4	K		900	900	2014-11-26 08:25:00	2014-11-26 12:23:00	900	JOZEF	2014-09-09 03:53:00	e598cc65-9a64-4183-a81f-739cfc034bef	T	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
62f2ec44-9f99-48a1-b35b-e5062d93d7bf	59634fd0-05df-4e56-99dd-ceaca396df6c	9941b6f3-79a2-40f4-b611-f9509168936c	14219006-80f4-4ee3-9c12-a6aa41543b6b	84d5afa6-ddb1-4e22-a7b2-3911e91df836	\N	\N	10	1	1	1	2014-11-27 13:15:00	2014-11-27 14:00:00	0.75	2.000	0.42	4.00	1.00	0.00	134.0000	134.0000	134.0000	5.3333	1	N	D	900	910	2014-11-27 13:09:00	2014-12-02 07:47:00	900	JOZEF	2014-09-09 03:53:00	6bbdb304-73a5-4335-ae73-2f7d8b9e8de9	T	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3b87133a-6075-4715-a6d7-efa701b879b3	59634fd0-05df-4e56-99dd-ceaca396df6c	9941b6f3-79a2-40f4-b611-f9509168936c	14219006-80f4-4ee3-9c12-a6aa41543b6b	84d5afa6-ddb1-4e22-a7b2-3911e91df836	\N	\N	10	2	1	1	2014-11-28 06:04:00	2014-12-01 12:40:00	14.57	0.080	2.42	129.00	0.00	0.00	134.0000	134.0000	129.0000	8.8538	1	K	D	900	900	2014-11-28 06:03:00	2014-11-28 20:38:00	900	JOZEF	2014-12-01 07:11:00	6bbdb304-73a5-4335-ae73-2f7d8b9e8de9	T	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
bee23a02-5636-446a-b4ad-92c52eec3083	59634fd0-05df-4e56-99dd-ceaca396df6c	5ab83d6d-de2d-4b90-a461-0725e38181c3	11b2c5b4-a5e4-4c7b-9ed3-cb2ac110397e	cc5716e0-6041-486b-8093-b09a78be0869	\N	\N	8	1	1	1	2014-11-26 06:00:00	2014-11-26 06:09:00	0.17	0.000	0.00	132.00	0.00	0.00	134.0000	134.0000	134.0000	776.4706	3804	K		900	900	\N	\N	900	JOZEF	2014-09-09 03:53:00	52a2f669-5e07-4339-b27c-779d2a5b1667	T	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
bc988c76-978c-4590-ac57-3393d0b7e4c2	59634fd0-05df-4e56-99dd-ceaca396df6c	5dbaced4-1b20-40c4-b8f0-ba7b32efb3d2	01f03303-7d4d-4459-a077-a060d7dee7e8	16cd68f0-b7ea-4ff8-a08f-bce170e35e0d	\N	\N	9	1	1	1	2014-11-28 11:15:00	2014-12-04 14:00:00	15.75	0.000	0.00	132.00	1.00	0.00	134.0000	134.0000	134.0000	8.3810	25	K		900	900	\N	\N	900	JOZEF	2014-09-09 03:53:00	52a2f669-5e07-4339-b27c-779d2a5b1667	T	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
faa4a706-3d40-47e0-a830-c4fe96941c57	59634fd0-05df-4e56-99dd-ceaca396df6c	0f04f778-81eb-4501-83f3-fc14140a009e	11b2c5b4-a5e4-4c7b-9ed3-cb2ac110397e	cc5716e0-6041-486b-8093-b09a78be0869	\N	\N	6	1	1	1	2014-11-28 06:00:00	2014-11-28 06:09:00	0.17	0.000	0.00	132.00	0.00	0.00	134.0000	134.0000	134.0000	776.4706	3803	K		100	100	\N	\N	900	JOZEF	2014-09-09 03:53:00	1cc01efe-176d-49ee-a5f0-cf69856cf6fe	T	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
dbde03a1-1224-42f7-8933-30faeb942e26	2ba83bdd-9fba-4ed8-b9de-0101074f89c5	872a58e1-88e7-45ff-bc61-705cfc1fced0	7e8742ca-cf04-4468-b7e8-1988d0e64266	5412de6c-529c-4577-a29c-67c110a21b11	\N	\N	4	1	2	1	2014-09-11 08:30:00	2014-09-11 08:40:00	0.17	0.000	0.00	2018.00	0.00	0.00	2018.0000	2018.0000	2018.0000	190.6471	3414	K		900	900	\N	\N	900	JOZEF	2014-08-21 08:43:00	0475af84-60e8-4843-a68e-8eeeedd5894b	T	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
fdf818e7-f2d5-4488-8154-55713f7efec5	2ba83bdd-9fba-4ed8-b9de-0101074f89c5	f1b0df23-0c9f-4952-a0e5-c56826a10fed	15e6b593-dc80-49e4-8530-a98f11866a09	5412de6c-529c-4577-a29c-67c110a21b11	\N	\N	3	1	1	1	2014-09-10 06:00:00	2014-09-11 08:30:00	21.00	0.000	0.00	2018.00	0.00	0.00	2018.0000	2018.0000	2018.0000	96.0952	3413	K		900	900	\N	\N	900	JOZEF	2014-08-21 08:43:00	0475af84-60e8-4843-a68e-8eeeedd5894b	T	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5cf89f3c-4ecc-4552-8548-f3b0033f2e47	2ba83bdd-9fba-4ed8-b9de-0101074f89c5	3a7926df-ccc2-427f-8676-4e70429b6a39	11b2c5b4-a5e4-4c7b-9ed3-cb2ac110397e	cc5716e0-6041-486b-8093-b09a78be0869	\N	\N	2	1	1	1	2014-09-11 06:00:00	2014-09-11 06:09:00	0.17	0.000	0.00	2018.00	0.00	0.00	2018.0000	2018.0000	2018.0000	11870.5882	3733	K		900	900	\N	\N	900	JOZEF	2014-08-21 08:43:00	0475af84-60e8-4843-a68e-8eeeedd5894b	T	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
aecbaad3-7791-4a72-bb9d-8552fd0b8b3a	2ba83bdd-9fba-4ed8-b9de-0101074f89c5	d81a9476-a3e5-413a-9053-3a0bf5b7e760	80537ea0-e9a1-424f-aa72-0c1152ee1b90	\N	\N	81e90677-7b9a-4fd0-8045-45120d9c554a	7	1	2		2014-08-22 00:00:00	2014-09-05 00:00:00	0.00	0.000	0.00	1084.00	0.00	0.00	2018.0000	2018.0000	2018.0000	1.0000	399	K		900	900	\N	\N	900	JOZEF	2014-08-21 08:43:00	3819a0f6-f0fe-4c9f-8efd-7d3adf7f29ca	P	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
fddd29f8-c6f9-4c82-af35-bfbac278ebaa	2ba83bdd-9fba-4ed8-b9de-0101074f89c5	d81a9476-a3e5-413a-9053-3a0bf5b7e760	80537ea0-e9a1-424f-aa72-0c1152ee1b90	\N	\N	81e90677-7b9a-4fd0-8045-45120d9c554a	7	2	2		2014-08-22 00:00:00	2014-09-08 00:00:00	0.00	0.000	0.00	934.00	0.00	0.00	2018.0000	2018.0000	934.0000	1.0000	417	K		900	900	\N	\N	900	JOZEF	2014-09-08 08:17:00	3819a0f6-f0fe-4c9f-8efd-7d3adf7f29ca	P	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3904 (class 0 OID 826416)
-- Dependencies: 264
-- Data for Name: zbirur_norme; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zbirur_norme (izvedba_id, norma_id) FROM stdin;
\.


--
-- TOC entry 3003 (class 2606 OID 826422)
-- Name: cena_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cena
    ADD CONSTRAINT cena_pkey PRIMARY KEY (id);


--
-- TOC entry 3008 (class 2606 OID 826424)
-- Name: cenovnirazpon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cenovnirazpon
    ADD CONSTRAINT cenovnirazpon_pkey PRIMARY KEY (id);


--
-- TOC entry 3012 (class 2606 OID 826426)
-- Name: checklistvzorec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY checklistvzorec
    ADD CONSTRAINT checklistvzorec_pkey PRIMARY KEY (id);


--
-- TOC entry 3014 (class 2606 OID 826428)
-- Name: checklistvzorecpostavka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY checklistvzorecpostavka
    ADD CONSTRAINT checklistvzorecpostavka_pkey PRIMARY KEY (id);


--
-- TOC entry 3017 (class 2606 OID 826430)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 3020 (class 2606 OID 826432)
-- Name: deko_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY deko
    ADD CONSTRAINT deko_pkey PRIMARY KEY (id);


--
-- TOC entry 3023 (class 2606 OID 826436)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 3026 (class 2606 OID 826438)
-- Name: dokumentmat_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dokumentmat
    ADD CONSTRAINT dokumentmat_pkey PRIMARY KEY (id);


--
-- TOC entry 3039 (class 2606 OID 826440)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 3045 (class 2606 OID 826442)
-- Name: embalaza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY embalaza
    ADD CONSTRAINT embalaza_pkey PRIMARY KEY (id);


--
-- TOC entry 3051 (class 2606 OID 826444)
-- Name: etikete_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY etikete
    ADD CONSTRAINT etikete_pkey PRIMARY KEY (id);


--
-- TOC entry 3055 (class 2606 OID 826446)
-- Name: group_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY group_user
    ADD CONSTRAINT group_user_pkey PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3059 (class 2606 OID 826448)
-- Name: izbirneopcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY izbirneopcije
    ADD CONSTRAINT izbirneopcije_pkey PRIMARY KEY (id);


--
-- TOC entry 3062 (class 2606 OID 826450)
-- Name: izmetpodrobno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY izmetpodrobno
    ADD CONSTRAINT izmetpodrobno_pkey PRIMARY KEY (id);


--
-- TOC entry 3072 (class 2606 OID 826452)
-- Name: job_datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job_datoteka
    ADD CONSTRAINT job_datoteka_pkey PRIMARY KEY (job_id, datoteka_id);


--
-- TOC entry 3068 (class 2606 OID 826454)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 3074 (class 2606 OID 826456)
-- Name: kakovostniprevzem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kakovostniprevzem
    ADD CONSTRAINT kakovostniprevzem_pkey PRIMARY KEY (id);


--
-- TOC entry 3079 (class 2606 OID 826458)
-- Name: kalkkoso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kalkkoso
    ADD CONSTRAINT kalkkoso_pkey PRIMARY KEY (id);


--
-- TOC entry 3083 (class 2606 OID 826460)
-- Name: klas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY klas
    ADD CONSTRAINT klas_pkey PRIMARY KEY (id);


--
-- TOC entry 3087 (class 2606 OID 826462)
-- Name: kontekst_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontekst
    ADD CONSTRAINT kontekst_pkey PRIMARY KEY (id);


--
-- TOC entry 3091 (class 2606 OID 826464)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 3095 (class 2606 OID 826466)
-- Name: koso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY koso
    ADD CONSTRAINT koso_pkey PRIMARY KEY (id);


--
-- TOC entry 3106 (class 2606 OID 826468)
-- Name: kost_norme_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kost_norme
    ADD CONSTRAINT kost_norme_pkey PRIMARY KEY (kosooper_id, norma_id);


--
-- TOC entry 3102 (class 2606 OID 826470)
-- Name: kost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kost
    ADD CONSTRAINT kost_pkey PRIMARY KEY (id);


--
-- TOC entry 3108 (class 2606 OID 826472)
-- Name: lastnostlokacije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lastnostlokacije
    ADD CONSTRAINT lastnostlokacije_pkey PRIMARY KEY (id);


--
-- TOC entry 3119 (class 2606 OID 826474)
-- Name: lokacije_lastnosti_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lokacije_lastnosti
    ADD CONSTRAINT lokacije_lastnosti_pkey PRIMARY KEY (lokacija_id, lastnostlokacije_id);


--
-- TOC entry 3114 (class 2606 OID 826476)
-- Name: lokacije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lokacije
    ADD CONSTRAINT lokacije_pkey PRIMARY KEY (id);


--
-- TOC entry 3127 (class 2606 OID 826478)
-- Name: mapa_datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_datoteka
    ADD CONSTRAINT mapa_datoteka_pkey PRIMARY KEY (mapa_id, datoteka_id);


--
-- TOC entry 3123 (class 2606 OID 826480)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 3131 (class 2606 OID 826482)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 3137 (class 2606 OID 826484)
-- Name: matt_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matt
    ADD CONSTRAINT matt_pkey PRIMARY KEY (id);


--
-- TOC entry 3142 (class 2606 OID 826486)
-- Name: matz_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matz
    ADD CONSTRAINT matz_pkey PRIMARY KEY (id);


--
-- TOC entry 3152 (class 2606 OID 826488)
-- Name: nard_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nard
    ADD CONSTRAINT nard_pkey PRIMARY KEY (id);


--
-- TOC entry 3162 (class 2606 OID 826490)
-- Name: nark_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nark
    ADD CONSTRAINT nark_pkey PRIMARY KEY (id);


--
-- TOC entry 3167 (class 2606 OID 826492)
-- Name: nasl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nasl
    ADD CONSTRAINT nasl_pkey PRIMARY KEY (id);


--
-- TOC entry 3169 (class 2606 OID 826494)
-- Name: nastavitve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nastavitve
    ADD CONSTRAINT nastavitve_pkey PRIMARY KEY (id);


--
-- TOC entry 3173 (class 2606 OID 826496)
-- Name: nastavni_sklopi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nastavni_sklopi
    ADD CONSTRAINT nastavni_sklopi_pkey PRIMARY KEY (nastavni_id, sklop_id);


--
-- TOC entry 3175 (class 2606 OID 826498)
-- Name: norme_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY norme
    ADD CONSTRAINT norme_pkey PRIMARY KEY (id);


--
-- TOC entry 3177 (class 2606 OID 826500)
-- Name: odst_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY odst
    ADD CONSTRAINT odst_pkey PRIMARY KEY (id);


--
-- TOC entry 3182 (class 2606 OID 826502)
-- Name: operacija_tehen_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY operacija_tehen
    ADD CONSTRAINT operacija_tehen_pkey PRIMARY KEY (operacija_id, tehen_id);


--
-- TOC entry 3189 (class 2606 OID 826504)
-- Name: paketiproduktov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY paketiproduktov
    ADD CONSTRAINT paketiproduktov_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 826506)
-- Name: pakiranjeprodukta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pakiranjeprodukta
    ADD CONSTRAINT pakiranjeprodukta_pkey PRIMARY KEY (id);


--
-- TOC entry 3202 (class 2606 OID 826508)
-- Name: permission_allrole_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission_allrole
    ADD CONSTRAINT permission_allrole_pkey PRIMARY KEY (permission_id, role_id);


--
-- TOC entry 3197 (class 2606 OID 826510)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3211 (class 2606 OID 826512)
-- Name: ponk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ponk
    ADD CONSTRAINT ponk_pkey PRIMARY KEY (id);


--
-- TOC entry 3216 (class 2606 OID 826514)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 3222 (class 2606 OID 826516)
-- Name: porekloproduktov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY porekloproduktov
    ADD CONSTRAINT porekloproduktov_pkey PRIMARY KEY (id);


--
-- TOC entry 3224 (class 2606 OID 826518)
-- Name: poslovniplan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplan
    ADD CONSTRAINT poslovniplan_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 826520)
-- Name: poslovniplanartikla_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplanartikla
    ADD CONSTRAINT poslovniplanartikla_pkey PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 826522)
-- Name: poslovniplankadri_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplankadri
    ADD CONSTRAINT poslovniplankadri_pkey PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2606 OID 826524)
-- Name: poslovniplannapoved_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplannapoved
    ADD CONSTRAINT poslovniplannapoved_pkey PRIMARY KEY (id);


--
-- TOC entry 3242 (class 2606 OID 826526)
-- Name: poslovniplannarocilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplannarocilo
    ADD CONSTRAINT poslovniplannarocilo_pkey PRIMARY KEY (id);


--
-- TOC entry 3245 (class 2606 OID 826528)
-- Name: poslovniplanobdobje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplanobdobje
    ADD CONSTRAINT poslovniplanobdobje_pkey PRIMARY KEY (id);


--
-- TOC entry 3251 (class 2606 OID 826530)
-- Name: poslovniplanproizvodnja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplanproizvodnja
    ADD CONSTRAINT poslovniplanproizvodnja_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 826532)
-- Name: poslovniplanuretehen_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplanuretehen
    ADD CONSTRAINT poslovniplanuretehen_pkey PRIMARY KEY (id);


--
-- TOC entry 3257 (class 2606 OID 826534)
-- Name: post_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- TOC entry 3266 (class 2606 OID 826536)
-- Name: postavkakalkkoso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkakalkkoso
    ADD CONSTRAINT postavkakalkkoso_pkey PRIMARY KEY (id);


--
-- TOC entry 3280 (class 2606 OID 826538)
-- Name: postavkamat_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkamat
    ADD CONSTRAINT postavkamat_pkey PRIMARY KEY (id);


--
-- TOC entry 3285 (class 2606 OID 826540)
-- Name: postavkastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkastroska
    ADD CONSTRAINT postavkastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 3289 (class 2606 OID 826542)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 3297 (class 2606 OID 826544)
-- Name: pozin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pozin
    ADD CONSTRAINT pozin_pkey PRIMARY KEY (id);


--
-- TOC entry 3306 (class 2606 OID 826546)
-- Name: pozizd_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pozizd
    ADD CONSTRAINT pozizd_pkey PRIMARY KEY (id);


--
-- TOC entry 3314 (class 2606 OID 826548)
-- Name: poznd_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poznd
    ADD CONSTRAINT poznd_pkey PRIMARY KEY (id);


--
-- TOC entry 3320 (class 2606 OID 826550)
-- Name: poznk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poznk
    ADD CONSTRAINT poznk_pkey PRIMARY KEY (id);


--
-- TOC entry 3325 (class 2606 OID 826552)
-- Name: pozpk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pozpk
    ADD CONSTRAINT pozpk_pkey PRIMARY KEY (id);


--
-- TOC entry 3329 (class 2606 OID 826554)
-- Name: prejsnjelokacije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prejsnjelokacije
    ADD CONSTRAINT prejsnjelokacije_pkey PRIMARY KEY (id);


--
-- TOC entry 3332 (class 2606 OID 826556)
-- Name: prejsnjipaketi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prejsnjipaketi
    ADD CONSTRAINT prejsnjipaketi_pkey PRIMARY KEY (id);


--
-- TOC entry 3336 (class 2606 OID 826558)
-- Name: prikazlokacije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prikazlokacije
    ADD CONSTRAINT prikazlokacije_pkey PRIMARY KEY (id);


--
-- TOC entry 3341 (class 2606 OID 826560)
-- Name: priponka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY priponka
    ADD CONSTRAINT priponka_pkey PRIMARY KEY (id);


--
-- TOC entry 3347 (class 2606 OID 826568)
-- Name: promo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY promo
    ADD CONSTRAINT promo_pkey PRIMARY KEY (id);


--
-- TOC entry 3352 (class 2606 OID 826570)
-- Name: razk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razk
    ADD CONSTRAINT razk_pkey PRIMARY KEY (id);


--
-- TOC entry 3359 (class 2606 OID 826572)
-- Name: razpiskost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpiskost
    ADD CONSTRAINT razpiskost_pkey PRIMARY KEY (id);


--
-- TOC entry 3361 (class 2606 OID 826574)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 3369 (class 2606 OID 826576)
-- Name: role_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role_permission
    ADD CONSTRAINT role_permission_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 3363 (class 2606 OID 826578)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 3373 (class 2606 OID 826580)
-- Name: role_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role_role
    ADD CONSTRAINT role_role_pkey PRIMARY KEY (role_source, role_target);


--
-- TOC entry 3377 (class 2606 OID 826582)
-- Name: serijskestevilke_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY serijskestevilke
    ADD CONSTRAINT serijskestevilke_pkey PRIMARY KEY (id);


--
-- TOC entry 3380 (class 2606 OID 826584)
-- Name: sifdog_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sifdog
    ADD CONSTRAINT sifdog_pkey PRIMARY KEY (id);


--
-- TOC entry 3385 (class 2606 OID 826586)
-- Name: skl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skl
    ADD CONSTRAINT skl_pkey PRIMARY KEY (id);


--
-- TOC entry 3456 (class 2606 OID 1330444)
-- Name: skladiscenjeizdaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skladiscenjeizdaja
    ADD CONSTRAINT skladiscenjeizdaja_pkey PRIMARY KEY (id);


--
-- TOC entry 3462 (class 2606 OID 1330453)
-- Name: skladiscenjepremik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skladiscenjepremik
    ADD CONSTRAINT skladiscenjepremik_pkey PRIMARY KEY (id);


--
-- TOC entry 3468 (class 2606 OID 1330465)
-- Name: skladiscenjezaloga_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skladiscenjezaloga
    ADD CONSTRAINT skladiscenjezaloga_pkey PRIMARY KEY (id);


--
-- TOC entry 3392 (class 2606 OID 826588)
-- Name: sklo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sklo
    ADD CONSTRAINT sklo_pkey PRIMARY KEY (id);


--
-- TOC entry 3394 (class 2606 OID 826590)
-- Name: skupine_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skupine
    ADD CONSTRAINT skupine_pkey PRIMARY KEY (id);


--
-- TOC entry 3400 (class 2606 OID 826594)
-- Name: statustehen_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY statustehen
    ADD CONSTRAINT statustehen_pkey PRIMARY KEY (id);


--
-- TOC entry 3402 (class 2606 OID 826596)
-- Name: stevilcenjedokumenta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjedokumenta
    ADD CONSTRAINT stevilcenjedokumenta_pkey PRIMARY KEY (id);


--
-- TOC entry 3408 (class 2606 OID 826598)
-- Name: stevilcenjeposkl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjeposkl
    ADD CONSTRAINT stevilcenjeposkl_pkey PRIMARY KEY (id);


--
-- TOC entry 3410 (class 2606 OID 826600)
-- Name: stevilcenjetrenutne_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjetrenutne
    ADD CONSTRAINT stevilcenjetrenutne_pkey PRIMARY KEY (id);


--
-- TOC entry 3413 (class 2606 OID 826602)
-- Name: tdok_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tdok
    ADD CONSTRAINT tdok_pkey PRIMARY KEY (id);


--
-- TOC entry 3416 (class 2606 OID 826604)
-- Name: tipdogodka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdogodka
    ADD CONSTRAINT tipdogodka_pkey PRIMARY KEY (id);


--
-- TOC entry 3419 (class 2606 OID 826606)
-- Name: tiskalniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tiskalniki
    ADD CONSTRAINT tiskalniki_pkey PRIMARY KEY (id);


--
-- TOC entry 3427 (class 2606 OID 826608)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 3431 (class 2606 OID 826610)
-- Name: user_hierroles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_hierroles
    ADD CONSTRAINT user_hierroles_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 3435 (class 2606 OID 826612)
-- Name: user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 3439 (class 2606 OID 826614)
-- Name: valuta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY valuta
    ADD CONSTRAINT valuta_pkey PRIMARY KEY (id);


--
-- TOC entry 3452 (class 2606 OID 826616)
-- Name: zbirur_norme_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zbirur_norme
    ADD CONSTRAINT zbirur_norme_pkey PRIMARY KEY (izvedba_id, norma_id);


--
-- TOC entry 3448 (class 2606 OID 826618)
-- Name: zbirur_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zbirur
    ADD CONSTRAINT zbirur_pkey PRIMARY KEY (id);


--
-- TOC entry 3397 (class 1259 OID 826619)
-- Name: idx_10b2825a1bfe97c4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_10b2825a1bfe97c4 ON statustehen USING btree (trenutnaoperacija_id);


--
-- TOC entry 3398 (class 1259 OID 826620)
-- Name: idx_10b2825a633aca59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_10b2825a633aca59 ON statustehen USING btree (tehen_id);


--
-- TOC entry 3024 (class 1259 OID 826621)
-- Name: idx_11e93b5d476c47f6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d476c47f6 ON dogodek USING btree (tip_id);


--
-- TOC entry 3120 (class 1259 OID 826622)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 3121 (class 1259 OID 826623)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 3404 (class 1259 OID 826624)
-- Name: idx_154bfb4c3a66cc09; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_154bfb4c3a66cc09 ON stevilcenjeposkl USING btree (skl_id);


--
-- TOC entry 3405 (class 1259 OID 826625)
-- Name: idx_154bfb4c4ce26053; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_154bfb4c4ce26053 ON stevilcenjeposkl USING btree (dok_id);


--
-- TOC entry 3406 (class 1259 OID 826626)
-- Name: idx_154bfb4cff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_154bfb4cff55f926 ON stevilcenjeposkl USING btree (stevilcenje_id);


--
-- TOC entry 3290 (class 1259 OID 826627)
-- Name: idx_1be681b04ce26053; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1be681b04ce26053 ON pozin USING btree (dok_id);


--
-- TOC entry 3291 (class 1259 OID 826628)
-- Name: idx_1be681b0847dc91; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1be681b0847dc91 ON pozin USING btree (maticna_id);


--
-- TOC entry 3292 (class 1259 OID 826629)
-- Name: idx_1be681b0a0320d72; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1be681b0a0320d72 ON pozin USING btree (pakiranje_id);


--
-- TOC entry 3293 (class 1259 OID 826630)
-- Name: idx_1be681b0a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1be681b0a233cb39 ON pozin USING btree (klient_id);


--
-- TOC entry 3294 (class 1259 OID 826631)
-- Name: idx_1be681b0bbcda81c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1be681b0bbcda81c ON pozin USING btree (delavec_id);


--
-- TOC entry 3295 (class 1259 OID 826632)
-- Name: idx_1be681b0ea18fce7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1be681b0ea18fce7 ON pozin USING btree (kalkkoso_id);


--
-- TOC entry 3212 (class 1259 OID 826633)
-- Name: idx_1c7adba520a40e3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba520a40e3b ON popa USING btree (klasifikacija_id);


--
-- TOC entry 3213 (class 1259 OID 826634)
-- Name: idx_1c7adba5d4bd8662; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5d4bd8662 ON popa USING btree (potnik_id);


--
-- TOC entry 3214 (class 1259 OID 826635)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 3267 (class 1259 OID 1196499)
-- Name: idx_1cefdda8108b7592; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1cefdda8108b7592 ON postavkamat USING btree (original_id);


--
-- TOC entry 3268 (class 1259 OID 826636)
-- Name: idx_1cefdda81cbe66d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1cefdda81cbe66d4 ON postavkamat USING btree (vezand_id);


--
-- TOC entry 3269 (class 1259 OID 826637)
-- Name: idx_1cefdda82b1b3d4e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1cefdda82b1b3d4e ON postavkamat USING btree (polizdelek_id);


--
-- TOC entry 3270 (class 1259 OID 826638)
-- Name: idx_1cefdda844dd7682; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1cefdda844dd7682 ON postavkamat USING btree (vezank_id);


--
-- TOC entry 3271 (class 1259 OID 826639)
-- Name: idx_1cefdda857643b98; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1cefdda857643b98 ON postavkamat USING btree (skladisce_id);


--
-- TOC entry 3272 (class 1259 OID 826640)
-- Name: idx_1cefdda87121331c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1cefdda87121331c ON postavkamat USING btree (vezanalog_id);


--
-- TOC entry 3273 (class 1259 OID 826641)
-- Name: idx_1cefdda878e7da2f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1cefdda878e7da2f ON postavkamat USING btree (dokument_id);


--
-- TOC entry 3274 (class 1259 OID 826642)
-- Name: idx_1cefdda8847dc91; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1cefdda8847dc91 ON postavkamat USING btree (maticna_id);


--
-- TOC entry 3275 (class 1259 OID 826643)
-- Name: idx_1cefdda8a8094cf7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1cefdda8a8094cf7 ON postavkamat USING btree (vezaizd_id);


--
-- TOC entry 3276 (class 1259 OID 826644)
-- Name: idx_1cefdda8a949937f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1cefdda8a949937f ON postavkamat USING btree (sklv_id);


--
-- TOC entry 3277 (class 1259 OID 826645)
-- Name: idx_1cefdda8bbcda81c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1cefdda8bbcda81c ON postavkamat USING btree (delavec_id);


--
-- TOC entry 3278 (class 1259 OID 1738056)
-- Name: idx_1cefdda8f04bd6e7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1cefdda8f04bd6e7 ON postavkamat USING btree (vezarazpis_id);


--
-- TOC entry 3225 (class 1259 OID 826646)
-- Name: idx_1dc724a6755d8926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1dc724a6755d8926 ON poslovniplanartikla USING btree (kalkulacija_id);


--
-- TOC entry 3226 (class 1259 OID 826647)
-- Name: idx_1dc724a6e899029b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1dc724a6e899029b ON poslovniplanartikla USING btree (plan_id);


--
-- TOC entry 3227 (class 1259 OID 826648)
-- Name: idx_1dc724a6eedf290a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1dc724a6eedf290a ON poslovniplanartikla USING btree (artikel_id);


--
-- TOC entry 3428 (class 1259 OID 826649)
-- Name: idx_218e1734a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_218e1734a76ed395 ON user_hierroles USING btree (user_id);


--
-- TOC entry 3429 (class 1259 OID 826650)
-- Name: idx_218e1734d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_218e1734d60322ac ON user_hierroles USING btree (role_id);


--
-- TOC entry 3315 (class 1259 OID 826652)
-- Name: idx_24cde3f86533c48; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_24cde3f86533c48 ON poznk USING btree (postavkaponudbe_id);


--
-- TOC entry 3316 (class 1259 OID 826653)
-- Name: idx_24cde3f878e7da2f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_24cde3f878e7da2f ON poznk USING btree (dokument_id);


--
-- TOC entry 3317 (class 1259 OID 826654)
-- Name: idx_24cde3f8847dc91; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_24cde3f8847dc91 ON poznk USING btree (maticna_id);


--
-- TOC entry 3318 (class 1259 OID 826656)
-- Name: idx_24cde3f8d627d694; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_24cde3f8d627d694 ON poznk USING btree (nalog_id);


--
-- TOC entry 3004 (class 1259 OID 826657)
-- Name: idx_273236e378c07e7c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_273236e378c07e7c ON cena USING btree (valuta_id);


--
-- TOC entry 3005 (class 1259 OID 826658)
-- Name: idx_273236e3847dc91; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_273236e3847dc91 ON cena USING btree (maticna_id);


--
-- TOC entry 3006 (class 1259 OID 826659)
-- Name: idx_273236e3a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_273236e3a233cb39 ON cena USING btree (klient_id);


--
-- TOC entry 3203 (class 1259 OID 826660)
-- Name: idx_28ee0d644ce26053; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_28ee0d644ce26053 ON ponk USING btree (dok_id);


--
-- TOC entry 3204 (class 1259 OID 826661)
-- Name: idx_28ee0d6478c07e7c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_28ee0d6478c07e7c ON ponk USING btree (valuta_id);


--
-- TOC entry 3205 (class 1259 OID 826662)
-- Name: idx_28ee0d64a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_28ee0d64a233cb39 ON ponk USING btree (klient_id);


--
-- TOC entry 3206 (class 1259 OID 826663)
-- Name: idx_28ee0d64a6c3fc6b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_28ee0d64a6c3fc6b ON ponk USING btree (prejemnik_id);


--
-- TOC entry 3207 (class 1259 OID 826664)
-- Name: idx_28ee0d64aebac2d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_28ee0d64aebac2d4 ON ponk USING btree (naslovklienta_id);


--
-- TOC entry 3208 (class 1259 OID 826665)
-- Name: idx_28ee0d64ba837808; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_28ee0d64ba837808 ON ponk USING btree (kontaktna_id);


--
-- TOC entry 3209 (class 1259 OID 826666)
-- Name: idx_28ee0d64fb9bda2b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_28ee0d64fb9bda2b ON ponk USING btree (naslovprejemnika_id);


--
-- TOC entry 3463 (class 1259 OID 1330469)
-- Name: idx_2c7099e917e87821; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2c7099e917e87821 ON skladiscenjezaloga USING btree (vhodnidokument_id);


--
-- TOC entry 3464 (class 1259 OID 1330467)
-- Name: idx_2c7099e91bf941c7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2c7099e91bf941c7 ON skladiscenjezaloga USING btree (zaloga_id);


--
-- TOC entry 3465 (class 1259 OID 1330468)
-- Name: idx_2c7099e96b1941d2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2c7099e96b1941d2 ON skladiscenjezaloga USING btree (izvornidokument_id);


--
-- TOC entry 3466 (class 1259 OID 1330466)
-- Name: idx_2c7099e98f6fbef0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2c7099e98f6fbef0 ON skladiscenjezaloga USING btree (lokacija_id);


--
-- TOC entry 3432 (class 1259 OID 826667)
-- Name: idx_2de8c6a3a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2de8c6a3a76ed395 ON user_role USING btree (user_id);


--
-- TOC entry 3433 (class 1259 OID 826668)
-- Name: idx_2de8c6a3d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2de8c6a3d60322ac ON user_role USING btree (role_id);


--
-- TOC entry 3027 (class 1259 OID 1196493)
-- Name: idx_34b7b88a108b7592; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_34b7b88a108b7592 ON dokumentmat USING btree (original_id);


--
-- TOC entry 3028 (class 1259 OID 826669)
-- Name: idx_34b7b88a13c41f80; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_34b7b88a13c41f80 ON dokumentmat USING btree (nalog);


--
-- TOC entry 3029 (class 1259 OID 826670)
-- Name: idx_34b7b88a4ce26053; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_34b7b88a4ce26053 ON dokumentmat USING btree (dok_id);


--
-- TOC entry 3030 (class 1259 OID 826671)
-- Name: idx_34b7b88a57643b98; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_34b7b88a57643b98 ON dokumentmat USING btree (skladisce_id);


--
-- TOC entry 3031 (class 1259 OID 826672)
-- Name: idx_34b7b88a78c07e7c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_34b7b88a78c07e7c ON dokumentmat USING btree (valuta_id);


--
-- TOC entry 3032 (class 1259 OID 826673)
-- Name: idx_34b7b88aa233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_34b7b88aa233cb39 ON dokumentmat USING btree (klient_id);


--
-- TOC entry 3033 (class 1259 OID 826674)
-- Name: idx_34b7b88aa6c3fc6b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_34b7b88aa6c3fc6b ON dokumentmat USING btree (prejemnik_id);


--
-- TOC entry 3034 (class 1259 OID 826675)
-- Name: idx_34b7b88aa949937f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_34b7b88aa949937f ON dokumentmat USING btree (sklv_id);


--
-- TOC entry 3035 (class 1259 OID 826676)
-- Name: idx_34b7b88aaebac2d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_34b7b88aaebac2d4 ON dokumentmat USING btree (naslovklienta_id);


--
-- TOC entry 3036 (class 1259 OID 826677)
-- Name: idx_34b7b88aee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_34b7b88aee4b985a ON dokumentmat USING btree (drzava_id);


--
-- TOC entry 3037 (class 1259 OID 826678)
-- Name: idx_34b7b88afb9bda2b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_34b7b88afb9bda2b ON dokumentmat USING btree (naslovprejemnika_id);


--
-- TOC entry 3374 (class 1259 OID 826679)
-- Name: idx_35b5c6ef847dc91; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_35b5c6ef847dc91 ON serijskestevilke USING btree (maticna_id);


--
-- TOC entry 3375 (class 1259 OID 826680)
-- Name: idx_35b5c6efaa0f25e5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_35b5c6efaa0f25e5 ON serijskestevilke USING btree (paket_id);


--
-- TOC entry 3009 (class 1259 OID 826681)
-- Name: idx_3872a742755d8926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_3872a742755d8926 ON cenovnirazpon USING btree (kalkulacija_id);


--
-- TOC entry 3010 (class 1259 OID 826682)
-- Name: idx_3872a74287250bbb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_3872a74287250bbb ON cenovnirazpon USING btree (ponudba_id);


--
-- TOC entry 3080 (class 1259 OID 826683)
-- Name: idx_3944e73a3a66cc09; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_3944e73a3a66cc09 ON klas USING btree (skl_id);


--
-- TOC entry 3081 (class 1259 OID 826684)
-- Name: idx_3944e73a727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_3944e73a727aca70 ON klas USING btree (parent_id);


--
-- TOC entry 3326 (class 1259 OID 826685)
-- Name: idx_3e5fff2a8f6fbef0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_3e5fff2a8f6fbef0 ON prejsnjelokacije USING btree (lokacija_id);


--
-- TOC entry 3327 (class 1259 OID 826686)
-- Name: idx_3e5fff2aaa0f25e5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_3e5fff2aaa0f25e5 ON prejsnjelokacije USING btree (paket_id);


--
-- TOC entry 3085 (class 1259 OID 826687)
-- Name: idx_4987a91b14343c09; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4987a91b14343c09 ON kontekst USING btree (uporabnik_id);


--
-- TOC entry 3243 (class 1259 OID 826688)
-- Name: idx_5543cd2ee899029b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5543cd2ee899029b ON poslovniplanobdobje USING btree (plan_id);


--
-- TOC entry 3092 (class 1259 OID 826689)
-- Name: idx_57f775ff727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_57f775ff727aca70 ON koso USING btree (parent_id);


--
-- TOC entry 3093 (class 1259 OID 826690)
-- Name: idx_57f775ff847dc91; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_57f775ff847dc91 ON koso USING btree (maticna_id);


--
-- TOC entry 3440 (class 1259 OID 826691)
-- Name: idx_591323d138fdb10; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_591323d138fdb10 ON zbirur USING btree (razpis_id);


--
-- TOC entry 3441 (class 1259 OID 826692)
-- Name: idx_591323d633aca59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_591323d633aca59 ON zbirur USING btree (tehen_id);


--
-- TOC entry 3442 (class 1259 OID 826693)
-- Name: idx_591323d765608e5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_591323d765608e5 ON zbirur USING btree (operacija_id);


--
-- TOC entry 3443 (class 1259 OID 826694)
-- Name: idx_591323da233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_591323da233cb39 ON zbirur USING btree (klient_id);


--
-- TOC entry 3444 (class 1259 OID 826695)
-- Name: idx_591323dbbcda81c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_591323dbbcda81c ON zbirur USING btree (delavec_id);


--
-- TOC entry 3445 (class 1259 OID 826696)
-- Name: idx_591323dbf653e3d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_591323dbf653e3d ON zbirur USING btree (razpiskos_id);


--
-- TOC entry 3446 (class 1259 OID 826697)
-- Name: idx_591323dd627d694; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_591323dd627d694 ON zbirur USING btree (nalog_id);


--
-- TOC entry 3139 (class 1259 OID 826698)
-- Name: idx_5a9e75051ef69380; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5a9e75051ef69380 ON matz USING btree (sifra_id);


--
-- TOC entry 3140 (class 1259 OID 826699)
-- Name: idx_5a9e75053a66cc09; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5a9e75053a66cc09 ON matz USING btree (skl_id);


--
-- TOC entry 3246 (class 1259 OID 826700)
-- Name: idx_5f2ec1755392eeb8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5f2ec1755392eeb8 ON poslovniplanproizvodnja USING btree (ppartikla_id);


--
-- TOC entry 3247 (class 1259 OID 826701)
-- Name: idx_5f2ec175755d8926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5f2ec175755d8926 ON poslovniplanproizvodnja USING btree (kalkulacija_id);


--
-- TOC entry 3248 (class 1259 OID 826702)
-- Name: idx_5f2ec1759bead64a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5f2ec1759bead64a ON poslovniplanproizvodnja USING btree (obdobje_id);


--
-- TOC entry 3249 (class 1259 OID 826703)
-- Name: idx_5f2ec175d627d694; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5f2ec175d627d694 ON poslovniplanproizvodnja USING btree (nalog_id);


--
-- TOC entry 3231 (class 1259 OID 826704)
-- Name: idx_68d775109bead64a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_68d775109bead64a ON poslovniplankadri USING btree (obdobje_id);


--
-- TOC entry 3337 (class 1259 OID 826705)
-- Name: idx_6ab12d57ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6ab12d57ed422f ON priponka USING btree (mapa_id);


--
-- TOC entry 3338 (class 1259 OID 826706)
-- Name: idx_6ab12d786beab6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6ab12d786beab6 ON priponka USING btree (tdok_id);


--
-- TOC entry 3339 (class 1259 OID 826707)
-- Name: idx_6ab12da54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6ab12da54dbb1f ON priponka USING btree (datoteka_id);


--
-- TOC entry 3382 (class 1259 OID 826708)
-- Name: idx_6bfb900429fc2be5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6bfb900429fc2be5 ON skl USING btree (lokacijavhoda_id);


--
-- TOC entry 3383 (class 1259 OID 826709)
-- Name: idx_6bfb90048f6fbef0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6bfb90048f6fbef0 ON skl USING btree (lokacija_id);


--
-- TOC entry 3110 (class 1259 OID 826710)
-- Name: idx_6cd02b1b59c52fa9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6cd02b1b59c52fa9 ON lokacije USING btree (privzetiprikaz_id);


--
-- TOC entry 3111 (class 1259 OID 826711)
-- Name: idx_6cd02b1b727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6cd02b1b727aca70 ON lokacije USING btree (parent_id);


--
-- TOC entry 3112 (class 1259 OID 826712)
-- Name: idx_6cd02b1b79066886; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6cd02b1b79066886 ON lokacije USING btree (root_id);


--
-- TOC entry 3366 (class 1259 OID 826716)
-- Name: idx_6f7df886d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6f7df886d60322ac ON role_permission USING btree (role_id);


--
-- TOC entry 3367 (class 1259 OID 826717)
-- Name: idx_6f7df886fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6f7df886fed90cca ON role_permission USING btree (permission_id);


--
-- TOC entry 3258 (class 1259 OID 826718)
-- Name: idx_70b423e2b1b3d4e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_70b423e2b1b3d4e ON postavkakalkkoso USING btree (polizdelek_id);


--
-- TOC entry 3259 (class 1259 OID 826719)
-- Name: idx_70b423e31330c45; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_70b423e31330c45 ON postavkakalkkoso USING btree (cenik_id);


--
-- TOC entry 3260 (class 1259 OID 826720)
-- Name: idx_70b423e633aca59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_70b423e633aca59 ON postavkakalkkoso USING btree (tehen_id);


--
-- TOC entry 3261 (class 1259 OID 826721)
-- Name: idx_70b423e765608e5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_70b423e765608e5 ON postavkakalkkoso USING btree (operacija_id);


--
-- TOC entry 3262 (class 1259 OID 826722)
-- Name: idx_70b423e78e7da2f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_70b423e78e7da2f ON postavkakalkkoso USING btree (dokument_id);


--
-- TOC entry 3263 (class 1259 OID 826723)
-- Name: idx_70b423ea233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_70b423ea233cb39 ON postavkakalkkoso USING btree (klient_id);


--
-- TOC entry 3264 (class 1259 OID 826724)
-- Name: idx_70b423ee308ac6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_70b423ee308ac6f ON postavkakalkkoso USING btree (material_id);


--
-- TOC entry 3103 (class 1259 OID 826725)
-- Name: idx_71ce139787430faf; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_71ce139787430faf ON kost_norme USING btree (kosooper_id);


--
-- TOC entry 3104 (class 1259 OID 826726)
-- Name: idx_71ce1397e06fc29e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_71ce1397e06fc29e ON kost_norme USING btree (norma_id);


--
-- TOC entry 3153 (class 1259 OID 826727)
-- Name: idx_74c15d9f4ce26053; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_74c15d9f4ce26053 ON nark USING btree (dok_id);


--
-- TOC entry 3154 (class 1259 OID 826728)
-- Name: idx_74c15d9f78c07e7c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_74c15d9f78c07e7c ON nark USING btree (valuta_id);


--
-- TOC entry 3155 (class 1259 OID 826730)
-- Name: idx_74c15d9fa233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_74c15d9fa233cb39 ON nark USING btree (klient_id);


--
-- TOC entry 3156 (class 1259 OID 826731)
-- Name: idx_74c15d9fa6c3fc6b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_74c15d9fa6c3fc6b ON nark USING btree (prejemnik_id);


--
-- TOC entry 3157 (class 1259 OID 826732)
-- Name: idx_74c15d9faebac2d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_74c15d9faebac2d4 ON nark USING btree (naslovklienta_id);


--
-- TOC entry 3158 (class 1259 OID 1979203)
-- Name: idx_74c15d9fba837808; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_74c15d9fba837808 ON nark USING btree (kontaktna_id);


--
-- TOC entry 3159 (class 1259 OID 826734)
-- Name: idx_74c15d9fee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_74c15d9fee4b985a ON nark USING btree (drzava_id);


--
-- TOC entry 3160 (class 1259 OID 826735)
-- Name: idx_74c15d9ffb9bda2b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_74c15d9ffb9bda2b ON nark USING btree (naslovprejemnika_id);


--
-- TOC entry 3018 (class 1259 OID 826736)
-- Name: idx_781826c68a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c68a4a6c12 ON datoteka USING btree (lastnik_id);


--
-- TOC entry 3299 (class 1259 OID 826737)
-- Name: idx_7aa5cda24e1a69e7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7aa5cda24e1a69e7 ON pozizd USING btree (naslovdostave_id);


--
-- TOC entry 3300 (class 1259 OID 826738)
-- Name: idx_7aa5cda257643b98; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7aa5cda257643b98 ON pozizd USING btree (skladisce_id);


--
-- TOC entry 3301 (class 1259 OID 826739)
-- Name: idx_7aa5cda2847dc91; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7aa5cda2847dc91 ON pozizd USING btree (maticna_id);


--
-- TOC entry 3302 (class 1259 OID 826740)
-- Name: idx_7aa5cda2a0320d72; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7aa5cda2a0320d72 ON pozizd USING btree (pakiranje_id);


--
-- TOC entry 3303 (class 1259 OID 826741)
-- Name: idx_7aa5cda2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7aa5cda2a233cb39 ON pozizd USING btree (klient_id);


--
-- TOC entry 3304 (class 1259 OID 826742)
-- Name: idx_7aa5cda2a6c3fc6b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7aa5cda2a6c3fc6b ON pozizd USING btree (prejemnik_id);


--
-- TOC entry 3128 (class 1259 OID 826743)
-- Name: idx_7adc95713b791db1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc95713b791db1 ON mapaacl USING btree (skupina_id);


--
-- TOC entry 3129 (class 1259 OID 826744)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 3076 (class 1259 OID 1805873)
-- Name: idx_7b41ca234ce26053; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7b41ca234ce26053 ON kalkkoso USING btree (dok_id);


--
-- TOC entry 3077 (class 1259 OID 826745)
-- Name: idx_7b41ca239d319e0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7b41ca239d319e0b ON kalkkoso USING btree (koncni_id);


--
-- TOC entry 3124 (class 1259 OID 826746)
-- Name: idx_7cfcf42657ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7cfcf42657ed422f ON mapa_datoteka USING btree (mapa_id);


--
-- TOC entry 3125 (class 1259 OID 826747)
-- Name: idx_7cfcf426a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7cfcf426a54dbb1f ON mapa_datoteka USING btree (datoteka_id);


--
-- TOC entry 3021 (class 1259 OID 828080)
-- Name: idx_80187826633aca59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80187826633aca59 ON deko USING btree (tehen_id);


--
-- TOC entry 3387 (class 1259 OID 826748)
-- Name: idx_809accd43db71da; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_809accd43db71da ON sklo USING btree (maticnapomozno1_id);


--
-- TOC entry 3388 (class 1259 OID 826749)
-- Name: idx_809accd516ede34; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_809accd516ede34 ON sklo USING btree (maticnapomozno2_id);


--
-- TOC entry 3389 (class 1259 OID 826750)
-- Name: idx_809accd5827c206; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_809accd5827c206 ON sklo USING btree (sklop_id);


--
-- TOC entry 3390 (class 1259 OID 826751)
-- Name: idx_809accd7924c564; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_809accd7924c564 ON sklo USING btree (maticnaorodje_id);


--
-- TOC entry 3281 (class 1259 OID 1572033)
-- Name: idx_83d9a81c78e7da2f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_83d9a81c78e7da2f ON postavkastroska USING btree (dokument_id);


--
-- TOC entry 3282 (class 1259 OID 826753)
-- Name: idx_83d9a81c965125da; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_83d9a81c965125da ON postavkastroska USING btree (storitev_id);


--
-- TOC entry 3283 (class 1259 OID 826754)
-- Name: idx_83d9a81ca233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_83d9a81ca233cb39 ON postavkastroska USING btree (klient_id);


--
-- TOC entry 3286 (class 1259 OID 826757)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 3287 (class 1259 OID 826758)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 3330 (class 1259 OID 826759)
-- Name: idx_8d923514aa0f25e5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8d923514aa0f25e5 ON prejsnjipaketi USING btree (paket_id);


--
-- TOC entry 3238 (class 1259 OID 826760)
-- Name: idx_907944b65392eeb8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_907944b65392eeb8 ON poslovniplannarocilo USING btree (ppartikla_id);


--
-- TOC entry 3239 (class 1259 OID 826761)
-- Name: idx_907944b6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_907944b6a233cb39 ON poslovniplannarocilo USING btree (klient_id);


--
-- TOC entry 3240 (class 1259 OID 826762)
-- Name: idx_907944b6b3bc5309; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_907944b6b3bc5309 ON poslovniplannarocilo USING btree (narocilo_id);


--
-- TOC entry 3353 (class 1259 OID 826763)
-- Name: idx_9e6fe2b2819adf6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_9e6fe2b2819adf6 ON razpiskost USING btree (kos_id);


--
-- TOC entry 3354 (class 1259 OID 826764)
-- Name: idx_9e6fe2b633aca59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_9e6fe2b633aca59 ON razpiskost USING btree (tehen_id);


--
-- TOC entry 3355 (class 1259 OID 826765)
-- Name: idx_9e6fe2b765608e5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_9e6fe2b765608e5 ON razpiskost USING btree (operacija_id);


--
-- TOC entry 3356 (class 1259 OID 826766)
-- Name: idx_9e6fe2ba233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_9e6fe2ba233cb39 ON razpiskost USING btree (klient_id);


--
-- TOC entry 3357 (class 1259 OID 826767)
-- Name: idx_9e6fe2bbbcda81c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_9e6fe2bbbcda81c ON razpiskost USING btree (delavec_id);


--
-- TOC entry 3056 (class 1259 OID 826768)
-- Name: idx_a4c98d39a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4c98d39a76ed395 ON group_user USING btree (user_id);


--
-- TOC entry 3057 (class 1259 OID 826769)
-- Name: idx_a4c98d39fe54d947; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4c98d39fe54d947 ON group_user USING btree (group_id);


--
-- TOC entry 3348 (class 1259 OID 826772)
-- Name: idx_a6d73fb0727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a6d73fb0727aca70 ON razk USING btree (parent_id);


--
-- TOC entry 3349 (class 1259 OID 826773)
-- Name: idx_a6d73fb0847dc91; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a6d73fb0847dc91 ON razk USING btree (maticna_id);


--
-- TOC entry 3350 (class 1259 OID 826774)
-- Name: idx_a6d73fb0d627d694; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a6d73fb0d627d694 ON razk USING btree (nalog_id);


--
-- TOC entry 3457 (class 1259 OID 1330454)
-- Name: idx_aa7108a97cb191e9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aa7108a97cb191e9 ON skladiscenjepremik USING btree (izvor_id);


--
-- TOC entry 3458 (class 1259 OID 1330455)
-- Name: idx_aa7108a99990469d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aa7108a99990469d ON skladiscenjepremik USING btree (cilj_id);


--
-- TOC entry 3459 (class 1259 OID 1330456)
-- Name: idx_aa7108a9cf82befb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aa7108a9cf82befb ON skladiscenjepremik USING btree (iz_id);


--
-- TOC entry 3460 (class 1259 OID 1330457)
-- Name: idx_aa7108a9fabab275; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aa7108a9fabab275 ON skladiscenjepremik USING btree (na_id);


--
-- TOC entry 3252 (class 1259 OID 826776)
-- Name: idx_add0ea18633aca59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_add0ea18633aca59 ON poslovniplanuretehen USING btree (tehen_id);


--
-- TOC entry 3253 (class 1259 OID 826777)
-- Name: idx_add0ea189bead64a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_add0ea189bead64a ON poslovniplanuretehen USING btree (obdobje_id);


--
-- TOC entry 3218 (class 1259 OID 826778)
-- Name: idx_ae395265aa0f25e5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ae395265aa0f25e5 ON porekloproduktov USING btree (paket_id);


--
-- TOC entry 3219 (class 1259 OID 826779)
-- Name: idx_ae395265be377a7a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ae395265be377a7a ON porekloproduktov USING btree (predajnica_id);


--
-- TOC entry 3220 (class 1259 OID 826780)
-- Name: idx_ae395265d627d694; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ae395265d627d694 ON porekloproduktov USING btree (nalog_id);


--
-- TOC entry 3342 (class 1259 OID 826781)
-- Name: idx_b0139afb40f9378; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b0139afb40f9378 ON promo USING btree (zastoj_id);


--
-- TOC entry 3343 (class 1259 OID 826782)
-- Name: idx_b0139afb724910f7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b0139afb724910f7 ON promo USING btree (izvedba_id);


--
-- TOC entry 3344 (class 1259 OID 826783)
-- Name: idx_b0139afbbbcda81c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b0139afbbbcda81c ON promo USING btree (delavec_id);


--
-- TOC entry 3411 (class 1259 OID 826784)
-- Name: idx_b2c24493ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b2c24493ff55f926 ON tdok USING btree (stevilcenje_id);


--
-- TOC entry 3309 (class 1259 OID 826785)
-- Name: idx_b472fe6978e7da2f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b472fe6978e7da2f ON poznd USING btree (dokument_id);


--
-- TOC entry 3310 (class 1259 OID 826786)
-- Name: idx_b472fe69847dc91; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b472fe69847dc91 ON poznd USING btree (maticna_id);


--
-- TOC entry 3311 (class 1259 OID 826788)
-- Name: idx_b472fe69d627d694; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b472fe69d627d694 ON poznd USING btree (nalog_id);


--
-- TOC entry 3312 (class 1259 OID 1738034)
-- Name: idx_b472fe69f04bd6e7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b472fe69f04bd6e7 ON poznd USING btree (vezarazpis_id);


--
-- TOC entry 3234 (class 1259 OID 826789)
-- Name: idx_b70a2839bead64a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b70a2839bead64a ON poslovniplannapoved USING btree (obdobje_id);


--
-- TOC entry 3235 (class 1259 OID 826790)
-- Name: idx_b70a283b3bc5309; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b70a283b3bc5309 ON poslovniplannapoved USING btree (narocilo_id);


--
-- TOC entry 3088 (class 1259 OID 826791)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 3089 (class 1259 OID 826792)
-- Name: idx_b7229ce16beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce16beede51 ON kose USING btree (popa_id);


--
-- TOC entry 3333 (class 1259 OID 826793)
-- Name: idx_b84cee078f6fbef0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b84cee078f6fbef0 ON prikazlokacije USING btree (lokacija_id);


--
-- TOC entry 3334 (class 1259 OID 826794)
-- Name: idx_b84cee07f6dd3057; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b84cee07f6dd3057 ON prikazlokacije USING btree (zemljevid_id);


--
-- TOC entry 3132 (class 1259 OID 826795)
-- Name: idx_bd26580220a40e3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bd26580220a40e3b ON matt USING btree (klasifikacija_id);


--
-- TOC entry 3133 (class 1259 OID 826796)
-- Name: idx_bd26580237854736; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bd26580237854736 ON matt USING btree (naziv);


--
-- TOC entry 3134 (class 1259 OID 826797)
-- Name: idx_bd2658027f8031ce; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bd2658027f8031ce ON matt USING btree (podklasifikacija_id);


--
-- TOC entry 3135 (class 1259 OID 826798)
-- Name: idx_bd265802dbf6a7ed; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bd265802dbf6a7ed ON matt USING btree (klasdela_id);


--
-- TOC entry 3191 (class 1259 OID 826799)
-- Name: idx_c3184107268f8315; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c3184107268f8315 ON pakiranjeprodukta USING btree (embalaza_id);


--
-- TOC entry 3192 (class 1259 OID 826800)
-- Name: idx_c318410771efc2b6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c318410771efc2b6 ON pakiranjeprodukta USING btree (etiketa_id);


--
-- TOC entry 3193 (class 1259 OID 826801)
-- Name: idx_c3184107847dc91; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c3184107847dc91 ON pakiranjeprodukta USING btree (maticna_id);


--
-- TOC entry 3063 (class 1259 OID 826802)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 3064 (class 1259 OID 826803)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 3065 (class 1259 OID 826804)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 3066 (class 1259 OID 826805)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 3453 (class 1259 OID 1330445)
-- Name: idx_c48634e733ccfe3d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c48634e733ccfe3d ON skladiscenjeizdaja USING btree (izhodnidokument_id);


--
-- TOC entry 3454 (class 1259 OID 1330446)
-- Name: idx_c48634e76556c896; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c48634e76556c896 ON skladiscenjeizdaja USING btree (poreklo_id);


--
-- TOC entry 3060 (class 1259 OID 826806)
-- Name: idx_cc1ac154c8010495; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cc1ac154c8010495 ON izmetpodrobno USING btree (izvedbapodrobno_id);


--
-- TOC entry 3179 (class 1259 OID 826807)
-- Name: idx_ce31c895633aca59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ce31c895633aca59 ON operacija_tehen USING btree (tehen_id);


--
-- TOC entry 3180 (class 1259 OID 826808)
-- Name: idx_ce31c895765608e5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ce31c895765608e5 ON operacija_tehen USING btree (operacija_id);


--
-- TOC entry 3199 (class 1259 OID 826809)
-- Name: idx_d2657963d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d2657963d60322ac ON permission_allrole USING btree (role_id);


--
-- TOC entry 3200 (class 1259 OID 826810)
-- Name: idx_d2657963fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d2657963fed90cca ON permission_allrole USING btree (permission_id);


--
-- TOC entry 3449 (class 1259 OID 826811)
-- Name: idx_d391b244724910f7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d391b244724910f7 ON zbirur_norme USING btree (izvedba_id);


--
-- TOC entry 3450 (class 1259 OID 826812)
-- Name: idx_d391b244e06fc29e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d391b244e06fc29e ON zbirur_norme USING btree (norma_id);


--
-- TOC entry 3183 (class 1259 OID 826813)
-- Name: idx_d508232f19f47060; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d508232f19f47060 ON paketiproduktov USING btree (alienparent_id);


--
-- TOC entry 3184 (class 1259 OID 826814)
-- Name: idx_d508232f268f8315; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d508232f268f8315 ON paketiproduktov USING btree (embalaza_id);


--
-- TOC entry 3185 (class 1259 OID 826815)
-- Name: idx_d508232f5dc46e09; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d508232f5dc46e09 ON paketiproduktov USING btree (dobava_id);


--
-- TOC entry 3186 (class 1259 OID 826816)
-- Name: idx_d508232f727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d508232f727aca70 ON paketiproduktov USING btree (parent_id);


--
-- TOC entry 3187 (class 1259 OID 826817)
-- Name: idx_d508232f8f6fbef0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d508232f8f6fbef0 ON paketiproduktov USING btree (lokacija_id);


--
-- TOC entry 3046 (class 1259 OID 826818)
-- Name: idx_d8d0e77771efc2b6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d8d0e77771efc2b6 ON embalaza USING btree (etiketa_id);


--
-- TOC entry 3047 (class 1259 OID 826819)
-- Name: idx_d8d0e777727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d8d0e777727aca70 ON embalaza USING btree (parent_id);


--
-- TOC entry 3048 (class 1259 OID 826820)
-- Name: idx_d8d0e777847dc91; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d8d0e777847dc91 ON embalaza USING btree (maticna_id);


--
-- TOC entry 3049 (class 1259 OID 826821)
-- Name: idx_d8d0e777a0320d72; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d8d0e777a0320d72 ON embalaza USING btree (pakiranje_id);


--
-- TOC entry 3096 (class 1259 OID 826822)
-- Name: idx_dd92bc132819adf6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dd92bc132819adf6 ON kost USING btree (kos_id);


--
-- TOC entry 3097 (class 1259 OID 826823)
-- Name: idx_dd92bc13633aca59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dd92bc13633aca59 ON kost USING btree (tehen_id);


--
-- TOC entry 3098 (class 1259 OID 826824)
-- Name: idx_dd92bc13765608e5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dd92bc13765608e5 ON kost USING btree (operacija_id);


--
-- TOC entry 3099 (class 1259 OID 826825)
-- Name: idx_dd92bc13a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dd92bc13a233cb39 ON kost USING btree (klient_id);


--
-- TOC entry 3100 (class 1259 OID 826826)
-- Name: idx_dd92bc13bbcda81c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dd92bc13bbcda81c ON kost USING btree (delavec_id);


--
-- TOC entry 3143 (class 1259 OID 826827)
-- Name: idx_e47e400e4ce26053; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e47e400e4ce26053 ON nard USING btree (dok_id);


--
-- TOC entry 3144 (class 1259 OID 826828)
-- Name: idx_e47e400e78c07e7c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e47e400e78c07e7c ON nard USING btree (valuta_id);


--
-- TOC entry 3145 (class 1259 OID 826829)
-- Name: idx_e47e400ea233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e47e400ea233cb39 ON nard USING btree (klient_id);


--
-- TOC entry 3146 (class 1259 OID 826830)
-- Name: idx_e47e400ea6c3fc6b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e47e400ea6c3fc6b ON nard USING btree (prejemnik_id);


--
-- TOC entry 3147 (class 1259 OID 826831)
-- Name: idx_e47e400eaebac2d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e47e400eaebac2d4 ON nard USING btree (naslovklienta_id);


--
-- TOC entry 3148 (class 1259 OID 826833)
-- Name: idx_e47e400eba837808; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e47e400eba837808 ON nard USING btree (kontaktna_id);


--
-- TOC entry 3149 (class 1259 OID 826834)
-- Name: idx_e47e400eee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e47e400eee4b985a ON nard USING btree (drzava_id);


--
-- TOC entry 3150 (class 1259 OID 826835)
-- Name: idx_e47e400efb9bda2b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e47e400efb9bda2b ON nard USING btree (naslovprejemnika_id);


--
-- TOC entry 3116 (class 1259 OID 826836)
-- Name: idx_e4daf1e55b51032f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e4daf1e55b51032f ON lokacije_lastnosti USING btree (lastnostlokacije_id);


--
-- TOC entry 3117 (class 1259 OID 826837)
-- Name: idx_e4daf1e58f6fbef0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e4daf1e58f6fbef0 ON lokacije_lastnosti USING btree (lokacija_id);


--
-- TOC entry 3069 (class 1259 OID 826838)
-- Name: idx_e629e1eba54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e629e1eba54dbb1f ON job_datoteka USING btree (datoteka_id);


--
-- TOC entry 3070 (class 1259 OID 826839)
-- Name: idx_e629e1ebbe04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e629e1ebbe04ea9 ON job_datoteka USING btree (job_id);


--
-- TOC entry 3170 (class 1259 OID 826840)
-- Name: idx_e7d503af5827c206; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d503af5827c206 ON nastavni_sklopi USING btree (sklop_id);


--
-- TOC entry 3171 (class 1259 OID 826841)
-- Name: idx_e7d503afbfa2c7ec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d503afbfa2c7ec ON nastavni_sklopi USING btree (nastavni_id);


--
-- TOC entry 3370 (class 1259 OID 826846)
-- Name: idx_e9d6f8feed49ce4d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9d6f8feed49ce4d ON role_role USING btree (role_target);


--
-- TOC entry 3371 (class 1259 OID 826847)
-- Name: idx_e9d6f8fef4ac9ec2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9d6f8fef4ac9ec2 ON role_role USING btree (role_source);


--
-- TOC entry 3321 (class 1259 OID 826848)
-- Name: idx_f08cdc27755d8926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f08cdc27755d8926 ON pozpk USING btree (kalkulacija_id);


--
-- TOC entry 3322 (class 1259 OID 826849)
-- Name: idx_f08cdc2778e7da2f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f08cdc2778e7da2f ON pozpk USING btree (dokument_id);


--
-- TOC entry 3323 (class 1259 OID 826850)
-- Name: idx_f08cdc27847dc91; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f08cdc27847dc91 ON pozpk USING btree (maticna_id);


--
-- TOC entry 3015 (class 1259 OID 1810905)
-- Name: idx_f1827b3078e7da2f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f1827b3078e7da2f ON checklistvzorecpostavka USING btree (dokument_id);


--
-- TOC entry 3163 (class 1259 OID 826852)
-- Name: idx_f3bef97d633aca59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f3bef97d633aca59 ON nasl USING btree (tehen_id);


--
-- TOC entry 3164 (class 1259 OID 826853)
-- Name: idx_f3bef97d847dc91; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f3bef97d847dc91 ON nasl USING btree (maticna_id);


--
-- TOC entry 3165 (class 1259 OID 826854)
-- Name: idx_f3bef97de25462bb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f3bef97de25462bb ON nasl USING btree (oper_id);


--
-- TOC entry 3345 (class 1259 OID 826855)
-- Name: idx_izvedbapodrobno_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_izvedbapodrobno_zacetek ON promo USING btree (zacetek);


--
-- TOC entry 3298 (class 1259 OID 826856)
-- Name: uniq_1be681b02819adf6; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1be681b02819adf6 ON pozin USING btree (kos_id);


--
-- TOC entry 3217 (class 1259 OID 826857)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 3230 (class 1259 OID 826858)
-- Name: uniq_1dc724a6e899029beedf290a; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1dc724a6e899029beedf290a ON poslovniplanartikla USING btree (plan_id, artikel_id);


--
-- TOC entry 3040 (class 1259 OID 826859)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 3041 (class 1259 OID 826860)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 3042 (class 1259 OID 826861)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 3043 (class 1259 OID 826862)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 3378 (class 1259 OID 826863)
-- Name: uniq_35b5c6efca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_35b5c6efca2e5fcb ON serijskestevilke USING btree (stevilka);


--
-- TOC entry 3084 (class 1259 OID 826864)
-- Name: uniq_3944e73a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3944e73a559828a3 ON klas USING btree (sifra);


--
-- TOC entry 3052 (class 1259 OID 826865)
-- Name: uniq_5b7e8fa737854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5b7e8fa737854736 ON etikete USING btree (naziv);


--
-- TOC entry 3053 (class 1259 OID 826866)
-- Name: uniq_5b7e8fa7e16c6b94; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5b7e8fa7e16c6b94 ON etikete USING btree (alias);


--
-- TOC entry 3178 (class 1259 OID 826867)
-- Name: uniq_5ea5c4a5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5ea5c4a5559828a3 ON odst USING btree (sifra);


--
-- TOC entry 3403 (class 1259 OID 826868)
-- Name: uniq_660c68b9559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_660c68b9559828a3 ON stevilcenjedokumenta USING btree (sifra);


--
-- TOC entry 3386 (class 1259 OID 826869)
-- Name: uniq_6bfb9004559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6bfb9004559828a3 ON skl USING btree (sifra);


--
-- TOC entry 3115 (class 1259 OID 826870)
-- Name: uniq_6cd02b1b97ae0266; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6cd02b1b97ae0266 ON lokacije USING btree (barcode);


--
-- TOC entry 3307 (class 1259 OID 826871)
-- Name: uniq_7aa5cda257e2c2a8; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7aa5cda257e2c2a8 ON pozizd USING btree (dobavnica_id);


--
-- TOC entry 3308 (class 1259 OID 826872)
-- Name: uniq_7aa5cda2ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7aa5cda2ca2e5fcb ON pozizd USING btree (stevilka);


--
-- TOC entry 3075 (class 1259 OID 826873)
-- Name: uniq_7b6fc99082d6576b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7b6fc99082d6576b ON kakovostniprevzem USING btree (postavkanarocila_id);


--
-- TOC entry 3423 (class 1259 OID 1810896)
-- Name: uniq_7fb775b7bf396750; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7bf396750 ON uporabniki USING btree (id);


--
-- TOC entry 3424 (class 1259 OID 826874)
-- Name: uniq_7fb775b7e7927c74; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7e7927c74 ON uporabniki USING btree (email);


--
-- TOC entry 3425 (class 1259 OID 826875)
-- Name: uniq_7fb775b7f85e0677; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7f85e0677 ON uporabniki USING btree (username);


--
-- TOC entry 3436 (class 1259 OID 826876)
-- Name: uniq_9ac71ebe559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_9ac71ebe559828a3 ON valuta USING btree (sifra);


--
-- TOC entry 3437 (class 1259 OID 826877)
-- Name: uniq_9ac71ebed55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_9ac71ebed55226c7 ON valuta USING btree (oznaka);


--
-- TOC entry 3198 (class 1259 OID 1810898)
-- Name: uniq_af14917abf396750; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_af14917abf396750 ON permission USING btree (id);


--
-- TOC entry 3414 (class 1259 OID 826878)
-- Name: uniq_b2c24493559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b2c24493559828a3 ON tdok USING btree (sifra);


--
-- TOC entry 3420 (class 1259 OID 826879)
-- Name: uniq_b929aa6b37854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b929aa6b37854736 ON tiskalniki USING btree (naziv);


--
-- TOC entry 3421 (class 1259 OID 826880)
-- Name: uniq_b929aa6b442a0f23; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b929aa6b442a0f23 ON tiskalniki USING btree (naslov);


--
-- TOC entry 3422 (class 1259 OID 826881)
-- Name: uniq_b929aa6b92cb8d54; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b929aa6b92cb8d54 ON tiskalniki USING btree (lokacija);


--
-- TOC entry 3138 (class 1259 OID 826882)
-- Name: uniq_bd265802559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_bd265802559828a3 ON matt USING btree (sifra);


--
-- TOC entry 3381 (class 1259 OID 826883)
-- Name: uniq_c8768340559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_c8768340559828a3 ON sifdog USING btree (sifra);


--
-- TOC entry 3109 (class 1259 OID 826885)
-- Name: uniq_c9edf538559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_c9edf538559828a3 ON lastnostlokacije USING btree (sifra);


--
-- TOC entry 3190 (class 1259 OID 826886)
-- Name: uniq_d508232f97ae0266; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_d508232f97ae0266 ON paketiproduktov USING btree (barcode);


--
-- TOC entry 3364 (class 1259 OID 826887)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 3365 (class 1259 OID 1810897)
-- Name: uniq_f75b2554bf396750; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b2554bf396750 ON role USING btree (id);


--
-- TOC entry 3395 (class 1259 OID 826888)
-- Name: uniq_f97206235e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f97206235e237e06 ON skupine USING btree (name);


--
-- TOC entry 3396 (class 1259 OID 1810899)
-- Name: uniq_f9720623bf396750; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f9720623bf396750 ON skupine USING btree (id);


--
-- TOC entry 3417 (class 1259 OID 826889)
-- Name: uniq_fd36c8985e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_fd36c8985e237e06 ON tipdogodka USING btree (name);


--
-- TOC entry 3674 (class 2606 OID 826890)
-- Name: fk_10b2825a1bfe97c4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY statustehen
    ADD CONSTRAINT fk_10b2825a1bfe97c4 FOREIGN KEY (trenutnaoperacija_id) REFERENCES zbirur(id);


--
-- TOC entry 3675 (class 2606 OID 826895)
-- Name: fk_10b2825a633aca59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY statustehen
    ADD CONSTRAINT fk_10b2825a633aca59 FOREIGN KEY (tehen_id) REFERENCES matt(id);


--
-- TOC entry 3477 (class 2606 OID 826900)
-- Name: fk_11e93b5d476c47f6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d476c47f6 FOREIGN KEY (tip_id) REFERENCES tipdogodka(id);


--
-- TOC entry 3521 (class 2606 OID 826905)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3522 (class 2606 OID 826910)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 3676 (class 2606 OID 826915)
-- Name: fk_154bfb4c3a66cc09; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjeposkl
    ADD CONSTRAINT fk_154bfb4c3a66cc09 FOREIGN KEY (skl_id) REFERENCES skl(id);


--
-- TOC entry 3677 (class 2606 OID 826920)
-- Name: fk_154bfb4c4ce26053; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjeposkl
    ADD CONSTRAINT fk_154bfb4c4ce26053 FOREIGN KEY (dok_id) REFERENCES tdok(id);


--
-- TOC entry 3678 (class 2606 OID 826925)
-- Name: fk_154bfb4cff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjeposkl
    ADD CONSTRAINT fk_154bfb4cff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenjedokumenta(id);


--
-- TOC entry 3618 (class 2606 OID 826930)
-- Name: fk_1be681b02819adf6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pozin
    ADD CONSTRAINT fk_1be681b02819adf6 FOREIGN KEY (kos_id) REFERENCES razk(id);


--
-- TOC entry 3619 (class 2606 OID 826935)
-- Name: fk_1be681b04ce26053; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pozin
    ADD CONSTRAINT fk_1be681b04ce26053 FOREIGN KEY (dok_id) REFERENCES tdok(id);


--
-- TOC entry 3620 (class 2606 OID 826940)
-- Name: fk_1be681b0847dc91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pozin
    ADD CONSTRAINT fk_1be681b0847dc91 FOREIGN KEY (maticna_id) REFERENCES matt(id);


--
-- TOC entry 3621 (class 2606 OID 826945)
-- Name: fk_1be681b0a0320d72; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pozin
    ADD CONSTRAINT fk_1be681b0a0320d72 FOREIGN KEY (pakiranje_id) REFERENCES pakiranjeprodukta(id);


--
-- TOC entry 3622 (class 2606 OID 826950)
-- Name: fk_1be681b0a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pozin
    ADD CONSTRAINT fk_1be681b0a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 3623 (class 2606 OID 826955)
-- Name: fk_1be681b0bbcda81c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pozin
    ADD CONSTRAINT fk_1be681b0bbcda81c FOREIGN KEY (delavec_id) REFERENCES matt(id);


--
-- TOC entry 3624 (class 2606 OID 826960)
-- Name: fk_1be681b0ea18fce7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pozin
    ADD CONSTRAINT fk_1be681b0ea18fce7 FOREIGN KEY (kalkkoso_id) REFERENCES kalkkoso(id);


--
-- TOC entry 3572 (class 2606 OID 826965)
-- Name: fk_1c7adba520a40e3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba520a40e3b FOREIGN KEY (klasifikacija_id) REFERENCES klas(id);


--
-- TOC entry 3573 (class 2606 OID 826970)
-- Name: fk_1c7adba5d4bd8662; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5d4bd8662 FOREIGN KEY (potnik_id) REFERENCES popa(id);


--
-- TOC entry 3574 (class 2606 OID 826975)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 3611 (class 2606 OID 1196494)
-- Name: fk_1cefdda8108b7592; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkamat
    ADD CONSTRAINT fk_1cefdda8108b7592 FOREIGN KEY (original_id) REFERENCES postavkamat(id);


--
-- TOC entry 3601 (class 2606 OID 826980)
-- Name: fk_1cefdda81cbe66d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkamat
    ADD CONSTRAINT fk_1cefdda81cbe66d4 FOREIGN KEY (vezand_id) REFERENCES poznd(id);


--
-- TOC entry 3602 (class 2606 OID 826985)
-- Name: fk_1cefdda82b1b3d4e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkamat
    ADD CONSTRAINT fk_1cefdda82b1b3d4e FOREIGN KEY (polizdelek_id) REFERENCES matt(id);


--
-- TOC entry 3603 (class 2606 OID 826990)
-- Name: fk_1cefdda844dd7682; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkamat
    ADD CONSTRAINT fk_1cefdda844dd7682 FOREIGN KEY (vezank_id) REFERENCES poznk(id);


--
-- TOC entry 3604 (class 2606 OID 826995)
-- Name: fk_1cefdda857643b98; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkamat
    ADD CONSTRAINT fk_1cefdda857643b98 FOREIGN KEY (skladisce_id) REFERENCES skl(id);


--
-- TOC entry 3605 (class 2606 OID 827000)
-- Name: fk_1cefdda87121331c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkamat
    ADD CONSTRAINT fk_1cefdda87121331c FOREIGN KEY (vezanalog_id) REFERENCES pozin(id);


--
-- TOC entry 3606 (class 2606 OID 827005)
-- Name: fk_1cefdda878e7da2f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkamat
    ADD CONSTRAINT fk_1cefdda878e7da2f FOREIGN KEY (dokument_id) REFERENCES dokumentmat(id);


--
-- TOC entry 3607 (class 2606 OID 827010)
-- Name: fk_1cefdda8847dc91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkamat
    ADD CONSTRAINT fk_1cefdda8847dc91 FOREIGN KEY (maticna_id) REFERENCES matt(id);


--
-- TOC entry 3608 (class 2606 OID 827015)
-- Name: fk_1cefdda8a8094cf7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkamat
    ADD CONSTRAINT fk_1cefdda8a8094cf7 FOREIGN KEY (vezaizd_id) REFERENCES postavkamat(id);


--
-- TOC entry 3609 (class 2606 OID 827020)
-- Name: fk_1cefdda8a949937f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkamat
    ADD CONSTRAINT fk_1cefdda8a949937f FOREIGN KEY (sklv_id) REFERENCES skl(id);


--
-- TOC entry 3610 (class 2606 OID 827025)
-- Name: fk_1cefdda8bbcda81c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkamat
    ADD CONSTRAINT fk_1cefdda8bbcda81c FOREIGN KEY (delavec_id) REFERENCES matt(id);


--
-- TOC entry 3612 (class 2606 OID 1738051)
-- Name: fk_1cefdda8f04bd6e7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkamat
    ADD CONSTRAINT fk_1cefdda8f04bd6e7 FOREIGN KEY (vezarazpis_id) REFERENCES razk(id);


--
-- TOC entry 3578 (class 2606 OID 827030)
-- Name: fk_1dc724a6755d8926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplanartikla
    ADD CONSTRAINT fk_1dc724a6755d8926 FOREIGN KEY (kalkulacija_id) REFERENCES kalkkoso(id);


--
-- TOC entry 3579 (class 2606 OID 827035)
-- Name: fk_1dc724a6e899029b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplanartikla
    ADD CONSTRAINT fk_1dc724a6e899029b FOREIGN KEY (plan_id) REFERENCES poslovniplan(id);


--
-- TOC entry 3580 (class 2606 OID 827040)
-- Name: fk_1dc724a6eedf290a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplanartikla
    ADD CONSTRAINT fk_1dc724a6eedf290a FOREIGN KEY (artikel_id) REFERENCES matt(id);


--
-- TOC entry 3680 (class 2606 OID 827045)
-- Name: fk_218e1734a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_hierroles
    ADD CONSTRAINT fk_218e1734a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id) ON DELETE CASCADE;


--
-- TOC entry 3681 (class 2606 OID 827050)
-- Name: fk_218e1734d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_hierroles
    ADD CONSTRAINT fk_218e1734d60322ac FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE;


--
-- TOC entry 3636 (class 2606 OID 827060)
-- Name: fk_24cde3f86533c48; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poznk
    ADD CONSTRAINT fk_24cde3f86533c48 FOREIGN KEY (postavkaponudbe_id) REFERENCES pozpk(id);


--
-- TOC entry 3637 (class 2606 OID 827065)
-- Name: fk_24cde3f878e7da2f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poznk
    ADD CONSTRAINT fk_24cde3f878e7da2f FOREIGN KEY (dokument_id) REFERENCES nark(id);


--
-- TOC entry 3638 (class 2606 OID 827070)
-- Name: fk_24cde3f8847dc91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poznk
    ADD CONSTRAINT fk_24cde3f8847dc91 FOREIGN KEY (maticna_id) REFERENCES matt(id);


--
-- TOC entry 3639 (class 2606 OID 827080)
-- Name: fk_24cde3f8d627d694; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poznk
    ADD CONSTRAINT fk_24cde3f8d627d694 FOREIGN KEY (nalog_id) REFERENCES pozin(id);


--
-- TOC entry 3469 (class 2606 OID 827085)
-- Name: fk_273236e378c07e7c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cena
    ADD CONSTRAINT fk_273236e378c07e7c FOREIGN KEY (valuta_id) REFERENCES valuta(id);


--
-- TOC entry 3470 (class 2606 OID 827090)
-- Name: fk_273236e3847dc91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cena
    ADD CONSTRAINT fk_273236e3847dc91 FOREIGN KEY (maticna_id) REFERENCES matt(id);


--
-- TOC entry 3471 (class 2606 OID 827095)
-- Name: fk_273236e3a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cena
    ADD CONSTRAINT fk_273236e3a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 3565 (class 2606 OID 827100)
-- Name: fk_28ee0d644ce26053; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ponk
    ADD CONSTRAINT fk_28ee0d644ce26053 FOREIGN KEY (dok_id) REFERENCES tdok(id);


--
-- TOC entry 3566 (class 2606 OID 827105)
-- Name: fk_28ee0d6478c07e7c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ponk
    ADD CONSTRAINT fk_28ee0d6478c07e7c FOREIGN KEY (valuta_id) REFERENCES valuta(id);


--
-- TOC entry 3567 (class 2606 OID 827110)
-- Name: fk_28ee0d64a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ponk
    ADD CONSTRAINT fk_28ee0d64a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 3568 (class 2606 OID 827115)
-- Name: fk_28ee0d64a6c3fc6b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ponk
    ADD CONSTRAINT fk_28ee0d64a6c3fc6b FOREIGN KEY (prejemnik_id) REFERENCES popa(id);


--
-- TOC entry 3569 (class 2606 OID 827120)
-- Name: fk_28ee0d64aebac2d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ponk
    ADD CONSTRAINT fk_28ee0d64aebac2d4 FOREIGN KEY (naslovklienta_id) REFERENCES postninaslovi(id);


--
-- TOC entry 3570 (class 2606 OID 827125)
-- Name: fk_28ee0d64ba837808; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ponk
    ADD CONSTRAINT fk_28ee0d64ba837808 FOREIGN KEY (kontaktna_id) REFERENCES kose(id);


--
-- TOC entry 3571 (class 2606 OID 827130)
-- Name: fk_28ee0d64fb9bda2b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ponk
    ADD CONSTRAINT fk_28ee0d64fb9bda2b FOREIGN KEY (naslovprejemnika_id) REFERENCES postninaslovi(id);


--
-- TOC entry 3702 (class 2606 OID 1330515)
-- Name: fk_2c7099e917e87821; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skladiscenjezaloga
    ADD CONSTRAINT fk_2c7099e917e87821 FOREIGN KEY (vhodnidokument_id) REFERENCES postavkamat(id);


--
-- TOC entry 3700 (class 2606 OID 1330505)
-- Name: fk_2c7099e91bf941c7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skladiscenjezaloga
    ADD CONSTRAINT fk_2c7099e91bf941c7 FOREIGN KEY (zaloga_id) REFERENCES matz(id);


--
-- TOC entry 3701 (class 2606 OID 1330510)
-- Name: fk_2c7099e96b1941d2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skladiscenjezaloga
    ADD CONSTRAINT fk_2c7099e96b1941d2 FOREIGN KEY (izvornidokument_id) REFERENCES postavkamat(id);


--
-- TOC entry 3699 (class 2606 OID 1330500)
-- Name: fk_2c7099e98f6fbef0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skladiscenjezaloga
    ADD CONSTRAINT fk_2c7099e98f6fbef0 FOREIGN KEY (lokacija_id) REFERENCES lokacije(id);


--
-- TOC entry 3682 (class 2606 OID 827135)
-- Name: fk_2de8c6a3a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT fk_2de8c6a3a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id) ON DELETE CASCADE;


--
-- TOC entry 3683 (class 2606 OID 827140)
-- Name: fk_2de8c6a3d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT fk_2de8c6a3d60322ac FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE;


--
-- TOC entry 3488 (class 2606 OID 1196488)
-- Name: fk_34b7b88a108b7592; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dokumentmat
    ADD CONSTRAINT fk_34b7b88a108b7592 FOREIGN KEY (original_id) REFERENCES dokumentmat(id);


--
-- TOC entry 3478 (class 2606 OID 827145)
-- Name: fk_34b7b88a13c41f80; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dokumentmat
    ADD CONSTRAINT fk_34b7b88a13c41f80 FOREIGN KEY (nalog) REFERENCES pozin(id);


--
-- TOC entry 3479 (class 2606 OID 827150)
-- Name: fk_34b7b88a4ce26053; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dokumentmat
    ADD CONSTRAINT fk_34b7b88a4ce26053 FOREIGN KEY (dok_id) REFERENCES tdok(id);


--
-- TOC entry 3480 (class 2606 OID 827155)
-- Name: fk_34b7b88a57643b98; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dokumentmat
    ADD CONSTRAINT fk_34b7b88a57643b98 FOREIGN KEY (skladisce_id) REFERENCES skl(id);


--
-- TOC entry 3481 (class 2606 OID 827160)
-- Name: fk_34b7b88a78c07e7c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dokumentmat
    ADD CONSTRAINT fk_34b7b88a78c07e7c FOREIGN KEY (valuta_id) REFERENCES valuta(id);


--
-- TOC entry 3482 (class 2606 OID 827165)
-- Name: fk_34b7b88aa233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dokumentmat
    ADD CONSTRAINT fk_34b7b88aa233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 3483 (class 2606 OID 827170)
-- Name: fk_34b7b88aa6c3fc6b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dokumentmat
    ADD CONSTRAINT fk_34b7b88aa6c3fc6b FOREIGN KEY (prejemnik_id) REFERENCES popa(id);


--
-- TOC entry 3484 (class 2606 OID 827175)
-- Name: fk_34b7b88aa949937f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dokumentmat
    ADD CONSTRAINT fk_34b7b88aa949937f FOREIGN KEY (sklv_id) REFERENCES skl(id);


--
-- TOC entry 3485 (class 2606 OID 827180)
-- Name: fk_34b7b88aaebac2d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dokumentmat
    ADD CONSTRAINT fk_34b7b88aaebac2d4 FOREIGN KEY (naslovklienta_id) REFERENCES postninaslovi(id);


--
-- TOC entry 3486 (class 2606 OID 827185)
-- Name: fk_34b7b88aee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dokumentmat
    ADD CONSTRAINT fk_34b7b88aee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 3487 (class 2606 OID 827190)
-- Name: fk_34b7b88afb9bda2b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dokumentmat
    ADD CONSTRAINT fk_34b7b88afb9bda2b FOREIGN KEY (naslovprejemnika_id) REFERENCES postninaslovi(id);


--
-- TOC entry 3666 (class 2606 OID 827195)
-- Name: fk_35b5c6ef847dc91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY serijskestevilke
    ADD CONSTRAINT fk_35b5c6ef847dc91 FOREIGN KEY (maticna_id) REFERENCES matt(id);


--
-- TOC entry 3667 (class 2606 OID 827200)
-- Name: fk_35b5c6efaa0f25e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY serijskestevilke
    ADD CONSTRAINT fk_35b5c6efaa0f25e5 FOREIGN KEY (paket_id) REFERENCES paketiproduktov(id);


--
-- TOC entry 3472 (class 2606 OID 827205)
-- Name: fk_3872a742755d8926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cenovnirazpon
    ADD CONSTRAINT fk_3872a742755d8926 FOREIGN KEY (kalkulacija_id) REFERENCES kalkkoso(id);


--
-- TOC entry 3473 (class 2606 OID 827210)
-- Name: fk_3872a74287250bbb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cenovnirazpon
    ADD CONSTRAINT fk_3872a74287250bbb FOREIGN KEY (ponudba_id) REFERENCES pozpk(id);


--
-- TOC entry 3502 (class 2606 OID 827215)
-- Name: fk_3944e73a3a66cc09; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY klas
    ADD CONSTRAINT fk_3944e73a3a66cc09 FOREIGN KEY (skl_id) REFERENCES skl(id);


--
-- TOC entry 3503 (class 2606 OID 827220)
-- Name: fk_3944e73a727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY klas
    ADD CONSTRAINT fk_3944e73a727aca70 FOREIGN KEY (parent_id) REFERENCES klas(id);


--
-- TOC entry 3643 (class 2606 OID 827225)
-- Name: fk_3e5fff2a8f6fbef0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prejsnjelokacije
    ADD CONSTRAINT fk_3e5fff2a8f6fbef0 FOREIGN KEY (lokacija_id) REFERENCES lokacije(id);


--
-- TOC entry 3644 (class 2606 OID 827230)
-- Name: fk_3e5fff2aaa0f25e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prejsnjelokacije
    ADD CONSTRAINT fk_3e5fff2aaa0f25e5 FOREIGN KEY (paket_id) REFERENCES paketiproduktov(id);


--
-- TOC entry 3504 (class 2606 OID 827235)
-- Name: fk_4987a91b14343c09; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontekst
    ADD CONSTRAINT fk_4987a91b14343c09 FOREIGN KEY (uporabnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 3587 (class 2606 OID 827240)
-- Name: fk_5543cd2ee899029b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplanobdobje
    ADD CONSTRAINT fk_5543cd2ee899029b FOREIGN KEY (plan_id) REFERENCES poslovniplan(id);


--
-- TOC entry 3507 (class 2606 OID 827245)
-- Name: fk_57f775ff727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY koso
    ADD CONSTRAINT fk_57f775ff727aca70 FOREIGN KEY (parent_id) REFERENCES koso(id);


--
-- TOC entry 3508 (class 2606 OID 827250)
-- Name: fk_57f775ff847dc91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY koso
    ADD CONSTRAINT fk_57f775ff847dc91 FOREIGN KEY (maticna_id) REFERENCES matt(id);


--
-- TOC entry 3684 (class 2606 OID 827255)
-- Name: fk_591323d138fdb10; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zbirur
    ADD CONSTRAINT fk_591323d138fdb10 FOREIGN KEY (razpis_id) REFERENCES razpiskost(id);


--
-- TOC entry 3685 (class 2606 OID 827260)
-- Name: fk_591323d633aca59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zbirur
    ADD CONSTRAINT fk_591323d633aca59 FOREIGN KEY (tehen_id) REFERENCES matt(id);


--
-- TOC entry 3686 (class 2606 OID 827265)
-- Name: fk_591323d765608e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zbirur
    ADD CONSTRAINT fk_591323d765608e5 FOREIGN KEY (operacija_id) REFERENCES matt(id);


--
-- TOC entry 3687 (class 2606 OID 827270)
-- Name: fk_591323da233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zbirur
    ADD CONSTRAINT fk_591323da233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 3688 (class 2606 OID 827275)
-- Name: fk_591323dbbcda81c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zbirur
    ADD CONSTRAINT fk_591323dbbcda81c FOREIGN KEY (delavec_id) REFERENCES matt(id);


--
-- TOC entry 3689 (class 2606 OID 827280)
-- Name: fk_591323dbf653e3d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zbirur
    ADD CONSTRAINT fk_591323dbf653e3d FOREIGN KEY (razpiskos_id) REFERENCES razk(id);


--
-- TOC entry 3690 (class 2606 OID 827285)
-- Name: fk_591323dd627d694; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zbirur
    ADD CONSTRAINT fk_591323dd627d694 FOREIGN KEY (nalog_id) REFERENCES pozin(id);


--
-- TOC entry 3530 (class 2606 OID 827290)
-- Name: fk_5a9e75051ef69380; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matz
    ADD CONSTRAINT fk_5a9e75051ef69380 FOREIGN KEY (sifra_id) REFERENCES matt(id);


--
-- TOC entry 3531 (class 2606 OID 827295)
-- Name: fk_5a9e75053a66cc09; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matz
    ADD CONSTRAINT fk_5a9e75053a66cc09 FOREIGN KEY (skl_id) REFERENCES skl(id);


--
-- TOC entry 3588 (class 2606 OID 827300)
-- Name: fk_5f2ec1755392eeb8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplanproizvodnja
    ADD CONSTRAINT fk_5f2ec1755392eeb8 FOREIGN KEY (ppartikla_id) REFERENCES poslovniplanartikla(id);


--
-- TOC entry 3589 (class 2606 OID 827305)
-- Name: fk_5f2ec175755d8926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplanproizvodnja
    ADD CONSTRAINT fk_5f2ec175755d8926 FOREIGN KEY (kalkulacija_id) REFERENCES kalkkoso(id);


--
-- TOC entry 3590 (class 2606 OID 827310)
-- Name: fk_5f2ec1759bead64a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplanproizvodnja
    ADD CONSTRAINT fk_5f2ec1759bead64a FOREIGN KEY (obdobje_id) REFERENCES poslovniplanobdobje(id);


--
-- TOC entry 3591 (class 2606 OID 827315)
-- Name: fk_5f2ec175d627d694; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplanproizvodnja
    ADD CONSTRAINT fk_5f2ec175d627d694 FOREIGN KEY (nalog_id) REFERENCES pozin(id);


--
-- TOC entry 3581 (class 2606 OID 827320)
-- Name: fk_68d775109bead64a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplankadri
    ADD CONSTRAINT fk_68d775109bead64a FOREIGN KEY (obdobje_id) REFERENCES poslovniplanobdobje(id);


--
-- TOC entry 3648 (class 2606 OID 827325)
-- Name: fk_6ab12d57ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY priponka
    ADD CONSTRAINT fk_6ab12d57ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3649 (class 2606 OID 827330)
-- Name: fk_6ab12d786beab6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY priponka
    ADD CONSTRAINT fk_6ab12d786beab6 FOREIGN KEY (tdok_id) REFERENCES tdok(id);


--
-- TOC entry 3650 (class 2606 OID 827335)
-- Name: fk_6ab12da54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY priponka
    ADD CONSTRAINT fk_6ab12da54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3668 (class 2606 OID 827340)
-- Name: fk_6bfb900429fc2be5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skl
    ADD CONSTRAINT fk_6bfb900429fc2be5 FOREIGN KEY (lokacijavhoda_id) REFERENCES lokacije(id);


--
-- TOC entry 3669 (class 2606 OID 827345)
-- Name: fk_6bfb90048f6fbef0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skl
    ADD CONSTRAINT fk_6bfb90048f6fbef0 FOREIGN KEY (lokacija_id) REFERENCES lokacije(id);


--
-- TOC entry 3516 (class 2606 OID 827350)
-- Name: fk_6cd02b1b59c52fa9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lokacije
    ADD CONSTRAINT fk_6cd02b1b59c52fa9 FOREIGN KEY (privzetiprikaz_id) REFERENCES prikazlokacije(id);


--
-- TOC entry 3517 (class 2606 OID 827355)
-- Name: fk_6cd02b1b727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lokacije
    ADD CONSTRAINT fk_6cd02b1b727aca70 FOREIGN KEY (parent_id) REFERENCES lokacije(id);


--
-- TOC entry 3518 (class 2606 OID 827360)
-- Name: fk_6cd02b1b79066886; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lokacije
    ADD CONSTRAINT fk_6cd02b1b79066886 FOREIGN KEY (root_id) REFERENCES lokacije(id);


--
-- TOC entry 3662 (class 2606 OID 827380)
-- Name: fk_6f7df886d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role_permission
    ADD CONSTRAINT fk_6f7df886d60322ac FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE;


--
-- TOC entry 3663 (class 2606 OID 827385)
-- Name: fk_6f7df886fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role_permission
    ADD CONSTRAINT fk_6f7df886fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id) ON DELETE CASCADE;


--
-- TOC entry 3594 (class 2606 OID 827390)
-- Name: fk_70b423e2b1b3d4e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkakalkkoso
    ADD CONSTRAINT fk_70b423e2b1b3d4e FOREIGN KEY (polizdelek_id) REFERENCES matt(id);


--
-- TOC entry 3595 (class 2606 OID 827395)
-- Name: fk_70b423e31330c45; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkakalkkoso
    ADD CONSTRAINT fk_70b423e31330c45 FOREIGN KEY (cenik_id) REFERENCES cena(id);


--
-- TOC entry 3596 (class 2606 OID 827400)
-- Name: fk_70b423e633aca59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkakalkkoso
    ADD CONSTRAINT fk_70b423e633aca59 FOREIGN KEY (tehen_id) REFERENCES matt(id);


--
-- TOC entry 3597 (class 2606 OID 827405)
-- Name: fk_70b423e765608e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkakalkkoso
    ADD CONSTRAINT fk_70b423e765608e5 FOREIGN KEY (operacija_id) REFERENCES matt(id);


--
-- TOC entry 3598 (class 2606 OID 827410)
-- Name: fk_70b423e78e7da2f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkakalkkoso
    ADD CONSTRAINT fk_70b423e78e7da2f FOREIGN KEY (dokument_id) REFERENCES kalkkoso(id);


--
-- TOC entry 3599 (class 2606 OID 827415)
-- Name: fk_70b423ea233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkakalkkoso
    ADD CONSTRAINT fk_70b423ea233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 3600 (class 2606 OID 827420)
-- Name: fk_70b423ee308ac6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkakalkkoso
    ADD CONSTRAINT fk_70b423ee308ac6f FOREIGN KEY (material_id) REFERENCES matt(id);


--
-- TOC entry 3514 (class 2606 OID 827425)
-- Name: fk_71ce139787430faf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kost_norme
    ADD CONSTRAINT fk_71ce139787430faf FOREIGN KEY (kosooper_id) REFERENCES kost(id) ON DELETE CASCADE;


--
-- TOC entry 3515 (class 2606 OID 827430)
-- Name: fk_71ce1397e06fc29e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kost_norme
    ADD CONSTRAINT fk_71ce1397e06fc29e FOREIGN KEY (norma_id) REFERENCES norme(id) ON DELETE CASCADE;


--
-- TOC entry 3540 (class 2606 OID 827435)
-- Name: fk_74c15d9f4ce26053; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nark
    ADD CONSTRAINT fk_74c15d9f4ce26053 FOREIGN KEY (dok_id) REFERENCES tdok(id);


--
-- TOC entry 3541 (class 2606 OID 827440)
-- Name: fk_74c15d9f78c07e7c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nark
    ADD CONSTRAINT fk_74c15d9f78c07e7c FOREIGN KEY (valuta_id) REFERENCES valuta(id);


--
-- TOC entry 3542 (class 2606 OID 827450)
-- Name: fk_74c15d9fa233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nark
    ADD CONSTRAINT fk_74c15d9fa233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 3543 (class 2606 OID 827455)
-- Name: fk_74c15d9fa6c3fc6b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nark
    ADD CONSTRAINT fk_74c15d9fa6c3fc6b FOREIGN KEY (prejemnik_id) REFERENCES popa(id);


--
-- TOC entry 3544 (class 2606 OID 827460)
-- Name: fk_74c15d9faebac2d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nark
    ADD CONSTRAINT fk_74c15d9faebac2d4 FOREIGN KEY (naslovklienta_id) REFERENCES postninaslovi(id);


--
-- TOC entry 3547 (class 2606 OID 1979198)
-- Name: fk_74c15d9fba837808; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nark
    ADD CONSTRAINT fk_74c15d9fba837808 FOREIGN KEY (kontaktna_id) REFERENCES kose(id);


--
-- TOC entry 3545 (class 2606 OID 827470)
-- Name: fk_74c15d9fee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nark
    ADD CONSTRAINT fk_74c15d9fee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 3546 (class 2606 OID 827475)
-- Name: fk_74c15d9ffb9bda2b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nark
    ADD CONSTRAINT fk_74c15d9ffb9bda2b FOREIGN KEY (naslovprejemnika_id) REFERENCES postninaslovi(id);


--
-- TOC entry 3475 (class 2606 OID 827480)
-- Name: fk_781826c68a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c68a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 3625 (class 2606 OID 827485)
-- Name: fk_7aa5cda24e1a69e7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pozizd
    ADD CONSTRAINT fk_7aa5cda24e1a69e7 FOREIGN KEY (naslovdostave_id) REFERENCES postninaslovi(id);


--
-- TOC entry 3626 (class 2606 OID 827490)
-- Name: fk_7aa5cda257643b98; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pozizd
    ADD CONSTRAINT fk_7aa5cda257643b98 FOREIGN KEY (skladisce_id) REFERENCES skl(id);


--
-- TOC entry 3627 (class 2606 OID 827495)
-- Name: fk_7aa5cda257e2c2a8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pozizd
    ADD CONSTRAINT fk_7aa5cda257e2c2a8 FOREIGN KEY (dobavnica_id) REFERENCES postavkamat(id);


--
-- TOC entry 3628 (class 2606 OID 827500)
-- Name: fk_7aa5cda2847dc91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pozizd
    ADD CONSTRAINT fk_7aa5cda2847dc91 FOREIGN KEY (maticna_id) REFERENCES matt(id);


--
-- TOC entry 3629 (class 2606 OID 827505)
-- Name: fk_7aa5cda2a0320d72; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pozizd
    ADD CONSTRAINT fk_7aa5cda2a0320d72 FOREIGN KEY (pakiranje_id) REFERENCES pakiranjeprodukta(id);


--
-- TOC entry 3630 (class 2606 OID 827510)
-- Name: fk_7aa5cda2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pozizd
    ADD CONSTRAINT fk_7aa5cda2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 3631 (class 2606 OID 827515)
-- Name: fk_7aa5cda2a6c3fc6b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pozizd
    ADD CONSTRAINT fk_7aa5cda2a6c3fc6b FOREIGN KEY (prejemnik_id) REFERENCES popa(id);


--
-- TOC entry 3525 (class 2606 OID 827520)
-- Name: fk_7adc95713b791db1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc95713b791db1 FOREIGN KEY (skupina_id) REFERENCES skupine(id);


--
-- TOC entry 3526 (class 2606 OID 827525)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3501 (class 2606 OID 1805868)
-- Name: fk_7b41ca234ce26053; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kalkkoso
    ADD CONSTRAINT fk_7b41ca234ce26053 FOREIGN KEY (dok_id) REFERENCES tdok(id);


--
-- TOC entry 3500 (class 2606 OID 827530)
-- Name: fk_7b41ca239d319e0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kalkkoso
    ADD CONSTRAINT fk_7b41ca239d319e0b FOREIGN KEY (koncni_id) REFERENCES matt(id);


--
-- TOC entry 3499 (class 2606 OID 827535)
-- Name: fk_7b6fc99082d6576b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kakovostniprevzem
    ADD CONSTRAINT fk_7b6fc99082d6576b FOREIGN KEY (postavkanarocila_id) REFERENCES poznd(id);


--
-- TOC entry 3523 (class 2606 OID 827540)
-- Name: fk_7cfcf42657ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_datoteka
    ADD CONSTRAINT fk_7cfcf42657ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3524 (class 2606 OID 827545)
-- Name: fk_7cfcf426a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_datoteka
    ADD CONSTRAINT fk_7cfcf426a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id) ON DELETE CASCADE;


--
-- TOC entry 3476 (class 2606 OID 828075)
-- Name: fk_80187826633aca59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY deko
    ADD CONSTRAINT fk_80187826633aca59 FOREIGN KEY (tehen_id) REFERENCES matt(id);


--
-- TOC entry 3670 (class 2606 OID 827550)
-- Name: fk_809accd43db71da; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sklo
    ADD CONSTRAINT fk_809accd43db71da FOREIGN KEY (maticnapomozno1_id) REFERENCES matt(id);


--
-- TOC entry 3671 (class 2606 OID 827555)
-- Name: fk_809accd516ede34; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sklo
    ADD CONSTRAINT fk_809accd516ede34 FOREIGN KEY (maticnapomozno2_id) REFERENCES matt(id);


--
-- TOC entry 3672 (class 2606 OID 827560)
-- Name: fk_809accd5827c206; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sklo
    ADD CONSTRAINT fk_809accd5827c206 FOREIGN KEY (sklop_id) REFERENCES matt(id);


--
-- TOC entry 3673 (class 2606 OID 827565)
-- Name: fk_809accd7924c564; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sklo
    ADD CONSTRAINT fk_809accd7924c564 FOREIGN KEY (maticnaorodje_id) REFERENCES matt(id);


--
-- TOC entry 3615 (class 2606 OID 1572028)
-- Name: fk_83d9a81c78e7da2f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkastroska
    ADD CONSTRAINT fk_83d9a81c78e7da2f FOREIGN KEY (dokument_id) REFERENCES dokumentmat(id);


--
-- TOC entry 3613 (class 2606 OID 827575)
-- Name: fk_83d9a81c965125da; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkastroska
    ADD CONSTRAINT fk_83d9a81c965125da FOREIGN KEY (storitev_id) REFERENCES odst(id);


--
-- TOC entry 3614 (class 2606 OID 827580)
-- Name: fk_83d9a81ca233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkastroska
    ADD CONSTRAINT fk_83d9a81ca233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 3616 (class 2606 OID 827595)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 3617 (class 2606 OID 827600)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 3645 (class 2606 OID 827605)
-- Name: fk_8d923514aa0f25e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prejsnjipaketi
    ADD CONSTRAINT fk_8d923514aa0f25e5 FOREIGN KEY (paket_id) REFERENCES paketiproduktov(id);


--
-- TOC entry 3584 (class 2606 OID 827610)
-- Name: fk_907944b65392eeb8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplannarocilo
    ADD CONSTRAINT fk_907944b65392eeb8 FOREIGN KEY (ppartikla_id) REFERENCES poslovniplanartikla(id);


--
-- TOC entry 3585 (class 2606 OID 827615)
-- Name: fk_907944b6a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplannarocilo
    ADD CONSTRAINT fk_907944b6a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 3586 (class 2606 OID 827620)
-- Name: fk_907944b6b3bc5309; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplannarocilo
    ADD CONSTRAINT fk_907944b6b3bc5309 FOREIGN KEY (narocilo_id) REFERENCES poznk(id);


--
-- TOC entry 3657 (class 2606 OID 827625)
-- Name: fk_9e6fe2b2819adf6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpiskost
    ADD CONSTRAINT fk_9e6fe2b2819adf6 FOREIGN KEY (kos_id) REFERENCES razk(id);


--
-- TOC entry 3658 (class 2606 OID 827630)
-- Name: fk_9e6fe2b633aca59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpiskost
    ADD CONSTRAINT fk_9e6fe2b633aca59 FOREIGN KEY (tehen_id) REFERENCES matt(id);


--
-- TOC entry 3659 (class 2606 OID 827635)
-- Name: fk_9e6fe2b765608e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpiskost
    ADD CONSTRAINT fk_9e6fe2b765608e5 FOREIGN KEY (operacija_id) REFERENCES matt(id);


--
-- TOC entry 3660 (class 2606 OID 827640)
-- Name: fk_9e6fe2ba233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpiskost
    ADD CONSTRAINT fk_9e6fe2ba233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 3661 (class 2606 OID 827645)
-- Name: fk_9e6fe2bbbcda81c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpiskost
    ADD CONSTRAINT fk_9e6fe2bbbcda81c FOREIGN KEY (delavec_id) REFERENCES matt(id);


--
-- TOC entry 3493 (class 2606 OID 827650)
-- Name: fk_a4c98d39a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY group_user
    ADD CONSTRAINT fk_a4c98d39a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id) ON DELETE CASCADE;


--
-- TOC entry 3494 (class 2606 OID 827655)
-- Name: fk_a4c98d39fe54d947; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY group_user
    ADD CONSTRAINT fk_a4c98d39fe54d947 FOREIGN KEY (group_id) REFERENCES skupine(id) ON DELETE CASCADE;


--
-- TOC entry 3654 (class 2606 OID 827670)
-- Name: fk_a6d73fb0727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razk
    ADD CONSTRAINT fk_a6d73fb0727aca70 FOREIGN KEY (parent_id) REFERENCES razk(id);


--
-- TOC entry 3655 (class 2606 OID 827675)
-- Name: fk_a6d73fb0847dc91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razk
    ADD CONSTRAINT fk_a6d73fb0847dc91 FOREIGN KEY (maticna_id) REFERENCES matt(id);


--
-- TOC entry 3656 (class 2606 OID 827680)
-- Name: fk_a6d73fb0d627d694; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razk
    ADD CONSTRAINT fk_a6d73fb0d627d694 FOREIGN KEY (nalog_id) REFERENCES pozin(id);


--
-- TOC entry 3695 (class 2606 OID 1330480)
-- Name: fk_aa7108a97cb191e9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skladiscenjepremik
    ADD CONSTRAINT fk_aa7108a97cb191e9 FOREIGN KEY (izvor_id) REFERENCES skladiscenjezaloga(id);


--
-- TOC entry 3696 (class 2606 OID 1330485)
-- Name: fk_aa7108a99990469d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skladiscenjepremik
    ADD CONSTRAINT fk_aa7108a99990469d FOREIGN KEY (cilj_id) REFERENCES skladiscenjezaloga(id);


--
-- TOC entry 3697 (class 2606 OID 1330490)
-- Name: fk_aa7108a9cf82befb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skladiscenjepremik
    ADD CONSTRAINT fk_aa7108a9cf82befb FOREIGN KEY (iz_id) REFERENCES lokacije(id);


--
-- TOC entry 3698 (class 2606 OID 1330495)
-- Name: fk_aa7108a9fabab275; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skladiscenjepremik
    ADD CONSTRAINT fk_aa7108a9fabab275 FOREIGN KEY (na_id) REFERENCES lokacije(id);


--
-- TOC entry 3592 (class 2606 OID 827690)
-- Name: fk_add0ea18633aca59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplanuretehen
    ADD CONSTRAINT fk_add0ea18633aca59 FOREIGN KEY (tehen_id) REFERENCES matt(id);


--
-- TOC entry 3593 (class 2606 OID 827695)
-- Name: fk_add0ea189bead64a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplanuretehen
    ADD CONSTRAINT fk_add0ea189bead64a FOREIGN KEY (obdobje_id) REFERENCES poslovniplanobdobje(id);


--
-- TOC entry 3575 (class 2606 OID 827700)
-- Name: fk_ae395265aa0f25e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY porekloproduktov
    ADD CONSTRAINT fk_ae395265aa0f25e5 FOREIGN KEY (paket_id) REFERENCES paketiproduktov(id);


--
-- TOC entry 3576 (class 2606 OID 827705)
-- Name: fk_ae395265be377a7a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY porekloproduktov
    ADD CONSTRAINT fk_ae395265be377a7a FOREIGN KEY (predajnica_id) REFERENCES postavkamat(id);


--
-- TOC entry 3577 (class 2606 OID 827710)
-- Name: fk_ae395265d627d694; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY porekloproduktov
    ADD CONSTRAINT fk_ae395265d627d694 FOREIGN KEY (nalog_id) REFERENCES pozin(id);


--
-- TOC entry 3651 (class 2606 OID 827715)
-- Name: fk_b0139afb40f9378; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY promo
    ADD CONSTRAINT fk_b0139afb40f9378 FOREIGN KEY (zastoj_id) REFERENCES sifdog(id);


--
-- TOC entry 3652 (class 2606 OID 827720)
-- Name: fk_b0139afb724910f7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY promo
    ADD CONSTRAINT fk_b0139afb724910f7 FOREIGN KEY (izvedba_id) REFERENCES zbirur(id);


--
-- TOC entry 3653 (class 2606 OID 827725)
-- Name: fk_b0139afbbbcda81c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY promo
    ADD CONSTRAINT fk_b0139afbbbcda81c FOREIGN KEY (delavec_id) REFERENCES matt(id);


--
-- TOC entry 3679 (class 2606 OID 827730)
-- Name: fk_b2c24493ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tdok
    ADD CONSTRAINT fk_b2c24493ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenjedokumenta(id);


--
-- TOC entry 3632 (class 2606 OID 827735)
-- Name: fk_b472fe6978e7da2f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poznd
    ADD CONSTRAINT fk_b472fe6978e7da2f FOREIGN KEY (dokument_id) REFERENCES nard(id);


--
-- TOC entry 3633 (class 2606 OID 827740)
-- Name: fk_b472fe69847dc91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poznd
    ADD CONSTRAINT fk_b472fe69847dc91 FOREIGN KEY (maticna_id) REFERENCES matt(id);


--
-- TOC entry 3634 (class 2606 OID 827750)
-- Name: fk_b472fe69d627d694; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poznd
    ADD CONSTRAINT fk_b472fe69d627d694 FOREIGN KEY (nalog_id) REFERENCES pozin(id);


--
-- TOC entry 3635 (class 2606 OID 1738029)
-- Name: fk_b472fe69f04bd6e7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poznd
    ADD CONSTRAINT fk_b472fe69f04bd6e7 FOREIGN KEY (vezarazpis_id) REFERENCES razk(id);


--
-- TOC entry 3582 (class 2606 OID 827755)
-- Name: fk_b70a2839bead64a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplannapoved
    ADD CONSTRAINT fk_b70a2839bead64a FOREIGN KEY (obdobje_id) REFERENCES poslovniplanobdobje(id);


--
-- TOC entry 3583 (class 2606 OID 827760)
-- Name: fk_b70a283b3bc5309; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poslovniplannapoved
    ADD CONSTRAINT fk_b70a283b3bc5309 FOREIGN KEY (narocilo_id) REFERENCES poslovniplannarocilo(id);


--
-- TOC entry 3505 (class 2606 OID 827765)
-- Name: fk_b7229ce169e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce169e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 3506 (class 2606 OID 827770)
-- Name: fk_b7229ce16beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce16beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3646 (class 2606 OID 827775)
-- Name: fk_b84cee078f6fbef0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prikazlokacije
    ADD CONSTRAINT fk_b84cee078f6fbef0 FOREIGN KEY (lokacija_id) REFERENCES lokacije(id);


--
-- TOC entry 3647 (class 2606 OID 827780)
-- Name: fk_b84cee07f6dd3057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prikazlokacije
    ADD CONSTRAINT fk_b84cee07f6dd3057 FOREIGN KEY (zemljevid_id) REFERENCES datoteka(id);


--
-- TOC entry 3527 (class 2606 OID 827785)
-- Name: fk_bd26580220a40e3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matt
    ADD CONSTRAINT fk_bd26580220a40e3b FOREIGN KEY (klasifikacija_id) REFERENCES klas(id);


--
-- TOC entry 3528 (class 2606 OID 827790)
-- Name: fk_bd2658027f8031ce; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matt
    ADD CONSTRAINT fk_bd2658027f8031ce FOREIGN KEY (podklasifikacija_id) REFERENCES klas(id);


--
-- TOC entry 3529 (class 2606 OID 827795)
-- Name: fk_bd265802dbf6a7ed; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matt
    ADD CONSTRAINT fk_bd265802dbf6a7ed FOREIGN KEY (klasdela_id) REFERENCES klas(id);


--
-- TOC entry 3560 (class 2606 OID 827800)
-- Name: fk_c3184107268f8315; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pakiranjeprodukta
    ADD CONSTRAINT fk_c3184107268f8315 FOREIGN KEY (embalaza_id) REFERENCES embalaza(id);


--
-- TOC entry 3561 (class 2606 OID 827805)
-- Name: fk_c318410771efc2b6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pakiranjeprodukta
    ADD CONSTRAINT fk_c318410771efc2b6 FOREIGN KEY (etiketa_id) REFERENCES etikete(id);


--
-- TOC entry 3562 (class 2606 OID 827810)
-- Name: fk_c3184107847dc91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pakiranjeprodukta
    ADD CONSTRAINT fk_c3184107847dc91 FOREIGN KEY (maticna_id) REFERENCES matt(id);


--
-- TOC entry 3496 (class 2606 OID 827815)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 3693 (class 2606 OID 1330470)
-- Name: fk_c48634e733ccfe3d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skladiscenjeizdaja
    ADD CONSTRAINT fk_c48634e733ccfe3d FOREIGN KEY (izhodnidokument_id) REFERENCES postavkamat(id);


--
-- TOC entry 3694 (class 2606 OID 1330475)
-- Name: fk_c48634e76556c896; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skladiscenjeizdaja
    ADD CONSTRAINT fk_c48634e76556c896 FOREIGN KEY (poreklo_id) REFERENCES skladiscenjezaloga(id);


--
-- TOC entry 3495 (class 2606 OID 827820)
-- Name: fk_cc1ac154c8010495; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY izmetpodrobno
    ADD CONSTRAINT fk_cc1ac154c8010495 FOREIGN KEY (izvedbapodrobno_id) REFERENCES promo(id);


--
-- TOC entry 3553 (class 2606 OID 827825)
-- Name: fk_ce31c895633aca59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY operacija_tehen
    ADD CONSTRAINT fk_ce31c895633aca59 FOREIGN KEY (tehen_id) REFERENCES matt(id) ON DELETE CASCADE;


--
-- TOC entry 3554 (class 2606 OID 827830)
-- Name: fk_ce31c895765608e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY operacija_tehen
    ADD CONSTRAINT fk_ce31c895765608e5 FOREIGN KEY (operacija_id) REFERENCES matt(id) ON DELETE CASCADE;


--
-- TOC entry 3563 (class 2606 OID 827835)
-- Name: fk_d2657963d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission_allrole
    ADD CONSTRAINT fk_d2657963d60322ac FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE;


--
-- TOC entry 3564 (class 2606 OID 827840)
-- Name: fk_d2657963fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission_allrole
    ADD CONSTRAINT fk_d2657963fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id) ON DELETE CASCADE;


--
-- TOC entry 3691 (class 2606 OID 827845)
-- Name: fk_d391b244724910f7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zbirur_norme
    ADD CONSTRAINT fk_d391b244724910f7 FOREIGN KEY (izvedba_id) REFERENCES zbirur(id) ON DELETE CASCADE;


--
-- TOC entry 3692 (class 2606 OID 827850)
-- Name: fk_d391b244e06fc29e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zbirur_norme
    ADD CONSTRAINT fk_d391b244e06fc29e FOREIGN KEY (norma_id) REFERENCES norme(id) ON DELETE CASCADE;


--
-- TOC entry 3555 (class 2606 OID 827855)
-- Name: fk_d508232f19f47060; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY paketiproduktov
    ADD CONSTRAINT fk_d508232f19f47060 FOREIGN KEY (alienparent_id) REFERENCES paketiproduktov(id);


--
-- TOC entry 3556 (class 2606 OID 827860)
-- Name: fk_d508232f268f8315; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY paketiproduktov
    ADD CONSTRAINT fk_d508232f268f8315 FOREIGN KEY (embalaza_id) REFERENCES embalaza(id);


--
-- TOC entry 3557 (class 2606 OID 827865)
-- Name: fk_d508232f5dc46e09; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY paketiproduktov
    ADD CONSTRAINT fk_d508232f5dc46e09 FOREIGN KEY (dobava_id) REFERENCES pozizd(id);


--
-- TOC entry 3558 (class 2606 OID 827870)
-- Name: fk_d508232f727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY paketiproduktov
    ADD CONSTRAINT fk_d508232f727aca70 FOREIGN KEY (parent_id) REFERENCES paketiproduktov(id);


--
-- TOC entry 3559 (class 2606 OID 827875)
-- Name: fk_d508232f8f6fbef0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY paketiproduktov
    ADD CONSTRAINT fk_d508232f8f6fbef0 FOREIGN KEY (lokacija_id) REFERENCES lokacije(id);


--
-- TOC entry 3489 (class 2606 OID 827880)
-- Name: fk_d8d0e77771efc2b6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY embalaza
    ADD CONSTRAINT fk_d8d0e77771efc2b6 FOREIGN KEY (etiketa_id) REFERENCES etikete(id);


--
-- TOC entry 3490 (class 2606 OID 827885)
-- Name: fk_d8d0e777727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY embalaza
    ADD CONSTRAINT fk_d8d0e777727aca70 FOREIGN KEY (parent_id) REFERENCES embalaza(id);


--
-- TOC entry 3491 (class 2606 OID 827890)
-- Name: fk_d8d0e777847dc91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY embalaza
    ADD CONSTRAINT fk_d8d0e777847dc91 FOREIGN KEY (maticna_id) REFERENCES matt(id);


--
-- TOC entry 3492 (class 2606 OID 827895)
-- Name: fk_d8d0e777a0320d72; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY embalaza
    ADD CONSTRAINT fk_d8d0e777a0320d72 FOREIGN KEY (pakiranje_id) REFERENCES pakiranjeprodukta(id);


--
-- TOC entry 3509 (class 2606 OID 827900)
-- Name: fk_dd92bc132819adf6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kost
    ADD CONSTRAINT fk_dd92bc132819adf6 FOREIGN KEY (kos_id) REFERENCES koso(id);


--
-- TOC entry 3510 (class 2606 OID 827905)
-- Name: fk_dd92bc13633aca59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kost
    ADD CONSTRAINT fk_dd92bc13633aca59 FOREIGN KEY (tehen_id) REFERENCES matt(id);


--
-- TOC entry 3511 (class 2606 OID 827910)
-- Name: fk_dd92bc13765608e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kost
    ADD CONSTRAINT fk_dd92bc13765608e5 FOREIGN KEY (operacija_id) REFERENCES matt(id);


--
-- TOC entry 3512 (class 2606 OID 827915)
-- Name: fk_dd92bc13a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kost
    ADD CONSTRAINT fk_dd92bc13a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 3513 (class 2606 OID 827920)
-- Name: fk_dd92bc13bbcda81c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kost
    ADD CONSTRAINT fk_dd92bc13bbcda81c FOREIGN KEY (delavec_id) REFERENCES matt(id);


--
-- TOC entry 3532 (class 2606 OID 827925)
-- Name: fk_e47e400e4ce26053; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nard
    ADD CONSTRAINT fk_e47e400e4ce26053 FOREIGN KEY (dok_id) REFERENCES tdok(id);


--
-- TOC entry 3533 (class 2606 OID 827930)
-- Name: fk_e47e400e78c07e7c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nard
    ADD CONSTRAINT fk_e47e400e78c07e7c FOREIGN KEY (valuta_id) REFERENCES valuta(id);


--
-- TOC entry 3534 (class 2606 OID 827935)
-- Name: fk_e47e400ea233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nard
    ADD CONSTRAINT fk_e47e400ea233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 3535 (class 2606 OID 827940)
-- Name: fk_e47e400ea6c3fc6b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nard
    ADD CONSTRAINT fk_e47e400ea6c3fc6b FOREIGN KEY (prejemnik_id) REFERENCES popa(id);


--
-- TOC entry 3536 (class 2606 OID 827945)
-- Name: fk_e47e400eaebac2d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nard
    ADD CONSTRAINT fk_e47e400eaebac2d4 FOREIGN KEY (naslovklienta_id) REFERENCES postninaslovi(id);


--
-- TOC entry 3537 (class 2606 OID 827955)
-- Name: fk_e47e400eba837808; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nard
    ADD CONSTRAINT fk_e47e400eba837808 FOREIGN KEY (kontaktna_id) REFERENCES kose(id);


--
-- TOC entry 3538 (class 2606 OID 827960)
-- Name: fk_e47e400eee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nard
    ADD CONSTRAINT fk_e47e400eee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 3539 (class 2606 OID 827965)
-- Name: fk_e47e400efb9bda2b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nard
    ADD CONSTRAINT fk_e47e400efb9bda2b FOREIGN KEY (naslovprejemnika_id) REFERENCES postninaslovi(id);


--
-- TOC entry 3519 (class 2606 OID 827970)
-- Name: fk_e4daf1e55b51032f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lokacije_lastnosti
    ADD CONSTRAINT fk_e4daf1e55b51032f FOREIGN KEY (lastnostlokacije_id) REFERENCES lastnostlokacije(id) ON DELETE CASCADE;


--
-- TOC entry 3520 (class 2606 OID 827975)
-- Name: fk_e4daf1e58f6fbef0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lokacije_lastnosti
    ADD CONSTRAINT fk_e4daf1e58f6fbef0 FOREIGN KEY (lokacija_id) REFERENCES lokacije(id) ON DELETE CASCADE;


--
-- TOC entry 3497 (class 2606 OID 827980)
-- Name: fk_e629e1eba54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job_datoteka
    ADD CONSTRAINT fk_e629e1eba54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id) ON DELETE CASCADE;


--
-- TOC entry 3498 (class 2606 OID 827985)
-- Name: fk_e629e1ebbe04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job_datoteka
    ADD CONSTRAINT fk_e629e1ebbe04ea9 FOREIGN KEY (job_id) REFERENCES job(id) ON DELETE CASCADE;


--
-- TOC entry 3551 (class 2606 OID 827990)
-- Name: fk_e7d503af5827c206; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nastavni_sklopi
    ADD CONSTRAINT fk_e7d503af5827c206 FOREIGN KEY (sklop_id) REFERENCES matt(id) ON DELETE CASCADE;


--
-- TOC entry 3552 (class 2606 OID 827995)
-- Name: fk_e7d503afbfa2c7ec; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nastavni_sklopi
    ADD CONSTRAINT fk_e7d503afbfa2c7ec FOREIGN KEY (nastavni_id) REFERENCES nasl(id) ON DELETE CASCADE;


--
-- TOC entry 3664 (class 2606 OID 828020)
-- Name: fk_e9d6f8feed49ce4d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role_role
    ADD CONSTRAINT fk_e9d6f8feed49ce4d FOREIGN KEY (role_target) REFERENCES role(id) ON DELETE CASCADE;


--
-- TOC entry 3665 (class 2606 OID 828025)
-- Name: fk_e9d6f8fef4ac9ec2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role_role
    ADD CONSTRAINT fk_e9d6f8fef4ac9ec2 FOREIGN KEY (role_source) REFERENCES role(id) ON DELETE CASCADE;


--
-- TOC entry 3640 (class 2606 OID 828030)
-- Name: fk_f08cdc27755d8926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pozpk
    ADD CONSTRAINT fk_f08cdc27755d8926 FOREIGN KEY (kalkulacija_id) REFERENCES kalkkoso(id);


--
-- TOC entry 3641 (class 2606 OID 828035)
-- Name: fk_f08cdc2778e7da2f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pozpk
    ADD CONSTRAINT fk_f08cdc2778e7da2f FOREIGN KEY (dokument_id) REFERENCES ponk(id);


--
-- TOC entry 3642 (class 2606 OID 828040)
-- Name: fk_f08cdc27847dc91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pozpk
    ADD CONSTRAINT fk_f08cdc27847dc91 FOREIGN KEY (maticna_id) REFERENCES matt(id);


--
-- TOC entry 3474 (class 2606 OID 1810900)
-- Name: fk_f1827b3078e7da2f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY checklistvzorecpostavka
    ADD CONSTRAINT fk_f1827b3078e7da2f FOREIGN KEY (dokument_id) REFERENCES checklistvzorec(id);


--
-- TOC entry 3548 (class 2606 OID 828050)
-- Name: fk_f3bef97d633aca59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nasl
    ADD CONSTRAINT fk_f3bef97d633aca59 FOREIGN KEY (tehen_id) REFERENCES matt(id);


--
-- TOC entry 3549 (class 2606 OID 828055)
-- Name: fk_f3bef97d847dc91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nasl
    ADD CONSTRAINT fk_f3bef97d847dc91 FOREIGN KEY (maticna_id) REFERENCES matt(id);


--
-- TOC entry 3550 (class 2606 OID 828060)
-- Name: fk_f3bef97de25462bb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nasl
    ADD CONSTRAINT fk_f3bef97de25462bb FOREIGN KEY (oper_id) REFERENCES matt(id);


-- Completed on 2015-03-23 14:18:58 CET

--
-- PostgreSQL database dump complete
--

