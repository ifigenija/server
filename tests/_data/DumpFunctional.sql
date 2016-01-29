--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-29 13:18:59 CET

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
-- TOC entry 185 (class 1259 OID 41823377)
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
-- TOC entry 241 (class 1259 OID 41823995)
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
-- TOC entry 240 (class 1259 OID 41823979)
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
-- TOC entry 184 (class 1259 OID 41823370)
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
-- TOC entry 183 (class 1259 OID 41823368)
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
-- TOC entry 231 (class 1259 OID 41823856)
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
-- TOC entry 234 (class 1259 OID 41823886)
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
-- TOC entry 255 (class 1259 OID 41824298)
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
-- TOC entry 212 (class 1259 OID 41823692)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 41823617)
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
-- TOC entry 206 (class 1259 OID 41823643)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 41823648)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 41824220)
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
-- TOC entry 196 (class 1259 OID 41823523)
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
-- TOC entry 242 (class 1259 OID 41824008)
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
-- TOC entry 227 (class 1259 OID 41823814)
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
-- TOC entry 202 (class 1259 OID 41823591)
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
-- TOC entry 199 (class 1259 OID 41823563)
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
-- TOC entry 197 (class 1259 OID 41823540)
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
-- TOC entry 216 (class 1259 OID 41823728)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 41824278)
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
-- TOC entry 254 (class 1259 OID 41824291)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 41824313)
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
-- TOC entry 220 (class 1259 OID 41823752)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 41823497)
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
-- TOC entry 187 (class 1259 OID 41823397)
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
-- TOC entry 191 (class 1259 OID 41823464)
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
-- TOC entry 188 (class 1259 OID 41823408)
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
-- TOC entry 180 (class 1259 OID 41823342)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 41823361)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 41823759)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 41823794)
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
-- TOC entry 237 (class 1259 OID 41823927)
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
-- TOC entry 190 (class 1259 OID 41823444)
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
-- TOC entry 193 (class 1259 OID 41823489)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 41824164)
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
-- TOC entry 217 (class 1259 OID 41823734)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 41823474)
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
-- TOC entry 204 (class 1259 OID 41823609)
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
-- TOC entry 200 (class 1259 OID 41823578)
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
-- TOC entry 201 (class 1259 OID 41823584)
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
-- TOC entry 219 (class 1259 OID 41823746)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 41824178)
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
-- TOC entry 246 (class 1259 OID 41824188)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 41824077)
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
-- TOC entry 247 (class 1259 OID 41824196)
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
-- TOC entry 223 (class 1259 OID 41823774)
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
-- TOC entry 215 (class 1259 OID 41823719)
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
-- TOC entry 214 (class 1259 OID 41823709)
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
-- TOC entry 236 (class 1259 OID 41823916)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 41823846)
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
-- TOC entry 198 (class 1259 OID 41823552)
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
-- TOC entry 177 (class 1259 OID 41823313)
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
-- TOC entry 176 (class 1259 OID 41823311)
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
-- TOC entry 224 (class 1259 OID 41823788)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 41823351)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 41823335)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 41823802)
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
-- TOC entry 218 (class 1259 OID 41823740)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 41823663)
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
-- TOC entry 175 (class 1259 OID 41823300)
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
-- TOC entry 174 (class 1259 OID 41823292)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 41823287)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 41823863)
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
-- TOC entry 189 (class 1259 OID 41823436)
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
-- TOC entry 211 (class 1259 OID 41823682)
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
-- TOC entry 213 (class 1259 OID 41823699)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 41823904)
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
-- TOC entry 186 (class 1259 OID 41823387)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 41824208)
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
-- TOC entry 208 (class 1259 OID 41823653)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 41823509)
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
-- TOC entry 178 (class 1259 OID 41823322)
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
-- TOC entry 239 (class 1259 OID 41823954)
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
-- TOC entry 210 (class 1259 OID 41823673)
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
-- TOC entry 203 (class 1259 OID 41823602)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 41823766)
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
-- TOC entry 233 (class 1259 OID 41823877)
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
-- TOC entry 251 (class 1259 OID 41824258)
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
-- TOC entry 250 (class 1259 OID 41824227)
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
-- TOC entry 252 (class 1259 OID 41824270)
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
-- TOC entry 229 (class 1259 OID 41823839)
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
-- TOC entry 238 (class 1259 OID 41823944)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 41823829)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 41823373)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 41823316)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 41823377)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56ab-58ad-48a6-e414a9cdf1f6	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56ab-58ad-6efd-b4cb447b4e06	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56ab-58ad-43a4-e21aa31cce85	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 41823995)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56ab-58af-8e24-057021c63202	000d0000-56ab-58ae-ca89-307a834e540e	\N	00090000-56ab-58ae-51e0-4fe324288bf7	000b0000-56ab-58ae-9f76-b74228a85c1b	0001	f	\N	\N	\N	3	t	t	t
000c0000-56ab-58af-e687-33829d0baaba	000d0000-56ab-58ae-9c5b-5472961d35e0	00100000-56ab-58ae-1f63-b29b33c9d706	00090000-56ab-58ae-6079-fe068484bbf9	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56ab-58af-2349-4cb5e62d02ae	000d0000-56ab-58ae-f752-f2e437e675b0	00100000-56ab-58ae-2595-8e6b211826b4	00090000-56ab-58ae-3e6f-bb925a9fc3ad	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56ab-58af-6f0d-05e591da18ae	000d0000-56ab-58ae-b8bd-2e05c9a5ee6e	\N	00090000-56ab-58ae-1b5f-d036d03cf43a	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56ab-58af-d27d-0b8c0596906b	000d0000-56ab-58ae-6bf2-e0fa89b0cce5	\N	00090000-56ab-58ae-5e77-1ac2aca8d0a7	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56ab-58af-2f8b-ca6e2b334899	000d0000-56ab-58ae-5b41-2cf79d23da30	\N	00090000-56ab-58ae-0a71-045087cff4ef	000b0000-56ab-58ae-4b54-4ec1a766dccd	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56ab-58af-3bc6-e0a561e5b4e1	000d0000-56ab-58ae-d46e-7ff1d31f9b80	00100000-56ab-58ae-0026-8a82797dec88	00090000-56ab-58ae-7f74-9f8bf7f2666f	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56ab-58af-7f5f-bf1c29f23970	000d0000-56ab-58ae-9308-19e1e995221a	\N	00090000-56ab-58ae-ed11-e6e4458534ab	000b0000-56ab-58ae-d840-b5fa35fa3f31	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56ab-58af-2d15-58ec06c242fc	000d0000-56ab-58ae-d46e-7ff1d31f9b80	00100000-56ab-58ae-f2eb-30036ee7b2bb	00090000-56ab-58ae-9c35-c02505b3d5ad	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56ab-58af-e186-d82de993fde9	000d0000-56ab-58ae-d46e-7ff1d31f9b80	00100000-56ab-58ae-d149-88ed31fa2992	00090000-56ab-58ae-b0f7-a2607e0845ff	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56ab-58af-bc39-f52ccb0eb512	000d0000-56ab-58ae-d46e-7ff1d31f9b80	00100000-56ab-58ae-3d92-010ce32941f3	00090000-56ab-58ae-c625-06362b7f40ec	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56ab-58af-5c04-a1beb4210b4a	000d0000-56ab-58ae-abd9-621f75200129	00100000-56ab-58ae-1f63-b29b33c9d706	00090000-56ab-58ae-6079-fe068484bbf9	000b0000-56ab-58ae-1e2b-0c4b84fd7854	0012	t	\N	\N	\N	2	t	t	t
000c0000-56ab-58af-d601-4bd29c7ea4a0	000d0000-56ab-58ae-e3d5-86be1d9d07fb	\N	00090000-56ab-58ae-ed11-e6e4458534ab	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56ab-58af-11da-5f9713146c6d	000d0000-56ab-58ae-e3d5-86be1d9d07fb	\N	00090000-56ab-58ae-aece-7392928a066f	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56ab-58af-799b-6db9fbd26993	000d0000-56ab-58ae-e0b8-3b409aeca0ae	00100000-56ab-58ae-2595-8e6b211826b4	00090000-56ab-58ae-3e6f-bb925a9fc3ad	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56ab-58af-12d9-9e307aab3216	000d0000-56ab-58ae-e0b8-3b409aeca0ae	\N	00090000-56ab-58ae-aece-7392928a066f	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56ab-58af-bd44-dd1080482b08	000d0000-56ab-58ae-9238-cdb82970ec7f	\N	00090000-56ab-58ae-aece-7392928a066f	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56ab-58af-47aa-1775888f5633	000d0000-56ab-58ae-9238-cdb82970ec7f	\N	00090000-56ab-58ae-ed11-e6e4458534ab	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56ab-58af-9bc7-f23af63b490a	000d0000-56ab-58ae-ccbb-e805d4e8b923	00100000-56ab-58ae-0026-8a82797dec88	00090000-56ab-58ae-7f74-9f8bf7f2666f	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56ab-58af-ceb9-d5c0049c7027	000d0000-56ab-58ae-ccbb-e805d4e8b923	\N	00090000-56ab-58ae-aece-7392928a066f	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56ab-58af-b5a9-31ab19465332	000d0000-56ab-58ae-7ca0-d7ddec58c13c	\N	00090000-56ab-58ae-aece-7392928a066f	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56ab-58af-0aeb-1c9671770d7e	000d0000-56ab-58ae-7ca0-d7ddec58c13c	00100000-56ab-58ae-0026-8a82797dec88	00090000-56ab-58ae-7f74-9f8bf7f2666f	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56ab-58af-26ff-a957e87ee907	000d0000-56ab-58ae-89f8-41a3c56a6f1b	\N	00090000-56ab-58ae-aece-7392928a066f	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56ab-58af-e78c-d50feb95baf2	000d0000-56ab-58ae-2ffe-759afe1dd192	\N	00090000-56ab-58ae-ed11-e6e4458534ab	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56ab-58af-d62a-e0e5fb3ea56f	000d0000-56ab-58ae-1a89-6289678244b7	\N	00090000-56ab-58ae-ed11-e6e4458534ab	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56ab-58af-c12d-837b51523e6e	000d0000-56ab-58ae-1a89-6289678244b7	00100000-56ab-58ae-2595-8e6b211826b4	00090000-56ab-58ae-3e6f-bb925a9fc3ad	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56ab-58af-fd75-b3ff79e95a9b	000d0000-56ab-58ae-1e1a-f1d4fc1caa10	\N	00090000-56ab-58ae-fb7f-11bc36510fd3	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56ab-58af-b8b6-cccf1307bd3f	000d0000-56ab-58ae-1e1a-f1d4fc1caa10	\N	00090000-56ab-58ae-ab57-44c0e674355c	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56ab-58af-0a83-eeae0df5856a	000d0000-56ab-58ae-41c3-7a4686ea44a0	\N	00090000-56ab-58ae-ed11-e6e4458534ab	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56ab-58af-fcff-1c52d7e10f1f	000d0000-56ab-58ae-41c3-7a4686ea44a0	00100000-56ab-58ae-2595-8e6b211826b4	00090000-56ab-58ae-3e6f-bb925a9fc3ad	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56ab-58af-a1ff-e503c57e8d0f	000d0000-56ab-58ae-41c3-7a4686ea44a0	\N	00090000-56ab-58ae-ab57-44c0e674355c	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56ab-58af-7e5c-6d2245c1ce17	000d0000-56ab-58ae-41c3-7a4686ea44a0	\N	00090000-56ab-58ae-fb7f-11bc36510fd3	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56ab-58af-65de-8931864d359d	000d0000-56ab-58ae-19f5-07a4eb5353da	\N	00090000-56ab-58ae-ed11-e6e4458534ab	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56ab-58af-bcaa-7af80b487d6b	000d0000-56ab-58ae-1d03-0377b5eb5533	00100000-56ab-58ae-2595-8e6b211826b4	00090000-56ab-58ae-3e6f-bb925a9fc3ad	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56ab-58af-7f3b-889ba5f2d73a	000d0000-56ab-58ae-1d03-0377b5eb5533	\N	00090000-56ab-58ae-aece-7392928a066f	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 41823979)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 41823370)
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
-- TOC entry 3191 (class 0 OID 41823856)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56ab-58ae-0344-6066f62f9d46	00160000-56ab-58ad-77f4-a08c5ed95d91	00090000-56ab-58ae-ab57-44c0e674355c	aizv	10	t
003d0000-56ab-58ae-da0f-26354d828b16	00160000-56ab-58ad-77f4-a08c5ed95d91	00090000-56ab-58ae-c503-5be9803624a4	apri	14	t
003d0000-56ab-58ae-3eb9-fb8c3e675db5	00160000-56ab-58ad-da65-ac975f78f5ca	00090000-56ab-58ae-fb7f-11bc36510fd3	aizv	11	t
003d0000-56ab-58ae-2fef-3d74edab61c8	00160000-56ab-58ad-1b1f-1080d617394a	00090000-56ab-58ae-10cb-7ffa2d91c965	aizv	12	t
003d0000-56ab-58ae-a127-e6808bafe30f	00160000-56ab-58ad-77f4-a08c5ed95d91	00090000-56ab-58ae-aece-7392928a066f	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 41823886)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56ab-58ad-77f4-a08c5ed95d91	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56ab-58ad-da65-ac975f78f5ca	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56ab-58ad-1b1f-1080d617394a	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 41824298)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 41823692)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 41823617)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva, nadrejenogostovanje_id) FROM stdin;
00180000-56ab-58ae-466f-851577be087f	\N	\N	\N	\N	00440000-56ab-58ae-f966-d035d6176bfa	00220000-56ab-58ad-f41b-8944972b2668	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N	\N
00180000-56ab-58ae-78e9-ab6ebafb0207	\N	\N	\N	\N	00440000-56ab-58ae-58a4-6767d474619e	00220000-56ab-58ad-0ae5-c731d370facc	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N	\N
00180000-56ab-58ae-8623-4400be4849fd	\N	\N	\N	001e0000-56ab-58ae-68ef-123ebdf9d638	\N	00220000-56ab-58ad-f41b-8944972b2668	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N	\N
00180000-56ab-58ae-b5f9-0ce9b7bfac11	\N	\N	\N	001e0000-56ab-58ae-da6f-3044439c1888	\N	00220000-56ab-58ad-0ae5-c731d370facc	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N	\N
00180000-56ab-58af-c088-9e2bcf0210bf	\N	00200000-56ab-58af-8523-1149447a43c3	\N	\N	\N	00220000-56ab-58ad-da86-8d58cb1ae4ee	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	Vaja 1.	\N	\N
00180000-56ab-58af-fe71-8d6e359bd5fe	\N	00200000-56ab-58af-b287-640154501018	\N	\N	\N	00220000-56ab-58ad-da86-8d58cb1ae4ee	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	Vaja 2.	\N	\N
00180000-56ab-58af-f9cf-170c6c5aad96	\N	00200000-56ab-58af-c01d-7c26fdba8f4a	\N	\N	\N	00220000-56ab-58ad-0ae5-c731d370facc	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 3.	\N	\N
00180000-56ab-58af-4c13-66a7d9c16f69	\N	00200000-56ab-58af-0215-6826699fb56f	\N	\N	\N	00220000-56ab-58ad-6605-b1c35b8a80da	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	Vaja 4.	\N	\N
00180000-56ab-58af-1fe8-d10dcb410fb4	\N	00200000-56ab-58af-c876-29739e69d4fa	\N	\N	\N	00220000-56ab-58ad-5df0-08f88740d782	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	Vaja 5.	\N	\N
00180000-56ab-58af-45c0-5f9b4850e995	\N	00200000-56ab-58af-6145-b404d7334ab0	\N	\N	\N	00220000-56ab-58ad-0ae5-c731d370facc	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 6.	\N	\N
00180000-56ab-58af-1074-14ab574f86e9	\N	00200000-56ab-58af-2e90-8a4c159b66f7	\N	\N	\N	00220000-56ab-58ad-5df0-08f88740d782	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 7.	\N	\N
00180000-56ab-58af-1f5d-41bf64d14c43	\N	00200000-56ab-58af-057d-6e9f1d0eb45a	\N	\N	\N	00220000-56ab-58ad-5df0-08f88740d782	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 8.	\N	\N
00180000-56ab-58af-4881-c52b8c7769e1	\N	00200000-56ab-58af-0b2c-128203493e4b	\N	\N	\N	00220000-56ab-58ad-da86-8d58cb1ae4ee	001f0000-56ab-58ad-b24a-c6adcbbce593	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	Vaja 9.	\N	\N
00180000-56ab-58af-e1a4-9508d6d6b021	\N	00200000-56ab-58af-9d5b-a1fb62cae6bb	\N	\N	\N	00220000-56ab-58ad-da86-8d58cb1ae4ee	001f0000-56ab-58ad-b24a-c6adcbbce593	2014-06-11 07:00:00	2014-06-12 15:00:00	400s	200s	\N	Vaja 10.	\N	\N
00180000-56ab-58af-dc48-1ff0bb075a7d	\N	\N	001c0000-56ab-58af-f1d5-4f2ee702cece	\N	\N	\N	001f0000-56ab-58ad-5c8d-8e03f0d3db11	2015-03-10 07:00:00	2015-03-20 23:00:00	200s	300s	\N	Gostovanje 1.	#001122	\N
00180000-56ab-58af-0fbc-3719495a32f7	001b0000-56ab-58af-fb03-51200831ccfb	\N	\N	\N	\N	00220000-56ab-58ad-f41b-8944972b2668	001f0000-56ab-58ad-b24a-c6adcbbce593	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N	\N
00180000-56ab-58af-66e4-cf045e3d0f70	001b0000-56ab-58af-8905-03d38d2f331c	\N	\N	\N	\N	00220000-56ab-58ad-0ae5-c731d370facc	001f0000-56ab-58ad-b24a-c6adcbbce593	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N	\N
00180000-56ab-58af-8613-9a164b85cedf	001b0000-56ab-58af-7639-79541c0b291f	\N	\N	\N	\N	00220000-56ab-58ad-f41b-8944972b2668	001f0000-56ab-58ad-b24a-c6adcbbce593	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N	\N
00180000-56ab-58af-c99b-001e09aca5ea	001b0000-56ab-58af-863a-e7e76733fa3a	\N	\N	\N	\N	00220000-56ab-58ad-f41b-8944972b2668	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N	\N
00180000-56ab-58af-2d69-5b45ae1dfea8	001b0000-56ab-58af-474f-6ef26bd3bdc4	\N	\N	\N	\N	00220000-56ab-58ad-f41b-8944972b2668	001f0000-56ab-58ad-5c8d-8e03f0d3db11	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N	\N
00180000-56ab-58af-7596-afc532fd986a	001b0000-56ab-58af-292e-79b4c0f1d951	\N	\N	\N	\N	00220000-56ab-58ad-f41b-8944972b2668	001f0000-56ab-58ad-5c8d-8e03f0d3db11	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N	\N
00180000-56ab-58af-0fc0-772141b70374	001b0000-56ab-58af-d1ff-9c22ac57662f	\N	\N	\N	\N	00220000-56ab-58ad-f41b-8944972b2668	001f0000-56ab-58ad-b24a-c6adcbbce593	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N	\N
00180000-56ab-58af-0825-83fe06b0e3cf	001b0000-56ab-58af-0689-546aa51cf0e0	\N	\N	\N	\N	00220000-56ab-58ad-f41b-8944972b2668	001f0000-56ab-58ad-5c8d-8e03f0d3db11	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N	\N
00180000-56ab-58b0-2025-a2c7af857aa8	001b0000-56ab-58b0-6a31-d8ac1419cd61	\N	\N	\N	\N	00220000-56ab-58ad-f41b-8944972b2668	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N	\N
00180000-56ab-58b0-251a-360aa5514e9f	001b0000-56ab-58b0-ced8-88fc76bdc350	\N	\N	\N	\N	00220000-56ab-58ad-f41b-8944972b2668	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N	\N
00180000-56ab-58b0-9b32-514062f81053	001b0000-56ab-58b0-f86f-7c798e8e2633	\N	\N	\N	\N	00220000-56ab-58ad-f41b-8944972b2668	001f0000-56ab-58ad-5c8d-8e03f0d3db11	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N	\N
00180000-56ab-58b0-616b-09aed5dcdde7	001b0000-56ab-58b0-0064-3bd8885f42bd	\N	\N	\N	\N	00220000-56ab-58ad-f41b-8944972b2668	001f0000-56ab-58ad-8bfd-55adf44c2591	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N	\N
00180000-56ab-58b0-c7e6-008ed8b736bd	001b0000-56ab-58b0-94b6-edfa12251383	\N	\N	\N	\N	00220000-56ab-58ad-f41b-8944972b2668	001f0000-56ab-58ad-8bfd-55adf44c2591	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N	\N
00180000-56ab-58b0-6edb-0ff56ef036f1	001b0000-56ab-58b0-ef46-8a7d8ddeccf4	\N	\N	\N	\N	00220000-56ab-58ad-f41b-8944972b2668	001f0000-56ab-58ad-5c8d-8e03f0d3db11	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N	\N
00180000-56ab-58b0-dd66-db67205f895d	001b0000-56ab-58b0-95f0-84cdb0b90eb8	\N	\N	\N	\N	\N	001f0000-56ab-58ad-5c8d-8e03f0d3db11	2015-03-15 20:00:00	2015-03-15 23:00:00	200s	100s	\N	Predstava 15.	\N	001c0000-56ab-58af-f1d5-4f2ee702cece
00180000-56ab-58b0-6321-ac3d6fd2a119	001b0000-56ab-58b0-38f0-53ec93c4112b	\N	\N	\N	\N	\N	001f0000-56ab-58ad-5c8d-8e03f0d3db11	2015-03-16 20:00:00	2015-03-16 23:00:00	200s	100s	\N	Predstava 16.	\N	001c0000-56ab-58af-f1d5-4f2ee702cece
\.


--
-- TOC entry 3166 (class 0 OID 41823643)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56ab-58ae-68ef-123ebdf9d638
001e0000-56ab-58ae-da6f-3044439c1888
\.


--
-- TOC entry 3167 (class 0 OID 41823648)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56ab-58ae-f966-d035d6176bfa
00440000-56ab-58ae-58a4-6767d474619e
\.


--
-- TOC entry 3209 (class 0 OID 41824220)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 41823523)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56ab-58a8-3302-48fc99e78399	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56ab-58a8-a942-7af77ba4698c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56ab-58a8-9059-0c24bf4230d7	AL	ALB	008	Albania 	Albanija	\N
00040000-56ab-58a8-14a7-83b2b83aef0d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56ab-58a8-3033-5a80e9243a0d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56ab-58a8-94ae-55cbb28136d9	AD	AND	020	Andorra 	Andora	\N
00040000-56ab-58a8-12c3-d1a8c0424c44	AO	AGO	024	Angola 	Angola	\N
00040000-56ab-58a8-e9b5-3d971807c133	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56ab-58a8-fa5c-b23ff38b2dfe	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56ab-58a8-9b6a-1dd07b9d60a6	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56ab-58a8-3acf-747d12169bd9	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56ab-58a8-be57-0121fef7c917	AM	ARM	051	Armenia 	Armenija	\N
00040000-56ab-58a8-1bef-3a891e6c1dc0	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56ab-58a8-1845-ec0504a7b09a	AU	AUS	036	Australia 	Avstralija	\N
00040000-56ab-58a8-25c7-b96073c34d22	AT	AUT	040	Austria 	Avstrija	\N
00040000-56ab-58a8-c1c3-5ffea38adeca	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56ab-58a8-cf75-f30a6faad5cd	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56ab-58a8-cb40-39ea13b7c2b0	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56ab-58a8-fa07-b65ba9cd2080	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56ab-58a8-cba5-547862bffe07	BB	BRB	052	Barbados 	Barbados	\N
00040000-56ab-58a8-8412-79d434c879db	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56ab-58a8-99b4-4b2d3335c010	BE	BEL	056	Belgium 	Belgija	\N
00040000-56ab-58a8-009c-893f1b78fd8a	BZ	BLZ	084	Belize 	Belize	\N
00040000-56ab-58a8-e6ae-320f00165006	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56ab-58a8-73f1-3e052a58776a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56ab-58a8-1018-af9ffcec1b68	BT	BTN	064	Bhutan 	Butan	\N
00040000-56ab-58a8-a043-deea1290a82a	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56ab-58a8-422d-9540546881f8	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56ab-58a8-a86a-fcaeb685cc2c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56ab-58a8-c050-db7a114c77b9	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56ab-58a8-7426-dab0557931f5	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56ab-58a8-50bc-41350678124f	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56ab-58a8-e21b-d00c6b79d74f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56ab-58a8-3d0a-50b2661b49af	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56ab-58a8-d116-fd6b1ce5982d	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56ab-58a8-4a78-488ca9af9ea4	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56ab-58a8-00d0-1ab880e58886	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56ab-58a8-e685-7c0d25cfc0e2	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56ab-58a8-b71d-da0ca4b0b1a9	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56ab-58a8-1f52-8c4a632308e8	CA	CAN	124	Canada 	Kanada	\N
00040000-56ab-58a8-0000-e99313de8aaa	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56ab-58a8-3c0c-ea8b8aeeb66c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56ab-58a8-9dbb-ed7ae0a72706	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56ab-58a8-fdd7-0253075e9f2b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56ab-58a8-237e-2cf36d2c2057	CL	CHL	152	Chile 	Čile	\N
00040000-56ab-58a8-f193-998b50722049	CN	CHN	156	China 	Kitajska	\N
00040000-56ab-58a8-5e33-4d0d9eba5d29	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56ab-58a8-3af5-dbb122b5a968	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56ab-58a8-58ea-8d0465d75977	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56ab-58a8-57da-cf360a05b0ed	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56ab-58a8-0f12-70e4c7750980	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56ab-58a8-730a-b60bd2ca8aff	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56ab-58a8-ef43-417d9099732a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56ab-58a8-1efc-ed46116c032d	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56ab-58a8-08aa-b95bb80e53a2	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56ab-58a8-d21f-fa84b614ef6d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56ab-58a8-fe23-1de0ad054ae2	CU	CUB	192	Cuba 	Kuba	\N
00040000-56ab-58a8-7d0c-c327120a778c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56ab-58a8-0ff3-9c62e7c9ff04	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56ab-58a8-4862-f656121f23d4	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56ab-58a8-19ce-aa4045ecf9dc	DK	DNK	208	Denmark 	Danska	\N
00040000-56ab-58a8-bc7b-912d4ec1195c	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56ab-58a8-1578-a83b3c0d947a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56ab-58a8-b169-ea6786b64b04	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56ab-58a8-4a34-8a3c2a012d04	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56ab-58a8-f12a-d2427582b2b4	EG	EGY	818	Egypt 	Egipt	\N
00040000-56ab-58a8-efee-e58d4622ea96	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56ab-58a8-1f0d-d4a5be74aebe	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56ab-58a8-e995-12f46ffb57dc	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56ab-58a8-7d89-11c585073732	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56ab-58a8-7b5d-0efd38126b39	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56ab-58a8-8983-8572a0a66344	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56ab-58a8-48f6-10554311bf2a	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56ab-58a8-68fb-374443ea6716	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56ab-58a8-2356-b41d536dd093	FI	FIN	246	Finland 	Finska	\N
00040000-56ab-58a8-c6df-5b41f3bf78eb	FR	FRA	250	France 	Francija	\N
00040000-56ab-58a8-2a5c-acd50a595867	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56ab-58a8-aea9-914195bba3ca	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56ab-58a8-32be-3e6208e48471	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56ab-58a8-313a-f8980bba3524	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56ab-58a8-29e1-30f881f98bfb	GA	GAB	266	Gabon 	Gabon	\N
00040000-56ab-58a8-ecc7-3422ff69e255	GM	GMB	270	Gambia 	Gambija	\N
00040000-56ab-58a8-33f9-400b734e14d1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56ab-58a8-3e36-145d1f0fa9a7	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56ab-58a8-75cf-682289eaa20f	GH	GHA	288	Ghana 	Gana	\N
00040000-56ab-58a8-a141-df1e3b95cc00	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56ab-58a8-e335-0f85f5acd4cb	GR	GRC	300	Greece 	Grčija	\N
00040000-56ab-58a8-34ef-20b47e7195c9	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56ab-58a8-b9ea-f17378c2a693	GD	GRD	308	Grenada 	Grenada	\N
00040000-56ab-58a8-0062-1bf8944a41c6	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56ab-58a8-ec6d-dc03dda1cf8a	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56ab-58a8-e9dd-4dfdf58fb08c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56ab-58a8-db24-33101a553ee4	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56ab-58a8-e804-65df72d3d4d6	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56ab-58a8-b457-f0c02f3df591	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56ab-58a8-2672-5f044c827883	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56ab-58a8-8e2f-270b81495824	HT	HTI	332	Haiti 	Haiti	\N
00040000-56ab-58a8-db7a-7aa5dfede6f6	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56ab-58a8-b404-591032fab042	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56ab-58a8-495d-cbb45609b574	HN	HND	340	Honduras 	Honduras	\N
00040000-56ab-58a8-11cc-e2059279cff0	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56ab-58a8-bc3a-c61a9a015d6f	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56ab-58a8-bc12-8bfc2e321ba6	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56ab-58a8-220c-147531c3b0b9	IN	IND	356	India 	Indija	\N
00040000-56ab-58a8-4913-2382c3f76f36	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56ab-58a8-0ee4-e3bdd6795946	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56ab-58a8-2c23-18c1a3dbc6c3	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56ab-58a8-19eb-5b8fd0d0b5e9	IE	IRL	372	Ireland 	Irska	\N
00040000-56ab-58a8-6a84-1e9842d983c9	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56ab-58a8-966e-f60390d5962b	IL	ISR	376	Israel 	Izrael	\N
00040000-56ab-58a8-d21c-b01b42858e69	IT	ITA	380	Italy 	Italija	\N
00040000-56ab-58a8-dd2d-e4471af21989	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56ab-58a8-5802-d0ead2de44b4	JP	JPN	392	Japan 	Japonska	\N
00040000-56ab-58a8-e568-49f2b7c8c8e1	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56ab-58a8-c4db-9cbc96310fb1	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56ab-58a8-4cd5-f2babac56ef6	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56ab-58a8-ee40-c2b27f359e8c	KE	KEN	404	Kenya 	Kenija	\N
00040000-56ab-58a8-9d63-b8f5bb5e0a37	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56ab-58a8-f933-a0828a49971d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56ab-58a8-69bf-36460d7cce92	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56ab-58a8-f391-b3a8b7d3db62	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56ab-58a8-c9c8-e9b6e2304540	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56ab-58a8-0026-1b0bf89737fb	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56ab-58a8-bb08-516363b41a75	LV	LVA	428	Latvia 	Latvija	\N
00040000-56ab-58a8-5746-659ec57b0b89	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56ab-58a8-0ffd-1a0599f8b976	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56ab-58a8-c9cf-cdf413a6ba9f	LR	LBR	430	Liberia 	Liberija	\N
00040000-56ab-58a8-4622-1dc29be48734	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56ab-58a8-6aba-7628bc24ca98	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56ab-58a8-d1b9-28b2e9876c35	LT	LTU	440	Lithuania 	Litva	\N
00040000-56ab-58a8-3529-46bb6128bbdb	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56ab-58a8-fe02-e452a44476b0	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56ab-58a8-8337-6f9794969cb3	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56ab-58a8-e2bd-50a41ca1af47	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56ab-58a8-d1ff-2d87f2a16f48	MW	MWI	454	Malawi 	Malavi	\N
00040000-56ab-58a8-ad63-b0cf3405e6f8	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56ab-58a8-58c6-094f5ae0efec	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56ab-58a8-3f9d-a35a0d14da6a	ML	MLI	466	Mali 	Mali	\N
00040000-56ab-58a8-dc53-0f7f7acaa202	MT	MLT	470	Malta 	Malta	\N
00040000-56ab-58a8-e929-210add73db7b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56ab-58a8-8176-be98fe16119b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56ab-58a8-67f0-973893b5cc51	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56ab-58a8-9a33-b67333cca816	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56ab-58a8-ba2e-d4ebc17910f6	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56ab-58a8-ac24-ec6541034cd9	MX	MEX	484	Mexico 	Mehika	\N
00040000-56ab-58a8-c95a-ab307b376d9d	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56ab-58a8-9f25-856c65e1b829	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56ab-58a8-9ee8-89cd37c652ed	MC	MCO	492	Monaco 	Monako	\N
00040000-56ab-58a8-9d2e-381b728f199c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56ab-58a8-3099-781391a67ad4	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56ab-58a8-f6d0-5f46c96b463e	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56ab-58a8-014d-b3b7de19c2c6	MA	MAR	504	Morocco 	Maroko	\N
00040000-56ab-58a8-afed-df23d4dcfb49	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56ab-58a8-fbb4-8e8bbffe2e58	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56ab-58a8-43ae-a53828ea8fe8	NA	NAM	516	Namibia 	Namibija	\N
00040000-56ab-58a8-bf87-1def548b85be	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56ab-58a8-a605-61cd0689dbb4	NP	NPL	524	Nepal 	Nepal	\N
00040000-56ab-58a8-c9fb-25876615d518	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56ab-58a8-b1b2-c9c518c75ebf	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56ab-58a8-8dbe-d3ee1a2118c0	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56ab-58a8-1dc6-8c2dda80f31d	NE	NER	562	Niger 	Niger 	\N
00040000-56ab-58a8-f0d3-eb1782461564	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56ab-58a8-9723-186523702263	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56ab-58a8-c33d-f2bd2d77a002	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56ab-58a8-ccf5-bef9df397bc9	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56ab-58a8-2639-f26b6fc97603	NO	NOR	578	Norway 	Norveška	\N
00040000-56ab-58a8-c6de-5a14aca17a76	OM	OMN	512	Oman 	Oman	\N
00040000-56ab-58a8-b589-f00b89ec9b7e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56ab-58a8-663d-23809d9fcfb8	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56ab-58a8-8031-59d03ba18514	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56ab-58a8-c862-efcbc36a32dd	PA	PAN	591	Panama 	Panama	\N
00040000-56ab-58a8-de22-752ea994468e	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56ab-58a8-597c-e298469e9f46	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56ab-58a8-8cf8-8aa751491743	PE	PER	604	Peru 	Peru	\N
00040000-56ab-58a8-d1bb-1e19ff340b04	PH	PHL	608	Philippines 	Filipini	\N
00040000-56ab-58a8-81a9-2056309db8f9	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56ab-58a8-3cb7-95f20453b5d0	PL	POL	616	Poland 	Poljska	\N
00040000-56ab-58a8-b791-06ecd2d1f35a	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56ab-58a8-7a13-c24088807576	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56ab-58a8-d780-a24f931a8a43	QA	QAT	634	Qatar 	Katar	\N
00040000-56ab-58a8-e85f-eff7fd1cc5cd	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56ab-58a8-ad7e-4019161bbabf	RO	ROU	642	Romania 	Romunija	\N
00040000-56ab-58a8-5ecd-c3aeb26cb004	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56ab-58a8-16dd-cb5fd6b3cbb3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56ab-58a8-41ae-7241036fe95a	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56ab-58a8-bd73-3bc424a7f7b1	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56ab-58a8-b062-65672108db57	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56ab-58a8-e7d8-97abdbc299d8	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56ab-58a8-bf62-043969b97894	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56ab-58a8-9d06-c9020282ec15	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56ab-58a8-348e-44cf017bf3bf	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56ab-58a8-cf7a-7824ff631fb0	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56ab-58a8-718d-1f7c69e8b4b4	SM	SMR	674	San Marino 	San Marino	\N
00040000-56ab-58a8-de1d-97e67fd8d1a8	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56ab-58a8-49de-3353708efa90	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56ab-58a8-ad0f-b127f75ddef1	SN	SEN	686	Senegal 	Senegal	\N
00040000-56ab-58a8-0811-b9191b2eca25	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56ab-58a8-9f17-845fee5126f8	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56ab-58a8-e494-d2ca3de379df	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56ab-58a8-b221-2566b2301196	SG	SGP	702	Singapore 	Singapur	\N
00040000-56ab-58a8-c622-3ce79a2166cf	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56ab-58a8-3b3f-97597992883a	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56ab-58a8-bff7-baa266ad016f	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56ab-58a8-b2ac-d3524c9bda85	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56ab-58a8-9a45-1b7476b91625	SO	SOM	706	Somalia 	Somalija	\N
00040000-56ab-58a8-e65f-d12d735a3a54	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56ab-58a8-d7d8-e7e6f2b8cd9e	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56ab-58a8-7fd6-156e162a414b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56ab-58a8-373f-43defd342638	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56ab-58a8-3e34-53526e384aff	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56ab-58a8-f24f-942f421a30e2	SD	SDN	729	Sudan 	Sudan	\N
00040000-56ab-58a8-e9ec-02b20a5bdf56	SR	SUR	740	Suriname 	Surinam	\N
00040000-56ab-58a8-2257-48c2f920ef9c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56ab-58a8-8a63-732366f5b661	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56ab-58a8-2a93-a96bb8dda227	SE	SWE	752	Sweden 	Švedska	\N
00040000-56ab-58a8-c82a-e1fca7432169	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56ab-58a8-1fc5-8be296792316	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56ab-58a8-440b-5d98c73b0114	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56ab-58a8-7f70-1316eec9ed2a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56ab-58a8-159f-0539f8d2e322	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56ab-58a8-297e-484fac2c11b8	TH	THA	764	Thailand 	Tajska	\N
00040000-56ab-58a8-79c3-82376e35055c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56ab-58a8-d831-d824ec270490	TG	TGO	768	Togo 	Togo	\N
00040000-56ab-58a8-47aa-f4fdc54dd0ef	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56ab-58a8-af74-f67cd6e2b812	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56ab-58a8-0826-3d7b4cd0257c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56ab-58a8-9452-f9696ac87c64	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56ab-58a8-8294-723708f01897	TR	TUR	792	Turkey 	Turčija	\N
00040000-56ab-58a8-9ee4-498f271789c7	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56ab-58a8-8e29-836d437c95d3	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56ab-58a8-a9c3-15492989f54a	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56ab-58a8-75a6-95e73ccd8aca	UG	UGA	800	Uganda 	Uganda	\N
00040000-56ab-58a8-aace-695b01e46fef	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56ab-58a8-a4cc-ca00c88366b5	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56ab-58a8-dabf-eca80496cd56	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56ab-58a8-f8a4-6b3b8e5dd599	US	USA	840	United States 	Združene države Amerike	\N
00040000-56ab-58a8-47e6-3baecef8a085	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56ab-58a8-6ec4-8b4724fad597	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56ab-58a8-8873-c5593b284c1d	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56ab-58a8-b9b5-d31a12f8a41b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56ab-58a8-8032-11fe853d3ad4	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56ab-58a8-a168-ef4e40859fe9	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56ab-58a8-8ed1-58151d30deb4	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56ab-58a8-5f2b-bdf1b825a633	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56ab-58a8-1630-13fd04aed1c8	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56ab-58a8-1f18-17c59487c6db	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56ab-58a8-825f-b11bd5c82589	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56ab-58a8-2d11-c0855c34755c	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56ab-58a8-e968-2f56e04ca787	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 41824008)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56ab-58ae-b142-e3c6aced35c0	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56ab-58ae-f3fd-312ded0e6dcc	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56ab-58ae-b200-acab258e1179	000e0000-56ab-58ae-ce44-a1a42bde7c83	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56ab-58a8-56ef-28e189c95119	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56ab-58ae-7dca-95813d43e443	000e0000-56ab-58ae-8921-b72c78999659	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56ab-58a8-2f64-0714833f2b8c	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56ab-58ae-2cd2-60a6d1633787	000e0000-56ab-58ae-611d-c90bb0c0860c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56ab-58a8-56ef-28e189c95119	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 41823814)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56ab-58ae-7324-7bc9edd6a02e	000e0000-56ab-58ae-8921-b72c78999659	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56ab-58a8-3a9e-222921e396ad
000d0000-56ab-58ae-5dd6-09564207f4cc	000e0000-56ab-58ae-324a-8b5966e8fcfe	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56ab-58a8-8728-35153182d57f
000d0000-56ab-58ae-efd3-e8ff8d4405e2	000e0000-56ab-58ae-324a-8b5966e8fcfe	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56ab-58a8-614f-c02707037e97
000d0000-56ab-58ae-ca89-307a834e540e	000e0000-56ab-58ae-8921-b72c78999659	000c0000-56ab-58af-8e24-057021c63202	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56ab-58a8-8728-35153182d57f
000d0000-56ab-58ae-9c5b-5472961d35e0	000e0000-56ab-58ae-8921-b72c78999659	000c0000-56ab-58af-e687-33829d0baaba	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56ab-58a8-614f-c02707037e97
000d0000-56ab-58ae-f752-f2e437e675b0	000e0000-56ab-58ae-8921-b72c78999659	000c0000-56ab-58af-2349-4cb5e62d02ae	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56ab-58a8-9f83-279d3bb070d7
000d0000-56ab-58ae-b8bd-2e05c9a5ee6e	000e0000-56ab-58ae-8921-b72c78999659	000c0000-56ab-58af-6f0d-05e591da18ae	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56ab-58a8-3a9e-222921e396ad
000d0000-56ab-58ae-6bf2-e0fa89b0cce5	000e0000-56ab-58ae-8921-b72c78999659	000c0000-56ab-58af-d27d-0b8c0596906b	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56ab-58a8-3a9e-222921e396ad
000d0000-56ab-58ae-5b41-2cf79d23da30	000e0000-56ab-58ae-8921-b72c78999659	000c0000-56ab-58af-2f8b-ca6e2b334899	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56ab-58a8-8728-35153182d57f
000d0000-56ab-58ae-d46e-7ff1d31f9b80	000e0000-56ab-58ae-8921-b72c78999659	000c0000-56ab-58af-2d15-58ec06c242fc	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56ab-58a8-8728-35153182d57f
000d0000-56ab-58ae-9308-19e1e995221a	000e0000-56ab-58ae-8921-b72c78999659	000c0000-56ab-58af-7f5f-bf1c29f23970	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56ab-58a8-3bbd-42645a4516bf
000d0000-56ab-58ae-abd9-621f75200129	000e0000-56ab-58ae-8921-b72c78999659	000c0000-56ab-58af-5c04-a1beb4210b4a	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56ab-58a8-c91a-8390ac67e205
000d0000-56ab-58ae-e3d5-86be1d9d07fb	000e0000-56ab-58ae-6628-e72e9ea79346	000c0000-56ab-58af-d601-4bd29c7ea4a0	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56ab-58a8-614f-c02707037e97
000d0000-56ab-58ae-e0b8-3b409aeca0ae	000e0000-56ab-58ae-0e4c-e49c873b4ebf	000c0000-56ab-58af-799b-6db9fbd26993	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56ab-58a8-614f-c02707037e97
000d0000-56ab-58ae-9238-cdb82970ec7f	000e0000-56ab-58ae-0e4c-e49c873b4ebf	000c0000-56ab-58af-bd44-dd1080482b08	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56ab-58a8-614f-c02707037e97
000d0000-56ab-58ae-ccbb-e805d4e8b923	000e0000-56ab-58ae-89b0-541814870a8e	000c0000-56ab-58af-9bc7-f23af63b490a	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56ab-58a8-614f-c02707037e97
000d0000-56ab-58ae-7ca0-d7ddec58c13c	000e0000-56ab-58ae-9543-827937be3fad	000c0000-56ab-58af-b5a9-31ab19465332	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56ab-58a8-614f-c02707037e97
000d0000-56ab-58ae-89f8-41a3c56a6f1b	000e0000-56ab-58ae-cfb9-baf11aab5dd9	000c0000-56ab-58af-26ff-a957e87ee907	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56ab-58a8-614f-c02707037e97
000d0000-56ab-58ae-2ffe-759afe1dd192	000e0000-56ab-58ae-dd0b-9b8a59e6554d	000c0000-56ab-58af-e78c-d50feb95baf2	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56ab-58a8-614f-c02707037e97
000d0000-56ab-58ae-1a89-6289678244b7	000e0000-56ab-58ae-b23f-aae713edcc3c	000c0000-56ab-58af-d62a-e0e5fb3ea56f	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56ab-58a8-614f-c02707037e97
000d0000-56ab-58ae-1e1a-f1d4fc1caa10	000e0000-56ab-58ae-e916-5c8251de2255	000c0000-56ab-58af-fd75-b3ff79e95a9b	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56ab-58a8-614f-c02707037e97
000d0000-56ab-58ae-41c3-7a4686ea44a0	000e0000-56ab-58ae-e916-5c8251de2255	000c0000-56ab-58af-0a83-eeae0df5856a	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56ab-58a8-614f-c02707037e97
000d0000-56ab-58ae-19f5-07a4eb5353da	000e0000-56ab-58ae-dd7a-6855f3751d1d	000c0000-56ab-58af-65de-8931864d359d	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56ab-58a8-614f-c02707037e97
000d0000-56ab-58ae-1d03-0377b5eb5533	000e0000-56ab-58ae-dd7a-6855f3751d1d	000c0000-56ab-58af-bcaa-7af80b487d6b	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56ab-58a8-614f-c02707037e97
\.


--
-- TOC entry 3162 (class 0 OID 41823591)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
001c0000-56ab-58af-f1d5-4f2ee702cece	00040000-56ab-58a8-bc12-8bfc2e321ba6		\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 41823563)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 41823540)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56ab-58ae-b65b-ed33e8695a08	00080000-56ab-58ad-b5b4-c0aaf92cfd6d	00090000-56ab-58ae-b0f7-a2607e0845ff	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 41823728)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 41824278)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56ab-58ad-9879-c9afd79a5432	00010000-56ab-58ab-eb8c-a704541513a0	\N	Prva mapa	Root mapa	2016-01-29 13:18:53	2016-01-29 13:18:53	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 41824291)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 41824313)
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
-- TOC entry 3180 (class 0 OID 41823752)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 41823497)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56ab-58ab-b5f1-dd3ef0cb6823	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56ab-58ab-8eec-b9c49c7a1656	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56ab-58ab-b581-e02ae8c0dea6	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56ab-58ab-08e2-96fe2a84ca64	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56ab-58ab-d43e-eff9c8e747be	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56ab-58ab-3b2c-7864ffaae0c0	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56ab-58ab-38bf-0d371271333e	dogodek.delte	array	a:14:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delGosZac";a:2:{s:5:"label";s:37:"Delta začetka pri dogodku gostovanje";s:5:"value";i:0;}s:9:"delGosKon";a:2:{s:5:"label";s:34:"Delta konca pri dogodku gostovanje";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56ab-58ab-4b42-46a053dcf2b5	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56ab-58ab-3a17-b33b73868cce	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56ab-58ab-a964-08adf244c2b9	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56ab-58ab-5726-3bea1f15100c	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56ab-58ab-b63b-af335148db25	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56ab-58ab-269f-910accfbd7f9	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56ab-58ab-82c4-94522e848c7f	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56ab-58ab-c86a-c10da7d15c77	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56ab-58ab-69b2-38735a06f533	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56ab-58ab-3c2f-b7c5406c143d	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56ab-58ad-5afe-127854321444	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56ab-58ad-91e2-ae494f96edb0	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56ab-58ad-f814-d66fa7b66603	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56ab-58ad-69b7-01b7c027e694	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56ab-58ad-9771-268a2b37ad6b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56ab-58ad-d1c4-f3894e4639e5	tomaz.barva.ozadja	array	s:4:"siva";	t	f	f	\N	barva ozadja tomaž
00000000-56ab-58b1-b5e0-f5aea4368de0	application.tenant.maticnopodjetje	string	s:36:"00080000-56ab-58b1-a77d-7d1a57f81b7c";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 41823397)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56ab-58ad-9c1f-4cff4f71c951	00000000-56ab-58ad-5afe-127854321444	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56ab-58ad-43de-2de5a1a19d48	00000000-56ab-58ad-5afe-127854321444	00010000-56ab-58ab-eb8c-a704541513a0	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56ab-58ad-447f-4e27af8c8bbe	00000000-56ab-58ad-91e2-ae494f96edb0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
00000000-56ab-58ad-c1dc-f2f8d3962b03	00000000-56ab-58ad-d1c4-f3894e4639e5	\N	s:6:"zelena";	t
00000000-56ab-58ad-eb51-1d35c8db9a0a	00000000-56ab-58ad-d1c4-f3894e4639e5	00010000-56ab-58ab-eb8c-a704541513a0	s:6:"rdeča";	f
\.


--
-- TOC entry 3151 (class 0 OID 41823464)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56ab-58ae-2b3b-bbf53df0004b	\N	00100000-56ab-58ae-1f63-b29b33c9d706	00100000-56ab-58ae-2595-8e6b211826b4	01	Gledališče Nimbis
00410000-56ab-58ae-e524-6615719f296c	00410000-56ab-58ae-2b3b-bbf53df0004b	00100000-56ab-58ae-1f63-b29b33c9d706	00100000-56ab-58ae-2595-8e6b211826b4	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 41823408)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56ab-58ae-51e0-4fe324288bf7	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56ab-58ae-1b5f-d036d03cf43a	00010000-56ab-58ad-d936-00925436a81f	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56ab-58ae-3e6f-bb925a9fc3ad	00010000-56ab-58ad-6d99-ca063857c710	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56ab-58ae-9c35-c02505b3d5ad	00010000-56ab-58ad-d0d4-36b345b857b2	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56ab-58ae-efd8-c5afd1ff3e45	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56ab-58ae-0a71-045087cff4ef	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56ab-58ae-c625-06362b7f40ec	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56ab-58ae-7f74-9f8bf7f2666f	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56ab-58ae-b0f7-a2607e0845ff	00010000-56ab-58ad-eab2-91edb339833e	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56ab-58ae-6079-fe068484bbf9	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56ab-58ae-ece1-c06aa37b4dbe	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-58ae-5e77-1ac2aca8d0a7	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56ab-58ae-ed11-e6e4458534ab	00010000-56ab-58ad-e320-4a7a0a885aef	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-58ae-ab57-44c0e674355c	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-58ae-c503-5be9803624a4	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-58ae-fb7f-11bc36510fd3	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-58ae-10cb-7ffa2d91c965	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-58ae-aece-7392928a066f	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-58ae-1ac8-de2c29add474	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-58ae-5a5e-2d47b0308419	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-58ae-8050-7583c13a953b	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 41823342)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56ab-58a9-c64c-e3deca0a516f	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56ab-58a9-92a0-2f4d012d54cf	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56ab-58a9-e00a-bb0a28490511	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56ab-58a9-216f-c2708bdcdb62	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56ab-58a9-b094-0b51f0d0a122	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56ab-58a9-3411-a6591308d528	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56ab-58a9-d78b-4528f53593ee	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56ab-58a9-bc1c-fc425882b94f	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56ab-58a9-2f5c-eea2b4e64cee	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56ab-58a9-c387-05da4303bfa3	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56ab-58a9-e512-f4eef54c52df	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56ab-58a9-701f-5b2fa5d044d8	Abonma-read	Abonma - branje	t
00030000-56ab-58a9-611a-a650b351b80c	Abonma-write	Abonma - spreminjanje	t
00030000-56ab-58a9-618f-471fd9314546	Alternacija-read	Alternacija - branje	t
00030000-56ab-58a9-6b81-3266ca47d1e6	Alternacija-write	Alternacija - spreminjanje	t
00030000-56ab-58a9-49ce-8022121efadc	Arhivalija-read	Arhivalija - branje	t
00030000-56ab-58a9-26ae-c8c8de433dc1	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56ab-58a9-51a5-e2b297332277	AuthStorage-read	AuthStorage - branje	t
00030000-56ab-58a9-a860-1a0198bd376d	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56ab-58a9-553b-12cf20fa1d41	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56ab-58a9-c4c3-d40f5657b742	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56ab-58a9-4fa7-900c5b8fafee	Besedilo-read	Besedilo - branje	t
00030000-56ab-58a9-8051-042e16617e73	Besedilo-write	Besedilo - spreminjanje	t
00030000-56ab-58a9-5043-814c63b5fac7	Dodatek-read	Dodatek - branje	t
00030000-56ab-58a9-ca79-62c0f4a84ccb	Dodatek-write	Dodatek - spreminjanje	t
00030000-56ab-58a9-b85b-fddb6d461532	Dogodek-read	Dogodek - branje	t
00030000-56ab-58a9-2d1a-bcf93db09fe0	Dogodek-write	Dogodek - spreminjanje	t
00030000-56ab-58a9-4b2b-a64a4026deab	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56ab-58a9-bdf5-a63252196dff	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56ab-58a9-4050-74dfe6da1914	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56ab-58a9-5559-c7680bffa790	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56ab-58a9-c14f-ba5353916568	DogodekTrait-read	DogodekTrait - branje	t
00030000-56ab-58a9-bc5f-0cda85f0156f	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56ab-58a9-ef29-873fa47de6b2	DrugiVir-read	DrugiVir - branje	t
00030000-56ab-58a9-0692-ec859e0f0509	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56ab-58a9-504c-f67bbf9c0142	Drzava-read	Drzava - branje	t
00030000-56ab-58a9-3a1f-d985a384dbef	Drzava-write	Drzava - spreminjanje	t
00030000-56ab-58a9-5255-f18729eb5aa9	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56ab-58a9-d6d5-f415b545c8de	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56ab-58a9-c7d9-cf5f46b75c37	Funkcija-read	Funkcija - branje	t
00030000-56ab-58a9-aaac-419e1e9eedb8	Funkcija-write	Funkcija - spreminjanje	t
00030000-56ab-58a9-b3eb-3b60242db5aa	Gostovanje-read	Gostovanje - branje	t
00030000-56ab-58a9-38f1-de26e06f9510	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56ab-58a9-2819-507312b12e81	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56ab-58a9-d6f2-7b7138b60fdd	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56ab-58a9-68a2-5e86600364b7	Kupec-read	Kupec - branje	t
00030000-56ab-58a9-0c73-b66eb17b10a6	Kupec-write	Kupec - spreminjanje	t
00030000-56ab-58a9-7239-db2fcf5e55ba	NacinPlacina-read	NacinPlacina - branje	t
00030000-56ab-58a9-d514-ae89510f4c8c	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56ab-58a9-2830-eb8e4a4f6039	Option-read	Option - branje	t
00030000-56ab-58a9-a226-a3f3948a1d0e	Option-write	Option - spreminjanje	t
00030000-56ab-58a9-1731-663f6e7d73c3	OptionValue-read	OptionValue - branje	t
00030000-56ab-58a9-a1e6-1dbcd1793923	OptionValue-write	OptionValue - spreminjanje	t
00030000-56ab-58a9-19ec-687cc6a66366	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56ab-58a9-eba7-30da2185ab7e	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56ab-58a9-8654-2454342fd8a4	Oseba-read	Oseba - branje	t
00030000-56ab-58a9-402a-ec3beb313fb7	Oseba-write	Oseba - spreminjanje	t
00030000-56ab-58a9-398b-0e1f18fb258a	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56ab-58a9-efa0-babd39f420d0	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56ab-58a9-3d0a-eab06b972b0d	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56ab-58a9-aa67-cb581b0b9b4e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56ab-58a9-3df4-208936d1ad7f	Pogodba-read	Pogodba - branje	t
00030000-56ab-58a9-5f4f-41b6b984aff4	Pogodba-write	Pogodba - spreminjanje	t
00030000-56ab-58a9-0c31-7884f30c1536	Popa-read	Popa - branje	t
00030000-56ab-58a9-297e-ba4f852e8173	Popa-write	Popa - spreminjanje	t
00030000-56ab-58a9-eb55-b359a2abd87d	Posta-read	Posta - branje	t
00030000-56ab-58a9-7abc-16be32dc9e91	Posta-write	Posta - spreminjanje	t
00030000-56ab-58a9-3938-d82f579410cd	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56ab-58a9-ab09-a45f1930aa88	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56ab-58a9-eb00-400156f64337	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56ab-58a9-4147-6ff482938076	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56ab-58a9-6539-4c1ae500fa7a	PostniNaslov-read	PostniNaslov - branje	t
00030000-56ab-58a9-d95e-7a8a938ef528	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56ab-58a9-6b2b-b31d30fec408	Praznik-read	Praznik - branje	t
00030000-56ab-58a9-94f1-6d93c73be465	Praznik-write	Praznik - spreminjanje	t
00030000-56ab-58a9-f5f5-e4523907aa20	Predstava-read	Predstava - branje	t
00030000-56ab-58a9-3b80-6550139bd663	Predstava-write	Predstava - spreminjanje	t
00030000-56ab-58a9-b2e7-f006093579d3	Ura-read	Ura - branje	t
00030000-56ab-58a9-13f0-152133a18be9	Ura-write	Ura - spreminjanje	t
00030000-56ab-58a9-fa5c-1e0f6996b08a	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56ab-58a9-2563-a13742696d56	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56ab-58a9-20c2-3d9cb5f5d584	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56ab-58a9-525f-b601afc407fe	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56ab-58a9-85bd-27724cf8256e	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56ab-58a9-83a6-102cde74aa39	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56ab-58a9-a95e-e14b9f2cb04a	ProgramDela-read	ProgramDela - branje	t
00030000-56ab-58a9-8e68-460a340e2c1b	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56ab-58a9-726d-dc915a81cf64	ProgramFestival-read	ProgramFestival - branje	t
00030000-56ab-58a9-5b11-88d05ac7dfff	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56ab-58a9-9ba0-f019314cbc90	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56ab-58a9-4f05-13f9f7eb1544	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56ab-58a9-a6fb-e7debe9930a8	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56ab-58a9-66c2-f27a1c339c46	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56ab-58a9-3264-4263c29927bf	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56ab-58a9-ce86-98eb16987893	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56ab-58a9-6c63-210371d4dd0b	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56ab-58a9-5275-7b93b1fb2fd1	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56ab-58a9-d4af-2663abf3c7da	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56ab-58a9-103f-da38aa898bda	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56ab-58a9-fdde-db9452fc3a91	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56ab-58a9-311a-8b16e1b26ff3	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56ab-58a9-2d8f-bafaad1dd7f7	ProgramRazno-read	ProgramRazno - branje	t
00030000-56ab-58a9-80ae-aa4c694564ea	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56ab-58a9-e5fd-6d443990ce88	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56ab-58a9-3125-49a89085405e	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56ab-58a9-8e38-71e68fcf0bbb	Prostor-read	Prostor - branje	t
00030000-56ab-58a9-8972-58e30b3ea279	Prostor-write	Prostor - spreminjanje	t
00030000-56ab-58a9-f23c-12567f41d090	Racun-read	Racun - branje	t
00030000-56ab-58a9-8ab0-26c0c71231c3	Racun-write	Racun - spreminjanje	t
00030000-56ab-58a9-9e15-f3cb5e5f5037	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56ab-58a9-39b5-448528f1fa4d	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56ab-58a9-c78b-8a2e0bc21bce	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56ab-58a9-b5a4-66482e66f43e	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56ab-58a9-37c5-d09f58ea59cb	Rekvizit-read	Rekvizit - branje	t
00030000-56ab-58a9-eb6a-62a9f2823dbd	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56ab-58a9-c213-e23af9a83236	Revizija-read	Revizija - branje	t
00030000-56ab-58a9-b019-7a25279ecbbc	Revizija-write	Revizija - spreminjanje	t
00030000-56ab-58a9-0020-8c6200192ac6	Rezervacija-read	Rezervacija - branje	t
00030000-56ab-58a9-b8b5-d59797b614d1	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56ab-58a9-8776-f2fcb7491abb	SedezniRed-read	SedezniRed - branje	t
00030000-56ab-58a9-a7ad-56012fb912ad	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56ab-58a9-85c2-f654475e70e2	Sedez-read	Sedez - branje	t
00030000-56ab-58a9-b9f2-edfa9f83af2f	Sedez-write	Sedez - spreminjanje	t
00030000-56ab-58a9-e6e2-66bc4c2d8b2b	Sezona-read	Sezona - branje	t
00030000-56ab-58a9-bafc-b512406d6e86	Sezona-write	Sezona - spreminjanje	t
00030000-56ab-58a9-96f1-3d19ab9982db	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56ab-58a9-914b-eb3ab486dadb	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56ab-58a9-ee47-68115a333d1a	Telefonska-read	Telefonska - branje	t
00030000-56ab-58a9-4e60-5ddc4026bb4c	Telefonska-write	Telefonska - spreminjanje	t
00030000-56ab-58a9-173e-474a079dfdc7	TerminStoritve-read	TerminStoritve - branje	t
00030000-56ab-58a9-9490-f34dbb12fdf8	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56ab-58a9-04e9-4337489f1e24	TipDodatka-read	TipDodatka - branje	t
00030000-56ab-58a9-f703-db36db837931	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56ab-58a9-12b9-68459cdffd54	TipFunkcije-read	TipFunkcije - branje	t
00030000-56ab-58a9-85ff-071fe14a6a01	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56ab-58a9-0715-2c8bd3771283	TipPopa-read	TipPopa - branje	t
00030000-56ab-58a9-3312-bc867d5ac98c	TipPopa-write	TipPopa - spreminjanje	t
00030000-56ab-58a9-c8f0-252a040fd0f7	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56ab-58a9-76a3-bf9158e7ff6d	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56ab-58a9-5163-a0a2370b8407	TipVaje-read	TipVaje - branje	t
00030000-56ab-58a9-2413-dc5ba507b43c	TipVaje-write	TipVaje - spreminjanje	t
00030000-56ab-58a9-59be-b057279384a4	Trr-read	Trr - branje	t
00030000-56ab-58a9-6ba6-d7c5315dc4d5	Trr-write	Trr - spreminjanje	t
00030000-56ab-58a9-4e3f-82a827785de6	Uprizoritev-read	Uprizoritev - branje	t
00030000-56ab-58a9-342f-8c790c1ba9cb	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56ab-58a9-2147-978295a1d6d7	Vaja-read	Vaja - branje	t
00030000-56ab-58a9-3532-ffb6637b60d5	Vaja-write	Vaja - spreminjanje	t
00030000-56ab-58a9-b439-32927dac0e82	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56ab-58a9-fc18-7ef54a99c6c4	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56ab-58a9-6a67-c570dac1d794	VrstaStroska-read	VrstaStroska - branje	t
00030000-56ab-58a9-11a6-578694649124	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56ab-58a9-ad63-2fb77ed14d85	Zaposlitev-read	Zaposlitev - branje	t
00030000-56ab-58a9-f0c3-39053ea2145c	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56ab-58a9-7908-6c572db185ec	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56ab-58a9-5da4-de74b27dcd4b	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56ab-58a9-5f58-7ba7cd9fed47	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56ab-58a9-4632-187f25013b26	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56ab-58a9-0071-1eee97150b23	Job-read	Branje opravil - samo zase - branje	t
00030000-56ab-58a9-a2ae-9ccf399d7bfe	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56ab-58a9-c8c0-972f95126f09	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56ab-58a9-8623-e168e469fda0	Report-read	Report - branje	t
00030000-56ab-58a9-26e5-fda173ce90fd	Report-write	Report - spreminjanje	t
00030000-56ab-58a9-7d0e-c99b69563157	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56ab-58a9-d314-0af25f450112	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56ab-58a9-f81b-0ed6a9420953	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56ab-58a9-59a6-4b3e8faf23a7	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56ab-58a9-7687-2a985a23e100	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56ab-58a9-671e-78943f496f11	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56ab-58a9-1432-2e21db5f9f30	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56ab-58a9-2b25-da23ab9fd012	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56ab-58a9-3167-66e7ada4e894	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56ab-58a9-01db-1c2ee3c0ab1a	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56ab-58a9-bbe7-2765cf78e476	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56ab-58a9-28ea-509ec531e1d1	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56ab-58a9-fb49-a918dec6dbf2	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56ab-58a9-836a-ac18a1cc83cf	Datoteka-write	Datoteka - spreminjanje	t
00030000-56ab-58a9-4403-5d3852b89d8d	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 41823361)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56ab-58a9-30ad-2278874dd030	00030000-56ab-58a9-92a0-2f4d012d54cf
00020000-56ab-58a9-30ad-2278874dd030	00030000-56ab-58a9-c64c-e3deca0a516f
00020000-56ab-58a9-be80-53fd7ea5c827	00030000-56ab-58a9-504c-f67bbf9c0142
00020000-56ab-58a9-16b0-f811aa11b112	00030000-56ab-58a9-c4c3-d40f5657b742
00020000-56ab-58a9-16b0-f811aa11b112	00030000-56ab-58a9-8051-042e16617e73
00020000-56ab-58a9-16b0-f811aa11b112	00030000-56ab-58a9-836a-ac18a1cc83cf
00020000-56ab-58a9-16b0-f811aa11b112	00030000-56ab-58a9-402a-ec3beb313fb7
00020000-56ab-58a9-16b0-f811aa11b112	00030000-56ab-58a9-2b25-da23ab9fd012
00020000-56ab-58a9-16b0-f811aa11b112	00030000-56ab-58a9-01db-1c2ee3c0ab1a
00020000-56ab-58a9-16b0-f811aa11b112	00030000-56ab-58a9-553b-12cf20fa1d41
00020000-56ab-58a9-16b0-f811aa11b112	00030000-56ab-58a9-4fa7-900c5b8fafee
00020000-56ab-58a9-16b0-f811aa11b112	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58a9-16b0-f811aa11b112	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58a9-16b0-f811aa11b112	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58a9-16b0-f811aa11b112	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58a9-5172-d32419759ab2	00030000-56ab-58a9-553b-12cf20fa1d41
00020000-56ab-58a9-5172-d32419759ab2	00030000-56ab-58a9-4fa7-900c5b8fafee
00020000-56ab-58a9-5172-d32419759ab2	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58a9-5172-d32419759ab2	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58a9-5172-d32419759ab2	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58a9-5172-d32419759ab2	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58a9-3c59-e23abac7ea79	00030000-56ab-58a9-ad63-2fb77ed14d85
00020000-56ab-58a9-3c59-e23abac7ea79	00030000-56ab-58a9-f0c3-39053ea2145c
00020000-56ab-58a9-3c59-e23abac7ea79	00030000-56ab-58a9-3411-a6591308d528
00020000-56ab-58a9-3c59-e23abac7ea79	00030000-56ab-58a9-b094-0b51f0d0a122
00020000-56ab-58a9-3c59-e23abac7ea79	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58a9-3c59-e23abac7ea79	00030000-56ab-58a9-402a-ec3beb313fb7
00020000-56ab-58a9-3c59-e23abac7ea79	00030000-56ab-58a9-19ec-687cc6a66366
00020000-56ab-58a9-6735-234561a26446	00030000-56ab-58a9-ad63-2fb77ed14d85
00020000-56ab-58a9-6735-234561a26446	00030000-56ab-58a9-3411-a6591308d528
00020000-56ab-58a9-6735-234561a26446	00030000-56ab-58a9-19ec-687cc6a66366
00020000-56ab-58a9-9875-d262cd8aa05a	00030000-56ab-58a9-402a-ec3beb313fb7
00020000-56ab-58a9-9875-d262cd8aa05a	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58a9-9875-d262cd8aa05a	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58a9-9875-d262cd8aa05a	00030000-56ab-58a9-836a-ac18a1cc83cf
00020000-56ab-58a9-9875-d262cd8aa05a	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58a9-9875-d262cd8aa05a	00030000-56ab-58a9-01db-1c2ee3c0ab1a
00020000-56ab-58a9-9875-d262cd8aa05a	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58a9-9875-d262cd8aa05a	00030000-56ab-58a9-2b25-da23ab9fd012
00020000-56ab-58a9-723e-035c4badb407	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58a9-723e-035c4badb407	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58a9-723e-035c4badb407	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58a9-723e-035c4badb407	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58a9-5afe-3fce32059218	00030000-56ab-58a9-402a-ec3beb313fb7
00020000-56ab-58a9-5afe-3fce32059218	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58a9-5afe-3fce32059218	00030000-56ab-58a9-3411-a6591308d528
00020000-56ab-58a9-5afe-3fce32059218	00030000-56ab-58a9-b094-0b51f0d0a122
00020000-56ab-58a9-5afe-3fce32059218	00030000-56ab-58a9-59be-b057279384a4
00020000-56ab-58a9-5afe-3fce32059218	00030000-56ab-58a9-6ba6-d7c5315dc4d5
00020000-56ab-58a9-5afe-3fce32059218	00030000-56ab-58a9-6539-4c1ae500fa7a
00020000-56ab-58a9-5afe-3fce32059218	00030000-56ab-58a9-d95e-7a8a938ef528
00020000-56ab-58a9-5afe-3fce32059218	00030000-56ab-58a9-ee47-68115a333d1a
00020000-56ab-58a9-5afe-3fce32059218	00030000-56ab-58a9-4e60-5ddc4026bb4c
00020000-56ab-58a9-5afe-3fce32059218	00030000-56ab-58a9-504c-f67bbf9c0142
00020000-56ab-58a9-5afe-3fce32059218	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58a9-d7c7-ee478356124b	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58a9-d7c7-ee478356124b	00030000-56ab-58a9-3411-a6591308d528
00020000-56ab-58a9-d7c7-ee478356124b	00030000-56ab-58a9-59be-b057279384a4
00020000-56ab-58a9-d7c7-ee478356124b	00030000-56ab-58a9-6539-4c1ae500fa7a
00020000-56ab-58a9-d7c7-ee478356124b	00030000-56ab-58a9-ee47-68115a333d1a
00020000-56ab-58a9-d7c7-ee478356124b	00030000-56ab-58a9-504c-f67bbf9c0142
00020000-56ab-58a9-d7c7-ee478356124b	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-ee47-68115a333d1a
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-6539-4c1ae500fa7a
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-59be-b057279384a4
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-0c31-7884f30c1536
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-2819-507312b12e81
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-85bd-27724cf8256e
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-4e60-5ddc4026bb4c
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-d95e-7a8a938ef528
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-2b25-da23ab9fd012
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-6ba6-d7c5315dc4d5
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-297e-ba4f852e8173
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-836a-ac18a1cc83cf
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-01db-1c2ee3c0ab1a
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-d6f2-7b7138b60fdd
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-83a6-102cde74aa39
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-504c-f67bbf9c0142
00020000-56ab-58a9-bc54-4127b7dd0d28	00030000-56ab-58a9-0715-2c8bd3771283
00020000-56ab-58aa-7dc5-b1d30e53ab1a	00030000-56ab-58a9-ee47-68115a333d1a
00020000-56ab-58aa-7dc5-b1d30e53ab1a	00030000-56ab-58a9-6539-4c1ae500fa7a
00020000-56ab-58aa-7dc5-b1d30e53ab1a	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58aa-7dc5-b1d30e53ab1a	00030000-56ab-58a9-59be-b057279384a4
00020000-56ab-58aa-7dc5-b1d30e53ab1a	00030000-56ab-58a9-0c31-7884f30c1536
00020000-56ab-58aa-7dc5-b1d30e53ab1a	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58aa-7dc5-b1d30e53ab1a	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58aa-7dc5-b1d30e53ab1a	00030000-56ab-58a9-2819-507312b12e81
00020000-56ab-58aa-7dc5-b1d30e53ab1a	00030000-56ab-58a9-85bd-27724cf8256e
00020000-56ab-58aa-7dc5-b1d30e53ab1a	00030000-56ab-58a9-504c-f67bbf9c0142
00020000-56ab-58aa-7dc5-b1d30e53ab1a	00030000-56ab-58a9-0715-2c8bd3771283
00020000-56ab-58aa-74ed-bc96ea3044ae	00030000-56ab-58a9-0715-2c8bd3771283
00020000-56ab-58aa-74ed-bc96ea3044ae	00030000-56ab-58a9-3312-bc867d5ac98c
00020000-56ab-58aa-e27a-b78bbb1e745b	00030000-56ab-58a9-0715-2c8bd3771283
00020000-56ab-58aa-739c-76768cc74826	00030000-56ab-58a9-eb55-b359a2abd87d
00020000-56ab-58aa-739c-76768cc74826	00030000-56ab-58a9-7abc-16be32dc9e91
00020000-56ab-58aa-129b-f2ad6f0a1d3d	00030000-56ab-58a9-eb55-b359a2abd87d
00020000-56ab-58aa-3b72-1a7de73b8c1b	00030000-56ab-58a9-504c-f67bbf9c0142
00020000-56ab-58aa-3b72-1a7de73b8c1b	00030000-56ab-58a9-3a1f-d985a384dbef
00020000-56ab-58aa-4440-51ba61b5f465	00030000-56ab-58a9-504c-f67bbf9c0142
00020000-56ab-58aa-2400-3cd107179054	00030000-56ab-58a9-5f58-7ba7cd9fed47
00020000-56ab-58aa-2400-3cd107179054	00030000-56ab-58a9-4632-187f25013b26
00020000-56ab-58aa-8e72-f5d3da7fd4db	00030000-56ab-58a9-5f58-7ba7cd9fed47
00020000-56ab-58aa-c5d0-1b05f67bc11e	00030000-56ab-58a9-7908-6c572db185ec
00020000-56ab-58aa-c5d0-1b05f67bc11e	00030000-56ab-58a9-5da4-de74b27dcd4b
00020000-56ab-58aa-1dea-ecef02cc50b4	00030000-56ab-58a9-7908-6c572db185ec
00020000-56ab-58aa-cd04-453696ad036c	00030000-56ab-58a9-701f-5b2fa5d044d8
00020000-56ab-58aa-cd04-453696ad036c	00030000-56ab-58a9-611a-a650b351b80c
00020000-56ab-58aa-92a3-50ac2ba6a4db	00030000-56ab-58a9-701f-5b2fa5d044d8
00020000-56ab-58aa-22c8-2788c85573d9	00030000-56ab-58a9-8e38-71e68fcf0bbb
00020000-56ab-58aa-22c8-2788c85573d9	00030000-56ab-58a9-8972-58e30b3ea279
00020000-56ab-58aa-22c8-2788c85573d9	00030000-56ab-58a9-0c31-7884f30c1536
00020000-56ab-58aa-22c8-2788c85573d9	00030000-56ab-58a9-6539-4c1ae500fa7a
00020000-56ab-58aa-22c8-2788c85573d9	00030000-56ab-58a9-d95e-7a8a938ef528
00020000-56ab-58aa-22c8-2788c85573d9	00030000-56ab-58a9-504c-f67bbf9c0142
00020000-56ab-58aa-5e02-831dc896f658	00030000-56ab-58a9-8e38-71e68fcf0bbb
00020000-56ab-58aa-5e02-831dc896f658	00030000-56ab-58a9-0c31-7884f30c1536
00020000-56ab-58aa-5e02-831dc896f658	00030000-56ab-58a9-6539-4c1ae500fa7a
00020000-56ab-58aa-0571-d78287996cb5	00030000-56ab-58a9-6a67-c570dac1d794
00020000-56ab-58aa-0571-d78287996cb5	00030000-56ab-58a9-11a6-578694649124
00020000-56ab-58aa-b645-cf5db2d3f784	00030000-56ab-58a9-6a67-c570dac1d794
00020000-56ab-58aa-217e-60432b4dfab2	00030000-56ab-58a9-eba7-30da2185ab7e
00020000-56ab-58aa-217e-60432b4dfab2	00030000-56ab-58a9-19ec-687cc6a66366
00020000-56ab-58aa-217e-60432b4dfab2	00030000-56ab-58a9-ad63-2fb77ed14d85
00020000-56ab-58aa-217e-60432b4dfab2	00030000-56ab-58a9-836a-ac18a1cc83cf
00020000-56ab-58aa-217e-60432b4dfab2	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58aa-217e-60432b4dfab2	00030000-56ab-58a9-2b25-da23ab9fd012
00020000-56ab-58aa-217e-60432b4dfab2	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58aa-217e-60432b4dfab2	00030000-56ab-58a9-01db-1c2ee3c0ab1a
00020000-56ab-58aa-217e-60432b4dfab2	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58aa-f376-0e9f39b32eaf	00030000-56ab-58a9-19ec-687cc6a66366
00020000-56ab-58aa-f376-0e9f39b32eaf	00030000-56ab-58a9-ad63-2fb77ed14d85
00020000-56ab-58aa-f376-0e9f39b32eaf	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58aa-f376-0e9f39b32eaf	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58aa-f376-0e9f39b32eaf	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58aa-55f0-5fa6521917dc	00030000-56ab-58a9-5163-a0a2370b8407
00020000-56ab-58aa-55f0-5fa6521917dc	00030000-56ab-58a9-2413-dc5ba507b43c
00020000-56ab-58aa-6d24-31dc17df3bd0	00030000-56ab-58a9-5163-a0a2370b8407
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-d78b-4528f53593ee
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-bc1c-fc425882b94f
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-a95e-e14b9f2cb04a
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-8e68-460a340e2c1b
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-726d-dc915a81cf64
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-5b11-88d05ac7dfff
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-9ba0-f019314cbc90
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-4f05-13f9f7eb1544
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-a6fb-e7debe9930a8
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-66c2-f27a1c339c46
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-3264-4263c29927bf
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-ce86-98eb16987893
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-6c63-210371d4dd0b
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-5275-7b93b1fb2fd1
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-d4af-2663abf3c7da
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-103f-da38aa898bda
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-fdde-db9452fc3a91
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-311a-8b16e1b26ff3
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-2d8f-bafaad1dd7f7
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-80ae-aa4c694564ea
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-e5fd-6d443990ce88
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-3125-49a89085405e
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-525f-b601afc407fe
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-0692-ec859e0f0509
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-ab09-a45f1930aa88
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-a2ae-9ccf399d7bfe
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-ef29-873fa47de6b2
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-20c2-3d9cb5f5d584
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-85bd-27724cf8256e
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-3938-d82f579410cd
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-6a67-c570dac1d794
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-4e3f-82a827785de6
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-96f1-3d19ab9982db
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-c7d9-cf5f46b75c37
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-618f-471fd9314546
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-12b9-68459cdffd54
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-3df4-208936d1ad7f
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-504c-f67bbf9c0142
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-0c31-7884f30c1536
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-836a-ac18a1cc83cf
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-2b25-da23ab9fd012
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-01db-1c2ee3c0ab1a
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-0071-1eee97150b23
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58aa-4d0e-ab4171555022	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58aa-2384-5abd05f3b9b7	00030000-56ab-58a9-a95e-e14b9f2cb04a
00020000-56ab-58aa-2384-5abd05f3b9b7	00030000-56ab-58a9-726d-dc915a81cf64
00020000-56ab-58aa-2384-5abd05f3b9b7	00030000-56ab-58a9-9ba0-f019314cbc90
00020000-56ab-58aa-2384-5abd05f3b9b7	00030000-56ab-58a9-a6fb-e7debe9930a8
00020000-56ab-58aa-2384-5abd05f3b9b7	00030000-56ab-58a9-3264-4263c29927bf
00020000-56ab-58aa-2384-5abd05f3b9b7	00030000-56ab-58a9-6c63-210371d4dd0b
00020000-56ab-58aa-2384-5abd05f3b9b7	00030000-56ab-58a9-d4af-2663abf3c7da
00020000-56ab-58aa-2384-5abd05f3b9b7	00030000-56ab-58a9-fdde-db9452fc3a91
00020000-56ab-58aa-2384-5abd05f3b9b7	00030000-56ab-58a9-2d8f-bafaad1dd7f7
00020000-56ab-58aa-2384-5abd05f3b9b7	00030000-56ab-58a9-e5fd-6d443990ce88
00020000-56ab-58aa-2384-5abd05f3b9b7	00030000-56ab-58a9-20c2-3d9cb5f5d584
00020000-56ab-58aa-2384-5abd05f3b9b7	00030000-56ab-58a9-ef29-873fa47de6b2
00020000-56ab-58aa-2384-5abd05f3b9b7	00030000-56ab-58a9-3938-d82f579410cd
00020000-56ab-58aa-2384-5abd05f3b9b7	00030000-56ab-58a9-504c-f67bbf9c0142
00020000-56ab-58aa-2384-5abd05f3b9b7	00030000-56ab-58a9-0071-1eee97150b23
00020000-56ab-58aa-2384-5abd05f3b9b7	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58aa-2384-5abd05f3b9b7	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58aa-2384-5abd05f3b9b7	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58aa-bc85-77b19f203d33	00030000-56ab-58a9-4e3f-82a827785de6
00020000-56ab-58aa-bc85-77b19f203d33	00030000-56ab-58a9-342f-8c790c1ba9cb
00020000-56ab-58aa-bc85-77b19f203d33	00030000-56ab-58a9-618f-471fd9314546
00020000-56ab-58aa-bc85-77b19f203d33	00030000-56ab-58a9-6b81-3266ca47d1e6
00020000-56ab-58aa-bc85-77b19f203d33	00030000-56ab-58a9-2f5c-eea2b4e64cee
00020000-56ab-58aa-bc85-77b19f203d33	00030000-56ab-58a9-4fa7-900c5b8fafee
00020000-56ab-58aa-bc85-77b19f203d33	00030000-56ab-58a9-c7d9-cf5f46b75c37
00020000-56ab-58aa-bc85-77b19f203d33	00030000-56ab-58a9-aaac-419e1e9eedb8
00020000-56ab-58aa-bc85-77b19f203d33	00030000-56ab-58a9-c387-05da4303bfa3
00020000-56ab-58aa-bc85-77b19f203d33	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58aa-bc85-77b19f203d33	00030000-56ab-58a9-85bd-27724cf8256e
00020000-56ab-58aa-bc85-77b19f203d33	00030000-56ab-58a9-12b9-68459cdffd54
00020000-56ab-58aa-bc85-77b19f203d33	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58aa-bc85-77b19f203d33	00030000-56ab-58a9-836a-ac18a1cc83cf
00020000-56ab-58aa-bc85-77b19f203d33	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58aa-bc85-77b19f203d33	00030000-56ab-58a9-2b25-da23ab9fd012
00020000-56ab-58aa-bc85-77b19f203d33	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58aa-bc85-77b19f203d33	00030000-56ab-58a9-01db-1c2ee3c0ab1a
00020000-56ab-58aa-b373-d530e2c04a08	00030000-56ab-58a9-4e3f-82a827785de6
00020000-56ab-58aa-b373-d530e2c04a08	00030000-56ab-58a9-618f-471fd9314546
00020000-56ab-58aa-b373-d530e2c04a08	00030000-56ab-58a9-4fa7-900c5b8fafee
00020000-56ab-58aa-b373-d530e2c04a08	00030000-56ab-58a9-c7d9-cf5f46b75c37
00020000-56ab-58aa-b373-d530e2c04a08	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58aa-b373-d530e2c04a08	00030000-56ab-58a9-85bd-27724cf8256e
00020000-56ab-58aa-b373-d530e2c04a08	00030000-56ab-58a9-12b9-68459cdffd54
00020000-56ab-58aa-b373-d530e2c04a08	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58aa-b373-d530e2c04a08	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58aa-b373-d530e2c04a08	00030000-56ab-58a9-2b25-da23ab9fd012
00020000-56ab-58aa-b373-d530e2c04a08	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58aa-3bfd-d695012fb92b	00030000-56ab-58a9-618f-471fd9314546
00020000-56ab-58aa-3bfd-d695012fb92b	00030000-56ab-58a9-6b81-3266ca47d1e6
00020000-56ab-58aa-3bfd-d695012fb92b	00030000-56ab-58a9-c7d9-cf5f46b75c37
00020000-56ab-58aa-3bfd-d695012fb92b	00030000-56ab-58a9-aaac-419e1e9eedb8
00020000-56ab-58aa-3bfd-d695012fb92b	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58aa-3bfd-d695012fb92b	00030000-56ab-58a9-12b9-68459cdffd54
00020000-56ab-58aa-3bfd-d695012fb92b	00030000-56ab-58a9-4e3f-82a827785de6
00020000-56ab-58aa-3bfd-d695012fb92b	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58aa-2f8c-3db5bd03abf7	00030000-56ab-58a9-618f-471fd9314546
00020000-56ab-58aa-2f8c-3db5bd03abf7	00030000-56ab-58a9-6b81-3266ca47d1e6
00020000-56ab-58aa-2f8c-3db5bd03abf7	00030000-56ab-58a9-2f5c-eea2b4e64cee
00020000-56ab-58aa-2f8c-3db5bd03abf7	00030000-56ab-58a9-c7d9-cf5f46b75c37
00020000-56ab-58aa-2f8c-3db5bd03abf7	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58aa-2f8c-3db5bd03abf7	00030000-56ab-58a9-3411-a6591308d528
00020000-56ab-58aa-2f8c-3db5bd03abf7	00030000-56ab-58a9-b094-0b51f0d0a122
00020000-56ab-58aa-2f8c-3db5bd03abf7	00030000-56ab-58a9-3df4-208936d1ad7f
00020000-56ab-58aa-2f8c-3db5bd03abf7	00030000-56ab-58a9-5f4f-41b6b984aff4
00020000-56ab-58aa-2f8c-3db5bd03abf7	00030000-56ab-58a9-0c31-7884f30c1536
00020000-56ab-58aa-2f8c-3db5bd03abf7	00030000-56ab-58a9-85bd-27724cf8256e
00020000-56ab-58aa-2f8c-3db5bd03abf7	00030000-56ab-58a9-96f1-3d19ab9982db
00020000-56ab-58aa-2f8c-3db5bd03abf7	00030000-56ab-58a9-914b-eb3ab486dadb
00020000-56ab-58aa-2f8c-3db5bd03abf7	00030000-56ab-58a9-12b9-68459cdffd54
00020000-56ab-58aa-2f8c-3db5bd03abf7	00030000-56ab-58a9-59be-b057279384a4
00020000-56ab-58aa-2f8c-3db5bd03abf7	00030000-56ab-58a9-4e3f-82a827785de6
00020000-56ab-58aa-2f8c-3db5bd03abf7	00030000-56ab-58a9-ad63-2fb77ed14d85
00020000-56ab-58aa-efec-5367fdb89d42	00030000-56ab-58a9-618f-471fd9314546
00020000-56ab-58aa-efec-5367fdb89d42	00030000-56ab-58a9-c7d9-cf5f46b75c37
00020000-56ab-58aa-efec-5367fdb89d42	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58aa-efec-5367fdb89d42	00030000-56ab-58a9-3411-a6591308d528
00020000-56ab-58aa-efec-5367fdb89d42	00030000-56ab-58a9-3df4-208936d1ad7f
00020000-56ab-58aa-efec-5367fdb89d42	00030000-56ab-58a9-0c31-7884f30c1536
00020000-56ab-58aa-efec-5367fdb89d42	00030000-56ab-58a9-85bd-27724cf8256e
00020000-56ab-58aa-efec-5367fdb89d42	00030000-56ab-58a9-96f1-3d19ab9982db
00020000-56ab-58aa-efec-5367fdb89d42	00030000-56ab-58a9-12b9-68459cdffd54
00020000-56ab-58aa-efec-5367fdb89d42	00030000-56ab-58a9-59be-b057279384a4
00020000-56ab-58aa-efec-5367fdb89d42	00030000-56ab-58a9-4e3f-82a827785de6
00020000-56ab-58aa-efec-5367fdb89d42	00030000-56ab-58a9-ad63-2fb77ed14d85
00020000-56ab-58aa-6931-8aad391dd46d	00030000-56ab-58a9-96f1-3d19ab9982db
00020000-56ab-58aa-6931-8aad391dd46d	00030000-56ab-58a9-4e3f-82a827785de6
00020000-56ab-58aa-6931-8aad391dd46d	00030000-56ab-58a9-c7d9-cf5f46b75c37
00020000-56ab-58aa-6931-8aad391dd46d	00030000-56ab-58a9-3df4-208936d1ad7f
00020000-56ab-58aa-6931-8aad391dd46d	00030000-56ab-58a9-85bd-27724cf8256e
00020000-56ab-58aa-6931-8aad391dd46d	00030000-56ab-58a9-12b9-68459cdffd54
00020000-56ab-58aa-6931-8aad391dd46d	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58aa-5493-7bbf1a736089	00030000-56ab-58a9-96f1-3d19ab9982db
00020000-56ab-58aa-5493-7bbf1a736089	00030000-56ab-58a9-914b-eb3ab486dadb
00020000-56ab-58aa-5493-7bbf1a736089	00030000-56ab-58a9-4e3f-82a827785de6
00020000-56ab-58aa-5493-7bbf1a736089	00030000-56ab-58a9-0c31-7884f30c1536
00020000-56ab-58aa-1089-4a5ab0221b2a	00030000-56ab-58a9-96f1-3d19ab9982db
00020000-56ab-58aa-1089-4a5ab0221b2a	00030000-56ab-58a9-4e3f-82a827785de6
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-701f-5b2fa5d044d8
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-618f-471fd9314546
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-6b81-3266ca47d1e6
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-2f5c-eea2b4e64cee
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-553b-12cf20fa1d41
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-c4c3-d40f5657b742
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-4fa7-900c5b8fafee
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-8051-042e16617e73
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-836a-ac18a1cc83cf
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-ef29-873fa47de6b2
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-0692-ec859e0f0509
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-504c-f67bbf9c0142
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-c7d9-cf5f46b75c37
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-aaac-419e1e9eedb8
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-c387-05da4303bfa3
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-0071-1eee97150b23
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-a2ae-9ccf399d7bfe
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-2819-507312b12e81
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-19ec-687cc6a66366
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-402a-ec3beb313fb7
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-3411-a6591308d528
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-b094-0b51f0d0a122
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-3df4-208936d1ad7f
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-5f4f-41b6b984aff4
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-0c31-7884f30c1536
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-eb55-b359a2abd87d
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-3938-d82f579410cd
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-ab09-a45f1930aa88
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-6539-4c1ae500fa7a
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-20c2-3d9cb5f5d584
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-525f-b601afc407fe
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-85bd-27724cf8256e
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-d78b-4528f53593ee
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-a95e-e14b9f2cb04a
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-bc1c-fc425882b94f
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-8e68-460a340e2c1b
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-726d-dc915a81cf64
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-5b11-88d05ac7dfff
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-9ba0-f019314cbc90
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-4f05-13f9f7eb1544
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-a6fb-e7debe9930a8
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-66c2-f27a1c339c46
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-3264-4263c29927bf
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-ce86-98eb16987893
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-6c63-210371d4dd0b
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-5275-7b93b1fb2fd1
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-d4af-2663abf3c7da
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-103f-da38aa898bda
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-fdde-db9452fc3a91
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-311a-8b16e1b26ff3
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-2d8f-bafaad1dd7f7
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-80ae-aa4c694564ea
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-e5fd-6d443990ce88
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-3125-49a89085405e
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-8e38-71e68fcf0bbb
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-96f1-3d19ab9982db
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-914b-eb3ab486dadb
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-ee47-68115a333d1a
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-12b9-68459cdffd54
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-0715-2c8bd3771283
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-5163-a0a2370b8407
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-59be-b057279384a4
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-4e3f-82a827785de6
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-342f-8c790c1ba9cb
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-6a67-c570dac1d794
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-01db-1c2ee3c0ab1a
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-2b25-da23ab9fd012
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-ad63-2fb77ed14d85
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-7908-6c572db185ec
00020000-56ab-58aa-25b2-ff99f5d7f033	00030000-56ab-58a9-5f58-7ba7cd9fed47
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-701f-5b2fa5d044d8
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-618f-471fd9314546
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-553b-12cf20fa1d41
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-c4c3-d40f5657b742
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-4fa7-900c5b8fafee
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-8051-042e16617e73
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-836a-ac18a1cc83cf
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-504c-f67bbf9c0142
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-c7d9-cf5f46b75c37
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-2819-507312b12e81
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-19ec-687cc6a66366
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-402a-ec3beb313fb7
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-3411-a6591308d528
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-0c31-7884f30c1536
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-eb55-b359a2abd87d
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-6539-4c1ae500fa7a
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-85bd-27724cf8256e
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-8e38-71e68fcf0bbb
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-ee47-68115a333d1a
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-12b9-68459cdffd54
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-0715-2c8bd3771283
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-5163-a0a2370b8407
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-59be-b057279384a4
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-4e3f-82a827785de6
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-6a67-c570dac1d794
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-01db-1c2ee3c0ab1a
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-2b25-da23ab9fd012
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-ad63-2fb77ed14d85
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-7908-6c572db185ec
00020000-56ab-58aa-7165-99c992a32074	00030000-56ab-58a9-5f58-7ba7cd9fed47
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-701f-5b2fa5d044d8
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-618f-471fd9314546
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-6b81-3266ca47d1e6
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-2f5c-eea2b4e64cee
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-553b-12cf20fa1d41
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-c4c3-d40f5657b742
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-4fa7-900c5b8fafee
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-8051-042e16617e73
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-836a-ac18a1cc83cf
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-504c-f67bbf9c0142
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-c7d9-cf5f46b75c37
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-aaac-419e1e9eedb8
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-c387-05da4303bfa3
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-2819-507312b12e81
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-19ec-687cc6a66366
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-402a-ec3beb313fb7
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-3411-a6591308d528
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-0c31-7884f30c1536
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-eb55-b359a2abd87d
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-6539-4c1ae500fa7a
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-85bd-27724cf8256e
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-8e38-71e68fcf0bbb
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-ee47-68115a333d1a
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-12b9-68459cdffd54
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-0715-2c8bd3771283
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-5163-a0a2370b8407
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-59be-b057279384a4
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-4e3f-82a827785de6
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-342f-8c790c1ba9cb
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-6a67-c570dac1d794
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-01db-1c2ee3c0ab1a
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-2b25-da23ab9fd012
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-ad63-2fb77ed14d85
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-7908-6c572db185ec
00020000-56ab-58aa-10b1-bc04344fba5a	00030000-56ab-58a9-5f58-7ba7cd9fed47
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-618f-471fd9314546
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-6b81-3266ca47d1e6
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-2f5c-eea2b4e64cee
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-553b-12cf20fa1d41
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-c4c3-d40f5657b742
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-4fa7-900c5b8fafee
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-8051-042e16617e73
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-836a-ac18a1cc83cf
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-ef29-873fa47de6b2
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-0692-ec859e0f0509
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-504c-f67bbf9c0142
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-c7d9-cf5f46b75c37
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-aaac-419e1e9eedb8
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-c387-05da4303bfa3
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-0071-1eee97150b23
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-a2ae-9ccf399d7bfe
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-2819-507312b12e81
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-d6f2-7b7138b60fdd
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-19ec-687cc6a66366
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-402a-ec3beb313fb7
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-3411-a6591308d528
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-b094-0b51f0d0a122
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-3df4-208936d1ad7f
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-5f4f-41b6b984aff4
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-0c31-7884f30c1536
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-297e-ba4f852e8173
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-eb55-b359a2abd87d
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-3938-d82f579410cd
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-ab09-a45f1930aa88
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-6539-4c1ae500fa7a
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-d95e-7a8a938ef528
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-20c2-3d9cb5f5d584
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-525f-b601afc407fe
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-85bd-27724cf8256e
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-83a6-102cde74aa39
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-d78b-4528f53593ee
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-a95e-e14b9f2cb04a
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-bc1c-fc425882b94f
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-8e68-460a340e2c1b
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-726d-dc915a81cf64
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-5b11-88d05ac7dfff
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-9ba0-f019314cbc90
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-4f05-13f9f7eb1544
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-a6fb-e7debe9930a8
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-66c2-f27a1c339c46
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-3264-4263c29927bf
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-ce86-98eb16987893
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-6c63-210371d4dd0b
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-5275-7b93b1fb2fd1
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-d4af-2663abf3c7da
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-103f-da38aa898bda
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-fdde-db9452fc3a91
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-311a-8b16e1b26ff3
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-2d8f-bafaad1dd7f7
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-80ae-aa4c694564ea
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-e5fd-6d443990ce88
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-3125-49a89085405e
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-8e38-71e68fcf0bbb
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-96f1-3d19ab9982db
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-914b-eb3ab486dadb
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-ee47-68115a333d1a
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-4e60-5ddc4026bb4c
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-12b9-68459cdffd54
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-0715-2c8bd3771283
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-59be-b057279384a4
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-6ba6-d7c5315dc4d5
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-4e3f-82a827785de6
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-342f-8c790c1ba9cb
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-6a67-c570dac1d794
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-01db-1c2ee3c0ab1a
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-2b25-da23ab9fd012
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-ad63-2fb77ed14d85
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-f0c3-39053ea2145c
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-7908-6c572db185ec
00020000-56ab-58aa-fb1f-a27fe5211ad5	00030000-56ab-58a9-5f58-7ba7cd9fed47
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-701f-5b2fa5d044d8
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-618f-471fd9314546
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-6b81-3266ca47d1e6
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-2f5c-eea2b4e64cee
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-553b-12cf20fa1d41
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-c4c3-d40f5657b742
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-4fa7-900c5b8fafee
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-8051-042e16617e73
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-836a-ac18a1cc83cf
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-504c-f67bbf9c0142
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-c7d9-cf5f46b75c37
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-aaac-419e1e9eedb8
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-c387-05da4303bfa3
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-2819-507312b12e81
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-d6f2-7b7138b60fdd
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-19ec-687cc6a66366
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-402a-ec3beb313fb7
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-3411-a6591308d528
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-b094-0b51f0d0a122
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-3df4-208936d1ad7f
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-0c31-7884f30c1536
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-297e-ba4f852e8173
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-eb55-b359a2abd87d
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-6539-4c1ae500fa7a
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-d95e-7a8a938ef528
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-85bd-27724cf8256e
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-83a6-102cde74aa39
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-8e38-71e68fcf0bbb
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-96f1-3d19ab9982db
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-ee47-68115a333d1a
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-4e60-5ddc4026bb4c
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-12b9-68459cdffd54
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-0715-2c8bd3771283
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-5163-a0a2370b8407
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-59be-b057279384a4
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-6ba6-d7c5315dc4d5
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-4e3f-82a827785de6
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-342f-8c790c1ba9cb
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-6a67-c570dac1d794
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-01db-1c2ee3c0ab1a
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-2b25-da23ab9fd012
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-ad63-2fb77ed14d85
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-f0c3-39053ea2145c
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-7908-6c572db185ec
00020000-56ab-58aa-2916-3236c0fca9fe	00030000-56ab-58a9-5f58-7ba7cd9fed47
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-701f-5b2fa5d044d8
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-618f-471fd9314546
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-6b81-3266ca47d1e6
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-553b-12cf20fa1d41
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-4fa7-900c5b8fafee
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-504c-f67bbf9c0142
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-c7d9-cf5f46b75c37
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-aaac-419e1e9eedb8
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-2819-507312b12e81
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-19ec-687cc6a66366
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-3411-a6591308d528
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-3df4-208936d1ad7f
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-0c31-7884f30c1536
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-eb55-b359a2abd87d
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-6539-4c1ae500fa7a
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-85bd-27724cf8256e
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-8e38-71e68fcf0bbb
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-96f1-3d19ab9982db
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-ee47-68115a333d1a
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-12b9-68459cdffd54
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-0715-2c8bd3771283
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-5163-a0a2370b8407
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-59be-b057279384a4
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-4e3f-82a827785de6
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-6a67-c570dac1d794
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-ad63-2fb77ed14d85
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-7908-6c572db185ec
00020000-56ab-58aa-cec8-917d6e29703c	00030000-56ab-58a9-5f58-7ba7cd9fed47
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-701f-5b2fa5d044d8
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-618f-471fd9314546
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-6b81-3266ca47d1e6
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-2f5c-eea2b4e64cee
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-4fa7-900c5b8fafee
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-836a-ac18a1cc83cf
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-ef29-873fa47de6b2
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-0692-ec859e0f0509
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-504c-f67bbf9c0142
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-c7d9-cf5f46b75c37
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-0071-1eee97150b23
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-a2ae-9ccf399d7bfe
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-2819-507312b12e81
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-d6f2-7b7138b60fdd
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-19ec-687cc6a66366
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-eba7-30da2185ab7e
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-402a-ec3beb313fb7
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-3411-a6591308d528
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-b094-0b51f0d0a122
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-3df4-208936d1ad7f
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-5f4f-41b6b984aff4
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-0c31-7884f30c1536
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-297e-ba4f852e8173
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-eb55-b359a2abd87d
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-3938-d82f579410cd
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-ab09-a45f1930aa88
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-6539-4c1ae500fa7a
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-d95e-7a8a938ef528
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-20c2-3d9cb5f5d584
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-525f-b601afc407fe
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-85bd-27724cf8256e
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-83a6-102cde74aa39
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-d78b-4528f53593ee
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-a95e-e14b9f2cb04a
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-bc1c-fc425882b94f
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-8e68-460a340e2c1b
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-726d-dc915a81cf64
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-5b11-88d05ac7dfff
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-9ba0-f019314cbc90
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-4f05-13f9f7eb1544
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-a6fb-e7debe9930a8
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-66c2-f27a1c339c46
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-3264-4263c29927bf
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-ce86-98eb16987893
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-6c63-210371d4dd0b
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-5275-7b93b1fb2fd1
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-d4af-2663abf3c7da
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-103f-da38aa898bda
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-fdde-db9452fc3a91
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-311a-8b16e1b26ff3
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-2d8f-bafaad1dd7f7
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-80ae-aa4c694564ea
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-e5fd-6d443990ce88
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-3125-49a89085405e
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-8e38-71e68fcf0bbb
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-96f1-3d19ab9982db
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-914b-eb3ab486dadb
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-ee47-68115a333d1a
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-4e60-5ddc4026bb4c
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-12b9-68459cdffd54
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-0715-2c8bd3771283
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-5163-a0a2370b8407
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-59be-b057279384a4
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-6ba6-d7c5315dc4d5
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-4e3f-82a827785de6
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-6a67-c570dac1d794
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-11a6-578694649124
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-01db-1c2ee3c0ab1a
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-2b25-da23ab9fd012
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-ad63-2fb77ed14d85
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-f0c3-39053ea2145c
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-7908-6c572db185ec
00020000-56ab-58aa-7a5d-3d1527bbf8a8	00030000-56ab-58a9-5f58-7ba7cd9fed47
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-c64c-e3deca0a516f
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-92a0-2f4d012d54cf
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-701f-5b2fa5d044d8
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-611a-a650b351b80c
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-618f-471fd9314546
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-2f5c-eea2b4e64cee
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-6b81-3266ca47d1e6
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-49ce-8022121efadc
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-26ae-c8c8de433dc1
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-51a5-e2b297332277
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-a860-1a0198bd376d
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-553b-12cf20fa1d41
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-c4c3-d40f5657b742
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-4fa7-900c5b8fafee
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-8051-042e16617e73
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-836a-ac18a1cc83cf
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-b85b-fddb6d461532
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-216f-c2708bdcdb62
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-4b2b-a64a4026deab
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-bdf5-a63252196dff
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-4050-74dfe6da1914
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-5559-c7680bffa790
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-c14f-ba5353916568
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-bc5f-0cda85f0156f
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-2d1a-bcf93db09fe0
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-ef29-873fa47de6b2
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-0692-ec859e0f0509
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-504c-f67bbf9c0142
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-3a1f-d985a384dbef
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-5255-f18729eb5aa9
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-d6d5-f415b545c8de
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-c7d9-cf5f46b75c37
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-c387-05da4303bfa3
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-aaac-419e1e9eedb8
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-b3eb-3b60242db5aa
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-38f1-de26e06f9510
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-c8c0-972f95126f09
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-0071-1eee97150b23
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-a2ae-9ccf399d7bfe
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-2819-507312b12e81
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-d6f2-7b7138b60fdd
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-68a2-5e86600364b7
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-0c73-b66eb17b10a6
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-1432-2e21db5f9f30
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-671e-78943f496f11
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-d314-0af25f450112
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-f81b-0ed6a9420953
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-59a6-4b3e8faf23a7
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-7687-2a985a23e100
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-7239-db2fcf5e55ba
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-d514-ae89510f4c8c
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-2830-eb8e4a4f6039
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-1731-663f6e7d73c3
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-a1e6-1dbcd1793923
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-e512-f4eef54c52df
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-a226-a3f3948a1d0e
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-19ec-687cc6a66366
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-eba7-30da2185ab7e
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-402a-ec3beb313fb7
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-3411-a6591308d528
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-b094-0b51f0d0a122
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-398b-0e1f18fb258a
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-efa0-babd39f420d0
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-3d0a-eab06b972b0d
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-aa67-cb581b0b9b4e
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-3df4-208936d1ad7f
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-5f4f-41b6b984aff4
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-0c31-7884f30c1536
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-297e-ba4f852e8173
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-eb55-b359a2abd87d
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-3938-d82f579410cd
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-ab09-a45f1930aa88
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-eb00-400156f64337
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-4147-6ff482938076
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-7abc-16be32dc9e91
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-6539-4c1ae500fa7a
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-d95e-7a8a938ef528
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-6b2b-b31d30fec408
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-94f1-6d93c73be465
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-f5f5-e4523907aa20
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-3b80-6550139bd663
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-fa5c-1e0f6996b08a
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-2563-a13742696d56
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-20c2-3d9cb5f5d584
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-525f-b601afc407fe
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-85bd-27724cf8256e
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-83a6-102cde74aa39
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-d78b-4528f53593ee
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-a95e-e14b9f2cb04a
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-bc1c-fc425882b94f
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-8e68-460a340e2c1b
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-726d-dc915a81cf64
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-5b11-88d05ac7dfff
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-9ba0-f019314cbc90
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-4f05-13f9f7eb1544
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-a6fb-e7debe9930a8
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-66c2-f27a1c339c46
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-3264-4263c29927bf
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-ce86-98eb16987893
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-6c63-210371d4dd0b
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-5275-7b93b1fb2fd1
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-d4af-2663abf3c7da
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-103f-da38aa898bda
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-fdde-db9452fc3a91
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-311a-8b16e1b26ff3
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-2d8f-bafaad1dd7f7
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-80ae-aa4c694564ea
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-e5fd-6d443990ce88
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-3125-49a89085405e
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-8e38-71e68fcf0bbb
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-8972-58e30b3ea279
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-f23c-12567f41d090
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-8ab0-26c0c71231c3
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-9e15-f3cb5e5f5037
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-39b5-448528f1fa4d
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-c78b-8a2e0bc21bce
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-b5a4-66482e66f43e
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-37c5-d09f58ea59cb
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-eb6a-62a9f2823dbd
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-8623-e168e469fda0
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-26e5-fda173ce90fd
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-c213-e23af9a83236
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-b019-7a25279ecbbc
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-0020-8c6200192ac6
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-b8b5-d59797b614d1
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-8776-f2fcb7491abb
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-a7ad-56012fb912ad
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-85c2-f654475e70e2
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-b9f2-edfa9f83af2f
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-e6e2-66bc4c2d8b2b
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-bafc-b512406d6e86
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-7d0e-c99b69563157
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-96f1-3d19ab9982db
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-914b-eb3ab486dadb
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-ee47-68115a333d1a
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-4e60-5ddc4026bb4c
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-173e-474a079dfdc7
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-e00a-bb0a28490511
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-9490-f34dbb12fdf8
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-12b9-68459cdffd54
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-85ff-071fe14a6a01
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-0715-2c8bd3771283
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-3312-bc867d5ac98c
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-c8f0-252a040fd0f7
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-76a3-bf9158e7ff6d
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-5163-a0a2370b8407
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-2413-dc5ba507b43c
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-59be-b057279384a4
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-6ba6-d7c5315dc4d5
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-4e3f-82a827785de6
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-342f-8c790c1ba9cb
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-2147-978295a1d6d7
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-3532-ffb6637b60d5
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-b439-32927dac0e82
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-fc18-7ef54a99c6c4
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-6a67-c570dac1d794
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-11a6-578694649124
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-fb49-a918dec6dbf2
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-28ea-509ec531e1d1
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-01db-1c2ee3c0ab1a
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-2b25-da23ab9fd012
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-ad63-2fb77ed14d85
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-f0c3-39053ea2145c
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-7908-6c572db185ec
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-5da4-de74b27dcd4b
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-5f58-7ba7cd9fed47
00020000-56ab-58ac-586b-cbaf7af7bf77	00030000-56ab-58a9-4632-187f25013b26
00020000-56ab-58ac-03de-35b3402bf1a8	00030000-56ab-58a9-bbe7-2765cf78e476
00020000-56ab-58ac-30c8-86600ee4d0ea	00030000-56ab-58a9-01db-1c2ee3c0ab1a
00020000-56ab-58ac-8d5c-0edf658c226a	00030000-56ab-58a9-342f-8c790c1ba9cb
00020000-56ab-58ac-6329-b24cd2227c5e	00030000-56ab-58a9-4e3f-82a827785de6
00020000-56ab-58ac-8f29-193b1534014d	00030000-56ab-58a9-f81b-0ed6a9420953
00020000-56ab-58ac-7d3f-c74b3083059b	00030000-56ab-58a9-59a6-4b3e8faf23a7
00020000-56ab-58ac-b8ed-a4b50cc74890	00030000-56ab-58a9-7687-2a985a23e100
00020000-56ab-58ac-828f-612c28ac1e4e	00030000-56ab-58a9-d314-0af25f450112
00020000-56ab-58ac-f2bd-774638e20e27	00030000-56ab-58a9-1432-2e21db5f9f30
00020000-56ab-58ac-5af9-ff51855185ed	00030000-56ab-58a9-671e-78943f496f11
00020000-56ab-58ac-9796-a951d065d38d	00030000-56ab-58a9-3167-66e7ada4e894
00020000-56ab-58ac-c7ae-4d1699d0c684	00030000-56ab-58a9-2b25-da23ab9fd012
00020000-56ab-58ac-d71d-4225191c30d1	00030000-56ab-58a9-8654-2454342fd8a4
00020000-56ab-58ac-7ce7-689fd2b7406c	00030000-56ab-58a9-402a-ec3beb313fb7
00020000-56ab-58ac-d8ba-4606c97d221a	00030000-56ab-58a9-b094-0b51f0d0a122
00020000-56ab-58ac-c558-83421edcbc75	00030000-56ab-58a9-3411-a6591308d528
00020000-56ab-58ac-caec-44022bb5896a	00030000-56ab-58a9-836a-ac18a1cc83cf
00020000-56ab-58ac-c3a5-07e8d78983dc	00030000-56ab-58a9-4403-5d3852b89d8d
00020000-56ab-58ac-12de-092558c0fa21	00030000-56ab-58a9-0c31-7884f30c1536
00020000-56ab-58ac-12de-092558c0fa21	00030000-56ab-58a9-297e-ba4f852e8173
00020000-56ab-58ac-12de-092558c0fa21	00030000-56ab-58a9-4e3f-82a827785de6
00020000-56ab-58ac-b03d-b1f416f861af	00030000-56ab-58a9-59be-b057279384a4
00020000-56ab-58ac-8e9d-3daf02f4dd45	00030000-56ab-58a9-6ba6-d7c5315dc4d5
00020000-56ab-58ac-10a4-d2eeb13ed8e7	00030000-56ab-58a9-7d0e-c99b69563157
00020000-56ab-58ac-9dcb-68bb73b44262	00030000-56ab-58a9-ee47-68115a333d1a
00020000-56ab-58ac-7970-2a2cf8bb0372	00030000-56ab-58a9-4e60-5ddc4026bb4c
00020000-56ab-58ac-150e-5d9e9c806200	00030000-56ab-58a9-6539-4c1ae500fa7a
00020000-56ab-58ac-720a-adbe61b95125	00030000-56ab-58a9-d95e-7a8a938ef528
00020000-56ab-58ac-e9fb-beb250b2e9de	00030000-56ab-58a9-ad63-2fb77ed14d85
00020000-56ab-58ac-3fdd-bf687a70f51b	00030000-56ab-58a9-f0c3-39053ea2145c
00020000-56ab-58ac-eaa6-570af46b51c8	00030000-56ab-58a9-3df4-208936d1ad7f
00020000-56ab-58ac-8910-34e6e9f0b3a4	00030000-56ab-58a9-5f4f-41b6b984aff4
00020000-56ab-58ac-8050-2920ac14a2f0	00030000-56ab-58a9-96f1-3d19ab9982db
00020000-56ab-58ac-5478-2da18d85caab	00030000-56ab-58a9-914b-eb3ab486dadb
00020000-56ab-58ac-a563-566203c7e5c2	00030000-56ab-58a9-618f-471fd9314546
00020000-56ab-58ac-b5a3-9e5499021bb0	00030000-56ab-58a9-6b81-3266ca47d1e6
00020000-56ab-58ac-0c9c-257b03c6d018	00030000-56ab-58a9-2f5c-eea2b4e64cee
00020000-56ab-58ad-de19-611abe84aa0d	00030000-56ab-58a9-c7d9-cf5f46b75c37
00020000-56ab-58ad-b7fb-fda0ee0852a0	00030000-56ab-58a9-aaac-419e1e9eedb8
00020000-56ab-58ad-e093-7cbea602f3cd	00030000-56ab-58a9-c387-05da4303bfa3
\.


--
-- TOC entry 3181 (class 0 OID 41823759)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 41823794)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 41823927)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56ab-58ae-9f76-b74228a85c1b	00090000-56ab-58ae-51e0-4fe324288bf7	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56ab-58ae-4b54-4ec1a766dccd	00090000-56ab-58ae-0a71-045087cff4ef	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56ab-58ae-d840-b5fa35fa3f31	00090000-56ab-58ae-ed11-e6e4458534ab	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56ab-58ae-1e2b-0c4b84fd7854	00090000-56ab-58ae-6079-fe068484bbf9	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 41823444)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56ab-58ad-b5b4-c0aaf92cfd6d	\N	00040000-56ab-58a8-bff7-baa266ad016f	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-58ad-f7eb-eebf01ffdec4	\N	00040000-56ab-58a8-bff7-baa266ad016f	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56ab-58ad-e3ad-e80de2fa10b1	\N	00040000-56ab-58a8-bff7-baa266ad016f	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-58ad-6f07-316d93a0e73c	\N	00040000-56ab-58a8-bff7-baa266ad016f	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-58ad-24e0-86abcf1c234a	\N	00040000-56ab-58a8-bff7-baa266ad016f	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-58ad-7346-8415cb67004b	\N	00040000-56ab-58a8-3acf-747d12169bd9	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-58ad-b309-e0cc84ab9307	\N	00040000-56ab-58a8-d21f-fa84b614ef6d	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-58ad-24d5-8f2a59f94663	\N	00040000-56ab-58a8-25c7-b96073c34d22	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-58ad-e712-f02595a6c7b7	\N	00040000-56ab-58a8-3e36-145d1f0fa9a7	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-58b1-a77d-7d1a57f81b7c	\N	00040000-56ab-58a8-bff7-baa266ad016f	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 41823489)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56ab-58a7-33f2-17ac97f69576	8341	Adlešiči
00050000-56ab-58a7-bb8e-a5849e02d96e	5270	Ajdovščina
00050000-56ab-58a7-30ac-a114ac320a73	6280	Ankaran/Ancarano
00050000-56ab-58a7-f17b-e938f7cd8a59	9253	Apače
00050000-56ab-58a7-dc25-179c9155e3d8	8253	Artiče
00050000-56ab-58a7-63b3-f2f5cbede596	4275	Begunje na Gorenjskem
00050000-56ab-58a7-2a04-b5b9637f1794	1382	Begunje pri Cerknici
00050000-56ab-58a7-5594-8315ff14e839	9231	Beltinci
00050000-56ab-58a7-0e13-9719ca926db8	2234	Benedikt
00050000-56ab-58a7-0e8a-b9c30811861a	2345	Bistrica ob Dravi
00050000-56ab-58a7-5cdf-01cad61b41a0	3256	Bistrica ob Sotli
00050000-56ab-58a7-6f51-5ff599905c7a	8259	Bizeljsko
00050000-56ab-58a7-9bf1-5c67a8c87c86	1223	Blagovica
00050000-56ab-58a7-da03-ef818fecf2c8	8283	Blanca
00050000-56ab-58a7-f2a9-3b4a1f99d089	4260	Bled
00050000-56ab-58a7-fd46-682a4a8f9a6b	4273	Blejska Dobrava
00050000-56ab-58a7-5819-f05b0f0b2c49	9265	Bodonci
00050000-56ab-58a7-1625-64e35201e438	9222	Bogojina
00050000-56ab-58a7-227a-39d24868a5f8	4263	Bohinjska Bela
00050000-56ab-58a7-af2d-809ac75e66a6	4264	Bohinjska Bistrica
00050000-56ab-58a7-be7e-da2dfa25f0b6	4265	Bohinjsko jezero
00050000-56ab-58a7-28d0-8efcfafb2591	1353	Borovnica
00050000-56ab-58a7-60ca-b846d66b2b3e	8294	Boštanj
00050000-56ab-58a7-bd8c-9bb6e201ce9f	5230	Bovec
00050000-56ab-58a7-ad50-02aa3f92a088	5295	Branik
00050000-56ab-58a7-1d8b-2baec5ee8e64	3314	Braslovče
00050000-56ab-58a7-989f-faa7c2451591	5223	Breginj
00050000-56ab-58a7-868c-112c3fa6d03f	8280	Brestanica
00050000-56ab-58a7-21e9-5833641ace5d	2354	Bresternica
00050000-56ab-58a7-ecf8-1132784f0921	4243	Brezje
00050000-56ab-58a7-746c-86884ca36ef1	1351	Brezovica pri Ljubljani
00050000-56ab-58a7-988a-62f04509b9b3	8250	Brežice
00050000-56ab-58a7-ea3d-d758cf636633	4210	Brnik - Aerodrom
00050000-56ab-58a7-2fc9-d2ca4ff2d561	8321	Brusnice
00050000-56ab-58a7-7d8e-814e62ac1311	3255	Buče
00050000-56ab-58a7-dfa8-bab66fd9ddf3	8276	Bučka 
00050000-56ab-58a7-d3b9-772c1c328467	9261	Cankova
00050000-56ab-58a7-1fd9-88945e994fd5	3000	Celje 
00050000-56ab-58a7-bfa3-5801516678a5	3001	Celje - poštni predali
00050000-56ab-58a7-edfb-807d73f3f8ca	4207	Cerklje na Gorenjskem
00050000-56ab-58a7-51da-c8bed6af0a85	8263	Cerklje ob Krki
00050000-56ab-58a7-7358-08f6fa0e15d8	1380	Cerknica
00050000-56ab-58a7-9d53-97b0dec0f9da	5282	Cerkno
00050000-56ab-58a7-a257-bfdffb3c54d7	2236	Cerkvenjak
00050000-56ab-58a7-debf-50770078ab90	2215	Ceršak
00050000-56ab-58a7-d7fd-4531d18ab1d6	2326	Cirkovce
00050000-56ab-58a7-faf9-213bfabbecc5	2282	Cirkulane
00050000-56ab-58a7-b01b-31401c547458	5273	Col
00050000-56ab-58a7-06df-e75e68fd1368	8251	Čatež ob Savi
00050000-56ab-58a7-5081-6c1ab0b5dd1f	1413	Čemšenik
00050000-56ab-58a7-a8fe-bfd78caeded2	5253	Čepovan
00050000-56ab-58a7-5641-8a0f709910ff	9232	Črenšovci
00050000-56ab-58a7-eb63-b6bea0940e19	2393	Črna na Koroškem
00050000-56ab-58a7-9755-3c471a6aa236	6275	Črni Kal
00050000-56ab-58a7-4edf-19ff148f8a3e	5274	Črni Vrh nad Idrijo
00050000-56ab-58a7-8b7e-08bf419e7241	5262	Črniče
00050000-56ab-58a7-0999-901b5155a81c	8340	Črnomelj
00050000-56ab-58a7-5696-1e03c56730c8	6271	Dekani
00050000-56ab-58a7-4880-ffcf2a65a49f	5210	Deskle
00050000-56ab-58a7-d7e1-d187fe08ad3d	2253	Destrnik
00050000-56ab-58a7-d9b1-5e4f7be5ab2b	6215	Divača
00050000-56ab-58a7-1b8d-94d87f9adc60	1233	Dob
00050000-56ab-58a7-aa3b-f86b32e0e669	3224	Dobje pri Planini
00050000-56ab-58a7-35a9-fc901524aa4a	8257	Dobova
00050000-56ab-58a7-dad7-8004518980b3	1423	Dobovec
00050000-56ab-58a7-b057-80581d5ece10	5263	Dobravlje
00050000-56ab-58a7-3b0b-278a0f5328de	3204	Dobrna
00050000-56ab-58a7-efa4-0fc805538b39	8211	Dobrnič
00050000-56ab-58a7-4721-22455c0e5715	1356	Dobrova
00050000-56ab-58a7-2ff1-47e6f2df3dd4	9223	Dobrovnik/Dobronak 
00050000-56ab-58a7-b18e-4216f28bf16c	5212	Dobrovo v Brdih
00050000-56ab-58a7-cf52-fd0e3ccdd16f	1431	Dol pri Hrastniku
00050000-56ab-58a7-f70e-ba4baa0ca2de	1262	Dol pri Ljubljani
00050000-56ab-58a7-a23e-79b6c03f1045	1273	Dole pri Litiji
00050000-56ab-58a7-3970-24f011281b9f	1331	Dolenja vas
00050000-56ab-58a7-0e97-99ac1e418bff	8350	Dolenjske Toplice
00050000-56ab-58a7-51ab-9ad716c0222b	1230	Domžale
00050000-56ab-58a7-70f9-94b2af7eaee3	2252	Dornava
00050000-56ab-58a7-03a3-bdd611f9bebe	5294	Dornberk
00050000-56ab-58a7-cc7c-3724fea6b581	1319	Draga
00050000-56ab-58a7-98a5-4d64ec188ab6	8343	Dragatuš
00050000-56ab-58a7-c562-4d1519537cd2	3222	Dramlje
00050000-56ab-58a7-e077-b5403dc54d4e	2370	Dravograd
00050000-56ab-58a7-c28c-7a3f9b453cbd	4203	Duplje
00050000-56ab-58a7-b46d-aec04b2b501c	6221	Dutovlje
00050000-56ab-58a7-103d-d21508bcf041	8361	Dvor
00050000-56ab-58a7-0d2a-3f8abe14b4e4	2343	Fala
00050000-56ab-58a7-36f5-f8c306a3ecc6	9208	Fokovci
00050000-56ab-58a7-c500-1ddaa1442b1f	2313	Fram
00050000-56ab-58a7-8b3f-0361ff0852c9	3213	Frankolovo
00050000-56ab-58a7-669c-2e7fef01dc3e	1274	Gabrovka
00050000-56ab-58a7-8424-c3d08fa7eb40	8254	Globoko
00050000-56ab-58a7-8636-cd962251b3c6	5275	Godovič
00050000-56ab-58a7-534a-adfbb01fb729	4204	Golnik
00050000-56ab-58a7-2e1d-2830bc9cccd5	3303	Gomilsko
00050000-56ab-58a7-839b-6363670c0349	4224	Gorenja vas
00050000-56ab-58a7-fe6d-822f6c0692f3	3263	Gorica pri Slivnici
00050000-56ab-58a7-4218-83ac6da27555	2272	Gorišnica
00050000-56ab-58a7-2466-d71c4bbc57e9	9250	Gornja Radgona
00050000-56ab-58a7-1234-bb4b1a107f2d	3342	Gornji Grad
00050000-56ab-58a7-ef03-66aede44f3cd	4282	Gozd Martuljek
00050000-56ab-58a7-a84f-bc5fb9667a44	6272	Gračišče
00050000-56ab-58a7-8717-75379e89707d	9264	Grad
00050000-56ab-58a7-8427-fa3d4345ea90	8332	Gradac
00050000-56ab-58a7-aa63-4af363cc7aac	1384	Grahovo
00050000-56ab-58a7-8695-2ae9549412ca	5242	Grahovo ob Bači
00050000-56ab-58a7-c499-c9e6238d1e44	5251	Grgar
00050000-56ab-58a7-c14b-ceff6f89e9c6	3302	Griže
00050000-56ab-58a7-3071-fe39d47dcb8d	3231	Grobelno
00050000-56ab-58a7-ae05-19fdad776885	1290	Grosuplje
00050000-56ab-58a7-4ef8-1214f8fd7b0b	2288	Hajdina
00050000-56ab-58a7-5e17-413d7eb77fa5	8362	Hinje
00050000-56ab-58a7-1502-4962c1c6bb7e	2311	Hoče
00050000-56ab-58a7-a536-a12891d73328	9205	Hodoš/Hodos
00050000-56ab-58a7-b14e-3bdde1653459	1354	Horjul
00050000-56ab-58a7-ca06-68c372318072	1372	Hotedršica
00050000-56ab-58a7-d243-92b185f24ac5	1430	Hrastnik
00050000-56ab-58a7-be18-9c3692ab45f5	6225	Hruševje
00050000-56ab-58a7-4827-4da00bf448eb	4276	Hrušica
00050000-56ab-58a7-29ae-3ca42eb51d3f	5280	Idrija
00050000-56ab-58a7-ffec-aa7f3338e1ee	1292	Ig
00050000-56ab-58a7-7b78-2dd6ff5307d8	6250	Ilirska Bistrica
00050000-56ab-58a7-627b-a7275db5c961	6251	Ilirska Bistrica-Trnovo
00050000-56ab-58a7-47db-2c68296425ba	1295	Ivančna Gorica
00050000-56ab-58a7-37da-affbe467885c	2259	Ivanjkovci
00050000-56ab-58a7-875b-8219f4453ab3	1411	Izlake
00050000-56ab-58a7-f64d-9d13de6fbe70	6310	Izola/Isola
00050000-56ab-58a7-eb2e-229bb3d065fd	2222	Jakobski Dol
00050000-56ab-58a7-5401-337ff7ff17be	2221	Jarenina
00050000-56ab-58a7-345e-8d224d1b401f	6254	Jelšane
00050000-56ab-58a7-3e58-3c92a8cf2538	4270	Jesenice
00050000-56ab-58a7-ec35-6aa37524ab7a	8261	Jesenice na Dolenjskem
00050000-56ab-58a7-679f-8159ea7c67dd	3273	Jurklošter
00050000-56ab-58a7-ac01-e0778df91018	2223	Jurovski Dol
00050000-56ab-58a7-10ce-243475c3d374	2256	Juršinci
00050000-56ab-58a7-788b-dea218ea2307	5214	Kal nad Kanalom
00050000-56ab-58a7-007f-342e63c29b9e	3233	Kalobje
00050000-56ab-58a7-68e6-0831ab226afe	4246	Kamna Gorica
00050000-56ab-58a7-01f0-cd6851adf494	2351	Kamnica
00050000-56ab-58a7-a75d-ab0a5d6abbc5	1241	Kamnik
00050000-56ab-58a7-40a5-68a74d409f8f	5213	Kanal
00050000-56ab-58a7-4bd3-6e024177d465	8258	Kapele
00050000-56ab-58a7-7ec0-f839b36d2a5c	2362	Kapla
00050000-56ab-58a7-450b-a90c68a93471	2325	Kidričevo
00050000-56ab-58a7-d480-e9a4b5e0f0d9	1412	Kisovec
00050000-56ab-58a7-f249-f81fd55114ce	6253	Knežak
00050000-56ab-58a7-b2a0-5285506d599b	5222	Kobarid
00050000-56ab-58a7-8972-ab3a2fa17eb1	9227	Kobilje
00050000-56ab-58a7-9a61-055c75b69a14	1330	Kočevje
00050000-56ab-58a7-eec6-e63a16bfb143	1338	Kočevska Reka
00050000-56ab-58a7-9b28-b7c4a7e750cb	2276	Kog
00050000-56ab-58a7-1fe4-2c83d458ae38	5211	Kojsko
00050000-56ab-58a7-1419-6f5da050b840	6223	Komen
00050000-56ab-58a7-a004-877e3f3466eb	1218	Komenda
00050000-56ab-58a7-93b8-8433f4ff48fb	6000	Koper/Capodistria 
00050000-56ab-58a7-bf24-1e8d49b95712	6001	Koper/Capodistria - poštni predali
00050000-56ab-58a7-ef83-74894b2890b7	8282	Koprivnica
00050000-56ab-58a7-8adb-92823c85fb7c	5296	Kostanjevica na Krasu
00050000-56ab-58a7-ae89-16f414178e82	8311	Kostanjevica na Krki
00050000-56ab-58a7-2de8-d5895ecb0be0	1336	Kostel
00050000-56ab-58a7-7354-27f5b14416e6	6256	Košana
00050000-56ab-58a7-4888-f6acca1a17ea	2394	Kotlje
00050000-56ab-58a7-cd9e-077ed9f129b1	6240	Kozina
00050000-56ab-58a7-f3ea-6bc89f3e868e	3260	Kozje
00050000-56ab-58a7-6eed-97e024d624ab	4000	Kranj 
00050000-56ab-58a7-9f89-c972aa360196	4001	Kranj - poštni predali
00050000-56ab-58a7-1f41-f100ecd3bb6b	4280	Kranjska Gora
00050000-56ab-58a7-ffb0-d12eb5e8494f	1281	Kresnice
00050000-56ab-58a7-c85c-773bbb4033b2	4294	Križe
00050000-56ab-58a7-60f0-d022277a890e	9206	Križevci
00050000-56ab-58a7-a64d-f52f8d565e06	9242	Križevci pri Ljutomeru
00050000-56ab-58a7-63f7-c71e27feca98	1301	Krka
00050000-56ab-58a7-5634-d21c1cd1faa1	8296	Krmelj
00050000-56ab-58a7-e97c-43aca14bf342	4245	Kropa
00050000-56ab-58a7-23d9-a34ceb9f401e	8262	Krška vas
00050000-56ab-58a7-8eaa-11960aa0ae35	8270	Krško
00050000-56ab-58a7-d1be-0f0762031731	9263	Kuzma
00050000-56ab-58a7-30b8-4af5e00edb52	2318	Laporje
00050000-56ab-58a7-928c-6d98663c6dec	3270	Laško
00050000-56ab-58a7-3f4f-20661e33ff61	1219	Laze v Tuhinju
00050000-56ab-58a7-ad60-a7c0cc8111a8	2230	Lenart v Slovenskih goricah
00050000-56ab-58a7-82d4-95d7a35dfb5a	9220	Lendava/Lendva
00050000-56ab-58a7-f441-5257aee408a6	4248	Lesce
00050000-56ab-58a7-7f6d-8b2f8c061d90	3261	Lesično
00050000-56ab-58a7-ee20-9471c64b0889	8273	Leskovec pri Krškem
00050000-56ab-58a7-fd56-cc0a267a77bf	2372	Libeliče
00050000-56ab-58a7-0388-e302d09542e1	2341	Limbuš
00050000-56ab-58a7-ff2b-2a54fd5bb1db	1270	Litija
00050000-56ab-58a7-36ef-324852debd74	3202	Ljubečna
00050000-56ab-58a7-698b-f74c167ca708	1000	Ljubljana 
00050000-56ab-58a7-9d82-3f0fe6b78bb2	1001	Ljubljana - poštni predali
00050000-56ab-58a7-7ead-f57b408319ac	1231	Ljubljana - Črnuče
00050000-56ab-58a7-77f0-1a968c92e1a2	1261	Ljubljana - Dobrunje
00050000-56ab-58a7-692a-d5f469c3fed8	1260	Ljubljana - Polje
00050000-56ab-58a7-8838-a688950c8b3c	1210	Ljubljana - Šentvid
00050000-56ab-58a7-3036-6e84fb782a8c	1211	Ljubljana - Šmartno
00050000-56ab-58a7-1e19-59c044a7a9d5	3333	Ljubno ob Savinji
00050000-56ab-58a7-3084-2009a350ccc4	9240	Ljutomer
00050000-56ab-58a7-58be-ac5a25ce0a28	3215	Loče
00050000-56ab-58a7-dff9-d142181366a5	5231	Log pod Mangartom
00050000-56ab-58a7-cd81-94987331c104	1358	Log pri Brezovici
00050000-56ab-58a7-2f92-abda8fbb75ad	1370	Logatec
00050000-56ab-58a7-8aff-d41d37afcdf4	1371	Logatec
00050000-56ab-58a7-06c0-6a30731846c9	1434	Loka pri Zidanem Mostu
00050000-56ab-58a7-2bea-36be7aab8384	3223	Loka pri Žusmu
00050000-56ab-58a7-895d-d4bd8d7fa884	6219	Lokev
00050000-56ab-58a7-5d35-e1cf473f49c2	1318	Loški Potok
00050000-56ab-58a7-d8f6-c92c2b7036fe	2324	Lovrenc na Dravskem polju
00050000-56ab-58a7-3b0d-2539c52beec3	2344	Lovrenc na Pohorju
00050000-56ab-58a7-8e02-6028cb97abf2	3334	Luče
00050000-56ab-58a7-60b6-43fa0f635a75	1225	Lukovica
00050000-56ab-58a7-3a6e-b94e53d5b74d	9202	Mačkovci
00050000-56ab-58a7-7477-ab073522c3ca	2322	Majšperk
00050000-56ab-58a7-9ffa-68b8aa382b0f	2321	Makole
00050000-56ab-58a7-10cb-7bb38f8c9883	9243	Mala Nedelja
00050000-56ab-58a7-83dd-fe8c33ad9324	2229	Malečnik
00050000-56ab-58a7-bc70-dfb1c5b6119e	6273	Marezige
00050000-56ab-58a7-d7f2-97b25bd0afaf	2000	Maribor 
00050000-56ab-58a7-f232-2a9824ada88c	2001	Maribor - poštni predali
00050000-56ab-58a7-c417-599cc6bbd512	2206	Marjeta na Dravskem polju
00050000-56ab-58a7-0c44-1ffb37da4d90	2281	Markovci
00050000-56ab-58a7-cbad-0b8c183f435e	9221	Martjanci
00050000-56ab-58a7-0339-6ece5f733ad1	6242	Materija
00050000-56ab-58a7-5bcf-153032ecf1ff	4211	Mavčiče
00050000-56ab-58a7-8f85-a75e9817dc08	1215	Medvode
00050000-56ab-58a7-1d10-83cb0feae4f7	1234	Mengeš
00050000-56ab-58a7-1568-3923db5ae4d9	8330	Metlika
00050000-56ab-58a7-f1ad-fd6fbfa8b5f7	2392	Mežica
00050000-56ab-58a7-e726-fc3e388e4d16	2204	Miklavž na Dravskem polju
00050000-56ab-58a7-b5f2-98bffda0eda7	2275	Miklavž pri Ormožu
00050000-56ab-58a7-6415-293b4aa688fb	5291	Miren
00050000-56ab-58a7-3b7c-761e01710f89	8233	Mirna
00050000-56ab-58a7-75cc-6aa7e82b4511	8216	Mirna Peč
00050000-56ab-58a7-a554-992938f26eb3	2382	Mislinja
00050000-56ab-58a7-4077-a246e7c7023e	4281	Mojstrana
00050000-56ab-58a7-e9f7-85587e402007	8230	Mokronog
00050000-56ab-58a7-8ca4-c1a5e1bfd153	1251	Moravče
00050000-56ab-58a7-ae5a-8067cc73889d	9226	Moravske Toplice
00050000-56ab-58a7-83eb-91bd13e37114	5216	Most na Soči
00050000-56ab-58a7-eb5e-fdbf15187cc4	1221	Motnik
00050000-56ab-58a7-641f-ff5f38bb52b4	3330	Mozirje
00050000-56ab-58a7-9796-aa300e630bb7	9000	Murska Sobota 
00050000-56ab-58a7-b7ee-5da42e5658c1	9001	Murska Sobota - poštni predali
00050000-56ab-58a7-df48-40c4726b228d	2366	Muta
00050000-56ab-58a7-815b-5be2e4f44086	4202	Naklo
00050000-56ab-58a7-2271-f493216e1dae	3331	Nazarje
00050000-56ab-58a7-4de3-b030da970342	1357	Notranje Gorice
00050000-56ab-58a7-391e-648130e59b0f	3203	Nova Cerkev
00050000-56ab-58a7-a9d3-fd1849a962e4	5000	Nova Gorica 
00050000-56ab-58a7-2aaf-28b478309964	5001	Nova Gorica - poštni predali
00050000-56ab-58a7-2ded-4f8694d36bea	1385	Nova vas
00050000-56ab-58a7-e0c3-75e36556eaf7	8000	Novo mesto
00050000-56ab-58a7-45d0-8506e0d7ee0a	8001	Novo mesto - poštni predali
00050000-56ab-58a7-ff98-67cb2b0552a7	6243	Obrov
00050000-56ab-58a7-073e-8159bed02aaf	9233	Odranci
00050000-56ab-58a7-451a-39e299bad36b	2317	Oplotnica
00050000-56ab-58a7-0fb2-cda0a612f1d2	2312	Orehova vas
00050000-56ab-58a7-bad0-17069e587e20	2270	Ormož
00050000-56ab-58a7-4976-a91680931683	1316	Ortnek
00050000-56ab-58a7-834b-648fdf083f4c	1337	Osilnica
00050000-56ab-58a7-b6f1-0adaa0bada37	8222	Otočec
00050000-56ab-58a7-be34-8831edc112d2	2361	Ožbalt
00050000-56ab-58a7-37e6-62356a7b045c	2231	Pernica
00050000-56ab-58a7-801b-8fd636dd3eb0	2211	Pesnica pri Mariboru
00050000-56ab-58a7-4793-1cec47682931	9203	Petrovci
00050000-56ab-58a7-8fc0-6d073cbc53a2	3301	Petrovče
00050000-56ab-58a7-f5fc-9a00a47f7a67	6330	Piran/Pirano
00050000-56ab-58a7-68a6-fa8fc1f6fb45	8255	Pišece
00050000-56ab-58a7-fd7e-97f215e346cd	6257	Pivka
00050000-56ab-58a7-a034-9b67822c3cfc	6232	Planina
00050000-56ab-58a7-7864-933a9f1b63e8	3225	Planina pri Sevnici
00050000-56ab-58a7-cf8d-b15763ef0e18	6276	Pobegi
00050000-56ab-58a7-7f95-68dc96025053	8312	Podbočje
00050000-56ab-58a7-80af-20dfc83d9d9c	5243	Podbrdo
00050000-56ab-58a7-64c3-ec198c62fbd0	3254	Podčetrtek
00050000-56ab-58a7-90c8-330a18163074	2273	Podgorci
00050000-56ab-58a7-224a-0c6265e71a80	6216	Podgorje
00050000-56ab-58a7-fd77-37ce68772114	2381	Podgorje pri Slovenj Gradcu
00050000-56ab-58a7-2ae2-10cc1fe906fd	6244	Podgrad
00050000-56ab-58a7-dcbf-2cf25939ec73	1414	Podkum
00050000-56ab-58a7-9c8f-7c446ac0b292	2286	Podlehnik
00050000-56ab-58a7-5291-ec29381bea38	5272	Podnanos
00050000-56ab-58a7-aaf9-b08ab22f86b1	4244	Podnart
00050000-56ab-58a7-27df-78537e9f456e	3241	Podplat
00050000-56ab-58a7-b200-13c17bf6ee7b	3257	Podsreda
00050000-56ab-58a7-c986-ec882ce87bec	2363	Podvelka
00050000-56ab-58a7-2429-6eb69ba44f2e	2208	Pohorje
00050000-56ab-58a7-eb4f-722623463145	2257	Polenšak
00050000-56ab-58a7-17ce-af322b91b9fd	1355	Polhov Gradec
00050000-56ab-58a7-be30-7d2a2009131c	4223	Poljane nad Škofjo Loko
00050000-56ab-58a7-a745-3849839d7df1	2319	Poljčane
00050000-56ab-58a7-2794-095b937b918d	1272	Polšnik
00050000-56ab-58a7-1ab1-5dc6adefd987	3313	Polzela
00050000-56ab-58a7-a57d-62cf07270b90	3232	Ponikva
00050000-56ab-58a7-f50f-f3078423919d	6320	Portorož/Portorose
00050000-56ab-58a7-eb89-044f5eda2593	6230	Postojna
00050000-56ab-58a7-e57d-e9bac5fcfbbd	2331	Pragersko
00050000-56ab-58a7-8ce5-691484f7ce92	3312	Prebold
00050000-56ab-58a7-7c84-d3352ac48b1f	4205	Preddvor
00050000-56ab-58a7-8ff4-bd7f11443f80	6255	Prem
00050000-56ab-58a7-e5c7-6c2f1fd94338	1352	Preserje
00050000-56ab-58a7-af93-f3ae1bb55611	6258	Prestranek
00050000-56ab-58a7-0318-927becb90848	2391	Prevalje
00050000-56ab-58a7-d6c0-d874945a36de	3262	Prevorje
00050000-56ab-58a7-28ed-37d935d1caec	1276	Primskovo 
00050000-56ab-58a7-9ca3-98e9bc589f55	3253	Pristava pri Mestinju
00050000-56ab-58a7-6232-cda0b2a45104	9207	Prosenjakovci/Partosfalva
00050000-56ab-58a7-a4d4-07f0cc9ca306	5297	Prvačina
00050000-56ab-58a7-f083-e85dba8b4cb7	2250	Ptuj
00050000-56ab-58a7-51a4-ca6896ed3ed5	2323	Ptujska Gora
00050000-56ab-58a7-bb7d-992a1fa0d0f4	9201	Puconci
00050000-56ab-58a7-8985-e45aad45c6a2	2327	Rače
00050000-56ab-58a7-cad2-da890fa907da	1433	Radeče
00050000-56ab-58a7-c288-a3cdda797ddd	9252	Radenci
00050000-56ab-58a7-2c9b-ff595395277a	2360	Radlje ob Dravi
00050000-56ab-58a7-c1dd-63a4fa383c25	1235	Radomlje
00050000-56ab-58a7-cdf7-91b57dcc8254	4240	Radovljica
00050000-56ab-58a7-ba66-882294a6fd96	8274	Raka
00050000-56ab-58a7-ef7b-d62af2a36d60	1381	Rakek
00050000-56ab-58a7-d3d6-718121c56309	4283	Rateče - Planica
00050000-56ab-58a7-db43-df930e5d67cc	2390	Ravne na Koroškem
00050000-56ab-58a7-508a-8a0fc35cb15e	9246	Razkrižje
00050000-56ab-58a7-daf1-af06d1afb665	3332	Rečica ob Savinji
00050000-56ab-58a7-af96-7f1ee47d5c2c	5292	Renče
00050000-56ab-58a7-0348-8ea8245df08b	1310	Ribnica
00050000-56ab-58a7-2eac-c9cb716a7585	2364	Ribnica na Pohorju
00050000-56ab-58a7-c3c6-15cffeacb982	3272	Rimske Toplice
00050000-56ab-58a7-d361-057db85a6d4d	1314	Rob
00050000-56ab-58a7-8a0c-2cf3accca8de	5215	Ročinj
00050000-56ab-58a7-2a3e-203c01f6282c	3250	Rogaška Slatina
00050000-56ab-58a7-d3f6-fb5f5dd42e0f	9262	Rogašovci
00050000-56ab-58a7-4fbe-da77fa7681a4	3252	Rogatec
00050000-56ab-58a7-0294-fb3a654ea2ef	1373	Rovte
00050000-56ab-58a7-ea7f-7ad139f549c1	2342	Ruše
00050000-56ab-58a7-f19c-d1792e13f576	1282	Sava
00050000-56ab-58a7-0ec9-c1f0ead7d377	6333	Sečovlje/Sicciole
00050000-56ab-58a7-831f-651b17bc532c	4227	Selca
00050000-56ab-58a7-9202-1c88207787cb	2352	Selnica ob Dravi
00050000-56ab-58a7-d0ac-580c5b5b4b3c	8333	Semič
00050000-56ab-58a7-e81c-7658931d2b68	8281	Senovo
00050000-56ab-58a7-cb08-51f8df2d777d	6224	Senožeče
00050000-56ab-58a7-b7c8-44b97159b086	8290	Sevnica
00050000-56ab-58a7-8bcf-24b41eaa80f7	6210	Sežana
00050000-56ab-58a7-7928-c7a88e9f1cd2	2214	Sladki Vrh
00050000-56ab-58a7-3862-c0d671f9313c	5283	Slap ob Idrijci
00050000-56ab-58a7-fa2c-d232c9cac094	2380	Slovenj Gradec
00050000-56ab-58a7-660e-a419c80ee7cd	2310	Slovenska Bistrica
00050000-56ab-58a7-ca02-228f38e5ac86	3210	Slovenske Konjice
00050000-56ab-58a7-9fd2-32ffa85130f9	1216	Smlednik
00050000-56ab-58a7-1156-b684fa716562	5232	Soča
00050000-56ab-58a7-9f44-41c6433facf5	1317	Sodražica
00050000-56ab-58a7-c86a-4099c06b80d9	3335	Solčava
00050000-56ab-58a7-6b54-e336b61c2bd9	5250	Solkan
00050000-56ab-58a7-02c1-05dd382aab95	4229	Sorica
00050000-56ab-58a7-ee59-a780c18f0ac5	4225	Sovodenj
00050000-56ab-58a7-16e5-056a5afae84f	5281	Spodnja Idrija
00050000-56ab-58a7-2bb9-0eb510be3c9e	2241	Spodnji Duplek
00050000-56ab-58a7-abb5-3ccefb773cb1	9245	Spodnji Ivanjci
00050000-56ab-58a7-6ed2-01dcea704d9a	2277	Središče ob Dravi
00050000-56ab-58a7-8d12-0df857bf1646	4267	Srednja vas v Bohinju
00050000-56ab-58a7-b861-968a14e62279	8256	Sromlje 
00050000-56ab-58a7-9a80-b5998078f134	5224	Srpenica
00050000-56ab-58a7-4b25-9ed8f73767ab	1242	Stahovica
00050000-56ab-58a7-dfeb-0e07af91ecba	1332	Stara Cerkev
00050000-56ab-58a7-2891-bfae2d9523b1	8342	Stari trg ob Kolpi
00050000-56ab-58a7-2656-0f02f8e44a7f	1386	Stari trg pri Ložu
00050000-56ab-58a7-47fe-c3b6e99253a8	2205	Starše
00050000-56ab-58a7-8499-4d2a10bcbc40	2289	Stoperce
00050000-56ab-58a7-43a5-87892a6c2eaf	8322	Stopiče
00050000-56ab-58a7-585a-cfa0a68dcf9d	3206	Stranice
00050000-56ab-58a7-bd38-f7e4e99f0fbb	8351	Straža
00050000-56ab-58a7-121b-c726d2a33563	1313	Struge
00050000-56ab-58a7-a2ee-f860fa3b79da	8293	Studenec
00050000-56ab-58a7-a87b-d57f14291ecd	8331	Suhor
00050000-56ab-58a7-8022-19c01a4ea1f8	2233	Sv. Ana v Slovenskih goricah
00050000-56ab-58a7-a9ce-036ac3ed6397	2235	Sv. Trojica v Slovenskih goricah
00050000-56ab-58a7-98d0-f57759528d9a	2353	Sveti Duh na Ostrem Vrhu
00050000-56ab-58a7-9eac-1ab6452f1c51	9244	Sveti Jurij ob Ščavnici
00050000-56ab-58a7-208d-255ffabd4805	3264	Sveti Štefan
00050000-56ab-58a7-952d-11055be3487d	2258	Sveti Tomaž
00050000-56ab-58a7-9550-f1b0da7315bd	9204	Šalovci
00050000-56ab-58a7-8e33-62023b455b40	5261	Šempas
00050000-56ab-58a7-809d-e03d7458458c	5290	Šempeter pri Gorici
00050000-56ab-58a7-b842-9484ca9a6eb9	3311	Šempeter v Savinjski dolini
00050000-56ab-58a7-8617-1d62460986a2	4208	Šenčur
00050000-56ab-58a7-fff9-5464498add87	2212	Šentilj v Slovenskih goricah
00050000-56ab-58a7-add4-6a2dbb15a92d	8297	Šentjanž
00050000-56ab-58a7-c3c2-630fb9fa9e3e	2373	Šentjanž pri Dravogradu
00050000-56ab-58a7-14b9-9ded363924cf	8310	Šentjernej
00050000-56ab-58a7-7476-a18fd2c55b14	3230	Šentjur
00050000-56ab-58a7-3ab0-33c7a74b3f4c	3271	Šentrupert
00050000-56ab-58a7-7845-edd95aee3b16	8232	Šentrupert
00050000-56ab-58a7-badd-ef4edbb67326	1296	Šentvid pri Stični
00050000-56ab-58a7-40cc-f1381c57d68e	8275	Škocjan
00050000-56ab-58a7-d32f-e49500da5b57	6281	Škofije
00050000-56ab-58a7-9220-333aba0d7316	4220	Škofja Loka
00050000-56ab-58a7-0302-d9e0a5d66308	3211	Škofja vas
00050000-56ab-58a7-d74f-75f95ab2d808	1291	Škofljica
00050000-56ab-58a7-f55c-2d0ed242889e	6274	Šmarje
00050000-56ab-58a7-7739-0c526edd5520	1293	Šmarje - Sap
00050000-56ab-58a7-d786-170a74d74c9d	3240	Šmarje pri Jelšah
00050000-56ab-58a7-2c4e-e4ecae2efaef	8220	Šmarješke Toplice
00050000-56ab-58a7-81f5-28ba972999a7	2315	Šmartno na Pohorju
00050000-56ab-58a7-dedc-26883ef0890a	3341	Šmartno ob Dreti
00050000-56ab-58a7-29d4-1e4be1f3d575	3327	Šmartno ob Paki
00050000-56ab-58a7-adfe-e5fb59a121aa	1275	Šmartno pri Litiji
00050000-56ab-58a7-3a38-e2d42e0e30df	2383	Šmartno pri Slovenj Gradcu
00050000-56ab-58a7-1437-c0c10dccaf90	3201	Šmartno v Rožni dolini
00050000-56ab-58a7-c2be-0b4f78403505	3325	Šoštanj
00050000-56ab-58a7-5ea8-32c720849834	6222	Štanjel
00050000-56ab-58a7-0e4d-6c7ec015d6d0	3220	Štore
00050000-56ab-58a7-ade6-225d9dd19b34	3304	Tabor
00050000-56ab-58a7-4da3-03b644315172	3221	Teharje
00050000-56ab-58a7-bae4-b426c2a074cd	9251	Tišina
00050000-56ab-58a7-de36-89194d3bdd2f	5220	Tolmin
00050000-56ab-58a7-2362-ab1ffc9c5a06	3326	Topolšica
00050000-56ab-58a7-5dc9-2934983713f0	2371	Trbonje
00050000-56ab-58a7-47f3-1e84b39115fa	1420	Trbovlje
00050000-56ab-58a7-34a2-aaa7ad2e1d67	8231	Trebelno 
00050000-56ab-58a7-10f8-aae1e1ac2068	8210	Trebnje
00050000-56ab-58a7-5100-cddb64620c4d	5252	Trnovo pri Gorici
00050000-56ab-58a7-3e45-12735818a7c4	2254	Trnovska vas
00050000-56ab-58a7-2aff-f6382e7a6882	1222	Trojane
00050000-56ab-58a7-34f8-277e0cfd6dc5	1236	Trzin
00050000-56ab-58a7-00b3-f40a88f30fdb	4290	Tržič
00050000-56ab-58a7-f4fc-46fed2b53c5b	8295	Tržišče
00050000-56ab-58a7-bbd1-64c0f64c2ec3	1311	Turjak
00050000-56ab-58a7-b618-8e7bb5477702	9224	Turnišče
00050000-56ab-58a7-343c-42dd152acbb8	8323	Uršna sela
00050000-56ab-58a7-a54e-bb02d66cb615	1252	Vače
00050000-56ab-58a7-83d9-0218638d3db1	3320	Velenje 
00050000-56ab-58a7-d0fb-dbd6fdcd3238	3322	Velenje - poštni predali
00050000-56ab-58a7-1dac-b959a7a5cdc0	8212	Velika Loka
00050000-56ab-58a7-719e-6a9814288d4a	2274	Velika Nedelja
00050000-56ab-58a7-4bf7-cad35769b87f	9225	Velika Polana
00050000-56ab-58a7-1df7-1f9235381201	1315	Velike Lašče
00050000-56ab-58a7-88af-04a540805fd8	8213	Veliki Gaber
00050000-56ab-58a7-ca54-18d4357393fb	9241	Veržej
00050000-56ab-58a7-b2f0-4b086b9c5957	1312	Videm - Dobrepolje
00050000-56ab-58a7-757a-9e60a4aab3f9	2284	Videm pri Ptuju
00050000-56ab-58a7-fe30-f3bfaca32c0c	8344	Vinica
00050000-56ab-58a7-7990-0deb238de2f6	5271	Vipava
00050000-56ab-58a7-5859-3e6bf9c8bf12	4212	Visoko
00050000-56ab-58a7-c4a0-36041f581209	1294	Višnja Gora
00050000-56ab-58a7-a01f-8c598e43eb2c	3205	Vitanje
00050000-56ab-58a7-9afc-2c9a6900d39d	2255	Vitomarci
00050000-56ab-58a7-427a-4dbe42f52f58	1217	Vodice
00050000-56ab-58a7-7d7c-fef67e01d1ac	3212	Vojnik\t
00050000-56ab-58a7-51f3-b88b6a1e4772	5293	Volčja Draga
00050000-56ab-58a7-1411-7769e55e6bc1	2232	Voličina
00050000-56ab-58a7-d37a-73301b6d72e7	3305	Vransko
00050000-56ab-58a7-dd08-d0b50dd33eb8	6217	Vremski Britof
00050000-56ab-58a7-e089-a34dd87f0540	1360	Vrhnika
00050000-56ab-58a7-f411-b6b8558e0760	2365	Vuhred
00050000-56ab-58a7-5ddf-fe1167eba7e6	2367	Vuzenica
00050000-56ab-58a7-faba-d67cdae0ba90	8292	Zabukovje 
00050000-56ab-58a7-4edb-4a7e20ef445e	1410	Zagorje ob Savi
00050000-56ab-58a7-a344-88bac0671091	1303	Zagradec
00050000-56ab-58a7-2399-71397ca30f50	2283	Zavrč
00050000-56ab-58a7-80c8-9fbb2e365b46	8272	Zdole 
00050000-56ab-58a7-404c-7e7be46bca4e	4201	Zgornja Besnica
00050000-56ab-58a7-fced-fdfdfcb2920a	2242	Zgornja Korena
00050000-56ab-58a7-d339-c9627a49d737	2201	Zgornja Kungota
00050000-56ab-58a7-d408-8ac916332909	2316	Zgornja Ložnica
00050000-56ab-58a7-aff5-33f1b12b6653	2314	Zgornja Polskava
00050000-56ab-58a7-8e4d-f912d36aa980	2213	Zgornja Velka
00050000-56ab-58a7-5dd1-f52ae981e05c	4247	Zgornje Gorje
00050000-56ab-58a7-175b-90e40da4819e	4206	Zgornje Jezersko
00050000-56ab-58a7-22a4-4451c5620b56	2285	Zgornji Leskovec
00050000-56ab-58a7-b237-07ca0eee3efb	1432	Zidani Most
00050000-56ab-58a7-1374-aa54ea6b1c44	3214	Zreče
00050000-56ab-58a7-9c36-e8b3931634ac	4209	Žabnica
00050000-56ab-58a7-89ed-f8b3d767ba49	3310	Žalec
00050000-56ab-58a7-02b6-ca7e743d3e7d	4228	Železniki
00050000-56ab-58a7-d8fd-724472464836	2287	Žetale
00050000-56ab-58a7-7ea6-0f69652df6e3	4226	Žiri
00050000-56ab-58a7-f121-7ac9b0595be3	4274	Žirovnica
00050000-56ab-58a7-a05f-63a43e5096ed	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 41824164)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 41823734)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 41823474)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56ab-58ad-eb77-bd3c235d7ade	00080000-56ab-58ad-b5b4-c0aaf92cfd6d	\N	00040000-56ab-58a8-bff7-baa266ad016f	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56ab-58ad-4ebf-eb6fb65b1dd8	00080000-56ab-58ad-b5b4-c0aaf92cfd6d	\N	00040000-56ab-58a8-bff7-baa266ad016f	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56ab-58ad-be8d-d6d6aaeca172	00080000-56ab-58ad-f7eb-eebf01ffdec4	\N	00040000-56ab-58a8-bff7-baa266ad016f	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 41823609)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56ab-58a9-f044-cb300ecb8146	novo leto	1	1	\N	t
00430000-56ab-58a9-b5d7-30127cd8fe1a	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56ab-58a9-24d7-88b9c14cca23	dan upora proti okupatorju	27	4	\N	t
00430000-56ab-58a9-83d7-a885464e61b4	praznik dela	1	5	\N	t
00430000-56ab-58a9-c5db-3174b159649f	praznik dela	2	5	\N	t
00430000-56ab-58a9-8139-502ad8b08a97	dan Primoža Trubarja	8	6	\N	f
00430000-56ab-58a9-e797-3759112d0978	dan državnosti	25	6	\N	t
00430000-56ab-58a9-99a8-3e538fdd35e7	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56ab-58a9-ff57-c42c95332fac	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56ab-58a9-3a80-3ed09e8c20ff	dan suverenosti	25	10	\N	f
00430000-56ab-58a9-45ae-9028b4e7fa2b	dan spomina na mrtve	1	11	\N	t
00430000-56ab-58a9-f13c-d09ecf658687	dan Rudolfa Maistra	23	11	\N	f
00430000-56ab-58a9-f088-fa1f90e7081c	božič	25	12	\N	t
00430000-56ab-58a9-17b6-db8a19c85c07	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56ab-58a9-897d-6e8b1a0469d6	Marijino vnebovzetje	15	8	\N	t
00430000-56ab-58a9-85c8-bebffd2081e0	dan reformacije	31	10	\N	t
00430000-56ab-58a9-2744-0b5c5c226cfe	velikonočna nedelja	27	3	2016	t
00430000-56ab-58a9-d3f1-33094b1a2637	velikonočna nedelja	16	4	2017	t
00430000-56ab-58a9-ced0-fbccbc9215b2	velikonočna nedelja	1	4	2018	t
00430000-56ab-58a9-9c79-2c7eeed29e52	velikonočna nedelja	21	4	2019	t
00430000-56ab-58a9-dbd1-d1f6159f45b8	velikonočna nedelja	12	4	2020	t
00430000-56ab-58a9-7830-56e386bff99c	velikonočna nedelja	4	4	2021	t
00430000-56ab-58a9-c4ec-e66e2e323bcc	velikonočna nedelja	17	4	2022	t
00430000-56ab-58a9-62ec-1c0df8708ebb	velikonočna nedelja	9	4	2023	t
00430000-56ab-58a9-0a06-19e8a871e949	velikonočna nedelja	31	3	2024	t
00430000-56ab-58a9-81ce-3cc28d4a2cb0	velikonočna nedelja	20	4	2025	t
00430000-56ab-58a9-f9ce-b1911132ec2d	velikonočna nedelja	5	4	2026	t
00430000-56ab-58a9-c686-6c113402f12e	velikonočna nedelja	28	3	2027	t
00430000-56ab-58a9-6492-5e7c51c19b55	velikonočna nedelja	16	4	2028	t
00430000-56ab-58a9-bca3-8de257d73d30	velikonočna nedelja	1	4	2029	t
00430000-56ab-58a9-f887-63a0cc051806	velikonočna nedelja	21	4	2030	t
00430000-56ab-58a9-fa95-0178e108f4ee	velikonočni ponedeljek	28	3	2016	t
00430000-56ab-58a9-500b-920127005a9f	velikonočni ponedeljek	17	4	2017	t
00430000-56ab-58a9-ad32-e2eba1ec95c5	velikonočni ponedeljek	2	4	2018	t
00430000-56ab-58a9-bfbd-4c50c0c766c7	velikonočni ponedeljek	22	4	2019	t
00430000-56ab-58a9-c330-c4cac4ff2d80	velikonočni ponedeljek	13	4	2020	t
00430000-56ab-58a9-47c9-9af4352fccc8	velikonočni ponedeljek	5	4	2021	t
00430000-56ab-58a9-9a93-26962edd4964	velikonočni ponedeljek	18	4	2022	t
00430000-56ab-58a9-2376-10d0cd8eff02	velikonočni ponedeljek	10	4	2023	t
00430000-56ab-58a9-b251-c5f9266fb4b0	velikonočni ponedeljek	1	4	2024	t
00430000-56ab-58a9-b738-3e92ef20a4a4	velikonočni ponedeljek	21	4	2025	t
00430000-56ab-58a9-9539-f977e81f2e69	velikonočni ponedeljek	6	4	2026	t
00430000-56ab-58a9-2292-4d958f76af07	velikonočni ponedeljek	29	3	2027	t
00430000-56ab-58a9-6d72-d1f1d5e3fc91	velikonočni ponedeljek	17	4	2028	t
00430000-56ab-58a9-b472-dd660f5c68bb	velikonočni ponedeljek	2	4	2029	t
00430000-56ab-58a9-e769-875f0de2aa27	velikonočni ponedeljek	22	4	2030	t
00430000-56ab-58a9-8f65-e5681602884a	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56ab-58a9-292c-5bd469645b7f	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56ab-58a9-b9fd-da4bccdae181	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56ab-58a9-4d75-82a8a8aa3dda	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56ab-58a9-214d-58786660778f	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56ab-58a9-bb4e-844f6b04097f	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56ab-58a9-5dfe-de7f99f3352d	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56ab-58a9-fd30-f9d9d0035047	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56ab-58a9-0c3a-abf8e26b608f	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56ab-58a9-0816-c20ea5d2e13c	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56ab-58a9-c110-7347c3e5e196	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56ab-58a9-ba04-738dbedcdd5f	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56ab-58a9-9c70-9aabad0367cf	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56ab-58a9-840d-d703f627564a	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56ab-58a9-0793-98dbf3fa063e	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 41823578)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56ab-58af-863a-e7e76733fa3a	000e0000-56ab-58ae-8921-b72c78999659	1	1	\N
001b0000-56ab-58b0-6a31-d8ac1419cd61	000e0000-56ab-58ae-8921-b72c78999659	1	2	\N
001b0000-56ab-58af-fb03-51200831ccfb	000e0000-56ab-58ae-8921-b72c78999659	1	3	1
001b0000-56ab-58af-8905-03d38d2f331c	000e0000-56ab-58ae-8921-b72c78999659	2	4	2
001b0000-56ab-58af-7639-79541c0b291f	000e0000-56ab-58ae-8921-b72c78999659	4	5	3
001b0000-56ab-58b0-ced8-88fc76bdc350	000e0000-56ab-58ae-ce44-a1a42bde7c83	1	1	\N
001b0000-56ab-58af-d1ff-9c22ac57662f	000e0000-56ab-58ae-ce44-a1a42bde7c83	3	2	1
001b0000-56ab-58b0-94b6-edfa12251383	000e0000-56ab-58ae-ce44-a1a42bde7c83	1	5	1
001b0000-56ab-58b0-95f0-84cdb0b90eb8	000e0000-56ab-58ae-8921-b72c78999659	1	6	1
001b0000-56ab-58b0-38f0-53ec93c4112b	000e0000-56ab-58ae-8921-b72c78999659	2	7	2
001b0000-56ab-58af-474f-6ef26bd3bdc4	000e0000-56ab-58ae-8921-b72c78999659	5	9	4
001b0000-56ab-58af-292e-79b4c0f1d951	000e0000-56ab-58ae-8921-b72c78999659	7	10	5
001b0000-56ab-58af-0689-546aa51cf0e0	000e0000-56ab-58ae-ce44-a1a42bde7c83	4	3	1
001b0000-56ab-58b0-f86f-7c798e8e2633	000e0000-56ab-58ae-8921-b72c78999659	3	8	3
001b0000-56ab-58b0-0064-3bd8885f42bd	000e0000-56ab-58ae-8921-b72c78999659	2	11	1
001b0000-56ab-58b0-ef46-8a7d8ddeccf4	000e0000-56ab-58ae-ce44-a1a42bde7c83	6	4	2
\.


--
-- TOC entry 3161 (class 0 OID 41823584)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56ab-58af-fb03-51200831ccfb	000a0000-56ab-58ad-48a6-e414a9cdf1f6
001b0000-56ab-58af-fb03-51200831ccfb	000a0000-56ab-58ad-6efd-b4cb447b4e06
001b0000-56ab-58af-8905-03d38d2f331c	000a0000-56ab-58ad-6efd-b4cb447b4e06
001b0000-56ab-58af-8905-03d38d2f331c	000a0000-56ab-58ad-43a4-e21aa31cce85
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 41823746)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 41824178)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 41824188)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56ab-58ad-b8de-58e486ec4d5a	00080000-56ab-58ad-e3ad-e80de2fa10b1	0987	AK
00190000-56ab-58ad-ce13-8a1c41c9f051	00080000-56ab-58ad-f7eb-eebf01ffdec4	0989	AK
00190000-56ab-58ad-5a48-fe692396aeb6	00080000-56ab-58ad-6f07-316d93a0e73c	0986	AK
00190000-56ab-58ad-803b-6c8c8c6ccae2	00080000-56ab-58ad-7346-8415cb67004b	0984	AK
00190000-56ab-58ae-01af-af2d7af408c8	00080000-56ab-58ad-b309-e0cc84ab9307	0983	AK
00190000-56ab-58ae-d5a3-5216b5460117	00080000-56ab-58ad-24d5-8f2a59f94663	0982	AK
00190000-56ab-58b1-429e-3dd0fe2190ae	00080000-56ab-58b1-a77d-7d1a57f81b7c	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 41824077)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56ab-58ae-7e77-c6aff4c2aa35	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 41824196)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 41823774)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56ab-58ad-f41b-8944972b2668	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56ab-58ad-0ae5-c731d370facc	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56ab-58ad-6605-b1c35b8a80da	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56ab-58ad-f2f6-564f3ab89b5d	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56ab-58ad-da86-8d58cb1ae4ee	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56ab-58ad-5df0-08f88740d782	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56ab-58ad-455e-7358e6d163a3	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 41823719)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 41823709)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 41823916)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 41823846)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 41823552)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 41823313)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56ab-58b1-a77d-7d1a57f81b7c	00010000-56ab-58ab-f0b3-9e96ed5baf8b	2016-01-29 13:18:57	INS	a:0:{}
2	App\\Entity\\Option	00000000-56ab-58b1-b5e0-f5aea4368de0	00010000-56ab-58ab-f0b3-9e96ed5baf8b	2016-01-29 13:18:57	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56ab-58b1-429e-3dd0fe2190ae	00010000-56ab-58ab-f0b3-9e96ed5baf8b	2016-01-29 13:18:57	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 41823788)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 41823351)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56ab-58a9-30ad-2278874dd030	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56ab-58a9-be80-53fd7ea5c827	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56ab-58a9-ba60-84bba7274c3e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56ab-58a9-a7a1-bdb278431091	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56ab-58a9-16b0-f811aa11b112	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56ab-58a9-5172-d32419759ab2	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56ab-58a9-3c59-e23abac7ea79	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56ab-58a9-6735-234561a26446	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56ab-58a9-9875-d262cd8aa05a	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-58a9-723e-035c4badb407	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-58a9-5afe-3fce32059218	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-58a9-d7c7-ee478356124b	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-58a9-bc54-4127b7dd0d28	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56ab-58aa-7dc5-b1d30e53ab1a	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56ab-58aa-74ed-bc96ea3044ae	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56ab-58aa-e27a-b78bbb1e745b	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56ab-58aa-739c-76768cc74826	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56ab-58aa-129b-f2ad6f0a1d3d	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56ab-58aa-3b72-1a7de73b8c1b	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56ab-58aa-4440-51ba61b5f465	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56ab-58aa-2400-3cd107179054	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56ab-58aa-8e72-f5d3da7fd4db	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56ab-58aa-c5d0-1b05f67bc11e	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56ab-58aa-1dea-ecef02cc50b4	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56ab-58aa-cd04-453696ad036c	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56ab-58aa-92a3-50ac2ba6a4db	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56ab-58aa-22c8-2788c85573d9	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56ab-58aa-5e02-831dc896f658	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56ab-58aa-0571-d78287996cb5	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56ab-58aa-b645-cf5db2d3f784	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56ab-58aa-217e-60432b4dfab2	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56ab-58aa-f376-0e9f39b32eaf	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56ab-58aa-55f0-5fa6521917dc	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56ab-58aa-6d24-31dc17df3bd0	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56ab-58aa-4d0e-ab4171555022	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56ab-58aa-2384-5abd05f3b9b7	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56ab-58aa-bc85-77b19f203d33	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56ab-58aa-b373-d530e2c04a08	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56ab-58aa-3bfd-d695012fb92b	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56ab-58aa-2f8c-3db5bd03abf7	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56ab-58aa-efec-5367fdb89d42	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56ab-58aa-6931-8aad391dd46d	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56ab-58aa-5493-7bbf1a736089	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56ab-58aa-1089-4a5ab0221b2a	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56ab-58aa-25b2-ff99f5d7f033	direktor	minimalne pravice za direktorja	t
00020000-56ab-58aa-7165-99c992a32074	arhivar	arhivar	t
00020000-56ab-58aa-10b1-bc04344fba5a	dramaturg	dramaturg	t
00020000-56ab-58aa-fb1f-a27fe5211ad5	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56ab-58aa-2916-3236c0fca9fe	poslovni-sekretar	poslovni sekretar	t
00020000-56ab-58aa-cec8-917d6e29703c	vodja-tehnike	vodja tehnike	t
00020000-56ab-58aa-7a5d-3d1527bbf8a8	racunovodja	računovodja	t
00020000-56ab-58ac-586b-cbaf7af7bf77	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56ab-58ac-03de-35b3402bf1a8	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-30c8-86600ee4d0ea	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-8d5c-0edf658c226a	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-6329-b24cd2227c5e	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-8f29-193b1534014d	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-7d3f-c74b3083059b	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-b8ed-a4b50cc74890	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-828f-612c28ac1e4e	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-f2bd-774638e20e27	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-5af9-ff51855185ed	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-9796-a951d065d38d	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-c7ae-4d1699d0c684	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-d71d-4225191c30d1	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-7ce7-689fd2b7406c	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-d8ba-4606c97d221a	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-c558-83421edcbc75	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-caec-44022bb5896a	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-c3a5-07e8d78983dc	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-12de-092558c0fa21	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56ab-58ac-b03d-b1f416f861af	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-8e9d-3daf02f4dd45	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-10a4-d2eeb13ed8e7	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-9dcb-68bb73b44262	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-7970-2a2cf8bb0372	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-150e-5d9e9c806200	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-720a-adbe61b95125	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-e9fb-beb250b2e9de	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-3fdd-bf687a70f51b	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-eaa6-570af46b51c8	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-8910-34e6e9f0b3a4	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-8050-2920ac14a2f0	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-5478-2da18d85caab	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-a563-566203c7e5c2	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-b5a3-9e5499021bb0	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56ab-58ac-0c9c-257b03c6d018	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56ab-58ad-de19-611abe84aa0d	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56ab-58ad-b7fb-fda0ee0852a0	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56ab-58ad-e093-7cbea602f3cd	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 41823335)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56ab-58ab-eb8c-a704541513a0	00020000-56ab-58a9-ba60-84bba7274c3e
00010000-56ab-58ab-f0b3-9e96ed5baf8b	00020000-56ab-58a9-ba60-84bba7274c3e
00010000-56ab-58ad-5cbb-fc379a0a54f4	00020000-56ab-58ac-586b-cbaf7af7bf77
00010000-56ab-58ad-f0b3-d2c9648db769	00020000-56ab-58ac-03de-35b3402bf1a8
00010000-56ab-58ad-f0b3-d2c9648db769	00020000-56ab-58ac-8f29-193b1534014d
00010000-56ab-58ad-f0b3-d2c9648db769	00020000-56ab-58ac-f2bd-774638e20e27
00010000-56ab-58ad-f0b3-d2c9648db769	00020000-56ab-58ac-9796-a951d065d38d
00010000-56ab-58ad-f0b3-d2c9648db769	00020000-56ab-58ac-d71d-4225191c30d1
00010000-56ab-58ad-f0b3-d2c9648db769	00020000-56ab-58ac-c3a5-07e8d78983dc
00010000-56ab-58ad-f0b3-d2c9648db769	00020000-56ab-58ac-8d5c-0edf658c226a
00010000-56ab-58ad-f0b3-d2c9648db769	00020000-56ab-58ac-b03d-b1f416f861af
00010000-56ab-58ad-f0b3-d2c9648db769	00020000-56ab-58ac-9dcb-68bb73b44262
00010000-56ab-58ad-f0b3-d2c9648db769	00020000-56ab-58ac-150e-5d9e9c806200
00010000-56ab-58ad-f0b3-d2c9648db769	00020000-56ab-58ac-e9fb-beb250b2e9de
00010000-56ab-58ad-f0b3-d2c9648db769	00020000-56ab-58ac-eaa6-570af46b51c8
00010000-56ab-58ad-f0b3-d2c9648db769	00020000-56ab-58ac-a563-566203c7e5c2
00010000-56ab-58ad-14f7-c562d17fa6b1	00020000-56ab-58ac-03de-35b3402bf1a8
00010000-56ab-58ad-14f7-c562d17fa6b1	00020000-56ab-58ac-30c8-86600ee4d0ea
00010000-56ab-58ad-14f7-c562d17fa6b1	00020000-56ab-58ac-8d5c-0edf658c226a
00010000-56ab-58ad-14f7-c562d17fa6b1	00020000-56ab-58ac-6329-b24cd2227c5e
00010000-56ab-58ad-14f7-c562d17fa6b1	00020000-56ab-58ac-d71d-4225191c30d1
00010000-56ab-58ad-14f7-c562d17fa6b1	00020000-56ab-58ac-c558-83421edcbc75
00010000-56ab-58ad-14f7-c562d17fa6b1	00020000-56ab-58ac-b03d-b1f416f861af
00010000-56ab-58ad-14f7-c562d17fa6b1	00020000-56ab-58ac-9dcb-68bb73b44262
00010000-56ab-58ad-14f7-c562d17fa6b1	00020000-56ab-58ac-150e-5d9e9c806200
00010000-56ab-58ad-14f7-c562d17fa6b1	00020000-56ab-58ac-e9fb-beb250b2e9de
00010000-56ab-58ad-14f7-c562d17fa6b1	00020000-56ab-58ac-eaa6-570af46b51c8
00010000-56ab-58ad-14f7-c562d17fa6b1	00020000-56ab-58ac-a563-566203c7e5c2
00010000-56ab-58ad-94d1-e927063c232f	00020000-56ab-58ac-03de-35b3402bf1a8
00010000-56ab-58ad-94d1-e927063c232f	00020000-56ab-58ac-30c8-86600ee4d0ea
00010000-56ab-58ad-94d1-e927063c232f	00020000-56ab-58ac-8d5c-0edf658c226a
00010000-56ab-58ad-94d1-e927063c232f	00020000-56ab-58ac-6329-b24cd2227c5e
00010000-56ab-58ad-94d1-e927063c232f	00020000-56ab-58ac-9796-a951d065d38d
00010000-56ab-58ad-94d1-e927063c232f	00020000-56ab-58ac-d71d-4225191c30d1
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ac-30c8-86600ee4d0ea
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ac-7d3f-c74b3083059b
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ac-5af9-ff51855185ed
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ac-c7ae-4d1699d0c684
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ac-9796-a951d065d38d
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ac-caec-44022bb5896a
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ac-d71d-4225191c30d1
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ac-7ce7-689fd2b7406c
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ac-b03d-b1f416f861af
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ac-8e9d-3daf02f4dd45
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ac-9dcb-68bb73b44262
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ac-7970-2a2cf8bb0372
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ac-150e-5d9e9c806200
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ac-720a-adbe61b95125
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ac-e9fb-beb250b2e9de
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ac-3fdd-bf687a70f51b
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ac-eaa6-570af46b51c8
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ac-8910-34e6e9f0b3a4
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ac-a563-566203c7e5c2
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ac-b5a3-9e5499021bb0
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ad-de19-611abe84aa0d
00010000-56ab-58ad-c27c-0023cf681a23	00020000-56ab-58ad-b7fb-fda0ee0852a0
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-30c8-86600ee4d0ea
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-7d3f-c74b3083059b
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-828f-612c28ac1e4e
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-5af9-ff51855185ed
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-c7ae-4d1699d0c684
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-9796-a951d065d38d
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-caec-44022bb5896a
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-d71d-4225191c30d1
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-7ce7-689fd2b7406c
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-d8ba-4606c97d221a
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-b03d-b1f416f861af
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-8e9d-3daf02f4dd45
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-10a4-d2eeb13ed8e7
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-9dcb-68bb73b44262
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-7970-2a2cf8bb0372
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-150e-5d9e9c806200
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-720a-adbe61b95125
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-e9fb-beb250b2e9de
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-3fdd-bf687a70f51b
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-eaa6-570af46b51c8
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-8910-34e6e9f0b3a4
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-a563-566203c7e5c2
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-b5a3-9e5499021bb0
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ac-0c9c-257b03c6d018
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ad-de19-611abe84aa0d
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ad-b7fb-fda0ee0852a0
00010000-56ab-58ad-a1cc-0d7ae82f8486	00020000-56ab-58ad-e093-7cbea602f3cd
00010000-56ab-58ad-7129-a368f6d4990e	00020000-56ab-58ac-30c8-86600ee4d0ea
00010000-56ab-58ad-7129-a368f6d4990e	00020000-56ab-58ac-8d5c-0edf658c226a
00010000-56ab-58ad-7129-a368f6d4990e	00020000-56ab-58ac-7d3f-c74b3083059b
00010000-56ab-58ad-7129-a368f6d4990e	00020000-56ab-58ac-b8ed-a4b50cc74890
00010000-56ab-58ad-7129-a368f6d4990e	00020000-56ab-58ac-828f-612c28ac1e4e
00010000-56ab-58ad-7129-a368f6d4990e	00020000-56ab-58ac-8f29-193b1534014d
00010000-56ab-58ad-7129-a368f6d4990e	00020000-56ab-58ac-5af9-ff51855185ed
00010000-56ab-58ad-7129-a368f6d4990e	00020000-56ab-58ac-c7ae-4d1699d0c684
00010000-56ab-58ad-7129-a368f6d4990e	00020000-56ab-58ac-9796-a951d065d38d
00010000-56ab-58ad-7129-a368f6d4990e	00020000-56ab-58ac-caec-44022bb5896a
00010000-56ab-58ad-e41f-6f66adb8bfc9	00020000-56ab-58ac-03de-35b3402bf1a8
00010000-56ab-58ad-e41f-6f66adb8bfc9	00020000-56ab-58ac-6329-b24cd2227c5e
00010000-56ab-58ad-e41f-6f66adb8bfc9	00020000-56ab-58ac-8f29-193b1534014d
00010000-56ab-58ad-e41f-6f66adb8bfc9	00020000-56ab-58ac-f2bd-774638e20e27
00010000-56ab-58ad-e41f-6f66adb8bfc9	00020000-56ab-58ac-9796-a951d065d38d
00010000-56ab-58ad-e41f-6f66adb8bfc9	00020000-56ab-58ac-d71d-4225191c30d1
00010000-56ab-58ad-e41f-6f66adb8bfc9	00020000-56ab-58ac-c3a5-07e8d78983dc
00010000-56ab-58ad-e41f-6f66adb8bfc9	00020000-56ab-58ac-8050-2920ac14a2f0
00010000-56ab-58ad-a401-def2f14fb575	00020000-56ab-58ac-12de-092558c0fa21
00010000-56ab-58ad-7fef-3181d1571e76	00020000-56ab-58aa-25b2-ff99f5d7f033
00010000-56ab-58ad-a524-691d83a4e712	00020000-56ab-58aa-7165-99c992a32074
00010000-56ab-58ad-7b83-228d8d7fc06b	00020000-56ab-58aa-10b1-bc04344fba5a
00010000-56ab-58ad-dedd-c1b8135461f7	00020000-56ab-58aa-fb1f-a27fe5211ad5
00010000-56ab-58ad-7bd4-4999fa815fb7	00020000-56ab-58aa-2916-3236c0fca9fe
00010000-56ab-58ad-1d13-d4493c3e6275	00020000-56ab-58aa-cec8-917d6e29703c
00010000-56ab-58ad-86c7-ba6b3080fe91	00020000-56ab-58aa-7a5d-3d1527bbf8a8
\.


--
-- TOC entry 3186 (class 0 OID 41823802)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 41823740)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 41823663)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56ab-58ad-b24a-c6adcbbce593	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56ab-58ad-5c8d-8e03f0d3db11	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56ab-58ad-8bfd-55adf44c2591	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56ab-58ad-dd6e-7205ff0270c1	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 41823300)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56ab-58a8-6e6b-d72acda56d27	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56ab-58a8-e55d-871184e54f85	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56ab-58a8-e376-485b20c59f40	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56ab-58a8-6e7f-005694aec9ee	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56ab-58a8-a870-64bf1ce1f786	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 41823292)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56ab-58a8-4e07-fd2457f47817	00230000-56ab-58a8-6e7f-005694aec9ee	popa
00240000-56ab-58a8-dfaf-2960bb88461c	00230000-56ab-58a8-6e7f-005694aec9ee	oseba
00240000-56ab-58a8-af2d-9871c6998afd	00230000-56ab-58a8-6e7f-005694aec9ee	tippopa
00240000-56ab-58a8-f8fc-77d9714db950	00230000-56ab-58a8-6e7f-005694aec9ee	organizacijskaenota
00240000-56ab-58a8-f425-891f0b100805	00230000-56ab-58a8-6e7f-005694aec9ee	sezona
00240000-56ab-58a8-2d2c-d2e51eac74f4	00230000-56ab-58a8-6e7f-005694aec9ee	tipvaje
00240000-56ab-58a8-b3dc-4feb454b949e	00230000-56ab-58a8-6e7f-005694aec9ee	tipdodatka
00240000-56ab-58a8-f54f-f259e5580657	00230000-56ab-58a8-e55d-871184e54f85	prostor
00240000-56ab-58a8-b6cf-2d7deeb199e9	00230000-56ab-58a8-6e7f-005694aec9ee	besedilo
00240000-56ab-58a8-91cf-681ac82b1dc6	00230000-56ab-58a8-6e7f-005694aec9ee	uprizoritev
00240000-56ab-58a8-c73b-7d806340cddd	00230000-56ab-58a8-6e7f-005694aec9ee	funkcija
00240000-56ab-58a8-310c-0b66a27fe6fa	00230000-56ab-58a8-6e7f-005694aec9ee	tipfunkcije
00240000-56ab-58a8-bb5c-cbfc63db7b67	00230000-56ab-58a8-6e7f-005694aec9ee	alternacija
00240000-56ab-58a8-70c7-02beb91b97cb	00230000-56ab-58a8-6e6b-d72acda56d27	pogodba
00240000-56ab-58a8-04e1-153df099ace4	00230000-56ab-58a8-6e7f-005694aec9ee	zaposlitev
00240000-56ab-58a8-3dc0-a49d88f7576d	00230000-56ab-58a8-6e7f-005694aec9ee	zvrstuprizoritve
00240000-56ab-58a8-28a6-1f4e354b3329	00230000-56ab-58a8-6e6b-d72acda56d27	programdela
00240000-56ab-58a8-75cb-2662de6e1ed6	00230000-56ab-58a8-6e7f-005694aec9ee	zapis
\.


--
-- TOC entry 3133 (class 0 OID 41823287)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
049ee4d7-0fe7-4ce0-8bf8-92683b3eaf92	00240000-56ab-58a8-4e07-fd2457f47817	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 41823863)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56ab-58ae-66a3-07239191a3fe	000e0000-56ab-58ae-8921-b72c78999659	00080000-56ab-58ad-b5b4-c0aaf92cfd6d	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56ab-58a9-9888-098a00780664
00270000-56ab-58ae-249e-b4cca4fafd96	000e0000-56ab-58ae-8921-b72c78999659	00080000-56ab-58ad-b5b4-c0aaf92cfd6d	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56ab-58a9-9888-098a00780664
\.


--
-- TOC entry 3149 (class 0 OID 41823436)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 41823682)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56ab-58b0-846a-246222de3967	00180000-56ab-58af-c088-9e2bcf0210bf	000c0000-56ab-58af-8e24-057021c63202	00090000-56ab-58ae-51e0-4fe324288bf7	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-58b0-969f-2436af7c2432	00180000-56ab-58af-c088-9e2bcf0210bf	000c0000-56ab-58af-e687-33829d0baaba	00090000-56ab-58ae-6079-fe068484bbf9	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-58b0-7c0f-32ac88c20449	00180000-56ab-58af-c088-9e2bcf0210bf	000c0000-56ab-58af-2349-4cb5e62d02ae	00090000-56ab-58ae-3e6f-bb925a9fc3ad	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-58b0-2ac7-d36d56567f78	00180000-56ab-58af-c088-9e2bcf0210bf	000c0000-56ab-58af-6f0d-05e591da18ae	00090000-56ab-58ae-1b5f-d036d03cf43a	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-58b0-f752-ef944c4ec096	00180000-56ab-58af-c088-9e2bcf0210bf	000c0000-56ab-58af-d27d-0b8c0596906b	00090000-56ab-58ae-5e77-1ac2aca8d0a7	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-58b0-b2fe-ee6e44513fe5	00180000-56ab-58af-0fbc-3719495a32f7	\N	00090000-56ab-58ae-5e77-1ac2aca8d0a7	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56ab-58b0-839e-3ce0dc04d0d5	00180000-56ab-58af-f9cf-170c6c5aad96	\N	00090000-56ab-58ae-6079-fe068484bbf9	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56ab-58b0-5270-3c4b0697dc23	00180000-56ab-58af-c088-9e2bcf0210bf	\N	00090000-56ab-58ae-ab57-44c0e674355c	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 41823699)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56ab-58a8-bcf6-ab021b1ebdb7	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56ab-58a8-18e6-2997d9dda930	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56ab-58a8-3f3a-c1254d4b6f86	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56ab-58a8-2ccb-80fc45e167e1	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56ab-58a8-9196-75c125adf745	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56ab-58a8-f8cd-68f53d8d36c3	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 41823904)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56ab-58a8-c91a-8390ac67e205	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56ab-58a8-fb90-4cb924cb1b2b	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56ab-58a8-1c56-05e48f667d3f	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56ab-58a8-614f-c02707037e97	04	Režija	Režija	Režija	umetnik	30
000f0000-56ab-58a8-8cdd-f4b03a19499a	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56ab-58a8-53aa-45282452ed5b	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56ab-58a8-a5be-323887a332b3	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56ab-58a8-16de-58c717133a75	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56ab-58a8-8a9e-f15a7eb4f83c	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56ab-58a8-a0cf-67453b574792	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56ab-58a8-3bbd-42645a4516bf	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56ab-58a8-74d4-e34f4e979925	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56ab-58a8-956a-34bb5c168206	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56ab-58a8-24ca-5321f1f6780a	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56ab-58a8-8728-35153182d57f	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56ab-58a8-9299-fb6286a2d853	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56ab-58a8-3a9e-222921e396ad	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56ab-58a8-9f83-279d3bb070d7	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56ab-58a8-b383-2c60acc84044	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 41823387)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56ab-58ad-c77a-29c18d8240f3	0001	šola	osnovna ali srednja šola
00400000-56ab-58ad-27f1-fc743f509269	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56ab-58ad-bac4-39cd247ea865	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 41824208)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56ab-58a8-4233-af1dfbde69c9	01	Velika predstava	f	1.00	1.00
002b0000-56ab-58a8-a2c3-f726e67f6895	02	Mala predstava	f	0.50	0.50
002b0000-56ab-58a8-f45a-6fcd25c66ead	03	Mala koprodukcija	t	0.40	1.00
002b0000-56ab-58a8-56ef-28e189c95119	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56ab-58a8-2f64-0714833f2b8c	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 41823653)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56ab-58a8-4fe3-468a46283a3d	0001	prva vaja	prva vaja
00420000-56ab-58a8-650a-56364dbac462	0002	tehnična vaja	tehnična vaja
00420000-56ab-58a8-24f2-02552d43e740	0003	lučna vaja	lučna vaja
00420000-56ab-58a8-bf61-6efffb5a0e69	0004	kostumska vaja	kostumska vaja
00420000-56ab-58a8-59d9-aaf6e2e74514	0005	foto vaja	foto vaja
00420000-56ab-58a8-8562-429f7528c4ae	0006	1. glavna vaja	1. glavna vaja
00420000-56ab-58a8-efcb-849ae6c31dba	0007	2. glavna vaja	2. glavna vaja
00420000-56ab-58a8-2250-fe86dd514172	0008	1. generalka	1. generalka
00420000-56ab-58a8-6c5f-7fa78dcfa34c	0009	2. generalka	2. generalka
00420000-56ab-58a8-b7a8-7299634ead7a	0010	odprta generalka	odprta generalka
00420000-56ab-58a8-ae32-bec4c44fe452	0011	obnovitvena vaja	obnovitvena vaja
00420000-56ab-58a8-563b-357609811269	0012	italijanka	krajša "obnovitvena" vaja
00420000-56ab-58a8-431d-e13c726389eb	0013	pevska vaja	pevska vaja
00420000-56ab-58a8-192d-d2425cf552c7	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56ab-58a8-1b68-fa4eed415efb	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56ab-58a8-abbe-7939f017cbec	0016	orientacijska vaja	orientacijska vaja
00420000-56ab-58a8-04c0-7c90a430662e	0017	situacijska vaja	situacijska vaja
00420000-56ab-58a8-fe30-6ff450153e60	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 41823509)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 41823322)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56ab-58ab-f0b3-9e96ed5baf8b	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROAKE2DFP7Y96JBZO1O8cIeQCeqbVLcL6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-6d99-ca063857c710	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-d936-00925436a81f	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-eab2-91edb339833e	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-e320-4a7a0a885aef	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-d0d4-36b345b857b2	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-0cb6-cc184da19093	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-10cf-1e81022a2ac6	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-f4dd-3f16645073df	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-8c62-62d2b7265b96	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-5cbb-fc379a0a54f4	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-198d-ff107b9868c1	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-f0b3-d2c9648db769	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-14f7-c562d17fa6b1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-94d1-e927063c232f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-c27c-0023cf681a23	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-a1cc-0d7ae82f8486	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-7129-a368f6d4990e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-e41f-6f66adb8bfc9	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-a401-def2f14fb575	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-7fef-3181d1571e76	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-a524-691d83a4e712	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-7b83-228d8d7fc06b	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-dedd-c1b8135461f7	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-7bd4-4999fa815fb7	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-1d13-d4493c3e6275	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56ab-58ad-86c7-ba6b3080fe91	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56ab-58ab-eb8c-a704541513a0	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 41823954)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56ab-58ae-ce44-a1a42bde7c83	00160000-56ab-58ad-77f4-a08c5ed95d91	\N	00140000-56ab-58a8-df87-29d510f7d831	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56ab-58ad-da86-8d58cb1ae4ee
000e0000-56ab-58ae-8921-b72c78999659	00160000-56ab-58ad-1b1f-1080d617394a	\N	00140000-56ab-58a8-0af6-9980b1aa2825	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56ab-58ad-5df0-08f88740d782
000e0000-56ab-58ae-611d-c90bb0c0860c	\N	\N	00140000-56ab-58a8-0af6-9980b1aa2825	00190000-56ab-58ad-b8de-58e486ec4d5a	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56ab-58ad-da86-8d58cb1ae4ee
000e0000-56ab-58ae-f655-e61cbd0d4171	\N	\N	00140000-56ab-58a8-0af6-9980b1aa2825	00190000-56ab-58ad-b8de-58e486ec4d5a	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56ab-58ad-da86-8d58cb1ae4ee
000e0000-56ab-58ae-324a-8b5966e8fcfe	\N	\N	00140000-56ab-58a8-0af6-9980b1aa2825	00190000-56ab-58ad-b8de-58e486ec4d5a	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-58ad-f41b-8944972b2668
000e0000-56ab-58ae-dcf9-7de92566918f	\N	\N	00140000-56ab-58a8-0af6-9980b1aa2825	00190000-56ab-58ad-b8de-58e486ec4d5a	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-58ad-f41b-8944972b2668
000e0000-56ab-58ae-6628-e72e9ea79346	\N	\N	00140000-56ab-58a8-76ab-8457e0764118	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-58ad-f41b-8944972b2668
000e0000-56ab-58ae-0e4c-e49c873b4ebf	\N	\N	00140000-56ab-58a8-76ab-8457e0764118	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-58ad-f41b-8944972b2668
000e0000-56ab-58ae-89b0-541814870a8e	\N	\N	00140000-56ab-58a8-76ab-8457e0764118	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-58ad-f41b-8944972b2668
000e0000-56ab-58ae-9543-827937be3fad	\N	\N	00140000-56ab-58a8-76ab-8457e0764118	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-58ad-f41b-8944972b2668
000e0000-56ab-58ae-cfb9-baf11aab5dd9	\N	\N	00140000-56ab-58a8-76ab-8457e0764118	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-58ad-f41b-8944972b2668
000e0000-56ab-58ae-dd0b-9b8a59e6554d	\N	\N	00140000-56ab-58a8-76ab-8457e0764118	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-58ad-f41b-8944972b2668
000e0000-56ab-58ae-b23f-aae713edcc3c	\N	\N	00140000-56ab-58a8-76ab-8457e0764118	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-58ad-f41b-8944972b2668
000e0000-56ab-58ae-e916-5c8251de2255	\N	\N	00140000-56ab-58a8-76ab-8457e0764118	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-58ad-f41b-8944972b2668
000e0000-56ab-58ae-dd7a-6855f3751d1d	\N	\N	00140000-56ab-58a8-76ab-8457e0764118	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-58ad-f41b-8944972b2668
\.


--
-- TOC entry 3170 (class 0 OID 41823673)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 41823602)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56ab-58af-6145-b404d7334ab0	\N	000e0000-56ab-58ae-ce44-a1a42bde7c83	1
00200000-56ab-58af-057d-6e9f1d0eb45a	\N	000e0000-56ab-58ae-8921-b72c78999659	1
00200000-56ab-58af-8523-1149447a43c3	\N	000e0000-56ab-58ae-8921-b72c78999659	3
00200000-56ab-58af-b287-640154501018	\N	000e0000-56ab-58ae-8921-b72c78999659	4
00200000-56ab-58af-2e90-8a4c159b66f7	\N	000e0000-56ab-58ae-8921-b72c78999659	2
00200000-56ab-58af-0b2c-128203493e4b	\N	000e0000-56ab-58ae-8921-b72c78999659	8
00200000-56ab-58af-0215-6826699fb56f	\N	000e0000-56ab-58ae-8921-b72c78999659	7
00200000-56ab-58af-9d5b-a1fb62cae6bb	\N	000e0000-56ab-58ae-8921-b72c78999659	9
00200000-56ab-58af-c01d-7c26fdba8f4a	\N	000e0000-56ab-58ae-8921-b72c78999659	6
00200000-56ab-58af-c876-29739e69d4fa	\N	000e0000-56ab-58ae-8921-b72c78999659	5
\.


--
-- TOC entry 3182 (class 0 OID 41823766)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 41823877)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56ab-58a9-151c-78b5a81485ca	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56ab-58a9-4fb2-15d480861a45	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56ab-58a9-9c1f-3d7faf4b0726	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56ab-58a9-a545-84079d02d4fc	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56ab-58a9-70d6-c716bf113747	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56ab-58a9-d726-f665aefcded8	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56ab-58a9-4059-ad455468e750	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56ab-58a9-e077-516b03b5ccc3	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56ab-58a9-9888-098a00780664	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56ab-58a9-147f-1efc6e89fb10	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56ab-58a9-8607-01e465672019	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56ab-58a9-b4ab-f1bbf0b09e68	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56ab-58a9-f29f-99fb99097bbc	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56ab-58a9-6032-c965a04da441	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56ab-58a9-3de0-126a1b922a61	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56ab-58a9-6103-58e648ef448c	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56ab-58a9-b3e1-bd9abd6f8dbe	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56ab-58a9-93f6-aed8daab2dec	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56ab-58a9-6559-407fe6c993a7	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56ab-58a9-3c93-f696fc7bff8b	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56ab-58a9-e5c1-e5e6ad7a810b	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56ab-58a9-d951-8432f04818c9	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56ab-58a9-b89f-bf021f2438d0	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56ab-58a9-a94e-e62b9ecb1294	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56ab-58a9-bb5c-8baad3be604d	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56ab-58a9-0f19-6d384e1b1c07	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56ab-58a9-bdaa-7b3943502d64	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56ab-58a9-1233-d0904cfde7d6	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 41824258)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 41824227)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 41824270)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 41823839)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56ab-58ae-1f63-b29b33c9d706	00090000-56ab-58ae-6079-fe068484bbf9	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-58ae-2595-8e6b211826b4	00090000-56ab-58ae-3e6f-bb925a9fc3ad	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-58ae-0026-8a82797dec88	00090000-56ab-58ae-7f74-9f8bf7f2666f	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-58ae-f2eb-30036ee7b2bb	00090000-56ab-58ae-9c35-c02505b3d5ad	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-58ae-d149-88ed31fa2992	00090000-56ab-58ae-b0f7-a2607e0845ff	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-58ae-3d92-010ce32941f3	00090000-56ab-58ae-c625-06362b7f40ec	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 41823944)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56ab-58a8-df87-29d510f7d831	01	Drama	drama (SURS 01)
00140000-56ab-58a8-4c58-07f5c37f8f23	02	Opera	opera (SURS 02)
00140000-56ab-58a8-fb40-5287ee774df1	03	Balet	balet (SURS 03)
00140000-56ab-58a8-a3d2-0c5ac8a2ebbe	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56ab-58a8-76ab-8457e0764118	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56ab-58a8-0af6-9980b1aa2825	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56ab-58a8-1c09-bdd6d70d7f21	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 41823829)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 41823386)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 41824002)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 41823993)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 41823376)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 41823860)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 41823902)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 41824311)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 41823696)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 41823631)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 41823647)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 41823652)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 41824225)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 41823535)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 41824071)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 41823825)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 41823600)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 41823573)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 41823549)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 41823732)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 41824288)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 41824295)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 41824319)
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
-- TOC entry 2766 (class 2606 OID 41823758)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 41823507)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 41823405)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 41823469)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 41823432)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 41823365)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 41823350)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 41823764)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 41823801)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 41823939)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 41823460)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 41823495)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 41824176)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 41823738)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 41823485)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 41823616)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 41823588)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 41823582)
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
-- TOC entry 2764 (class 2606 OID 41823750)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 41824185)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 41824193)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 41824163)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 41824206)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 41823783)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 41823723)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 41823714)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 41823926)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 41823853)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 41823561)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 41823321)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 41823792)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 41823339)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 41823359)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 41823810)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 41823745)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 41823671)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 41823309)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 41823297)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 41823291)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 41823873)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 41823441)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 41823688)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 41823706)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 41823913)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 41823394)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 41824218)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 41823660)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 41823520)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 41823334)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 41823972)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 41823679)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 41823606)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 41823772)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 41823885)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 41824268)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 41824252)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 41824276)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 41823843)
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
-- TOC entry 2833 (class 2606 OID 41823952)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 41823837)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 41823641)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 41823642)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 41823640)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 41823638)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 41823639)
-- Name: idx_11e93b5d7634c214; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d7634c214 ON dogodek USING btree (nadrejenogostovanje_id);


--
-- TOC entry 2708 (class 1259 OID 41823637)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 41823874)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 41823875)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 41823876)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 41824290)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 41824289)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 41823462)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 41823463)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 41823765)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 41824256)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 41824255)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 41824257)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 41824254)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 41824253)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 41823751)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 41823607)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 41823608)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 41823826)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 41823828)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 41823827)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 41823551)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 41823550)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 41824207)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 41823941)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 41823942)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 41823943)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 41824277)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 41823977)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 41823974)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 41823978)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 41823976)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 41823975)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 41823522)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 41823521)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 41823435)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 41823793)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 41823366)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 41823367)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 41823813)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 41823812)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 41823811)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 41823472)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 41823471)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 41823473)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 41823583)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2595 (class 1259 OID 41823299)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 41823718)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 41823716)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 41823715)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 41823717)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 41823340)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 41823341)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 41823773)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 41824312)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 41823862)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 41823861)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 41824320)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 41824321)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 41823739)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 41823854)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 41823855)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 41824076)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 41824075)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 41824072)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 41824073)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 41824074)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 41823487)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 41823486)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 41823488)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 41823787)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 41823786)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 41824186)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 41824187)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 41824006)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 41824007)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 41824004)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 41824005)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 41823697)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 41823698)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 41823844)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 41823845)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 41823680)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 41823727)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 41823726)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 41823724)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 41823725)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 41823994)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 41823562)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 41823576)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 41823575)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 41823574)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 41823577)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 41823601)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 41823589)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 41823590)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 41824177)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 41824226)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 41824296)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 41824297)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 41823407)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 41823406)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 41823442)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 41823443)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 41823691)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 41823690)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 41823689)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 41823633)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 41823636)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 41823632)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 41823635)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 41823634)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 41823461)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 41823395)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 41823396)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 41823536)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 41823538)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 41823537)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 41823539)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 41823733)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 41823940)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 41823973)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 41823914)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 41823915)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 41823433)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 41823434)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 41823707)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 41823708)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 41823838)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 41823310)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 41823508)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 41823470)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 41823298)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 41824219)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 41823785)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 41823784)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 41823661)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 41823662)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 41824003)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 41823681)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 41823496)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 41823953)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 41824269)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 41824194)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 41824195)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 41823903)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 41823672)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 41823360)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 41824482)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 41824507)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 41824497)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 41824477)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2940 (class 2606 OID 41824512)
-- Name: fk_11e93b5d7634c214; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d7634c214 FOREIGN KEY (nadrejenogostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2944 (class 2606 OID 41824492)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 41824502)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 41824487)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2985 (class 2606 OID 41824692)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 41824697)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2983 (class 2606 OID 41824702)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3016 (class 2606 OID 41824862)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 41824857)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 41824377)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 41824382)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 41824607)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3011 (class 2606 OID 41824842)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 41824837)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3010 (class 2606 OID 41824847)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 41824832)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3014 (class 2606 OID 41824827)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 41824602)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2939 (class 2606 OID 41824467)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2938 (class 2606 OID 41824472)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 41824647)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 41824657)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 41824652)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 41824432)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 41824427)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 41824592)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 41824817)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2988 (class 2606 OID 41824707)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 41824712)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2986 (class 2606 OID 41824717)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 41824852)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2990 (class 2606 OID 41824737)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2993 (class 2606 OID 41824722)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2989 (class 2606 OID 41824742)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 41824732)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2992 (class 2606 OID 41824727)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 41824422)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 41824417)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 41824362)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 41824357)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 41824627)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 41824337)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 41824342)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2971 (class 2606 OID 41824642)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 41824637)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2973 (class 2606 OID 41824632)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 41824392)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 41824387)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 41824397)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 41824447)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 41824322)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 41824567)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 41824557)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 41824552)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 41824562)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 41824327)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 41824332)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 41824612)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 41824877)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2981 (class 2606 OID 41824687)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 41824682)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 41824882)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 41824887)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 41824597)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 41824672)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2979 (class 2606 OID 41824677)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2999 (class 2606 OID 41824792)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 41824787)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3003 (class 2606 OID 41824772)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 41824777)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 41824782)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 41824407)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 41824402)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 41824412)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2968 (class 2606 OID 41824622)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 41824617)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 41824802)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3005 (class 2606 OID 41824807)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2996 (class 2606 OID 41824762)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2995 (class 2606 OID 41824767)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2998 (class 2606 OID 41824752)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 41824757)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 41824542)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 41824547)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 41824662)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 41824667)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 41824517)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 41824522)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 41824587)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 41824582)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 41824572)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 41824577)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 41824747)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 41824437)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 41824442)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2937 (class 2606 OID 41824462)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2936 (class 2606 OID 41824452)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2935 (class 2606 OID 41824457)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 41824797)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 41824812)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 41824822)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 41824867)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 41824872)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 41824352)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 41824347)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 41824367)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 41824372)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 41824537)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 41824532)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 41824527)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-29 13:19:00 CET

--
-- PostgreSQL database dump complete
--

