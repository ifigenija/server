--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-01 10:37:30 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 242 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2990 (class 0 OID 0)
-- Dependencies: 242
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 16756288)
-- Name: abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE abonma (
    id uuid NOT NULL,
    stpredstav integer,
    stkuponov integer,
    ime character varying(40) DEFAULT NULL::character varying,
    opis text,
    kapaciteta integer
);


--
-- TOC entry 224 (class 1259 OID 16756802)
-- Name: alternacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alternacija (
    id uuid NOT NULL,
    funkcija_id uuid,
    zaposlitev_id uuid,
    oseba_id uuid,
    pogodba_id uuid,
    sifra character varying(255) NOT NULL,
    zaposlen boolean,
    zacetek date,
    konec date,
    opomba text,
    sort integer,
    privzeti boolean,
    aktivna boolean,
    imapogodbo boolean,
    pomembna boolean
);


--
-- TOC entry 223 (class 1259 OID 16756785)
-- Name: arhivalija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE arhivalija (
    id uuid NOT NULL,
    dogodek_id uuid,
    uprizoritev_id uuid,
    oznakadatuma character varying(255) DEFAULT NULL::character varying,
    datum date,
    fizicnaoblika character varying(255) DEFAULT NULL::character varying,
    izvordigitalizata character varying(255) DEFAULT NULL::character varying,
    povzetek text,
    opombe text,
    lokacijaoriginala character varying(255) DEFAULT NULL::character varying,
    objavljeno character varying(255) DEFAULT NULL::character varying,
    naslov character varying(255) DEFAULT NULL::character varying,
    avtorstvo character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 217 (class 1259 OID 16756695)
-- Name: besedilo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE besedilo (
    id uuid NOT NULL,
    stevilka character varying(255) NOT NULL,
    naslov character varying(255) DEFAULT NULL::character varying,
    avtor character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    jezik character varying(255) DEFAULT NULL::character varying,
    naslovizvirnika character varying(255) DEFAULT NULL::character varying,
    internacionalninaslov character varying(255) DEFAULT NULL::character varying,
    datumprejema date,
    moskevloge integer,
    zenskevloge integer,
    prevajalec character varying(255) DEFAULT NULL::character varying,
    povzetekvsebine text,
    letoizida integer,
    krajizida character varying(255) DEFAULT NULL::character varying,
    zaloznik character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 16757051)
-- Name: datoteka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datoteka (
    id uuid NOT NULL,
    owner_id uuid,
    filename character varying(255) DEFAULT NULL::character varying,
    transfers integer NOT NULL,
    size integer,
    format character varying(255) DEFAULT NULL::character varying,
    hash uuid,
    createdat timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    uploadedat timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 193 (class 1259 OID 16756466)
-- Name: dogodek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodek (
    id uuid NOT NULL,
    predstava_id uuid,
    zasedenost_id uuid,
    vaja_id uuid,
    gostovanje_id uuid,
    dogodek_splosni_id uuid,
    prostor_id uuid,
    sezona_id uuid,
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    allday boolean DEFAULT false NOT NULL,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(20) DEFAULT NULL::character varying,
    razred character varying(10) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 16705983)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 195 (class 1259 OID 16756497)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 16756953)
-- Name: drugivir; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE drugivir (
    id uuid NOT NULL,
    znesek numeric(15,2) DEFAULT 0::numeric NOT NULL,
    opis character varying(255) NOT NULL,
    mednarodni boolean,
    enotaprograma_id uuid
);


--
-- TOC entry 188 (class 1259 OID 16756409)
-- Name: drza; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE drza (
    id uuid NOT NULL,
    sifra character varying(2) DEFAULT NULL::character varying,
    sifradolg character varying(3) DEFAULT NULL::character varying,
    isonum character varying(3) DEFAULT NULL::character varying,
    isonaziv character varying(50) DEFAULT NULL::character varying,
    naziv character varying(50) DEFAULT NULL::character varying,
    opomba text
);


--
-- TOC entry 225 (class 1259 OID 16756815)
-- Name: enotaprograma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE enotaprograma (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    program_dela_id uuid,
    gostitelj_id uuid,
    celotnavrednost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    nasdelez numeric(15,2) DEFAULT 0::numeric NOT NULL,
    celotnavrednostmat numeric(15,2) DEFAULT 0::numeric NOT NULL,
    celotnavrednostgostovsz numeric(15,2) DEFAULT 0::numeric NOT NULL,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    avtorskihonorarji numeric(15,2) DEFAULT 0::numeric NOT NULL,
    avtorskihonorarjisamoz numeric(15,2) DEFAULT 0::numeric NOT NULL,
    tantieme numeric(15,2) DEFAULT 0::numeric NOT NULL,
    avtorskepravice numeric(15,2) DEFAULT 0::numeric NOT NULL,
    materialni numeric(15,2) DEFAULT 0::numeric NOT NULL,
    imakoprodukcije boolean,
    vlozekgostitelja numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugijavni numeric(15,2) DEFAULT 0::numeric NOT NULL,
    stzaposlenih integer DEFAULT 0 NOT NULL,
    stzaposumet integer DEFAULT 0 NOT NULL,
    stzaposdrug integer DEFAULT 0 NOT NULL,
    sthonorarnih integer,
    sthonorarnihigr integer,
    sthonorarnihigrtujjz integer,
    sthonorarnihigrsamoz integer,
    obiskdoma integer DEFAULT 0 NOT NULL,
    obiskkopr integer DEFAULT 0 NOT NULL,
    obiskgost integer DEFAULT 0 NOT NULL,
    obiskzamejo integer DEFAULT 0 NOT NULL,
    obiskint integer DEFAULT 0 NOT NULL,
    obiskkoprint integer DEFAULT 0 NOT NULL,
    ponovidoma integer DEFAULT 0 NOT NULL,
    ponovikopr integer DEFAULT 0 NOT NULL,
    ponovizamejo integer DEFAULT 0 NOT NULL,
    ponovigost integer DEFAULT 0 NOT NULL,
    ponovikoprint integer DEFAULT 0 NOT NULL,
    ponoviint integer DEFAULT 0 NOT NULL,
    naziv character varying(50) DEFAULT NULL::character varying,
    kpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    sort integer,
    tipprogramskeenote_id uuid,
    tip character varying(20) NOT NULL,
    strosekodkpred numeric(15,2) DEFAULT 0::numeric,
    stroskiostali numeric(15,2) DEFAULT 0::numeric,
    krajgostovanja character varying(255) DEFAULT NULL::character varying,
    ustanova character varying(255) DEFAULT NULL::character varying,
    datumgostovanja date,
    transportnistroski numeric(15,2) DEFAULT NULL::numeric,
    dnevprvzad numeric(15,2) DEFAULT NULL::numeric,
    drzavagostovanja_id uuid,
    stpe integer DEFAULT 0,
    zvrst character varying(255) DEFAULT NULL::character varying,
    stpredstav integer,
    stokroglihmiz integer,
    stpredstavitev integer,
    stdelavnic integer,
    stdrugidogodki integer,
    stprodukcij integer,
    caspriprave character varying(255) DEFAULT NULL::character varying,
    casizvedbe character varying(255) DEFAULT NULL::character varying,
    prizorisca text,
    umetvodja character varying(255) DEFAULT NULL::character varying,
    programskotelo character varying(255) DEFAULT NULL::character varying,
    sttujihselektorjev integer
);


--
-- TOC entry 211 (class 1259 OID 16756630)
-- Name: funkcija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE funkcija (
    id uuid NOT NULL,
    uprizoritev_id uuid NOT NULL,
    alternacija_id uuid,
    podrocje character varying(20) DEFAULT NULL::character varying,
    vodjaekipe boolean,
    naziv character varying(255) DEFAULT NULL::character varying,
    komentar character varying(255) DEFAULT NULL::character varying,
    velikost character varying(255) DEFAULT NULL::character varying,
    pomembna boolean NOT NULL,
    sort integer,
    seplanira boolean NOT NULL,
    dovoliprekrivanje boolean NOT NULL,
    maxprekrivanj integer,
    tipfunkcije_id uuid
);


--
-- TOC entry 191 (class 1259 OID 16756445)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean,
    kraj character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 170 (class 1259 OID 16705977)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 189 (class 1259 OID 16756426)
-- Name: kontaktnaoseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kontaktnaoseba (
    id uuid NOT NULL,
    popa_id uuid,
    oseba_id uuid,
    status character varying(20) DEFAULT NULL::character varying,
    funkcija character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 200 (class 1259 OID 16756544)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 16757032)
-- Name: mapa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa (
    id uuid NOT NULL,
    lastnik_id uuid,
    parent_id uuid,
    ime character varying(200) NOT NULL,
    komentar text,
    caskreiranja timestamp(0) without time zone NOT NULL,
    casspremembe timestamp(0) without time zone NOT NULL,
    javnidostop character varying(20) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 239 (class 1259 OID 16757044)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 16757066)
-- Name: mapaacl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapaacl (
    id uuid NOT NULL,
    mapa_id uuid,
    perm_id uuid,
    dostop character varying(20) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 204 (class 1259 OID 16756569)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 186 (class 1259 OID 16756383)
-- Name: option; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE option (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(20) DEFAULT NULL::character varying,
    defaultvalue text,
    peruser boolean DEFAULT true,
    readonly boolean,
    public boolean,
    role character varying(255) DEFAULT NULL::character varying,
    description text
);


--
-- TOC entry 180 (class 1259 OID 16756297)
-- Name: optionvalue; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE optionvalue (
    id uuid NOT NULL,
    option_id uuid,
    user_id uuid,
    value text,
    global boolean DEFAULT false
);


--
-- TOC entry 181 (class 1259 OID 16756308)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
    naslov_id uuid,
    sifra character varying(4) NOT NULL,
    naziv character varying(40) DEFAULT NULL::character varying,
    ime character varying(255) DEFAULT NULL::character varying,
    priimek character varying(255) DEFAULT NULL::character varying,
    funkcija character varying(40) DEFAULT NULL::character varying,
    srednjeime character varying(255) DEFAULT NULL::character varying,
    polnoime character varying(255) DEFAULT NULL::character varying,
    psevdonim character varying(255) DEFAULT NULL::character varying,
    email character varying(40) DEFAULT NULL::character varying,
    datumrojstva date,
    emso character varying(255) DEFAULT NULL::character varying,
    davcna character varying(255) DEFAULT NULL::character varying,
    spol character varying(1) DEFAULT NULL::character varying,
    opombe text,
    drzavljanstvo character varying(255) DEFAULT NULL::character varying,
    drzavarojstva character varying(255) DEFAULT NULL::character varying,
    krajrojstva character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 176 (class 1259 OID 16756262)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 16756281)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 16756576)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 16756610)
-- Name: podrocjesedenja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE podrocjesedenja (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    kapaciteta integer,
    templateplaceholder character varying(20) DEFAULT NULL::character varying,
    barva character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 220 (class 1259 OID 16756734)
-- Name: pogodba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pogodba (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    trr_id uuid,
    sifra character varying(7) NOT NULL,
    zacetek date,
    konec date,
    placilonavajo boolean,
    vrednostvaje numeric(12,2) DEFAULT NULL::numeric,
    planiranostevilovaj integer,
    vrednostvaj numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    vrednostdopremiere numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    zaposlenvdrjz boolean,
    samozaposlen boolean,
    igralec boolean,
    opis text
);


--
-- TOC entry 183 (class 1259 OID 16756341)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    sifra character varying(4) NOT NULL,
    stakli character varying(2) DEFAULT NULL::character varying,
    naziv character varying(60) NOT NULL,
    naziv1 character varying(60) DEFAULT NULL::character varying,
    panoga character varying(60) DEFAULT NULL::character varying,
    email character varying(50) DEFAULT NULL::character varying,
    url character varying(100) DEFAULT NULL::character varying,
    opomba text,
    idddv character varying(18) DEFAULT NULL::character varying,
    maticna character varying(20) DEFAULT NULL::character varying,
    zavezanec character varying(1) DEFAULT NULL::character varying,
    jeeu character varying(1) DEFAULT NULL::character varying,
    datzav date,
    datnzav date,
    zamejstvo boolean,
    nvo boolean
);


--
-- TOC entry 185 (class 1259 OID 16756375)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 16756550)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 184 (class 1259 OID 16756360)
-- Name: postninaslovi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postninaslovi (
    id uuid NOT NULL,
    klient_id uuid,
    oseba_id uuid,
    drzava_id uuid,
    naziv character varying(50) DEFAULT NULL::character varying,
    nazivdva character varying(50) DEFAULT NULL::character varying,
    ulica character varying(50) DEFAULT NULL::character varying,
    ulicadva character varying(50) DEFAULT NULL::character varying,
    posta character varying(50) DEFAULT NULL::character varying,
    postanaziv character varying(50) DEFAULT NULL::character varying,
    pokrajina character varying(50) DEFAULT NULL::character varying,
    jeeu boolean,
    privzeti boolean
);


--
-- TOC entry 190 (class 1259 OID 16756438)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 203 (class 1259 OID 16756562)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 16756914)
-- Name: produkcijadelitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijadelitev (
    id uuid NOT NULL,
    koproducent_id uuid NOT NULL,
    odstotekfinanciranja numeric(15,2) DEFAULT NULL::numeric,
    delez numeric(15,2) DEFAULT NULL::numeric,
    maticnikop boolean NOT NULL,
    kpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    enotaprograma_id uuid
);


--
-- TOC entry 228 (class 1259 OID 16756924)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 16756870)
-- Name: programdela; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programdela (
    id uuid NOT NULL,
    sezona_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    zacetek date NOT NULL,
    konec date NOT NULL,
    zakljuceno boolean NOT NULL,
    potrjenprogram boolean NOT NULL,
    stpremier integer,
    stint integer,
    stfest integer,
    strazno integer,
    stizjem integer,
    stponprem integer,
    stponprej integer,
    stponprejvelikih integer,
    stponprejmalih integer,
    stponprejmalihkopr integer,
    stponprejsredkopr integer,
    stponprejvelikihkopr integer,
    stgostujo integer,
    vrps1 numeric(12,2) DEFAULT NULL::numeric,
    vrps1do numeric(12,2) DEFAULT NULL::numeric,
    vrps1mat numeric(12,2) DEFAULT NULL::numeric,
    vrps1gostovsz numeric(12,2) DEFAULT NULL::numeric,
    stizvnekomerc integer,
    stizvprem integer,
    stizvponprem integer,
    stizvponpremdoma integer,
    stizvponpremzamejo integer,
    stizvponpremgost integer,
    stizvponpremkopr integer,
    stizvponpremint integer,
    stizvponpremkoprint integer,
    stizvponprej integer,
    stizvponprejdoma integer,
    stizvponprejzamejo integer,
    stizvponprejgost integer,
    stizvponprejkopr integer,
    stizvponprejint integer,
    stizvponprejkoprint integer,
    stizvgostuj integer,
    stizvostalihnek integer,
    stizvgostovanjslo integer,
    stizvgostovanjzam integer,
    stizvgostovanjint integer,
    stobisknekom integer,
    stobisknekommat integer,
    stobisknekomgostslo integer,
    stobisknekomgostzam integer,
    stobisknekomgostint integer,
    stobiskprem integer,
    stobiskponprem integer,
    stobiskponpremdoma integer,
    stobiskponpremkopr integer,
    stobiskponpremkoprint integer,
    stobiskponpremgost integer,
    stobiskponpremzamejo integer,
    stobiskponpremint integer,
    avgobiskprired numeric(12,2) DEFAULT NULL::numeric,
    avgzaseddvoran numeric(12,2) DEFAULT NULL::numeric,
    avgcenavstopnice numeric(12,2) DEFAULT NULL::numeric,
    stprodvstopnic integer,
    stkoprodukcij integer,
    stkoprodukcijint integer,
    stkoprodukcijnvo integer,
    stzaposlenih integer,
    stzaposigralcev integer,
    avgstnastopovigr numeric(12,2) DEFAULT NULL::numeric,
    sthonorarnih integer,
    sthonorarnihigr integer,
    sthonorarnihigrtujjz integer,
    sthonorarnihigrsamoz integer,
    sredstvaint numeric(12,2) DEFAULT NULL::numeric,
    sredstvaavt numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenoprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenoponprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenoponprej numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenogostujo numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenoint numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenofest numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenorazno numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenoizjem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavniprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavniponprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavniponprej numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavnigostujo numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavniint numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavnifest numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavnirazno numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavniizjem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugiviriprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugiviriponprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugiviriponprej numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugivirigostujo numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugiviriint numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugivirifest numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugivirirazno numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugiviriizjem numeric(12,2) DEFAULT NULL::numeric,
    sredstvaavtsamoz numeric(12,2) DEFAULT NULL::numeric
);


--
-- TOC entry 229 (class 1259 OID 16756932)
-- Name: programskaenotasklopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programskaenotasklopa (
    id uuid NOT NULL,
    naslovpe character varying(255) NOT NULL,
    avtorpe character varying(255) NOT NULL,
    obsegpe character varying(255) NOT NULL,
    mesecpe character varying(255) NOT NULL,
    vrednostpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    programrazno_id uuid
);


--
-- TOC entry 207 (class 1259 OID 16756591)
-- Name: prostor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prostor (
    id uuid NOT NULL,
    popa_id uuid,
    naslov_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    jeprizorisce boolean,
    seplanira boolean DEFAULT false NOT NULL,
    kapaciteta integer,
    opis text
);


--
-- TOC entry 199 (class 1259 OID 16756535)
-- Name: racun; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE racun (
    id uuid NOT NULL,
    kupec_id uuid,
    prodaja_predstave_id uuid,
    nacin_placina_id uuid NOT NULL,
    placilni_instrument_id uuid
);


--
-- TOC entry 198 (class 1259 OID 16756525)
-- Name: razpisansedez; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE razpisansedez (
    id uuid NOT NULL,
    postavka_racuna_id uuid NOT NULL,
    sedez_id uuid,
    prodaja_predstave_id uuid,
    rezervacija_id uuid,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 16756723)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 16756662)
-- Name: rekviziterstvo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekviziterstvo (
    id uuid NOT NULL,
    rekvizit_id uuid,
    uprizoritev_id uuid,
    namenuporabe boolean,
    opispostavitve text
);


--
-- TOC entry 173 (class 1259 OID 16756233)
-- Name: revizije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE revizije (
    id integer NOT NULL,
    razred character varying(100) NOT NULL,
    objectid uuid,
    upor uuid,
    datum timestamp(0) without time zone NOT NULL,
    tip character varying(3) NOT NULL,
    data text NOT NULL
);


--
-- TOC entry 172 (class 1259 OID 16756231)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 208 (class 1259 OID 16756604)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 16756271)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 16756255)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 16756618)
-- Name: sedez; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedez (
    id uuid NOT NULL,
    vrsta_id uuid NOT NULL,
    sedezni_red_id uuid,
    podrocja_sedenja_id uuid,
    stevilka character varying(3) DEFAULT NULL::character varying,
    oznaka character varying(60) DEFAULT NULL::character varying,
    kakovost character varying(20) DEFAULT NULL::character varying,
    koordinatax integer,
    koordinatay integer,
    barva character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 16756556)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 196 (class 1259 OID 16756502)
-- Name: sezona; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sezona (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    zacetek date,
    konec date,
    aktivna boolean
);


--
-- TOC entry 234 (class 1259 OID 16756973)
-- Name: stevilcenje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenje (
    id uuid NOT NULL,
    sifra character varying(8) DEFAULT NULL::character varying,
    naziv character varying(100) DEFAULT NULL::character varying,
    prefix character varying(5) DEFAULT NULL::character varying,
    suffix character varying(5) DEFAULT NULL::character varying,
    zacetek integer,
    dolzina integer,
    format character varying(20) DEFAULT NULL::character varying,
    globalno boolean,
    poletih boolean
);


--
-- TOC entry 233 (class 1259 OID 16756965)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 16756960)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 215 (class 1259 OID 16756672)
-- Name: strosekuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE strosekuprizoritve (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    popa_id uuid,
    naziv character varying(255) DEFAULT NULL::character varying,
    vrednostdo numeric(15,2) DEFAULT NULL::numeric,
    vrednostna numeric(15,2) DEFAULT NULL::numeric,
    opis text,
    tipstroska character varying(10) NOT NULL,
    sort integer,
    vrstastroska_id uuid
);


--
-- TOC entry 182 (class 1259 OID 16756333)
-- Name: telefonska; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE telefonska (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    vrsta character varying(20) NOT NULL,
    stevilka character varying(30) DEFAULT NULL::character varying,
    privzeta boolean
);


--
-- TOC entry 197 (class 1259 OID 16756512)
-- Name: terminstoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE terminstoritve (
    id uuid NOT NULL,
    dogodek_id uuid,
    alternacija_id uuid,
    oseba_id uuid NOT NULL,
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    planirankonec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    planiranotraja numeric(15,2) DEFAULT NULL::numeric
);


--
-- TOC entry 218 (class 1259 OID 16756712)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis text,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 16756942)
-- Name: tipprogramskeenote; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipprogramskeenote (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    koprodukcija boolean DEFAULT false NOT NULL,
    maxfaktor numeric(15,2) DEFAULT 1::numeric NOT NULL,
    maxvsi numeric(15,2) DEFAULT 0::numeric NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 16756395)
-- Name: trr; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE trr (
    id uuid NOT NULL,
    popa_id uuid,
    oseba_id uuid,
    stevilka character varying(255) DEFAULT NULL::character varying,
    swift character varying(255) DEFAULT NULL::character varying,
    bic character varying(255) DEFAULT NULL::character varying,
    banka character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 174 (class 1259 OID 16756242)
-- Name: uporabniki; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE uporabniki (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    password character varying(90) DEFAULT NULL::character varying,
    enabled boolean,
    expires date,
    defaultroute character varying(255) DEFAULT NULL::character varying,
    defaultrouteparams character varying(255) DEFAULT NULL::character varying,
    email character varying(255) NOT NULL,
    lastlogon date,
    passresttoken character varying(255) DEFAULT NULL::character varying,
    tokenexpires timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 222 (class 1259 OID 16756760)
-- Name: uprizoritev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE uprizoritev (
    id uuid NOT NULL,
    besedilo_id uuid,
    zvrst_uprizoritve_id uuid,
    zvrst_surs_id uuid,
    producent_id uuid,
    sifra character varying(255) NOT NULL,
    faza character varying(35) DEFAULT NULL::character varying,
    naslov character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    delovninaslov character varying(255) DEFAULT NULL::character varying,
    internacionalninaslov character varying(255) DEFAULT NULL::character varying,
    naslovizvirnika character varying(255) DEFAULT NULL::character varying,
    podnaslovizvirnika character varying(255) DEFAULT NULL::character varying,
    datumzacstudija date,
    stevilovaj integer,
    planiranostevilovaj integer,
    datumpremiere date,
    stodmorov integer,
    avtor character varying(255) DEFAULT NULL::character varying,
    gostujoca boolean,
    trajanje integer,
    opis text,
    arhident character varying(255) DEFAULT NULL::character varying,
    arhopomba character varying(255) DEFAULT NULL::character varying,
    datumzakljucka date,
    sloavtor boolean,
    krstna boolean,
    prvaslovenska boolean,
    kratkinaslov character varying(255) DEFAULT NULL::character varying,
    maticnioder_id uuid
);


--
-- TOC entry 192 (class 1259 OID 16756456)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 206 (class 1259 OID 16756583)
-- Name: vrstasedezev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vrstasedezev (
    id uuid NOT NULL,
    podrocja_sedenja_id uuid NOT NULL,
    kapaciteta integer,
    poravnava character varying(255) DEFAULT NULL::character varying,
    oblika character varying(2) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 16756686)
-- Name: vrstastroska; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vrstastroska (
    id uuid NOT NULL,
    skupina integer NOT NULL,
    podskupina integer,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 236 (class 1259 OID 16757012)
-- Name: vrstazapisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vrstazapisa (
    id uuid NOT NULL,
    oznaka character varying(10) NOT NULL,
    naziv character varying(255) NOT NULL,
    aktiven boolean,
    znacka boolean,
    ikona character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 235 (class 1259 OID 16756984)
-- Name: zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zapis (
    id uuid NOT NULL,
    vrsta_id uuid,
    datoteka_id uuid,
    mapa_id uuid,
    avtor_id uuid,
    zaklenil_id uuid,
    tip character varying(20) NOT NULL,
    zaklenjen boolean,
    datumzaklepanja timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    identifier character varying(20) DEFAULT NULL::character varying,
    subject character varying(255) DEFAULT NULL::character varying,
    title character varying(255) NOT NULL,
    description text,
    coverage character varying(255) DEFAULT NULL::character varying,
    creator character varying(255) DEFAULT NULL::character varying,
    language character varying(20) DEFAULT NULL::character varying,
    date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    publisher character varying(255) DEFAULT NULL::character varying,
    relation character varying(255) DEFAULT NULL::character varying,
    rights character varying(255) DEFAULT NULL::character varying,
    source character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    standard character varying(255) DEFAULT NULL::character varying,
    lokacija character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 237 (class 1259 OID 16757024)
-- Name: zapislastnik; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zapislastnik (
    id uuid NOT NULL,
    zapis_id uuid,
    lastnik uuid NOT NULL,
    classlastnika character varying(200) NOT NULL,
    datum timestamp(0) without time zone NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 213 (class 1259 OID 16756655)
-- Name: zaposlitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zaposlitev (
    id uuid NOT NULL,
    oseba_id uuid,
    sifra character varying(10) NOT NULL,
    status character varying(10) NOT NULL,
    zacetek date,
    konec date,
    tip integer,
    delovnaobveza integer,
    malica character varying(255) DEFAULT NULL::character varying,
    izmenskodelo boolean,
    individualnapogodba boolean,
    jezaposlenvdrugemjz boolean,
    jenastopajoci boolean
);


--
-- TOC entry 194 (class 1259 OID 16756492)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 16756750)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 212 (class 1259 OID 16756645)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2179 (class 2604 OID 16756236)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2921 (class 0 OID 16756288)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 16756802)
-- Dependencies: 224
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55e5-63c8-1086-f1661ac8f145	000d0000-55e5-63c8-ae32-637ad1038994	\N	00090000-55e5-63c8-a214-1b30e465ff12	000b0000-55e5-63c8-997a-344bc75510bf	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55e5-63c8-155a-aef50c1aca5c	000d0000-55e5-63c8-724f-76502773bd96	00100000-55e5-63c8-d62e-8f7ec683dbdf	00090000-55e5-63c8-f94f-a8194306b799	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55e5-63c8-6b9f-a3b932b5fd91	000d0000-55e5-63c8-a568-987f23da0b17	00100000-55e5-63c8-96c1-569da93df869	00090000-55e5-63c8-cb75-a9da9ecdd645	\N	0003	t	\N	2015-09-01	\N	2	\N	\N	f	f
000c0000-55e5-63c8-868e-10434dfdf497	000d0000-55e5-63c8-2c00-44ab78b0eaf0	\N	00090000-55e5-63c8-e17b-08bd3a0d1782	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55e5-63c8-42f0-1a28cea2430d	000d0000-55e5-63c8-c857-5e3f9bbfd5a1	\N	00090000-55e5-63c8-2ba3-21840c69a986	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55e5-63c8-2f4d-75605ea4fa7f	000d0000-55e5-63c8-18f9-f0d298c607f2	\N	00090000-55e5-63c8-c62c-d3a052a0e46d	000b0000-55e5-63c8-8d5c-2a7c0f5d728c	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55e5-63c8-bab3-ba43da08c850	000d0000-55e5-63c8-958c-5d7eb5ef3a72	00100000-55e5-63c8-dd70-dcc5a81fe758	00090000-55e5-63c8-ca6e-a427aa34c861	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55e5-63c8-ceab-d0152a563c4f	000d0000-55e5-63c8-fd47-6b0dcb785b81	\N	00090000-55e5-63c8-5267-b9655ae55c4d	000b0000-55e5-63c8-07df-4c60a064d4c3	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55e5-63c8-a749-88ee49c5b9e9	000d0000-55e5-63c8-958c-5d7eb5ef3a72	00100000-55e5-63c8-248d-fee33d63350b	00090000-55e5-63c8-9212-31aa7c6d64f1	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55e5-63c8-0f60-7434c62bdaac	000d0000-55e5-63c8-958c-5d7eb5ef3a72	00100000-55e5-63c8-cbc6-882310c3739d	00090000-55e5-63c8-e12b-2cbf4fd3dffa	\N	0010	t	\N	2015-09-01	\N	16	\N	\N	f	t
000c0000-55e5-63c8-76d1-b0387b9f36c8	000d0000-55e5-63c8-958c-5d7eb5ef3a72	00100000-55e5-63c8-d0ac-ee0d84bbf8b3	00090000-55e5-63c8-4637-7446de6c7128	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2965 (class 0 OID 16756785)
-- Dependencies: 223
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 16756695)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55e5-63c8-005e-5f4b34cb128a	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55e5-63c8-cd2b-2692788f06b1	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55e5-63c8-092c-34b204e6ff7e	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2982 (class 0 OID 16757051)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 16756466)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55e5-63c8-a540-fc7bfbf9321a	\N	\N	00200000-55e5-63c8-f9e8-e6c85a234bbd	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55e5-63c8-e0d0-1c779da327b7	\N	\N	00200000-55e5-63c8-bf42-97c4f15c4c0b	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55e5-63c8-3642-cc4bd3e76309	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55e5-63c8-54fc-ce78c5c59f0b	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55e5-63c8-9efd-07d751ae3f63	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2913 (class 0 OID 16705983)
-- Dependencies: 171
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 16756497)
-- Dependencies: 195
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 16756953)
-- Dependencies: 231
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 16756409)
-- Dependencies: 188
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55e5-63c6-3d79-d08d94236a85	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55e5-63c6-c6ac-a3b9cab5f6d5	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55e5-63c6-4da9-5a6e17cbf4a7	AL	ALB	008	Albania 	Albanija	\N
00040000-55e5-63c6-7a03-1faf93be2417	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55e5-63c6-c541-a6d9043ef4ff	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55e5-63c6-8c04-35cb89d7a4ea	AD	AND	020	Andorra 	Andora	\N
00040000-55e5-63c6-3a81-47d5784a82e9	AO	AGO	024	Angola 	Angola	\N
00040000-55e5-63c6-e4af-d87845f76332	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55e5-63c6-edbb-f410193c677e	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55e5-63c6-b789-87d2a4a3d291	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55e5-63c6-de89-47d809869fbc	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55e5-63c6-770b-81823d972613	AM	ARM	051	Armenia 	Armenija	\N
00040000-55e5-63c6-6da8-cf42c51ad09d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55e5-63c6-06ee-df06398ae9d3	AU	AUS	036	Australia 	Avstralija	\N
00040000-55e5-63c6-1316-2a617fe30b22	AT	AUT	040	Austria 	Avstrija	\N
00040000-55e5-63c6-5f15-1d2d527d709e	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55e5-63c6-f986-8b82c2e532cb	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55e5-63c6-c612-a0fde1a7c02f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55e5-63c6-f7e8-3ee98cdfebe6	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55e5-63c6-e210-2d623a9f0251	BB	BRB	052	Barbados 	Barbados	\N
00040000-55e5-63c6-a662-52f52ab59b96	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55e5-63c6-9ab5-ab1fa506afeb	BE	BEL	056	Belgium 	Belgija	\N
00040000-55e5-63c6-eb99-f3256305c18e	BZ	BLZ	084	Belize 	Belize	\N
00040000-55e5-63c6-1028-e09f55f62b7b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55e5-63c6-2bcb-8bed533b6ca1	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55e5-63c6-b9c9-7806c023d102	BT	BTN	064	Bhutan 	Butan	\N
00040000-55e5-63c6-6d17-82934a28881d	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55e5-63c6-14a9-c7ed10943630	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55e5-63c6-4670-0952517ffe93	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55e5-63c6-60ed-11554c90229a	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55e5-63c6-b661-4a26a6f080f6	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55e5-63c6-de7a-28aabd7b2013	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55e5-63c6-fd10-6c68579bae34	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55e5-63c6-855e-0e46a1732a46	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55e5-63c6-1be2-2f3f568117a0	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55e5-63c6-7c80-6a19364c5da4	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55e5-63c6-5fee-0b22b7658d61	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55e5-63c6-903e-2c3378721a28	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55e5-63c6-a4ca-254c80427f35	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55e5-63c6-d31e-b802cca284da	CA	CAN	124	Canada 	Kanada	\N
00040000-55e5-63c6-2a39-7361575cf2ac	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55e5-63c6-02c2-834baf57445e	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55e5-63c6-530a-a540c04b9c23	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55e5-63c6-600c-b0385bf7a89b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55e5-63c6-46b1-e1534adc1930	CL	CHL	152	Chile 	Čile	\N
00040000-55e5-63c6-de8f-8d60fbcacda3	CN	CHN	156	China 	Kitajska	\N
00040000-55e5-63c6-52d4-aa0d83b706de	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55e5-63c6-395e-00086a7c4336	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55e5-63c6-8d7f-f78199c48e26	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55e5-63c6-8119-1caf0db87a64	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55e5-63c6-843b-d3e6883311bb	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55e5-63c6-3ba8-39fe6cfd8572	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55e5-63c6-b2e6-fc35fd02a04e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55e5-63c6-6f12-fbd204d63d49	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55e5-63c6-b4d4-e62af03666d4	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55e5-63c6-00a6-2a22983ffdf1	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55e5-63c6-d136-94f8a76a035b	CU	CUB	192	Cuba 	Kuba	\N
00040000-55e5-63c6-9a01-d6d8c35813bd	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55e5-63c6-c6c5-87142c33e5f8	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55e5-63c6-86de-7f563c547481	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55e5-63c6-cf06-58be90d037f8	DK	DNK	208	Denmark 	Danska	\N
00040000-55e5-63c6-df6c-d90071d21d95	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55e5-63c6-735b-744651c826c9	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55e5-63c6-677f-ab938189464a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55e5-63c6-b163-8fd00de71cb0	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55e5-63c6-1fe1-0c8e0de975f1	EG	EGY	818	Egypt 	Egipt	\N
00040000-55e5-63c6-9e9c-484d75ed863d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55e5-63c6-698c-f395d9454e09	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55e5-63c6-bbe2-2d63f74d5d0f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55e5-63c6-b6ad-3629980f50d6	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55e5-63c6-d6f2-a3d4eadd176a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55e5-63c6-8a26-529bdc17f42b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55e5-63c6-2f36-fdcf2625ae47	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55e5-63c6-7e02-1581b03307e0	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55e5-63c6-7e0f-be60bc1f8bb8	FI	FIN	246	Finland 	Finska	\N
00040000-55e5-63c6-1c94-cd81b980f406	FR	FRA	250	France 	Francija	\N
00040000-55e5-63c6-7eec-531fd0447bf2	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55e5-63c7-d3b5-120da6ad5404	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55e5-63c6-adac-dac584b6eb24	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55e5-63c6-8a0f-d56b1c0fa816	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55e5-63c6-0767-d812fc756bcc	GA	GAB	266	Gabon 	Gabon	\N
00040000-55e5-63c6-95cb-2e840fcff3ba	GM	GMB	270	Gambia 	Gambija	\N
00040000-55e5-63c6-115e-4aae6a274176	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55e5-63c6-4c53-5db7d257e37a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55e5-63c6-a2be-7005a2d3c0b3	GH	GHA	288	Ghana 	Gana	\N
00040000-55e5-63c6-6d4a-41dd42b43aa0	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55e5-63c6-f929-82d958edd958	GR	GRC	300	Greece 	Grčija	\N
00040000-55e5-63c6-49c5-09039adb95fa	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55e5-63c6-f16f-944a6a93e40c	GD	GRD	308	Grenada 	Grenada	\N
00040000-55e5-63c6-cb86-d3f49c151a34	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55e5-63c6-0a3b-9eea08f78ca6	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55e5-63c6-3fa4-30d4ce4482cd	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55e5-63c6-3578-42074de3bfee	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55e5-63c6-8920-98f48294c785	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55e5-63c6-cf84-303cb6ecf5e6	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55e5-63c6-fc5d-903975cb8fc2	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55e5-63c6-c8cd-f47cd9ae88f2	HT	HTI	332	Haiti 	Haiti	\N
00040000-55e5-63c6-f3a3-585ab6a8de2a	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55e5-63c6-16fd-d97fe3931d30	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55e5-63c6-44a6-3d41ef6f1464	HN	HND	340	Honduras 	Honduras	\N
00040000-55e5-63c6-9680-4c37221a4823	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55e5-63c6-9e8b-9db7851f84e6	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55e5-63c6-fb19-f5f722ee523f	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55e5-63c6-daed-df8b3b5b277c	IN	IND	356	India 	Indija	\N
00040000-55e5-63c6-2ca0-2705acf56ad1	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55e5-63c6-6665-430240569ac4	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55e5-63c7-dd10-3c820af1612f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55e5-63c7-01dc-859ddd4e2fa4	IE	IRL	372	Ireland 	Irska	\N
00040000-55e5-63c7-c696-79f321c7e662	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55e5-63c7-6070-e545ee79c99b	IL	ISR	376	Israel 	Izrael	\N
00040000-55e5-63c7-fb93-0ae38996c8a1	IT	ITA	380	Italy 	Italija	\N
00040000-55e5-63c7-552f-d534aaf32f25	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55e5-63c7-30b3-a544c23386e6	JP	JPN	392	Japan 	Japonska	\N
00040000-55e5-63c7-6b9d-d4a43fb508eb	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55e5-63c7-0af2-3cd3c752af9d	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55e5-63c7-d4cf-47c2b4b4fafc	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55e5-63c7-30ba-9e1e978ef2af	KE	KEN	404	Kenya 	Kenija	\N
00040000-55e5-63c7-121c-cce555d63816	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55e5-63c7-cf37-b66262e4fe4a	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55e5-63c7-efc8-204079895ee0	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55e5-63c7-0fa0-af76cf220ffe	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55e5-63c7-9d8c-ea418b661ef2	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55e5-63c7-6160-b6c21a1460bd	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55e5-63c7-b371-ac3b0fc0a237	LV	LVA	428	Latvia 	Latvija	\N
00040000-55e5-63c7-c570-b3998ef1fa22	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55e5-63c7-e633-6399698097fe	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55e5-63c7-4ed2-c8d136e13c05	LR	LBR	430	Liberia 	Liberija	\N
00040000-55e5-63c7-06cb-66465794477e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55e5-63c7-eaa9-1ee71591c63d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55e5-63c7-a93b-b61af1ab5e0a	LT	LTU	440	Lithuania 	Litva	\N
00040000-55e5-63c7-a262-be18a5eda421	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55e5-63c7-b75d-425a5e6af61b	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55e5-63c7-0f84-2c29cad703d4	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55e5-63c7-65ef-36374e08eb7e	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55e5-63c7-243f-d4d1dc8672de	MW	MWI	454	Malawi 	Malavi	\N
00040000-55e5-63c7-0478-487c7c510130	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55e5-63c7-c897-6692f08fc7ea	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55e5-63c7-d3ac-129d796d0d11	ML	MLI	466	Mali 	Mali	\N
00040000-55e5-63c7-2cc7-ca8c5aa45bc5	MT	MLT	470	Malta 	Malta	\N
00040000-55e5-63c7-c1ae-bfcfe414d95f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55e5-63c7-2ddb-cb24e714f91d	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55e5-63c7-952b-9b6eeac040ae	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55e5-63c7-21d2-1fcfb14b4333	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55e5-63c7-4710-9cefe8d911cc	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55e5-63c7-dad7-4a481b87fe4d	MX	MEX	484	Mexico 	Mehika	\N
00040000-55e5-63c7-0e05-a62ddf365b20	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55e5-63c7-4e47-a24c0a390fef	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55e5-63c7-27f3-d6e397438d44	MC	MCO	492	Monaco 	Monako	\N
00040000-55e5-63c7-dacb-018da828f742	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55e5-63c7-897d-0baad9778a58	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55e5-63c7-ce0b-b4ab1cb2ea83	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55e5-63c7-08eb-d6102681b2d5	MA	MAR	504	Morocco 	Maroko	\N
00040000-55e5-63c7-660d-00e1de5b9fd1	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55e5-63c7-944d-59a7b5f218e2	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55e5-63c7-d34e-eeb6fd8fc5c6	NA	NAM	516	Namibia 	Namibija	\N
00040000-55e5-63c7-64f0-fead87e413e0	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55e5-63c7-8604-1131c5b91197	NP	NPL	524	Nepal 	Nepal	\N
00040000-55e5-63c7-2327-e386106a16b9	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55e5-63c7-a491-aa17cbd7ec93	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55e5-63c7-7e86-4eb3770e79b1	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55e5-63c7-48a6-119aaaede104	NE	NER	562	Niger 	Niger 	\N
00040000-55e5-63c7-8663-e923d41f09e1	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55e5-63c7-54ba-f41228b2ffde	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55e5-63c7-6bb8-73ae32fd05a1	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55e5-63c7-5284-b4904817883d	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55e5-63c7-45fc-8d020efe3bea	NO	NOR	578	Norway 	Norveška	\N
00040000-55e5-63c7-b9f3-211a7d84e81d	OM	OMN	512	Oman 	Oman	\N
00040000-55e5-63c7-e1b2-631f1f664f04	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55e5-63c7-ccb2-4c62774833d7	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55e5-63c7-773c-0ba608dc8276	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55e5-63c7-c8b4-965257ad95bc	PA	PAN	591	Panama 	Panama	\N
00040000-55e5-63c7-179e-e2cae06ca446	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55e5-63c7-e88e-3f36c17ec2cd	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55e5-63c7-853e-5211cfee2c65	PE	PER	604	Peru 	Peru	\N
00040000-55e5-63c7-04f9-e24d65748595	PH	PHL	608	Philippines 	Filipini	\N
00040000-55e5-63c7-9c8b-1680ccdf88d7	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55e5-63c7-b25a-f9c83506d66c	PL	POL	616	Poland 	Poljska	\N
00040000-55e5-63c7-6c22-283b92182cf5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55e5-63c7-a814-049cdbb8d4cc	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55e5-63c7-bf9e-da597d2aee87	QA	QAT	634	Qatar 	Katar	\N
00040000-55e5-63c7-28cc-fd645e982b9f	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55e5-63c7-6f00-7bfbddd6be1e	RO	ROU	642	Romania 	Romunija	\N
00040000-55e5-63c7-fbc4-3bf17e4e7e63	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55e5-63c7-cb8a-71ccf0d45df2	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55e5-63c7-e6f5-c3e18d0e09c7	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55e5-63c7-2b9d-32eb4d95b5cb	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55e5-63c7-ef65-c84c83becf35	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55e5-63c7-a9cf-c213038c66e3	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55e5-63c7-b37b-88d3150859a4	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55e5-63c7-d9f6-c2f900bcb368	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55e5-63c7-9c70-697349905777	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55e5-63c7-47f2-b1b5675ad128	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55e5-63c7-a9a1-d7ce47b2eb6f	SM	SMR	674	San Marino 	San Marino	\N
00040000-55e5-63c7-f958-37c1414be4f1	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55e5-63c7-99bd-ed28d65b1c28	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55e5-63c7-1c97-ab62bba6f070	SN	SEN	686	Senegal 	Senegal	\N
00040000-55e5-63c7-f6ee-53aab71ec138	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55e5-63c7-af06-21bb94740471	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55e5-63c7-6b9c-89233e9e0b8a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55e5-63c7-de0b-7487e42ff649	SG	SGP	702	Singapore 	Singapur	\N
00040000-55e5-63c7-76a1-221f2a2d0a0b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55e5-63c7-eb0c-a9a6c2348703	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55e5-63c7-d739-7a35230cb38d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55e5-63c7-a5ed-51e428734610	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55e5-63c7-c8c6-8003a2c54751	SO	SOM	706	Somalia 	Somalija	\N
00040000-55e5-63c7-e34b-c80228b0083e	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55e5-63c7-86ab-3241b1158fdd	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55e5-63c7-4a99-efe3ddf9aeea	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55e5-63c7-fd91-f5b196e1299c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55e5-63c7-6eaa-1642d28e5939	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55e5-63c7-63c1-b711115056b0	SD	SDN	729	Sudan 	Sudan	\N
00040000-55e5-63c7-b3fa-f2cd95557f1e	SR	SUR	740	Suriname 	Surinam	\N
00040000-55e5-63c7-a4b9-90477361a7fe	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55e5-63c7-e65b-5e3d0402a952	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55e5-63c7-8286-23888bb52def	SE	SWE	752	Sweden 	Švedska	\N
00040000-55e5-63c7-47fb-43b1920a5c6f	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55e5-63c7-ca6b-b8b78312b747	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55e5-63c7-49e4-0704881c9d68	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55e5-63c7-03c7-516a280c4823	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55e5-63c7-f5e7-f94f5cea12ef	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55e5-63c7-38fa-51983cb72f0f	TH	THA	764	Thailand 	Tajska	\N
00040000-55e5-63c7-8dc5-9469c7d1f620	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55e5-63c7-9225-32f854faa21d	TG	TGO	768	Togo 	Togo	\N
00040000-55e5-63c7-3b2b-ed9478b03205	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55e5-63c7-fc8c-ffb16130d9e6	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55e5-63c7-96bd-50d9abbc7cd4	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55e5-63c7-afd3-0a11464acc75	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55e5-63c7-7848-e56285f08a23	TR	TUR	792	Turkey 	Turčija	\N
00040000-55e5-63c7-6861-5deb6520d70e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55e5-63c7-296c-2e1ac7444bb7	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e5-63c7-bb51-d84d33ede610	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55e5-63c7-a283-2786f04fb6df	UG	UGA	800	Uganda 	Uganda	\N
00040000-55e5-63c7-afa2-ab965d5e218f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55e5-63c7-8f6e-dbff055f0f2f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55e5-63c7-226b-2f5b9df871f7	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55e5-63c7-62b0-0aa23b3be21e	US	USA	840	United States 	Združene države Amerike	\N
00040000-55e5-63c7-4914-18bccc1e7b59	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55e5-63c7-1375-1d77acae0240	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55e5-63c7-9578-75b627a3d9a0	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55e5-63c7-f0fb-7f44c0bccc77	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55e5-63c7-1199-3fcc5357ff42	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55e5-63c7-8ac8-ac7c2ed14bec	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55e5-63c7-b9d4-d56d660c3e10	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e5-63c7-1447-7586df5cb015	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55e5-63c7-9a20-016702080155	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55e5-63c7-a8a3-ccb502ac5238	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55e5-63c7-cdae-86133290d436	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55e5-63c7-6907-0d88c50dd97e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55e5-63c7-2eb9-eaf270dcc006	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2967 (class 0 OID 16756815)
-- Dependencies: 225
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55e5-63c8-ce66-41cab307ee6a	000e0000-55e5-63c8-607d-31c606d98db1	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e5-63c6-bb30-c9fa68aa0ac3	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e5-63c8-d17d-99408d69320d	000e0000-55e5-63c8-30b1-e4a9c05c2a57	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e5-63c6-e347-5885c14696e8	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e5-63c8-87f3-6da7450a9693	000e0000-55e5-63c8-1f63-186b913afcc4	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e5-63c6-bb30-c9fa68aa0ac3	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e5-63c8-aae0-55298e5f0d29	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e5-63c8-fe8a-187464a388c7	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2953 (class 0 OID 16756630)
-- Dependencies: 211
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55e5-63c8-958c-5d7eb5ef3a72	000e0000-55e5-63c8-30b1-e4a9c05c2a57	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55e5-63c6-ded3-6fc8d1d1a085
000d0000-55e5-63c8-ae32-637ad1038994	000e0000-55e5-63c8-30b1-e4a9c05c2a57	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55e5-63c6-ded3-6fc8d1d1a085
000d0000-55e5-63c8-724f-76502773bd96	000e0000-55e5-63c8-30b1-e4a9c05c2a57	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55e5-63c6-aa79-cf94bc86f5c8
000d0000-55e5-63c8-a568-987f23da0b17	000e0000-55e5-63c8-30b1-e4a9c05c2a57	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55e5-63c6-a484-83c0d00cf37d
000d0000-55e5-63c8-2c00-44ab78b0eaf0	000e0000-55e5-63c8-30b1-e4a9c05c2a57	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55e5-63c6-ca6e-631f2069d455
000d0000-55e5-63c8-c857-5e3f9bbfd5a1	000e0000-55e5-63c8-30b1-e4a9c05c2a57	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55e5-63c6-ca6e-631f2069d455
000d0000-55e5-63c8-18f9-f0d298c607f2	000e0000-55e5-63c8-30b1-e4a9c05c2a57	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55e5-63c6-ded3-6fc8d1d1a085
000d0000-55e5-63c8-fd47-6b0dcb785b81	000e0000-55e5-63c8-30b1-e4a9c05c2a57	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55e5-63c6-0275-f07d3ee735da
\.


--
-- TOC entry 2933 (class 0 OID 16756445)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2912 (class 0 OID 16705977)
-- Dependencies: 170
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 16756426)
-- Dependencies: 189
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55e5-63c8-a35a-e840ad12eedf	00080000-55e5-63c8-87b0-f03262c818f2	00090000-55e5-63c8-e12b-2cbf4fd3dffa	AK		
\.


--
-- TOC entry 2942 (class 0 OID 16756544)
-- Dependencies: 200
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 16757032)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 16757044)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 16757066)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 16756569)
-- Dependencies: 204
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 16756383)
-- Dependencies: 186
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55e5-63c7-76f0-bb6d1585bf7c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55e5-63c7-c72c-46c7da621ef4	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55e5-63c7-5cfd-62be61383408	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55e5-63c7-5d6a-4619cb21fb31	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55e5-63c7-6cba-835689bfabb1	dogodek.status	array	a:7:{i:100;a:1:{s:5:"label";s:11:"Dolgoročno";}i:200;a:1:{s:5:"label";s:9:"Planirano";}i:300;a:1:{s:5:"label";s:8:"Fiksiran";}i:400;a:1:{s:5:"label";s:17:"Potrjen - interno";}i:500;a:1:{s:5:"label";s:15:"Potrjen - javno";}i:600;a:1:{s:5:"label";s:10:"Zaključen";}i:700;a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55e5-63c7-636d-83aecd5b6119	dogodek.razred	array	a:5:{i:100;a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}i:200;a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}i:300;a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}i:400;a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}i:500;a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55e5-63c7-4961-36f52587b175	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55e5-63c7-3809-aab6e5647743	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55e5-63c7-def6-8b7494f0363c	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55e5-63c7-ba7e-c2d92a371864	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55e5-63c7-0dc6-cd8bcf86cd8a	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55e5-63c7-5434-7e42b9a8eb9c	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55e5-63c7-52b8-8e2ee5fdeac7	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55e5-63c7-5302-46dc182f549a	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55e5-63c8-5d2d-e0536fd13226	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55e5-63c8-a786-37fbe8d6e290	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55e5-63c8-75b3-5ce83b792634	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55e5-63c8-7c0b-a82638ef2692	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55e5-63c8-bbf5-ccb6f636321a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55e5-63c9-70ca-b5b627d319b8	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2922 (class 0 OID 16756297)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55e5-63c8-6f68-7f44e6560e4b	00000000-55e5-63c8-5d2d-e0536fd13226	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55e5-63c8-7c51-b4fcbca86a7b	00000000-55e5-63c8-5d2d-e0536fd13226	00010000-55e5-63c7-0ff9-18fd7ae3c14c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55e5-63c8-b54c-9ef7fc467f9a	00000000-55e5-63c8-a786-37fbe8d6e290	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2923 (class 0 OID 16756308)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55e5-63c8-a214-1b30e465ff12	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55e5-63c8-e17b-08bd3a0d1782	00010000-55e5-63c8-4888-310346aa986f	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55e5-63c8-cb75-a9da9ecdd645	00010000-55e5-63c8-aed3-bffd58b0b220	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55e5-63c8-9212-31aa7c6d64f1	00010000-55e5-63c8-3445-38d7dc7a5d27	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55e5-63c8-0b0b-edb24ebdd59d	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55e5-63c8-c62c-d3a052a0e46d	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55e5-63c8-4637-7446de6c7128	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55e5-63c8-ca6e-a427aa34c861	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55e5-63c8-e12b-2cbf4fd3dffa	00010000-55e5-63c8-88c0-bdc279d79461	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55e5-63c8-f94f-a8194306b799	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55e5-63c8-56ba-70bcd51adf4b	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55e5-63c8-2ba3-21840c69a986	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55e5-63c8-5267-b9655ae55c4d	00010000-55e5-63c8-c9b1-4fc2f2134f0c	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2918 (class 0 OID 16756262)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55e5-63c7-e460-eb80207ca25a	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55e5-63c7-3020-d8fd4da34954	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55e5-63c7-28e2-6891930d6ee4	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55e5-63c7-41d4-cc561e8d126d	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55e5-63c7-c0ea-31ea1a2c0b99	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55e5-63c7-d310-a682211db6a2	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55e5-63c7-ee15-1eb9ef1657f3	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55e5-63c7-401b-4c0ef90f12d2	Abonma-read	Abonma - branje	f
00030000-55e5-63c7-229b-59d59ff59e75	Abonma-write	Abonma - spreminjanje	f
00030000-55e5-63c7-043c-559179b40ea4	Alternacija-read	Alternacija - branje	f
00030000-55e5-63c7-928e-79459c677cb3	Alternacija-write	Alternacija - spreminjanje	f
00030000-55e5-63c7-a5a4-d3a091a6b7e2	Arhivalija-read	Arhivalija - branje	f
00030000-55e5-63c7-565e-f9399999e340	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55e5-63c7-f635-efeed06d21c5	Besedilo-read	Besedilo - branje	f
00030000-55e5-63c7-5ee8-97c4d7282b4f	Besedilo-write	Besedilo - spreminjanje	f
00030000-55e5-63c7-1d68-33338e1ae399	DogodekIzven-read	DogodekIzven - branje	f
00030000-55e5-63c7-ba4b-0603b9e51415	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55e5-63c7-d524-43f564738dce	Dogodek-read	Dogodek - branje	f
00030000-55e5-63c7-a408-cf2fe63c2d1f	Dogodek-write	Dogodek - spreminjanje	f
00030000-55e5-63c7-312a-c30a88beb384	DrugiVir-read	DrugiVir - branje	f
00030000-55e5-63c7-03e0-ec18c84df3ad	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55e5-63c7-51df-87eda1d4d746	Drzava-read	Drzava - branje	f
00030000-55e5-63c7-2197-d864294a1bb8	Drzava-write	Drzava - spreminjanje	f
00030000-55e5-63c7-6f3a-3d48b38e9311	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55e5-63c7-1b9e-0c00be706d12	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55e5-63c7-f81d-bff2b58fc8c3	Funkcija-read	Funkcija - branje	f
00030000-55e5-63c7-4a0a-5cca97fd240d	Funkcija-write	Funkcija - spreminjanje	f
00030000-55e5-63c7-463a-2e77a60dcbd6	Gostovanje-read	Gostovanje - branje	f
00030000-55e5-63c7-f45d-08a273ca18f5	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55e5-63c7-31fb-df8bb47178cc	Gostujoca-read	Gostujoca - branje	f
00030000-55e5-63c7-ff1c-b5a91ca5fbee	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55e5-63c7-e973-82d9e387ec52	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55e5-63c7-e54a-6fae7191e701	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55e5-63c7-79df-90c601823235	Kupec-read	Kupec - branje	f
00030000-55e5-63c7-56f3-f624cea88e8e	Kupec-write	Kupec - spreminjanje	f
00030000-55e5-63c7-1a5d-1283dbcfa7f0	NacinPlacina-read	NacinPlacina - branje	f
00030000-55e5-63c7-2871-fae0fef5e2b1	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55e5-63c7-fca4-7bb8122dec87	Option-read	Option - branje	f
00030000-55e5-63c7-277a-f4bc5aa3c84c	Option-write	Option - spreminjanje	f
00030000-55e5-63c7-6afd-4caaf4a3c7f0	OptionValue-read	OptionValue - branje	f
00030000-55e5-63c7-c5c6-646ff00519de	OptionValue-write	OptionValue - spreminjanje	f
00030000-55e5-63c7-ef88-3b88415d5054	Oseba-read	Oseba - branje	f
00030000-55e5-63c7-2ff9-f8096b867c04	Oseba-write	Oseba - spreminjanje	f
00030000-55e5-63c7-651d-20dc8bab48e9	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55e5-63c7-688d-8904bbf625d3	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55e5-63c7-ddbc-ac1bc043d914	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55e5-63c7-2e44-a86406737bc5	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55e5-63c7-e9ef-cca411dba914	Pogodba-read	Pogodba - branje	f
00030000-55e5-63c7-bad9-f43d13f9f901	Pogodba-write	Pogodba - spreminjanje	f
00030000-55e5-63c7-b61c-259361df6bd9	Popa-read	Popa - branje	f
00030000-55e5-63c7-a816-2e449dc3ab51	Popa-write	Popa - spreminjanje	f
00030000-55e5-63c7-d7a1-0405661ff26a	Posta-read	Posta - branje	f
00030000-55e5-63c7-d9af-05dc4e1664d0	Posta-write	Posta - spreminjanje	f
00030000-55e5-63c7-5dcb-5a8e54242e28	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55e5-63c7-d770-9297cb8e2ede	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55e5-63c7-1cb2-4eea67e37cf0	PostniNaslov-read	PostniNaslov - branje	f
00030000-55e5-63c7-204f-4aa20456dc57	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55e5-63c7-ace0-d7bce13fc411	Predstava-read	Predstava - branje	f
00030000-55e5-63c7-7ec8-7a86d806086f	Predstava-write	Predstava - spreminjanje	f
00030000-55e5-63c7-10de-718e0b71f967	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55e5-63c7-fef8-20ecc8ff0ad9	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55e5-63c7-5807-7a870e86ad0f	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55e5-63c7-6f3d-a17a7a104466	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55e5-63c7-0f97-57976adac24f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55e5-63c7-4ae6-e855818c7e0e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55e5-63c7-b074-504de7f118cd	ProgramDela-read	ProgramDela - branje	f
00030000-55e5-63c7-f9e9-ace27b4368fb	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55e5-63c7-1c98-fa1c302d96e5	ProgramFestival-read	ProgramFestival - branje	f
00030000-55e5-63c7-a272-9262a21ba53f	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55e5-63c7-0706-2b594bb4c3fc	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55e5-63c7-2a53-2a4dd3ebe3ca	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55e5-63c7-2ee6-2290f550d26b	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55e5-63c7-e092-bb002e243430	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55e5-63c7-39b1-0d84e39777dd	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55e5-63c7-2039-f28bc401b5c2	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55e5-63c7-42e3-187bac0f3a09	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55e5-63c7-0588-9042861baa77	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55e5-63c7-64f9-1f02e9fa80f8	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55e5-63c7-a5a7-681a334ad754	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55e5-63c7-e932-5a552d7a0c97	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55e5-63c7-e6b1-207553331530	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55e5-63c7-47e2-6f826ef46486	ProgramRazno-read	ProgramRazno - branje	f
00030000-55e5-63c7-b0d5-37bbe7960b38	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55e5-63c7-ca8a-b4f3d77403fa	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55e5-63c7-d620-f9ef91ccd002	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55e5-63c7-ca81-bcdf3cd3b9dc	Prostor-read	Prostor - branje	f
00030000-55e5-63c7-4c2e-ce516ffe8e66	Prostor-write	Prostor - spreminjanje	f
00030000-55e5-63c7-b576-54527d88612a	Racun-read	Racun - branje	f
00030000-55e5-63c7-8761-2348c6e4154d	Racun-write	Racun - spreminjanje	f
00030000-55e5-63c7-a89a-3bd591419c34	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55e5-63c7-550a-ca010737929f	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55e5-63c7-de70-f3d92ce1eec0	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55e5-63c7-ef2e-be19e3b6b094	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55e5-63c7-9906-35e1d5587bc5	Rekvizit-read	Rekvizit - branje	f
00030000-55e5-63c7-0329-a909fb8cb359	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55e5-63c7-7920-6260ec052d55	Revizija-read	Revizija - branje	f
00030000-55e5-63c7-de02-12d972a381ec	Revizija-write	Revizija - spreminjanje	f
00030000-55e5-63c7-93c8-e6caab1352d5	Rezervacija-read	Rezervacija - branje	f
00030000-55e5-63c7-823b-8c6d3b89457c	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55e5-63c7-5356-a06ccb0ea1e0	SedezniRed-read	SedezniRed - branje	f
00030000-55e5-63c7-e8e0-cbe0508aa1df	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55e5-63c7-29b5-7fdc333d8823	Sedez-read	Sedez - branje	f
00030000-55e5-63c7-f60b-30383b3a44ea	Sedez-write	Sedez - spreminjanje	f
00030000-55e5-63c7-f267-764a65965550	Sezona-read	Sezona - branje	f
00030000-55e5-63c7-39fb-259f74cd5356	Sezona-write	Sezona - spreminjanje	f
00030000-55e5-63c7-345b-851788593f8c	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55e5-63c7-b44c-8bec6ed9b47d	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55e5-63c7-d09d-43776658eae9	Stevilcenje-read	Stevilcenje - branje	f
00030000-55e5-63c7-2a4e-b6c2f85f689c	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55e5-63c7-d272-9d2382d17999	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55e5-63c7-a180-4e3d3d1c8cb7	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55e5-63c7-ee82-53c644230921	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55e5-63c7-c2a7-f0a464a20fee	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55e5-63c7-e0b4-1ad4dd53a29b	Telefonska-read	Telefonska - branje	f
00030000-55e5-63c7-f56b-5878d6619886	Telefonska-write	Telefonska - spreminjanje	f
00030000-55e5-63c7-5ec4-30f540fb5ff7	TerminStoritve-read	TerminStoritve - branje	f
00030000-55e5-63c7-56d8-845ffc6265c7	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55e5-63c7-6ca5-da4b2ee87de5	TipFunkcije-read	TipFunkcije - branje	f
00030000-55e5-63c7-b429-944b7a37ea18	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55e5-63c7-779f-71dcc804c169	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55e5-63c7-f81b-3132e612a1b2	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55e5-63c7-d80a-1779020acb91	Trr-read	Trr - branje	f
00030000-55e5-63c7-296c-7c88f8eac315	Trr-write	Trr - spreminjanje	f
00030000-55e5-63c7-26ce-78c35a1ce1d4	Uprizoritev-read	Uprizoritev - branje	f
00030000-55e5-63c7-c731-0588dbc42cc3	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55e5-63c7-b5c5-de7b570efab2	Vaja-read	Vaja - branje	f
00030000-55e5-63c7-2c78-51b90fece655	Vaja-write	Vaja - spreminjanje	f
00030000-55e5-63c7-62c8-750f565daccd	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55e5-63c7-51d3-c485740db43b	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55e5-63c7-7ae3-8e82e050eec3	VrstaStroska-read	VrstaStroska - branje	f
00030000-55e5-63c7-81fd-c135a51f76f7	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55e5-63c7-38f6-2dc8a48d7110	Zaposlitev-read	Zaposlitev - branje	f
00030000-55e5-63c7-614e-404cb4a34aab	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55e5-63c7-4ea1-500e54404ff3	Zasedenost-read	Zasedenost - branje	f
00030000-55e5-63c7-c3a7-2f36ba424ed7	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55e5-63c7-cc6d-d460abddb6ed	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55e5-63c7-69d8-276487ec7b26	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55e5-63c7-0b48-0d32175261a0	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55e5-63c7-0a25-32305c6e9560	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55e5-63c7-2879-fb67efec5853	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55e5-63c7-75bf-213936333fd3	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55e5-63c7-bef2-2be36c0cf047	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55e5-63c7-f6f1-ebed4fb2a628	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55e5-63c7-d1c7-93f7d98b293c	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e5-63c7-75d8-3cca9bd15614	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e5-63c7-359d-ade490f4e562	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e5-63c7-a2fa-7895ccae5bff	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e5-63c7-7f26-bf07480d6946	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55e5-63c7-1453-8a141a7b7704	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55e5-63c7-aaf5-e9116399b9a8	Datoteka-write	Datoteka - spreminjanje	f
00030000-55e5-63c7-4d70-69118f608009	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2920 (class 0 OID 16756281)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55e5-63c7-168e-8fd8a7b22c3e	00030000-55e5-63c7-3020-d8fd4da34954
00020000-55e5-63c7-affa-5cbdb904b06f	00030000-55e5-63c7-51df-87eda1d4d746
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-401b-4c0ef90f12d2
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-229b-59d59ff59e75
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-043c-559179b40ea4
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-928e-79459c677cb3
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-a5a4-d3a091a6b7e2
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-d524-43f564738dce
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-41d4-cc561e8d126d
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-a408-cf2fe63c2d1f
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-51df-87eda1d4d746
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-2197-d864294a1bb8
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-f81d-bff2b58fc8c3
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-4a0a-5cca97fd240d
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-463a-2e77a60dcbd6
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-f45d-08a273ca18f5
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-31fb-df8bb47178cc
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-ff1c-b5a91ca5fbee
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-e973-82d9e387ec52
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-e54a-6fae7191e701
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-fca4-7bb8122dec87
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-6afd-4caaf4a3c7f0
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-ef88-3b88415d5054
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-2ff9-f8096b867c04
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-b61c-259361df6bd9
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-a816-2e449dc3ab51
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-d7a1-0405661ff26a
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-d9af-05dc4e1664d0
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-1cb2-4eea67e37cf0
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-204f-4aa20456dc57
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-ace0-d7bce13fc411
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-7ec8-7a86d806086f
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-0f97-57976adac24f
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-4ae6-e855818c7e0e
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-ca81-bcdf3cd3b9dc
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-4c2e-ce516ffe8e66
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-de70-f3d92ce1eec0
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-ef2e-be19e3b6b094
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-9906-35e1d5587bc5
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-0329-a909fb8cb359
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-f267-764a65965550
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-39fb-259f74cd5356
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-6ca5-da4b2ee87de5
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-26ce-78c35a1ce1d4
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-c731-0588dbc42cc3
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-b5c5-de7b570efab2
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-2c78-51b90fece655
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-4ea1-500e54404ff3
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-c3a7-2f36ba424ed7
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-cc6d-d460abddb6ed
00020000-55e5-63c7-9e60-3b81125d7f10	00030000-55e5-63c7-0b48-0d32175261a0
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-401b-4c0ef90f12d2
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-a5a4-d3a091a6b7e2
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-d524-43f564738dce
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-51df-87eda1d4d746
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-463a-2e77a60dcbd6
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-31fb-df8bb47178cc
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-e973-82d9e387ec52
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-e54a-6fae7191e701
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-fca4-7bb8122dec87
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-6afd-4caaf4a3c7f0
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-ef88-3b88415d5054
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-2ff9-f8096b867c04
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-b61c-259361df6bd9
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-d7a1-0405661ff26a
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-1cb2-4eea67e37cf0
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-204f-4aa20456dc57
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-ace0-d7bce13fc411
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-ca81-bcdf3cd3b9dc
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-de70-f3d92ce1eec0
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-9906-35e1d5587bc5
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-f267-764a65965550
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-e0b4-1ad4dd53a29b
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-f56b-5878d6619886
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-d80a-1779020acb91
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-296c-7c88f8eac315
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-38f6-2dc8a48d7110
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-614e-404cb4a34aab
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-cc6d-d460abddb6ed
00020000-55e5-63c7-c453-ab7b60843204	00030000-55e5-63c7-0b48-0d32175261a0
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-401b-4c0ef90f12d2
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-043c-559179b40ea4
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-a5a4-d3a091a6b7e2
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-565e-f9399999e340
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-f635-efeed06d21c5
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-1d68-33338e1ae399
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-d524-43f564738dce
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-51df-87eda1d4d746
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-f81d-bff2b58fc8c3
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-463a-2e77a60dcbd6
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-31fb-df8bb47178cc
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-e973-82d9e387ec52
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-fca4-7bb8122dec87
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-6afd-4caaf4a3c7f0
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-ef88-3b88415d5054
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-b61c-259361df6bd9
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-d7a1-0405661ff26a
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-ace0-d7bce13fc411
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-0f97-57976adac24f
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-ca81-bcdf3cd3b9dc
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-de70-f3d92ce1eec0
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-9906-35e1d5587bc5
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-f267-764a65965550
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-6ca5-da4b2ee87de5
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-b5c5-de7b570efab2
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-4ea1-500e54404ff3
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-cc6d-d460abddb6ed
00020000-55e5-63c7-1fc5-08382f21feda	00030000-55e5-63c7-0b48-0d32175261a0
00020000-55e5-63c7-6896-e9d9cbee935b	00030000-55e5-63c7-401b-4c0ef90f12d2
00020000-55e5-63c7-6896-e9d9cbee935b	00030000-55e5-63c7-229b-59d59ff59e75
00020000-55e5-63c7-6896-e9d9cbee935b	00030000-55e5-63c7-928e-79459c677cb3
00020000-55e5-63c7-6896-e9d9cbee935b	00030000-55e5-63c7-a5a4-d3a091a6b7e2
00020000-55e5-63c7-6896-e9d9cbee935b	00030000-55e5-63c7-d524-43f564738dce
00020000-55e5-63c7-6896-e9d9cbee935b	00030000-55e5-63c7-51df-87eda1d4d746
00020000-55e5-63c7-6896-e9d9cbee935b	00030000-55e5-63c7-463a-2e77a60dcbd6
00020000-55e5-63c7-6896-e9d9cbee935b	00030000-55e5-63c7-31fb-df8bb47178cc
00020000-55e5-63c7-6896-e9d9cbee935b	00030000-55e5-63c7-fca4-7bb8122dec87
00020000-55e5-63c7-6896-e9d9cbee935b	00030000-55e5-63c7-6afd-4caaf4a3c7f0
00020000-55e5-63c7-6896-e9d9cbee935b	00030000-55e5-63c7-b61c-259361df6bd9
00020000-55e5-63c7-6896-e9d9cbee935b	00030000-55e5-63c7-d7a1-0405661ff26a
00020000-55e5-63c7-6896-e9d9cbee935b	00030000-55e5-63c7-ace0-d7bce13fc411
00020000-55e5-63c7-6896-e9d9cbee935b	00030000-55e5-63c7-ca81-bcdf3cd3b9dc
00020000-55e5-63c7-6896-e9d9cbee935b	00030000-55e5-63c7-de70-f3d92ce1eec0
00020000-55e5-63c7-6896-e9d9cbee935b	00030000-55e5-63c7-9906-35e1d5587bc5
00020000-55e5-63c7-6896-e9d9cbee935b	00030000-55e5-63c7-f267-764a65965550
00020000-55e5-63c7-6896-e9d9cbee935b	00030000-55e5-63c7-6ca5-da4b2ee87de5
00020000-55e5-63c7-6896-e9d9cbee935b	00030000-55e5-63c7-cc6d-d460abddb6ed
00020000-55e5-63c7-6896-e9d9cbee935b	00030000-55e5-63c7-0b48-0d32175261a0
00020000-55e5-63c7-6538-6f5a073daea4	00030000-55e5-63c7-401b-4c0ef90f12d2
00020000-55e5-63c7-6538-6f5a073daea4	00030000-55e5-63c7-a5a4-d3a091a6b7e2
00020000-55e5-63c7-6538-6f5a073daea4	00030000-55e5-63c7-d524-43f564738dce
00020000-55e5-63c7-6538-6f5a073daea4	00030000-55e5-63c7-51df-87eda1d4d746
00020000-55e5-63c7-6538-6f5a073daea4	00030000-55e5-63c7-463a-2e77a60dcbd6
00020000-55e5-63c7-6538-6f5a073daea4	00030000-55e5-63c7-31fb-df8bb47178cc
00020000-55e5-63c7-6538-6f5a073daea4	00030000-55e5-63c7-fca4-7bb8122dec87
00020000-55e5-63c7-6538-6f5a073daea4	00030000-55e5-63c7-6afd-4caaf4a3c7f0
00020000-55e5-63c7-6538-6f5a073daea4	00030000-55e5-63c7-b61c-259361df6bd9
00020000-55e5-63c7-6538-6f5a073daea4	00030000-55e5-63c7-d7a1-0405661ff26a
00020000-55e5-63c7-6538-6f5a073daea4	00030000-55e5-63c7-ace0-d7bce13fc411
00020000-55e5-63c7-6538-6f5a073daea4	00030000-55e5-63c7-ca81-bcdf3cd3b9dc
00020000-55e5-63c7-6538-6f5a073daea4	00030000-55e5-63c7-de70-f3d92ce1eec0
00020000-55e5-63c7-6538-6f5a073daea4	00030000-55e5-63c7-9906-35e1d5587bc5
00020000-55e5-63c7-6538-6f5a073daea4	00030000-55e5-63c7-f267-764a65965550
00020000-55e5-63c7-6538-6f5a073daea4	00030000-55e5-63c7-5ec4-30f540fb5ff7
00020000-55e5-63c7-6538-6f5a073daea4	00030000-55e5-63c7-28e2-6891930d6ee4
00020000-55e5-63c7-6538-6f5a073daea4	00030000-55e5-63c7-6ca5-da4b2ee87de5
00020000-55e5-63c7-6538-6f5a073daea4	00030000-55e5-63c7-cc6d-d460abddb6ed
00020000-55e5-63c7-6538-6f5a073daea4	00030000-55e5-63c7-0b48-0d32175261a0
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-e460-eb80207ca25a
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-3020-d8fd4da34954
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-28e2-6891930d6ee4
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-41d4-cc561e8d126d
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-c0ea-31ea1a2c0b99
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-d310-a682211db6a2
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-ee15-1eb9ef1657f3
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-401b-4c0ef90f12d2
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-229b-59d59ff59e75
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-043c-559179b40ea4
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-928e-79459c677cb3
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-a5a4-d3a091a6b7e2
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-565e-f9399999e340
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-f635-efeed06d21c5
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-5ee8-97c4d7282b4f
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-1d68-33338e1ae399
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-ba4b-0603b9e51415
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-d524-43f564738dce
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-a408-cf2fe63c2d1f
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-51df-87eda1d4d746
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-2197-d864294a1bb8
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-312a-c30a88beb384
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-03e0-ec18c84df3ad
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-6f3a-3d48b38e9311
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-1b9e-0c00be706d12
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-f81d-bff2b58fc8c3
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-4a0a-5cca97fd240d
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-463a-2e77a60dcbd6
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-f45d-08a273ca18f5
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-31fb-df8bb47178cc
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-ff1c-b5a91ca5fbee
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-e973-82d9e387ec52
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-e54a-6fae7191e701
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-79df-90c601823235
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-56f3-f624cea88e8e
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-1a5d-1283dbcfa7f0
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-2871-fae0fef5e2b1
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-fca4-7bb8122dec87
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-277a-f4bc5aa3c84c
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-6afd-4caaf4a3c7f0
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-c5c6-646ff00519de
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-ef88-3b88415d5054
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-2ff9-f8096b867c04
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-651d-20dc8bab48e9
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-688d-8904bbf625d3
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-ddbc-ac1bc043d914
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-2e44-a86406737bc5
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-e9ef-cca411dba914
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-bad9-f43d13f9f901
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-b61c-259361df6bd9
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-a816-2e449dc3ab51
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-d7a1-0405661ff26a
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-d9af-05dc4e1664d0
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-5dcb-5a8e54242e28
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-d770-9297cb8e2ede
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-1cb2-4eea67e37cf0
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-204f-4aa20456dc57
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-ace0-d7bce13fc411
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-7ec8-7a86d806086f
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-10de-718e0b71f967
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-fef8-20ecc8ff0ad9
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-5807-7a870e86ad0f
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-6f3d-a17a7a104466
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-0f97-57976adac24f
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-4ae6-e855818c7e0e
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-b074-504de7f118cd
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-f9e9-ace27b4368fb
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-1c98-fa1c302d96e5
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-a272-9262a21ba53f
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-0706-2b594bb4c3fc
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-2a53-2a4dd3ebe3ca
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-2ee6-2290f550d26b
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-e092-bb002e243430
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-39b1-0d84e39777dd
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-2039-f28bc401b5c2
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-42e3-187bac0f3a09
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-0588-9042861baa77
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-64f9-1f02e9fa80f8
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-a5a7-681a334ad754
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-e932-5a552d7a0c97
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-e6b1-207553331530
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-47e2-6f826ef46486
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-b0d5-37bbe7960b38
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-ca8a-b4f3d77403fa
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-d620-f9ef91ccd002
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-ca81-bcdf3cd3b9dc
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-4c2e-ce516ffe8e66
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-b576-54527d88612a
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-8761-2348c6e4154d
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-a89a-3bd591419c34
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-550a-ca010737929f
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-de70-f3d92ce1eec0
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-ef2e-be19e3b6b094
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-9906-35e1d5587bc5
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-0329-a909fb8cb359
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-7920-6260ec052d55
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-de02-12d972a381ec
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-93c8-e6caab1352d5
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-823b-8c6d3b89457c
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-5356-a06ccb0ea1e0
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-e8e0-cbe0508aa1df
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-29b5-7fdc333d8823
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-f60b-30383b3a44ea
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-f267-764a65965550
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-39fb-259f74cd5356
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-345b-851788593f8c
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-b44c-8bec6ed9b47d
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-d09d-43776658eae9
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-2a4e-b6c2f85f689c
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-d272-9d2382d17999
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-a180-4e3d3d1c8cb7
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-ee82-53c644230921
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-c2a7-f0a464a20fee
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-e0b4-1ad4dd53a29b
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-f56b-5878d6619886
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-5ec4-30f540fb5ff7
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-56d8-845ffc6265c7
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-6ca5-da4b2ee87de5
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-b429-944b7a37ea18
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-779f-71dcc804c169
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-f81b-3132e612a1b2
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-d80a-1779020acb91
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-296c-7c88f8eac315
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-26ce-78c35a1ce1d4
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-c731-0588dbc42cc3
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-b5c5-de7b570efab2
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-2c78-51b90fece655
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-62c8-750f565daccd
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-51d3-c485740db43b
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-7ae3-8e82e050eec3
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-81fd-c135a51f76f7
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-38f6-2dc8a48d7110
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-614e-404cb4a34aab
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-4ea1-500e54404ff3
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-c3a7-2f36ba424ed7
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-cc6d-d460abddb6ed
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-69d8-276487ec7b26
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-0b48-0d32175261a0
00020000-55e5-63c8-6cb4-07c487957784	00030000-55e5-63c7-0a25-32305c6e9560
\.


--
-- TOC entry 2947 (class 0 OID 16756576)
-- Dependencies: 205
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 16756610)
-- Dependencies: 209
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 16756734)
-- Dependencies: 220
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55e5-63c8-997a-344bc75510bf	00090000-55e5-63c8-a214-1b30e465ff12	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55e5-63c8-8d5c-2a7c0f5d728c	00090000-55e5-63c8-c62c-d3a052a0e46d	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55e5-63c8-07df-4c60a064d4c3	00090000-55e5-63c8-5267-b9655ae55c4d	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2925 (class 0 OID 16756341)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55e5-63c8-87b0-f03262c818f2	00040000-55e5-63c7-d739-7a35230cb38d	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e5-63c8-952a-db2500c4cb6b	00040000-55e5-63c7-d739-7a35230cb38d	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55e5-63c8-c2b8-46c60aee8422	00040000-55e5-63c7-d739-7a35230cb38d	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e5-63c8-3437-5b3577ce80bb	00040000-55e5-63c7-d739-7a35230cb38d	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e5-63c8-f1a6-6a5e34102f53	00040000-55e5-63c7-d739-7a35230cb38d	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e5-63c8-e7a0-cc1982d44593	00040000-55e5-63c6-de89-47d809869fbc	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e5-63c8-5f3d-36518ba0b943	00040000-55e5-63c6-00a6-2a22983ffdf1	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e5-63c8-68f8-a4fc84b784a0	00040000-55e5-63c6-1316-2a617fe30b22	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e5-63c9-39b8-8297ded34204	00040000-55e5-63c7-d739-7a35230cb38d	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2927 (class 0 OID 16756375)
-- Dependencies: 185
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55e5-63c6-d87c-64349f6e543f	8341	Adlešiči
00050000-55e5-63c6-6fed-cb2be83b2869	5270	Ajdovščina
00050000-55e5-63c6-adbd-34c133b47b0e	6280	Ankaran/Ancarano
00050000-55e5-63c6-2cf9-dae303bc6671	9253	Apače
00050000-55e5-63c6-1fef-d1aa764df313	8253	Artiče
00050000-55e5-63c6-3555-f9b4101f8dcd	4275	Begunje na Gorenjskem
00050000-55e5-63c6-22cd-0317442f69e0	1382	Begunje pri Cerknici
00050000-55e5-63c6-18a1-4a2d6e0a107b	9231	Beltinci
00050000-55e5-63c6-35b7-acd6d07c0a97	2234	Benedikt
00050000-55e5-63c6-d402-0ef65663f31d	2345	Bistrica ob Dravi
00050000-55e5-63c6-81e0-07aefd66b459	3256	Bistrica ob Sotli
00050000-55e5-63c6-7ede-582513fc9772	8259	Bizeljsko
00050000-55e5-63c6-d651-473bf1fe7af8	1223	Blagovica
00050000-55e5-63c6-580a-c4d23a1a4424	8283	Blanca
00050000-55e5-63c6-28e1-6c860e35a537	4260	Bled
00050000-55e5-63c6-3dfc-9123a6aa94d3	4273	Blejska Dobrava
00050000-55e5-63c6-741c-23b5d57117dd	9265	Bodonci
00050000-55e5-63c6-3374-fba0ca06a4f2	9222	Bogojina
00050000-55e5-63c6-82d3-574b1ec22931	4263	Bohinjska Bela
00050000-55e5-63c6-b6ab-53f21def5d21	4264	Bohinjska Bistrica
00050000-55e5-63c6-5426-806ce5b3fbc3	4265	Bohinjsko jezero
00050000-55e5-63c6-b804-700092a6a64f	1353	Borovnica
00050000-55e5-63c6-c565-fc06d321fbd6	8294	Boštanj
00050000-55e5-63c6-4a7d-77eedab468c1	5230	Bovec
00050000-55e5-63c6-53ae-093c2eaeb37e	5295	Branik
00050000-55e5-63c6-700c-2180aff3b637	3314	Braslovče
00050000-55e5-63c6-1586-ee2a9738fa2f	5223	Breginj
00050000-55e5-63c6-2ab5-0b075fd35bda	8280	Brestanica
00050000-55e5-63c6-b949-0bd962bdbffe	2354	Bresternica
00050000-55e5-63c6-10cf-187664dbb469	4243	Brezje
00050000-55e5-63c6-d986-8161318fd407	1351	Brezovica pri Ljubljani
00050000-55e5-63c6-8d8b-cbff23b37cc0	8250	Brežice
00050000-55e5-63c6-205a-2c54cf192493	4210	Brnik - Aerodrom
00050000-55e5-63c6-d3d4-f0965f4572cc	8321	Brusnice
00050000-55e5-63c6-dcb8-1e1b0d225f20	3255	Buče
00050000-55e5-63c6-5666-3c21a6df737c	8276	Bučka 
00050000-55e5-63c6-3e1d-3ff3a5fa9d59	9261	Cankova
00050000-55e5-63c6-ec2b-4f1e47dd21be	3000	Celje 
00050000-55e5-63c6-44bf-f4eadfe54a2d	3001	Celje - poštni predali
00050000-55e5-63c6-0055-e70189282616	4207	Cerklje na Gorenjskem
00050000-55e5-63c6-94e4-f71747bb6534	8263	Cerklje ob Krki
00050000-55e5-63c6-6ed6-23279b05d2df	1380	Cerknica
00050000-55e5-63c6-8fff-93f6ebd1f620	5282	Cerkno
00050000-55e5-63c6-a221-403d480cb886	2236	Cerkvenjak
00050000-55e5-63c6-562a-c96a2a81a721	2215	Ceršak
00050000-55e5-63c6-ecc1-23aa5d93ce5e	2326	Cirkovce
00050000-55e5-63c6-d1e7-f7235a4a73bc	2282	Cirkulane
00050000-55e5-63c6-4e7f-589291cb9b35	5273	Col
00050000-55e5-63c6-663b-fe540944cf63	8251	Čatež ob Savi
00050000-55e5-63c6-20dc-c18c90955033	1413	Čemšenik
00050000-55e5-63c6-6f23-518c601c4acf	5253	Čepovan
00050000-55e5-63c6-3452-b2f19f7a1d25	9232	Črenšovci
00050000-55e5-63c6-452a-1be53986e18f	2393	Črna na Koroškem
00050000-55e5-63c6-79ca-d22f94c3fde9	6275	Črni Kal
00050000-55e5-63c6-387c-6aea40d83f7f	5274	Črni Vrh nad Idrijo
00050000-55e5-63c6-bf59-42926c1d12df	5262	Črniče
00050000-55e5-63c6-3e5c-2c25706c3f61	8340	Črnomelj
00050000-55e5-63c6-3911-47e02527282c	6271	Dekani
00050000-55e5-63c6-de67-0914a1a16c8c	5210	Deskle
00050000-55e5-63c6-a643-202b7e6d2c94	2253	Destrnik
00050000-55e5-63c6-863a-8086563c3cca	6215	Divača
00050000-55e5-63c6-87ae-4e5fb744e1cd	1233	Dob
00050000-55e5-63c6-d0e7-c9bfd8fe7969	3224	Dobje pri Planini
00050000-55e5-63c6-b4bc-4d97e57655e8	8257	Dobova
00050000-55e5-63c6-94bd-d7213fcfc804	1423	Dobovec
00050000-55e5-63c6-1671-b74dcd94258d	5263	Dobravlje
00050000-55e5-63c6-bd98-8b17604fb7ac	3204	Dobrna
00050000-55e5-63c6-de74-1dd4d8dcb3bb	8211	Dobrnič
00050000-55e5-63c6-23eb-60caeee84104	1356	Dobrova
00050000-55e5-63c6-8282-1c14ad36e8a6	9223	Dobrovnik/Dobronak 
00050000-55e5-63c6-a55d-94e5de63a957	5212	Dobrovo v Brdih
00050000-55e5-63c6-e7dd-794bc6290c09	1431	Dol pri Hrastniku
00050000-55e5-63c6-34b5-24206566cffd	1262	Dol pri Ljubljani
00050000-55e5-63c6-c8ba-a87e11709465	1273	Dole pri Litiji
00050000-55e5-63c6-c797-5dbab1e54553	1331	Dolenja vas
00050000-55e5-63c6-0363-1b7a1c413631	8350	Dolenjske Toplice
00050000-55e5-63c6-087c-37e5011408ff	1230	Domžale
00050000-55e5-63c6-42f0-884b84088a48	2252	Dornava
00050000-55e5-63c6-38a5-daab1babf37d	5294	Dornberk
00050000-55e5-63c6-2a20-4cfdac6b6938	1319	Draga
00050000-55e5-63c6-59f8-0b03d4baf827	8343	Dragatuš
00050000-55e5-63c6-6a55-6affc295223d	3222	Dramlje
00050000-55e5-63c6-9398-b38198449a6b	2370	Dravograd
00050000-55e5-63c6-3a05-d731613135c4	4203	Duplje
00050000-55e5-63c6-4c9a-f2feabe42d83	6221	Dutovlje
00050000-55e5-63c6-577a-14ed5a4799be	8361	Dvor
00050000-55e5-63c6-5bbc-8d1a77195eae	2343	Fala
00050000-55e5-63c6-07bb-3849b5047ba3	9208	Fokovci
00050000-55e5-63c6-74b0-ac1b697edeac	2313	Fram
00050000-55e5-63c6-34f5-7f16ff36114e	3213	Frankolovo
00050000-55e5-63c6-aa22-e1df4bc19cab	1274	Gabrovka
00050000-55e5-63c6-bd50-67e3697c92c2	8254	Globoko
00050000-55e5-63c6-9bb0-26269740ca4f	5275	Godovič
00050000-55e5-63c6-5483-08e9f160287b	4204	Golnik
00050000-55e5-63c6-2159-111852015ca1	3303	Gomilsko
00050000-55e5-63c6-867d-b48a2ebcbcac	4224	Gorenja vas
00050000-55e5-63c6-5c11-ccb6c87736b6	3263	Gorica pri Slivnici
00050000-55e5-63c6-453e-bda8fe35022e	2272	Gorišnica
00050000-55e5-63c6-1dc0-91ec4e2967d4	9250	Gornja Radgona
00050000-55e5-63c6-c1f4-35de688a3f0d	3342	Gornji Grad
00050000-55e5-63c6-1f34-7d7f0068eca3	4282	Gozd Martuljek
00050000-55e5-63c6-5fa7-5eaaf95efdb3	6272	Gračišče
00050000-55e5-63c6-3beb-c94a9e75d939	9264	Grad
00050000-55e5-63c6-f8b6-73974ee06175	8332	Gradac
00050000-55e5-63c6-e2f7-3698307abb67	1384	Grahovo
00050000-55e5-63c6-4708-6a7f3322698f	5242	Grahovo ob Bači
00050000-55e5-63c6-6f48-57279e85bc86	5251	Grgar
00050000-55e5-63c6-537b-5d1c748c8909	3302	Griže
00050000-55e5-63c6-5680-f6e247555eca	3231	Grobelno
00050000-55e5-63c6-9c9e-5e7502716c3e	1290	Grosuplje
00050000-55e5-63c6-ce48-4444922902a1	2288	Hajdina
00050000-55e5-63c6-0fa8-60bed7d798ef	8362	Hinje
00050000-55e5-63c6-42cc-cb0d82de1690	2311	Hoče
00050000-55e5-63c6-b172-18ae640f9e19	9205	Hodoš/Hodos
00050000-55e5-63c6-0b31-5ea8edbfffec	1354	Horjul
00050000-55e5-63c6-f381-8cb1435da75e	1372	Hotedršica
00050000-55e5-63c6-0bb3-277b55170a3a	1430	Hrastnik
00050000-55e5-63c6-a966-7598a1d7fbf3	6225	Hruševje
00050000-55e5-63c6-5df5-527654ebe08e	4276	Hrušica
00050000-55e5-63c6-7ed5-7575d220b891	5280	Idrija
00050000-55e5-63c6-4a2a-f12aeaeb7dd3	1292	Ig
00050000-55e5-63c6-a3c9-1e4e0a7c12f2	6250	Ilirska Bistrica
00050000-55e5-63c6-6dbb-552cc3abb03d	6251	Ilirska Bistrica-Trnovo
00050000-55e5-63c6-79f2-2b554d1377a3	1295	Ivančna Gorica
00050000-55e5-63c6-8dd6-6d3d3c55de0d	2259	Ivanjkovci
00050000-55e5-63c6-42c5-f1251bd758c9	1411	Izlake
00050000-55e5-63c6-e9bd-f5293e48a024	6310	Izola/Isola
00050000-55e5-63c6-38b3-8f21b711c182	2222	Jakobski Dol
00050000-55e5-63c6-16b8-18ed198cfaad	2221	Jarenina
00050000-55e5-63c6-e5d6-7eb4f96a7cbb	6254	Jelšane
00050000-55e5-63c6-7cee-131f63c026e2	4270	Jesenice
00050000-55e5-63c6-3fc3-e44d0311f612	8261	Jesenice na Dolenjskem
00050000-55e5-63c6-6a8a-715c161ba9d1	3273	Jurklošter
00050000-55e5-63c6-dac8-db0cc889430a	2223	Jurovski Dol
00050000-55e5-63c6-3e91-f397ac36efcb	2256	Juršinci
00050000-55e5-63c6-88a3-049900a154dd	5214	Kal nad Kanalom
00050000-55e5-63c6-cf8c-4b435fd10539	3233	Kalobje
00050000-55e5-63c6-f607-affea9c9ea05	4246	Kamna Gorica
00050000-55e5-63c6-68c7-b1d20cc9eadd	2351	Kamnica
00050000-55e5-63c6-97dc-203e91fbef3a	1241	Kamnik
00050000-55e5-63c6-d0cc-3f10350fde7a	5213	Kanal
00050000-55e5-63c6-26bf-3f264f4a6b32	8258	Kapele
00050000-55e5-63c6-b3d8-24aed082097c	2362	Kapla
00050000-55e5-63c6-7c0c-51ee9bd40ba0	2325	Kidričevo
00050000-55e5-63c6-66fa-97735c877b5d	1412	Kisovec
00050000-55e5-63c6-5d1d-be34ee9cca2d	6253	Knežak
00050000-55e5-63c6-b5c9-9f91f2cce740	5222	Kobarid
00050000-55e5-63c6-4e38-6eec9130aa89	9227	Kobilje
00050000-55e5-63c6-446f-f1c240eb50cb	1330	Kočevje
00050000-55e5-63c6-b9db-a8fc2b562bb6	1338	Kočevska Reka
00050000-55e5-63c6-a12a-ffd9fc6a5bde	2276	Kog
00050000-55e5-63c6-8966-be82938b6026	5211	Kojsko
00050000-55e5-63c6-2e5e-9d8ea8c62391	6223	Komen
00050000-55e5-63c6-14f4-f88cc22768f7	1218	Komenda
00050000-55e5-63c6-23c1-ace6142d280a	6000	Koper/Capodistria 
00050000-55e5-63c6-85fb-fd6c733ab342	6001	Koper/Capodistria - poštni predali
00050000-55e5-63c6-046d-71d9f5e6d397	8282	Koprivnica
00050000-55e5-63c6-0970-fb860e6dd580	5296	Kostanjevica na Krasu
00050000-55e5-63c6-08bc-c4669cec7199	8311	Kostanjevica na Krki
00050000-55e5-63c6-c440-1b0e1513881b	1336	Kostel
00050000-55e5-63c6-05c5-0ea1be97d63d	6256	Košana
00050000-55e5-63c6-2d6d-46f51a89d964	2394	Kotlje
00050000-55e5-63c6-9893-2f88210c5746	6240	Kozina
00050000-55e5-63c6-fe4d-73da1c1fc6b8	3260	Kozje
00050000-55e5-63c6-4d48-4ae2230d8339	4000	Kranj 
00050000-55e5-63c6-3df0-ed7db9be6210	4001	Kranj - poštni predali
00050000-55e5-63c6-3dd9-c9466709fcd2	4280	Kranjska Gora
00050000-55e5-63c6-3f9c-b5aded3db43d	1281	Kresnice
00050000-55e5-63c6-acd0-2a78e1a2fe3b	4294	Križe
00050000-55e5-63c6-d880-a8a92732970d	9206	Križevci
00050000-55e5-63c6-e305-1559b22e23ea	9242	Križevci pri Ljutomeru
00050000-55e5-63c6-8645-cee4a0bb67af	1301	Krka
00050000-55e5-63c6-70b4-d7217fd68be3	8296	Krmelj
00050000-55e5-63c6-09f6-12fa99ec29b4	4245	Kropa
00050000-55e5-63c6-b21b-2aebb2f91f18	8262	Krška vas
00050000-55e5-63c6-47e9-72ce9e65bc1a	8270	Krško
00050000-55e5-63c6-c2b8-7ed4cd4b5aef	9263	Kuzma
00050000-55e5-63c6-f34b-83138717025a	2318	Laporje
00050000-55e5-63c6-cb70-e10e33da54cb	3270	Laško
00050000-55e5-63c6-6678-db0780ef17ff	1219	Laze v Tuhinju
00050000-55e5-63c6-87c8-8c11ae261610	2230	Lenart v Slovenskih goricah
00050000-55e5-63c6-dbef-f7312597660b	9220	Lendava/Lendva
00050000-55e5-63c6-893b-200595d55da8	4248	Lesce
00050000-55e5-63c6-3473-2255658f948f	3261	Lesično
00050000-55e5-63c6-a86d-36ca418e44f9	8273	Leskovec pri Krškem
00050000-55e5-63c6-807b-0756fee054a4	2372	Libeliče
00050000-55e5-63c6-eef3-7aa314000113	2341	Limbuš
00050000-55e5-63c6-af7d-7dcd8e715efe	1270	Litija
00050000-55e5-63c6-281d-a7f418c8c01d	3202	Ljubečna
00050000-55e5-63c6-ea8d-02a407f9a836	1000	Ljubljana 
00050000-55e5-63c6-0b61-38f117c63ce6	1001	Ljubljana - poštni predali
00050000-55e5-63c6-c263-eb1dafaa17f1	1231	Ljubljana - Črnuče
00050000-55e5-63c6-cfce-b85b8c5b60e3	1261	Ljubljana - Dobrunje
00050000-55e5-63c6-8936-48752981ced0	1260	Ljubljana - Polje
00050000-55e5-63c6-2aca-c3255a0dfa28	1210	Ljubljana - Šentvid
00050000-55e5-63c6-c9b3-58c7d6f740d8	1211	Ljubljana - Šmartno
00050000-55e5-63c6-b441-f41128d348bc	3333	Ljubno ob Savinji
00050000-55e5-63c6-ea87-9a0c67dcf51c	9240	Ljutomer
00050000-55e5-63c6-a77d-5ba58ba639c7	3215	Loče
00050000-55e5-63c6-fc86-a27671d4c3fa	5231	Log pod Mangartom
00050000-55e5-63c6-349e-3626514acf99	1358	Log pri Brezovici
00050000-55e5-63c6-3a90-999efa9099f3	1370	Logatec
00050000-55e5-63c6-f441-2e0205fcd4f6	1371	Logatec
00050000-55e5-63c6-c6fc-b7cf1a19599e	1434	Loka pri Zidanem Mostu
00050000-55e5-63c6-ff0a-f624c16df26f	3223	Loka pri Žusmu
00050000-55e5-63c6-32b4-ee7800b587c8	6219	Lokev
00050000-55e5-63c6-2b4b-05bc749ebfab	1318	Loški Potok
00050000-55e5-63c6-e300-c9dd7c043c41	2324	Lovrenc na Dravskem polju
00050000-55e5-63c6-68ae-24451aec4147	2344	Lovrenc na Pohorju
00050000-55e5-63c6-7fdb-ccec7c81e5fe	3334	Luče
00050000-55e5-63c6-cf82-fa87fd88ab38	1225	Lukovica
00050000-55e5-63c6-8e1f-abb5ed43ac2b	9202	Mačkovci
00050000-55e5-63c6-e606-ac7b6332ff21	2322	Majšperk
00050000-55e5-63c6-72b1-370f9552fb09	2321	Makole
00050000-55e5-63c6-8dcf-2abdf37e58e0	9243	Mala Nedelja
00050000-55e5-63c6-2b78-67659cb810c8	2229	Malečnik
00050000-55e5-63c6-a8fa-47c7ef5289a2	6273	Marezige
00050000-55e5-63c6-421b-7b0cbf72ea55	2000	Maribor 
00050000-55e5-63c6-b415-910a5df54440	2001	Maribor - poštni predali
00050000-55e5-63c6-39ad-81ac444714d9	2206	Marjeta na Dravskem polju
00050000-55e5-63c6-7a2a-0df1097b7084	2281	Markovci
00050000-55e5-63c6-79b9-354429e070cf	9221	Martjanci
00050000-55e5-63c6-2700-492c3be76517	6242	Materija
00050000-55e5-63c6-b5c6-168b261c60a1	4211	Mavčiče
00050000-55e5-63c6-a897-86445a96926d	1215	Medvode
00050000-55e5-63c6-78c7-943261b952bd	1234	Mengeš
00050000-55e5-63c6-efc9-cca770175e5f	8330	Metlika
00050000-55e5-63c6-b561-6d73ed515349	2392	Mežica
00050000-55e5-63c6-c886-0891c096a9de	2204	Miklavž na Dravskem polju
00050000-55e5-63c6-719d-752835dcf804	2275	Miklavž pri Ormožu
00050000-55e5-63c6-5db5-a6800c46fade	5291	Miren
00050000-55e5-63c6-60cd-57ad786ee28f	8233	Mirna
00050000-55e5-63c6-de50-0783fa389199	8216	Mirna Peč
00050000-55e5-63c6-d12a-409def32a6f3	2382	Mislinja
00050000-55e5-63c6-8540-52ee2d34e3fb	4281	Mojstrana
00050000-55e5-63c6-4ffa-82fa158fac2f	8230	Mokronog
00050000-55e5-63c6-9f0d-909c8e8ced73	1251	Moravče
00050000-55e5-63c6-7226-ef1b9d7df87f	9226	Moravske Toplice
00050000-55e5-63c6-a350-3f9d95817703	5216	Most na Soči
00050000-55e5-63c6-4746-16585ab37bf0	1221	Motnik
00050000-55e5-63c6-3c3b-a0b8694c4715	3330	Mozirje
00050000-55e5-63c6-3294-f5f8ab01983f	9000	Murska Sobota 
00050000-55e5-63c6-2043-81fb57814853	9001	Murska Sobota - poštni predali
00050000-55e5-63c6-d1b8-4b8e4eaa8d2f	2366	Muta
00050000-55e5-63c6-4396-7f1dec682433	4202	Naklo
00050000-55e5-63c6-f3c5-0ed56bac8422	3331	Nazarje
00050000-55e5-63c6-025a-3c4045833913	1357	Notranje Gorice
00050000-55e5-63c6-d92a-80b8ac4b227f	3203	Nova Cerkev
00050000-55e5-63c6-db37-3bd83a08ce44	5000	Nova Gorica 
00050000-55e5-63c6-fca1-6643a531b53e	5001	Nova Gorica - poštni predali
00050000-55e5-63c6-0cce-00946e97702b	1385	Nova vas
00050000-55e5-63c6-bd90-ea92ded1e1ad	8000	Novo mesto
00050000-55e5-63c6-f3eb-bbab98a54877	8001	Novo mesto - poštni predali
00050000-55e5-63c6-8af9-06b6fd71ec99	6243	Obrov
00050000-55e5-63c6-5384-c696cda8d9b3	9233	Odranci
00050000-55e5-63c6-69b4-52af229c5f8f	2317	Oplotnica
00050000-55e5-63c6-cf6c-a6895577a1ec	2312	Orehova vas
00050000-55e5-63c6-ac7f-e49b7aeb2e1e	2270	Ormož
00050000-55e5-63c6-31e6-aea92dbe9f92	1316	Ortnek
00050000-55e5-63c6-84f1-3efef76749d0	1337	Osilnica
00050000-55e5-63c6-4e70-38ad8228be45	8222	Otočec
00050000-55e5-63c6-b358-95cad5f6c004	2361	Ožbalt
00050000-55e5-63c6-dd32-b23e91e8b522	2231	Pernica
00050000-55e5-63c6-fbad-f668b727a706	2211	Pesnica pri Mariboru
00050000-55e5-63c6-14e2-5b4d7020a9f7	9203	Petrovci
00050000-55e5-63c6-fdd9-ca563c3643dc	3301	Petrovče
00050000-55e5-63c6-ec88-f3b85cf50043	6330	Piran/Pirano
00050000-55e5-63c6-4cb6-118f681ec5dd	8255	Pišece
00050000-55e5-63c6-09ae-40b3f3a2644d	6257	Pivka
00050000-55e5-63c6-021e-b899d66bc040	6232	Planina
00050000-55e5-63c6-ea3c-e269c0967396	3225	Planina pri Sevnici
00050000-55e5-63c6-5f2e-4a098d641c4c	6276	Pobegi
00050000-55e5-63c6-b295-81f9674d9602	8312	Podbočje
00050000-55e5-63c6-e362-d9f9d4bf100e	5243	Podbrdo
00050000-55e5-63c6-2611-0180e4da4198	3254	Podčetrtek
00050000-55e5-63c6-37c6-b146241714f7	2273	Podgorci
00050000-55e5-63c6-0362-669c760f87cd	6216	Podgorje
00050000-55e5-63c6-ac6a-59e6f13be0d5	2381	Podgorje pri Slovenj Gradcu
00050000-55e5-63c6-62bb-6d3989d90893	6244	Podgrad
00050000-55e5-63c6-3c70-8363ff5f0758	1414	Podkum
00050000-55e5-63c6-fd57-096efa9f3a9a	2286	Podlehnik
00050000-55e5-63c6-c63e-079c753bb21b	5272	Podnanos
00050000-55e5-63c6-23d3-f86855735d33	4244	Podnart
00050000-55e5-63c6-51fe-f3f073dc3811	3241	Podplat
00050000-55e5-63c6-aa61-9544a5703742	3257	Podsreda
00050000-55e5-63c6-411d-6b3a80ee0479	2363	Podvelka
00050000-55e5-63c6-1e25-0cab9659d783	2208	Pohorje
00050000-55e5-63c6-8ef5-a48800349979	2257	Polenšak
00050000-55e5-63c6-a454-139550112533	1355	Polhov Gradec
00050000-55e5-63c6-d18e-dcf05cf85557	4223	Poljane nad Škofjo Loko
00050000-55e5-63c6-270b-d19f8dffa008	2319	Poljčane
00050000-55e5-63c6-46eb-659c9745c4d2	1272	Polšnik
00050000-55e5-63c6-e341-59a08279a18c	3313	Polzela
00050000-55e5-63c6-c434-28687f45e764	3232	Ponikva
00050000-55e5-63c6-e0f0-614408018b6d	6320	Portorož/Portorose
00050000-55e5-63c6-058c-56cf893fc305	6230	Postojna
00050000-55e5-63c6-753a-b0f80df22133	2331	Pragersko
00050000-55e5-63c6-cb50-db428c9ccf60	3312	Prebold
00050000-55e5-63c6-b500-d6b5371c3761	4205	Preddvor
00050000-55e5-63c6-357d-95cd5243fc43	6255	Prem
00050000-55e5-63c6-949e-061d223c7bed	1352	Preserje
00050000-55e5-63c6-a69f-d87f499dfa11	6258	Prestranek
00050000-55e5-63c6-947a-da2c71dccafb	2391	Prevalje
00050000-55e5-63c6-ab90-5f372b8f7c35	3262	Prevorje
00050000-55e5-63c6-9ad6-c1a6c470edc9	1276	Primskovo 
00050000-55e5-63c6-f6b6-be72b90d58e0	3253	Pristava pri Mestinju
00050000-55e5-63c6-f9c9-e8bfa203147a	9207	Prosenjakovci/Partosfalva
00050000-55e5-63c6-b0b8-19b300979b15	5297	Prvačina
00050000-55e5-63c6-6c0f-8e35c195becb	2250	Ptuj
00050000-55e5-63c6-41f2-25e708700d34	2323	Ptujska Gora
00050000-55e5-63c6-5311-2d5fb863d175	9201	Puconci
00050000-55e5-63c6-d51f-1bcfcd65fcf7	2327	Rače
00050000-55e5-63c6-d737-571b8e3dcccb	1433	Radeče
00050000-55e5-63c6-3b7c-17e6b50f3439	9252	Radenci
00050000-55e5-63c6-0110-0b02b61cd934	2360	Radlje ob Dravi
00050000-55e5-63c6-8f36-04f3af7f1577	1235	Radomlje
00050000-55e5-63c6-edbb-00227fb518c7	4240	Radovljica
00050000-55e5-63c6-d0cf-287a6b1903e1	8274	Raka
00050000-55e5-63c6-31ef-08e3d79b4d54	1381	Rakek
00050000-55e5-63c6-3565-ee1f22c26993	4283	Rateče - Planica
00050000-55e5-63c6-688b-501ab46874e4	2390	Ravne na Koroškem
00050000-55e5-63c6-2d20-62aa6befe30f	9246	Razkrižje
00050000-55e5-63c6-a0c9-9e2211f97256	3332	Rečica ob Savinji
00050000-55e5-63c6-1a47-2594e96f4bc3	5292	Renče
00050000-55e5-63c6-2fb0-794b70cf4564	1310	Ribnica
00050000-55e5-63c6-0db1-613d9b67f71e	2364	Ribnica na Pohorju
00050000-55e5-63c6-cb28-2dbb5cb828b1	3272	Rimske Toplice
00050000-55e5-63c6-0d13-c155ea710f06	1314	Rob
00050000-55e5-63c6-2929-8eabcba732d1	5215	Ročinj
00050000-55e5-63c6-774a-2ae5be7b6d51	3250	Rogaška Slatina
00050000-55e5-63c6-6768-2f55734a3c01	9262	Rogašovci
00050000-55e5-63c6-9046-b5ed2a6eaf77	3252	Rogatec
00050000-55e5-63c6-8ba2-5c8ed87725d2	1373	Rovte
00050000-55e5-63c6-1648-a9dc7192c550	2342	Ruše
00050000-55e5-63c6-838f-b4784001fa2f	1282	Sava
00050000-55e5-63c6-a0f8-8a4279b0b900	6333	Sečovlje/Sicciole
00050000-55e5-63c6-91cc-19112f6b7a45	4227	Selca
00050000-55e5-63c6-ec57-c3b9e2c3cdc2	2352	Selnica ob Dravi
00050000-55e5-63c6-b0e2-10f4cdb2ae46	8333	Semič
00050000-55e5-63c6-ef0d-f92b5707205c	8281	Senovo
00050000-55e5-63c6-ff76-1b287422acf3	6224	Senožeče
00050000-55e5-63c6-b176-06379864a7ab	8290	Sevnica
00050000-55e5-63c6-d50c-883470b81cf9	6210	Sežana
00050000-55e5-63c6-1040-03e339ce6f8a	2214	Sladki Vrh
00050000-55e5-63c6-ed61-37f9a36ea96a	5283	Slap ob Idrijci
00050000-55e5-63c6-c86a-053b216ea6ed	2380	Slovenj Gradec
00050000-55e5-63c6-5fdd-557109d2c08c	2310	Slovenska Bistrica
00050000-55e5-63c6-d57b-35c3f57c5071	3210	Slovenske Konjice
00050000-55e5-63c6-3beb-d882b49613d7	1216	Smlednik
00050000-55e5-63c6-ccfc-bf724258cf95	5232	Soča
00050000-55e5-63c6-1a4e-5e5e15c1a8a6	1317	Sodražica
00050000-55e5-63c6-73a8-e156d3f5bf89	3335	Solčava
00050000-55e5-63c6-8fde-c8a2625451ea	5250	Solkan
00050000-55e5-63c6-1a3f-35e892a13619	4229	Sorica
00050000-55e5-63c6-626a-b1883f77e6f4	4225	Sovodenj
00050000-55e5-63c6-6391-84b4dfdc8636	5281	Spodnja Idrija
00050000-55e5-63c6-2333-b5b254682683	2241	Spodnji Duplek
00050000-55e5-63c6-c715-70d9ce6f059f	9245	Spodnji Ivanjci
00050000-55e5-63c6-284e-c7ad40293f19	2277	Središče ob Dravi
00050000-55e5-63c6-1822-58bb614ea877	4267	Srednja vas v Bohinju
00050000-55e5-63c6-1e79-8d710a3488ee	8256	Sromlje 
00050000-55e5-63c6-26b4-59ee86157bdf	5224	Srpenica
00050000-55e5-63c6-c708-19eb53edb41b	1242	Stahovica
00050000-55e5-63c6-ee81-18e869c533de	1332	Stara Cerkev
00050000-55e5-63c6-b1dd-11f0323fc87b	8342	Stari trg ob Kolpi
00050000-55e5-63c6-e5e9-2b494c4d6307	1386	Stari trg pri Ložu
00050000-55e5-63c6-4398-4941145974d1	2205	Starše
00050000-55e5-63c6-d1d5-cf54f9a87b30	2289	Stoperce
00050000-55e5-63c6-7ed0-905e807aa36e	8322	Stopiče
00050000-55e5-63c6-17a9-834b9a8b4021	3206	Stranice
00050000-55e5-63c6-e784-2e4df455f20a	8351	Straža
00050000-55e5-63c6-0a99-37d517e941bd	1313	Struge
00050000-55e5-63c6-be92-c7dd3946d4ea	8293	Studenec
00050000-55e5-63c6-be65-6b479ad6fdea	8331	Suhor
00050000-55e5-63c6-336b-6d599b300df2	2233	Sv. Ana v Slovenskih goricah
00050000-55e5-63c6-6ab9-86075480dfe8	2235	Sv. Trojica v Slovenskih goricah
00050000-55e5-63c6-6c28-7ddbdfadde65	2353	Sveti Duh na Ostrem Vrhu
00050000-55e5-63c6-aa3e-2b2e49c06e66	9244	Sveti Jurij ob Ščavnici
00050000-55e5-63c6-1313-d8c913e40b18	3264	Sveti Štefan
00050000-55e5-63c6-2912-950abe994ebc	2258	Sveti Tomaž
00050000-55e5-63c6-9882-3e527f72abdd	9204	Šalovci
00050000-55e5-63c6-ff6f-9bde5a9f47b1	5261	Šempas
00050000-55e5-63c6-43c9-a29da44d4be5	5290	Šempeter pri Gorici
00050000-55e5-63c6-17a7-c42230bfe3f5	3311	Šempeter v Savinjski dolini
00050000-55e5-63c6-33cf-4d888a2a1e3f	4208	Šenčur
00050000-55e5-63c6-e039-9a038dc22ce8	2212	Šentilj v Slovenskih goricah
00050000-55e5-63c6-8824-f97cee56312a	8297	Šentjanž
00050000-55e5-63c6-c23c-9a0278abf3f8	2373	Šentjanž pri Dravogradu
00050000-55e5-63c6-0908-6c0753833741	8310	Šentjernej
00050000-55e5-63c6-1515-d0999f61596e	3230	Šentjur
00050000-55e5-63c6-230d-9f29640de674	3271	Šentrupert
00050000-55e5-63c6-afb9-1835a0bf0bd0	8232	Šentrupert
00050000-55e5-63c6-ff12-5840388e7136	1296	Šentvid pri Stični
00050000-55e5-63c6-fcb7-61a22406e97a	8275	Škocjan
00050000-55e5-63c6-e282-5707702d5ca5	6281	Škofije
00050000-55e5-63c6-3c3b-25a8139a3c75	4220	Škofja Loka
00050000-55e5-63c6-ee52-bc8af5b938e9	3211	Škofja vas
00050000-55e5-63c6-a2ff-65c714b27e7e	1291	Škofljica
00050000-55e5-63c6-4b55-2087a7798ae6	6274	Šmarje
00050000-55e5-63c6-10bf-0441499506e9	1293	Šmarje - Sap
00050000-55e5-63c6-da98-e02ba2f0d9af	3240	Šmarje pri Jelšah
00050000-55e5-63c6-481d-ccdf8bb7f3e7	8220	Šmarješke Toplice
00050000-55e5-63c6-2018-305b2ee85de3	2315	Šmartno na Pohorju
00050000-55e5-63c6-149e-482ae8d4302d	3341	Šmartno ob Dreti
00050000-55e5-63c6-d425-bbf4895b5611	3327	Šmartno ob Paki
00050000-55e5-63c6-bd81-d364929794bf	1275	Šmartno pri Litiji
00050000-55e5-63c6-4f89-01c544df4fb3	2383	Šmartno pri Slovenj Gradcu
00050000-55e5-63c6-a68b-2fa056dd61e8	3201	Šmartno v Rožni dolini
00050000-55e5-63c6-1732-150ba0cd5493	3325	Šoštanj
00050000-55e5-63c6-dd42-13e9294c839a	6222	Štanjel
00050000-55e5-63c6-3fdc-a344f4aeefd5	3220	Štore
00050000-55e5-63c6-1dcf-33ce56265441	3304	Tabor
00050000-55e5-63c6-8d40-8f8a32179106	3221	Teharje
00050000-55e5-63c6-ffcf-5b939e561bc2	9251	Tišina
00050000-55e5-63c6-a9c4-fd478efc8ae9	5220	Tolmin
00050000-55e5-63c6-2abd-20bef142b7e0	3326	Topolšica
00050000-55e5-63c6-5d7d-271326af8fa2	2371	Trbonje
00050000-55e5-63c6-5c98-bd2c8a0c6cde	1420	Trbovlje
00050000-55e5-63c6-7517-487341b19cf4	8231	Trebelno 
00050000-55e5-63c6-7890-e41fb7dd4e67	8210	Trebnje
00050000-55e5-63c6-7b39-c0b3eac55124	5252	Trnovo pri Gorici
00050000-55e5-63c6-84b4-23d343d4aa33	2254	Trnovska vas
00050000-55e5-63c6-4ee8-9c20cdcd101f	1222	Trojane
00050000-55e5-63c6-f46c-3f3a0e0e5066	1236	Trzin
00050000-55e5-63c6-1578-1690c38d4194	4290	Tržič
00050000-55e5-63c6-512c-2e7255bfcbc2	8295	Tržišče
00050000-55e5-63c6-7630-23e785fd0284	1311	Turjak
00050000-55e5-63c6-9f32-f3e650f27b7e	9224	Turnišče
00050000-55e5-63c6-b193-cb5973dec54a	8323	Uršna sela
00050000-55e5-63c6-45d8-88d7318617c3	1252	Vače
00050000-55e5-63c6-b325-1e966a8bee0e	3320	Velenje 
00050000-55e5-63c6-1fd1-0a09f0618a97	3322	Velenje - poštni predali
00050000-55e5-63c6-dc58-e981a949fafa	8212	Velika Loka
00050000-55e5-63c6-728e-906407e72133	2274	Velika Nedelja
00050000-55e5-63c6-13c7-b6f1ed1ecde0	9225	Velika Polana
00050000-55e5-63c6-7117-be6ab40847c7	1315	Velike Lašče
00050000-55e5-63c6-00e8-41d74f20f7ce	8213	Veliki Gaber
00050000-55e5-63c6-b923-d5d0ed49b5e6	9241	Veržej
00050000-55e5-63c6-509b-a472af80ec05	1312	Videm - Dobrepolje
00050000-55e5-63c6-1d5f-a33a0d8ebab0	2284	Videm pri Ptuju
00050000-55e5-63c6-542e-17f6cd64b5c6	8344	Vinica
00050000-55e5-63c6-5634-4780900902be	5271	Vipava
00050000-55e5-63c6-6001-b681c3103d10	4212	Visoko
00050000-55e5-63c6-eb39-0453bb4b8251	1294	Višnja Gora
00050000-55e5-63c6-b10a-adf3bdb367cf	3205	Vitanje
00050000-55e5-63c6-9be6-3adbdff5a54e	2255	Vitomarci
00050000-55e5-63c6-7017-b6065a73ba92	1217	Vodice
00050000-55e5-63c6-7d8b-9ecf4952c0d2	3212	Vojnik\t
00050000-55e5-63c6-d4af-437de306162c	5293	Volčja Draga
00050000-55e5-63c6-594d-2683f96b873b	2232	Voličina
00050000-55e5-63c6-a515-fed0b345b24d	3305	Vransko
00050000-55e5-63c6-2c90-3e1cbbb13185	6217	Vremski Britof
00050000-55e5-63c6-d13e-aeca818a5859	1360	Vrhnika
00050000-55e5-63c6-84ce-3a70a1bac991	2365	Vuhred
00050000-55e5-63c6-7997-9b5e574bd05d	2367	Vuzenica
00050000-55e5-63c6-0399-1b5a0de92bd8	8292	Zabukovje 
00050000-55e5-63c6-965e-93595e787ee0	1410	Zagorje ob Savi
00050000-55e5-63c6-4ab6-59a3d22d95ff	1303	Zagradec
00050000-55e5-63c6-784c-c5244e83f7aa	2283	Zavrč
00050000-55e5-63c6-762c-90fbfebbb8bf	8272	Zdole 
00050000-55e5-63c6-c10f-944f9994e5f2	4201	Zgornja Besnica
00050000-55e5-63c6-51ad-c26c185444e6	2242	Zgornja Korena
00050000-55e5-63c6-652a-95d2093233ff	2201	Zgornja Kungota
00050000-55e5-63c6-7035-201a3dbc256f	2316	Zgornja Ložnica
00050000-55e5-63c6-986e-3ed2d288c8b7	2314	Zgornja Polskava
00050000-55e5-63c6-f7d8-e8ffb654585a	2213	Zgornja Velka
00050000-55e5-63c6-57fe-527a92a5f9ca	4247	Zgornje Gorje
00050000-55e5-63c6-ae89-8bd97e1daa6d	4206	Zgornje Jezersko
00050000-55e5-63c6-99ce-ac8d8805fb31	2285	Zgornji Leskovec
00050000-55e5-63c6-0b3f-07b8ed0c5ced	1432	Zidani Most
00050000-55e5-63c6-4831-afe9e01976f4	3214	Zreče
00050000-55e5-63c6-dce0-5dcfc29ea975	4209	Žabnica
00050000-55e5-63c6-98cc-5afffb9a15a3	3310	Žalec
00050000-55e5-63c6-5afd-e10ce896a4f4	4228	Železniki
00050000-55e5-63c6-ec2f-6254e12f86ec	2287	Žetale
00050000-55e5-63c6-25d7-b3c198f1833c	4226	Žiri
00050000-55e5-63c6-ede9-14ff48d1e34e	4274	Žirovnica
00050000-55e5-63c6-0022-8366ac197677	8360	Žužemberk
\.


--
-- TOC entry 2943 (class 0 OID 16756550)
-- Dependencies: 201
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 16756360)
-- Dependencies: 184
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55e5-63c8-ee47-c93cb219c380	00080000-55e5-63c8-87b0-f03262c818f2	\N	00040000-55e5-63c7-d739-7a35230cb38d	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55e5-63c8-0212-f3211ba106e0	00080000-55e5-63c8-87b0-f03262c818f2	\N	00040000-55e5-63c7-d739-7a35230cb38d		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55e5-63c8-5d0b-61c969ef86f5	00080000-55e5-63c8-952a-db2500c4cb6b	\N	00040000-55e5-63c7-d739-7a35230cb38d		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2932 (class 0 OID 16756438)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 16756562)
-- Dependencies: 203
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 16756914)
-- Dependencies: 227
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 16756924)
-- Dependencies: 228
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55e5-63c8-4d98-3da31578b617	00080000-55e5-63c8-c2b8-46c60aee8422	0987	AK
00190000-55e5-63c8-90a4-09bf18d81299	00080000-55e5-63c8-952a-db2500c4cb6b	0989	AK
00190000-55e5-63c8-5229-4d98805926b3	00080000-55e5-63c8-3437-5b3577ce80bb	0986	AK
00190000-55e5-63c8-8802-5e8593bba4ba	00080000-55e5-63c8-e7a0-cc1982d44593	0984	AK
00190000-55e5-63c8-de15-347a02a06e59	00080000-55e5-63c8-5f3d-36518ba0b943	0983	AK
00190000-55e5-63c8-30d4-ce03c4eb36b0	00080000-55e5-63c8-68f8-a4fc84b784a0	0982	AK
00190000-55e5-63c9-12a8-d8cb6d97c094	00080000-55e5-63c9-39b8-8297ded34204	1001	AK
\.


--
-- TOC entry 2968 (class 0 OID 16756870)
-- Dependencies: 226
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55e5-63c8-6dec-2d9b784c31e1	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2971 (class 0 OID 16756932)
-- Dependencies: 229
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 16756591)
-- Dependencies: 207
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, seplanira, kapaciteta, opis) FROM stdin;
00220000-55e5-63c8-23fb-c0ff02165aa3	\N	\N	0001	Poskusna 1	f	t	8	Poskusna učilnica v prvem
00220000-55e5-63c8-caf6-0f0bad0cd7aa	\N	\N	0002	Poskusna 3	f	f	34	Poskusna učilnica v tretjem
00220000-55e5-63c8-1960-396afe036b8a	\N	\N	0003	Kazinska	t	t	84	Kazinska dvorana
00220000-55e5-63c8-a74b-ae6bdb91ec5d	\N	\N	0004	Mali oder	t	t	24	Mali oder 
00220000-55e5-63c8-3b43-3aa7995be994	\N	\N	0005	Komorni oder	t	t	15	Komorni oder
00220000-55e5-63c8-910e-094a3b2aab5c	\N	\N	0006	Stara dvorana	t	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55e5-63c8-99c5-0d77e46e6e4b	\N	\N	0007	Velika dvorana	t	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2941 (class 0 OID 16756535)
-- Dependencies: 199
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 16756525)
-- Dependencies: 198
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 16756723)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 16756662)
-- Dependencies: 214
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 16756233)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55e5-63c9-39b8-8297ded34204	00010000-55e5-63c7-9b88-7d30f3ba6617	2015-09-01 10:37:29	INS	a:0:{}
2	App\\Entity\\Option	00000000-55e5-63c9-70ca-b5b627d319b8	00010000-55e5-63c7-9b88-7d30f3ba6617	2015-09-01 10:37:29	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55e5-63c9-12a8-d8cb6d97c094	00010000-55e5-63c7-9b88-7d30f3ba6617	2015-09-01 10:37:29	INS	a:0:{}
\.


--
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2950 (class 0 OID 16756604)
-- Dependencies: 208
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 16756271)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55e5-63c7-168e-8fd8a7b22c3e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55e5-63c7-affa-5cbdb904b06f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55e5-63c7-ab80-6b8ba83ae273	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55e5-63c7-e93a-938ef2d78701	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55e5-63c7-9e60-3b81125d7f10	planer	Planer dogodkov v koledarju	t
00020000-55e5-63c7-c453-ab7b60843204	kadrovska	Kadrovska služba	t
00020000-55e5-63c7-1fc5-08382f21feda	arhivar	Ažuriranje arhivalij	t
00020000-55e5-63c7-6896-e9d9cbee935b	igralec	Igralec	t
00020000-55e5-63c7-6538-6f5a073daea4	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55e5-63c8-6cb4-07c487957784	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2917 (class 0 OID 16756255)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55e5-63c7-0ff9-18fd7ae3c14c	00020000-55e5-63c7-ab80-6b8ba83ae273
00010000-55e5-63c7-9b88-7d30f3ba6617	00020000-55e5-63c7-ab80-6b8ba83ae273
00010000-55e5-63c8-1ea5-33c5b075f394	00020000-55e5-63c8-6cb4-07c487957784
\.


--
-- TOC entry 2952 (class 0 OID 16756618)
-- Dependencies: 210
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 16756556)
-- Dependencies: 202
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 16756502)
-- Dependencies: 196
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 16756973)
-- Dependencies: 234
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55e5-63c6-f07b-102e271f1b53	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55e5-63c6-8a30-cfa0f86fe8dc	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55e5-63c6-e2a9-153227424955	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55e5-63c6-27e7-7b7d6a5cf9b4	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55e5-63c6-3818-9dfec8ec0b2d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2975 (class 0 OID 16756965)
-- Dependencies: 233
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55e5-63c6-8be2-0f7cb1473c17	00230000-55e5-63c6-27e7-7b7d6a5cf9b4	popa
00240000-55e5-63c6-ca5d-f4e01849a4d4	00230000-55e5-63c6-27e7-7b7d6a5cf9b4	oseba
00240000-55e5-63c6-11fc-5bcbc8adbddd	00230000-55e5-63c6-27e7-7b7d6a5cf9b4	sezona
00240000-55e5-63c6-5164-38af98c9a4d8	00230000-55e5-63c6-8a30-cfa0f86fe8dc	prostor
00240000-55e5-63c6-9279-d349b46aa0fd	00230000-55e5-63c6-27e7-7b7d6a5cf9b4	besedilo
00240000-55e5-63c6-f64d-5ed5339ed436	00230000-55e5-63c6-27e7-7b7d6a5cf9b4	uprizoritev
00240000-55e5-63c6-8c6c-0e685b776b33	00230000-55e5-63c6-27e7-7b7d6a5cf9b4	funkcija
00240000-55e5-63c6-b0d7-4e9961b2275d	00230000-55e5-63c6-27e7-7b7d6a5cf9b4	tipfunkcije
00240000-55e5-63c6-5091-be8a7a7d2f89	00230000-55e5-63c6-27e7-7b7d6a5cf9b4	alternacija
00240000-55e5-63c6-b564-cdd2132122ea	00230000-55e5-63c6-f07b-102e271f1b53	pogodba
00240000-55e5-63c6-aa02-ca1a1c3a2eb1	00230000-55e5-63c6-27e7-7b7d6a5cf9b4	zaposlitev
00240000-55e5-63c6-cfdc-0f76c9026729	00230000-55e5-63c6-f07b-102e271f1b53	programdela
00240000-55e5-63c6-3472-530eef766783	00230000-55e5-63c6-27e7-7b7d6a5cf9b4	zapis
\.


--
-- TOC entry 2974 (class 0 OID 16756960)
-- Dependencies: 232
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
ed846052-c996-443e-b12f-1d0e9ff8c13d	00230000-55e5-63c6-27e7-7b7d6a5cf9b4	0	1001
\.


--
-- TOC entry 2957 (class 0 OID 16756672)
-- Dependencies: 215
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55e5-63c8-ef54-1a37c6936e8e	000e0000-55e5-63c8-30b1-e4a9c05c2a57	00080000-55e5-63c8-87b0-f03262c818f2	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55e5-63c7-58e0-dd991d2496cb
00270000-55e5-63c8-b295-c6d1b8da5d28	000e0000-55e5-63c8-30b1-e4a9c05c2a57	00080000-55e5-63c8-87b0-f03262c818f2	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55e5-63c7-58e0-dd991d2496cb
00270000-55e5-63c8-3f4e-0acd4468cafa	000e0000-55e5-63c8-30b1-e4a9c05c2a57	00080000-55e5-63c8-f1a6-6a5e34102f53	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2924 (class 0 OID 16756333)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 16756512)
-- Dependencies: 197
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55e5-63c8-7cc3-6ee0fb9b103b	00180000-55e5-63c8-a540-fc7bfbf9321a	000c0000-55e5-63c8-1086-f1661ac8f145	00090000-55e5-63c8-e12b-2cbf4fd3dffa	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e5-63c8-658f-4ace36e5f43c	00180000-55e5-63c8-a540-fc7bfbf9321a	000c0000-55e5-63c8-155a-aef50c1aca5c	00090000-55e5-63c8-f94f-a8194306b799	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e5-63c8-b725-40be387ad473	00180000-55e5-63c8-a540-fc7bfbf9321a	000c0000-55e5-63c8-6b9f-a3b932b5fd91	00090000-55e5-63c8-cb75-a9da9ecdd645	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e5-63c8-b4b8-912b17ad159a	00180000-55e5-63c8-a540-fc7bfbf9321a	000c0000-55e5-63c8-868e-10434dfdf497	00090000-55e5-63c8-e17b-08bd3a0d1782	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e5-63c8-52c0-b5871950b325	00180000-55e5-63c8-a540-fc7bfbf9321a	000c0000-55e5-63c8-42f0-1a28cea2430d	00090000-55e5-63c8-2ba3-21840c69a986	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e5-63c8-c35b-fa253e4ee343	00180000-55e5-63c8-3642-cc4bd3e76309	\N	00090000-55e5-63c8-2ba3-21840c69a986	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2960 (class 0 OID 16756712)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55e5-63c6-9f51-c39d35905d27	Avtor	Avtorji	Avtorka	umetnik
000f0000-55e5-63c6-fc58-028a67e95c0a	Priredba	Priredba	Priredba	umetnik
000f0000-55e5-63c6-9404-8db4957c9629	Prevod	Prevod	Prevod	umetnik
000f0000-55e5-63c6-aa79-cf94bc86f5c8	Režija	Režija	Režija	umetnik
000f0000-55e5-63c6-b62b-74cfa2a0dfe6	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55e5-63c6-1d1b-004415581bdc	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55e5-63c6-3d3a-87918479dce5	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55e5-63c6-620e-1de0d3976734	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55e5-63c6-e493-66dfa7f47c24	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55e5-63c6-3fc3-d6601e78caa5	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55e5-63c6-0275-f07d3ee735da	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55e5-63c6-0545-597095804438	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55e5-63c6-8c4e-76b0fe4a25a5	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55e5-63c6-3c38-6d07b40dbd52	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55e5-63c6-ded3-6fc8d1d1a085	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55e5-63c6-5fa1-1c36354854a1	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55e5-63c6-ca6e-631f2069d455	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55e5-63c6-a484-83c0d00cf37d	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2972 (class 0 OID 16756942)
-- Dependencies: 230
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55e5-63c6-5f53-2aa58414d662	01	Velika predstava	f	1.00	1.00
002b0000-55e5-63c6-acf3-109049fe81ae	02	Mala predstava	f	0.50	0.50
002b0000-55e5-63c6-8b57-9a79c9cb1451	03	Mala koprodukcija	t	0.40	1.00
002b0000-55e5-63c6-bb30-c9fa68aa0ac3	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55e5-63c6-e347-5885c14696e8	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2929 (class 0 OID 16756395)
-- Dependencies: 187
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 16756242)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55e5-63c7-9b88-7d30f3ba6617	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROsOPgFPcp/MC3JVuPu1wNAusvyr7v83m	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55e5-63c8-aed3-bffd58b0b220	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55e5-63c8-4888-310346aa986f	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55e5-63c8-88c0-bdc279d79461	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55e5-63c8-c9b1-4fc2f2134f0c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55e5-63c8-3445-38d7dc7a5d27	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55e5-63c8-96e6-bd1f2fb5c648	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55e5-63c8-0b7d-e5908f1a6eb1	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55e5-63c8-81f5-83c8dc32bb29	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55e5-63c8-f0a0-8e40fc82125b	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55e5-63c8-1ea5-33c5b075f394	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55e5-63c7-0ff9-18fd7ae3c14c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2964 (class 0 OID 16756760)
-- Dependencies: 222
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55e5-63c8-607d-31c606d98db1	00160000-55e5-63c8-005e-5f4b34cb128a	\N	00140000-55e5-63c6-f3cd-ec72d70ced4f	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55e5-63c8-3b43-3aa7995be994
000e0000-55e5-63c8-30b1-e4a9c05c2a57	00160000-55e5-63c8-092c-34b204e6ff7e	\N	00140000-55e5-63c6-a80d-537def92fdab	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55e5-63c8-910e-094a3b2aab5c
000e0000-55e5-63c8-1f63-186b913afcc4	\N	\N	00140000-55e5-63c6-a80d-537def92fdab	00190000-55e5-63c8-4d98-3da31578b617	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55e5-63c8-3b43-3aa7995be994
000e0000-55e5-63c8-895e-0c19747366a0	\N	\N	00140000-55e5-63c6-a80d-537def92fdab	00190000-55e5-63c8-4d98-3da31578b617	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55e5-63c8-3b43-3aa7995be994
000e0000-55e5-63c8-f2b0-9f87ffbd3817	\N	\N	00140000-55e5-63c6-a80d-537def92fdab	00190000-55e5-63c8-4d98-3da31578b617	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55e5-63c8-23fb-c0ff02165aa3
000e0000-55e5-63c8-452b-59512e82beec	\N	\N	00140000-55e5-63c6-a80d-537def92fdab	00190000-55e5-63c8-4d98-3da31578b617	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55e5-63c8-23fb-c0ff02165aa3
\.


--
-- TOC entry 2934 (class 0 OID 16756456)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55e5-63c8-f9e8-e6c85a234bbd	000e0000-55e5-63c8-30b1-e4a9c05c2a57	\N	1	
00200000-55e5-63c8-bf42-97c4f15c4c0b	000e0000-55e5-63c8-30b1-e4a9c05c2a57	\N	2	
\.


--
-- TOC entry 2948 (class 0 OID 16756583)
-- Dependencies: 206
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 16756686)
-- Dependencies: 216
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55e5-63c7-46b4-94f9381d922f	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55e5-63c7-1e03-83c90e326749	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55e5-63c7-5003-509414e44aae	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55e5-63c7-cc08-c436c738efc4	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55e5-63c7-27c5-79e2c4ca38b6	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55e5-63c7-b17a-98051333fb84	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55e5-63c7-3e28-cd6706f804c5	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55e5-63c7-1d4c-ede06813be2f	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55e5-63c7-58e0-dd991d2496cb	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55e5-63c7-6c84-3cca33d2ba66	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55e5-63c7-e80e-ec33aa3985b0	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55e5-63c7-f9ad-2dec434c11b6	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55e5-63c7-3515-f34c3ea201fc	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55e5-63c7-640f-a71a5de3def4	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55e5-63c7-eaa3-ca323f27fb92	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55e5-63c7-9b98-7517f2f99548	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55e5-63c7-fbf9-5205244255f1	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55e5-63c7-7e8e-c3de57d88fbd	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55e5-63c7-268f-722f32206f4a	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55e5-63c7-8b5d-b85242a66c40	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55e5-63c7-f604-ee8d7e37aef3	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55e5-63c7-5e4e-8ad09e5d4fdf	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55e5-63c7-7b57-f738374f8760	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55e5-63c7-4889-b1b5d08094dd	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55e5-63c7-3903-1767b776eb2a	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55e5-63c7-8e25-17c72255075f	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55e5-63c7-0115-b6b7f1e31e8b	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55e5-63c7-666d-b53dbae671bf	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2978 (class 0 OID 16757012)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 16756984)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 16757024)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 16756655)
-- Dependencies: 213
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55e5-63c8-d62e-8f7ec683dbdf	00090000-55e5-63c8-f94f-a8194306b799	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e5-63c8-96c1-569da93df869	00090000-55e5-63c8-cb75-a9da9ecdd645	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e5-63c8-dd70-dcc5a81fe758	00090000-55e5-63c8-ca6e-a427aa34c861	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e5-63c8-248d-fee33d63350b	00090000-55e5-63c8-9212-31aa7c6d64f1	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e5-63c8-cbc6-882310c3739d	00090000-55e5-63c8-e12b-2cbf4fd3dffa	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e5-63c8-d0ac-ee0d84bbf8b3	00090000-55e5-63c8-4637-7446de6c7128	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2936 (class 0 OID 16756492)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 16756750)
-- Dependencies: 221
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55e5-63c6-f3cd-ec72d70ced4f	01	Drama	drama (SURS 01)
00140000-55e5-63c6-3ea7-d3c61bcc429f	02	Opera	opera (SURS 02)
00140000-55e5-63c6-2cd4-be09579dbec5	03	Balet	balet (SURS 03)
00140000-55e5-63c6-60d4-581631de8314	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55e5-63c6-81ee-2247fb085091	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55e5-63c6-a80d-537def92fdab	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55e5-63c6-7afa-0984d07e74a0	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2954 (class 0 OID 16756645)
-- Dependencies: 212
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2461 (class 2606 OID 16756296)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 16756809)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 16756799)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 16756711)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 16757064)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 16756481)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 16705987)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 16756501)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 16756958)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 16756421)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 16756864)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 16756641)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 16756454)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 16705981)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 16756435)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 16756548)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 16757041)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 16757048)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2704 (class 2606 OID 16757072)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 16756575)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 16756393)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 16756305)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 16756329)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 16756285)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2452 (class 2606 OID 16756270)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 16756581)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 16756617)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 16756745)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 16756357)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 16756381)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 16756554)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 16756371)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 16756442)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 16756566)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 16756921)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 16756929)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 16756912)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 16756940)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 16756599)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 16756539)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 16756530)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 16756733)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 16756669)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 16756241)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 16756608)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 16756259)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2454 (class 2606 OID 16756279)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 16756626)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 16756561)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 16756510)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 16756982)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 16756970)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 16756964)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 16756682)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 16756338)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 16756521)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 16756722)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 16756952)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 16756406)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 16756254)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 16756778)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 16756464)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 16756589)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 16756694)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 16757022)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 16757006)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 16757030)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 16756660)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 16756496)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 16756758)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 16756653)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 1259 OID 16756490)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2517 (class 1259 OID 16756491)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2518 (class 1259 OID 16756489)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2519 (class 1259 OID 16756488)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2601 (class 1259 OID 16756683)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2602 (class 1259 OID 16756684)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2603 (class 1259 OID 16756685)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2690 (class 1259 OID 16757043)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2691 (class 1259 OID 16757042)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2475 (class 1259 OID 16756359)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2564 (class 1259 OID 16756582)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2677 (class 1259 OID 16757010)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2678 (class 1259 OID 16757009)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2679 (class 1259 OID 16757011)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2680 (class 1259 OID 16757008)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2681 (class 1259 OID 16757007)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2558 (class 1259 OID 16756568)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2559 (class 1259 OID 16756567)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2511 (class 1259 OID 16756465)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2588 (class 1259 OID 16756642)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2589 (class 1259 OID 16756644)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2590 (class 1259 OID 16756643)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2500 (class 1259 OID 16756437)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2501 (class 1259 OID 16756436)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2660 (class 1259 OID 16756941)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2614 (class 1259 OID 16756747)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2615 (class 1259 OID 16756748)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2616 (class 1259 OID 16756749)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2687 (class 1259 OID 16757031)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2623 (class 1259 OID 16756783)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2624 (class 1259 OID 16756780)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2625 (class 1259 OID 16756784)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2626 (class 1259 OID 16756782)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2627 (class 1259 OID 16756781)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2490 (class 1259 OID 16756408)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2491 (class 1259 OID 16756407)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2466 (class 1259 OID 16756332)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2576 (class 1259 OID 16756609)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2440 (class 1259 OID 16705982)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2456 (class 1259 OID 16756286)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2457 (class 1259 OID 16756287)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2581 (class 1259 OID 16756629)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2582 (class 1259 OID 16756628)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2583 (class 1259 OID 16756627)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2504 (class 1259 OID 16756443)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2505 (class 1259 OID 16756444)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2670 (class 1259 OID 16756972)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2538 (class 1259 OID 16756534)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2539 (class 1259 OID 16756532)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2540 (class 1259 OID 16756531)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2541 (class 1259 OID 16756533)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2447 (class 1259 OID 16756260)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2448 (class 1259 OID 16756261)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2567 (class 1259 OID 16756590)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2700 (class 1259 OID 16757065)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2701 (class 1259 OID 16757073)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2702 (class 1259 OID 16757074)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2553 (class 1259 OID 16756555)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2597 (class 1259 OID 16756670)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2598 (class 1259 OID 16756671)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2644 (class 1259 OID 16756869)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2645 (class 1259 OID 16756868)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2646 (class 1259 OID 16756865)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2647 (class 1259 OID 16756866)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2648 (class 1259 OID 16756867)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2479 (class 1259 OID 16756373)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2480 (class 1259 OID 16756372)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2481 (class 1259 OID 16756374)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2570 (class 1259 OID 16756603)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2571 (class 1259 OID 16756602)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2652 (class 1259 OID 16756922)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2653 (class 1259 OID 16756923)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2637 (class 1259 OID 16756813)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2638 (class 1259 OID 16756814)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2639 (class 1259 OID 16756811)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2640 (class 1259 OID 16756812)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2594 (class 1259 OID 16756661)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2544 (class 1259 OID 16756543)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2545 (class 1259 OID 16756542)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2546 (class 1259 OID 16756540)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2547 (class 1259 OID 16756541)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2633 (class 1259 OID 16756801)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2634 (class 1259 OID 16756800)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2649 (class 1259 OID 16756913)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2510 (class 1259 OID 16756455)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2667 (class 1259 OID 16756959)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2694 (class 1259 OID 16757049)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2695 (class 1259 OID 16757050)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2462 (class 1259 OID 16756307)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2463 (class 1259 OID 16756306)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2471 (class 1259 OID 16756339)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2472 (class 1259 OID 16756340)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2533 (class 1259 OID 16756524)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2534 (class 1259 OID 16756523)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2535 (class 1259 OID 16756522)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2520 (class 1259 OID 16756483)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2521 (class 1259 OID 16756484)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2522 (class 1259 OID 16756482)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2523 (class 1259 OID 16756486)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2524 (class 1259 OID 16756487)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2525 (class 1259 OID 16756485)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2478 (class 1259 OID 16756358)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2496 (class 1259 OID 16756422)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2497 (class 1259 OID 16756424)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2498 (class 1259 OID 16756423)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2499 (class 1259 OID 16756425)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2552 (class 1259 OID 16756549)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2619 (class 1259 OID 16756746)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2628 (class 1259 OID 16756779)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 16756330)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 16756331)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2591 (class 1259 OID 16756654)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2676 (class 1259 OID 16756983)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2489 (class 1259 OID 16756394)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2673 (class 1259 OID 16756971)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2574 (class 1259 OID 16756601)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2575 (class 1259 OID 16756600)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2641 (class 1259 OID 16756810)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2486 (class 1259 OID 16756382)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 16756759)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2684 (class 1259 OID 16757023)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2658 (class 1259 OID 16756930)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2659 (class 1259 OID 16756931)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2532 (class 1259 OID 16756511)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2455 (class 1259 OID 16756280)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2732 (class 2606 OID 16757190)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2731 (class 2606 OID 16757195)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2727 (class 2606 OID 16757215)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2733 (class 2606 OID 16757185)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2729 (class 2606 OID 16757205)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2728 (class 2606 OID 16757210)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2730 (class 2606 OID 16757200)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2765 (class 2606 OID 16757365)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2764 (class 2606 OID 16757370)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2763 (class 2606 OID 16757375)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2798 (class 2606 OID 16757545)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2799 (class 2606 OID 16757540)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2715 (class 2606 OID 16757125)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2749 (class 2606 OID 16757295)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2793 (class 2606 OID 16757525)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2794 (class 2606 OID 16757520)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2792 (class 2606 OID 16757530)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2795 (class 2606 OID 16757515)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2796 (class 2606 OID 16757510)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2747 (class 2606 OID 16757290)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2748 (class 2606 OID 16757285)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2726 (class 2606 OID 16757180)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2759 (class 2606 OID 16757335)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2757 (class 2606 OID 16757345)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2758 (class 2606 OID 16757340)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2721 (class 2606 OID 16757160)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2722 (class 2606 OID 16757155)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2745 (class 2606 OID 16757275)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2789 (class 2606 OID 16757495)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2768 (class 2606 OID 16757380)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2767 (class 2606 OID 16757385)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2766 (class 2606 OID 16757390)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2797 (class 2606 OID 16757535)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2770 (class 2606 OID 16757410)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2773 (class 2606 OID 16757395)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2769 (class 2606 OID 16757415)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2771 (class 2606 OID 16757405)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2772 (class 2606 OID 16757400)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2719 (class 2606 OID 16757150)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2720 (class 2606 OID 16757145)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2711 (class 2606 OID 16757110)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2712 (class 2606 OID 16757105)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2753 (class 2606 OID 16757315)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2708 (class 2606 OID 16757085)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2707 (class 2606 OID 16757090)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2754 (class 2606 OID 16757330)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2755 (class 2606 OID 16757325)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2756 (class 2606 OID 16757320)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2724 (class 2606 OID 16757165)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2723 (class 2606 OID 16757170)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2791 (class 2606 OID 16757505)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2737 (class 2606 OID 16757250)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2739 (class 2606 OID 16757240)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2740 (class 2606 OID 16757235)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2738 (class 2606 OID 16757245)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2706 (class 2606 OID 16757075)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2705 (class 2606 OID 16757080)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2750 (class 2606 OID 16757300)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2802 (class 2606 OID 16757560)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2804 (class 2606 OID 16757565)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2803 (class 2606 OID 16757570)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2746 (class 2606 OID 16757280)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2762 (class 2606 OID 16757355)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2761 (class 2606 OID 16757360)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2780 (class 2606 OID 16757470)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 16757465)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2784 (class 2606 OID 16757450)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2783 (class 2606 OID 16757455)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2782 (class 2606 OID 16757460)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2717 (class 2606 OID 16757135)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2718 (class 2606 OID 16757130)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2716 (class 2606 OID 16757140)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2751 (class 2606 OID 16757310)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2752 (class 2606 OID 16757305)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2787 (class 2606 OID 16757480)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2786 (class 2606 OID 16757485)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2777 (class 2606 OID 16757440)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2776 (class 2606 OID 16757445)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2779 (class 2606 OID 16757430)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2778 (class 2606 OID 16757435)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2760 (class 2606 OID 16757350)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2741 (class 2606 OID 16757270)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2742 (class 2606 OID 16757265)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2744 (class 2606 OID 16757255)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2743 (class 2606 OID 16757260)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2774 (class 2606 OID 16757425)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2775 (class 2606 OID 16757420)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2785 (class 2606 OID 16757475)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2725 (class 2606 OID 16757175)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2788 (class 2606 OID 16757490)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 16757500)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2801 (class 2606 OID 16757550)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2800 (class 2606 OID 16757555)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2709 (class 2606 OID 16757100)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2710 (class 2606 OID 16757095)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2714 (class 2606 OID 16757115)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2713 (class 2606 OID 16757120)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2734 (class 2606 OID 16757230)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2735 (class 2606 OID 16757225)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2736 (class 2606 OID 16757220)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-01 10:37:30 CEST

--
-- PostgreSQL database dump complete
--

