--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-25 09:21:15 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 245 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 20581470)
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
-- TOC entry 229 (class 1259 OID 20582027)
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
-- TOC entry 228 (class 1259 OID 20582010)
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
-- TOC entry 219 (class 1259 OID 20581887)
-- Name: avtorbesedila; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE avtorbesedila (
    id uuid NOT NULL,
    besedilo_id uuid,
    oseba_id uuid,
    tipavtorja character varying(255) NOT NULL,
    zaporedna integer,
    alivnaslovu boolean
);


--
-- TOC entry 222 (class 1259 OID 20581917)
-- Name: besedilo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE besedilo (
    id uuid NOT NULL,
    stevilka character varying(255) NOT NULL,
    naslov character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    jezik character varying(255) DEFAULT NULL::character varying,
    naslovizvirnika character varying(255) DEFAULT NULL::character varying,
    podnaslovizvirnika character varying(255) DEFAULT NULL::character varying,
    internacionalninaslov character varying(255) DEFAULT NULL::character varying,
    datumprejema date,
    moskevloge integer,
    zenskevloge integer,
    povzetekvsebine text,
    letoizida integer,
    krajizida character varying(255) DEFAULT NULL::character varying,
    zaloznik character varying(255) DEFAULT NULL::character varying,
    avtor character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 20582266)
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
-- TOC entry 197 (class 1259 OID 20581677)
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
    allday boolean DEFAULT false,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(4) DEFAULT NULL::character varying,
    razred character varying(4) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 199 (class 1259 OID 20581709)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 20582192)
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
-- TOC entry 190 (class 1259 OID 20581591)
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
-- TOC entry 230 (class 1259 OID 20582040)
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
    prikoproducentu boolean,
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
-- TOC entry 215 (class 1259 OID 20581842)
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
-- TOC entry 195 (class 1259 OID 20581656)
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
-- TOC entry 193 (class 1259 OID 20581631)
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
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 20581608)
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
-- TOC entry 204 (class 1259 OID 20581756)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 20582247)
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
-- TOC entry 242 (class 1259 OID 20582259)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 20582281)
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
-- TOC entry 170 (class 1259 OID 20579799)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 20581781)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20581565)
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
-- TOC entry 182 (class 1259 OID 20581479)
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
-- TOC entry 183 (class 1259 OID 20581490)
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
    email character varying(255) DEFAULT NULL::character varying,
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
-- TOC entry 178 (class 1259 OID 20581444)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20581463)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 20581788)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 20581822)
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
-- TOC entry 225 (class 1259 OID 20581958)
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
    jeavtorskepravice boolean,
    placilonavajo boolean,
    vrednostvaje numeric(12,2) DEFAULT NULL::numeric,
    planiranostevilovaj integer,
    vrednostvaj numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    procentodinkasa numeric(12,2) DEFAULT NULL::numeric,
    jeprocentodinkasa boolean,
    vrednostdopremiere numeric(12,2) DEFAULT NULL::numeric,
    zaposlenvdrjz boolean,
    samozaposlen boolean,
    igralec boolean,
    opis text
);


--
-- TOC entry 185 (class 1259 OID 20581523)
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
-- TOC entry 187 (class 1259 OID 20581557)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 20582138)
-- Name: postavkacdve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkacdve (
    id uuid NOT NULL,
    skupina character varying(2) NOT NULL,
    podskupina integer,
    naziv character varying(255) DEFAULT NULL::character varying,
    vrpremiere numeric(15,2) DEFAULT NULL::numeric,
    vrponovitvepremier numeric(15,2) DEFAULT NULL::numeric,
    vrponovitveprejsnjih numeric(15,2) DEFAULT NULL::numeric,
    vrgostovanjazamejstvo numeric(15,2) DEFAULT NULL::numeric,
    vrfestivali numeric(15,2) DEFAULT NULL::numeric,
    vrgostovanjaint numeric(15,2) DEFAULT NULL::numeric,
    vrostalo numeric(15,2) DEFAULT NULL::numeric,
    programdela_id uuid
);


--
-- TOC entry 205 (class 1259 OID 20581762)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20581542)
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
-- TOC entry 194 (class 1259 OID 20581646)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 20581774)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 20582152)
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
-- TOC entry 234 (class 1259 OID 20582162)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 20582095)
-- Name: programdela; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programdela (
    id uuid NOT NULL,
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
    stizvpremdoma integer,
    stizvpremkopr integer,
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
    stobiskpremdoma integer,
    stobiskpremkopr integer,
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
-- TOC entry 235 (class 1259 OID 20582170)
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
-- TOC entry 211 (class 1259 OID 20581803)
-- Name: prostor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prostor (
    id uuid NOT NULL,
    popa_id uuid,
    naslov_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    jeprizorisce boolean,
    jematicnioder boolean,
    seplanira boolean DEFAULT false NOT NULL,
    kapaciteta integer,
    opis text
);


--
-- TOC entry 203 (class 1259 OID 20581747)
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
-- TOC entry 202 (class 1259 OID 20581737)
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
-- TOC entry 224 (class 1259 OID 20581947)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 20581877)
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
-- TOC entry 192 (class 1259 OID 20581620)
-- Name: report; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE report (
    id uuid NOT NULL,
    job_id uuid,
    title character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    transfers integer NOT NULL,
    size integer,
    format character varying(255) DEFAULT NULL::character varying,
    hash uuid,
    createdat timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 175 (class 1259 OID 20581415)
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
-- TOC entry 174 (class 1259 OID 20581413)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 20581816)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20581453)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20581437)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 20581830)
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
-- TOC entry 206 (class 1259 OID 20581768)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 20581714)
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
-- TOC entry 173 (class 1259 OID 20581402)
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
-- TOC entry 172 (class 1259 OID 20581394)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20581389)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 20581894)
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
-- TOC entry 184 (class 1259 OID 20581515)
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
-- TOC entry 201 (class 1259 OID 20581724)
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
-- TOC entry 223 (class 1259 OID 20581935)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 20582180)
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
-- TOC entry 189 (class 1259 OID 20581577)
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
-- TOC entry 176 (class 1259 OID 20581424)
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
-- TOC entry 227 (class 1259 OID 20581985)
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
    jekoprodukcija boolean,
    maticnioder_id uuid
);


--
-- TOC entry 196 (class 1259 OID 20581667)
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
-- TOC entry 210 (class 1259 OID 20581795)
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
-- TOC entry 221 (class 1259 OID 20581908)
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
-- TOC entry 239 (class 1259 OID 20582227)
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
-- TOC entry 238 (class 1259 OID 20582199)
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
-- TOC entry 240 (class 1259 OID 20582239)
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
-- TOC entry 217 (class 1259 OID 20581867)
-- Name: zaposlitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zaposlitev (
    id uuid NOT NULL,
    oseba_id uuid,
    sifra character varying(10) NOT NULL,
    status character varying(10) NOT NULL,
    delovnomesto character varying(255) NOT NULL,
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
-- TOC entry 198 (class 1259 OID 20581703)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 20581975)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 20581857)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 20581418)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2974 (class 0 OID 20581470)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 20582027)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5604-f5e9-560d-e02538a60a03	000d0000-5604-f5e9-7787-fae394490d25	\N	00090000-5604-f5e9-a3d7-09b94955de6a	000b0000-5604-f5e9-b0a4-a7502f4b50b7	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5604-f5e9-7d8f-d9845429cdea	000d0000-5604-f5e9-7ed4-4d9d34721705	00100000-5604-f5e9-7a49-205ebfa2bc36	00090000-5604-f5e9-28bc-9a6d454cc98e	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5604-f5e9-77ea-58f0f5c3d84d	000d0000-5604-f5e9-cc04-809206f516dc	00100000-5604-f5e9-2570-2a74986838a8	00090000-5604-f5e9-c3d7-fa12fd84fd0f	\N	0003	t	\N	2015-09-25	\N	2	t	\N	f	f
000c0000-5604-f5e9-7eb3-d093a480bae5	000d0000-5604-f5e9-b561-939d9f520874	\N	00090000-5604-f5e9-e791-b55831341c01	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5604-f5e9-c7d9-9ff25895344c	000d0000-5604-f5e9-b746-16c930ef8ea1	\N	00090000-5604-f5e9-4cb0-170374382557	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5604-f5e9-f66d-d89d41f553ce	000d0000-5604-f5e9-54a5-3cb5fcd22f01	\N	00090000-5604-f5e9-e12f-fd8e56ca731c	000b0000-5604-f5e9-a5f1-3f37c8a3bef2	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5604-f5e9-cef7-e1027c2999cd	000d0000-5604-f5e9-ecce-c4dcff3d05ca	00100000-5604-f5e9-22c6-0fca935dd7ee	00090000-5604-f5e9-0ff6-955c3f997c98	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5604-f5e9-8e5c-f94c549f1c30	000d0000-5604-f5e9-e702-8584ad7cee35	\N	00090000-5604-f5e9-fc9f-b0c308090c61	000b0000-5604-f5e9-722a-1d019bd6b75c	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5604-f5e9-7470-bbf43b38ce3f	000d0000-5604-f5e9-ecce-c4dcff3d05ca	00100000-5604-f5e9-0832-c404cd28fad0	00090000-5604-f5e9-fb9c-426812e40be9	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5604-f5e9-ddb3-8c8397d4402f	000d0000-5604-f5e9-ecce-c4dcff3d05ca	00100000-5604-f5e9-5fce-c36435320961	00090000-5604-f5e9-b744-9022124b89c5	\N	0010	t	\N	2015-09-25	\N	16	f	\N	f	t
000c0000-5604-f5e9-957e-20f681e12be7	000d0000-5604-f5e9-ecce-c4dcff3d05ca	00100000-5604-f5e9-0a7b-294b2438369c	00090000-5604-f5e9-6fab-0136909c2877	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5604-f5e9-3355-70eba2a0a925	000d0000-5604-f5e9-b4ed-0881ab791efc	\N	00090000-5604-f5e9-28bc-9a6d454cc98e	000b0000-5604-f5e9-5455-f29415ffb01e	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3021 (class 0 OID 20582010)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 20581887)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5604-f5e9-98b0-f6a251d58506	00160000-5604-f5e8-9128-e965ecb94b9e	00090000-5604-f5e9-5cd0-986be1dd6df5	aizv	10	t
003d0000-5604-f5e9-f3d5-a24b02c6f466	00160000-5604-f5e8-9128-e965ecb94b9e	00090000-5604-f5e9-4538-dc618e80337d	apri	14	t
003d0000-5604-f5e9-f558-572581fca1de	00160000-5604-f5e8-5aa0-4265b973f35f	00090000-5604-f5e9-0b7e-997bdc13e0ea	aizv	11	t
003d0000-5604-f5e9-46e7-96597c4188d2	00160000-5604-f5e8-356e-20643f07e995	00090000-5604-f5e9-3fd8-5e41b48619db	aizv	12	t
003d0000-5604-f5e9-9afd-5dde0fc27f4d	00160000-5604-f5e8-9128-e965ecb94b9e	00090000-5604-f5e9-9fa8-13da2d40544f	apri	18	f
\.


--
-- TOC entry 3015 (class 0 OID 20581917)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5604-f5e8-9128-e965ecb94b9e	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-5604-f5e8-5aa0-4265b973f35f	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-5604-f5e8-356e-20643f07e995	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3036 (class 0 OID 20582266)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 20581677)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5604-f5e9-017d-851ab1f33040	\N	\N	00200000-5604-f5e9-4740-7cf47666e4e3	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5604-f5e9-33d2-b924d53a842f	\N	\N	00200000-5604-f5e9-8024-96799844718d	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5604-f5e9-c57f-56d08371f969	\N	\N	00200000-5604-f5e9-9d7f-4e42200900e8	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5604-f5e9-1683-38b42c15f9e8	\N	\N	00200000-5604-f5e9-d865-31df3b25ffa3	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5604-f5e9-c697-6bd67a91ebcd	\N	\N	00200000-5604-f5e9-1d00-bb22f9974c81	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2992 (class 0 OID 20581709)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 20582192)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 20581591)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5604-f5e6-4ec8-03fdafe3bce5	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5604-f5e6-f42c-a7c45464e8c4	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5604-f5e6-b092-3557f99fc39e	AL	ALB	008	Albania 	Albanija	\N
00040000-5604-f5e6-5187-d5bf79455fcd	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5604-f5e6-0e60-8a751fea5a15	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5604-f5e6-437c-6b048c07c0e8	AD	AND	020	Andorra 	Andora	\N
00040000-5604-f5e6-143d-1d1887343ee7	AO	AGO	024	Angola 	Angola	\N
00040000-5604-f5e6-7ea1-4b4ce138c7b5	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5604-f5e6-02e9-07dbd0876d48	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5604-f5e6-2ee6-08ab239ccca7	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5604-f5e6-98f2-d2c0c1109b17	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5604-f5e6-040c-093c20f296e1	AM	ARM	051	Armenia 	Armenija	\N
00040000-5604-f5e6-4d25-fa64469f0755	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5604-f5e6-de7c-1c002651b3ce	AU	AUS	036	Australia 	Avstralija	\N
00040000-5604-f5e6-8d87-faadd5af5d12	AT	AUT	040	Austria 	Avstrija	\N
00040000-5604-f5e6-1fd9-9e171a483cd8	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5604-f5e6-3434-f91b66927e14	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5604-f5e6-a893-d929c07ad51c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5604-f5e6-e243-b2ccb2b0ec9c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5604-f5e6-0e15-93133e65b2c5	BB	BRB	052	Barbados 	Barbados	\N
00040000-5604-f5e6-c0d8-597fd1305f39	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5604-f5e6-1348-1c67ecfa6749	BE	BEL	056	Belgium 	Belgija	\N
00040000-5604-f5e6-c93b-8c31ce461f39	BZ	BLZ	084	Belize 	Belize	\N
00040000-5604-f5e6-998b-20f331bc57ee	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5604-f5e6-5966-0e95c487178e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5604-f5e6-7959-4308174a30e2	BT	BTN	064	Bhutan 	Butan	\N
00040000-5604-f5e6-d138-5f644f44d626	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5604-f5e6-e437-0979a1c85966	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5604-f5e6-f76c-848064df5263	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5604-f5e6-7e8a-bbeae25d6e84	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5604-f5e6-fe20-a885c7a38d31	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5604-f5e6-2e41-9fcf241b22ab	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5604-f5e6-34cb-f1af93204440	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5604-f5e6-09a3-21bd96362fd1	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5604-f5e6-e02e-06f440967fde	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5604-f5e6-919c-a7237acf8042	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5604-f5e6-9d76-933de006b061	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5604-f5e6-61d7-f181058dae9a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5604-f5e6-f363-094699289a98	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5604-f5e6-62eb-71c8c22926d0	CA	CAN	124	Canada 	Kanada	\N
00040000-5604-f5e6-6d12-7f43cf712561	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5604-f5e6-bed8-867fc478725b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5604-f5e6-4974-b739ad813e3d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5604-f5e6-09a1-9d46d118df78	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5604-f5e6-eabe-8b3c2bb838b8	CL	CHL	152	Chile 	Čile	\N
00040000-5604-f5e6-d554-33e857a784fe	CN	CHN	156	China 	Kitajska	\N
00040000-5604-f5e6-8e5c-9c3fd7b5e281	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5604-f5e6-343e-8877c6de4fbb	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5604-f5e6-9901-9ebfb97cbef9	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5604-f5e6-806a-839d2b3e916c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5604-f5e6-81bf-2f79a8a606cc	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5604-f5e6-0c61-d9eb03dfc01e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5604-f5e6-e9ac-35cfe2bd7186	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5604-f5e6-bd7e-d079b5285dca	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5604-f5e6-5b08-72a87e732c9b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5604-f5e6-65db-11e7f006afc0	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5604-f5e6-4f2b-9e8d77865838	CU	CUB	192	Cuba 	Kuba	\N
00040000-5604-f5e6-4052-19f6749990ba	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5604-f5e6-71d0-05a4cbe23243	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5604-f5e6-9ae0-fd62c0ce8aa9	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5604-f5e6-7ad9-b90ea253b124	DK	DNK	208	Denmark 	Danska	\N
00040000-5604-f5e6-72e6-91ab724936c6	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5604-f5e6-d6a0-bc027f46b296	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5604-f5e6-6163-83b7c250e652	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5604-f5e6-6b1e-d2e9b1658805	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5604-f5e6-afb8-85101b78db9c	EG	EGY	818	Egypt 	Egipt	\N
00040000-5604-f5e6-fd90-b49e0f29692a	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5604-f5e6-d0e1-a9763ce992d4	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5604-f5e6-7cc6-eea4c426209f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5604-f5e6-f239-ec6d29a402ba	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5604-f5e6-bb31-f321ad57dd78	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5604-f5e6-f07f-83d41345d633	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5604-f5e6-a89e-8f2d6aaff319	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5604-f5e6-a028-c86eaf1d710a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5604-f5e6-dcfc-14474f3ab52e	FI	FIN	246	Finland 	Finska	\N
00040000-5604-f5e6-928c-271215525eb8	FR	FRA	250	France 	Francija	\N
00040000-5604-f5e6-115a-dd204ff36250	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5604-f5e6-cd4a-aa1214837279	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5604-f5e6-69f7-31a408722951	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5604-f5e6-ef73-aa4932fbdf66	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5604-f5e6-bd14-f8a95f99f045	GA	GAB	266	Gabon 	Gabon	\N
00040000-5604-f5e6-e5ac-34c29ab18afa	GM	GMB	270	Gambia 	Gambija	\N
00040000-5604-f5e6-ef46-9c345b39fffe	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5604-f5e6-a1fb-50a9d7540816	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5604-f5e6-270c-514ef1ae7d14	GH	GHA	288	Ghana 	Gana	\N
00040000-5604-f5e6-0309-2f28fffe20a7	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5604-f5e6-99bf-3fcc4b6fbc4a	GR	GRC	300	Greece 	Grčija	\N
00040000-5604-f5e6-254e-cdbb8fdcc57d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5604-f5e6-bbd1-d91e9adf1d66	GD	GRD	308	Grenada 	Grenada	\N
00040000-5604-f5e6-5c63-3646d27d5a21	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5604-f5e6-bcec-deffd07291a9	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5604-f5e6-f005-2f60bd2b2a6e	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5604-f5e6-7d10-00c1c5e8f81c	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5604-f5e6-7188-dc7e330c688f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5604-f5e6-e258-68e47cd8d6b0	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5604-f5e6-d7a6-fb0ddc82acdb	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5604-f5e6-53e3-733d68576b5b	HT	HTI	332	Haiti 	Haiti	\N
00040000-5604-f5e6-0974-8d70c2b97387	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5604-f5e6-21a1-cea9b22eeb66	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5604-f5e6-cfc4-46c491350a97	HN	HND	340	Honduras 	Honduras	\N
00040000-5604-f5e6-01b9-6cf5804234ec	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5604-f5e6-7985-46d760963140	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5604-f5e6-0433-96ae634be58f	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5604-f5e6-370e-e0a9ebb43120	IN	IND	356	India 	Indija	\N
00040000-5604-f5e6-41a7-8c10be6d0f1e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5604-f5e6-a8a6-622917372b44	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5604-f5e6-9e1c-cc4a432a0230	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5604-f5e6-22eb-4ccacd95887e	IE	IRL	372	Ireland 	Irska	\N
00040000-5604-f5e6-d2d7-c35f00522888	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5604-f5e6-3e63-6de4dfc288d8	IL	ISR	376	Israel 	Izrael	\N
00040000-5604-f5e6-4342-0883e770d766	IT	ITA	380	Italy 	Italija	\N
00040000-5604-f5e6-95d7-b53f998ac645	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5604-f5e6-0d05-60bc046f2c38	JP	JPN	392	Japan 	Japonska	\N
00040000-5604-f5e6-8190-235dbebfb282	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5604-f5e6-f339-2743afa0fd7d	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5604-f5e6-dde8-5b27b8cb2f43	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5604-f5e6-bc34-672879de4d56	KE	KEN	404	Kenya 	Kenija	\N
00040000-5604-f5e6-4afd-c29584045923	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5604-f5e6-4925-7ced41fcc81e	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5604-f5e6-d106-ad12dec722cc	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5604-f5e6-3188-6c13a3f36b60	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5604-f5e6-331a-18e3ddea0c72	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5604-f5e6-e3b5-a12f0b177ad4	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5604-f5e6-8b75-47e98f66b81a	LV	LVA	428	Latvia 	Latvija	\N
00040000-5604-f5e6-12ea-cf525af0d51a	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5604-f5e6-d5bc-584501e77920	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5604-f5e6-5847-1d21a3fc17fd	LR	LBR	430	Liberia 	Liberija	\N
00040000-5604-f5e6-43e1-348be4b89731	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5604-f5e6-a445-dacf16cd29ae	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5604-f5e6-98c9-fe2805455a3f	LT	LTU	440	Lithuania 	Litva	\N
00040000-5604-f5e6-d401-cff467e0fa47	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5604-f5e6-b477-b2713223fe57	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5604-f5e6-6883-cc4bf172ac1a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5604-f5e6-69c6-6ca34798b8a5	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5604-f5e6-55e7-cdebe0eaa8eb	MW	MWI	454	Malawi 	Malavi	\N
00040000-5604-f5e6-9ad1-8a8438466773	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5604-f5e6-fbbd-7f78322a6389	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5604-f5e6-6ea7-053d19017b69	ML	MLI	466	Mali 	Mali	\N
00040000-5604-f5e6-bd16-61eb6db68e2c	MT	MLT	470	Malta 	Malta	\N
00040000-5604-f5e6-2894-4c8f7c5b0e37	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5604-f5e6-9d14-a7d1b2cdcf6a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5604-f5e6-79f3-f2b6ff833764	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5604-f5e6-748a-b830821b0408	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5604-f5e6-f819-4de8eb5fa924	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5604-f5e6-c296-62d8a91c5750	MX	MEX	484	Mexico 	Mehika	\N
00040000-5604-f5e6-4d16-d03de2b6740f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5604-f5e6-8817-19e5a6f1bd13	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5604-f5e6-2cb0-93ba5d673d5a	MC	MCO	492	Monaco 	Monako	\N
00040000-5604-f5e6-e132-b5b4f3544ce2	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5604-f5e6-6bed-c38ecde7a3c3	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5604-f5e6-b1da-54140b57423a	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5604-f5e6-9b52-c3e3867ca140	MA	MAR	504	Morocco 	Maroko	\N
00040000-5604-f5e6-4cc8-ec639dd84dc6	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5604-f5e6-3742-2d480f3daabd	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5604-f5e6-9847-11f257257d15	NA	NAM	516	Namibia 	Namibija	\N
00040000-5604-f5e6-b03e-11eec556fc1c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5604-f5e6-687e-c6c9de196355	NP	NPL	524	Nepal 	Nepal	\N
00040000-5604-f5e6-d539-19fcceaf1450	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5604-f5e6-c4a7-11a9f03a9587	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5604-f5e6-a08f-7dc9cdacce6f	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5604-f5e6-91b5-b34b450b505e	NE	NER	562	Niger 	Niger 	\N
00040000-5604-f5e6-553f-7f5b72c45b50	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5604-f5e6-1b24-2b7e3e149b00	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5604-f5e6-6dd1-c0bae63d1058	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5604-f5e6-2b0a-2b2422f2c15f	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5604-f5e6-6dfd-3847233a1ff0	NO	NOR	578	Norway 	Norveška	\N
00040000-5604-f5e6-31f2-adc29bc8a43d	OM	OMN	512	Oman 	Oman	\N
00040000-5604-f5e6-360e-32a24ab267fd	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5604-f5e6-683f-1e1d71ae3247	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5604-f5e6-0a6c-8c58242a8ffa	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5604-f5e6-ee7f-35825adcd860	PA	PAN	591	Panama 	Panama	\N
00040000-5604-f5e6-023d-2f61f9e08f5f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5604-f5e6-8321-ffb47f48e04d	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5604-f5e6-91bb-c983de669fc0	PE	PER	604	Peru 	Peru	\N
00040000-5604-f5e6-2a62-d5ba0eed8e1c	PH	PHL	608	Philippines 	Filipini	\N
00040000-5604-f5e6-26eb-e8f0c73d4ba3	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5604-f5e6-04e1-321f0adff8eb	PL	POL	616	Poland 	Poljska	\N
00040000-5604-f5e6-be7c-07d0c45be64e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5604-f5e6-a378-acf8845a51c9	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5604-f5e6-33c6-c46253ea6108	QA	QAT	634	Qatar 	Katar	\N
00040000-5604-f5e6-bbd9-a23a0e39ed7e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5604-f5e6-492d-9954c406c19e	RO	ROU	642	Romania 	Romunija	\N
00040000-5604-f5e6-8fc2-c9f4b40eb1be	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5604-f5e6-b7d1-9930aafa1f3f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5604-f5e6-c86e-2a2263cd4a71	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5604-f5e6-2a0c-addbbdbbba39	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5604-f5e6-4c98-656d435a60a7	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5604-f5e6-e3a4-82c10c4b47c2	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5604-f5e6-1983-f7a224b0a4aa	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5604-f5e6-e3de-d09621908c51	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5604-f5e6-adc0-5e30330d5aea	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5604-f5e6-afdb-d0cec8445ae8	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5604-f5e6-df50-2c69cee3e850	SM	SMR	674	San Marino 	San Marino	\N
00040000-5604-f5e6-3781-5000b5c2ca71	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5604-f5e6-67d0-264e73a931ce	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5604-f5e6-93f6-d8f40215ee47	SN	SEN	686	Senegal 	Senegal	\N
00040000-5604-f5e6-4dec-2f6fd73a41df	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5604-f5e6-e7cf-33229abc069f	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5604-f5e6-b179-4ebe0abaffb9	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5604-f5e6-a188-e571f1e717ab	SG	SGP	702	Singapore 	Singapur	\N
00040000-5604-f5e6-32f0-40445090a14d	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5604-f5e6-667e-5f899cd186cb	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5604-f5e6-2520-3fc8cc7cf6d6	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5604-f5e6-36ea-fadf87d4e281	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5604-f5e6-86cc-7abeb7a7d1ac	SO	SOM	706	Somalia 	Somalija	\N
00040000-5604-f5e6-fd5b-1982aa183c0b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5604-f5e6-a307-474a7e500fc8	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5604-f5e6-2260-a60f5bddb176	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5604-f5e6-ce51-c3c93a8791e7	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5604-f5e6-ef2b-d7dee9e5d336	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5604-f5e6-f584-06e540ff534e	SD	SDN	729	Sudan 	Sudan	\N
00040000-5604-f5e6-1466-db7aa6f02a5e	SR	SUR	740	Suriname 	Surinam	\N
00040000-5604-f5e6-62d5-35d8691e70a0	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5604-f5e6-1833-4b29f3e74995	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5604-f5e6-1fbb-6e8b42fbd708	SE	SWE	752	Sweden 	Švedska	\N
00040000-5604-f5e6-5f95-a640b19f66ed	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5604-f5e6-628d-9668c683995f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5604-f5e6-8ed3-df97acc67298	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5604-f5e6-bbc1-a499b4cf6efd	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5604-f5e6-9791-8e28773fcfee	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5604-f5e6-7d54-38d022d80ec2	TH	THA	764	Thailand 	Tajska	\N
00040000-5604-f5e6-9c32-f830486877ae	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5604-f5e6-d827-4edb7b7fe714	TG	TGO	768	Togo 	Togo	\N
00040000-5604-f5e6-e34a-ad3fe6c8e9e9	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5604-f5e6-855f-63d5fac6a3c4	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5604-f5e6-a0dd-a7e7d67c0ab8	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5604-f5e6-94de-9d3a58e6848e	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5604-f5e6-fcaa-d9af3737d4e5	TR	TUR	792	Turkey 	Turčija	\N
00040000-5604-f5e6-b447-eb6faedee082	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5604-f5e6-4e1b-73e416421bf6	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5604-f5e6-5d7b-0876c2895e47	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5604-f5e6-c4d6-7223a1cb7bb5	UG	UGA	800	Uganda 	Uganda	\N
00040000-5604-f5e6-3673-d27df64ea918	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5604-f5e6-7592-34a6cb652cb4	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5604-f5e6-ae15-6f1572586203	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5604-f5e6-1d72-e361b80429c3	US	USA	840	United States 	Združene države Amerike	\N
00040000-5604-f5e6-3d96-8fa75e6b3db8	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5604-f5e6-ecfd-cfbe45b14dfc	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5604-f5e6-02f8-9329f3a32aa6	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5604-f5e6-dbc1-c395626a99c6	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5604-f5e6-d019-6d53d17a6667	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5604-f5e6-c48e-42d9143c8432	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5604-f5e6-f151-0682cd3f5b9a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5604-f5e6-5f0e-8850aebad8c8	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5604-f5e6-248d-a23c3d8610d4	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5604-f5e6-0049-b3a87b169433	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5604-f5e6-a353-04d6dc31eca3	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5604-f5e6-2f2a-72224f2dca37	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5604-f5e6-cce6-10daa8e4c286	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3023 (class 0 OID 20582040)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5604-f5e9-0f9e-048a108b946c	000e0000-5604-f5e9-1cd4-3798857180dc	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5604-f5e6-f011-6a82a48110d8	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5604-f5e9-be0b-42b9e82319d7	000e0000-5604-f5e9-dedf-54501ff596f9	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5604-f5e6-6c9d-ce5f59777a97	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5604-f5e9-4427-c1fe4ab59cc5	000e0000-5604-f5e9-e92b-cbb8ee2602d5	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5604-f5e6-f011-6a82a48110d8	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5604-f5e9-2a5d-f7c353fd7bdf	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5604-f5e9-94ac-9128545aba52	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3008 (class 0 OID 20581842)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5604-f5e9-7787-fae394490d25	000e0000-5604-f5e9-dedf-54501ff596f9	000c0000-5604-f5e9-560d-e02538a60a03	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5604-f5e6-f94c-3979e3585fba
000d0000-5604-f5e9-7ed4-4d9d34721705	000e0000-5604-f5e9-dedf-54501ff596f9	000c0000-5604-f5e9-7d8f-d9845429cdea	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5604-f5e6-cfeb-7f1054cf875d
000d0000-5604-f5e9-cc04-809206f516dc	000e0000-5604-f5e9-dedf-54501ff596f9	000c0000-5604-f5e9-77ea-58f0f5c3d84d	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5604-f5e6-c632-68173a8b8e8f
000d0000-5604-f5e9-b561-939d9f520874	000e0000-5604-f5e9-dedf-54501ff596f9	000c0000-5604-f5e9-7eb3-d093a480bae5	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5604-f5e6-2eb5-81f7fe9a8452
000d0000-5604-f5e9-b746-16c930ef8ea1	000e0000-5604-f5e9-dedf-54501ff596f9	000c0000-5604-f5e9-c7d9-9ff25895344c	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5604-f5e6-2eb5-81f7fe9a8452
000d0000-5604-f5e9-54a5-3cb5fcd22f01	000e0000-5604-f5e9-dedf-54501ff596f9	000c0000-5604-f5e9-f66d-d89d41f553ce	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5604-f5e6-f94c-3979e3585fba
000d0000-5604-f5e9-ecce-c4dcff3d05ca	000e0000-5604-f5e9-dedf-54501ff596f9	000c0000-5604-f5e9-7470-bbf43b38ce3f	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5604-f5e6-f94c-3979e3585fba
000d0000-5604-f5e9-e702-8584ad7cee35	000e0000-5604-f5e9-dedf-54501ff596f9	000c0000-5604-f5e9-8e5c-f94c549f1c30	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5604-f5e6-1e78-8e2a97e16a57
000d0000-5604-f5e9-b4ed-0881ab791efc	000e0000-5604-f5e9-dedf-54501ff596f9	000c0000-5604-f5e9-3355-70eba2a0a925	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5604-f5e6-73ed-9cfcc0cd80ed
\.


--
-- TOC entry 2988 (class 0 OID 20581656)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 20581631)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 20581608)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5604-f5e9-f157-b35328ac2015	00080000-5604-f5e8-3709-2361e00d6dfb	00090000-5604-f5e9-b744-9022124b89c5	AK		igralka
\.


--
-- TOC entry 2997 (class 0 OID 20581756)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 20582247)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 20582259)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 20582281)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 20579799)
-- Dependencies: 170
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY migrations (version) FROM stdin;
20150824004401
20150826210511
20150827174118
20150831215248
20150907083238
20150911210328
20150917115047
20150918081756
\.


--
-- TOC entry 3001 (class 0 OID 20581781)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 20581565)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5604-f5e7-4766-55ece53b4111	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5604-f5e7-4882-73557ed97887	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5604-f5e7-2642-58bbf350c2d3	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5604-f5e7-740f-793f01343432	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5604-f5e7-fc12-876f18b5cd2e	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5604-f5e7-6fd2-5baa1221b0f3	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5604-f5e7-8e28-303226325c8b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5604-f5e7-d309-1c7365f8a1ad	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5604-f5e7-a79e-87f437cd5447	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5604-f5e7-af9e-6107fb326f73	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5604-f5e7-3763-901d521a4395	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5604-f5e7-6e77-4cbbc863f7b5	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5604-f5e7-4f25-b505f5b26bda	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5604-f5e7-9cad-ee69ff6a3233	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5604-f5e7-8f45-01c58b8bfe53	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5604-f5e8-09d1-b7358f75cafd	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5604-f5e8-6dfb-3b6a9b5f0146	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5604-f5e8-847e-dd115351e43f	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5604-f5e8-6fe0-0c42688c0f49	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5604-f5e8-b6c6-3f30c4e662e1	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5604-f5ea-da08-a9fa0fee9246	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2975 (class 0 OID 20581479)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5604-f5e8-90ff-6548872665f4	00000000-5604-f5e8-09d1-b7358f75cafd	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5604-f5e8-a88d-03ce0779624b	00000000-5604-f5e8-09d1-b7358f75cafd	00010000-5604-f5e7-54e3-be62c584799f	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5604-f5e8-a3c0-6f55fe8645cd	00000000-5604-f5e8-6dfb-3b6a9b5f0146	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2976 (class 0 OID 20581490)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5604-f5e9-a3d7-09b94955de6a	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5604-f5e9-e791-b55831341c01	00010000-5604-f5e9-a15f-7728edea6445	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5604-f5e9-c3d7-fa12fd84fd0f	00010000-5604-f5e9-0829-bb416ceac4bb	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5604-f5e9-fb9c-426812e40be9	00010000-5604-f5e9-c86b-c65eb3f156e5	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5604-f5e9-de2a-00b09eed81b5	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5604-f5e9-e12f-fd8e56ca731c	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5604-f5e9-6fab-0136909c2877	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5604-f5e9-0ff6-955c3f997c98	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5604-f5e9-b744-9022124b89c5	00010000-5604-f5e9-1a42-042708248944	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5604-f5e9-28bc-9a6d454cc98e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5604-f5e9-dbf5-fa33e35108a7	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5604-f5e9-4cb0-170374382557	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5604-f5e9-fc9f-b0c308090c61	00010000-5604-f5e9-fad3-3c620f41c23e	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5604-f5e9-5cd0-986be1dd6df5	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5604-f5e9-4538-dc618e80337d	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5604-f5e9-0b7e-997bdc13e0ea	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5604-f5e9-3fd8-5e41b48619db	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5604-f5e9-9fa8-13da2d40544f	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2971 (class 0 OID 20581444)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5604-f5e6-6689-370d3e84b2fb	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5604-f5e6-b3f5-bb59ece92dc4	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5604-f5e6-2d8e-870039b9f95d	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5604-f5e6-f402-332e3ccb548c	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5604-f5e6-054b-308e2ae622d2	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5604-f5e6-5d0c-76a6af34723d	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5604-f5e6-3834-9214dd232601	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5604-f5e6-0f2f-58ef196c3af3	Abonma-read	Abonma - branje	f
00030000-5604-f5e6-1c1a-2914f3eac6b7	Abonma-write	Abonma - spreminjanje	f
00030000-5604-f5e6-71e5-f004e4fdec97	Alternacija-read	Alternacija - branje	f
00030000-5604-f5e6-e2cf-47495a04321f	Alternacija-write	Alternacija - spreminjanje	f
00030000-5604-f5e6-ca4a-f7de285241d8	Arhivalija-read	Arhivalija - branje	f
00030000-5604-f5e6-1fe9-e274c2ceb1fa	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5604-f5e6-1aed-29e270e74430	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5604-f5e6-7305-25852c11bb97	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5604-f5e6-8596-f4a7879b35cc	Besedilo-read	Besedilo - branje	f
00030000-5604-f5e6-b3a4-7917f4aa4288	Besedilo-write	Besedilo - spreminjanje	f
00030000-5604-f5e6-36f8-e9d14c5ee05c	DogodekIzven-read	DogodekIzven - branje	f
00030000-5604-f5e6-5939-875312585246	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5604-f5e6-7cee-4ba7aa514195	Dogodek-read	Dogodek - branje	f
00030000-5604-f5e6-d631-fa9204671fe1	Dogodek-write	Dogodek - spreminjanje	f
00030000-5604-f5e6-afb7-35b7f831ff28	DrugiVir-read	DrugiVir - branje	f
00030000-5604-f5e6-513c-cc0bc818acbe	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5604-f5e6-eee1-f539b4099146	Drzava-read	Drzava - branje	f
00030000-5604-f5e6-613c-df7d939f5987	Drzava-write	Drzava - spreminjanje	f
00030000-5604-f5e6-dd3e-4df16a6c2299	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5604-f5e6-08d2-dabbf8981d01	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5604-f5e6-0e74-147d7381df8e	Funkcija-read	Funkcija - branje	f
00030000-5604-f5e6-a258-79f3daa37d1c	Funkcija-write	Funkcija - spreminjanje	f
00030000-5604-f5e6-bfe5-b0404f31c8b9	Gostovanje-read	Gostovanje - branje	f
00030000-5604-f5e6-d9a7-7b825cc76102	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5604-f5e6-fa11-55e3e39c25b7	Gostujoca-read	Gostujoca - branje	f
00030000-5604-f5e6-3ce0-217f7cdb4dcb	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5604-f5e6-87e3-6fe52db6f05c	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5604-f5e6-e86e-64316cce608a	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5604-f5e6-21d7-055334346f9e	Kupec-read	Kupec - branje	f
00030000-5604-f5e6-54ec-c4dd768e89eb	Kupec-write	Kupec - spreminjanje	f
00030000-5604-f5e6-7953-2fd07275c6fc	NacinPlacina-read	NacinPlacina - branje	f
00030000-5604-f5e6-8945-c58096adf8aa	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5604-f5e6-e999-93956b30371f	Option-read	Option - branje	f
00030000-5604-f5e6-e9cf-870523e82169	Option-write	Option - spreminjanje	f
00030000-5604-f5e6-6dd1-239aa88fba8f	OptionValue-read	OptionValue - branje	f
00030000-5604-f5e6-bc2c-379bf956dc71	OptionValue-write	OptionValue - spreminjanje	f
00030000-5604-f5e6-c742-3fb6c8e1395e	Oseba-read	Oseba - branje	f
00030000-5604-f5e6-7153-44fc8c7a8b3d	Oseba-write	Oseba - spreminjanje	f
00030000-5604-f5e6-cae2-b407598610db	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5604-f5e6-45e4-7be44c773a8e	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5604-f5e6-54d4-9524c93b5895	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5604-f5e6-dc30-a9a78fe901eb	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5604-f5e6-55e6-c7a3e8fda099	Pogodba-read	Pogodba - branje	f
00030000-5604-f5e6-f66f-33ff0cceb7ab	Pogodba-write	Pogodba - spreminjanje	f
00030000-5604-f5e6-c56b-33952534240e	Popa-read	Popa - branje	f
00030000-5604-f5e6-4d6d-91490155fe8e	Popa-write	Popa - spreminjanje	f
00030000-5604-f5e6-2136-fd8a53ef1d30	Posta-read	Posta - branje	f
00030000-5604-f5e6-2607-86690c2fefe3	Posta-write	Posta - spreminjanje	f
00030000-5604-f5e6-19bd-4954e213d8e0	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5604-f5e6-cbb6-3d77fc50a420	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5604-f5e6-7c8c-9f0b2e75ebc1	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5604-f5e6-be9e-b74b48e6ff35	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5604-f5e6-06e5-bb24c2beee59	PostniNaslov-read	PostniNaslov - branje	f
00030000-5604-f5e6-6646-da7a9eea1478	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5604-f5e6-4592-1e9030a7ee95	Predstava-read	Predstava - branje	f
00030000-5604-f5e6-9fb5-2e372e18d6c0	Predstava-write	Predstava - spreminjanje	f
00030000-5604-f5e6-672c-9ed7f424b545	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5604-f5e6-7b10-c8cb3dc5f8f8	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5604-f5e6-ac71-d8106fa2c87f	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5604-f5e6-825f-fd4f3f00d986	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5604-f5e6-beda-e7f08713aca9	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5604-f5e6-295d-01bdea5225b6	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5604-f5e6-68f8-0c4d3ca828a0	ProgramDela-read	ProgramDela - branje	f
00030000-5604-f5e6-4460-59d2fc35dc59	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5604-f5e6-0834-cc8166d5be2f	ProgramFestival-read	ProgramFestival - branje	f
00030000-5604-f5e6-5882-ffbdc8a883b2	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5604-f5e6-0f23-556d85dc7230	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5604-f5e6-93d2-c4d0056e9b8b	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5604-f5e6-a46a-13c922ca67fd	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5604-f5e6-fc1d-466ad395efe0	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5604-f5e6-5f70-cacfba5d033c	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5604-f5e6-ec4c-c216cf1fdbd6	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5604-f5e6-0cee-b2387885b1d2	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5604-f5e6-dc3f-db46958d137a	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5604-f5e6-f23d-2998b3d4eb3c	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5604-f5e6-adbe-21fbf3ff66fc	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5604-f5e6-9d60-c7cc90d2168a	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5604-f5e6-3720-8b3ae9ed624c	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5604-f5e6-4502-748a0a0cf3a2	ProgramRazno-read	ProgramRazno - branje	f
00030000-5604-f5e6-39f3-e62a5605b55d	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5604-f5e6-e052-ac091ad34c25	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5604-f5e6-8356-aabc754c49b8	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5604-f5e6-7a81-bb48f9b5ef99	Prostor-read	Prostor - branje	f
00030000-5604-f5e6-6df0-435e94808916	Prostor-write	Prostor - spreminjanje	f
00030000-5604-f5e6-0116-cf5c84d5ed0a	Racun-read	Racun - branje	f
00030000-5604-f5e6-46d2-3a4c8c74af28	Racun-write	Racun - spreminjanje	f
00030000-5604-f5e6-99fa-6ddaac46af6f	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5604-f5e6-23c5-8f538a29e158	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5604-f5e6-29c3-251584cecc48	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5604-f5e6-b618-1d4dae705148	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5604-f5e6-0ef7-53c382680f6a	Rekvizit-read	Rekvizit - branje	f
00030000-5604-f5e6-1cbe-f6551b13e479	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5604-f5e6-ac7a-095413f7b8b1	Revizija-read	Revizija - branje	f
00030000-5604-f5e6-a541-8f21f6b6f370	Revizija-write	Revizija - spreminjanje	f
00030000-5604-f5e6-2d69-8b7431067b8c	Rezervacija-read	Rezervacija - branje	f
00030000-5604-f5e6-e28d-11263b3129e7	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5604-f5e6-2b71-add9577ab4ae	SedezniRed-read	SedezniRed - branje	f
00030000-5604-f5e6-91b2-f3c05950731f	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5604-f5e6-251e-7264748e5e2e	Sedez-read	Sedez - branje	f
00030000-5604-f5e6-355e-71ae012baedc	Sedez-write	Sedez - spreminjanje	f
00030000-5604-f5e6-4ff5-a782d5c0e9a1	Sezona-read	Sezona - branje	f
00030000-5604-f5e6-cbfe-3ff4d2ec90ae	Sezona-write	Sezona - spreminjanje	f
00030000-5604-f5e6-3221-d2f3b8ff37eb	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5604-f5e6-f03b-be076fa564c7	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5604-f5e6-2fd2-0673892aef94	Stevilcenje-read	Stevilcenje - branje	f
00030000-5604-f5e6-0cb3-61c859c65ebd	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5604-f5e6-9d47-6b635518ec0d	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5604-f5e6-9e8d-0703a6e0e7d6	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5604-f5e6-a5b0-d49f6c30f7cd	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5604-f5e6-a1a9-38e7a194991b	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5604-f5e6-e475-f9f33a2338b4	Telefonska-read	Telefonska - branje	f
00030000-5604-f5e6-114b-8cbc431922b6	Telefonska-write	Telefonska - spreminjanje	f
00030000-5604-f5e6-cd26-21e967853141	TerminStoritve-read	TerminStoritve - branje	f
00030000-5604-f5e6-73db-03d7e2c36014	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5604-f5e6-9de1-bb10b6d2d609	TipFunkcije-read	TipFunkcije - branje	f
00030000-5604-f5e6-f6ed-823001ca9c28	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5604-f5e6-0099-852fe337c996	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5604-f5e6-8e29-52d8b3ac37ed	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5604-f5e6-cd8a-f2c0d44444de	Trr-read	Trr - branje	f
00030000-5604-f5e6-5547-eb11189335d9	Trr-write	Trr - spreminjanje	f
00030000-5604-f5e6-9c2a-9cb0892cf4f5	Uprizoritev-read	Uprizoritev - branje	f
00030000-5604-f5e6-6f21-ae95af8ce178	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5604-f5e6-c197-121e16cacbef	Vaja-read	Vaja - branje	f
00030000-5604-f5e6-229c-24178bef0d7c	Vaja-write	Vaja - spreminjanje	f
00030000-5604-f5e6-6b3f-67238fe7c847	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5604-f5e6-20e8-f09abb4c5aec	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5604-f5e6-0f15-2feb0f6a9864	VrstaStroska-read	VrstaStroska - branje	f
00030000-5604-f5e6-eb1c-8384da62b98f	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5604-f5e6-62b2-5c572e2ada8e	Zaposlitev-read	Zaposlitev - branje	f
00030000-5604-f5e6-c6be-c630ae73f7a9	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5604-f5e6-a1bd-dc4db86ab0a2	Zasedenost-read	Zasedenost - branje	f
00030000-5604-f5e6-c10c-a699b7f7dbc6	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5604-f5e6-f4fd-f1c008740264	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5604-f5e7-8a56-cb050a07eee4	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5604-f5e7-514f-eaceff0465c5	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5604-f5e7-6510-41b44af9a035	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5604-f5e7-90c9-bd15a887b8c7	Job-read	Branje opravil - samo zase - branje	f
00030000-5604-f5e7-6b1c-9c738b569d66	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5604-f5e7-e5f8-e1f05530aa70	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5604-f5e7-268a-bb505ab1eebe	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5604-f5e7-9038-68b3c974a04c	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5604-f5e7-c1c3-eb862a2a07b9	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5604-f5e7-f004-b9e31750b5e1	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5604-f5e7-d297-21ba4b382bde	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5604-f5e7-54df-61f943b61e05	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5604-f5e7-f8da-653ec101be3d	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5604-f5e7-0cd0-914f330cb1d0	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5604-f5e7-72fa-ee470ccb88cb	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5604-f5e7-601d-d2d691eedab1	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5604-f5e7-acf3-adc82b59148d	Datoteka-write	Datoteka - spreminjanje	f
00030000-5604-f5e7-55da-1f8bbe803078	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2973 (class 0 OID 20581463)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5604-f5e7-7d93-500c69631fda	00030000-5604-f5e6-b3f5-bb59ece92dc4
00020000-5604-f5e7-74da-62af012ec928	00030000-5604-f5e6-eee1-f539b4099146
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-0f2f-58ef196c3af3
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-1c1a-2914f3eac6b7
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-71e5-f004e4fdec97
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-e2cf-47495a04321f
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-ca4a-f7de285241d8
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-7cee-4ba7aa514195
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-f402-332e3ccb548c
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-d631-fa9204671fe1
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-eee1-f539b4099146
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-613c-df7d939f5987
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-0e74-147d7381df8e
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-a258-79f3daa37d1c
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-bfe5-b0404f31c8b9
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-d9a7-7b825cc76102
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-fa11-55e3e39c25b7
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-3ce0-217f7cdb4dcb
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-87e3-6fe52db6f05c
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-e86e-64316cce608a
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-e999-93956b30371f
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-6dd1-239aa88fba8f
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-c742-3fb6c8e1395e
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-7153-44fc8c7a8b3d
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-c56b-33952534240e
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-4d6d-91490155fe8e
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-2136-fd8a53ef1d30
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-2607-86690c2fefe3
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-06e5-bb24c2beee59
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-6646-da7a9eea1478
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-4592-1e9030a7ee95
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-9fb5-2e372e18d6c0
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-beda-e7f08713aca9
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-295d-01bdea5225b6
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-7a81-bb48f9b5ef99
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-6df0-435e94808916
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-29c3-251584cecc48
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-b618-1d4dae705148
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-0ef7-53c382680f6a
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-1cbe-f6551b13e479
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-4ff5-a782d5c0e9a1
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-cbfe-3ff4d2ec90ae
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-9de1-bb10b6d2d609
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-9c2a-9cb0892cf4f5
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-6f21-ae95af8ce178
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-c197-121e16cacbef
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-229c-24178bef0d7c
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-a1bd-dc4db86ab0a2
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-c10c-a699b7f7dbc6
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e6-f4fd-f1c008740264
00020000-5604-f5e7-85f6-c1dc20aac310	00030000-5604-f5e7-514f-eaceff0465c5
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-0f2f-58ef196c3af3
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-ca4a-f7de285241d8
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-7cee-4ba7aa514195
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-eee1-f539b4099146
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-bfe5-b0404f31c8b9
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-fa11-55e3e39c25b7
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-87e3-6fe52db6f05c
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-e86e-64316cce608a
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-e999-93956b30371f
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-6dd1-239aa88fba8f
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-c742-3fb6c8e1395e
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-7153-44fc8c7a8b3d
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-c56b-33952534240e
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-2136-fd8a53ef1d30
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-06e5-bb24c2beee59
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-6646-da7a9eea1478
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-4592-1e9030a7ee95
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-7a81-bb48f9b5ef99
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-29c3-251584cecc48
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-0ef7-53c382680f6a
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-4ff5-a782d5c0e9a1
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-e475-f9f33a2338b4
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-114b-8cbc431922b6
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-cd8a-f2c0d44444de
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-5547-eb11189335d9
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-62b2-5c572e2ada8e
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-c6be-c630ae73f7a9
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e6-f4fd-f1c008740264
00020000-5604-f5e7-ffb3-dd4534e9b35a	00030000-5604-f5e7-514f-eaceff0465c5
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-0f2f-58ef196c3af3
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-71e5-f004e4fdec97
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-ca4a-f7de285241d8
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-1fe9-e274c2ceb1fa
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-8596-f4a7879b35cc
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-36f8-e9d14c5ee05c
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-7cee-4ba7aa514195
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-eee1-f539b4099146
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-0e74-147d7381df8e
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-bfe5-b0404f31c8b9
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-fa11-55e3e39c25b7
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-87e3-6fe52db6f05c
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-e999-93956b30371f
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-6dd1-239aa88fba8f
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-c742-3fb6c8e1395e
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-c56b-33952534240e
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-2136-fd8a53ef1d30
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-4592-1e9030a7ee95
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-beda-e7f08713aca9
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-7a81-bb48f9b5ef99
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-29c3-251584cecc48
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-0ef7-53c382680f6a
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-4ff5-a782d5c0e9a1
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-9de1-bb10b6d2d609
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-c197-121e16cacbef
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-a1bd-dc4db86ab0a2
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e6-f4fd-f1c008740264
00020000-5604-f5e7-6d9e-813861da59fe	00030000-5604-f5e7-514f-eaceff0465c5
00020000-5604-f5e7-ee39-ad6712e0eb3d	00030000-5604-f5e6-0f2f-58ef196c3af3
00020000-5604-f5e7-ee39-ad6712e0eb3d	00030000-5604-f5e6-1c1a-2914f3eac6b7
00020000-5604-f5e7-ee39-ad6712e0eb3d	00030000-5604-f5e6-e2cf-47495a04321f
00020000-5604-f5e7-ee39-ad6712e0eb3d	00030000-5604-f5e6-ca4a-f7de285241d8
00020000-5604-f5e7-ee39-ad6712e0eb3d	00030000-5604-f5e6-7cee-4ba7aa514195
00020000-5604-f5e7-ee39-ad6712e0eb3d	00030000-5604-f5e6-eee1-f539b4099146
00020000-5604-f5e7-ee39-ad6712e0eb3d	00030000-5604-f5e6-bfe5-b0404f31c8b9
00020000-5604-f5e7-ee39-ad6712e0eb3d	00030000-5604-f5e6-fa11-55e3e39c25b7
00020000-5604-f5e7-ee39-ad6712e0eb3d	00030000-5604-f5e6-e999-93956b30371f
00020000-5604-f5e7-ee39-ad6712e0eb3d	00030000-5604-f5e6-6dd1-239aa88fba8f
00020000-5604-f5e7-ee39-ad6712e0eb3d	00030000-5604-f5e6-c56b-33952534240e
00020000-5604-f5e7-ee39-ad6712e0eb3d	00030000-5604-f5e6-2136-fd8a53ef1d30
00020000-5604-f5e7-ee39-ad6712e0eb3d	00030000-5604-f5e6-4592-1e9030a7ee95
00020000-5604-f5e7-ee39-ad6712e0eb3d	00030000-5604-f5e6-7a81-bb48f9b5ef99
00020000-5604-f5e7-ee39-ad6712e0eb3d	00030000-5604-f5e6-29c3-251584cecc48
00020000-5604-f5e7-ee39-ad6712e0eb3d	00030000-5604-f5e6-0ef7-53c382680f6a
00020000-5604-f5e7-ee39-ad6712e0eb3d	00030000-5604-f5e6-4ff5-a782d5c0e9a1
00020000-5604-f5e7-ee39-ad6712e0eb3d	00030000-5604-f5e6-9de1-bb10b6d2d609
00020000-5604-f5e7-ee39-ad6712e0eb3d	00030000-5604-f5e6-f4fd-f1c008740264
00020000-5604-f5e7-ee39-ad6712e0eb3d	00030000-5604-f5e7-514f-eaceff0465c5
00020000-5604-f5e7-a3ad-c2453b1dcedd	00030000-5604-f5e6-0f2f-58ef196c3af3
00020000-5604-f5e7-a3ad-c2453b1dcedd	00030000-5604-f5e6-ca4a-f7de285241d8
00020000-5604-f5e7-a3ad-c2453b1dcedd	00030000-5604-f5e6-7cee-4ba7aa514195
00020000-5604-f5e7-a3ad-c2453b1dcedd	00030000-5604-f5e6-eee1-f539b4099146
00020000-5604-f5e7-a3ad-c2453b1dcedd	00030000-5604-f5e6-bfe5-b0404f31c8b9
00020000-5604-f5e7-a3ad-c2453b1dcedd	00030000-5604-f5e6-fa11-55e3e39c25b7
00020000-5604-f5e7-a3ad-c2453b1dcedd	00030000-5604-f5e6-e999-93956b30371f
00020000-5604-f5e7-a3ad-c2453b1dcedd	00030000-5604-f5e6-6dd1-239aa88fba8f
00020000-5604-f5e7-a3ad-c2453b1dcedd	00030000-5604-f5e6-c56b-33952534240e
00020000-5604-f5e7-a3ad-c2453b1dcedd	00030000-5604-f5e6-2136-fd8a53ef1d30
00020000-5604-f5e7-a3ad-c2453b1dcedd	00030000-5604-f5e6-4592-1e9030a7ee95
00020000-5604-f5e7-a3ad-c2453b1dcedd	00030000-5604-f5e6-7a81-bb48f9b5ef99
00020000-5604-f5e7-a3ad-c2453b1dcedd	00030000-5604-f5e6-29c3-251584cecc48
00020000-5604-f5e7-a3ad-c2453b1dcedd	00030000-5604-f5e6-0ef7-53c382680f6a
00020000-5604-f5e7-a3ad-c2453b1dcedd	00030000-5604-f5e6-4ff5-a782d5c0e9a1
00020000-5604-f5e7-a3ad-c2453b1dcedd	00030000-5604-f5e6-cd26-21e967853141
00020000-5604-f5e7-a3ad-c2453b1dcedd	00030000-5604-f5e6-2d8e-870039b9f95d
00020000-5604-f5e7-a3ad-c2453b1dcedd	00030000-5604-f5e6-9de1-bb10b6d2d609
00020000-5604-f5e7-a3ad-c2453b1dcedd	00030000-5604-f5e6-f4fd-f1c008740264
00020000-5604-f5e7-a3ad-c2453b1dcedd	00030000-5604-f5e7-514f-eaceff0465c5
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-6689-370d3e84b2fb
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-b3f5-bb59ece92dc4
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-2d8e-870039b9f95d
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-f402-332e3ccb548c
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-054b-308e2ae622d2
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-5d0c-76a6af34723d
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-3834-9214dd232601
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-0f2f-58ef196c3af3
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-1c1a-2914f3eac6b7
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-71e5-f004e4fdec97
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-e2cf-47495a04321f
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-ca4a-f7de285241d8
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-1fe9-e274c2ceb1fa
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-8596-f4a7879b35cc
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-b3a4-7917f4aa4288
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-36f8-e9d14c5ee05c
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-5939-875312585246
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-7cee-4ba7aa514195
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-d631-fa9204671fe1
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-eee1-f539b4099146
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-613c-df7d939f5987
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-afb7-35b7f831ff28
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-513c-cc0bc818acbe
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-dd3e-4df16a6c2299
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-08d2-dabbf8981d01
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-0e74-147d7381df8e
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-a258-79f3daa37d1c
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-bfe5-b0404f31c8b9
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-d9a7-7b825cc76102
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-fa11-55e3e39c25b7
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-3ce0-217f7cdb4dcb
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-87e3-6fe52db6f05c
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-e86e-64316cce608a
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-21d7-055334346f9e
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-54ec-c4dd768e89eb
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-7953-2fd07275c6fc
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-8945-c58096adf8aa
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-e999-93956b30371f
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-e9cf-870523e82169
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-6dd1-239aa88fba8f
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-bc2c-379bf956dc71
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-c742-3fb6c8e1395e
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-7153-44fc8c7a8b3d
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-cae2-b407598610db
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-45e4-7be44c773a8e
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-54d4-9524c93b5895
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-dc30-a9a78fe901eb
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-55e6-c7a3e8fda099
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-f66f-33ff0cceb7ab
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-c56b-33952534240e
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-4d6d-91490155fe8e
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-2136-fd8a53ef1d30
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-2607-86690c2fefe3
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-19bd-4954e213d8e0
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-cbb6-3d77fc50a420
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-7c8c-9f0b2e75ebc1
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-be9e-b74b48e6ff35
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-06e5-bb24c2beee59
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-6646-da7a9eea1478
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-4592-1e9030a7ee95
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-9fb5-2e372e18d6c0
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-672c-9ed7f424b545
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-7b10-c8cb3dc5f8f8
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-ac71-d8106fa2c87f
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-825f-fd4f3f00d986
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-beda-e7f08713aca9
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-295d-01bdea5225b6
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-68f8-0c4d3ca828a0
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-4460-59d2fc35dc59
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-0834-cc8166d5be2f
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-5882-ffbdc8a883b2
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-0f23-556d85dc7230
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-93d2-c4d0056e9b8b
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-a46a-13c922ca67fd
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-fc1d-466ad395efe0
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-5f70-cacfba5d033c
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-ec4c-c216cf1fdbd6
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-0cee-b2387885b1d2
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-dc3f-db46958d137a
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-f23d-2998b3d4eb3c
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-adbe-21fbf3ff66fc
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-9d60-c7cc90d2168a
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-3720-8b3ae9ed624c
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-4502-748a0a0cf3a2
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-39f3-e62a5605b55d
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-e052-ac091ad34c25
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-8356-aabc754c49b8
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-7a81-bb48f9b5ef99
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-6df0-435e94808916
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-0116-cf5c84d5ed0a
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-46d2-3a4c8c74af28
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-99fa-6ddaac46af6f
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-23c5-8f538a29e158
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-29c3-251584cecc48
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-b618-1d4dae705148
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-0ef7-53c382680f6a
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-1cbe-f6551b13e479
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-ac7a-095413f7b8b1
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-a541-8f21f6b6f370
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-2d69-8b7431067b8c
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-e28d-11263b3129e7
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-2b71-add9577ab4ae
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-91b2-f3c05950731f
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-251e-7264748e5e2e
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-355e-71ae012baedc
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-4ff5-a782d5c0e9a1
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-cbfe-3ff4d2ec90ae
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-3221-d2f3b8ff37eb
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-f03b-be076fa564c7
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-2fd2-0673892aef94
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-0cb3-61c859c65ebd
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-9d47-6b635518ec0d
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-9e8d-0703a6e0e7d6
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-a5b0-d49f6c30f7cd
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-a1a9-38e7a194991b
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-e475-f9f33a2338b4
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-114b-8cbc431922b6
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-cd26-21e967853141
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-73db-03d7e2c36014
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-9de1-bb10b6d2d609
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-f6ed-823001ca9c28
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-0099-852fe337c996
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-8e29-52d8b3ac37ed
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-cd8a-f2c0d44444de
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-5547-eb11189335d9
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-9c2a-9cb0892cf4f5
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-6f21-ae95af8ce178
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-c197-121e16cacbef
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-229c-24178bef0d7c
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-6b3f-67238fe7c847
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-20e8-f09abb4c5aec
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-0f15-2feb0f6a9864
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-eb1c-8384da62b98f
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-62b2-5c572e2ada8e
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-c6be-c630ae73f7a9
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-a1bd-dc4db86ab0a2
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-c10c-a699b7f7dbc6
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e6-f4fd-f1c008740264
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e7-8a56-cb050a07eee4
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e7-514f-eaceff0465c5
00020000-5604-f5e9-a624-9d16280526b7	00030000-5604-f5e7-6510-41b44af9a035
\.


--
-- TOC entry 3002 (class 0 OID 20581788)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 20581822)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 20581958)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5604-f5e9-b0a4-a7502f4b50b7	00090000-5604-f5e9-a3d7-09b94955de6a	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5604-f5e9-a5f1-3f37c8a3bef2	00090000-5604-f5e9-e12f-fd8e56ca731c	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5604-f5e9-722a-1d019bd6b75c	00090000-5604-f5e9-fc9f-b0c308090c61	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5604-f5e9-5455-f29415ffb01e	00090000-5604-f5e9-28bc-9a6d454cc98e	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2978 (class 0 OID 20581523)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5604-f5e8-3709-2361e00d6dfb	00040000-5604-f5e6-2520-3fc8cc7cf6d6	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5604-f5e8-0d80-c92d15f0d71a	00040000-5604-f5e6-2520-3fc8cc7cf6d6	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5604-f5e8-cb53-11ef915d7785	00040000-5604-f5e6-2520-3fc8cc7cf6d6	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5604-f5e8-80fd-fc8020c668ac	00040000-5604-f5e6-2520-3fc8cc7cf6d6	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5604-f5e8-3f17-0299daaec15b	00040000-5604-f5e6-2520-3fc8cc7cf6d6	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5604-f5e8-3128-26128d26f689	00040000-5604-f5e6-98f2-d2c0c1109b17	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5604-f5e8-4597-c77a0c353641	00040000-5604-f5e6-65db-11e7f006afc0	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5604-f5e8-c47b-7f2c52820061	00040000-5604-f5e6-8d87-faadd5af5d12	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5604-f5e8-dd12-73785a40c071	00040000-5604-f5e6-a1fb-50a9d7540816	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5604-f5ea-d609-eecb5936342d	00040000-5604-f5e6-2520-3fc8cc7cf6d6	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2980 (class 0 OID 20581557)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5604-f5e6-b9d6-943ea3f656a1	8341	Adlešiči
00050000-5604-f5e6-a8ed-978b621a9788	5270	Ajdovščina
00050000-5604-f5e6-a176-4455232e9d74	6280	Ankaran/Ancarano
00050000-5604-f5e6-975f-a8e43032411d	9253	Apače
00050000-5604-f5e6-5098-533ab6f17813	8253	Artiče
00050000-5604-f5e6-a3c6-ab7d133678e1	4275	Begunje na Gorenjskem
00050000-5604-f5e6-305f-5d9d2461c743	1382	Begunje pri Cerknici
00050000-5604-f5e6-c968-42d31075d983	9231	Beltinci
00050000-5604-f5e6-900d-9e2d18e77097	2234	Benedikt
00050000-5604-f5e6-157a-53a0ace8bbf5	2345	Bistrica ob Dravi
00050000-5604-f5e6-e4a4-13ae24876735	3256	Bistrica ob Sotli
00050000-5604-f5e6-caec-7fe66ce899e9	8259	Bizeljsko
00050000-5604-f5e6-40ad-da75b86d3071	1223	Blagovica
00050000-5604-f5e6-e042-c7726a245cee	8283	Blanca
00050000-5604-f5e6-f9d7-e9db3b176383	4260	Bled
00050000-5604-f5e6-798e-feb94e1544f5	4273	Blejska Dobrava
00050000-5604-f5e6-7c4e-d36293d6a475	9265	Bodonci
00050000-5604-f5e6-abdb-1886496098c3	9222	Bogojina
00050000-5604-f5e6-9e47-10642330cb39	4263	Bohinjska Bela
00050000-5604-f5e6-ae52-c283b1a6bdd7	4264	Bohinjska Bistrica
00050000-5604-f5e6-4f80-5058d58c97fc	4265	Bohinjsko jezero
00050000-5604-f5e6-0abf-c56fa951aa8a	1353	Borovnica
00050000-5604-f5e6-37bf-c4c9015f5d86	8294	Boštanj
00050000-5604-f5e6-9da4-02c00f805ba6	5230	Bovec
00050000-5604-f5e6-f9b0-5a6fac14dc2f	5295	Branik
00050000-5604-f5e6-45a4-b8738f7bb6aa	3314	Braslovče
00050000-5604-f5e6-b7e5-f1f2051d9615	5223	Breginj
00050000-5604-f5e6-aa1d-ad0d84072b76	8280	Brestanica
00050000-5604-f5e6-0d4c-6ba6dc672443	2354	Bresternica
00050000-5604-f5e6-b4fe-2e0a7bd76ede	4243	Brezje
00050000-5604-f5e6-3b2a-f20155df1c23	1351	Brezovica pri Ljubljani
00050000-5604-f5e6-7e65-25e135046919	8250	Brežice
00050000-5604-f5e6-800d-d044088218f0	4210	Brnik - Aerodrom
00050000-5604-f5e6-f740-66e4b44b30c6	8321	Brusnice
00050000-5604-f5e6-4fc7-f86b6235dd56	3255	Buče
00050000-5604-f5e6-4cab-b33362bb90e9	8276	Bučka 
00050000-5604-f5e6-9e8f-e457c38ae852	9261	Cankova
00050000-5604-f5e6-e7fb-dd21a69f030f	3000	Celje 
00050000-5604-f5e6-4c69-d2ada19a979b	3001	Celje - poštni predali
00050000-5604-f5e6-b61c-df3750816f09	4207	Cerklje na Gorenjskem
00050000-5604-f5e6-461f-fb001d5074fa	8263	Cerklje ob Krki
00050000-5604-f5e6-5473-42d56c3396d8	1380	Cerknica
00050000-5604-f5e6-ded4-89f9bd290a31	5282	Cerkno
00050000-5604-f5e6-55de-aac1ad736f9f	2236	Cerkvenjak
00050000-5604-f5e6-ddc2-0543f6bdabfe	2215	Ceršak
00050000-5604-f5e6-f597-8b5d4e8747ac	2326	Cirkovce
00050000-5604-f5e6-352c-cf103deb1ae0	2282	Cirkulane
00050000-5604-f5e6-6adb-484503be5f3b	5273	Col
00050000-5604-f5e6-8d31-5ba0f98b931b	8251	Čatež ob Savi
00050000-5604-f5e6-0711-51b0860de71a	1413	Čemšenik
00050000-5604-f5e6-610b-30b4125a8337	5253	Čepovan
00050000-5604-f5e6-733c-68855f600da0	9232	Črenšovci
00050000-5604-f5e6-10ff-2c82757a33a4	2393	Črna na Koroškem
00050000-5604-f5e6-0f4d-b4607df03b44	6275	Črni Kal
00050000-5604-f5e6-9c8f-65020dfe460f	5274	Črni Vrh nad Idrijo
00050000-5604-f5e6-a9ff-37b0bf048de4	5262	Črniče
00050000-5604-f5e6-dcb9-546dea5839c1	8340	Črnomelj
00050000-5604-f5e6-60ba-d06eb5e86371	6271	Dekani
00050000-5604-f5e6-7a9f-d44a8281111f	5210	Deskle
00050000-5604-f5e6-5ce3-c94e5ff2613e	2253	Destrnik
00050000-5604-f5e6-ffcd-2f54c05f5778	6215	Divača
00050000-5604-f5e6-a13c-324d1d012f2e	1233	Dob
00050000-5604-f5e6-4135-0a70811d86af	3224	Dobje pri Planini
00050000-5604-f5e6-88d2-4e7c6e57d15b	8257	Dobova
00050000-5604-f5e6-02f0-c1895042c529	1423	Dobovec
00050000-5604-f5e6-53bf-427a59a8230a	5263	Dobravlje
00050000-5604-f5e6-12b6-e66a3273831f	3204	Dobrna
00050000-5604-f5e6-e05c-00b9038b6b6f	8211	Dobrnič
00050000-5604-f5e6-4fab-29b0491d20c8	1356	Dobrova
00050000-5604-f5e6-4a0a-49275ca1496f	9223	Dobrovnik/Dobronak 
00050000-5604-f5e6-1e41-760fd6b9ff90	5212	Dobrovo v Brdih
00050000-5604-f5e6-53f8-0c72d1b3e341	1431	Dol pri Hrastniku
00050000-5604-f5e6-f273-49d357e22e88	1262	Dol pri Ljubljani
00050000-5604-f5e6-1c1d-0ed8bc7f1bea	1273	Dole pri Litiji
00050000-5604-f5e6-cfc9-ce7ef2e1e588	1331	Dolenja vas
00050000-5604-f5e6-9e33-05497684c969	8350	Dolenjske Toplice
00050000-5604-f5e6-2122-949a12e5c3d4	1230	Domžale
00050000-5604-f5e6-9a0f-99db85c31302	2252	Dornava
00050000-5604-f5e6-193c-c1a2687060ea	5294	Dornberk
00050000-5604-f5e6-67ac-c3f7d721f8fe	1319	Draga
00050000-5604-f5e6-6faf-382bf8c85abb	8343	Dragatuš
00050000-5604-f5e6-fb38-ba750eb4c071	3222	Dramlje
00050000-5604-f5e6-da79-576075beabc0	2370	Dravograd
00050000-5604-f5e6-6238-8cd86b8b3057	4203	Duplje
00050000-5604-f5e6-0be6-b6e7bfe4b1af	6221	Dutovlje
00050000-5604-f5e6-78e1-3aa3cdd4b11a	8361	Dvor
00050000-5604-f5e6-25f2-9a0b61ba5a9d	2343	Fala
00050000-5604-f5e6-d1e0-b41aca547ec2	9208	Fokovci
00050000-5604-f5e6-6846-dc16756b7a6c	2313	Fram
00050000-5604-f5e6-f992-8627f0f2fb1b	3213	Frankolovo
00050000-5604-f5e6-27c6-65f06bf73fd2	1274	Gabrovka
00050000-5604-f5e6-3180-09cc5c502ac8	8254	Globoko
00050000-5604-f5e6-7087-4f9d8921f0b1	5275	Godovič
00050000-5604-f5e6-07bf-b95e738c76ce	4204	Golnik
00050000-5604-f5e6-192e-7470d0cfac30	3303	Gomilsko
00050000-5604-f5e6-4459-10c78b085cb2	4224	Gorenja vas
00050000-5604-f5e6-93ba-e651339f0ec0	3263	Gorica pri Slivnici
00050000-5604-f5e6-b3c2-9d24b38408cc	2272	Gorišnica
00050000-5604-f5e6-9a6d-e2d8eefc81af	9250	Gornja Radgona
00050000-5604-f5e6-1176-f56d316a54ce	3342	Gornji Grad
00050000-5604-f5e6-01cd-3dd2656bf088	4282	Gozd Martuljek
00050000-5604-f5e6-aa53-2c293120d57c	6272	Gračišče
00050000-5604-f5e6-822a-4c2adfda3294	9264	Grad
00050000-5604-f5e6-4e11-fa56cf0be60e	8332	Gradac
00050000-5604-f5e6-f4bb-e202712075df	1384	Grahovo
00050000-5604-f5e6-e662-78bb4b9ed0e4	5242	Grahovo ob Bači
00050000-5604-f5e6-23f1-ffd40fed7e18	5251	Grgar
00050000-5604-f5e6-5d4a-80d499feb2bf	3302	Griže
00050000-5604-f5e6-074e-8d38d82fda76	3231	Grobelno
00050000-5604-f5e6-5571-f8f7abb6b110	1290	Grosuplje
00050000-5604-f5e6-ce44-64438fb42817	2288	Hajdina
00050000-5604-f5e6-8d63-b15562f650dc	8362	Hinje
00050000-5604-f5e6-e547-920fdfa5a4dc	2311	Hoče
00050000-5604-f5e6-cce7-c276f509886f	9205	Hodoš/Hodos
00050000-5604-f5e6-1711-6ecea5eeb090	1354	Horjul
00050000-5604-f5e6-c1f2-22a072029c68	1372	Hotedršica
00050000-5604-f5e6-11a2-259e63cad436	1430	Hrastnik
00050000-5604-f5e6-edec-4ab66e374c67	6225	Hruševje
00050000-5604-f5e6-555e-0fdb02729573	4276	Hrušica
00050000-5604-f5e6-681a-7bc47f54919b	5280	Idrija
00050000-5604-f5e6-cafb-16632b38272c	1292	Ig
00050000-5604-f5e6-c68f-3bfa1de7cc81	6250	Ilirska Bistrica
00050000-5604-f5e6-f1ba-3d5dd05785a9	6251	Ilirska Bistrica-Trnovo
00050000-5604-f5e6-5557-834d4e3249e2	1295	Ivančna Gorica
00050000-5604-f5e6-2416-dc15a0d17a47	2259	Ivanjkovci
00050000-5604-f5e6-8837-18b2f2d2157d	1411	Izlake
00050000-5604-f5e6-faf9-f79de67ee0b3	6310	Izola/Isola
00050000-5604-f5e6-0baa-3e47570670a0	2222	Jakobski Dol
00050000-5604-f5e6-32fc-ba901c227e6b	2221	Jarenina
00050000-5604-f5e6-b10d-a75bd069901f	6254	Jelšane
00050000-5604-f5e6-d575-cb59aec35a0a	4270	Jesenice
00050000-5604-f5e6-ebef-e7cb32d723dd	8261	Jesenice na Dolenjskem
00050000-5604-f5e6-cf2a-80d9be4c4f17	3273	Jurklošter
00050000-5604-f5e6-3499-533954812aac	2223	Jurovski Dol
00050000-5604-f5e6-b108-ecb1501efee4	2256	Juršinci
00050000-5604-f5e6-0d1c-a0a6e28fe00c	5214	Kal nad Kanalom
00050000-5604-f5e6-73ba-d389cf96680b	3233	Kalobje
00050000-5604-f5e6-e5a5-76dfc20e9872	4246	Kamna Gorica
00050000-5604-f5e6-3d02-23bdfa938744	2351	Kamnica
00050000-5604-f5e6-048d-d8c932bb7fd6	1241	Kamnik
00050000-5604-f5e6-66df-08fa57d4e9e3	5213	Kanal
00050000-5604-f5e6-3f29-0644987de655	8258	Kapele
00050000-5604-f5e6-1713-cbf4968bab81	2362	Kapla
00050000-5604-f5e6-b5e7-b21daaf8ace7	2325	Kidričevo
00050000-5604-f5e6-ac03-78855fcbbdd2	1412	Kisovec
00050000-5604-f5e6-c1bf-380749a52104	6253	Knežak
00050000-5604-f5e6-46a1-b8d454974bd8	5222	Kobarid
00050000-5604-f5e6-526e-824a94ecbec1	9227	Kobilje
00050000-5604-f5e6-eb92-c37f973f9be7	1330	Kočevje
00050000-5604-f5e6-c88d-06d14395013a	1338	Kočevska Reka
00050000-5604-f5e6-1d7b-12fc9df24b25	2276	Kog
00050000-5604-f5e6-17dd-b6dea15d9167	5211	Kojsko
00050000-5604-f5e6-7680-1c93b460b539	6223	Komen
00050000-5604-f5e6-8419-7745373c2986	1218	Komenda
00050000-5604-f5e6-bc32-36b428df75e6	6000	Koper/Capodistria 
00050000-5604-f5e6-7ffa-546e5850e3f4	6001	Koper/Capodistria - poštni predali
00050000-5604-f5e6-6dbc-2d4f4b5b5387	8282	Koprivnica
00050000-5604-f5e6-da3d-1d9d02907670	5296	Kostanjevica na Krasu
00050000-5604-f5e6-214c-9968f1f7d39a	8311	Kostanjevica na Krki
00050000-5604-f5e6-8ec0-dd4bef965507	1336	Kostel
00050000-5604-f5e6-62bb-0aef1b694b84	6256	Košana
00050000-5604-f5e6-e1d0-905152dfaa23	2394	Kotlje
00050000-5604-f5e6-b61e-f39583aa9fc6	6240	Kozina
00050000-5604-f5e6-5e67-6dc738e8e578	3260	Kozje
00050000-5604-f5e6-7787-c0c5a2f8b62a	4000	Kranj 
00050000-5604-f5e6-4f6b-bfb94bc27900	4001	Kranj - poštni predali
00050000-5604-f5e6-31a4-c6c1629372de	4280	Kranjska Gora
00050000-5604-f5e6-75e6-7cc559212eb3	1281	Kresnice
00050000-5604-f5e6-79b6-eacb08a0ab99	4294	Križe
00050000-5604-f5e6-c3aa-57a4441480ca	9206	Križevci
00050000-5604-f5e6-6921-5068951775c4	9242	Križevci pri Ljutomeru
00050000-5604-f5e6-ffaa-0b5ebdde726f	1301	Krka
00050000-5604-f5e6-5186-c1d8b9487c7e	8296	Krmelj
00050000-5604-f5e6-88d1-15e61842ae31	4245	Kropa
00050000-5604-f5e6-59a8-1d70212aacd6	8262	Krška vas
00050000-5604-f5e6-5ba8-953a732f142b	8270	Krško
00050000-5604-f5e6-eab6-a68bc7f4ab3d	9263	Kuzma
00050000-5604-f5e6-4450-43bf29b96e35	2318	Laporje
00050000-5604-f5e6-5af6-6453cca0a239	3270	Laško
00050000-5604-f5e6-80e8-db447bb81395	1219	Laze v Tuhinju
00050000-5604-f5e6-40ee-69a71106a30f	2230	Lenart v Slovenskih goricah
00050000-5604-f5e6-af07-15f5961b2689	9220	Lendava/Lendva
00050000-5604-f5e6-98b0-db22e3e5ea56	4248	Lesce
00050000-5604-f5e6-8883-dfa976b8b6cf	3261	Lesično
00050000-5604-f5e6-dc6c-9bb0cfb59961	8273	Leskovec pri Krškem
00050000-5604-f5e6-3580-f58198865637	2372	Libeliče
00050000-5604-f5e6-ba40-8eb3f913def9	2341	Limbuš
00050000-5604-f5e6-853d-e6ff93603920	1270	Litija
00050000-5604-f5e6-b066-f81045cbd0e5	3202	Ljubečna
00050000-5604-f5e6-b339-4a6e5383e48c	1000	Ljubljana 
00050000-5604-f5e6-483d-e1dda3455a4e	1001	Ljubljana - poštni predali
00050000-5604-f5e6-acb4-3f4c2e353595	1231	Ljubljana - Črnuče
00050000-5604-f5e6-46f2-483b3e3cef78	1261	Ljubljana - Dobrunje
00050000-5604-f5e6-ed51-07db18c82974	1260	Ljubljana - Polje
00050000-5604-f5e6-5e63-a7f9973c9685	1210	Ljubljana - Šentvid
00050000-5604-f5e6-76db-921d96805b7b	1211	Ljubljana - Šmartno
00050000-5604-f5e6-cb35-314ef35fdd1d	3333	Ljubno ob Savinji
00050000-5604-f5e6-bbdb-7120ec6478e5	9240	Ljutomer
00050000-5604-f5e6-e1c3-dabb7ad192f0	3215	Loče
00050000-5604-f5e6-8e3e-a6a9bc8b04ae	5231	Log pod Mangartom
00050000-5604-f5e6-685d-f8c2c2929712	1358	Log pri Brezovici
00050000-5604-f5e6-12c2-388b86c7a870	1370	Logatec
00050000-5604-f5e6-8ea7-e372a21b58ea	1371	Logatec
00050000-5604-f5e6-e799-42a4aafd71d8	1434	Loka pri Zidanem Mostu
00050000-5604-f5e6-2ddd-3e68f381c1f5	3223	Loka pri Žusmu
00050000-5604-f5e6-155b-1dd8f7dea742	6219	Lokev
00050000-5604-f5e6-036a-47a3130c018b	1318	Loški Potok
00050000-5604-f5e6-8cee-8e68ef839dbf	2324	Lovrenc na Dravskem polju
00050000-5604-f5e6-d610-3d57dd729fd2	2344	Lovrenc na Pohorju
00050000-5604-f5e6-e075-30a411b83a81	3334	Luče
00050000-5604-f5e6-9f54-9b4ffb301f09	1225	Lukovica
00050000-5604-f5e6-7ea0-680ec28c24cd	9202	Mačkovci
00050000-5604-f5e6-5b31-39892646336b	2322	Majšperk
00050000-5604-f5e6-8a8c-dd4a2f05d84c	2321	Makole
00050000-5604-f5e6-a363-9d9ab007dbcd	9243	Mala Nedelja
00050000-5604-f5e6-a9a9-53b7e7999e42	2229	Malečnik
00050000-5604-f5e6-9039-54f7f416609b	6273	Marezige
00050000-5604-f5e6-d7b0-0248066359d1	2000	Maribor 
00050000-5604-f5e6-ca5d-c38ee391c549	2001	Maribor - poštni predali
00050000-5604-f5e6-2fc4-161bf2df8351	2206	Marjeta na Dravskem polju
00050000-5604-f5e6-6479-9e8935b001d1	2281	Markovci
00050000-5604-f5e6-2142-da45ab54e7f2	9221	Martjanci
00050000-5604-f5e6-8986-eb4b1f250ff7	6242	Materija
00050000-5604-f5e6-add7-40b554697c56	4211	Mavčiče
00050000-5604-f5e6-71bf-bc211d0c9c3e	1215	Medvode
00050000-5604-f5e6-4450-944d73d1db3b	1234	Mengeš
00050000-5604-f5e6-86dd-9e73b07fa954	8330	Metlika
00050000-5604-f5e6-3cca-85ce51fe257b	2392	Mežica
00050000-5604-f5e6-f695-d64154e3d870	2204	Miklavž na Dravskem polju
00050000-5604-f5e6-bdc7-be667685bff7	2275	Miklavž pri Ormožu
00050000-5604-f5e6-be07-da9dc9b00be3	5291	Miren
00050000-5604-f5e6-73a4-e00e2a1246cd	8233	Mirna
00050000-5604-f5e6-b9f6-3a00a48f8338	8216	Mirna Peč
00050000-5604-f5e6-a01c-0f716618b611	2382	Mislinja
00050000-5604-f5e6-7822-e25be4965999	4281	Mojstrana
00050000-5604-f5e6-33a8-541351efdbf4	8230	Mokronog
00050000-5604-f5e6-94dd-ee5810949b9a	1251	Moravče
00050000-5604-f5e6-d9df-dce109282967	9226	Moravske Toplice
00050000-5604-f5e6-3c90-09026739c72a	5216	Most na Soči
00050000-5604-f5e6-4b62-201c3ec1e583	1221	Motnik
00050000-5604-f5e6-2022-58b8ee4d6764	3330	Mozirje
00050000-5604-f5e6-a537-6f00aa8efb6f	9000	Murska Sobota 
00050000-5604-f5e6-7540-2f0f70a409ee	9001	Murska Sobota - poštni predali
00050000-5604-f5e6-73a0-e56fd9db096b	2366	Muta
00050000-5604-f5e6-432d-738fb3282e7c	4202	Naklo
00050000-5604-f5e6-b881-2dd9e74c16d0	3331	Nazarje
00050000-5604-f5e6-fc76-1b3c638295f5	1357	Notranje Gorice
00050000-5604-f5e6-7748-608010f23410	3203	Nova Cerkev
00050000-5604-f5e6-e80d-968c3eaa4910	5000	Nova Gorica 
00050000-5604-f5e6-5be3-407a5a080f8c	5001	Nova Gorica - poštni predali
00050000-5604-f5e6-3b83-c358910d13d4	1385	Nova vas
00050000-5604-f5e6-e39c-fcaaace18c31	8000	Novo mesto
00050000-5604-f5e6-f366-45a2b30379d2	8001	Novo mesto - poštni predali
00050000-5604-f5e6-3b24-b75bd7cdebb2	6243	Obrov
00050000-5604-f5e6-b1b8-9a4c585db529	9233	Odranci
00050000-5604-f5e6-f3f8-29cb2d1b8a2f	2317	Oplotnica
00050000-5604-f5e6-56e4-111bfb91d3ef	2312	Orehova vas
00050000-5604-f5e6-15b1-f62870de5b19	2270	Ormož
00050000-5604-f5e6-3218-7b1703966305	1316	Ortnek
00050000-5604-f5e6-1ea3-f60691ed5abe	1337	Osilnica
00050000-5604-f5e6-2d3e-3cf15687e051	8222	Otočec
00050000-5604-f5e6-8b74-1bf2da7365fa	2361	Ožbalt
00050000-5604-f5e6-00cd-723a621a68d3	2231	Pernica
00050000-5604-f5e6-cf8e-492d500bb56e	2211	Pesnica pri Mariboru
00050000-5604-f5e6-a660-69cf6368d9e2	9203	Petrovci
00050000-5604-f5e6-83e7-8a710b2f8ef8	3301	Petrovče
00050000-5604-f5e6-e4a2-0479db15017f	6330	Piran/Pirano
00050000-5604-f5e6-11f8-84cbe2150012	8255	Pišece
00050000-5604-f5e6-ba6b-450d3543adb9	6257	Pivka
00050000-5604-f5e6-9749-5e91986437fd	6232	Planina
00050000-5604-f5e6-368d-48b36f7143f1	3225	Planina pri Sevnici
00050000-5604-f5e6-5f4b-2d9f7ef4b0d8	6276	Pobegi
00050000-5604-f5e6-0a79-008cb74f33f3	8312	Podbočje
00050000-5604-f5e6-b9cf-f5a72daf5b61	5243	Podbrdo
00050000-5604-f5e6-36fb-0d6001761229	3254	Podčetrtek
00050000-5604-f5e6-4a14-146c996ee1e5	2273	Podgorci
00050000-5604-f5e6-a766-023da51c2a0a	6216	Podgorje
00050000-5604-f5e6-ae78-0fd8589b6071	2381	Podgorje pri Slovenj Gradcu
00050000-5604-f5e6-8a0b-c39860eca82f	6244	Podgrad
00050000-5604-f5e6-d279-06c65914c795	1414	Podkum
00050000-5604-f5e6-49ea-5894f663a65a	2286	Podlehnik
00050000-5604-f5e6-9763-1a1eb3aac594	5272	Podnanos
00050000-5604-f5e6-72e7-5bac3c2e02b1	4244	Podnart
00050000-5604-f5e6-5b23-9d712fb742ba	3241	Podplat
00050000-5604-f5e6-5144-bd5f2188e298	3257	Podsreda
00050000-5604-f5e6-75d9-fada839ecb0f	2363	Podvelka
00050000-5604-f5e6-4be5-3feec124063d	2208	Pohorje
00050000-5604-f5e6-8380-b795f0c1ecbe	2257	Polenšak
00050000-5604-f5e6-413f-a41015e503ea	1355	Polhov Gradec
00050000-5604-f5e6-b0c6-4d502aa70648	4223	Poljane nad Škofjo Loko
00050000-5604-f5e6-c592-e315a1ec4ef4	2319	Poljčane
00050000-5604-f5e6-cbef-83d08e175e64	1272	Polšnik
00050000-5604-f5e6-2b66-b49fd796b54d	3313	Polzela
00050000-5604-f5e6-2a47-178ee6bc675c	3232	Ponikva
00050000-5604-f5e6-cafa-524117fc8624	6320	Portorož/Portorose
00050000-5604-f5e6-8522-2e1f17e81001	6230	Postojna
00050000-5604-f5e6-494b-a5af124c3522	2331	Pragersko
00050000-5604-f5e6-883c-cd7afdaf2287	3312	Prebold
00050000-5604-f5e6-a8c4-0e17c5086162	4205	Preddvor
00050000-5604-f5e6-a7c5-0379aa256456	6255	Prem
00050000-5604-f5e6-52ab-dca83073edb9	1352	Preserje
00050000-5604-f5e6-b961-d22f858a6e34	6258	Prestranek
00050000-5604-f5e6-f62a-6adaf716676b	2391	Prevalje
00050000-5604-f5e6-178e-7065c9117793	3262	Prevorje
00050000-5604-f5e6-0672-243d7bb6a01b	1276	Primskovo 
00050000-5604-f5e6-c505-001f40ec28ee	3253	Pristava pri Mestinju
00050000-5604-f5e6-3064-cbefedcd848b	9207	Prosenjakovci/Partosfalva
00050000-5604-f5e6-05fc-64edf319dcd6	5297	Prvačina
00050000-5604-f5e6-966e-06df8c828ecd	2250	Ptuj
00050000-5604-f5e6-a77b-7385fdf84963	2323	Ptujska Gora
00050000-5604-f5e6-2e77-54ead9cecd6b	9201	Puconci
00050000-5604-f5e6-7a2f-36bba797dcf9	2327	Rače
00050000-5604-f5e6-95fc-288ec9a8c78c	1433	Radeče
00050000-5604-f5e6-1481-a8faac4e0a01	9252	Radenci
00050000-5604-f5e6-47ef-fea814213cbb	2360	Radlje ob Dravi
00050000-5604-f5e6-0c81-45a3823fdbcd	1235	Radomlje
00050000-5604-f5e6-ba1f-3f15fa97b15d	4240	Radovljica
00050000-5604-f5e6-7045-7f538c2fd9c3	8274	Raka
00050000-5604-f5e6-125b-41b539416d13	1381	Rakek
00050000-5604-f5e6-4d44-11253871eb78	4283	Rateče - Planica
00050000-5604-f5e6-c544-b676b59a72f6	2390	Ravne na Koroškem
00050000-5604-f5e6-ca14-f47ff5edf06f	9246	Razkrižje
00050000-5604-f5e6-7793-10d6294a2a27	3332	Rečica ob Savinji
00050000-5604-f5e6-71ca-fe6af6c6279f	5292	Renče
00050000-5604-f5e6-7944-42a6cf168ea1	1310	Ribnica
00050000-5604-f5e6-0e6a-c4640a01d58e	2364	Ribnica na Pohorju
00050000-5604-f5e6-1051-1b8ff0ab6a7f	3272	Rimske Toplice
00050000-5604-f5e6-8635-aa6b64b6de57	1314	Rob
00050000-5604-f5e6-0644-56cd8958be6c	5215	Ročinj
00050000-5604-f5e6-5659-715b0ec1cde8	3250	Rogaška Slatina
00050000-5604-f5e6-3f3d-643a8a1a76ac	9262	Rogašovci
00050000-5604-f5e6-fa80-eda5cffcce34	3252	Rogatec
00050000-5604-f5e6-0e82-92e557f09804	1373	Rovte
00050000-5604-f5e6-49dc-c1226a935b02	2342	Ruše
00050000-5604-f5e6-1f60-becb6e7f0394	1282	Sava
00050000-5604-f5e6-946d-65d153cf5e86	6333	Sečovlje/Sicciole
00050000-5604-f5e6-57c5-f8f5504b6a30	4227	Selca
00050000-5604-f5e6-11af-3fcb895a22ed	2352	Selnica ob Dravi
00050000-5604-f5e6-5d48-f9b9322f2192	8333	Semič
00050000-5604-f5e6-439e-afa00beca0d4	8281	Senovo
00050000-5604-f5e6-d862-a713930bbf4b	6224	Senožeče
00050000-5604-f5e6-45e7-80067dfb2611	8290	Sevnica
00050000-5604-f5e6-b481-82e2b9d1fe33	6210	Sežana
00050000-5604-f5e6-26da-52bb32f825e0	2214	Sladki Vrh
00050000-5604-f5e6-98d9-50fa79070f24	5283	Slap ob Idrijci
00050000-5604-f5e6-b01a-27f18d56e609	2380	Slovenj Gradec
00050000-5604-f5e6-05b8-e69e959f1c44	2310	Slovenska Bistrica
00050000-5604-f5e6-2784-0f4418ce6c7a	3210	Slovenske Konjice
00050000-5604-f5e6-bcec-91b6fd4e7de0	1216	Smlednik
00050000-5604-f5e6-e43a-38ff3e8e6cdf	5232	Soča
00050000-5604-f5e6-e00f-164516be14b7	1317	Sodražica
00050000-5604-f5e6-18a9-9c3a8b94f467	3335	Solčava
00050000-5604-f5e6-97bc-0574f84b9059	5250	Solkan
00050000-5604-f5e6-ec7e-22e4d8bb3e1c	4229	Sorica
00050000-5604-f5e6-1f36-564c55ba7b9e	4225	Sovodenj
00050000-5604-f5e6-a5cf-c70f6874ae6f	5281	Spodnja Idrija
00050000-5604-f5e6-049a-13628031b9fd	2241	Spodnji Duplek
00050000-5604-f5e6-b646-da49249976ce	9245	Spodnji Ivanjci
00050000-5604-f5e6-ec81-5f99c973c891	2277	Središče ob Dravi
00050000-5604-f5e6-38f3-95fdc42ffc16	4267	Srednja vas v Bohinju
00050000-5604-f5e6-ddc1-6a09e74be954	8256	Sromlje 
00050000-5604-f5e6-f79d-020bdabcea6f	5224	Srpenica
00050000-5604-f5e6-5822-7870dc9ae6cc	1242	Stahovica
00050000-5604-f5e6-6170-dbc1ca8f8dd6	1332	Stara Cerkev
00050000-5604-f5e6-9fe7-daf8df447a9e	8342	Stari trg ob Kolpi
00050000-5604-f5e6-48b3-ce0497c5c633	1386	Stari trg pri Ložu
00050000-5604-f5e6-810e-92c0fe1bb931	2205	Starše
00050000-5604-f5e6-dcc2-c8fe30d9ff01	2289	Stoperce
00050000-5604-f5e6-4f0f-05f3b122c090	8322	Stopiče
00050000-5604-f5e6-4536-f0ca2f868e00	3206	Stranice
00050000-5604-f5e6-eb97-e7ce286eb12d	8351	Straža
00050000-5604-f5e6-cb2c-461608fb4e40	1313	Struge
00050000-5604-f5e6-2c6c-dd920f771ce9	8293	Studenec
00050000-5604-f5e6-6e5f-ab2e5588ddf6	8331	Suhor
00050000-5604-f5e6-8123-c2d41cb58381	2233	Sv. Ana v Slovenskih goricah
00050000-5604-f5e6-e532-365f1ff190d8	2235	Sv. Trojica v Slovenskih goricah
00050000-5604-f5e6-b25d-a8950fc259e2	2353	Sveti Duh na Ostrem Vrhu
00050000-5604-f5e6-e0a0-d7b9e4295284	9244	Sveti Jurij ob Ščavnici
00050000-5604-f5e6-1bae-d96202b6304e	3264	Sveti Štefan
00050000-5604-f5e6-415f-2ac116457819	2258	Sveti Tomaž
00050000-5604-f5e6-dc7e-893520f74260	9204	Šalovci
00050000-5604-f5e6-92f1-5b42511dab45	5261	Šempas
00050000-5604-f5e6-7425-0b09414165a0	5290	Šempeter pri Gorici
00050000-5604-f5e6-e65d-77011ccada30	3311	Šempeter v Savinjski dolini
00050000-5604-f5e6-21c3-da7abe65ead3	4208	Šenčur
00050000-5604-f5e6-b15f-7ded4d345adb	2212	Šentilj v Slovenskih goricah
00050000-5604-f5e6-2032-bf5e4827da78	8297	Šentjanž
00050000-5604-f5e6-dfba-03b877660a62	2373	Šentjanž pri Dravogradu
00050000-5604-f5e6-c03a-63cfbe9348ff	8310	Šentjernej
00050000-5604-f5e6-3d61-4c7d84ce711c	3230	Šentjur
00050000-5604-f5e6-752e-454b53715f78	3271	Šentrupert
00050000-5604-f5e6-b78f-544a73640c73	8232	Šentrupert
00050000-5604-f5e6-9deb-95dc228e52d3	1296	Šentvid pri Stični
00050000-5604-f5e6-a97f-82f0e0f16e98	8275	Škocjan
00050000-5604-f5e6-2e61-762d0c4cd624	6281	Škofije
00050000-5604-f5e6-d019-b0eb32ac5047	4220	Škofja Loka
00050000-5604-f5e6-5df5-15e315a02809	3211	Škofja vas
00050000-5604-f5e6-a102-808cf3f5a622	1291	Škofljica
00050000-5604-f5e6-38a5-89c1c63928a8	6274	Šmarje
00050000-5604-f5e6-4aa7-128d6edb3076	1293	Šmarje - Sap
00050000-5604-f5e6-249b-b789bf46f6fe	3240	Šmarje pri Jelšah
00050000-5604-f5e6-8ceb-f1112e37bdf2	8220	Šmarješke Toplice
00050000-5604-f5e6-3455-e792d2b4d9f5	2315	Šmartno na Pohorju
00050000-5604-f5e6-e257-86f5acba1fa0	3341	Šmartno ob Dreti
00050000-5604-f5e6-bbfc-e3181f25389d	3327	Šmartno ob Paki
00050000-5604-f5e6-d2f9-f44c2d41f78d	1275	Šmartno pri Litiji
00050000-5604-f5e6-c235-e0338b82c040	2383	Šmartno pri Slovenj Gradcu
00050000-5604-f5e6-a8c2-9de6a93803b8	3201	Šmartno v Rožni dolini
00050000-5604-f5e6-38ba-f7a01633d5ce	3325	Šoštanj
00050000-5604-f5e6-0413-0db9e63a543c	6222	Štanjel
00050000-5604-f5e6-b4fa-085b2c7e1fcf	3220	Štore
00050000-5604-f5e6-94ec-34611356a219	3304	Tabor
00050000-5604-f5e6-f1f6-239e97d7c932	3221	Teharje
00050000-5604-f5e6-c04e-15182bf3c0d3	9251	Tišina
00050000-5604-f5e6-4217-baa6684e8c64	5220	Tolmin
00050000-5604-f5e6-840a-d1d43beb32d0	3326	Topolšica
00050000-5604-f5e6-30ee-8ae5bf200e6e	2371	Trbonje
00050000-5604-f5e6-262b-080e7ed0922d	1420	Trbovlje
00050000-5604-f5e6-7af3-ee3ef1060377	8231	Trebelno 
00050000-5604-f5e6-7b51-f1e52893339c	8210	Trebnje
00050000-5604-f5e6-87da-114848267ce7	5252	Trnovo pri Gorici
00050000-5604-f5e6-cdb0-fd41d42ab8d7	2254	Trnovska vas
00050000-5604-f5e6-fba7-0f5cd0d73037	1222	Trojane
00050000-5604-f5e6-1f82-57d26901cc94	1236	Trzin
00050000-5604-f5e6-2ce9-bcda392bb8a4	4290	Tržič
00050000-5604-f5e6-6225-642060f44561	8295	Tržišče
00050000-5604-f5e6-f8f0-7c475cfba49c	1311	Turjak
00050000-5604-f5e6-d8f6-8e698346b749	9224	Turnišče
00050000-5604-f5e6-6618-c665c6e03f99	8323	Uršna sela
00050000-5604-f5e6-23e9-79436eb76528	1252	Vače
00050000-5604-f5e6-d0c0-4d69186cc398	3320	Velenje 
00050000-5604-f5e6-a228-07531da6c962	3322	Velenje - poštni predali
00050000-5604-f5e6-c8b4-982f3f2b1c25	8212	Velika Loka
00050000-5604-f5e6-4b15-f85fc8ca5102	2274	Velika Nedelja
00050000-5604-f5e6-0031-efaa2729dfa5	9225	Velika Polana
00050000-5604-f5e6-ba1c-5c7746ad1499	1315	Velike Lašče
00050000-5604-f5e6-ca1f-197dbabab0f7	8213	Veliki Gaber
00050000-5604-f5e6-5e4a-ec4e51ed42fc	9241	Veržej
00050000-5604-f5e6-8c4c-cff0e80b47d7	1312	Videm - Dobrepolje
00050000-5604-f5e6-e25f-89458dd5edbc	2284	Videm pri Ptuju
00050000-5604-f5e6-cbd9-b0b0b8971e31	8344	Vinica
00050000-5604-f5e6-8357-2ef7efbbd97e	5271	Vipava
00050000-5604-f5e6-561f-95b7558430e9	4212	Visoko
00050000-5604-f5e6-9b34-7c14f95dc948	1294	Višnja Gora
00050000-5604-f5e6-da0c-43689323577e	3205	Vitanje
00050000-5604-f5e6-1fbe-32f6c6e9b314	2255	Vitomarci
00050000-5604-f5e6-7d0c-1ad146a39a28	1217	Vodice
00050000-5604-f5e6-ce84-ddbb9f162650	3212	Vojnik\t
00050000-5604-f5e6-5d16-1405c1be6cb0	5293	Volčja Draga
00050000-5604-f5e6-c063-afa6607c8de0	2232	Voličina
00050000-5604-f5e6-0a27-850eca19dce3	3305	Vransko
00050000-5604-f5e6-f1d4-2da4a5a6edfd	6217	Vremski Britof
00050000-5604-f5e6-bef1-d8135ffea13d	1360	Vrhnika
00050000-5604-f5e6-0baf-3d933b8f6ec1	2365	Vuhred
00050000-5604-f5e6-f76c-d0e910355921	2367	Vuzenica
00050000-5604-f5e6-1baf-356092b4b960	8292	Zabukovje 
00050000-5604-f5e6-7978-b57710910915	1410	Zagorje ob Savi
00050000-5604-f5e6-9b63-0a0874a55084	1303	Zagradec
00050000-5604-f5e6-1738-4dc7e4f528ef	2283	Zavrč
00050000-5604-f5e6-e02a-8417cfb32968	8272	Zdole 
00050000-5604-f5e6-121d-5317752cd495	4201	Zgornja Besnica
00050000-5604-f5e6-2bc1-d2a691790f2b	2242	Zgornja Korena
00050000-5604-f5e6-0d64-015132d33551	2201	Zgornja Kungota
00050000-5604-f5e6-73c8-29d24ba0c8f6	2316	Zgornja Ložnica
00050000-5604-f5e6-7c91-560d286c0513	2314	Zgornja Polskava
00050000-5604-f5e6-facc-fa834745a955	2213	Zgornja Velka
00050000-5604-f5e6-9c19-542d34d09223	4247	Zgornje Gorje
00050000-5604-f5e6-1524-2b489d0d65d2	4206	Zgornje Jezersko
00050000-5604-f5e6-dbac-62a132c8eb58	2285	Zgornji Leskovec
00050000-5604-f5e6-e891-6db661459fdc	1432	Zidani Most
00050000-5604-f5e6-5548-9e3f45a22135	3214	Zreče
00050000-5604-f5e6-ce13-d3adb02b1a5e	4209	Žabnica
00050000-5604-f5e6-2e34-4832a27a6ac4	3310	Žalec
00050000-5604-f5e6-dc30-7b8e248f422a	4228	Železniki
00050000-5604-f5e6-05a7-a069c33862d9	2287	Žetale
00050000-5604-f5e6-00f7-2e1668f4268f	4226	Žiri
00050000-5604-f5e6-82d5-5fc38c298972	4274	Žirovnica
00050000-5604-f5e6-2599-00d095a77bfb	8360	Žužemberk
\.


--
-- TOC entry 3025 (class 0 OID 20582138)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 20581762)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 20581542)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5604-f5e9-ff16-6d628c1bac3d	00080000-5604-f5e8-3709-2361e00d6dfb	\N	00040000-5604-f5e6-2520-3fc8cc7cf6d6	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5604-f5e9-ae00-cc1e9ed9a0af	00080000-5604-f5e8-3709-2361e00d6dfb	\N	00040000-5604-f5e6-2520-3fc8cc7cf6d6	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5604-f5e9-3a74-4be65c25b2fb	00080000-5604-f5e8-0d80-c92d15f0d71a	\N	00040000-5604-f5e6-2520-3fc8cc7cf6d6	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2987 (class 0 OID 20581646)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 20581774)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 20582152)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 20582162)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5604-f5e9-298c-5d1a982e1234	00080000-5604-f5e8-cb53-11ef915d7785	0987	AK
00190000-5604-f5e9-60d7-7a827ca882b4	00080000-5604-f5e8-0d80-c92d15f0d71a	0989	AK
00190000-5604-f5e9-1bf1-24e95268e851	00080000-5604-f5e8-80fd-fc8020c668ac	0986	AK
00190000-5604-f5e9-3d55-3f008ea3647c	00080000-5604-f5e8-3128-26128d26f689	0984	AK
00190000-5604-f5e9-9fea-793fa6975a51	00080000-5604-f5e8-4597-c77a0c353641	0983	AK
00190000-5604-f5e9-60b9-de6ede638e6d	00080000-5604-f5e8-c47b-7f2c52820061	0982	AK
00190000-5604-f5ea-f334-5f9c2150062e	00080000-5604-f5ea-d609-eecb5936342d	1001	AK
\.


--
-- TOC entry 3024 (class 0 OID 20582095)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5604-f5e9-e522-3566e72de0d1	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3028 (class 0 OID 20582170)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 20581803)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5604-f5e8-447b-a97c49c851fa	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5604-f5e8-d1d8-e03af4bd253f	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5604-f5e8-7b58-13e6344451b1	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5604-f5e8-ef50-0b30dbef2147	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5604-f5e8-4017-dc388531b256	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-5604-f5e8-ec2a-bd2e9ce6b723	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5604-f5e8-3422-8935ce7c69a4	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2996 (class 0 OID 20581747)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 20581737)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 20581947)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 20581877)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 20581620)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 20581415)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5604-f5ea-d609-eecb5936342d	00010000-5604-f5e7-9729-c743a5a8f500	2015-09-25 09:21:14	INS	a:0:{}
2	App\\Entity\\Option	00000000-5604-f5ea-da08-a9fa0fee9246	00010000-5604-f5e7-9729-c743a5a8f500	2015-09-25 09:21:14	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5604-f5ea-f334-5f9c2150062e	00010000-5604-f5e7-9729-c743a5a8f500	2015-09-25 09:21:14	INS	a:0:{}
\.


--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3005 (class 0 OID 20581816)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 20581453)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5604-f5e7-7d93-500c69631fda	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5604-f5e7-74da-62af012ec928	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5604-f5e7-471d-ccc98be1f35b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5604-f5e7-eb80-8a57ff62c3ba	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5604-f5e7-85f6-c1dc20aac310	planer	Planer dogodkov v koledarju	t
00020000-5604-f5e7-ffb3-dd4534e9b35a	kadrovska	Kadrovska služba	t
00020000-5604-f5e7-6d9e-813861da59fe	arhivar	Ažuriranje arhivalij	t
00020000-5604-f5e7-ee39-ad6712e0eb3d	igralec	Igralec	t
00020000-5604-f5e7-a3ad-c2453b1dcedd	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5604-f5e9-a624-9d16280526b7	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2970 (class 0 OID 20581437)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5604-f5e7-54e3-be62c584799f	00020000-5604-f5e7-471d-ccc98be1f35b
00010000-5604-f5e7-9729-c743a5a8f500	00020000-5604-f5e7-471d-ccc98be1f35b
00010000-5604-f5e9-2aa2-db13667ece3d	00020000-5604-f5e9-a624-9d16280526b7
\.


--
-- TOC entry 3007 (class 0 OID 20581830)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 20581768)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 20581714)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 20581402)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5604-f5e6-50aa-2f7768ed08a7	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5604-f5e6-cea3-ea912d5f24f5	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5604-f5e6-df45-504257cab762	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5604-f5e6-dfb4-bf2943539b5c	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5604-f5e6-d8bf-86fba6f601e3	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2965 (class 0 OID 20581394)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5604-f5e6-0226-91736494075d	00230000-5604-f5e6-dfb4-bf2943539b5c	popa
00240000-5604-f5e6-3cc8-9749c9475315	00230000-5604-f5e6-dfb4-bf2943539b5c	oseba
00240000-5604-f5e6-3485-d44891415c42	00230000-5604-f5e6-dfb4-bf2943539b5c	sezona
00240000-5604-f5e6-95b3-b010a1bbcb5e	00230000-5604-f5e6-cea3-ea912d5f24f5	prostor
00240000-5604-f5e6-3def-27df57881eaa	00230000-5604-f5e6-dfb4-bf2943539b5c	besedilo
00240000-5604-f5e6-dc38-99976db9d919	00230000-5604-f5e6-dfb4-bf2943539b5c	uprizoritev
00240000-5604-f5e6-77db-aa03ffa05033	00230000-5604-f5e6-dfb4-bf2943539b5c	funkcija
00240000-5604-f5e6-736b-0a7046d36ac0	00230000-5604-f5e6-dfb4-bf2943539b5c	tipfunkcije
00240000-5604-f5e6-a4a8-ba0f6cf5355e	00230000-5604-f5e6-dfb4-bf2943539b5c	alternacija
00240000-5604-f5e6-dfc9-019f9a3f3abe	00230000-5604-f5e6-50aa-2f7768ed08a7	pogodba
00240000-5604-f5e6-ccfc-cd1245161a04	00230000-5604-f5e6-dfb4-bf2943539b5c	zaposlitev
00240000-5604-f5e6-5b09-3b1c628e41b0	00230000-5604-f5e6-dfb4-bf2943539b5c	zvrstuprizoritve
00240000-5604-f5e6-c9c7-0cfdb2520bb0	00230000-5604-f5e6-50aa-2f7768ed08a7	programdela
00240000-5604-f5e6-e308-38521315d976	00230000-5604-f5e6-dfb4-bf2943539b5c	zapis
\.


--
-- TOC entry 2964 (class 0 OID 20581389)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
530ef87c-1df3-469f-949f-3abff6c44384	00240000-5604-f5e6-0226-91736494075d	0	1001
\.


--
-- TOC entry 3013 (class 0 OID 20581894)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5604-f5e9-9a9c-bb09274ac705	000e0000-5604-f5e9-dedf-54501ff596f9	00080000-5604-f5e8-3709-2361e00d6dfb	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5604-f5e6-b9ae-ed1f124636e5
00270000-5604-f5e9-6de2-77244480a175	000e0000-5604-f5e9-dedf-54501ff596f9	00080000-5604-f5e8-3709-2361e00d6dfb	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5604-f5e6-b9ae-ed1f124636e5
\.


--
-- TOC entry 2977 (class 0 OID 20581515)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 20581724)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5604-f5e9-17fd-03eee1ed81be	00180000-5604-f5e9-017d-851ab1f33040	000c0000-5604-f5e9-560d-e02538a60a03	00090000-5604-f5e9-b744-9022124b89c5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5604-f5e9-8a1d-12e424d4a087	00180000-5604-f5e9-017d-851ab1f33040	000c0000-5604-f5e9-7d8f-d9845429cdea	00090000-5604-f5e9-28bc-9a6d454cc98e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5604-f5e9-a5d1-36a7fe88f800	00180000-5604-f5e9-017d-851ab1f33040	000c0000-5604-f5e9-77ea-58f0f5c3d84d	00090000-5604-f5e9-c3d7-fa12fd84fd0f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5604-f5e9-7695-b57ca20540d7	00180000-5604-f5e9-017d-851ab1f33040	000c0000-5604-f5e9-7eb3-d093a480bae5	00090000-5604-f5e9-e791-b55831341c01	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5604-f5e9-d26b-bdd21b224292	00180000-5604-f5e9-017d-851ab1f33040	000c0000-5604-f5e9-c7d9-9ff25895344c	00090000-5604-f5e9-4cb0-170374382557	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5604-f5e9-3391-8815e372dbb9	00180000-5604-f5e9-c57f-56d08371f969	\N	00090000-5604-f5e9-4cb0-170374382557	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3016 (class 0 OID 20581935)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-5604-f5e6-73ed-9cfcc0cd80ed	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-5604-f5e6-d74f-8f29f4df9a2f	02	Priredba	Priredba	Priredba	umetnik
000f0000-5604-f5e6-47e0-8346eec57ed1	03	Prevod	Prevod	Prevod	umetnik
000f0000-5604-f5e6-cfeb-7f1054cf875d	04	Režija	Režija	Režija	umetnik
000f0000-5604-f5e6-782c-a68263b8c9da	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-5604-f5e6-d7a9-b118fcac1f67	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-5604-f5e6-0d87-a99aee68290c	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-5604-f5e6-acea-0dde9cd8a294	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-5604-f5e6-bca4-246e99e1d9dc	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-5604-f5e6-9491-d0317081bdc7	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-5604-f5e6-1e78-8e2a97e16a57	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-5604-f5e6-7049-d63e9ba05333	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-5604-f5e6-3e18-268eb9f2ab28	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-5604-f5e6-a522-558a06c8325f	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-5604-f5e6-f94c-3979e3585fba	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-5604-f5e6-212b-a1c8461cfa52	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-5604-f5e6-2eb5-81f7fe9a8452	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-5604-f5e6-c632-68173a8b8e8f	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3029 (class 0 OID 20582180)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5604-f5e6-4dbe-bf2f5e29614e	01	Velika predstava	f	1.00	1.00
002b0000-5604-f5e6-de72-7bd73e239e07	02	Mala predstava	f	0.50	0.50
002b0000-5604-f5e6-da55-977911322268	03	Mala koprodukcija	t	0.40	1.00
002b0000-5604-f5e6-f011-6a82a48110d8	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5604-f5e6-6c9d-ce5f59777a97	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2982 (class 0 OID 20581577)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 20581424)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5604-f5e7-9729-c743a5a8f500	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROSrsKQdpn8GhjVp3QvgW8gsOlq.R1OAi	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5604-f5e9-0829-bb416ceac4bb	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5604-f5e9-a15f-7728edea6445	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5604-f5e9-1a42-042708248944	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5604-f5e9-fad3-3c620f41c23e	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5604-f5e9-c86b-c65eb3f156e5	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5604-f5e9-2ccf-45ea325cfbc0	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5604-f5e9-7054-b3bbee6dfccc	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5604-f5e9-3023-e53ce9c0e072	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5604-f5e9-de3b-4f3fa244cc28	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5604-f5e9-2aa2-db13667ece3d	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5604-f5e7-54e3-be62c584799f	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3020 (class 0 OID 20581985)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5604-f5e9-1cd4-3798857180dc	00160000-5604-f5e8-9128-e965ecb94b9e	\N	00140000-5604-f5e6-849f-bd3952e3b643	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		\N	00220000-5604-f5e8-4017-dc388531b256
000e0000-5604-f5e9-dedf-54501ff596f9	00160000-5604-f5e8-356e-20643f07e995	\N	00140000-5604-f5e6-ae9e-8f02b5ccd8a4	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		\N	00220000-5604-f5e8-ec2a-bd2e9ce6b723
000e0000-5604-f5e9-e92b-cbb8ee2602d5	\N	\N	00140000-5604-f5e6-ae9e-8f02b5ccd8a4	00190000-5604-f5e9-298c-5d1a982e1234	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5604-f5e8-4017-dc388531b256
000e0000-5604-f5e9-fd00-653c0aef3d96	\N	\N	00140000-5604-f5e6-ae9e-8f02b5ccd8a4	00190000-5604-f5e9-298c-5d1a982e1234	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5604-f5e8-4017-dc388531b256
000e0000-5604-f5e9-5483-5959342323bf	\N	\N	00140000-5604-f5e6-ae9e-8f02b5ccd8a4	00190000-5604-f5e9-298c-5d1a982e1234	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5604-f5e8-447b-a97c49c851fa
000e0000-5604-f5e9-d611-73420eda4972	\N	\N	00140000-5604-f5e6-ae9e-8f02b5ccd8a4	00190000-5604-f5e9-298c-5d1a982e1234	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5604-f5e8-447b-a97c49c851fa
\.


--
-- TOC entry 2989 (class 0 OID 20581667)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5604-f5e9-4740-7cf47666e4e3	000e0000-5604-f5e9-dedf-54501ff596f9	\N	1	
00200000-5604-f5e9-8024-96799844718d	000e0000-5604-f5e9-dedf-54501ff596f9	\N	2	
00200000-5604-f5e9-9d7f-4e42200900e8	000e0000-5604-f5e9-dedf-54501ff596f9	\N	3	
00200000-5604-f5e9-d865-31df3b25ffa3	000e0000-5604-f5e9-dedf-54501ff596f9	\N	4	
00200000-5604-f5e9-1d00-bb22f9974c81	000e0000-5604-f5e9-dedf-54501ff596f9	\N	5	
\.


--
-- TOC entry 3003 (class 0 OID 20581795)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 20581908)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5604-f5e6-5f24-be352a5aac7c	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5604-f5e6-c868-6b3e5dbe60ae	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5604-f5e6-5fea-c7f3214b0469	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5604-f5e6-36eb-cb8e770bc1ec	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5604-f5e6-99e3-2dd6a0df4bb4	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5604-f5e6-3ad9-68b2ba34b029	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5604-f5e6-4053-7f877cf28eee	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5604-f5e6-f9a7-eb85ee9f57ba	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5604-f5e6-b9ae-ed1f124636e5	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5604-f5e6-650d-a91cc0e6dade	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5604-f5e6-2c43-e5b428918ed1	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5604-f5e6-5209-7841a255fa06	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5604-f5e6-8c47-ce498524ca14	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5604-f5e6-0f88-5c643158cdd0	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5604-f5e6-e325-4046d896c730	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5604-f5e6-df3b-a56f757c877e	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5604-f5e6-1a36-07cf17fffcdb	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5604-f5e6-6fef-218903235016	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5604-f5e6-d83d-bc0c45067000	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5604-f5e6-f2b2-fed63cdd7f9c	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5604-f5e6-fbec-cccfb175f7cf	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5604-f5e6-e011-11a19391a6b1	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5604-f5e6-acae-57f42c0e5b62	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5604-f5e6-9bb0-df1bae58c4ef	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5604-f5e6-e8be-b53d345fab62	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5604-f5e6-2dec-3b7fc4af1f35	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5604-f5e6-a1ae-2ca0e4c8de00	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5604-f5e6-9e1d-707401e31190	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3032 (class 0 OID 20582227)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 20582199)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 20582239)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 20581867)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5604-f5e9-7a49-205ebfa2bc36	00090000-5604-f5e9-28bc-9a6d454cc98e	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5604-f5e9-2570-2a74986838a8	00090000-5604-f5e9-c3d7-fa12fd84fd0f	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5604-f5e9-22c6-0fca935dd7ee	00090000-5604-f5e9-0ff6-955c3f997c98	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5604-f5e9-0832-c404cd28fad0	00090000-5604-f5e9-fb9c-426812e40be9	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5604-f5e9-5fce-c36435320961	00090000-5604-f5e9-b744-9022124b89c5	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5604-f5e9-0a7b-294b2438369c	00090000-5604-f5e9-6fab-0136909c2877	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2991 (class 0 OID 20581703)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 20581975)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5604-f5e6-849f-bd3952e3b643	01	Drama	drama (SURS 01)
00140000-5604-f5e6-6545-252c99598abd	02	Opera	opera (SURS 02)
00140000-5604-f5e6-d6e0-4580e207e01f	03	Balet	balet (SURS 03)
00140000-5604-f5e6-5921-868dcdabd6b2	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5604-f5e6-0c4a-ec5d4a5406a3	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5604-f5e6-ae9e-8f02b5ccd8a4	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5604-f5e6-0364-7523e92bc452	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3009 (class 0 OID 20581857)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2496 (class 2606 OID 20581478)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 20582034)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 20582024)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 20581891)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 20581933)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 20582279)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 20581692)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 20581713)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 20582197)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 20581603)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 20582089)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 20581853)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 20581665)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 20581641)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 20581617)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 20581760)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 20582256)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 20582263)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2750 (class 2606 OID 20582287)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 20579803)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2608 (class 2606 OID 20581787)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 20581575)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 20581487)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 20581511)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 20581467)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2487 (class 2606 OID 20581452)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 20581793)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 20581829)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 20581970)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 20581539)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 20581563)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 20582150)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 20581766)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 20581553)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 20581653)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 20581778)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 20582159)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 20582167)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 20582137)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 20582178)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 20581811)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 20581751)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 20581742)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 20581957)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 20581884)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 20581629)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 20581423)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 20581820)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 20581441)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2489 (class 2606 OID 20581461)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 20581838)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 20581773)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 20581722)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 20581411)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 20581399)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 20581393)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 20581904)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 20581520)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 20581733)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 20581944)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 20582190)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 20581588)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 20581436)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 20582003)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 20581675)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 20581801)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 20581916)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 20582237)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 20582221)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 20582245)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 20581875)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 20581707)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 20581983)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 20581865)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 1259 OID 20581701)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2561 (class 1259 OID 20581702)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2562 (class 1259 OID 20581700)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2563 (class 1259 OID 20581699)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2564 (class 1259 OID 20581698)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2650 (class 1259 OID 20581905)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2651 (class 1259 OID 20581906)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2652 (class 1259 OID 20581907)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2736 (class 1259 OID 20582258)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2737 (class 1259 OID 20582257)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2510 (class 1259 OID 20581541)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2609 (class 1259 OID 20581794)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2723 (class 1259 OID 20582225)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2724 (class 1259 OID 20582224)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2725 (class 1259 OID 20582226)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2726 (class 1259 OID 20582223)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2727 (class 1259 OID 20582222)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2603 (class 1259 OID 20581780)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2604 (class 1259 OID 20581779)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2555 (class 1259 OID 20581676)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2633 (class 1259 OID 20581854)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2634 (class 1259 OID 20581856)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2635 (class 1259 OID 20581855)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2535 (class 1259 OID 20581619)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2536 (class 1259 OID 20581618)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2714 (class 1259 OID 20582179)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2666 (class 1259 OID 20581972)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2667 (class 1259 OID 20581973)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2668 (class 1259 OID 20581974)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2733 (class 1259 OID 20582246)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2675 (class 1259 OID 20582008)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2676 (class 1259 OID 20582005)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2677 (class 1259 OID 20582009)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2678 (class 1259 OID 20582007)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2679 (class 1259 OID 20582006)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2525 (class 1259 OID 20581590)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 20581589)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2501 (class 1259 OID 20581514)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2621 (class 1259 OID 20581821)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2491 (class 1259 OID 20581468)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2492 (class 1259 OID 20581469)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2626 (class 1259 OID 20581841)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2627 (class 1259 OID 20581840)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2628 (class 1259 OID 20581839)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2548 (class 1259 OID 20581654)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2549 (class 1259 OID 20581655)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2471 (class 1259 OID 20581401)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2583 (class 1259 OID 20581746)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2584 (class 1259 OID 20581744)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2585 (class 1259 OID 20581743)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2586 (class 1259 OID 20581745)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2482 (class 1259 OID 20581442)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2483 (class 1259 OID 20581443)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2612 (class 1259 OID 20581802)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2746 (class 1259 OID 20582280)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2648 (class 1259 OID 20581893)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2649 (class 1259 OID 20581892)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2747 (class 1259 OID 20582288)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2748 (class 1259 OID 20582289)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2598 (class 1259 OID 20581767)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2642 (class 1259 OID 20581885)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2643 (class 1259 OID 20581886)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2696 (class 1259 OID 20582094)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2697 (class 1259 OID 20582093)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2698 (class 1259 OID 20582090)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2699 (class 1259 OID 20582091)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2700 (class 1259 OID 20582092)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2514 (class 1259 OID 20581555)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2515 (class 1259 OID 20581554)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2516 (class 1259 OID 20581556)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2615 (class 1259 OID 20581815)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2616 (class 1259 OID 20581814)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2706 (class 1259 OID 20582160)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2707 (class 1259 OID 20582161)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2689 (class 1259 OID 20582038)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2690 (class 1259 OID 20582039)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2691 (class 1259 OID 20582036)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2692 (class 1259 OID 20582037)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2639 (class 1259 OID 20581876)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 20581755)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2590 (class 1259 OID 20581754)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2591 (class 1259 OID 20581752)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2592 (class 1259 OID 20581753)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2685 (class 1259 OID 20582026)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2686 (class 1259 OID 20582025)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2539 (class 1259 OID 20581630)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2542 (class 1259 OID 20581644)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2543 (class 1259 OID 20581643)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2544 (class 1259 OID 20581642)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2545 (class 1259 OID 20581645)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2554 (class 1259 OID 20581666)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2703 (class 1259 OID 20582151)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2722 (class 1259 OID 20582198)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2740 (class 1259 OID 20582264)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2741 (class 1259 OID 20582265)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2497 (class 1259 OID 20581489)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2498 (class 1259 OID 20581488)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2506 (class 1259 OID 20581521)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2507 (class 1259 OID 20581522)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2570 (class 1259 OID 20581708)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2578 (class 1259 OID 20581736)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2579 (class 1259 OID 20581735)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2580 (class 1259 OID 20581734)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2565 (class 1259 OID 20581694)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2566 (class 1259 OID 20581695)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2567 (class 1259 OID 20581693)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2568 (class 1259 OID 20581697)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2569 (class 1259 OID 20581696)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2513 (class 1259 OID 20581540)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2531 (class 1259 OID 20581604)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2532 (class 1259 OID 20581606)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2533 (class 1259 OID 20581605)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2534 (class 1259 OID 20581607)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2597 (class 1259 OID 20581761)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2671 (class 1259 OID 20581971)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2680 (class 1259 OID 20582004)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2662 (class 1259 OID 20581945)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2663 (class 1259 OID 20581946)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2504 (class 1259 OID 20581512)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2505 (class 1259 OID 20581513)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2636 (class 1259 OID 20581866)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 20581412)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2524 (class 1259 OID 20581576)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2474 (class 1259 OID 20581400)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2719 (class 1259 OID 20582191)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2619 (class 1259 OID 20581813)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2620 (class 1259 OID 20581812)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 20582035)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2521 (class 1259 OID 20581564)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2672 (class 1259 OID 20581984)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2730 (class 1259 OID 20582238)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2712 (class 1259 OID 20582168)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2713 (class 1259 OID 20582169)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2659 (class 1259 OID 20581934)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2577 (class 1259 OID 20581723)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2490 (class 1259 OID 20581462)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2781 (class 2606 OID 20582420)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2780 (class 2606 OID 20582425)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2776 (class 2606 OID 20582445)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2782 (class 2606 OID 20582415)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2778 (class 2606 OID 20582435)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2777 (class 2606 OID 20582440)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2779 (class 2606 OID 20582430)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2817 (class 2606 OID 20582610)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2816 (class 2606 OID 20582615)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2815 (class 2606 OID 20582620)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2849 (class 2606 OID 20582785)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2850 (class 2606 OID 20582780)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2762 (class 2606 OID 20582345)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2799 (class 2606 OID 20582530)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2844 (class 2606 OID 20582765)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2845 (class 2606 OID 20582760)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2843 (class 2606 OID 20582770)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2846 (class 2606 OID 20582755)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2847 (class 2606 OID 20582750)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2797 (class 2606 OID 20582525)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2798 (class 2606 OID 20582520)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2775 (class 2606 OID 20582410)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2809 (class 2606 OID 20582570)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2807 (class 2606 OID 20582580)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2808 (class 2606 OID 20582575)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2768 (class 2606 OID 20582380)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2769 (class 2606 OID 20582375)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2795 (class 2606 OID 20582510)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2841 (class 2606 OID 20582740)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2820 (class 2606 OID 20582625)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2819 (class 2606 OID 20582630)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2818 (class 2606 OID 20582635)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2848 (class 2606 OID 20582775)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2822 (class 2606 OID 20582655)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2825 (class 2606 OID 20582640)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2821 (class 2606 OID 20582660)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2823 (class 2606 OID 20582650)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2824 (class 2606 OID 20582645)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2766 (class 2606 OID 20582370)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2767 (class 2606 OID 20582365)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 20582330)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2759 (class 2606 OID 20582325)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2803 (class 2606 OID 20582550)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2755 (class 2606 OID 20582305)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2754 (class 2606 OID 20582310)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2804 (class 2606 OID 20582565)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2805 (class 2606 OID 20582560)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2806 (class 2606 OID 20582555)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2773 (class 2606 OID 20582395)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2772 (class 2606 OID 20582400)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2751 (class 2606 OID 20582290)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2787 (class 2606 OID 20582485)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2789 (class 2606 OID 20582475)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2790 (class 2606 OID 20582470)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2788 (class 2606 OID 20582480)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2753 (class 2606 OID 20582295)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2752 (class 2606 OID 20582300)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2800 (class 2606 OID 20582535)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2853 (class 2606 OID 20582800)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2813 (class 2606 OID 20582605)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2814 (class 2606 OID 20582600)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2855 (class 2606 OID 20582805)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2854 (class 2606 OID 20582810)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2796 (class 2606 OID 20582515)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2812 (class 2606 OID 20582590)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2811 (class 2606 OID 20582595)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2832 (class 2606 OID 20582715)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2833 (class 2606 OID 20582710)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2836 (class 2606 OID 20582695)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2835 (class 2606 OID 20582700)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2834 (class 2606 OID 20582705)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2764 (class 2606 OID 20582355)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 20582350)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2763 (class 2606 OID 20582360)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2801 (class 2606 OID 20582545)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2802 (class 2606 OID 20582540)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 20582725)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2838 (class 2606 OID 20582730)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2829 (class 2606 OID 20582685)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2828 (class 2606 OID 20582690)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2831 (class 2606 OID 20582675)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2830 (class 2606 OID 20582680)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2810 (class 2606 OID 20582585)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2791 (class 2606 OID 20582505)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2792 (class 2606 OID 20582500)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2794 (class 2606 OID 20582490)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2793 (class 2606 OID 20582495)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2826 (class 2606 OID 20582670)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2827 (class 2606 OID 20582665)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2770 (class 2606 OID 20582385)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2771 (class 2606 OID 20582390)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2774 (class 2606 OID 20582405)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2837 (class 2606 OID 20582720)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2840 (class 2606 OID 20582735)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 20582745)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2852 (class 2606 OID 20582790)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2851 (class 2606 OID 20582795)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2756 (class 2606 OID 20582320)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2757 (class 2606 OID 20582315)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2761 (class 2606 OID 20582335)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2760 (class 2606 OID 20582340)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2783 (class 2606 OID 20582450)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2784 (class 2606 OID 20582465)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2785 (class 2606 OID 20582460)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2786 (class 2606 OID 20582455)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-25 09:21:16 CEST

--
-- PostgreSQL database dump complete
--

