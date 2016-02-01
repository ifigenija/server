--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-02-01 17:54:23 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 257 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 257
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 42507413)
-- Name: abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE abonma (
    id uuid NOT NULL,
    stpredstav integer,
    stkuponov integer,
    ime character varying(40) DEFAULT NULL::character varying,
    opis text,
    barva character varying(7) DEFAULT NULL::character varying,
    kapaciteta integer
);


--
-- TOC entry 241 (class 1259 OID 42508032)
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
    imapogodbo boolean,
    pomembna boolean
);


--
-- TOC entry 240 (class 1259 OID 42508016)
-- Name: arhivalija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE arhivalija (
    id uuid NOT NULL,
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
-- TOC entry 184 (class 1259 OID 42507406)
-- Name: authstorage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE authstorage (
    id integer NOT NULL,
    sessionid character varying(100) NOT NULL,
    upor uuid NOT NULL,
    datum timestamp(0) without time zone NOT NULL,
    ip character varying(255) NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


--
-- TOC entry 183 (class 1259 OID 42507404)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 42507893)
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
-- TOC entry 234 (class 1259 OID 42507923)
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
-- TOC entry 255 (class 1259 OID 42508335)
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
-- TOC entry 212 (class 1259 OID 42507729)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 42507653)
-- Name: dogodek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodek (
    id uuid NOT NULL,
    predstava_id uuid,
    vaja_id uuid,
    gostovanje_id uuid,
    dogodek_splosni_id uuid,
    tehnicni_id uuid,
    prostor_id uuid,
    sezona_id uuid,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(4) DEFAULT NULL::character varying,
    razred character varying(4) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying,
    barva character varying(7) DEFAULT NULL::character varying,
    nadrejenogostovanje_id uuid
);


--
-- TOC entry 206 (class 1259 OID 42507680)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 42507685)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 42508257)
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
-- TOC entry 196 (class 1259 OID 42507559)
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
-- TOC entry 242 (class 1259 OID 42508045)
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
    sthonorarnihzun integer DEFAULT 0,
    sthonorarnihzunigr integer DEFAULT 0,
    sthonorarnihzunigrtujjz integer DEFAULT 0,
    sthonorarnihzunsamoz integer DEFAULT 0,
    obiskdoma integer DEFAULT 0 NOT NULL,
    obiskkopr integer DEFAULT 0 NOT NULL,
    obiskgost integer DEFAULT 0 NOT NULL,
    obiskkoprgost integer DEFAULT 0 NOT NULL,
    obiskzamejo integer DEFAULT 0 NOT NULL,
    obiskkoprzamejo integer DEFAULT 0 NOT NULL,
    obiskint integer DEFAULT 0 NOT NULL,
    obiskkoprint integer DEFAULT 0 NOT NULL,
    ponovidoma integer DEFAULT 0 NOT NULL,
    ponovikopr integer DEFAULT 0 NOT NULL,
    ponovizamejo numeric(15,2) DEFAULT 0::numeric NOT NULL,
    ponovikoprzamejo numeric(15,2) DEFAULT 0::numeric NOT NULL,
    ponovigost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    ponovikoprgost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    ponovikoprint integer DEFAULT 0 NOT NULL,
    ponoviint integer DEFAULT 0 NOT NULL,
    naziv character varying(50) DEFAULT NULL::character varying,
    kpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    sort integer,
    tipprogramskeenote_id uuid,
    tip character varying(20) NOT NULL,
    prikoproducentu boolean,
    prizorisce character varying(255) DEFAULT NULL::character varying,
    trajanje character varying(255) DEFAULT NULL::character varying,
    zvrst character varying(255) DEFAULT NULL::character varying,
    avtor character varying(255) DEFAULT NULL::character varying,
    reziser character varying(255) DEFAULT NULL::character varying,
    datum date,
    soustvarjalci character varying(255) DEFAULT NULL::character varying,
    strosekodkpred numeric(15,2) DEFAULT 0::numeric,
    stroskiostali numeric(15,2) DEFAULT 0::numeric,
    krajgostovanja character varying(255) DEFAULT NULL::character varying,
    ustanova character varying(255) DEFAULT NULL::character varying,
    datumgostovanja date,
    transportnistroski numeric(15,2) DEFAULT NULL::numeric,
    dnevprvzad numeric(15,2) DEFAULT NULL::numeric,
    drzavagostovanja_id uuid,
    stpe integer DEFAULT 0,
    stdogodkov integer DEFAULT 0,
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
-- TOC entry 227 (class 1259 OID 42507851)
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
-- TOC entry 202 (class 1259 OID 42507627)
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
-- TOC entry 199 (class 1259 OID 42507599)
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
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 197 (class 1259 OID 42507576)
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
-- TOC entry 216 (class 1259 OID 42507765)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 42508315)
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
    javnidostop character varying(20) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 254 (class 1259 OID 42508328)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 42508350)
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
-- TOC entry 170 (class 1259 OID 34548309)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 42507789)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 42507533)
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
-- TOC entry 187 (class 1259 OID 42507433)
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
-- TOC entry 191 (class 1259 OID 42507500)
-- Name: organizacijskaenota; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE organizacijskaenota (
    id uuid NOT NULL,
    parent_id uuid,
    vodja_id uuid,
    namestnik_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(50) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 42507444)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
    naslov_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(40) DEFAULT NULL::character varying,
    ime character varying(255) DEFAULT NULL::character varying,
    priimek character varying(255) DEFAULT NULL::character varying,
    funkcija character varying(40) DEFAULT NULL::character varying,
    srednjeime character varying(255) DEFAULT NULL::character varying,
    polnoime character varying(255) DEFAULT NULL::character varying,
    psevdonim character varying(255) DEFAULT NULL::character varying,
    email character varying(255) DEFAULT NULL::character varying,
    twitter character varying(255) DEFAULT NULL::character varying,
    skype character varying(255) DEFAULT NULL::character varying,
    fb character varying(255) DEFAULT NULL::character varying,
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
-- TOC entry 180 (class 1259 OID 42507378)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 42507397)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 42507796)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 42507831)
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
-- TOC entry 237 (class 1259 OID 42507964)
-- Name: pogodba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pogodba (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    trr_id uuid,
    sifra character varying(255) NOT NULL,
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
-- TOC entry 190 (class 1259 OID 42507480)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    tipkli_id uuid,
    drzava_id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
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
-- TOC entry 193 (class 1259 OID 42507525)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 42508201)
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
-- TOC entry 217 (class 1259 OID 42507771)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 42507510)
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
-- TOC entry 204 (class 1259 OID 42507645)
-- Name: praznik; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE praznik (
    id uuid NOT NULL,
    ime character varying(255) NOT NULL,
    dan character varying(255) NOT NULL,
    mesec integer NOT NULL,
    leto integer,
    delaprost boolean NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 42507614)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporednasezvsehupr integer,
    zaporedna integer,
    zaporednasez integer
);


--
-- TOC entry 201 (class 1259 OID 42507620)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 171 (class 1259 OID 36291776)
-- Name: prisotnost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prisotnost (
    id uuid NOT NULL,
    oseba_id uuid,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    terminstoritve_id uuid
);


--
-- TOC entry 219 (class 1259 OID 42507783)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 42508215)
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
-- TOC entry 246 (class 1259 OID 42508225)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 42508114)
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
    stpremiervelikih integer DEFAULT 0,
    stpremiermalih integer DEFAULT 0,
    stpremiermalihkopr integer DEFAULT 0,
    stpremiervelikihkopr integer DEFAULT 0,
    stpremiersredkopr integer DEFAULT 0,
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
    stizvnekomerc numeric(15,2) DEFAULT 0::numeric,
    stizvprem integer,
    stizvpremdoma integer,
    stizvpremkopr integer,
    stizvponprem numeric(15,2) DEFAULT 0::numeric,
    stizvponpremdoma integer,
    stizvponpremzamejo numeric(15,2) DEFAULT 0::numeric,
    stizvponpremkoprzamejo numeric(15,2) DEFAULT 0::numeric,
    stizvponpremgost numeric(15,2) DEFAULT 0::numeric,
    stizvponpremkoprgost numeric(15,2) DEFAULT 0::numeric,
    stizvponpremkopr integer,
    stizvponpremint integer,
    stizvponpremkoprint integer,
    stizvponprej numeric(15,2) DEFAULT 0::numeric,
    stizvponprejdoma integer,
    stizvponprejzamejo numeric(15,2) DEFAULT 0::numeric,
    stizvponprejkoprzamejo numeric(15,2) DEFAULT 0::numeric,
    stizvponprejgost numeric(15,2) DEFAULT 0::numeric,
    stizvponprejkoprgost numeric(15,2) DEFAULT 0::numeric,
    stizvponprejkopr integer,
    stizvponprejint integer,
    stizvponprejkoprint integer,
    stizvgostuj integer,
    stizvostalihnek numeric(15,2) DEFAULT 0::numeric,
    stizvgostovanjslo numeric(15,2) DEFAULT 0::numeric,
    stizvgostovanjzam numeric(15,2) DEFAULT 0::numeric,
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
    stobiskponprejkopr integer DEFAULT 0,
    stobiskponprejkoprint integer DEFAULT 0,
    stobiskponpremkopr integer,
    stobiskponpremkoprint integer,
    stobiskponpremgost integer,
    stobiskponpremgostkopr integer DEFAULT 0,
    stobiskponprejgostkopr integer DEFAULT 0,
    stobiskponpremzamejo integer,
    stobiskponpremzamejokopr integer DEFAULT 0,
    stobiskponprejzamejokopr integer DEFAULT 0,
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
    sthonorarnihzun integer DEFAULT 0,
    sthonorarnihzunigr integer DEFAULT 0,
    sthonorarnihzunigrtujjz integer,
    sthonorarnihzunsamoz integer DEFAULT 0,
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
    sredstvavlozekgostiteljaprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvavlozekgostiteljaponprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvavlozekgostiteljaponprej numeric(12,2) DEFAULT NULL::numeric,
    sredstvavlozekgostiteljagostujo numeric(12,2) DEFAULT NULL::numeric,
    sredstvavlozekgostiteljaint numeric(12,2) DEFAULT NULL::numeric,
    sredstvavlozekgostiteljafest numeric(12,2) DEFAULT NULL::numeric,
    sredstvavlozekgostiteljarazno numeric(12,2) DEFAULT NULL::numeric,
    sredstvavlozekgostiteljaizjem numeric(12,2) DEFAULT NULL::numeric,
    sredstvalastnaprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvalastnaponprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvalastnaponprej numeric(12,2) DEFAULT NULL::numeric,
    sredstvalastnagostujo numeric(12,2) DEFAULT NULL::numeric,
    sredstvalastnaint numeric(12,2) DEFAULT NULL::numeric,
    sredstvalastnafest numeric(12,2) DEFAULT NULL::numeric,
    sredstvalastnarazno numeric(12,2) DEFAULT NULL::numeric,
    sredstvalastnaizjem numeric(12,2) DEFAULT NULL::numeric,
    sredstvaavtsamoz numeric(12,2) DEFAULT NULL::numeric
);


--
-- TOC entry 247 (class 1259 OID 42508233)
-- Name: programskaenotasklopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programskaenotasklopa (
    id uuid NOT NULL,
    naslovpe character varying(255) NOT NULL,
    avtorpe character varying(255) NOT NULL,
    obsegpe character varying(255) NOT NULL,
    mesecpe character varying(255) NOT NULL,
    vrednostpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    obiskdoma integer DEFAULT 0 NOT NULL,
    stdogodkov integer DEFAULT 1 NOT NULL,
    programrazno_id uuid
);


--
-- TOC entry 223 (class 1259 OID 42507811)
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
    opis text,
    barva character varying(7) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 42507756)
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
-- TOC entry 214 (class 1259 OID 42507746)
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
-- TOC entry 236 (class 1259 OID 42507953)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 42507883)
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
-- TOC entry 198 (class 1259 OID 42507588)
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
-- TOC entry 177 (class 1259 OID 42507349)
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
-- TOC entry 176 (class 1259 OID 42507347)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 42507825)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 42507387)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 42507371)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 42507839)
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
-- TOC entry 218 (class 1259 OID 42507777)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 42507700)
-- Name: sezona; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sezona (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    zacetek date,
    konec date
);


--
-- TOC entry 175 (class 1259 OID 42507336)
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
-- TOC entry 174 (class 1259 OID 42507328)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 42507323)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 42507900)
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
-- TOC entry 189 (class 1259 OID 42507472)
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
-- TOC entry 211 (class 1259 OID 42507719)
-- Name: terminstoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE terminstoritve (
    id uuid NOT NULL,
    dogodek_id uuid,
    alternacija_id uuid,
    oseba_id uuid NOT NULL,
    deltaplaniranzacetek integer,
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    deltaplanirankonec integer,
    planirankonec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    dezurni boolean,
    gost boolean,
    sodelujoc boolean,
    zasedenost boolean,
    virtzasedenost boolean
);


--
-- TOC entry 213 (class 1259 OID 42507736)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 42507941)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying,
    sort integer
);


--
-- TOC entry 186 (class 1259 OID 42507423)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 42508245)
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
-- TOC entry 208 (class 1259 OID 42507690)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 42507545)
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
-- TOC entry 178 (class 1259 OID 42507358)
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
-- TOC entry 239 (class 1259 OID 42507991)
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
-- TOC entry 210 (class 1259 OID 42507710)
-- Name: ura; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ura (
    id uuid NOT NULL,
    oseba_id uuid,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    terminstoritve_id uuid
);


--
-- TOC entry 203 (class 1259 OID 42507638)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 42507803)
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
-- TOC entry 233 (class 1259 OID 42507914)
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
-- TOC entry 251 (class 1259 OID 42508295)
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
-- TOC entry 250 (class 1259 OID 42508264)
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
    contributor character varying(255) DEFAULT NULL::character varying,
    type character varying(255) DEFAULT NULL::character varying,
    format character varying(255) DEFAULT NULL::character varying,
    relation character varying(255) DEFAULT NULL::character varying,
    rights character varying(255) DEFAULT NULL::character varying,
    source character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    standard character varying(255) DEFAULT NULL::character varying,
    lokacija character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 252 (class 1259 OID 42508307)
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
-- TOC entry 229 (class 1259 OID 42507876)
-- Name: zaposlitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zaposlitev (
    id uuid NOT NULL,
    oseba_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(10) NOT NULL,
    delovnomesto character varying(255) NOT NULL,
    zacetek date,
    konec date,
    delovnaobveza integer,
    izmenskodelo boolean,
    individualnapogodba boolean,
    jezaposlenvdrugemjz boolean,
    jenastopajoci boolean,
    organizacijskaenota_id uuid
);


--
-- TOC entry 172 (class 1259 OID 37017863)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 238 (class 1259 OID 42507981)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 42507866)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 42507409)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 42507352)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 42507413)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56af-8dbb-9220-303c9a74f5d9	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56af-8dbb-5edb-05fb61072e33	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56af-8dbb-562e-e032349a47bd	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 42508032)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56af-8dbc-b7ce-6c6aa252f049	000d0000-56af-8dbc-d031-ca4c717a6742	\N	00090000-56af-8dbb-a379-3c3f6c2edf4c	000b0000-56af-8dbb-b19d-a6e0a5c7be0a	0001	f	\N	\N	\N	3	t	t	t
000c0000-56af-8dbc-fce2-f647f2734025	000d0000-56af-8dbc-91df-3a2bd3c6af66	00100000-56af-8dbb-d5e1-d187a968f91a	00090000-56af-8dbb-b9a0-9f766ab4b055	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56af-8dbc-3b02-784de8fce6c8	000d0000-56af-8dbc-f5d6-a09d86290252	00100000-56af-8dbb-d389-bf88416ca7e6	00090000-56af-8dbb-cffd-251b25733074	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56af-8dbc-5b19-d17552ca60ec	000d0000-56af-8dbc-ad68-310654872c8f	\N	00090000-56af-8dbb-887b-b8b2d4b5f636	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56af-8dbc-ec0a-3d8527d825a1	000d0000-56af-8dbc-cb9f-e461a4e89490	\N	00090000-56af-8dbb-37d0-c21d076aa4c5	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56af-8dbc-7c48-543517e27c04	000d0000-56af-8dbc-df90-630bcf3ad86f	\N	00090000-56af-8dbb-27fc-0f2e4688677b	000b0000-56af-8dbb-8b06-78bc1db10220	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56af-8dbc-fe61-a22e93b7624e	000d0000-56af-8dbc-d409-c4cb115fe4d3	00100000-56af-8dbb-ddc1-2c4ac5dc01d3	00090000-56af-8dbb-8c51-662d96d8ee74	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56af-8dbc-481c-b2c648bb7456	000d0000-56af-8dbc-f197-ca5989373950	\N	00090000-56af-8dbb-f244-b061004b110f	000b0000-56af-8dbb-b33d-eb63cf8e6a5d	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56af-8dbc-2df6-f34059317ea8	000d0000-56af-8dbc-d409-c4cb115fe4d3	00100000-56af-8dbb-ecc4-b98d52bc254e	00090000-56af-8dbb-5b41-47e58401e73e	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56af-8dbc-ad00-f44bcee42592	000d0000-56af-8dbc-d409-c4cb115fe4d3	00100000-56af-8dbb-fdeb-7554a58d4ea6	00090000-56af-8dbb-68b2-0e627ed20b9d	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56af-8dbc-4e77-f3e12e52ed95	000d0000-56af-8dbc-d409-c4cb115fe4d3	00100000-56af-8dbb-5b8b-682a3cd3eb9f	00090000-56af-8dbb-7870-7fa4b5324ff7	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56af-8dbc-4d03-c3aead4bdcf6	000d0000-56af-8dbc-7908-f683786902f6	00100000-56af-8dbb-d5e1-d187a968f91a	00090000-56af-8dbb-b9a0-9f766ab4b055	000b0000-56af-8dbb-8d9b-579699dc525f	0012	t	\N	\N	\N	2	t	t	t
000c0000-56af-8dbc-d667-c5f2d20e0a40	000d0000-56af-8dbc-5a77-9e7ed9c2b362	\N	00090000-56af-8dbb-f244-b061004b110f	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56af-8dbc-7a16-7615243d1809	000d0000-56af-8dbc-5a77-9e7ed9c2b362	\N	00090000-56af-8dbb-e0b0-84fdf6324405	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56af-8dbc-e804-ec832945082b	000d0000-56af-8dbc-0e48-441e32b56238	00100000-56af-8dbb-d389-bf88416ca7e6	00090000-56af-8dbb-cffd-251b25733074	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56af-8dbc-ab17-416012385457	000d0000-56af-8dbc-0e48-441e32b56238	\N	00090000-56af-8dbb-e0b0-84fdf6324405	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56af-8dbc-17cf-424b0090bea2	000d0000-56af-8dbc-d509-843d848342d2	\N	00090000-56af-8dbb-e0b0-84fdf6324405	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56af-8dbc-3006-aad1464d9c3a	000d0000-56af-8dbc-d509-843d848342d2	\N	00090000-56af-8dbb-f244-b061004b110f	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56af-8dbc-0a95-df57e70f0a05	000d0000-56af-8dbc-e98f-804786d7f6f0	00100000-56af-8dbb-ddc1-2c4ac5dc01d3	00090000-56af-8dbb-8c51-662d96d8ee74	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56af-8dbc-9142-1cb3a035e572	000d0000-56af-8dbc-e98f-804786d7f6f0	\N	00090000-56af-8dbb-e0b0-84fdf6324405	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56af-8dbc-53ff-a8f4356312d0	000d0000-56af-8dbc-3c4e-8c6684d850bc	\N	00090000-56af-8dbb-e0b0-84fdf6324405	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56af-8dbc-2596-956ee2ddd579	000d0000-56af-8dbc-3c4e-8c6684d850bc	00100000-56af-8dbb-ddc1-2c4ac5dc01d3	00090000-56af-8dbb-8c51-662d96d8ee74	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56af-8dbc-7103-8f64ad48f919	000d0000-56af-8dbc-2afe-15f3d322e287	\N	00090000-56af-8dbb-e0b0-84fdf6324405	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56af-8dbc-4fd2-d78e41420051	000d0000-56af-8dbc-d4de-31155e0a3e9c	\N	00090000-56af-8dbb-f244-b061004b110f	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56af-8dbc-7016-595cafe48b4d	000d0000-56af-8dbc-d628-4e27b9f4ab5a	\N	00090000-56af-8dbb-f244-b061004b110f	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56af-8dbc-4ac7-ecf38ca122b6	000d0000-56af-8dbc-d628-4e27b9f4ab5a	00100000-56af-8dbb-d389-bf88416ca7e6	00090000-56af-8dbb-cffd-251b25733074	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56af-8dbc-bf41-b741e616d799	000d0000-56af-8dbc-96d5-50fd9d0d4524	\N	00090000-56af-8dbb-97a2-486721cd493a	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56af-8dbc-52de-516acf72422f	000d0000-56af-8dbc-96d5-50fd9d0d4524	\N	00090000-56af-8dbb-f66b-dbd4063dadad	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56af-8dbc-0086-03d7039684ed	000d0000-56af-8dbc-0c19-dfb0a2ab2228	\N	00090000-56af-8dbb-f244-b061004b110f	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56af-8dbc-5658-100db5f9a5d1	000d0000-56af-8dbc-0c19-dfb0a2ab2228	00100000-56af-8dbb-d389-bf88416ca7e6	00090000-56af-8dbb-cffd-251b25733074	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56af-8dbc-0178-7ac25beb1977	000d0000-56af-8dbc-0c19-dfb0a2ab2228	\N	00090000-56af-8dbb-f66b-dbd4063dadad	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56af-8dbc-91b7-5f9b111282ab	000d0000-56af-8dbc-0c19-dfb0a2ab2228	\N	00090000-56af-8dbb-97a2-486721cd493a	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56af-8dbc-e916-db7af037e00a	000d0000-56af-8dbc-3985-0804d5b371ae	\N	00090000-56af-8dbb-f244-b061004b110f	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56af-8dbc-3353-273c169721b9	000d0000-56af-8dbc-2104-404242086554	00100000-56af-8dbb-d389-bf88416ca7e6	00090000-56af-8dbb-cffd-251b25733074	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56af-8dbc-975c-26d46799efa0	000d0000-56af-8dbc-2104-404242086554	\N	00090000-56af-8dbb-e0b0-84fdf6324405	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 42508016)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 42507406)
-- Dependencies: 184
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3191 (class 0 OID 42507893)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56af-8dbb-a47b-531f7e67247d	00160000-56af-8dbb-d4bd-98b2fdca948a	00090000-56af-8dbb-f66b-dbd4063dadad	aizv	10	t
003d0000-56af-8dbb-600c-d0341c04528a	00160000-56af-8dbb-d4bd-98b2fdca948a	00090000-56af-8dbb-fc99-6c76a462723e	apri	14	t
003d0000-56af-8dbb-54f1-88b729183f1b	00160000-56af-8dbb-ebfb-274c92801b2b	00090000-56af-8dbb-97a2-486721cd493a	aizv	11	t
003d0000-56af-8dbb-b0fb-9edfc961a0ad	00160000-56af-8dbb-934f-de6304037bd5	00090000-56af-8dbb-371e-9e42df59e4d7	aizv	12	t
003d0000-56af-8dbb-a417-4db8a484804a	00160000-56af-8dbb-d4bd-98b2fdca948a	00090000-56af-8dbb-e0b0-84fdf6324405	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 42507923)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56af-8dbb-d4bd-98b2fdca948a	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56af-8dbb-ebfb-274c92801b2b	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56af-8dbb-934f-de6304037bd5	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 42508335)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 42507729)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 42507653)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva, nadrejenogostovanje_id) FROM stdin;
00180000-56af-8dbb-e9ea-dc1d7dfe6dc8	\N	\N	\N	\N	00440000-56af-8dbb-d759-c28f8bda94f6	00220000-56af-8dbb-655f-d103582e7fdd	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N	\N
00180000-56af-8dbb-5eef-3c90aaeb6318	\N	\N	\N	\N	00440000-56af-8dbb-179f-41f4b4761784	00220000-56af-8dbb-429a-a9fff92962bf	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N	\N
00180000-56af-8dbb-c417-a69137c61f32	\N	\N	\N	001e0000-56af-8dbb-1d4e-c0b0eb4e5b23	\N	00220000-56af-8dbb-655f-d103582e7fdd	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N	\N
00180000-56af-8dbb-e158-a4bfa9339a30	\N	\N	\N	001e0000-56af-8dbb-c52c-812f448a3ff0	\N	00220000-56af-8dbb-429a-a9fff92962bf	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N	\N
00180000-56af-8dbc-359e-b35b25bbebac	\N	00200000-56af-8dbc-6c17-37b6c38c9d36	\N	\N	\N	00220000-56af-8dbb-c249-d6eff787febc	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	Vaja 1.	\N	\N
00180000-56af-8dbc-28c8-af35199411fa	\N	00200000-56af-8dbc-9cee-ab6fc1fe3450	\N	\N	\N	00220000-56af-8dbb-c249-d6eff787febc	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	Vaja 2.	\N	\N
00180000-56af-8dbc-ee64-dfb55e5d00d1	\N	00200000-56af-8dbc-592e-ac113a4c75a0	\N	\N	\N	00220000-56af-8dbb-429a-a9fff92962bf	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 3.	\N	\N
00180000-56af-8dbc-0e88-d9ce8e9a3b63	\N	00200000-56af-8dbc-a923-fa2ff00d2c29	\N	\N	\N	00220000-56af-8dbb-d794-43f23bf40874	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	Vaja 4.	\N	\N
00180000-56af-8dbc-5639-7cbc4321fedb	\N	00200000-56af-8dbc-1a9a-3f76e09c90ad	\N	\N	\N	00220000-56af-8dbb-59b8-58dbe47df43c	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	Vaja 5.	\N	\N
00180000-56af-8dbc-f78d-a47f8a317007	\N	00200000-56af-8dbc-bdcb-e20658a18cee	\N	\N	\N	00220000-56af-8dbb-429a-a9fff92962bf	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 6.	\N	\N
00180000-56af-8dbc-2b7b-d13d663729ef	\N	00200000-56af-8dbc-fcc4-d6543103707d	\N	\N	\N	00220000-56af-8dbb-59b8-58dbe47df43c	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 7.	\N	\N
00180000-56af-8dbc-58d2-8db6be902418	\N	00200000-56af-8dbc-aa9d-a84be19bb599	\N	\N	\N	00220000-56af-8dbb-59b8-58dbe47df43c	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 8.	\N	\N
00180000-56af-8dbc-755d-d6bf1a2e5aca	\N	00200000-56af-8dbc-143e-44889b247ef9	\N	\N	\N	00220000-56af-8dbb-c249-d6eff787febc	001f0000-56af-8dbb-94d1-6d6658933ec6	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	Vaja 9.	\N	\N
00180000-56af-8dbc-d5ab-c194234c0ae6	\N	00200000-56af-8dbc-8dcd-e7cd69245119	\N	\N	\N	00220000-56af-8dbb-c249-d6eff787febc	001f0000-56af-8dbb-94d1-6d6658933ec6	2014-06-11 07:00:00	2014-06-12 15:00:00	400s	200s	\N	Vaja 10.	\N	\N
00180000-56af-8dbc-0cf2-9c6aa40f257c	\N	\N	001c0000-56af-8dbc-08f2-432c6264fcfe	\N	\N	\N	001f0000-56af-8dbb-18f5-2163ed72921a	2015-03-10 07:00:00	2015-03-20 23:00:00	200s	300s	\N	Gostovanje 1.	#001122	\N
00180000-56af-8dbc-cae0-67f7a6e3b3ce	001b0000-56af-8dbc-d183-1d8bffe09556	\N	\N	\N	\N	00220000-56af-8dbb-655f-d103582e7fdd	001f0000-56af-8dbb-94d1-6d6658933ec6	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N	\N
00180000-56af-8dbc-6047-ebb448606b89	001b0000-56af-8dbc-897f-a4e8fed68cd3	\N	\N	\N	\N	00220000-56af-8dbb-429a-a9fff92962bf	001f0000-56af-8dbb-94d1-6d6658933ec6	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N	\N
00180000-56af-8dbc-698c-52a1ef136d13	001b0000-56af-8dbc-839f-61a57138d67f	\N	\N	\N	\N	00220000-56af-8dbb-655f-d103582e7fdd	001f0000-56af-8dbb-94d1-6d6658933ec6	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N	\N
00180000-56af-8dbc-22b5-d52d89499c69	001b0000-56af-8dbc-e6de-4fa91d123d9b	\N	\N	\N	\N	00220000-56af-8dbb-655f-d103582e7fdd	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N	\N
00180000-56af-8dbc-ef0c-024ffdc58d6d	001b0000-56af-8dbc-5c72-badbc98f7cf4	\N	\N	\N	\N	00220000-56af-8dbb-655f-d103582e7fdd	001f0000-56af-8dbb-18f5-2163ed72921a	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N	\N
00180000-56af-8dbc-20f3-19670a725ec5	001b0000-56af-8dbc-b517-12ca19578b67	\N	\N	\N	\N	00220000-56af-8dbb-655f-d103582e7fdd	001f0000-56af-8dbb-18f5-2163ed72921a	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N	\N
00180000-56af-8dbc-db0f-d1ba782821b8	001b0000-56af-8dbc-3fb6-4ea4027a51a1	\N	\N	\N	\N	00220000-56af-8dbb-655f-d103582e7fdd	001f0000-56af-8dbb-94d1-6d6658933ec6	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N	\N
00180000-56af-8dbc-293a-9229ebd5ab2d	001b0000-56af-8dbc-c0f2-acb2be28243b	\N	\N	\N	\N	00220000-56af-8dbb-655f-d103582e7fdd	001f0000-56af-8dbb-18f5-2163ed72921a	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N	\N
00180000-56af-8dbc-194c-402caccc354c	001b0000-56af-8dbc-c75f-c8b9728dfef0	\N	\N	\N	\N	00220000-56af-8dbb-655f-d103582e7fdd	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N	\N
00180000-56af-8dbc-deb6-52582b75f240	001b0000-56af-8dbc-31bb-80869756722c	\N	\N	\N	\N	00220000-56af-8dbb-655f-d103582e7fdd	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N	\N
00180000-56af-8dbc-41a1-b698aba6bea1	001b0000-56af-8dbc-cb11-91b50dbeb294	\N	\N	\N	\N	00220000-56af-8dbb-655f-d103582e7fdd	001f0000-56af-8dbb-18f5-2163ed72921a	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N	\N
00180000-56af-8dbc-503e-996cd242eb2a	001b0000-56af-8dbc-3b18-92d572c17fae	\N	\N	\N	\N	00220000-56af-8dbb-655f-d103582e7fdd	001f0000-56af-8dbb-cb64-6c3477183f71	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N	\N
00180000-56af-8dbc-73f9-a801e35a1bb3	001b0000-56af-8dbc-9594-73138fe1986e	\N	\N	\N	\N	00220000-56af-8dbb-655f-d103582e7fdd	001f0000-56af-8dbb-cb64-6c3477183f71	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N	\N
00180000-56af-8dbc-d820-5d37de2955ca	001b0000-56af-8dbc-4d88-4120ff80d41d	\N	\N	\N	\N	00220000-56af-8dbb-655f-d103582e7fdd	001f0000-56af-8dbb-18f5-2163ed72921a	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N	\N
00180000-56af-8dbc-d82e-a745accffaae	001b0000-56af-8dbc-53e0-c183df6e607e	\N	\N	\N	\N	\N	001f0000-56af-8dbb-18f5-2163ed72921a	2015-03-15 20:00:00	2015-03-15 23:00:00	200s	100s	\N	Predstava 15.	\N	001c0000-56af-8dbc-08f2-432c6264fcfe
00180000-56af-8dbc-95e7-a1e4478440e4	001b0000-56af-8dbc-1d50-5039bea7266b	\N	\N	\N	\N	\N	001f0000-56af-8dbb-18f5-2163ed72921a	2015-03-16 20:00:00	2015-03-16 23:00:00	200s	100s	\N	Predstava 16.	\N	001c0000-56af-8dbc-08f2-432c6264fcfe
\.


--
-- TOC entry 3166 (class 0 OID 42507680)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56af-8dbb-1d4e-c0b0eb4e5b23
001e0000-56af-8dbb-c52c-812f448a3ff0
\.


--
-- TOC entry 3167 (class 0 OID 42507685)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56af-8dbb-d759-c28f8bda94f6
00440000-56af-8dbb-179f-41f4b4761784
\.


--
-- TOC entry 3209 (class 0 OID 42508257)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 42507559)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56af-8db8-e42b-5f45734ee951	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56af-8db8-edf9-369331846b4d	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56af-8db8-1e29-aa8bb8c094ca	AL	ALB	008	Albania 	Albanija	\N
00040000-56af-8db8-98a4-4af9767efbe8	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56af-8db8-60e6-4b8757134723	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56af-8db8-de44-5676fe21c2e5	AD	AND	020	Andorra 	Andora	\N
00040000-56af-8db8-92b7-97ffbbebfad9	AO	AGO	024	Angola 	Angola	\N
00040000-56af-8db8-3359-2710008e088f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56af-8db8-42ef-8a96ee9cb6ad	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56af-8db8-f98d-572f522fb1d5	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56af-8db8-a2ca-969e1d9c79d2	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56af-8db8-88bb-4e73bcaf8fdb	AM	ARM	051	Armenia 	Armenija	\N
00040000-56af-8db8-f95f-bdb6389ab5ca	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56af-8db8-8513-cd3006d52b00	AU	AUS	036	Australia 	Avstralija	\N
00040000-56af-8db8-7f27-1ceeafaaf7b2	AT	AUT	040	Austria 	Avstrija	\N
00040000-56af-8db8-3b0f-9ed7437fed53	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56af-8db8-2e7c-d1ee89d76678	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56af-8db8-0155-b3a4009a8e44	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56af-8db8-417e-ad23844dae61	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56af-8db8-6e2d-3a3a4afea618	BB	BRB	052	Barbados 	Barbados	\N
00040000-56af-8db8-74d7-824d32afdea8	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56af-8db8-8a1f-b63aac03a905	BE	BEL	056	Belgium 	Belgija	\N
00040000-56af-8db8-08a7-9fad872bbc2e	BZ	BLZ	084	Belize 	Belize	\N
00040000-56af-8db8-0644-00c5b4d845fa	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56af-8db8-8833-e18e681f4bfa	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56af-8db8-e039-112cfca6fbd0	BT	BTN	064	Bhutan 	Butan	\N
00040000-56af-8db8-0fb3-20928eb98b69	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56af-8db8-a2de-ecad49a8655a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56af-8db8-4b41-8d49f147e2e2	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56af-8db8-31e9-194ae80a447d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56af-8db8-7f4d-cde36fca7fab	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56af-8db8-e21b-992e7a0f0b6f	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56af-8db8-b763-f736db959c79	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56af-8db8-a814-13ecb8f00ca6	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56af-8db8-8fcc-6dad04016ec3	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56af-8db8-47ce-cf568acf397b	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56af-8db8-c7f9-289595d36bfe	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56af-8db8-4850-a63cca295b90	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56af-8db8-714b-448a629c4a61	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56af-8db8-55f1-9a648dec96d8	CA	CAN	124	Canada 	Kanada	\N
00040000-56af-8db8-30d7-3626cf4eeded	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56af-8db8-23c9-bfdaa8623d67	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56af-8db8-dc5d-43039ae9f9de	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56af-8db8-1bc6-ae87a6ab312f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56af-8db8-f696-83ced3e68cec	CL	CHL	152	Chile 	Čile	\N
00040000-56af-8db8-f805-6a68864df183	CN	CHN	156	China 	Kitajska	\N
00040000-56af-8db8-44df-daa93136a144	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56af-8db8-a994-f04ae5901334	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56af-8db8-63e9-b9e3a65ab1af	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56af-8db8-2173-597f7bcd278e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56af-8db8-d7ff-1cd822281b6a	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56af-8db8-da67-16eef70bf318	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56af-8db8-0903-cec301822dda	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56af-8db8-4fdc-1b3ab976f8f6	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56af-8db8-e02e-8e95244b04ae	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56af-8db8-4794-8dbdb29d0d86	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56af-8db8-06fd-d9ca742dfe28	CU	CUB	192	Cuba 	Kuba	\N
00040000-56af-8db8-9bdf-73c21ce8f65e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56af-8db8-9d74-5252feb51732	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56af-8db8-17b5-31179aa2937f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56af-8db8-0bc2-85e80d81a6cc	DK	DNK	208	Denmark 	Danska	\N
00040000-56af-8db8-4bd1-77adc31e7b29	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56af-8db8-2bf0-5c79dac45d89	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56af-8db8-9cde-0a75739b3b15	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56af-8db8-12aa-8edf9884abbe	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56af-8db8-9e69-e3c142cc0d59	EG	EGY	818	Egypt 	Egipt	\N
00040000-56af-8db8-5fac-b12bbdeed423	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56af-8db8-4301-3a4d542697b6	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56af-8db8-afe5-774e5ad0aeea	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56af-8db8-94d0-919186af4b02	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56af-8db8-7e0e-77b2046c22f0	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56af-8db8-3c0f-2b4ac97b2188	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56af-8db8-f6d0-a8c659092205	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56af-8db8-74b1-bc0d6273c2b2	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56af-8db8-6ddd-a505977565b5	FI	FIN	246	Finland 	Finska	\N
00040000-56af-8db8-10c8-d67d70a3b12f	FR	FRA	250	France 	Francija	\N
00040000-56af-8db8-42bb-3b09eb7cb2af	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56af-8db8-5f38-4bb865e412ee	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56af-8db8-a817-5a5a0d8c11cb	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56af-8db8-9a65-8c48ca1cac1e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56af-8db8-c3ac-2322c9f455ba	GA	GAB	266	Gabon 	Gabon	\N
00040000-56af-8db8-1fcb-045def40cb53	GM	GMB	270	Gambia 	Gambija	\N
00040000-56af-8db8-c3ac-9729d4c34a2f	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56af-8db8-b049-543182f31b58	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56af-8db8-be05-19e73cbd9853	GH	GHA	288	Ghana 	Gana	\N
00040000-56af-8db8-776e-3fa8a4aebf84	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56af-8db8-14b0-2423fc271af6	GR	GRC	300	Greece 	Grčija	\N
00040000-56af-8db8-4759-b3b537b08189	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56af-8db8-3829-d420fe113ce6	GD	GRD	308	Grenada 	Grenada	\N
00040000-56af-8db8-74c1-31103b4fda01	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56af-8db8-30c9-4a6449aa7c87	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56af-8db8-9190-4c0b5a39c25f	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56af-8db8-d456-72f728d20880	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56af-8db8-391f-963fed253dc1	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56af-8db8-1251-66bf45179b4e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56af-8db8-fed1-b25685de499e	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56af-8db8-4529-c6f3826287de	HT	HTI	332	Haiti 	Haiti	\N
00040000-56af-8db8-05a9-50009804fdf1	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56af-8db8-40f0-ed352f8458bf	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56af-8db8-af65-ee7b39ad3574	HN	HND	340	Honduras 	Honduras	\N
00040000-56af-8db8-0521-b7975c684fe9	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56af-8db8-25eb-0adb9253d750	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56af-8db8-ccad-b139f1cfafb5	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56af-8db8-db83-d419c0700db4	IN	IND	356	India 	Indija	\N
00040000-56af-8db8-4ba3-08f2e05c06ab	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56af-8db8-8c45-07691045bdd8	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56af-8db8-c5a8-5a362b56cd83	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56af-8db8-1509-ddfec6f35921	IE	IRL	372	Ireland 	Irska	\N
00040000-56af-8db8-cd2f-e64c9f22b489	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56af-8db8-f925-dc225e7b29ea	IL	ISR	376	Israel 	Izrael	\N
00040000-56af-8db8-52b3-67e2bad90965	IT	ITA	380	Italy 	Italija	\N
00040000-56af-8db8-136f-8eb33d50635b	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56af-8db8-cae4-fe88c6888074	JP	JPN	392	Japan 	Japonska	\N
00040000-56af-8db8-a280-6f4c877fd16c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56af-8db8-54d2-d5f39cc8b8d9	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56af-8db8-83e8-5e73b36aba3f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56af-8db8-fd5c-80742a645a38	KE	KEN	404	Kenya 	Kenija	\N
00040000-56af-8db8-66b7-b4e78ec0af24	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56af-8db8-76cf-eb0ef9c4e0cd	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56af-8db8-bf78-f28ca174b751	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56af-8db8-a325-7da5ad3b0719	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56af-8db8-2231-2388dae37997	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56af-8db8-4161-20137f84b5d7	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56af-8db8-4fb9-d64ef6904eed	LV	LVA	428	Latvia 	Latvija	\N
00040000-56af-8db8-d15c-eec53d521dc2	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56af-8db8-64c7-fef4fe6d9ee5	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56af-8db8-82be-40142997870b	LR	LBR	430	Liberia 	Liberija	\N
00040000-56af-8db8-dba3-fe13f35d8dde	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56af-8db8-98c6-b8b9b195eb08	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56af-8db8-8074-7ec950a17a32	LT	LTU	440	Lithuania 	Litva	\N
00040000-56af-8db8-73fd-db67cc448e3a	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56af-8db8-fbb1-b0c2fa050eff	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56af-8db8-abc4-89785be509d9	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56af-8db8-36a5-75793e607798	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56af-8db8-d40b-c8ea1e46ead9	MW	MWI	454	Malawi 	Malavi	\N
00040000-56af-8db8-1070-4d9b7f72ea0f	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56af-8db8-415d-13f00437e27b	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56af-8db8-869c-32d9bed6b3b7	ML	MLI	466	Mali 	Mali	\N
00040000-56af-8db8-17c5-aa20ec2600a8	MT	MLT	470	Malta 	Malta	\N
00040000-56af-8db8-eed1-6507bb2110fe	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56af-8db8-f2be-7af3a1f6e138	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56af-8db8-d937-60a656c29e9d	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56af-8db8-a731-7788bca2fa9e	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56af-8db8-8638-714de7b7835c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56af-8db8-6aa2-05888c82914e	MX	MEX	484	Mexico 	Mehika	\N
00040000-56af-8db8-37b6-87b935284cc1	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56af-8db8-abd5-c6874e5189c3	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56af-8db8-e91f-31e2fd30c604	MC	MCO	492	Monaco 	Monako	\N
00040000-56af-8db8-cf5d-3105ade684d8	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56af-8db8-d002-5d89cd1ffec2	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56af-8db8-37b2-128fc0cf094c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56af-8db8-5cc0-1cf548a4051b	MA	MAR	504	Morocco 	Maroko	\N
00040000-56af-8db8-b39d-134a79596d9c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56af-8db8-2ac2-390bcd30fa9b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56af-8db8-8aaa-b042d01d14eb	NA	NAM	516	Namibia 	Namibija	\N
00040000-56af-8db8-2c08-9a3c4ec08068	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56af-8db8-b7f7-f0dee0a47973	NP	NPL	524	Nepal 	Nepal	\N
00040000-56af-8db8-90db-a2b1a6fca373	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56af-8db8-16c2-e9c9c8579f43	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56af-8db8-b22c-2e5cf506a2b3	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56af-8db8-aa27-4cd6d653b9cb	NE	NER	562	Niger 	Niger 	\N
00040000-56af-8db8-410b-1d1c69818be6	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56af-8db8-d6cd-78cf57f1d760	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56af-8db8-ab6e-129f35560ccf	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56af-8db8-3c29-d28815feb23d	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56af-8db8-9005-78447ab40825	NO	NOR	578	Norway 	Norveška	\N
00040000-56af-8db8-7554-2073baea9b96	OM	OMN	512	Oman 	Oman	\N
00040000-56af-8db8-1041-1220ad066a66	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56af-8db8-342a-d7f5818e67c7	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56af-8db8-cfe9-4865dcee5f3b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56af-8db8-067b-50975882abd0	PA	PAN	591	Panama 	Panama	\N
00040000-56af-8db8-7e3f-99c8b722b533	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56af-8db8-3f39-691716dd9559	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56af-8db8-4ec5-192c0710b217	PE	PER	604	Peru 	Peru	\N
00040000-56af-8db8-bfbe-03b8f0a5508a	PH	PHL	608	Philippines 	Filipini	\N
00040000-56af-8db8-3530-42615787d106	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56af-8db8-c11e-377412e7be32	PL	POL	616	Poland 	Poljska	\N
00040000-56af-8db8-3786-e254fe0261f1	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56af-8db8-a731-535e6345ebe5	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56af-8db8-8c53-61e930bf5287	QA	QAT	634	Qatar 	Katar	\N
00040000-56af-8db8-557e-7179167ff2c3	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56af-8db8-a36b-ab66bb7f518d	RO	ROU	642	Romania 	Romunija	\N
00040000-56af-8db8-0470-c665497145c2	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56af-8db8-62df-1a26ec677d22	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56af-8db8-eaf8-6e0e00598e7f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56af-8db8-4a80-99d03848113b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56af-8db8-7b7f-7663678a7f61	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56af-8db8-29f8-13212fdd8f9a	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56af-8db8-8492-f6aa0242e5ec	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56af-8db8-ff49-1b8774207114	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56af-8db8-9132-0ee2534eac9f	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56af-8db8-ec42-357c137dd39e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56af-8db8-76e3-7b196388b4e3	SM	SMR	674	San Marino 	San Marino	\N
00040000-56af-8db8-b9df-8d8f58c1d5ee	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56af-8db8-b6c3-e085282bd99d	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56af-8db8-b482-ae1c140b3850	SN	SEN	686	Senegal 	Senegal	\N
00040000-56af-8db8-c829-753a6ee54c91	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56af-8db8-23dd-4e720a10aa9a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56af-8db8-5ed2-f62ef2c2d3c3	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56af-8db8-a816-4c3e198560c6	SG	SGP	702	Singapore 	Singapur	\N
00040000-56af-8db8-01f2-0808b9a3cb7a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56af-8db8-8c05-a08b9538f144	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56af-8db8-e85f-e04672eb7442	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56af-8db8-2ed9-334536e9f6c1	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56af-8db8-3817-141276d9a0c1	SO	SOM	706	Somalia 	Somalija	\N
00040000-56af-8db8-f3a0-a32e082148ad	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56af-8db8-8636-3ffb50fbf80b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56af-8db8-a1d1-9f609a506e62	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56af-8db8-d0a9-836bab80eced	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56af-8db8-6487-ff8517cb789e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56af-8db8-f2e4-7ad2d2fac83d	SD	SDN	729	Sudan 	Sudan	\N
00040000-56af-8db8-bbb0-75bb49ec8843	SR	SUR	740	Suriname 	Surinam	\N
00040000-56af-8db8-9261-60e2ec479c5a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56af-8db8-04f7-b0556b68fdb9	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56af-8db8-e031-f1c2b1cf4638	SE	SWE	752	Sweden 	Švedska	\N
00040000-56af-8db8-93f3-7e5dccfe7719	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56af-8db8-36d7-379705aacade	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56af-8db8-b57c-387f6e60ebdc	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56af-8db8-125d-5306cc10c4c9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56af-8db8-028f-c9b9c2e2f0b1	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56af-8db8-6c66-5b5c58789f3b	TH	THA	764	Thailand 	Tajska	\N
00040000-56af-8db8-5f7b-962effa8e025	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56af-8db8-acda-bf7b8f3253e7	TG	TGO	768	Togo 	Togo	\N
00040000-56af-8db8-1c1d-b12a71cea661	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56af-8db8-c90c-8a811d208e19	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56af-8db8-9a1a-e066c5e99c66	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56af-8db8-ad7e-c981cbcbe9fa	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56af-8db8-1b4f-f9969df91f64	TR	TUR	792	Turkey 	Turčija	\N
00040000-56af-8db8-1e46-5507ca366a2d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56af-8db8-0543-d90717bea232	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56af-8db8-c031-97b22e686099	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56af-8db8-77c2-1e845a7e3a6f	UG	UGA	800	Uganda 	Uganda	\N
00040000-56af-8db8-7043-febc9e1b0dcd	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56af-8db8-ab7a-cfae13d27350	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56af-8db8-ca04-804fee388ead	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56af-8db8-f85f-cbf110764090	US	USA	840	United States 	Združene države Amerike	\N
00040000-56af-8db8-8e80-f1c7327318b3	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56af-8db8-3a84-39ef891ed579	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56af-8db8-f56a-877fae02b28b	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56af-8db8-d89b-01ee08db4410	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56af-8db8-f7cd-5e18bad710c5	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56af-8db8-b25c-de92bb92430a	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56af-8db8-d0eb-83fd1170237b	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56af-8db8-1977-3bef7d3e6e36	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56af-8db8-fb68-1266dd717605	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56af-8db8-32fe-f39e5704b68d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56af-8db8-eb45-fa05e2b43a61	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56af-8db8-7546-9a88e8aa5a03	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56af-8db8-4ef1-f70e7214c0f6	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 42508045)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56af-8dbc-49d5-63f6c8251ae1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56af-8dbc-2633-3d39892aff14	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56af-8dbc-50dc-fac072da98e7	000e0000-56af-8dbb-789e-8242186d280e	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56af-8db8-9eb4-bd9d65abd964	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56af-8dbc-d240-c7ab8ab5bb59	000e0000-56af-8dbb-d68a-c95453b28004	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56af-8db8-1ddc-b9437185cbed	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56af-8dbc-5da4-1731f71916f3	000e0000-56af-8dbb-1562-ea7cb1201e54	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56af-8db8-9eb4-bd9d65abd964	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 42507851)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56af-8dbc-20c5-8590033f1c67	000e0000-56af-8dbb-d68a-c95453b28004	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56af-8db8-e12e-f0fd8b282a23
000d0000-56af-8dbc-dd65-705305740f3e	000e0000-56af-8dbb-e440-3d2c4680b001	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56af-8db8-6b1f-d97b59a99e41
000d0000-56af-8dbc-0033-864a17c69ef3	000e0000-56af-8dbb-e440-3d2c4680b001	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56af-8db8-12f8-2e9e0ad03319
000d0000-56af-8dbc-d031-ca4c717a6742	000e0000-56af-8dbb-d68a-c95453b28004	000c0000-56af-8dbc-b7ce-6c6aa252f049	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56af-8db8-6b1f-d97b59a99e41
000d0000-56af-8dbc-91df-3a2bd3c6af66	000e0000-56af-8dbb-d68a-c95453b28004	000c0000-56af-8dbc-fce2-f647f2734025	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56af-8db8-12f8-2e9e0ad03319
000d0000-56af-8dbc-f5d6-a09d86290252	000e0000-56af-8dbb-d68a-c95453b28004	000c0000-56af-8dbc-3b02-784de8fce6c8	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56af-8db8-b654-9176c4db6965
000d0000-56af-8dbc-ad68-310654872c8f	000e0000-56af-8dbb-d68a-c95453b28004	000c0000-56af-8dbc-5b19-d17552ca60ec	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56af-8db8-e12e-f0fd8b282a23
000d0000-56af-8dbc-cb9f-e461a4e89490	000e0000-56af-8dbb-d68a-c95453b28004	000c0000-56af-8dbc-ec0a-3d8527d825a1	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56af-8db8-e12e-f0fd8b282a23
000d0000-56af-8dbc-df90-630bcf3ad86f	000e0000-56af-8dbb-d68a-c95453b28004	000c0000-56af-8dbc-7c48-543517e27c04	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56af-8db8-6b1f-d97b59a99e41
000d0000-56af-8dbc-d409-c4cb115fe4d3	000e0000-56af-8dbb-d68a-c95453b28004	000c0000-56af-8dbc-2df6-f34059317ea8	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56af-8db8-6b1f-d97b59a99e41
000d0000-56af-8dbc-f197-ca5989373950	000e0000-56af-8dbb-d68a-c95453b28004	000c0000-56af-8dbc-481c-b2c648bb7456	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56af-8db8-06d7-692f902883de
000d0000-56af-8dbc-7908-f683786902f6	000e0000-56af-8dbb-d68a-c95453b28004	000c0000-56af-8dbc-4d03-c3aead4bdcf6	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56af-8db8-3cee-e3dc060ba73d
000d0000-56af-8dbc-5a77-9e7ed9c2b362	000e0000-56af-8dbb-49cc-23eb6ef21277	000c0000-56af-8dbc-d667-c5f2d20e0a40	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56af-8db8-12f8-2e9e0ad03319
000d0000-56af-8dbc-0e48-441e32b56238	000e0000-56af-8dbb-7a8a-0088efb3b2d2	000c0000-56af-8dbc-e804-ec832945082b	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56af-8db8-12f8-2e9e0ad03319
000d0000-56af-8dbc-d509-843d848342d2	000e0000-56af-8dbb-7a8a-0088efb3b2d2	000c0000-56af-8dbc-17cf-424b0090bea2	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56af-8db8-12f8-2e9e0ad03319
000d0000-56af-8dbc-e98f-804786d7f6f0	000e0000-56af-8dbb-fbb3-82f3400afa13	000c0000-56af-8dbc-0a95-df57e70f0a05	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56af-8db8-12f8-2e9e0ad03319
000d0000-56af-8dbc-3c4e-8c6684d850bc	000e0000-56af-8dbc-8757-3b4c832b6694	000c0000-56af-8dbc-53ff-a8f4356312d0	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56af-8db8-12f8-2e9e0ad03319
000d0000-56af-8dbc-2afe-15f3d322e287	000e0000-56af-8dbc-bf6c-9480dc8e4ca8	000c0000-56af-8dbc-7103-8f64ad48f919	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56af-8db8-12f8-2e9e0ad03319
000d0000-56af-8dbc-d4de-31155e0a3e9c	000e0000-56af-8dbc-e4ac-d0fdb531f514	000c0000-56af-8dbc-4fd2-d78e41420051	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56af-8db8-12f8-2e9e0ad03319
000d0000-56af-8dbc-d628-4e27b9f4ab5a	000e0000-56af-8dbc-848a-7ddf257413a9	000c0000-56af-8dbc-7016-595cafe48b4d	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56af-8db8-12f8-2e9e0ad03319
000d0000-56af-8dbc-96d5-50fd9d0d4524	000e0000-56af-8dbc-9112-efe7117d534e	000c0000-56af-8dbc-bf41-b741e616d799	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56af-8db8-12f8-2e9e0ad03319
000d0000-56af-8dbc-0c19-dfb0a2ab2228	000e0000-56af-8dbc-9112-efe7117d534e	000c0000-56af-8dbc-0086-03d7039684ed	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56af-8db8-12f8-2e9e0ad03319
000d0000-56af-8dbc-3985-0804d5b371ae	000e0000-56af-8dbc-edf1-e921a55e9d77	000c0000-56af-8dbc-e916-db7af037e00a	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56af-8db8-12f8-2e9e0ad03319
000d0000-56af-8dbc-2104-404242086554	000e0000-56af-8dbc-edf1-e921a55e9d77	000c0000-56af-8dbc-3353-273c169721b9	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56af-8db8-12f8-2e9e0ad03319
\.


--
-- TOC entry 3162 (class 0 OID 42507627)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
001c0000-56af-8dbc-08f2-432c6264fcfe	00040000-56af-8db8-ccad-b139f1cfafb5		\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 42507599)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 42507576)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56af-8dbb-91cf-ec5983a709de	00080000-56af-8dbb-acd4-da77d56e58b5	00090000-56af-8dbb-68b2-0e627ed20b9d	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 42507765)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 42508315)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56af-8dbb-3cf0-99e105a92b64	00010000-56af-8db9-4566-82bb71977250	\N	Prva mapa	Root mapa	2016-02-01 17:54:19	2016-02-01 17:54:19	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 42508328)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 42508350)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 34548309)
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
20150923181744
20150929204104
20150930165014
20151012154609
20151013160827
20151015150048
20151021092904
20151028083119
20151028094855
20151029145336
20151102103154
20151104101328
20151105104249
20151210170541
20151214151027
20151218121329
20151229153831
\.


--
-- TOC entry 3180 (class 0 OID 42507789)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 42507533)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56af-8db9-2a59-deebe8ef8c64	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56af-8db9-f36d-a01f35289d00	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56af-8db9-4efc-aa72643709fd	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56af-8db9-c4b9-5079f7e0ca6b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56af-8db9-38ca-21147f2992ec	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56af-8db9-95f4-1aaeed52ae3b	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56af-8db9-de11-734db443bece	dogodek.delte	array	a:14:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delGosZac";a:2:{s:5:"label";s:37:"Delta začetka pri dogodku gostovanje";s:5:"value";i:0;}s:9:"delGosKon";a:2:{s:5:"label";s:34:"Delta konca pri dogodku gostovanje";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56af-8db9-908b-a158a1bdf03b	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56af-8db9-7345-d5b48125e2d3	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56af-8db9-44b4-24f256f68a8a	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56af-8db9-f861-b5b3eb417103	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56af-8db9-2211-6486c231dd0f	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56af-8db9-31e2-0c72c55232c7	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56af-8db9-efdb-f91c81655f8e	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56af-8db9-280d-8d68a3900501	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56af-8db9-8a5e-7e07d705c643	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56af-8db9-3e6a-9771eb6d8ac4	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56af-8dbb-9470-f716b281161d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56af-8dbb-56ce-71a19d06bd4d	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56af-8dbb-89e2-b2e9dd7bbbeb	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56af-8dbb-1c7f-7655f7566486	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56af-8dbb-dd1c-d87c5941e6b4	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56af-8dbb-6791-2d81d05692d2	tomaz.barva.ozadja	array	s:4:"siva";	t	f	f	\N	barva ozadja tomaž
00000000-56af-8dbd-deb8-23c5e3a72d29	application.tenant.maticnopodjetje	string	s:36:"00080000-56af-8dbd-df9d-2266ec06aa7c";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 42507433)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56af-8dbb-ae67-8fe1f119c0a9	00000000-56af-8dbb-9470-f716b281161d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56af-8dbb-727f-fca597d9517a	00000000-56af-8dbb-9470-f716b281161d	00010000-56af-8db9-4566-82bb71977250	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56af-8dbb-48a7-24d6b487d600	00000000-56af-8dbb-56ce-71a19d06bd4d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
00000000-56af-8dbb-c2d6-07d1b5f70397	00000000-56af-8dbb-6791-2d81d05692d2	\N	s:6:"zelena";	t
00000000-56af-8dbb-3e85-e88c9aea7a35	00000000-56af-8dbb-6791-2d81d05692d2	00010000-56af-8db9-4566-82bb71977250	s:6:"rdeča";	f
\.


--
-- TOC entry 3151 (class 0 OID 42507500)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56af-8dbb-9402-ef599082ffc7	\N	00100000-56af-8dbb-d5e1-d187a968f91a	00100000-56af-8dbb-d389-bf88416ca7e6	01	Gledališče Nimbis
00410000-56af-8dbb-210f-29a4303dd229	00410000-56af-8dbb-9402-ef599082ffc7	00100000-56af-8dbb-d5e1-d187a968f91a	00100000-56af-8dbb-d389-bf88416ca7e6	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 42507444)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56af-8dbb-a379-3c3f6c2edf4c	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56af-8dbb-887b-b8b2d4b5f636	00010000-56af-8dbb-ead1-5ac0eff4603c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56af-8dbb-cffd-251b25733074	00010000-56af-8dbb-b16d-2a78b6c08a40	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56af-8dbb-5b41-47e58401e73e	00010000-56af-8dbb-e5d7-78b8e472b3fd	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56af-8dbb-fb39-9e0df85ffedb	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56af-8dbb-27fc-0f2e4688677b	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56af-8dbb-7870-7fa4b5324ff7	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56af-8dbb-8c51-662d96d8ee74	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56af-8dbb-68b2-0e627ed20b9d	00010000-56af-8dbb-5bd4-528910daf1ec	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56af-8dbb-b9a0-9f766ab4b055	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56af-8dbb-6ad4-43010683f37c	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56af-8dbb-37d0-c21d076aa4c5	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56af-8dbb-f244-b061004b110f	00010000-56af-8dbb-be25-d591c44a0fe2	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56af-8dbb-f66b-dbd4063dadad	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-8dbb-fc99-6c76a462723e	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-8dbb-97a2-486721cd493a	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-8dbb-371e-9e42df59e4d7	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56af-8dbb-e0b0-84fdf6324405	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56af-8dbb-b28e-95f0ac983b9a	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-8dbb-064c-5c13dd31edf4	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-8dbb-7303-198b072cf59a	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 42507378)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56af-8db9-e515-cdfba5740b45	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56af-8db9-7edd-7c7b90059ba0	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56af-8db9-2d56-751daed8883d	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56af-8db9-ce09-51f005a74e59	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56af-8db9-d310-1a7194ddce4a	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56af-8db9-b10f-9be1866d9cd9	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56af-8db9-41f6-6ce9db092bea	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56af-8db9-35b9-035d1b54fac8	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56af-8db9-c4af-23836edc8ca6	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56af-8db9-7558-9a11b8a94c2e	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56af-8db9-02ca-6fb07d95be6a	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56af-8db9-bd0f-f9e3f589ad15	Abonma-read	Abonma - branje	t
00030000-56af-8db9-af30-f8d4d0502e2a	Abonma-write	Abonma - spreminjanje	t
00030000-56af-8db9-7c3b-5e0760735855	Alternacija-read	Alternacija - branje	t
00030000-56af-8db9-bd64-313e8e48375d	Alternacija-write	Alternacija - spreminjanje	t
00030000-56af-8db9-ec40-062bf3839664	Arhivalija-read	Arhivalija - branje	t
00030000-56af-8db9-5a5a-f09d22fe2b4a	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56af-8db9-8f62-58a2b2f32097	AuthStorage-read	AuthStorage - branje	t
00030000-56af-8db9-4f2b-66bb6e4ed54c	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56af-8db9-03c6-080d511047eb	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56af-8db9-c2d7-3074bf56c2e4	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56af-8db9-7119-f32f210e06cb	Besedilo-read	Besedilo - branje	t
00030000-56af-8db9-ed16-eb5fbbcb1bae	Besedilo-write	Besedilo - spreminjanje	t
00030000-56af-8db9-5d3f-300cd1e5ddfa	Dodatek-read	Dodatek - branje	t
00030000-56af-8db9-7c31-dc6c8e2890f0	Dodatek-write	Dodatek - spreminjanje	t
00030000-56af-8db9-8909-4797db63d7b6	Dogodek-read	Dogodek - branje	t
00030000-56af-8db9-860f-476b87dfe6f4	Dogodek-write	Dogodek - spreminjanje	t
00030000-56af-8db9-9fd6-e3de58b0563a	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56af-8db9-24ce-b22cb918419a	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56af-8db9-f113-6c23658af295	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56af-8db9-c183-a219794b5e10	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56af-8db9-edde-958d503adea1	DogodekTrait-read	DogodekTrait - branje	t
00030000-56af-8db9-919d-e0d7fa8c0300	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56af-8db9-43ba-066ca5baae52	DrugiVir-read	DrugiVir - branje	t
00030000-56af-8db9-6186-c582ebc07140	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56af-8db9-c785-cdb95672cfe5	Drzava-read	Drzava - branje	t
00030000-56af-8db9-19f3-7adf181c3031	Drzava-write	Drzava - spreminjanje	t
00030000-56af-8db9-812b-f0504ee25727	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56af-8db9-d866-c7b7ef30295d	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56af-8db9-fe9a-e2e6ffe6bde3	Funkcija-read	Funkcija - branje	t
00030000-56af-8db9-101d-8ee64529c6d7	Funkcija-write	Funkcija - spreminjanje	t
00030000-56af-8db9-73bd-01686c13d024	Gostovanje-read	Gostovanje - branje	t
00030000-56af-8db9-cd04-e857c8897382	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56af-8db9-367d-2b003ddbe6da	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56af-8db9-01c2-75a2d19a66cb	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56af-8db9-aa46-aaa755fd6598	Kupec-read	Kupec - branje	t
00030000-56af-8db9-5fd2-af1401cad4e4	Kupec-write	Kupec - spreminjanje	t
00030000-56af-8db9-d61e-db862673bee8	NacinPlacina-read	NacinPlacina - branje	t
00030000-56af-8db9-bb81-0c3787c2dc34	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56af-8db9-7e43-953fcca8ff8d	Option-read	Option - branje	t
00030000-56af-8db9-6d59-23f27a9240d6	Option-write	Option - spreminjanje	t
00030000-56af-8db9-81ce-2ab8bef066a3	OptionValue-read	OptionValue - branje	t
00030000-56af-8db9-59d7-9b2eb8baa014	OptionValue-write	OptionValue - spreminjanje	t
00030000-56af-8db9-f1b0-f26b5df62af3	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56af-8db9-734c-f10b035d12c9	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56af-8db9-1274-809e3845eccd	Oseba-read	Oseba - branje	t
00030000-56af-8db9-31e0-6dd1215dd4a8	Oseba-write	Oseba - spreminjanje	t
00030000-56af-8db9-ad47-193baa62a96a	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56af-8db9-d457-493c351a116d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56af-8db9-d732-2f02383f5bd3	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56af-8db9-3cba-3d4d9efe5460	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56af-8db9-af57-2119dfbafd8f	Pogodba-read	Pogodba - branje	t
00030000-56af-8db9-4362-f45e43add323	Pogodba-write	Pogodba - spreminjanje	t
00030000-56af-8db9-4fcd-1f8f06567121	Popa-read	Popa - branje	t
00030000-56af-8db9-471c-fe28229c6924	Popa-write	Popa - spreminjanje	t
00030000-56af-8db9-55e2-cfaf225aaf49	Posta-read	Posta - branje	t
00030000-56af-8db9-acd1-d84a3d323d8a	Posta-write	Posta - spreminjanje	t
00030000-56af-8db9-11a6-fb181ed67591	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56af-8db9-1ac2-d5547b4c5428	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56af-8db9-6f64-bcfe09590953	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56af-8db9-7e3a-e509730eca2a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56af-8db9-0d1e-22ad27a90872	PostniNaslov-read	PostniNaslov - branje	t
00030000-56af-8db9-7190-b7e1f1e618f8	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56af-8db9-4e0f-62a653704fd2	Praznik-read	Praznik - branje	t
00030000-56af-8db9-5e0b-354aa23e259e	Praznik-write	Praznik - spreminjanje	t
00030000-56af-8db9-2cd7-e142839ec964	Predstava-read	Predstava - branje	t
00030000-56af-8db9-e491-6987bd511ce3	Predstava-write	Predstava - spreminjanje	t
00030000-56af-8db9-21d7-533e42d4298f	Ura-read	Ura - branje	t
00030000-56af-8db9-54ea-23a03ed4b1eb	Ura-write	Ura - spreminjanje	t
00030000-56af-8db9-ef1c-223fe57dfcb0	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56af-8db9-f4ed-103aee9b341b	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56af-8db9-49b4-27401ee0f5ec	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56af-8db9-088a-94b86bdadd2c	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56af-8db9-9b69-399436e21677	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56af-8db9-822f-730b62060771	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56af-8db9-1a6b-dbf2163972ac	ProgramDela-read	ProgramDela - branje	t
00030000-56af-8db9-e896-722d039a1792	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56af-8db9-b0d1-17598ee1b5d2	ProgramFestival-read	ProgramFestival - branje	t
00030000-56af-8db9-222c-95a1bb66603a	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56af-8db9-dfd0-2df2af4faeec	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56af-8db9-af48-f6f1298ea850	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56af-8db9-2a75-36d101b051f5	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56af-8db9-0659-7d8a28d203dd	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56af-8db9-e01f-811cbf27d067	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56af-8db9-1ccb-84290ec7bf3a	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56af-8db9-2896-c4b501e6456a	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56af-8db9-e13e-bae60c519801	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56af-8db9-92cc-430438b2bfcd	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56af-8db9-490c-14f388c6cb5c	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56af-8db9-8c3c-9ec488b9234c	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56af-8db9-111f-c0b4531a22f4	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56af-8db9-7766-861dea9bc3cc	ProgramRazno-read	ProgramRazno - branje	t
00030000-56af-8db9-00e9-3d5e89ded678	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56af-8db9-546b-4bd6a0771e87	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56af-8db9-5ddd-ebc3c19d071e	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56af-8db9-f53c-e34502f595ad	Prostor-read	Prostor - branje	t
00030000-56af-8db9-6daa-f085313047d0	Prostor-write	Prostor - spreminjanje	t
00030000-56af-8db9-7f18-cd45d5bfbad2	Racun-read	Racun - branje	t
00030000-56af-8db9-83b8-8224c290f4e4	Racun-write	Racun - spreminjanje	t
00030000-56af-8db9-8d4a-c5b0c52c2143	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56af-8db9-a0fa-b552ee98271c	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56af-8db9-1e01-e771bfb0c5d6	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56af-8db9-1423-8ab75184b7c1	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56af-8db9-a874-6a65c33d2968	Rekvizit-read	Rekvizit - branje	t
00030000-56af-8db9-4ac7-c1baa4572bc7	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56af-8db9-54bf-9e31ae965dfd	Revizija-read	Revizija - branje	t
00030000-56af-8db9-c67c-2f59b2cac31b	Revizija-write	Revizija - spreminjanje	t
00030000-56af-8db9-37ca-4581be140600	Rezervacija-read	Rezervacija - branje	t
00030000-56af-8db9-d83a-a80a649cd499	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56af-8db9-864b-eaf9e5ebc9f8	SedezniRed-read	SedezniRed - branje	t
00030000-56af-8db9-64a4-a1d77fcff705	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56af-8db9-c9a6-f6ba59d6b1c0	Sedez-read	Sedez - branje	t
00030000-56af-8db9-1b13-ab11c6c9d3c1	Sedez-write	Sedez - spreminjanje	t
00030000-56af-8db9-bcaa-7ea279761fb7	Sezona-read	Sezona - branje	t
00030000-56af-8db9-c68b-d33b5a523119	Sezona-write	Sezona - spreminjanje	t
00030000-56af-8db9-33b5-d7504dc2d943	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56af-8db9-6be8-73a40cb1a7c4	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56af-8db9-eac0-9e5d98b6cd60	Telefonska-read	Telefonska - branje	t
00030000-56af-8db9-03d6-b92578b6a0f1	Telefonska-write	Telefonska - spreminjanje	t
00030000-56af-8db9-e47f-6199054d93be	TerminStoritve-read	TerminStoritve - branje	t
00030000-56af-8db9-a6ce-6f4ec512bdbb	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56af-8db9-ab39-3f117277e264	TipDodatka-read	TipDodatka - branje	t
00030000-56af-8db9-3352-716b9297264b	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56af-8db9-5321-ff8422eee31c	TipFunkcije-read	TipFunkcije - branje	t
00030000-56af-8db9-166e-74117a61d00d	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56af-8db9-dae1-53cbf3447010	TipPopa-read	TipPopa - branje	t
00030000-56af-8db9-11b6-765d2b85fa37	TipPopa-write	TipPopa - spreminjanje	t
00030000-56af-8db9-3aaa-fcf460914a0a	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56af-8db9-b6df-89bcf6d5f915	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56af-8db9-61c0-088550d14bca	TipVaje-read	TipVaje - branje	t
00030000-56af-8db9-03cd-592c4668657a	TipVaje-write	TipVaje - spreminjanje	t
00030000-56af-8db9-e256-61ee14be05e6	Trr-read	Trr - branje	t
00030000-56af-8db9-b2c0-418747b5cea8	Trr-write	Trr - spreminjanje	t
00030000-56af-8db9-37e1-10143870835f	Uprizoritev-read	Uprizoritev - branje	t
00030000-56af-8db9-7794-7da09d046021	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56af-8db9-72c8-770c2a7a77aa	Vaja-read	Vaja - branje	t
00030000-56af-8db9-e1ba-24e5b9848916	Vaja-write	Vaja - spreminjanje	t
00030000-56af-8db9-579e-c2f2bea5f74f	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56af-8db9-eedd-edf436df8d9b	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56af-8db9-b79d-2ac231295e0b	VrstaStroska-read	VrstaStroska - branje	t
00030000-56af-8db9-4d52-09d7a133e993	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56af-8db9-cef8-0fcad261741d	Zaposlitev-read	Zaposlitev - branje	t
00030000-56af-8db9-26de-fc069c1e3845	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56af-8db9-2e31-e7f16c409b30	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56af-8db9-1102-a6c8cbf11019	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56af-8db9-6592-18da27365b51	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56af-8db9-7946-2b310db0e9e8	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56af-8db9-c844-3c99357a8a2c	Job-read	Branje opravil - samo zase - branje	t
00030000-56af-8db9-26da-126d7e29753f	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56af-8db9-56eb-fe89f29b69a8	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56af-8db9-a214-9de2614c627e	Report-read	Report - branje	t
00030000-56af-8db9-358c-aa2db113d7f5	Report-write	Report - spreminjanje	t
00030000-56af-8db9-593a-6bc68323696b	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56af-8db9-8781-2dbc82aececa	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56af-8db9-98f7-1c3741978b6f	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56af-8db9-8cf5-47ef51371c73	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56af-8db9-cd2d-72ae476dc4c3	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56af-8db9-a7cc-764ed90b2276	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56af-8db9-999c-6efb5d75f7ab	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56af-8db9-01d0-8287d584ea2f	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56af-8db9-dd9b-f1aebcf198de	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56af-8db9-86d2-e42e4138ffe6	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56af-8db9-bf30-a4469e3ac25c	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56af-8db9-96c8-13b4a06db3d9	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56af-8db9-bc25-e10e46add483	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56af-8db9-2069-a28461fd9044	Datoteka-write	Datoteka - spreminjanje	t
00030000-56af-8db9-2030-5946100136c8	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 42507397)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56af-8db9-73c0-f47feebd863e	00030000-56af-8db9-7edd-7c7b90059ba0
00020000-56af-8db9-73c0-f47feebd863e	00030000-56af-8db9-e515-cdfba5740b45
00020000-56af-8db9-e97d-a93ba61c528b	00030000-56af-8db9-c785-cdb95672cfe5
00020000-56af-8db9-7bdb-bafa06fa1bc5	00030000-56af-8db9-c2d7-3074bf56c2e4
00020000-56af-8db9-7bdb-bafa06fa1bc5	00030000-56af-8db9-ed16-eb5fbbcb1bae
00020000-56af-8db9-7bdb-bafa06fa1bc5	00030000-56af-8db9-2069-a28461fd9044
00020000-56af-8db9-7bdb-bafa06fa1bc5	00030000-56af-8db9-31e0-6dd1215dd4a8
00020000-56af-8db9-7bdb-bafa06fa1bc5	00030000-56af-8db9-01d0-8287d584ea2f
00020000-56af-8db9-7bdb-bafa06fa1bc5	00030000-56af-8db9-86d2-e42e4138ffe6
00020000-56af-8db9-7bdb-bafa06fa1bc5	00030000-56af-8db9-03c6-080d511047eb
00020000-56af-8db9-7bdb-bafa06fa1bc5	00030000-56af-8db9-7119-f32f210e06cb
00020000-56af-8db9-7bdb-bafa06fa1bc5	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8db9-7bdb-bafa06fa1bc5	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-7bdb-bafa06fa1bc5	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-7bdb-bafa06fa1bc5	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8db9-3f9f-5b87f5c9f37a	00030000-56af-8db9-03c6-080d511047eb
00020000-56af-8db9-3f9f-5b87f5c9f37a	00030000-56af-8db9-7119-f32f210e06cb
00020000-56af-8db9-3f9f-5b87f5c9f37a	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8db9-3f9f-5b87f5c9f37a	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-3f9f-5b87f5c9f37a	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8db9-3f9f-5b87f5c9f37a	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-4d5e-1eeb194b8dc9	00030000-56af-8db9-cef8-0fcad261741d
00020000-56af-8db9-4d5e-1eeb194b8dc9	00030000-56af-8db9-26de-fc069c1e3845
00020000-56af-8db9-4d5e-1eeb194b8dc9	00030000-56af-8db9-b10f-9be1866d9cd9
00020000-56af-8db9-4d5e-1eeb194b8dc9	00030000-56af-8db9-d310-1a7194ddce4a
00020000-56af-8db9-4d5e-1eeb194b8dc9	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-4d5e-1eeb194b8dc9	00030000-56af-8db9-31e0-6dd1215dd4a8
00020000-56af-8db9-4d5e-1eeb194b8dc9	00030000-56af-8db9-f1b0-f26b5df62af3
00020000-56af-8db9-f78e-6fefbc610929	00030000-56af-8db9-cef8-0fcad261741d
00020000-56af-8db9-f78e-6fefbc610929	00030000-56af-8db9-b10f-9be1866d9cd9
00020000-56af-8db9-f78e-6fefbc610929	00030000-56af-8db9-f1b0-f26b5df62af3
00020000-56af-8db9-746f-a9303ca58d2c	00030000-56af-8db9-31e0-6dd1215dd4a8
00020000-56af-8db9-746f-a9303ca58d2c	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-746f-a9303ca58d2c	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8db9-746f-a9303ca58d2c	00030000-56af-8db9-2069-a28461fd9044
00020000-56af-8db9-746f-a9303ca58d2c	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8db9-746f-a9303ca58d2c	00030000-56af-8db9-86d2-e42e4138ffe6
00020000-56af-8db9-746f-a9303ca58d2c	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-746f-a9303ca58d2c	00030000-56af-8db9-01d0-8287d584ea2f
00020000-56af-8db9-1962-c0e784d1d55e	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-1962-c0e784d1d55e	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8db9-1962-c0e784d1d55e	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8db9-1962-c0e784d1d55e	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-8767-94760322fee7	00030000-56af-8db9-31e0-6dd1215dd4a8
00020000-56af-8db9-8767-94760322fee7	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-8767-94760322fee7	00030000-56af-8db9-b10f-9be1866d9cd9
00020000-56af-8db9-8767-94760322fee7	00030000-56af-8db9-d310-1a7194ddce4a
00020000-56af-8db9-8767-94760322fee7	00030000-56af-8db9-e256-61ee14be05e6
00020000-56af-8db9-8767-94760322fee7	00030000-56af-8db9-b2c0-418747b5cea8
00020000-56af-8db9-8767-94760322fee7	00030000-56af-8db9-0d1e-22ad27a90872
00020000-56af-8db9-8767-94760322fee7	00030000-56af-8db9-7190-b7e1f1e618f8
00020000-56af-8db9-8767-94760322fee7	00030000-56af-8db9-eac0-9e5d98b6cd60
00020000-56af-8db9-8767-94760322fee7	00030000-56af-8db9-03d6-b92578b6a0f1
00020000-56af-8db9-8767-94760322fee7	00030000-56af-8db9-c785-cdb95672cfe5
00020000-56af-8db9-8767-94760322fee7	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-07a3-075ecd9f88cf	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-07a3-075ecd9f88cf	00030000-56af-8db9-b10f-9be1866d9cd9
00020000-56af-8db9-07a3-075ecd9f88cf	00030000-56af-8db9-e256-61ee14be05e6
00020000-56af-8db9-07a3-075ecd9f88cf	00030000-56af-8db9-0d1e-22ad27a90872
00020000-56af-8db9-07a3-075ecd9f88cf	00030000-56af-8db9-eac0-9e5d98b6cd60
00020000-56af-8db9-07a3-075ecd9f88cf	00030000-56af-8db9-c785-cdb95672cfe5
00020000-56af-8db9-07a3-075ecd9f88cf	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-eac0-9e5d98b6cd60
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-0d1e-22ad27a90872
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-e256-61ee14be05e6
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-4fcd-1f8f06567121
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-367d-2b003ddbe6da
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-9b69-399436e21677
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-03d6-b92578b6a0f1
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-7190-b7e1f1e618f8
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-01d0-8287d584ea2f
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-b2c0-418747b5cea8
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-471c-fe28229c6924
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-2069-a28461fd9044
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-86d2-e42e4138ffe6
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-01c2-75a2d19a66cb
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-822f-730b62060771
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-c785-cdb95672cfe5
00020000-56af-8db9-cc22-985b4f37d1cf	00030000-56af-8db9-dae1-53cbf3447010
00020000-56af-8db9-a1e6-14f6aa1fea93	00030000-56af-8db9-eac0-9e5d98b6cd60
00020000-56af-8db9-a1e6-14f6aa1fea93	00030000-56af-8db9-0d1e-22ad27a90872
00020000-56af-8db9-a1e6-14f6aa1fea93	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-a1e6-14f6aa1fea93	00030000-56af-8db9-e256-61ee14be05e6
00020000-56af-8db9-a1e6-14f6aa1fea93	00030000-56af-8db9-4fcd-1f8f06567121
00020000-56af-8db9-a1e6-14f6aa1fea93	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8db9-a1e6-14f6aa1fea93	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8db9-a1e6-14f6aa1fea93	00030000-56af-8db9-367d-2b003ddbe6da
00020000-56af-8db9-a1e6-14f6aa1fea93	00030000-56af-8db9-9b69-399436e21677
00020000-56af-8db9-a1e6-14f6aa1fea93	00030000-56af-8db9-c785-cdb95672cfe5
00020000-56af-8db9-a1e6-14f6aa1fea93	00030000-56af-8db9-dae1-53cbf3447010
00020000-56af-8db9-8975-842088fbd34d	00030000-56af-8db9-dae1-53cbf3447010
00020000-56af-8db9-8975-842088fbd34d	00030000-56af-8db9-11b6-765d2b85fa37
00020000-56af-8db9-73cf-f12d6dfa057e	00030000-56af-8db9-dae1-53cbf3447010
00020000-56af-8db9-1827-d3f7a77e6b4b	00030000-56af-8db9-55e2-cfaf225aaf49
00020000-56af-8db9-1827-d3f7a77e6b4b	00030000-56af-8db9-acd1-d84a3d323d8a
00020000-56af-8db9-b228-6a2ffe775f38	00030000-56af-8db9-55e2-cfaf225aaf49
00020000-56af-8db9-eddf-73922db91bb5	00030000-56af-8db9-c785-cdb95672cfe5
00020000-56af-8db9-eddf-73922db91bb5	00030000-56af-8db9-19f3-7adf181c3031
00020000-56af-8db9-79d2-6f824ec4c7dd	00030000-56af-8db9-c785-cdb95672cfe5
00020000-56af-8db9-a4d0-a4e26b90f0c7	00030000-56af-8db9-6592-18da27365b51
00020000-56af-8db9-a4d0-a4e26b90f0c7	00030000-56af-8db9-7946-2b310db0e9e8
00020000-56af-8db9-7ff1-4e6862f338ea	00030000-56af-8db9-6592-18da27365b51
00020000-56af-8db9-0fad-f347f968ce3d	00030000-56af-8db9-2e31-e7f16c409b30
00020000-56af-8db9-0fad-f347f968ce3d	00030000-56af-8db9-1102-a6c8cbf11019
00020000-56af-8db9-886f-e608cd4ec83d	00030000-56af-8db9-2e31-e7f16c409b30
00020000-56af-8db9-737f-a65741078c1b	00030000-56af-8db9-bd0f-f9e3f589ad15
00020000-56af-8db9-737f-a65741078c1b	00030000-56af-8db9-af30-f8d4d0502e2a
00020000-56af-8db9-7a0e-6c9a36c0b4aa	00030000-56af-8db9-bd0f-f9e3f589ad15
00020000-56af-8db9-9d03-ea72b2923192	00030000-56af-8db9-f53c-e34502f595ad
00020000-56af-8db9-9d03-ea72b2923192	00030000-56af-8db9-6daa-f085313047d0
00020000-56af-8db9-9d03-ea72b2923192	00030000-56af-8db9-4fcd-1f8f06567121
00020000-56af-8db9-9d03-ea72b2923192	00030000-56af-8db9-0d1e-22ad27a90872
00020000-56af-8db9-9d03-ea72b2923192	00030000-56af-8db9-7190-b7e1f1e618f8
00020000-56af-8db9-9d03-ea72b2923192	00030000-56af-8db9-c785-cdb95672cfe5
00020000-56af-8db9-ec35-12576754f903	00030000-56af-8db9-f53c-e34502f595ad
00020000-56af-8db9-ec35-12576754f903	00030000-56af-8db9-4fcd-1f8f06567121
00020000-56af-8db9-ec35-12576754f903	00030000-56af-8db9-0d1e-22ad27a90872
00020000-56af-8db9-113a-78d5ab79964b	00030000-56af-8db9-b79d-2ac231295e0b
00020000-56af-8db9-113a-78d5ab79964b	00030000-56af-8db9-4d52-09d7a133e993
00020000-56af-8db9-47c5-9f0548bdec2d	00030000-56af-8db9-b79d-2ac231295e0b
00020000-56af-8db9-801e-4feadf097584	00030000-56af-8db9-734c-f10b035d12c9
00020000-56af-8db9-801e-4feadf097584	00030000-56af-8db9-f1b0-f26b5df62af3
00020000-56af-8db9-801e-4feadf097584	00030000-56af-8db9-cef8-0fcad261741d
00020000-56af-8db9-801e-4feadf097584	00030000-56af-8db9-2069-a28461fd9044
00020000-56af-8db9-801e-4feadf097584	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8db9-801e-4feadf097584	00030000-56af-8db9-01d0-8287d584ea2f
00020000-56af-8db9-801e-4feadf097584	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-801e-4feadf097584	00030000-56af-8db9-86d2-e42e4138ffe6
00020000-56af-8db9-801e-4feadf097584	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8db9-00c6-80a2e6b10679	00030000-56af-8db9-f1b0-f26b5df62af3
00020000-56af-8db9-00c6-80a2e6b10679	00030000-56af-8db9-cef8-0fcad261741d
00020000-56af-8db9-00c6-80a2e6b10679	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8db9-00c6-80a2e6b10679	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-00c6-80a2e6b10679	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8db9-0d1d-6462c984083e	00030000-56af-8db9-61c0-088550d14bca
00020000-56af-8db9-0d1d-6462c984083e	00030000-56af-8db9-03cd-592c4668657a
00020000-56af-8db9-951d-27127735d826	00030000-56af-8db9-61c0-088550d14bca
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-41f6-6ce9db092bea
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-35b9-035d1b54fac8
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-1a6b-dbf2163972ac
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-e896-722d039a1792
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-b0d1-17598ee1b5d2
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-222c-95a1bb66603a
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-dfd0-2df2af4faeec
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-af48-f6f1298ea850
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-2a75-36d101b051f5
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-0659-7d8a28d203dd
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-e01f-811cbf27d067
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-1ccb-84290ec7bf3a
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-2896-c4b501e6456a
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-e13e-bae60c519801
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-92cc-430438b2bfcd
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-490c-14f388c6cb5c
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-8c3c-9ec488b9234c
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-111f-c0b4531a22f4
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-7766-861dea9bc3cc
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-00e9-3d5e89ded678
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-546b-4bd6a0771e87
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-5ddd-ebc3c19d071e
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-088a-94b86bdadd2c
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-6186-c582ebc07140
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-1ac2-d5547b4c5428
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-26da-126d7e29753f
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-43ba-066ca5baae52
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-49b4-27401ee0f5ec
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-9b69-399436e21677
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-11a6-fb181ed67591
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-b79d-2ac231295e0b
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-37e1-10143870835f
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-33b5-d7504dc2d943
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-fe9a-e2e6ffe6bde3
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-7c3b-5e0760735855
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-5321-ff8422eee31c
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-af57-2119dfbafd8f
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-c785-cdb95672cfe5
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-4fcd-1f8f06567121
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-2069-a28461fd9044
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-01d0-8287d584ea2f
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-86d2-e42e4138ffe6
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-c844-3c99357a8a2c
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-e56a-e474f8d7d5d1	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8db9-9728-74be64e9e41a	00030000-56af-8db9-1a6b-dbf2163972ac
00020000-56af-8db9-9728-74be64e9e41a	00030000-56af-8db9-b0d1-17598ee1b5d2
00020000-56af-8db9-9728-74be64e9e41a	00030000-56af-8db9-dfd0-2df2af4faeec
00020000-56af-8db9-9728-74be64e9e41a	00030000-56af-8db9-2a75-36d101b051f5
00020000-56af-8db9-9728-74be64e9e41a	00030000-56af-8db9-e01f-811cbf27d067
00020000-56af-8db9-9728-74be64e9e41a	00030000-56af-8db9-2896-c4b501e6456a
00020000-56af-8db9-9728-74be64e9e41a	00030000-56af-8db9-92cc-430438b2bfcd
00020000-56af-8db9-9728-74be64e9e41a	00030000-56af-8db9-8c3c-9ec488b9234c
00020000-56af-8db9-9728-74be64e9e41a	00030000-56af-8db9-7766-861dea9bc3cc
00020000-56af-8db9-9728-74be64e9e41a	00030000-56af-8db9-546b-4bd6a0771e87
00020000-56af-8db9-9728-74be64e9e41a	00030000-56af-8db9-49b4-27401ee0f5ec
00020000-56af-8db9-9728-74be64e9e41a	00030000-56af-8db9-43ba-066ca5baae52
00020000-56af-8db9-9728-74be64e9e41a	00030000-56af-8db9-11a6-fb181ed67591
00020000-56af-8db9-9728-74be64e9e41a	00030000-56af-8db9-c785-cdb95672cfe5
00020000-56af-8db9-9728-74be64e9e41a	00030000-56af-8db9-c844-3c99357a8a2c
00020000-56af-8db9-9728-74be64e9e41a	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8db9-9728-74be64e9e41a	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-9728-74be64e9e41a	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8db9-3c50-4780dc3b79a3	00030000-56af-8db9-37e1-10143870835f
00020000-56af-8db9-3c50-4780dc3b79a3	00030000-56af-8db9-7794-7da09d046021
00020000-56af-8db9-3c50-4780dc3b79a3	00030000-56af-8db9-7c3b-5e0760735855
00020000-56af-8db9-3c50-4780dc3b79a3	00030000-56af-8db9-bd64-313e8e48375d
00020000-56af-8db9-3c50-4780dc3b79a3	00030000-56af-8db9-c4af-23836edc8ca6
00020000-56af-8db9-3c50-4780dc3b79a3	00030000-56af-8db9-7119-f32f210e06cb
00020000-56af-8db9-3c50-4780dc3b79a3	00030000-56af-8db9-fe9a-e2e6ffe6bde3
00020000-56af-8db9-3c50-4780dc3b79a3	00030000-56af-8db9-101d-8ee64529c6d7
00020000-56af-8db9-3c50-4780dc3b79a3	00030000-56af-8db9-7558-9a11b8a94c2e
00020000-56af-8db9-3c50-4780dc3b79a3	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-3c50-4780dc3b79a3	00030000-56af-8db9-9b69-399436e21677
00020000-56af-8db9-3c50-4780dc3b79a3	00030000-56af-8db9-5321-ff8422eee31c
00020000-56af-8db9-3c50-4780dc3b79a3	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8db9-3c50-4780dc3b79a3	00030000-56af-8db9-2069-a28461fd9044
00020000-56af-8db9-3c50-4780dc3b79a3	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-3c50-4780dc3b79a3	00030000-56af-8db9-01d0-8287d584ea2f
00020000-56af-8db9-3c50-4780dc3b79a3	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8db9-3c50-4780dc3b79a3	00030000-56af-8db9-86d2-e42e4138ffe6
00020000-56af-8db9-b3cb-fe4b609b247e	00030000-56af-8db9-37e1-10143870835f
00020000-56af-8db9-b3cb-fe4b609b247e	00030000-56af-8db9-7c3b-5e0760735855
00020000-56af-8db9-b3cb-fe4b609b247e	00030000-56af-8db9-7119-f32f210e06cb
00020000-56af-8db9-b3cb-fe4b609b247e	00030000-56af-8db9-fe9a-e2e6ffe6bde3
00020000-56af-8db9-b3cb-fe4b609b247e	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-b3cb-fe4b609b247e	00030000-56af-8db9-9b69-399436e21677
00020000-56af-8db9-b3cb-fe4b609b247e	00030000-56af-8db9-5321-ff8422eee31c
00020000-56af-8db9-b3cb-fe4b609b247e	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8db9-b3cb-fe4b609b247e	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-b3cb-fe4b609b247e	00030000-56af-8db9-01d0-8287d584ea2f
00020000-56af-8db9-b3cb-fe4b609b247e	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8db9-d865-cc9691c09227	00030000-56af-8db9-7c3b-5e0760735855
00020000-56af-8db9-d865-cc9691c09227	00030000-56af-8db9-bd64-313e8e48375d
00020000-56af-8db9-d865-cc9691c09227	00030000-56af-8db9-fe9a-e2e6ffe6bde3
00020000-56af-8db9-d865-cc9691c09227	00030000-56af-8db9-101d-8ee64529c6d7
00020000-56af-8db9-d865-cc9691c09227	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-d865-cc9691c09227	00030000-56af-8db9-5321-ff8422eee31c
00020000-56af-8db9-d865-cc9691c09227	00030000-56af-8db9-37e1-10143870835f
00020000-56af-8db9-d865-cc9691c09227	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-572e-98d47e1f4dae	00030000-56af-8db9-7c3b-5e0760735855
00020000-56af-8db9-572e-98d47e1f4dae	00030000-56af-8db9-bd64-313e8e48375d
00020000-56af-8db9-572e-98d47e1f4dae	00030000-56af-8db9-c4af-23836edc8ca6
00020000-56af-8db9-572e-98d47e1f4dae	00030000-56af-8db9-fe9a-e2e6ffe6bde3
00020000-56af-8db9-572e-98d47e1f4dae	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-572e-98d47e1f4dae	00030000-56af-8db9-b10f-9be1866d9cd9
00020000-56af-8db9-572e-98d47e1f4dae	00030000-56af-8db9-d310-1a7194ddce4a
00020000-56af-8db9-572e-98d47e1f4dae	00030000-56af-8db9-af57-2119dfbafd8f
00020000-56af-8db9-572e-98d47e1f4dae	00030000-56af-8db9-4362-f45e43add323
00020000-56af-8db9-572e-98d47e1f4dae	00030000-56af-8db9-4fcd-1f8f06567121
00020000-56af-8db9-572e-98d47e1f4dae	00030000-56af-8db9-9b69-399436e21677
00020000-56af-8db9-572e-98d47e1f4dae	00030000-56af-8db9-33b5-d7504dc2d943
00020000-56af-8db9-572e-98d47e1f4dae	00030000-56af-8db9-6be8-73a40cb1a7c4
00020000-56af-8db9-572e-98d47e1f4dae	00030000-56af-8db9-5321-ff8422eee31c
00020000-56af-8db9-572e-98d47e1f4dae	00030000-56af-8db9-e256-61ee14be05e6
00020000-56af-8db9-572e-98d47e1f4dae	00030000-56af-8db9-37e1-10143870835f
00020000-56af-8db9-572e-98d47e1f4dae	00030000-56af-8db9-cef8-0fcad261741d
00020000-56af-8db9-95ad-25a2b433f19d	00030000-56af-8db9-7c3b-5e0760735855
00020000-56af-8db9-95ad-25a2b433f19d	00030000-56af-8db9-fe9a-e2e6ffe6bde3
00020000-56af-8db9-95ad-25a2b433f19d	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-95ad-25a2b433f19d	00030000-56af-8db9-b10f-9be1866d9cd9
00020000-56af-8db9-95ad-25a2b433f19d	00030000-56af-8db9-af57-2119dfbafd8f
00020000-56af-8db9-95ad-25a2b433f19d	00030000-56af-8db9-4fcd-1f8f06567121
00020000-56af-8db9-95ad-25a2b433f19d	00030000-56af-8db9-9b69-399436e21677
00020000-56af-8db9-95ad-25a2b433f19d	00030000-56af-8db9-33b5-d7504dc2d943
00020000-56af-8db9-95ad-25a2b433f19d	00030000-56af-8db9-5321-ff8422eee31c
00020000-56af-8db9-95ad-25a2b433f19d	00030000-56af-8db9-e256-61ee14be05e6
00020000-56af-8db9-95ad-25a2b433f19d	00030000-56af-8db9-37e1-10143870835f
00020000-56af-8db9-95ad-25a2b433f19d	00030000-56af-8db9-cef8-0fcad261741d
00020000-56af-8db9-b430-df92f1c00334	00030000-56af-8db9-33b5-d7504dc2d943
00020000-56af-8db9-b430-df92f1c00334	00030000-56af-8db9-37e1-10143870835f
00020000-56af-8db9-b430-df92f1c00334	00030000-56af-8db9-fe9a-e2e6ffe6bde3
00020000-56af-8db9-b430-df92f1c00334	00030000-56af-8db9-af57-2119dfbafd8f
00020000-56af-8db9-b430-df92f1c00334	00030000-56af-8db9-9b69-399436e21677
00020000-56af-8db9-b430-df92f1c00334	00030000-56af-8db9-5321-ff8422eee31c
00020000-56af-8db9-b430-df92f1c00334	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-1a06-c29dd9704457	00030000-56af-8db9-33b5-d7504dc2d943
00020000-56af-8db9-1a06-c29dd9704457	00030000-56af-8db9-6be8-73a40cb1a7c4
00020000-56af-8db9-1a06-c29dd9704457	00030000-56af-8db9-37e1-10143870835f
00020000-56af-8db9-1a06-c29dd9704457	00030000-56af-8db9-4fcd-1f8f06567121
00020000-56af-8db9-2e9c-6cf9ae0e8099	00030000-56af-8db9-33b5-d7504dc2d943
00020000-56af-8db9-2e9c-6cf9ae0e8099	00030000-56af-8db9-37e1-10143870835f
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-bd0f-f9e3f589ad15
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-7c3b-5e0760735855
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-bd64-313e8e48375d
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-c4af-23836edc8ca6
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-03c6-080d511047eb
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-c2d7-3074bf56c2e4
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-7119-f32f210e06cb
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-ed16-eb5fbbcb1bae
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-2069-a28461fd9044
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-43ba-066ca5baae52
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-6186-c582ebc07140
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-c785-cdb95672cfe5
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-fe9a-e2e6ffe6bde3
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-101d-8ee64529c6d7
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-7558-9a11b8a94c2e
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-c844-3c99357a8a2c
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-26da-126d7e29753f
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-367d-2b003ddbe6da
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-f1b0-f26b5df62af3
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-31e0-6dd1215dd4a8
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-b10f-9be1866d9cd9
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-d310-1a7194ddce4a
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-af57-2119dfbafd8f
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-4362-f45e43add323
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-4fcd-1f8f06567121
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-55e2-cfaf225aaf49
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-11a6-fb181ed67591
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-1ac2-d5547b4c5428
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-0d1e-22ad27a90872
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-49b4-27401ee0f5ec
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-088a-94b86bdadd2c
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-9b69-399436e21677
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-41f6-6ce9db092bea
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-1a6b-dbf2163972ac
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-35b9-035d1b54fac8
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-e896-722d039a1792
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-b0d1-17598ee1b5d2
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-222c-95a1bb66603a
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-dfd0-2df2af4faeec
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-af48-f6f1298ea850
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-2a75-36d101b051f5
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-0659-7d8a28d203dd
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-e01f-811cbf27d067
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-1ccb-84290ec7bf3a
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-2896-c4b501e6456a
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-e13e-bae60c519801
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-92cc-430438b2bfcd
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-490c-14f388c6cb5c
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-8c3c-9ec488b9234c
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-111f-c0b4531a22f4
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-7766-861dea9bc3cc
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-00e9-3d5e89ded678
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-546b-4bd6a0771e87
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-5ddd-ebc3c19d071e
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-f53c-e34502f595ad
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-33b5-d7504dc2d943
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-6be8-73a40cb1a7c4
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-eac0-9e5d98b6cd60
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-5321-ff8422eee31c
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-dae1-53cbf3447010
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-61c0-088550d14bca
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-e256-61ee14be05e6
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-37e1-10143870835f
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-7794-7da09d046021
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-b79d-2ac231295e0b
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-86d2-e42e4138ffe6
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-01d0-8287d584ea2f
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-cef8-0fcad261741d
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-2e31-e7f16c409b30
00020000-56af-8db9-f850-9f7e14566ce7	00030000-56af-8db9-6592-18da27365b51
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-bd0f-f9e3f589ad15
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-7c3b-5e0760735855
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-03c6-080d511047eb
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-c2d7-3074bf56c2e4
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-7119-f32f210e06cb
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-ed16-eb5fbbcb1bae
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-2069-a28461fd9044
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-c785-cdb95672cfe5
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-fe9a-e2e6ffe6bde3
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-367d-2b003ddbe6da
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-f1b0-f26b5df62af3
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-31e0-6dd1215dd4a8
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-b10f-9be1866d9cd9
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-4fcd-1f8f06567121
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-55e2-cfaf225aaf49
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-0d1e-22ad27a90872
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-9b69-399436e21677
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-f53c-e34502f595ad
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-eac0-9e5d98b6cd60
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-5321-ff8422eee31c
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-dae1-53cbf3447010
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-61c0-088550d14bca
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-e256-61ee14be05e6
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-37e1-10143870835f
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-b79d-2ac231295e0b
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-86d2-e42e4138ffe6
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-01d0-8287d584ea2f
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-cef8-0fcad261741d
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-2e31-e7f16c409b30
00020000-56af-8db9-badb-e1c7054451d5	00030000-56af-8db9-6592-18da27365b51
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-bd0f-f9e3f589ad15
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-7c3b-5e0760735855
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-bd64-313e8e48375d
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-c4af-23836edc8ca6
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-03c6-080d511047eb
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-c2d7-3074bf56c2e4
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-7119-f32f210e06cb
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-ed16-eb5fbbcb1bae
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-2069-a28461fd9044
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-c785-cdb95672cfe5
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-fe9a-e2e6ffe6bde3
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-101d-8ee64529c6d7
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-7558-9a11b8a94c2e
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-367d-2b003ddbe6da
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-f1b0-f26b5df62af3
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-31e0-6dd1215dd4a8
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-b10f-9be1866d9cd9
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-4fcd-1f8f06567121
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-55e2-cfaf225aaf49
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-0d1e-22ad27a90872
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-9b69-399436e21677
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-f53c-e34502f595ad
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-eac0-9e5d98b6cd60
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-5321-ff8422eee31c
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-dae1-53cbf3447010
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-61c0-088550d14bca
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-e256-61ee14be05e6
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-37e1-10143870835f
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-7794-7da09d046021
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-b79d-2ac231295e0b
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-86d2-e42e4138ffe6
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-01d0-8287d584ea2f
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-cef8-0fcad261741d
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-2e31-e7f16c409b30
00020000-56af-8db9-c141-cfc99a4a5d39	00030000-56af-8db9-6592-18da27365b51
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-7c3b-5e0760735855
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-bd64-313e8e48375d
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-c4af-23836edc8ca6
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-03c6-080d511047eb
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-c2d7-3074bf56c2e4
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-7119-f32f210e06cb
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-ed16-eb5fbbcb1bae
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-2069-a28461fd9044
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-43ba-066ca5baae52
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-6186-c582ebc07140
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-c785-cdb95672cfe5
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-fe9a-e2e6ffe6bde3
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-101d-8ee64529c6d7
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-7558-9a11b8a94c2e
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-c844-3c99357a8a2c
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-26da-126d7e29753f
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-367d-2b003ddbe6da
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-01c2-75a2d19a66cb
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-f1b0-f26b5df62af3
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-31e0-6dd1215dd4a8
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-b10f-9be1866d9cd9
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-d310-1a7194ddce4a
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-af57-2119dfbafd8f
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-4362-f45e43add323
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-4fcd-1f8f06567121
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-471c-fe28229c6924
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-55e2-cfaf225aaf49
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-11a6-fb181ed67591
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-1ac2-d5547b4c5428
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-0d1e-22ad27a90872
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-7190-b7e1f1e618f8
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-49b4-27401ee0f5ec
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-088a-94b86bdadd2c
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-9b69-399436e21677
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-822f-730b62060771
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-41f6-6ce9db092bea
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-1a6b-dbf2163972ac
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-35b9-035d1b54fac8
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-e896-722d039a1792
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-b0d1-17598ee1b5d2
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-222c-95a1bb66603a
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-dfd0-2df2af4faeec
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-af48-f6f1298ea850
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-2a75-36d101b051f5
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-0659-7d8a28d203dd
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-e01f-811cbf27d067
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-1ccb-84290ec7bf3a
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-2896-c4b501e6456a
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-e13e-bae60c519801
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-92cc-430438b2bfcd
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-490c-14f388c6cb5c
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-8c3c-9ec488b9234c
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-111f-c0b4531a22f4
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-7766-861dea9bc3cc
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-00e9-3d5e89ded678
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-546b-4bd6a0771e87
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-5ddd-ebc3c19d071e
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-f53c-e34502f595ad
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-33b5-d7504dc2d943
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-6be8-73a40cb1a7c4
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-eac0-9e5d98b6cd60
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-03d6-b92578b6a0f1
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-5321-ff8422eee31c
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-dae1-53cbf3447010
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-e256-61ee14be05e6
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-b2c0-418747b5cea8
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-37e1-10143870835f
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-7794-7da09d046021
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-b79d-2ac231295e0b
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-86d2-e42e4138ffe6
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-01d0-8287d584ea2f
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-cef8-0fcad261741d
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-26de-fc069c1e3845
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-2e31-e7f16c409b30
00020000-56af-8db9-e7e2-b856071d61de	00030000-56af-8db9-6592-18da27365b51
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-bd0f-f9e3f589ad15
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-7c3b-5e0760735855
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-bd64-313e8e48375d
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-c4af-23836edc8ca6
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-03c6-080d511047eb
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-c2d7-3074bf56c2e4
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-7119-f32f210e06cb
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-ed16-eb5fbbcb1bae
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-2069-a28461fd9044
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-c785-cdb95672cfe5
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-fe9a-e2e6ffe6bde3
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-101d-8ee64529c6d7
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-7558-9a11b8a94c2e
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-367d-2b003ddbe6da
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-01c2-75a2d19a66cb
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-f1b0-f26b5df62af3
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-31e0-6dd1215dd4a8
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-b10f-9be1866d9cd9
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-d310-1a7194ddce4a
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-af57-2119dfbafd8f
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-4fcd-1f8f06567121
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-471c-fe28229c6924
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-55e2-cfaf225aaf49
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-0d1e-22ad27a90872
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-7190-b7e1f1e618f8
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-9b69-399436e21677
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-822f-730b62060771
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-f53c-e34502f595ad
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-33b5-d7504dc2d943
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-eac0-9e5d98b6cd60
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-03d6-b92578b6a0f1
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-5321-ff8422eee31c
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-dae1-53cbf3447010
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-61c0-088550d14bca
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-e256-61ee14be05e6
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-b2c0-418747b5cea8
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-37e1-10143870835f
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-7794-7da09d046021
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-b79d-2ac231295e0b
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-86d2-e42e4138ffe6
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-01d0-8287d584ea2f
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-cef8-0fcad261741d
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-26de-fc069c1e3845
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-2e31-e7f16c409b30
00020000-56af-8db9-aaa7-fe4bf3a1fced	00030000-56af-8db9-6592-18da27365b51
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-bd0f-f9e3f589ad15
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-7c3b-5e0760735855
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-bd64-313e8e48375d
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-03c6-080d511047eb
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-7119-f32f210e06cb
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-c785-cdb95672cfe5
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-fe9a-e2e6ffe6bde3
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-101d-8ee64529c6d7
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-367d-2b003ddbe6da
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-f1b0-f26b5df62af3
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-b10f-9be1866d9cd9
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-af57-2119dfbafd8f
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-4fcd-1f8f06567121
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-55e2-cfaf225aaf49
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-0d1e-22ad27a90872
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-9b69-399436e21677
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-f53c-e34502f595ad
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-33b5-d7504dc2d943
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-eac0-9e5d98b6cd60
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-5321-ff8422eee31c
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-dae1-53cbf3447010
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-61c0-088550d14bca
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-e256-61ee14be05e6
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-37e1-10143870835f
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-b79d-2ac231295e0b
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-cef8-0fcad261741d
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-2e31-e7f16c409b30
00020000-56af-8db9-5c78-cc0ee8042ee8	00030000-56af-8db9-6592-18da27365b51
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-bd0f-f9e3f589ad15
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-7c3b-5e0760735855
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-bd64-313e8e48375d
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-c4af-23836edc8ca6
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-7119-f32f210e06cb
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-2069-a28461fd9044
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-43ba-066ca5baae52
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-6186-c582ebc07140
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-c785-cdb95672cfe5
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-fe9a-e2e6ffe6bde3
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-c844-3c99357a8a2c
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-26da-126d7e29753f
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-367d-2b003ddbe6da
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-01c2-75a2d19a66cb
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-f1b0-f26b5df62af3
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-734c-f10b035d12c9
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-31e0-6dd1215dd4a8
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-b10f-9be1866d9cd9
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-d310-1a7194ddce4a
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-af57-2119dfbafd8f
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-4362-f45e43add323
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-4fcd-1f8f06567121
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-471c-fe28229c6924
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-55e2-cfaf225aaf49
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-11a6-fb181ed67591
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-1ac2-d5547b4c5428
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-0d1e-22ad27a90872
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-7190-b7e1f1e618f8
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-49b4-27401ee0f5ec
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-088a-94b86bdadd2c
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-9b69-399436e21677
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-822f-730b62060771
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-41f6-6ce9db092bea
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-1a6b-dbf2163972ac
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-35b9-035d1b54fac8
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-e896-722d039a1792
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-b0d1-17598ee1b5d2
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-222c-95a1bb66603a
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-dfd0-2df2af4faeec
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-af48-f6f1298ea850
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-2a75-36d101b051f5
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-0659-7d8a28d203dd
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-e01f-811cbf27d067
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-1ccb-84290ec7bf3a
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-2896-c4b501e6456a
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-e13e-bae60c519801
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-92cc-430438b2bfcd
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-490c-14f388c6cb5c
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-8c3c-9ec488b9234c
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-111f-c0b4531a22f4
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-7766-861dea9bc3cc
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-00e9-3d5e89ded678
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-546b-4bd6a0771e87
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-5ddd-ebc3c19d071e
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-f53c-e34502f595ad
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-33b5-d7504dc2d943
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-6be8-73a40cb1a7c4
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-eac0-9e5d98b6cd60
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-03d6-b92578b6a0f1
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-5321-ff8422eee31c
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-dae1-53cbf3447010
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-61c0-088550d14bca
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-e256-61ee14be05e6
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-b2c0-418747b5cea8
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-37e1-10143870835f
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-b79d-2ac231295e0b
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-4d52-09d7a133e993
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-86d2-e42e4138ffe6
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-01d0-8287d584ea2f
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-cef8-0fcad261741d
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-26de-fc069c1e3845
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-2e31-e7f16c409b30
00020000-56af-8db9-af43-d8efea596efd	00030000-56af-8db9-6592-18da27365b51
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-e515-cdfba5740b45
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-7edd-7c7b90059ba0
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-bd0f-f9e3f589ad15
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-af30-f8d4d0502e2a
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-7c3b-5e0760735855
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-c4af-23836edc8ca6
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-bd64-313e8e48375d
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-ec40-062bf3839664
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-5a5a-f09d22fe2b4a
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-8f62-58a2b2f32097
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-4f2b-66bb6e4ed54c
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-03c6-080d511047eb
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-c2d7-3074bf56c2e4
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-7119-f32f210e06cb
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-ed16-eb5fbbcb1bae
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-2069-a28461fd9044
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-8909-4797db63d7b6
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-ce09-51f005a74e59
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-9fd6-e3de58b0563a
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-24ce-b22cb918419a
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-f113-6c23658af295
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-c183-a219794b5e10
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-edde-958d503adea1
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-919d-e0d7fa8c0300
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-860f-476b87dfe6f4
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-43ba-066ca5baae52
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-6186-c582ebc07140
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-c785-cdb95672cfe5
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-19f3-7adf181c3031
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-812b-f0504ee25727
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-d866-c7b7ef30295d
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-fe9a-e2e6ffe6bde3
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-7558-9a11b8a94c2e
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-101d-8ee64529c6d7
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-73bd-01686c13d024
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-cd04-e857c8897382
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-56eb-fe89f29b69a8
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-c844-3c99357a8a2c
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-26da-126d7e29753f
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-367d-2b003ddbe6da
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-01c2-75a2d19a66cb
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-aa46-aaa755fd6598
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-5fd2-af1401cad4e4
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-999c-6efb5d75f7ab
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-a7cc-764ed90b2276
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-8781-2dbc82aececa
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-98f7-1c3741978b6f
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-8cf5-47ef51371c73
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-cd2d-72ae476dc4c3
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-d61e-db862673bee8
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-bb81-0c3787c2dc34
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-7e43-953fcca8ff8d
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-81ce-2ab8bef066a3
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-59d7-9b2eb8baa014
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-02ca-6fb07d95be6a
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-6d59-23f27a9240d6
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-f1b0-f26b5df62af3
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-734c-f10b035d12c9
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-31e0-6dd1215dd4a8
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-b10f-9be1866d9cd9
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-d310-1a7194ddce4a
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-ad47-193baa62a96a
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-d457-493c351a116d
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-d732-2f02383f5bd3
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-3cba-3d4d9efe5460
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-af57-2119dfbafd8f
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-4362-f45e43add323
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-4fcd-1f8f06567121
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-471c-fe28229c6924
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-55e2-cfaf225aaf49
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-11a6-fb181ed67591
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-1ac2-d5547b4c5428
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-6f64-bcfe09590953
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-7e3a-e509730eca2a
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-acd1-d84a3d323d8a
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-0d1e-22ad27a90872
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-7190-b7e1f1e618f8
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-4e0f-62a653704fd2
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-5e0b-354aa23e259e
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-2cd7-e142839ec964
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-e491-6987bd511ce3
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-ef1c-223fe57dfcb0
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-f4ed-103aee9b341b
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-49b4-27401ee0f5ec
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-088a-94b86bdadd2c
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-9b69-399436e21677
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-822f-730b62060771
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-41f6-6ce9db092bea
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-1a6b-dbf2163972ac
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-35b9-035d1b54fac8
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-e896-722d039a1792
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-b0d1-17598ee1b5d2
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-222c-95a1bb66603a
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-dfd0-2df2af4faeec
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-af48-f6f1298ea850
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-2a75-36d101b051f5
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-0659-7d8a28d203dd
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-e01f-811cbf27d067
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-1ccb-84290ec7bf3a
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-2896-c4b501e6456a
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-e13e-bae60c519801
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-92cc-430438b2bfcd
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-490c-14f388c6cb5c
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-8c3c-9ec488b9234c
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-111f-c0b4531a22f4
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-7766-861dea9bc3cc
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-00e9-3d5e89ded678
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-546b-4bd6a0771e87
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-5ddd-ebc3c19d071e
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-f53c-e34502f595ad
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-6daa-f085313047d0
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-7f18-cd45d5bfbad2
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-83b8-8224c290f4e4
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-8d4a-c5b0c52c2143
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-a0fa-b552ee98271c
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-1e01-e771bfb0c5d6
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-1423-8ab75184b7c1
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-a874-6a65c33d2968
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-4ac7-c1baa4572bc7
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-a214-9de2614c627e
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-358c-aa2db113d7f5
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-54bf-9e31ae965dfd
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-c67c-2f59b2cac31b
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-37ca-4581be140600
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-d83a-a80a649cd499
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-864b-eaf9e5ebc9f8
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-64a4-a1d77fcff705
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-c9a6-f6ba59d6b1c0
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-1b13-ab11c6c9d3c1
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-bcaa-7ea279761fb7
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-c68b-d33b5a523119
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-593a-6bc68323696b
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-33b5-d7504dc2d943
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-6be8-73a40cb1a7c4
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-eac0-9e5d98b6cd60
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-03d6-b92578b6a0f1
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-e47f-6199054d93be
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-2d56-751daed8883d
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-a6ce-6f4ec512bdbb
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-5321-ff8422eee31c
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-166e-74117a61d00d
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-dae1-53cbf3447010
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-11b6-765d2b85fa37
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-3aaa-fcf460914a0a
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-b6df-89bcf6d5f915
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-61c0-088550d14bca
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-03cd-592c4668657a
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-e256-61ee14be05e6
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-b2c0-418747b5cea8
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-37e1-10143870835f
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-7794-7da09d046021
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-72c8-770c2a7a77aa
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-e1ba-24e5b9848916
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-579e-c2f2bea5f74f
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-eedd-edf436df8d9b
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-b79d-2ac231295e0b
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-4d52-09d7a133e993
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-bc25-e10e46add483
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-96c8-13b4a06db3d9
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-86d2-e42e4138ffe6
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-01d0-8287d584ea2f
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-cef8-0fcad261741d
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-26de-fc069c1e3845
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-2e31-e7f16c409b30
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-1102-a6c8cbf11019
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-6592-18da27365b51
00020000-56af-8dbb-8615-1fe1ec6a8f9d	00030000-56af-8db9-7946-2b310db0e9e8
00020000-56af-8dbb-de97-14a1385104bf	00030000-56af-8db9-bf30-a4469e3ac25c
00020000-56af-8dbb-3c00-bf596d6ee041	00030000-56af-8db9-86d2-e42e4138ffe6
00020000-56af-8dbb-d22a-a9d74b77763c	00030000-56af-8db9-7794-7da09d046021
00020000-56af-8dbb-aaff-04e52fae50c4	00030000-56af-8db9-37e1-10143870835f
00020000-56af-8dbb-2874-f678ba64887b	00030000-56af-8db9-98f7-1c3741978b6f
00020000-56af-8dbb-4e24-4133ef096661	00030000-56af-8db9-8cf5-47ef51371c73
00020000-56af-8dbb-5b95-1761d17858f1	00030000-56af-8db9-cd2d-72ae476dc4c3
00020000-56af-8dbb-7151-3e8ce2599e0a	00030000-56af-8db9-8781-2dbc82aececa
00020000-56af-8dbb-97da-b114f155f099	00030000-56af-8db9-999c-6efb5d75f7ab
00020000-56af-8dbb-7754-951fadd2dd73	00030000-56af-8db9-a7cc-764ed90b2276
00020000-56af-8dbb-640a-df5b02ad2eba	00030000-56af-8db9-dd9b-f1aebcf198de
00020000-56af-8dbb-4a90-6f1ca3b78c9d	00030000-56af-8db9-01d0-8287d584ea2f
00020000-56af-8dbb-10ce-5eac90d02eb0	00030000-56af-8db9-1274-809e3845eccd
00020000-56af-8dbb-d788-d2695d9f1a2d	00030000-56af-8db9-31e0-6dd1215dd4a8
00020000-56af-8dbb-13b7-84435cbf347a	00030000-56af-8db9-d310-1a7194ddce4a
00020000-56af-8dbb-f5dc-438f7f5c018a	00030000-56af-8db9-b10f-9be1866d9cd9
00020000-56af-8dbb-eb9b-7e791079e10c	00030000-56af-8db9-2069-a28461fd9044
00020000-56af-8dbb-9a6d-2885143e8948	00030000-56af-8db9-2030-5946100136c8
00020000-56af-8dbb-e045-4f578c719670	00030000-56af-8db9-4fcd-1f8f06567121
00020000-56af-8dbb-e045-4f578c719670	00030000-56af-8db9-471c-fe28229c6924
00020000-56af-8dbb-e045-4f578c719670	00030000-56af-8db9-37e1-10143870835f
00020000-56af-8dbb-eba8-658ee50ba47e	00030000-56af-8db9-e256-61ee14be05e6
00020000-56af-8dbb-5597-478b1f5e612a	00030000-56af-8db9-b2c0-418747b5cea8
00020000-56af-8dbb-e8be-29f90d328469	00030000-56af-8db9-593a-6bc68323696b
00020000-56af-8dbb-dd5c-437987a527eb	00030000-56af-8db9-eac0-9e5d98b6cd60
00020000-56af-8dbb-7784-ffb9270835f6	00030000-56af-8db9-03d6-b92578b6a0f1
00020000-56af-8dbb-6aad-46c44284774b	00030000-56af-8db9-0d1e-22ad27a90872
00020000-56af-8dbb-d1aa-4602dec1e782	00030000-56af-8db9-7190-b7e1f1e618f8
00020000-56af-8dbb-5995-35e652523ec1	00030000-56af-8db9-cef8-0fcad261741d
00020000-56af-8dbb-b368-d4f4ea81e87c	00030000-56af-8db9-26de-fc069c1e3845
00020000-56af-8dbb-c1a0-4964b4c3ee25	00030000-56af-8db9-af57-2119dfbafd8f
00020000-56af-8dbb-424d-7205bb25b54c	00030000-56af-8db9-4362-f45e43add323
00020000-56af-8dbb-8900-3a6d29266caf	00030000-56af-8db9-33b5-d7504dc2d943
00020000-56af-8dbb-d5ce-4571cbb38cb0	00030000-56af-8db9-6be8-73a40cb1a7c4
00020000-56af-8dbb-e6c0-b6988f865bb5	00030000-56af-8db9-7c3b-5e0760735855
00020000-56af-8dbb-dc10-a0c3e72eeffe	00030000-56af-8db9-bd64-313e8e48375d
00020000-56af-8dbb-27b1-844617b4ff1e	00030000-56af-8db9-c4af-23836edc8ca6
00020000-56af-8dbb-c96b-2875060dadce	00030000-56af-8db9-fe9a-e2e6ffe6bde3
00020000-56af-8dbb-c1b6-e3ddaaeb8284	00030000-56af-8db9-101d-8ee64529c6d7
00020000-56af-8dbb-acb4-c8657dec678d	00030000-56af-8db9-7558-9a11b8a94c2e
\.


--
-- TOC entry 3181 (class 0 OID 42507796)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 42507831)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 42507964)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56af-8dbb-b19d-a6e0a5c7be0a	00090000-56af-8dbb-a379-3c3f6c2edf4c	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56af-8dbb-8b06-78bc1db10220	00090000-56af-8dbb-27fc-0f2e4688677b	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56af-8dbb-b33d-eb63cf8e6a5d	00090000-56af-8dbb-f244-b061004b110f	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56af-8dbb-8d9b-579699dc525f	00090000-56af-8dbb-b9a0-9f766ab4b055	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 42507480)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56af-8dbb-acd4-da77d56e58b5	\N	00040000-56af-8db8-e85f-e04672eb7442	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-8dbb-f1a9-415576340d2c	\N	00040000-56af-8db8-e85f-e04672eb7442	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56af-8dbb-20a8-ee6cab3ae22d	\N	00040000-56af-8db8-e85f-e04672eb7442	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-8dbb-5b2f-9d30e4288446	\N	00040000-56af-8db8-e85f-e04672eb7442	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-8dbb-41a5-28b6469a0446	\N	00040000-56af-8db8-e85f-e04672eb7442	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-8dbb-84f9-62a90e684ad6	\N	00040000-56af-8db8-a2ca-969e1d9c79d2	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-8dbb-d267-e6b4b5f12c65	\N	00040000-56af-8db8-4794-8dbdb29d0d86	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-8dbb-71c6-c7f92506b8f4	\N	00040000-56af-8db8-7f27-1ceeafaaf7b2	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-8dbb-5a5b-9da25b88af38	\N	00040000-56af-8db8-b049-543182f31b58	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-8dbd-df9d-2266ec06aa7c	\N	00040000-56af-8db8-e85f-e04672eb7442	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 42507525)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56af-8db8-cf2b-ed562585ebfb	8341	Adlešiči
00050000-56af-8db8-7b64-185d6e96891d	5270	Ajdovščina
00050000-56af-8db8-1b57-28fa0a8bb492	6280	Ankaran/Ancarano
00050000-56af-8db8-1be3-663d58a9e5a8	9253	Apače
00050000-56af-8db8-6053-995388a5860b	8253	Artiče
00050000-56af-8db8-0366-d84124ddb369	4275	Begunje na Gorenjskem
00050000-56af-8db8-af03-9b0f9ca0fcba	1382	Begunje pri Cerknici
00050000-56af-8db8-9744-85cbcb4640ea	9231	Beltinci
00050000-56af-8db8-a219-afeac3386fda	2234	Benedikt
00050000-56af-8db8-82b6-6be275c640d1	2345	Bistrica ob Dravi
00050000-56af-8db8-e461-96214decc659	3256	Bistrica ob Sotli
00050000-56af-8db8-3d00-dc707d2569cc	8259	Bizeljsko
00050000-56af-8db8-2011-9f9b1089e4ea	1223	Blagovica
00050000-56af-8db8-3231-157a6d4a2f11	8283	Blanca
00050000-56af-8db8-c355-cfd08ebe0725	4260	Bled
00050000-56af-8db8-f4c8-71ef72c01642	4273	Blejska Dobrava
00050000-56af-8db8-33f2-8207cf501803	9265	Bodonci
00050000-56af-8db8-1ee7-08b0f655e583	9222	Bogojina
00050000-56af-8db8-408a-fda4c708a5b1	4263	Bohinjska Bela
00050000-56af-8db8-1363-8072ed779359	4264	Bohinjska Bistrica
00050000-56af-8db8-2efd-052ece9634de	4265	Bohinjsko jezero
00050000-56af-8db8-5186-ed254e7e282c	1353	Borovnica
00050000-56af-8db8-573a-f068fc3186ac	8294	Boštanj
00050000-56af-8db8-8ed7-80a0a1f431ce	5230	Bovec
00050000-56af-8db8-5c74-017fea900fe6	5295	Branik
00050000-56af-8db8-48c3-9b05fd4b8483	3314	Braslovče
00050000-56af-8db8-9958-2639753d2b95	5223	Breginj
00050000-56af-8db8-5e80-8aa43307d99c	8280	Brestanica
00050000-56af-8db8-782a-643db12a58e8	2354	Bresternica
00050000-56af-8db8-d474-b0a713182874	4243	Brezje
00050000-56af-8db8-9121-b24aa7f293bf	1351	Brezovica pri Ljubljani
00050000-56af-8db8-9627-7d3ee6d17f2f	8250	Brežice
00050000-56af-8db8-9b4a-6aad24d409b1	4210	Brnik - Aerodrom
00050000-56af-8db8-7da4-6743f0406b86	8321	Brusnice
00050000-56af-8db8-579a-5323642d5f32	3255	Buče
00050000-56af-8db8-bc9b-e32f6c50639d	8276	Bučka 
00050000-56af-8db8-aa07-03e10bd612a6	9261	Cankova
00050000-56af-8db8-5849-3d8e60dc92cb	3000	Celje 
00050000-56af-8db8-3b13-64414ee14f4f	3001	Celje - poštni predali
00050000-56af-8db8-d70e-62e07c789490	4207	Cerklje na Gorenjskem
00050000-56af-8db8-fe02-d72e2f8da594	8263	Cerklje ob Krki
00050000-56af-8db8-b4d6-a22e4a870226	1380	Cerknica
00050000-56af-8db8-6f57-c8e8240b7d91	5282	Cerkno
00050000-56af-8db8-0972-2024b5b328e0	2236	Cerkvenjak
00050000-56af-8db8-a1e3-f1268a0bce9e	2215	Ceršak
00050000-56af-8db8-6f40-e6424e6d5630	2326	Cirkovce
00050000-56af-8db8-ec4d-f174e567ee6a	2282	Cirkulane
00050000-56af-8db8-9b0e-028d6d187bed	5273	Col
00050000-56af-8db8-5c31-38a12e1c799c	8251	Čatež ob Savi
00050000-56af-8db8-7812-f6a5a902e266	1413	Čemšenik
00050000-56af-8db8-3b6c-a4a3b455ad92	5253	Čepovan
00050000-56af-8db8-2225-16e97c289d7d	9232	Črenšovci
00050000-56af-8db8-4f8a-070366a7ba27	2393	Črna na Koroškem
00050000-56af-8db8-39fa-2892397f9be6	6275	Črni Kal
00050000-56af-8db8-4840-6b64066931bc	5274	Črni Vrh nad Idrijo
00050000-56af-8db8-1aca-30b9bba00536	5262	Črniče
00050000-56af-8db8-10e3-c4f395b4ea97	8340	Črnomelj
00050000-56af-8db8-2f79-3f7db1b90588	6271	Dekani
00050000-56af-8db8-949b-fa30708ed3a7	5210	Deskle
00050000-56af-8db8-5a35-ce674079f7f3	2253	Destrnik
00050000-56af-8db8-293e-dfd17a303541	6215	Divača
00050000-56af-8db8-9607-cf4e5239ec63	1233	Dob
00050000-56af-8db8-a1cd-3878884037e5	3224	Dobje pri Planini
00050000-56af-8db8-9129-61a0db09ecdb	8257	Dobova
00050000-56af-8db8-dd54-5daed64909ae	1423	Dobovec
00050000-56af-8db8-1d6c-bbc03cc33dc6	5263	Dobravlje
00050000-56af-8db8-54ac-e69f64cf9527	3204	Dobrna
00050000-56af-8db8-3532-40b12f3ab03c	8211	Dobrnič
00050000-56af-8db8-dd98-cacdeb963c8e	1356	Dobrova
00050000-56af-8db8-5b8d-4de5278933e1	9223	Dobrovnik/Dobronak 
00050000-56af-8db8-fed5-96b47242691b	5212	Dobrovo v Brdih
00050000-56af-8db8-beee-e874026f4080	1431	Dol pri Hrastniku
00050000-56af-8db8-d7ff-aad846a862ea	1262	Dol pri Ljubljani
00050000-56af-8db8-49a7-e0156e822826	1273	Dole pri Litiji
00050000-56af-8db8-b71e-0d103814c21e	1331	Dolenja vas
00050000-56af-8db8-33c9-8599400a2920	8350	Dolenjske Toplice
00050000-56af-8db8-c84d-22e5234a3ece	1230	Domžale
00050000-56af-8db8-29e1-2074184cf84a	2252	Dornava
00050000-56af-8db8-6f2a-a282b98f667c	5294	Dornberk
00050000-56af-8db8-bd05-d8cc696c9de2	1319	Draga
00050000-56af-8db8-5e09-6e497973232d	8343	Dragatuš
00050000-56af-8db8-5087-b9ced92ee926	3222	Dramlje
00050000-56af-8db8-16bd-49d68a92af3e	2370	Dravograd
00050000-56af-8db8-a118-95258e41fc4f	4203	Duplje
00050000-56af-8db8-b602-e1d3f4f3537f	6221	Dutovlje
00050000-56af-8db8-5a28-def136175912	8361	Dvor
00050000-56af-8db8-4c85-19b0623f37c6	2343	Fala
00050000-56af-8db8-503b-9921f294de2d	9208	Fokovci
00050000-56af-8db8-ee78-a2e8c819cf6e	2313	Fram
00050000-56af-8db8-6c3d-f3082c22e079	3213	Frankolovo
00050000-56af-8db8-b496-b6d479dbfb5e	1274	Gabrovka
00050000-56af-8db8-c441-d4fd9a210292	8254	Globoko
00050000-56af-8db8-2184-cd50aa9ee124	5275	Godovič
00050000-56af-8db8-d1d3-49ad1b8936ae	4204	Golnik
00050000-56af-8db8-664c-fc066907fbfe	3303	Gomilsko
00050000-56af-8db8-9fd8-c7fd654d172d	4224	Gorenja vas
00050000-56af-8db8-88e5-4f1293ebbfaa	3263	Gorica pri Slivnici
00050000-56af-8db8-8f4d-2fbd168ae332	2272	Gorišnica
00050000-56af-8db8-9bc7-df98e4111d72	9250	Gornja Radgona
00050000-56af-8db8-6624-fc523ada2c8c	3342	Gornji Grad
00050000-56af-8db8-93f0-b868980904e4	4282	Gozd Martuljek
00050000-56af-8db8-7a9d-f4ade328351d	6272	Gračišče
00050000-56af-8db8-9542-94a2955a4332	9264	Grad
00050000-56af-8db8-b887-e80c37ba7ed8	8332	Gradac
00050000-56af-8db8-0c00-bb5eba4b1aff	1384	Grahovo
00050000-56af-8db8-1f79-b96de81abc22	5242	Grahovo ob Bači
00050000-56af-8db8-2638-dbb65429d7ea	5251	Grgar
00050000-56af-8db8-d7fd-1c2436656290	3302	Griže
00050000-56af-8db8-e89f-90f82049cea6	3231	Grobelno
00050000-56af-8db8-3634-72f2527254c1	1290	Grosuplje
00050000-56af-8db8-6512-c42703c24b4f	2288	Hajdina
00050000-56af-8db8-afa4-bb4c4d51527d	8362	Hinje
00050000-56af-8db8-540b-0ced90efe8aa	2311	Hoče
00050000-56af-8db8-e4a1-da6d6ea727c9	9205	Hodoš/Hodos
00050000-56af-8db8-1469-8c5969b9ce2c	1354	Horjul
00050000-56af-8db8-e886-1d2415ed0e1d	1372	Hotedršica
00050000-56af-8db8-262c-61a2602bbf15	1430	Hrastnik
00050000-56af-8db8-a65d-d969821e0d7e	6225	Hruševje
00050000-56af-8db8-cda8-cb1cf009357a	4276	Hrušica
00050000-56af-8db8-c573-9e6720145055	5280	Idrija
00050000-56af-8db8-d162-406913452ede	1292	Ig
00050000-56af-8db8-f1bf-9885accc2a45	6250	Ilirska Bistrica
00050000-56af-8db8-54a5-d8a6c58fa48e	6251	Ilirska Bistrica-Trnovo
00050000-56af-8db8-7f32-1bf2e0e2119b	1295	Ivančna Gorica
00050000-56af-8db8-f194-175e73e07f82	2259	Ivanjkovci
00050000-56af-8db8-2c81-c95c105be2d9	1411	Izlake
00050000-56af-8db8-08cd-9887580b3681	6310	Izola/Isola
00050000-56af-8db8-f87f-d169d0b83f58	2222	Jakobski Dol
00050000-56af-8db8-70bd-ce5935bc00b7	2221	Jarenina
00050000-56af-8db8-f950-e4cdd42e9d03	6254	Jelšane
00050000-56af-8db8-c2c1-ba269ecc0df4	4270	Jesenice
00050000-56af-8db8-1d60-4af1952b6c8a	8261	Jesenice na Dolenjskem
00050000-56af-8db8-44dc-56bc4da54731	3273	Jurklošter
00050000-56af-8db8-9ced-0f53fdf8c1f0	2223	Jurovski Dol
00050000-56af-8db8-2ec6-915c18ff9320	2256	Juršinci
00050000-56af-8db8-aba0-88c98246cb6c	5214	Kal nad Kanalom
00050000-56af-8db8-e453-d7ed7ee707d5	3233	Kalobje
00050000-56af-8db8-a6e3-67fa87506631	4246	Kamna Gorica
00050000-56af-8db8-fcbb-c535aca2dcf7	2351	Kamnica
00050000-56af-8db8-bcd7-94241ac0b17c	1241	Kamnik
00050000-56af-8db8-4267-8ecce4c20b28	5213	Kanal
00050000-56af-8db8-af01-c28d4ce270d8	8258	Kapele
00050000-56af-8db8-fcf3-d136c8cf8ece	2362	Kapla
00050000-56af-8db8-4a65-38fb4acc1c0b	2325	Kidričevo
00050000-56af-8db8-f2dc-7cebe36f893b	1412	Kisovec
00050000-56af-8db8-715a-e0c1b1515eb6	6253	Knežak
00050000-56af-8db8-a370-8c7df024773f	5222	Kobarid
00050000-56af-8db8-8f0f-d27a861d5a5b	9227	Kobilje
00050000-56af-8db8-b6a5-e13c4ddc1e8b	1330	Kočevje
00050000-56af-8db8-12ce-c85b797108c9	1338	Kočevska Reka
00050000-56af-8db8-885a-00e9959571ad	2276	Kog
00050000-56af-8db8-ce15-6e058a31b6dc	5211	Kojsko
00050000-56af-8db8-c53a-88c184f81ef6	6223	Komen
00050000-56af-8db8-db7d-41bda13f71b8	1218	Komenda
00050000-56af-8db8-d477-94d74a177fd0	6000	Koper/Capodistria 
00050000-56af-8db8-a8a1-fdf03723dd34	6001	Koper/Capodistria - poštni predali
00050000-56af-8db8-d6eb-afb08dc9a275	8282	Koprivnica
00050000-56af-8db8-26a8-7002a265bd36	5296	Kostanjevica na Krasu
00050000-56af-8db8-fc2e-ad8ce3acd03c	8311	Kostanjevica na Krki
00050000-56af-8db8-a98a-57798de93bb3	1336	Kostel
00050000-56af-8db8-e37a-9a4a1f042e15	6256	Košana
00050000-56af-8db8-75a9-27f3b37217fc	2394	Kotlje
00050000-56af-8db8-10f8-bd8bed4cf8b1	6240	Kozina
00050000-56af-8db8-11f8-21b2b83a08b5	3260	Kozje
00050000-56af-8db8-c468-b061b0fb4695	4000	Kranj 
00050000-56af-8db8-19e3-6d0241539d27	4001	Kranj - poštni predali
00050000-56af-8db8-9aa1-cb9b74d50eb6	4280	Kranjska Gora
00050000-56af-8db8-24c3-8cb4b4654050	1281	Kresnice
00050000-56af-8db8-f91e-6b0721e16e57	4294	Križe
00050000-56af-8db8-efd7-0149c5f9f3ec	9206	Križevci
00050000-56af-8db8-50d2-a4b398b4d9fd	9242	Križevci pri Ljutomeru
00050000-56af-8db8-456f-62a21d11f6ee	1301	Krka
00050000-56af-8db8-556c-3bd378ea0103	8296	Krmelj
00050000-56af-8db8-2e4f-0e7f91eda731	4245	Kropa
00050000-56af-8db8-da87-62347d37818e	8262	Krška vas
00050000-56af-8db8-50ae-9270f751acf4	8270	Krško
00050000-56af-8db8-0479-c42b9cb4f76e	9263	Kuzma
00050000-56af-8db8-018f-72bf5f4141ca	2318	Laporje
00050000-56af-8db8-5bdd-c0cf5322f85c	3270	Laško
00050000-56af-8db8-b2c9-a560d9279ef8	1219	Laze v Tuhinju
00050000-56af-8db8-f1c0-a3feefb9df98	2230	Lenart v Slovenskih goricah
00050000-56af-8db8-1bab-fe69d6348794	9220	Lendava/Lendva
00050000-56af-8db8-e5c7-afd148446f26	4248	Lesce
00050000-56af-8db8-9214-5e22ab4e7e41	3261	Lesično
00050000-56af-8db8-a1d0-ef85311d39d1	8273	Leskovec pri Krškem
00050000-56af-8db8-3e10-b870076fd631	2372	Libeliče
00050000-56af-8db8-fd12-65271c267f69	2341	Limbuš
00050000-56af-8db8-b834-988aa1d1feb3	1270	Litija
00050000-56af-8db8-061c-0e7247cc50b4	3202	Ljubečna
00050000-56af-8db8-d996-08ba6bf29771	1000	Ljubljana 
00050000-56af-8db8-829a-f150c6f267f0	1001	Ljubljana - poštni predali
00050000-56af-8db8-4c82-2235c69cb982	1231	Ljubljana - Črnuče
00050000-56af-8db8-79bc-264354b3513c	1261	Ljubljana - Dobrunje
00050000-56af-8db8-5899-6eafa9646e9e	1260	Ljubljana - Polje
00050000-56af-8db8-ed7d-421b3450516a	1210	Ljubljana - Šentvid
00050000-56af-8db8-b810-1f5fb1ee9490	1211	Ljubljana - Šmartno
00050000-56af-8db8-fc3a-3b7700f011a9	3333	Ljubno ob Savinji
00050000-56af-8db8-3d53-5bcd9b47c5a2	9240	Ljutomer
00050000-56af-8db8-9af9-5a67b8fc5879	3215	Loče
00050000-56af-8db8-5fc2-c0f47cace8ac	5231	Log pod Mangartom
00050000-56af-8db8-17b9-0563ef3c3296	1358	Log pri Brezovici
00050000-56af-8db8-f616-b0145a2c8694	1370	Logatec
00050000-56af-8db8-256c-0c813d87b5f9	1371	Logatec
00050000-56af-8db8-0a7e-2a3550bc5b52	1434	Loka pri Zidanem Mostu
00050000-56af-8db8-6bd3-62a42515fece	3223	Loka pri Žusmu
00050000-56af-8db8-acb3-f9f6b2b3512a	6219	Lokev
00050000-56af-8db8-3ac4-fd720dc21cbe	1318	Loški Potok
00050000-56af-8db8-7cd7-39928c70031e	2324	Lovrenc na Dravskem polju
00050000-56af-8db8-745a-c2aeebccd449	2344	Lovrenc na Pohorju
00050000-56af-8db8-d257-15feb7f6669a	3334	Luče
00050000-56af-8db8-6c79-6f57c98bb4f3	1225	Lukovica
00050000-56af-8db8-260c-79f537c8ef10	9202	Mačkovci
00050000-56af-8db8-2deb-d1e83b297a89	2322	Majšperk
00050000-56af-8db8-0a46-c64c01e515c6	2321	Makole
00050000-56af-8db8-64d4-94a3a63851fe	9243	Mala Nedelja
00050000-56af-8db8-4cba-e83bc035cad2	2229	Malečnik
00050000-56af-8db8-4658-8507bbeb6f51	6273	Marezige
00050000-56af-8db8-56b5-12f3bfe3f808	2000	Maribor 
00050000-56af-8db8-1ab5-8b73be82d2f5	2001	Maribor - poštni predali
00050000-56af-8db8-dc14-e2836e9a27b1	2206	Marjeta na Dravskem polju
00050000-56af-8db8-ef0a-31f0b202cd3a	2281	Markovci
00050000-56af-8db8-b945-432b0d39c1bc	9221	Martjanci
00050000-56af-8db8-bdd1-c92b7a121791	6242	Materija
00050000-56af-8db8-aced-1d70f06bc67c	4211	Mavčiče
00050000-56af-8db8-811c-df793a585662	1215	Medvode
00050000-56af-8db8-23be-5726eb185c9a	1234	Mengeš
00050000-56af-8db8-2945-2537e9aa918e	8330	Metlika
00050000-56af-8db8-7fe6-2c0376969f44	2392	Mežica
00050000-56af-8db8-f80b-5e837c9d682f	2204	Miklavž na Dravskem polju
00050000-56af-8db8-6655-1bca5268077e	2275	Miklavž pri Ormožu
00050000-56af-8db8-0c57-b46304525237	5291	Miren
00050000-56af-8db8-34ec-3053cd146977	8233	Mirna
00050000-56af-8db8-8ddc-949748c6e561	8216	Mirna Peč
00050000-56af-8db8-6725-d4a710be6562	2382	Mislinja
00050000-56af-8db8-a6af-a7ec255aadb8	4281	Mojstrana
00050000-56af-8db8-cadc-9929a0ab7e0a	8230	Mokronog
00050000-56af-8db8-4d10-f7d847d14bfd	1251	Moravče
00050000-56af-8db8-9424-0b08dd4316ea	9226	Moravske Toplice
00050000-56af-8db8-4c8a-88d86f9d6f21	5216	Most na Soči
00050000-56af-8db8-6f27-4f0808fb760e	1221	Motnik
00050000-56af-8db8-eb47-6d99c9f2a21f	3330	Mozirje
00050000-56af-8db8-3a46-b8e4011ffc08	9000	Murska Sobota 
00050000-56af-8db8-163a-b01d6e9b05c4	9001	Murska Sobota - poštni predali
00050000-56af-8db8-36b5-4046936e63aa	2366	Muta
00050000-56af-8db8-3b3b-c08bc5c48152	4202	Naklo
00050000-56af-8db8-f76c-048b6b8c9877	3331	Nazarje
00050000-56af-8db8-a620-1744f00f1304	1357	Notranje Gorice
00050000-56af-8db8-bd11-d0e4a078c975	3203	Nova Cerkev
00050000-56af-8db8-b0e5-1092fbdb6933	5000	Nova Gorica 
00050000-56af-8db8-83a3-c53d69066e66	5001	Nova Gorica - poštni predali
00050000-56af-8db8-3834-0c0160c3857a	1385	Nova vas
00050000-56af-8db8-ea31-8a42e6c014c9	8000	Novo mesto
00050000-56af-8db8-8008-e25dc3fc69c8	8001	Novo mesto - poštni predali
00050000-56af-8db8-b6f4-10aa14e2f0c1	6243	Obrov
00050000-56af-8db8-da9e-e982095fe88b	9233	Odranci
00050000-56af-8db8-571d-7f1c6e27054c	2317	Oplotnica
00050000-56af-8db8-9d97-11bdb178acd2	2312	Orehova vas
00050000-56af-8db8-b486-5ecef16513a1	2270	Ormož
00050000-56af-8db8-f85c-bfbbf8b6cd07	1316	Ortnek
00050000-56af-8db8-5883-43a61fdefbe4	1337	Osilnica
00050000-56af-8db8-2768-7e34728e68bf	8222	Otočec
00050000-56af-8db8-d972-98d08c79b316	2361	Ožbalt
00050000-56af-8db8-d52d-8797baa8086d	2231	Pernica
00050000-56af-8db8-c1c9-f9b993df0b90	2211	Pesnica pri Mariboru
00050000-56af-8db8-4a72-db2ddc9c4de5	9203	Petrovci
00050000-56af-8db8-e5b4-83ac22c9b13f	3301	Petrovče
00050000-56af-8db8-3291-a4b83afbeeca	6330	Piran/Pirano
00050000-56af-8db8-303d-97606eb180f9	8255	Pišece
00050000-56af-8db8-6b5b-4b43b992263b	6257	Pivka
00050000-56af-8db8-edcc-0b3748f1b7a0	6232	Planina
00050000-56af-8db8-4227-eb60a64d45a8	3225	Planina pri Sevnici
00050000-56af-8db8-3faf-00cb9ace83c4	6276	Pobegi
00050000-56af-8db8-0b16-8b284bbf2caf	8312	Podbočje
00050000-56af-8db8-2a93-d4348992772b	5243	Podbrdo
00050000-56af-8db8-ac55-d727d59931f3	3254	Podčetrtek
00050000-56af-8db8-48b9-119e42192538	2273	Podgorci
00050000-56af-8db8-39ed-addccabae8dd	6216	Podgorje
00050000-56af-8db8-1d55-8a56f4fd1769	2381	Podgorje pri Slovenj Gradcu
00050000-56af-8db8-1373-4fbefde4e4a2	6244	Podgrad
00050000-56af-8db8-1d7e-0be0638e58a0	1414	Podkum
00050000-56af-8db8-7685-8da17dd80a1f	2286	Podlehnik
00050000-56af-8db8-9a93-1dfb404b85d1	5272	Podnanos
00050000-56af-8db8-a2c1-0b558d72dd0e	4244	Podnart
00050000-56af-8db8-30c7-39c7ea2d4ee0	3241	Podplat
00050000-56af-8db8-7fb8-d489beaafb96	3257	Podsreda
00050000-56af-8db8-b56e-112245f9222a	2363	Podvelka
00050000-56af-8db8-1ce6-4b02aaedae3c	2208	Pohorje
00050000-56af-8db8-0792-63bb42d606d3	2257	Polenšak
00050000-56af-8db8-0e8f-0d0c72ffd9c6	1355	Polhov Gradec
00050000-56af-8db8-c0e9-ef01bbe24acf	4223	Poljane nad Škofjo Loko
00050000-56af-8db8-8161-d0bcfd054fc1	2319	Poljčane
00050000-56af-8db8-7fa6-2aec2cbee4f3	1272	Polšnik
00050000-56af-8db8-7d28-2b203557eb73	3313	Polzela
00050000-56af-8db8-7d38-05aef60bd0c3	3232	Ponikva
00050000-56af-8db8-04c9-841f4892a9a4	6320	Portorož/Portorose
00050000-56af-8db8-b0bf-0cbceb73b347	6230	Postojna
00050000-56af-8db8-af65-4efa0edeb14e	2331	Pragersko
00050000-56af-8db8-0908-92c9039c7a48	3312	Prebold
00050000-56af-8db8-fd08-41ce6d2ebb6f	4205	Preddvor
00050000-56af-8db8-0a80-00f6034f12c2	6255	Prem
00050000-56af-8db8-c4e5-e6fc5ada54f0	1352	Preserje
00050000-56af-8db8-cdd4-e37ab173fb0a	6258	Prestranek
00050000-56af-8db8-8780-1cfe42890475	2391	Prevalje
00050000-56af-8db8-6cdf-88372cc85d4b	3262	Prevorje
00050000-56af-8db8-9605-513846db32c6	1276	Primskovo 
00050000-56af-8db8-b56d-decbd7e5cdbf	3253	Pristava pri Mestinju
00050000-56af-8db8-d5a2-75c401d36afd	9207	Prosenjakovci/Partosfalva
00050000-56af-8db8-7d91-200b735cf325	5297	Prvačina
00050000-56af-8db8-c6cf-5ec7fc29c4b9	2250	Ptuj
00050000-56af-8db8-c51e-a1e8da324218	2323	Ptujska Gora
00050000-56af-8db8-f01e-c04497275ab8	9201	Puconci
00050000-56af-8db8-5ae5-fe8ea8150766	2327	Rače
00050000-56af-8db8-7da6-4ce9204eb754	1433	Radeče
00050000-56af-8db8-e546-8731f79ec210	9252	Radenci
00050000-56af-8db8-e93b-c5e6d15e9eba	2360	Radlje ob Dravi
00050000-56af-8db8-4751-6608aeeea37d	1235	Radomlje
00050000-56af-8db8-e1bc-fc6767410f71	4240	Radovljica
00050000-56af-8db8-aa36-9d4509e1c02d	8274	Raka
00050000-56af-8db8-9ee3-654b15aed422	1381	Rakek
00050000-56af-8db8-f0b6-889935625a09	4283	Rateče - Planica
00050000-56af-8db8-e53f-f6b04a5d9f86	2390	Ravne na Koroškem
00050000-56af-8db8-97f0-167ff52faf75	9246	Razkrižje
00050000-56af-8db8-d7d4-9dfd58b6a5f5	3332	Rečica ob Savinji
00050000-56af-8db8-bb35-4f7375703f9e	5292	Renče
00050000-56af-8db8-33ba-a14e47946788	1310	Ribnica
00050000-56af-8db8-e639-a09844f3d561	2364	Ribnica na Pohorju
00050000-56af-8db8-a611-349b1d5bf0ba	3272	Rimske Toplice
00050000-56af-8db8-41b3-7507ec349893	1314	Rob
00050000-56af-8db8-2863-0ca32ed37dd9	5215	Ročinj
00050000-56af-8db8-589f-43937453adc1	3250	Rogaška Slatina
00050000-56af-8db8-edaa-aae161d7627f	9262	Rogašovci
00050000-56af-8db8-0c58-413dd945b420	3252	Rogatec
00050000-56af-8db8-24f3-c08f4566dcc8	1373	Rovte
00050000-56af-8db8-ea94-f1cd541d42cc	2342	Ruše
00050000-56af-8db8-896b-42e7f0324872	1282	Sava
00050000-56af-8db8-f2b1-f6af9a50b6fd	6333	Sečovlje/Sicciole
00050000-56af-8db8-4390-decb417db24d	4227	Selca
00050000-56af-8db8-b6fd-0a471b2d933c	2352	Selnica ob Dravi
00050000-56af-8db8-d829-1b45a25c9743	8333	Semič
00050000-56af-8db8-ada0-520cfd79e1c7	8281	Senovo
00050000-56af-8db8-3b9e-9d57c949c87e	6224	Senožeče
00050000-56af-8db8-284a-3bdae8893448	8290	Sevnica
00050000-56af-8db8-3317-8aa7255c2f32	6210	Sežana
00050000-56af-8db8-8a4a-92c6d7607490	2214	Sladki Vrh
00050000-56af-8db8-6528-bdced3bf8f9c	5283	Slap ob Idrijci
00050000-56af-8db8-c2f2-abc38c969802	2380	Slovenj Gradec
00050000-56af-8db8-00c1-9c1598a0ace2	2310	Slovenska Bistrica
00050000-56af-8db8-9fb0-6d0d8809c0ca	3210	Slovenske Konjice
00050000-56af-8db8-5ac4-e0c64a3a0ed8	1216	Smlednik
00050000-56af-8db8-9fab-8f6908212f1d	5232	Soča
00050000-56af-8db8-cca7-c36be8b78efc	1317	Sodražica
00050000-56af-8db8-7e18-b5219a588388	3335	Solčava
00050000-56af-8db8-30bf-276533818b76	5250	Solkan
00050000-56af-8db8-bd3b-57ceeaff0b9d	4229	Sorica
00050000-56af-8db8-c611-fcfb18209360	4225	Sovodenj
00050000-56af-8db8-540e-3c15148636cd	5281	Spodnja Idrija
00050000-56af-8db8-38fd-c0a5b3cc3eac	2241	Spodnji Duplek
00050000-56af-8db8-1fb5-b9d2141b673e	9245	Spodnji Ivanjci
00050000-56af-8db8-ec2e-bb97d87653c7	2277	Središče ob Dravi
00050000-56af-8db8-cd3e-71f69cf9c5b8	4267	Srednja vas v Bohinju
00050000-56af-8db8-8ae2-6b6ecf6f4097	8256	Sromlje 
00050000-56af-8db8-9007-2beeee271efd	5224	Srpenica
00050000-56af-8db8-b439-f693ec0c888e	1242	Stahovica
00050000-56af-8db8-504b-07fd762274b0	1332	Stara Cerkev
00050000-56af-8db8-3828-c1444310c973	8342	Stari trg ob Kolpi
00050000-56af-8db8-4aa9-689689df9d9d	1386	Stari trg pri Ložu
00050000-56af-8db8-6bc1-64c28e6acf41	2205	Starše
00050000-56af-8db8-9437-b10c64c2d4fe	2289	Stoperce
00050000-56af-8db8-8adf-8ddd93cfc8cd	8322	Stopiče
00050000-56af-8db8-34ac-a58dc024368a	3206	Stranice
00050000-56af-8db8-8345-5f3ff6a84a6e	8351	Straža
00050000-56af-8db8-5f37-5611dda3348b	1313	Struge
00050000-56af-8db8-0d06-56ebdd6d1e9b	8293	Studenec
00050000-56af-8db8-bd9b-db74d2f97e0d	8331	Suhor
00050000-56af-8db8-e66d-1a474d5131f5	2233	Sv. Ana v Slovenskih goricah
00050000-56af-8db8-14ec-4ff316a7b751	2235	Sv. Trojica v Slovenskih goricah
00050000-56af-8db8-1430-6869550c1e44	2353	Sveti Duh na Ostrem Vrhu
00050000-56af-8db8-1ef5-35709d3785ce	9244	Sveti Jurij ob Ščavnici
00050000-56af-8db8-0638-8be7666b6a34	3264	Sveti Štefan
00050000-56af-8db8-81f5-41cb1f2d519a	2258	Sveti Tomaž
00050000-56af-8db8-0d82-4cdfb071cad5	9204	Šalovci
00050000-56af-8db8-8714-2b77e797c948	5261	Šempas
00050000-56af-8db8-e690-0ef94267dc47	5290	Šempeter pri Gorici
00050000-56af-8db8-8c38-7bd3808ed085	3311	Šempeter v Savinjski dolini
00050000-56af-8db8-a0cb-86f95f29e558	4208	Šenčur
00050000-56af-8db8-6d77-a98201b82a6d	2212	Šentilj v Slovenskih goricah
00050000-56af-8db8-1a87-27f07fcede64	8297	Šentjanž
00050000-56af-8db8-ebb1-5f6c4bb1e827	2373	Šentjanž pri Dravogradu
00050000-56af-8db8-81e6-67698e490c3a	8310	Šentjernej
00050000-56af-8db8-7b4a-9ebfe6e7a377	3230	Šentjur
00050000-56af-8db8-5883-1ecb5dcb5f1f	3271	Šentrupert
00050000-56af-8db8-9342-19de5b2eff06	8232	Šentrupert
00050000-56af-8db8-1c5b-17908421d0ae	1296	Šentvid pri Stični
00050000-56af-8db8-9208-e20786c45112	8275	Škocjan
00050000-56af-8db8-a0e7-30b784515382	6281	Škofije
00050000-56af-8db8-a46c-46248f630ccc	4220	Škofja Loka
00050000-56af-8db8-579e-54b6d83784b0	3211	Škofja vas
00050000-56af-8db8-af54-773110843ad1	1291	Škofljica
00050000-56af-8db8-1f1a-125843ceb349	6274	Šmarje
00050000-56af-8db8-ad7f-d5c101cf5ad1	1293	Šmarje - Sap
00050000-56af-8db8-5fc4-97a3328b156d	3240	Šmarje pri Jelšah
00050000-56af-8db8-a605-f164a3eb2a98	8220	Šmarješke Toplice
00050000-56af-8db8-40a5-eb1b926c1be4	2315	Šmartno na Pohorju
00050000-56af-8db8-62de-dc6916d355d8	3341	Šmartno ob Dreti
00050000-56af-8db8-f5a7-57e2869cdd2d	3327	Šmartno ob Paki
00050000-56af-8db8-7879-32ee7cf4bcdc	1275	Šmartno pri Litiji
00050000-56af-8db8-2465-177c2cbabdfb	2383	Šmartno pri Slovenj Gradcu
00050000-56af-8db8-5861-889714272033	3201	Šmartno v Rožni dolini
00050000-56af-8db8-430a-a0c73acde8a6	3325	Šoštanj
00050000-56af-8db8-9142-396389204af1	6222	Štanjel
00050000-56af-8db8-fe20-1549a20e796c	3220	Štore
00050000-56af-8db8-b4a5-c9d814708293	3304	Tabor
00050000-56af-8db8-e478-e152d1497528	3221	Teharje
00050000-56af-8db8-a888-0e64d6404558	9251	Tišina
00050000-56af-8db8-59f4-68a079a60cd2	5220	Tolmin
00050000-56af-8db8-a9fd-dc787e319076	3326	Topolšica
00050000-56af-8db8-d98e-9cc90bb1ee64	2371	Trbonje
00050000-56af-8db8-d40d-93a741dc071f	1420	Trbovlje
00050000-56af-8db8-45ff-a2afbf78a924	8231	Trebelno 
00050000-56af-8db8-4236-d9ea53776cd5	8210	Trebnje
00050000-56af-8db8-d3ab-1f725d6d98af	5252	Trnovo pri Gorici
00050000-56af-8db8-5fcb-c4abad06743c	2254	Trnovska vas
00050000-56af-8db8-3557-f13f8eb3aaab	1222	Trojane
00050000-56af-8db8-f7ae-fd87cfe957c9	1236	Trzin
00050000-56af-8db8-d044-03b1574da0bb	4290	Tržič
00050000-56af-8db8-680c-ef0e10b05c03	8295	Tržišče
00050000-56af-8db8-f054-d11936faf9c5	1311	Turjak
00050000-56af-8db8-fb2e-72b06c230059	9224	Turnišče
00050000-56af-8db8-9180-4c86820ad26c	8323	Uršna sela
00050000-56af-8db8-5888-ffc0bacfdca0	1252	Vače
00050000-56af-8db8-5374-19c3e4431e6d	3320	Velenje 
00050000-56af-8db8-ecd5-1dbf39a533c7	3322	Velenje - poštni predali
00050000-56af-8db8-1cdd-96fec684abf4	8212	Velika Loka
00050000-56af-8db8-da6c-b54cf3bcae2e	2274	Velika Nedelja
00050000-56af-8db8-eff0-df99ec51b9c1	9225	Velika Polana
00050000-56af-8db8-c902-974290e1ae54	1315	Velike Lašče
00050000-56af-8db8-4a41-4d93daef4606	8213	Veliki Gaber
00050000-56af-8db8-1637-ccedd948d22b	9241	Veržej
00050000-56af-8db8-db66-3a0377c80fca	1312	Videm - Dobrepolje
00050000-56af-8db8-22bf-c3d2d28f2a49	2284	Videm pri Ptuju
00050000-56af-8db8-584d-bb8b56836650	8344	Vinica
00050000-56af-8db8-5563-26c5ad8e5dbb	5271	Vipava
00050000-56af-8db8-c8f9-bcd61726e754	4212	Visoko
00050000-56af-8db8-e4d3-038fe4ddc35a	1294	Višnja Gora
00050000-56af-8db8-82b0-a1bf40412f4d	3205	Vitanje
00050000-56af-8db8-caff-c6aa3ff1a44d	2255	Vitomarci
00050000-56af-8db8-e4ef-6158a1d164c2	1217	Vodice
00050000-56af-8db8-8798-74a12b922c72	3212	Vojnik\t
00050000-56af-8db8-b1c5-68705b5510ff	5293	Volčja Draga
00050000-56af-8db8-84c8-ecde0cf12552	2232	Voličina
00050000-56af-8db8-6bd7-05ebc2c37036	3305	Vransko
00050000-56af-8db8-cdeb-08f55aae141a	6217	Vremski Britof
00050000-56af-8db8-5709-1eb1f284c340	1360	Vrhnika
00050000-56af-8db8-7229-982c573d9834	2365	Vuhred
00050000-56af-8db8-04b6-c34d3faacfa0	2367	Vuzenica
00050000-56af-8db8-c079-142ff5e6fc5d	8292	Zabukovje 
00050000-56af-8db8-8c35-6af3e1482baf	1410	Zagorje ob Savi
00050000-56af-8db8-be25-f37d486f19af	1303	Zagradec
00050000-56af-8db8-e7a0-98448b68be0e	2283	Zavrč
00050000-56af-8db8-ec12-08a06bed99a8	8272	Zdole 
00050000-56af-8db8-f6d1-cbee94c1b3f3	4201	Zgornja Besnica
00050000-56af-8db8-20e5-96658ecf4403	2242	Zgornja Korena
00050000-56af-8db8-df77-ce436eef40c2	2201	Zgornja Kungota
00050000-56af-8db8-0292-92134f48feb9	2316	Zgornja Ložnica
00050000-56af-8db8-91e6-7d704996bcbc	2314	Zgornja Polskava
00050000-56af-8db8-e01a-5a603695d3c0	2213	Zgornja Velka
00050000-56af-8db8-c483-2b0696b7f961	4247	Zgornje Gorje
00050000-56af-8db8-7b6e-d36fcc68eb89	4206	Zgornje Jezersko
00050000-56af-8db8-1fc0-53fbf25590dd	2285	Zgornji Leskovec
00050000-56af-8db8-0e4a-e4938371e5b3	1432	Zidani Most
00050000-56af-8db8-04f6-d847696a7f31	3214	Zreče
00050000-56af-8db8-13d7-710248fe02ae	4209	Žabnica
00050000-56af-8db8-c3ca-7926713dd4a6	3310	Žalec
00050000-56af-8db8-0c41-486ca493a1ea	4228	Železniki
00050000-56af-8db8-cd3d-6a174cb0cffe	2287	Žetale
00050000-56af-8db8-af5c-03883881b326	4226	Žiri
00050000-56af-8db8-18ff-68e2278bb9d2	4274	Žirovnica
00050000-56af-8db8-50a9-c9e4c0f9802d	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 42508201)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 42507771)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 42507510)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56af-8dbb-b9e1-70413a61523b	00080000-56af-8dbb-acd4-da77d56e58b5	\N	00040000-56af-8db8-e85f-e04672eb7442	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56af-8dbb-d950-45ad0ca1b7bb	00080000-56af-8dbb-acd4-da77d56e58b5	\N	00040000-56af-8db8-e85f-e04672eb7442	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56af-8dbb-e50d-339390eb575e	00080000-56af-8dbb-f1a9-415576340d2c	\N	00040000-56af-8db8-e85f-e04672eb7442	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 42507645)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56af-8db8-dad1-8629fccc7ad4	novo leto	1	1	\N	t
00430000-56af-8db8-e36c-342a40bf66e4	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56af-8db8-b7d9-19f633f5f674	dan upora proti okupatorju	27	4	\N	t
00430000-56af-8db8-6344-f2d583cc876c	praznik dela	1	5	\N	t
00430000-56af-8db8-bc1a-a76f420789d3	praznik dela	2	5	\N	t
00430000-56af-8db8-a7e6-976cff192513	dan Primoža Trubarja	8	6	\N	f
00430000-56af-8db8-6356-8cc240e67eca	dan državnosti	25	6	\N	t
00430000-56af-8db8-fcfe-21de1a2a78cc	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56af-8db8-1659-3a7e15974bf4	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56af-8db8-af82-3121f86fac07	dan suverenosti	25	10	\N	f
00430000-56af-8db8-a5d5-d68103b27897	dan spomina na mrtve	1	11	\N	t
00430000-56af-8db8-cf24-67830f47973d	dan Rudolfa Maistra	23	11	\N	f
00430000-56af-8db8-5dcc-5425f0d714df	božič	25	12	\N	t
00430000-56af-8db8-39db-2216f77eaf31	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56af-8db8-ca71-0972ad5b97e9	Marijino vnebovzetje	15	8	\N	t
00430000-56af-8db8-39ec-4edee7dbcac0	dan reformacije	31	10	\N	t
00430000-56af-8db8-fb02-f8f549411af5	velikonočna nedelja	27	3	2016	t
00430000-56af-8db8-d6e8-554f2859f098	velikonočna nedelja	16	4	2017	t
00430000-56af-8db8-6b70-e8f843537640	velikonočna nedelja	1	4	2018	t
00430000-56af-8db8-5a2e-be8bbb735fe2	velikonočna nedelja	21	4	2019	t
00430000-56af-8db8-76cd-ad0185bd6101	velikonočna nedelja	12	4	2020	t
00430000-56af-8db8-7f9e-f7e7f31200ca	velikonočna nedelja	4	4	2021	t
00430000-56af-8db8-80df-03457de3f09e	velikonočna nedelja	17	4	2022	t
00430000-56af-8db8-13d5-949e1c63303d	velikonočna nedelja	9	4	2023	t
00430000-56af-8db8-12e5-b84fcbde3273	velikonočna nedelja	31	3	2024	t
00430000-56af-8db8-4ee9-56576fb9907d	velikonočna nedelja	20	4	2025	t
00430000-56af-8db8-c34f-fad2acca28c9	velikonočna nedelja	5	4	2026	t
00430000-56af-8db8-6ec8-3dd6af5b20b2	velikonočna nedelja	28	3	2027	t
00430000-56af-8db8-ba9f-8028d1abd1f2	velikonočna nedelja	16	4	2028	t
00430000-56af-8db8-9efa-d46b8fc393e2	velikonočna nedelja	1	4	2029	t
00430000-56af-8db8-c268-350036810f59	velikonočna nedelja	21	4	2030	t
00430000-56af-8db8-7e30-3c473a4dfa88	velikonočni ponedeljek	28	3	2016	t
00430000-56af-8db8-b107-f4cdf57aac51	velikonočni ponedeljek	17	4	2017	t
00430000-56af-8db8-5684-46f632e15d95	velikonočni ponedeljek	2	4	2018	t
00430000-56af-8db8-a2b1-07523675f481	velikonočni ponedeljek	22	4	2019	t
00430000-56af-8db8-5335-207bb192c5b5	velikonočni ponedeljek	13	4	2020	t
00430000-56af-8db8-614d-f232fc6c51e5	velikonočni ponedeljek	5	4	2021	t
00430000-56af-8db8-5c94-1dfc32384e5f	velikonočni ponedeljek	18	4	2022	t
00430000-56af-8db8-1620-e822c8e3f74c	velikonočni ponedeljek	10	4	2023	t
00430000-56af-8db8-f386-5387124168f1	velikonočni ponedeljek	1	4	2024	t
00430000-56af-8db8-253b-583b838de417	velikonočni ponedeljek	21	4	2025	t
00430000-56af-8db8-595e-33f9fa05fc47	velikonočni ponedeljek	6	4	2026	t
00430000-56af-8db8-6697-4a441d016a99	velikonočni ponedeljek	29	3	2027	t
00430000-56af-8db8-7663-c1698e330ee7	velikonočni ponedeljek	17	4	2028	t
00430000-56af-8db8-302d-bd38ce8180ca	velikonočni ponedeljek	2	4	2029	t
00430000-56af-8db8-55f3-a9dbe1c7909f	velikonočni ponedeljek	22	4	2030	t
00430000-56af-8db8-0177-55835b05a337	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56af-8db8-7206-0843018f5732	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56af-8db8-daec-3a13fde81643	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56af-8db8-93e8-0d62abb2dae4	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56af-8db8-849a-37b1fb79effe	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56af-8db8-334f-89526cac7293	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56af-8db8-b245-2ba9ff2964e4	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56af-8db8-be35-9372af511a6a	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56af-8db8-1a8b-bc6681847ada	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56af-8db8-2251-e9592f778a2f	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56af-8db8-cc2c-5d95ea4eab96	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56af-8db8-9cba-0f28d3484368	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56af-8db8-354d-804e92264a49	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56af-8db8-c47c-39f7109c8bb0	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56af-8db8-4413-6e0d941009b4	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 42507614)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56af-8dbc-d183-1d8bffe09556	000e0000-56af-8dbb-d68a-c95453b28004	1	3	1
001b0000-56af-8dbc-897f-a4e8fed68cd3	000e0000-56af-8dbb-d68a-c95453b28004	2	4	2
001b0000-56af-8dbc-839f-61a57138d67f	000e0000-56af-8dbb-d68a-c95453b28004	4	5	3
001b0000-56af-8dbc-e6de-4fa91d123d9b	000e0000-56af-8dbb-d68a-c95453b28004	\N	1	\N
001b0000-56af-8dbc-5c72-badbc98f7cf4	000e0000-56af-8dbb-d68a-c95453b28004	5	9	4
001b0000-56af-8dbc-b517-12ca19578b67	000e0000-56af-8dbb-d68a-c95453b28004	7	10	5
001b0000-56af-8dbc-3fb6-4ea4027a51a1	000e0000-56af-8dbb-789e-8242186d280e	3	2	1
001b0000-56af-8dbc-c0f2-acb2be28243b	000e0000-56af-8dbb-789e-8242186d280e	4	3	1
001b0000-56af-8dbc-c75f-c8b9728dfef0	000e0000-56af-8dbb-d68a-c95453b28004	\N	2	\N
001b0000-56af-8dbc-31bb-80869756722c	000e0000-56af-8dbb-789e-8242186d280e	\N	1	\N
001b0000-56af-8dbc-cb11-91b50dbeb294	000e0000-56af-8dbb-d68a-c95453b28004	3	8	3
001b0000-56af-8dbc-3b18-92d572c17fae	000e0000-56af-8dbb-d68a-c95453b28004	2	11	1
001b0000-56af-8dbc-9594-73138fe1986e	000e0000-56af-8dbb-789e-8242186d280e	1	5	1
001b0000-56af-8dbc-4d88-4120ff80d41d	000e0000-56af-8dbb-789e-8242186d280e	6	4	2
001b0000-56af-8dbc-53e0-c183df6e607e	000e0000-56af-8dbb-d68a-c95453b28004	1	6	1
001b0000-56af-8dbc-1d50-5039bea7266b	000e0000-56af-8dbb-d68a-c95453b28004	2	7	2
\.


--
-- TOC entry 3161 (class 0 OID 42507620)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56af-8dbc-d183-1d8bffe09556	000a0000-56af-8dbb-9220-303c9a74f5d9
001b0000-56af-8dbc-d183-1d8bffe09556	000a0000-56af-8dbb-5edb-05fb61072e33
001b0000-56af-8dbc-897f-a4e8fed68cd3	000a0000-56af-8dbb-5edb-05fb61072e33
001b0000-56af-8dbc-897f-a4e8fed68cd3	000a0000-56af-8dbb-562e-e032349a47bd
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 42507783)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 42508215)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 42508225)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56af-8dbb-8e92-3948c7a124ae	00080000-56af-8dbb-20a8-ee6cab3ae22d	0987	AK
00190000-56af-8dbb-11cd-db2b847affc6	00080000-56af-8dbb-f1a9-415576340d2c	0989	AK
00190000-56af-8dbb-65a6-1a2915fd9a4a	00080000-56af-8dbb-5b2f-9d30e4288446	0986	AK
00190000-56af-8dbb-ca3f-f26668e524ea	00080000-56af-8dbb-84f9-62a90e684ad6	0984	AK
00190000-56af-8dbb-ac64-76e9218b4dd5	00080000-56af-8dbb-d267-e6b4b5f12c65	0983	AK
00190000-56af-8dbb-381b-af272ebae4a5	00080000-56af-8dbb-71c6-c7f92506b8f4	0982	AK
00190000-56af-8dbd-efe8-d0c2e974c705	00080000-56af-8dbd-df9d-2266ec06aa7c	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 42508114)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56af-8dbc-92ac-b042ab5c77b7	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 42508233)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 42507811)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56af-8dbb-655f-d103582e7fdd	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56af-8dbb-429a-a9fff92962bf	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56af-8dbb-d794-43f23bf40874	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56af-8dbb-07bb-b71e564d5713	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56af-8dbb-c249-d6eff787febc	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56af-8dbb-59b8-58dbe47df43c	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56af-8dbb-6272-598956887e3f	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 42507756)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 42507746)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 42507953)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 42507883)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 42507588)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 42507349)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56af-8dbd-df9d-2266ec06aa7c	00010000-56af-8db9-dbd0-1f510389c01f	2016-02-01 17:54:21	INS	a:0:{}
2	App\\Entity\\Option	00000000-56af-8dbd-deb8-23c5e3a72d29	00010000-56af-8db9-dbd0-1f510389c01f	2016-02-01 17:54:21	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56af-8dbd-efe8-d0c2e974c705	00010000-56af-8db9-dbd0-1f510389c01f	2016-02-01 17:54:21	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 42507825)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 42507387)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56af-8db9-73c0-f47feebd863e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56af-8db9-e97d-a93ba61c528b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56af-8db9-013d-9393622812ee	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56af-8db9-734b-d00afde6fadc	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56af-8db9-7bdb-bafa06fa1bc5	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56af-8db9-3f9f-5b87f5c9f37a	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56af-8db9-4d5e-1eeb194b8dc9	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56af-8db9-f78e-6fefbc610929	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56af-8db9-746f-a9303ca58d2c	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56af-8db9-1962-c0e784d1d55e	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56af-8db9-8767-94760322fee7	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56af-8db9-07a3-075ecd9f88cf	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56af-8db9-cc22-985b4f37d1cf	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56af-8db9-a1e6-14f6aa1fea93	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56af-8db9-8975-842088fbd34d	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56af-8db9-73cf-f12d6dfa057e	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56af-8db9-1827-d3f7a77e6b4b	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56af-8db9-b228-6a2ffe775f38	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56af-8db9-eddf-73922db91bb5	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56af-8db9-79d2-6f824ec4c7dd	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56af-8db9-a4d0-a4e26b90f0c7	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56af-8db9-7ff1-4e6862f338ea	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56af-8db9-0fad-f347f968ce3d	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56af-8db9-886f-e608cd4ec83d	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56af-8db9-737f-a65741078c1b	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56af-8db9-7a0e-6c9a36c0b4aa	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56af-8db9-9d03-ea72b2923192	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56af-8db9-ec35-12576754f903	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56af-8db9-113a-78d5ab79964b	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56af-8db9-47c5-9f0548bdec2d	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56af-8db9-801e-4feadf097584	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56af-8db9-00c6-80a2e6b10679	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56af-8db9-0d1d-6462c984083e	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56af-8db9-951d-27127735d826	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56af-8db9-e56a-e474f8d7d5d1	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56af-8db9-9728-74be64e9e41a	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56af-8db9-3c50-4780dc3b79a3	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56af-8db9-b3cb-fe4b609b247e	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56af-8db9-d865-cc9691c09227	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56af-8db9-572e-98d47e1f4dae	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56af-8db9-95ad-25a2b433f19d	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56af-8db9-b430-df92f1c00334	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56af-8db9-1a06-c29dd9704457	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56af-8db9-2e9c-6cf9ae0e8099	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56af-8db9-f850-9f7e14566ce7	direktor	minimalne pravice za direktorja	t
00020000-56af-8db9-badb-e1c7054451d5	arhivar	arhivar	t
00020000-56af-8db9-c141-cfc99a4a5d39	dramaturg	dramaturg	t
00020000-56af-8db9-e7e2-b856071d61de	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56af-8db9-aaa7-fe4bf3a1fced	poslovni-sekretar	poslovni sekretar	t
00020000-56af-8db9-5c78-cc0ee8042ee8	vodja-tehnike	vodja tehnike	t
00020000-56af-8db9-af43-d8efea596efd	racunovodja	računovodja	t
00020000-56af-8dbb-8615-1fe1ec6a8f9d	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56af-8dbb-de97-14a1385104bf	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-3c00-bf596d6ee041	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-d22a-a9d74b77763c	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-aaff-04e52fae50c4	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-2874-f678ba64887b	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-4e24-4133ef096661	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-5b95-1761d17858f1	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-7151-3e8ce2599e0a	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-97da-b114f155f099	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-7754-951fadd2dd73	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-640a-df5b02ad2eba	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-4a90-6f1ca3b78c9d	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-10ce-5eac90d02eb0	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-d788-d2695d9f1a2d	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-13b7-84435cbf347a	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-f5dc-438f7f5c018a	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-eb9b-7e791079e10c	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-9a6d-2885143e8948	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-e045-4f578c719670	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56af-8dbb-eba8-658ee50ba47e	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-5597-478b1f5e612a	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-e8be-29f90d328469	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-dd5c-437987a527eb	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-7784-ffb9270835f6	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-6aad-46c44284774b	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-d1aa-4602dec1e782	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-5995-35e652523ec1	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-b368-d4f4ea81e87c	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-c1a0-4964b4c3ee25	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-424d-7205bb25b54c	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-8900-3a6d29266caf	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-d5ce-4571cbb38cb0	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-e6c0-b6988f865bb5	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-dc10-a0c3e72eeffe	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-27b1-844617b4ff1e	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-c96b-2875060dadce	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-c1b6-e3ddaaeb8284	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56af-8dbb-acb4-c8657dec678d	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 42507371)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56af-8db9-4566-82bb71977250	00020000-56af-8db9-013d-9393622812ee
00010000-56af-8db9-dbd0-1f510389c01f	00020000-56af-8db9-013d-9393622812ee
00010000-56af-8dbb-a41c-c9ea6d6e005a	00020000-56af-8dbb-8615-1fe1ec6a8f9d
00010000-56af-8dbb-3487-7339447e014e	00020000-56af-8dbb-de97-14a1385104bf
00010000-56af-8dbb-3487-7339447e014e	00020000-56af-8dbb-2874-f678ba64887b
00010000-56af-8dbb-3487-7339447e014e	00020000-56af-8dbb-97da-b114f155f099
00010000-56af-8dbb-3487-7339447e014e	00020000-56af-8dbb-640a-df5b02ad2eba
00010000-56af-8dbb-3487-7339447e014e	00020000-56af-8dbb-10ce-5eac90d02eb0
00010000-56af-8dbb-3487-7339447e014e	00020000-56af-8dbb-9a6d-2885143e8948
00010000-56af-8dbb-3487-7339447e014e	00020000-56af-8dbb-d22a-a9d74b77763c
00010000-56af-8dbb-3487-7339447e014e	00020000-56af-8dbb-eba8-658ee50ba47e
00010000-56af-8dbb-3487-7339447e014e	00020000-56af-8dbb-dd5c-437987a527eb
00010000-56af-8dbb-3487-7339447e014e	00020000-56af-8dbb-6aad-46c44284774b
00010000-56af-8dbb-3487-7339447e014e	00020000-56af-8dbb-5995-35e652523ec1
00010000-56af-8dbb-3487-7339447e014e	00020000-56af-8dbb-c1a0-4964b4c3ee25
00010000-56af-8dbb-3487-7339447e014e	00020000-56af-8dbb-e6c0-b6988f865bb5
00010000-56af-8dbb-dcf0-7a7b5bcf8c7b	00020000-56af-8dbb-de97-14a1385104bf
00010000-56af-8dbb-dcf0-7a7b5bcf8c7b	00020000-56af-8dbb-3c00-bf596d6ee041
00010000-56af-8dbb-dcf0-7a7b5bcf8c7b	00020000-56af-8dbb-d22a-a9d74b77763c
00010000-56af-8dbb-dcf0-7a7b5bcf8c7b	00020000-56af-8dbb-aaff-04e52fae50c4
00010000-56af-8dbb-dcf0-7a7b5bcf8c7b	00020000-56af-8dbb-10ce-5eac90d02eb0
00010000-56af-8dbb-dcf0-7a7b5bcf8c7b	00020000-56af-8dbb-f5dc-438f7f5c018a
00010000-56af-8dbb-dcf0-7a7b5bcf8c7b	00020000-56af-8dbb-eba8-658ee50ba47e
00010000-56af-8dbb-dcf0-7a7b5bcf8c7b	00020000-56af-8dbb-dd5c-437987a527eb
00010000-56af-8dbb-dcf0-7a7b5bcf8c7b	00020000-56af-8dbb-6aad-46c44284774b
00010000-56af-8dbb-dcf0-7a7b5bcf8c7b	00020000-56af-8dbb-5995-35e652523ec1
00010000-56af-8dbb-dcf0-7a7b5bcf8c7b	00020000-56af-8dbb-c1a0-4964b4c3ee25
00010000-56af-8dbb-dcf0-7a7b5bcf8c7b	00020000-56af-8dbb-e6c0-b6988f865bb5
00010000-56af-8dbb-c688-7957ca1b3914	00020000-56af-8dbb-de97-14a1385104bf
00010000-56af-8dbb-c688-7957ca1b3914	00020000-56af-8dbb-3c00-bf596d6ee041
00010000-56af-8dbb-c688-7957ca1b3914	00020000-56af-8dbb-d22a-a9d74b77763c
00010000-56af-8dbb-c688-7957ca1b3914	00020000-56af-8dbb-aaff-04e52fae50c4
00010000-56af-8dbb-c688-7957ca1b3914	00020000-56af-8dbb-640a-df5b02ad2eba
00010000-56af-8dbb-c688-7957ca1b3914	00020000-56af-8dbb-10ce-5eac90d02eb0
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-3c00-bf596d6ee041
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-4e24-4133ef096661
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-7754-951fadd2dd73
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-4a90-6f1ca3b78c9d
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-640a-df5b02ad2eba
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-eb9b-7e791079e10c
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-10ce-5eac90d02eb0
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-d788-d2695d9f1a2d
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-eba8-658ee50ba47e
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-5597-478b1f5e612a
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-dd5c-437987a527eb
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-7784-ffb9270835f6
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-6aad-46c44284774b
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-d1aa-4602dec1e782
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-5995-35e652523ec1
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-b368-d4f4ea81e87c
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-c1a0-4964b4c3ee25
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-424d-7205bb25b54c
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-e6c0-b6988f865bb5
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-dc10-a0c3e72eeffe
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-c96b-2875060dadce
00010000-56af-8dbb-53c4-7fd39085740d	00020000-56af-8dbb-c1b6-e3ddaaeb8284
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-3c00-bf596d6ee041
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-4e24-4133ef096661
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-7151-3e8ce2599e0a
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-7754-951fadd2dd73
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-4a90-6f1ca3b78c9d
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-640a-df5b02ad2eba
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-eb9b-7e791079e10c
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-10ce-5eac90d02eb0
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-d788-d2695d9f1a2d
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-13b7-84435cbf347a
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-eba8-658ee50ba47e
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-5597-478b1f5e612a
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-e8be-29f90d328469
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-dd5c-437987a527eb
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-7784-ffb9270835f6
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-6aad-46c44284774b
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-d1aa-4602dec1e782
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-5995-35e652523ec1
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-b368-d4f4ea81e87c
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-c1a0-4964b4c3ee25
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-424d-7205bb25b54c
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-e6c0-b6988f865bb5
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-dc10-a0c3e72eeffe
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-27b1-844617b4ff1e
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-c96b-2875060dadce
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-c1b6-e3ddaaeb8284
00010000-56af-8dbb-38f6-b97224a29f5c	00020000-56af-8dbb-acb4-c8657dec678d
00010000-56af-8dbb-44fd-151e0dbb34e1	00020000-56af-8dbb-3c00-bf596d6ee041
00010000-56af-8dbb-44fd-151e0dbb34e1	00020000-56af-8dbb-d22a-a9d74b77763c
00010000-56af-8dbb-44fd-151e0dbb34e1	00020000-56af-8dbb-4e24-4133ef096661
00010000-56af-8dbb-44fd-151e0dbb34e1	00020000-56af-8dbb-5b95-1761d17858f1
00010000-56af-8dbb-44fd-151e0dbb34e1	00020000-56af-8dbb-7151-3e8ce2599e0a
00010000-56af-8dbb-44fd-151e0dbb34e1	00020000-56af-8dbb-2874-f678ba64887b
00010000-56af-8dbb-44fd-151e0dbb34e1	00020000-56af-8dbb-7754-951fadd2dd73
00010000-56af-8dbb-44fd-151e0dbb34e1	00020000-56af-8dbb-4a90-6f1ca3b78c9d
00010000-56af-8dbb-44fd-151e0dbb34e1	00020000-56af-8dbb-640a-df5b02ad2eba
00010000-56af-8dbb-44fd-151e0dbb34e1	00020000-56af-8dbb-eb9b-7e791079e10c
00010000-56af-8dbb-2297-818a00a079a6	00020000-56af-8dbb-de97-14a1385104bf
00010000-56af-8dbb-2297-818a00a079a6	00020000-56af-8dbb-aaff-04e52fae50c4
00010000-56af-8dbb-2297-818a00a079a6	00020000-56af-8dbb-2874-f678ba64887b
00010000-56af-8dbb-2297-818a00a079a6	00020000-56af-8dbb-97da-b114f155f099
00010000-56af-8dbb-2297-818a00a079a6	00020000-56af-8dbb-640a-df5b02ad2eba
00010000-56af-8dbb-2297-818a00a079a6	00020000-56af-8dbb-10ce-5eac90d02eb0
00010000-56af-8dbb-2297-818a00a079a6	00020000-56af-8dbb-9a6d-2885143e8948
00010000-56af-8dbb-2297-818a00a079a6	00020000-56af-8dbb-8900-3a6d29266caf
00010000-56af-8dbb-de78-a2400711c45e	00020000-56af-8dbb-e045-4f578c719670
00010000-56af-8dbb-c2a9-4e5b74a883f4	00020000-56af-8db9-f850-9f7e14566ce7
00010000-56af-8dbb-d26e-2bbb9806ba1a	00020000-56af-8db9-badb-e1c7054451d5
00010000-56af-8dbb-9bfc-886e3554cb4d	00020000-56af-8db9-c141-cfc99a4a5d39
00010000-56af-8dbb-5639-c83ee344ff77	00020000-56af-8db9-e7e2-b856071d61de
00010000-56af-8dbb-b3de-073eec0d3386	00020000-56af-8db9-aaa7-fe4bf3a1fced
00010000-56af-8dbb-7402-842bcf106802	00020000-56af-8db9-5c78-cc0ee8042ee8
00010000-56af-8dbb-ab43-84766ed7c393	00020000-56af-8db9-af43-d8efea596efd
\.


--
-- TOC entry 3186 (class 0 OID 42507839)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 42507777)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 42507700)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56af-8dbb-94d1-6d6658933ec6	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56af-8dbb-18f5-2163ed72921a	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56af-8dbb-cb64-6c3477183f71	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56af-8dbb-31bb-e528c3a2e20e	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 42507336)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56af-8db8-8943-7a16f3f755ee	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56af-8db8-a80a-ff3c7fcd3dce	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56af-8db8-c319-13212c2ea749	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56af-8db8-bdbc-71bebe37fc74	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56af-8db8-9f49-0608604be483	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 42507328)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56af-8db8-1aea-d5d5eef8ebc2	00230000-56af-8db8-bdbc-71bebe37fc74	popa
00240000-56af-8db8-15b8-2e5d81780722	00230000-56af-8db8-bdbc-71bebe37fc74	oseba
00240000-56af-8db8-ef98-859f87ed667a	00230000-56af-8db8-bdbc-71bebe37fc74	tippopa
00240000-56af-8db8-ab9f-1da2bfb9b977	00230000-56af-8db8-bdbc-71bebe37fc74	organizacijskaenota
00240000-56af-8db8-241e-4d51bfcc2413	00230000-56af-8db8-bdbc-71bebe37fc74	sezona
00240000-56af-8db8-b981-135f828b3470	00230000-56af-8db8-bdbc-71bebe37fc74	tipvaje
00240000-56af-8db8-d60f-5b99c85d6e08	00230000-56af-8db8-bdbc-71bebe37fc74	tipdodatka
00240000-56af-8db8-673d-ac8124249758	00230000-56af-8db8-a80a-ff3c7fcd3dce	prostor
00240000-56af-8db8-1eeb-efd76b6a5f71	00230000-56af-8db8-bdbc-71bebe37fc74	besedilo
00240000-56af-8db8-87ed-9ae88d79776b	00230000-56af-8db8-bdbc-71bebe37fc74	uprizoritev
00240000-56af-8db8-e345-ecab696afba1	00230000-56af-8db8-bdbc-71bebe37fc74	funkcija
00240000-56af-8db8-6ec2-22df6f2136dd	00230000-56af-8db8-bdbc-71bebe37fc74	tipfunkcije
00240000-56af-8db8-e4ef-689d884d8e52	00230000-56af-8db8-bdbc-71bebe37fc74	alternacija
00240000-56af-8db8-d493-a8c8fef11cd8	00230000-56af-8db8-8943-7a16f3f755ee	pogodba
00240000-56af-8db8-8385-ca615cdb03b3	00230000-56af-8db8-bdbc-71bebe37fc74	zaposlitev
00240000-56af-8db8-57ab-1ad2a06c7c61	00230000-56af-8db8-bdbc-71bebe37fc74	zvrstuprizoritve
00240000-56af-8db8-af46-1ce5ee975028	00230000-56af-8db8-8943-7a16f3f755ee	programdela
00240000-56af-8db8-3143-25a6fb1fdbff	00230000-56af-8db8-bdbc-71bebe37fc74	zapis
\.


--
-- TOC entry 3133 (class 0 OID 42507323)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
61d24b70-9b66-4299-b1e1-dbe7df9e6212	00240000-56af-8db8-1aea-d5d5eef8ebc2	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 42507900)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56af-8dbc-3ff6-b2baf47585ae	000e0000-56af-8dbb-d68a-c95453b28004	00080000-56af-8dbb-acd4-da77d56e58b5	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56af-8db8-ffcc-a9c2c92024cf
00270000-56af-8dbc-ab86-ce50fb059ad8	000e0000-56af-8dbb-d68a-c95453b28004	00080000-56af-8dbb-acd4-da77d56e58b5	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56af-8db8-ffcc-a9c2c92024cf
\.


--
-- TOC entry 3149 (class 0 OID 42507472)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 42507719)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56af-8dbc-fd20-c33660ae538e	00180000-56af-8dbc-359e-b35b25bbebac	000c0000-56af-8dbc-b7ce-6c6aa252f049	00090000-56af-8dbb-a379-3c3f6c2edf4c	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56af-8dbc-8700-17f7eac6fd91	00180000-56af-8dbc-359e-b35b25bbebac	000c0000-56af-8dbc-fce2-f647f2734025	00090000-56af-8dbb-b9a0-9f766ab4b055	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56af-8dbc-aca2-87d87a069939	00180000-56af-8dbc-359e-b35b25bbebac	000c0000-56af-8dbc-3b02-784de8fce6c8	00090000-56af-8dbb-cffd-251b25733074	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56af-8dbc-43f4-d668986c2746	00180000-56af-8dbc-359e-b35b25bbebac	000c0000-56af-8dbc-5b19-d17552ca60ec	00090000-56af-8dbb-887b-b8b2d4b5f636	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56af-8dbc-c6b2-9811933ec09c	00180000-56af-8dbc-359e-b35b25bbebac	000c0000-56af-8dbc-ec0a-3d8527d825a1	00090000-56af-8dbb-37d0-c21d076aa4c5	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56af-8dbc-71b3-8fdc0613e82a	00180000-56af-8dbc-cae0-67f7a6e3b3ce	\N	00090000-56af-8dbb-37d0-c21d076aa4c5	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	f	\N	\N
001a0000-56af-8dbc-a461-4f0664b808c4	00180000-56af-8dbc-ee64-dfb55e5d00d1	\N	00090000-56af-8dbb-b9a0-9f766ab4b055	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	f	\N	\N
001a0000-56af-8dbc-e4b9-2c3c4529d8dd	00180000-56af-8dbc-359e-b35b25bbebac	\N	00090000-56af-8dbb-f66b-dbd4063dadad	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	f	\N	\N
001a0000-56af-8dbc-bea5-b3511ca44ac8	00180000-56af-8dbc-0cf2-9c6aa40f257c	\N	00090000-56af-8dbb-a379-3c3f6c2edf4c	0	2015-03-10 07:00:00	0	2015-03-20 23:00:00	f	f	t	\N	\N
001a0000-56af-8dbc-82c8-4f6a5bbd333e	00180000-56af-8dbc-0cf2-9c6aa40f257c	\N	00090000-56af-8dbb-b9a0-9f766ab4b055	0	2015-03-10 07:00:00	0	2015-03-20 23:00:00	f	f	t	\N	\N
001a0000-56af-8dbc-cb35-7d091e4e4d37	00180000-56af-8dbc-0cf2-9c6aa40f257c	\N	00090000-56af-8dbb-5b41-47e58401e73e	0	2015-03-10 07:00:00	15840	2015-03-31 23:00:00	f	f	t	\N	\N
001a0000-56af-8dbc-64af-0dbfd5945d66	00180000-56af-8dbc-d82e-a745accffaae	000c0000-56af-8dbc-b7ce-6c6aa252f049	00090000-56af-8dbb-a379-3c3f6c2edf4c	0	2015-03-15 20:00:00	120	2015-03-15 23:00:00	f	f	f	\N	\N
001a0000-56af-8dbc-7c7f-a97bba2e5ad4	00180000-56af-8dbc-d82e-a745accffaae	000c0000-56af-8dbc-fce2-f647f2734025	00090000-56af-8dbb-b9a0-9f766ab4b055	0	2015-03-15 20:00:00	120	2015-03-15 23:00:00	f	f	f	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 42507736)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56af-8db8-d9c4-cddc4eef2e09	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56af-8db8-7f74-bb5833754166	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56af-8db8-6a4e-e75b1614b7a1	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56af-8db8-b94d-3ac0e0f463e1	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56af-8db8-ad92-cf188548227f	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56af-8db8-c3a7-db09bb8c9244	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 42507941)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56af-8db8-3cee-e3dc060ba73d	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56af-8db8-4035-76b2baa6f392	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56af-8db8-4cf0-b581b0610146	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56af-8db8-12f8-2e9e0ad03319	04	Režija	Režija	Režija	umetnik	30
000f0000-56af-8db8-8642-5dbcf3dd9c4d	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56af-8db8-ad09-2a71eb4eab92	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56af-8db8-d7d8-4d0dc33052a1	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56af-8db8-6d6a-19dd59eab9b2	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56af-8db8-3197-65508d4b0ea7	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56af-8db8-8478-a59ebc31b73e	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56af-8db8-06d7-692f902883de	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56af-8db8-43b6-305c023309ab	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56af-8db8-ae51-4fb40b342126	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56af-8db8-acca-5e8dd44215d1	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56af-8db8-6b1f-d97b59a99e41	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56af-8db8-4c05-4667074aa970	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56af-8db8-e12e-f0fd8b282a23	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56af-8db8-b654-9176c4db6965	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56af-8db8-ac74-90cf0a8b02b8	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 42507423)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56af-8dbb-64da-c03c1414c1af	0001	šola	osnovna ali srednja šola
00400000-56af-8dbb-1c8a-d48192dd22f8	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56af-8dbb-1696-50d72fbeb998	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 42508245)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56af-8db8-4185-ea3ace3d5466	01	Velika predstava	f	1.00	1.00
002b0000-56af-8db8-02de-5bb7fafbb63a	02	Mala predstava	f	0.50	0.50
002b0000-56af-8db8-7dfa-e503db1ea6c7	03	Mala koprodukcija	t	0.40	1.00
002b0000-56af-8db8-9eb4-bd9d65abd964	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56af-8db8-1ddc-b9437185cbed	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 42507690)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56af-8db8-4954-21bf168d4dc0	0001	prva vaja	prva vaja
00420000-56af-8db8-ae6c-fb6738e245fa	0002	tehnična vaja	tehnična vaja
00420000-56af-8db8-b37d-8c6b49a27f6d	0003	lučna vaja	lučna vaja
00420000-56af-8db8-2edf-e87f128f7022	0004	kostumska vaja	kostumska vaja
00420000-56af-8db8-122d-0815bab9afa5	0005	foto vaja	foto vaja
00420000-56af-8db8-cf77-16a19edadc48	0006	1. glavna vaja	1. glavna vaja
00420000-56af-8db8-7e1d-5e2c4319bc8b	0007	2. glavna vaja	2. glavna vaja
00420000-56af-8db8-5b5c-2180473307c9	0008	1. generalka	1. generalka
00420000-56af-8db8-61a7-5bd5b207fe1d	0009	2. generalka	2. generalka
00420000-56af-8db8-c573-b93d82bd64f8	0010	odprta generalka	odprta generalka
00420000-56af-8db8-4574-d866d32f4f06	0011	obnovitvena vaja	obnovitvena vaja
00420000-56af-8db8-2f42-e2db3bae53a5	0012	italijanka	krajša "obnovitvena" vaja
00420000-56af-8db8-59d1-c52c8ef3b9c1	0013	pevska vaja	pevska vaja
00420000-56af-8db8-b929-124fc69e0da5	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56af-8db8-d468-12cd3ca88c52	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56af-8db8-13b6-b209c256ee2e	0016	orientacijska vaja	orientacijska vaja
00420000-56af-8db8-5582-146d8a2c24be	0017	situacijska vaja	situacijska vaja
00420000-56af-8db8-f73f-21f1d93719c4	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 42507545)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 42507358)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56af-8db9-dbd0-1f510389c01f	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROIaaY6myn5UssbpCnIe/ojKH6.uxPWz2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-b16d-2a78b6c08a40	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-ead1-5ac0eff4603c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-5bd4-528910daf1ec	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-be25-d591c44a0fe2	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-e5d7-78b8e472b3fd	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-f868-c5d37cbe3344	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-f222-06f9840df421	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-dfb0-0c388b92189d	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-1bf1-aa2187ab25c6	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-a41c-c9ea6d6e005a	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-cb57-2a6d3aeebfe7	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-3487-7339447e014e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-dcf0-7a7b5bcf8c7b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-c688-7957ca1b3914	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-53c4-7fd39085740d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-38f6-b97224a29f5c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-44fd-151e0dbb34e1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-2297-818a00a079a6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-de78-a2400711c45e	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-c2a9-4e5b74a883f4	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-d26e-2bbb9806ba1a	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-9bfc-886e3554cb4d	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-5639-c83ee344ff77	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-b3de-073eec0d3386	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-7402-842bcf106802	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56af-8dbb-ab43-84766ed7c393	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56af-8db9-4566-82bb71977250	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 42507991)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56af-8dbb-789e-8242186d280e	00160000-56af-8dbb-d4bd-98b2fdca948a	\N	00140000-56af-8db8-f103-0c9cbd246890	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56af-8dbb-c249-d6eff787febc
000e0000-56af-8dbb-d68a-c95453b28004	00160000-56af-8dbb-934f-de6304037bd5	\N	00140000-56af-8db8-c2da-388277f86cd1	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56af-8dbb-59b8-58dbe47df43c
000e0000-56af-8dbb-1562-ea7cb1201e54	\N	\N	00140000-56af-8db8-c2da-388277f86cd1	00190000-56af-8dbb-8e92-3948c7a124ae	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56af-8dbb-c249-d6eff787febc
000e0000-56af-8dbb-87f0-670b9a4aca5b	\N	\N	00140000-56af-8db8-c2da-388277f86cd1	00190000-56af-8dbb-8e92-3948c7a124ae	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56af-8dbb-c249-d6eff787febc
000e0000-56af-8dbb-e440-3d2c4680b001	\N	\N	00140000-56af-8db8-c2da-388277f86cd1	00190000-56af-8dbb-8e92-3948c7a124ae	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-8dbb-655f-d103582e7fdd
000e0000-56af-8dbb-5407-d877bf3a7dd7	\N	\N	00140000-56af-8db8-c2da-388277f86cd1	00190000-56af-8dbb-8e92-3948c7a124ae	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-8dbb-655f-d103582e7fdd
000e0000-56af-8dbb-49cc-23eb6ef21277	\N	\N	00140000-56af-8db8-75c9-e6699c0f889a	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-8dbb-655f-d103582e7fdd
000e0000-56af-8dbb-7a8a-0088efb3b2d2	\N	\N	00140000-56af-8db8-75c9-e6699c0f889a	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-8dbb-655f-d103582e7fdd
000e0000-56af-8dbb-fbb3-82f3400afa13	\N	\N	00140000-56af-8db8-75c9-e6699c0f889a	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-8dbb-655f-d103582e7fdd
000e0000-56af-8dbc-8757-3b4c832b6694	\N	\N	00140000-56af-8db8-75c9-e6699c0f889a	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-8dbb-655f-d103582e7fdd
000e0000-56af-8dbc-bf6c-9480dc8e4ca8	\N	\N	00140000-56af-8db8-75c9-e6699c0f889a	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-8dbb-655f-d103582e7fdd
000e0000-56af-8dbc-e4ac-d0fdb531f514	\N	\N	00140000-56af-8db8-75c9-e6699c0f889a	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-8dbb-655f-d103582e7fdd
000e0000-56af-8dbc-848a-7ddf257413a9	\N	\N	00140000-56af-8db8-75c9-e6699c0f889a	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-8dbb-655f-d103582e7fdd
000e0000-56af-8dbc-9112-efe7117d534e	\N	\N	00140000-56af-8db8-75c9-e6699c0f889a	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-8dbb-655f-d103582e7fdd
000e0000-56af-8dbc-edf1-e921a55e9d77	\N	\N	00140000-56af-8db8-75c9-e6699c0f889a	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-8dbb-655f-d103582e7fdd
\.


--
-- TOC entry 3170 (class 0 OID 42507710)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 42507638)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56af-8dbc-6c17-37b6c38c9d36	\N	000e0000-56af-8dbb-d68a-c95453b28004	3
00200000-56af-8dbc-9cee-ab6fc1fe3450	\N	000e0000-56af-8dbb-d68a-c95453b28004	4
00200000-56af-8dbc-592e-ac113a4c75a0	\N	000e0000-56af-8dbb-d68a-c95453b28004	6
00200000-56af-8dbc-a923-fa2ff00d2c29	\N	000e0000-56af-8dbb-d68a-c95453b28004	5
00200000-56af-8dbc-1a9a-3f76e09c90ad	\N	000e0000-56af-8dbb-d68a-c95453b28004	7
00200000-56af-8dbc-bdcb-e20658a18cee	\N	000e0000-56af-8dbb-789e-8242186d280e	1
00200000-56af-8dbc-fcc4-d6543103707d	\N	000e0000-56af-8dbb-d68a-c95453b28004	2
00200000-56af-8dbc-aa9d-a84be19bb599	\N	000e0000-56af-8dbb-d68a-c95453b28004	1
00200000-56af-8dbc-143e-44889b247ef9	\N	000e0000-56af-8dbb-d68a-c95453b28004	8
00200000-56af-8dbc-8dcd-e7cd69245119	\N	000e0000-56af-8dbb-d68a-c95453b28004	9
\.


--
-- TOC entry 3182 (class 0 OID 42507803)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 42507914)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56af-8db8-fe4a-cbec8e573a3f	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56af-8db8-82d8-f4de8eddfa0b	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56af-8db8-10d8-9231f86659fd	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56af-8db8-c634-bea2c791b4c2	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56af-8db8-2726-047954e60846	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56af-8db8-3e3b-f03eac059db3	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56af-8db8-9a8e-a31687241014	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56af-8db8-fd40-7a0981a5429b	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56af-8db8-ffcc-a9c2c92024cf	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56af-8db8-0616-046b74052942	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56af-8db8-e556-0b8da74536b7	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56af-8db8-07e9-173cd205a5a2	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56af-8db8-c3ae-3aa5e0df26a7	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56af-8db8-1a88-ddd146f4070f	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56af-8db8-e3a3-07fe5b19a5ca	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56af-8db8-6598-838559b84435	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56af-8db8-e186-8ed10c878221	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56af-8db8-c37b-6b4f3867b752	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56af-8db8-01d6-520422d3ee40	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56af-8db8-d6bb-0df40e1a3119	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56af-8db8-0dd4-a39f5aa32127	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56af-8db8-da97-c6ab95e52aca	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56af-8db8-e5f2-8d61e40462da	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56af-8db8-7ff5-84cd4866341b	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56af-8db8-3bb9-c68bb60c03cf	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56af-8db8-0c48-b853f05c1321	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56af-8db8-4e6e-b6f523645744	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56af-8db8-e950-b48973032d7c	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 42508295)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 42508264)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 42508307)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 42507876)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56af-8dbb-d5e1-d187a968f91a	00090000-56af-8dbb-b9a0-9f766ab4b055	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-8dbb-d389-bf88416ca7e6	00090000-56af-8dbb-cffd-251b25733074	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-8dbb-ddc1-2c4ac5dc01d3	00090000-56af-8dbb-8c51-662d96d8ee74	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-8dbb-ecc4-b98d52bc254e	00090000-56af-8dbb-5b41-47e58401e73e	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-8dbb-fdeb-7554a58d4ea6	00090000-56af-8dbb-68b2-0e627ed20b9d	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-8dbb-5b8b-682a3cd3eb9f	00090000-56af-8dbb-7870-7fa4b5324ff7	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 42507981)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56af-8db8-f103-0c9cbd246890	01	Drama	drama (SURS 01)
00140000-56af-8db8-8ab3-309f47a118e3	02	Opera	opera (SURS 02)
00140000-56af-8db8-2479-3a05a89e8660	03	Balet	balet (SURS 03)
00140000-56af-8db8-86e4-5c523d98b387	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56af-8db8-75c9-e6699c0f889a	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56af-8db8-c2da-388277f86cd1	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56af-8db8-f1b2-4d8db7da79fe	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 42507866)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 42507422)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 42508039)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 42508030)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 42507412)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 42507897)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 42507939)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 42508348)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 42507733)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 42507667)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 42507684)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 42507689)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 42508262)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 42507571)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 42508108)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 42507862)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 42507636)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 42507609)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 42507585)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 42507769)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 42508325)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 42508332)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 42508356)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2766 (class 2606 OID 42507795)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 42507543)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 42507441)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 42507505)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 42507468)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 42507401)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 42507386)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 42507801)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 42507838)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 42507976)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 42507496)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 42507531)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 42508213)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 42507775)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 42507521)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 42507652)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 42507624)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 42507618)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 36291782)
-- Name: prisotnost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT prisotnost_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 42507787)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 42508222)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 42508230)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 42508200)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 42508243)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 42507820)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 42507760)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 42507751)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 42507963)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 42507890)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 42507597)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 42507357)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 42507829)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 42507375)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 42507395)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 42507847)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 42507782)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 42507708)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 42507345)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 42507333)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 42507327)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 42507910)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 42507477)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 42507725)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 42507743)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 42507950)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 42507430)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 42508255)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 42507697)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 42507556)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 42507370)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 42508009)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 42507716)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 42507642)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 42507809)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 42507922)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 42508305)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 42508289)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 42508313)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 42507880)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 37017867)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 42507989)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 42507874)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 42507678)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 42507679)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 42507677)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 42507675)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 42507676)
-- Name: idx_11e93b5d7634c214; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d7634c214 ON dogodek USING btree (nadrejenogostovanje_id);


--
-- TOC entry 2708 (class 1259 OID 42507674)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 42507911)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 42507912)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 42507913)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 42508327)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 42508326)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 42507498)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 42507499)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 42507802)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 42508293)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 42508292)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 42508294)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 42508291)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 42508290)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 42507788)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 42507643)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 42507644)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 42507863)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 42507865)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 42507864)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 42507587)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 42507586)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 42508244)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 42507978)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 42507979)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 42507980)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 42508314)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 42508014)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 42508011)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 42508015)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 42508013)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 42508012)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 42507558)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 42507557)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 42507471)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 42507830)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 42507402)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 42507403)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 42507850)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 42507849)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 42507848)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 42507508)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 42507507)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 42507509)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 42507619)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2595 (class 1259 OID 42507335)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 42507755)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 42507753)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 42507752)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 42507754)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 42507376)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 42507377)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 42507810)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 42508349)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 42507899)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 42507898)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 42508357)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 42508358)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 42507776)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 42507891)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 42507892)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 42508113)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 42508112)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 42508109)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 42508110)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 42508111)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 42507523)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 42507522)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 42507524)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 42507824)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 42507823)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 42508223)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 42508224)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 42508043)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 42508044)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 42508041)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 42508042)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 42507734)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 42507735)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 42507881)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 42507882)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 42507717)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 42507764)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 42507763)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 42507761)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 42507762)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 42508031)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 42507598)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 42507612)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 42507611)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 42507610)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 42507613)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 42507637)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 42507625)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 42507626)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 42508214)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 42508263)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 42508333)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 42508334)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 42507443)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 42507442)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 42507478)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 42507479)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 42507728)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 42507727)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 42507726)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 42507670)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 42507673)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 42507668)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 42507672)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 42507671)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 42507497)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 42507431)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 42507432)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 42507572)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 42507574)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 42507573)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 42507575)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 42507770)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 42507977)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 42508010)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 42507951)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 42507952)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 42507469)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 42507470)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 42507744)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 42507745)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 42507875)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 42507346)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 42507544)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 42507506)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 42507334)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 42508256)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 42507822)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 42507821)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 42507698)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 42507699)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 42508040)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 42507718)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 42507532)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 42507990)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 42508306)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 42508231)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 42508232)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 42507940)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 42507709)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 42507396)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2941 (class 2606 OID 42508519)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2946 (class 2606 OID 42508544)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2944 (class 2606 OID 42508534)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2940 (class 2606 OID 42508514)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2947 (class 2606 OID 42508549)
-- Name: fk_11e93b5d7634c214; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d7634c214 FOREIGN KEY (nadrejenogostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2943 (class 2606 OID 42508529)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2945 (class 2606 OID 42508539)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2942 (class 2606 OID 42508524)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2983 (class 2606 OID 42508729)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 42508734)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2985 (class 2606 OID 42508739)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3017 (class 2606 OID 42508899)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3016 (class 2606 OID 42508894)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2920 (class 2606 OID 42508414)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2921 (class 2606 OID 42508419)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 42508644)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3013 (class 2606 OID 42508879)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 42508874)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3014 (class 2606 OID 42508884)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3011 (class 2606 OID 42508869)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3010 (class 2606 OID 42508864)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 42508639)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2938 (class 2606 OID 42508504)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2939 (class 2606 OID 42508509)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 42508684)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 42508694)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 42508689)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2931 (class 2606 OID 42508469)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2930 (class 2606 OID 42508464)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 42508629)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 42508854)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2986 (class 2606 OID 42508744)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 42508749)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2988 (class 2606 OID 42508754)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 42508889)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2992 (class 2606 OID 42508774)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2989 (class 2606 OID 42508759)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2993 (class 2606 OID 42508779)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 42508769)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2990 (class 2606 OID 42508764)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2929 (class 2606 OID 42508459)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2928 (class 2606 OID 42508454)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2917 (class 2606 OID 42508399)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2916 (class 2606 OID 42508394)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 42508664)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2912 (class 2606 OID 42508374)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2913 (class 2606 OID 42508379)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2973 (class 2606 OID 42508679)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 42508674)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2971 (class 2606 OID 42508669)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 42508429)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2922 (class 2606 OID 42508424)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2924 (class 2606 OID 42508434)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 42508484)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 42508359)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2958 (class 2606 OID 42508604)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2956 (class 2606 OID 42508594)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2955 (class 2606 OID 42508589)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2957 (class 2606 OID 42508599)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2910 (class 2606 OID 42508364)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2911 (class 2606 OID 42508369)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 42508649)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 42508914)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2982 (class 2606 OID 42508724)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2981 (class 2606 OID 42508719)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3021 (class 2606 OID 42508919)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3022 (class 2606 OID 42508924)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 42508634)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2979 (class 2606 OID 42508709)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2980 (class 2606 OID 42508714)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3003 (class 2606 OID 42508829)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3002 (class 2606 OID 42508824)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2999 (class 2606 OID 42508809)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3000 (class 2606 OID 42508814)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 42508819)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 42508444)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 42508439)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 42508449)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2969 (class 2606 OID 42508659)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2968 (class 2606 OID 42508654)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3005 (class 2606 OID 42508839)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3006 (class 2606 OID 42508844)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2997 (class 2606 OID 42508799)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2998 (class 2606 OID 42508804)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2995 (class 2606 OID 42508789)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2996 (class 2606 OID 42508794)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2953 (class 2606 OID 42508579)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2954 (class 2606 OID 42508584)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2977 (class 2606 OID 42508699)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2978 (class 2606 OID 42508704)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2948 (class 2606 OID 42508554)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2949 (class 2606 OID 42508559)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2962 (class 2606 OID 42508624)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2961 (class 2606 OID 42508619)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2959 (class 2606 OID 42508609)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2960 (class 2606 OID 42508614)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 42508784)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 42508474)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 42508479)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2937 (class 2606 OID 42508499)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2935 (class 2606 OID 42508489)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2936 (class 2606 OID 42508494)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 42508834)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 42508849)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 42508859)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3018 (class 2606 OID 42508904)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3019 (class 2606 OID 42508909)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2915 (class 2606 OID 42508389)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2914 (class 2606 OID 42508384)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2918 (class 2606 OID 42508404)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 42508409)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 42508574)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 42508569)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2950 (class 2606 OID 42508564)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-02-01 17:54:23 CET

--
-- PostgreSQL database dump complete
--

