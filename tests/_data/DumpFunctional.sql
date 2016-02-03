--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-02-02 17:07:05 CET

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
-- TOC entry 185 (class 1259 OID 42946940)
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
-- TOC entry 241 (class 1259 OID 42947558)
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
-- TOC entry 240 (class 1259 OID 42947542)
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
-- TOC entry 184 (class 1259 OID 42946933)
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
-- TOC entry 183 (class 1259 OID 42946931)
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
-- TOC entry 231 (class 1259 OID 42947419)
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
-- TOC entry 234 (class 1259 OID 42947449)
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
-- TOC entry 255 (class 1259 OID 42947861)
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
-- TOC entry 212 (class 1259 OID 42947255)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 42947180)
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
-- TOC entry 206 (class 1259 OID 42947206)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 42947211)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 42947783)
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
-- TOC entry 196 (class 1259 OID 42947086)
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
-- TOC entry 242 (class 1259 OID 42947571)
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
-- TOC entry 227 (class 1259 OID 42947377)
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
-- TOC entry 202 (class 1259 OID 42947154)
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
-- TOC entry 199 (class 1259 OID 42947126)
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
-- TOC entry 197 (class 1259 OID 42947103)
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
-- TOC entry 216 (class 1259 OID 42947291)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 42947841)
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
-- TOC entry 254 (class 1259 OID 42947854)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 42947876)
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
-- TOC entry 220 (class 1259 OID 42947315)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 42947060)
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
-- TOC entry 187 (class 1259 OID 42946960)
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
-- TOC entry 191 (class 1259 OID 42947027)
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
-- TOC entry 188 (class 1259 OID 42946971)
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
-- TOC entry 180 (class 1259 OID 42946905)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 42946924)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 42947322)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 42947357)
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
-- TOC entry 237 (class 1259 OID 42947490)
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
-- TOC entry 190 (class 1259 OID 42947007)
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
-- TOC entry 193 (class 1259 OID 42947052)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 42947727)
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
-- TOC entry 217 (class 1259 OID 42947297)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 42947037)
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
-- TOC entry 204 (class 1259 OID 42947172)
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
-- TOC entry 200 (class 1259 OID 42947141)
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
-- TOC entry 201 (class 1259 OID 42947147)
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
-- TOC entry 219 (class 1259 OID 42947309)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 42947741)
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
-- TOC entry 246 (class 1259 OID 42947751)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 42947640)
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
-- TOC entry 247 (class 1259 OID 42947759)
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
-- TOC entry 223 (class 1259 OID 42947337)
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
-- TOC entry 215 (class 1259 OID 42947282)
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
-- TOC entry 214 (class 1259 OID 42947272)
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
-- TOC entry 236 (class 1259 OID 42947479)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 42947409)
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
-- TOC entry 198 (class 1259 OID 42947115)
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
-- TOC entry 177 (class 1259 OID 42946876)
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
-- TOC entry 176 (class 1259 OID 42946874)
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
-- TOC entry 224 (class 1259 OID 42947351)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 42946914)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 42946898)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 42947365)
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
-- TOC entry 218 (class 1259 OID 42947303)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 42947226)
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
-- TOC entry 175 (class 1259 OID 42946863)
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
-- TOC entry 174 (class 1259 OID 42946855)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 42946850)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 42947426)
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
-- TOC entry 189 (class 1259 OID 42946999)
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
-- TOC entry 211 (class 1259 OID 42947245)
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
-- TOC entry 213 (class 1259 OID 42947262)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 42947467)
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
-- TOC entry 186 (class 1259 OID 42946950)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 42947771)
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
-- TOC entry 208 (class 1259 OID 42947216)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 42947072)
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
-- TOC entry 178 (class 1259 OID 42946885)
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
-- TOC entry 239 (class 1259 OID 42947517)
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
-- TOC entry 210 (class 1259 OID 42947236)
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
-- TOC entry 203 (class 1259 OID 42947165)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 42947329)
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
-- TOC entry 233 (class 1259 OID 42947440)
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
-- TOC entry 251 (class 1259 OID 42947821)
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
-- TOC entry 250 (class 1259 OID 42947790)
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
-- TOC entry 252 (class 1259 OID 42947833)
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
-- TOC entry 229 (class 1259 OID 42947402)
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
-- TOC entry 238 (class 1259 OID 42947507)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 42947392)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 42946936)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 42946879)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 42946940)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56b0-d425-2706-7f62c118561b	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56b0-d425-7ed1-61bf0339c427	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56b0-d425-1133-019cbe12cc03	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 42947558)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56b0-d426-7f0b-2f8e5cd49256	000d0000-56b0-d426-0feb-8d71f5584541	\N	00090000-56b0-d425-158b-4a52ca15ea6f	000b0000-56b0-d425-33ed-712435469dba	0001	f	\N	\N	\N	3	t	t	t
000c0000-56b0-d426-c538-a918ebbc42fe	000d0000-56b0-d426-6e19-0f05561d2ca7	00100000-56b0-d425-5eeb-14b087655a7f	00090000-56b0-d425-2822-0861f8e36e10	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56b0-d426-bb82-89f1dacee9ba	000d0000-56b0-d426-33f2-24e156acf26b	00100000-56b0-d425-0648-921eab70b91c	00090000-56b0-d425-9fc8-1247cb14ae39	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56b0-d426-5714-287d330fd996	000d0000-56b0-d426-f51f-255e6c31cb5a	\N	00090000-56b0-d425-08be-c6080a71c39d	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56b0-d426-b248-d9ff5280fadd	000d0000-56b0-d426-1fe3-001b2e544d0c	\N	00090000-56b0-d425-15a8-2f10ac0c8e1d	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56b0-d426-dbab-741429a31ff5	000d0000-56b0-d426-d737-5e7d27b5dcea	\N	00090000-56b0-d425-5ff9-9ca721572b72	000b0000-56b0-d425-321f-dd1c5e8db872	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56b0-d426-4bc0-1a4885eafa24	000d0000-56b0-d426-6c29-780acef857c5	00100000-56b0-d425-ef37-c75f25e41d0a	00090000-56b0-d425-73cf-2f76f8cabfe5	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56b0-d426-b6f1-8b04e11c6500	000d0000-56b0-d426-cfce-800802d54288	\N	00090000-56b0-d425-ca62-12399a8a78c2	000b0000-56b0-d425-81e5-c9da9e05aae4	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56b0-d426-cb84-d0fe76766ba2	000d0000-56b0-d426-6c29-780acef857c5	00100000-56b0-d425-c351-419e71c3a775	00090000-56b0-d425-5fec-173312cb4611	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56b0-d426-6d21-6f2b5e2616c6	000d0000-56b0-d426-6c29-780acef857c5	00100000-56b0-d425-aa79-4ee60452602c	00090000-56b0-d425-e82c-cc5d47f04804	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56b0-d426-10f9-10cbefedeb16	000d0000-56b0-d426-6c29-780acef857c5	00100000-56b0-d425-927f-7c008017253c	00090000-56b0-d425-98a8-043289a3c534	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56b0-d426-f793-c9affd57d6af	000d0000-56b0-d426-cfe5-23e701ebcb81	00100000-56b0-d425-5eeb-14b087655a7f	00090000-56b0-d425-2822-0861f8e36e10	000b0000-56b0-d425-08b4-3af618e6ff25	0012	t	\N	\N	\N	2	t	t	t
000c0000-56b0-d426-e62c-1868fcfa84f8	000d0000-56b0-d426-45c5-af68a84b830d	\N	00090000-56b0-d425-ca62-12399a8a78c2	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56b0-d426-5d2b-f3837011b07c	000d0000-56b0-d426-45c5-af68a84b830d	\N	00090000-56b0-d425-8993-2fdb18ae264c	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56b0-d426-5bf1-cd80cfc5fdb3	000d0000-56b0-d426-eb49-55067fa498ec	00100000-56b0-d425-0648-921eab70b91c	00090000-56b0-d425-9fc8-1247cb14ae39	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56b0-d426-5731-3d93ff046872	000d0000-56b0-d426-eb49-55067fa498ec	\N	00090000-56b0-d425-8993-2fdb18ae264c	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56b0-d426-e63f-eaedd236128a	000d0000-56b0-d426-b865-00e08e235ec9	\N	00090000-56b0-d425-8993-2fdb18ae264c	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56b0-d426-dd22-f669074ccb0a	000d0000-56b0-d426-b865-00e08e235ec9	\N	00090000-56b0-d425-ca62-12399a8a78c2	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56b0-d426-ebd3-9f878a1b123d	000d0000-56b0-d426-0ca3-02b51acfa034	00100000-56b0-d425-ef37-c75f25e41d0a	00090000-56b0-d425-73cf-2f76f8cabfe5	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56b0-d426-d8c9-88e2ffbaa8f0	000d0000-56b0-d426-0ca3-02b51acfa034	\N	00090000-56b0-d425-8993-2fdb18ae264c	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56b0-d426-54f2-19a48e10f144	000d0000-56b0-d426-d946-51966fd15d74	\N	00090000-56b0-d425-8993-2fdb18ae264c	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56b0-d426-609b-a0ec4a8f313c	000d0000-56b0-d426-d946-51966fd15d74	00100000-56b0-d425-ef37-c75f25e41d0a	00090000-56b0-d425-73cf-2f76f8cabfe5	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56b0-d426-1d5b-a64e343be992	000d0000-56b0-d426-7730-075d0ed393b6	\N	00090000-56b0-d425-8993-2fdb18ae264c	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56b0-d426-6f52-c7fc78b3c3fa	000d0000-56b0-d426-7fbb-6a6018a51d91	\N	00090000-56b0-d425-ca62-12399a8a78c2	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56b0-d426-e079-ffe2da6f744b	000d0000-56b0-d426-6f67-a7310ed4a8cd	\N	00090000-56b0-d425-ca62-12399a8a78c2	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56b0-d426-f9d2-19558c52f43b	000d0000-56b0-d426-6f67-a7310ed4a8cd	00100000-56b0-d425-0648-921eab70b91c	00090000-56b0-d425-9fc8-1247cb14ae39	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56b0-d426-500f-72538a166053	000d0000-56b0-d426-5440-d7e6f26b8d17	\N	00090000-56b0-d425-a5a8-0e3aefe4a8bb	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56b0-d426-0ab8-50fd3f2b7e7f	000d0000-56b0-d426-5440-d7e6f26b8d17	\N	00090000-56b0-d425-210b-0003a437b797	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56b0-d426-7382-bcf36a46d62c	000d0000-56b0-d426-fe66-498aa3ce8c10	\N	00090000-56b0-d425-ca62-12399a8a78c2	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56b0-d426-42fc-3fce660ba026	000d0000-56b0-d426-fe66-498aa3ce8c10	00100000-56b0-d425-0648-921eab70b91c	00090000-56b0-d425-9fc8-1247cb14ae39	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56b0-d426-c0ff-4793dade419f	000d0000-56b0-d426-fe66-498aa3ce8c10	\N	00090000-56b0-d425-210b-0003a437b797	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56b0-d426-63f1-dad6457d5a86	000d0000-56b0-d426-fe66-498aa3ce8c10	\N	00090000-56b0-d425-a5a8-0e3aefe4a8bb	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56b0-d426-147e-b33988f1804c	000d0000-56b0-d426-a0f7-6dcc3a10e9f7	\N	00090000-56b0-d425-ca62-12399a8a78c2	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56b0-d426-94a6-22f4b364d5c1	000d0000-56b0-d426-33ae-78e34527c68d	00100000-56b0-d425-0648-921eab70b91c	00090000-56b0-d425-9fc8-1247cb14ae39	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56b0-d426-17db-b31ce236f294	000d0000-56b0-d426-33ae-78e34527c68d	\N	00090000-56b0-d425-8993-2fdb18ae264c	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 42947542)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 42946933)
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
-- TOC entry 3191 (class 0 OID 42947419)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56b0-d425-ca54-a9f2b976f7f9	00160000-56b0-d425-fa93-cd1b79faada5	00090000-56b0-d425-210b-0003a437b797	aizv	10	t
003d0000-56b0-d425-5762-e57895a8f506	00160000-56b0-d425-fa93-cd1b79faada5	00090000-56b0-d425-8bb2-bc73e89949df	apri	14	t
003d0000-56b0-d425-a897-fe27e2092d14	00160000-56b0-d425-1840-9a0fbc202152	00090000-56b0-d425-a5a8-0e3aefe4a8bb	aizv	11	t
003d0000-56b0-d425-4cdc-631671273604	00160000-56b0-d425-8b76-fe0c57732126	00090000-56b0-d425-a5b1-e150a22a1943	aizv	12	t
003d0000-56b0-d425-24c6-3623149a3348	00160000-56b0-d425-fa93-cd1b79faada5	00090000-56b0-d425-8993-2fdb18ae264c	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 42947449)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56b0-d425-fa93-cd1b79faada5	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56b0-d425-1840-9a0fbc202152	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56b0-d425-8b76-fe0c57732126	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 42947861)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 42947255)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 42947180)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva, nadrejenogostovanje_id) FROM stdin;
00180000-56b0-d425-4ef6-48c24918e487	\N	\N	\N	\N	00440000-56b0-d425-b676-2ca46c9d40aa	00220000-56b0-d425-d6da-7caa9e9bf76b	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N	\N
00180000-56b0-d425-c6b3-1c72226448d0	\N	\N	\N	\N	00440000-56b0-d425-346e-689408cf06f8	00220000-56b0-d425-890b-ca7ef93cc618	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N	\N
00180000-56b0-d425-d4bb-93355370ab89	\N	\N	\N	001e0000-56b0-d425-fcd2-b64a4e079589	\N	00220000-56b0-d425-d6da-7caa9e9bf76b	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N	\N
00180000-56b0-d425-9661-0c4ffa33f55b	\N	\N	\N	001e0000-56b0-d425-1552-e104cc4b2fcf	\N	00220000-56b0-d425-890b-ca7ef93cc618	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N	\N
00180000-56b0-d426-5a10-f34147a85e3e	\N	00200000-56b0-d426-0c79-86db7e3b305d	\N	\N	\N	00220000-56b0-d425-29cd-0688d55ff475	\N	2012-05-20 10:00:00	2012-05-20 12:00:00	200s	200s	\N	Vaja 1.	\N	\N
00180000-56b0-d426-9923-b3f83aa1a2f0	\N	00200000-56b0-d426-2bae-03672ef962ff	\N	\N	\N	00220000-56b0-d425-29cd-0688d55ff475	001f0000-56b0-d425-21cf-5d2ec1bb7663	2015-06-04 10:00:00	2015-06-04 12:00:00	400s	200s	\N	Vaja 2.	\N	\N
00180000-56b0-d426-b2c6-ed2967408c34	\N	00200000-56b0-d426-008b-6e4fdaf0b846	\N	\N	\N	00220000-56b0-d425-890b-ca7ef93cc618	\N	2012-08-01 20:00:00	2012-08-01 23:00:00	400s	200s	\N	Vaja 3.	\N	\N
00180000-56b0-d426-32d1-590c93352efc	\N	00200000-56b0-d426-3e3f-7131ca3b3a54	\N	\N	\N	00220000-56b0-d425-890f-4daf6da6415d	\N	2012-08-01 20:00:00	2012-08-01 23:00:00	200s	200s	\N	Vaja 4.	\N	\N
00180000-56b0-d426-9245-e649c76d53e9	\N	00200000-56b0-d426-9812-3980af99eaf6	\N	\N	\N	00220000-56b0-d425-961d-d4ab3974de46	\N	2012-08-01 20:00:00	2012-08-01 23:00:00	500s	200s	\N	Vaja 5.	\N	\N
00180000-56b0-d426-3cda-6dbe460385e1	\N	00200000-56b0-d426-9cb3-3ddf3cff67b9	\N	\N	\N	00220000-56b0-d425-890b-ca7ef93cc618	\N	2012-08-01 20:00:00	2012-08-01 23:00:00	400s	200s	\N	Vaja 6.	\N	\N
00180000-56b0-d426-dd3e-bc272b78646a	\N	00200000-56b0-d426-1c32-8dade8cbbb47	\N	\N	\N	00220000-56b0-d425-961d-d4ab3974de46	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 7.	\N	\N
00180000-56b0-d426-c146-e3e3399c68f6	\N	00200000-56b0-d426-d6e0-0d0df5c34b03	\N	\N	\N	00220000-56b0-d425-961d-d4ab3974de46	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 8.	\N	\N
00180000-56b0-d426-bc30-0438170771c1	\N	00200000-56b0-d426-c865-8be181df1235	\N	\N	\N	00220000-56b0-d425-29cd-0688d55ff475	001f0000-56b0-d425-7a7b-ba012547d9a7	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	Vaja 9.	\N	\N
00180000-56b0-d426-29aa-2227ddb7ed94	\N	00200000-56b0-d426-66e8-18e87e6990b8	\N	\N	\N	00220000-56b0-d425-29cd-0688d55ff475	001f0000-56b0-d425-7a7b-ba012547d9a7	2014-06-11 07:00:00	2014-06-12 15:00:00	400s	200s	\N	Vaja 10.	\N	\N
00180000-56b0-d426-9eb4-83ceaf7ccef9	\N	\N	001c0000-56b0-d426-8d11-33e1a593d89f	\N	\N	\N	001f0000-56b0-d425-21cf-5d2ec1bb7663	2015-03-10 07:00:00	2015-03-20 23:00:00	200s	300s	\N	Gostovanje 1.	#001122	\N
00180000-56b0-d426-cade-826466ccabf0	001b0000-56b0-d426-0d3f-32efb2644d1f	\N	\N	\N	\N	00220000-56b0-d425-d6da-7caa9e9bf76b	001f0000-56b0-d425-7a7b-ba012547d9a7	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N	\N
00180000-56b0-d426-5a3b-580e6c89b091	001b0000-56b0-d426-7883-6e3d32d28e28	\N	\N	\N	\N	00220000-56b0-d425-890b-ca7ef93cc618	001f0000-56b0-d425-7a7b-ba012547d9a7	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N	\N
00180000-56b0-d426-70df-0efc975d46c2	001b0000-56b0-d426-53ef-f0559cf7a314	\N	\N	\N	\N	00220000-56b0-d425-d6da-7caa9e9bf76b	001f0000-56b0-d425-7a7b-ba012547d9a7	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N	\N
00180000-56b0-d426-d27e-2ab28e8b9cf8	001b0000-56b0-d426-eac2-56150e7df6e4	\N	\N	\N	\N	00220000-56b0-d425-d6da-7caa9e9bf76b	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N	\N
00180000-56b0-d426-1da9-54728c8937c7	001b0000-56b0-d426-89cd-e35329f9438a	\N	\N	\N	\N	00220000-56b0-d425-d6da-7caa9e9bf76b	001f0000-56b0-d425-21cf-5d2ec1bb7663	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N	\N
00180000-56b0-d426-052d-b762613f7a38	001b0000-56b0-d426-75fe-056f8147b565	\N	\N	\N	\N	00220000-56b0-d425-d6da-7caa9e9bf76b	001f0000-56b0-d425-21cf-5d2ec1bb7663	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N	\N
00180000-56b0-d426-214c-a4bc613c2bf1	001b0000-56b0-d426-cc64-8fd296fc4c17	\N	\N	\N	\N	00220000-56b0-d425-d6da-7caa9e9bf76b	001f0000-56b0-d425-7a7b-ba012547d9a7	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N	\N
00180000-56b0-d426-491c-4fceddc9d21a	001b0000-56b0-d426-4cf1-addd5158d7c0	\N	\N	\N	\N	00220000-56b0-d425-d6da-7caa9e9bf76b	001f0000-56b0-d425-21cf-5d2ec1bb7663	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N	\N
00180000-56b0-d426-073d-843d400fa0cb	001b0000-56b0-d426-60a0-84a7be47bd6d	\N	\N	\N	\N	00220000-56b0-d425-d6da-7caa9e9bf76b	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N	\N
00180000-56b0-d426-72d5-ed81cbf53b7f	001b0000-56b0-d426-a2a3-5b2ceb30076e	\N	\N	\N	\N	00220000-56b0-d425-d6da-7caa9e9bf76b	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N	\N
00180000-56b0-d426-83ef-68199dd2d40c	001b0000-56b0-d426-3769-4ece5890796a	\N	\N	\N	\N	00220000-56b0-d425-d6da-7caa9e9bf76b	001f0000-56b0-d425-21cf-5d2ec1bb7663	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N	\N
00180000-56b0-d426-17fd-6c73d95a9c72	001b0000-56b0-d426-931a-c5b462fa2534	\N	\N	\N	\N	00220000-56b0-d425-d6da-7caa9e9bf76b	001f0000-56b0-d425-9379-397c1f0bd4b0	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N	\N
00180000-56b0-d426-23cd-84f92ed36b7f	001b0000-56b0-d426-b0e3-3daa1f024877	\N	\N	\N	\N	00220000-56b0-d425-d6da-7caa9e9bf76b	001f0000-56b0-d425-9379-397c1f0bd4b0	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N	\N
00180000-56b0-d426-0c5f-a25e4146b21e	001b0000-56b0-d426-c76d-c0d554e6e394	\N	\N	\N	\N	00220000-56b0-d425-d6da-7caa9e9bf76b	001f0000-56b0-d425-21cf-5d2ec1bb7663	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N	\N
00180000-56b0-d426-6109-761b3f740480	001b0000-56b0-d426-9b1b-7f5b2ea6b154	\N	\N	\N	\N	\N	001f0000-56b0-d425-21cf-5d2ec1bb7663	2015-03-15 20:00:00	2015-03-15 23:00:00	200s	100s	\N	Predstava 15.	\N	001c0000-56b0-d426-8d11-33e1a593d89f
00180000-56b0-d426-793f-8dc502658eac	001b0000-56b0-d426-0b34-b663343aa442	\N	\N	\N	\N	\N	001f0000-56b0-d425-21cf-5d2ec1bb7663	2015-03-16 20:00:00	2015-03-16 23:00:00	200s	100s	\N	Predstava 16.	\N	001c0000-56b0-d426-8d11-33e1a593d89f
\.


--
-- TOC entry 3166 (class 0 OID 42947206)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56b0-d425-fcd2-b64a4e079589
001e0000-56b0-d425-1552-e104cc4b2fcf
\.


--
-- TOC entry 3167 (class 0 OID 42947211)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56b0-d425-b676-2ca46c9d40aa
00440000-56b0-d425-346e-689408cf06f8
\.


--
-- TOC entry 3209 (class 0 OID 42947783)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 42947086)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56b0-d422-cb6c-3feef8d2b016	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56b0-d422-32bc-138c0555c895	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56b0-d422-4d35-8f3ec36c48f8	AL	ALB	008	Albania 	Albanija	\N
00040000-56b0-d422-cbfe-1cc3d785e17d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56b0-d422-174c-37a49680170a	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56b0-d422-5db7-632dd22f1cae	AD	AND	020	Andorra 	Andora	\N
00040000-56b0-d422-14e2-1eb174b88b8e	AO	AGO	024	Angola 	Angola	\N
00040000-56b0-d422-8abb-1b4e036d3f95	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56b0-d422-561f-354af581dce9	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56b0-d422-a095-9bc512ab133d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56b0-d422-c0ac-8eb95820ee08	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56b0-d422-b37e-466bf522c97c	AM	ARM	051	Armenia 	Armenija	\N
00040000-56b0-d422-259a-d9d5e75d302b	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56b0-d422-8c43-05cb3fb2ec76	AU	AUS	036	Australia 	Avstralija	\N
00040000-56b0-d422-1493-25d0c8f1f0c4	AT	AUT	040	Austria 	Avstrija	\N
00040000-56b0-d422-0a02-75a8e1ef45bb	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56b0-d422-21b0-86968db725dc	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56b0-d422-6598-2ec144d586f3	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56b0-d422-3881-2a1ed0383b98	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56b0-d422-6195-fdec31c784fa	BB	BRB	052	Barbados 	Barbados	\N
00040000-56b0-d422-90ff-3dba36ea7be3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56b0-d422-3403-277fc1932ab5	BE	BEL	056	Belgium 	Belgija	\N
00040000-56b0-d422-5820-aa06ab09cdaf	BZ	BLZ	084	Belize 	Belize	\N
00040000-56b0-d422-9edb-e80505e79bfc	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56b0-d422-b44b-f840ee5fe33e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56b0-d422-2e7c-29c5de63e6ee	BT	BTN	064	Bhutan 	Butan	\N
00040000-56b0-d422-04b5-e8049268f974	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56b0-d422-020f-5555c88dc094	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56b0-d422-3df7-ddbad641c638	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56b0-d422-23a7-7b11c63e3743	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56b0-d422-4afa-87439ecbec8c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56b0-d422-d325-86e207a22278	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56b0-d422-c8b2-1aa8986fe2c2	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56b0-d422-11ae-08257abe2643	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56b0-d422-30c0-d60e7a5b14d4	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56b0-d422-8894-9b40bed0ffbc	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56b0-d422-987f-5da78a4e58b5	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56b0-d422-1a7f-868fbeb9049b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56b0-d422-c64a-2fbbb82fe842	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56b0-d422-ad64-0ed4b3b673d1	CA	CAN	124	Canada 	Kanada	\N
00040000-56b0-d422-c693-39c6d77cf306	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56b0-d422-4741-e31c7c92b2de	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56b0-d422-3a5d-68b9eae2d561	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56b0-d422-260d-6ebce0a3ad53	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56b0-d422-062b-060ba6ab83ef	CL	CHL	152	Chile 	Čile	\N
00040000-56b0-d422-066e-0b3c1e199fcc	CN	CHN	156	China 	Kitajska	\N
00040000-56b0-d422-f47d-5ac799b58122	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56b0-d422-5179-293dcb0c63dd	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56b0-d422-fec9-1a25c8fccae4	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56b0-d422-50fc-9d69fea401fa	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56b0-d422-1347-eb19b6e93aea	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56b0-d422-e7d2-dde512acef00	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56b0-d422-4d50-4fb2fd68c518	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56b0-d422-94ba-b63b4da3abcf	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56b0-d422-3474-2c882c8e3a63	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56b0-d422-c7f2-39bd229f56b5	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56b0-d422-3383-66deda7f2de3	CU	CUB	192	Cuba 	Kuba	\N
00040000-56b0-d422-87a9-ddb6c54594b4	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56b0-d422-1428-05daff35783c	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56b0-d422-9aab-1af284a703b6	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56b0-d422-5a14-98bf5c52ecf1	DK	DNK	208	Denmark 	Danska	\N
00040000-56b0-d422-4690-c224fbc43a54	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56b0-d422-bfc9-4593c1642701	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56b0-d422-a579-60777fdbee18	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56b0-d422-a5f0-3284183d63f8	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56b0-d422-8d86-09afb1198472	EG	EGY	818	Egypt 	Egipt	\N
00040000-56b0-d422-c4cf-bc716d4cc34b	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56b0-d422-c099-47d562621e13	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56b0-d422-6c7a-54961740331d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56b0-d422-a95a-be9b209e3aec	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56b0-d422-d374-b8a29dd193ab	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56b0-d422-1833-e6d37616b56e	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56b0-d422-649e-cbf7f7aabae1	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56b0-d422-b4d8-8d343832f439	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56b0-d422-b2fd-cffffdf2ae51	FI	FIN	246	Finland 	Finska	\N
00040000-56b0-d422-26fc-828f7a0f010a	FR	FRA	250	France 	Francija	\N
00040000-56b0-d422-5494-24cb4fb1aae1	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56b0-d422-0384-ff4481bc45d8	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56b0-d422-2eef-481ab988066f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56b0-d422-7ec6-dead6de62854	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56b0-d422-b68d-d31b3180b0fd	GA	GAB	266	Gabon 	Gabon	\N
00040000-56b0-d422-6502-1c81654c5a20	GM	GMB	270	Gambia 	Gambija	\N
00040000-56b0-d422-cc03-3989e4721363	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56b0-d422-cde9-a982cc1c9aaa	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56b0-d422-6a1a-0a0fe8bbf133	GH	GHA	288	Ghana 	Gana	\N
00040000-56b0-d422-c13d-14165dd97587	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56b0-d422-e2c3-fd3b7eb86f0a	GR	GRC	300	Greece 	Grčija	\N
00040000-56b0-d422-5262-d875bd4f9346	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56b0-d422-8786-4d2a48365f79	GD	GRD	308	Grenada 	Grenada	\N
00040000-56b0-d422-1aa1-321b008c07e7	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56b0-d422-4c8e-7d7c72fbf933	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56b0-d422-684e-a00f7797c27e	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56b0-d422-7186-6119a3812d2a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56b0-d422-39f5-819a58a75edb	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56b0-d422-e6a6-8de8795fa767	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56b0-d422-cfbc-0fca71580c4f	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56b0-d422-fc26-525e8a259f94	HT	HTI	332	Haiti 	Haiti	\N
00040000-56b0-d422-02e3-6ab84fa27f28	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56b0-d422-d9ba-fb0472502992	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56b0-d422-54c4-d01b02d959f2	HN	HND	340	Honduras 	Honduras	\N
00040000-56b0-d422-ccec-74562570f48a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56b0-d422-8e9f-0aec498c64d9	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56b0-d422-3e70-ea4090b4e694	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56b0-d422-1a87-f92c476579a8	IN	IND	356	India 	Indija	\N
00040000-56b0-d422-c217-259e98b18cbd	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56b0-d422-bf4c-cec4c677eefe	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56b0-d422-a394-74e90d97a37f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56b0-d422-8eed-52415b475897	IE	IRL	372	Ireland 	Irska	\N
00040000-56b0-d422-e3ad-95a1d864a5e8	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56b0-d422-80e6-4f045a544ce9	IL	ISR	376	Israel 	Izrael	\N
00040000-56b0-d422-6a62-7f1d89b67681	IT	ITA	380	Italy 	Italija	\N
00040000-56b0-d422-6fa4-ee3fc2ea5ee0	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56b0-d422-a9ed-754bab2ae175	JP	JPN	392	Japan 	Japonska	\N
00040000-56b0-d422-e61c-ccb539887d72	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56b0-d422-2c29-cf3777ec59a7	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56b0-d422-5c4f-fdf48846600a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56b0-d422-457e-d3274491e939	KE	KEN	404	Kenya 	Kenija	\N
00040000-56b0-d422-abb2-5756db393181	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56b0-d422-60ef-2e3779700777	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56b0-d422-efa9-20c668eadd21	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56b0-d422-7eed-0b4ba8755f78	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56b0-d422-efdd-dda016b6785c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56b0-d422-fb19-a208f57089d7	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56b0-d422-ba96-ec2c406b1fe6	LV	LVA	428	Latvia 	Latvija	\N
00040000-56b0-d422-9749-a86ba283175c	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56b0-d422-50c4-2d08a716d9a3	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56b0-d422-85d6-9ed31d161b65	LR	LBR	430	Liberia 	Liberija	\N
00040000-56b0-d422-27e5-10368d07cb5b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56b0-d422-f939-f140c0d185b6	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56b0-d422-0335-6f150225434a	LT	LTU	440	Lithuania 	Litva	\N
00040000-56b0-d422-f66e-36bbfde45b8d	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56b0-d422-fb5f-7104b5f2b1b6	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56b0-d422-8281-971032bc35f9	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56b0-d422-5f91-9e880c7eaec9	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56b0-d422-6456-c7cc6fa013d5	MW	MWI	454	Malawi 	Malavi	\N
00040000-56b0-d422-f9e8-ce5d5bed5901	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56b0-d422-55c4-87241d5d6108	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56b0-d422-0f13-b183f754d5c1	ML	MLI	466	Mali 	Mali	\N
00040000-56b0-d422-9ed4-269ac2f367ee	MT	MLT	470	Malta 	Malta	\N
00040000-56b0-d422-ce59-309afe3a3171	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56b0-d422-8590-06d51831284d	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56b0-d422-c5a4-d3b3a7e6f328	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56b0-d422-fb15-0aa298de8820	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56b0-d422-257c-034537ace18f	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56b0-d422-4ba7-12670aa8cbb9	MX	MEX	484	Mexico 	Mehika	\N
00040000-56b0-d422-00e1-cab6ce4b16e2	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56b0-d422-9b7e-f8c0a9664b86	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56b0-d422-3031-4dc90086e8dc	MC	MCO	492	Monaco 	Monako	\N
00040000-56b0-d422-5be5-0da21d5bd860	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56b0-d422-9ab5-a9d01c4e0971	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56b0-d422-4958-4571fb30ee4a	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56b0-d422-5335-4f30535b4d04	MA	MAR	504	Morocco 	Maroko	\N
00040000-56b0-d422-e13b-e6ba532a3ead	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56b0-d422-9baf-8879b2864d0c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56b0-d422-cc58-7668f1252bd1	NA	NAM	516	Namibia 	Namibija	\N
00040000-56b0-d422-f96d-6c60ee2ba87b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56b0-d422-c36b-70f8c3197368	NP	NPL	524	Nepal 	Nepal	\N
00040000-56b0-d422-1551-f2ac85970fb7	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56b0-d422-4314-de427a09a482	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56b0-d422-404d-c967ae721777	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56b0-d422-0216-bb31ef74ae6c	NE	NER	562	Niger 	Niger 	\N
00040000-56b0-d422-061f-cd83a4a3e469	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56b0-d422-782f-e85f908dd7a5	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56b0-d422-00c5-cd50bb110c20	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56b0-d422-55a3-da18fe33bd9e	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56b0-d422-b167-4bb8fab8625e	NO	NOR	578	Norway 	Norveška	\N
00040000-56b0-d422-f4b7-ff89298125b2	OM	OMN	512	Oman 	Oman	\N
00040000-56b0-d422-70a3-7fed08566cc5	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56b0-d422-544f-b9ca96925824	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56b0-d422-9045-abd1a3542ba9	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56b0-d422-dfd3-bee4764e4d13	PA	PAN	591	Panama 	Panama	\N
00040000-56b0-d422-3662-e69c81e1a807	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56b0-d422-9359-56feb7596c9c	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56b0-d422-45bd-d5690ddd418c	PE	PER	604	Peru 	Peru	\N
00040000-56b0-d422-bef1-62b7b27c65d3	PH	PHL	608	Philippines 	Filipini	\N
00040000-56b0-d422-a6ee-108737442237	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56b0-d422-4438-2c7862a5a3e5	PL	POL	616	Poland 	Poljska	\N
00040000-56b0-d422-4f5a-e91facf08ce3	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56b0-d422-30a2-a7fc1606841a	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56b0-d422-3cff-f4181e83dfa4	QA	QAT	634	Qatar 	Katar	\N
00040000-56b0-d422-0d6e-afd05fe0b084	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56b0-d422-a6d6-14bc313084b0	RO	ROU	642	Romania 	Romunija	\N
00040000-56b0-d422-6ecd-343d48018ac7	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56b0-d422-c0f7-0496fc774af0	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56b0-d422-10fd-4370641fc6f4	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56b0-d422-9f53-598a1dcd5b86	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56b0-d422-112e-74a7b18e5734	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56b0-d422-4256-a37a2f343a39	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56b0-d422-125e-4c06cde6bbdc	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56b0-d422-1821-07991686cb8a	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56b0-d422-80bb-9c36183a1145	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56b0-d422-7502-ff24c926e4fb	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56b0-d422-7f94-df3ddc0081a8	SM	SMR	674	San Marino 	San Marino	\N
00040000-56b0-d422-05e1-5741664e3875	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56b0-d422-831e-4c34b0c1c8b3	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56b0-d422-65ee-c459c7b54581	SN	SEN	686	Senegal 	Senegal	\N
00040000-56b0-d422-cd0b-4287ee4db753	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56b0-d422-5ede-10fc68e2d58b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56b0-d422-91a0-54fe971dd696	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56b0-d422-30eb-41192ff90001	SG	SGP	702	Singapore 	Singapur	\N
00040000-56b0-d422-447c-72a51e6db128	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56b0-d422-af13-d7cee898deb8	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56b0-d422-e6d8-d678e0098761	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56b0-d422-f9c3-003825228803	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56b0-d422-9aca-4fe75bbdfc55	SO	SOM	706	Somalia 	Somalija	\N
00040000-56b0-d422-0150-b5870f8d0a57	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56b0-d422-54a7-dbc348f85eae	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56b0-d422-6a31-0a34c8e01f60	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56b0-d422-8f8b-6b1f278257d4	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56b0-d422-7ce5-be8b5eccbf68	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56b0-d422-b616-ce117968d41d	SD	SDN	729	Sudan 	Sudan	\N
00040000-56b0-d422-6eec-fd04a7228c79	SR	SUR	740	Suriname 	Surinam	\N
00040000-56b0-d422-71a4-5317fb8b675d	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56b0-d422-cd94-34b4a88df911	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56b0-d422-053e-53b45be9955f	SE	SWE	752	Sweden 	Švedska	\N
00040000-56b0-d422-5aea-a5e266592997	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56b0-d422-43a1-4693680486fe	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56b0-d422-38e8-7e6cb820a991	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56b0-d422-3dca-f1ee0638d36d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56b0-d422-42b1-c8e45b45e36c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56b0-d422-0141-69fe77b8ed3d	TH	THA	764	Thailand 	Tajska	\N
00040000-56b0-d422-7ef4-3913d7724d37	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56b0-d422-0777-1c09fecfbe47	TG	TGO	768	Togo 	Togo	\N
00040000-56b0-d422-2f34-fb08b8eba245	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56b0-d422-62f7-74f70da76915	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56b0-d422-e9ac-9c5b30247137	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56b0-d422-90b5-7bb3a62c2793	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56b0-d422-0885-93cbc03d1889	TR	TUR	792	Turkey 	Turčija	\N
00040000-56b0-d422-771b-3fab9165c711	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56b0-d422-a626-3359498a50d8	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56b0-d422-e312-c12891d82dd7	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56b0-d422-c0d1-229a3629c01e	UG	UGA	800	Uganda 	Uganda	\N
00040000-56b0-d422-8456-edda973bfecd	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56b0-d422-06e3-1c5305e51a1b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56b0-d422-4615-9888941e1df2	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56b0-d422-0493-eed1383a2d60	US	USA	840	United States 	Združene države Amerike	\N
00040000-56b0-d422-a33e-68833c13aa7d	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56b0-d422-0d4d-8a3360a1c42b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56b0-d422-3253-e030765f7789	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56b0-d422-4467-35030a90a438	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56b0-d422-853b-1eab02f12006	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56b0-d422-caf3-c9be919c6bd8	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56b0-d422-3552-d5daa959caeb	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56b0-d422-ba49-5dd31112de72	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56b0-d422-433c-b24296bd5c13	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56b0-d422-be18-ab8e6419d765	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56b0-d422-877e-a515b4e80bd2	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56b0-d422-5c41-1643cbfbb9b6	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56b0-d422-cbb9-1f215b5f2eb6	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 42947571)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56b0-d426-bf5b-c4c1c3880212	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56b0-d426-522f-e272fe12bc14	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56b0-d426-c9f9-fa57b76f2bd3	000e0000-56b0-d425-d625-8c2cc8c82d6f	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56b0-d422-5eb5-71c177ca2d09	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56b0-d426-0bdd-876f26a00d48	000e0000-56b0-d425-a514-f4202a3a1748	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56b0-d422-8abf-2e384a8bca5a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56b0-d426-dca9-43db795bb5e9	000e0000-56b0-d425-d617-06d337bfd918	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56b0-d422-5eb5-71c177ca2d09	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 42947377)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56b0-d426-0580-c90a7a10fde0	000e0000-56b0-d425-a514-f4202a3a1748	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56b0-d422-1bc3-4ca54656aa64
000d0000-56b0-d426-af6a-1286371bd0c8	000e0000-56b0-d425-a716-a7437ceca582	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56b0-d422-1f81-1a294174835a
000d0000-56b0-d426-948c-cd65c9c04b90	000e0000-56b0-d425-a716-a7437ceca582	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56b0-d422-0d78-270f9e925d71
000d0000-56b0-d426-0feb-8d71f5584541	000e0000-56b0-d425-a514-f4202a3a1748	000c0000-56b0-d426-7f0b-2f8e5cd49256	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56b0-d422-1f81-1a294174835a
000d0000-56b0-d426-6e19-0f05561d2ca7	000e0000-56b0-d425-a514-f4202a3a1748	000c0000-56b0-d426-c538-a918ebbc42fe	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56b0-d422-0d78-270f9e925d71
000d0000-56b0-d426-33f2-24e156acf26b	000e0000-56b0-d425-a514-f4202a3a1748	000c0000-56b0-d426-bb82-89f1dacee9ba	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56b0-d422-5d7b-ca41804ca79d
000d0000-56b0-d426-f51f-255e6c31cb5a	000e0000-56b0-d425-a514-f4202a3a1748	000c0000-56b0-d426-5714-287d330fd996	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56b0-d422-1bc3-4ca54656aa64
000d0000-56b0-d426-1fe3-001b2e544d0c	000e0000-56b0-d425-a514-f4202a3a1748	000c0000-56b0-d426-b248-d9ff5280fadd	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56b0-d422-1bc3-4ca54656aa64
000d0000-56b0-d426-d737-5e7d27b5dcea	000e0000-56b0-d425-a514-f4202a3a1748	000c0000-56b0-d426-dbab-741429a31ff5	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56b0-d422-1f81-1a294174835a
000d0000-56b0-d426-6c29-780acef857c5	000e0000-56b0-d425-a514-f4202a3a1748	000c0000-56b0-d426-cb84-d0fe76766ba2	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56b0-d422-1f81-1a294174835a
000d0000-56b0-d426-cfce-800802d54288	000e0000-56b0-d425-a514-f4202a3a1748	000c0000-56b0-d426-b6f1-8b04e11c6500	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56b0-d422-0cd9-c12de6820caa
000d0000-56b0-d426-cfe5-23e701ebcb81	000e0000-56b0-d425-a514-f4202a3a1748	000c0000-56b0-d426-f793-c9affd57d6af	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56b0-d422-3135-7ebffd763df2
000d0000-56b0-d426-45c5-af68a84b830d	000e0000-56b0-d425-f650-648a52f4ea0e	000c0000-56b0-d426-e62c-1868fcfa84f8	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56b0-d422-0d78-270f9e925d71
000d0000-56b0-d426-eb49-55067fa498ec	000e0000-56b0-d425-b55a-658e900e49f0	000c0000-56b0-d426-5bf1-cd80cfc5fdb3	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56b0-d422-0d78-270f9e925d71
000d0000-56b0-d426-b865-00e08e235ec9	000e0000-56b0-d425-b55a-658e900e49f0	000c0000-56b0-d426-e63f-eaedd236128a	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56b0-d422-0d78-270f9e925d71
000d0000-56b0-d426-0ca3-02b51acfa034	000e0000-56b0-d425-859a-4290367085ab	000c0000-56b0-d426-ebd3-9f878a1b123d	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56b0-d422-0d78-270f9e925d71
000d0000-56b0-d426-d946-51966fd15d74	000e0000-56b0-d425-6b30-6d8c082f200d	000c0000-56b0-d426-54f2-19a48e10f144	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56b0-d422-0d78-270f9e925d71
000d0000-56b0-d426-7730-075d0ed393b6	000e0000-56b0-d425-ad27-175ca5ab9a0a	000c0000-56b0-d426-1d5b-a64e343be992	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56b0-d422-0d78-270f9e925d71
000d0000-56b0-d426-7fbb-6a6018a51d91	000e0000-56b0-d425-4394-04d731c4a7b3	000c0000-56b0-d426-6f52-c7fc78b3c3fa	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56b0-d422-0d78-270f9e925d71
000d0000-56b0-d426-6f67-a7310ed4a8cd	000e0000-56b0-d426-fa73-ae719f804ac0	000c0000-56b0-d426-e079-ffe2da6f744b	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56b0-d422-0d78-270f9e925d71
000d0000-56b0-d426-5440-d7e6f26b8d17	000e0000-56b0-d426-86ba-7c3351857d9f	000c0000-56b0-d426-500f-72538a166053	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56b0-d422-0d78-270f9e925d71
000d0000-56b0-d426-fe66-498aa3ce8c10	000e0000-56b0-d426-86ba-7c3351857d9f	000c0000-56b0-d426-7382-bcf36a46d62c	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56b0-d422-0d78-270f9e925d71
000d0000-56b0-d426-a0f7-6dcc3a10e9f7	000e0000-56b0-d426-e767-86f8662e2fe4	000c0000-56b0-d426-147e-b33988f1804c	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56b0-d422-0d78-270f9e925d71
000d0000-56b0-d426-33ae-78e34527c68d	000e0000-56b0-d426-e767-86f8662e2fe4	000c0000-56b0-d426-94a6-22f4b364d5c1	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56b0-d422-0d78-270f9e925d71
\.


--
-- TOC entry 3162 (class 0 OID 42947154)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
001c0000-56b0-d426-8d11-33e1a593d89f	00040000-56b0-d422-3e70-ea4090b4e694		\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 42947126)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 42947103)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56b0-d425-14ed-03e4071eee9e	00080000-56b0-d425-fdbc-a52079bd7eed	00090000-56b0-d425-e82c-cc5d47f04804	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 42947291)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 42947841)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56b0-d425-4b9a-fd26eb7c6002	00010000-56b0-d423-deda-93bd03958ecc	\N	Prva mapa	Root mapa	2016-02-02 17:07:01	2016-02-02 17:07:01	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 42947854)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 42947876)
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
-- TOC entry 3180 (class 0 OID 42947315)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 42947060)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56b0-d423-660f-cdda6d118af3	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56b0-d423-fa2c-aa4286488b5c	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56b0-d423-6b4a-160885c49832	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56b0-d423-cfbe-bf2038c87b96	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56b0-d423-1913-f1eefc584c01	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56b0-d423-fd0b-9508ef0618a5	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56b0-d423-7812-791a67be9a95	dogodek.delte	array	a:14:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delGosZac";a:2:{s:5:"label";s:37:"Delta začetka pri dogodku gostovanje";s:5:"value";i:0;}s:9:"delGosKon";a:2:{s:5:"label";s:34:"Delta konca pri dogodku gostovanje";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56b0-d423-2f9b-620c8f654e02	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56b0-d423-c8ee-491499ec4b94	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56b0-d423-a232-2b9e30f959a3	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56b0-d423-de6e-d5436384e199	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56b0-d423-12d1-e9b723876364	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56b0-d423-3d7c-3fc521ee6288	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56b0-d423-1cde-11eea3da509c	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56b0-d423-a4fb-0d062a0b6141	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56b0-d423-5d55-24c7f70a3855	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56b0-d423-20fd-4019d360e11f	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56b0-d425-cc57-a1f6c6fd2319	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56b0-d425-fe2a-ce3dc866481e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56b0-d425-81a8-8849add3b2e6	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56b0-d425-7224-8b175edf751a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56b0-d425-bc19-cc67f2801dd6	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56b0-d425-4bfd-506e0d06e1d0	tomaz.barva.ozadja	array	s:4:"siva";	t	f	f	\N	barva ozadja tomaž
00000000-56b0-d427-c0c1-e940816df113	application.tenant.maticnopodjetje	string	s:36:"00080000-56b0-d427-622b-7cb5eddb76e7";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 42946960)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56b0-d425-467c-af7c996eda82	00000000-56b0-d425-cc57-a1f6c6fd2319	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56b0-d425-8ac4-d25abdd93830	00000000-56b0-d425-cc57-a1f6c6fd2319	00010000-56b0-d423-deda-93bd03958ecc	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56b0-d425-3ea3-30a15841987a	00000000-56b0-d425-fe2a-ce3dc866481e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
00000000-56b0-d425-0768-04caefc57ae3	00000000-56b0-d425-4bfd-506e0d06e1d0	\N	s:6:"zelena";	t
00000000-56b0-d425-565f-092014bde161	00000000-56b0-d425-4bfd-506e0d06e1d0	00010000-56b0-d423-deda-93bd03958ecc	s:6:"rdeča";	f
\.


--
-- TOC entry 3151 (class 0 OID 42947027)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56b0-d425-79d5-269ef41e9b3a	\N	00100000-56b0-d425-5eeb-14b087655a7f	00100000-56b0-d425-0648-921eab70b91c	01	Gledališče Nimbis
00410000-56b0-d425-2256-a25afe0ca656	00410000-56b0-d425-79d5-269ef41e9b3a	00100000-56b0-d425-5eeb-14b087655a7f	00100000-56b0-d425-0648-921eab70b91c	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 42946971)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56b0-d425-158b-4a52ca15ea6f	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56b0-d425-08be-c6080a71c39d	00010000-56b0-d425-9e1d-7e06e3131e3b	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56b0-d425-9fc8-1247cb14ae39	00010000-56b0-d425-4a2b-e0c2c752fbdc	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56b0-d425-5fec-173312cb4611	00010000-56b0-d425-ea1b-ad38c40cc4b4	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56b0-d425-dd61-6c1dbc6e4f6f	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56b0-d425-5ff9-9ca721572b72	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56b0-d425-98a8-043289a3c534	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56b0-d425-73cf-2f76f8cabfe5	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56b0-d425-e82c-cc5d47f04804	00010000-56b0-d425-ab85-a2031591e890	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56b0-d425-2822-0861f8e36e10	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56b0-d425-cabd-f8860f1ec800	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56b0-d425-15a8-2f10ac0c8e1d	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56b0-d425-ca62-12399a8a78c2	00010000-56b0-d425-7a95-24593e1afb07	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56b0-d425-210b-0003a437b797	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56b0-d425-8bb2-bc73e89949df	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56b0-d425-a5a8-0e3aefe4a8bb	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56b0-d425-a5b1-e150a22a1943	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56b0-d425-8993-2fdb18ae264c	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56b0-d425-0a6d-1375b18f73f1	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56b0-d425-85cd-554849817005	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56b0-d425-a148-72d1640d6c7b	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 42946905)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56b0-d422-925c-867804b5c5c6	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56b0-d422-3543-e01b5509da15	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56b0-d422-1ff1-53d3628380b4	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56b0-d422-4f49-783d6438a1bd	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56b0-d422-af3a-cdf94a9e80db	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56b0-d422-08ee-2f5e51b55304	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56b0-d422-8a46-d43386528276	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56b0-d422-7ce8-08d865cc6cb3	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56b0-d422-3186-14b91fba9b7c	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56b0-d422-bcaf-451a0cc27fcf	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56b0-d422-1197-4567d57834e0	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56b0-d422-73da-1496637b4978	Abonma-read	Abonma - branje	t
00030000-56b0-d422-7472-0398140a5402	Abonma-write	Abonma - spreminjanje	t
00030000-56b0-d422-fcad-b5ff37b60b5a	Alternacija-read	Alternacija - branje	t
00030000-56b0-d422-df29-ffea18d2ffa6	Alternacija-write	Alternacija - spreminjanje	t
00030000-56b0-d422-313b-ff16adbd850f	Arhivalija-read	Arhivalija - branje	t
00030000-56b0-d422-80ed-7e1192fa209f	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56b0-d422-724d-d738386e47b9	AuthStorage-read	AuthStorage - branje	t
00030000-56b0-d422-282b-f4b9aeab7bf8	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56b0-d422-58e1-24ae802a706c	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56b0-d422-5fcf-a7a2a76d464f	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56b0-d422-5077-d9015ed82920	Besedilo-read	Besedilo - branje	t
00030000-56b0-d422-b8f3-7286bf66dc15	Besedilo-write	Besedilo - spreminjanje	t
00030000-56b0-d422-2804-4bd50c14af71	Dodatek-read	Dodatek - branje	t
00030000-56b0-d422-4926-8fa6fe43155f	Dodatek-write	Dodatek - spreminjanje	t
00030000-56b0-d422-d907-1eea72243802	Dogodek-read	Dogodek - branje	t
00030000-56b0-d422-dbaa-4c07d20caa10	Dogodek-write	Dogodek - spreminjanje	t
00030000-56b0-d422-c0f4-76d44d4743cd	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56b0-d422-e528-cbf9614a1118	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56b0-d422-e075-87538477c24a	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56b0-d422-a2ca-8f0ac514c571	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56b0-d422-82ab-fb87c2fce0cd	DogodekTrait-read	DogodekTrait - branje	t
00030000-56b0-d422-5676-2e1dba52543a	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56b0-d422-3c85-001863fc9272	DrugiVir-read	DrugiVir - branje	t
00030000-56b0-d422-36d5-7a67b5afc33c	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56b0-d422-ddbc-5ce3065496a5	Drzava-read	Drzava - branje	t
00030000-56b0-d422-164d-7c23252fe099	Drzava-write	Drzava - spreminjanje	t
00030000-56b0-d422-ad52-021cc6a1d25a	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56b0-d422-eb30-a56818d0980b	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56b0-d422-4ae2-af4b6ebb1540	Funkcija-read	Funkcija - branje	t
00030000-56b0-d422-13c8-d15cf11583ee	Funkcija-write	Funkcija - spreminjanje	t
00030000-56b0-d422-37ac-788e67eca38c	Gostovanje-read	Gostovanje - branje	t
00030000-56b0-d422-3ad5-d1bd520168a9	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56b0-d422-9f1a-b096f977d56a	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56b0-d422-e544-f1536b119e13	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56b0-d422-f11e-019feefb0c44	Kupec-read	Kupec - branje	t
00030000-56b0-d422-3e5a-7037a7e328f1	Kupec-write	Kupec - spreminjanje	t
00030000-56b0-d422-e683-d01a26166ccb	NacinPlacina-read	NacinPlacina - branje	t
00030000-56b0-d422-8fed-80c98d8d7387	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56b0-d422-fd99-df19abd101f7	Option-read	Option - branje	t
00030000-56b0-d422-e77e-b7c209ffe86d	Option-write	Option - spreminjanje	t
00030000-56b0-d422-f13e-5d20b48e850d	OptionValue-read	OptionValue - branje	t
00030000-56b0-d422-e54c-1789539f32ac	OptionValue-write	OptionValue - spreminjanje	t
00030000-56b0-d422-d8fb-4253e743fe83	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56b0-d422-186c-00bd235cd842	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56b0-d422-46d4-98bbe44b0c2d	Oseba-read	Oseba - branje	t
00030000-56b0-d422-40e8-22119f7851c2	Oseba-write	Oseba - spreminjanje	t
00030000-56b0-d422-1ba7-d548abe32a4f	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56b0-d422-cfe0-2cf89b11ecbb	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56b0-d422-e2db-fc8083bf0ba5	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56b0-d422-de40-db05d26e401c	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56b0-d422-81db-89ff750eea81	Pogodba-read	Pogodba - branje	t
00030000-56b0-d422-811e-8026fbb909a4	Pogodba-write	Pogodba - spreminjanje	t
00030000-56b0-d422-55cc-57186a17d55a	Popa-read	Popa - branje	t
00030000-56b0-d422-5cfe-1c1abac27dce	Popa-write	Popa - spreminjanje	t
00030000-56b0-d422-9c61-4db2a832bf09	Posta-read	Posta - branje	t
00030000-56b0-d422-88df-27e0329108e1	Posta-write	Posta - spreminjanje	t
00030000-56b0-d422-6da8-ee502164f817	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56b0-d422-8ffd-6bf99d92b6bd	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56b0-d422-c7a7-2f62df43c398	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56b0-d422-3a19-d110dfd81e25	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56b0-d422-ffd1-78556ca8f4ba	PostniNaslov-read	PostniNaslov - branje	t
00030000-56b0-d422-d1f9-2d31a17a808e	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56b0-d422-b01c-999995ab5b5e	Praznik-read	Praznik - branje	t
00030000-56b0-d422-a9af-20caccd520a9	Praznik-write	Praznik - spreminjanje	t
00030000-56b0-d422-49ca-add7b5afb2fb	Predstava-read	Predstava - branje	t
00030000-56b0-d422-e5c7-6d7ac18a6dcf	Predstava-write	Predstava - spreminjanje	t
00030000-56b0-d422-67b2-44b21cf8200b	Ura-read	Ura - branje	t
00030000-56b0-d422-6a61-c1ad4fe5cf4b	Ura-write	Ura - spreminjanje	t
00030000-56b0-d422-34d6-7ac80a46fdca	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56b0-d422-9d8a-b61a5579fe05	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56b0-d422-ac92-7bbcd6fa5596	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56b0-d422-09cb-727b683916d4	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56b0-d422-bac9-8bcee70111f7	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56b0-d422-7964-156edc771ed8	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56b0-d422-f4d3-66261062e50b	ProgramDela-read	ProgramDela - branje	t
00030000-56b0-d422-98b4-994512387e5e	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56b0-d422-e4b0-8bfa48b4ef8b	ProgramFestival-read	ProgramFestival - branje	t
00030000-56b0-d422-7def-1b134cf4681f	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56b0-d422-1bc7-f7331383f02c	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56b0-d422-a42d-f4d013bdb8be	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56b0-d422-5f72-0df35079d3d2	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56b0-d422-932e-3e741ca8a8a0	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56b0-d422-5101-353657040d50	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56b0-d422-6610-7ac8093e587a	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56b0-d422-c377-9f322d10a83e	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56b0-d422-f65f-2cb0a84ff080	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56b0-d422-de52-6eb6200891b7	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56b0-d422-a0be-ad6c40e74114	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56b0-d422-d0aa-608f2eccbb15	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56b0-d422-cfae-1944c994f6ee	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56b0-d422-5db1-55ccca45e113	ProgramRazno-read	ProgramRazno - branje	t
00030000-56b0-d422-fff6-900ab677271f	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56b0-d422-f4fa-ec4829f5f0d9	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56b0-d422-4753-e7664ac0c188	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56b0-d422-d859-607967da040a	Prostor-read	Prostor - branje	t
00030000-56b0-d422-9b5e-43f8c1f76af0	Prostor-write	Prostor - spreminjanje	t
00030000-56b0-d422-e344-ac40911654f9	Racun-read	Racun - branje	t
00030000-56b0-d422-93cf-342ce794dbe6	Racun-write	Racun - spreminjanje	t
00030000-56b0-d422-5706-0b93f6eed9e6	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56b0-d422-1b21-6212e77595fe	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56b0-d422-64a9-bf640af61091	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56b0-d422-6b98-847b490ff41d	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56b0-d422-6e21-ab62c0b29bac	Rekvizit-read	Rekvizit - branje	t
00030000-56b0-d422-0e9f-71f38ee7dfcd	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56b0-d422-038e-c5882053221b	Revizija-read	Revizija - branje	t
00030000-56b0-d422-6b6b-aa5b7e656b54	Revizija-write	Revizija - spreminjanje	t
00030000-56b0-d422-4e6a-a8adc665a4a6	Rezervacija-read	Rezervacija - branje	t
00030000-56b0-d422-adb0-c73f6e2314fe	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56b0-d422-8244-90ea260b5c23	SedezniRed-read	SedezniRed - branje	t
00030000-56b0-d422-709f-8cdc0339976a	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56b0-d422-4fb3-5bf1fe727e7d	Sedez-read	Sedez - branje	t
00030000-56b0-d422-03ca-e2e04de3671e	Sedez-write	Sedez - spreminjanje	t
00030000-56b0-d422-e048-883ab1393b3f	Sezona-read	Sezona - branje	t
00030000-56b0-d422-288e-1d9f026d1fd2	Sezona-write	Sezona - spreminjanje	t
00030000-56b0-d422-6556-a5d7e07fb6b1	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56b0-d422-16b3-2ab3ff4bdd5a	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56b0-d422-daf5-a373b56e0cff	Telefonska-read	Telefonska - branje	t
00030000-56b0-d422-d94c-d4254eaa6394	Telefonska-write	Telefonska - spreminjanje	t
00030000-56b0-d422-3f12-7f45d833a416	TerminStoritve-read	TerminStoritve - branje	t
00030000-56b0-d422-c944-92fd2d125442	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56b0-d422-36bb-7eaa5eac26f8	TipDodatka-read	TipDodatka - branje	t
00030000-56b0-d422-3748-db207d0b7f5c	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56b0-d422-441e-ec9e7f42188f	TipFunkcije-read	TipFunkcije - branje	t
00030000-56b0-d422-60dd-8d07fec7d7bf	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56b0-d422-c8a5-2ff9da66e37a	TipPopa-read	TipPopa - branje	t
00030000-56b0-d422-0757-27234867916b	TipPopa-write	TipPopa - spreminjanje	t
00030000-56b0-d422-8de0-3858f179d250	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56b0-d422-ddf6-01ae72a900be	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56b0-d422-67f2-1fb341ebbdf5	TipVaje-read	TipVaje - branje	t
00030000-56b0-d422-3d61-61f611e5781f	TipVaje-write	TipVaje - spreminjanje	t
00030000-56b0-d422-d966-005243260b67	Trr-read	Trr - branje	t
00030000-56b0-d422-ff33-dc2131134db6	Trr-write	Trr - spreminjanje	t
00030000-56b0-d422-d95a-32348483230f	Uprizoritev-read	Uprizoritev - branje	t
00030000-56b0-d422-78da-13fb003a3f10	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56b0-d422-d09e-b17cddebf853	Vaja-read	Vaja - branje	t
00030000-56b0-d422-6fec-5b979ae929c1	Vaja-write	Vaja - spreminjanje	t
00030000-56b0-d422-d3b8-d8a14bf0ae7e	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56b0-d422-d653-1562a3b7f49f	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56b0-d422-c127-f9683d775c56	VrstaStroska-read	VrstaStroska - branje	t
00030000-56b0-d422-8c4a-a46ef0e48afb	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56b0-d422-9d63-81fafc8283ff	Zaposlitev-read	Zaposlitev - branje	t
00030000-56b0-d422-f729-d0f782c7ebb7	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56b0-d422-9666-cb5e61c385cc	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56b0-d422-f940-fcc9679edc8c	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56b0-d422-e1fe-78d55f0b7443	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56b0-d422-3e5f-fae759b917d9	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56b0-d422-c238-ca313123b5f4	Job-read	Branje opravil - samo zase - branje	t
00030000-56b0-d422-a476-f7ad12dca696	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56b0-d422-2107-494d8c9e7a7e	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56b0-d422-48a6-f0632f138dd2	Report-read	Report - branje	t
00030000-56b0-d422-a3cd-9d32de03fed7	Report-write	Report - spreminjanje	t
00030000-56b0-d422-1757-cae259d1fad1	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56b0-d422-e42f-13d9d65bd5ea	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56b0-d422-089c-b35729197142	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56b0-d422-7648-b9e509a1e321	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56b0-d422-a2f4-1b5443c1b011	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56b0-d422-aeee-01e6d51bf7dc	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56b0-d422-8cd4-694f85478587	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56b0-d422-5cd4-e13dd5a65376	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56b0-d422-1015-16d6715bdfd4	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56b0-d422-bb3f-18680d66244b	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56b0-d422-f520-108b300c6c26	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56b0-d422-16c4-3d4593f9b24a	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56b0-d422-489f-a20ce38ef0c8	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56b0-d422-c964-1c0d372f2d36	Datoteka-write	Datoteka - spreminjanje	t
00030000-56b0-d422-2d63-33763ba441db	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 42946924)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56b0-d422-fb6a-dd45664a19b0	00030000-56b0-d422-3543-e01b5509da15
00020000-56b0-d422-fb6a-dd45664a19b0	00030000-56b0-d422-925c-867804b5c5c6
00020000-56b0-d422-fde2-d0cd8f805572	00030000-56b0-d422-ddbc-5ce3065496a5
00020000-56b0-d422-d5eb-02e13a9466d3	00030000-56b0-d422-5fcf-a7a2a76d464f
00020000-56b0-d422-d5eb-02e13a9466d3	00030000-56b0-d422-b8f3-7286bf66dc15
00020000-56b0-d422-d5eb-02e13a9466d3	00030000-56b0-d422-c964-1c0d372f2d36
00020000-56b0-d422-d5eb-02e13a9466d3	00030000-56b0-d422-40e8-22119f7851c2
00020000-56b0-d422-d5eb-02e13a9466d3	00030000-56b0-d422-5cd4-e13dd5a65376
00020000-56b0-d422-d5eb-02e13a9466d3	00030000-56b0-d422-bb3f-18680d66244b
00020000-56b0-d422-d5eb-02e13a9466d3	00030000-56b0-d422-58e1-24ae802a706c
00020000-56b0-d422-d5eb-02e13a9466d3	00030000-56b0-d422-5077-d9015ed82920
00020000-56b0-d422-d5eb-02e13a9466d3	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d422-d5eb-02e13a9466d3	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d422-d5eb-02e13a9466d3	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d422-d5eb-02e13a9466d3	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d422-377e-480861f7142f	00030000-56b0-d422-58e1-24ae802a706c
00020000-56b0-d422-377e-480861f7142f	00030000-56b0-d422-5077-d9015ed82920
00020000-56b0-d422-377e-480861f7142f	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d422-377e-480861f7142f	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d422-377e-480861f7142f	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d422-377e-480861f7142f	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d422-f53b-42cc1c6052f3	00030000-56b0-d422-9d63-81fafc8283ff
00020000-56b0-d422-f53b-42cc1c6052f3	00030000-56b0-d422-f729-d0f782c7ebb7
00020000-56b0-d422-f53b-42cc1c6052f3	00030000-56b0-d422-08ee-2f5e51b55304
00020000-56b0-d422-f53b-42cc1c6052f3	00030000-56b0-d422-af3a-cdf94a9e80db
00020000-56b0-d422-f53b-42cc1c6052f3	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d422-f53b-42cc1c6052f3	00030000-56b0-d422-40e8-22119f7851c2
00020000-56b0-d422-f53b-42cc1c6052f3	00030000-56b0-d422-d8fb-4253e743fe83
00020000-56b0-d422-baa5-14d8c479d960	00030000-56b0-d422-9d63-81fafc8283ff
00020000-56b0-d422-baa5-14d8c479d960	00030000-56b0-d422-08ee-2f5e51b55304
00020000-56b0-d422-baa5-14d8c479d960	00030000-56b0-d422-d8fb-4253e743fe83
00020000-56b0-d422-3878-786bd68b8101	00030000-56b0-d422-40e8-22119f7851c2
00020000-56b0-d422-3878-786bd68b8101	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d422-3878-786bd68b8101	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d422-3878-786bd68b8101	00030000-56b0-d422-c964-1c0d372f2d36
00020000-56b0-d422-3878-786bd68b8101	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d422-3878-786bd68b8101	00030000-56b0-d422-bb3f-18680d66244b
00020000-56b0-d422-3878-786bd68b8101	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d422-3878-786bd68b8101	00030000-56b0-d422-5cd4-e13dd5a65376
00020000-56b0-d422-77ec-dd05401c2928	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d422-77ec-dd05401c2928	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d422-77ec-dd05401c2928	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d422-77ec-dd05401c2928	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d422-da86-090c83d4d1ed	00030000-56b0-d422-40e8-22119f7851c2
00020000-56b0-d422-da86-090c83d4d1ed	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d422-da86-090c83d4d1ed	00030000-56b0-d422-08ee-2f5e51b55304
00020000-56b0-d422-da86-090c83d4d1ed	00030000-56b0-d422-af3a-cdf94a9e80db
00020000-56b0-d422-da86-090c83d4d1ed	00030000-56b0-d422-d966-005243260b67
00020000-56b0-d422-da86-090c83d4d1ed	00030000-56b0-d422-ff33-dc2131134db6
00020000-56b0-d422-da86-090c83d4d1ed	00030000-56b0-d422-ffd1-78556ca8f4ba
00020000-56b0-d422-da86-090c83d4d1ed	00030000-56b0-d422-d1f9-2d31a17a808e
00020000-56b0-d422-da86-090c83d4d1ed	00030000-56b0-d422-daf5-a373b56e0cff
00020000-56b0-d422-da86-090c83d4d1ed	00030000-56b0-d422-d94c-d4254eaa6394
00020000-56b0-d422-da86-090c83d4d1ed	00030000-56b0-d422-ddbc-5ce3065496a5
00020000-56b0-d422-da86-090c83d4d1ed	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d422-ff1b-e6e16c4a201d	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d422-ff1b-e6e16c4a201d	00030000-56b0-d422-08ee-2f5e51b55304
00020000-56b0-d422-ff1b-e6e16c4a201d	00030000-56b0-d422-d966-005243260b67
00020000-56b0-d422-ff1b-e6e16c4a201d	00030000-56b0-d422-ffd1-78556ca8f4ba
00020000-56b0-d422-ff1b-e6e16c4a201d	00030000-56b0-d422-daf5-a373b56e0cff
00020000-56b0-d422-ff1b-e6e16c4a201d	00030000-56b0-d422-ddbc-5ce3065496a5
00020000-56b0-d422-ff1b-e6e16c4a201d	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-daf5-a373b56e0cff
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-ffd1-78556ca8f4ba
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-d966-005243260b67
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-55cc-57186a17d55a
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-9f1a-b096f977d56a
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-bac9-8bcee70111f7
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-d94c-d4254eaa6394
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-d1f9-2d31a17a808e
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-5cd4-e13dd5a65376
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-ff33-dc2131134db6
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-5cfe-1c1abac27dce
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-c964-1c0d372f2d36
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-bb3f-18680d66244b
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-e544-f1536b119e13
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-7964-156edc771ed8
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-ddbc-5ce3065496a5
00020000-56b0-d422-0da0-fcba5063168c	00030000-56b0-d422-c8a5-2ff9da66e37a
00020000-56b0-d422-337d-019c8ad5b748	00030000-56b0-d422-daf5-a373b56e0cff
00020000-56b0-d422-337d-019c8ad5b748	00030000-56b0-d422-ffd1-78556ca8f4ba
00020000-56b0-d422-337d-019c8ad5b748	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d422-337d-019c8ad5b748	00030000-56b0-d422-d966-005243260b67
00020000-56b0-d422-337d-019c8ad5b748	00030000-56b0-d422-55cc-57186a17d55a
00020000-56b0-d422-337d-019c8ad5b748	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d422-337d-019c8ad5b748	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d422-337d-019c8ad5b748	00030000-56b0-d422-9f1a-b096f977d56a
00020000-56b0-d422-337d-019c8ad5b748	00030000-56b0-d422-bac9-8bcee70111f7
00020000-56b0-d422-337d-019c8ad5b748	00030000-56b0-d422-ddbc-5ce3065496a5
00020000-56b0-d422-337d-019c8ad5b748	00030000-56b0-d422-c8a5-2ff9da66e37a
00020000-56b0-d422-a63d-4f076a532da4	00030000-56b0-d422-c8a5-2ff9da66e37a
00020000-56b0-d422-a63d-4f076a532da4	00030000-56b0-d422-0757-27234867916b
00020000-56b0-d422-5ccc-d3b574973b61	00030000-56b0-d422-c8a5-2ff9da66e37a
00020000-56b0-d422-6215-e4e82e8d718c	00030000-56b0-d422-9c61-4db2a832bf09
00020000-56b0-d422-6215-e4e82e8d718c	00030000-56b0-d422-88df-27e0329108e1
00020000-56b0-d422-f952-a643eb44d09a	00030000-56b0-d422-9c61-4db2a832bf09
00020000-56b0-d422-0f68-b63147d63867	00030000-56b0-d422-ddbc-5ce3065496a5
00020000-56b0-d422-0f68-b63147d63867	00030000-56b0-d422-164d-7c23252fe099
00020000-56b0-d422-e190-152873ade62a	00030000-56b0-d422-ddbc-5ce3065496a5
00020000-56b0-d422-fb4b-17cde5aedd8f	00030000-56b0-d422-e1fe-78d55f0b7443
00020000-56b0-d422-fb4b-17cde5aedd8f	00030000-56b0-d422-3e5f-fae759b917d9
00020000-56b0-d422-f343-26d625447c3d	00030000-56b0-d422-e1fe-78d55f0b7443
00020000-56b0-d422-3907-cd070e572fd8	00030000-56b0-d422-9666-cb5e61c385cc
00020000-56b0-d422-3907-cd070e572fd8	00030000-56b0-d422-f940-fcc9679edc8c
00020000-56b0-d422-51a3-cc0fcaa2b0a0	00030000-56b0-d422-9666-cb5e61c385cc
00020000-56b0-d422-528a-31b0342eae2a	00030000-56b0-d422-73da-1496637b4978
00020000-56b0-d422-528a-31b0342eae2a	00030000-56b0-d422-7472-0398140a5402
00020000-56b0-d422-295f-3b1e7a9c2b1c	00030000-56b0-d422-73da-1496637b4978
00020000-56b0-d422-b207-fe1c0518a73e	00030000-56b0-d422-d859-607967da040a
00020000-56b0-d422-b207-fe1c0518a73e	00030000-56b0-d422-9b5e-43f8c1f76af0
00020000-56b0-d422-b207-fe1c0518a73e	00030000-56b0-d422-55cc-57186a17d55a
00020000-56b0-d422-b207-fe1c0518a73e	00030000-56b0-d422-ffd1-78556ca8f4ba
00020000-56b0-d422-b207-fe1c0518a73e	00030000-56b0-d422-d1f9-2d31a17a808e
00020000-56b0-d422-b207-fe1c0518a73e	00030000-56b0-d422-ddbc-5ce3065496a5
00020000-56b0-d422-2031-d235ba394679	00030000-56b0-d422-d859-607967da040a
00020000-56b0-d422-2031-d235ba394679	00030000-56b0-d422-55cc-57186a17d55a
00020000-56b0-d422-2031-d235ba394679	00030000-56b0-d422-ffd1-78556ca8f4ba
00020000-56b0-d422-960b-4daa8fb407dd	00030000-56b0-d422-c127-f9683d775c56
00020000-56b0-d422-960b-4daa8fb407dd	00030000-56b0-d422-8c4a-a46ef0e48afb
00020000-56b0-d422-0413-ef540c974f82	00030000-56b0-d422-c127-f9683d775c56
00020000-56b0-d422-304f-681403da8da8	00030000-56b0-d422-186c-00bd235cd842
00020000-56b0-d422-304f-681403da8da8	00030000-56b0-d422-d8fb-4253e743fe83
00020000-56b0-d422-304f-681403da8da8	00030000-56b0-d422-9d63-81fafc8283ff
00020000-56b0-d422-304f-681403da8da8	00030000-56b0-d422-c964-1c0d372f2d36
00020000-56b0-d422-304f-681403da8da8	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d422-304f-681403da8da8	00030000-56b0-d422-5cd4-e13dd5a65376
00020000-56b0-d422-304f-681403da8da8	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d422-304f-681403da8da8	00030000-56b0-d422-bb3f-18680d66244b
00020000-56b0-d422-304f-681403da8da8	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d422-3647-432ef25bfda1	00030000-56b0-d422-d8fb-4253e743fe83
00020000-56b0-d422-3647-432ef25bfda1	00030000-56b0-d422-9d63-81fafc8283ff
00020000-56b0-d422-3647-432ef25bfda1	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d422-3647-432ef25bfda1	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d422-3647-432ef25bfda1	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d423-b439-2d8334e6b0d1	00030000-56b0-d422-67f2-1fb341ebbdf5
00020000-56b0-d423-b439-2d8334e6b0d1	00030000-56b0-d422-3d61-61f611e5781f
00020000-56b0-d423-2af4-cfc815654815	00030000-56b0-d422-67f2-1fb341ebbdf5
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-8a46-d43386528276
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-7ce8-08d865cc6cb3
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-f4d3-66261062e50b
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-98b4-994512387e5e
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-e4b0-8bfa48b4ef8b
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-7def-1b134cf4681f
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-1bc7-f7331383f02c
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-a42d-f4d013bdb8be
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-5f72-0df35079d3d2
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-932e-3e741ca8a8a0
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-5101-353657040d50
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-6610-7ac8093e587a
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-c377-9f322d10a83e
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-f65f-2cb0a84ff080
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-de52-6eb6200891b7
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-a0be-ad6c40e74114
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-d0aa-608f2eccbb15
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-cfae-1944c994f6ee
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-5db1-55ccca45e113
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-fff6-900ab677271f
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-f4fa-ec4829f5f0d9
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-4753-e7664ac0c188
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-09cb-727b683916d4
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-36d5-7a67b5afc33c
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-8ffd-6bf99d92b6bd
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-a476-f7ad12dca696
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-3c85-001863fc9272
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-ac92-7bbcd6fa5596
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-bac9-8bcee70111f7
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-6da8-ee502164f817
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-c127-f9683d775c56
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-d95a-32348483230f
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-6556-a5d7e07fb6b1
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-4ae2-af4b6ebb1540
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-fcad-b5ff37b60b5a
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-441e-ec9e7f42188f
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-81db-89ff750eea81
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-ddbc-5ce3065496a5
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-55cc-57186a17d55a
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-c964-1c0d372f2d36
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-5cd4-e13dd5a65376
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-bb3f-18680d66244b
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-c238-ca313123b5f4
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d423-aa0d-56f0ea5ba879	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d423-bcc6-187974a7b8a9	00030000-56b0-d422-f4d3-66261062e50b
00020000-56b0-d423-bcc6-187974a7b8a9	00030000-56b0-d422-e4b0-8bfa48b4ef8b
00020000-56b0-d423-bcc6-187974a7b8a9	00030000-56b0-d422-1bc7-f7331383f02c
00020000-56b0-d423-bcc6-187974a7b8a9	00030000-56b0-d422-5f72-0df35079d3d2
00020000-56b0-d423-bcc6-187974a7b8a9	00030000-56b0-d422-5101-353657040d50
00020000-56b0-d423-bcc6-187974a7b8a9	00030000-56b0-d422-c377-9f322d10a83e
00020000-56b0-d423-bcc6-187974a7b8a9	00030000-56b0-d422-de52-6eb6200891b7
00020000-56b0-d423-bcc6-187974a7b8a9	00030000-56b0-d422-d0aa-608f2eccbb15
00020000-56b0-d423-bcc6-187974a7b8a9	00030000-56b0-d422-5db1-55ccca45e113
00020000-56b0-d423-bcc6-187974a7b8a9	00030000-56b0-d422-f4fa-ec4829f5f0d9
00020000-56b0-d423-bcc6-187974a7b8a9	00030000-56b0-d422-ac92-7bbcd6fa5596
00020000-56b0-d423-bcc6-187974a7b8a9	00030000-56b0-d422-3c85-001863fc9272
00020000-56b0-d423-bcc6-187974a7b8a9	00030000-56b0-d422-6da8-ee502164f817
00020000-56b0-d423-bcc6-187974a7b8a9	00030000-56b0-d422-ddbc-5ce3065496a5
00020000-56b0-d423-bcc6-187974a7b8a9	00030000-56b0-d422-c238-ca313123b5f4
00020000-56b0-d423-bcc6-187974a7b8a9	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d423-bcc6-187974a7b8a9	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d423-bcc6-187974a7b8a9	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d423-79a2-1071ec4715bf	00030000-56b0-d422-d95a-32348483230f
00020000-56b0-d423-79a2-1071ec4715bf	00030000-56b0-d422-78da-13fb003a3f10
00020000-56b0-d423-79a2-1071ec4715bf	00030000-56b0-d422-fcad-b5ff37b60b5a
00020000-56b0-d423-79a2-1071ec4715bf	00030000-56b0-d422-df29-ffea18d2ffa6
00020000-56b0-d423-79a2-1071ec4715bf	00030000-56b0-d422-3186-14b91fba9b7c
00020000-56b0-d423-79a2-1071ec4715bf	00030000-56b0-d422-5077-d9015ed82920
00020000-56b0-d423-79a2-1071ec4715bf	00030000-56b0-d422-4ae2-af4b6ebb1540
00020000-56b0-d423-79a2-1071ec4715bf	00030000-56b0-d422-13c8-d15cf11583ee
00020000-56b0-d423-79a2-1071ec4715bf	00030000-56b0-d422-bcaf-451a0cc27fcf
00020000-56b0-d423-79a2-1071ec4715bf	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d423-79a2-1071ec4715bf	00030000-56b0-d422-bac9-8bcee70111f7
00020000-56b0-d423-79a2-1071ec4715bf	00030000-56b0-d422-441e-ec9e7f42188f
00020000-56b0-d423-79a2-1071ec4715bf	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d423-79a2-1071ec4715bf	00030000-56b0-d422-c964-1c0d372f2d36
00020000-56b0-d423-79a2-1071ec4715bf	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d423-79a2-1071ec4715bf	00030000-56b0-d422-5cd4-e13dd5a65376
00020000-56b0-d423-79a2-1071ec4715bf	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d423-79a2-1071ec4715bf	00030000-56b0-d422-bb3f-18680d66244b
00020000-56b0-d423-ab7d-2f66cb359429	00030000-56b0-d422-d95a-32348483230f
00020000-56b0-d423-ab7d-2f66cb359429	00030000-56b0-d422-fcad-b5ff37b60b5a
00020000-56b0-d423-ab7d-2f66cb359429	00030000-56b0-d422-5077-d9015ed82920
00020000-56b0-d423-ab7d-2f66cb359429	00030000-56b0-d422-4ae2-af4b6ebb1540
00020000-56b0-d423-ab7d-2f66cb359429	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d423-ab7d-2f66cb359429	00030000-56b0-d422-bac9-8bcee70111f7
00020000-56b0-d423-ab7d-2f66cb359429	00030000-56b0-d422-441e-ec9e7f42188f
00020000-56b0-d423-ab7d-2f66cb359429	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d423-ab7d-2f66cb359429	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d423-ab7d-2f66cb359429	00030000-56b0-d422-5cd4-e13dd5a65376
00020000-56b0-d423-ab7d-2f66cb359429	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d423-91f6-8e9f2da9c5a5	00030000-56b0-d422-fcad-b5ff37b60b5a
00020000-56b0-d423-91f6-8e9f2da9c5a5	00030000-56b0-d422-df29-ffea18d2ffa6
00020000-56b0-d423-91f6-8e9f2da9c5a5	00030000-56b0-d422-4ae2-af4b6ebb1540
00020000-56b0-d423-91f6-8e9f2da9c5a5	00030000-56b0-d422-13c8-d15cf11583ee
00020000-56b0-d423-91f6-8e9f2da9c5a5	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d423-91f6-8e9f2da9c5a5	00030000-56b0-d422-441e-ec9e7f42188f
00020000-56b0-d423-91f6-8e9f2da9c5a5	00030000-56b0-d422-d95a-32348483230f
00020000-56b0-d423-91f6-8e9f2da9c5a5	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d423-f6e5-46dec2e8b739	00030000-56b0-d422-fcad-b5ff37b60b5a
00020000-56b0-d423-f6e5-46dec2e8b739	00030000-56b0-d422-df29-ffea18d2ffa6
00020000-56b0-d423-f6e5-46dec2e8b739	00030000-56b0-d422-3186-14b91fba9b7c
00020000-56b0-d423-f6e5-46dec2e8b739	00030000-56b0-d422-4ae2-af4b6ebb1540
00020000-56b0-d423-f6e5-46dec2e8b739	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d423-f6e5-46dec2e8b739	00030000-56b0-d422-08ee-2f5e51b55304
00020000-56b0-d423-f6e5-46dec2e8b739	00030000-56b0-d422-af3a-cdf94a9e80db
00020000-56b0-d423-f6e5-46dec2e8b739	00030000-56b0-d422-81db-89ff750eea81
00020000-56b0-d423-f6e5-46dec2e8b739	00030000-56b0-d422-811e-8026fbb909a4
00020000-56b0-d423-f6e5-46dec2e8b739	00030000-56b0-d422-55cc-57186a17d55a
00020000-56b0-d423-f6e5-46dec2e8b739	00030000-56b0-d422-bac9-8bcee70111f7
00020000-56b0-d423-f6e5-46dec2e8b739	00030000-56b0-d422-6556-a5d7e07fb6b1
00020000-56b0-d423-f6e5-46dec2e8b739	00030000-56b0-d422-16b3-2ab3ff4bdd5a
00020000-56b0-d423-f6e5-46dec2e8b739	00030000-56b0-d422-441e-ec9e7f42188f
00020000-56b0-d423-f6e5-46dec2e8b739	00030000-56b0-d422-d966-005243260b67
00020000-56b0-d423-f6e5-46dec2e8b739	00030000-56b0-d422-d95a-32348483230f
00020000-56b0-d423-f6e5-46dec2e8b739	00030000-56b0-d422-9d63-81fafc8283ff
00020000-56b0-d423-7b76-1c07f75a51db	00030000-56b0-d422-fcad-b5ff37b60b5a
00020000-56b0-d423-7b76-1c07f75a51db	00030000-56b0-d422-4ae2-af4b6ebb1540
00020000-56b0-d423-7b76-1c07f75a51db	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d423-7b76-1c07f75a51db	00030000-56b0-d422-08ee-2f5e51b55304
00020000-56b0-d423-7b76-1c07f75a51db	00030000-56b0-d422-81db-89ff750eea81
00020000-56b0-d423-7b76-1c07f75a51db	00030000-56b0-d422-55cc-57186a17d55a
00020000-56b0-d423-7b76-1c07f75a51db	00030000-56b0-d422-bac9-8bcee70111f7
00020000-56b0-d423-7b76-1c07f75a51db	00030000-56b0-d422-6556-a5d7e07fb6b1
00020000-56b0-d423-7b76-1c07f75a51db	00030000-56b0-d422-441e-ec9e7f42188f
00020000-56b0-d423-7b76-1c07f75a51db	00030000-56b0-d422-d966-005243260b67
00020000-56b0-d423-7b76-1c07f75a51db	00030000-56b0-d422-d95a-32348483230f
00020000-56b0-d423-7b76-1c07f75a51db	00030000-56b0-d422-9d63-81fafc8283ff
00020000-56b0-d423-1210-9f75705898d7	00030000-56b0-d422-6556-a5d7e07fb6b1
00020000-56b0-d423-1210-9f75705898d7	00030000-56b0-d422-d95a-32348483230f
00020000-56b0-d423-1210-9f75705898d7	00030000-56b0-d422-4ae2-af4b6ebb1540
00020000-56b0-d423-1210-9f75705898d7	00030000-56b0-d422-81db-89ff750eea81
00020000-56b0-d423-1210-9f75705898d7	00030000-56b0-d422-bac9-8bcee70111f7
00020000-56b0-d423-1210-9f75705898d7	00030000-56b0-d422-441e-ec9e7f42188f
00020000-56b0-d423-1210-9f75705898d7	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d423-8dd1-b7a37129ad17	00030000-56b0-d422-6556-a5d7e07fb6b1
00020000-56b0-d423-8dd1-b7a37129ad17	00030000-56b0-d422-16b3-2ab3ff4bdd5a
00020000-56b0-d423-8dd1-b7a37129ad17	00030000-56b0-d422-d95a-32348483230f
00020000-56b0-d423-8dd1-b7a37129ad17	00030000-56b0-d422-55cc-57186a17d55a
00020000-56b0-d423-84e5-56cfdc56d7f4	00030000-56b0-d422-6556-a5d7e07fb6b1
00020000-56b0-d423-84e5-56cfdc56d7f4	00030000-56b0-d422-d95a-32348483230f
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-73da-1496637b4978
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-fcad-b5ff37b60b5a
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-df29-ffea18d2ffa6
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-3186-14b91fba9b7c
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-58e1-24ae802a706c
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-5fcf-a7a2a76d464f
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-5077-d9015ed82920
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-b8f3-7286bf66dc15
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-c964-1c0d372f2d36
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-3c85-001863fc9272
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-36d5-7a67b5afc33c
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-ddbc-5ce3065496a5
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-4ae2-af4b6ebb1540
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-13c8-d15cf11583ee
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-bcaf-451a0cc27fcf
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-c238-ca313123b5f4
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-a476-f7ad12dca696
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-9f1a-b096f977d56a
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-d8fb-4253e743fe83
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-40e8-22119f7851c2
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-08ee-2f5e51b55304
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-af3a-cdf94a9e80db
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-81db-89ff750eea81
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-811e-8026fbb909a4
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-55cc-57186a17d55a
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-9c61-4db2a832bf09
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-6da8-ee502164f817
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-8ffd-6bf99d92b6bd
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-ffd1-78556ca8f4ba
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-ac92-7bbcd6fa5596
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-09cb-727b683916d4
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-bac9-8bcee70111f7
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-8a46-d43386528276
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-f4d3-66261062e50b
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-7ce8-08d865cc6cb3
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-98b4-994512387e5e
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-e4b0-8bfa48b4ef8b
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-7def-1b134cf4681f
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-1bc7-f7331383f02c
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-a42d-f4d013bdb8be
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-5f72-0df35079d3d2
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-932e-3e741ca8a8a0
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-5101-353657040d50
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-6610-7ac8093e587a
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-c377-9f322d10a83e
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-f65f-2cb0a84ff080
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-de52-6eb6200891b7
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-a0be-ad6c40e74114
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-d0aa-608f2eccbb15
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-cfae-1944c994f6ee
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-5db1-55ccca45e113
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-fff6-900ab677271f
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-f4fa-ec4829f5f0d9
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-4753-e7664ac0c188
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-d859-607967da040a
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-6556-a5d7e07fb6b1
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-16b3-2ab3ff4bdd5a
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-daf5-a373b56e0cff
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-441e-ec9e7f42188f
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-c8a5-2ff9da66e37a
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-67f2-1fb341ebbdf5
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-d966-005243260b67
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-d95a-32348483230f
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-78da-13fb003a3f10
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-c127-f9683d775c56
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-bb3f-18680d66244b
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-5cd4-e13dd5a65376
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-9d63-81fafc8283ff
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-9666-cb5e61c385cc
00020000-56b0-d423-386d-c5a6b3a51005	00030000-56b0-d422-e1fe-78d55f0b7443
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-73da-1496637b4978
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-fcad-b5ff37b60b5a
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-58e1-24ae802a706c
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-5fcf-a7a2a76d464f
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-5077-d9015ed82920
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-b8f3-7286bf66dc15
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-c964-1c0d372f2d36
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-ddbc-5ce3065496a5
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-4ae2-af4b6ebb1540
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-9f1a-b096f977d56a
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-d8fb-4253e743fe83
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-40e8-22119f7851c2
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-08ee-2f5e51b55304
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-55cc-57186a17d55a
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-9c61-4db2a832bf09
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-ffd1-78556ca8f4ba
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-bac9-8bcee70111f7
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-d859-607967da040a
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-daf5-a373b56e0cff
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-441e-ec9e7f42188f
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-c8a5-2ff9da66e37a
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-67f2-1fb341ebbdf5
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-d966-005243260b67
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-d95a-32348483230f
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-c127-f9683d775c56
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-bb3f-18680d66244b
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-5cd4-e13dd5a65376
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-9d63-81fafc8283ff
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-9666-cb5e61c385cc
00020000-56b0-d423-3c61-b14e7cc9b17f	00030000-56b0-d422-e1fe-78d55f0b7443
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-73da-1496637b4978
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-fcad-b5ff37b60b5a
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-df29-ffea18d2ffa6
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-3186-14b91fba9b7c
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-58e1-24ae802a706c
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-5fcf-a7a2a76d464f
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-5077-d9015ed82920
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-b8f3-7286bf66dc15
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-c964-1c0d372f2d36
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-ddbc-5ce3065496a5
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-4ae2-af4b6ebb1540
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-13c8-d15cf11583ee
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-bcaf-451a0cc27fcf
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-9f1a-b096f977d56a
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-d8fb-4253e743fe83
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-40e8-22119f7851c2
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-08ee-2f5e51b55304
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-55cc-57186a17d55a
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-9c61-4db2a832bf09
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-ffd1-78556ca8f4ba
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-bac9-8bcee70111f7
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-d859-607967da040a
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-daf5-a373b56e0cff
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-441e-ec9e7f42188f
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-c8a5-2ff9da66e37a
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-67f2-1fb341ebbdf5
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-d966-005243260b67
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-d95a-32348483230f
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-78da-13fb003a3f10
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-c127-f9683d775c56
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-bb3f-18680d66244b
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-5cd4-e13dd5a65376
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-9d63-81fafc8283ff
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-9666-cb5e61c385cc
00020000-56b0-d423-f7a8-d2fb27a1290e	00030000-56b0-d422-e1fe-78d55f0b7443
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-fcad-b5ff37b60b5a
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-df29-ffea18d2ffa6
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-3186-14b91fba9b7c
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-58e1-24ae802a706c
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-5fcf-a7a2a76d464f
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-5077-d9015ed82920
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-b8f3-7286bf66dc15
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-c964-1c0d372f2d36
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-3c85-001863fc9272
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-36d5-7a67b5afc33c
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-ddbc-5ce3065496a5
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-4ae2-af4b6ebb1540
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-13c8-d15cf11583ee
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-bcaf-451a0cc27fcf
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-c238-ca313123b5f4
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-a476-f7ad12dca696
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-9f1a-b096f977d56a
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-e544-f1536b119e13
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-d8fb-4253e743fe83
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-40e8-22119f7851c2
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-08ee-2f5e51b55304
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-af3a-cdf94a9e80db
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-81db-89ff750eea81
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-811e-8026fbb909a4
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-55cc-57186a17d55a
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-5cfe-1c1abac27dce
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-9c61-4db2a832bf09
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-6da8-ee502164f817
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-8ffd-6bf99d92b6bd
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-ffd1-78556ca8f4ba
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-d1f9-2d31a17a808e
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-ac92-7bbcd6fa5596
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-09cb-727b683916d4
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-bac9-8bcee70111f7
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-7964-156edc771ed8
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-8a46-d43386528276
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-f4d3-66261062e50b
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-7ce8-08d865cc6cb3
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-98b4-994512387e5e
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-e4b0-8bfa48b4ef8b
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-7def-1b134cf4681f
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-1bc7-f7331383f02c
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-a42d-f4d013bdb8be
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-5f72-0df35079d3d2
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-932e-3e741ca8a8a0
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-5101-353657040d50
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-6610-7ac8093e587a
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-c377-9f322d10a83e
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-f65f-2cb0a84ff080
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-de52-6eb6200891b7
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-a0be-ad6c40e74114
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-d0aa-608f2eccbb15
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-cfae-1944c994f6ee
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-5db1-55ccca45e113
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-fff6-900ab677271f
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-f4fa-ec4829f5f0d9
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-4753-e7664ac0c188
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-d859-607967da040a
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-6556-a5d7e07fb6b1
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-16b3-2ab3ff4bdd5a
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-daf5-a373b56e0cff
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-d94c-d4254eaa6394
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-441e-ec9e7f42188f
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-c8a5-2ff9da66e37a
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-d966-005243260b67
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-ff33-dc2131134db6
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-d95a-32348483230f
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-78da-13fb003a3f10
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-c127-f9683d775c56
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-bb3f-18680d66244b
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-5cd4-e13dd5a65376
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-9d63-81fafc8283ff
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-f729-d0f782c7ebb7
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-9666-cb5e61c385cc
00020000-56b0-d423-4fdc-cdb6c7f211fa	00030000-56b0-d422-e1fe-78d55f0b7443
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-73da-1496637b4978
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-fcad-b5ff37b60b5a
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-df29-ffea18d2ffa6
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-3186-14b91fba9b7c
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-58e1-24ae802a706c
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-5fcf-a7a2a76d464f
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-5077-d9015ed82920
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-b8f3-7286bf66dc15
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-c964-1c0d372f2d36
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-ddbc-5ce3065496a5
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-4ae2-af4b6ebb1540
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-13c8-d15cf11583ee
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-bcaf-451a0cc27fcf
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-9f1a-b096f977d56a
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-e544-f1536b119e13
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-d8fb-4253e743fe83
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-40e8-22119f7851c2
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-08ee-2f5e51b55304
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-af3a-cdf94a9e80db
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-81db-89ff750eea81
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-55cc-57186a17d55a
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-5cfe-1c1abac27dce
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-9c61-4db2a832bf09
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-ffd1-78556ca8f4ba
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-d1f9-2d31a17a808e
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-bac9-8bcee70111f7
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-7964-156edc771ed8
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-d859-607967da040a
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-6556-a5d7e07fb6b1
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-daf5-a373b56e0cff
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-d94c-d4254eaa6394
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-441e-ec9e7f42188f
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-c8a5-2ff9da66e37a
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-67f2-1fb341ebbdf5
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-d966-005243260b67
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-ff33-dc2131134db6
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-d95a-32348483230f
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-78da-13fb003a3f10
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-c127-f9683d775c56
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-bb3f-18680d66244b
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-5cd4-e13dd5a65376
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-9d63-81fafc8283ff
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-f729-d0f782c7ebb7
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-9666-cb5e61c385cc
00020000-56b0-d423-4ad0-97b708dc18db	00030000-56b0-d422-e1fe-78d55f0b7443
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-73da-1496637b4978
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-fcad-b5ff37b60b5a
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-df29-ffea18d2ffa6
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-58e1-24ae802a706c
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-5077-d9015ed82920
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-ddbc-5ce3065496a5
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-4ae2-af4b6ebb1540
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-13c8-d15cf11583ee
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-9f1a-b096f977d56a
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-d8fb-4253e743fe83
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-08ee-2f5e51b55304
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-81db-89ff750eea81
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-55cc-57186a17d55a
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-9c61-4db2a832bf09
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-ffd1-78556ca8f4ba
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-bac9-8bcee70111f7
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-d859-607967da040a
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-6556-a5d7e07fb6b1
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-daf5-a373b56e0cff
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-441e-ec9e7f42188f
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-c8a5-2ff9da66e37a
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-67f2-1fb341ebbdf5
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-d966-005243260b67
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-d95a-32348483230f
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-c127-f9683d775c56
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-9d63-81fafc8283ff
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-9666-cb5e61c385cc
00020000-56b0-d423-7018-e2ce86979bee	00030000-56b0-d422-e1fe-78d55f0b7443
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-73da-1496637b4978
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-fcad-b5ff37b60b5a
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-df29-ffea18d2ffa6
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-3186-14b91fba9b7c
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-5077-d9015ed82920
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-c964-1c0d372f2d36
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-3c85-001863fc9272
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-36d5-7a67b5afc33c
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-ddbc-5ce3065496a5
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-4ae2-af4b6ebb1540
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-c238-ca313123b5f4
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-a476-f7ad12dca696
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-9f1a-b096f977d56a
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-e544-f1536b119e13
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-d8fb-4253e743fe83
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-186c-00bd235cd842
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-40e8-22119f7851c2
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-08ee-2f5e51b55304
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-af3a-cdf94a9e80db
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-81db-89ff750eea81
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-811e-8026fbb909a4
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-55cc-57186a17d55a
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-5cfe-1c1abac27dce
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-9c61-4db2a832bf09
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-6da8-ee502164f817
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-8ffd-6bf99d92b6bd
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-ffd1-78556ca8f4ba
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-d1f9-2d31a17a808e
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-ac92-7bbcd6fa5596
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-09cb-727b683916d4
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-bac9-8bcee70111f7
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-7964-156edc771ed8
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-8a46-d43386528276
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-f4d3-66261062e50b
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-7ce8-08d865cc6cb3
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-98b4-994512387e5e
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-e4b0-8bfa48b4ef8b
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-7def-1b134cf4681f
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-1bc7-f7331383f02c
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-a42d-f4d013bdb8be
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-5f72-0df35079d3d2
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-932e-3e741ca8a8a0
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-5101-353657040d50
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-6610-7ac8093e587a
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-c377-9f322d10a83e
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-f65f-2cb0a84ff080
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-de52-6eb6200891b7
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-a0be-ad6c40e74114
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-d0aa-608f2eccbb15
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-cfae-1944c994f6ee
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-5db1-55ccca45e113
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-fff6-900ab677271f
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-f4fa-ec4829f5f0d9
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-4753-e7664ac0c188
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-d859-607967da040a
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-6556-a5d7e07fb6b1
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-16b3-2ab3ff4bdd5a
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-daf5-a373b56e0cff
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-d94c-d4254eaa6394
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-441e-ec9e7f42188f
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-c8a5-2ff9da66e37a
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-67f2-1fb341ebbdf5
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-d966-005243260b67
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-ff33-dc2131134db6
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-d95a-32348483230f
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-c127-f9683d775c56
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-8c4a-a46ef0e48afb
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-bb3f-18680d66244b
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-5cd4-e13dd5a65376
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-9d63-81fafc8283ff
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-f729-d0f782c7ebb7
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-9666-cb5e61c385cc
00020000-56b0-d423-1c5d-d6212b6911ce	00030000-56b0-d422-e1fe-78d55f0b7443
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-925c-867804b5c5c6
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-3543-e01b5509da15
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-73da-1496637b4978
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-7472-0398140a5402
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-fcad-b5ff37b60b5a
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-3186-14b91fba9b7c
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-df29-ffea18d2ffa6
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-313b-ff16adbd850f
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-80ed-7e1192fa209f
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-724d-d738386e47b9
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-282b-f4b9aeab7bf8
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-58e1-24ae802a706c
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-5fcf-a7a2a76d464f
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-5077-d9015ed82920
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-b8f3-7286bf66dc15
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-c964-1c0d372f2d36
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-d907-1eea72243802
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-4f49-783d6438a1bd
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-c0f4-76d44d4743cd
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-e528-cbf9614a1118
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-e075-87538477c24a
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-a2ca-8f0ac514c571
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-82ab-fb87c2fce0cd
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-5676-2e1dba52543a
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-dbaa-4c07d20caa10
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-3c85-001863fc9272
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-36d5-7a67b5afc33c
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-ddbc-5ce3065496a5
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-164d-7c23252fe099
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-ad52-021cc6a1d25a
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-eb30-a56818d0980b
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-4ae2-af4b6ebb1540
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-bcaf-451a0cc27fcf
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-13c8-d15cf11583ee
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-37ac-788e67eca38c
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-3ad5-d1bd520168a9
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-2107-494d8c9e7a7e
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-c238-ca313123b5f4
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-a476-f7ad12dca696
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-9f1a-b096f977d56a
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-e544-f1536b119e13
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-f11e-019feefb0c44
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-3e5a-7037a7e328f1
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-8cd4-694f85478587
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-aeee-01e6d51bf7dc
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-e42f-13d9d65bd5ea
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-089c-b35729197142
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-7648-b9e509a1e321
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-a2f4-1b5443c1b011
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-e683-d01a26166ccb
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-8fed-80c98d8d7387
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-fd99-df19abd101f7
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-f13e-5d20b48e850d
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-e54c-1789539f32ac
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-1197-4567d57834e0
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-e77e-b7c209ffe86d
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-d8fb-4253e743fe83
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-186c-00bd235cd842
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-40e8-22119f7851c2
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-08ee-2f5e51b55304
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-af3a-cdf94a9e80db
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-1ba7-d548abe32a4f
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-cfe0-2cf89b11ecbb
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-e2db-fc8083bf0ba5
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-de40-db05d26e401c
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-81db-89ff750eea81
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-811e-8026fbb909a4
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-55cc-57186a17d55a
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-5cfe-1c1abac27dce
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-9c61-4db2a832bf09
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-6da8-ee502164f817
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-8ffd-6bf99d92b6bd
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-c7a7-2f62df43c398
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-3a19-d110dfd81e25
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-88df-27e0329108e1
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-ffd1-78556ca8f4ba
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-d1f9-2d31a17a808e
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-b01c-999995ab5b5e
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-a9af-20caccd520a9
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-49ca-add7b5afb2fb
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-e5c7-6d7ac18a6dcf
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-34d6-7ac80a46fdca
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-9d8a-b61a5579fe05
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-ac92-7bbcd6fa5596
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-09cb-727b683916d4
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-bac9-8bcee70111f7
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-7964-156edc771ed8
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-8a46-d43386528276
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-f4d3-66261062e50b
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-7ce8-08d865cc6cb3
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-98b4-994512387e5e
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-e4b0-8bfa48b4ef8b
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-7def-1b134cf4681f
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-1bc7-f7331383f02c
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-a42d-f4d013bdb8be
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-5f72-0df35079d3d2
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-932e-3e741ca8a8a0
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-5101-353657040d50
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-6610-7ac8093e587a
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-c377-9f322d10a83e
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-f65f-2cb0a84ff080
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-de52-6eb6200891b7
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-a0be-ad6c40e74114
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-d0aa-608f2eccbb15
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-cfae-1944c994f6ee
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-5db1-55ccca45e113
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-fff6-900ab677271f
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-f4fa-ec4829f5f0d9
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-4753-e7664ac0c188
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-d859-607967da040a
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-9b5e-43f8c1f76af0
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-e344-ac40911654f9
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-93cf-342ce794dbe6
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-5706-0b93f6eed9e6
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-1b21-6212e77595fe
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-64a9-bf640af61091
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-6b98-847b490ff41d
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-6e21-ab62c0b29bac
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-0e9f-71f38ee7dfcd
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-48a6-f0632f138dd2
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-a3cd-9d32de03fed7
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-038e-c5882053221b
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-6b6b-aa5b7e656b54
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-4e6a-a8adc665a4a6
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-adb0-c73f6e2314fe
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-8244-90ea260b5c23
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-709f-8cdc0339976a
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-4fb3-5bf1fe727e7d
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-03ca-e2e04de3671e
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-e048-883ab1393b3f
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-288e-1d9f026d1fd2
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-1757-cae259d1fad1
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-6556-a5d7e07fb6b1
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-16b3-2ab3ff4bdd5a
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-daf5-a373b56e0cff
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-d94c-d4254eaa6394
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-3f12-7f45d833a416
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-1ff1-53d3628380b4
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-c944-92fd2d125442
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-441e-ec9e7f42188f
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-60dd-8d07fec7d7bf
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-c8a5-2ff9da66e37a
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-0757-27234867916b
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-8de0-3858f179d250
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-ddf6-01ae72a900be
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-67f2-1fb341ebbdf5
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-3d61-61f611e5781f
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-d966-005243260b67
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-ff33-dc2131134db6
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-d95a-32348483230f
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-78da-13fb003a3f10
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-d09e-b17cddebf853
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-6fec-5b979ae929c1
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-d3b8-d8a14bf0ae7e
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-d653-1562a3b7f49f
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-c127-f9683d775c56
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-8c4a-a46ef0e48afb
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-489f-a20ce38ef0c8
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-16c4-3d4593f9b24a
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-bb3f-18680d66244b
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-5cd4-e13dd5a65376
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-9d63-81fafc8283ff
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-f729-d0f782c7ebb7
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-9666-cb5e61c385cc
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-f940-fcc9679edc8c
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-e1fe-78d55f0b7443
00020000-56b0-d425-b515-68f941a0eb1d	00030000-56b0-d422-3e5f-fae759b917d9
00020000-56b0-d425-a19e-5a6173d62b9c	00030000-56b0-d422-f520-108b300c6c26
00020000-56b0-d425-9cdb-088acae1d4bb	00030000-56b0-d422-bb3f-18680d66244b
00020000-56b0-d425-e8af-653ecc975f0b	00030000-56b0-d422-78da-13fb003a3f10
00020000-56b0-d425-c8ca-18bcd33d8cb4	00030000-56b0-d422-d95a-32348483230f
00020000-56b0-d425-2e34-0fd8e0c8c951	00030000-56b0-d422-089c-b35729197142
00020000-56b0-d425-36ef-5d09e638f834	00030000-56b0-d422-7648-b9e509a1e321
00020000-56b0-d425-0c98-271c829e6591	00030000-56b0-d422-a2f4-1b5443c1b011
00020000-56b0-d425-74a2-005c346e9977	00030000-56b0-d422-e42f-13d9d65bd5ea
00020000-56b0-d425-63b7-fc58620cb1c1	00030000-56b0-d422-8cd4-694f85478587
00020000-56b0-d425-c95b-9f6f589d130f	00030000-56b0-d422-aeee-01e6d51bf7dc
00020000-56b0-d425-356d-2fabeae55537	00030000-56b0-d422-1015-16d6715bdfd4
00020000-56b0-d425-2752-734b875c18fa	00030000-56b0-d422-5cd4-e13dd5a65376
00020000-56b0-d425-76fd-5ffd7e7c6c7c	00030000-56b0-d422-46d4-98bbe44b0c2d
00020000-56b0-d425-d879-635340cf16b7	00030000-56b0-d422-40e8-22119f7851c2
00020000-56b0-d425-1a62-5fae13a8cced	00030000-56b0-d422-af3a-cdf94a9e80db
00020000-56b0-d425-2bff-26283fb92c11	00030000-56b0-d422-08ee-2f5e51b55304
00020000-56b0-d425-92c8-d26049670d06	00030000-56b0-d422-c964-1c0d372f2d36
00020000-56b0-d425-dbb7-0f7b31ede38a	00030000-56b0-d422-2d63-33763ba441db
00020000-56b0-d425-43ab-8682b0e2640d	00030000-56b0-d422-55cc-57186a17d55a
00020000-56b0-d425-43ab-8682b0e2640d	00030000-56b0-d422-5cfe-1c1abac27dce
00020000-56b0-d425-43ab-8682b0e2640d	00030000-56b0-d422-d95a-32348483230f
00020000-56b0-d425-473e-a21d42230066	00030000-56b0-d422-d966-005243260b67
00020000-56b0-d425-de92-d08184bb1588	00030000-56b0-d422-ff33-dc2131134db6
00020000-56b0-d425-4792-cb68328a3d06	00030000-56b0-d422-1757-cae259d1fad1
00020000-56b0-d425-4e01-04b7f6ab8f19	00030000-56b0-d422-daf5-a373b56e0cff
00020000-56b0-d425-c8db-3add2348e98e	00030000-56b0-d422-d94c-d4254eaa6394
00020000-56b0-d425-2bd0-1c606385125f	00030000-56b0-d422-ffd1-78556ca8f4ba
00020000-56b0-d425-cbb5-a7958905f2cf	00030000-56b0-d422-d1f9-2d31a17a808e
00020000-56b0-d425-a480-124b7dcf1127	00030000-56b0-d422-9d63-81fafc8283ff
00020000-56b0-d425-766e-30de941efa56	00030000-56b0-d422-f729-d0f782c7ebb7
00020000-56b0-d425-a529-b2c5af99af3c	00030000-56b0-d422-81db-89ff750eea81
00020000-56b0-d425-c6d1-fd9f9d47c052	00030000-56b0-d422-811e-8026fbb909a4
00020000-56b0-d425-6615-a0f4ab056018	00030000-56b0-d422-6556-a5d7e07fb6b1
00020000-56b0-d425-e20e-f53d283b0d43	00030000-56b0-d422-16b3-2ab3ff4bdd5a
00020000-56b0-d425-50df-6112a0f5be59	00030000-56b0-d422-fcad-b5ff37b60b5a
00020000-56b0-d425-9130-75e45c2a2c7b	00030000-56b0-d422-df29-ffea18d2ffa6
00020000-56b0-d425-9f98-1531b24a941f	00030000-56b0-d422-3186-14b91fba9b7c
00020000-56b0-d425-fac8-969a0efdcea6	00030000-56b0-d422-4ae2-af4b6ebb1540
00020000-56b0-d425-90a1-a0acf5bc0bef	00030000-56b0-d422-13c8-d15cf11583ee
00020000-56b0-d425-e028-811fa617faaf	00030000-56b0-d422-bcaf-451a0cc27fcf
\.


--
-- TOC entry 3181 (class 0 OID 42947322)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 42947357)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 42947490)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56b0-d425-33ed-712435469dba	00090000-56b0-d425-158b-4a52ca15ea6f	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56b0-d425-321f-dd1c5e8db872	00090000-56b0-d425-5ff9-9ca721572b72	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56b0-d425-81e5-c9da9e05aae4	00090000-56b0-d425-ca62-12399a8a78c2	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56b0-d425-08b4-3af618e6ff25	00090000-56b0-d425-2822-0861f8e36e10	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 42947007)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56b0-d425-fdbc-a52079bd7eed	\N	00040000-56b0-d422-e6d8-d678e0098761	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b0-d425-69c8-36b5ba8ec8fa	\N	00040000-56b0-d422-e6d8-d678e0098761	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56b0-d425-4776-5aeeeaa161ca	\N	00040000-56b0-d422-e6d8-d678e0098761	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b0-d425-1e63-e1a809c4ef80	\N	00040000-56b0-d422-e6d8-d678e0098761	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b0-d425-0329-a02dd6086f8b	\N	00040000-56b0-d422-e6d8-d678e0098761	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b0-d425-88f3-2faaec15ed23	\N	00040000-56b0-d422-c0ac-8eb95820ee08	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b0-d425-4841-6953915dd4bc	\N	00040000-56b0-d422-c7f2-39bd229f56b5	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b0-d425-d3ee-42cca9bb83f1	\N	00040000-56b0-d422-1493-25d0c8f1f0c4	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b0-d425-ea09-937945a85b58	\N	00040000-56b0-d422-cde9-a982cc1c9aaa	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b0-d427-622b-7cb5eddb76e7	\N	00040000-56b0-d422-e6d8-d678e0098761	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 42947052)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56b0-d421-c598-788850dddb8d	8341	Adlešiči
00050000-56b0-d421-768d-ea2383b1275e	5270	Ajdovščina
00050000-56b0-d421-28db-45ca8f68031b	6280	Ankaran/Ancarano
00050000-56b0-d421-2181-10c056507430	9253	Apače
00050000-56b0-d421-52f0-8abae358955c	8253	Artiče
00050000-56b0-d421-61b0-2a002e1af32b	4275	Begunje na Gorenjskem
00050000-56b0-d421-5b33-1dbd604dd2a1	1382	Begunje pri Cerknici
00050000-56b0-d421-be8b-401cac9094ee	9231	Beltinci
00050000-56b0-d421-d08c-4b2c65b957c4	2234	Benedikt
00050000-56b0-d421-f8ce-70e9f5ea6384	2345	Bistrica ob Dravi
00050000-56b0-d421-54c2-7955b9c779e8	3256	Bistrica ob Sotli
00050000-56b0-d421-34fc-460928ea7fde	8259	Bizeljsko
00050000-56b0-d421-936f-53da66e2fc64	1223	Blagovica
00050000-56b0-d421-5924-88e81cccafb3	8283	Blanca
00050000-56b0-d421-8fe5-b8a67ca98944	4260	Bled
00050000-56b0-d421-d264-85397ebc908f	4273	Blejska Dobrava
00050000-56b0-d421-3c7b-6c4c2f363580	9265	Bodonci
00050000-56b0-d421-767c-1ee094dce4b3	9222	Bogojina
00050000-56b0-d421-da2d-9c28e8535753	4263	Bohinjska Bela
00050000-56b0-d421-0aa0-31a1d48d33cf	4264	Bohinjska Bistrica
00050000-56b0-d421-e599-0415169bdf79	4265	Bohinjsko jezero
00050000-56b0-d421-e4dc-d1baab11543c	1353	Borovnica
00050000-56b0-d421-5a86-9db1be3b051e	8294	Boštanj
00050000-56b0-d421-0561-fd407e882113	5230	Bovec
00050000-56b0-d421-5ad5-79e930c23c7b	5295	Branik
00050000-56b0-d421-5c0d-618cc0ea77fa	3314	Braslovče
00050000-56b0-d421-a689-06001c124d08	5223	Breginj
00050000-56b0-d421-6771-b25d17cb1b45	8280	Brestanica
00050000-56b0-d421-ded2-32e32e552614	2354	Bresternica
00050000-56b0-d421-e23e-08e71e099a96	4243	Brezje
00050000-56b0-d421-d3b1-0049e9a4380e	1351	Brezovica pri Ljubljani
00050000-56b0-d421-f20a-b8f5406c364b	8250	Brežice
00050000-56b0-d421-cae5-41f5bc45eb56	4210	Brnik - Aerodrom
00050000-56b0-d421-60b5-6d5f87972413	8321	Brusnice
00050000-56b0-d421-428d-1377e11086ec	3255	Buče
00050000-56b0-d421-2b2c-c041892fe17b	8276	Bučka 
00050000-56b0-d421-f1a2-6d4e86d6f864	9261	Cankova
00050000-56b0-d421-133d-a01d6698fa77	3000	Celje 
00050000-56b0-d421-6941-9f6b791e31c1	3001	Celje - poštni predali
00050000-56b0-d421-6bf8-5a6d1df5378c	4207	Cerklje na Gorenjskem
00050000-56b0-d421-0476-898d4ffc1ea4	8263	Cerklje ob Krki
00050000-56b0-d421-a5e5-0e6f44c11fb7	1380	Cerknica
00050000-56b0-d421-bc0e-15e917a40c41	5282	Cerkno
00050000-56b0-d421-28d2-7fbf9f0e8a60	2236	Cerkvenjak
00050000-56b0-d421-e419-5d4f12c75452	2215	Ceršak
00050000-56b0-d421-8b8f-0367d448667b	2326	Cirkovce
00050000-56b0-d421-0c3c-3f496e5d80a4	2282	Cirkulane
00050000-56b0-d421-acf7-1d4db46d6820	5273	Col
00050000-56b0-d421-2aec-20faf5efa913	8251	Čatež ob Savi
00050000-56b0-d421-ee75-9208c477b24b	1413	Čemšenik
00050000-56b0-d421-813d-c35416f7305e	5253	Čepovan
00050000-56b0-d421-bfcc-eaf66f1fe9b9	9232	Črenšovci
00050000-56b0-d421-c264-d33003d34b3d	2393	Črna na Koroškem
00050000-56b0-d421-dcbf-30eab6c59457	6275	Črni Kal
00050000-56b0-d421-4089-b179afc6fbaa	5274	Črni Vrh nad Idrijo
00050000-56b0-d421-dfb8-e6536eebd140	5262	Črniče
00050000-56b0-d421-358a-2f8ce1d60858	8340	Črnomelj
00050000-56b0-d421-f5ad-5f453b8d0697	6271	Dekani
00050000-56b0-d421-0453-8341813c4338	5210	Deskle
00050000-56b0-d421-679c-19952801914d	2253	Destrnik
00050000-56b0-d421-dcc4-fb84c97b3dc8	6215	Divača
00050000-56b0-d421-ae48-4a523c570344	1233	Dob
00050000-56b0-d421-095c-9507c8e8666a	3224	Dobje pri Planini
00050000-56b0-d421-54c9-0486b32d6774	8257	Dobova
00050000-56b0-d421-853a-802c5dead8a7	1423	Dobovec
00050000-56b0-d421-ac3d-044376219cc3	5263	Dobravlje
00050000-56b0-d421-c422-abfe4fcf708c	3204	Dobrna
00050000-56b0-d421-f2e0-af78c06326d6	8211	Dobrnič
00050000-56b0-d421-f197-9cab9dc5aa0b	1356	Dobrova
00050000-56b0-d421-57d5-983b350a207e	9223	Dobrovnik/Dobronak 
00050000-56b0-d421-3820-8a07b171adb5	5212	Dobrovo v Brdih
00050000-56b0-d421-5e1f-7705ef3bf05f	1431	Dol pri Hrastniku
00050000-56b0-d421-ebbf-5b0427c9c3da	1262	Dol pri Ljubljani
00050000-56b0-d421-b50e-af34fc04c1f9	1273	Dole pri Litiji
00050000-56b0-d421-5545-2f6ceee19db7	1331	Dolenja vas
00050000-56b0-d421-b65d-89eeb7481928	8350	Dolenjske Toplice
00050000-56b0-d421-2023-314d1c2bd43e	1230	Domžale
00050000-56b0-d421-2b96-a14dda74b3dd	2252	Dornava
00050000-56b0-d421-9cbd-ee00f7e70cf5	5294	Dornberk
00050000-56b0-d421-2bd5-cd4e25127014	1319	Draga
00050000-56b0-d421-8c31-43954c0059d2	8343	Dragatuš
00050000-56b0-d421-480e-43f0435474d9	3222	Dramlje
00050000-56b0-d421-0e00-2fc90e0fc496	2370	Dravograd
00050000-56b0-d421-cd96-864d75ed4683	4203	Duplje
00050000-56b0-d421-301d-2d83af7be0cb	6221	Dutovlje
00050000-56b0-d421-e2e0-eb4759b8d109	8361	Dvor
00050000-56b0-d421-9ca7-a615b40d31bc	2343	Fala
00050000-56b0-d421-7deb-aa010918c7ea	9208	Fokovci
00050000-56b0-d421-3a48-7227b47701d6	2313	Fram
00050000-56b0-d421-48aa-ad682e4446cd	3213	Frankolovo
00050000-56b0-d421-fb54-e23f703d99ce	1274	Gabrovka
00050000-56b0-d421-9654-0e18d21b2d8f	8254	Globoko
00050000-56b0-d421-e933-1e44b3d3ef7f	5275	Godovič
00050000-56b0-d421-68ac-728ff9adbc4b	4204	Golnik
00050000-56b0-d421-3d51-f10acfa87b2c	3303	Gomilsko
00050000-56b0-d421-f18c-aa372a7cfcd9	4224	Gorenja vas
00050000-56b0-d421-b991-1c703ad882a3	3263	Gorica pri Slivnici
00050000-56b0-d421-f645-8a7fd2f81d32	2272	Gorišnica
00050000-56b0-d421-0ab8-15d8a94e0959	9250	Gornja Radgona
00050000-56b0-d421-cc87-1adb8d3b7b5a	3342	Gornji Grad
00050000-56b0-d421-235f-55f6a4c820dd	4282	Gozd Martuljek
00050000-56b0-d421-4a17-6eed884f6515	6272	Gračišče
00050000-56b0-d421-75aa-7d41ee7d2065	9264	Grad
00050000-56b0-d421-421f-dd64d63c37a6	8332	Gradac
00050000-56b0-d421-b2c3-a09c5254b848	1384	Grahovo
00050000-56b0-d421-84b1-5b98cec7c8b9	5242	Grahovo ob Bači
00050000-56b0-d421-1b6a-dd8644086f1b	5251	Grgar
00050000-56b0-d421-0165-d3c218ae2309	3302	Griže
00050000-56b0-d421-2ced-53fd80177f8a	3231	Grobelno
00050000-56b0-d421-113b-d63ee866e2ed	1290	Grosuplje
00050000-56b0-d421-f344-e09008a3fbef	2288	Hajdina
00050000-56b0-d421-15a3-b9eadffddcb9	8362	Hinje
00050000-56b0-d421-dd12-359f5fee0729	2311	Hoče
00050000-56b0-d421-3ab9-451d2dabf32c	9205	Hodoš/Hodos
00050000-56b0-d421-7aab-8922375fa737	1354	Horjul
00050000-56b0-d421-9ef0-5a75aaaf2897	1372	Hotedršica
00050000-56b0-d421-a2ae-5a4ad5885edc	1430	Hrastnik
00050000-56b0-d421-b8b6-1c47d6b91503	6225	Hruševje
00050000-56b0-d421-9ce8-652a41b12c50	4276	Hrušica
00050000-56b0-d421-ae14-e0b4f07d35d8	5280	Idrija
00050000-56b0-d421-9ceb-2704e50ced26	1292	Ig
00050000-56b0-d421-9f69-41fbf65b273b	6250	Ilirska Bistrica
00050000-56b0-d421-d3ec-067f9be6bb99	6251	Ilirska Bistrica-Trnovo
00050000-56b0-d421-609a-4f34a0428733	1295	Ivančna Gorica
00050000-56b0-d421-e540-2c3f8890e67e	2259	Ivanjkovci
00050000-56b0-d421-99d0-4594dcf908d8	1411	Izlake
00050000-56b0-d421-609e-04eeea4f9ad9	6310	Izola/Isola
00050000-56b0-d421-140d-4c4c71b0fa68	2222	Jakobski Dol
00050000-56b0-d421-89f9-e46c0d1b2f1a	2221	Jarenina
00050000-56b0-d421-e244-e138c0c78610	6254	Jelšane
00050000-56b0-d421-b633-61a848dc0837	4270	Jesenice
00050000-56b0-d421-8552-89d9a073af1f	8261	Jesenice na Dolenjskem
00050000-56b0-d421-4326-4bc845f1347a	3273	Jurklošter
00050000-56b0-d421-3452-f9faedc422c2	2223	Jurovski Dol
00050000-56b0-d421-7840-2734a9c7949c	2256	Juršinci
00050000-56b0-d421-c925-9a5a35979679	5214	Kal nad Kanalom
00050000-56b0-d421-951d-7ed3a0743004	3233	Kalobje
00050000-56b0-d421-2497-3f06998c9381	4246	Kamna Gorica
00050000-56b0-d421-35ca-8aed6cdb6ff2	2351	Kamnica
00050000-56b0-d421-ddb6-86069cda4b6a	1241	Kamnik
00050000-56b0-d421-6b3f-681dd65caa09	5213	Kanal
00050000-56b0-d421-0ef4-dd6b3f5882df	8258	Kapele
00050000-56b0-d421-215d-da76ebdb3baf	2362	Kapla
00050000-56b0-d421-24ae-104fc895d135	2325	Kidričevo
00050000-56b0-d421-d501-ad9c3456f256	1412	Kisovec
00050000-56b0-d421-5c4c-434806fb23a9	6253	Knežak
00050000-56b0-d421-0abe-793edb3b3d72	5222	Kobarid
00050000-56b0-d421-2b67-9afcd8e5fce5	9227	Kobilje
00050000-56b0-d421-b071-df86551667b9	1330	Kočevje
00050000-56b0-d421-d400-929fcad6083c	1338	Kočevska Reka
00050000-56b0-d421-a959-c18ef1ba76b4	2276	Kog
00050000-56b0-d421-85a7-678217824198	5211	Kojsko
00050000-56b0-d421-550d-8b31d61277b8	6223	Komen
00050000-56b0-d421-ff64-1acdbb301b96	1218	Komenda
00050000-56b0-d421-658a-adff3e6fceac	6000	Koper/Capodistria 
00050000-56b0-d421-9869-af2e641b9d4a	6001	Koper/Capodistria - poštni predali
00050000-56b0-d421-81e1-0a415a83bc7a	8282	Koprivnica
00050000-56b0-d421-9e4d-17844ac4ef79	5296	Kostanjevica na Krasu
00050000-56b0-d421-5f0f-500249edc76c	8311	Kostanjevica na Krki
00050000-56b0-d421-3008-51f33fc135f6	1336	Kostel
00050000-56b0-d421-1754-d7d675588d3d	6256	Košana
00050000-56b0-d421-0653-c5aef8b420a3	2394	Kotlje
00050000-56b0-d421-f5ad-f62045b18b9f	6240	Kozina
00050000-56b0-d421-fd36-d990911a6e67	3260	Kozje
00050000-56b0-d421-a945-42f5c3ed4b12	4000	Kranj 
00050000-56b0-d421-e092-a88eeccedfbb	4001	Kranj - poštni predali
00050000-56b0-d421-dc82-e4a91785535d	4280	Kranjska Gora
00050000-56b0-d421-a909-cbbba69d0b3a	1281	Kresnice
00050000-56b0-d421-c8d4-9a8171fdf229	4294	Križe
00050000-56b0-d421-a276-67810d3b48e9	9206	Križevci
00050000-56b0-d421-e719-c0d06aba334f	9242	Križevci pri Ljutomeru
00050000-56b0-d421-b92c-3cd2a242180b	1301	Krka
00050000-56b0-d421-48d2-a8b9640039fe	8296	Krmelj
00050000-56b0-d421-8816-4a8045da8820	4245	Kropa
00050000-56b0-d421-e614-bbcb1acf8f52	8262	Krška vas
00050000-56b0-d421-9123-bf88a3b2a0f5	8270	Krško
00050000-56b0-d421-3a4d-6d7b6500afbf	9263	Kuzma
00050000-56b0-d421-0763-16724af4e0ae	2318	Laporje
00050000-56b0-d421-0b9e-3fbfcf6ab888	3270	Laško
00050000-56b0-d421-b5fb-0cb36510b7c1	1219	Laze v Tuhinju
00050000-56b0-d421-829c-097ad8f72cf4	2230	Lenart v Slovenskih goricah
00050000-56b0-d421-e6bc-10a7d9c1231a	9220	Lendava/Lendva
00050000-56b0-d421-805c-29996400070b	4248	Lesce
00050000-56b0-d421-c923-dc314e0a052d	3261	Lesično
00050000-56b0-d421-e2bd-252b4a2c1a9b	8273	Leskovec pri Krškem
00050000-56b0-d421-0f4f-8773cecc695d	2372	Libeliče
00050000-56b0-d421-3e4c-72e9081e2def	2341	Limbuš
00050000-56b0-d421-c717-2caa9aac791a	1270	Litija
00050000-56b0-d421-74df-b369c929d5f6	3202	Ljubečna
00050000-56b0-d421-0ccf-7a52b040754e	1000	Ljubljana 
00050000-56b0-d421-115e-4af00d1db810	1001	Ljubljana - poštni predali
00050000-56b0-d421-9096-da39781f66c6	1231	Ljubljana - Črnuče
00050000-56b0-d421-d05b-b25b7c89f2a6	1261	Ljubljana - Dobrunje
00050000-56b0-d421-5728-14bd28af803c	1260	Ljubljana - Polje
00050000-56b0-d421-f6e2-042d6e0d7550	1210	Ljubljana - Šentvid
00050000-56b0-d421-31f2-2406e39ae508	1211	Ljubljana - Šmartno
00050000-56b0-d421-545b-ce4d8397a77d	3333	Ljubno ob Savinji
00050000-56b0-d421-481a-646150008044	9240	Ljutomer
00050000-56b0-d421-701c-80e0a082e901	3215	Loče
00050000-56b0-d421-177c-ba742007cce6	5231	Log pod Mangartom
00050000-56b0-d421-6ad8-f3efc1959d3c	1358	Log pri Brezovici
00050000-56b0-d421-374a-46b8e36e2fef	1370	Logatec
00050000-56b0-d421-3896-eb9d9eaa53a6	1371	Logatec
00050000-56b0-d421-c4b6-89abbbe603ff	1434	Loka pri Zidanem Mostu
00050000-56b0-d421-0efc-d7744e63ff8b	3223	Loka pri Žusmu
00050000-56b0-d421-7686-ed80e2ed3804	6219	Lokev
00050000-56b0-d421-407b-768f4dba9ebf	1318	Loški Potok
00050000-56b0-d421-c836-4885e56600f7	2324	Lovrenc na Dravskem polju
00050000-56b0-d421-5f29-bf462f61b962	2344	Lovrenc na Pohorju
00050000-56b0-d421-d331-47c910dbbd34	3334	Luče
00050000-56b0-d421-75e7-4b8f376cbb2a	1225	Lukovica
00050000-56b0-d421-3806-ce4507ae243a	9202	Mačkovci
00050000-56b0-d421-61a7-2bb5bbe9491f	2322	Majšperk
00050000-56b0-d421-7164-728d0ae546af	2321	Makole
00050000-56b0-d421-2b45-4e54907ea372	9243	Mala Nedelja
00050000-56b0-d421-ca7c-e7618fc7b037	2229	Malečnik
00050000-56b0-d421-af83-b45668a7176c	6273	Marezige
00050000-56b0-d421-b2aa-7f08d2da9b06	2000	Maribor 
00050000-56b0-d421-05bc-e64bb3777d37	2001	Maribor - poštni predali
00050000-56b0-d421-22e6-c7f3bda59326	2206	Marjeta na Dravskem polju
00050000-56b0-d421-17bd-a347b7fd625a	2281	Markovci
00050000-56b0-d421-e8da-dda161a7aba9	9221	Martjanci
00050000-56b0-d421-6511-ba3befcbe56a	6242	Materija
00050000-56b0-d421-a100-74cba6997e0a	4211	Mavčiče
00050000-56b0-d421-c830-622fb9170b4f	1215	Medvode
00050000-56b0-d421-f53f-3d7817a556b5	1234	Mengeš
00050000-56b0-d421-6547-028a7482734b	8330	Metlika
00050000-56b0-d421-90fc-ec7dc517cd9a	2392	Mežica
00050000-56b0-d421-aaad-cd8fc0bf7ce2	2204	Miklavž na Dravskem polju
00050000-56b0-d421-8072-e37c5b16018f	2275	Miklavž pri Ormožu
00050000-56b0-d421-3992-ec289d231cfd	5291	Miren
00050000-56b0-d421-f66c-3139c69dec44	8233	Mirna
00050000-56b0-d421-1bf9-786c35de03a6	8216	Mirna Peč
00050000-56b0-d421-4760-23751ace8874	2382	Mislinja
00050000-56b0-d421-2439-c984c2724a9a	4281	Mojstrana
00050000-56b0-d421-3dde-e55b416dbb6f	8230	Mokronog
00050000-56b0-d421-c565-3f0aa69c13de	1251	Moravče
00050000-56b0-d421-2453-18de509be247	9226	Moravske Toplice
00050000-56b0-d421-2b25-ad464afffbc8	5216	Most na Soči
00050000-56b0-d421-42fb-efa25033c7c9	1221	Motnik
00050000-56b0-d421-0dcb-5df64ccbb329	3330	Mozirje
00050000-56b0-d421-307e-70a265756dc8	9000	Murska Sobota 
00050000-56b0-d421-1f5e-a28170c01b5b	9001	Murska Sobota - poštni predali
00050000-56b0-d421-4855-2d1d7df56e03	2366	Muta
00050000-56b0-d421-8e0e-edaf017225ae	4202	Naklo
00050000-56b0-d421-4698-6bfa3cf8592a	3331	Nazarje
00050000-56b0-d421-6824-fe6740f3715d	1357	Notranje Gorice
00050000-56b0-d421-e333-b60144bfda02	3203	Nova Cerkev
00050000-56b0-d421-0f90-58d297311db0	5000	Nova Gorica 
00050000-56b0-d421-8eac-0d034c3ad2de	5001	Nova Gorica - poštni predali
00050000-56b0-d421-a554-912f4f7ab373	1385	Nova vas
00050000-56b0-d421-8c04-89f2337d1f65	8000	Novo mesto
00050000-56b0-d421-2e54-8b92cf035239	8001	Novo mesto - poštni predali
00050000-56b0-d421-700d-7e71907bea31	6243	Obrov
00050000-56b0-d421-943b-3cef4461aa8f	9233	Odranci
00050000-56b0-d421-9326-9f6ffa686f8a	2317	Oplotnica
00050000-56b0-d421-7164-621335d88bf4	2312	Orehova vas
00050000-56b0-d421-59e3-3f4dfb926725	2270	Ormož
00050000-56b0-d421-b8f4-ad3e344312e3	1316	Ortnek
00050000-56b0-d421-907e-c73aea0fd25a	1337	Osilnica
00050000-56b0-d421-75f1-9caa76c3b501	8222	Otočec
00050000-56b0-d421-99df-a0f3172266b5	2361	Ožbalt
00050000-56b0-d421-c9ce-792edd06e834	2231	Pernica
00050000-56b0-d421-69a8-175667994fe7	2211	Pesnica pri Mariboru
00050000-56b0-d421-b779-00f941ae282c	9203	Petrovci
00050000-56b0-d421-f680-1db10273eb54	3301	Petrovče
00050000-56b0-d421-6ba8-e234ac90c0c4	6330	Piran/Pirano
00050000-56b0-d421-ffa1-067de7aafd61	8255	Pišece
00050000-56b0-d421-b468-6e333c868847	6257	Pivka
00050000-56b0-d421-24b2-a61aa087a62e	6232	Planina
00050000-56b0-d421-f9b8-9cd35f5d10da	3225	Planina pri Sevnici
00050000-56b0-d421-bdfc-aa7e947cb085	6276	Pobegi
00050000-56b0-d421-b302-2a6c6a055179	8312	Podbočje
00050000-56b0-d421-9ae1-51e913e20ea5	5243	Podbrdo
00050000-56b0-d421-584b-404bfd3dc726	3254	Podčetrtek
00050000-56b0-d421-c2e5-4ff6ae10a612	2273	Podgorci
00050000-56b0-d421-0cc8-ffdec66437f8	6216	Podgorje
00050000-56b0-d421-3b3d-b0554512ca8d	2381	Podgorje pri Slovenj Gradcu
00050000-56b0-d421-1b5b-56cb86a362fd	6244	Podgrad
00050000-56b0-d421-1495-358f07f12132	1414	Podkum
00050000-56b0-d421-3166-6d15be85894d	2286	Podlehnik
00050000-56b0-d421-43a0-6b160b6a1418	5272	Podnanos
00050000-56b0-d421-e7b0-bc502b7cf823	4244	Podnart
00050000-56b0-d421-64d6-a2443abde920	3241	Podplat
00050000-56b0-d421-29a0-7f2a85053887	3257	Podsreda
00050000-56b0-d421-03cd-3852fcd98de3	2363	Podvelka
00050000-56b0-d421-fb14-26127e60d6bb	2208	Pohorje
00050000-56b0-d421-b25f-21047e13c063	2257	Polenšak
00050000-56b0-d421-59ec-b7491afedc08	1355	Polhov Gradec
00050000-56b0-d421-1118-4cfea9978eb1	4223	Poljane nad Škofjo Loko
00050000-56b0-d421-225f-f520cc5c7e6b	2319	Poljčane
00050000-56b0-d421-ec4f-8124071d74c1	1272	Polšnik
00050000-56b0-d421-edee-aa7b54eb8c53	3313	Polzela
00050000-56b0-d421-c2a7-4c146520b3fd	3232	Ponikva
00050000-56b0-d421-dc9b-7e3ac624b11c	6320	Portorož/Portorose
00050000-56b0-d421-1d0a-e88e6d7c7164	6230	Postojna
00050000-56b0-d421-8dc3-d18ff0250e3d	2331	Pragersko
00050000-56b0-d421-5b36-64ea82fe8344	3312	Prebold
00050000-56b0-d421-033b-f814506dce36	4205	Preddvor
00050000-56b0-d421-cb89-80713a318553	6255	Prem
00050000-56b0-d421-9d12-e8691865073c	1352	Preserje
00050000-56b0-d421-caef-575ce49b0bf3	6258	Prestranek
00050000-56b0-d421-d81f-2bdfbe732ea7	2391	Prevalje
00050000-56b0-d421-6970-97492ca8580c	3262	Prevorje
00050000-56b0-d421-6467-2026896ac612	1276	Primskovo 
00050000-56b0-d421-93cf-da4740060387	3253	Pristava pri Mestinju
00050000-56b0-d421-f66a-cd04b19e201f	9207	Prosenjakovci/Partosfalva
00050000-56b0-d421-3b85-57071def0b76	5297	Prvačina
00050000-56b0-d421-9646-79536206a72c	2250	Ptuj
00050000-56b0-d421-ed92-20c2942e537b	2323	Ptujska Gora
00050000-56b0-d421-3360-da2a4e1882ad	9201	Puconci
00050000-56b0-d421-69ff-e6e06118afe7	2327	Rače
00050000-56b0-d421-27a1-5416981bfc2e	1433	Radeče
00050000-56b0-d421-0ff8-eedf807bf502	9252	Radenci
00050000-56b0-d421-4a83-10e3c2b09659	2360	Radlje ob Dravi
00050000-56b0-d421-83ec-23cca26122af	1235	Radomlje
00050000-56b0-d421-0345-e066dbd904ca	4240	Radovljica
00050000-56b0-d421-7bfe-5520808eae49	8274	Raka
00050000-56b0-d421-768a-933b47560412	1381	Rakek
00050000-56b0-d421-3353-6ac65fc3e287	4283	Rateče - Planica
00050000-56b0-d421-a713-6ed474d66e5d	2390	Ravne na Koroškem
00050000-56b0-d421-e3da-13afb635c087	9246	Razkrižje
00050000-56b0-d421-3a77-ce9203e4af1e	3332	Rečica ob Savinji
00050000-56b0-d421-c769-b3fdde5a5b60	5292	Renče
00050000-56b0-d421-6d64-7dbdb49ba734	1310	Ribnica
00050000-56b0-d421-3460-81e7eadfd4b2	2364	Ribnica na Pohorju
00050000-56b0-d421-db39-4a5ab24e77cd	3272	Rimske Toplice
00050000-56b0-d421-c1a3-6a7393a15f26	1314	Rob
00050000-56b0-d421-64af-1d5764d0514c	5215	Ročinj
00050000-56b0-d421-b966-be1b6927e035	3250	Rogaška Slatina
00050000-56b0-d421-5087-87221e1a99be	9262	Rogašovci
00050000-56b0-d421-9805-ba510f90993e	3252	Rogatec
00050000-56b0-d421-b2fb-3d746bc0094f	1373	Rovte
00050000-56b0-d421-24e2-4d36ca4029dd	2342	Ruše
00050000-56b0-d421-ce5f-d2ff9a95e1eb	1282	Sava
00050000-56b0-d421-64f4-b30d13f84b45	6333	Sečovlje/Sicciole
00050000-56b0-d421-9dd8-4a48be92b7d6	4227	Selca
00050000-56b0-d421-6e44-512b561f33a0	2352	Selnica ob Dravi
00050000-56b0-d421-68bd-3b82b7873d0a	8333	Semič
00050000-56b0-d421-e648-6a87924322fd	8281	Senovo
00050000-56b0-d421-6fe3-73f387c32c98	6224	Senožeče
00050000-56b0-d421-133e-960d8a81bd24	8290	Sevnica
00050000-56b0-d421-29d7-a66d4cdcb283	6210	Sežana
00050000-56b0-d421-f915-557e238b25f7	2214	Sladki Vrh
00050000-56b0-d421-0c9d-953af847deb7	5283	Slap ob Idrijci
00050000-56b0-d421-39ac-fd7c09d6f330	2380	Slovenj Gradec
00050000-56b0-d421-ee14-8ef746b715dc	2310	Slovenska Bistrica
00050000-56b0-d421-8e0f-a3d58c1b7bbc	3210	Slovenske Konjice
00050000-56b0-d421-b655-749106ccba1f	1216	Smlednik
00050000-56b0-d421-4713-23aed55618e1	5232	Soča
00050000-56b0-d421-f1a3-bcb4858a1027	1317	Sodražica
00050000-56b0-d421-1885-98a2f19715d6	3335	Solčava
00050000-56b0-d421-b9f9-15b2cdbb7474	5250	Solkan
00050000-56b0-d421-82fc-e4676d5c20cc	4229	Sorica
00050000-56b0-d421-1d0f-27ea67ccb0d4	4225	Sovodenj
00050000-56b0-d421-3a66-ab4b3be35934	5281	Spodnja Idrija
00050000-56b0-d421-6a7c-92e636444264	2241	Spodnji Duplek
00050000-56b0-d421-eefb-9890067e7460	9245	Spodnji Ivanjci
00050000-56b0-d421-f2c7-0760a99163a2	2277	Središče ob Dravi
00050000-56b0-d421-80d5-1e1d55a7cfd5	4267	Srednja vas v Bohinju
00050000-56b0-d421-7043-5a15ccb163ad	8256	Sromlje 
00050000-56b0-d421-1096-fab7d5c12fbd	5224	Srpenica
00050000-56b0-d421-c45b-292ef76b4708	1242	Stahovica
00050000-56b0-d421-e39f-f3a5fb6fd7a2	1332	Stara Cerkev
00050000-56b0-d421-581e-4cc7f5db9e40	8342	Stari trg ob Kolpi
00050000-56b0-d421-3a32-2c295f7a4e4f	1386	Stari trg pri Ložu
00050000-56b0-d421-c189-5b5e4adbc334	2205	Starše
00050000-56b0-d421-fc76-5cda46268049	2289	Stoperce
00050000-56b0-d421-db23-f9e3fac455da	8322	Stopiče
00050000-56b0-d421-de17-ed67fad29612	3206	Stranice
00050000-56b0-d421-3294-f5ef76cdb015	8351	Straža
00050000-56b0-d421-4e0e-140e4226ddcf	1313	Struge
00050000-56b0-d421-8441-decaea75882c	8293	Studenec
00050000-56b0-d421-ab32-01d3c3f6d944	8331	Suhor
00050000-56b0-d421-da9b-58a143ef7059	2233	Sv. Ana v Slovenskih goricah
00050000-56b0-d421-505f-1971bbaad7f7	2235	Sv. Trojica v Slovenskih goricah
00050000-56b0-d421-1e2e-620dfe562114	2353	Sveti Duh na Ostrem Vrhu
00050000-56b0-d421-b388-db006a01f64b	9244	Sveti Jurij ob Ščavnici
00050000-56b0-d421-1401-b38738ae7fa0	3264	Sveti Štefan
00050000-56b0-d421-f9ce-5b49358b9479	2258	Sveti Tomaž
00050000-56b0-d421-b342-7805b21a7ce5	9204	Šalovci
00050000-56b0-d421-603a-bfd44691a99c	5261	Šempas
00050000-56b0-d421-a4aa-276b8aaf88d3	5290	Šempeter pri Gorici
00050000-56b0-d421-db80-8b86117cf9fa	3311	Šempeter v Savinjski dolini
00050000-56b0-d421-eee5-5809d59273d5	4208	Šenčur
00050000-56b0-d421-485e-7958f6811815	2212	Šentilj v Slovenskih goricah
00050000-56b0-d421-5f95-fc6a3e32ffdd	8297	Šentjanž
00050000-56b0-d421-8019-8a2b85079fc5	2373	Šentjanž pri Dravogradu
00050000-56b0-d421-2608-8148eaec6279	8310	Šentjernej
00050000-56b0-d421-a767-c9b71d8dc29c	3230	Šentjur
00050000-56b0-d421-311f-83d18867f8ee	3271	Šentrupert
00050000-56b0-d421-9222-f7ce736e6720	8232	Šentrupert
00050000-56b0-d421-4380-edefc132372e	1296	Šentvid pri Stični
00050000-56b0-d421-39c9-787b9023a77d	8275	Škocjan
00050000-56b0-d421-8fc5-853d89d7cd9d	6281	Škofije
00050000-56b0-d421-a703-7b2e6e9cc31a	4220	Škofja Loka
00050000-56b0-d421-c699-b40a17c8b1d8	3211	Škofja vas
00050000-56b0-d421-f8d0-6943adcfb959	1291	Škofljica
00050000-56b0-d421-7c47-7a3e9655bb40	6274	Šmarje
00050000-56b0-d421-a362-bfa7d9a40b39	1293	Šmarje - Sap
00050000-56b0-d421-2d38-da64e5932fa7	3240	Šmarje pri Jelšah
00050000-56b0-d421-ef60-bd793c585f40	8220	Šmarješke Toplice
00050000-56b0-d421-b82c-580fa6f33489	2315	Šmartno na Pohorju
00050000-56b0-d421-b1af-851a999f946c	3341	Šmartno ob Dreti
00050000-56b0-d421-2de7-85cb358c05fd	3327	Šmartno ob Paki
00050000-56b0-d421-3040-efc54d9d1178	1275	Šmartno pri Litiji
00050000-56b0-d421-748a-f0bf7f2ee2ff	2383	Šmartno pri Slovenj Gradcu
00050000-56b0-d421-e153-3e95292da525	3201	Šmartno v Rožni dolini
00050000-56b0-d421-09a6-a7755893ed80	3325	Šoštanj
00050000-56b0-d421-6dda-3d15c418e74c	6222	Štanjel
00050000-56b0-d421-101f-f48316498e7f	3220	Štore
00050000-56b0-d421-15f1-407d7b78d142	3304	Tabor
00050000-56b0-d421-2bce-9690fa2c91e3	3221	Teharje
00050000-56b0-d421-53a0-6d30b21be60c	9251	Tišina
00050000-56b0-d421-7064-128644958eca	5220	Tolmin
00050000-56b0-d421-0ca7-9e600d0442dc	3326	Topolšica
00050000-56b0-d421-0df5-4681af9c7445	2371	Trbonje
00050000-56b0-d421-8bad-9d45eff2bed4	1420	Trbovlje
00050000-56b0-d421-1b8d-866890c1b9ca	8231	Trebelno 
00050000-56b0-d421-9cbb-7941f8ae5941	8210	Trebnje
00050000-56b0-d421-205c-de99b39996ae	5252	Trnovo pri Gorici
00050000-56b0-d421-23e5-faac89c15b2f	2254	Trnovska vas
00050000-56b0-d421-6b7b-3dc1c0a19a0e	1222	Trojane
00050000-56b0-d421-f8b1-51dbbb5f850e	1236	Trzin
00050000-56b0-d421-a1a3-73cac452d5e8	4290	Tržič
00050000-56b0-d421-db1a-ea33b09e3902	8295	Tržišče
00050000-56b0-d421-bfea-09d2a7ad9a7c	1311	Turjak
00050000-56b0-d421-21ce-343c89570990	9224	Turnišče
00050000-56b0-d421-6a8f-f05be1f5bb9b	8323	Uršna sela
00050000-56b0-d421-216b-ccdfa4837ae8	1252	Vače
00050000-56b0-d421-cb74-713a98e9ba85	3320	Velenje 
00050000-56b0-d421-6d6c-2d71ef1b80ad	3322	Velenje - poštni predali
00050000-56b0-d421-73eb-cf7536da3532	8212	Velika Loka
00050000-56b0-d421-4143-1ec8d7b97ef2	2274	Velika Nedelja
00050000-56b0-d421-219f-6b2c6bd6b362	9225	Velika Polana
00050000-56b0-d421-6db1-8180351bf375	1315	Velike Lašče
00050000-56b0-d421-9e56-04fd744a95d2	8213	Veliki Gaber
00050000-56b0-d421-b626-e1935993730e	9241	Veržej
00050000-56b0-d421-18fa-b45265cf7064	1312	Videm - Dobrepolje
00050000-56b0-d421-6d05-7a9bf95fed27	2284	Videm pri Ptuju
00050000-56b0-d421-0b52-2e4bb90cf598	8344	Vinica
00050000-56b0-d421-646a-08e5d1d65e89	5271	Vipava
00050000-56b0-d421-186d-6a90dac7300f	4212	Visoko
00050000-56b0-d421-b065-b9fd1b974103	1294	Višnja Gora
00050000-56b0-d421-1cd5-c9810547c03f	3205	Vitanje
00050000-56b0-d421-2076-77f314075237	2255	Vitomarci
00050000-56b0-d421-662d-6b656cbaa2cd	1217	Vodice
00050000-56b0-d421-6c15-c2a65d75e680	3212	Vojnik\t
00050000-56b0-d421-e73d-36dac46989a2	5293	Volčja Draga
00050000-56b0-d421-1631-7ea238a8be8a	2232	Voličina
00050000-56b0-d421-e6d6-ea7d37582b9e	3305	Vransko
00050000-56b0-d421-5256-51c2021d8ef8	6217	Vremski Britof
00050000-56b0-d421-2c30-1d128a7d3cc6	1360	Vrhnika
00050000-56b0-d421-b679-049116227b21	2365	Vuhred
00050000-56b0-d421-b0f0-e235cf987385	2367	Vuzenica
00050000-56b0-d421-e84b-53501f1a7961	8292	Zabukovje 
00050000-56b0-d421-58c0-290169b96cad	1410	Zagorje ob Savi
00050000-56b0-d421-d40f-dbf17b7fef3f	1303	Zagradec
00050000-56b0-d421-2ac2-659d47068b9d	2283	Zavrč
00050000-56b0-d421-3bfc-51c6c553f2a1	8272	Zdole 
00050000-56b0-d421-5b23-a9bec335851a	4201	Zgornja Besnica
00050000-56b0-d421-5d16-5d3fe1ee613a	2242	Zgornja Korena
00050000-56b0-d421-0c85-a9a74c8f925a	2201	Zgornja Kungota
00050000-56b0-d421-d179-441471e7c952	2316	Zgornja Ložnica
00050000-56b0-d421-9b3a-1a00f366011a	2314	Zgornja Polskava
00050000-56b0-d421-293d-06f63888cd3d	2213	Zgornja Velka
00050000-56b0-d421-6940-20946ec092b5	4247	Zgornje Gorje
00050000-56b0-d421-c9af-f3c8c3b8b87e	4206	Zgornje Jezersko
00050000-56b0-d421-c2c5-cab27ec7da49	2285	Zgornji Leskovec
00050000-56b0-d421-9632-d2bf985e7fff	1432	Zidani Most
00050000-56b0-d421-69da-ebf60a880cd0	3214	Zreče
00050000-56b0-d421-a062-ad2c61ea79f3	4209	Žabnica
00050000-56b0-d421-dfa0-63859511fbf8	3310	Žalec
00050000-56b0-d421-25dd-66b47d0ee1ff	4228	Železniki
00050000-56b0-d421-af9e-c284e874d7ac	2287	Žetale
00050000-56b0-d421-322b-db4e3769967b	4226	Žiri
00050000-56b0-d421-33c2-2101028c64ff	4274	Žirovnica
00050000-56b0-d421-4932-991054684f50	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 42947727)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 42947297)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 42947037)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56b0-d425-10c7-c4dcda220406	00080000-56b0-d425-fdbc-a52079bd7eed	\N	00040000-56b0-d422-e6d8-d678e0098761	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56b0-d425-337d-a7aefeb4f378	00080000-56b0-d425-fdbc-a52079bd7eed	\N	00040000-56b0-d422-e6d8-d678e0098761	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56b0-d425-bb25-3d67f096c93e	00080000-56b0-d425-69c8-36b5ba8ec8fa	\N	00040000-56b0-d422-e6d8-d678e0098761	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 42947172)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56b0-d422-2321-b20d4bec87e8	novo leto	1	1	\N	t
00430000-56b0-d422-f9e2-5a0d4eba8bee	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56b0-d422-9824-7668d3282b15	dan upora proti okupatorju	27	4	\N	t
00430000-56b0-d422-e9d0-fbbea047f0da	praznik dela	1	5	\N	t
00430000-56b0-d422-a3d9-ccd9dab3decc	praznik dela	2	5	\N	t
00430000-56b0-d422-1fcc-c4986aa0d5de	dan Primoža Trubarja	8	6	\N	f
00430000-56b0-d422-e3d0-d632762c58fb	dan državnosti	25	6	\N	t
00430000-56b0-d422-eb66-93980b7922b7	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56b0-d422-76c3-03fd66196c3b	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56b0-d422-2e1f-0286a3b4085c	dan suverenosti	25	10	\N	f
00430000-56b0-d422-3e77-22e2584dd68a	dan spomina na mrtve	1	11	\N	t
00430000-56b0-d422-b0bd-edb69feb4f19	dan Rudolfa Maistra	23	11	\N	f
00430000-56b0-d422-0a59-51c87af80677	božič	25	12	\N	t
00430000-56b0-d422-1fe1-339bb32810eb	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56b0-d422-cd19-b7f49b14c5b2	Marijino vnebovzetje	15	8	\N	t
00430000-56b0-d422-8769-38d6cbe26104	dan reformacije	31	10	\N	t
00430000-56b0-d422-e1d2-e9a31cb6341e	velikonočna nedelja	27	3	2016	t
00430000-56b0-d422-47fd-9dd9462894ed	velikonočna nedelja	16	4	2017	t
00430000-56b0-d422-d066-dc5e85977673	velikonočna nedelja	1	4	2018	t
00430000-56b0-d422-c35f-c55d24fd7a14	velikonočna nedelja	21	4	2019	t
00430000-56b0-d422-e53e-7e4de8f0f39e	velikonočna nedelja	12	4	2020	t
00430000-56b0-d422-fc32-138aaba4bf4d	velikonočna nedelja	4	4	2021	t
00430000-56b0-d422-07dd-179ca758ed46	velikonočna nedelja	17	4	2022	t
00430000-56b0-d422-c6a4-254e8ed31c22	velikonočna nedelja	9	4	2023	t
00430000-56b0-d422-cf9e-ea3ba35f047b	velikonočna nedelja	31	3	2024	t
00430000-56b0-d422-d395-c74aa391a212	velikonočna nedelja	20	4	2025	t
00430000-56b0-d422-ec94-3f78fc2d2e7c	velikonočna nedelja	5	4	2026	t
00430000-56b0-d422-b981-ee4298abae8b	velikonočna nedelja	28	3	2027	t
00430000-56b0-d422-c9b4-68aef061d5b1	velikonočna nedelja	16	4	2028	t
00430000-56b0-d422-ce2b-2232df00c632	velikonočna nedelja	1	4	2029	t
00430000-56b0-d422-c0d4-6523c433a561	velikonočna nedelja	21	4	2030	t
00430000-56b0-d422-9dc7-978b1c0dc043	velikonočni ponedeljek	28	3	2016	t
00430000-56b0-d422-f900-5e4b4cf9125b	velikonočni ponedeljek	17	4	2017	t
00430000-56b0-d422-fe24-b164d9ad62c4	velikonočni ponedeljek	2	4	2018	t
00430000-56b0-d422-6ffe-d48921e552a3	velikonočni ponedeljek	22	4	2019	t
00430000-56b0-d422-ca16-532d8a8ddf2c	velikonočni ponedeljek	13	4	2020	t
00430000-56b0-d422-983d-bf9b145705c8	velikonočni ponedeljek	5	4	2021	t
00430000-56b0-d422-0e82-cd751720302c	velikonočni ponedeljek	18	4	2022	t
00430000-56b0-d422-4ff7-ef6c3c8c9fbc	velikonočni ponedeljek	10	4	2023	t
00430000-56b0-d422-8f1f-414b803051a1	velikonočni ponedeljek	1	4	2024	t
00430000-56b0-d422-15ac-cf6a1a2fcf69	velikonočni ponedeljek	21	4	2025	t
00430000-56b0-d422-db88-9b1e1e46814a	velikonočni ponedeljek	6	4	2026	t
00430000-56b0-d422-233f-7e2b1f530d92	velikonočni ponedeljek	29	3	2027	t
00430000-56b0-d422-8a0a-865d0c885482	velikonočni ponedeljek	17	4	2028	t
00430000-56b0-d422-6ee7-647a9118e706	velikonočni ponedeljek	2	4	2029	t
00430000-56b0-d422-a044-7d74a8b9bf86	velikonočni ponedeljek	22	4	2030	t
00430000-56b0-d422-86c7-2b8266669d52	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56b0-d422-f9b2-2042c5f9f3dc	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56b0-d422-a613-4257222de565	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56b0-d422-89a1-693c2609d5e5	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56b0-d422-9542-5b17b3aa211a	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56b0-d422-bdea-2b3e5b31023a	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56b0-d422-efe6-07ad7dc8d602	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56b0-d422-827a-83e31c9062ae	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56b0-d422-438b-885b34d95f40	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56b0-d422-2dd5-70f80b9ac487	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56b0-d422-9b4c-e4ff31c43375	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56b0-d422-9f5c-b38527c943d2	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56b0-d422-dac4-470d1a19854f	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56b0-d422-c40f-12a4f713a2cc	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56b0-d422-4554-eaae827b09f4	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 42947141)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56b0-d426-0d3f-32efb2644d1f	000e0000-56b0-d425-a514-f4202a3a1748	1	3	1
001b0000-56b0-d426-7883-6e3d32d28e28	000e0000-56b0-d425-a514-f4202a3a1748	2	4	2
001b0000-56b0-d426-53ef-f0559cf7a314	000e0000-56b0-d425-a514-f4202a3a1748	4	5	3
001b0000-56b0-d426-eac2-56150e7df6e4	000e0000-56b0-d425-a514-f4202a3a1748	\N	1	\N
001b0000-56b0-d426-89cd-e35329f9438a	000e0000-56b0-d425-a514-f4202a3a1748	5	9	4
001b0000-56b0-d426-75fe-056f8147b565	000e0000-56b0-d425-a514-f4202a3a1748	7	10	5
001b0000-56b0-d426-cc64-8fd296fc4c17	000e0000-56b0-d425-d625-8c2cc8c82d6f	3	2	1
001b0000-56b0-d426-4cf1-addd5158d7c0	000e0000-56b0-d425-d625-8c2cc8c82d6f	4	3	1
001b0000-56b0-d426-60a0-84a7be47bd6d	000e0000-56b0-d425-a514-f4202a3a1748	\N	2	\N
001b0000-56b0-d426-a2a3-5b2ceb30076e	000e0000-56b0-d425-d625-8c2cc8c82d6f	\N	1	\N
001b0000-56b0-d426-3769-4ece5890796a	000e0000-56b0-d425-a514-f4202a3a1748	3	8	3
001b0000-56b0-d426-931a-c5b462fa2534	000e0000-56b0-d425-a514-f4202a3a1748	2	11	1
001b0000-56b0-d426-b0e3-3daa1f024877	000e0000-56b0-d425-d625-8c2cc8c82d6f	1	5	1
001b0000-56b0-d426-c76d-c0d554e6e394	000e0000-56b0-d425-d625-8c2cc8c82d6f	6	4	2
001b0000-56b0-d426-9b1b-7f5b2ea6b154	000e0000-56b0-d425-a514-f4202a3a1748	1	6	1
001b0000-56b0-d426-0b34-b663343aa442	000e0000-56b0-d425-a514-f4202a3a1748	2	7	2
\.


--
-- TOC entry 3161 (class 0 OID 42947147)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56b0-d426-0d3f-32efb2644d1f	000a0000-56b0-d425-2706-7f62c118561b
001b0000-56b0-d426-0d3f-32efb2644d1f	000a0000-56b0-d425-7ed1-61bf0339c427
001b0000-56b0-d426-7883-6e3d32d28e28	000a0000-56b0-d425-7ed1-61bf0339c427
001b0000-56b0-d426-7883-6e3d32d28e28	000a0000-56b0-d425-1133-019cbe12cc03
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 42947309)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 42947741)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 42947751)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56b0-d425-677e-b92c8c28d0b3	00080000-56b0-d425-4776-5aeeeaa161ca	0987	AK
00190000-56b0-d425-95f5-a0aa2675546e	00080000-56b0-d425-69c8-36b5ba8ec8fa	0989	AK
00190000-56b0-d425-ab8e-4f66f3362caa	00080000-56b0-d425-1e63-e1a809c4ef80	0986	AK
00190000-56b0-d425-edb3-8f65ffa21057	00080000-56b0-d425-88f3-2faaec15ed23	0984	AK
00190000-56b0-d425-9c41-d274285f35dc	00080000-56b0-d425-4841-6953915dd4bc	0983	AK
00190000-56b0-d425-99e9-566caf544ba9	00080000-56b0-d425-d3ee-42cca9bb83f1	0982	AK
00190000-56b0-d427-c935-83ea3592e393	00080000-56b0-d427-622b-7cb5eddb76e7	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 42947640)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56b0-d426-2826-6f4786e54566	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 42947759)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 42947337)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56b0-d425-d6da-7caa9e9bf76b	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56b0-d425-890b-ca7ef93cc618	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56b0-d425-890f-4daf6da6415d	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56b0-d425-d32b-fde67ad4f5a7	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56b0-d425-29cd-0688d55ff475	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56b0-d425-961d-d4ab3974de46	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56b0-d425-1d89-5dc7f6ff4abe	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 42947282)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 42947272)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 42947479)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 42947409)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 42947115)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 42946876)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56b0-d427-622b-7cb5eddb76e7	00010000-56b0-d423-e6ff-1dfb110e0ba3	2016-02-02 17:07:03	INS	a:0:{}
2	App\\Entity\\Option	00000000-56b0-d427-c0c1-e940816df113	00010000-56b0-d423-e6ff-1dfb110e0ba3	2016-02-02 17:07:03	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56b0-d427-c935-83ea3592e393	00010000-56b0-d423-e6ff-1dfb110e0ba3	2016-02-02 17:07:03	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 42947351)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 42946914)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56b0-d422-fb6a-dd45664a19b0	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56b0-d422-fde2-d0cd8f805572	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56b0-d422-0767-2ec68a140d35	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56b0-d422-bae7-8452aab517aa	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56b0-d422-d5eb-02e13a9466d3	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56b0-d422-377e-480861f7142f	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56b0-d422-f53b-42cc1c6052f3	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56b0-d422-baa5-14d8c479d960	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56b0-d422-3878-786bd68b8101	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56b0-d422-77ec-dd05401c2928	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56b0-d422-da86-090c83d4d1ed	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56b0-d422-ff1b-e6e16c4a201d	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56b0-d422-0da0-fcba5063168c	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56b0-d422-337d-019c8ad5b748	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56b0-d422-a63d-4f076a532da4	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56b0-d422-5ccc-d3b574973b61	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56b0-d422-6215-e4e82e8d718c	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56b0-d422-f952-a643eb44d09a	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56b0-d422-0f68-b63147d63867	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56b0-d422-e190-152873ade62a	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56b0-d422-fb4b-17cde5aedd8f	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56b0-d422-f343-26d625447c3d	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56b0-d422-3907-cd070e572fd8	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56b0-d422-51a3-cc0fcaa2b0a0	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56b0-d422-528a-31b0342eae2a	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56b0-d422-295f-3b1e7a9c2b1c	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56b0-d422-b207-fe1c0518a73e	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56b0-d422-2031-d235ba394679	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56b0-d422-960b-4daa8fb407dd	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56b0-d422-0413-ef540c974f82	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56b0-d422-304f-681403da8da8	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56b0-d422-3647-432ef25bfda1	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56b0-d423-b439-2d8334e6b0d1	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56b0-d423-2af4-cfc815654815	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56b0-d423-aa0d-56f0ea5ba879	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56b0-d423-bcc6-187974a7b8a9	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56b0-d423-79a2-1071ec4715bf	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56b0-d423-ab7d-2f66cb359429	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56b0-d423-91f6-8e9f2da9c5a5	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56b0-d423-f6e5-46dec2e8b739	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56b0-d423-7b76-1c07f75a51db	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56b0-d423-1210-9f75705898d7	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56b0-d423-8dd1-b7a37129ad17	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56b0-d423-84e5-56cfdc56d7f4	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56b0-d423-386d-c5a6b3a51005	direktor	minimalne pravice za direktorja	t
00020000-56b0-d423-3c61-b14e7cc9b17f	arhivar	arhivar	t
00020000-56b0-d423-f7a8-d2fb27a1290e	dramaturg	dramaturg	t
00020000-56b0-d423-4fdc-cdb6c7f211fa	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56b0-d423-4ad0-97b708dc18db	poslovni-sekretar	poslovni sekretar	t
00020000-56b0-d423-7018-e2ce86979bee	vodja-tehnike	vodja tehnike	t
00020000-56b0-d423-1c5d-d6212b6911ce	racunovodja	računovodja	t
00020000-56b0-d425-b515-68f941a0eb1d	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56b0-d425-a19e-5a6173d62b9c	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-9cdb-088acae1d4bb	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-e8af-653ecc975f0b	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-c8ca-18bcd33d8cb4	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-2e34-0fd8e0c8c951	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-36ef-5d09e638f834	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-0c98-271c829e6591	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-74a2-005c346e9977	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-63b7-fc58620cb1c1	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-c95b-9f6f589d130f	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-356d-2fabeae55537	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-2752-734b875c18fa	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-76fd-5ffd7e7c6c7c	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-d879-635340cf16b7	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-1a62-5fae13a8cced	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-2bff-26283fb92c11	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-92c8-d26049670d06	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-dbb7-0f7b31ede38a	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-43ab-8682b0e2640d	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56b0-d425-473e-a21d42230066	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-de92-d08184bb1588	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-4792-cb68328a3d06	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-4e01-04b7f6ab8f19	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-c8db-3add2348e98e	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-2bd0-1c606385125f	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-cbb5-a7958905f2cf	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-a480-124b7dcf1127	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-766e-30de941efa56	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-a529-b2c5af99af3c	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-c6d1-fd9f9d47c052	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-6615-a0f4ab056018	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-e20e-f53d283b0d43	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-50df-6112a0f5be59	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-9130-75e45c2a2c7b	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-9f98-1531b24a941f	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-fac8-969a0efdcea6	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-90a1-a0acf5bc0bef	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56b0-d425-e028-811fa617faaf	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 42946898)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56b0-d423-deda-93bd03958ecc	00020000-56b0-d422-0767-2ec68a140d35
00010000-56b0-d423-e6ff-1dfb110e0ba3	00020000-56b0-d422-0767-2ec68a140d35
00010000-56b0-d425-b723-44eb7c020bec	00020000-56b0-d425-b515-68f941a0eb1d
00010000-56b0-d425-e777-81c24c82a280	00020000-56b0-d425-a19e-5a6173d62b9c
00010000-56b0-d425-e777-81c24c82a280	00020000-56b0-d425-2e34-0fd8e0c8c951
00010000-56b0-d425-e777-81c24c82a280	00020000-56b0-d425-63b7-fc58620cb1c1
00010000-56b0-d425-e777-81c24c82a280	00020000-56b0-d425-356d-2fabeae55537
00010000-56b0-d425-e777-81c24c82a280	00020000-56b0-d425-76fd-5ffd7e7c6c7c
00010000-56b0-d425-e777-81c24c82a280	00020000-56b0-d425-dbb7-0f7b31ede38a
00010000-56b0-d425-e777-81c24c82a280	00020000-56b0-d425-e8af-653ecc975f0b
00010000-56b0-d425-e777-81c24c82a280	00020000-56b0-d425-473e-a21d42230066
00010000-56b0-d425-e777-81c24c82a280	00020000-56b0-d425-4e01-04b7f6ab8f19
00010000-56b0-d425-e777-81c24c82a280	00020000-56b0-d425-2bd0-1c606385125f
00010000-56b0-d425-e777-81c24c82a280	00020000-56b0-d425-a480-124b7dcf1127
00010000-56b0-d425-e777-81c24c82a280	00020000-56b0-d425-a529-b2c5af99af3c
00010000-56b0-d425-e777-81c24c82a280	00020000-56b0-d425-50df-6112a0f5be59
00010000-56b0-d425-f93a-e8b89827568c	00020000-56b0-d425-a19e-5a6173d62b9c
00010000-56b0-d425-f93a-e8b89827568c	00020000-56b0-d425-9cdb-088acae1d4bb
00010000-56b0-d425-f93a-e8b89827568c	00020000-56b0-d425-e8af-653ecc975f0b
00010000-56b0-d425-f93a-e8b89827568c	00020000-56b0-d425-c8ca-18bcd33d8cb4
00010000-56b0-d425-f93a-e8b89827568c	00020000-56b0-d425-76fd-5ffd7e7c6c7c
00010000-56b0-d425-f93a-e8b89827568c	00020000-56b0-d425-2bff-26283fb92c11
00010000-56b0-d425-f93a-e8b89827568c	00020000-56b0-d425-473e-a21d42230066
00010000-56b0-d425-f93a-e8b89827568c	00020000-56b0-d425-4e01-04b7f6ab8f19
00010000-56b0-d425-f93a-e8b89827568c	00020000-56b0-d425-2bd0-1c606385125f
00010000-56b0-d425-f93a-e8b89827568c	00020000-56b0-d425-a480-124b7dcf1127
00010000-56b0-d425-f93a-e8b89827568c	00020000-56b0-d425-a529-b2c5af99af3c
00010000-56b0-d425-f93a-e8b89827568c	00020000-56b0-d425-50df-6112a0f5be59
00010000-56b0-d425-ddf0-4a1cc25f2dfb	00020000-56b0-d425-a19e-5a6173d62b9c
00010000-56b0-d425-ddf0-4a1cc25f2dfb	00020000-56b0-d425-9cdb-088acae1d4bb
00010000-56b0-d425-ddf0-4a1cc25f2dfb	00020000-56b0-d425-e8af-653ecc975f0b
00010000-56b0-d425-ddf0-4a1cc25f2dfb	00020000-56b0-d425-c8ca-18bcd33d8cb4
00010000-56b0-d425-ddf0-4a1cc25f2dfb	00020000-56b0-d425-356d-2fabeae55537
00010000-56b0-d425-ddf0-4a1cc25f2dfb	00020000-56b0-d425-76fd-5ffd7e7c6c7c
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-9cdb-088acae1d4bb
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-36ef-5d09e638f834
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-c95b-9f6f589d130f
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-2752-734b875c18fa
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-356d-2fabeae55537
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-92c8-d26049670d06
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-76fd-5ffd7e7c6c7c
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-d879-635340cf16b7
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-473e-a21d42230066
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-de92-d08184bb1588
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-4e01-04b7f6ab8f19
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-c8db-3add2348e98e
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-2bd0-1c606385125f
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-cbb5-a7958905f2cf
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-a480-124b7dcf1127
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-766e-30de941efa56
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-a529-b2c5af99af3c
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-c6d1-fd9f9d47c052
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-50df-6112a0f5be59
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-9130-75e45c2a2c7b
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-fac8-969a0efdcea6
00010000-56b0-d425-f54a-01706be3095c	00020000-56b0-d425-90a1-a0acf5bc0bef
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-9cdb-088acae1d4bb
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-36ef-5d09e638f834
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-74a2-005c346e9977
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-c95b-9f6f589d130f
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-2752-734b875c18fa
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-356d-2fabeae55537
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-92c8-d26049670d06
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-76fd-5ffd7e7c6c7c
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-d879-635340cf16b7
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-1a62-5fae13a8cced
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-473e-a21d42230066
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-de92-d08184bb1588
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-4792-cb68328a3d06
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-4e01-04b7f6ab8f19
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-c8db-3add2348e98e
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-2bd0-1c606385125f
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-cbb5-a7958905f2cf
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-a480-124b7dcf1127
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-766e-30de941efa56
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-a529-b2c5af99af3c
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-c6d1-fd9f9d47c052
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-50df-6112a0f5be59
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-9130-75e45c2a2c7b
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-9f98-1531b24a941f
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-fac8-969a0efdcea6
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-90a1-a0acf5bc0bef
00010000-56b0-d425-4713-bf1ce3374d42	00020000-56b0-d425-e028-811fa617faaf
00010000-56b0-d425-9987-b1ef2b8ec15f	00020000-56b0-d425-9cdb-088acae1d4bb
00010000-56b0-d425-9987-b1ef2b8ec15f	00020000-56b0-d425-e8af-653ecc975f0b
00010000-56b0-d425-9987-b1ef2b8ec15f	00020000-56b0-d425-36ef-5d09e638f834
00010000-56b0-d425-9987-b1ef2b8ec15f	00020000-56b0-d425-0c98-271c829e6591
00010000-56b0-d425-9987-b1ef2b8ec15f	00020000-56b0-d425-74a2-005c346e9977
00010000-56b0-d425-9987-b1ef2b8ec15f	00020000-56b0-d425-2e34-0fd8e0c8c951
00010000-56b0-d425-9987-b1ef2b8ec15f	00020000-56b0-d425-c95b-9f6f589d130f
00010000-56b0-d425-9987-b1ef2b8ec15f	00020000-56b0-d425-2752-734b875c18fa
00010000-56b0-d425-9987-b1ef2b8ec15f	00020000-56b0-d425-356d-2fabeae55537
00010000-56b0-d425-9987-b1ef2b8ec15f	00020000-56b0-d425-92c8-d26049670d06
00010000-56b0-d425-affe-f2916f5174d4	00020000-56b0-d425-a19e-5a6173d62b9c
00010000-56b0-d425-affe-f2916f5174d4	00020000-56b0-d425-c8ca-18bcd33d8cb4
00010000-56b0-d425-affe-f2916f5174d4	00020000-56b0-d425-2e34-0fd8e0c8c951
00010000-56b0-d425-affe-f2916f5174d4	00020000-56b0-d425-63b7-fc58620cb1c1
00010000-56b0-d425-affe-f2916f5174d4	00020000-56b0-d425-356d-2fabeae55537
00010000-56b0-d425-affe-f2916f5174d4	00020000-56b0-d425-76fd-5ffd7e7c6c7c
00010000-56b0-d425-affe-f2916f5174d4	00020000-56b0-d425-dbb7-0f7b31ede38a
00010000-56b0-d425-affe-f2916f5174d4	00020000-56b0-d425-6615-a0f4ab056018
00010000-56b0-d425-2281-429467bd9004	00020000-56b0-d425-43ab-8682b0e2640d
00010000-56b0-d425-aedf-1791eb02a11f	00020000-56b0-d423-386d-c5a6b3a51005
00010000-56b0-d425-442d-b491ca054c84	00020000-56b0-d423-3c61-b14e7cc9b17f
00010000-56b0-d425-a73d-c727082e9418	00020000-56b0-d423-f7a8-d2fb27a1290e
00010000-56b0-d425-03d4-276a75a6d390	00020000-56b0-d423-4fdc-cdb6c7f211fa
00010000-56b0-d425-f942-433019081723	00020000-56b0-d423-4ad0-97b708dc18db
00010000-56b0-d425-dc5f-b5ee8176b8ab	00020000-56b0-d423-7018-e2ce86979bee
00010000-56b0-d425-769d-86b772440e6c	00020000-56b0-d423-1c5d-d6212b6911ce
\.


--
-- TOC entry 3186 (class 0 OID 42947365)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 42947303)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 42947226)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56b0-d425-7a7b-ba012547d9a7	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56b0-d425-21cf-5d2ec1bb7663	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56b0-d425-9379-397c1f0bd4b0	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56b0-d425-6115-b832fff80e9e	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 42946863)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56b0-d422-74c5-234bec041228	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56b0-d422-3fe6-69c615263c6d	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56b0-d422-36d9-c4c23ae7b1af	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56b0-d422-5ce4-3719e7c43a24	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56b0-d422-f9c4-25e937e97d12	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 42946855)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56b0-d422-50c0-92ecf329a9e0	00230000-56b0-d422-5ce4-3719e7c43a24	popa
00240000-56b0-d422-1616-4eecd5a5c925	00230000-56b0-d422-5ce4-3719e7c43a24	oseba
00240000-56b0-d422-e25c-af6ac7fd5477	00230000-56b0-d422-5ce4-3719e7c43a24	tippopa
00240000-56b0-d422-064d-ae0571486589	00230000-56b0-d422-5ce4-3719e7c43a24	organizacijskaenota
00240000-56b0-d422-941d-91161b3d4052	00230000-56b0-d422-5ce4-3719e7c43a24	sezona
00240000-56b0-d422-12b2-aea8b74a87b9	00230000-56b0-d422-5ce4-3719e7c43a24	tipvaje
00240000-56b0-d422-57f8-08b050fe5cab	00230000-56b0-d422-5ce4-3719e7c43a24	tipdodatka
00240000-56b0-d422-ffa7-eabbc86cfd20	00230000-56b0-d422-3fe6-69c615263c6d	prostor
00240000-56b0-d422-3dfc-499293c3e6b3	00230000-56b0-d422-5ce4-3719e7c43a24	besedilo
00240000-56b0-d422-b5ea-3ea83073e72c	00230000-56b0-d422-5ce4-3719e7c43a24	uprizoritev
00240000-56b0-d422-0a9f-4c5657c4d91c	00230000-56b0-d422-5ce4-3719e7c43a24	funkcija
00240000-56b0-d422-9923-055e1a2f7cd8	00230000-56b0-d422-5ce4-3719e7c43a24	tipfunkcije
00240000-56b0-d422-e742-a7cd55795b17	00230000-56b0-d422-5ce4-3719e7c43a24	alternacija
00240000-56b0-d422-764e-7b6c8ab78e25	00230000-56b0-d422-74c5-234bec041228	pogodba
00240000-56b0-d422-29e3-3d2b308f2a35	00230000-56b0-d422-5ce4-3719e7c43a24	zaposlitev
00240000-56b0-d422-1e9d-88649fd4178d	00230000-56b0-d422-5ce4-3719e7c43a24	zvrstuprizoritve
00240000-56b0-d422-832d-67a97682fb51	00230000-56b0-d422-74c5-234bec041228	programdela
00240000-56b0-d422-e356-8cd4ffe46172	00230000-56b0-d422-5ce4-3719e7c43a24	zapis
\.


--
-- TOC entry 3133 (class 0 OID 42946850)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
c7c56141-27ef-4659-b287-0468143783f7	00240000-56b0-d422-50c0-92ecf329a9e0	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 42947426)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56b0-d426-ff11-c6ba59391540	000e0000-56b0-d425-a514-f4202a3a1748	00080000-56b0-d425-fdbc-a52079bd7eed	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56b0-d422-230b-b41f61dcbc25
00270000-56b0-d426-ed31-fefa83189a6f	000e0000-56b0-d425-a514-f4202a3a1748	00080000-56b0-d425-fdbc-a52079bd7eed	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56b0-d422-230b-b41f61dcbc25
\.


--
-- TOC entry 3149 (class 0 OID 42946999)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 42947245)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56b0-d426-6d3d-2931da946366	00180000-56b0-d426-5a10-f34147a85e3e	000c0000-56b0-d426-7f0b-2f8e5cd49256	00090000-56b0-d425-158b-4a52ca15ea6f	1630080	2015-06-26 10:00:00	1630020	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56b0-d426-cb2f-fddb65a188df	00180000-56b0-d426-5a10-f34147a85e3e	000c0000-56b0-d426-c538-a918ebbc42fe	00090000-56b0-d425-2822-0861f8e36e10	1630080	2015-06-26 10:00:00	1630020	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56b0-d426-cc00-c150cd0475aa	00180000-56b0-d426-5a10-f34147a85e3e	000c0000-56b0-d426-bb82-89f1dacee9ba	00090000-56b0-d425-9fc8-1247cb14ae39	1630080	2015-06-26 10:00:00	1630020	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56b0-d426-9df2-40b9ab946bef	00180000-56b0-d426-5a10-f34147a85e3e	000c0000-56b0-d426-5714-287d330fd996	00090000-56b0-d425-08be-c6080a71c39d	1630080	2015-06-26 10:00:00	1630020	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56b0-d426-b9d9-a4b7c6bb2003	00180000-56b0-d426-5a10-f34147a85e3e	000c0000-56b0-d426-b248-d9ff5280fadd	00090000-56b0-d425-15a8-2f10ac0c8e1d	1630080	2015-06-26 10:00:00	1630020	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56b0-d426-4e4e-58099f9954ae	00180000-56b0-d426-cade-826466ccabf0	\N	00090000-56b0-d425-15a8-2f10ac0c8e1d	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	f	\N	\N
001a0000-56b0-d426-c43f-ba0a7090c211	00180000-56b0-d426-b2c6-ed2967408c34	\N	00090000-56b0-d425-2822-0861f8e36e10	1576800	2015-08-01 20:00:00	1576830	2015-08-01 23:30:00	f	t	f	\N	\N
001a0000-56b0-d426-530d-91c2b16f2ebb	00180000-56b0-d426-5a10-f34147a85e3e	\N	00090000-56b0-d425-210b-0003a437b797	1682520	2015-08-01 20:00:00	1682610	2015-08-01 23:30:00	f	t	f	\N	\N
001a0000-56b0-d426-be39-6dc11f19e25c	00180000-56b0-d426-9eb4-83ceaf7ccef9	\N	00090000-56b0-d425-158b-4a52ca15ea6f	0	2015-03-10 07:00:00	0	2015-03-20 23:00:00	f	f	t	\N	\N
001a0000-56b0-d426-ec50-30d4cb6ae607	00180000-56b0-d426-9eb4-83ceaf7ccef9	\N	00090000-56b0-d425-2822-0861f8e36e10	0	2015-03-10 07:00:00	0	2015-03-20 23:00:00	f	f	t	\N	\N
001a0000-56b0-d426-9246-e8b6ecbc7872	00180000-56b0-d426-9eb4-83ceaf7ccef9	\N	00090000-56b0-d425-5fec-173312cb4611	0	2015-03-10 07:00:00	15840	2015-03-31 23:00:00	f	f	t	\N	\N
001a0000-56b0-d426-3a80-857676944983	00180000-56b0-d426-6109-761b3f740480	000c0000-56b0-d426-7f0b-2f8e5cd49256	00090000-56b0-d425-158b-4a52ca15ea6f	0	2015-03-15 20:00:00	120	2015-03-15 23:00:00	f	f	f	\N	\N
001a0000-56b0-d426-13e1-f27d1802ff76	00180000-56b0-d426-6109-761b3f740480	000c0000-56b0-d426-c538-a918ebbc42fe	00090000-56b0-d425-2822-0861f8e36e10	0	2015-03-15 20:00:00	120	2015-03-15 23:00:00	f	f	f	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 42947262)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56b0-d422-f87b-958b9ab20642	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56b0-d422-3288-b451ca0c6fcb	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56b0-d422-3346-d42cdaeccbd7	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56b0-d422-082e-c6919156c744	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56b0-d422-ca89-1e43594a6289	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56b0-d422-8298-d5c53da622c4	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 42947467)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56b0-d422-3135-7ebffd763df2	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56b0-d422-be24-2bf103a7b5cd	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56b0-d422-787a-b12be4d30281	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56b0-d422-0d78-270f9e925d71	04	Režija	Režija	Režija	umetnik	30
000f0000-56b0-d422-6f07-61e5a98bba2e	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56b0-d422-e02e-4b24deb89210	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56b0-d422-1ae5-51448cc7d27f	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56b0-d422-ba37-b499ff525cf0	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56b0-d422-ce3c-1fedbf1cadda	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56b0-d422-88c3-f3a423e8b74b	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56b0-d422-0cd9-c12de6820caa	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56b0-d422-51d5-fa68fa2ea13f	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56b0-d422-0b17-17fc64faedf7	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56b0-d422-0bcf-235c99894081	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56b0-d422-1f81-1a294174835a	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56b0-d422-1c86-313caa20ba78	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56b0-d422-1bc3-4ca54656aa64	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56b0-d422-5d7b-ca41804ca79d	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56b0-d422-12be-41717b38e327	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 42946950)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56b0-d425-a7f2-af2b343261ed	0001	šola	osnovna ali srednja šola
00400000-56b0-d425-c55e-2015e699122a	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56b0-d425-4cc9-8a72cc289f48	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 42947771)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56b0-d422-ccc4-25319cc6b232	01	Velika predstava	f	1.00	1.00
002b0000-56b0-d422-34ba-de854df00323	02	Mala predstava	f	0.50	0.50
002b0000-56b0-d422-9c60-50a223f517f1	03	Mala koprodukcija	t	0.40	1.00
002b0000-56b0-d422-5eb5-71c177ca2d09	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56b0-d422-8abf-2e384a8bca5a	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 42947216)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56b0-d422-87fb-8d68563ebca4	0001	prva vaja	prva vaja
00420000-56b0-d422-4ba6-542957b96200	0002	tehnična vaja	tehnična vaja
00420000-56b0-d422-f5e0-0ce068c62892	0003	lučna vaja	lučna vaja
00420000-56b0-d422-5d74-963dae926a39	0004	kostumska vaja	kostumska vaja
00420000-56b0-d422-4a93-985e0777f912	0005	foto vaja	foto vaja
00420000-56b0-d422-eb0b-5a9d5c6c63e0	0006	1. glavna vaja	1. glavna vaja
00420000-56b0-d422-a92f-b4c937588eec	0007	2. glavna vaja	2. glavna vaja
00420000-56b0-d422-e768-20aba5f19962	0008	1. generalka	1. generalka
00420000-56b0-d422-a04e-16f8093d2323	0009	2. generalka	2. generalka
00420000-56b0-d422-bec0-048ba7ca0518	0010	odprta generalka	odprta generalka
00420000-56b0-d422-46c0-1b3f9c72f781	0011	obnovitvena vaja	obnovitvena vaja
00420000-56b0-d422-758a-59e83ee962c0	0012	italijanka	krajša "obnovitvena" vaja
00420000-56b0-d422-d674-db52375d6e41	0013	pevska vaja	pevska vaja
00420000-56b0-d422-f49b-3bb30fe55b4e	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56b0-d422-596b-979ad4896cf8	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56b0-d422-9988-80ca824d30bb	0016	orientacijska vaja	orientacijska vaja
00420000-56b0-d422-ca10-f7537134c365	0017	situacijska vaja	situacijska vaja
00420000-56b0-d422-330f-6f387e49d1c7	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 42947072)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 42946885)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56b0-d423-e6ff-1dfb110e0ba3	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROq18O4iKjEM30ypm6040.nUQkl9JOvtC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56b0-d425-4a2b-e0c2c752fbdc	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56b0-d425-9e1d-7e06e3131e3b	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56b0-d425-ab85-a2031591e890	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56b0-d425-7a95-24593e1afb07	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56b0-d425-ea1b-ad38c40cc4b4	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56b0-d425-ffdc-750505cc5155	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56b0-d425-e124-d5d79b46e474	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56b0-d425-8e56-ed8e47e94462	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56b0-d425-fa12-841b3e22f2ca	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56b0-d425-b723-44eb7c020bec	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56b0-d425-8938-6ac2169798ca	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56b0-d425-e777-81c24c82a280	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56b0-d425-f93a-e8b89827568c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56b0-d425-ddf0-4a1cc25f2dfb	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56b0-d425-f54a-01706be3095c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56b0-d425-4713-bf1ce3374d42	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56b0-d425-9987-b1ef2b8ec15f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56b0-d425-affe-f2916f5174d4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56b0-d425-2281-429467bd9004	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56b0-d425-aedf-1791eb02a11f	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56b0-d425-442d-b491ca054c84	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56b0-d425-a73d-c727082e9418	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56b0-d425-03d4-276a75a6d390	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56b0-d425-f942-433019081723	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56b0-d425-dc5f-b5ee8176b8ab	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56b0-d425-769d-86b772440e6c	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56b0-d423-deda-93bd03958ecc	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 42947517)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56b0-d425-d625-8c2cc8c82d6f	00160000-56b0-d425-fa93-cd1b79faada5	\N	00140000-56b0-d422-767d-dc14aa685220	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56b0-d425-29cd-0688d55ff475
000e0000-56b0-d425-a514-f4202a3a1748	00160000-56b0-d425-8b76-fe0c57732126	\N	00140000-56b0-d422-2a7e-3295d72e774c	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56b0-d425-961d-d4ab3974de46
000e0000-56b0-d425-d617-06d337bfd918	\N	\N	00140000-56b0-d422-2a7e-3295d72e774c	00190000-56b0-d425-677e-b92c8c28d0b3	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56b0-d425-29cd-0688d55ff475
000e0000-56b0-d425-375b-c3f5d6969961	\N	\N	00140000-56b0-d422-2a7e-3295d72e774c	00190000-56b0-d425-677e-b92c8c28d0b3	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56b0-d425-29cd-0688d55ff475
000e0000-56b0-d425-a716-a7437ceca582	\N	\N	00140000-56b0-d422-2a7e-3295d72e774c	00190000-56b0-d425-677e-b92c8c28d0b3	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-d425-d6da-7caa9e9bf76b
000e0000-56b0-d425-8097-894f44644e3d	\N	\N	00140000-56b0-d422-2a7e-3295d72e774c	00190000-56b0-d425-677e-b92c8c28d0b3	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-d425-d6da-7caa9e9bf76b
000e0000-56b0-d425-f650-648a52f4ea0e	\N	\N	00140000-56b0-d422-be2f-ba3116ef646b	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-d425-d6da-7caa9e9bf76b
000e0000-56b0-d425-b55a-658e900e49f0	\N	\N	00140000-56b0-d422-be2f-ba3116ef646b	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-d425-d6da-7caa9e9bf76b
000e0000-56b0-d425-859a-4290367085ab	\N	\N	00140000-56b0-d422-be2f-ba3116ef646b	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-d425-d6da-7caa9e9bf76b
000e0000-56b0-d425-6b30-6d8c082f200d	\N	\N	00140000-56b0-d422-be2f-ba3116ef646b	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-d425-d6da-7caa9e9bf76b
000e0000-56b0-d425-ad27-175ca5ab9a0a	\N	\N	00140000-56b0-d422-be2f-ba3116ef646b	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-d425-d6da-7caa9e9bf76b
000e0000-56b0-d425-4394-04d731c4a7b3	\N	\N	00140000-56b0-d422-be2f-ba3116ef646b	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-d425-d6da-7caa9e9bf76b
000e0000-56b0-d426-fa73-ae719f804ac0	\N	\N	00140000-56b0-d422-be2f-ba3116ef646b	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-d425-d6da-7caa9e9bf76b
000e0000-56b0-d426-86ba-7c3351857d9f	\N	\N	00140000-56b0-d422-be2f-ba3116ef646b	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-d425-d6da-7caa9e9bf76b
000e0000-56b0-d426-e767-86f8662e2fe4	\N	\N	00140000-56b0-d422-be2f-ba3116ef646b	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b0-d425-d6da-7caa9e9bf76b
\.


--
-- TOC entry 3170 (class 0 OID 42947236)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 42947165)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56b0-d426-0c79-86db7e3b305d	\N	000e0000-56b0-d425-a514-f4202a3a1748	3
00200000-56b0-d426-2bae-03672ef962ff	\N	000e0000-56b0-d425-a514-f4202a3a1748	9
00200000-56b0-d426-008b-6e4fdaf0b846	\N	000e0000-56b0-d425-a514-f4202a3a1748	5
00200000-56b0-d426-3e3f-7131ca3b3a54	\N	000e0000-56b0-d425-a514-f4202a3a1748	4
00200000-56b0-d426-9812-3980af99eaf6	\N	000e0000-56b0-d425-a514-f4202a3a1748	6
00200000-56b0-d426-9cb3-3ddf3cff67b9	\N	000e0000-56b0-d425-d625-8c2cc8c82d6f	1
00200000-56b0-d426-1c32-8dade8cbbb47	\N	000e0000-56b0-d425-a514-f4202a3a1748	2
00200000-56b0-d426-d6e0-0d0df5c34b03	\N	000e0000-56b0-d425-a514-f4202a3a1748	1
00200000-56b0-d426-c865-8be181df1235	\N	000e0000-56b0-d425-a514-f4202a3a1748	7
00200000-56b0-d426-66e8-18e87e6990b8	\N	000e0000-56b0-d425-a514-f4202a3a1748	8
\.


--
-- TOC entry 3182 (class 0 OID 42947329)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 42947440)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56b0-d422-3140-22dd07f08408	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56b0-d422-2fb1-cf2362266f29	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56b0-d422-3e7c-5517cc491f94	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56b0-d422-82e6-32f88c2fed8a	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56b0-d422-9427-09562622a8a7	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56b0-d422-bc35-b35a6a5e0899	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56b0-d422-f923-2e8b19d6bbc7	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56b0-d422-72d6-2c1ea565803e	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56b0-d422-230b-b41f61dcbc25	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56b0-d422-07f5-a0739510bb3a	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56b0-d422-d83e-1558c9e2cf7f	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56b0-d422-cfb3-d5a3e7e58bbc	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56b0-d422-537f-b32b3be2d0ad	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56b0-d422-3fa3-70a837cf3419	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56b0-d422-7484-80f97b9f0fe8	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56b0-d422-802f-35b37f439c48	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56b0-d422-58a9-ff5299403179	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56b0-d422-1e48-e20d83ea4efc	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56b0-d422-8b68-552ffae7038f	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56b0-d422-29b9-c47be1ca5759	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56b0-d422-d583-b15f1543a0c4	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56b0-d422-941b-17fa76bf289c	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56b0-d422-01d1-a18b3809af3d	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56b0-d422-d4ca-a0529165e8e6	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56b0-d422-e422-b1a23b003cdc	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56b0-d422-d0ec-672af393186e	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56b0-d422-d696-c33c2d7f6538	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56b0-d422-ddc2-218a46365ecc	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 42947821)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 42947790)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 42947833)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 42947402)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56b0-d425-5eeb-14b087655a7f	00090000-56b0-d425-2822-0861f8e36e10	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56b0-d425-0648-921eab70b91c	00090000-56b0-d425-9fc8-1247cb14ae39	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56b0-d425-ef37-c75f25e41d0a	00090000-56b0-d425-73cf-2f76f8cabfe5	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56b0-d425-c351-419e71c3a775	00090000-56b0-d425-5fec-173312cb4611	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56b0-d425-aa79-4ee60452602c	00090000-56b0-d425-e82c-cc5d47f04804	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56b0-d425-927f-7c008017253c	00090000-56b0-d425-98a8-043289a3c534	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 42947507)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56b0-d422-767d-dc14aa685220	01	Drama	drama (SURS 01)
00140000-56b0-d422-1d79-236c8f346a91	02	Opera	opera (SURS 02)
00140000-56b0-d422-73c3-b8fda68dce2b	03	Balet	balet (SURS 03)
00140000-56b0-d422-0b9e-96727ad6184e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56b0-d422-be2f-ba3116ef646b	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56b0-d422-2a7e-3295d72e774c	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56b0-d422-e0c2-3a732dc60556	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 42947392)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 42946949)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 42947565)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 42947556)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 42946939)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 42947423)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 42947465)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 42947874)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 42947259)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 42947194)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 42947210)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 42947215)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 42947788)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 42947098)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 42947634)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 42947388)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 42947163)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 42947136)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 42947112)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 42947295)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 42947851)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 42947858)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 42947882)
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
-- TOC entry 2766 (class 2606 OID 42947321)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 42947070)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 42946968)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 42947032)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 42946995)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 42946928)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 42946913)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 42947327)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 42947364)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 42947502)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 42947023)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 42947058)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 42947739)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 42947301)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 42947048)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 42947179)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 42947151)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 42947145)
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
-- TOC entry 2764 (class 2606 OID 42947313)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 42947748)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 42947756)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 42947726)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 42947769)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 42947346)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 42947286)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 42947277)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 42947489)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 42947416)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 42947124)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 42946884)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 42947355)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 42946902)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 42946922)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 42947373)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 42947308)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 42947234)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 42946872)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 42946860)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 42946854)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 42947436)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 42947004)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 42947251)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 42947269)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 42947476)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 42946957)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 42947781)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 42947223)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 42947083)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 42946897)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 42947535)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 42947242)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 42947169)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 42947335)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 42947448)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 42947831)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 42947815)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 42947839)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 42947406)
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
-- TOC entry 2833 (class 2606 OID 42947515)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 42947400)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 42947204)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 42947205)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 42947203)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 42947201)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 42947202)
-- Name: idx_11e93b5d7634c214; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d7634c214 ON dogodek USING btree (nadrejenogostovanje_id);


--
-- TOC entry 2708 (class 1259 OID 42947200)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 42947437)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 42947438)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 42947439)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 42947853)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 42947852)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 42947025)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 42947026)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 42947328)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 42947819)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 42947818)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 42947820)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 42947817)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 42947816)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 42947314)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 42947170)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 42947171)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 42947389)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 42947391)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 42947390)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 42947114)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 42947113)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 42947770)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 42947504)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 42947505)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 42947506)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 42947840)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 42947540)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 42947537)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 42947541)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 42947539)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 42947538)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 42947085)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 42947084)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 42946998)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 42947356)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 42946929)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 42946930)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 42947376)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 42947375)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 42947374)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 42947035)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 42947034)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 42947036)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 42947146)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2595 (class 1259 OID 42946862)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 42947281)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 42947279)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 42947278)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 42947280)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 42946903)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 42946904)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 42947336)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 42947875)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 42947425)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 42947424)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 42947883)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 42947884)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 42947302)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 42947417)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 42947418)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 42947639)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 42947638)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 42947635)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 42947636)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 42947637)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 42947050)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 42947049)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 42947051)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 42947350)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 42947349)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 42947749)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 42947750)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 42947569)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 42947570)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 42947567)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 42947568)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 42947260)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 42947261)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 42947407)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 42947408)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 42947243)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 42947290)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 42947289)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 42947287)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 42947288)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 42947557)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 42947125)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 42947139)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 42947138)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 42947137)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 42947140)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 42947164)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 42947152)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 42947153)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 42947740)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 42947789)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 42947859)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 42947860)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 42946970)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 42946969)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 42947005)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 42947006)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 42947254)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 42947253)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 42947252)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 42947196)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 42947199)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 42947195)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 42947198)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 42947197)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 42947024)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 42946958)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 42946959)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 42947099)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 42947101)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 42947100)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 42947102)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 42947296)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 42947503)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 42947536)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 42947477)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 42947478)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 42946996)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 42946997)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 42947270)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 42947271)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 42947401)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 42946873)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 42947071)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 42947033)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 42946861)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 42947782)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 42947348)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 42947347)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 42947224)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 42947225)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 42947566)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 42947244)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 42947059)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 42947516)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 42947832)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 42947757)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 42947758)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 42947466)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 42947235)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 42946923)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 42948045)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 42948070)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 42948060)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 42948040)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2940 (class 2606 OID 42948075)
-- Name: fk_11e93b5d7634c214; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d7634c214 FOREIGN KEY (nadrejenogostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2944 (class 2606 OID 42948055)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 42948065)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 42948050)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2985 (class 2606 OID 42948255)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 42948260)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2983 (class 2606 OID 42948265)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3016 (class 2606 OID 42948425)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 42948420)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 42947940)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 42947945)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 42948170)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3011 (class 2606 OID 42948405)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 42948400)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3010 (class 2606 OID 42948410)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 42948395)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3014 (class 2606 OID 42948390)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 42948165)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2939 (class 2606 OID 42948030)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2938 (class 2606 OID 42948035)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 42948210)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 42948220)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 42948215)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 42947995)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 42947990)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 42948155)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 42948380)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2988 (class 2606 OID 42948270)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 42948275)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2986 (class 2606 OID 42948280)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 42948415)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2990 (class 2606 OID 42948300)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2993 (class 2606 OID 42948285)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2989 (class 2606 OID 42948305)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 42948295)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2992 (class 2606 OID 42948290)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 42947985)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 42947980)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 42947925)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 42947920)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 42948190)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 42947900)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 42947905)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2971 (class 2606 OID 42948205)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 42948200)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2973 (class 2606 OID 42948195)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 42947955)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 42947950)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 42947960)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 42948010)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 42947885)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 42948130)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 42948120)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 42948115)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 42948125)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 42947890)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 42947895)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 42948175)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 42948440)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2981 (class 2606 OID 42948250)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 42948245)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 42948445)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 42948450)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 42948160)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 42948235)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2979 (class 2606 OID 42948240)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2999 (class 2606 OID 42948355)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 42948350)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3003 (class 2606 OID 42948335)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 42948340)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 42948345)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 42947970)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 42947965)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 42947975)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2968 (class 2606 OID 42948185)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 42948180)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 42948365)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3005 (class 2606 OID 42948370)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2996 (class 2606 OID 42948325)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2995 (class 2606 OID 42948330)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2998 (class 2606 OID 42948315)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 42948320)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 42948105)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 42948110)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 42948225)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 42948230)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 42948080)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 42948085)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 42948150)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 42948145)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 42948135)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 42948140)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 42948310)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 42948000)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 42948005)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2937 (class 2606 OID 42948025)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2936 (class 2606 OID 42948015)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2935 (class 2606 OID 42948020)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 42948360)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 42948375)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 42948385)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 42948430)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 42948435)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 42947915)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 42947910)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 42947930)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 42947935)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 42948100)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 42948095)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 42948090)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-02-02 17:07:05 CET

--
-- PostgreSQL database dump complete
--

