--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-27 11:56:49 CET

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
-- TOC entry 185 (class 1259 OID 40859676)
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
-- TOC entry 241 (class 1259 OID 40860294)
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
-- TOC entry 240 (class 1259 OID 40860278)
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
-- TOC entry 184 (class 1259 OID 40859669)
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
-- TOC entry 183 (class 1259 OID 40859667)
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
-- TOC entry 231 (class 1259 OID 40860155)
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
-- TOC entry 234 (class 1259 OID 40860185)
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
-- TOC entry 255 (class 1259 OID 40860597)
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
-- TOC entry 212 (class 1259 OID 40859991)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 40859917)
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
    barva character varying(7) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 40859942)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 40859947)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 40860519)
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
-- TOC entry 196 (class 1259 OID 40859822)
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
-- TOC entry 242 (class 1259 OID 40860307)
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
-- TOC entry 227 (class 1259 OID 40860113)
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
-- TOC entry 202 (class 1259 OID 40859891)
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
-- TOC entry 199 (class 1259 OID 40859862)
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
-- TOC entry 197 (class 1259 OID 40859839)
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
-- TOC entry 216 (class 1259 OID 40860027)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 40860577)
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
-- TOC entry 254 (class 1259 OID 40860590)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 40860612)
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
-- TOC entry 220 (class 1259 OID 40860051)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 40859796)
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
-- TOC entry 187 (class 1259 OID 40859696)
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
-- TOC entry 191 (class 1259 OID 40859763)
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
-- TOC entry 188 (class 1259 OID 40859707)
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
-- TOC entry 180 (class 1259 OID 40859641)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 40859660)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 40860058)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 40860093)
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
-- TOC entry 237 (class 1259 OID 40860226)
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
-- TOC entry 190 (class 1259 OID 40859743)
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
-- TOC entry 193 (class 1259 OID 40859788)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 40860463)
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
-- TOC entry 217 (class 1259 OID 40860033)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 40859773)
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
-- TOC entry 204 (class 1259 OID 40859909)
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
-- TOC entry 200 (class 1259 OID 40859877)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporednasezvsehupr integer,
    zaporedna integer,
    zaporednasez integer
);


--
-- TOC entry 201 (class 1259 OID 40859884)
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
-- TOC entry 219 (class 1259 OID 40860045)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 40860477)
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
-- TOC entry 246 (class 1259 OID 40860487)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 40860376)
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
-- TOC entry 247 (class 1259 OID 40860495)
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
-- TOC entry 223 (class 1259 OID 40860073)
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
-- TOC entry 215 (class 1259 OID 40860018)
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
-- TOC entry 214 (class 1259 OID 40860008)
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
-- TOC entry 236 (class 1259 OID 40860215)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 40860145)
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
-- TOC entry 198 (class 1259 OID 40859851)
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
-- TOC entry 177 (class 1259 OID 40859612)
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
-- TOC entry 176 (class 1259 OID 40859610)
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
-- TOC entry 224 (class 1259 OID 40860087)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 40859650)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 40859634)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 40860101)
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
-- TOC entry 218 (class 1259 OID 40860039)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 40859962)
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
-- TOC entry 175 (class 1259 OID 40859599)
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
-- TOC entry 174 (class 1259 OID 40859591)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 40859586)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 40860162)
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
-- TOC entry 189 (class 1259 OID 40859735)
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
-- TOC entry 211 (class 1259 OID 40859981)
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
-- TOC entry 213 (class 1259 OID 40859998)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 40860203)
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
-- TOC entry 186 (class 1259 OID 40859686)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 40860507)
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
-- TOC entry 208 (class 1259 OID 40859952)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 40859808)
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
-- TOC entry 178 (class 1259 OID 40859621)
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
-- TOC entry 239 (class 1259 OID 40860253)
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
-- TOC entry 210 (class 1259 OID 40859972)
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
-- TOC entry 203 (class 1259 OID 40859902)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 40860065)
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
-- TOC entry 233 (class 1259 OID 40860176)
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
-- TOC entry 251 (class 1259 OID 40860557)
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
-- TOC entry 250 (class 1259 OID 40860526)
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
-- TOC entry 252 (class 1259 OID 40860569)
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
-- TOC entry 229 (class 1259 OID 40860138)
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
-- TOC entry 238 (class 1259 OID 40860243)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 40860128)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 40859672)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 40859615)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 40859676)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56a8-a26c-614c-f52ec0d333ab	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56a8-a26c-4bdb-bf993d7b4ee4	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56a8-a26c-490e-f8fc285da264	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 40860294)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56a8-a26d-5a12-b29d46d7a292	000d0000-56a8-a26d-8a93-2a9180924b59	\N	00090000-56a8-a26d-1922-1059a52a7bc7	000b0000-56a8-a26d-4ea0-ca8d7a7b70c5	0001	f	\N	\N	\N	3	t	t	t
000c0000-56a8-a26d-53c9-722001edf1ea	000d0000-56a8-a26d-8a0f-67a83bea3b08	00100000-56a8-a26d-1090-88c86f006ef5	00090000-56a8-a26d-3ac1-8b45c0c1f05a	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56a8-a26d-254f-1fc7ef0a07a9	000d0000-56a8-a26d-6940-1afca177a812	00100000-56a8-a26d-f17f-1df631ef7314	00090000-56a8-a26d-5cee-547006badcad	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56a8-a26d-a2c4-e1bc70cb3fec	000d0000-56a8-a26d-4223-3e70b23cacda	\N	00090000-56a8-a26d-7663-65872595b20e	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56a8-a26d-20dd-16ec7e4f251d	000d0000-56a8-a26d-b8c4-9ae3b5bae380	\N	00090000-56a8-a26d-758d-8514a342bf6d	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56a8-a26d-0eb6-73617ddb311c	000d0000-56a8-a26d-2d7e-2f567223f0a5	\N	00090000-56a8-a26d-5de8-a180a6db58cb	000b0000-56a8-a26d-26b4-934fdbae69b3	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56a8-a26d-2927-e99031084d90	000d0000-56a8-a26d-e2e3-4ac9a45c4f00	00100000-56a8-a26d-c86a-fb05df6c4d2d	00090000-56a8-a26d-30da-cf8f3826df77	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56a8-a26d-9971-6b1402caa61e	000d0000-56a8-a26d-a792-17c3b20d860c	\N	00090000-56a8-a26d-cf2e-6ea07c87c748	000b0000-56a8-a26d-6d21-432a6ce4f4f7	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56a8-a26d-954d-3a66518a9b3c	000d0000-56a8-a26d-e2e3-4ac9a45c4f00	00100000-56a8-a26d-a89a-bb7b32b1876a	00090000-56a8-a26d-b408-604a5b1b5710	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56a8-a26d-00e2-4d8ee9ae1568	000d0000-56a8-a26d-e2e3-4ac9a45c4f00	00100000-56a8-a26d-5cce-c421281c5ddd	00090000-56a8-a26d-3983-184806b4ae54	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56a8-a26d-be3a-5bfe417d7aa0	000d0000-56a8-a26d-e2e3-4ac9a45c4f00	00100000-56a8-a26d-da77-ca5b69963337	00090000-56a8-a26d-7d55-b2f84ab76d7a	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56a8-a26d-d1c2-dd30c45350a4	000d0000-56a8-a26d-656a-af52087fea31	00100000-56a8-a26d-1090-88c86f006ef5	00090000-56a8-a26d-3ac1-8b45c0c1f05a	000b0000-56a8-a26d-cace-d59af49e4087	0012	t	\N	\N	\N	2	t	t	t
000c0000-56a8-a26d-deca-fcf52329d347	000d0000-56a8-a26d-5894-f97f48ebccfb	\N	00090000-56a8-a26d-cf2e-6ea07c87c748	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56a8-a26e-684c-8a3350dc6565	000d0000-56a8-a26d-5894-f97f48ebccfb	\N	00090000-56a8-a26d-d8fb-0f814db92b40	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56a8-a26e-9a36-164408425856	000d0000-56a8-a26d-aa3e-073794bda589	00100000-56a8-a26d-f17f-1df631ef7314	00090000-56a8-a26d-5cee-547006badcad	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56a8-a26e-25da-0a783df799ed	000d0000-56a8-a26d-aa3e-073794bda589	\N	00090000-56a8-a26d-d8fb-0f814db92b40	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56a8-a26e-d920-cee13e9c2f41	000d0000-56a8-a26d-5f62-ba9df38fd658	\N	00090000-56a8-a26d-d8fb-0f814db92b40	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56a8-a26e-9449-74bb7ef34861	000d0000-56a8-a26d-5f62-ba9df38fd658	\N	00090000-56a8-a26d-cf2e-6ea07c87c748	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56a8-a26e-d236-30893869be38	000d0000-56a8-a26d-5339-11d0ea8b5503	00100000-56a8-a26d-c86a-fb05df6c4d2d	00090000-56a8-a26d-30da-cf8f3826df77	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56a8-a26e-4c95-e955ec07b706	000d0000-56a8-a26d-5339-11d0ea8b5503	\N	00090000-56a8-a26d-d8fb-0f814db92b40	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56a8-a26e-971f-248568785a19	000d0000-56a8-a26d-d1b8-25bda2aa2c52	\N	00090000-56a8-a26d-d8fb-0f814db92b40	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56a8-a26e-5b1a-82bea61693b6	000d0000-56a8-a26d-d1b8-25bda2aa2c52	00100000-56a8-a26d-c86a-fb05df6c4d2d	00090000-56a8-a26d-30da-cf8f3826df77	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56a8-a26e-d7d3-d3eebd7e53e2	000d0000-56a8-a26d-449f-8604d6ecd02e	\N	00090000-56a8-a26d-d8fb-0f814db92b40	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56a8-a26e-78df-f860c4886ecc	000d0000-56a8-a26d-5e6d-401008db5dc1	\N	00090000-56a8-a26d-cf2e-6ea07c87c748	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56a8-a26e-4dd8-0094d7a631fd	000d0000-56a8-a26d-958e-df3ef68cee79	\N	00090000-56a8-a26d-cf2e-6ea07c87c748	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56a8-a26e-9dcc-fbce12871afc	000d0000-56a8-a26d-958e-df3ef68cee79	00100000-56a8-a26d-f17f-1df631ef7314	00090000-56a8-a26d-5cee-547006badcad	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56a8-a26e-e1f0-e93a6524140e	000d0000-56a8-a26d-267f-2b86339f732e	\N	00090000-56a8-a26d-8a8d-6f1bf2dd8677	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56a8-a26e-07e5-124f9a80fc2e	000d0000-56a8-a26d-267f-2b86339f732e	\N	00090000-56a8-a26d-c50c-2acb04578662	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56a8-a26e-bb3a-a7101c96e66b	000d0000-56a8-a26d-68d0-993c25bed887	\N	00090000-56a8-a26d-cf2e-6ea07c87c748	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56a8-a26e-14a5-d4e3da5da843	000d0000-56a8-a26d-68d0-993c25bed887	00100000-56a8-a26d-f17f-1df631ef7314	00090000-56a8-a26d-5cee-547006badcad	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56a8-a26e-07a0-2be5d1e5dea9	000d0000-56a8-a26d-68d0-993c25bed887	\N	00090000-56a8-a26d-c50c-2acb04578662	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56a8-a26e-d10f-4cfbcd1ae12f	000d0000-56a8-a26d-68d0-993c25bed887	\N	00090000-56a8-a26d-8a8d-6f1bf2dd8677	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56a8-a26e-e8c5-744733914ad6	000d0000-56a8-a26d-bea4-5069516029cc	\N	00090000-56a8-a26d-cf2e-6ea07c87c748	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56a8-a26e-89ae-d121b77c828a	000d0000-56a8-a26d-4007-201bd0c9df5b	00100000-56a8-a26d-f17f-1df631ef7314	00090000-56a8-a26d-5cee-547006badcad	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56a8-a26e-43e7-b769ccaf372a	000d0000-56a8-a26d-4007-201bd0c9df5b	\N	00090000-56a8-a26d-d8fb-0f814db92b40	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 40860278)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 40859669)
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
-- TOC entry 3191 (class 0 OID 40860155)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56a8-a26d-49cd-a5ec4d89b3c0	00160000-56a8-a26c-c625-277c98c53225	00090000-56a8-a26d-c50c-2acb04578662	aizv	10	t
003d0000-56a8-a26d-41f8-2958fcab10f3	00160000-56a8-a26c-c625-277c98c53225	00090000-56a8-a26d-74d9-d5e2da882191	apri	14	t
003d0000-56a8-a26d-a821-013db7bf5eba	00160000-56a8-a26c-fb5b-69e71c9d54a8	00090000-56a8-a26d-8a8d-6f1bf2dd8677	aizv	11	t
003d0000-56a8-a26d-2630-53696fa3cb61	00160000-56a8-a26c-a91d-40607a4eef91	00090000-56a8-a26d-a3f2-56b0ca2c416d	aizv	12	t
003d0000-56a8-a26d-9d70-3c06bcb8f871	00160000-56a8-a26c-c625-277c98c53225	00090000-56a8-a26d-d8fb-0f814db92b40	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 40860185)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56a8-a26c-c625-277c98c53225	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56a8-a26c-fb5b-69e71c9d54a8	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56a8-a26c-a91d-40607a4eef91	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 40860597)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 40859991)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 40859917)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva) FROM stdin;
00180000-56a8-a26d-5e82-37ab5d086592	\N	\N	\N	\N	00440000-56a8-a26d-4616-26bf5c9cc2fc	00220000-56a8-a26c-5afe-8a10b1a4f74d	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N
00180000-56a8-a26d-9c77-c976c1b4dce8	\N	\N	\N	\N	00440000-56a8-a26d-3037-2d478ba920f8	00220000-56a8-a26c-9b06-376a1e278875	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N
00180000-56a8-a26d-17ac-3a316ec193f9	\N	\N	\N	001e0000-56a8-a26d-92d0-e9ecc3f3806f	\N	00220000-56a8-a26c-5afe-8a10b1a4f74d	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N
00180000-56a8-a26d-a4f0-2c0a711737fa	\N	\N	\N	001e0000-56a8-a26d-c56b-ccfa95306b1f	\N	00220000-56a8-a26c-9b06-376a1e278875	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N
00180000-56a8-a26d-eb02-40532e9a6a40	\N	00200000-56a8-a26d-74ae-62be6c10c3d2	\N	\N	\N	00220000-56a8-a26c-59d4-90bc5643beb4	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	Vaja 1.	\N
00180000-56a8-a26d-e505-b010aed9b2bd	\N	00200000-56a8-a26d-7be6-40d382824d22	\N	\N	\N	00220000-56a8-a26c-59d4-90bc5643beb4	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	Vaja 2.	\N
00180000-56a8-a26d-660f-e88c0eac2f90	\N	00200000-56a8-a26d-2f5a-642eacc3e658	\N	\N	\N	00220000-56a8-a26c-9b06-376a1e278875	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 3.	\N
00180000-56a8-a26d-257a-05ee0fd633d7	\N	00200000-56a8-a26d-60b2-fa5edc0324e0	\N	\N	\N	00220000-56a8-a26c-d6ba-932daa0d3c07	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	Vaja 4.	\N
00180000-56a8-a26d-7169-12a0b776093b	\N	00200000-56a8-a26d-93f1-634701e8e6e2	\N	\N	\N	00220000-56a8-a26c-64d5-4f0da2f333fb	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	Vaja 5.	\N
00180000-56a8-a26d-94d6-dcab265b5e4d	\N	00200000-56a8-a26d-41b6-e9c72793e97d	\N	\N	\N	00220000-56a8-a26c-9b06-376a1e278875	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 6.	\N
00180000-56a8-a26d-0658-5fc7a8d5384f	\N	00200000-56a8-a26d-4760-b0f7e366e2c7	\N	\N	\N	00220000-56a8-a26c-64d5-4f0da2f333fb	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 7.	\N
00180000-56a8-a26d-318f-5620e3c47b3f	\N	00200000-56a8-a26d-53d6-9a3d5e274b8f	\N	\N	\N	00220000-56a8-a26c-64d5-4f0da2f333fb	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 8.	\N
00180000-56a8-a26d-c6cb-7e88f73fe954	\N	00200000-56a8-a26d-c567-66700caff641	\N	\N	\N	00220000-56a8-a26c-59d4-90bc5643beb4	001f0000-56a8-a26c-a4e9-b32d94be0772	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	Vaja 9.	\N
00180000-56a8-a26d-443a-86f653825120	\N	00200000-56a8-a26d-d4f7-98dce2e4def7	\N	\N	\N	00220000-56a8-a26c-59d4-90bc5643beb4	001f0000-56a8-a26c-a4e9-b32d94be0772	2014-06-11 07:00:00	2014-06-12 15:00:00	400s	200s	\N	Vaja 10.	\N
00180000-56a8-a26d-6986-bf13ecae5bf4	001b0000-56a8-a26d-64a5-a39597aecbfb	\N	\N	\N	\N	00220000-56a8-a26c-5afe-8a10b1a4f74d	001f0000-56a8-a26c-a4e9-b32d94be0772	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N
00180000-56a8-a26d-074e-2cf419197891	001b0000-56a8-a26d-54a9-f7ce3534d67b	\N	\N	\N	\N	00220000-56a8-a26c-9b06-376a1e278875	001f0000-56a8-a26c-a4e9-b32d94be0772	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N
00180000-56a8-a26d-0a44-ca96eb62adf9	001b0000-56a8-a26d-0a74-701f467213af	\N	\N	\N	\N	00220000-56a8-a26c-5afe-8a10b1a4f74d	001f0000-56a8-a26c-a4e9-b32d94be0772	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N
00180000-56a8-a26d-cc1e-5989e89be096	001b0000-56a8-a26d-a73b-81cf678ecf75	\N	\N	\N	\N	00220000-56a8-a26c-5afe-8a10b1a4f74d	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N
00180000-56a8-a26d-1425-0813a2c690e3	001b0000-56a8-a26d-56e9-3e14dbcdd697	\N	\N	\N	\N	00220000-56a8-a26c-5afe-8a10b1a4f74d	001f0000-56a8-a26c-ad5b-c0a3321c7022	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N
00180000-56a8-a26d-94e7-8d0a17178cf7	001b0000-56a8-a26d-5c64-5c3b6466e86f	\N	\N	\N	\N	00220000-56a8-a26c-5afe-8a10b1a4f74d	001f0000-56a8-a26c-ad5b-c0a3321c7022	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N
00180000-56a8-a26d-125a-9a4da2408276	001b0000-56a8-a26d-d082-f211f90e9d73	\N	\N	\N	\N	00220000-56a8-a26c-5afe-8a10b1a4f74d	001f0000-56a8-a26c-a4e9-b32d94be0772	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N
00180000-56a8-a26d-fa4a-d8ed060bd34c	001b0000-56a8-a26d-9e26-89498ba3ea27	\N	\N	\N	\N	00220000-56a8-a26c-5afe-8a10b1a4f74d	001f0000-56a8-a26c-ad5b-c0a3321c7022	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N
00180000-56a8-a26d-9f2e-fd0cb4434bab	001b0000-56a8-a26d-d6f9-351aeaf1ecc1	\N	\N	\N	\N	00220000-56a8-a26c-5afe-8a10b1a4f74d	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N
00180000-56a8-a26d-7128-7519213345ec	001b0000-56a8-a26d-089e-082efd86382a	\N	\N	\N	\N	00220000-56a8-a26c-5afe-8a10b1a4f74d	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N
00180000-56a8-a26d-9a25-28e235472ae3	001b0000-56a8-a26d-e835-280a0dd03409	\N	\N	\N	\N	00220000-56a8-a26c-5afe-8a10b1a4f74d	001f0000-56a8-a26c-ad5b-c0a3321c7022	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N
00180000-56a8-a26d-aaf6-14ccc75dee41	001b0000-56a8-a26d-44d0-a04483822af5	\N	\N	\N	\N	00220000-56a8-a26c-5afe-8a10b1a4f74d	001f0000-56a8-a26c-6660-0b96764c482f	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N
00180000-56a8-a26d-5478-c7587676883d	001b0000-56a8-a26d-4925-dad615973dd2	\N	\N	\N	\N	00220000-56a8-a26c-5afe-8a10b1a4f74d	001f0000-56a8-a26c-6660-0b96764c482f	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N
00180000-56a8-a26d-8140-214231844618	001b0000-56a8-a26d-b310-dfd0f51b7840	\N	\N	\N	\N	00220000-56a8-a26c-5afe-8a10b1a4f74d	001f0000-56a8-a26c-ad5b-c0a3321c7022	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N
\.


--
-- TOC entry 3166 (class 0 OID 40859942)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56a8-a26d-92d0-e9ecc3f3806f
001e0000-56a8-a26d-c56b-ccfa95306b1f
\.


--
-- TOC entry 3167 (class 0 OID 40859947)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56a8-a26d-4616-26bf5c9cc2fc
00440000-56a8-a26d-3037-2d478ba920f8
\.


--
-- TOC entry 3209 (class 0 OID 40860519)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 40859822)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56a8-a268-545a-fec6d0e8e9e2	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56a8-a269-e262-a0098428f47f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56a8-a269-3415-8de28fe25142	AL	ALB	008	Albania 	Albanija	\N
00040000-56a8-a269-e5c4-84733077af78	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56a8-a269-7f49-8378d0afd747	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56a8-a269-8b47-9a7ca321f6f8	AD	AND	020	Andorra 	Andora	\N
00040000-56a8-a269-5ab6-da99bef9afe5	AO	AGO	024	Angola 	Angola	\N
00040000-56a8-a269-a59c-c97fc123eabd	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56a8-a269-aea1-197e140c8823	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56a8-a269-e45d-adf92965946a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56a8-a269-93b4-490c526eedfd	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56a8-a269-a97e-92ed66d845ea	AM	ARM	051	Armenia 	Armenija	\N
00040000-56a8-a269-1874-f944f0ec0111	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56a8-a269-93f9-7dc85f5fbd51	AU	AUS	036	Australia 	Avstralija	\N
00040000-56a8-a269-2d08-6e5ec1201d94	AT	AUT	040	Austria 	Avstrija	\N
00040000-56a8-a269-4586-b27e419dddcf	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56a8-a269-b951-edebb874a876	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56a8-a269-3033-2825990cba4b	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56a8-a269-16b1-0c064a61b585	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56a8-a269-e390-753b251a9023	BB	BRB	052	Barbados 	Barbados	\N
00040000-56a8-a269-55cc-030e76274c22	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56a8-a269-ccfa-d57623b0948d	BE	BEL	056	Belgium 	Belgija	\N
00040000-56a8-a269-9e5e-06ae5d208be9	BZ	BLZ	084	Belize 	Belize	\N
00040000-56a8-a269-6ed9-230497d3781b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56a8-a269-e589-d650ad3c7c99	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56a8-a269-7691-d6e5ecb60ac6	BT	BTN	064	Bhutan 	Butan	\N
00040000-56a8-a269-0cab-c26d0311a9f3	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56a8-a269-4d12-01303cd54930	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56a8-a269-5da4-57c80b956ca6	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56a8-a269-c9bb-07798954030d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56a8-a269-1a78-90c0486fd8ed	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56a8-a269-bf35-2193fa0fc418	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56a8-a269-2ad7-c559ffc05a75	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56a8-a269-fefd-606670965036	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56a8-a269-ddd0-9ca19cd67384	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56a8-a269-6972-8dc192abfcb3	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56a8-a269-e469-7144bd45e471	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56a8-a269-f8bb-e6f9f3182338	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56a8-a269-277d-85f93c4bdfd2	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56a8-a269-a48f-3beda14d00a3	CA	CAN	124	Canada 	Kanada	\N
00040000-56a8-a269-d340-7ba34a8a9617	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56a8-a269-c222-978adaa5a87b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56a8-a269-8100-6b72fcd3d51b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56a8-a269-c460-435ba453700f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56a8-a269-9e15-9d2397524af3	CL	CHL	152	Chile 	Čile	\N
00040000-56a8-a269-841c-b4f04323066f	CN	CHN	156	China 	Kitajska	\N
00040000-56a8-a269-2391-a1ee76be09c1	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56a8-a269-99d5-31f2380938ba	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56a8-a269-144f-262a9c4f75a2	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56a8-a269-61df-d679de4bc92c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56a8-a269-3301-5722606ec38e	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56a8-a269-bf63-eec1c2c52d9b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56a8-a269-5b46-8dcd312bc159	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56a8-a269-1ba1-19ccd392be56	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56a8-a269-9269-64629615747a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56a8-a269-9c50-208e219928b1	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56a8-a269-7bad-ea4162f73294	CU	CUB	192	Cuba 	Kuba	\N
00040000-56a8-a269-73c9-c98717a44d6e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56a8-a269-42d3-8c09a2b20417	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56a8-a269-39bc-b918b12ac78a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56a8-a269-7edb-966e99114c69	DK	DNK	208	Denmark 	Danska	\N
00040000-56a8-a269-7c7e-c723c2a47ed8	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56a8-a269-3e5e-3ed819961aca	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56a8-a269-ada2-f7c36f371ed9	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56a8-a269-a663-a9f9ad6c78a4	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56a8-a269-89af-8329acf4c09d	EG	EGY	818	Egypt 	Egipt	\N
00040000-56a8-a269-1e16-4f6bea319485	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56a8-a269-4cd5-85b022a802ca	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56a8-a269-37e8-89e619e2ceb8	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56a8-a269-8b1b-bd80ae909532	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56a8-a269-1932-cc78e3cbb780	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56a8-a269-8258-8c1df225d0e5	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56a8-a269-8aee-b3719aca6d36	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56a8-a269-5177-776bdae3df93	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56a8-a269-d0c4-1f36f97c321c	FI	FIN	246	Finland 	Finska	\N
00040000-56a8-a269-c2c5-575042e58881	FR	FRA	250	France 	Francija	\N
00040000-56a8-a269-e112-ae7e5bd46445	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56a8-a269-351c-40e8297db706	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56a8-a269-f120-bda7c9cb5e45	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56a8-a269-f02e-3fc5319b7b42	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56a8-a269-240a-a22cc8844c6b	GA	GAB	266	Gabon 	Gabon	\N
00040000-56a8-a269-140e-63bd19db05ca	GM	GMB	270	Gambia 	Gambija	\N
00040000-56a8-a269-094c-2cd062d41e23	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56a8-a269-3b11-c67036fd2d37	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56a8-a269-a410-56123cae618f	GH	GHA	288	Ghana 	Gana	\N
00040000-56a8-a269-373c-4fd69f35c6d9	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56a8-a269-7104-5f4dc068cc9b	GR	GRC	300	Greece 	Grčija	\N
00040000-56a8-a269-6e9a-cf9cd9a6f7e0	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56a8-a269-dc95-fb3e75fdaa9a	GD	GRD	308	Grenada 	Grenada	\N
00040000-56a8-a269-f66a-b8c5edca9507	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56a8-a269-f106-1ea960eeba14	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56a8-a269-66fb-0bec870a1200	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56a8-a269-7aae-3c9aa7344109	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56a8-a269-076a-48806bd65d7d	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56a8-a269-f46a-eada5656e352	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56a8-a269-2956-95f133c6d9e2	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56a8-a269-cf6d-f9161d42ef86	HT	HTI	332	Haiti 	Haiti	\N
00040000-56a8-a269-189b-300ddc71980d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56a8-a269-ca5a-8c1461fc99cd	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56a8-a269-fe62-980e7eb7c1da	HN	HND	340	Honduras 	Honduras	\N
00040000-56a8-a269-5117-6e716fe8ce47	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56a8-a269-61a1-e5615d8ab380	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56a8-a269-af3e-2ac0a1dbdb6b	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56a8-a269-b3b9-f93722ef2287	IN	IND	356	India 	Indija	\N
00040000-56a8-a269-a413-c2e4060b3ffa	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56a8-a269-e9d1-25a9711e6ecf	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56a8-a269-5b3d-5de7f61b3be2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56a8-a269-674c-07365a7c3e2f	IE	IRL	372	Ireland 	Irska	\N
00040000-56a8-a269-0556-f3acad40b47f	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56a8-a269-74ab-71dd2b441aeb	IL	ISR	376	Israel 	Izrael	\N
00040000-56a8-a269-af7c-364cb53afdcd	IT	ITA	380	Italy 	Italija	\N
00040000-56a8-a269-4e5c-30338164135a	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56a8-a269-77a7-b8b939941ddb	JP	JPN	392	Japan 	Japonska	\N
00040000-56a8-a269-e781-297699df88eb	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56a8-a269-1bb9-52d5bf6a7b65	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56a8-a269-af08-1bb4c551593b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56a8-a269-75f5-6ad6478b49bf	KE	KEN	404	Kenya 	Kenija	\N
00040000-56a8-a269-ee19-69bdcdd58c1e	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56a8-a269-7d7a-06233c6d7809	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56a8-a269-8b8f-3986b67559c2	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56a8-a269-00c0-ae4ce628383a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56a8-a269-7db5-24b0d2bf2b21	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56a8-a269-16c0-fbda75868e63	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56a8-a269-bfbf-60d88d8cf492	LV	LVA	428	Latvia 	Latvija	\N
00040000-56a8-a269-f5b5-30a14114d58b	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56a8-a269-3e1e-027d81067e29	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56a8-a269-756d-acdb1a1f86b8	LR	LBR	430	Liberia 	Liberija	\N
00040000-56a8-a269-37f1-6f4fe8623f3e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56a8-a269-108c-ffdf1594c1dd	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56a8-a269-bd10-141ec9980a97	LT	LTU	440	Lithuania 	Litva	\N
00040000-56a8-a269-b4b1-1c8ef91932ae	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56a8-a269-f8e3-29b579663d6f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56a8-a269-3740-6859cb7dfb3f	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56a8-a269-f86c-e41603cba210	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56a8-a269-2277-0234e37bc1d3	MW	MWI	454	Malawi 	Malavi	\N
00040000-56a8-a269-a292-ef58e70862cb	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56a8-a269-ce56-13b988230a43	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56a8-a269-81f3-05ffb3a8df55	ML	MLI	466	Mali 	Mali	\N
00040000-56a8-a269-1930-5deaa0a69793	MT	MLT	470	Malta 	Malta	\N
00040000-56a8-a269-ce91-24ef92734fa5	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56a8-a269-0c77-94fcc45c48f4	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56a8-a269-5a13-60590bc29057	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56a8-a269-be97-3e2ffa03a076	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56a8-a269-61f2-d4c6098fda66	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56a8-a269-0c51-c86e3029bf67	MX	MEX	484	Mexico 	Mehika	\N
00040000-56a8-a269-9ecf-17e21337c4a6	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56a8-a269-dcb2-5b363ca74739	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56a8-a269-0ec8-375033cb8cf7	MC	MCO	492	Monaco 	Monako	\N
00040000-56a8-a269-1be1-f04b7f8f9de3	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56a8-a269-4997-4d63adec44bf	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56a8-a269-b888-2daa56d0c4e1	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56a8-a269-20c0-78d5e1774db0	MA	MAR	504	Morocco 	Maroko	\N
00040000-56a8-a269-28be-a4fc773c2ce8	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56a8-a269-9432-4e1f1dfac69a	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56a8-a269-9feb-1d35413d9cc8	NA	NAM	516	Namibia 	Namibija	\N
00040000-56a8-a269-3241-239080fd393c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56a8-a269-1c22-6920d00e1c6f	NP	NPL	524	Nepal 	Nepal	\N
00040000-56a8-a269-5c74-a24ef05d5620	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56a8-a269-870a-20d135699bc2	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56a8-a269-52c0-39bc8b073918	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56a8-a269-5126-97e451d67e4a	NE	NER	562	Niger 	Niger 	\N
00040000-56a8-a269-446f-419d67bb8745	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56a8-a269-075c-cf935dd8d138	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56a8-a269-a05e-2585cd4163ea	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56a8-a269-a97f-feef0d7bfa85	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56a8-a269-7890-6327cd3a0b23	NO	NOR	578	Norway 	Norveška	\N
00040000-56a8-a269-ca3b-afb35143b53f	OM	OMN	512	Oman 	Oman	\N
00040000-56a8-a269-5008-2856038a4157	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56a8-a269-4e96-fe46cff75fb9	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56a8-a269-4378-43cda803c0e8	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56a8-a269-7bd8-6c4a5cb316bb	PA	PAN	591	Panama 	Panama	\N
00040000-56a8-a269-e613-9ce888d743d2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56a8-a269-24f9-ee18bdb118fd	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56a8-a269-cb48-9d94b9703f7e	PE	PER	604	Peru 	Peru	\N
00040000-56a8-a269-2fd2-7a4251cc8b5c	PH	PHL	608	Philippines 	Filipini	\N
00040000-56a8-a269-5086-1de13f501415	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56a8-a269-65c4-3918af5dd08c	PL	POL	616	Poland 	Poljska	\N
00040000-56a8-a269-a0d5-dd7152203428	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56a8-a269-9bcc-c8767965d05a	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56a8-a269-30ec-9fb1f74eb6a8	QA	QAT	634	Qatar 	Katar	\N
00040000-56a8-a269-2adc-bf4d4e302238	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56a8-a269-d7dc-41b316d944eb	RO	ROU	642	Romania 	Romunija	\N
00040000-56a8-a269-28b3-b570c2207801	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56a8-a269-bacd-5ce2e8164202	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56a8-a269-0e26-edc22a9a4ed2	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56a8-a269-c8fb-d6016bbb0dfa	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56a8-a269-f71d-fa1a30b9f26e	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56a8-a269-0c86-5f401c68d596	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56a8-a269-d067-211967a08e24	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56a8-a269-1c54-3ea2b34e4ea0	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56a8-a269-10f5-3288d4edd4e3	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56a8-a269-c29e-f76ed33cccef	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56a8-a269-ef40-ca5818cca3c4	SM	SMR	674	San Marino 	San Marino	\N
00040000-56a8-a269-a79f-b7d0352b8ec1	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56a8-a269-4008-352d6685bc98	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56a8-a269-1cec-e3959a661f76	SN	SEN	686	Senegal 	Senegal	\N
00040000-56a8-a269-bb0e-66e4bdd57660	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56a8-a269-2b6f-816ff33f2a66	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56a8-a269-75eb-b071ec347e84	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56a8-a269-aa9b-ac3d02653e1d	SG	SGP	702	Singapore 	Singapur	\N
00040000-56a8-a269-9653-b39219f66ee3	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56a8-a269-06c3-1a0dc88b25e4	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56a8-a269-b45b-504c64072731	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56a8-a269-4d75-831b147c6f2d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56a8-a269-4111-0f557f9496fa	SO	SOM	706	Somalia 	Somalija	\N
00040000-56a8-a269-54a1-ad29973330d2	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56a8-a269-76a0-182738c84a75	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56a8-a269-4842-f8f3de51a191	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56a8-a269-7edd-1f3a26c55148	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56a8-a269-0106-9a04515ea004	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56a8-a269-6ead-62928c81f601	SD	SDN	729	Sudan 	Sudan	\N
00040000-56a8-a269-2346-eb207cc9c404	SR	SUR	740	Suriname 	Surinam	\N
00040000-56a8-a269-75e7-418d6178eec8	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56a8-a269-34e3-e6fb7c08b3b7	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56a8-a269-c2f1-0501c1383331	SE	SWE	752	Sweden 	Švedska	\N
00040000-56a8-a269-0d61-107fd69f7134	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56a8-a269-25b0-3822e47205c4	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56a8-a269-cf9b-495a2d6ce193	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56a8-a269-2d83-c26eea1c09ee	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56a8-a269-6448-6b40daf893b4	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56a8-a269-9ca7-0e12b7dcb0c6	TH	THA	764	Thailand 	Tajska	\N
00040000-56a8-a269-2bcc-fe0f173b45b9	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56a8-a269-86de-44c4dbff75bd	TG	TGO	768	Togo 	Togo	\N
00040000-56a8-a269-e5a1-9cd065ff9249	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56a8-a269-3d56-74df2721cf6e	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56a8-a269-4119-cdc87ff27d86	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56a8-a269-73cc-4d77b1a94d71	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56a8-a269-c9f6-70126e0a85ad	TR	TUR	792	Turkey 	Turčija	\N
00040000-56a8-a269-0359-7b1a8d695ede	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56a8-a269-506a-aab6de084024	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a8-a269-6acc-7c509741a9cd	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56a8-a269-7e54-6fd360fc3878	UG	UGA	800	Uganda 	Uganda	\N
00040000-56a8-a269-c696-2d1f0317d8e7	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56a8-a269-6bc4-baee16847cfc	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56a8-a269-5fe5-288ffc6c7366	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56a8-a269-d68e-70648006981c	US	USA	840	United States 	Združene države Amerike	\N
00040000-56a8-a269-07f7-db5c363c6116	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56a8-a269-2fa9-2fe0ed28cffe	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56a8-a269-d125-95f2816ea7d4	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56a8-a269-dbbc-3fd1b080a8f7	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56a8-a269-246b-8be095afaa0a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56a8-a269-49b8-65c5f55a4d21	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56a8-a269-a34a-85c4ccb41f00	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a8-a269-c332-b6f6b17ef5fc	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56a8-a269-bce8-b43120c152ca	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56a8-a269-5647-594aaa3ff810	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56a8-a269-9760-c6134a7a16e6	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56a8-a269-0130-d0cb6a8582c6	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56a8-a269-5dab-e6b2837f3672	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 40860307)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56a8-a26d-b794-da58d408e6b3	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56a8-a26d-c81d-9a3a87ab2cf3	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a8-a26d-8978-720898000ad4	000e0000-56a8-a26d-1bc3-c7f14ffc2d5a	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a8-a268-017d-2ab2880fa2fc	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a8-a26d-3248-ecee4e21efc8	000e0000-56a8-a26d-977f-dbaf389014c2	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a8-a268-6088-fc7a5c03c6f5	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a8-a26d-ff96-f892655b41a8	000e0000-56a8-a26d-721b-8392a4e7fd32	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a8-a268-017d-2ab2880fa2fc	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 40860113)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56a8-a26d-f33c-1abf6e3e4eeb	000e0000-56a8-a26d-977f-dbaf389014c2	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56a8-a268-f54d-7e1ce443b2f5
000d0000-56a8-a26d-9df8-a63a5ef40877	000e0000-56a8-a26d-2ecc-2877ea27fbe9	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56a8-a268-0631-e24b2babcae2
000d0000-56a8-a26d-456b-a1f16d098302	000e0000-56a8-a26d-2ecc-2877ea27fbe9	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56a8-a268-1bd7-2ec7d7157b26
000d0000-56a8-a26d-8a93-2a9180924b59	000e0000-56a8-a26d-977f-dbaf389014c2	000c0000-56a8-a26d-5a12-b29d46d7a292	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56a8-a268-0631-e24b2babcae2
000d0000-56a8-a26d-8a0f-67a83bea3b08	000e0000-56a8-a26d-977f-dbaf389014c2	000c0000-56a8-a26d-53c9-722001edf1ea	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56a8-a268-1bd7-2ec7d7157b26
000d0000-56a8-a26d-6940-1afca177a812	000e0000-56a8-a26d-977f-dbaf389014c2	000c0000-56a8-a26d-254f-1fc7ef0a07a9	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56a8-a268-58ef-792e4d5a64a5
000d0000-56a8-a26d-4223-3e70b23cacda	000e0000-56a8-a26d-977f-dbaf389014c2	000c0000-56a8-a26d-a2c4-e1bc70cb3fec	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56a8-a268-f54d-7e1ce443b2f5
000d0000-56a8-a26d-b8c4-9ae3b5bae380	000e0000-56a8-a26d-977f-dbaf389014c2	000c0000-56a8-a26d-20dd-16ec7e4f251d	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56a8-a268-f54d-7e1ce443b2f5
000d0000-56a8-a26d-2d7e-2f567223f0a5	000e0000-56a8-a26d-977f-dbaf389014c2	000c0000-56a8-a26d-0eb6-73617ddb311c	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56a8-a268-0631-e24b2babcae2
000d0000-56a8-a26d-e2e3-4ac9a45c4f00	000e0000-56a8-a26d-977f-dbaf389014c2	000c0000-56a8-a26d-954d-3a66518a9b3c	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56a8-a268-0631-e24b2babcae2
000d0000-56a8-a26d-a792-17c3b20d860c	000e0000-56a8-a26d-977f-dbaf389014c2	000c0000-56a8-a26d-9971-6b1402caa61e	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56a8-a268-478a-705c63bce81b
000d0000-56a8-a26d-656a-af52087fea31	000e0000-56a8-a26d-977f-dbaf389014c2	000c0000-56a8-a26d-d1c2-dd30c45350a4	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56a8-a268-037f-dbc545b69e0d
000d0000-56a8-a26d-5894-f97f48ebccfb	000e0000-56a8-a26d-6eaa-a82750549c6b	000c0000-56a8-a26d-deca-fcf52329d347	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56a8-a268-1bd7-2ec7d7157b26
000d0000-56a8-a26d-aa3e-073794bda589	000e0000-56a8-a26d-7b7b-b0ec75b92bd7	000c0000-56a8-a26e-9a36-164408425856	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56a8-a268-1bd7-2ec7d7157b26
000d0000-56a8-a26d-5f62-ba9df38fd658	000e0000-56a8-a26d-7b7b-b0ec75b92bd7	000c0000-56a8-a26e-d920-cee13e9c2f41	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56a8-a268-1bd7-2ec7d7157b26
000d0000-56a8-a26d-5339-11d0ea8b5503	000e0000-56a8-a26d-e198-84760db7453e	000c0000-56a8-a26e-d236-30893869be38	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56a8-a268-1bd7-2ec7d7157b26
000d0000-56a8-a26d-d1b8-25bda2aa2c52	000e0000-56a8-a26d-926f-9837bff2f68c	000c0000-56a8-a26e-971f-248568785a19	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56a8-a268-1bd7-2ec7d7157b26
000d0000-56a8-a26d-449f-8604d6ecd02e	000e0000-56a8-a26d-4e12-d03a62c9be31	000c0000-56a8-a26e-d7d3-d3eebd7e53e2	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56a8-a268-1bd7-2ec7d7157b26
000d0000-56a8-a26d-5e6d-401008db5dc1	000e0000-56a8-a26d-2332-310618b349ca	000c0000-56a8-a26e-78df-f860c4886ecc	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56a8-a268-1bd7-2ec7d7157b26
000d0000-56a8-a26d-958e-df3ef68cee79	000e0000-56a8-a26d-e19c-f89816e618bf	000c0000-56a8-a26e-4dd8-0094d7a631fd	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56a8-a268-1bd7-2ec7d7157b26
000d0000-56a8-a26d-267f-2b86339f732e	000e0000-56a8-a26d-f944-28bb105c39e6	000c0000-56a8-a26e-e1f0-e93a6524140e	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56a8-a268-1bd7-2ec7d7157b26
000d0000-56a8-a26d-68d0-993c25bed887	000e0000-56a8-a26d-f944-28bb105c39e6	000c0000-56a8-a26e-bb3a-a7101c96e66b	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56a8-a268-1bd7-2ec7d7157b26
000d0000-56a8-a26d-bea4-5069516029cc	000e0000-56a8-a26d-3c7f-beaaea1280df	000c0000-56a8-a26e-e8c5-744733914ad6	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56a8-a268-1bd7-2ec7d7157b26
000d0000-56a8-a26d-4007-201bd0c9df5b	000e0000-56a8-a26d-3c7f-beaaea1280df	000c0000-56a8-a26e-89ae-d121b77c828a	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56a8-a268-1bd7-2ec7d7157b26
\.


--
-- TOC entry 3162 (class 0 OID 40859891)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 40859862)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 40859839)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56a8-a26d-2bb0-3fc65f4e379b	00080000-56a8-a26c-f0cb-12f0785f99f1	00090000-56a8-a26d-3983-184806b4ae54	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 40860027)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 40860577)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56a8-a26c-202c-ad46a5a9528c	00010000-56a8-a26a-9fcf-3e58acbd6016	\N	Prva mapa	Root mapa	2016-01-27 11:56:44	2016-01-27 11:56:44	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 40860590)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 40860612)
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
-- TOC entry 3180 (class 0 OID 40860051)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 40859796)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56a8-a26a-2b2d-ffa97722573e	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56a8-a26a-2aa3-5d7101d29e4b	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56a8-a26a-c95d-161ce4abf823	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56a8-a26a-a3d5-37dc62524eaf	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56a8-a26a-1022-a01f0b384b10	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56a8-a26a-9762-038e990d48b5	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56a8-a26a-f009-4c7037250bba	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56a8-a26a-a36c-2410adf64e00	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56a8-a26a-c348-1fd62b289036	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56a8-a26a-0fd1-05e8ca800755	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56a8-a26a-980f-90743a0cfe19	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a8-a26a-b05b-7a0841b9a5fb	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a8-a26a-4e13-d63bf4412f24	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56a8-a26a-c393-3ecd99ac9361	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56a8-a26a-18e8-9d2da925ed37	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56a8-a26a-6254-62f7d0c7f24f	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56a8-a26a-27ef-ac900e2de4ec	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56a8-a26c-05a7-95a0b573089d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56a8-a26c-7fe4-d9729accae57	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56a8-a26c-743a-9a8d3c0c48f9	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56a8-a26c-1e7f-df84dc0de939	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56a8-a26c-951c-51dae442c8ff	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56a8-a26f-018b-e8b7e6f449fe	application.tenant.maticnopodjetje	string	s:36:"00080000-56a8-a26f-cbf3-2039157394c0";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 40859696)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56a8-a26c-17d4-3cafef7824dc	00000000-56a8-a26c-05a7-95a0b573089d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56a8-a26c-daee-18de3b15f7ad	00000000-56a8-a26c-05a7-95a0b573089d	00010000-56a8-a26a-9fcf-3e58acbd6016	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56a8-a26c-e96a-e21b2d87eb01	00000000-56a8-a26c-7fe4-d9729accae57	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3151 (class 0 OID 40859763)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56a8-a26d-5fce-d681fa2d5a84	\N	00100000-56a8-a26d-1090-88c86f006ef5	00100000-56a8-a26d-f17f-1df631ef7314	01	Gledališče Nimbis
00410000-56a8-a26d-d121-0c0f45794909	00410000-56a8-a26d-5fce-d681fa2d5a84	00100000-56a8-a26d-1090-88c86f006ef5	00100000-56a8-a26d-f17f-1df631ef7314	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 40859707)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56a8-a26d-1922-1059a52a7bc7	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56a8-a26d-7663-65872595b20e	00010000-56a8-a26c-916b-314a6fa18870	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56a8-a26d-5cee-547006badcad	00010000-56a8-a26c-43f5-786d4a800eb3	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56a8-a26d-b408-604a5b1b5710	00010000-56a8-a26c-8df8-dd67ea64fcd1	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56a8-a26d-3cb6-caa87cebd344	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56a8-a26d-5de8-a180a6db58cb	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56a8-a26d-7d55-b2f84ab76d7a	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56a8-a26d-30da-cf8f3826df77	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56a8-a26d-3983-184806b4ae54	00010000-56a8-a26c-2da9-fd4043e030b0	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56a8-a26d-3ac1-8b45c0c1f05a	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56a8-a26d-590a-a4d9884208d6	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a8-a26d-758d-8514a342bf6d	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56a8-a26d-cf2e-6ea07c87c748	00010000-56a8-a26c-987e-33a3c0d32b39	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a8-a26d-c50c-2acb04578662	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a8-a26d-74d9-d5e2da882191	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a8-a26d-8a8d-6f1bf2dd8677	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a8-a26d-a3f2-56b0ca2c416d	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a8-a26d-d8fb-0f814db92b40	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a8-a26d-9202-1aa577723362	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a8-a26d-eff3-72d823123d7e	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a8-a26d-8ba2-382c4aeff81b	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 40859641)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56a8-a269-e832-872b24f18b89	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56a8-a269-e6d5-2570050cbdd1	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56a8-a269-a04d-29829cb0db25	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56a8-a269-6c0e-ebff0a29974c	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56a8-a269-063f-f428fac42e00	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56a8-a269-3e39-6b7fc76befb3	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56a8-a269-5d29-a01d16519dcd	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56a8-a269-ac97-b5cf18af08d5	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56a8-a269-78ef-61a2fbd60499	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56a8-a269-260c-c4bff12f7a10	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56a8-a269-f54a-2b20e6598a65	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56a8-a269-55f1-5aeabd53a384	Abonma-read	Abonma - branje	t
00030000-56a8-a269-dc5b-a7f7cfdcf2c7	Abonma-write	Abonma - spreminjanje	t
00030000-56a8-a269-c7e6-6520df11c7a5	Alternacija-read	Alternacija - branje	t
00030000-56a8-a269-5641-8a80cf7c9c3a	Alternacija-write	Alternacija - spreminjanje	t
00030000-56a8-a269-197d-afe2d6e05488	Arhivalija-read	Arhivalija - branje	t
00030000-56a8-a269-f412-d4d49f12f565	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56a8-a269-1cda-a8f409d02d7b	AuthStorage-read	AuthStorage - branje	t
00030000-56a8-a269-5522-2753ba87878e	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56a8-a269-ffa1-5211df95f225	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56a8-a269-623e-51a8a0693e54	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56a8-a269-dba9-c1f00266ce3c	Besedilo-read	Besedilo - branje	t
00030000-56a8-a269-5e73-10ddd383ded0	Besedilo-write	Besedilo - spreminjanje	t
00030000-56a8-a269-0f4d-2029bfd84551	Dodatek-read	Dodatek - branje	t
00030000-56a8-a269-8506-db438ce9e9db	Dodatek-write	Dodatek - spreminjanje	t
00030000-56a8-a269-cfa4-049943c28fdd	Dogodek-read	Dogodek - branje	t
00030000-56a8-a269-766c-197e3f8ab3d0	Dogodek-write	Dogodek - spreminjanje	t
00030000-56a8-a269-58ea-4197d0b523f6	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56a8-a269-5108-175636c5b657	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56a8-a269-3cc3-b21bbeb0d92e	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56a8-a269-ed47-c1a6c88c0dbc	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56a8-a269-baea-237a8bf9be39	DogodekTrait-read	DogodekTrait - branje	t
00030000-56a8-a269-afc2-ce4b52da2812	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56a8-a269-64f0-75456f91356f	DrugiVir-read	DrugiVir - branje	t
00030000-56a8-a269-d8b4-772a4dbec5af	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56a8-a269-7e67-5b0daf248e99	Drzava-read	Drzava - branje	t
00030000-56a8-a269-4e97-3e63585fb04e	Drzava-write	Drzava - spreminjanje	t
00030000-56a8-a269-8f17-3b78d0546cbf	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56a8-a269-7318-cfd088b94621	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56a8-a269-4177-a2549ce6a3fd	Funkcija-read	Funkcija - branje	t
00030000-56a8-a269-0b5b-e4013fbb7053	Funkcija-write	Funkcija - spreminjanje	t
00030000-56a8-a269-aaeb-2048252f0299	Gostovanje-read	Gostovanje - branje	t
00030000-56a8-a269-2476-6a6a3abf5846	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56a8-a269-c9d4-1636b79bb0aa	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56a8-a269-9b5f-4ede2730d2c3	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56a8-a269-dcbd-7981d4cf9845	Kupec-read	Kupec - branje	t
00030000-56a8-a269-7d13-dddc9b356943	Kupec-write	Kupec - spreminjanje	t
00030000-56a8-a269-2daa-84a52355faa3	NacinPlacina-read	NacinPlacina - branje	t
00030000-56a8-a269-ba18-5442116364db	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56a8-a269-589f-85b07642ab60	Option-read	Option - branje	t
00030000-56a8-a269-7cbc-52d25a278864	Option-write	Option - spreminjanje	t
00030000-56a8-a269-1632-87c2c7b2a65a	OptionValue-read	OptionValue - branje	t
00030000-56a8-a269-7386-efe8e6386638	OptionValue-write	OptionValue - spreminjanje	t
00030000-56a8-a269-0711-dcdb0aa0a4fa	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56a8-a269-f54b-80771b8291f6	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56a8-a269-1917-df3381f1c9e9	Oseba-read	Oseba - branje	t
00030000-56a8-a269-71b6-84675a0c17da	Oseba-write	Oseba - spreminjanje	t
00030000-56a8-a269-6e51-643ca9b0ae2f	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56a8-a269-9ab6-8caa14e862a4	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56a8-a269-c977-624583376686	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56a8-a269-ad2a-81385ed41121	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56a8-a269-5211-003d907c3e0c	Pogodba-read	Pogodba - branje	t
00030000-56a8-a269-eaba-4fa0c53a1e8b	Pogodba-write	Pogodba - spreminjanje	t
00030000-56a8-a269-afe2-4815946abb57	Popa-read	Popa - branje	t
00030000-56a8-a269-25fd-659b74f44fef	Popa-write	Popa - spreminjanje	t
00030000-56a8-a269-da04-0ce791780611	Posta-read	Posta - branje	t
00030000-56a8-a269-1f7e-f148eeadb99c	Posta-write	Posta - spreminjanje	t
00030000-56a8-a269-4096-88c95a5f57e5	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56a8-a269-d2c4-c113b8d04667	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56a8-a269-d9d5-03d4fa8d923f	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56a8-a269-f7d6-8b5b65c553f6	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56a8-a269-7fe1-6d046654fb68	PostniNaslov-read	PostniNaslov - branje	t
00030000-56a8-a269-5ad9-7e83c09fe7f3	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56a8-a269-3b5c-45d60a373dd6	Praznik-read	Praznik - branje	t
00030000-56a8-a269-6b59-9e701bc4219b	Praznik-write	Praznik - spreminjanje	t
00030000-56a8-a269-4119-abe57082c7ce	Predstava-read	Predstava - branje	t
00030000-56a8-a269-af5a-bfa5b4bf868c	Predstava-write	Predstava - spreminjanje	t
00030000-56a8-a269-bbe3-36d7f471ef49	Ura-read	Ura - branje	t
00030000-56a8-a269-7b99-a430d6f5d419	Ura-write	Ura - spreminjanje	t
00030000-56a8-a269-802c-28d6fbeba09b	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56a8-a269-d062-e7dd580a35aa	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56a8-a269-def9-330ff3a0a83a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56a8-a269-2150-d79a7d92fa00	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56a8-a269-db13-8e0bb925cb43	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56a8-a269-6772-22593ab449d3	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56a8-a269-4438-9e14d3fcabb9	ProgramDela-read	ProgramDela - branje	t
00030000-56a8-a269-9d51-a63230419747	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56a8-a269-cd48-ffe60c27993f	ProgramFestival-read	ProgramFestival - branje	t
00030000-56a8-a269-d7bc-2e6cc5b9a68c	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56a8-a269-54aa-6278c0737adc	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56a8-a269-651c-a05c1b2faca1	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56a8-a269-b3f4-4f67da7ab16d	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56a8-a269-8092-5f88b764b594	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56a8-a269-9fdd-7110ae5ac908	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56a8-a269-7e67-132ab1763fe8	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56a8-a269-7c5f-4fa74f97c53f	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56a8-a269-f4a7-093f51ed6eb7	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56a8-a269-fc15-9a7f7e2e48e8	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56a8-a269-8862-1069c1f4ce6e	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56a8-a269-69aa-08335b02cfed	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56a8-a269-9eca-17751e8944a0	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56a8-a269-333c-765b4dd6525a	ProgramRazno-read	ProgramRazno - branje	t
00030000-56a8-a269-fb19-4974d34df3fa	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56a8-a269-629f-e52d598540f2	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56a8-a269-01b4-1847e1a955d6	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56a8-a269-c41a-b68514a2824e	Prostor-read	Prostor - branje	t
00030000-56a8-a269-03f2-80449ac5a2bd	Prostor-write	Prostor - spreminjanje	t
00030000-56a8-a269-7a94-9bdd16844c7a	Racun-read	Racun - branje	t
00030000-56a8-a269-e751-4c763ece4a6d	Racun-write	Racun - spreminjanje	t
00030000-56a8-a269-84d8-4fbab41fa4e7	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56a8-a269-e035-7084c3b3850a	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56a8-a269-80f6-706a5cc40d29	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56a8-a269-55f3-1a971d513aba	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56a8-a269-f5c0-17fdfb9a1f07	Rekvizit-read	Rekvizit - branje	t
00030000-56a8-a269-d2bd-ff42374e258c	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56a8-a269-ec40-d0de951ce11d	Revizija-read	Revizija - branje	t
00030000-56a8-a269-92c2-65b8e694542a	Revizija-write	Revizija - spreminjanje	t
00030000-56a8-a269-a700-4a4f0929d24c	Rezervacija-read	Rezervacija - branje	t
00030000-56a8-a269-e1be-8881e9175857	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56a8-a269-e9c6-54a4990fd020	SedezniRed-read	SedezniRed - branje	t
00030000-56a8-a269-4345-ef0f4644a71e	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56a8-a269-88d7-942719a78100	Sedez-read	Sedez - branje	t
00030000-56a8-a269-4c46-80bacb89b303	Sedez-write	Sedez - spreminjanje	t
00030000-56a8-a269-8cd7-7d5968a53bf8	Sezona-read	Sezona - branje	t
00030000-56a8-a269-fb9d-54ba6ef7a30d	Sezona-write	Sezona - spreminjanje	t
00030000-56a8-a269-6ce2-8a27dcdf7e6d	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56a8-a269-9930-6028c0c35087	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56a8-a269-7a9a-a300e7574101	Telefonska-read	Telefonska - branje	t
00030000-56a8-a269-7918-9a6b3266952c	Telefonska-write	Telefonska - spreminjanje	t
00030000-56a8-a269-8f5a-cc502325b0d4	TerminStoritve-read	TerminStoritve - branje	t
00030000-56a8-a269-2eca-24510c7666bd	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56a8-a269-ab8c-8028f26be524	TipDodatka-read	TipDodatka - branje	t
00030000-56a8-a269-d97c-73cdfc45e02f	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56a8-a269-fe5f-fe44cd80cd3c	TipFunkcije-read	TipFunkcije - branje	t
00030000-56a8-a269-408d-1f4f82f52a0c	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56a8-a269-6ca3-ae54926b8713	TipPopa-read	TipPopa - branje	t
00030000-56a8-a269-a563-750ad6efde4f	TipPopa-write	TipPopa - spreminjanje	t
00030000-56a8-a269-7743-ce968135b546	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56a8-a269-2da0-5f07ab776388	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56a8-a269-cdff-1dddfb7205da	TipVaje-read	TipVaje - branje	t
00030000-56a8-a269-5f41-150f2fee1429	TipVaje-write	TipVaje - spreminjanje	t
00030000-56a8-a269-bbae-4e2330231465	Trr-read	Trr - branje	t
00030000-56a8-a269-45e1-8179b7f06b8d	Trr-write	Trr - spreminjanje	t
00030000-56a8-a269-2cce-bc45f3a834d9	Uprizoritev-read	Uprizoritev - branje	t
00030000-56a8-a269-ffe5-64a6830a4496	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56a8-a269-5342-ec3f0d7e016e	Vaja-read	Vaja - branje	t
00030000-56a8-a269-73ed-6ad1a253fd79	Vaja-write	Vaja - spreminjanje	t
00030000-56a8-a269-e27e-e53d97540596	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56a8-a269-cb9c-d3623fcc81f8	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56a8-a269-138a-1723598460ce	VrstaStroska-read	VrstaStroska - branje	t
00030000-56a8-a269-8a46-b506fce108bf	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56a8-a269-da64-0f25a335eadd	Zaposlitev-read	Zaposlitev - branje	t
00030000-56a8-a269-b494-fcdcef1cf695	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56a8-a269-62ce-228ba4f77272	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56a8-a269-fd16-bef04a614934	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56a8-a269-4a32-2d0af66f0f7a	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56a8-a269-fe50-732d84d038ad	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56a8-a269-df5f-d58756e26b20	Job-read	Branje opravil - samo zase - branje	t
00030000-56a8-a269-7b99-25408cbc4e0d	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56a8-a269-18e7-b758a379794f	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56a8-a269-ef2e-3b34c13be604	Report-read	Report - branje	t
00030000-56a8-a269-cc2d-ff6fbdb83b45	Report-write	Report - spreminjanje	t
00030000-56a8-a269-6ca4-e0107eb621eb	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56a8-a269-1fab-2e4479bab605	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56a8-a269-81f4-d475c9c5b015	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56a8-a269-980e-d6bc435d35b7	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56a8-a269-ee82-676abbb72732	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56a8-a269-f343-8295f4a338d4	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56a8-a269-11e5-7289b28fc039	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56a8-a269-0694-7c6f156221b0	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a8-a269-7e5a-8bd71a660c81	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a8-a269-9f4f-96c6321226a1	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a8-a269-0de0-4a2dcde28fe1	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a8-a269-0a47-59aa8319f240	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56a8-a269-6abf-847c663217d4	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56a8-a269-67be-262e984d52fd	Datoteka-write	Datoteka - spreminjanje	t
00030000-56a8-a269-a3e4-d6427e6e8201	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 40859660)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56a8-a269-8911-d493133bd825	00030000-56a8-a269-e6d5-2570050cbdd1
00020000-56a8-a269-8911-d493133bd825	00030000-56a8-a269-e832-872b24f18b89
00020000-56a8-a269-0047-bc22b2936d50	00030000-56a8-a269-7e67-5b0daf248e99
00020000-56a8-a269-14cd-37dfbc448692	00030000-56a8-a269-623e-51a8a0693e54
00020000-56a8-a269-14cd-37dfbc448692	00030000-56a8-a269-5e73-10ddd383ded0
00020000-56a8-a269-14cd-37dfbc448692	00030000-56a8-a269-67be-262e984d52fd
00020000-56a8-a269-14cd-37dfbc448692	00030000-56a8-a269-71b6-84675a0c17da
00020000-56a8-a269-14cd-37dfbc448692	00030000-56a8-a269-0694-7c6f156221b0
00020000-56a8-a269-14cd-37dfbc448692	00030000-56a8-a269-9f4f-96c6321226a1
00020000-56a8-a269-14cd-37dfbc448692	00030000-56a8-a269-ffa1-5211df95f225
00020000-56a8-a269-14cd-37dfbc448692	00030000-56a8-a269-dba9-c1f00266ce3c
00020000-56a8-a269-14cd-37dfbc448692	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a269-14cd-37dfbc448692	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a269-14cd-37dfbc448692	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a269-14cd-37dfbc448692	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a269-e7bc-9ebfb4e4447c	00030000-56a8-a269-ffa1-5211df95f225
00020000-56a8-a269-e7bc-9ebfb4e4447c	00030000-56a8-a269-dba9-c1f00266ce3c
00020000-56a8-a269-e7bc-9ebfb4e4447c	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a269-e7bc-9ebfb4e4447c	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a269-e7bc-9ebfb4e4447c	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a269-e7bc-9ebfb4e4447c	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a269-190d-15061df12c48	00030000-56a8-a269-da64-0f25a335eadd
00020000-56a8-a269-190d-15061df12c48	00030000-56a8-a269-b494-fcdcef1cf695
00020000-56a8-a269-190d-15061df12c48	00030000-56a8-a269-3e39-6b7fc76befb3
00020000-56a8-a269-190d-15061df12c48	00030000-56a8-a269-063f-f428fac42e00
00020000-56a8-a269-190d-15061df12c48	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a269-190d-15061df12c48	00030000-56a8-a269-71b6-84675a0c17da
00020000-56a8-a269-190d-15061df12c48	00030000-56a8-a269-0711-dcdb0aa0a4fa
00020000-56a8-a269-3a35-5db75e78c854	00030000-56a8-a269-da64-0f25a335eadd
00020000-56a8-a269-3a35-5db75e78c854	00030000-56a8-a269-3e39-6b7fc76befb3
00020000-56a8-a269-3a35-5db75e78c854	00030000-56a8-a269-0711-dcdb0aa0a4fa
00020000-56a8-a269-f6ea-5f49d396882b	00030000-56a8-a269-71b6-84675a0c17da
00020000-56a8-a269-f6ea-5f49d396882b	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a269-f6ea-5f49d396882b	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a269-f6ea-5f49d396882b	00030000-56a8-a269-67be-262e984d52fd
00020000-56a8-a269-f6ea-5f49d396882b	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a269-f6ea-5f49d396882b	00030000-56a8-a269-9f4f-96c6321226a1
00020000-56a8-a269-f6ea-5f49d396882b	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a269-f6ea-5f49d396882b	00030000-56a8-a269-0694-7c6f156221b0
00020000-56a8-a269-444d-e42d95dba4ee	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a269-444d-e42d95dba4ee	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a269-444d-e42d95dba4ee	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a269-444d-e42d95dba4ee	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a269-9ae5-ca877e7fd0ed	00030000-56a8-a269-71b6-84675a0c17da
00020000-56a8-a269-9ae5-ca877e7fd0ed	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a269-9ae5-ca877e7fd0ed	00030000-56a8-a269-3e39-6b7fc76befb3
00020000-56a8-a269-9ae5-ca877e7fd0ed	00030000-56a8-a269-063f-f428fac42e00
00020000-56a8-a269-9ae5-ca877e7fd0ed	00030000-56a8-a269-bbae-4e2330231465
00020000-56a8-a269-9ae5-ca877e7fd0ed	00030000-56a8-a269-45e1-8179b7f06b8d
00020000-56a8-a269-9ae5-ca877e7fd0ed	00030000-56a8-a269-7fe1-6d046654fb68
00020000-56a8-a269-9ae5-ca877e7fd0ed	00030000-56a8-a269-5ad9-7e83c09fe7f3
00020000-56a8-a269-9ae5-ca877e7fd0ed	00030000-56a8-a269-7a9a-a300e7574101
00020000-56a8-a269-9ae5-ca877e7fd0ed	00030000-56a8-a269-7918-9a6b3266952c
00020000-56a8-a269-9ae5-ca877e7fd0ed	00030000-56a8-a269-7e67-5b0daf248e99
00020000-56a8-a269-9ae5-ca877e7fd0ed	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a269-c33f-efb297367074	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a269-c33f-efb297367074	00030000-56a8-a269-3e39-6b7fc76befb3
00020000-56a8-a269-c33f-efb297367074	00030000-56a8-a269-bbae-4e2330231465
00020000-56a8-a269-c33f-efb297367074	00030000-56a8-a269-7fe1-6d046654fb68
00020000-56a8-a269-c33f-efb297367074	00030000-56a8-a269-7a9a-a300e7574101
00020000-56a8-a269-c33f-efb297367074	00030000-56a8-a269-7e67-5b0daf248e99
00020000-56a8-a269-c33f-efb297367074	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-7a9a-a300e7574101
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-7fe1-6d046654fb68
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-bbae-4e2330231465
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-afe2-4815946abb57
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-c9d4-1636b79bb0aa
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-db13-8e0bb925cb43
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-7918-9a6b3266952c
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-5ad9-7e83c09fe7f3
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-0694-7c6f156221b0
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-45e1-8179b7f06b8d
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-25fd-659b74f44fef
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-67be-262e984d52fd
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-9f4f-96c6321226a1
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-9b5f-4ede2730d2c3
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-6772-22593ab449d3
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-7e67-5b0daf248e99
00020000-56a8-a269-0a3d-0d6533579607	00030000-56a8-a269-6ca3-ae54926b8713
00020000-56a8-a269-b3a1-6ad45f442daa	00030000-56a8-a269-7a9a-a300e7574101
00020000-56a8-a269-b3a1-6ad45f442daa	00030000-56a8-a269-7fe1-6d046654fb68
00020000-56a8-a269-b3a1-6ad45f442daa	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a269-b3a1-6ad45f442daa	00030000-56a8-a269-bbae-4e2330231465
00020000-56a8-a269-b3a1-6ad45f442daa	00030000-56a8-a269-afe2-4815946abb57
00020000-56a8-a269-b3a1-6ad45f442daa	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a269-b3a1-6ad45f442daa	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a269-b3a1-6ad45f442daa	00030000-56a8-a269-c9d4-1636b79bb0aa
00020000-56a8-a269-b3a1-6ad45f442daa	00030000-56a8-a269-db13-8e0bb925cb43
00020000-56a8-a269-b3a1-6ad45f442daa	00030000-56a8-a269-7e67-5b0daf248e99
00020000-56a8-a269-b3a1-6ad45f442daa	00030000-56a8-a269-6ca3-ae54926b8713
00020000-56a8-a269-9f35-a06e8391c672	00030000-56a8-a269-6ca3-ae54926b8713
00020000-56a8-a269-9f35-a06e8391c672	00030000-56a8-a269-a563-750ad6efde4f
00020000-56a8-a269-bc70-b9e500d1f3f4	00030000-56a8-a269-6ca3-ae54926b8713
00020000-56a8-a269-8daf-0902ecd5bf41	00030000-56a8-a269-da04-0ce791780611
00020000-56a8-a269-8daf-0902ecd5bf41	00030000-56a8-a269-1f7e-f148eeadb99c
00020000-56a8-a269-9e38-e45ea3f46d4b	00030000-56a8-a269-da04-0ce791780611
00020000-56a8-a269-7360-a30945d5529d	00030000-56a8-a269-7e67-5b0daf248e99
00020000-56a8-a269-7360-a30945d5529d	00030000-56a8-a269-4e97-3e63585fb04e
00020000-56a8-a269-58b5-b601c92d20d8	00030000-56a8-a269-7e67-5b0daf248e99
00020000-56a8-a269-bcbc-7c81ff331cdd	00030000-56a8-a269-4a32-2d0af66f0f7a
00020000-56a8-a269-bcbc-7c81ff331cdd	00030000-56a8-a269-fe50-732d84d038ad
00020000-56a8-a269-cb08-add6dd2e4911	00030000-56a8-a269-4a32-2d0af66f0f7a
00020000-56a8-a269-ba99-fc2fc7dc0d62	00030000-56a8-a269-62ce-228ba4f77272
00020000-56a8-a269-ba99-fc2fc7dc0d62	00030000-56a8-a269-fd16-bef04a614934
00020000-56a8-a269-5117-c04776749b76	00030000-56a8-a269-62ce-228ba4f77272
00020000-56a8-a269-e879-1b10757a7ffb	00030000-56a8-a269-55f1-5aeabd53a384
00020000-56a8-a269-e879-1b10757a7ffb	00030000-56a8-a269-dc5b-a7f7cfdcf2c7
00020000-56a8-a269-3759-cef9ec7b812b	00030000-56a8-a269-55f1-5aeabd53a384
00020000-56a8-a269-c2f3-240fc1691d58	00030000-56a8-a269-c41a-b68514a2824e
00020000-56a8-a269-c2f3-240fc1691d58	00030000-56a8-a269-03f2-80449ac5a2bd
00020000-56a8-a269-c2f3-240fc1691d58	00030000-56a8-a269-afe2-4815946abb57
00020000-56a8-a269-c2f3-240fc1691d58	00030000-56a8-a269-7fe1-6d046654fb68
00020000-56a8-a269-c2f3-240fc1691d58	00030000-56a8-a269-5ad9-7e83c09fe7f3
00020000-56a8-a269-c2f3-240fc1691d58	00030000-56a8-a269-7e67-5b0daf248e99
00020000-56a8-a269-ffc4-610f7d98664b	00030000-56a8-a269-c41a-b68514a2824e
00020000-56a8-a269-ffc4-610f7d98664b	00030000-56a8-a269-afe2-4815946abb57
00020000-56a8-a269-ffc4-610f7d98664b	00030000-56a8-a269-7fe1-6d046654fb68
00020000-56a8-a269-41f7-7fae33dfcb32	00030000-56a8-a269-138a-1723598460ce
00020000-56a8-a269-41f7-7fae33dfcb32	00030000-56a8-a269-8a46-b506fce108bf
00020000-56a8-a269-d248-741ed63bd367	00030000-56a8-a269-138a-1723598460ce
00020000-56a8-a26a-b305-8769698fb199	00030000-56a8-a269-f54b-80771b8291f6
00020000-56a8-a26a-b305-8769698fb199	00030000-56a8-a269-0711-dcdb0aa0a4fa
00020000-56a8-a26a-b305-8769698fb199	00030000-56a8-a269-da64-0f25a335eadd
00020000-56a8-a26a-b305-8769698fb199	00030000-56a8-a269-67be-262e984d52fd
00020000-56a8-a26a-b305-8769698fb199	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a26a-b305-8769698fb199	00030000-56a8-a269-0694-7c6f156221b0
00020000-56a8-a26a-b305-8769698fb199	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a26a-b305-8769698fb199	00030000-56a8-a269-9f4f-96c6321226a1
00020000-56a8-a26a-b305-8769698fb199	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a26a-e267-160135644f3b	00030000-56a8-a269-0711-dcdb0aa0a4fa
00020000-56a8-a26a-e267-160135644f3b	00030000-56a8-a269-da64-0f25a335eadd
00020000-56a8-a26a-e267-160135644f3b	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a26a-e267-160135644f3b	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a26a-e267-160135644f3b	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a26a-d7ea-5557b10411e8	00030000-56a8-a269-cdff-1dddfb7205da
00020000-56a8-a26a-d7ea-5557b10411e8	00030000-56a8-a269-5f41-150f2fee1429
00020000-56a8-a26a-e882-98a2bbaa6313	00030000-56a8-a269-cdff-1dddfb7205da
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-5d29-a01d16519dcd
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-ac97-b5cf18af08d5
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-4438-9e14d3fcabb9
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-9d51-a63230419747
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-cd48-ffe60c27993f
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-d7bc-2e6cc5b9a68c
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-54aa-6278c0737adc
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-651c-a05c1b2faca1
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-b3f4-4f67da7ab16d
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-8092-5f88b764b594
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-9fdd-7110ae5ac908
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-7e67-132ab1763fe8
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-7c5f-4fa74f97c53f
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-f4a7-093f51ed6eb7
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-fc15-9a7f7e2e48e8
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-8862-1069c1f4ce6e
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-69aa-08335b02cfed
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-9eca-17751e8944a0
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-333c-765b4dd6525a
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-fb19-4974d34df3fa
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-629f-e52d598540f2
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-01b4-1847e1a955d6
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-2150-d79a7d92fa00
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-d8b4-772a4dbec5af
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-d2c4-c113b8d04667
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-7b99-25408cbc4e0d
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-64f0-75456f91356f
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-def9-330ff3a0a83a
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-db13-8e0bb925cb43
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-4096-88c95a5f57e5
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-138a-1723598460ce
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-2cce-bc45f3a834d9
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-6ce2-8a27dcdf7e6d
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-4177-a2549ce6a3fd
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-c7e6-6520df11c7a5
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-fe5f-fe44cd80cd3c
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-5211-003d907c3e0c
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-7e67-5b0daf248e99
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-afe2-4815946abb57
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-67be-262e984d52fd
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-0694-7c6f156221b0
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-9f4f-96c6321226a1
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-df5f-d58756e26b20
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a26a-f8d6-4772f29c5c7f	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a26a-83bd-21c9b84c8150	00030000-56a8-a269-4438-9e14d3fcabb9
00020000-56a8-a26a-83bd-21c9b84c8150	00030000-56a8-a269-cd48-ffe60c27993f
00020000-56a8-a26a-83bd-21c9b84c8150	00030000-56a8-a269-54aa-6278c0737adc
00020000-56a8-a26a-83bd-21c9b84c8150	00030000-56a8-a269-b3f4-4f67da7ab16d
00020000-56a8-a26a-83bd-21c9b84c8150	00030000-56a8-a269-9fdd-7110ae5ac908
00020000-56a8-a26a-83bd-21c9b84c8150	00030000-56a8-a269-7c5f-4fa74f97c53f
00020000-56a8-a26a-83bd-21c9b84c8150	00030000-56a8-a269-fc15-9a7f7e2e48e8
00020000-56a8-a26a-83bd-21c9b84c8150	00030000-56a8-a269-69aa-08335b02cfed
00020000-56a8-a26a-83bd-21c9b84c8150	00030000-56a8-a269-333c-765b4dd6525a
00020000-56a8-a26a-83bd-21c9b84c8150	00030000-56a8-a269-629f-e52d598540f2
00020000-56a8-a26a-83bd-21c9b84c8150	00030000-56a8-a269-def9-330ff3a0a83a
00020000-56a8-a26a-83bd-21c9b84c8150	00030000-56a8-a269-64f0-75456f91356f
00020000-56a8-a26a-83bd-21c9b84c8150	00030000-56a8-a269-4096-88c95a5f57e5
00020000-56a8-a26a-83bd-21c9b84c8150	00030000-56a8-a269-7e67-5b0daf248e99
00020000-56a8-a26a-83bd-21c9b84c8150	00030000-56a8-a269-df5f-d58756e26b20
00020000-56a8-a26a-83bd-21c9b84c8150	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a26a-83bd-21c9b84c8150	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a26a-83bd-21c9b84c8150	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a26a-10ec-c38afe7c8c2f	00030000-56a8-a269-2cce-bc45f3a834d9
00020000-56a8-a26a-10ec-c38afe7c8c2f	00030000-56a8-a269-ffe5-64a6830a4496
00020000-56a8-a26a-10ec-c38afe7c8c2f	00030000-56a8-a269-c7e6-6520df11c7a5
00020000-56a8-a26a-10ec-c38afe7c8c2f	00030000-56a8-a269-5641-8a80cf7c9c3a
00020000-56a8-a26a-10ec-c38afe7c8c2f	00030000-56a8-a269-78ef-61a2fbd60499
00020000-56a8-a26a-10ec-c38afe7c8c2f	00030000-56a8-a269-dba9-c1f00266ce3c
00020000-56a8-a26a-10ec-c38afe7c8c2f	00030000-56a8-a269-4177-a2549ce6a3fd
00020000-56a8-a26a-10ec-c38afe7c8c2f	00030000-56a8-a269-0b5b-e4013fbb7053
00020000-56a8-a26a-10ec-c38afe7c8c2f	00030000-56a8-a269-260c-c4bff12f7a10
00020000-56a8-a26a-10ec-c38afe7c8c2f	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a26a-10ec-c38afe7c8c2f	00030000-56a8-a269-db13-8e0bb925cb43
00020000-56a8-a26a-10ec-c38afe7c8c2f	00030000-56a8-a269-fe5f-fe44cd80cd3c
00020000-56a8-a26a-10ec-c38afe7c8c2f	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a26a-10ec-c38afe7c8c2f	00030000-56a8-a269-67be-262e984d52fd
00020000-56a8-a26a-10ec-c38afe7c8c2f	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a26a-10ec-c38afe7c8c2f	00030000-56a8-a269-0694-7c6f156221b0
00020000-56a8-a26a-10ec-c38afe7c8c2f	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a26a-10ec-c38afe7c8c2f	00030000-56a8-a269-9f4f-96c6321226a1
00020000-56a8-a26a-97d3-c75dd4bde8de	00030000-56a8-a269-2cce-bc45f3a834d9
00020000-56a8-a26a-97d3-c75dd4bde8de	00030000-56a8-a269-c7e6-6520df11c7a5
00020000-56a8-a26a-97d3-c75dd4bde8de	00030000-56a8-a269-dba9-c1f00266ce3c
00020000-56a8-a26a-97d3-c75dd4bde8de	00030000-56a8-a269-4177-a2549ce6a3fd
00020000-56a8-a26a-97d3-c75dd4bde8de	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a26a-97d3-c75dd4bde8de	00030000-56a8-a269-db13-8e0bb925cb43
00020000-56a8-a26a-97d3-c75dd4bde8de	00030000-56a8-a269-fe5f-fe44cd80cd3c
00020000-56a8-a26a-97d3-c75dd4bde8de	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a26a-97d3-c75dd4bde8de	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a26a-97d3-c75dd4bde8de	00030000-56a8-a269-0694-7c6f156221b0
00020000-56a8-a26a-97d3-c75dd4bde8de	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a26a-6c44-a5991a431fdb	00030000-56a8-a269-c7e6-6520df11c7a5
00020000-56a8-a26a-6c44-a5991a431fdb	00030000-56a8-a269-5641-8a80cf7c9c3a
00020000-56a8-a26a-6c44-a5991a431fdb	00030000-56a8-a269-4177-a2549ce6a3fd
00020000-56a8-a26a-6c44-a5991a431fdb	00030000-56a8-a269-0b5b-e4013fbb7053
00020000-56a8-a26a-6c44-a5991a431fdb	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a26a-6c44-a5991a431fdb	00030000-56a8-a269-fe5f-fe44cd80cd3c
00020000-56a8-a26a-6c44-a5991a431fdb	00030000-56a8-a269-2cce-bc45f3a834d9
00020000-56a8-a26a-6c44-a5991a431fdb	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a26a-1a94-12bb0376e8e2	00030000-56a8-a269-c7e6-6520df11c7a5
00020000-56a8-a26a-1a94-12bb0376e8e2	00030000-56a8-a269-5641-8a80cf7c9c3a
00020000-56a8-a26a-1a94-12bb0376e8e2	00030000-56a8-a269-78ef-61a2fbd60499
00020000-56a8-a26a-1a94-12bb0376e8e2	00030000-56a8-a269-4177-a2549ce6a3fd
00020000-56a8-a26a-1a94-12bb0376e8e2	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a26a-1a94-12bb0376e8e2	00030000-56a8-a269-3e39-6b7fc76befb3
00020000-56a8-a26a-1a94-12bb0376e8e2	00030000-56a8-a269-063f-f428fac42e00
00020000-56a8-a26a-1a94-12bb0376e8e2	00030000-56a8-a269-5211-003d907c3e0c
00020000-56a8-a26a-1a94-12bb0376e8e2	00030000-56a8-a269-eaba-4fa0c53a1e8b
00020000-56a8-a26a-1a94-12bb0376e8e2	00030000-56a8-a269-afe2-4815946abb57
00020000-56a8-a26a-1a94-12bb0376e8e2	00030000-56a8-a269-db13-8e0bb925cb43
00020000-56a8-a26a-1a94-12bb0376e8e2	00030000-56a8-a269-6ce2-8a27dcdf7e6d
00020000-56a8-a26a-1a94-12bb0376e8e2	00030000-56a8-a269-9930-6028c0c35087
00020000-56a8-a26a-1a94-12bb0376e8e2	00030000-56a8-a269-fe5f-fe44cd80cd3c
00020000-56a8-a26a-1a94-12bb0376e8e2	00030000-56a8-a269-bbae-4e2330231465
00020000-56a8-a26a-1a94-12bb0376e8e2	00030000-56a8-a269-2cce-bc45f3a834d9
00020000-56a8-a26a-1a94-12bb0376e8e2	00030000-56a8-a269-da64-0f25a335eadd
00020000-56a8-a26a-3835-c91432c262a9	00030000-56a8-a269-c7e6-6520df11c7a5
00020000-56a8-a26a-3835-c91432c262a9	00030000-56a8-a269-4177-a2549ce6a3fd
00020000-56a8-a26a-3835-c91432c262a9	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a26a-3835-c91432c262a9	00030000-56a8-a269-3e39-6b7fc76befb3
00020000-56a8-a26a-3835-c91432c262a9	00030000-56a8-a269-5211-003d907c3e0c
00020000-56a8-a26a-3835-c91432c262a9	00030000-56a8-a269-afe2-4815946abb57
00020000-56a8-a26a-3835-c91432c262a9	00030000-56a8-a269-db13-8e0bb925cb43
00020000-56a8-a26a-3835-c91432c262a9	00030000-56a8-a269-6ce2-8a27dcdf7e6d
00020000-56a8-a26a-3835-c91432c262a9	00030000-56a8-a269-fe5f-fe44cd80cd3c
00020000-56a8-a26a-3835-c91432c262a9	00030000-56a8-a269-bbae-4e2330231465
00020000-56a8-a26a-3835-c91432c262a9	00030000-56a8-a269-2cce-bc45f3a834d9
00020000-56a8-a26a-3835-c91432c262a9	00030000-56a8-a269-da64-0f25a335eadd
00020000-56a8-a26a-97f7-163eab899220	00030000-56a8-a269-6ce2-8a27dcdf7e6d
00020000-56a8-a26a-97f7-163eab899220	00030000-56a8-a269-2cce-bc45f3a834d9
00020000-56a8-a26a-97f7-163eab899220	00030000-56a8-a269-4177-a2549ce6a3fd
00020000-56a8-a26a-97f7-163eab899220	00030000-56a8-a269-5211-003d907c3e0c
00020000-56a8-a26a-97f7-163eab899220	00030000-56a8-a269-db13-8e0bb925cb43
00020000-56a8-a26a-97f7-163eab899220	00030000-56a8-a269-fe5f-fe44cd80cd3c
00020000-56a8-a26a-97f7-163eab899220	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a26a-cc84-eda5c2366145	00030000-56a8-a269-6ce2-8a27dcdf7e6d
00020000-56a8-a26a-cc84-eda5c2366145	00030000-56a8-a269-9930-6028c0c35087
00020000-56a8-a26a-cc84-eda5c2366145	00030000-56a8-a269-2cce-bc45f3a834d9
00020000-56a8-a26a-cc84-eda5c2366145	00030000-56a8-a269-afe2-4815946abb57
00020000-56a8-a26a-ea40-596c006677c2	00030000-56a8-a269-6ce2-8a27dcdf7e6d
00020000-56a8-a26a-ea40-596c006677c2	00030000-56a8-a269-2cce-bc45f3a834d9
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-55f1-5aeabd53a384
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-c7e6-6520df11c7a5
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-5641-8a80cf7c9c3a
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-78ef-61a2fbd60499
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-ffa1-5211df95f225
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-623e-51a8a0693e54
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-dba9-c1f00266ce3c
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-5e73-10ddd383ded0
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-67be-262e984d52fd
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-64f0-75456f91356f
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-d8b4-772a4dbec5af
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-7e67-5b0daf248e99
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-4177-a2549ce6a3fd
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-0b5b-e4013fbb7053
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-260c-c4bff12f7a10
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-df5f-d58756e26b20
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-7b99-25408cbc4e0d
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-c9d4-1636b79bb0aa
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-0711-dcdb0aa0a4fa
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-71b6-84675a0c17da
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-3e39-6b7fc76befb3
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-063f-f428fac42e00
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-5211-003d907c3e0c
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-eaba-4fa0c53a1e8b
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-afe2-4815946abb57
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-da04-0ce791780611
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-4096-88c95a5f57e5
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-d2c4-c113b8d04667
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-7fe1-6d046654fb68
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-def9-330ff3a0a83a
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-2150-d79a7d92fa00
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-db13-8e0bb925cb43
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-5d29-a01d16519dcd
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-4438-9e14d3fcabb9
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-ac97-b5cf18af08d5
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-9d51-a63230419747
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-cd48-ffe60c27993f
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-d7bc-2e6cc5b9a68c
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-54aa-6278c0737adc
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-651c-a05c1b2faca1
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-b3f4-4f67da7ab16d
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-8092-5f88b764b594
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-9fdd-7110ae5ac908
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-7e67-132ab1763fe8
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-7c5f-4fa74f97c53f
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-f4a7-093f51ed6eb7
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-fc15-9a7f7e2e48e8
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-8862-1069c1f4ce6e
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-69aa-08335b02cfed
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-9eca-17751e8944a0
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-333c-765b4dd6525a
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-fb19-4974d34df3fa
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-629f-e52d598540f2
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-01b4-1847e1a955d6
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-c41a-b68514a2824e
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-6ce2-8a27dcdf7e6d
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-9930-6028c0c35087
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-7a9a-a300e7574101
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-fe5f-fe44cd80cd3c
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-6ca3-ae54926b8713
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-cdff-1dddfb7205da
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-bbae-4e2330231465
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-2cce-bc45f3a834d9
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-ffe5-64a6830a4496
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-138a-1723598460ce
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-9f4f-96c6321226a1
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-0694-7c6f156221b0
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-da64-0f25a335eadd
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-62ce-228ba4f77272
00020000-56a8-a26a-4c46-4e1d5acc8bae	00030000-56a8-a269-4a32-2d0af66f0f7a
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-55f1-5aeabd53a384
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-c7e6-6520df11c7a5
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-ffa1-5211df95f225
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-623e-51a8a0693e54
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-dba9-c1f00266ce3c
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-5e73-10ddd383ded0
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-67be-262e984d52fd
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-7e67-5b0daf248e99
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-4177-a2549ce6a3fd
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-c9d4-1636b79bb0aa
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-0711-dcdb0aa0a4fa
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-71b6-84675a0c17da
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-3e39-6b7fc76befb3
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-afe2-4815946abb57
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-da04-0ce791780611
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-7fe1-6d046654fb68
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-db13-8e0bb925cb43
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-c41a-b68514a2824e
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-7a9a-a300e7574101
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-fe5f-fe44cd80cd3c
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-6ca3-ae54926b8713
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-cdff-1dddfb7205da
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-bbae-4e2330231465
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-2cce-bc45f3a834d9
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-138a-1723598460ce
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-9f4f-96c6321226a1
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-0694-7c6f156221b0
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-da64-0f25a335eadd
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-62ce-228ba4f77272
00020000-56a8-a26a-ec63-1022a47695c2	00030000-56a8-a269-4a32-2d0af66f0f7a
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-55f1-5aeabd53a384
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-c7e6-6520df11c7a5
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-5641-8a80cf7c9c3a
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-78ef-61a2fbd60499
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-ffa1-5211df95f225
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-623e-51a8a0693e54
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-dba9-c1f00266ce3c
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-5e73-10ddd383ded0
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-67be-262e984d52fd
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-7e67-5b0daf248e99
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-4177-a2549ce6a3fd
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-0b5b-e4013fbb7053
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-260c-c4bff12f7a10
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-c9d4-1636b79bb0aa
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-0711-dcdb0aa0a4fa
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-71b6-84675a0c17da
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-3e39-6b7fc76befb3
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-afe2-4815946abb57
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-da04-0ce791780611
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-7fe1-6d046654fb68
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-db13-8e0bb925cb43
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-c41a-b68514a2824e
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-7a9a-a300e7574101
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-fe5f-fe44cd80cd3c
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-6ca3-ae54926b8713
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-cdff-1dddfb7205da
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-bbae-4e2330231465
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-2cce-bc45f3a834d9
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-ffe5-64a6830a4496
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-138a-1723598460ce
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-9f4f-96c6321226a1
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-0694-7c6f156221b0
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-da64-0f25a335eadd
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-62ce-228ba4f77272
00020000-56a8-a26a-dd9e-695d1b8f32d6	00030000-56a8-a269-4a32-2d0af66f0f7a
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-c7e6-6520df11c7a5
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-5641-8a80cf7c9c3a
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-78ef-61a2fbd60499
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-ffa1-5211df95f225
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-623e-51a8a0693e54
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-dba9-c1f00266ce3c
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-5e73-10ddd383ded0
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-67be-262e984d52fd
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-64f0-75456f91356f
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-d8b4-772a4dbec5af
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-7e67-5b0daf248e99
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-4177-a2549ce6a3fd
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-0b5b-e4013fbb7053
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-260c-c4bff12f7a10
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-df5f-d58756e26b20
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-7b99-25408cbc4e0d
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-c9d4-1636b79bb0aa
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-9b5f-4ede2730d2c3
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-0711-dcdb0aa0a4fa
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-71b6-84675a0c17da
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-3e39-6b7fc76befb3
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-063f-f428fac42e00
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-5211-003d907c3e0c
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-eaba-4fa0c53a1e8b
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-afe2-4815946abb57
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-25fd-659b74f44fef
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-da04-0ce791780611
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-4096-88c95a5f57e5
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-d2c4-c113b8d04667
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-7fe1-6d046654fb68
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-5ad9-7e83c09fe7f3
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-def9-330ff3a0a83a
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-2150-d79a7d92fa00
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-db13-8e0bb925cb43
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-6772-22593ab449d3
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-5d29-a01d16519dcd
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-4438-9e14d3fcabb9
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-ac97-b5cf18af08d5
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-9d51-a63230419747
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-cd48-ffe60c27993f
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-d7bc-2e6cc5b9a68c
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-54aa-6278c0737adc
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-651c-a05c1b2faca1
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-b3f4-4f67da7ab16d
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-8092-5f88b764b594
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-9fdd-7110ae5ac908
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-7e67-132ab1763fe8
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-7c5f-4fa74f97c53f
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-f4a7-093f51ed6eb7
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-fc15-9a7f7e2e48e8
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-8862-1069c1f4ce6e
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-69aa-08335b02cfed
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-9eca-17751e8944a0
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-333c-765b4dd6525a
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-fb19-4974d34df3fa
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-629f-e52d598540f2
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-01b4-1847e1a955d6
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-c41a-b68514a2824e
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-6ce2-8a27dcdf7e6d
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-9930-6028c0c35087
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-7a9a-a300e7574101
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-7918-9a6b3266952c
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-fe5f-fe44cd80cd3c
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-6ca3-ae54926b8713
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-bbae-4e2330231465
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-45e1-8179b7f06b8d
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-2cce-bc45f3a834d9
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-ffe5-64a6830a4496
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-138a-1723598460ce
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-9f4f-96c6321226a1
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-0694-7c6f156221b0
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-da64-0f25a335eadd
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-b494-fcdcef1cf695
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-62ce-228ba4f77272
00020000-56a8-a26a-11a4-de44382b02eb	00030000-56a8-a269-4a32-2d0af66f0f7a
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-55f1-5aeabd53a384
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-c7e6-6520df11c7a5
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-5641-8a80cf7c9c3a
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-78ef-61a2fbd60499
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-ffa1-5211df95f225
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-623e-51a8a0693e54
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-dba9-c1f00266ce3c
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-5e73-10ddd383ded0
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-67be-262e984d52fd
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-7e67-5b0daf248e99
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-4177-a2549ce6a3fd
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-0b5b-e4013fbb7053
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-260c-c4bff12f7a10
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-c9d4-1636b79bb0aa
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-9b5f-4ede2730d2c3
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-0711-dcdb0aa0a4fa
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-71b6-84675a0c17da
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-3e39-6b7fc76befb3
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-063f-f428fac42e00
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-5211-003d907c3e0c
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-afe2-4815946abb57
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-25fd-659b74f44fef
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-da04-0ce791780611
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-7fe1-6d046654fb68
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-5ad9-7e83c09fe7f3
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-db13-8e0bb925cb43
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-6772-22593ab449d3
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-c41a-b68514a2824e
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-6ce2-8a27dcdf7e6d
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-7a9a-a300e7574101
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-7918-9a6b3266952c
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-fe5f-fe44cd80cd3c
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-6ca3-ae54926b8713
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-cdff-1dddfb7205da
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-bbae-4e2330231465
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-45e1-8179b7f06b8d
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-2cce-bc45f3a834d9
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-ffe5-64a6830a4496
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-138a-1723598460ce
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-9f4f-96c6321226a1
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-0694-7c6f156221b0
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-da64-0f25a335eadd
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-b494-fcdcef1cf695
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-62ce-228ba4f77272
00020000-56a8-a26a-cab8-53589f0ca21a	00030000-56a8-a269-4a32-2d0af66f0f7a
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-55f1-5aeabd53a384
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-c7e6-6520df11c7a5
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-5641-8a80cf7c9c3a
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-ffa1-5211df95f225
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-dba9-c1f00266ce3c
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-7e67-5b0daf248e99
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-4177-a2549ce6a3fd
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-0b5b-e4013fbb7053
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-c9d4-1636b79bb0aa
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-0711-dcdb0aa0a4fa
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-3e39-6b7fc76befb3
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-5211-003d907c3e0c
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-afe2-4815946abb57
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-da04-0ce791780611
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-7fe1-6d046654fb68
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-db13-8e0bb925cb43
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-c41a-b68514a2824e
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-6ce2-8a27dcdf7e6d
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-7a9a-a300e7574101
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-fe5f-fe44cd80cd3c
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-6ca3-ae54926b8713
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-cdff-1dddfb7205da
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-bbae-4e2330231465
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-2cce-bc45f3a834d9
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-138a-1723598460ce
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-da64-0f25a335eadd
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-62ce-228ba4f77272
00020000-56a8-a26a-f226-9d6859d91091	00030000-56a8-a269-4a32-2d0af66f0f7a
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-55f1-5aeabd53a384
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-c7e6-6520df11c7a5
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-5641-8a80cf7c9c3a
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-78ef-61a2fbd60499
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-dba9-c1f00266ce3c
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-67be-262e984d52fd
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-64f0-75456f91356f
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-d8b4-772a4dbec5af
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-7e67-5b0daf248e99
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-4177-a2549ce6a3fd
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-df5f-d58756e26b20
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-7b99-25408cbc4e0d
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-c9d4-1636b79bb0aa
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-9b5f-4ede2730d2c3
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-0711-dcdb0aa0a4fa
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-f54b-80771b8291f6
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-71b6-84675a0c17da
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-3e39-6b7fc76befb3
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-063f-f428fac42e00
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-5211-003d907c3e0c
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-eaba-4fa0c53a1e8b
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-afe2-4815946abb57
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-25fd-659b74f44fef
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-da04-0ce791780611
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-4096-88c95a5f57e5
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-d2c4-c113b8d04667
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-7fe1-6d046654fb68
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-5ad9-7e83c09fe7f3
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-def9-330ff3a0a83a
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-2150-d79a7d92fa00
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-db13-8e0bb925cb43
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-6772-22593ab449d3
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-5d29-a01d16519dcd
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-4438-9e14d3fcabb9
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-ac97-b5cf18af08d5
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-9d51-a63230419747
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-cd48-ffe60c27993f
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-d7bc-2e6cc5b9a68c
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-54aa-6278c0737adc
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-651c-a05c1b2faca1
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-b3f4-4f67da7ab16d
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-8092-5f88b764b594
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-9fdd-7110ae5ac908
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-7e67-132ab1763fe8
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-7c5f-4fa74f97c53f
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-f4a7-093f51ed6eb7
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-fc15-9a7f7e2e48e8
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-8862-1069c1f4ce6e
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-69aa-08335b02cfed
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-9eca-17751e8944a0
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-333c-765b4dd6525a
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-fb19-4974d34df3fa
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-629f-e52d598540f2
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-01b4-1847e1a955d6
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-c41a-b68514a2824e
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-6ce2-8a27dcdf7e6d
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-9930-6028c0c35087
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-7a9a-a300e7574101
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-7918-9a6b3266952c
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-fe5f-fe44cd80cd3c
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-6ca3-ae54926b8713
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-cdff-1dddfb7205da
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-bbae-4e2330231465
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-45e1-8179b7f06b8d
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-2cce-bc45f3a834d9
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-138a-1723598460ce
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-8a46-b506fce108bf
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-9f4f-96c6321226a1
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-0694-7c6f156221b0
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-da64-0f25a335eadd
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-b494-fcdcef1cf695
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-62ce-228ba4f77272
00020000-56a8-a26a-490e-9bd631efbf2f	00030000-56a8-a269-4a32-2d0af66f0f7a
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-e832-872b24f18b89
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-e6d5-2570050cbdd1
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-55f1-5aeabd53a384
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-dc5b-a7f7cfdcf2c7
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-c7e6-6520df11c7a5
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-78ef-61a2fbd60499
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-5641-8a80cf7c9c3a
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-197d-afe2d6e05488
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-f412-d4d49f12f565
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-1cda-a8f409d02d7b
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-5522-2753ba87878e
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-ffa1-5211df95f225
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-623e-51a8a0693e54
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-dba9-c1f00266ce3c
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-5e73-10ddd383ded0
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-67be-262e984d52fd
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-cfa4-049943c28fdd
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-6c0e-ebff0a29974c
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-58ea-4197d0b523f6
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-5108-175636c5b657
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-3cc3-b21bbeb0d92e
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-ed47-c1a6c88c0dbc
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-baea-237a8bf9be39
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-afc2-ce4b52da2812
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-766c-197e3f8ab3d0
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-64f0-75456f91356f
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-d8b4-772a4dbec5af
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-7e67-5b0daf248e99
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-4e97-3e63585fb04e
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-8f17-3b78d0546cbf
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-7318-cfd088b94621
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-4177-a2549ce6a3fd
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-260c-c4bff12f7a10
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-0b5b-e4013fbb7053
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-aaeb-2048252f0299
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-2476-6a6a3abf5846
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-18e7-b758a379794f
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-df5f-d58756e26b20
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-7b99-25408cbc4e0d
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-c9d4-1636b79bb0aa
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-9b5f-4ede2730d2c3
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-dcbd-7981d4cf9845
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-7d13-dddc9b356943
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-11e5-7289b28fc039
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-f343-8295f4a338d4
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-1fab-2e4479bab605
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-81f4-d475c9c5b015
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-980e-d6bc435d35b7
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-ee82-676abbb72732
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-2daa-84a52355faa3
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-ba18-5442116364db
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-589f-85b07642ab60
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-1632-87c2c7b2a65a
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-7386-efe8e6386638
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-f54a-2b20e6598a65
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-7cbc-52d25a278864
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-0711-dcdb0aa0a4fa
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-f54b-80771b8291f6
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-71b6-84675a0c17da
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-3e39-6b7fc76befb3
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-063f-f428fac42e00
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-6e51-643ca9b0ae2f
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-9ab6-8caa14e862a4
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-c977-624583376686
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-ad2a-81385ed41121
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-5211-003d907c3e0c
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-eaba-4fa0c53a1e8b
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-afe2-4815946abb57
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-25fd-659b74f44fef
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-da04-0ce791780611
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-4096-88c95a5f57e5
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-d2c4-c113b8d04667
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-d9d5-03d4fa8d923f
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-f7d6-8b5b65c553f6
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-1f7e-f148eeadb99c
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-7fe1-6d046654fb68
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-5ad9-7e83c09fe7f3
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-3b5c-45d60a373dd6
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-6b59-9e701bc4219b
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-4119-abe57082c7ce
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-af5a-bfa5b4bf868c
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-802c-28d6fbeba09b
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-d062-e7dd580a35aa
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-def9-330ff3a0a83a
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-2150-d79a7d92fa00
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-db13-8e0bb925cb43
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-6772-22593ab449d3
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-5d29-a01d16519dcd
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-4438-9e14d3fcabb9
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-ac97-b5cf18af08d5
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-9d51-a63230419747
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-cd48-ffe60c27993f
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-d7bc-2e6cc5b9a68c
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-54aa-6278c0737adc
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-651c-a05c1b2faca1
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-b3f4-4f67da7ab16d
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-8092-5f88b764b594
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-9fdd-7110ae5ac908
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-7e67-132ab1763fe8
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-7c5f-4fa74f97c53f
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-f4a7-093f51ed6eb7
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-fc15-9a7f7e2e48e8
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-8862-1069c1f4ce6e
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-69aa-08335b02cfed
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-9eca-17751e8944a0
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-333c-765b4dd6525a
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-fb19-4974d34df3fa
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-629f-e52d598540f2
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-01b4-1847e1a955d6
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-c41a-b68514a2824e
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-03f2-80449ac5a2bd
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-7a94-9bdd16844c7a
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-e751-4c763ece4a6d
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-84d8-4fbab41fa4e7
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-e035-7084c3b3850a
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-80f6-706a5cc40d29
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-55f3-1a971d513aba
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-f5c0-17fdfb9a1f07
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-d2bd-ff42374e258c
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-ef2e-3b34c13be604
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-cc2d-ff6fbdb83b45
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-ec40-d0de951ce11d
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-92c2-65b8e694542a
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-a700-4a4f0929d24c
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-e1be-8881e9175857
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-e9c6-54a4990fd020
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-4345-ef0f4644a71e
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-88d7-942719a78100
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-4c46-80bacb89b303
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-8cd7-7d5968a53bf8
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-fb9d-54ba6ef7a30d
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-6ca4-e0107eb621eb
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-6ce2-8a27dcdf7e6d
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-9930-6028c0c35087
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-7a9a-a300e7574101
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-7918-9a6b3266952c
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-8f5a-cc502325b0d4
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-a04d-29829cb0db25
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-2eca-24510c7666bd
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-fe5f-fe44cd80cd3c
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-408d-1f4f82f52a0c
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-6ca3-ae54926b8713
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-a563-750ad6efde4f
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-7743-ce968135b546
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-2da0-5f07ab776388
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-cdff-1dddfb7205da
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-5f41-150f2fee1429
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-bbae-4e2330231465
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-45e1-8179b7f06b8d
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-2cce-bc45f3a834d9
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-ffe5-64a6830a4496
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-5342-ec3f0d7e016e
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-73ed-6ad1a253fd79
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-e27e-e53d97540596
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-cb9c-d3623fcc81f8
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-138a-1723598460ce
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-8a46-b506fce108bf
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-6abf-847c663217d4
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-0a47-59aa8319f240
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-9f4f-96c6321226a1
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-0694-7c6f156221b0
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-da64-0f25a335eadd
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-b494-fcdcef1cf695
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-62ce-228ba4f77272
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-fd16-bef04a614934
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-4a32-2d0af66f0f7a
00020000-56a8-a26c-fcf6-f55e95949cac	00030000-56a8-a269-fe50-732d84d038ad
00020000-56a8-a26c-5992-263049b17a43	00030000-56a8-a269-0de0-4a2dcde28fe1
00020000-56a8-a26c-4f9c-2106134f69aa	00030000-56a8-a269-9f4f-96c6321226a1
00020000-56a8-a26c-155a-a475ad792cc5	00030000-56a8-a269-ffe5-64a6830a4496
00020000-56a8-a26c-aa77-91cb796965f5	00030000-56a8-a269-2cce-bc45f3a834d9
00020000-56a8-a26c-aeb3-40e4a4dd5afd	00030000-56a8-a269-81f4-d475c9c5b015
00020000-56a8-a26c-c841-f461efb4a8c3	00030000-56a8-a269-980e-d6bc435d35b7
00020000-56a8-a26c-e722-a1d45e90ed7e	00030000-56a8-a269-ee82-676abbb72732
00020000-56a8-a26c-2a62-3264eec2efd8	00030000-56a8-a269-1fab-2e4479bab605
00020000-56a8-a26c-81f6-6e32557ba9b7	00030000-56a8-a269-11e5-7289b28fc039
00020000-56a8-a26c-9a9c-6e5bba959e5c	00030000-56a8-a269-f343-8295f4a338d4
00020000-56a8-a26c-bf73-e71e69f46cb9	00030000-56a8-a269-7e5a-8bd71a660c81
00020000-56a8-a26c-8f57-849083d6f5be	00030000-56a8-a269-0694-7c6f156221b0
00020000-56a8-a26c-5ad4-1c7bdfbc20b4	00030000-56a8-a269-1917-df3381f1c9e9
00020000-56a8-a26c-78c7-f5816f112679	00030000-56a8-a269-71b6-84675a0c17da
00020000-56a8-a26c-0676-90921b187573	00030000-56a8-a269-063f-f428fac42e00
00020000-56a8-a26c-be1d-3fc847cce081	00030000-56a8-a269-3e39-6b7fc76befb3
00020000-56a8-a26c-430a-80f0a223552f	00030000-56a8-a269-67be-262e984d52fd
00020000-56a8-a26c-cc89-3749a41a821f	00030000-56a8-a269-a3e4-d6427e6e8201
00020000-56a8-a26c-a568-0834cdf47e27	00030000-56a8-a269-afe2-4815946abb57
00020000-56a8-a26c-a568-0834cdf47e27	00030000-56a8-a269-25fd-659b74f44fef
00020000-56a8-a26c-a568-0834cdf47e27	00030000-56a8-a269-2cce-bc45f3a834d9
00020000-56a8-a26c-fc9f-10994065cf1d	00030000-56a8-a269-bbae-4e2330231465
00020000-56a8-a26c-d2b4-10ab30e89027	00030000-56a8-a269-45e1-8179b7f06b8d
00020000-56a8-a26c-566b-d0d123f2e1f0	00030000-56a8-a269-6ca4-e0107eb621eb
00020000-56a8-a26c-44bb-7829ce97c481	00030000-56a8-a269-7a9a-a300e7574101
00020000-56a8-a26c-3aac-f7678636d774	00030000-56a8-a269-7918-9a6b3266952c
00020000-56a8-a26c-009a-888c46c6feee	00030000-56a8-a269-7fe1-6d046654fb68
00020000-56a8-a26c-b2eb-11f4afcb00d7	00030000-56a8-a269-5ad9-7e83c09fe7f3
00020000-56a8-a26c-0d1c-daf153889ce9	00030000-56a8-a269-da64-0f25a335eadd
00020000-56a8-a26c-8a5c-80bde1119e60	00030000-56a8-a269-b494-fcdcef1cf695
00020000-56a8-a26c-7384-33c489d900c0	00030000-56a8-a269-5211-003d907c3e0c
00020000-56a8-a26c-223f-7735a27cabb3	00030000-56a8-a269-eaba-4fa0c53a1e8b
00020000-56a8-a26c-c7ca-f7f1dcf1654f	00030000-56a8-a269-6ce2-8a27dcdf7e6d
00020000-56a8-a26c-fd3a-8ddd781afa2d	00030000-56a8-a269-9930-6028c0c35087
00020000-56a8-a26c-0aeb-13c4f6cda771	00030000-56a8-a269-c7e6-6520df11c7a5
00020000-56a8-a26c-3235-1c338ddac093	00030000-56a8-a269-5641-8a80cf7c9c3a
00020000-56a8-a26c-8c3a-f4fc07834579	00030000-56a8-a269-78ef-61a2fbd60499
00020000-56a8-a26c-55b7-55b654d95295	00030000-56a8-a269-4177-a2549ce6a3fd
00020000-56a8-a26c-6fbb-4ca1f3d9c0f3	00030000-56a8-a269-0b5b-e4013fbb7053
00020000-56a8-a26c-2a2f-648a0b128190	00030000-56a8-a269-260c-c4bff12f7a10
\.


--
-- TOC entry 3181 (class 0 OID 40860058)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 40860093)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 40860226)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56a8-a26d-4ea0-ca8d7a7b70c5	00090000-56a8-a26d-1922-1059a52a7bc7	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56a8-a26d-26b4-934fdbae69b3	00090000-56a8-a26d-5de8-a180a6db58cb	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56a8-a26d-6d21-432a6ce4f4f7	00090000-56a8-a26d-cf2e-6ea07c87c748	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56a8-a26d-cace-d59af49e4087	00090000-56a8-a26d-3ac1-8b45c0c1f05a	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 40859743)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56a8-a26c-f0cb-12f0785f99f1	\N	00040000-56a8-a269-b45b-504c64072731	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-a26c-eb89-bfae57827627	\N	00040000-56a8-a269-b45b-504c64072731	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56a8-a26c-744e-5762c807700c	\N	00040000-56a8-a269-b45b-504c64072731	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-a26c-7646-e1374857e1d2	\N	00040000-56a8-a269-b45b-504c64072731	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-a26c-1d82-092a19e93f6d	\N	00040000-56a8-a269-b45b-504c64072731	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-a26c-6fd1-eaa59b1e16ea	\N	00040000-56a8-a269-93b4-490c526eedfd	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-a26c-1310-3dfffdaa7f16	\N	00040000-56a8-a269-9c50-208e219928b1	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-a26c-86e6-31600fe2a997	\N	00040000-56a8-a269-2d08-6e5ec1201d94	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-a26c-b09b-2e07c474d90b	\N	00040000-56a8-a269-3b11-c67036fd2d37	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a8-a26f-cbf3-2039157394c0	\N	00040000-56a8-a269-b45b-504c64072731	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 40859788)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56a8-a268-3476-e7eee74efd73	8341	Adlešiči
00050000-56a8-a268-d6ff-e2ffe6074278	5270	Ajdovščina
00050000-56a8-a268-a681-1430e4f5275e	6280	Ankaran/Ancarano
00050000-56a8-a268-3ee4-57d05cb0fd28	9253	Apače
00050000-56a8-a268-a5ed-16f7739218b2	8253	Artiče
00050000-56a8-a268-537b-2094b7e34f96	4275	Begunje na Gorenjskem
00050000-56a8-a268-12d0-bcd8b35f4da0	1382	Begunje pri Cerknici
00050000-56a8-a268-1788-e95409c5cbbb	9231	Beltinci
00050000-56a8-a268-cad8-eb31ed5280fb	2234	Benedikt
00050000-56a8-a268-44bf-557bc238397f	2345	Bistrica ob Dravi
00050000-56a8-a268-fac5-1981e96a8b7e	3256	Bistrica ob Sotli
00050000-56a8-a268-7689-6864e794b8e6	8259	Bizeljsko
00050000-56a8-a268-a8a1-02b3753face3	1223	Blagovica
00050000-56a8-a268-832e-37df9b97ac42	8283	Blanca
00050000-56a8-a268-ace6-e48e156f89a6	4260	Bled
00050000-56a8-a268-2350-484d7e741e0b	4273	Blejska Dobrava
00050000-56a8-a268-a530-acbe803cc42a	9265	Bodonci
00050000-56a8-a268-ba6c-c17e86cc5914	9222	Bogojina
00050000-56a8-a268-5486-03c82ffde941	4263	Bohinjska Bela
00050000-56a8-a268-626e-6e554e55635d	4264	Bohinjska Bistrica
00050000-56a8-a268-b350-1259a147bd88	4265	Bohinjsko jezero
00050000-56a8-a268-1e05-b9c099706ff7	1353	Borovnica
00050000-56a8-a268-4f67-1269ef20abb1	8294	Boštanj
00050000-56a8-a268-f831-2eb2519f2341	5230	Bovec
00050000-56a8-a268-84bf-026df185480f	5295	Branik
00050000-56a8-a268-fbd6-08547bc369e8	3314	Braslovče
00050000-56a8-a268-7e41-b5499fccac74	5223	Breginj
00050000-56a8-a268-7628-8f94705c925c	8280	Brestanica
00050000-56a8-a268-ef96-59813f7cb378	2354	Bresternica
00050000-56a8-a268-d213-fd2587c5edc0	4243	Brezje
00050000-56a8-a268-c1d1-921bc3738d62	1351	Brezovica pri Ljubljani
00050000-56a8-a268-900c-b1ce18088b57	8250	Brežice
00050000-56a8-a268-9182-927b65c25317	4210	Brnik - Aerodrom
00050000-56a8-a268-a386-a29dcf501dfb	8321	Brusnice
00050000-56a8-a268-cf82-7d8aa3030dfc	3255	Buče
00050000-56a8-a268-23ed-67dbca9e8114	8276	Bučka 
00050000-56a8-a268-485d-04d1492699b1	9261	Cankova
00050000-56a8-a268-6520-fffd4e1c4eed	3000	Celje 
00050000-56a8-a268-9d3c-6852394ba129	3001	Celje - poštni predali
00050000-56a8-a268-1120-a4fbd8a480b8	4207	Cerklje na Gorenjskem
00050000-56a8-a268-4144-b6bed725d5f8	8263	Cerklje ob Krki
00050000-56a8-a268-7e8f-4dc99b28b115	1380	Cerknica
00050000-56a8-a268-234d-ee1a27a544ce	5282	Cerkno
00050000-56a8-a268-1407-c432351b6d85	2236	Cerkvenjak
00050000-56a8-a268-c6b8-87141cc2b801	2215	Ceršak
00050000-56a8-a268-21f2-010994ff026e	2326	Cirkovce
00050000-56a8-a268-067a-1ccb20681d21	2282	Cirkulane
00050000-56a8-a268-922a-8aede63ee6ee	5273	Col
00050000-56a8-a268-7e54-5c4386c67585	8251	Čatež ob Savi
00050000-56a8-a268-8077-f84b9bfc86f8	1413	Čemšenik
00050000-56a8-a268-dacc-cd3f5f1e1771	5253	Čepovan
00050000-56a8-a268-73bf-7b97b9330900	9232	Črenšovci
00050000-56a8-a268-cb5e-9145e73d2ebc	2393	Črna na Koroškem
00050000-56a8-a268-8dd6-745104001d88	6275	Črni Kal
00050000-56a8-a268-aa67-cc40a0026d39	5274	Črni Vrh nad Idrijo
00050000-56a8-a268-5781-c427123b915d	5262	Črniče
00050000-56a8-a268-96bf-8e49dd137695	8340	Črnomelj
00050000-56a8-a268-5c38-bf7dc543b532	6271	Dekani
00050000-56a8-a268-011e-afc97abb680f	5210	Deskle
00050000-56a8-a268-7d2a-7d4ba9f5e5ae	2253	Destrnik
00050000-56a8-a268-8af1-625cc547a8cd	6215	Divača
00050000-56a8-a268-57ba-bdd58433cfe8	1233	Dob
00050000-56a8-a268-f282-4f79fe7abd4d	3224	Dobje pri Planini
00050000-56a8-a268-798a-0e53e5ac1b16	8257	Dobova
00050000-56a8-a268-9cb8-0f13e5f66d38	1423	Dobovec
00050000-56a8-a268-63d5-ff328cb492b7	5263	Dobravlje
00050000-56a8-a268-3071-5e5801976320	3204	Dobrna
00050000-56a8-a268-7438-a7ab1fe2d7ca	8211	Dobrnič
00050000-56a8-a268-1f98-3079e580f6e1	1356	Dobrova
00050000-56a8-a268-4247-8f05dbadec0e	9223	Dobrovnik/Dobronak 
00050000-56a8-a268-8f10-3dec1b506241	5212	Dobrovo v Brdih
00050000-56a8-a268-1371-cecde36f31fa	1431	Dol pri Hrastniku
00050000-56a8-a268-26ff-35d80d56c184	1262	Dol pri Ljubljani
00050000-56a8-a268-3b61-3d2b8d2faf31	1273	Dole pri Litiji
00050000-56a8-a268-28b1-ab7e569065e9	1331	Dolenja vas
00050000-56a8-a268-316c-4f1150a9d33b	8350	Dolenjske Toplice
00050000-56a8-a268-165c-e8e54bf79acc	1230	Domžale
00050000-56a8-a268-6a5e-debc07976c04	2252	Dornava
00050000-56a8-a268-a94b-07bbc62cf9e8	5294	Dornberk
00050000-56a8-a268-dede-e10e67391515	1319	Draga
00050000-56a8-a268-9539-6d71ced516b7	8343	Dragatuš
00050000-56a8-a268-5dc9-e7dee2e9accf	3222	Dramlje
00050000-56a8-a268-9fed-d5e2db56b93a	2370	Dravograd
00050000-56a8-a268-9f7c-9d582f29dde4	4203	Duplje
00050000-56a8-a268-fa8a-f6b3533a68a5	6221	Dutovlje
00050000-56a8-a268-d45a-4c2b5be3450c	8361	Dvor
00050000-56a8-a268-3412-9010e9632630	2343	Fala
00050000-56a8-a268-4bb6-a024ec1e093f	9208	Fokovci
00050000-56a8-a268-a5df-34cf5e692aac	2313	Fram
00050000-56a8-a268-32fb-37b68c06eeac	3213	Frankolovo
00050000-56a8-a268-2347-94bc4dd80e0f	1274	Gabrovka
00050000-56a8-a268-a4cc-2be2d5454185	8254	Globoko
00050000-56a8-a268-9341-48e4bb0ca072	5275	Godovič
00050000-56a8-a268-b1ed-ad2eebb2bd95	4204	Golnik
00050000-56a8-a268-ed01-e4f15531cc31	3303	Gomilsko
00050000-56a8-a268-d62c-b35d04c5cf2a	4224	Gorenja vas
00050000-56a8-a268-bd8e-8f3fc21694c2	3263	Gorica pri Slivnici
00050000-56a8-a268-f264-dcf25613e1f3	2272	Gorišnica
00050000-56a8-a268-5e5a-31a99b4d11d8	9250	Gornja Radgona
00050000-56a8-a268-cb3d-22d9cccd2eb9	3342	Gornji Grad
00050000-56a8-a268-fe2d-c613bd42a16d	4282	Gozd Martuljek
00050000-56a8-a268-6cb6-57fd18da3b4a	6272	Gračišče
00050000-56a8-a268-a247-347d9867a588	9264	Grad
00050000-56a8-a268-8db2-05f9f559ded0	8332	Gradac
00050000-56a8-a268-a82d-bd70b1c95bfc	1384	Grahovo
00050000-56a8-a268-73d4-3978bab398d8	5242	Grahovo ob Bači
00050000-56a8-a268-c8bb-ab65105fbd5a	5251	Grgar
00050000-56a8-a268-e7ff-c9431b03c7d3	3302	Griže
00050000-56a8-a268-f165-db9c84639cb4	3231	Grobelno
00050000-56a8-a268-870d-074d569a20fb	1290	Grosuplje
00050000-56a8-a268-cea9-f6188228afba	2288	Hajdina
00050000-56a8-a268-9763-77b29b7832cd	8362	Hinje
00050000-56a8-a268-9c6d-e22f7f3e3036	2311	Hoče
00050000-56a8-a268-84f4-9cbcd7ff85ab	9205	Hodoš/Hodos
00050000-56a8-a268-3ce1-75568a11a8ee	1354	Horjul
00050000-56a8-a268-61c4-a3305b60a220	1372	Hotedršica
00050000-56a8-a268-40c2-7ad56b1eacb2	1430	Hrastnik
00050000-56a8-a268-cdda-438056d915c3	6225	Hruševje
00050000-56a8-a268-45f2-ead479c6839c	4276	Hrušica
00050000-56a8-a268-812e-7368f2133cc2	5280	Idrija
00050000-56a8-a268-bcae-0a2b8ffeff89	1292	Ig
00050000-56a8-a268-5e7e-4eb85322b8c3	6250	Ilirska Bistrica
00050000-56a8-a268-646a-c3864a2f8b72	6251	Ilirska Bistrica-Trnovo
00050000-56a8-a268-baf7-33e0c9c335ae	1295	Ivančna Gorica
00050000-56a8-a268-39a4-8bc4403f243e	2259	Ivanjkovci
00050000-56a8-a268-e74d-b6ebc3e32887	1411	Izlake
00050000-56a8-a268-9cdf-71286ada9bcc	6310	Izola/Isola
00050000-56a8-a268-b154-7495af9783d0	2222	Jakobski Dol
00050000-56a8-a268-c5e6-563ef5086d8c	2221	Jarenina
00050000-56a8-a268-591b-75f4c6ca7ced	6254	Jelšane
00050000-56a8-a268-d58b-f9affd8c5a7f	4270	Jesenice
00050000-56a8-a268-b27f-d28ae6379f5d	8261	Jesenice na Dolenjskem
00050000-56a8-a268-16b6-3f6e844dfd78	3273	Jurklošter
00050000-56a8-a268-9be9-eab597722ffa	2223	Jurovski Dol
00050000-56a8-a268-34e2-e5688d34fc40	2256	Juršinci
00050000-56a8-a268-f171-a8f24ae839ae	5214	Kal nad Kanalom
00050000-56a8-a268-f7b4-942d8da9f2ad	3233	Kalobje
00050000-56a8-a268-ff65-ab847906dc9e	4246	Kamna Gorica
00050000-56a8-a268-b5e5-66e14f1c4ec1	2351	Kamnica
00050000-56a8-a268-c6f6-0619473b684e	1241	Kamnik
00050000-56a8-a268-6d1f-87cca8406fd3	5213	Kanal
00050000-56a8-a268-a2af-604055482070	8258	Kapele
00050000-56a8-a268-b9d2-8e1900a6bea7	2362	Kapla
00050000-56a8-a268-b575-c1fd5366a4ad	2325	Kidričevo
00050000-56a8-a268-3046-1a8c61d03a77	1412	Kisovec
00050000-56a8-a268-6efe-8fca75be7e7a	6253	Knežak
00050000-56a8-a268-5dbd-4185d35cadf9	5222	Kobarid
00050000-56a8-a268-e03b-accedb469543	9227	Kobilje
00050000-56a8-a268-a1c2-cd6a41f0cc55	1330	Kočevje
00050000-56a8-a268-4934-d387c1f4ed2a	1338	Kočevska Reka
00050000-56a8-a268-3df6-9852ab8f4b05	2276	Kog
00050000-56a8-a268-595b-af167192e26b	5211	Kojsko
00050000-56a8-a268-840b-4231a468a7ce	6223	Komen
00050000-56a8-a268-69fa-372cabd00f60	1218	Komenda
00050000-56a8-a268-8e16-5789b572a2ad	6000	Koper/Capodistria 
00050000-56a8-a268-64fb-1b09de4a3f33	6001	Koper/Capodistria - poštni predali
00050000-56a8-a268-2d1c-8b133798edda	8282	Koprivnica
00050000-56a8-a268-c496-d802cc2c508b	5296	Kostanjevica na Krasu
00050000-56a8-a268-71c4-5e9898f8951d	8311	Kostanjevica na Krki
00050000-56a8-a268-909f-f151090bde85	1336	Kostel
00050000-56a8-a268-148f-58f509b3d4d1	6256	Košana
00050000-56a8-a268-5b2a-8bdfd5103c19	2394	Kotlje
00050000-56a8-a268-e8f4-6984cabfec56	6240	Kozina
00050000-56a8-a268-85f4-26ae60b49cb0	3260	Kozje
00050000-56a8-a268-cf55-5ab76fe1bf32	4000	Kranj 
00050000-56a8-a268-f14c-bf01e721fd3f	4001	Kranj - poštni predali
00050000-56a8-a268-e1ed-b95106578f08	4280	Kranjska Gora
00050000-56a8-a268-793c-8cf38c77c176	1281	Kresnice
00050000-56a8-a268-b9fd-e166f2c72cca	4294	Križe
00050000-56a8-a268-1269-acad3abcb5a9	9206	Križevci
00050000-56a8-a268-714d-391051135a55	9242	Križevci pri Ljutomeru
00050000-56a8-a268-8373-f09dc88de20f	1301	Krka
00050000-56a8-a268-d39e-7e9d75cc0c11	8296	Krmelj
00050000-56a8-a268-f607-e05971f25d79	4245	Kropa
00050000-56a8-a268-6538-aa03b3fd43e7	8262	Krška vas
00050000-56a8-a268-ba1c-a13c0974ee15	8270	Krško
00050000-56a8-a268-d987-d6bfa8981bbb	9263	Kuzma
00050000-56a8-a268-07ca-1aa948f5df2b	2318	Laporje
00050000-56a8-a268-7699-3c25dadb90df	3270	Laško
00050000-56a8-a268-dc0e-5787a7b512bb	1219	Laze v Tuhinju
00050000-56a8-a268-e20d-40ed611ffe10	2230	Lenart v Slovenskih goricah
00050000-56a8-a268-2f44-4f159da91a3a	9220	Lendava/Lendva
00050000-56a8-a268-0a60-60188db730fc	4248	Lesce
00050000-56a8-a268-a221-76db6bd1a257	3261	Lesično
00050000-56a8-a268-3a1f-3355685f1f84	8273	Leskovec pri Krškem
00050000-56a8-a268-a5e5-0d450c839311	2372	Libeliče
00050000-56a8-a268-db4c-c0c428ce9d3f	2341	Limbuš
00050000-56a8-a268-3e0f-41f5fcdb73cf	1270	Litija
00050000-56a8-a268-5612-18b5ff846ff9	3202	Ljubečna
00050000-56a8-a268-9440-1045087e28f9	1000	Ljubljana 
00050000-56a8-a268-d257-1ce7260f93bd	1001	Ljubljana - poštni predali
00050000-56a8-a268-e16c-f2987d419f06	1231	Ljubljana - Črnuče
00050000-56a8-a268-9260-6dbe1d8512e6	1261	Ljubljana - Dobrunje
00050000-56a8-a268-9e63-e327d3b09c4a	1260	Ljubljana - Polje
00050000-56a8-a268-e733-4e232e5ab2cc	1210	Ljubljana - Šentvid
00050000-56a8-a268-8759-53ed232b0ae0	1211	Ljubljana - Šmartno
00050000-56a8-a268-5913-f54a1dc7a9fd	3333	Ljubno ob Savinji
00050000-56a8-a268-39ab-b3a48cdcdedb	9240	Ljutomer
00050000-56a8-a268-b29b-59e7f24f8b14	3215	Loče
00050000-56a8-a268-57c7-91a8d423e050	5231	Log pod Mangartom
00050000-56a8-a268-054c-d36403e1f1ab	1358	Log pri Brezovici
00050000-56a8-a268-86cd-f973bd7231ed	1370	Logatec
00050000-56a8-a268-1193-062277add697	1371	Logatec
00050000-56a8-a268-e6e0-3b00d67023b2	1434	Loka pri Zidanem Mostu
00050000-56a8-a268-719f-293c5713971d	3223	Loka pri Žusmu
00050000-56a8-a268-a94f-f49c0d21f0b4	6219	Lokev
00050000-56a8-a268-2bbf-b2ebace35828	1318	Loški Potok
00050000-56a8-a268-c63f-acf9105104be	2324	Lovrenc na Dravskem polju
00050000-56a8-a268-a77f-dbf6268bd6a9	2344	Lovrenc na Pohorju
00050000-56a8-a268-af4c-89980cf8c6f8	3334	Luče
00050000-56a8-a268-e5f6-72672018ffbd	1225	Lukovica
00050000-56a8-a268-bb8e-876b83cb90ff	9202	Mačkovci
00050000-56a8-a268-153c-a2b331b0eda7	2322	Majšperk
00050000-56a8-a268-dc1b-d6642c6eaad4	2321	Makole
00050000-56a8-a268-5599-0b9bdd6ba495	9243	Mala Nedelja
00050000-56a8-a268-3c02-30631b12a4d1	2229	Malečnik
00050000-56a8-a268-c3d3-a71b87d464c8	6273	Marezige
00050000-56a8-a268-1fe3-19a07366e13c	2000	Maribor 
00050000-56a8-a268-44b5-1e0300dfb108	2001	Maribor - poštni predali
00050000-56a8-a268-869b-df9bc141100a	2206	Marjeta na Dravskem polju
00050000-56a8-a268-fd1c-7da36aab1ed5	2281	Markovci
00050000-56a8-a268-139d-04cd0e169ed4	9221	Martjanci
00050000-56a8-a268-8b94-4125854849c2	6242	Materija
00050000-56a8-a268-7bc1-885112848ff7	4211	Mavčiče
00050000-56a8-a268-c56a-df064dcda556	1215	Medvode
00050000-56a8-a268-6f9a-54b927a630f9	1234	Mengeš
00050000-56a8-a268-c47b-c0e8dc567f60	8330	Metlika
00050000-56a8-a268-dfbd-591ac5ae3720	2392	Mežica
00050000-56a8-a268-8eaa-89a51456a591	2204	Miklavž na Dravskem polju
00050000-56a8-a268-6fbb-bfc706547791	2275	Miklavž pri Ormožu
00050000-56a8-a268-d4ab-cdb5dd144876	5291	Miren
00050000-56a8-a268-feed-ca6d166a3cc3	8233	Mirna
00050000-56a8-a268-0a32-d927ae3b6bc4	8216	Mirna Peč
00050000-56a8-a268-c990-48490fa141ce	2382	Mislinja
00050000-56a8-a268-4790-bc963825dcde	4281	Mojstrana
00050000-56a8-a268-7434-eb92158e84af	8230	Mokronog
00050000-56a8-a268-7d4f-d2849e1c7ccf	1251	Moravče
00050000-56a8-a268-f278-e0c6fcf52ab0	9226	Moravske Toplice
00050000-56a8-a268-a3b4-e2224b6d2148	5216	Most na Soči
00050000-56a8-a268-d3a7-b6d3d6d165d3	1221	Motnik
00050000-56a8-a268-a8e9-cf8fa6932cc9	3330	Mozirje
00050000-56a8-a268-6024-08c24ca050d7	9000	Murska Sobota 
00050000-56a8-a268-43fb-6e4d8f6d8b75	9001	Murska Sobota - poštni predali
00050000-56a8-a268-6569-0ad34cc4e9ed	2366	Muta
00050000-56a8-a268-6f02-22d20e921fdd	4202	Naklo
00050000-56a8-a268-c814-d6fc9460cdec	3331	Nazarje
00050000-56a8-a268-0b4a-17b9f4f21a25	1357	Notranje Gorice
00050000-56a8-a268-ab8a-0dc33724b981	3203	Nova Cerkev
00050000-56a8-a268-9dfc-d3fb17cb75fc	5000	Nova Gorica 
00050000-56a8-a268-9ab6-9dc400e339bb	5001	Nova Gorica - poštni predali
00050000-56a8-a268-0efa-fdbfa1e9cee8	1385	Nova vas
00050000-56a8-a268-e5e6-eedea6b7d8be	8000	Novo mesto
00050000-56a8-a268-9e95-9254ca5d368e	8001	Novo mesto - poštni predali
00050000-56a8-a268-7dbf-500326a95cfe	6243	Obrov
00050000-56a8-a268-f32a-dee8aa5fa5ba	9233	Odranci
00050000-56a8-a268-5ebd-ec23de8c9964	2317	Oplotnica
00050000-56a8-a268-2ba5-551ca26d5637	2312	Orehova vas
00050000-56a8-a268-b13b-30f8fa7dce4f	2270	Ormož
00050000-56a8-a268-a229-7a3ee9aaf490	1316	Ortnek
00050000-56a8-a268-7f1a-e98f7e82e398	1337	Osilnica
00050000-56a8-a268-e9d2-1152788d378d	8222	Otočec
00050000-56a8-a268-4352-8ba1e1124976	2361	Ožbalt
00050000-56a8-a268-1e48-3d4d95d5a76e	2231	Pernica
00050000-56a8-a268-5768-b23b2412f178	2211	Pesnica pri Mariboru
00050000-56a8-a268-0f8e-eff518bffc62	9203	Petrovci
00050000-56a8-a268-421b-f0cdbcf8e29d	3301	Petrovče
00050000-56a8-a268-f90b-8f35eb65f96f	6330	Piran/Pirano
00050000-56a8-a268-339d-c93276c5d3f5	8255	Pišece
00050000-56a8-a268-e12a-5469444fe145	6257	Pivka
00050000-56a8-a268-8344-baca5ee5afca	6232	Planina
00050000-56a8-a268-3ea1-b035a77b980a	3225	Planina pri Sevnici
00050000-56a8-a268-5224-326d47e91f69	6276	Pobegi
00050000-56a8-a268-be99-8e23904f0d4b	8312	Podbočje
00050000-56a8-a268-efd1-0f25a16a3820	5243	Podbrdo
00050000-56a8-a268-8454-34daf9610c62	3254	Podčetrtek
00050000-56a8-a268-6b8c-b1a047d68eec	2273	Podgorci
00050000-56a8-a268-5c67-8c52c76b7e67	6216	Podgorje
00050000-56a8-a268-9b76-28971c3fb341	2381	Podgorje pri Slovenj Gradcu
00050000-56a8-a268-7a25-46e941a2999a	6244	Podgrad
00050000-56a8-a268-fa07-79ebcb2f5e37	1414	Podkum
00050000-56a8-a268-d850-7aa08c244170	2286	Podlehnik
00050000-56a8-a268-4615-d7d39cecfeee	5272	Podnanos
00050000-56a8-a268-0ffa-d8f5ebba19ea	4244	Podnart
00050000-56a8-a268-1751-93ed61e49bbf	3241	Podplat
00050000-56a8-a268-1150-9e7c79fb5a84	3257	Podsreda
00050000-56a8-a268-4ba0-1b21b32a6dde	2363	Podvelka
00050000-56a8-a268-d14a-597344b072c7	2208	Pohorje
00050000-56a8-a268-bca9-95a046774185	2257	Polenšak
00050000-56a8-a268-44c0-cd6ec665bef3	1355	Polhov Gradec
00050000-56a8-a268-0f03-8c1b3fb9853d	4223	Poljane nad Škofjo Loko
00050000-56a8-a268-62a9-3477add91a82	2319	Poljčane
00050000-56a8-a268-1d42-54226e62fcdc	1272	Polšnik
00050000-56a8-a268-9f9c-19bb3ffba8a2	3313	Polzela
00050000-56a8-a268-0372-08250c15f3b2	3232	Ponikva
00050000-56a8-a268-049c-ae80b526bd57	6320	Portorož/Portorose
00050000-56a8-a268-e8f8-b70fb3de143e	6230	Postojna
00050000-56a8-a268-3426-b0324e2cdb52	2331	Pragersko
00050000-56a8-a268-a914-2397cfd1b1d6	3312	Prebold
00050000-56a8-a268-0b2d-e4b0b1eed2b6	4205	Preddvor
00050000-56a8-a268-a50a-a62274e7bc3b	6255	Prem
00050000-56a8-a268-e22b-a476425de499	1352	Preserje
00050000-56a8-a268-f516-81068a122550	6258	Prestranek
00050000-56a8-a268-5b84-24e3a123d933	2391	Prevalje
00050000-56a8-a268-d32a-86d7b24966e7	3262	Prevorje
00050000-56a8-a268-6c5b-48c246ea3f89	1276	Primskovo 
00050000-56a8-a268-74b1-605a8e82a86c	3253	Pristava pri Mestinju
00050000-56a8-a268-5203-efcdf173edea	9207	Prosenjakovci/Partosfalva
00050000-56a8-a268-7f8f-0a63cb064231	5297	Prvačina
00050000-56a8-a268-13ef-f9701b3df256	2250	Ptuj
00050000-56a8-a268-cf2e-51789f9b69a4	2323	Ptujska Gora
00050000-56a8-a268-b25d-775bef6c6929	9201	Puconci
00050000-56a8-a268-b47b-f4fa3830aef5	2327	Rače
00050000-56a8-a268-d1b1-c80494afa944	1433	Radeče
00050000-56a8-a268-bb07-7394bbacea9b	9252	Radenci
00050000-56a8-a268-66de-cbcaaf4eee90	2360	Radlje ob Dravi
00050000-56a8-a268-1149-4b638a1c2ab6	1235	Radomlje
00050000-56a8-a268-7ec3-a0722c94f58a	4240	Radovljica
00050000-56a8-a268-1c1e-0fe694f73e05	8274	Raka
00050000-56a8-a268-f129-6594e2d38c9a	1381	Rakek
00050000-56a8-a268-9984-be4ad54651b2	4283	Rateče - Planica
00050000-56a8-a268-228e-c11ebf4d140b	2390	Ravne na Koroškem
00050000-56a8-a268-29c0-f02023678b13	9246	Razkrižje
00050000-56a8-a268-6d85-3adbed30d63b	3332	Rečica ob Savinji
00050000-56a8-a268-a9ee-8d33a2a82dbd	5292	Renče
00050000-56a8-a268-397f-8ea5cda96c84	1310	Ribnica
00050000-56a8-a268-5fdc-01e4d3e23e5c	2364	Ribnica na Pohorju
00050000-56a8-a268-c439-dd450b606a91	3272	Rimske Toplice
00050000-56a8-a268-1c76-c28d181fec86	1314	Rob
00050000-56a8-a268-5110-37b7995d1911	5215	Ročinj
00050000-56a8-a268-ae7a-8c25fa091258	3250	Rogaška Slatina
00050000-56a8-a268-af3b-21b8bb91ba39	9262	Rogašovci
00050000-56a8-a268-487f-44e0e4058cc9	3252	Rogatec
00050000-56a8-a268-4586-e7f330572d2e	1373	Rovte
00050000-56a8-a268-eeda-cccebf921cee	2342	Ruše
00050000-56a8-a268-6225-a43492ec07fe	1282	Sava
00050000-56a8-a268-a5e6-f9cac22ce5c0	6333	Sečovlje/Sicciole
00050000-56a8-a268-d820-7e8a1895aefb	4227	Selca
00050000-56a8-a268-9e69-e5da498b5d17	2352	Selnica ob Dravi
00050000-56a8-a268-1fcd-90eda355f39b	8333	Semič
00050000-56a8-a268-0cce-9c0f397f1489	8281	Senovo
00050000-56a8-a268-d099-395e9fb884b8	6224	Senožeče
00050000-56a8-a268-d30f-911ad05152be	8290	Sevnica
00050000-56a8-a268-2f8d-9498352938ba	6210	Sežana
00050000-56a8-a268-67bf-42d7fed4aa90	2214	Sladki Vrh
00050000-56a8-a268-e0f1-524ea9768edc	5283	Slap ob Idrijci
00050000-56a8-a268-458b-79a06b55ebd0	2380	Slovenj Gradec
00050000-56a8-a268-8b84-5273f73c9326	2310	Slovenska Bistrica
00050000-56a8-a268-f980-334edf6a4db4	3210	Slovenske Konjice
00050000-56a8-a268-09e1-e6e0e7e1ba66	1216	Smlednik
00050000-56a8-a268-9285-c5ee0c67eb6c	5232	Soča
00050000-56a8-a268-ec8b-3e16b6f27ce2	1317	Sodražica
00050000-56a8-a268-2ebc-cdb4565db017	3335	Solčava
00050000-56a8-a268-e65d-e16803932bc1	5250	Solkan
00050000-56a8-a268-3803-4c562a363df1	4229	Sorica
00050000-56a8-a268-f60c-fd0c08bc747a	4225	Sovodenj
00050000-56a8-a268-7fd3-de97daa2dfcd	5281	Spodnja Idrija
00050000-56a8-a268-ce49-ae6926d19bfe	2241	Spodnji Duplek
00050000-56a8-a268-3491-5ba5c5531c8b	9245	Spodnji Ivanjci
00050000-56a8-a268-9ca3-436daf983a8d	2277	Središče ob Dravi
00050000-56a8-a268-a37e-9f9b6abb66f4	4267	Srednja vas v Bohinju
00050000-56a8-a268-77f9-7348a45853a6	8256	Sromlje 
00050000-56a8-a268-1162-24b470ce939d	5224	Srpenica
00050000-56a8-a268-1858-d0d1a0ffa8ff	1242	Stahovica
00050000-56a8-a268-059c-74ee48d08701	1332	Stara Cerkev
00050000-56a8-a268-9c0a-0ede0c1fc031	8342	Stari trg ob Kolpi
00050000-56a8-a268-d192-e1654882dded	1386	Stari trg pri Ložu
00050000-56a8-a268-6b00-70f10a32526b	2205	Starše
00050000-56a8-a268-9dfb-b6a65a9f0f06	2289	Stoperce
00050000-56a8-a268-05ef-b2429cd92cd2	8322	Stopiče
00050000-56a8-a268-8a62-2d31784bd189	3206	Stranice
00050000-56a8-a268-1094-1321e7805c9a	8351	Straža
00050000-56a8-a268-d2d9-e9541b940b2f	1313	Struge
00050000-56a8-a268-5e45-3341c226a348	8293	Studenec
00050000-56a8-a268-0be2-363b0ae3c907	8331	Suhor
00050000-56a8-a268-c0e8-b6d4e582c96f	2233	Sv. Ana v Slovenskih goricah
00050000-56a8-a268-80c4-06cd2b62a6b7	2235	Sv. Trojica v Slovenskih goricah
00050000-56a8-a268-afd2-b1708984e9d6	2353	Sveti Duh na Ostrem Vrhu
00050000-56a8-a268-288f-cec145086abb	9244	Sveti Jurij ob Ščavnici
00050000-56a8-a268-ffd5-fb79edd97c85	3264	Sveti Štefan
00050000-56a8-a268-ca1d-25dd3f01f4d9	2258	Sveti Tomaž
00050000-56a8-a268-eef9-e08d83541dd4	9204	Šalovci
00050000-56a8-a268-500b-dada72c4b924	5261	Šempas
00050000-56a8-a268-d939-dc2804660192	5290	Šempeter pri Gorici
00050000-56a8-a268-1167-2a771c53452f	3311	Šempeter v Savinjski dolini
00050000-56a8-a268-cea4-0eae7da6b399	4208	Šenčur
00050000-56a8-a268-2141-c341539d2d54	2212	Šentilj v Slovenskih goricah
00050000-56a8-a268-0eb0-b2e327b13969	8297	Šentjanž
00050000-56a8-a268-acf6-0aa58f88e3cd	2373	Šentjanž pri Dravogradu
00050000-56a8-a268-09c8-aec35cdd2cf0	8310	Šentjernej
00050000-56a8-a268-2ce4-23c5f60572cc	3230	Šentjur
00050000-56a8-a268-6527-c0098e9e21bb	3271	Šentrupert
00050000-56a8-a268-1013-9cfbc8033d02	8232	Šentrupert
00050000-56a8-a268-6ef3-1dd24ce7badb	1296	Šentvid pri Stični
00050000-56a8-a268-a04d-496b638ee11c	8275	Škocjan
00050000-56a8-a268-eeac-93e2f6fcb07d	6281	Škofije
00050000-56a8-a268-3f35-a25c3a6799ce	4220	Škofja Loka
00050000-56a8-a268-47ec-12c7927e97a2	3211	Škofja vas
00050000-56a8-a268-4af4-80c46e7a59f7	1291	Škofljica
00050000-56a8-a268-ae08-de14ed2e004a	6274	Šmarje
00050000-56a8-a268-a677-8e7dd595221c	1293	Šmarje - Sap
00050000-56a8-a268-447e-7e88a462ea8a	3240	Šmarje pri Jelšah
00050000-56a8-a268-cf4a-39e3313d009c	8220	Šmarješke Toplice
00050000-56a8-a268-e9f7-3686212af791	2315	Šmartno na Pohorju
00050000-56a8-a268-2f5c-453917881bc8	3341	Šmartno ob Dreti
00050000-56a8-a268-d8a9-c9dea9bdb05c	3327	Šmartno ob Paki
00050000-56a8-a268-74e8-10d922f6b9e6	1275	Šmartno pri Litiji
00050000-56a8-a268-63c9-5b4741b616af	2383	Šmartno pri Slovenj Gradcu
00050000-56a8-a268-3006-59059d3ffe62	3201	Šmartno v Rožni dolini
00050000-56a8-a268-7e77-052d01372b59	3325	Šoštanj
00050000-56a8-a268-355c-97c54df19665	6222	Štanjel
00050000-56a8-a268-2ec9-810a489ffc9d	3220	Štore
00050000-56a8-a268-e8f5-c7ca7b7a9c4f	3304	Tabor
00050000-56a8-a268-cd66-a289bc4a8db2	3221	Teharje
00050000-56a8-a268-dd39-da64d0150e5f	9251	Tišina
00050000-56a8-a268-9374-b3a5329287e8	5220	Tolmin
00050000-56a8-a268-5ccb-dbace429cba8	3326	Topolšica
00050000-56a8-a268-7ee2-97a35b67e620	2371	Trbonje
00050000-56a8-a268-c2dc-02216f951785	1420	Trbovlje
00050000-56a8-a268-d4ef-d1a158189ce5	8231	Trebelno 
00050000-56a8-a268-c0f8-c7b745bab175	8210	Trebnje
00050000-56a8-a268-d371-3884d4b9615e	5252	Trnovo pri Gorici
00050000-56a8-a268-b215-87c16f9b8d2d	2254	Trnovska vas
00050000-56a8-a268-4d79-0d56849f74ac	1222	Trojane
00050000-56a8-a268-146d-febb8a04fcb2	1236	Trzin
00050000-56a8-a268-870d-71aa4731f337	4290	Tržič
00050000-56a8-a268-4244-8e9cb24de20f	8295	Tržišče
00050000-56a8-a268-72c1-a5aaa585f20b	1311	Turjak
00050000-56a8-a268-c670-833da6b89360	9224	Turnišče
00050000-56a8-a268-4871-1889f38be13d	8323	Uršna sela
00050000-56a8-a268-fc7e-856b0b641b7c	1252	Vače
00050000-56a8-a268-a9cd-3121148f97e2	3320	Velenje 
00050000-56a8-a268-0915-d089505569a1	3322	Velenje - poštni predali
00050000-56a8-a268-e86e-2ca885f5933a	8212	Velika Loka
00050000-56a8-a268-0021-99b3079083ff	2274	Velika Nedelja
00050000-56a8-a268-2988-7bd27edd8077	9225	Velika Polana
00050000-56a8-a268-9dfa-b23616c4ba78	1315	Velike Lašče
00050000-56a8-a268-2301-82ed53afb960	8213	Veliki Gaber
00050000-56a8-a268-35c8-490fd66a4914	9241	Veržej
00050000-56a8-a268-9241-53bb5151de00	1312	Videm - Dobrepolje
00050000-56a8-a268-ac68-c937c9e3cfeb	2284	Videm pri Ptuju
00050000-56a8-a268-bd9e-301190a20c84	8344	Vinica
00050000-56a8-a268-3142-28f416bf8f3f	5271	Vipava
00050000-56a8-a268-8251-acf28aebc09c	4212	Visoko
00050000-56a8-a268-c68d-98efd4ae92ac	1294	Višnja Gora
00050000-56a8-a268-9cbb-5572cdd569cb	3205	Vitanje
00050000-56a8-a268-1dff-a3616f6ff7ab	2255	Vitomarci
00050000-56a8-a268-66b9-b56bc8865fd8	1217	Vodice
00050000-56a8-a268-03ec-cc32cfe57339	3212	Vojnik\t
00050000-56a8-a268-0360-53683deb4eba	5293	Volčja Draga
00050000-56a8-a268-bc0e-61627d7b7301	2232	Voličina
00050000-56a8-a268-e5a5-8e519dacef6a	3305	Vransko
00050000-56a8-a268-6deb-cba59ddeeb53	6217	Vremski Britof
00050000-56a8-a268-c1a2-99110db8f4cc	1360	Vrhnika
00050000-56a8-a268-3602-88adf0e9deb0	2365	Vuhred
00050000-56a8-a268-73ad-d1cc75b951bf	2367	Vuzenica
00050000-56a8-a268-7941-ce9229169117	8292	Zabukovje 
00050000-56a8-a268-cfc1-2c2007e73ba1	1410	Zagorje ob Savi
00050000-56a8-a268-0d00-27f2f53bc425	1303	Zagradec
00050000-56a8-a268-beff-7b6616d001cd	2283	Zavrč
00050000-56a8-a268-ead5-5386da3150b9	8272	Zdole 
00050000-56a8-a268-5ec8-30c0f21c2993	4201	Zgornja Besnica
00050000-56a8-a268-01d5-1c6a942cc7af	2242	Zgornja Korena
00050000-56a8-a268-bf00-7aa00362a238	2201	Zgornja Kungota
00050000-56a8-a268-8a15-cdfbe75d866d	2316	Zgornja Ložnica
00050000-56a8-a268-57aa-50cf3719fb60	2314	Zgornja Polskava
00050000-56a8-a268-57e6-0ea48d00ce33	2213	Zgornja Velka
00050000-56a8-a268-6cd5-56e692e6a54a	4247	Zgornje Gorje
00050000-56a8-a268-4143-a09a7ce4e3d6	4206	Zgornje Jezersko
00050000-56a8-a268-3056-b87c820c9c54	2285	Zgornji Leskovec
00050000-56a8-a268-9ec3-a017628a37f8	1432	Zidani Most
00050000-56a8-a268-5e89-39740bcd2487	3214	Zreče
00050000-56a8-a268-1ccf-a80023bb4ed2	4209	Žabnica
00050000-56a8-a268-1fd3-d0349c07134b	3310	Žalec
00050000-56a8-a268-81ab-c87a0280453a	4228	Železniki
00050000-56a8-a268-f272-0773781d126c	2287	Žetale
00050000-56a8-a268-5533-629de70a29ac	4226	Žiri
00050000-56a8-a268-1e34-28ea0bbc7849	4274	Žirovnica
00050000-56a8-a268-2ee0-529c35e630b1	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 40860463)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 40860033)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 40859773)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56a8-a26c-9e65-82e1a96a0a43	00080000-56a8-a26c-f0cb-12f0785f99f1	\N	00040000-56a8-a269-b45b-504c64072731	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56a8-a26c-d56f-60216ca3cb95	00080000-56a8-a26c-f0cb-12f0785f99f1	\N	00040000-56a8-a269-b45b-504c64072731	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56a8-a26c-4c9f-4516098e6b75	00080000-56a8-a26c-eb89-bfae57827627	\N	00040000-56a8-a269-b45b-504c64072731	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 40859909)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56a8-a269-2c19-6f3215d82957	novo leto	1	1	\N	t
00430000-56a8-a269-729a-d0854e346797	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56a8-a269-f8c9-31c11929f605	dan upora proti okupatorju	27	4	\N	t
00430000-56a8-a269-d10d-3b4f85657ccd	praznik dela	1	5	\N	t
00430000-56a8-a269-4445-a1db909ad38e	praznik dela	2	5	\N	t
00430000-56a8-a269-99e3-bb011c7181d8	dan Primoža Trubarja	8	6	\N	f
00430000-56a8-a269-4da1-d6cd6914ded0	dan državnosti	25	6	\N	t
00430000-56a8-a269-bb31-6c36a6986ff4	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56a8-a269-7e9e-24f9a5acb701	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56a8-a269-16ec-f4a6588007b3	dan suverenosti	25	10	\N	f
00430000-56a8-a269-100d-a7386cdf88e4	dan spomina na mrtve	1	11	\N	t
00430000-56a8-a269-f1f3-8680484f751f	dan Rudolfa Maistra	23	11	\N	f
00430000-56a8-a269-05a1-93620e5d4418	božič	25	12	\N	t
00430000-56a8-a269-2fa8-55721884730e	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56a8-a269-8404-11d5a6768dff	Marijino vnebovzetje	15	8	\N	t
00430000-56a8-a269-69a6-1ed10e6490b4	dan reformacije	31	10	\N	t
00430000-56a8-a269-6a7d-0deaa5209993	velikonočna nedelja	27	3	2016	t
00430000-56a8-a269-9d43-bdfb443f9e38	velikonočna nedelja	16	4	2017	t
00430000-56a8-a269-0023-825a4e14ecca	velikonočna nedelja	1	4	2018	t
00430000-56a8-a269-8567-8c080d8ce4d1	velikonočna nedelja	21	4	2019	t
00430000-56a8-a269-02f3-4f30e336827c	velikonočna nedelja	12	4	2020	t
00430000-56a8-a269-7801-0736a06949ee	velikonočna nedelja	4	4	2021	t
00430000-56a8-a269-ac7d-804c7441c756	velikonočna nedelja	17	4	2022	t
00430000-56a8-a269-26d0-2f8ae5501300	velikonočna nedelja	9	4	2023	t
00430000-56a8-a269-6a5e-56e7565fdd9f	velikonočna nedelja	31	3	2024	t
00430000-56a8-a269-e0a7-7afe3a6d81e2	velikonočna nedelja	20	4	2025	t
00430000-56a8-a269-153c-dbaa6052788e	velikonočna nedelja	5	4	2026	t
00430000-56a8-a269-e60e-11f80464bfbb	velikonočna nedelja	28	3	2027	t
00430000-56a8-a269-a537-637647934c42	velikonočna nedelja	16	4	2028	t
00430000-56a8-a269-3ae8-213f834faa6b	velikonočna nedelja	1	4	2029	t
00430000-56a8-a269-b27f-3689f8ef9764	velikonočna nedelja	21	4	2030	t
00430000-56a8-a269-0375-69defc4ea759	velikonočni ponedeljek	28	3	2016	t
00430000-56a8-a269-77d6-03dc2d553a3a	velikonočni ponedeljek	17	4	2017	t
00430000-56a8-a269-ffd2-8faf2979a1be	velikonočni ponedeljek	2	4	2018	t
00430000-56a8-a269-6d96-7b72e9d2c83b	velikonočni ponedeljek	22	4	2019	t
00430000-56a8-a269-d700-266c15f38e6f	velikonočni ponedeljek	13	4	2020	t
00430000-56a8-a269-3bdd-535f52c75e4b	velikonočni ponedeljek	5	4	2021	t
00430000-56a8-a269-2817-9ca2b5f72458	velikonočni ponedeljek	18	4	2022	t
00430000-56a8-a269-4c72-fd02d648b70a	velikonočni ponedeljek	10	4	2023	t
00430000-56a8-a269-806e-e1d75dd125b9	velikonočni ponedeljek	1	4	2024	t
00430000-56a8-a269-d26e-a220511d02af	velikonočni ponedeljek	21	4	2025	t
00430000-56a8-a269-a337-dd1af96f3659	velikonočni ponedeljek	6	4	2026	t
00430000-56a8-a269-c799-e8d41a0b0da4	velikonočni ponedeljek	29	3	2027	t
00430000-56a8-a269-2590-cf768bde0d69	velikonočni ponedeljek	17	4	2028	t
00430000-56a8-a269-0e67-c7d3f3c2cf30	velikonočni ponedeljek	2	4	2029	t
00430000-56a8-a269-27a6-4096c82d0d6e	velikonočni ponedeljek	22	4	2030	t
00430000-56a8-a269-8dff-dedcf8099b9e	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56a8-a269-4187-53e960266a5a	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56a8-a269-7a87-0bc54de42ec1	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56a8-a269-3d8e-2e851342320c	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56a8-a269-bba9-42d2476eec26	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56a8-a269-0d54-18176267cb34	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56a8-a269-c596-49ba1536a552	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56a8-a269-713e-13f4890a6fa5	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56a8-a269-e00b-a905c0956bb9	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56a8-a269-651a-c90dba39bbe1	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56a8-a269-7982-89c08096a78c	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56a8-a269-8e8c-a2a978922f57	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56a8-a269-53b1-8fbdf76af6a9	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56a8-a269-f551-51c5d5998fbc	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56a8-a269-6db9-46cb06691b45	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 40859877)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56a8-a26d-a73b-81cf678ecf75	000e0000-56a8-a26d-977f-dbaf389014c2	\N	1	1	\N
001b0000-56a8-a26d-d6f9-351aeaf1ecc1	000e0000-56a8-a26d-977f-dbaf389014c2	\N	1	2	\N
001b0000-56a8-a26d-64a5-a39597aecbfb	000e0000-56a8-a26d-977f-dbaf389014c2	\N	1	3	1
001b0000-56a8-a26d-54a9-f7ce3534d67b	000e0000-56a8-a26d-977f-dbaf389014c2	\N	2	4	2
001b0000-56a8-a26d-0a74-701f467213af	000e0000-56a8-a26d-977f-dbaf389014c2	\N	4	5	3
001b0000-56a8-a26d-089e-082efd86382a	000e0000-56a8-a26d-1bc3-c7f14ffc2d5a	\N	1	1	\N
001b0000-56a8-a26d-d082-f211f90e9d73	000e0000-56a8-a26d-1bc3-c7f14ffc2d5a	\N	3	2	1
001b0000-56a8-a26d-e835-280a0dd03409	000e0000-56a8-a26d-977f-dbaf389014c2	\N	1	6	1
001b0000-56a8-a26d-56e9-3e14dbcdd697	000e0000-56a8-a26d-977f-dbaf389014c2	\N	3	7	2
001b0000-56a8-a26d-9e26-89498ba3ea27	000e0000-56a8-a26d-1bc3-c7f14ffc2d5a	\N	2	3	1
001b0000-56a8-a26d-44d0-a04483822af5	000e0000-56a8-a26d-977f-dbaf389014c2	\N	2	9	1
001b0000-56a8-a26d-b310-dfd0f51b7840	000e0000-56a8-a26d-1bc3-c7f14ffc2d5a	\N	4	4	2
001b0000-56a8-a26d-5c64-5c3b6466e86f	000e0000-56a8-a26d-977f-dbaf389014c2	\N	5	8	3
001b0000-56a8-a26d-4925-dad615973dd2	000e0000-56a8-a26d-1bc3-c7f14ffc2d5a	\N	1	5	1
\.


--
-- TOC entry 3161 (class 0 OID 40859884)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56a8-a26d-64a5-a39597aecbfb	000a0000-56a8-a26c-614c-f52ec0d333ab
001b0000-56a8-a26d-64a5-a39597aecbfb	000a0000-56a8-a26c-4bdb-bf993d7b4ee4
001b0000-56a8-a26d-54a9-f7ce3534d67b	000a0000-56a8-a26c-4bdb-bf993d7b4ee4
001b0000-56a8-a26d-54a9-f7ce3534d67b	000a0000-56a8-a26c-490e-f8fc285da264
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 40860045)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 40860477)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 40860487)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56a8-a26c-09fe-ac954cc2034c	00080000-56a8-a26c-744e-5762c807700c	0987	AK
00190000-56a8-a26c-8c37-1f6e37a0c772	00080000-56a8-a26c-eb89-bfae57827627	0989	AK
00190000-56a8-a26c-c243-89c0444fd87e	00080000-56a8-a26c-7646-e1374857e1d2	0986	AK
00190000-56a8-a26c-959e-79a695afde1a	00080000-56a8-a26c-6fd1-eaa59b1e16ea	0984	AK
00190000-56a8-a26c-bacb-3be70204e986	00080000-56a8-a26c-1310-3dfffdaa7f16	0983	AK
00190000-56a8-a26c-7d3d-a00463290c9c	00080000-56a8-a26c-86e6-31600fe2a997	0982	AK
00190000-56a8-a26f-5a9b-1b3026202922	00080000-56a8-a26f-cbf3-2039157394c0	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 40860376)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56a8-a26d-9c12-40aaf4e5afa5	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 40860495)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 40860073)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56a8-a26c-5afe-8a10b1a4f74d	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56a8-a26c-9b06-376a1e278875	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56a8-a26c-d6ba-932daa0d3c07	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56a8-a26c-0904-820a6904ef4d	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56a8-a26c-59d4-90bc5643beb4	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56a8-a26c-64d5-4f0da2f333fb	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56a8-a26c-4f17-549d20c035cf	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 40860018)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 40860008)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 40860215)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 40860145)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 40859851)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 40859612)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56a8-a26f-cbf3-2039157394c0	00010000-56a8-a26a-873d-ce3de89cfeb7	2016-01-27 11:56:47	INS	a:0:{}
2	App\\Entity\\Option	00000000-56a8-a26f-018b-e8b7e6f449fe	00010000-56a8-a26a-873d-ce3de89cfeb7	2016-01-27 11:56:47	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56a8-a26f-5a9b-1b3026202922	00010000-56a8-a26a-873d-ce3de89cfeb7	2016-01-27 11:56:47	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 40860087)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 40859650)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56a8-a269-8911-d493133bd825	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56a8-a269-0047-bc22b2936d50	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56a8-a269-19e4-fcf4394a21c0	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56a8-a269-db17-e7cb007b800f	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56a8-a269-14cd-37dfbc448692	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56a8-a269-e7bc-9ebfb4e4447c	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56a8-a269-190d-15061df12c48	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56a8-a269-3a35-5db75e78c854	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56a8-a269-f6ea-5f49d396882b	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a8-a269-444d-e42d95dba4ee	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a8-a269-9ae5-ca877e7fd0ed	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a8-a269-c33f-efb297367074	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a8-a269-0a3d-0d6533579607	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a8-a269-b3a1-6ad45f442daa	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a8-a269-9f35-a06e8391c672	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a8-a269-bc70-b9e500d1f3f4	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a8-a269-8daf-0902ecd5bf41	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56a8-a269-9e38-e45ea3f46d4b	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56a8-a269-7360-a30945d5529d	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56a8-a269-58b5-b601c92d20d8	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56a8-a269-bcbc-7c81ff331cdd	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a8-a269-cb08-add6dd2e4911	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a8-a269-ba99-fc2fc7dc0d62	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a8-a269-5117-c04776749b76	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a8-a269-e879-1b10757a7ffb	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56a8-a269-3759-cef9ec7b812b	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56a8-a269-c2f3-240fc1691d58	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56a8-a269-ffc4-610f7d98664b	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56a8-a269-41f7-7fae33dfcb32	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56a8-a269-d248-741ed63bd367	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56a8-a26a-b305-8769698fb199	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56a8-a26a-e267-160135644f3b	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56a8-a26a-d7ea-5557b10411e8	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56a8-a26a-e882-98a2bbaa6313	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56a8-a26a-f8d6-4772f29c5c7f	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56a8-a26a-83bd-21c9b84c8150	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56a8-a26a-10ec-c38afe7c8c2f	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56a8-a26a-97d3-c75dd4bde8de	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56a8-a26a-6c44-a5991a431fdb	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56a8-a26a-1a94-12bb0376e8e2	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56a8-a26a-3835-c91432c262a9	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56a8-a26a-97f7-163eab899220	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56a8-a26a-cc84-eda5c2366145	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a8-a26a-ea40-596c006677c2	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a8-a26a-4c46-4e1d5acc8bae	direktor	minimalne pravice za direktorja	t
00020000-56a8-a26a-ec63-1022a47695c2	arhivar	arhivar	t
00020000-56a8-a26a-dd9e-695d1b8f32d6	dramaturg	dramaturg	t
00020000-56a8-a26a-11a4-de44382b02eb	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56a8-a26a-cab8-53589f0ca21a	poslovni-sekretar	poslovni sekretar	t
00020000-56a8-a26a-f226-9d6859d91091	vodja-tehnike	vodja tehnike	t
00020000-56a8-a26a-490e-9bd631efbf2f	racunovodja	računovodja	t
00020000-56a8-a26c-fcf6-f55e95949cac	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56a8-a26c-5992-263049b17a43	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-4f9c-2106134f69aa	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-155a-a475ad792cc5	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-aa77-91cb796965f5	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-aeb3-40e4a4dd5afd	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-c841-f461efb4a8c3	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-e722-a1d45e90ed7e	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-2a62-3264eec2efd8	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-81f6-6e32557ba9b7	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-9a9c-6e5bba959e5c	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-bf73-e71e69f46cb9	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-8f57-849083d6f5be	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-5ad4-1c7bdfbc20b4	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-78c7-f5816f112679	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-0676-90921b187573	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-be1d-3fc847cce081	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-430a-80f0a223552f	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-cc89-3749a41a821f	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-a568-0834cdf47e27	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56a8-a26c-fc9f-10994065cf1d	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-d2b4-10ab30e89027	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-566b-d0d123f2e1f0	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-44bb-7829ce97c481	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-3aac-f7678636d774	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-009a-888c46c6feee	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-b2eb-11f4afcb00d7	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-0d1c-daf153889ce9	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-8a5c-80bde1119e60	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-7384-33c489d900c0	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-223f-7735a27cabb3	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-c7ca-f7f1dcf1654f	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-fd3a-8ddd781afa2d	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-0aeb-13c4f6cda771	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-3235-1c338ddac093	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-8c3a-f4fc07834579	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-55b7-55b654d95295	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-6fbb-4ca1f3d9c0f3	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56a8-a26c-2a2f-648a0b128190	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 40859634)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56a8-a26a-9fcf-3e58acbd6016	00020000-56a8-a269-19e4-fcf4394a21c0
00010000-56a8-a26a-873d-ce3de89cfeb7	00020000-56a8-a269-19e4-fcf4394a21c0
00010000-56a8-a26c-5ed5-73b9231b78ad	00020000-56a8-a26c-fcf6-f55e95949cac
00010000-56a8-a26c-a6ed-c706a4c07569	00020000-56a8-a26c-5992-263049b17a43
00010000-56a8-a26c-a6ed-c706a4c07569	00020000-56a8-a26c-aeb3-40e4a4dd5afd
00010000-56a8-a26c-a6ed-c706a4c07569	00020000-56a8-a26c-81f6-6e32557ba9b7
00010000-56a8-a26c-a6ed-c706a4c07569	00020000-56a8-a26c-bf73-e71e69f46cb9
00010000-56a8-a26c-a6ed-c706a4c07569	00020000-56a8-a26c-5ad4-1c7bdfbc20b4
00010000-56a8-a26c-a6ed-c706a4c07569	00020000-56a8-a26c-cc89-3749a41a821f
00010000-56a8-a26c-a6ed-c706a4c07569	00020000-56a8-a26c-155a-a475ad792cc5
00010000-56a8-a26c-a6ed-c706a4c07569	00020000-56a8-a26c-fc9f-10994065cf1d
00010000-56a8-a26c-a6ed-c706a4c07569	00020000-56a8-a26c-44bb-7829ce97c481
00010000-56a8-a26c-a6ed-c706a4c07569	00020000-56a8-a26c-009a-888c46c6feee
00010000-56a8-a26c-a6ed-c706a4c07569	00020000-56a8-a26c-0d1c-daf153889ce9
00010000-56a8-a26c-a6ed-c706a4c07569	00020000-56a8-a26c-7384-33c489d900c0
00010000-56a8-a26c-a6ed-c706a4c07569	00020000-56a8-a26c-0aeb-13c4f6cda771
00010000-56a8-a26c-2727-f961c7aef4a4	00020000-56a8-a26c-5992-263049b17a43
00010000-56a8-a26c-2727-f961c7aef4a4	00020000-56a8-a26c-4f9c-2106134f69aa
00010000-56a8-a26c-2727-f961c7aef4a4	00020000-56a8-a26c-155a-a475ad792cc5
00010000-56a8-a26c-2727-f961c7aef4a4	00020000-56a8-a26c-aa77-91cb796965f5
00010000-56a8-a26c-2727-f961c7aef4a4	00020000-56a8-a26c-5ad4-1c7bdfbc20b4
00010000-56a8-a26c-2727-f961c7aef4a4	00020000-56a8-a26c-be1d-3fc847cce081
00010000-56a8-a26c-2727-f961c7aef4a4	00020000-56a8-a26c-fc9f-10994065cf1d
00010000-56a8-a26c-2727-f961c7aef4a4	00020000-56a8-a26c-44bb-7829ce97c481
00010000-56a8-a26c-2727-f961c7aef4a4	00020000-56a8-a26c-009a-888c46c6feee
00010000-56a8-a26c-2727-f961c7aef4a4	00020000-56a8-a26c-0d1c-daf153889ce9
00010000-56a8-a26c-2727-f961c7aef4a4	00020000-56a8-a26c-7384-33c489d900c0
00010000-56a8-a26c-2727-f961c7aef4a4	00020000-56a8-a26c-0aeb-13c4f6cda771
00010000-56a8-a26c-f835-d45373a569e2	00020000-56a8-a26c-5992-263049b17a43
00010000-56a8-a26c-f835-d45373a569e2	00020000-56a8-a26c-4f9c-2106134f69aa
00010000-56a8-a26c-f835-d45373a569e2	00020000-56a8-a26c-155a-a475ad792cc5
00010000-56a8-a26c-f835-d45373a569e2	00020000-56a8-a26c-aa77-91cb796965f5
00010000-56a8-a26c-f835-d45373a569e2	00020000-56a8-a26c-bf73-e71e69f46cb9
00010000-56a8-a26c-f835-d45373a569e2	00020000-56a8-a26c-5ad4-1c7bdfbc20b4
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-4f9c-2106134f69aa
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-c841-f461efb4a8c3
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-9a9c-6e5bba959e5c
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-8f57-849083d6f5be
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-bf73-e71e69f46cb9
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-430a-80f0a223552f
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-5ad4-1c7bdfbc20b4
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-78c7-f5816f112679
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-fc9f-10994065cf1d
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-d2b4-10ab30e89027
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-44bb-7829ce97c481
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-3aac-f7678636d774
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-009a-888c46c6feee
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-b2eb-11f4afcb00d7
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-0d1c-daf153889ce9
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-8a5c-80bde1119e60
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-7384-33c489d900c0
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-223f-7735a27cabb3
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-0aeb-13c4f6cda771
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-3235-1c338ddac093
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-55b7-55b654d95295
00010000-56a8-a26c-76ee-a77368e03ea1	00020000-56a8-a26c-6fbb-4ca1f3d9c0f3
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-4f9c-2106134f69aa
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-c841-f461efb4a8c3
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-2a62-3264eec2efd8
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-9a9c-6e5bba959e5c
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-8f57-849083d6f5be
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-bf73-e71e69f46cb9
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-430a-80f0a223552f
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-5ad4-1c7bdfbc20b4
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-78c7-f5816f112679
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-0676-90921b187573
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-fc9f-10994065cf1d
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-d2b4-10ab30e89027
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-566b-d0d123f2e1f0
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-44bb-7829ce97c481
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-3aac-f7678636d774
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-009a-888c46c6feee
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-b2eb-11f4afcb00d7
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-0d1c-daf153889ce9
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-8a5c-80bde1119e60
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-7384-33c489d900c0
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-223f-7735a27cabb3
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-0aeb-13c4f6cda771
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-3235-1c338ddac093
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-8c3a-f4fc07834579
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-55b7-55b654d95295
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-6fbb-4ca1f3d9c0f3
00010000-56a8-a26c-06b4-e6759c6fffbd	00020000-56a8-a26c-2a2f-648a0b128190
00010000-56a8-a26c-cdaf-692cbcbc40aa	00020000-56a8-a26c-4f9c-2106134f69aa
00010000-56a8-a26c-cdaf-692cbcbc40aa	00020000-56a8-a26c-155a-a475ad792cc5
00010000-56a8-a26c-cdaf-692cbcbc40aa	00020000-56a8-a26c-c841-f461efb4a8c3
00010000-56a8-a26c-cdaf-692cbcbc40aa	00020000-56a8-a26c-e722-a1d45e90ed7e
00010000-56a8-a26c-cdaf-692cbcbc40aa	00020000-56a8-a26c-2a62-3264eec2efd8
00010000-56a8-a26c-cdaf-692cbcbc40aa	00020000-56a8-a26c-aeb3-40e4a4dd5afd
00010000-56a8-a26c-cdaf-692cbcbc40aa	00020000-56a8-a26c-9a9c-6e5bba959e5c
00010000-56a8-a26c-cdaf-692cbcbc40aa	00020000-56a8-a26c-8f57-849083d6f5be
00010000-56a8-a26c-cdaf-692cbcbc40aa	00020000-56a8-a26c-bf73-e71e69f46cb9
00010000-56a8-a26c-cdaf-692cbcbc40aa	00020000-56a8-a26c-430a-80f0a223552f
00010000-56a8-a26c-d1dd-dbcab390f2d7	00020000-56a8-a26c-5992-263049b17a43
00010000-56a8-a26c-d1dd-dbcab390f2d7	00020000-56a8-a26c-aa77-91cb796965f5
00010000-56a8-a26c-d1dd-dbcab390f2d7	00020000-56a8-a26c-aeb3-40e4a4dd5afd
00010000-56a8-a26c-d1dd-dbcab390f2d7	00020000-56a8-a26c-81f6-6e32557ba9b7
00010000-56a8-a26c-d1dd-dbcab390f2d7	00020000-56a8-a26c-bf73-e71e69f46cb9
00010000-56a8-a26c-d1dd-dbcab390f2d7	00020000-56a8-a26c-5ad4-1c7bdfbc20b4
00010000-56a8-a26c-d1dd-dbcab390f2d7	00020000-56a8-a26c-cc89-3749a41a821f
00010000-56a8-a26c-d1dd-dbcab390f2d7	00020000-56a8-a26c-c7ca-f7f1dcf1654f
00010000-56a8-a26c-f6cd-1bdc6a066feb	00020000-56a8-a26c-a568-0834cdf47e27
00010000-56a8-a26c-4b44-d28d744daf87	00020000-56a8-a26a-4c46-4e1d5acc8bae
00010000-56a8-a26c-db2f-4b1f4012c879	00020000-56a8-a26a-ec63-1022a47695c2
00010000-56a8-a26c-9d0c-e64696999246	00020000-56a8-a26a-dd9e-695d1b8f32d6
00010000-56a8-a26c-ddc1-75abc0b6e04c	00020000-56a8-a26a-11a4-de44382b02eb
00010000-56a8-a26c-15ba-c3bc3eebfaa8	00020000-56a8-a26a-cab8-53589f0ca21a
00010000-56a8-a26c-b81d-17c29b01754e	00020000-56a8-a26a-f226-9d6859d91091
00010000-56a8-a26c-9109-185b942e96be	00020000-56a8-a26a-490e-9bd631efbf2f
\.


--
-- TOC entry 3186 (class 0 OID 40860101)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 40860039)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 40859962)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56a8-a26c-a4e9-b32d94be0772	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56a8-a26c-ad5b-c0a3321c7022	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56a8-a26c-6660-0b96764c482f	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56a8-a26c-7f2b-b4345f9f8ef1	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 40859599)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56a8-a268-03a3-93029b4270d5	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56a8-a268-8527-c94ef1f6c51b	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56a8-a268-6a18-60966d1e2789	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56a8-a268-d22f-26c127f6e478	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56a8-a268-2e68-1ecdde14136f	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 40859591)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56a8-a268-06d2-a7ac0c2541e8	00230000-56a8-a268-d22f-26c127f6e478	popa
00240000-56a8-a268-e371-2ae9298b2083	00230000-56a8-a268-d22f-26c127f6e478	oseba
00240000-56a8-a268-34de-e27b52100cc3	00230000-56a8-a268-d22f-26c127f6e478	tippopa
00240000-56a8-a268-4415-67d3194b7be8	00230000-56a8-a268-d22f-26c127f6e478	organizacijskaenota
00240000-56a8-a268-0987-32a955151996	00230000-56a8-a268-d22f-26c127f6e478	sezona
00240000-56a8-a268-a21b-4a2fcd6ac2ef	00230000-56a8-a268-d22f-26c127f6e478	tipvaje
00240000-56a8-a268-4e74-28bdce683a43	00230000-56a8-a268-d22f-26c127f6e478	tipdodatka
00240000-56a8-a268-0a88-02f9673b5359	00230000-56a8-a268-8527-c94ef1f6c51b	prostor
00240000-56a8-a268-3110-0290d9c52907	00230000-56a8-a268-d22f-26c127f6e478	besedilo
00240000-56a8-a268-417a-33b5e4e824cb	00230000-56a8-a268-d22f-26c127f6e478	uprizoritev
00240000-56a8-a268-0464-c45b18527480	00230000-56a8-a268-d22f-26c127f6e478	funkcija
00240000-56a8-a268-4d21-539198c7778d	00230000-56a8-a268-d22f-26c127f6e478	tipfunkcije
00240000-56a8-a268-2324-3d2f8525f364	00230000-56a8-a268-d22f-26c127f6e478	alternacija
00240000-56a8-a268-dc8f-74effe76a368	00230000-56a8-a268-03a3-93029b4270d5	pogodba
00240000-56a8-a268-89f5-63f6ac3e2fbb	00230000-56a8-a268-d22f-26c127f6e478	zaposlitev
00240000-56a8-a268-8ad9-49c980e745e5	00230000-56a8-a268-d22f-26c127f6e478	zvrstuprizoritve
00240000-56a8-a268-c4b1-d392e54d90bd	00230000-56a8-a268-03a3-93029b4270d5	programdela
00240000-56a8-a268-c26d-5b63a450bb77	00230000-56a8-a268-d22f-26c127f6e478	zapis
\.


--
-- TOC entry 3133 (class 0 OID 40859586)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
dcca9417-9d6f-452f-9021-6e2b17ee194c	00240000-56a8-a268-06d2-a7ac0c2541e8	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 40860162)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56a8-a26d-76cf-139e48bf449e	000e0000-56a8-a26d-977f-dbaf389014c2	00080000-56a8-a26c-f0cb-12f0785f99f1	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56a8-a269-c74f-9b6c820e18d7
00270000-56a8-a26d-767b-58097a499ebf	000e0000-56a8-a26d-977f-dbaf389014c2	00080000-56a8-a26c-f0cb-12f0785f99f1	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56a8-a269-c74f-9b6c820e18d7
\.


--
-- TOC entry 3149 (class 0 OID 40859735)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 40859981)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56a8-a26e-3e12-77bbdff150b9	00180000-56a8-a26d-eb02-40532e9a6a40	000c0000-56a8-a26d-5a12-b29d46d7a292	00090000-56a8-a26d-1922-1059a52a7bc7	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a8-a26e-04c4-3c47752b0586	00180000-56a8-a26d-eb02-40532e9a6a40	000c0000-56a8-a26d-53c9-722001edf1ea	00090000-56a8-a26d-3ac1-8b45c0c1f05a	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a8-a26e-54dc-356e9deb6c14	00180000-56a8-a26d-eb02-40532e9a6a40	000c0000-56a8-a26d-254f-1fc7ef0a07a9	00090000-56a8-a26d-5cee-547006badcad	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a8-a26e-f77e-62ca9efdd09c	00180000-56a8-a26d-eb02-40532e9a6a40	000c0000-56a8-a26d-a2c4-e1bc70cb3fec	00090000-56a8-a26d-7663-65872595b20e	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a8-a26e-baab-4dbf6dae3c53	00180000-56a8-a26d-eb02-40532e9a6a40	000c0000-56a8-a26d-20dd-16ec7e4f251d	00090000-56a8-a26d-758d-8514a342bf6d	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a8-a26e-66c5-f440bdb0f088	00180000-56a8-a26d-6986-bf13ecae5bf4	\N	00090000-56a8-a26d-758d-8514a342bf6d	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56a8-a26e-a64d-13c204f22544	00180000-56a8-a26d-660f-e88c0eac2f90	\N	00090000-56a8-a26d-3ac1-8b45c0c1f05a	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56a8-a26e-f58a-abe6cb33eb8a	00180000-56a8-a26d-eb02-40532e9a6a40	\N	00090000-56a8-a26d-c50c-2acb04578662	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 40859998)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56a8-a268-d84c-7a0495f303ec	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56a8-a268-67b5-24b2d06d6ad2	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56a8-a268-9d8e-b4b66aa8f7e0	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56a8-a268-3128-6337da01380a	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56a8-a268-34b3-b8a1bedb5f18	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56a8-a268-dbdc-2b3d823caff8	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 40860203)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56a8-a268-037f-dbc545b69e0d	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56a8-a268-3a4c-814988f50317	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56a8-a268-861e-c91f9cb3ec0b	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56a8-a268-1bd7-2ec7d7157b26	04	Režija	Režija	Režija	umetnik	30
000f0000-56a8-a268-e5ba-3678d41c8769	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56a8-a268-3817-3de0691c190f	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56a8-a268-ae4a-5d89b339851e	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56a8-a268-1eaa-e669c53f78fb	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56a8-a268-62db-7eca2f26c8ff	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56a8-a268-f086-5d546efccdfa	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56a8-a268-478a-705c63bce81b	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56a8-a268-7a6e-9da5c90b9fe8	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56a8-a268-c2c4-4f7937daf65a	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56a8-a268-dd49-21b79eb090e6	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56a8-a268-0631-e24b2babcae2	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56a8-a268-26a0-a034375987a3	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56a8-a268-f54d-7e1ce443b2f5	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56a8-a268-58ef-792e4d5a64a5	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56a8-a268-5116-2177b01f05d7	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 40859686)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56a8-a26c-50a3-c3bba91d0d9d	0001	šola	osnovna ali srednja šola
00400000-56a8-a26c-6097-6a19b2fa9780	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56a8-a26c-06b9-82ca02d6df5c	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 40860507)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56a8-a268-d160-6fa90edb0206	01	Velika predstava	f	1.00	1.00
002b0000-56a8-a268-701b-884c9243b762	02	Mala predstava	f	0.50	0.50
002b0000-56a8-a268-0636-63d141cef7f1	03	Mala koprodukcija	t	0.40	1.00
002b0000-56a8-a268-017d-2ab2880fa2fc	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56a8-a268-6088-fc7a5c03c6f5	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 40859952)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56a8-a268-18cc-f1d1d37af47e	0001	prva vaja	prva vaja
00420000-56a8-a268-e277-ea3535ee2e24	0002	tehnična vaja	tehnična vaja
00420000-56a8-a268-4fcf-3353ba556656	0003	lučna vaja	lučna vaja
00420000-56a8-a268-a1f3-15609f99dc13	0004	kostumska vaja	kostumska vaja
00420000-56a8-a268-7e4a-43677df8f7dd	0005	foto vaja	foto vaja
00420000-56a8-a268-ddce-b0d1185a5760	0006	1. glavna vaja	1. glavna vaja
00420000-56a8-a268-0694-5fa7c17bb852	0007	2. glavna vaja	2. glavna vaja
00420000-56a8-a268-3c4c-fb3b5ecc96d5	0008	1. generalka	1. generalka
00420000-56a8-a268-a8e5-ea3e0796ea39	0009	2. generalka	2. generalka
00420000-56a8-a268-11f6-53aa2333b27d	0010	odprta generalka	odprta generalka
00420000-56a8-a268-347a-190036648cae	0011	obnovitvena vaja	obnovitvena vaja
00420000-56a8-a268-4a4a-bc2fd84a0038	0012	italijanka	krajša "obnovitvena" vaja
00420000-56a8-a268-6f4a-6665749b4bdb	0013	pevska vaja	pevska vaja
00420000-56a8-a268-3b6d-81b358a4f545	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56a8-a268-0f39-789b3a464b87	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56a8-a268-583e-f636894ca288	0016	orientacijska vaja	orientacijska vaja
00420000-56a8-a268-d0eb-ca6eab577481	0017	situacijska vaja	situacijska vaja
00420000-56a8-a268-40a7-bdfab0e6a947	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 40859808)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 40859621)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56a8-a26a-873d-ce3de89cfeb7	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRObmgc6gPqEDixDgp7LpgT5nPm.hpdh4O	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-43f5-786d4a800eb3	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-916b-314a6fa18870	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-2da9-fd4043e030b0	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-987e-33a3c0d32b39	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-8df8-dd67ea64fcd1	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-b6e7-883e1edf6886	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-b7a7-12a0e8c5b1f6	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-9da8-9212db03e854	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-bdca-fd9cb460ebd8	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-5ed5-73b9231b78ad	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-c66f-0ff47a9361e6	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-a6ed-c706a4c07569	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-2727-f961c7aef4a4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-f835-d45373a569e2	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-76ee-a77368e03ea1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-06b4-e6759c6fffbd	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-cdaf-692cbcbc40aa	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-d1dd-dbcab390f2d7	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-f6cd-1bdc6a066feb	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-4b44-d28d744daf87	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-db2f-4b1f4012c879	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-9d0c-e64696999246	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-ddc1-75abc0b6e04c	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-15ba-c3bc3eebfaa8	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-b81d-17c29b01754e	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56a8-a26c-9109-185b942e96be	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56a8-a26a-9fcf-3e58acbd6016	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 40860253)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56a8-a26d-1bc3-c7f14ffc2d5a	00160000-56a8-a26c-c625-277c98c53225	\N	00140000-56a8-a268-2aea-179cd09e4fca	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56a8-a26c-59d4-90bc5643beb4
000e0000-56a8-a26d-977f-dbaf389014c2	00160000-56a8-a26c-a91d-40607a4eef91	\N	00140000-56a8-a268-678a-4456c86f6503	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56a8-a26c-64d5-4f0da2f333fb
000e0000-56a8-a26d-721b-8392a4e7fd32	\N	\N	00140000-56a8-a268-678a-4456c86f6503	00190000-56a8-a26c-09fe-ac954cc2034c	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a8-a26c-59d4-90bc5643beb4
000e0000-56a8-a26d-c456-84118a57c4e4	\N	\N	00140000-56a8-a268-678a-4456c86f6503	00190000-56a8-a26c-09fe-ac954cc2034c	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a8-a26c-59d4-90bc5643beb4
000e0000-56a8-a26d-2ecc-2877ea27fbe9	\N	\N	00140000-56a8-a268-678a-4456c86f6503	00190000-56a8-a26c-09fe-ac954cc2034c	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-a26c-5afe-8a10b1a4f74d
000e0000-56a8-a26d-61aa-d7c03c0b8e0b	\N	\N	00140000-56a8-a268-678a-4456c86f6503	00190000-56a8-a26c-09fe-ac954cc2034c	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-a26c-5afe-8a10b1a4f74d
000e0000-56a8-a26d-6eaa-a82750549c6b	\N	\N	00140000-56a8-a268-577e-93fe0af0acba	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-a26c-5afe-8a10b1a4f74d
000e0000-56a8-a26d-7b7b-b0ec75b92bd7	\N	\N	00140000-56a8-a268-577e-93fe0af0acba	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-a26c-5afe-8a10b1a4f74d
000e0000-56a8-a26d-e198-84760db7453e	\N	\N	00140000-56a8-a268-577e-93fe0af0acba	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-a26c-5afe-8a10b1a4f74d
000e0000-56a8-a26d-926f-9837bff2f68c	\N	\N	00140000-56a8-a268-577e-93fe0af0acba	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-a26c-5afe-8a10b1a4f74d
000e0000-56a8-a26d-4e12-d03a62c9be31	\N	\N	00140000-56a8-a268-577e-93fe0af0acba	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-a26c-5afe-8a10b1a4f74d
000e0000-56a8-a26d-2332-310618b349ca	\N	\N	00140000-56a8-a268-577e-93fe0af0acba	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-a26c-5afe-8a10b1a4f74d
000e0000-56a8-a26d-e19c-f89816e618bf	\N	\N	00140000-56a8-a268-577e-93fe0af0acba	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-a26c-5afe-8a10b1a4f74d
000e0000-56a8-a26d-f944-28bb105c39e6	\N	\N	00140000-56a8-a268-577e-93fe0af0acba	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-a26c-5afe-8a10b1a4f74d
000e0000-56a8-a26d-3c7f-beaaea1280df	\N	\N	00140000-56a8-a268-577e-93fe0af0acba	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a8-a26c-5afe-8a10b1a4f74d
\.


--
-- TOC entry 3170 (class 0 OID 40859972)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 40859902)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56a8-a26d-41b6-e9c72793e97d	\N	000e0000-56a8-a26d-1bc3-c7f14ffc2d5a	1
00200000-56a8-a26d-53d6-9a3d5e274b8f	\N	000e0000-56a8-a26d-977f-dbaf389014c2	1
00200000-56a8-a26d-74ae-62be6c10c3d2	\N	000e0000-56a8-a26d-977f-dbaf389014c2	3
00200000-56a8-a26d-7be6-40d382824d22	\N	000e0000-56a8-a26d-977f-dbaf389014c2	4
00200000-56a8-a26d-4760-b0f7e366e2c7	\N	000e0000-56a8-a26d-977f-dbaf389014c2	2
00200000-56a8-a26d-c567-66700caff641	\N	000e0000-56a8-a26d-977f-dbaf389014c2	8
00200000-56a8-a26d-60b2-fa5edc0324e0	\N	000e0000-56a8-a26d-977f-dbaf389014c2	7
00200000-56a8-a26d-d4f7-98dce2e4def7	\N	000e0000-56a8-a26d-977f-dbaf389014c2	9
00200000-56a8-a26d-2f5a-642eacc3e658	\N	000e0000-56a8-a26d-977f-dbaf389014c2	6
00200000-56a8-a26d-93f1-634701e8e6e2	\N	000e0000-56a8-a26d-977f-dbaf389014c2	5
\.


--
-- TOC entry 3182 (class 0 OID 40860065)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 40860176)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56a8-a269-56e5-4f01b2198401	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56a8-a269-0e79-79d8aeace769	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56a8-a269-0b48-56f96926950f	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56a8-a269-9cee-7e77034db525	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56a8-a269-914c-8ef76a70f7c7	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56a8-a269-7844-5af629b0c861	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56a8-a269-746e-572c9696fe80	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56a8-a269-d1ab-6dfa8ed0fb64	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56a8-a269-c74f-9b6c820e18d7	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56a8-a269-d615-00654d3e7fbe	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56a8-a269-2f87-f3a3db6f3205	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56a8-a269-2686-9b0e45805339	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56a8-a269-03be-8d47a4f05bf5	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56a8-a269-43c3-f9c72f9bc6d3	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56a8-a269-5b31-430021e2e6d7	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56a8-a269-d39a-0d4a425a4289	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56a8-a269-1120-d5319b9e6975	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56a8-a269-3794-aeebe3fdfbc7	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56a8-a269-a74e-84cd03ba231b	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56a8-a269-e0f3-18fc5d0c375d	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56a8-a269-4acd-a749265ed9c4	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56a8-a269-1edd-a46c7d521475	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56a8-a269-5e14-59ba3056ea1a	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56a8-a269-9c49-d35b2be4043c	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56a8-a269-fc90-28ae3fdb8316	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56a8-a269-119b-1e35c5221fdf	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56a8-a269-f8b8-5a35b90ea648	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56a8-a269-4c5c-3a90c3b25a12	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 40860557)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 40860526)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 40860569)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 40860138)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56a8-a26d-1090-88c86f006ef5	00090000-56a8-a26d-3ac1-8b45c0c1f05a	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a8-a26d-f17f-1df631ef7314	00090000-56a8-a26d-5cee-547006badcad	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a8-a26d-c86a-fb05df6c4d2d	00090000-56a8-a26d-30da-cf8f3826df77	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a8-a26d-a89a-bb7b32b1876a	00090000-56a8-a26d-b408-604a5b1b5710	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a8-a26d-5cce-c421281c5ddd	00090000-56a8-a26d-3983-184806b4ae54	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a8-a26d-da77-ca5b69963337	00090000-56a8-a26d-7d55-b2f84ab76d7a	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 40860243)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56a8-a268-2aea-179cd09e4fca	01	Drama	drama (SURS 01)
00140000-56a8-a268-4cbd-6ed8cb906420	02	Opera	opera (SURS 02)
00140000-56a8-a268-a18c-53f6f5d0219a	03	Balet	balet (SURS 03)
00140000-56a8-a268-b2e9-4746ac1b4320	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56a8-a268-577e-93fe0af0acba	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56a8-a268-678a-4456c86f6503	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56a8-a268-280e-7d23ebf9be8d	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 40860128)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 40859685)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 40860301)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 40860292)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 40859675)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 40860159)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 40860201)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 40860610)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 40859995)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 40859931)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 40859946)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 40859951)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 40860524)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 40859834)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 40860370)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 40860124)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 40859900)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 40859872)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 40859848)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 40860031)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 40860587)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 40860594)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 40860618)
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
-- TOC entry 2766 (class 2606 OID 40860057)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 40859806)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 40859704)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 40859768)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 40859731)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 40859664)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 40859649)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 40860063)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 40860100)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 40860238)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 40859759)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 40859794)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 40860475)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 40860037)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 40859784)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 40859916)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 40859888)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2688 (class 2606 OID 40859881)
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
-- TOC entry 2764 (class 2606 OID 40860049)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 40860484)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 40860492)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 40860462)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 40860505)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 40860082)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 40860022)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 40860013)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 40860225)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 40860152)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 40859860)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 40859620)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 40860091)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 40859638)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 40859658)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 40860109)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 40860044)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 40859970)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 40859608)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 40859596)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 40859590)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 40860172)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 40859740)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 40859987)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 40860005)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 40860212)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 40859693)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 40860517)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 40859959)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 40859819)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 40859633)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 40860271)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 40859978)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 40859906)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 40860071)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 40860184)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 40860567)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 40860551)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 40860575)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 40860142)
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
-- TOC entry 2833 (class 2606 OID 40860251)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 40860136)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 1259 OID 40859940)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2705 (class 1259 OID 40859941)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2706 (class 1259 OID 40859939)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2707 (class 1259 OID 40859938)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2708 (class 1259 OID 40859937)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 40860173)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 40860174)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 40860175)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 40860589)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 40860588)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 40859761)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 40859762)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 40860064)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 40860555)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 40860554)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 40860556)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 40860553)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 40860552)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 40860050)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2696 (class 1259 OID 40859907)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2697 (class 1259 OID 40859908)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 40860125)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 40860127)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 40860126)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 40859850)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 40859849)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 40860506)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 40860240)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 40860241)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 40860242)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 40860576)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 40860276)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 40860273)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 40860277)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 40860275)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 40860274)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 40859821)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 40859820)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 40859734)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 40860092)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 40859665)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 40859666)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 40860112)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 40860111)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 40860110)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 40859771)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 40859770)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 40859772)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 40859882)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2686 (class 1259 OID 40859883)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2595 (class 1259 OID 40859598)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 40860017)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 40860015)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 40860014)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 40860016)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 40859639)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 40859640)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 40860072)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 40860611)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 40860161)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 40860160)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 40860619)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 40860620)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 40860038)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 40860153)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 40860154)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 40860375)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 40860374)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 40860371)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 40860372)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 40860373)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 40859786)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 40859785)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 40859787)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 40860086)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 40860085)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 40860485)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 40860486)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 40860305)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 40860306)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 40860303)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 40860304)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 40859996)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 40859997)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 40860143)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 40860144)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 40859979)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 40860026)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 40860025)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 40860023)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 40860024)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 40860293)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 40859861)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 40859875)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 40859874)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 40859873)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 40859876)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2695 (class 1259 OID 40859901)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2689 (class 1259 OID 40859889)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2690 (class 1259 OID 40859890)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 40860476)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 40860525)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 40860595)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 40860596)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 40859706)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 40859705)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 40859741)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 40859742)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 40859990)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 40859989)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 40859988)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 40859933)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 40859936)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 40859932)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 40859935)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 40859934)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 40859760)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 40859694)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 40859695)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 40859835)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 40859837)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 40859836)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 40859838)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 40860032)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 40860239)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 40860272)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 40860213)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 40860214)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 40859732)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 40859733)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 40860006)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 40860007)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 40860137)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 40859609)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 40859807)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 40859769)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 40859597)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 40860518)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 40860084)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 40860083)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 40859960)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 40859961)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 40860302)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 40859980)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 40859795)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 40860252)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 40860568)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 40860493)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 40860494)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 40860202)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 40859971)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 40859659)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 40860786)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 40860811)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 40860801)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 40860781)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2944 (class 2606 OID 40860796)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 40860806)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 40860791)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2985 (class 2606 OID 40860991)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 40860996)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2983 (class 2606 OID 40861001)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3016 (class 2606 OID 40861161)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 40861156)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 40860676)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 40860681)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 40860906)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3011 (class 2606 OID 40861141)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 40861136)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3010 (class 2606 OID 40861146)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 40861131)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3014 (class 2606 OID 40861126)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 40860901)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2940 (class 2606 OID 40860771)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2939 (class 2606 OID 40860776)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 40860946)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 40860956)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 40860951)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 40860731)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 40860726)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 40860891)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 40861116)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2988 (class 2606 OID 40861006)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 40861011)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2986 (class 2606 OID 40861016)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 40861151)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2990 (class 2606 OID 40861036)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2993 (class 2606 OID 40861021)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2989 (class 2606 OID 40861041)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 40861031)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2992 (class 2606 OID 40861026)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 40860721)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 40860716)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 40860661)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 40860656)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 40860926)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 40860636)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 40860641)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2971 (class 2606 OID 40860941)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 40860936)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2973 (class 2606 OID 40860931)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 40860691)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 40860686)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 40860696)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2935 (class 2606 OID 40860746)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2934 (class 2606 OID 40860751)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2909 (class 2606 OID 40860621)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 40860866)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 40860856)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 40860851)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 40860861)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 40860626)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 40860631)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 40860911)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 40861176)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2981 (class 2606 OID 40860986)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 40860981)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 40861181)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 40861186)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 40860896)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 40860971)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2979 (class 2606 OID 40860976)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2999 (class 2606 OID 40861091)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 40861086)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3003 (class 2606 OID 40861071)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 40861076)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 40861081)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 40860706)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 40860701)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 40860711)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2968 (class 2606 OID 40860921)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 40860916)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 40861101)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3005 (class 2606 OID 40861106)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2996 (class 2606 OID 40861061)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2995 (class 2606 OID 40861066)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2998 (class 2606 OID 40861051)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 40861056)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 40860841)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 40860846)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 40860961)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 40860966)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 40860816)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 40860821)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 40860886)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 40860881)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 40860871)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 40860876)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 40861046)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 40860736)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 40860741)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 40860766)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2937 (class 2606 OID 40860756)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2936 (class 2606 OID 40860761)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 40861096)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 40861111)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 40861121)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 40861166)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 40861171)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 40860651)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 40860646)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 40860666)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 40860671)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 40860836)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 40860831)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 40860826)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-27 11:56:49 CET

--
-- PostgreSQL database dump complete
--

