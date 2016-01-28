--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-28 16:57:11 CET

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
-- TOC entry 185 (class 1259 OID 41514412)
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
-- TOC entry 241 (class 1259 OID 41515030)
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
-- TOC entry 240 (class 1259 OID 41515014)
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
-- TOC entry 184 (class 1259 OID 41514405)
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
-- TOC entry 183 (class 1259 OID 41514403)
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
-- TOC entry 231 (class 1259 OID 41514891)
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
-- TOC entry 234 (class 1259 OID 41514921)
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
-- TOC entry 255 (class 1259 OID 41515333)
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
-- TOC entry 212 (class 1259 OID 41514727)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 41514652)
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
-- TOC entry 206 (class 1259 OID 41514678)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 41514683)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 41515255)
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
-- TOC entry 196 (class 1259 OID 41514558)
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
-- TOC entry 242 (class 1259 OID 41515043)
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
-- TOC entry 227 (class 1259 OID 41514849)
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
-- TOC entry 202 (class 1259 OID 41514626)
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
-- TOC entry 199 (class 1259 OID 41514598)
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
-- TOC entry 197 (class 1259 OID 41514575)
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
-- TOC entry 216 (class 1259 OID 41514763)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 41515313)
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
-- TOC entry 254 (class 1259 OID 41515326)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 41515348)
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
-- TOC entry 220 (class 1259 OID 41514787)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 41514532)
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
-- TOC entry 187 (class 1259 OID 41514432)
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
-- TOC entry 191 (class 1259 OID 41514499)
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
-- TOC entry 188 (class 1259 OID 41514443)
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
-- TOC entry 180 (class 1259 OID 41514377)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 41514396)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 41514794)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 41514829)
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
-- TOC entry 237 (class 1259 OID 41514962)
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
-- TOC entry 190 (class 1259 OID 41514479)
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
-- TOC entry 193 (class 1259 OID 41514524)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 41515199)
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
-- TOC entry 217 (class 1259 OID 41514769)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 41514509)
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
-- TOC entry 204 (class 1259 OID 41514644)
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
-- TOC entry 200 (class 1259 OID 41514613)
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
-- TOC entry 201 (class 1259 OID 41514619)
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
-- TOC entry 219 (class 1259 OID 41514781)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 41515213)
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
-- TOC entry 246 (class 1259 OID 41515223)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 41515112)
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
-- TOC entry 247 (class 1259 OID 41515231)
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
-- TOC entry 223 (class 1259 OID 41514809)
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
-- TOC entry 215 (class 1259 OID 41514754)
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
-- TOC entry 214 (class 1259 OID 41514744)
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
-- TOC entry 236 (class 1259 OID 41514951)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 41514881)
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
-- TOC entry 198 (class 1259 OID 41514587)
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
-- TOC entry 177 (class 1259 OID 41514348)
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
-- TOC entry 176 (class 1259 OID 41514346)
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
-- TOC entry 224 (class 1259 OID 41514823)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 41514386)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 41514370)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 41514837)
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
-- TOC entry 218 (class 1259 OID 41514775)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 41514698)
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
-- TOC entry 175 (class 1259 OID 41514335)
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
-- TOC entry 174 (class 1259 OID 41514327)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 41514322)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 41514898)
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
-- TOC entry 189 (class 1259 OID 41514471)
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
-- TOC entry 211 (class 1259 OID 41514717)
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
-- TOC entry 213 (class 1259 OID 41514734)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 41514939)
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
-- TOC entry 186 (class 1259 OID 41514422)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 41515243)
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
-- TOC entry 208 (class 1259 OID 41514688)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 41514544)
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
-- TOC entry 178 (class 1259 OID 41514357)
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
-- TOC entry 239 (class 1259 OID 41514989)
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
-- TOC entry 210 (class 1259 OID 41514708)
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
-- TOC entry 203 (class 1259 OID 41514637)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 41514801)
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
-- TOC entry 233 (class 1259 OID 41514912)
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
-- TOC entry 251 (class 1259 OID 41515293)
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
-- TOC entry 250 (class 1259 OID 41515262)
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
-- TOC entry 252 (class 1259 OID 41515305)
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
-- TOC entry 229 (class 1259 OID 41514874)
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
-- TOC entry 238 (class 1259 OID 41514979)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 41514864)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 41514408)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 41514351)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 41514412)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56aa-3a53-8464-4cf910e3ddd4	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56aa-3a53-c592-6ea1901c12b7	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56aa-3a53-9560-fd3109a6a506	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 41515030)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56aa-3a54-0a62-f81a5d1a78d5	000d0000-56aa-3a54-3d9e-27765ae8a1c3	\N	00090000-56aa-3a54-4e56-966032f7d2cd	000b0000-56aa-3a54-a70b-712417cc2c59	0001	f	\N	\N	\N	3	t	t	t
000c0000-56aa-3a54-460d-bd6f03009a75	000d0000-56aa-3a54-86ac-62ccf827e956	00100000-56aa-3a54-9011-81c96a73bcbc	00090000-56aa-3a54-7a86-8d7481598d7b	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56aa-3a54-ae1e-8ff62bbd94d7	000d0000-56aa-3a54-81ac-47c852cd99c8	00100000-56aa-3a54-1640-d91b349d1d94	00090000-56aa-3a54-914f-0fc4951c857a	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56aa-3a54-c630-3ab51d2c1e11	000d0000-56aa-3a54-5620-3a73a6ec0238	\N	00090000-56aa-3a54-0920-1f4c3b1ec01b	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56aa-3a54-f8d4-f1a235020988	000d0000-56aa-3a54-dff4-5ffe79bc5fd9	\N	00090000-56aa-3a54-8921-8839a5d1bba9	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56aa-3a54-3e9b-ee45310651cf	000d0000-56aa-3a54-8bdf-2bc140c257e2	\N	00090000-56aa-3a54-6c0e-cab3cfc309dc	000b0000-56aa-3a54-cb4e-f2aa3894adee	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56aa-3a54-1e8e-c66682a6797d	000d0000-56aa-3a54-eafe-fe9ee484744f	00100000-56aa-3a54-4fb1-12683b752808	00090000-56aa-3a54-0331-104c8692de07	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56aa-3a54-cd3a-3c2a46393201	000d0000-56aa-3a54-5eeb-f88d7ceacd98	\N	00090000-56aa-3a54-f01d-eb49b79dcd9e	000b0000-56aa-3a54-3989-b4b98178f002	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56aa-3a54-6671-2fde4a3f6fc9	000d0000-56aa-3a54-eafe-fe9ee484744f	00100000-56aa-3a54-f2ac-c584f354715c	00090000-56aa-3a54-648b-9f52e756a44b	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56aa-3a54-bba8-e1e43b7ead6c	000d0000-56aa-3a54-eafe-fe9ee484744f	00100000-56aa-3a54-3896-5cc79a197396	00090000-56aa-3a54-b569-9d480d16ea3d	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56aa-3a54-deb3-a998653ba491	000d0000-56aa-3a54-eafe-fe9ee484744f	00100000-56aa-3a54-150d-15436eab4832	00090000-56aa-3a54-f876-8aa01d39eba5	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56aa-3a54-a9e7-b085fac73852	000d0000-56aa-3a54-3569-7b8103d4504d	00100000-56aa-3a54-9011-81c96a73bcbc	00090000-56aa-3a54-7a86-8d7481598d7b	000b0000-56aa-3a54-3c7b-051abc8062e3	0012	t	\N	\N	\N	2	t	t	t
000c0000-56aa-3a54-1e7f-b3495bfabe41	000d0000-56aa-3a54-a327-7de26e14fc2a	\N	00090000-56aa-3a54-f01d-eb49b79dcd9e	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56aa-3a54-096d-20a88ca52c7d	000d0000-56aa-3a54-a327-7de26e14fc2a	\N	00090000-56aa-3a54-8bcc-b10ed7ca64f8	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56aa-3a54-8738-a6e9e3e64441	000d0000-56aa-3a54-ebb3-9e7c8cc6f2be	00100000-56aa-3a54-1640-d91b349d1d94	00090000-56aa-3a54-914f-0fc4951c857a	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56aa-3a54-8da5-dd2f9b3be099	000d0000-56aa-3a54-ebb3-9e7c8cc6f2be	\N	00090000-56aa-3a54-8bcc-b10ed7ca64f8	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56aa-3a54-c663-6f5c459aeed7	000d0000-56aa-3a54-493d-5c3dfac4b2c6	\N	00090000-56aa-3a54-8bcc-b10ed7ca64f8	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56aa-3a54-177a-f71c9802d4b7	000d0000-56aa-3a54-493d-5c3dfac4b2c6	\N	00090000-56aa-3a54-f01d-eb49b79dcd9e	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56aa-3a54-b16d-3146b867595a	000d0000-56aa-3a54-c25c-45f0ef9f2075	00100000-56aa-3a54-4fb1-12683b752808	00090000-56aa-3a54-0331-104c8692de07	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56aa-3a54-4d72-4c5dc07ff2ed	000d0000-56aa-3a54-c25c-45f0ef9f2075	\N	00090000-56aa-3a54-8bcc-b10ed7ca64f8	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56aa-3a54-9d1b-4b5be3fdd09b	000d0000-56aa-3a54-fd52-103b47a1f30b	\N	00090000-56aa-3a54-8bcc-b10ed7ca64f8	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56aa-3a54-9d29-78a180b7a812	000d0000-56aa-3a54-fd52-103b47a1f30b	00100000-56aa-3a54-4fb1-12683b752808	00090000-56aa-3a54-0331-104c8692de07	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56aa-3a54-b36d-9f823c4210c6	000d0000-56aa-3a54-efa6-0ca5f4b8251b	\N	00090000-56aa-3a54-8bcc-b10ed7ca64f8	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56aa-3a54-2cdc-1a270cc11c32	000d0000-56aa-3a54-367d-a948edb61160	\N	00090000-56aa-3a54-f01d-eb49b79dcd9e	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56aa-3a54-308a-680c923800c9	000d0000-56aa-3a54-1f9c-1445082db8f1	\N	00090000-56aa-3a54-f01d-eb49b79dcd9e	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56aa-3a54-852c-2a9fcfbd59f9	000d0000-56aa-3a54-1f9c-1445082db8f1	00100000-56aa-3a54-1640-d91b349d1d94	00090000-56aa-3a54-914f-0fc4951c857a	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56aa-3a54-45f6-3e0ddcbbc7f1	000d0000-56aa-3a54-0e40-351e1d7ed727	\N	00090000-56aa-3a54-236d-7540f98dbd56	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56aa-3a54-4cc9-c9cb3eb22365	000d0000-56aa-3a54-0e40-351e1d7ed727	\N	00090000-56aa-3a54-e2c4-996471340fee	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56aa-3a54-05ec-89f456c9c4f8	000d0000-56aa-3a54-9ec1-9e451175a6c6	\N	00090000-56aa-3a54-f01d-eb49b79dcd9e	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56aa-3a54-638f-b89bbf40bbfa	000d0000-56aa-3a54-9ec1-9e451175a6c6	00100000-56aa-3a54-1640-d91b349d1d94	00090000-56aa-3a54-914f-0fc4951c857a	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56aa-3a54-3089-ed7a3cea456d	000d0000-56aa-3a54-9ec1-9e451175a6c6	\N	00090000-56aa-3a54-e2c4-996471340fee	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56aa-3a54-84fb-e0ddc93094fb	000d0000-56aa-3a54-9ec1-9e451175a6c6	\N	00090000-56aa-3a54-236d-7540f98dbd56	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56aa-3a54-381e-1b91d0e3415d	000d0000-56aa-3a54-0dc4-45c608a41507	\N	00090000-56aa-3a54-f01d-eb49b79dcd9e	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56aa-3a54-7d95-198d04e36293	000d0000-56aa-3a54-841b-583aa0edf381	00100000-56aa-3a54-1640-d91b349d1d94	00090000-56aa-3a54-914f-0fc4951c857a	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56aa-3a54-4848-70a17f8b07a5	000d0000-56aa-3a54-841b-583aa0edf381	\N	00090000-56aa-3a54-8bcc-b10ed7ca64f8	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 41515014)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 41514405)
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
-- TOC entry 3191 (class 0 OID 41514891)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56aa-3a54-ccc4-026e13aed3b1	00160000-56aa-3a53-da5d-92ccb3242cf9	00090000-56aa-3a54-e2c4-996471340fee	aizv	10	t
003d0000-56aa-3a54-8b0a-37faadca2aea	00160000-56aa-3a53-da5d-92ccb3242cf9	00090000-56aa-3a54-c1e1-e16d7f0ad69a	apri	14	t
003d0000-56aa-3a54-9fd1-a6c42eb3d9e5	00160000-56aa-3a53-9910-f1e87aa2dbf0	00090000-56aa-3a54-236d-7540f98dbd56	aizv	11	t
003d0000-56aa-3a54-af78-3a3a1654f6ff	00160000-56aa-3a53-3830-371103e19a10	00090000-56aa-3a54-5bfb-491dd4ab87e9	aizv	12	t
003d0000-56aa-3a54-a436-6a80ffb5124b	00160000-56aa-3a53-da5d-92ccb3242cf9	00090000-56aa-3a54-8bcc-b10ed7ca64f8	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 41514921)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56aa-3a53-da5d-92ccb3242cf9	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56aa-3a53-9910-f1e87aa2dbf0	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56aa-3a53-3830-371103e19a10	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 41515333)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 41514727)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 41514652)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva, nadrejenogostovanje_id) FROM stdin;
00180000-56aa-3a54-7a36-fc8cff4e6972	\N	\N	\N	\N	00440000-56aa-3a54-70cc-b8e133762df0	00220000-56aa-3a53-bd63-a4e8c117b4de	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N	\N
00180000-56aa-3a54-8d6d-6b29df8e3fc4	\N	\N	\N	\N	00440000-56aa-3a54-1308-428ebbc1a0d5	00220000-56aa-3a53-1a61-e971756ee092	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N	\N
00180000-56aa-3a54-46cf-fd7060a371d4	\N	\N	\N	001e0000-56aa-3a54-7cff-8d8b7778182a	\N	00220000-56aa-3a53-bd63-a4e8c117b4de	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N	\N
00180000-56aa-3a54-e9ec-f776b975fbf8	\N	\N	\N	001e0000-56aa-3a54-20c3-bcbc9603a1fb	\N	00220000-56aa-3a53-1a61-e971756ee092	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N	\N
00180000-56aa-3a54-0a13-567a2b3c4137	001b0000-56aa-3a54-bdca-5d8998d46a30	\N	\N	\N	\N	00220000-56aa-3a53-bd63-a4e8c117b4de	001f0000-56aa-3a53-4fcb-376593d78445	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N	\N
00180000-56aa-3a54-c5ed-c1a147d81480	001b0000-56aa-3a54-17da-deabe112571a	\N	\N	\N	\N	00220000-56aa-3a53-1a61-e971756ee092	001f0000-56aa-3a53-4fcb-376593d78445	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N	\N
00180000-56aa-3a54-ac0e-b45fc2955e26	001b0000-56aa-3a54-a8b5-84466f5c1274	\N	\N	\N	\N	00220000-56aa-3a53-bd63-a4e8c117b4de	001f0000-56aa-3a53-4fcb-376593d78445	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N	\N
00180000-56aa-3a54-84a4-e6cde07cd500	001b0000-56aa-3a54-fcdb-d129975e6507	\N	\N	\N	\N	00220000-56aa-3a53-bd63-a4e8c117b4de	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N	\N
00180000-56aa-3a54-6255-a111ca1e6c2a	001b0000-56aa-3a54-892e-f7085f9212a1	\N	\N	\N	\N	00220000-56aa-3a53-bd63-a4e8c117b4de	001f0000-56aa-3a53-072d-e43264bd121d	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N	\N
00180000-56aa-3a54-29f2-1ae1cfce838f	001b0000-56aa-3a54-2998-454d880c7a61	\N	\N	\N	\N	00220000-56aa-3a53-bd63-a4e8c117b4de	001f0000-56aa-3a53-072d-e43264bd121d	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N	\N
00180000-56aa-3a54-fcf8-9defe4a8c344	001b0000-56aa-3a54-134d-6a2a2d70da5c	\N	\N	\N	\N	00220000-56aa-3a53-bd63-a4e8c117b4de	001f0000-56aa-3a53-4fcb-376593d78445	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N	\N
00180000-56aa-3a54-c3f9-5a50840676c9	001b0000-56aa-3a54-8205-214c21befede	\N	\N	\N	\N	00220000-56aa-3a53-bd63-a4e8c117b4de	001f0000-56aa-3a53-072d-e43264bd121d	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N	\N
00180000-56aa-3a54-991a-5e102e32164d	001b0000-56aa-3a54-ef55-ca3bcb7f88d0	\N	\N	\N	\N	00220000-56aa-3a53-bd63-a4e8c117b4de	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N	\N
00180000-56aa-3a54-ac1a-9f79a9d86716	001b0000-56aa-3a54-8d61-5a8ba23b091b	\N	\N	\N	\N	00220000-56aa-3a53-bd63-a4e8c117b4de	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N	\N
00180000-56aa-3a54-bd5c-d928043ecf88	001b0000-56aa-3a54-5ef5-5d05bd119efc	\N	\N	\N	\N	00220000-56aa-3a53-bd63-a4e8c117b4de	001f0000-56aa-3a53-072d-e43264bd121d	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N	\N
00180000-56aa-3a54-d3e6-ba0f41fbbbc5	001b0000-56aa-3a54-50d0-fc5cb2439dca	\N	\N	\N	\N	00220000-56aa-3a53-bd63-a4e8c117b4de	001f0000-56aa-3a53-d41a-29b6b41c3d88	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N	\N
00180000-56aa-3a54-c891-21f0b21fffdd	001b0000-56aa-3a54-d2a0-f1d5650126fa	\N	\N	\N	\N	00220000-56aa-3a53-bd63-a4e8c117b4de	001f0000-56aa-3a53-d41a-29b6b41c3d88	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N	\N
00180000-56aa-3a54-17eb-1affacc2c897	001b0000-56aa-3a54-fbf4-77bf76a70ec3	\N	\N	\N	\N	00220000-56aa-3a53-bd63-a4e8c117b4de	001f0000-56aa-3a53-072d-e43264bd121d	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N	\N
00180000-56aa-3a54-b129-80058971b063	001b0000-56aa-3a54-9571-bd1be6df4373	\N	\N	\N	\N	\N	001f0000-56aa-3a53-072d-e43264bd121d	2015-03-15 20:00:00	2015-03-15 23:00:00	200s	100s	\N	Predstava 15.	\N	\N
00180000-56aa-3a54-6716-24eb01be5733	001b0000-56aa-3a54-79b9-24903315c229	\N	\N	\N	\N	\N	001f0000-56aa-3a53-072d-e43264bd121d	2015-03-16 20:00:00	2015-03-16 23:00:00	200s	100s	\N	Predstava 16.	\N	\N
00180000-56aa-3a55-6f88-bba8f0376eb4	\N	00200000-56aa-3a55-a599-f901b8b7d7ca	\N	\N	\N	00220000-56aa-3a53-2779-fdd235dd9371	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	Vaja 1.	\N	\N
00180000-56aa-3a55-0840-8ba4f7c43576	\N	00200000-56aa-3a55-e9c9-1ce28254049f	\N	\N	\N	00220000-56aa-3a53-2779-fdd235dd9371	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	Vaja 2.	\N	\N
00180000-56aa-3a55-8e7a-dfa114e69868	\N	00200000-56aa-3a55-4dcc-ae1c8b3768e8	\N	\N	\N	00220000-56aa-3a53-1a61-e971756ee092	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 3.	\N	\N
00180000-56aa-3a55-c5bf-afe2649d0c0e	\N	00200000-56aa-3a55-4782-3d64085c5c78	\N	\N	\N	00220000-56aa-3a53-9ba2-cbbc1e8760f6	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	Vaja 4.	\N	\N
00180000-56aa-3a55-1877-9a86f6cd6cdd	\N	00200000-56aa-3a55-15f4-bb35e77eda86	\N	\N	\N	00220000-56aa-3a53-008e-33c3e10d5cc5	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	Vaja 5.	\N	\N
00180000-56aa-3a55-89b2-4c008ed7c981	\N	00200000-56aa-3a55-5c2b-5445fcc296f4	\N	\N	\N	00220000-56aa-3a53-1a61-e971756ee092	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 6.	\N	\N
00180000-56aa-3a55-4314-705bbc35e983	\N	00200000-56aa-3a55-e825-41621348620e	\N	\N	\N	00220000-56aa-3a53-008e-33c3e10d5cc5	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 7.	\N	\N
00180000-56aa-3a55-0540-fab783c394ff	\N	00200000-56aa-3a55-9c00-d8d589bf914b	\N	\N	\N	00220000-56aa-3a53-008e-33c3e10d5cc5	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 8.	\N	\N
00180000-56aa-3a55-c5b7-5a8674a92bb7	\N	00200000-56aa-3a55-4d09-7fe8d3ad1c75	\N	\N	\N	00220000-56aa-3a53-2779-fdd235dd9371	001f0000-56aa-3a53-4fcb-376593d78445	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	Vaja 9.	\N	\N
00180000-56aa-3a55-7ed6-95b659bb9c26	\N	00200000-56aa-3a55-c5e2-0d0ce6f672e8	\N	\N	\N	00220000-56aa-3a53-2779-fdd235dd9371	001f0000-56aa-3a53-4fcb-376593d78445	2014-06-11 07:00:00	2014-06-12 15:00:00	400s	200s	\N	Vaja 10.	\N	\N
00180000-56aa-3a55-430f-c6d13379922f	\N	\N	001c0000-56aa-3a55-af36-0ee567176f3e	\N	\N	\N	001f0000-56aa-3a53-072d-e43264bd121d	2015-03-10 07:00:00	2015-03-20 23:00:00	200s	300s	\N	Gostovanje 1.	#001122	\N
\.


--
-- TOC entry 3166 (class 0 OID 41514678)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56aa-3a54-7cff-8d8b7778182a
001e0000-56aa-3a54-20c3-bcbc9603a1fb
\.


--
-- TOC entry 3167 (class 0 OID 41514683)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56aa-3a54-70cc-b8e133762df0
00440000-56aa-3a54-1308-428ebbc1a0d5
\.


--
-- TOC entry 3209 (class 0 OID 41515255)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 41514558)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56aa-3a50-2ffe-93be878264b7	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56aa-3a50-b1d9-2a43363ddb3d	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56aa-3a50-7229-1286d28ef2b5	AL	ALB	008	Albania 	Albanija	\N
00040000-56aa-3a50-e8a2-f6a967578e35	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56aa-3a50-ae30-29d80922f2f1	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56aa-3a50-2bee-cde3c681fbf0	AD	AND	020	Andorra 	Andora	\N
00040000-56aa-3a50-0598-2a01279f2cd5	AO	AGO	024	Angola 	Angola	\N
00040000-56aa-3a50-74e8-86ab6fd6baed	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56aa-3a50-455a-d2065cb73a10	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56aa-3a50-da11-d10b69901507	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56aa-3a50-a337-936b3b9bc6dd	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56aa-3a50-3dc0-3319d003e2a1	AM	ARM	051	Armenia 	Armenija	\N
00040000-56aa-3a50-95a7-c50ee7b757dc	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56aa-3a50-8a65-d1af19d1007d	AU	AUS	036	Australia 	Avstralija	\N
00040000-56aa-3a50-cc1d-9f68f49004e8	AT	AUT	040	Austria 	Avstrija	\N
00040000-56aa-3a50-0a8e-f1d7fb469e97	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56aa-3a50-c80c-bee301cb0ced	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56aa-3a50-b20c-368e8c2bdfdd	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56aa-3a50-733c-4e99f27e92a6	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56aa-3a50-6fe4-fdbe61c50a94	BB	BRB	052	Barbados 	Barbados	\N
00040000-56aa-3a50-effa-2e03e9174c88	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56aa-3a50-feec-0369fde26a44	BE	BEL	056	Belgium 	Belgija	\N
00040000-56aa-3a50-cd24-f07f7955d92a	BZ	BLZ	084	Belize 	Belize	\N
00040000-56aa-3a50-6b42-28b3bfaa045d	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56aa-3a50-1003-d2c797ecf155	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56aa-3a50-b967-eab03d69c37a	BT	BTN	064	Bhutan 	Butan	\N
00040000-56aa-3a50-8b21-781bc1463e4c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56aa-3a50-31c3-af32c5442207	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56aa-3a50-91d7-ea0dde9e0c7d	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56aa-3a50-2b3d-7cd41b8be2d6	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56aa-3a50-3927-1570673865dc	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56aa-3a50-c91a-815cc4b11c7b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56aa-3a50-a927-bd3831456523	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56aa-3a50-623c-f6984a238201	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56aa-3a50-8694-552df1e8682d	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56aa-3a50-4494-05496d329992	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56aa-3a50-bd58-3e0946a86c2a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56aa-3a50-73b0-7d4619541373	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56aa-3a50-c9e5-94a60c1fafaf	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56aa-3a50-95f9-16db5d31a365	CA	CAN	124	Canada 	Kanada	\N
00040000-56aa-3a50-855c-678f3476b914	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56aa-3a50-06b0-f7de9dd1d522	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56aa-3a50-8c31-ac4d03820ad9	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56aa-3a50-550c-2f4159f75d30	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56aa-3a50-aece-b2f8725dddb2	CL	CHL	152	Chile 	Čile	\N
00040000-56aa-3a50-03f7-1a09d3037f13	CN	CHN	156	China 	Kitajska	\N
00040000-56aa-3a50-dcee-bc0fd67789eb	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56aa-3a50-ba96-645b3af7cf47	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56aa-3a50-054d-600e21dd0fb4	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56aa-3a50-3145-578475799302	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56aa-3a50-b04f-23eb97920265	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56aa-3a50-3d4e-dfb3df49e1c3	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56aa-3a50-ce1c-9a74ba79d51e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56aa-3a50-3a42-071a574e65ec	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56aa-3a50-8884-8c037aaa17bc	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56aa-3a50-2425-3d9190a8a368	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56aa-3a50-f3df-fe0c3aa78227	CU	CUB	192	Cuba 	Kuba	\N
00040000-56aa-3a50-a542-13c667c3a884	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56aa-3a50-703f-c9e04819b008	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56aa-3a50-3b18-d77cd23e66fb	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56aa-3a50-d46f-d54f68829466	DK	DNK	208	Denmark 	Danska	\N
00040000-56aa-3a51-f3f7-f7f86f092b37	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56aa-3a51-6b31-fc69d763087c	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56aa-3a51-b5ae-7bdce9811617	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56aa-3a51-df64-56def77fdf1f	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56aa-3a51-c62c-4c7103d52adb	EG	EGY	818	Egypt 	Egipt	\N
00040000-56aa-3a51-0e33-1e3d02f65c6f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56aa-3a51-4321-516679fa4acf	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56aa-3a51-0662-108a4935df5c	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56aa-3a51-3604-b7eee0644740	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56aa-3a51-eb0d-693add78aa08	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56aa-3a51-4c2a-9f0951d8592b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56aa-3a51-4c04-94228f2ebf74	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56aa-3a51-4904-394188b384fc	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56aa-3a51-eea0-9ba11c8ec15a	FI	FIN	246	Finland 	Finska	\N
00040000-56aa-3a51-5cc9-df2705cada55	FR	FRA	250	France 	Francija	\N
00040000-56aa-3a51-779c-722a8b926b78	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56aa-3a51-1d8c-5d20e34e7749	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56aa-3a51-51af-60afd2549662	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56aa-3a51-079b-a821a1b615be	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56aa-3a51-3ec4-b32abc77dd60	GA	GAB	266	Gabon 	Gabon	\N
00040000-56aa-3a51-7c3e-f0ede93b689f	GM	GMB	270	Gambia 	Gambija	\N
00040000-56aa-3a51-8eb6-ad473d76a7e4	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56aa-3a51-65c3-690020e55a78	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56aa-3a51-f83e-fbd8570e8164	GH	GHA	288	Ghana 	Gana	\N
00040000-56aa-3a51-7fdc-99bccd4e33e6	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56aa-3a51-fa0b-0af700700f21	GR	GRC	300	Greece 	Grčija	\N
00040000-56aa-3a51-9d3d-304bb9f4fcc8	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56aa-3a51-ee56-19bbc6ea87d3	GD	GRD	308	Grenada 	Grenada	\N
00040000-56aa-3a51-05cc-5eb826db8047	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56aa-3a51-ebac-6d8eb275eb17	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56aa-3a51-1c3f-b19f581ce185	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56aa-3a51-5d56-07925900395b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56aa-3a51-1aef-c7bef2a7f241	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56aa-3a51-8630-113602999fec	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56aa-3a51-aac1-e840ded89906	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56aa-3a51-486f-d0630a629b9e	HT	HTI	332	Haiti 	Haiti	\N
00040000-56aa-3a51-7a37-0941164f44bc	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56aa-3a51-8f73-d0cb272dd296	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56aa-3a51-0a86-6d27bff924c9	HN	HND	340	Honduras 	Honduras	\N
00040000-56aa-3a51-e5c8-aa1fc42f30f4	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56aa-3a51-90a1-3ff39e4d8a1a	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56aa-3a51-fc5f-731c0af458c8	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56aa-3a51-afec-b029cc37282e	IN	IND	356	India 	Indija	\N
00040000-56aa-3a51-0edf-2eabfcf721ff	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56aa-3a51-70e2-5fd3724ffedf	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56aa-3a51-73dd-ed7d5f06fdec	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56aa-3a51-2271-8bd31a871ad5	IE	IRL	372	Ireland 	Irska	\N
00040000-56aa-3a51-511d-4a74cc82daf0	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56aa-3a51-8941-7a60bd54cae4	IL	ISR	376	Israel 	Izrael	\N
00040000-56aa-3a51-06e7-c078f1a1a403	IT	ITA	380	Italy 	Italija	\N
00040000-56aa-3a51-2eaa-79260febe855	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56aa-3a51-e152-79fca8daf9ab	JP	JPN	392	Japan 	Japonska	\N
00040000-56aa-3a51-1b0a-5661ce22f160	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56aa-3a51-5825-5845bad3d743	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56aa-3a51-6293-bde54e6b5c40	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56aa-3a51-3163-fe5563c6b7e0	KE	KEN	404	Kenya 	Kenija	\N
00040000-56aa-3a51-cdef-fe42b74de68e	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56aa-3a51-bcf9-ecd74db1ce74	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56aa-3a51-ddac-ca9e9b1589d6	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56aa-3a51-a97a-bb09a5ef6a90	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56aa-3a51-c97a-063008bed24e	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56aa-3a51-88e1-198ad368a314	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56aa-3a51-e029-e92b48ebe1ee	LV	LVA	428	Latvia 	Latvija	\N
00040000-56aa-3a51-ccce-a1e15502da50	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56aa-3a51-7260-cc05e9bf984a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56aa-3a51-120a-3d0225f0d52a	LR	LBR	430	Liberia 	Liberija	\N
00040000-56aa-3a51-8dc3-dd7e2f7ec887	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56aa-3a51-21f6-d4910b3e3a3f	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56aa-3a51-e17c-d81926b93872	LT	LTU	440	Lithuania 	Litva	\N
00040000-56aa-3a51-84c3-9894cbd30af5	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56aa-3a51-326e-918df59cdf1f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56aa-3a51-1e5f-34d05b4a9088	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56aa-3a51-60c0-b71e879549b6	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56aa-3a51-63c5-467aa3f9ec16	MW	MWI	454	Malawi 	Malavi	\N
00040000-56aa-3a51-eed6-e3c487ad025c	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56aa-3a51-3809-dd69fb35af70	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56aa-3a51-af0d-2c6993c1095c	ML	MLI	466	Mali 	Mali	\N
00040000-56aa-3a51-4c92-c34f553f1049	MT	MLT	470	Malta 	Malta	\N
00040000-56aa-3a51-8f4c-8b8d5683c798	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56aa-3a51-67fb-a38b61d50662	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56aa-3a51-6d29-2ceb7bcc8638	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56aa-3a51-0882-49189a5e952d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56aa-3a51-6b72-625a782f9c68	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56aa-3a51-c31e-f53a14afdb21	MX	MEX	484	Mexico 	Mehika	\N
00040000-56aa-3a51-f3d4-47079ca7f8f3	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56aa-3a51-5ccd-bb87a8976c47	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56aa-3a51-b637-5743136c3a19	MC	MCO	492	Monaco 	Monako	\N
00040000-56aa-3a51-c33a-237e0f3c957f	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56aa-3a51-2b20-72bd84692172	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56aa-3a51-fd52-32a155ab27df	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56aa-3a51-2d30-3642327894af	MA	MAR	504	Morocco 	Maroko	\N
00040000-56aa-3a51-3448-150a10c32031	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56aa-3a51-136f-90fc39c74e40	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56aa-3a51-815c-155b48e90f9b	NA	NAM	516	Namibia 	Namibija	\N
00040000-56aa-3a51-f288-e57fc8cf95f4	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56aa-3a51-7adc-4c2363bbd6f4	NP	NPL	524	Nepal 	Nepal	\N
00040000-56aa-3a51-1de4-92ffd53d9cab	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56aa-3a51-fad6-2f52e8892796	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56aa-3a51-881b-962c73587ac0	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56aa-3a51-a57d-732c5f569298	NE	NER	562	Niger 	Niger 	\N
00040000-56aa-3a51-eafa-5c5162459497	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56aa-3a51-af27-c1089eac95e4	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56aa-3a51-d2f5-d26948aedbf6	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56aa-3a51-ee58-597efbf2c5d2	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56aa-3a51-0bf0-663986976b99	NO	NOR	578	Norway 	Norveška	\N
00040000-56aa-3a51-e0ef-966bcb37f903	OM	OMN	512	Oman 	Oman	\N
00040000-56aa-3a51-e9b8-6a4de5605fac	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56aa-3a51-0720-6bbe916db266	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56aa-3a51-bd51-659d32793596	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56aa-3a51-feb6-66d16501c880	PA	PAN	591	Panama 	Panama	\N
00040000-56aa-3a51-5982-92912307fa95	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56aa-3a51-33b8-67684b20c2ce	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56aa-3a51-fdc0-cac922790dd0	PE	PER	604	Peru 	Peru	\N
00040000-56aa-3a51-fbd2-a1bcdf96a7bb	PH	PHL	608	Philippines 	Filipini	\N
00040000-56aa-3a51-4de7-3287750a2541	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56aa-3a51-3978-e5001f861d39	PL	POL	616	Poland 	Poljska	\N
00040000-56aa-3a51-8f61-0de3a4d0d229	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56aa-3a51-902a-263ccf219f79	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56aa-3a51-fdb7-7e4d8edcaa9c	QA	QAT	634	Qatar 	Katar	\N
00040000-56aa-3a51-ca5c-f604bf9c018e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56aa-3a51-bbed-92f3d2db8d80	RO	ROU	642	Romania 	Romunija	\N
00040000-56aa-3a51-3841-9096420cc22c	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56aa-3a51-1b79-285d89b11791	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56aa-3a51-e706-1f1a5646e6e0	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56aa-3a51-b642-cdff6b9fbfda	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56aa-3a51-f70b-8b7d362c0429	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56aa-3a51-f2a8-7bbc2c3c7214	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56aa-3a51-944f-05b652d8bd8c	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56aa-3a51-6a28-a8e5e6fdcab5	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56aa-3a51-1f13-33152428093d	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56aa-3a51-56f9-abe23dbf246a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56aa-3a51-7994-2cd9be907cb6	SM	SMR	674	San Marino 	San Marino	\N
00040000-56aa-3a51-ad5e-276ae73ff4ad	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56aa-3a51-3665-3a3ae1b065c4	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56aa-3a51-6938-cc839b0376e9	SN	SEN	686	Senegal 	Senegal	\N
00040000-56aa-3a51-3dee-c21a551fbb51	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56aa-3a51-0a1b-3c1013301f7c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56aa-3a51-6abb-4ba45d19aec4	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56aa-3a51-6691-e6ee57daf350	SG	SGP	702	Singapore 	Singapur	\N
00040000-56aa-3a51-d8d3-d4989c689e34	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56aa-3a51-cc92-f7e81004d4ca	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56aa-3a51-5622-033d9d68b978	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56aa-3a51-ef71-d0a3195dd607	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56aa-3a51-1a1d-d3b16ad73a97	SO	SOM	706	Somalia 	Somalija	\N
00040000-56aa-3a51-fc0c-7ba6da1082cb	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56aa-3a51-9031-ec6fbb23b978	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56aa-3a51-0300-d86c7dd1a089	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56aa-3a51-1a27-a5cdc96ae58d	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56aa-3a51-375c-40cf7e086435	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56aa-3a51-6285-364adbe1958e	SD	SDN	729	Sudan 	Sudan	\N
00040000-56aa-3a51-a1bd-b36267171a9b	SR	SUR	740	Suriname 	Surinam	\N
00040000-56aa-3a51-4d4a-18a0c9ec8f91	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56aa-3a51-138d-b4650a941357	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56aa-3a51-b48e-37df8324a926	SE	SWE	752	Sweden 	Švedska	\N
00040000-56aa-3a51-54f4-ddf356060d42	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56aa-3a51-fc70-6e91731bc1f2	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56aa-3a51-3c85-33aa4f744f00	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56aa-3a51-3b69-ec2b349c10cd	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56aa-3a51-e49a-09eb0bcdd3ed	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56aa-3a51-3f20-d25e5dbd83a7	TH	THA	764	Thailand 	Tajska	\N
00040000-56aa-3a51-d671-6f5d6e81d743	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56aa-3a51-8140-320f9636098f	TG	TGO	768	Togo 	Togo	\N
00040000-56aa-3a51-3acb-fc16e65be928	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56aa-3a51-147f-76b2bd344c3c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56aa-3a51-f193-2099a39290e9	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56aa-3a51-fd47-20991c6f42df	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56aa-3a51-020d-f45beaccd00b	TR	TUR	792	Turkey 	Turčija	\N
00040000-56aa-3a51-eee0-6819c6d62d30	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56aa-3a51-3056-c86c6fd098b3	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56aa-3a51-ec8b-20dc408ef505	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56aa-3a51-ef4d-a2de19f5459c	UG	UGA	800	Uganda 	Uganda	\N
00040000-56aa-3a51-7b59-b35ae5cda5bd	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56aa-3a51-bcf9-555070ca92f7	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56aa-3a51-ed7f-95f7c3945e58	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56aa-3a51-b8bb-1ea7c2178943	US	USA	840	United States 	Združene države Amerike	\N
00040000-56aa-3a51-3df8-b1e5aadcf169	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56aa-3a51-9e90-275a96ee472d	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56aa-3a51-39be-d6d395023afe	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56aa-3a51-f35d-a9892168b550	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56aa-3a51-2b94-2599687a514e	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56aa-3a51-b791-e20607ead400	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56aa-3a51-ffeb-e3690ef281e8	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56aa-3a51-e47a-a21ba833f052	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56aa-3a51-630b-cb77e89dfd72	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56aa-3a51-0715-a7720318af00	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56aa-3a51-4043-5ba4404e3227	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56aa-3a51-652f-bb81e4493ddc	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56aa-3a51-2092-79e34b87cdbd	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 41515043)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56aa-3a54-eee3-deb6b4edd552	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56aa-3a54-a668-01c4021f39ad	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56aa-3a54-39e3-d411759a6dff	000e0000-56aa-3a54-503e-78cf94f81c2f	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56aa-3a50-2ea0-975e435e235e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56aa-3a54-9cfc-5051c3791f3b	000e0000-56aa-3a54-c020-82cc8ce74d27	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56aa-3a50-cbb2-7fc701c5034d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56aa-3a54-444e-a6769d19e9c3	000e0000-56aa-3a54-41ee-599ec51d4bff	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56aa-3a50-2ea0-975e435e235e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 41514849)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56aa-3a54-c5c2-7a1867ec9def	000e0000-56aa-3a54-c020-82cc8ce74d27	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56aa-3a50-a9a9-efbcb6e87e88
000d0000-56aa-3a54-0e79-9db7d600eb80	000e0000-56aa-3a54-bac7-de0f5e5c139f	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56aa-3a50-c40d-c881c54f7bdd
000d0000-56aa-3a54-d810-3709893ca04b	000e0000-56aa-3a54-bac7-de0f5e5c139f	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56aa-3a50-0d9b-33d89709663f
000d0000-56aa-3a54-3d9e-27765ae8a1c3	000e0000-56aa-3a54-c020-82cc8ce74d27	000c0000-56aa-3a54-0a62-f81a5d1a78d5	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56aa-3a50-c40d-c881c54f7bdd
000d0000-56aa-3a54-86ac-62ccf827e956	000e0000-56aa-3a54-c020-82cc8ce74d27	000c0000-56aa-3a54-460d-bd6f03009a75	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56aa-3a50-0d9b-33d89709663f
000d0000-56aa-3a54-81ac-47c852cd99c8	000e0000-56aa-3a54-c020-82cc8ce74d27	000c0000-56aa-3a54-ae1e-8ff62bbd94d7	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56aa-3a50-8aba-d304d9985b75
000d0000-56aa-3a54-5620-3a73a6ec0238	000e0000-56aa-3a54-c020-82cc8ce74d27	000c0000-56aa-3a54-c630-3ab51d2c1e11	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56aa-3a50-a9a9-efbcb6e87e88
000d0000-56aa-3a54-dff4-5ffe79bc5fd9	000e0000-56aa-3a54-c020-82cc8ce74d27	000c0000-56aa-3a54-f8d4-f1a235020988	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56aa-3a50-a9a9-efbcb6e87e88
000d0000-56aa-3a54-8bdf-2bc140c257e2	000e0000-56aa-3a54-c020-82cc8ce74d27	000c0000-56aa-3a54-3e9b-ee45310651cf	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56aa-3a50-c40d-c881c54f7bdd
000d0000-56aa-3a54-eafe-fe9ee484744f	000e0000-56aa-3a54-c020-82cc8ce74d27	000c0000-56aa-3a54-6671-2fde4a3f6fc9	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56aa-3a50-c40d-c881c54f7bdd
000d0000-56aa-3a54-5eeb-f88d7ceacd98	000e0000-56aa-3a54-c020-82cc8ce74d27	000c0000-56aa-3a54-cd3a-3c2a46393201	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56aa-3a50-b45b-db8a71094bd2
000d0000-56aa-3a54-3569-7b8103d4504d	000e0000-56aa-3a54-c020-82cc8ce74d27	000c0000-56aa-3a54-a9e7-b085fac73852	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56aa-3a50-dcd7-97aa03268081
000d0000-56aa-3a54-a327-7de26e14fc2a	000e0000-56aa-3a54-aa39-ad12c455770f	000c0000-56aa-3a54-1e7f-b3495bfabe41	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56aa-3a50-0d9b-33d89709663f
000d0000-56aa-3a54-ebb3-9e7c8cc6f2be	000e0000-56aa-3a54-7cb5-262d7b761e04	000c0000-56aa-3a54-8738-a6e9e3e64441	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56aa-3a50-0d9b-33d89709663f
000d0000-56aa-3a54-493d-5c3dfac4b2c6	000e0000-56aa-3a54-7cb5-262d7b761e04	000c0000-56aa-3a54-c663-6f5c459aeed7	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56aa-3a50-0d9b-33d89709663f
000d0000-56aa-3a54-c25c-45f0ef9f2075	000e0000-56aa-3a54-79eb-87c9fc373906	000c0000-56aa-3a54-b16d-3146b867595a	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56aa-3a50-0d9b-33d89709663f
000d0000-56aa-3a54-fd52-103b47a1f30b	000e0000-56aa-3a54-5cb8-415cd096ca62	000c0000-56aa-3a54-9d1b-4b5be3fdd09b	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56aa-3a50-0d9b-33d89709663f
000d0000-56aa-3a54-efa6-0ca5f4b8251b	000e0000-56aa-3a54-d73a-c8a6a720b754	000c0000-56aa-3a54-b36d-9f823c4210c6	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56aa-3a50-0d9b-33d89709663f
000d0000-56aa-3a54-367d-a948edb61160	000e0000-56aa-3a54-3042-4d8e37a62af5	000c0000-56aa-3a54-2cdc-1a270cc11c32	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56aa-3a50-0d9b-33d89709663f
000d0000-56aa-3a54-1f9c-1445082db8f1	000e0000-56aa-3a54-1b1e-36e570028d71	000c0000-56aa-3a54-308a-680c923800c9	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56aa-3a50-0d9b-33d89709663f
000d0000-56aa-3a54-0e40-351e1d7ed727	000e0000-56aa-3a54-cfbb-f70b227e3b9f	000c0000-56aa-3a54-45f6-3e0ddcbbc7f1	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56aa-3a50-0d9b-33d89709663f
000d0000-56aa-3a54-9ec1-9e451175a6c6	000e0000-56aa-3a54-cfbb-f70b227e3b9f	000c0000-56aa-3a54-05ec-89f456c9c4f8	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56aa-3a50-0d9b-33d89709663f
000d0000-56aa-3a54-0dc4-45c608a41507	000e0000-56aa-3a54-e49e-dc34d1080333	000c0000-56aa-3a54-381e-1b91d0e3415d	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56aa-3a50-0d9b-33d89709663f
000d0000-56aa-3a54-841b-583aa0edf381	000e0000-56aa-3a54-e49e-dc34d1080333	000c0000-56aa-3a54-7d95-198d04e36293	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56aa-3a50-0d9b-33d89709663f
\.


--
-- TOC entry 3162 (class 0 OID 41514626)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
001c0000-56aa-3a55-af36-0ee567176f3e	00040000-56aa-3a51-fc5f-731c0af458c8		\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 41514598)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 41514575)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56aa-3a54-5b5f-7eea20d68688	00080000-56aa-3a53-374d-9b77b08e0f61	00090000-56aa-3a54-b569-9d480d16ea3d	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 41514763)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 41515313)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56aa-3a54-7dcb-f573a60ff89e	00010000-56aa-3a52-e969-afaca0a5ff5c	\N	Prva mapa	Root mapa	2016-01-28 16:57:08	2016-01-28 16:57:08	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 41515326)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 41515348)
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
-- TOC entry 3180 (class 0 OID 41514787)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 41514532)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56aa-3a52-21b5-ec6d403bf075	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56aa-3a52-a8fe-0eba8815a5e6	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56aa-3a52-daa9-25bf4d9adf37	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56aa-3a52-ade2-4cd526fe2a66	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56aa-3a52-8a3a-4a6390de0d51	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56aa-3a52-bf63-3bf5454d0f7b	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56aa-3a52-c1b9-868d4e1c8eb4	dogodek.delte	array	a:14:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delGosZac";a:2:{s:5:"label";s:37:"Delta začetka pri dogodku gostovanje";s:5:"value";i:0;}s:9:"delGosKon";a:2:{s:5:"label";s:34:"Delta konca pri dogodku gostovanje";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56aa-3a52-de14-735d13c0328b	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56aa-3a52-122f-468f2aaa8f63	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56aa-3a52-3e55-0598198782d0	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56aa-3a52-9400-c54c8a1fdd8d	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56aa-3a52-6db1-fa771b63c517	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56aa-3a52-463e-68c03609f6ef	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56aa-3a52-3c94-35b06b7ff263	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56aa-3a52-5992-26033cf1bfb8	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56aa-3a52-5ddf-a0410f3148f6	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56aa-3a52-9788-da96e4f77b5d	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56aa-3a53-04a8-fb1370b4b6a4	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56aa-3a53-fd0d-5708626409e2	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56aa-3a53-fdd6-a4a4000b761d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56aa-3a53-4095-5b81033933e9	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56aa-3a53-7938-fe73a261046f	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56aa-3a56-7761-4c8c840a1078	application.tenant.maticnopodjetje	string	s:36:"00080000-56aa-3a56-83f4-97ad5f0c8e00";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 41514432)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56aa-3a53-00a5-041dba18f5e2	00000000-56aa-3a53-04a8-fb1370b4b6a4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56aa-3a53-0cfa-37973994eb6c	00000000-56aa-3a53-04a8-fb1370b4b6a4	00010000-56aa-3a52-e969-afaca0a5ff5c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56aa-3a53-71dd-0770c1153d3e	00000000-56aa-3a53-fd0d-5708626409e2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3151 (class 0 OID 41514499)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56aa-3a54-92e1-691482916fcc	\N	00100000-56aa-3a54-9011-81c96a73bcbc	00100000-56aa-3a54-1640-d91b349d1d94	01	Gledališče Nimbis
00410000-56aa-3a54-af2b-6dcba5cf5487	00410000-56aa-3a54-92e1-691482916fcc	00100000-56aa-3a54-9011-81c96a73bcbc	00100000-56aa-3a54-1640-d91b349d1d94	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 41514443)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56aa-3a54-4e56-966032f7d2cd	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56aa-3a54-0920-1f4c3b1ec01b	00010000-56aa-3a53-1198-4fa8ab9d7fd8	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56aa-3a54-914f-0fc4951c857a	00010000-56aa-3a53-025b-b841cc830058	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56aa-3a54-648b-9f52e756a44b	00010000-56aa-3a53-baff-43061027c005	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56aa-3a54-ca59-8e1b8838f088	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56aa-3a54-6c0e-cab3cfc309dc	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56aa-3a54-f876-8aa01d39eba5	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56aa-3a54-0331-104c8692de07	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56aa-3a54-b569-9d480d16ea3d	00010000-56aa-3a53-8b5c-a59daaf13c26	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56aa-3a54-7a86-8d7481598d7b	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56aa-3a54-ea77-fbf4ea8083ad	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56aa-3a54-8921-8839a5d1bba9	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56aa-3a54-f01d-eb49b79dcd9e	00010000-56aa-3a53-df25-18c9457ee67e	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56aa-3a54-e2c4-996471340fee	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56aa-3a54-c1e1-e16d7f0ad69a	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56aa-3a54-236d-7540f98dbd56	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56aa-3a54-5bfb-491dd4ab87e9	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56aa-3a54-8bcc-b10ed7ca64f8	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56aa-3a54-56cb-7d5ae54da5be	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56aa-3a54-a118-4e1ae8834953	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56aa-3a54-9415-6e1f8e470bde	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 41514377)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56aa-3a51-d879-f7385602f68f	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56aa-3a51-0435-9b43086af6ee	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56aa-3a51-7575-9c0ad47405ab	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56aa-3a51-2e29-1bcd2c7b1e30	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56aa-3a51-c12d-a1955cc4dc49	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56aa-3a51-7263-2a782898fd76	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56aa-3a51-1f6b-bece65e5cb5b	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56aa-3a51-69d9-49c20e588943	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56aa-3a51-571e-45a2ff9d1a49	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56aa-3a51-b6df-8c663b630abd	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56aa-3a51-0a01-e27c14365890	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56aa-3a51-5824-b55b04e2ae70	Abonma-read	Abonma - branje	t
00030000-56aa-3a51-1300-ffca2263b2bc	Abonma-write	Abonma - spreminjanje	t
00030000-56aa-3a51-3fb7-151f2ff8997d	Alternacija-read	Alternacija - branje	t
00030000-56aa-3a51-95f8-b5fb4aeb416a	Alternacija-write	Alternacija - spreminjanje	t
00030000-56aa-3a51-0f32-0cab0bbc9bd1	Arhivalija-read	Arhivalija - branje	t
00030000-56aa-3a51-4684-4bd0e4715732	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56aa-3a51-7bd1-dff286ea6ca8	AuthStorage-read	AuthStorage - branje	t
00030000-56aa-3a51-ac2f-f4655e8730f0	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56aa-3a51-3919-ce77a24b1a2f	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56aa-3a51-b522-b74f7662234a	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56aa-3a51-f8d9-df6701e15afc	Besedilo-read	Besedilo - branje	t
00030000-56aa-3a51-24d5-e56cc29da013	Besedilo-write	Besedilo - spreminjanje	t
00030000-56aa-3a51-d9e3-3dba87c6c489	Dodatek-read	Dodatek - branje	t
00030000-56aa-3a51-815c-0c992517a9b4	Dodatek-write	Dodatek - spreminjanje	t
00030000-56aa-3a51-b151-42015c602ab6	Dogodek-read	Dogodek - branje	t
00030000-56aa-3a51-5c36-c6a3a29ee4d9	Dogodek-write	Dogodek - spreminjanje	t
00030000-56aa-3a51-cf5a-6151a2615f95	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56aa-3a51-7249-653ebf01f1e0	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56aa-3a51-9901-6f851abf1110	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56aa-3a51-6e18-4720be4cedf7	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56aa-3a51-ce16-a3b14f176a7b	DogodekTrait-read	DogodekTrait - branje	t
00030000-56aa-3a51-943c-5a5b0b66b3fd	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56aa-3a51-30e4-e51d5e915627	DrugiVir-read	DrugiVir - branje	t
00030000-56aa-3a51-8fb5-7d9453ce61ab	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56aa-3a51-d9d1-158feacbfe13	Drzava-read	Drzava - branje	t
00030000-56aa-3a51-c313-3675039c4283	Drzava-write	Drzava - spreminjanje	t
00030000-56aa-3a51-e6a5-a658be77e642	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56aa-3a51-7f59-503efa2bc5fb	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56aa-3a51-5152-74ab0e963caf	Funkcija-read	Funkcija - branje	t
00030000-56aa-3a51-fc08-cca8df4254bf	Funkcija-write	Funkcija - spreminjanje	t
00030000-56aa-3a51-9c67-89ac8216f1af	Gostovanje-read	Gostovanje - branje	t
00030000-56aa-3a51-a5c2-daaebea8d15b	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56aa-3a51-7d20-1fea49cbcdb2	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56aa-3a51-a8c9-f7a374682ba0	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56aa-3a51-2658-625e42943907	Kupec-read	Kupec - branje	t
00030000-56aa-3a51-8356-8d9438ac37bf	Kupec-write	Kupec - spreminjanje	t
00030000-56aa-3a51-857e-d8b7f7b79fcb	NacinPlacina-read	NacinPlacina - branje	t
00030000-56aa-3a51-6ec2-b13313410e97	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56aa-3a51-c0f2-e7c925fdd644	Option-read	Option - branje	t
00030000-56aa-3a51-8dac-88c70ae705aa	Option-write	Option - spreminjanje	t
00030000-56aa-3a51-caa8-88cc74eb35ed	OptionValue-read	OptionValue - branje	t
00030000-56aa-3a51-c49c-03bd5f9bbcff	OptionValue-write	OptionValue - spreminjanje	t
00030000-56aa-3a51-9b48-9dc0d2a0d736	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56aa-3a51-8a86-461736febae9	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56aa-3a51-bfeb-5cbc4277ecd6	Oseba-read	Oseba - branje	t
00030000-56aa-3a51-a892-cc35f4539c60	Oseba-write	Oseba - spreminjanje	t
00030000-56aa-3a51-99aa-3042e4f3df96	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56aa-3a51-1f47-1d6cd276d625	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56aa-3a51-9163-81cfcb999e3d	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56aa-3a51-f9f7-2d95cb0a7fec	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56aa-3a51-4fef-c7d92ef9d289	Pogodba-read	Pogodba - branje	t
00030000-56aa-3a51-0c0b-7adacd3da66d	Pogodba-write	Pogodba - spreminjanje	t
00030000-56aa-3a51-a716-fa585e7b6bd2	Popa-read	Popa - branje	t
00030000-56aa-3a51-c76f-ddd1399e3913	Popa-write	Popa - spreminjanje	t
00030000-56aa-3a51-5dc9-008c6e03a4a9	Posta-read	Posta - branje	t
00030000-56aa-3a51-7eb5-3a71f8a30676	Posta-write	Posta - spreminjanje	t
00030000-56aa-3a51-5d51-f266ca54eef5	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56aa-3a51-3e49-c8204143fdde	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56aa-3a51-6eca-fcadb1897795	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56aa-3a51-e2cb-080e7d1ca371	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56aa-3a51-52af-46c87756ea69	PostniNaslov-read	PostniNaslov - branje	t
00030000-56aa-3a51-9a12-ae3d88877230	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56aa-3a51-e9c3-af0da0df0509	Praznik-read	Praznik - branje	t
00030000-56aa-3a51-2770-299848f8f37d	Praznik-write	Praznik - spreminjanje	t
00030000-56aa-3a51-7c74-794d18cbf1ec	Predstava-read	Predstava - branje	t
00030000-56aa-3a51-fe9f-524ee9ee4cfb	Predstava-write	Predstava - spreminjanje	t
00030000-56aa-3a51-a7b0-2579a68d3aeb	Ura-read	Ura - branje	t
00030000-56aa-3a51-e1d7-22c115a8949a	Ura-write	Ura - spreminjanje	t
00030000-56aa-3a51-9159-bae3cb6275ae	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56aa-3a51-c3cf-2246792b790a	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56aa-3a51-44fb-d9b151e0fea2	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56aa-3a51-6247-b66a24f1090b	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56aa-3a51-ae1d-8085a3cbd543	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56aa-3a51-fcb2-d3131de59db8	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56aa-3a51-14eb-5bee8d5db0bb	ProgramDela-read	ProgramDela - branje	t
00030000-56aa-3a51-7971-b3be7ebfdc29	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56aa-3a51-0626-f3340d6a4987	ProgramFestival-read	ProgramFestival - branje	t
00030000-56aa-3a51-2cfc-1b0a6e6d6762	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56aa-3a51-ad58-366138c52816	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56aa-3a51-e0a9-16a37767e2fb	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56aa-3a51-fa46-6cba84354aa0	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56aa-3a51-9498-ab5874f6e4c1	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56aa-3a51-e7b2-aac85b60ce8b	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56aa-3a51-dab7-f69d733a49e9	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56aa-3a51-413c-89bd13ecb7cd	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56aa-3a51-89d7-50af4f214fe9	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56aa-3a51-e102-d3efba6a68d3	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56aa-3a51-51f8-3cc80311ae8e	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56aa-3a51-9eeb-0fb92740778f	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56aa-3a51-3d9d-cc30f08b1b7d	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56aa-3a51-bb21-fdf52ee935c9	ProgramRazno-read	ProgramRazno - branje	t
00030000-56aa-3a51-2152-5cbc9577c37e	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56aa-3a51-3c74-1f9beda18736	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56aa-3a51-78e4-639fd7ce56ab	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56aa-3a51-b9c7-57262febf4ce	Prostor-read	Prostor - branje	t
00030000-56aa-3a51-c7aa-5758d8b39fac	Prostor-write	Prostor - spreminjanje	t
00030000-56aa-3a51-60d1-2aa34e856d66	Racun-read	Racun - branje	t
00030000-56aa-3a51-6227-58e922dee611	Racun-write	Racun - spreminjanje	t
00030000-56aa-3a51-0eb9-93f555a03436	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56aa-3a51-9581-979af910c7c5	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56aa-3a51-862d-336431529b37	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56aa-3a51-b3e1-f2f86c60599f	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56aa-3a51-0565-ef3b2aacea19	Rekvizit-read	Rekvizit - branje	t
00030000-56aa-3a51-cdad-434480190177	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56aa-3a51-9da1-791971e0ca78	Revizija-read	Revizija - branje	t
00030000-56aa-3a51-b830-8046947b35cd	Revizija-write	Revizija - spreminjanje	t
00030000-56aa-3a51-c423-322da4b6d1b0	Rezervacija-read	Rezervacija - branje	t
00030000-56aa-3a51-905c-0b1f29b4e2d3	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56aa-3a51-68ea-f718da9f07bc	SedezniRed-read	SedezniRed - branje	t
00030000-56aa-3a51-81eb-bae5a645ddb6	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56aa-3a51-ed7e-ee6a6702794f	Sedez-read	Sedez - branje	t
00030000-56aa-3a51-abf5-e4ace36a2992	Sedez-write	Sedez - spreminjanje	t
00030000-56aa-3a51-1f63-bec1a8bf96ad	Sezona-read	Sezona - branje	t
00030000-56aa-3a51-054d-8e9b858e203a	Sezona-write	Sezona - spreminjanje	t
00030000-56aa-3a51-5b9b-fa4a96ca5697	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56aa-3a51-cfa1-a01d0d52a65e	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56aa-3a51-fbf4-22cbf0662464	Telefonska-read	Telefonska - branje	t
00030000-56aa-3a51-bf4d-a18639e3aba3	Telefonska-write	Telefonska - spreminjanje	t
00030000-56aa-3a51-ade0-764c634c5c50	TerminStoritve-read	TerminStoritve - branje	t
00030000-56aa-3a51-3e58-ca390fd52d98	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56aa-3a51-0ff2-f6df3fb6c71b	TipDodatka-read	TipDodatka - branje	t
00030000-56aa-3a51-d915-058c4ff1eedd	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56aa-3a51-fa63-a727259e15f0	TipFunkcije-read	TipFunkcije - branje	t
00030000-56aa-3a51-3dfd-ad5a5fed58cb	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56aa-3a51-f592-7bd2eefe5efd	TipPopa-read	TipPopa - branje	t
00030000-56aa-3a51-d826-52fe8479d6ea	TipPopa-write	TipPopa - spreminjanje	t
00030000-56aa-3a51-b728-9f9d132e4ad4	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56aa-3a51-c818-154b1fcdee4a	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56aa-3a51-e0de-8f0e2ae42eb7	TipVaje-read	TipVaje - branje	t
00030000-56aa-3a51-7fca-bdbd651e7830	TipVaje-write	TipVaje - spreminjanje	t
00030000-56aa-3a51-905a-8f7a93ad0e56	Trr-read	Trr - branje	t
00030000-56aa-3a51-bf27-8b6d03a34a58	Trr-write	Trr - spreminjanje	t
00030000-56aa-3a51-ea06-20076e6977d7	Uprizoritev-read	Uprizoritev - branje	t
00030000-56aa-3a51-b665-3c9cdc52cb23	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56aa-3a51-8a02-2ee1916a565d	Vaja-read	Vaja - branje	t
00030000-56aa-3a51-7fac-b0d5f9219635	Vaja-write	Vaja - spreminjanje	t
00030000-56aa-3a51-1276-db564bed061b	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56aa-3a51-45a5-bb20ff9fea0a	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56aa-3a51-04ab-5d87442d5cb4	VrstaStroska-read	VrstaStroska - branje	t
00030000-56aa-3a51-6a84-c83d076e6de7	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56aa-3a51-0963-ceb38f90ca31	Zaposlitev-read	Zaposlitev - branje	t
00030000-56aa-3a51-37d5-3f065edf4ae3	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56aa-3a51-1c3b-a0c50a61187d	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56aa-3a51-ceda-ff8e332a335b	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56aa-3a51-cfa6-634aa922780d	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56aa-3a51-ac69-0d872ac9d6c4	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56aa-3a51-9fa3-f54d654fd895	Job-read	Branje opravil - samo zase - branje	t
00030000-56aa-3a51-a856-838c2eb56c63	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56aa-3a51-0324-5db3c5846088	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56aa-3a51-21ee-eee3f2c630bd	Report-read	Report - branje	t
00030000-56aa-3a51-e54d-8f536112c2d0	Report-write	Report - spreminjanje	t
00030000-56aa-3a51-4ff6-34d44d7458ab	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56aa-3a51-1a75-fffd31b46a3b	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56aa-3a51-6149-1bdab69457c7	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56aa-3a51-e354-aacf42605a59	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56aa-3a51-fa63-5195dbf87eb8	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56aa-3a51-5849-be7fbb3edd90	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56aa-3a51-55e1-7b34d708a6a7	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56aa-3a51-088b-2860892a2402	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56aa-3a51-8619-5b31ab499f82	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56aa-3a51-3390-0f76891850df	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56aa-3a51-eaa5-c7f322bb18e7	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56aa-3a51-462b-4f008ff1d420	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56aa-3a51-6c22-584b6759b005	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56aa-3a51-f663-c7e64dc57e1e	Datoteka-write	Datoteka - spreminjanje	t
00030000-56aa-3a51-05c2-fa0c0a7d97cd	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 41514396)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56aa-3a51-1269-10ae3f750eb7	00030000-56aa-3a51-0435-9b43086af6ee
00020000-56aa-3a51-1269-10ae3f750eb7	00030000-56aa-3a51-d879-f7385602f68f
00020000-56aa-3a51-2e21-4f6d0025baaf	00030000-56aa-3a51-d9d1-158feacbfe13
00020000-56aa-3a51-f692-0846eca58cb4	00030000-56aa-3a51-b522-b74f7662234a
00020000-56aa-3a51-f692-0846eca58cb4	00030000-56aa-3a51-24d5-e56cc29da013
00020000-56aa-3a51-f692-0846eca58cb4	00030000-56aa-3a51-f663-c7e64dc57e1e
00020000-56aa-3a51-f692-0846eca58cb4	00030000-56aa-3a51-a892-cc35f4539c60
00020000-56aa-3a51-f692-0846eca58cb4	00030000-56aa-3a51-088b-2860892a2402
00020000-56aa-3a51-f692-0846eca58cb4	00030000-56aa-3a51-3390-0f76891850df
00020000-56aa-3a51-f692-0846eca58cb4	00030000-56aa-3a51-3919-ce77a24b1a2f
00020000-56aa-3a51-f692-0846eca58cb4	00030000-56aa-3a51-f8d9-df6701e15afc
00020000-56aa-3a51-f692-0846eca58cb4	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a51-f692-0846eca58cb4	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-f692-0846eca58cb4	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-f692-0846eca58cb4	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a51-974c-bde96b5d1a64	00030000-56aa-3a51-3919-ce77a24b1a2f
00020000-56aa-3a51-974c-bde96b5d1a64	00030000-56aa-3a51-f8d9-df6701e15afc
00020000-56aa-3a51-974c-bde96b5d1a64	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a51-974c-bde96b5d1a64	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-974c-bde96b5d1a64	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a51-974c-bde96b5d1a64	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-4b27-97e303bbef99	00030000-56aa-3a51-0963-ceb38f90ca31
00020000-56aa-3a51-4b27-97e303bbef99	00030000-56aa-3a51-37d5-3f065edf4ae3
00020000-56aa-3a51-4b27-97e303bbef99	00030000-56aa-3a51-7263-2a782898fd76
00020000-56aa-3a51-4b27-97e303bbef99	00030000-56aa-3a51-c12d-a1955cc4dc49
00020000-56aa-3a51-4b27-97e303bbef99	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-4b27-97e303bbef99	00030000-56aa-3a51-a892-cc35f4539c60
00020000-56aa-3a51-4b27-97e303bbef99	00030000-56aa-3a51-9b48-9dc0d2a0d736
00020000-56aa-3a51-60cd-884304943597	00030000-56aa-3a51-0963-ceb38f90ca31
00020000-56aa-3a51-60cd-884304943597	00030000-56aa-3a51-7263-2a782898fd76
00020000-56aa-3a51-60cd-884304943597	00030000-56aa-3a51-9b48-9dc0d2a0d736
00020000-56aa-3a51-c992-392151ec5686	00030000-56aa-3a51-a892-cc35f4539c60
00020000-56aa-3a51-c992-392151ec5686	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-c992-392151ec5686	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a51-c992-392151ec5686	00030000-56aa-3a51-f663-c7e64dc57e1e
00020000-56aa-3a51-c992-392151ec5686	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a51-c992-392151ec5686	00030000-56aa-3a51-3390-0f76891850df
00020000-56aa-3a51-c992-392151ec5686	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-c992-392151ec5686	00030000-56aa-3a51-088b-2860892a2402
00020000-56aa-3a51-4885-841aa21585e6	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-4885-841aa21585e6	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a51-4885-841aa21585e6	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a51-4885-841aa21585e6	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-79c6-6cdaeffb8a4b	00030000-56aa-3a51-a892-cc35f4539c60
00020000-56aa-3a51-79c6-6cdaeffb8a4b	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-79c6-6cdaeffb8a4b	00030000-56aa-3a51-7263-2a782898fd76
00020000-56aa-3a51-79c6-6cdaeffb8a4b	00030000-56aa-3a51-c12d-a1955cc4dc49
00020000-56aa-3a51-79c6-6cdaeffb8a4b	00030000-56aa-3a51-905a-8f7a93ad0e56
00020000-56aa-3a51-79c6-6cdaeffb8a4b	00030000-56aa-3a51-bf27-8b6d03a34a58
00020000-56aa-3a51-79c6-6cdaeffb8a4b	00030000-56aa-3a51-52af-46c87756ea69
00020000-56aa-3a51-79c6-6cdaeffb8a4b	00030000-56aa-3a51-9a12-ae3d88877230
00020000-56aa-3a51-79c6-6cdaeffb8a4b	00030000-56aa-3a51-fbf4-22cbf0662464
00020000-56aa-3a51-79c6-6cdaeffb8a4b	00030000-56aa-3a51-bf4d-a18639e3aba3
00020000-56aa-3a51-79c6-6cdaeffb8a4b	00030000-56aa-3a51-d9d1-158feacbfe13
00020000-56aa-3a51-79c6-6cdaeffb8a4b	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-b7ef-638855c02312	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-b7ef-638855c02312	00030000-56aa-3a51-7263-2a782898fd76
00020000-56aa-3a51-b7ef-638855c02312	00030000-56aa-3a51-905a-8f7a93ad0e56
00020000-56aa-3a51-b7ef-638855c02312	00030000-56aa-3a51-52af-46c87756ea69
00020000-56aa-3a51-b7ef-638855c02312	00030000-56aa-3a51-fbf4-22cbf0662464
00020000-56aa-3a51-b7ef-638855c02312	00030000-56aa-3a51-d9d1-158feacbfe13
00020000-56aa-3a51-b7ef-638855c02312	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-fbf4-22cbf0662464
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-52af-46c87756ea69
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-905a-8f7a93ad0e56
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-a716-fa585e7b6bd2
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-7d20-1fea49cbcdb2
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-ae1d-8085a3cbd543
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-bf4d-a18639e3aba3
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-9a12-ae3d88877230
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-088b-2860892a2402
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-bf27-8b6d03a34a58
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-c76f-ddd1399e3913
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-f663-c7e64dc57e1e
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-3390-0f76891850df
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-a8c9-f7a374682ba0
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-fcb2-d3131de59db8
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-d9d1-158feacbfe13
00020000-56aa-3a51-beaa-a50df75e57d9	00030000-56aa-3a51-f592-7bd2eefe5efd
00020000-56aa-3a51-6b54-55c23d362740	00030000-56aa-3a51-fbf4-22cbf0662464
00020000-56aa-3a51-6b54-55c23d362740	00030000-56aa-3a51-52af-46c87756ea69
00020000-56aa-3a51-6b54-55c23d362740	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-6b54-55c23d362740	00030000-56aa-3a51-905a-8f7a93ad0e56
00020000-56aa-3a51-6b54-55c23d362740	00030000-56aa-3a51-a716-fa585e7b6bd2
00020000-56aa-3a51-6b54-55c23d362740	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a51-6b54-55c23d362740	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a51-6b54-55c23d362740	00030000-56aa-3a51-7d20-1fea49cbcdb2
00020000-56aa-3a51-6b54-55c23d362740	00030000-56aa-3a51-ae1d-8085a3cbd543
00020000-56aa-3a51-6b54-55c23d362740	00030000-56aa-3a51-d9d1-158feacbfe13
00020000-56aa-3a51-6b54-55c23d362740	00030000-56aa-3a51-f592-7bd2eefe5efd
00020000-56aa-3a51-ad7e-53b95db1cde5	00030000-56aa-3a51-f592-7bd2eefe5efd
00020000-56aa-3a51-ad7e-53b95db1cde5	00030000-56aa-3a51-d826-52fe8479d6ea
00020000-56aa-3a51-9f63-dd21378056bb	00030000-56aa-3a51-f592-7bd2eefe5efd
00020000-56aa-3a51-eda4-b18099a82287	00030000-56aa-3a51-5dc9-008c6e03a4a9
00020000-56aa-3a51-eda4-b18099a82287	00030000-56aa-3a51-7eb5-3a71f8a30676
00020000-56aa-3a51-5a48-71d062f5bd6b	00030000-56aa-3a51-5dc9-008c6e03a4a9
00020000-56aa-3a51-027f-5e09262bde0f	00030000-56aa-3a51-d9d1-158feacbfe13
00020000-56aa-3a51-027f-5e09262bde0f	00030000-56aa-3a51-c313-3675039c4283
00020000-56aa-3a51-5410-365a75b02674	00030000-56aa-3a51-d9d1-158feacbfe13
00020000-56aa-3a51-19ef-98ad34427ab5	00030000-56aa-3a51-cfa6-634aa922780d
00020000-56aa-3a51-19ef-98ad34427ab5	00030000-56aa-3a51-ac69-0d872ac9d6c4
00020000-56aa-3a51-8d3b-7382d59c0249	00030000-56aa-3a51-cfa6-634aa922780d
00020000-56aa-3a51-d6b7-07f02d6deb1a	00030000-56aa-3a51-1c3b-a0c50a61187d
00020000-56aa-3a51-d6b7-07f02d6deb1a	00030000-56aa-3a51-ceda-ff8e332a335b
00020000-56aa-3a51-1707-aba0c0a08a79	00030000-56aa-3a51-1c3b-a0c50a61187d
00020000-56aa-3a51-9f15-ad43c80d50a9	00030000-56aa-3a51-5824-b55b04e2ae70
00020000-56aa-3a51-9f15-ad43c80d50a9	00030000-56aa-3a51-1300-ffca2263b2bc
00020000-56aa-3a51-5e88-27f94a2ebc78	00030000-56aa-3a51-5824-b55b04e2ae70
00020000-56aa-3a51-4d98-6661d71ca339	00030000-56aa-3a51-b9c7-57262febf4ce
00020000-56aa-3a51-4d98-6661d71ca339	00030000-56aa-3a51-c7aa-5758d8b39fac
00020000-56aa-3a51-4d98-6661d71ca339	00030000-56aa-3a51-a716-fa585e7b6bd2
00020000-56aa-3a51-4d98-6661d71ca339	00030000-56aa-3a51-52af-46c87756ea69
00020000-56aa-3a51-4d98-6661d71ca339	00030000-56aa-3a51-9a12-ae3d88877230
00020000-56aa-3a51-4d98-6661d71ca339	00030000-56aa-3a51-d9d1-158feacbfe13
00020000-56aa-3a51-cc5a-eab8fe39707f	00030000-56aa-3a51-b9c7-57262febf4ce
00020000-56aa-3a51-cc5a-eab8fe39707f	00030000-56aa-3a51-a716-fa585e7b6bd2
00020000-56aa-3a51-cc5a-eab8fe39707f	00030000-56aa-3a51-52af-46c87756ea69
00020000-56aa-3a51-2ea8-609bb815bf04	00030000-56aa-3a51-04ab-5d87442d5cb4
00020000-56aa-3a51-2ea8-609bb815bf04	00030000-56aa-3a51-6a84-c83d076e6de7
00020000-56aa-3a51-91ad-423a668ef949	00030000-56aa-3a51-04ab-5d87442d5cb4
00020000-56aa-3a51-f081-0aa22ac72822	00030000-56aa-3a51-8a86-461736febae9
00020000-56aa-3a51-f081-0aa22ac72822	00030000-56aa-3a51-9b48-9dc0d2a0d736
00020000-56aa-3a51-f081-0aa22ac72822	00030000-56aa-3a51-0963-ceb38f90ca31
00020000-56aa-3a51-f081-0aa22ac72822	00030000-56aa-3a51-f663-c7e64dc57e1e
00020000-56aa-3a51-f081-0aa22ac72822	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a51-f081-0aa22ac72822	00030000-56aa-3a51-088b-2860892a2402
00020000-56aa-3a51-f081-0aa22ac72822	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-f081-0aa22ac72822	00030000-56aa-3a51-3390-0f76891850df
00020000-56aa-3a51-f081-0aa22ac72822	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a51-d884-aa4bcad03f5c	00030000-56aa-3a51-9b48-9dc0d2a0d736
00020000-56aa-3a51-d884-aa4bcad03f5c	00030000-56aa-3a51-0963-ceb38f90ca31
00020000-56aa-3a51-d884-aa4bcad03f5c	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a51-d884-aa4bcad03f5c	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-d884-aa4bcad03f5c	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a51-4ed9-176b87366554	00030000-56aa-3a51-e0de-8f0e2ae42eb7
00020000-56aa-3a51-4ed9-176b87366554	00030000-56aa-3a51-7fca-bdbd651e7830
00020000-56aa-3a51-3b75-8db503a64d64	00030000-56aa-3a51-e0de-8f0e2ae42eb7
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-1f6b-bece65e5cb5b
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-69d9-49c20e588943
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-14eb-5bee8d5db0bb
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-7971-b3be7ebfdc29
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-0626-f3340d6a4987
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-2cfc-1b0a6e6d6762
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-ad58-366138c52816
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-e0a9-16a37767e2fb
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-fa46-6cba84354aa0
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-9498-ab5874f6e4c1
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-e7b2-aac85b60ce8b
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-dab7-f69d733a49e9
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-413c-89bd13ecb7cd
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-89d7-50af4f214fe9
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-e102-d3efba6a68d3
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-51f8-3cc80311ae8e
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-9eeb-0fb92740778f
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-3d9d-cc30f08b1b7d
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-bb21-fdf52ee935c9
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-2152-5cbc9577c37e
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-3c74-1f9beda18736
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-78e4-639fd7ce56ab
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-6247-b66a24f1090b
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-8fb5-7d9453ce61ab
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-3e49-c8204143fdde
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-a856-838c2eb56c63
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-30e4-e51d5e915627
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-44fb-d9b151e0fea2
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-ae1d-8085a3cbd543
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-5d51-f266ca54eef5
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-04ab-5d87442d5cb4
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-ea06-20076e6977d7
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-5b9b-fa4a96ca5697
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-5152-74ab0e963caf
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-3fb7-151f2ff8997d
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-fa63-a727259e15f0
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-4fef-c7d92ef9d289
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-d9d1-158feacbfe13
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-a716-fa585e7b6bd2
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-f663-c7e64dc57e1e
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-088b-2860892a2402
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-3390-0f76891850df
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-9fa3-f54d654fd895
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-c13e-c7a52955f21a	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a51-c27d-e93439f33ec4	00030000-56aa-3a51-14eb-5bee8d5db0bb
00020000-56aa-3a51-c27d-e93439f33ec4	00030000-56aa-3a51-0626-f3340d6a4987
00020000-56aa-3a51-c27d-e93439f33ec4	00030000-56aa-3a51-ad58-366138c52816
00020000-56aa-3a51-c27d-e93439f33ec4	00030000-56aa-3a51-fa46-6cba84354aa0
00020000-56aa-3a51-c27d-e93439f33ec4	00030000-56aa-3a51-e7b2-aac85b60ce8b
00020000-56aa-3a51-c27d-e93439f33ec4	00030000-56aa-3a51-413c-89bd13ecb7cd
00020000-56aa-3a51-c27d-e93439f33ec4	00030000-56aa-3a51-e102-d3efba6a68d3
00020000-56aa-3a51-c27d-e93439f33ec4	00030000-56aa-3a51-9eeb-0fb92740778f
00020000-56aa-3a51-c27d-e93439f33ec4	00030000-56aa-3a51-bb21-fdf52ee935c9
00020000-56aa-3a51-c27d-e93439f33ec4	00030000-56aa-3a51-3c74-1f9beda18736
00020000-56aa-3a51-c27d-e93439f33ec4	00030000-56aa-3a51-44fb-d9b151e0fea2
00020000-56aa-3a51-c27d-e93439f33ec4	00030000-56aa-3a51-30e4-e51d5e915627
00020000-56aa-3a51-c27d-e93439f33ec4	00030000-56aa-3a51-5d51-f266ca54eef5
00020000-56aa-3a51-c27d-e93439f33ec4	00030000-56aa-3a51-d9d1-158feacbfe13
00020000-56aa-3a51-c27d-e93439f33ec4	00030000-56aa-3a51-9fa3-f54d654fd895
00020000-56aa-3a51-c27d-e93439f33ec4	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a51-c27d-e93439f33ec4	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-c27d-e93439f33ec4	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a51-323f-db41a9a721f0	00030000-56aa-3a51-ea06-20076e6977d7
00020000-56aa-3a51-323f-db41a9a721f0	00030000-56aa-3a51-b665-3c9cdc52cb23
00020000-56aa-3a51-323f-db41a9a721f0	00030000-56aa-3a51-3fb7-151f2ff8997d
00020000-56aa-3a51-323f-db41a9a721f0	00030000-56aa-3a51-95f8-b5fb4aeb416a
00020000-56aa-3a51-323f-db41a9a721f0	00030000-56aa-3a51-571e-45a2ff9d1a49
00020000-56aa-3a51-323f-db41a9a721f0	00030000-56aa-3a51-f8d9-df6701e15afc
00020000-56aa-3a51-323f-db41a9a721f0	00030000-56aa-3a51-5152-74ab0e963caf
00020000-56aa-3a51-323f-db41a9a721f0	00030000-56aa-3a51-fc08-cca8df4254bf
00020000-56aa-3a51-323f-db41a9a721f0	00030000-56aa-3a51-b6df-8c663b630abd
00020000-56aa-3a51-323f-db41a9a721f0	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-323f-db41a9a721f0	00030000-56aa-3a51-ae1d-8085a3cbd543
00020000-56aa-3a51-323f-db41a9a721f0	00030000-56aa-3a51-fa63-a727259e15f0
00020000-56aa-3a51-323f-db41a9a721f0	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a51-323f-db41a9a721f0	00030000-56aa-3a51-f663-c7e64dc57e1e
00020000-56aa-3a51-323f-db41a9a721f0	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-323f-db41a9a721f0	00030000-56aa-3a51-088b-2860892a2402
00020000-56aa-3a51-323f-db41a9a721f0	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a51-323f-db41a9a721f0	00030000-56aa-3a51-3390-0f76891850df
00020000-56aa-3a51-90bf-622440c8511c	00030000-56aa-3a51-ea06-20076e6977d7
00020000-56aa-3a51-90bf-622440c8511c	00030000-56aa-3a51-3fb7-151f2ff8997d
00020000-56aa-3a51-90bf-622440c8511c	00030000-56aa-3a51-f8d9-df6701e15afc
00020000-56aa-3a51-90bf-622440c8511c	00030000-56aa-3a51-5152-74ab0e963caf
00020000-56aa-3a51-90bf-622440c8511c	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-90bf-622440c8511c	00030000-56aa-3a51-ae1d-8085a3cbd543
00020000-56aa-3a51-90bf-622440c8511c	00030000-56aa-3a51-fa63-a727259e15f0
00020000-56aa-3a51-90bf-622440c8511c	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a51-90bf-622440c8511c	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-90bf-622440c8511c	00030000-56aa-3a51-088b-2860892a2402
00020000-56aa-3a51-90bf-622440c8511c	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a51-1aca-baf2708a6552	00030000-56aa-3a51-3fb7-151f2ff8997d
00020000-56aa-3a51-1aca-baf2708a6552	00030000-56aa-3a51-95f8-b5fb4aeb416a
00020000-56aa-3a51-1aca-baf2708a6552	00030000-56aa-3a51-5152-74ab0e963caf
00020000-56aa-3a51-1aca-baf2708a6552	00030000-56aa-3a51-fc08-cca8df4254bf
00020000-56aa-3a51-1aca-baf2708a6552	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-1aca-baf2708a6552	00030000-56aa-3a51-fa63-a727259e15f0
00020000-56aa-3a51-1aca-baf2708a6552	00030000-56aa-3a51-ea06-20076e6977d7
00020000-56aa-3a51-1aca-baf2708a6552	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-0fc2-a8851a24c69e	00030000-56aa-3a51-3fb7-151f2ff8997d
00020000-56aa-3a51-0fc2-a8851a24c69e	00030000-56aa-3a51-95f8-b5fb4aeb416a
00020000-56aa-3a51-0fc2-a8851a24c69e	00030000-56aa-3a51-571e-45a2ff9d1a49
00020000-56aa-3a51-0fc2-a8851a24c69e	00030000-56aa-3a51-5152-74ab0e963caf
00020000-56aa-3a51-0fc2-a8851a24c69e	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-0fc2-a8851a24c69e	00030000-56aa-3a51-7263-2a782898fd76
00020000-56aa-3a51-0fc2-a8851a24c69e	00030000-56aa-3a51-c12d-a1955cc4dc49
00020000-56aa-3a51-0fc2-a8851a24c69e	00030000-56aa-3a51-4fef-c7d92ef9d289
00020000-56aa-3a51-0fc2-a8851a24c69e	00030000-56aa-3a51-0c0b-7adacd3da66d
00020000-56aa-3a51-0fc2-a8851a24c69e	00030000-56aa-3a51-a716-fa585e7b6bd2
00020000-56aa-3a51-0fc2-a8851a24c69e	00030000-56aa-3a51-ae1d-8085a3cbd543
00020000-56aa-3a51-0fc2-a8851a24c69e	00030000-56aa-3a51-5b9b-fa4a96ca5697
00020000-56aa-3a51-0fc2-a8851a24c69e	00030000-56aa-3a51-cfa1-a01d0d52a65e
00020000-56aa-3a51-0fc2-a8851a24c69e	00030000-56aa-3a51-fa63-a727259e15f0
00020000-56aa-3a51-0fc2-a8851a24c69e	00030000-56aa-3a51-905a-8f7a93ad0e56
00020000-56aa-3a51-0fc2-a8851a24c69e	00030000-56aa-3a51-ea06-20076e6977d7
00020000-56aa-3a51-0fc2-a8851a24c69e	00030000-56aa-3a51-0963-ceb38f90ca31
00020000-56aa-3a51-b2c4-7528278781bf	00030000-56aa-3a51-3fb7-151f2ff8997d
00020000-56aa-3a51-b2c4-7528278781bf	00030000-56aa-3a51-5152-74ab0e963caf
00020000-56aa-3a51-b2c4-7528278781bf	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-b2c4-7528278781bf	00030000-56aa-3a51-7263-2a782898fd76
00020000-56aa-3a51-b2c4-7528278781bf	00030000-56aa-3a51-4fef-c7d92ef9d289
00020000-56aa-3a51-b2c4-7528278781bf	00030000-56aa-3a51-a716-fa585e7b6bd2
00020000-56aa-3a51-b2c4-7528278781bf	00030000-56aa-3a51-ae1d-8085a3cbd543
00020000-56aa-3a51-b2c4-7528278781bf	00030000-56aa-3a51-5b9b-fa4a96ca5697
00020000-56aa-3a51-b2c4-7528278781bf	00030000-56aa-3a51-fa63-a727259e15f0
00020000-56aa-3a51-b2c4-7528278781bf	00030000-56aa-3a51-905a-8f7a93ad0e56
00020000-56aa-3a51-b2c4-7528278781bf	00030000-56aa-3a51-ea06-20076e6977d7
00020000-56aa-3a51-b2c4-7528278781bf	00030000-56aa-3a51-0963-ceb38f90ca31
00020000-56aa-3a51-ea68-55b62394f276	00030000-56aa-3a51-5b9b-fa4a96ca5697
00020000-56aa-3a51-ea68-55b62394f276	00030000-56aa-3a51-ea06-20076e6977d7
00020000-56aa-3a51-ea68-55b62394f276	00030000-56aa-3a51-5152-74ab0e963caf
00020000-56aa-3a51-ea68-55b62394f276	00030000-56aa-3a51-4fef-c7d92ef9d289
00020000-56aa-3a51-ea68-55b62394f276	00030000-56aa-3a51-ae1d-8085a3cbd543
00020000-56aa-3a51-ea68-55b62394f276	00030000-56aa-3a51-fa63-a727259e15f0
00020000-56aa-3a51-ea68-55b62394f276	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-a575-db0d11e6545b	00030000-56aa-3a51-5b9b-fa4a96ca5697
00020000-56aa-3a51-a575-db0d11e6545b	00030000-56aa-3a51-cfa1-a01d0d52a65e
00020000-56aa-3a51-a575-db0d11e6545b	00030000-56aa-3a51-ea06-20076e6977d7
00020000-56aa-3a51-a575-db0d11e6545b	00030000-56aa-3a51-a716-fa585e7b6bd2
00020000-56aa-3a51-5bd3-5af5c36e8eb0	00030000-56aa-3a51-5b9b-fa4a96ca5697
00020000-56aa-3a51-5bd3-5af5c36e8eb0	00030000-56aa-3a51-ea06-20076e6977d7
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-5824-b55b04e2ae70
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-3fb7-151f2ff8997d
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-95f8-b5fb4aeb416a
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-571e-45a2ff9d1a49
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-3919-ce77a24b1a2f
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-b522-b74f7662234a
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-f8d9-df6701e15afc
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-24d5-e56cc29da013
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-f663-c7e64dc57e1e
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-30e4-e51d5e915627
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-8fb5-7d9453ce61ab
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-d9d1-158feacbfe13
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-5152-74ab0e963caf
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-fc08-cca8df4254bf
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-b6df-8c663b630abd
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-9fa3-f54d654fd895
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-a856-838c2eb56c63
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-7d20-1fea49cbcdb2
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-9b48-9dc0d2a0d736
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-a892-cc35f4539c60
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-7263-2a782898fd76
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-c12d-a1955cc4dc49
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-4fef-c7d92ef9d289
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-0c0b-7adacd3da66d
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-a716-fa585e7b6bd2
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-5dc9-008c6e03a4a9
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-5d51-f266ca54eef5
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-3e49-c8204143fdde
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-52af-46c87756ea69
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-44fb-d9b151e0fea2
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-6247-b66a24f1090b
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-ae1d-8085a3cbd543
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-1f6b-bece65e5cb5b
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-14eb-5bee8d5db0bb
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-69d9-49c20e588943
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-7971-b3be7ebfdc29
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-0626-f3340d6a4987
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-2cfc-1b0a6e6d6762
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-ad58-366138c52816
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-e0a9-16a37767e2fb
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-fa46-6cba84354aa0
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-9498-ab5874f6e4c1
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-e7b2-aac85b60ce8b
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-dab7-f69d733a49e9
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-413c-89bd13ecb7cd
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-89d7-50af4f214fe9
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-e102-d3efba6a68d3
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-51f8-3cc80311ae8e
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-9eeb-0fb92740778f
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-3d9d-cc30f08b1b7d
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-bb21-fdf52ee935c9
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-2152-5cbc9577c37e
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-3c74-1f9beda18736
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-78e4-639fd7ce56ab
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-b9c7-57262febf4ce
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-5b9b-fa4a96ca5697
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-cfa1-a01d0d52a65e
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-fbf4-22cbf0662464
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-fa63-a727259e15f0
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-f592-7bd2eefe5efd
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-e0de-8f0e2ae42eb7
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-905a-8f7a93ad0e56
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-ea06-20076e6977d7
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-b665-3c9cdc52cb23
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-04ab-5d87442d5cb4
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-3390-0f76891850df
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-088b-2860892a2402
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-0963-ceb38f90ca31
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-1c3b-a0c50a61187d
00020000-56aa-3a51-14ef-edb1671fa4ed	00030000-56aa-3a51-cfa6-634aa922780d
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-5824-b55b04e2ae70
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-3fb7-151f2ff8997d
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-3919-ce77a24b1a2f
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-b522-b74f7662234a
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-f8d9-df6701e15afc
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-24d5-e56cc29da013
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-f663-c7e64dc57e1e
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-d9d1-158feacbfe13
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-5152-74ab0e963caf
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-7d20-1fea49cbcdb2
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-9b48-9dc0d2a0d736
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-a892-cc35f4539c60
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-7263-2a782898fd76
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-a716-fa585e7b6bd2
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-5dc9-008c6e03a4a9
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-52af-46c87756ea69
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-ae1d-8085a3cbd543
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-b9c7-57262febf4ce
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-fbf4-22cbf0662464
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-fa63-a727259e15f0
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-f592-7bd2eefe5efd
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-e0de-8f0e2ae42eb7
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-905a-8f7a93ad0e56
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-ea06-20076e6977d7
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-04ab-5d87442d5cb4
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-3390-0f76891850df
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-088b-2860892a2402
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-0963-ceb38f90ca31
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-1c3b-a0c50a61187d
00020000-56aa-3a51-74b2-b55f75a40b23	00030000-56aa-3a51-cfa6-634aa922780d
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-5824-b55b04e2ae70
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-3fb7-151f2ff8997d
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-95f8-b5fb4aeb416a
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-571e-45a2ff9d1a49
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-3919-ce77a24b1a2f
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-b522-b74f7662234a
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-f8d9-df6701e15afc
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-24d5-e56cc29da013
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-f663-c7e64dc57e1e
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-d9d1-158feacbfe13
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-5152-74ab0e963caf
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-fc08-cca8df4254bf
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-b6df-8c663b630abd
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-7d20-1fea49cbcdb2
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-9b48-9dc0d2a0d736
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-a892-cc35f4539c60
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-7263-2a782898fd76
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-a716-fa585e7b6bd2
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-5dc9-008c6e03a4a9
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-52af-46c87756ea69
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-ae1d-8085a3cbd543
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-b9c7-57262febf4ce
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-fbf4-22cbf0662464
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-fa63-a727259e15f0
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-f592-7bd2eefe5efd
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-e0de-8f0e2ae42eb7
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-905a-8f7a93ad0e56
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-ea06-20076e6977d7
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-b665-3c9cdc52cb23
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-04ab-5d87442d5cb4
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-3390-0f76891850df
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-088b-2860892a2402
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-0963-ceb38f90ca31
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-1c3b-a0c50a61187d
00020000-56aa-3a51-5d34-dcd226e907f5	00030000-56aa-3a51-cfa6-634aa922780d
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-3fb7-151f2ff8997d
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-95f8-b5fb4aeb416a
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-571e-45a2ff9d1a49
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-3919-ce77a24b1a2f
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-b522-b74f7662234a
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-f8d9-df6701e15afc
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-24d5-e56cc29da013
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-f663-c7e64dc57e1e
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-30e4-e51d5e915627
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-8fb5-7d9453ce61ab
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-d9d1-158feacbfe13
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-5152-74ab0e963caf
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-fc08-cca8df4254bf
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-b6df-8c663b630abd
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-9fa3-f54d654fd895
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-a856-838c2eb56c63
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-7d20-1fea49cbcdb2
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-a8c9-f7a374682ba0
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-9b48-9dc0d2a0d736
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-a892-cc35f4539c60
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-7263-2a782898fd76
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-c12d-a1955cc4dc49
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-4fef-c7d92ef9d289
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-0c0b-7adacd3da66d
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-a716-fa585e7b6bd2
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-c76f-ddd1399e3913
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-5dc9-008c6e03a4a9
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-5d51-f266ca54eef5
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-3e49-c8204143fdde
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-52af-46c87756ea69
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-9a12-ae3d88877230
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-44fb-d9b151e0fea2
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-6247-b66a24f1090b
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-ae1d-8085a3cbd543
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-fcb2-d3131de59db8
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-1f6b-bece65e5cb5b
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-14eb-5bee8d5db0bb
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-69d9-49c20e588943
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-7971-b3be7ebfdc29
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-0626-f3340d6a4987
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-2cfc-1b0a6e6d6762
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-ad58-366138c52816
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-e0a9-16a37767e2fb
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-fa46-6cba84354aa0
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-9498-ab5874f6e4c1
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-e7b2-aac85b60ce8b
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-dab7-f69d733a49e9
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-413c-89bd13ecb7cd
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-89d7-50af4f214fe9
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-e102-d3efba6a68d3
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-51f8-3cc80311ae8e
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-9eeb-0fb92740778f
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-3d9d-cc30f08b1b7d
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-bb21-fdf52ee935c9
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-2152-5cbc9577c37e
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-3c74-1f9beda18736
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-78e4-639fd7ce56ab
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-b9c7-57262febf4ce
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-5b9b-fa4a96ca5697
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-cfa1-a01d0d52a65e
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-fbf4-22cbf0662464
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-bf4d-a18639e3aba3
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-fa63-a727259e15f0
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-f592-7bd2eefe5efd
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-905a-8f7a93ad0e56
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-bf27-8b6d03a34a58
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-ea06-20076e6977d7
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-b665-3c9cdc52cb23
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-04ab-5d87442d5cb4
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-3390-0f76891850df
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-088b-2860892a2402
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-0963-ceb38f90ca31
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-37d5-3f065edf4ae3
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-1c3b-a0c50a61187d
00020000-56aa-3a51-eea8-bb8e23a41761	00030000-56aa-3a51-cfa6-634aa922780d
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-5824-b55b04e2ae70
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-3fb7-151f2ff8997d
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-95f8-b5fb4aeb416a
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-571e-45a2ff9d1a49
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-3919-ce77a24b1a2f
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-b522-b74f7662234a
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-f8d9-df6701e15afc
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-24d5-e56cc29da013
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-f663-c7e64dc57e1e
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-d9d1-158feacbfe13
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-5152-74ab0e963caf
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-fc08-cca8df4254bf
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-b6df-8c663b630abd
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-7d20-1fea49cbcdb2
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-a8c9-f7a374682ba0
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-9b48-9dc0d2a0d736
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-a892-cc35f4539c60
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-7263-2a782898fd76
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-c12d-a1955cc4dc49
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-4fef-c7d92ef9d289
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-a716-fa585e7b6bd2
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-c76f-ddd1399e3913
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-5dc9-008c6e03a4a9
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-52af-46c87756ea69
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-9a12-ae3d88877230
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-ae1d-8085a3cbd543
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-fcb2-d3131de59db8
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-b9c7-57262febf4ce
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-5b9b-fa4a96ca5697
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-fbf4-22cbf0662464
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-bf4d-a18639e3aba3
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-fa63-a727259e15f0
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-f592-7bd2eefe5efd
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-e0de-8f0e2ae42eb7
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-905a-8f7a93ad0e56
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-bf27-8b6d03a34a58
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-ea06-20076e6977d7
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-b665-3c9cdc52cb23
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-04ab-5d87442d5cb4
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-3390-0f76891850df
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-088b-2860892a2402
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-0963-ceb38f90ca31
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-37d5-3f065edf4ae3
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-1c3b-a0c50a61187d
00020000-56aa-3a51-2b1c-4533c357208a	00030000-56aa-3a51-cfa6-634aa922780d
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-5824-b55b04e2ae70
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-3fb7-151f2ff8997d
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-95f8-b5fb4aeb416a
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-3919-ce77a24b1a2f
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-f8d9-df6701e15afc
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-d9d1-158feacbfe13
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-5152-74ab0e963caf
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-fc08-cca8df4254bf
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-7d20-1fea49cbcdb2
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-9b48-9dc0d2a0d736
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-7263-2a782898fd76
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-4fef-c7d92ef9d289
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-a716-fa585e7b6bd2
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-5dc9-008c6e03a4a9
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-52af-46c87756ea69
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-ae1d-8085a3cbd543
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-b9c7-57262febf4ce
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-5b9b-fa4a96ca5697
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-fbf4-22cbf0662464
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-fa63-a727259e15f0
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-f592-7bd2eefe5efd
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-e0de-8f0e2ae42eb7
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-905a-8f7a93ad0e56
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-ea06-20076e6977d7
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-04ab-5d87442d5cb4
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-0963-ceb38f90ca31
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-1c3b-a0c50a61187d
00020000-56aa-3a51-d21c-aa8d07f18e32	00030000-56aa-3a51-cfa6-634aa922780d
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-5824-b55b04e2ae70
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-3fb7-151f2ff8997d
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-95f8-b5fb4aeb416a
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-571e-45a2ff9d1a49
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-f8d9-df6701e15afc
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-f663-c7e64dc57e1e
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-30e4-e51d5e915627
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-8fb5-7d9453ce61ab
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-d9d1-158feacbfe13
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-5152-74ab0e963caf
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-9fa3-f54d654fd895
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-a856-838c2eb56c63
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-7d20-1fea49cbcdb2
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-a8c9-f7a374682ba0
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-9b48-9dc0d2a0d736
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-8a86-461736febae9
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-a892-cc35f4539c60
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-7263-2a782898fd76
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-c12d-a1955cc4dc49
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-4fef-c7d92ef9d289
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-0c0b-7adacd3da66d
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-a716-fa585e7b6bd2
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-c76f-ddd1399e3913
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-5dc9-008c6e03a4a9
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-5d51-f266ca54eef5
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-3e49-c8204143fdde
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-52af-46c87756ea69
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-9a12-ae3d88877230
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-44fb-d9b151e0fea2
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-6247-b66a24f1090b
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-ae1d-8085a3cbd543
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-fcb2-d3131de59db8
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-1f6b-bece65e5cb5b
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-14eb-5bee8d5db0bb
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-69d9-49c20e588943
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-7971-b3be7ebfdc29
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-0626-f3340d6a4987
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-2cfc-1b0a6e6d6762
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-ad58-366138c52816
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-e0a9-16a37767e2fb
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-fa46-6cba84354aa0
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-9498-ab5874f6e4c1
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-e7b2-aac85b60ce8b
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-dab7-f69d733a49e9
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-413c-89bd13ecb7cd
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-89d7-50af4f214fe9
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-e102-d3efba6a68d3
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-51f8-3cc80311ae8e
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-9eeb-0fb92740778f
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-3d9d-cc30f08b1b7d
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-bb21-fdf52ee935c9
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-2152-5cbc9577c37e
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-3c74-1f9beda18736
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-78e4-639fd7ce56ab
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-b9c7-57262febf4ce
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-5b9b-fa4a96ca5697
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-cfa1-a01d0d52a65e
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-fbf4-22cbf0662464
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-bf4d-a18639e3aba3
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-fa63-a727259e15f0
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-f592-7bd2eefe5efd
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-e0de-8f0e2ae42eb7
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-905a-8f7a93ad0e56
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-bf27-8b6d03a34a58
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-ea06-20076e6977d7
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-04ab-5d87442d5cb4
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-6a84-c83d076e6de7
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-3390-0f76891850df
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-088b-2860892a2402
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-0963-ceb38f90ca31
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-37d5-3f065edf4ae3
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-1c3b-a0c50a61187d
00020000-56aa-3a52-6e85-6b27515074cf	00030000-56aa-3a51-cfa6-634aa922780d
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-d879-f7385602f68f
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-0435-9b43086af6ee
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-5824-b55b04e2ae70
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-1300-ffca2263b2bc
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-3fb7-151f2ff8997d
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-571e-45a2ff9d1a49
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-95f8-b5fb4aeb416a
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-0f32-0cab0bbc9bd1
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-4684-4bd0e4715732
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-7bd1-dff286ea6ca8
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-ac2f-f4655e8730f0
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-3919-ce77a24b1a2f
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-b522-b74f7662234a
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-f8d9-df6701e15afc
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-24d5-e56cc29da013
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-f663-c7e64dc57e1e
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-b151-42015c602ab6
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-2e29-1bcd2c7b1e30
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-cf5a-6151a2615f95
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-7249-653ebf01f1e0
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-9901-6f851abf1110
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-6e18-4720be4cedf7
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-ce16-a3b14f176a7b
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-943c-5a5b0b66b3fd
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-5c36-c6a3a29ee4d9
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-30e4-e51d5e915627
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-8fb5-7d9453ce61ab
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-d9d1-158feacbfe13
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-c313-3675039c4283
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-e6a5-a658be77e642
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-7f59-503efa2bc5fb
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-5152-74ab0e963caf
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-b6df-8c663b630abd
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-fc08-cca8df4254bf
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-9c67-89ac8216f1af
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-a5c2-daaebea8d15b
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-0324-5db3c5846088
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-9fa3-f54d654fd895
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-a856-838c2eb56c63
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-7d20-1fea49cbcdb2
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-a8c9-f7a374682ba0
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-2658-625e42943907
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-8356-8d9438ac37bf
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-55e1-7b34d708a6a7
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-5849-be7fbb3edd90
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-1a75-fffd31b46a3b
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-6149-1bdab69457c7
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-e354-aacf42605a59
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-fa63-5195dbf87eb8
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-857e-d8b7f7b79fcb
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-6ec2-b13313410e97
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-c0f2-e7c925fdd644
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-caa8-88cc74eb35ed
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-c49c-03bd5f9bbcff
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-0a01-e27c14365890
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-8dac-88c70ae705aa
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-9b48-9dc0d2a0d736
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-8a86-461736febae9
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-a892-cc35f4539c60
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-7263-2a782898fd76
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-c12d-a1955cc4dc49
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-99aa-3042e4f3df96
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-1f47-1d6cd276d625
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-9163-81cfcb999e3d
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-f9f7-2d95cb0a7fec
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-4fef-c7d92ef9d289
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-0c0b-7adacd3da66d
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-a716-fa585e7b6bd2
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-c76f-ddd1399e3913
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-5dc9-008c6e03a4a9
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-5d51-f266ca54eef5
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-3e49-c8204143fdde
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-6eca-fcadb1897795
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-e2cb-080e7d1ca371
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-7eb5-3a71f8a30676
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-52af-46c87756ea69
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-9a12-ae3d88877230
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-e9c3-af0da0df0509
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-2770-299848f8f37d
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-7c74-794d18cbf1ec
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-fe9f-524ee9ee4cfb
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-9159-bae3cb6275ae
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-c3cf-2246792b790a
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-44fb-d9b151e0fea2
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-6247-b66a24f1090b
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-ae1d-8085a3cbd543
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-fcb2-d3131de59db8
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-1f6b-bece65e5cb5b
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-14eb-5bee8d5db0bb
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-69d9-49c20e588943
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-7971-b3be7ebfdc29
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-0626-f3340d6a4987
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-2cfc-1b0a6e6d6762
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-ad58-366138c52816
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-e0a9-16a37767e2fb
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-fa46-6cba84354aa0
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-9498-ab5874f6e4c1
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-e7b2-aac85b60ce8b
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-dab7-f69d733a49e9
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-413c-89bd13ecb7cd
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-89d7-50af4f214fe9
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-e102-d3efba6a68d3
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-51f8-3cc80311ae8e
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-9eeb-0fb92740778f
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-3d9d-cc30f08b1b7d
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-bb21-fdf52ee935c9
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-2152-5cbc9577c37e
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-3c74-1f9beda18736
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-78e4-639fd7ce56ab
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-b9c7-57262febf4ce
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-c7aa-5758d8b39fac
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-60d1-2aa34e856d66
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-6227-58e922dee611
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-0eb9-93f555a03436
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-9581-979af910c7c5
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-862d-336431529b37
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-b3e1-f2f86c60599f
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-0565-ef3b2aacea19
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-cdad-434480190177
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-21ee-eee3f2c630bd
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-e54d-8f536112c2d0
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-9da1-791971e0ca78
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-b830-8046947b35cd
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-c423-322da4b6d1b0
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-905c-0b1f29b4e2d3
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-68ea-f718da9f07bc
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-81eb-bae5a645ddb6
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-ed7e-ee6a6702794f
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-abf5-e4ace36a2992
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-1f63-bec1a8bf96ad
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-054d-8e9b858e203a
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-4ff6-34d44d7458ab
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-5b9b-fa4a96ca5697
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-cfa1-a01d0d52a65e
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-fbf4-22cbf0662464
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-bf4d-a18639e3aba3
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-ade0-764c634c5c50
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-7575-9c0ad47405ab
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-3e58-ca390fd52d98
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-fa63-a727259e15f0
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-3dfd-ad5a5fed58cb
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-f592-7bd2eefe5efd
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-d826-52fe8479d6ea
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-b728-9f9d132e4ad4
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-c818-154b1fcdee4a
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-e0de-8f0e2ae42eb7
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-7fca-bdbd651e7830
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-905a-8f7a93ad0e56
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-bf27-8b6d03a34a58
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-ea06-20076e6977d7
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-b665-3c9cdc52cb23
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-8a02-2ee1916a565d
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-7fac-b0d5f9219635
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-1276-db564bed061b
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-45a5-bb20ff9fea0a
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-04ab-5d87442d5cb4
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-6a84-c83d076e6de7
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-6c22-584b6759b005
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-462b-4f008ff1d420
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-3390-0f76891850df
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-088b-2860892a2402
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-0963-ceb38f90ca31
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-37d5-3f065edf4ae3
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-1c3b-a0c50a61187d
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-ceda-ff8e332a335b
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-cfa6-634aa922780d
00020000-56aa-3a53-feb0-b7408d6fd28b	00030000-56aa-3a51-ac69-0d872ac9d6c4
00020000-56aa-3a53-36d5-496b2d91788d	00030000-56aa-3a51-eaa5-c7f322bb18e7
00020000-56aa-3a53-cdf5-43fa4f8d194c	00030000-56aa-3a51-3390-0f76891850df
00020000-56aa-3a53-ccf7-3a60cac2b7f0	00030000-56aa-3a51-b665-3c9cdc52cb23
00020000-56aa-3a53-b64c-e440017a73ea	00030000-56aa-3a51-ea06-20076e6977d7
00020000-56aa-3a53-1a93-7034d44d1f6e	00030000-56aa-3a51-6149-1bdab69457c7
00020000-56aa-3a53-3d4d-cb6283d00309	00030000-56aa-3a51-e354-aacf42605a59
00020000-56aa-3a53-404a-3d0d0251d102	00030000-56aa-3a51-fa63-5195dbf87eb8
00020000-56aa-3a53-b30f-90cc8625e050	00030000-56aa-3a51-1a75-fffd31b46a3b
00020000-56aa-3a53-b3f4-636dd03e8421	00030000-56aa-3a51-55e1-7b34d708a6a7
00020000-56aa-3a53-3c90-a4f0e2d79bcc	00030000-56aa-3a51-5849-be7fbb3edd90
00020000-56aa-3a53-f224-a6cd4070fede	00030000-56aa-3a51-8619-5b31ab499f82
00020000-56aa-3a53-d53e-bba2c7f038e6	00030000-56aa-3a51-088b-2860892a2402
00020000-56aa-3a53-f77d-0609a821add6	00030000-56aa-3a51-bfeb-5cbc4277ecd6
00020000-56aa-3a53-3d92-982eb13ef1f5	00030000-56aa-3a51-a892-cc35f4539c60
00020000-56aa-3a53-f103-f275ca30aee3	00030000-56aa-3a51-c12d-a1955cc4dc49
00020000-56aa-3a53-fb48-111dc8b7bb5d	00030000-56aa-3a51-7263-2a782898fd76
00020000-56aa-3a53-7f21-3264418afcd8	00030000-56aa-3a51-f663-c7e64dc57e1e
00020000-56aa-3a53-dbda-76bfedb478a3	00030000-56aa-3a51-05c2-fa0c0a7d97cd
00020000-56aa-3a53-84bd-1a9dc6d15610	00030000-56aa-3a51-a716-fa585e7b6bd2
00020000-56aa-3a53-84bd-1a9dc6d15610	00030000-56aa-3a51-c76f-ddd1399e3913
00020000-56aa-3a53-84bd-1a9dc6d15610	00030000-56aa-3a51-ea06-20076e6977d7
00020000-56aa-3a53-6a75-a73def6a5768	00030000-56aa-3a51-905a-8f7a93ad0e56
00020000-56aa-3a53-6895-1427a9ecb8a1	00030000-56aa-3a51-bf27-8b6d03a34a58
00020000-56aa-3a53-f350-69adf6135deb	00030000-56aa-3a51-4ff6-34d44d7458ab
00020000-56aa-3a53-f21c-8c313aa6f3e2	00030000-56aa-3a51-fbf4-22cbf0662464
00020000-56aa-3a53-cc22-c20bbf7b58c0	00030000-56aa-3a51-bf4d-a18639e3aba3
00020000-56aa-3a53-dc4b-0013dd59b609	00030000-56aa-3a51-52af-46c87756ea69
00020000-56aa-3a53-4d92-124dc068c747	00030000-56aa-3a51-9a12-ae3d88877230
00020000-56aa-3a53-d07a-6d63c38d6148	00030000-56aa-3a51-0963-ceb38f90ca31
00020000-56aa-3a53-5bf0-f60d11b117ef	00030000-56aa-3a51-37d5-3f065edf4ae3
00020000-56aa-3a53-d69b-506afe7442a3	00030000-56aa-3a51-4fef-c7d92ef9d289
00020000-56aa-3a53-cb78-22f48d09ba9e	00030000-56aa-3a51-0c0b-7adacd3da66d
00020000-56aa-3a53-60c8-a467f83e674c	00030000-56aa-3a51-5b9b-fa4a96ca5697
00020000-56aa-3a53-9b21-98d7611300b2	00030000-56aa-3a51-cfa1-a01d0d52a65e
00020000-56aa-3a53-7cd1-6bc040b9161f	00030000-56aa-3a51-3fb7-151f2ff8997d
00020000-56aa-3a53-305a-18c5539cc321	00030000-56aa-3a51-95f8-b5fb4aeb416a
00020000-56aa-3a53-5394-0dda362364e3	00030000-56aa-3a51-571e-45a2ff9d1a49
00020000-56aa-3a53-b472-45ab9ac75dda	00030000-56aa-3a51-5152-74ab0e963caf
00020000-56aa-3a53-f181-10d2a002a779	00030000-56aa-3a51-fc08-cca8df4254bf
00020000-56aa-3a53-0583-4ea6e255875b	00030000-56aa-3a51-b6df-8c663b630abd
\.


--
-- TOC entry 3181 (class 0 OID 41514794)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 41514829)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 41514962)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56aa-3a54-a70b-712417cc2c59	00090000-56aa-3a54-4e56-966032f7d2cd	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56aa-3a54-cb4e-f2aa3894adee	00090000-56aa-3a54-6c0e-cab3cfc309dc	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56aa-3a54-3989-b4b98178f002	00090000-56aa-3a54-f01d-eb49b79dcd9e	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56aa-3a54-3c7b-051abc8062e3	00090000-56aa-3a54-7a86-8d7481598d7b	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 41514479)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56aa-3a53-374d-9b77b08e0f61	\N	00040000-56aa-3a51-5622-033d9d68b978	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56aa-3a53-8b20-14ddd9c73e49	\N	00040000-56aa-3a51-5622-033d9d68b978	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56aa-3a53-dce7-3ea2877b653d	\N	00040000-56aa-3a51-5622-033d9d68b978	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56aa-3a53-24c2-2737d357402b	\N	00040000-56aa-3a51-5622-033d9d68b978	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56aa-3a53-46e9-993ee66f457b	\N	00040000-56aa-3a51-5622-033d9d68b978	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56aa-3a53-9261-ec0ca6525d47	\N	00040000-56aa-3a50-a337-936b3b9bc6dd	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56aa-3a53-9654-8381dc3e47de	\N	00040000-56aa-3a50-2425-3d9190a8a368	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56aa-3a53-add1-a20885c0c322	\N	00040000-56aa-3a50-cc1d-9f68f49004e8	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56aa-3a53-4dda-651df99389af	\N	00040000-56aa-3a51-65c3-690020e55a78	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56aa-3a56-83f4-97ad5f0c8e00	\N	00040000-56aa-3a51-5622-033d9d68b978	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 41514524)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56aa-3a50-ed63-3a234da8492c	8341	Adlešiči
00050000-56aa-3a50-f4fd-c0f4813e32dc	5270	Ajdovščina
00050000-56aa-3a50-4324-3631de2b9f5e	6280	Ankaran/Ancarano
00050000-56aa-3a50-6ca0-13062adeee3d	9253	Apače
00050000-56aa-3a50-f9ac-5df9e6d5454a	8253	Artiče
00050000-56aa-3a50-0c70-5794554cc244	4275	Begunje na Gorenjskem
00050000-56aa-3a50-2433-ccdec618fbcc	1382	Begunje pri Cerknici
00050000-56aa-3a50-0342-956ea84683eb	9231	Beltinci
00050000-56aa-3a50-f0f1-54fb451de9bc	2234	Benedikt
00050000-56aa-3a50-170b-febee03e2b5d	2345	Bistrica ob Dravi
00050000-56aa-3a50-17b7-40aa0d771d5c	3256	Bistrica ob Sotli
00050000-56aa-3a50-7d79-cb46f62ce9b1	8259	Bizeljsko
00050000-56aa-3a50-8259-a1e599eea914	1223	Blagovica
00050000-56aa-3a50-efd5-d72ba0a7b8a1	8283	Blanca
00050000-56aa-3a50-94ee-aa0785f25f80	4260	Bled
00050000-56aa-3a50-b80f-2562569a37ac	4273	Blejska Dobrava
00050000-56aa-3a50-f8b4-255870469a58	9265	Bodonci
00050000-56aa-3a50-975e-f139d30f50dd	9222	Bogojina
00050000-56aa-3a50-93ba-f4bf8cc2e8cc	4263	Bohinjska Bela
00050000-56aa-3a50-d24e-06967cdc8ffc	4264	Bohinjska Bistrica
00050000-56aa-3a50-a8e1-d4d648f81494	4265	Bohinjsko jezero
00050000-56aa-3a50-2226-653d9c243eb8	1353	Borovnica
00050000-56aa-3a50-48af-8f96b3aad98b	8294	Boštanj
00050000-56aa-3a50-5e8a-3e26c7448740	5230	Bovec
00050000-56aa-3a50-b746-5c31e731bb51	5295	Branik
00050000-56aa-3a50-36e9-795cbdf281a7	3314	Braslovče
00050000-56aa-3a50-9a0f-f13f313738f3	5223	Breginj
00050000-56aa-3a50-e147-3f499941ce40	8280	Brestanica
00050000-56aa-3a50-ea01-54f9cac4e141	2354	Bresternica
00050000-56aa-3a50-ff74-be69e5d3648a	4243	Brezje
00050000-56aa-3a50-6469-ace97fd6d42c	1351	Brezovica pri Ljubljani
00050000-56aa-3a50-0831-bdd3238519c1	8250	Brežice
00050000-56aa-3a50-933c-e4c1bea28dcf	4210	Brnik - Aerodrom
00050000-56aa-3a50-3464-d00fd23249d4	8321	Brusnice
00050000-56aa-3a50-a5b7-cf1b68245c67	3255	Buče
00050000-56aa-3a50-b851-593ddcc71fbe	8276	Bučka 
00050000-56aa-3a50-aa7a-85e7bac76219	9261	Cankova
00050000-56aa-3a50-c715-cd7f38048f48	3000	Celje 
00050000-56aa-3a50-00ec-cd543b1f0b8d	3001	Celje - poštni predali
00050000-56aa-3a50-4058-deda68134e3b	4207	Cerklje na Gorenjskem
00050000-56aa-3a50-a813-1fc2d3273d3d	8263	Cerklje ob Krki
00050000-56aa-3a50-3c0b-9218a7011cbd	1380	Cerknica
00050000-56aa-3a50-db99-c7f5a544a5d4	5282	Cerkno
00050000-56aa-3a50-1970-11c22265e21a	2236	Cerkvenjak
00050000-56aa-3a50-2506-44648d5c9d8b	2215	Ceršak
00050000-56aa-3a50-6f8f-ace9096edb97	2326	Cirkovce
00050000-56aa-3a50-09fe-4fc65b1d7244	2282	Cirkulane
00050000-56aa-3a50-de60-023d874d9031	5273	Col
00050000-56aa-3a50-eafc-f301927c3289	8251	Čatež ob Savi
00050000-56aa-3a50-d711-3c5dadcfdd9d	1413	Čemšenik
00050000-56aa-3a50-5f67-8a86780773d0	5253	Čepovan
00050000-56aa-3a50-d8d9-5bb78d260a46	9232	Črenšovci
00050000-56aa-3a50-4242-838180a02835	2393	Črna na Koroškem
00050000-56aa-3a50-d6ad-b581865e6ac5	6275	Črni Kal
00050000-56aa-3a50-4b99-4a4fee5f34a5	5274	Črni Vrh nad Idrijo
00050000-56aa-3a50-9182-3cde071a1324	5262	Črniče
00050000-56aa-3a50-fd1f-a652161b991c	8340	Črnomelj
00050000-56aa-3a50-9c46-585551916615	6271	Dekani
00050000-56aa-3a50-bd19-50b589ff5038	5210	Deskle
00050000-56aa-3a50-a5f6-616c8e0995fb	2253	Destrnik
00050000-56aa-3a50-9f75-1e393d382a42	6215	Divača
00050000-56aa-3a50-0735-79112c12b262	1233	Dob
00050000-56aa-3a50-518d-30777aa54d98	3224	Dobje pri Planini
00050000-56aa-3a50-40f8-29de7876c559	8257	Dobova
00050000-56aa-3a50-d41f-409ce23f06db	1423	Dobovec
00050000-56aa-3a50-f6aa-079c7f023a80	5263	Dobravlje
00050000-56aa-3a50-42e7-7ca721a53a45	3204	Dobrna
00050000-56aa-3a50-db1b-85f6c6c77aa6	8211	Dobrnič
00050000-56aa-3a50-8745-00b6416e4ac3	1356	Dobrova
00050000-56aa-3a50-9f3f-85fafa626de1	9223	Dobrovnik/Dobronak 
00050000-56aa-3a50-5605-e3f72adf992a	5212	Dobrovo v Brdih
00050000-56aa-3a50-18b0-1e0b4901ea5b	1431	Dol pri Hrastniku
00050000-56aa-3a50-665c-3f585853e9c3	1262	Dol pri Ljubljani
00050000-56aa-3a50-b64b-fde42edc8b0c	1273	Dole pri Litiji
00050000-56aa-3a50-1856-0aeb7fb6ede7	1331	Dolenja vas
00050000-56aa-3a50-15f4-61232ed935f9	8350	Dolenjske Toplice
00050000-56aa-3a50-8ee1-6ee410210d23	1230	Domžale
00050000-56aa-3a50-d4e4-534a94bfa9e6	2252	Dornava
00050000-56aa-3a50-e7cc-500b4cf3e5f3	5294	Dornberk
00050000-56aa-3a50-c09a-f667348538b8	1319	Draga
00050000-56aa-3a50-991b-f60b130404f3	8343	Dragatuš
00050000-56aa-3a50-6cc4-8ac0e2a7977b	3222	Dramlje
00050000-56aa-3a50-a05e-56590ae414ec	2370	Dravograd
00050000-56aa-3a50-7efe-0a63c1240288	4203	Duplje
00050000-56aa-3a50-b825-60803a1924c3	6221	Dutovlje
00050000-56aa-3a50-73f3-a226ec0b8a76	8361	Dvor
00050000-56aa-3a50-dbaa-e41085e20912	2343	Fala
00050000-56aa-3a50-518a-7ee44fbb89fb	9208	Fokovci
00050000-56aa-3a50-8637-34792586aed9	2313	Fram
00050000-56aa-3a50-0bfb-0641d3772741	3213	Frankolovo
00050000-56aa-3a50-dd5d-6d144a186069	1274	Gabrovka
00050000-56aa-3a50-6a65-836393f8eb89	8254	Globoko
00050000-56aa-3a50-215b-b57ea9a04525	5275	Godovič
00050000-56aa-3a50-8937-88f297c294f6	4204	Golnik
00050000-56aa-3a50-3bf0-f3e89327214c	3303	Gomilsko
00050000-56aa-3a50-50e2-da1484dc3f10	4224	Gorenja vas
00050000-56aa-3a50-6565-dfd4bde2a0de	3263	Gorica pri Slivnici
00050000-56aa-3a50-aa4f-0ca29be54cb7	2272	Gorišnica
00050000-56aa-3a50-b58a-4735bc1af8dc	9250	Gornja Radgona
00050000-56aa-3a50-c6f9-40de9cf49b5e	3342	Gornji Grad
00050000-56aa-3a50-3395-a350afb89db1	4282	Gozd Martuljek
00050000-56aa-3a50-4f4a-16713cfd883b	6272	Gračišče
00050000-56aa-3a50-5610-9a94ae98d701	9264	Grad
00050000-56aa-3a50-5336-e07ada94f72b	8332	Gradac
00050000-56aa-3a50-ec36-eb0f6fe3cc8d	1384	Grahovo
00050000-56aa-3a50-1ac4-dc7322bb1f1b	5242	Grahovo ob Bači
00050000-56aa-3a50-cbd8-85de2849ae15	5251	Grgar
00050000-56aa-3a50-7a8f-9a6130699ebf	3302	Griže
00050000-56aa-3a50-2551-ee20ef177693	3231	Grobelno
00050000-56aa-3a50-5cc9-6d468e579228	1290	Grosuplje
00050000-56aa-3a50-81df-a4daa6b510b5	2288	Hajdina
00050000-56aa-3a50-23bd-ee12e15cd4d5	8362	Hinje
00050000-56aa-3a50-f788-7b0107390b68	2311	Hoče
00050000-56aa-3a50-0b5c-85349e5405da	9205	Hodoš/Hodos
00050000-56aa-3a50-a204-f1a8e3e8d60c	1354	Horjul
00050000-56aa-3a50-4511-fd69cba0eb6b	1372	Hotedršica
00050000-56aa-3a50-515f-a2c86965665f	1430	Hrastnik
00050000-56aa-3a50-3023-97870abfdbaf	6225	Hruševje
00050000-56aa-3a50-3d44-9792189453a7	4276	Hrušica
00050000-56aa-3a50-011f-626c868157b5	5280	Idrija
00050000-56aa-3a50-102f-0359b044837e	1292	Ig
00050000-56aa-3a50-c520-20872fedec9a	6250	Ilirska Bistrica
00050000-56aa-3a50-48fb-456f18ee3a95	6251	Ilirska Bistrica-Trnovo
00050000-56aa-3a50-dd9c-ec5329774ed6	1295	Ivančna Gorica
00050000-56aa-3a50-bedd-6339f4b77b22	2259	Ivanjkovci
00050000-56aa-3a50-f627-a80beb28e29d	1411	Izlake
00050000-56aa-3a50-bc9d-77bb91cedb54	6310	Izola/Isola
00050000-56aa-3a50-569a-8ed7b8b36977	2222	Jakobski Dol
00050000-56aa-3a50-c197-d9e324f347c9	2221	Jarenina
00050000-56aa-3a50-5413-f5a3308e7f06	6254	Jelšane
00050000-56aa-3a50-e152-ff6316262da1	4270	Jesenice
00050000-56aa-3a50-3bb9-130f2f9a427f	8261	Jesenice na Dolenjskem
00050000-56aa-3a50-2071-11ef2902873a	3273	Jurklošter
00050000-56aa-3a50-2e3d-f75d380ebafe	2223	Jurovski Dol
00050000-56aa-3a50-dbee-56a46d293193	2256	Juršinci
00050000-56aa-3a50-e279-f3ee09386a8c	5214	Kal nad Kanalom
00050000-56aa-3a50-f8b6-4321695ec89d	3233	Kalobje
00050000-56aa-3a50-fead-1be4b8a35d54	4246	Kamna Gorica
00050000-56aa-3a50-7ce3-795ca43b99be	2351	Kamnica
00050000-56aa-3a50-2ca5-9e98faec4157	1241	Kamnik
00050000-56aa-3a50-ab69-13f0f040671d	5213	Kanal
00050000-56aa-3a50-c99f-013e1f0bda57	8258	Kapele
00050000-56aa-3a50-3a02-34c327fb77ae	2362	Kapla
00050000-56aa-3a50-b21b-57b6d548d9a8	2325	Kidričevo
00050000-56aa-3a50-32be-1f9c685cfbc1	1412	Kisovec
00050000-56aa-3a50-4721-06babbe49f2c	6253	Knežak
00050000-56aa-3a50-9e69-8ecca478522e	5222	Kobarid
00050000-56aa-3a50-cced-4a67f8c7f5b5	9227	Kobilje
00050000-56aa-3a50-bcc2-ec2ee9ac9914	1330	Kočevje
00050000-56aa-3a50-392f-d1b9d2326fa8	1338	Kočevska Reka
00050000-56aa-3a50-0dd6-cde3d6e839d6	2276	Kog
00050000-56aa-3a50-7de5-a18c62c57381	5211	Kojsko
00050000-56aa-3a50-e5c2-952ee6cef89f	6223	Komen
00050000-56aa-3a50-13e9-73f981fce3c6	1218	Komenda
00050000-56aa-3a50-e558-1769765cb8e1	6000	Koper/Capodistria 
00050000-56aa-3a50-02f4-5a3793eb7b32	6001	Koper/Capodistria - poštni predali
00050000-56aa-3a50-f5cc-6aa9adefcff0	8282	Koprivnica
00050000-56aa-3a50-640b-e04ea5aa8546	5296	Kostanjevica na Krasu
00050000-56aa-3a50-114d-93d2ec93c0a6	8311	Kostanjevica na Krki
00050000-56aa-3a50-c827-fc7e5983ee39	1336	Kostel
00050000-56aa-3a50-a94b-3c0ff9b65c68	6256	Košana
00050000-56aa-3a50-81b5-2e6676e5e9bf	2394	Kotlje
00050000-56aa-3a50-5633-372d20d0f428	6240	Kozina
00050000-56aa-3a50-2041-e9001bc6f27d	3260	Kozje
00050000-56aa-3a50-de5d-32b4f6338ac6	4000	Kranj 
00050000-56aa-3a50-a9ec-1d3d5edae54a	4001	Kranj - poštni predali
00050000-56aa-3a50-e9ff-015c80a399a2	4280	Kranjska Gora
00050000-56aa-3a50-af58-06f6dc0dfca9	1281	Kresnice
00050000-56aa-3a50-1d34-83aa7d22655f	4294	Križe
00050000-56aa-3a50-bebe-415cfd8feb33	9206	Križevci
00050000-56aa-3a50-8ec4-7f8ad3e987d7	9242	Križevci pri Ljutomeru
00050000-56aa-3a50-b37c-d977107f697a	1301	Krka
00050000-56aa-3a50-6b96-10c9a66670f9	8296	Krmelj
00050000-56aa-3a50-5cf3-1287e5d57658	4245	Kropa
00050000-56aa-3a50-59b0-2cd54dff4649	8262	Krška vas
00050000-56aa-3a50-b769-7cba29fba836	8270	Krško
00050000-56aa-3a50-7b5e-47ac50da9b6d	9263	Kuzma
00050000-56aa-3a50-67a6-d3e503d3125d	2318	Laporje
00050000-56aa-3a50-4606-cd84758e0e1c	3270	Laško
00050000-56aa-3a50-f6e5-a9de31c885d9	1219	Laze v Tuhinju
00050000-56aa-3a50-717b-b1ca3327414b	2230	Lenart v Slovenskih goricah
00050000-56aa-3a50-cac4-c7bedf1c98b8	9220	Lendava/Lendva
00050000-56aa-3a50-f6b5-3282c728fa6b	4248	Lesce
00050000-56aa-3a50-2cbc-96c6528204a9	3261	Lesično
00050000-56aa-3a50-51aa-b76c670d7aa8	8273	Leskovec pri Krškem
00050000-56aa-3a50-f02b-bb1de4dd0fe5	2372	Libeliče
00050000-56aa-3a50-9af0-67e4e28204f7	2341	Limbuš
00050000-56aa-3a50-a85c-8ecd3cc69362	1270	Litija
00050000-56aa-3a50-3719-03a074f07e83	3202	Ljubečna
00050000-56aa-3a50-69e8-65aa20230886	1000	Ljubljana 
00050000-56aa-3a50-2881-897698edd369	1001	Ljubljana - poštni predali
00050000-56aa-3a50-1ecf-7a457096f84d	1231	Ljubljana - Črnuče
00050000-56aa-3a50-8700-9f93d18731e2	1261	Ljubljana - Dobrunje
00050000-56aa-3a50-fc1b-01b0dcc112e6	1260	Ljubljana - Polje
00050000-56aa-3a50-475c-3fdec6afed8b	1210	Ljubljana - Šentvid
00050000-56aa-3a50-c60b-3ea819e4fa27	1211	Ljubljana - Šmartno
00050000-56aa-3a50-0791-cb9c40eb4aac	3333	Ljubno ob Savinji
00050000-56aa-3a50-60bf-766ad16eabc7	9240	Ljutomer
00050000-56aa-3a50-4637-3d358d133978	3215	Loče
00050000-56aa-3a50-3503-3557774744e6	5231	Log pod Mangartom
00050000-56aa-3a50-3c42-5fc0cf0534dc	1358	Log pri Brezovici
00050000-56aa-3a50-c6b5-80e1fe47c96d	1370	Logatec
00050000-56aa-3a50-410a-986ee1eab0dc	1371	Logatec
00050000-56aa-3a50-5aaf-2127ed0fd2a3	1434	Loka pri Zidanem Mostu
00050000-56aa-3a50-15e9-76d33a402790	3223	Loka pri Žusmu
00050000-56aa-3a50-27de-42c8fe48aea6	6219	Lokev
00050000-56aa-3a50-a51d-20941a465af2	1318	Loški Potok
00050000-56aa-3a50-f36b-297c6d5aaad8	2324	Lovrenc na Dravskem polju
00050000-56aa-3a50-de40-3f58170beb90	2344	Lovrenc na Pohorju
00050000-56aa-3a50-1688-dece4fc97fc3	3334	Luče
00050000-56aa-3a50-ed31-0bcaaa5dcf4e	1225	Lukovica
00050000-56aa-3a50-5be4-ee21ee2dcbf9	9202	Mačkovci
00050000-56aa-3a50-5076-c3ac4b18a78b	2322	Majšperk
00050000-56aa-3a50-8d65-a7887afd8889	2321	Makole
00050000-56aa-3a50-88c1-8902368629b9	9243	Mala Nedelja
00050000-56aa-3a50-227f-47d044a200af	2229	Malečnik
00050000-56aa-3a50-10b4-abe878b38099	6273	Marezige
00050000-56aa-3a50-27a9-d6458bc42f36	2000	Maribor 
00050000-56aa-3a50-faae-49f83c37ee7f	2001	Maribor - poštni predali
00050000-56aa-3a50-03dd-f7ccd8c13bfb	2206	Marjeta na Dravskem polju
00050000-56aa-3a50-2384-f4ca337c9ff6	2281	Markovci
00050000-56aa-3a50-46fb-60722aa2e774	9221	Martjanci
00050000-56aa-3a50-d6e4-923b8d0f5d51	6242	Materija
00050000-56aa-3a50-cae2-63aff93a85e5	4211	Mavčiče
00050000-56aa-3a50-0a57-97b833433346	1215	Medvode
00050000-56aa-3a50-58f6-06b748505834	1234	Mengeš
00050000-56aa-3a50-e5f0-9040734ca3ea	8330	Metlika
00050000-56aa-3a50-00db-c87f60c785a6	2392	Mežica
00050000-56aa-3a50-0708-cdcbf1ab3b43	2204	Miklavž na Dravskem polju
00050000-56aa-3a50-1773-5a4d65911c1b	2275	Miklavž pri Ormožu
00050000-56aa-3a50-a7c2-2283b03e5d1d	5291	Miren
00050000-56aa-3a50-7bf4-2a4bde2c2fb2	8233	Mirna
00050000-56aa-3a50-1c4f-bb5c9352870c	8216	Mirna Peč
00050000-56aa-3a50-37f0-080150be5337	2382	Mislinja
00050000-56aa-3a50-1f2a-7b27db7a41db	4281	Mojstrana
00050000-56aa-3a50-cd32-5e6b6fb32f70	8230	Mokronog
00050000-56aa-3a50-417d-c48989a68a81	1251	Moravče
00050000-56aa-3a50-84de-0b40ed4b9b14	9226	Moravske Toplice
00050000-56aa-3a50-40a1-d016e2a146f5	5216	Most na Soči
00050000-56aa-3a50-2d2e-495e55c85a36	1221	Motnik
00050000-56aa-3a50-cc31-66562dc60122	3330	Mozirje
00050000-56aa-3a50-12e0-bf5c4386a7b6	9000	Murska Sobota 
00050000-56aa-3a50-f49f-e49cb00da929	9001	Murska Sobota - poštni predali
00050000-56aa-3a50-fefe-844a6915d677	2366	Muta
00050000-56aa-3a50-c857-4313369f35c4	4202	Naklo
00050000-56aa-3a50-5fd9-a79e4fbb25ef	3331	Nazarje
00050000-56aa-3a50-d276-40fc2672f9c3	1357	Notranje Gorice
00050000-56aa-3a50-a1ce-89eabebb4148	3203	Nova Cerkev
00050000-56aa-3a50-c4ba-13228b575c5e	5000	Nova Gorica 
00050000-56aa-3a50-38b4-0bb897326bb9	5001	Nova Gorica - poštni predali
00050000-56aa-3a50-93e3-1b182b174279	1385	Nova vas
00050000-56aa-3a50-ed3b-2255fcb44518	8000	Novo mesto
00050000-56aa-3a50-2d58-c8373bda849f	8001	Novo mesto - poštni predali
00050000-56aa-3a50-2f48-0ff90b877725	6243	Obrov
00050000-56aa-3a50-5940-bfe3fcac03ae	9233	Odranci
00050000-56aa-3a50-58fe-6de8984ae909	2317	Oplotnica
00050000-56aa-3a50-2e2a-41f951c53b6b	2312	Orehova vas
00050000-56aa-3a50-c1a6-3151b69d6986	2270	Ormož
00050000-56aa-3a50-8284-825d152b21e6	1316	Ortnek
00050000-56aa-3a50-9b5b-3dbfb412e6d1	1337	Osilnica
00050000-56aa-3a50-63c2-26685cc36313	8222	Otočec
00050000-56aa-3a50-31dc-5388a83faf7f	2361	Ožbalt
00050000-56aa-3a50-d39e-7f68f5092ed7	2231	Pernica
00050000-56aa-3a50-af53-03d14bad18c6	2211	Pesnica pri Mariboru
00050000-56aa-3a50-05a6-da1619884f84	9203	Petrovci
00050000-56aa-3a50-55b9-db0cd2feedbc	3301	Petrovče
00050000-56aa-3a50-3e0b-fe06f672c85a	6330	Piran/Pirano
00050000-56aa-3a50-fedc-a4048d625704	8255	Pišece
00050000-56aa-3a50-98fd-db46eb8f5335	6257	Pivka
00050000-56aa-3a50-00d2-6dcd4c90135e	6232	Planina
00050000-56aa-3a50-466a-675b7d77b3d5	3225	Planina pri Sevnici
00050000-56aa-3a50-f8f5-999e9d05b8d5	6276	Pobegi
00050000-56aa-3a50-43a1-3fcbe7fc7632	8312	Podbočje
00050000-56aa-3a50-d4a2-87030fe14c28	5243	Podbrdo
00050000-56aa-3a50-98e7-82142c0d82ee	3254	Podčetrtek
00050000-56aa-3a50-cc9f-5bd0300ad6f5	2273	Podgorci
00050000-56aa-3a50-0c20-6540e863bdaa	6216	Podgorje
00050000-56aa-3a50-fd7b-fb2517e33283	2381	Podgorje pri Slovenj Gradcu
00050000-56aa-3a50-994a-57efb3961c99	6244	Podgrad
00050000-56aa-3a50-809f-04cdcda952dc	1414	Podkum
00050000-56aa-3a50-5954-55d6b5c364e2	2286	Podlehnik
00050000-56aa-3a50-8373-0dc20785a111	5272	Podnanos
00050000-56aa-3a50-924c-3fe4381e485f	4244	Podnart
00050000-56aa-3a50-aaaf-85fbc72cddc6	3241	Podplat
00050000-56aa-3a50-0a3e-6d147e0a5f35	3257	Podsreda
00050000-56aa-3a50-f510-cb9486c39f66	2363	Podvelka
00050000-56aa-3a50-94b8-ef883ae91f79	2208	Pohorje
00050000-56aa-3a50-a856-09b620e72c1a	2257	Polenšak
00050000-56aa-3a50-d158-27008dd6c81c	1355	Polhov Gradec
00050000-56aa-3a50-4c2d-54dd96570ba2	4223	Poljane nad Škofjo Loko
00050000-56aa-3a50-ffe8-64e063cfedbd	2319	Poljčane
00050000-56aa-3a50-05c1-4bfa3de3a2f8	1272	Polšnik
00050000-56aa-3a50-de9a-43f829fbf01f	3313	Polzela
00050000-56aa-3a50-0ee5-b09378c9ad7c	3232	Ponikva
00050000-56aa-3a50-f271-e5d027f7700e	6320	Portorož/Portorose
00050000-56aa-3a50-8881-78b36411a1e2	6230	Postojna
00050000-56aa-3a50-6936-eac9222d7ec5	2331	Pragersko
00050000-56aa-3a50-5a8f-ac79bd1f7d24	3312	Prebold
00050000-56aa-3a50-c70b-457794350c10	4205	Preddvor
00050000-56aa-3a50-3d51-edf840116b8e	6255	Prem
00050000-56aa-3a50-83c7-f3b54238e4e1	1352	Preserje
00050000-56aa-3a50-d3e2-ba23369587ff	6258	Prestranek
00050000-56aa-3a50-7806-aca6dac91846	2391	Prevalje
00050000-56aa-3a50-da2c-03478b6ce63f	3262	Prevorje
00050000-56aa-3a50-2d7f-6d8d850af2c0	1276	Primskovo 
00050000-56aa-3a50-85c0-7c140f6ab839	3253	Pristava pri Mestinju
00050000-56aa-3a50-63ab-b5e054c402ff	9207	Prosenjakovci/Partosfalva
00050000-56aa-3a50-2efc-249ae91ae127	5297	Prvačina
00050000-56aa-3a50-ed70-c726f510e5b1	2250	Ptuj
00050000-56aa-3a50-d23f-8271df4e0f8f	2323	Ptujska Gora
00050000-56aa-3a50-7c61-68a02cd30e84	9201	Puconci
00050000-56aa-3a50-5870-81787505cf20	2327	Rače
00050000-56aa-3a50-c0a5-9e7a0cce9d8f	1433	Radeče
00050000-56aa-3a50-b78a-a9accbabdff3	9252	Radenci
00050000-56aa-3a50-62fb-1e252424bc7b	2360	Radlje ob Dravi
00050000-56aa-3a50-4c7b-af7239ad4a4b	1235	Radomlje
00050000-56aa-3a50-c636-1de532190ed2	4240	Radovljica
00050000-56aa-3a50-aca8-ac37f6b1b6da	8274	Raka
00050000-56aa-3a50-ed6f-f22daf2d256d	1381	Rakek
00050000-56aa-3a50-0203-7d0067ac53b3	4283	Rateče - Planica
00050000-56aa-3a50-c3dd-080974e954fc	2390	Ravne na Koroškem
00050000-56aa-3a50-9056-e153d177ba1c	9246	Razkrižje
00050000-56aa-3a50-8cb5-970047930ca1	3332	Rečica ob Savinji
00050000-56aa-3a50-770a-6fbf9104a6a0	5292	Renče
00050000-56aa-3a50-b609-e26761c6e9a9	1310	Ribnica
00050000-56aa-3a50-95e9-ba8d69a1b906	2364	Ribnica na Pohorju
00050000-56aa-3a50-f952-300354afa7d5	3272	Rimske Toplice
00050000-56aa-3a50-d910-8ab64eb20c15	1314	Rob
00050000-56aa-3a50-e270-f7e2f79f3af0	5215	Ročinj
00050000-56aa-3a50-f74e-e78133176811	3250	Rogaška Slatina
00050000-56aa-3a50-072e-7f9399fd5d9e	9262	Rogašovci
00050000-56aa-3a50-54e1-9a7ebed82469	3252	Rogatec
00050000-56aa-3a50-9cf2-140a87c6d86e	1373	Rovte
00050000-56aa-3a50-f5ba-5c0ab56261c2	2342	Ruše
00050000-56aa-3a50-70ec-d7849d2e01c9	1282	Sava
00050000-56aa-3a50-45f2-117a7eeff923	6333	Sečovlje/Sicciole
00050000-56aa-3a50-f304-d752ebdf4b26	4227	Selca
00050000-56aa-3a50-b0b7-ea9e7c94c7e0	2352	Selnica ob Dravi
00050000-56aa-3a50-07b4-16b76925199a	8333	Semič
00050000-56aa-3a50-dc39-f48c5b3febbd	8281	Senovo
00050000-56aa-3a50-ce9c-cf21da5dc07f	6224	Senožeče
00050000-56aa-3a50-c438-069d088f2129	8290	Sevnica
00050000-56aa-3a50-7cef-16f9dc244e54	6210	Sežana
00050000-56aa-3a50-4b97-158c90631215	2214	Sladki Vrh
00050000-56aa-3a50-9fb0-eeb48e61d431	5283	Slap ob Idrijci
00050000-56aa-3a50-f29a-1d9371698c16	2380	Slovenj Gradec
00050000-56aa-3a50-2744-8662360d6b07	2310	Slovenska Bistrica
00050000-56aa-3a50-2212-20160b309bc0	3210	Slovenske Konjice
00050000-56aa-3a50-cda5-642a3d72861a	1216	Smlednik
00050000-56aa-3a50-c802-02ad3e2a55ef	5232	Soča
00050000-56aa-3a50-cd10-3710ab6f4235	1317	Sodražica
00050000-56aa-3a50-f991-2b9aee8c5927	3335	Solčava
00050000-56aa-3a50-b8de-a18deefd032c	5250	Solkan
00050000-56aa-3a50-e438-4ed6416779e3	4229	Sorica
00050000-56aa-3a50-b7ac-6fcef2a643a4	4225	Sovodenj
00050000-56aa-3a50-f433-b8db28ba569f	5281	Spodnja Idrija
00050000-56aa-3a50-6c55-7e2cf294f291	2241	Spodnji Duplek
00050000-56aa-3a50-41af-2b0a9c318a45	9245	Spodnji Ivanjci
00050000-56aa-3a50-8576-7ac5370e52fc	2277	Središče ob Dravi
00050000-56aa-3a50-d81f-d9bbeaf9d1ae	4267	Srednja vas v Bohinju
00050000-56aa-3a50-46fe-01043400dd52	8256	Sromlje 
00050000-56aa-3a50-bfc1-0e1bef2f1eb8	5224	Srpenica
00050000-56aa-3a50-80f5-473a00077975	1242	Stahovica
00050000-56aa-3a50-3355-acb00893a465	1332	Stara Cerkev
00050000-56aa-3a50-72ef-e87fe3093604	8342	Stari trg ob Kolpi
00050000-56aa-3a50-8405-1202720f8f3c	1386	Stari trg pri Ložu
00050000-56aa-3a50-f4d9-2dd91411301c	2205	Starše
00050000-56aa-3a50-fc84-94edf6401e30	2289	Stoperce
00050000-56aa-3a50-35d5-10c090a40846	8322	Stopiče
00050000-56aa-3a50-f576-cbf70afcaa24	3206	Stranice
00050000-56aa-3a50-f627-027a97f525c0	8351	Straža
00050000-56aa-3a50-a25e-7ecca3ebdc44	1313	Struge
00050000-56aa-3a50-4b09-ef6d5286c67b	8293	Studenec
00050000-56aa-3a50-9bf0-ff5b22404ac3	8331	Suhor
00050000-56aa-3a50-718a-6fc017f462d9	2233	Sv. Ana v Slovenskih goricah
00050000-56aa-3a50-ed89-cfd2798fbbec	2235	Sv. Trojica v Slovenskih goricah
00050000-56aa-3a50-5d29-8c187986f057	2353	Sveti Duh na Ostrem Vrhu
00050000-56aa-3a50-4084-1fd34f1a21ff	9244	Sveti Jurij ob Ščavnici
00050000-56aa-3a50-e994-6e569fceefef	3264	Sveti Štefan
00050000-56aa-3a50-e4f0-7d0a461a007a	2258	Sveti Tomaž
00050000-56aa-3a50-2ecc-70e7a08297e9	9204	Šalovci
00050000-56aa-3a50-f6a8-8d0af9552c12	5261	Šempas
00050000-56aa-3a50-3974-5f2aa9cb1318	5290	Šempeter pri Gorici
00050000-56aa-3a50-2bdf-f87e52753044	3311	Šempeter v Savinjski dolini
00050000-56aa-3a50-08fe-c1e4719e4840	4208	Šenčur
00050000-56aa-3a50-3b55-a704712a97b5	2212	Šentilj v Slovenskih goricah
00050000-56aa-3a50-793f-ba5d540ffb88	8297	Šentjanž
00050000-56aa-3a50-be50-732f5da61466	2373	Šentjanž pri Dravogradu
00050000-56aa-3a50-7779-442b17a6f781	8310	Šentjernej
00050000-56aa-3a50-e6c4-a4cf981f6307	3230	Šentjur
00050000-56aa-3a50-a2fa-ad166d3bdbba	3271	Šentrupert
00050000-56aa-3a50-a590-f84411f63983	8232	Šentrupert
00050000-56aa-3a50-a9a0-2a5e2d341dd2	1296	Šentvid pri Stični
00050000-56aa-3a50-a061-249bcec5d015	8275	Škocjan
00050000-56aa-3a50-07e9-5a39c5ce7e64	6281	Škofije
00050000-56aa-3a50-066e-3c4a40dba22b	4220	Škofja Loka
00050000-56aa-3a50-ec02-22b65cdb06c8	3211	Škofja vas
00050000-56aa-3a50-057f-ca60b4ad70bb	1291	Škofljica
00050000-56aa-3a50-89ab-57c7a239b092	6274	Šmarje
00050000-56aa-3a50-0e9b-9885837cf7ae	1293	Šmarje - Sap
00050000-56aa-3a50-2661-d415ac507e5a	3240	Šmarje pri Jelšah
00050000-56aa-3a50-17a9-35dde0d3bd4a	8220	Šmarješke Toplice
00050000-56aa-3a50-cd12-0c2fe4aedc81	2315	Šmartno na Pohorju
00050000-56aa-3a50-d2f1-9e79df5ddf45	3341	Šmartno ob Dreti
00050000-56aa-3a50-429f-1246c4a6f023	3327	Šmartno ob Paki
00050000-56aa-3a50-c3dd-5f63d2f4f0e1	1275	Šmartno pri Litiji
00050000-56aa-3a50-c7cf-79b25f2995f9	2383	Šmartno pri Slovenj Gradcu
00050000-56aa-3a50-ba42-5fe0d765469b	3201	Šmartno v Rožni dolini
00050000-56aa-3a50-74c9-42f72ab286a1	3325	Šoštanj
00050000-56aa-3a50-fa4e-f203215e39a8	6222	Štanjel
00050000-56aa-3a50-a351-938246f7af14	3220	Štore
00050000-56aa-3a50-2647-5acb975876e8	3304	Tabor
00050000-56aa-3a50-b767-5d1eed7e25c6	3221	Teharje
00050000-56aa-3a50-5129-c072848baec6	9251	Tišina
00050000-56aa-3a50-0c38-542724a6a8d5	5220	Tolmin
00050000-56aa-3a50-594f-7cb2a485c02f	3326	Topolšica
00050000-56aa-3a50-70e9-60f5e4bac994	2371	Trbonje
00050000-56aa-3a50-7cd8-a31ecaf5186d	1420	Trbovlje
00050000-56aa-3a50-7828-82b520796dfc	8231	Trebelno 
00050000-56aa-3a50-e999-47e90fa5827a	8210	Trebnje
00050000-56aa-3a50-8c2c-a16a13c10787	5252	Trnovo pri Gorici
00050000-56aa-3a50-2367-1d1381004ae7	2254	Trnovska vas
00050000-56aa-3a50-176b-eb657d1aee7a	1222	Trojane
00050000-56aa-3a50-7c75-133468362d50	1236	Trzin
00050000-56aa-3a50-9c5f-86f3abf8633c	4290	Tržič
00050000-56aa-3a50-5169-0bae7ee5c190	8295	Tržišče
00050000-56aa-3a50-7a15-ac88b3e16008	1311	Turjak
00050000-56aa-3a50-87d3-c314c7b7174c	9224	Turnišče
00050000-56aa-3a50-3c0d-b216537ae895	8323	Uršna sela
00050000-56aa-3a50-a803-f1b5e3006c86	1252	Vače
00050000-56aa-3a50-6ea1-5067bbe8d05f	3320	Velenje 
00050000-56aa-3a50-f057-7e6dd25828f7	3322	Velenje - poštni predali
00050000-56aa-3a50-e7c9-102d3c7151c9	8212	Velika Loka
00050000-56aa-3a50-91b2-5af8e45f3679	2274	Velika Nedelja
00050000-56aa-3a50-dcb2-52e343d863cc	9225	Velika Polana
00050000-56aa-3a50-4d1f-0584dfa1e4bf	1315	Velike Lašče
00050000-56aa-3a50-658d-7dfbe1f4e2d8	8213	Veliki Gaber
00050000-56aa-3a50-b498-03f3c1f060d1	9241	Veržej
00050000-56aa-3a50-7f9b-c7f21a974e68	1312	Videm - Dobrepolje
00050000-56aa-3a50-6ad8-ee7856ebe229	2284	Videm pri Ptuju
00050000-56aa-3a50-e963-2e05e5c0f5b6	8344	Vinica
00050000-56aa-3a50-fa69-1d4993cb19ee	5271	Vipava
00050000-56aa-3a50-bc48-45102ee3e934	4212	Visoko
00050000-56aa-3a50-2d5b-b325d6932423	1294	Višnja Gora
00050000-56aa-3a50-b218-62e7da8940df	3205	Vitanje
00050000-56aa-3a50-6e00-cd001994b360	2255	Vitomarci
00050000-56aa-3a50-8aa2-50847b582cf8	1217	Vodice
00050000-56aa-3a50-8eb5-fee77cc30389	3212	Vojnik\t
00050000-56aa-3a50-5cba-a2a99bf03a04	5293	Volčja Draga
00050000-56aa-3a50-8b98-bc6a4a80f441	2232	Voličina
00050000-56aa-3a50-fd29-7038224031e3	3305	Vransko
00050000-56aa-3a50-8713-6c9333468ceb	6217	Vremski Britof
00050000-56aa-3a50-75ee-b1bb7ef1293a	1360	Vrhnika
00050000-56aa-3a50-dc10-46c14ba18fd2	2365	Vuhred
00050000-56aa-3a50-6459-02c9def56412	2367	Vuzenica
00050000-56aa-3a50-bd24-06c1274afdc6	8292	Zabukovje 
00050000-56aa-3a50-8b94-fde86df36bf7	1410	Zagorje ob Savi
00050000-56aa-3a50-3f0a-1e0f0a907401	1303	Zagradec
00050000-56aa-3a50-8d90-782a30ba650f	2283	Zavrč
00050000-56aa-3a50-582a-5411aa26bbaf	8272	Zdole 
00050000-56aa-3a50-2c47-fd499343796b	4201	Zgornja Besnica
00050000-56aa-3a50-affc-4005f59effb8	2242	Zgornja Korena
00050000-56aa-3a50-cb5d-61027afca0f7	2201	Zgornja Kungota
00050000-56aa-3a50-154a-9b67094e180e	2316	Zgornja Ložnica
00050000-56aa-3a50-45c8-5f30c4846277	2314	Zgornja Polskava
00050000-56aa-3a50-f989-cf37c5d34bd2	2213	Zgornja Velka
00050000-56aa-3a50-c33a-e6b5c11c3837	4247	Zgornje Gorje
00050000-56aa-3a50-af1d-07e63076df95	4206	Zgornje Jezersko
00050000-56aa-3a50-40fe-1f9e5f51239b	2285	Zgornji Leskovec
00050000-56aa-3a50-b4b8-117fa2e9d6d4	1432	Zidani Most
00050000-56aa-3a50-5109-941bdcd27834	3214	Zreče
00050000-56aa-3a50-1a3b-468a50042400	4209	Žabnica
00050000-56aa-3a50-9ca5-b8cb506cf43d	3310	Žalec
00050000-56aa-3a50-bc64-4e4d727c3091	4228	Železniki
00050000-56aa-3a50-e821-337b2581ea84	2287	Žetale
00050000-56aa-3a50-0791-dde030d3a00b	4226	Žiri
00050000-56aa-3a50-fc08-26a54425be56	4274	Žirovnica
00050000-56aa-3a50-4eff-54d4c279fbf0	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 41515199)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 41514769)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 41514509)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56aa-3a54-5127-1c613d2d51b9	00080000-56aa-3a53-374d-9b77b08e0f61	\N	00040000-56aa-3a51-5622-033d9d68b978	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56aa-3a54-d32b-199a39099268	00080000-56aa-3a53-374d-9b77b08e0f61	\N	00040000-56aa-3a51-5622-033d9d68b978	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56aa-3a54-60ff-8b176536b78b	00080000-56aa-3a53-8b20-14ddd9c73e49	\N	00040000-56aa-3a51-5622-033d9d68b978	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 41514644)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56aa-3a51-1432-82f6cf7f23be	novo leto	1	1	\N	t
00430000-56aa-3a51-3fa2-d54fe5a2b1a5	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56aa-3a51-b63f-d4a29dbfe7da	dan upora proti okupatorju	27	4	\N	t
00430000-56aa-3a51-f9bb-475896156189	praznik dela	1	5	\N	t
00430000-56aa-3a51-ae32-8bd1c43fb727	praznik dela	2	5	\N	t
00430000-56aa-3a51-e8df-ce3521112bf4	dan Primoža Trubarja	8	6	\N	f
00430000-56aa-3a51-dfdf-56c05ddc2680	dan državnosti	25	6	\N	t
00430000-56aa-3a51-b34c-6e22ca842b22	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56aa-3a51-4448-7d44e0b262b1	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56aa-3a51-3609-7dd44cf15eb0	dan suverenosti	25	10	\N	f
00430000-56aa-3a51-d903-5e63078049a5	dan spomina na mrtve	1	11	\N	t
00430000-56aa-3a51-bed9-dfac6ab6cbe4	dan Rudolfa Maistra	23	11	\N	f
00430000-56aa-3a51-7bde-86e6377eac49	božič	25	12	\N	t
00430000-56aa-3a51-d27b-9cfaf799c51d	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56aa-3a51-b947-398c756d2cff	Marijino vnebovzetje	15	8	\N	t
00430000-56aa-3a51-e293-b86a0b6963bd	dan reformacije	31	10	\N	t
00430000-56aa-3a51-3c92-c6a269af6411	velikonočna nedelja	27	3	2016	t
00430000-56aa-3a51-a0da-5b830995a6b0	velikonočna nedelja	16	4	2017	t
00430000-56aa-3a51-c02a-11fe219bb977	velikonočna nedelja	1	4	2018	t
00430000-56aa-3a51-c0d5-4bd3e3d5782c	velikonočna nedelja	21	4	2019	t
00430000-56aa-3a51-bffe-6b7b1e00838a	velikonočna nedelja	12	4	2020	t
00430000-56aa-3a51-343b-9077fc6d9d77	velikonočna nedelja	4	4	2021	t
00430000-56aa-3a51-d158-d02b0fb365f5	velikonočna nedelja	17	4	2022	t
00430000-56aa-3a51-5406-684719979be4	velikonočna nedelja	9	4	2023	t
00430000-56aa-3a51-f63c-1f868c355bf4	velikonočna nedelja	31	3	2024	t
00430000-56aa-3a51-0210-d92d6850f8a8	velikonočna nedelja	20	4	2025	t
00430000-56aa-3a51-b438-22e96538f7ac	velikonočna nedelja	5	4	2026	t
00430000-56aa-3a51-28d6-3fda9c9cb261	velikonočna nedelja	28	3	2027	t
00430000-56aa-3a51-c574-207425ff60c2	velikonočna nedelja	16	4	2028	t
00430000-56aa-3a51-5269-63047eef604c	velikonočna nedelja	1	4	2029	t
00430000-56aa-3a51-7f07-dead39a4775d	velikonočna nedelja	21	4	2030	t
00430000-56aa-3a51-b2dc-f86d7d9b552c	velikonočni ponedeljek	28	3	2016	t
00430000-56aa-3a51-16ca-684d0ee0f85c	velikonočni ponedeljek	17	4	2017	t
00430000-56aa-3a51-1a77-005db54b05ce	velikonočni ponedeljek	2	4	2018	t
00430000-56aa-3a51-852e-bbca0b6f1cab	velikonočni ponedeljek	22	4	2019	t
00430000-56aa-3a51-6d37-85e91ff573bb	velikonočni ponedeljek	13	4	2020	t
00430000-56aa-3a51-dbfb-89c0da64a0b4	velikonočni ponedeljek	5	4	2021	t
00430000-56aa-3a51-52df-12fab498337f	velikonočni ponedeljek	18	4	2022	t
00430000-56aa-3a51-a516-226592d97dd9	velikonočni ponedeljek	10	4	2023	t
00430000-56aa-3a51-ade5-8b2eca25c1ab	velikonočni ponedeljek	1	4	2024	t
00430000-56aa-3a51-e74f-2c4dd6ce250e	velikonočni ponedeljek	21	4	2025	t
00430000-56aa-3a51-5512-6da1b9f46c22	velikonočni ponedeljek	6	4	2026	t
00430000-56aa-3a51-9ece-090c52903963	velikonočni ponedeljek	29	3	2027	t
00430000-56aa-3a51-8117-1d488d536313	velikonočni ponedeljek	17	4	2028	t
00430000-56aa-3a51-d84f-a937b16f1bd2	velikonočni ponedeljek	2	4	2029	t
00430000-56aa-3a51-2c15-5482ba7e4a2e	velikonočni ponedeljek	22	4	2030	t
00430000-56aa-3a51-39ae-574a5a78a990	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56aa-3a51-0d15-d0ea44b6442a	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56aa-3a51-d0b7-9bf7e3bfc092	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56aa-3a51-4e7e-330dc44b13f9	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56aa-3a51-8470-3b2e2c33b919	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56aa-3a51-cd72-3d8213ad0754	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56aa-3a51-c58d-0e629be9db7d	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56aa-3a51-2547-675538bac1bc	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56aa-3a51-c331-de006979a34f	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56aa-3a51-6786-b161a64506d1	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56aa-3a51-d3cd-607b645051c7	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56aa-3a51-0ace-a1a7b224ce41	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56aa-3a51-03ce-295a67407d52	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56aa-3a51-3f6f-f662a5812ca1	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56aa-3a51-ad9b-809d721d6971	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 41514613)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56aa-3a54-fcdb-d129975e6507	000e0000-56aa-3a54-c020-82cc8ce74d27	1	1	\N
001b0000-56aa-3a54-ef55-ca3bcb7f88d0	000e0000-56aa-3a54-c020-82cc8ce74d27	1	2	\N
001b0000-56aa-3a54-bdca-5d8998d46a30	000e0000-56aa-3a54-c020-82cc8ce74d27	1	3	1
001b0000-56aa-3a54-17da-deabe112571a	000e0000-56aa-3a54-c020-82cc8ce74d27	2	4	2
001b0000-56aa-3a54-a8b5-84466f5c1274	000e0000-56aa-3a54-c020-82cc8ce74d27	4	5	3
001b0000-56aa-3a54-8d61-5a8ba23b091b	000e0000-56aa-3a54-503e-78cf94f81c2f	1	1	\N
001b0000-56aa-3a54-134d-6a2a2d70da5c	000e0000-56aa-3a54-503e-78cf94f81c2f	3	2	1
001b0000-56aa-3a54-d2a0-f1d5650126fa	000e0000-56aa-3a54-503e-78cf94f81c2f	1	5	1
001b0000-56aa-3a54-9571-bd1be6df4373	000e0000-56aa-3a54-c020-82cc8ce74d27	1	6	1
001b0000-56aa-3a54-79b9-24903315c229	000e0000-56aa-3a54-c020-82cc8ce74d27	2	7	2
001b0000-56aa-3a54-892e-f7085f9212a1	000e0000-56aa-3a54-c020-82cc8ce74d27	5	9	4
001b0000-56aa-3a54-2998-454d880c7a61	000e0000-56aa-3a54-c020-82cc8ce74d27	7	10	5
001b0000-56aa-3a54-8205-214c21befede	000e0000-56aa-3a54-503e-78cf94f81c2f	4	3	1
001b0000-56aa-3a54-5ef5-5d05bd119efc	000e0000-56aa-3a54-c020-82cc8ce74d27	3	8	3
001b0000-56aa-3a54-50d0-fc5cb2439dca	000e0000-56aa-3a54-c020-82cc8ce74d27	2	11	1
001b0000-56aa-3a54-fbf4-77bf76a70ec3	000e0000-56aa-3a54-503e-78cf94f81c2f	6	4	2
\.


--
-- TOC entry 3161 (class 0 OID 41514619)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56aa-3a54-bdca-5d8998d46a30	000a0000-56aa-3a53-8464-4cf910e3ddd4
001b0000-56aa-3a54-bdca-5d8998d46a30	000a0000-56aa-3a53-c592-6ea1901c12b7
001b0000-56aa-3a54-17da-deabe112571a	000a0000-56aa-3a53-c592-6ea1901c12b7
001b0000-56aa-3a54-17da-deabe112571a	000a0000-56aa-3a53-9560-fd3109a6a506
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 41514781)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 41515213)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 41515223)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56aa-3a54-0957-6d1e02199aad	00080000-56aa-3a53-dce7-3ea2877b653d	0987	AK
00190000-56aa-3a54-10c4-46c5fb9bd787	00080000-56aa-3a53-8b20-14ddd9c73e49	0989	AK
00190000-56aa-3a54-a0d7-024ab1324a08	00080000-56aa-3a53-24c2-2737d357402b	0986	AK
00190000-56aa-3a54-f90a-be6840ca945c	00080000-56aa-3a53-9261-ec0ca6525d47	0984	AK
00190000-56aa-3a54-5353-0504198dfc35	00080000-56aa-3a53-9654-8381dc3e47de	0983	AK
00190000-56aa-3a54-5e69-f09f57a4e1b5	00080000-56aa-3a53-add1-a20885c0c322	0982	AK
00190000-56aa-3a56-a70f-22acda96d7b2	00080000-56aa-3a56-83f4-97ad5f0c8e00	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 41515112)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56aa-3a54-6384-10c17d077204	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 41515231)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 41514809)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56aa-3a53-bd63-a4e8c117b4de	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56aa-3a53-1a61-e971756ee092	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56aa-3a53-9ba2-cbbc1e8760f6	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56aa-3a53-0c25-40add6874632	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56aa-3a53-2779-fdd235dd9371	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56aa-3a53-008e-33c3e10d5cc5	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56aa-3a53-8573-fe9a7a18b4fd	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 41514754)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 41514744)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 41514951)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 41514881)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 41514587)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 41514348)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56aa-3a56-83f4-97ad5f0c8e00	00010000-56aa-3a52-e087-7833ed9688e7	2016-01-28 16:57:10	INS	a:0:{}
2	App\\Entity\\Option	00000000-56aa-3a56-7761-4c8c840a1078	00010000-56aa-3a52-e087-7833ed9688e7	2016-01-28 16:57:10	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56aa-3a56-a70f-22acda96d7b2	00010000-56aa-3a52-e087-7833ed9688e7	2016-01-28 16:57:10	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 41514823)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 41514386)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56aa-3a51-1269-10ae3f750eb7	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56aa-3a51-2e21-4f6d0025baaf	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56aa-3a51-8d84-ae5e195ddcc3	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56aa-3a51-7560-306828f78c18	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56aa-3a51-f692-0846eca58cb4	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56aa-3a51-974c-bde96b5d1a64	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56aa-3a51-4b27-97e303bbef99	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56aa-3a51-60cd-884304943597	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56aa-3a51-c992-392151ec5686	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56aa-3a51-4885-841aa21585e6	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56aa-3a51-79c6-6cdaeffb8a4b	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56aa-3a51-b7ef-638855c02312	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56aa-3a51-beaa-a50df75e57d9	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56aa-3a51-6b54-55c23d362740	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56aa-3a51-ad7e-53b95db1cde5	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56aa-3a51-9f63-dd21378056bb	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56aa-3a51-eda4-b18099a82287	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56aa-3a51-5a48-71d062f5bd6b	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56aa-3a51-027f-5e09262bde0f	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56aa-3a51-5410-365a75b02674	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56aa-3a51-19ef-98ad34427ab5	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56aa-3a51-8d3b-7382d59c0249	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56aa-3a51-d6b7-07f02d6deb1a	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56aa-3a51-1707-aba0c0a08a79	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56aa-3a51-9f15-ad43c80d50a9	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56aa-3a51-5e88-27f94a2ebc78	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56aa-3a51-4d98-6661d71ca339	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56aa-3a51-cc5a-eab8fe39707f	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56aa-3a51-2ea8-609bb815bf04	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56aa-3a51-91ad-423a668ef949	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56aa-3a51-f081-0aa22ac72822	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56aa-3a51-d884-aa4bcad03f5c	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56aa-3a51-4ed9-176b87366554	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56aa-3a51-3b75-8db503a64d64	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56aa-3a51-c13e-c7a52955f21a	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56aa-3a51-c27d-e93439f33ec4	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56aa-3a51-323f-db41a9a721f0	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56aa-3a51-90bf-622440c8511c	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56aa-3a51-1aca-baf2708a6552	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56aa-3a51-0fc2-a8851a24c69e	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56aa-3a51-b2c4-7528278781bf	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56aa-3a51-ea68-55b62394f276	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56aa-3a51-a575-db0d11e6545b	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56aa-3a51-5bd3-5af5c36e8eb0	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56aa-3a51-14ef-edb1671fa4ed	direktor	minimalne pravice za direktorja	t
00020000-56aa-3a51-74b2-b55f75a40b23	arhivar	arhivar	t
00020000-56aa-3a51-5d34-dcd226e907f5	dramaturg	dramaturg	t
00020000-56aa-3a51-eea8-bb8e23a41761	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56aa-3a51-2b1c-4533c357208a	poslovni-sekretar	poslovni sekretar	t
00020000-56aa-3a51-d21c-aa8d07f18e32	vodja-tehnike	vodja tehnike	t
00020000-56aa-3a52-6e85-6b27515074cf	racunovodja	računovodja	t
00020000-56aa-3a53-feb0-b7408d6fd28b	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56aa-3a53-36d5-496b2d91788d	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-cdf5-43fa4f8d194c	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-ccf7-3a60cac2b7f0	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-b64c-e440017a73ea	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-1a93-7034d44d1f6e	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-3d4d-cb6283d00309	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-404a-3d0d0251d102	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-b30f-90cc8625e050	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-b3f4-636dd03e8421	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-3c90-a4f0e2d79bcc	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-f224-a6cd4070fede	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-d53e-bba2c7f038e6	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-f77d-0609a821add6	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-3d92-982eb13ef1f5	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-f103-f275ca30aee3	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-fb48-111dc8b7bb5d	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-7f21-3264418afcd8	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-dbda-76bfedb478a3	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-84bd-1a9dc6d15610	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56aa-3a53-6a75-a73def6a5768	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-6895-1427a9ecb8a1	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-f350-69adf6135deb	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-f21c-8c313aa6f3e2	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-cc22-c20bbf7b58c0	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-dc4b-0013dd59b609	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-4d92-124dc068c747	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-d07a-6d63c38d6148	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-5bf0-f60d11b117ef	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-d69b-506afe7442a3	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-cb78-22f48d09ba9e	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-60c8-a467f83e674c	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-9b21-98d7611300b2	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-7cd1-6bc040b9161f	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-305a-18c5539cc321	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-5394-0dda362364e3	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-b472-45ab9ac75dda	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-f181-10d2a002a779	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56aa-3a53-0583-4ea6e255875b	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 41514370)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56aa-3a52-e969-afaca0a5ff5c	00020000-56aa-3a51-8d84-ae5e195ddcc3
00010000-56aa-3a52-e087-7833ed9688e7	00020000-56aa-3a51-8d84-ae5e195ddcc3
00010000-56aa-3a53-3afa-0f27f2b8bfea	00020000-56aa-3a53-feb0-b7408d6fd28b
00010000-56aa-3a53-1012-9abba5d81785	00020000-56aa-3a53-36d5-496b2d91788d
00010000-56aa-3a53-1012-9abba5d81785	00020000-56aa-3a53-1a93-7034d44d1f6e
00010000-56aa-3a53-1012-9abba5d81785	00020000-56aa-3a53-b3f4-636dd03e8421
00010000-56aa-3a53-1012-9abba5d81785	00020000-56aa-3a53-f224-a6cd4070fede
00010000-56aa-3a53-1012-9abba5d81785	00020000-56aa-3a53-f77d-0609a821add6
00010000-56aa-3a53-1012-9abba5d81785	00020000-56aa-3a53-dbda-76bfedb478a3
00010000-56aa-3a53-1012-9abba5d81785	00020000-56aa-3a53-ccf7-3a60cac2b7f0
00010000-56aa-3a53-1012-9abba5d81785	00020000-56aa-3a53-6a75-a73def6a5768
00010000-56aa-3a53-1012-9abba5d81785	00020000-56aa-3a53-f21c-8c313aa6f3e2
00010000-56aa-3a53-1012-9abba5d81785	00020000-56aa-3a53-dc4b-0013dd59b609
00010000-56aa-3a53-1012-9abba5d81785	00020000-56aa-3a53-d07a-6d63c38d6148
00010000-56aa-3a53-1012-9abba5d81785	00020000-56aa-3a53-d69b-506afe7442a3
00010000-56aa-3a53-1012-9abba5d81785	00020000-56aa-3a53-7cd1-6bc040b9161f
00010000-56aa-3a54-7be9-d9dc08b9a8f1	00020000-56aa-3a53-36d5-496b2d91788d
00010000-56aa-3a54-7be9-d9dc08b9a8f1	00020000-56aa-3a53-cdf5-43fa4f8d194c
00010000-56aa-3a54-7be9-d9dc08b9a8f1	00020000-56aa-3a53-ccf7-3a60cac2b7f0
00010000-56aa-3a54-7be9-d9dc08b9a8f1	00020000-56aa-3a53-b64c-e440017a73ea
00010000-56aa-3a54-7be9-d9dc08b9a8f1	00020000-56aa-3a53-f77d-0609a821add6
00010000-56aa-3a54-7be9-d9dc08b9a8f1	00020000-56aa-3a53-fb48-111dc8b7bb5d
00010000-56aa-3a54-7be9-d9dc08b9a8f1	00020000-56aa-3a53-6a75-a73def6a5768
00010000-56aa-3a54-7be9-d9dc08b9a8f1	00020000-56aa-3a53-f21c-8c313aa6f3e2
00010000-56aa-3a54-7be9-d9dc08b9a8f1	00020000-56aa-3a53-dc4b-0013dd59b609
00010000-56aa-3a54-7be9-d9dc08b9a8f1	00020000-56aa-3a53-d07a-6d63c38d6148
00010000-56aa-3a54-7be9-d9dc08b9a8f1	00020000-56aa-3a53-d69b-506afe7442a3
00010000-56aa-3a54-7be9-d9dc08b9a8f1	00020000-56aa-3a53-7cd1-6bc040b9161f
00010000-56aa-3a54-3122-fbf30cb6dead	00020000-56aa-3a53-36d5-496b2d91788d
00010000-56aa-3a54-3122-fbf30cb6dead	00020000-56aa-3a53-cdf5-43fa4f8d194c
00010000-56aa-3a54-3122-fbf30cb6dead	00020000-56aa-3a53-ccf7-3a60cac2b7f0
00010000-56aa-3a54-3122-fbf30cb6dead	00020000-56aa-3a53-b64c-e440017a73ea
00010000-56aa-3a54-3122-fbf30cb6dead	00020000-56aa-3a53-f224-a6cd4070fede
00010000-56aa-3a54-3122-fbf30cb6dead	00020000-56aa-3a53-f77d-0609a821add6
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-cdf5-43fa4f8d194c
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-3d4d-cb6283d00309
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-3c90-a4f0e2d79bcc
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-d53e-bba2c7f038e6
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-f224-a6cd4070fede
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-7f21-3264418afcd8
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-f77d-0609a821add6
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-3d92-982eb13ef1f5
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-6a75-a73def6a5768
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-6895-1427a9ecb8a1
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-f21c-8c313aa6f3e2
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-cc22-c20bbf7b58c0
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-dc4b-0013dd59b609
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-4d92-124dc068c747
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-d07a-6d63c38d6148
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-5bf0-f60d11b117ef
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-d69b-506afe7442a3
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-cb78-22f48d09ba9e
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-7cd1-6bc040b9161f
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-305a-18c5539cc321
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-b472-45ab9ac75dda
00010000-56aa-3a54-0df9-f9a7739181b8	00020000-56aa-3a53-f181-10d2a002a779
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-cdf5-43fa4f8d194c
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-3d4d-cb6283d00309
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-b30f-90cc8625e050
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-3c90-a4f0e2d79bcc
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-d53e-bba2c7f038e6
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-f224-a6cd4070fede
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-7f21-3264418afcd8
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-f77d-0609a821add6
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-3d92-982eb13ef1f5
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-f103-f275ca30aee3
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-6a75-a73def6a5768
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-6895-1427a9ecb8a1
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-f350-69adf6135deb
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-f21c-8c313aa6f3e2
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-cc22-c20bbf7b58c0
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-dc4b-0013dd59b609
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-4d92-124dc068c747
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-d07a-6d63c38d6148
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-5bf0-f60d11b117ef
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-d69b-506afe7442a3
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-cb78-22f48d09ba9e
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-7cd1-6bc040b9161f
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-305a-18c5539cc321
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-5394-0dda362364e3
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-b472-45ab9ac75dda
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-f181-10d2a002a779
00010000-56aa-3a54-da1f-5d12ac6bd699	00020000-56aa-3a53-0583-4ea6e255875b
00010000-56aa-3a54-237f-7cfab99b6404	00020000-56aa-3a53-cdf5-43fa4f8d194c
00010000-56aa-3a54-237f-7cfab99b6404	00020000-56aa-3a53-ccf7-3a60cac2b7f0
00010000-56aa-3a54-237f-7cfab99b6404	00020000-56aa-3a53-3d4d-cb6283d00309
00010000-56aa-3a54-237f-7cfab99b6404	00020000-56aa-3a53-404a-3d0d0251d102
00010000-56aa-3a54-237f-7cfab99b6404	00020000-56aa-3a53-b30f-90cc8625e050
00010000-56aa-3a54-237f-7cfab99b6404	00020000-56aa-3a53-1a93-7034d44d1f6e
00010000-56aa-3a54-237f-7cfab99b6404	00020000-56aa-3a53-3c90-a4f0e2d79bcc
00010000-56aa-3a54-237f-7cfab99b6404	00020000-56aa-3a53-d53e-bba2c7f038e6
00010000-56aa-3a54-237f-7cfab99b6404	00020000-56aa-3a53-f224-a6cd4070fede
00010000-56aa-3a54-237f-7cfab99b6404	00020000-56aa-3a53-7f21-3264418afcd8
00010000-56aa-3a54-dcdd-6a3b17fa8c5d	00020000-56aa-3a53-36d5-496b2d91788d
00010000-56aa-3a54-dcdd-6a3b17fa8c5d	00020000-56aa-3a53-b64c-e440017a73ea
00010000-56aa-3a54-dcdd-6a3b17fa8c5d	00020000-56aa-3a53-1a93-7034d44d1f6e
00010000-56aa-3a54-dcdd-6a3b17fa8c5d	00020000-56aa-3a53-b3f4-636dd03e8421
00010000-56aa-3a54-dcdd-6a3b17fa8c5d	00020000-56aa-3a53-f224-a6cd4070fede
00010000-56aa-3a54-dcdd-6a3b17fa8c5d	00020000-56aa-3a53-f77d-0609a821add6
00010000-56aa-3a54-dcdd-6a3b17fa8c5d	00020000-56aa-3a53-dbda-76bfedb478a3
00010000-56aa-3a54-dcdd-6a3b17fa8c5d	00020000-56aa-3a53-60c8-a467f83e674c
00010000-56aa-3a54-05ae-ce4e3fd3bce4	00020000-56aa-3a53-84bd-1a9dc6d15610
00010000-56aa-3a54-627b-41f3dfac7b44	00020000-56aa-3a51-14ef-edb1671fa4ed
00010000-56aa-3a54-cb7b-57d28cddadf3	00020000-56aa-3a51-74b2-b55f75a40b23
00010000-56aa-3a54-d458-7913a6ba618e	00020000-56aa-3a51-5d34-dcd226e907f5
00010000-56aa-3a54-23e9-63d66fecef2b	00020000-56aa-3a51-eea8-bb8e23a41761
00010000-56aa-3a54-c0f3-08b8ad180b08	00020000-56aa-3a51-2b1c-4533c357208a
00010000-56aa-3a54-c399-e2e0835740d7	00020000-56aa-3a51-d21c-aa8d07f18e32
00010000-56aa-3a54-35cf-faee0787c0ca	00020000-56aa-3a52-6e85-6b27515074cf
\.


--
-- TOC entry 3186 (class 0 OID 41514837)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 41514775)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 41514698)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56aa-3a53-4fcb-376593d78445	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56aa-3a53-072d-e43264bd121d	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56aa-3a53-d41a-29b6b41c3d88	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56aa-3a53-8bed-92c3087b211f	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 41514335)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56aa-3a50-5693-6ab8b96935b5	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56aa-3a50-e3ab-a4e649cba5b9	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56aa-3a50-0278-b74f715a6a87	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56aa-3a50-5466-bde5917a4120	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56aa-3a50-d4f0-3ac1d766c70a	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 41514327)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56aa-3a50-22aa-31af18772d97	00230000-56aa-3a50-5466-bde5917a4120	popa
00240000-56aa-3a50-aa03-911f80d9015b	00230000-56aa-3a50-5466-bde5917a4120	oseba
00240000-56aa-3a50-658f-bb4d35436538	00230000-56aa-3a50-5466-bde5917a4120	tippopa
00240000-56aa-3a50-d884-2c13cc59866c	00230000-56aa-3a50-5466-bde5917a4120	organizacijskaenota
00240000-56aa-3a50-9af4-cb4ac31ff864	00230000-56aa-3a50-5466-bde5917a4120	sezona
00240000-56aa-3a50-9540-b0b7ba9292ce	00230000-56aa-3a50-5466-bde5917a4120	tipvaje
00240000-56aa-3a50-b120-e1ad03a7ac51	00230000-56aa-3a50-5466-bde5917a4120	tipdodatka
00240000-56aa-3a50-8c18-c7624b958881	00230000-56aa-3a50-e3ab-a4e649cba5b9	prostor
00240000-56aa-3a50-39ba-e40e8b40591c	00230000-56aa-3a50-5466-bde5917a4120	besedilo
00240000-56aa-3a50-7140-ec77114cc8c4	00230000-56aa-3a50-5466-bde5917a4120	uprizoritev
00240000-56aa-3a50-9413-11f007e83fc1	00230000-56aa-3a50-5466-bde5917a4120	funkcija
00240000-56aa-3a50-c113-b6b58e5ba37c	00230000-56aa-3a50-5466-bde5917a4120	tipfunkcije
00240000-56aa-3a50-2bb4-506141fbda25	00230000-56aa-3a50-5466-bde5917a4120	alternacija
00240000-56aa-3a50-3277-7183bed229aa	00230000-56aa-3a50-5693-6ab8b96935b5	pogodba
00240000-56aa-3a50-aab5-06dd3bfec6f0	00230000-56aa-3a50-5466-bde5917a4120	zaposlitev
00240000-56aa-3a50-179e-b2193e05c753	00230000-56aa-3a50-5466-bde5917a4120	zvrstuprizoritve
00240000-56aa-3a50-7819-2b7d930c3d1a	00230000-56aa-3a50-5693-6ab8b96935b5	programdela
00240000-56aa-3a50-6876-4bfdf1e66446	00230000-56aa-3a50-5466-bde5917a4120	zapis
\.


--
-- TOC entry 3133 (class 0 OID 41514322)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
ea99ee78-439e-4d1f-be36-9ab276b00dcd	00240000-56aa-3a50-22aa-31af18772d97	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 41514898)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56aa-3a54-8ae9-4c15fa4b7a2c	000e0000-56aa-3a54-c020-82cc8ce74d27	00080000-56aa-3a53-374d-9b77b08e0f61	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56aa-3a51-6eb8-30b57d7af108
00270000-56aa-3a54-c860-52860f1c4de2	000e0000-56aa-3a54-c020-82cc8ce74d27	00080000-56aa-3a53-374d-9b77b08e0f61	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56aa-3a51-6eb8-30b57d7af108
\.


--
-- TOC entry 3149 (class 0 OID 41514471)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 41514717)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56aa-3a55-e9bb-5cf3df4f91b2	00180000-56aa-3a55-6f88-bba8f0376eb4	000c0000-56aa-3a54-0a62-f81a5d1a78d5	00090000-56aa-3a54-4e56-966032f7d2cd	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56aa-3a55-5ec0-9aab96be70a3	00180000-56aa-3a55-6f88-bba8f0376eb4	000c0000-56aa-3a54-460d-bd6f03009a75	00090000-56aa-3a54-7a86-8d7481598d7b	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56aa-3a55-4a37-97f060030d61	00180000-56aa-3a55-6f88-bba8f0376eb4	000c0000-56aa-3a54-ae1e-8ff62bbd94d7	00090000-56aa-3a54-914f-0fc4951c857a	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56aa-3a55-5001-c7a88629966d	00180000-56aa-3a55-6f88-bba8f0376eb4	000c0000-56aa-3a54-c630-3ab51d2c1e11	00090000-56aa-3a54-0920-1f4c3b1ec01b	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56aa-3a55-bb22-e71a93f5b5fc	00180000-56aa-3a55-6f88-bba8f0376eb4	000c0000-56aa-3a54-f8d4-f1a235020988	00090000-56aa-3a54-8921-8839a5d1bba9	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56aa-3a55-3380-bd6b1393433f	00180000-56aa-3a54-0a13-567a2b3c4137	\N	00090000-56aa-3a54-8921-8839a5d1bba9	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56aa-3a55-466e-623218de349e	00180000-56aa-3a55-8e7a-dfa114e69868	\N	00090000-56aa-3a54-7a86-8d7481598d7b	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56aa-3a55-fb65-107f674953c0	00180000-56aa-3a55-6f88-bba8f0376eb4	\N	00090000-56aa-3a54-e2c4-996471340fee	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 41514734)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56aa-3a50-a30f-4762f7d01842	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56aa-3a50-1556-bfe459d9bde2	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56aa-3a50-ddae-e465bcd110d8	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56aa-3a50-d004-646bc5f341c4	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56aa-3a50-e38a-def7d387c4ef	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56aa-3a50-eded-e81108189124	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 41514939)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56aa-3a50-dcd7-97aa03268081	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56aa-3a50-adf2-c93ee38454de	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56aa-3a50-dc47-efe3b7f2858b	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56aa-3a50-0d9b-33d89709663f	04	Režija	Režija	Režija	umetnik	30
000f0000-56aa-3a50-13f7-4ce9dfc948c6	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56aa-3a50-81c0-c376dfd0e46b	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56aa-3a50-bdec-a68239bb0a3d	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56aa-3a50-f7ec-b03ae77662a8	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56aa-3a50-a946-aac326b70e13	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56aa-3a50-95ee-8d0c8f5b28bf	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56aa-3a50-b45b-db8a71094bd2	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56aa-3a50-0a8e-142a6a1242bc	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56aa-3a50-b85b-5e5dbcd656f3	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56aa-3a50-4904-151ff83ae9d0	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56aa-3a50-c40d-c881c54f7bdd	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56aa-3a50-e6bd-9a35336950ed	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56aa-3a50-a9a9-efbcb6e87e88	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56aa-3a50-8aba-d304d9985b75	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56aa-3a50-fbb6-1a416e38963d	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 41514422)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56aa-3a53-1079-9626585afc11	0001	šola	osnovna ali srednja šola
00400000-56aa-3a53-209f-cffdefb3fd5b	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56aa-3a53-5e73-355a44aef125	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 41515243)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56aa-3a50-8087-c58e4e67f22a	01	Velika predstava	f	1.00	1.00
002b0000-56aa-3a50-5dd1-f01fc886c76d	02	Mala predstava	f	0.50	0.50
002b0000-56aa-3a50-f68c-d87afb941e53	03	Mala koprodukcija	t	0.40	1.00
002b0000-56aa-3a50-2ea0-975e435e235e	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56aa-3a50-cbb2-7fc701c5034d	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 41514688)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56aa-3a50-5d37-3cbec65738c7	0001	prva vaja	prva vaja
00420000-56aa-3a50-2700-f8689117cf85	0002	tehnična vaja	tehnična vaja
00420000-56aa-3a50-3b4b-e7ae61329b3b	0003	lučna vaja	lučna vaja
00420000-56aa-3a50-fa5c-8fa80f47521b	0004	kostumska vaja	kostumska vaja
00420000-56aa-3a50-196d-0dfdb5522795	0005	foto vaja	foto vaja
00420000-56aa-3a50-065a-f9e8ad5a4f3f	0006	1. glavna vaja	1. glavna vaja
00420000-56aa-3a50-97ba-34dc8ac5678d	0007	2. glavna vaja	2. glavna vaja
00420000-56aa-3a50-3404-9da2f1723be9	0008	1. generalka	1. generalka
00420000-56aa-3a50-cb48-3e0af1f7355f	0009	2. generalka	2. generalka
00420000-56aa-3a50-51ef-46d2fa63c927	0010	odprta generalka	odprta generalka
00420000-56aa-3a50-13bb-265ddd361159	0011	obnovitvena vaja	obnovitvena vaja
00420000-56aa-3a50-1a72-5de9bf8811d6	0012	italijanka	krajša "obnovitvena" vaja
00420000-56aa-3a50-3347-520c76ae74a0	0013	pevska vaja	pevska vaja
00420000-56aa-3a50-b4c5-62cc169cfa20	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56aa-3a50-55ae-f704f48334d9	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56aa-3a50-d781-f1d795d9e26c	0016	orientacijska vaja	orientacijska vaja
00420000-56aa-3a50-c57d-1570d138dfbf	0017	situacijska vaja	situacijska vaja
00420000-56aa-3a50-6fcf-2c584753a379	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 41514544)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 41514357)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56aa-3a52-e087-7833ed9688e7	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROn11DqLoiKWjfdFzFcClbAGebI1h0af.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56aa-3a53-025b-b841cc830058	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56aa-3a53-1198-4fa8ab9d7fd8	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56aa-3a53-8b5c-a59daaf13c26	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56aa-3a53-df25-18c9457ee67e	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56aa-3a53-baff-43061027c005	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56aa-3a53-0e0c-f048465bffad	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56aa-3a53-1c89-a10173e8e97b	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56aa-3a53-e474-15ff247c0422	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56aa-3a53-b0c3-a2818f3d01af	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56aa-3a53-3afa-0f27f2b8bfea	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56aa-3a53-1315-2a7f3ba869e5	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56aa-3a53-1012-9abba5d81785	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56aa-3a54-7be9-d9dc08b9a8f1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56aa-3a54-3122-fbf30cb6dead	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56aa-3a54-0df9-f9a7739181b8	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56aa-3a54-da1f-5d12ac6bd699	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56aa-3a54-237f-7cfab99b6404	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56aa-3a54-dcdd-6a3b17fa8c5d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56aa-3a54-05ae-ce4e3fd3bce4	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56aa-3a54-627b-41f3dfac7b44	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56aa-3a54-cb7b-57d28cddadf3	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56aa-3a54-d458-7913a6ba618e	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56aa-3a54-23e9-63d66fecef2b	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56aa-3a54-c0f3-08b8ad180b08	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56aa-3a54-c399-e2e0835740d7	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56aa-3a54-35cf-faee0787c0ca	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56aa-3a52-e969-afaca0a5ff5c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 41514989)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56aa-3a54-503e-78cf94f81c2f	00160000-56aa-3a53-da5d-92ccb3242cf9	\N	00140000-56aa-3a50-b068-763c3f9372a3	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56aa-3a53-2779-fdd235dd9371
000e0000-56aa-3a54-c020-82cc8ce74d27	00160000-56aa-3a53-3830-371103e19a10	\N	00140000-56aa-3a50-cc63-764c21a87dc2	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56aa-3a53-008e-33c3e10d5cc5
000e0000-56aa-3a54-41ee-599ec51d4bff	\N	\N	00140000-56aa-3a50-cc63-764c21a87dc2	00190000-56aa-3a54-0957-6d1e02199aad	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56aa-3a53-2779-fdd235dd9371
000e0000-56aa-3a54-bc8d-d580d33cebde	\N	\N	00140000-56aa-3a50-cc63-764c21a87dc2	00190000-56aa-3a54-0957-6d1e02199aad	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56aa-3a53-2779-fdd235dd9371
000e0000-56aa-3a54-bac7-de0f5e5c139f	\N	\N	00140000-56aa-3a50-cc63-764c21a87dc2	00190000-56aa-3a54-0957-6d1e02199aad	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56aa-3a53-bd63-a4e8c117b4de
000e0000-56aa-3a54-24e1-1f9c4368cbc5	\N	\N	00140000-56aa-3a50-cc63-764c21a87dc2	00190000-56aa-3a54-0957-6d1e02199aad	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56aa-3a53-bd63-a4e8c117b4de
000e0000-56aa-3a54-aa39-ad12c455770f	\N	\N	00140000-56aa-3a50-d7e6-61f7bd3eff97	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56aa-3a53-bd63-a4e8c117b4de
000e0000-56aa-3a54-7cb5-262d7b761e04	\N	\N	00140000-56aa-3a50-d7e6-61f7bd3eff97	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56aa-3a53-bd63-a4e8c117b4de
000e0000-56aa-3a54-79eb-87c9fc373906	\N	\N	00140000-56aa-3a50-d7e6-61f7bd3eff97	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56aa-3a53-bd63-a4e8c117b4de
000e0000-56aa-3a54-5cb8-415cd096ca62	\N	\N	00140000-56aa-3a50-d7e6-61f7bd3eff97	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56aa-3a53-bd63-a4e8c117b4de
000e0000-56aa-3a54-d73a-c8a6a720b754	\N	\N	00140000-56aa-3a50-d7e6-61f7bd3eff97	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56aa-3a53-bd63-a4e8c117b4de
000e0000-56aa-3a54-3042-4d8e37a62af5	\N	\N	00140000-56aa-3a50-d7e6-61f7bd3eff97	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56aa-3a53-bd63-a4e8c117b4de
000e0000-56aa-3a54-1b1e-36e570028d71	\N	\N	00140000-56aa-3a50-d7e6-61f7bd3eff97	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56aa-3a53-bd63-a4e8c117b4de
000e0000-56aa-3a54-cfbb-f70b227e3b9f	\N	\N	00140000-56aa-3a50-d7e6-61f7bd3eff97	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56aa-3a53-bd63-a4e8c117b4de
000e0000-56aa-3a54-e49e-dc34d1080333	\N	\N	00140000-56aa-3a50-d7e6-61f7bd3eff97	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56aa-3a53-bd63-a4e8c117b4de
\.


--
-- TOC entry 3170 (class 0 OID 41514708)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 41514637)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56aa-3a55-5c2b-5445fcc296f4	\N	000e0000-56aa-3a54-503e-78cf94f81c2f	1
00200000-56aa-3a55-9c00-d8d589bf914b	\N	000e0000-56aa-3a54-c020-82cc8ce74d27	1
00200000-56aa-3a55-a599-f901b8b7d7ca	\N	000e0000-56aa-3a54-c020-82cc8ce74d27	3
00200000-56aa-3a55-e9c9-1ce28254049f	\N	000e0000-56aa-3a54-c020-82cc8ce74d27	4
00200000-56aa-3a55-e825-41621348620e	\N	000e0000-56aa-3a54-c020-82cc8ce74d27	2
00200000-56aa-3a55-4d09-7fe8d3ad1c75	\N	000e0000-56aa-3a54-c020-82cc8ce74d27	8
00200000-56aa-3a55-4782-3d64085c5c78	\N	000e0000-56aa-3a54-c020-82cc8ce74d27	7
00200000-56aa-3a55-c5e2-0d0ce6f672e8	\N	000e0000-56aa-3a54-c020-82cc8ce74d27	9
00200000-56aa-3a55-4dcc-ae1c8b3768e8	\N	000e0000-56aa-3a54-c020-82cc8ce74d27	6
00200000-56aa-3a55-15f4-bb35e77eda86	\N	000e0000-56aa-3a54-c020-82cc8ce74d27	5
\.


--
-- TOC entry 3182 (class 0 OID 41514801)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 41514912)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56aa-3a51-4f5d-08fe8a2579cf	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56aa-3a51-9412-59f3f82aa8b4	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56aa-3a51-142d-14bf6503a3ad	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56aa-3a51-acb8-7584cf21ad47	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56aa-3a51-6304-5032c5dfa0a5	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56aa-3a51-0ea9-57e64ee40f97	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56aa-3a51-70c7-5a56df2e9ef2	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56aa-3a51-8e46-b0445d87e615	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56aa-3a51-6eb8-30b57d7af108	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56aa-3a51-68d8-c5cc717098df	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56aa-3a51-2c42-a9a8b435fae1	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56aa-3a51-22ab-8e2dcfce251e	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56aa-3a51-7143-afebb5932130	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56aa-3a51-4d94-d4ad2d09cca7	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56aa-3a51-b370-27390ec76f4f	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56aa-3a51-c1e2-1ee4c611f554	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56aa-3a51-f7bf-5e6d19d4c888	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56aa-3a51-9982-8ebfdd952868	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56aa-3a51-0a38-e2e5062fd714	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56aa-3a51-462f-f05bd8a90846	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56aa-3a51-fa3f-d8eb9908b43c	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56aa-3a51-d7f1-0c60869186b9	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56aa-3a51-9841-20c940f8fd37	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56aa-3a51-ce5e-11358f2d49c1	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56aa-3a51-9627-53048039b4e9	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56aa-3a51-bdf8-c4f75f4804aa	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56aa-3a51-cece-52d8451a35be	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56aa-3a51-312b-faecdb994c07	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 41515293)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 41515262)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 41515305)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 41514874)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56aa-3a54-9011-81c96a73bcbc	00090000-56aa-3a54-7a86-8d7481598d7b	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56aa-3a54-1640-d91b349d1d94	00090000-56aa-3a54-914f-0fc4951c857a	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56aa-3a54-4fb1-12683b752808	00090000-56aa-3a54-0331-104c8692de07	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56aa-3a54-f2ac-c584f354715c	00090000-56aa-3a54-648b-9f52e756a44b	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56aa-3a54-3896-5cc79a197396	00090000-56aa-3a54-b569-9d480d16ea3d	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56aa-3a54-150d-15436eab4832	00090000-56aa-3a54-f876-8aa01d39eba5	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 41514979)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56aa-3a50-b068-763c3f9372a3	01	Drama	drama (SURS 01)
00140000-56aa-3a50-74a6-18690266cc4d	02	Opera	opera (SURS 02)
00140000-56aa-3a50-ecee-d4300e3bed55	03	Balet	balet (SURS 03)
00140000-56aa-3a50-a396-371b5bf5f3bc	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56aa-3a50-d7e6-61f7bd3eff97	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56aa-3a50-cc63-764c21a87dc2	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56aa-3a50-17d7-5ce228216eaf	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 41514864)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 41514421)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 41515037)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 41515028)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 41514411)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 41514895)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 41514937)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 41515346)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 41514731)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 41514666)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 41514682)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 41514687)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 41515260)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 41514570)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 41515106)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 41514860)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 41514635)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 41514608)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 41514584)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 41514767)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 41515323)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 41515330)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 41515354)
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
-- TOC entry 2766 (class 2606 OID 41514793)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 41514542)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 41514440)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 41514504)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 41514467)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 41514400)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 41514385)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 41514799)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 41514836)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 41514974)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 41514495)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 41514530)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 41515211)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 41514773)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 41514520)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 41514651)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 41514623)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 41514617)
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
-- TOC entry 2764 (class 2606 OID 41514785)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 41515220)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 41515228)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 41515198)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 41515241)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 41514818)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 41514758)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 41514749)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 41514961)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 41514888)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 41514596)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 41514356)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 41514827)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 41514374)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 41514394)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 41514845)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 41514780)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 41514706)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 41514344)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 41514332)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 41514326)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 41514908)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 41514476)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 41514723)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 41514741)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 41514948)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 41514429)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 41515253)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 41514695)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 41514555)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 41514369)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 41515007)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 41514714)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 41514641)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 41514807)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 41514920)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 41515303)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 41515287)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 41515311)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 41514878)
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
-- TOC entry 2833 (class 2606 OID 41514987)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 41514872)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 41514676)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 41514677)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 41514675)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 41514673)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 41514674)
-- Name: idx_11e93b5d7634c214; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d7634c214 ON dogodek USING btree (nadrejenogostovanje_id);


--
-- TOC entry 2708 (class 1259 OID 41514672)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 41514909)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 41514910)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 41514911)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 41515325)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 41515324)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 41514497)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 41514498)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 41514800)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 41515291)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 41515290)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 41515292)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 41515289)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 41515288)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 41514786)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 41514642)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 41514643)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 41514861)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 41514863)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 41514862)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 41514586)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 41514585)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 41515242)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 41514976)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 41514977)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 41514978)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 41515312)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 41515012)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 41515009)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 41515013)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 41515011)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 41515010)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 41514557)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 41514556)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 41514470)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 41514828)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 41514401)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 41514402)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 41514848)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 41514847)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 41514846)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 41514507)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 41514506)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 41514508)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 41514618)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2595 (class 1259 OID 41514334)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 41514753)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 41514751)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 41514750)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 41514752)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 41514375)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 41514376)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 41514808)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 41515347)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 41514897)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 41514896)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 41515355)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 41515356)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 41514774)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 41514889)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 41514890)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 41515111)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 41515110)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 41515107)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 41515108)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 41515109)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 41514522)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 41514521)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 41514523)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 41514822)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 41514821)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 41515221)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 41515222)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 41515041)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 41515042)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 41515039)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 41515040)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 41514732)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 41514733)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 41514879)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 41514880)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 41514715)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 41514762)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 41514761)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 41514759)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 41514760)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 41515029)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 41514597)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 41514611)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 41514610)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 41514609)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 41514612)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 41514636)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 41514624)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 41514625)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 41515212)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 41515261)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 41515331)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 41515332)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 41514442)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 41514441)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 41514477)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 41514478)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 41514726)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 41514725)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 41514724)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 41514668)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 41514671)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 41514667)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 41514670)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 41514669)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 41514496)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 41514430)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 41514431)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 41514571)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 41514573)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 41514572)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 41514574)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 41514768)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 41514975)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 41515008)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 41514949)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 41514950)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 41514468)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 41514469)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 41514742)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 41514743)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 41514873)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 41514345)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 41514543)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 41514505)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 41514333)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 41515254)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 41514820)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 41514819)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 41514696)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 41514697)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 41515038)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 41514716)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 41514531)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 41514988)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 41515304)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 41515229)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 41515230)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 41514938)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 41514707)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 41514395)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 41515517)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 41515542)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 41515532)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 41515512)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2940 (class 2606 OID 41515547)
-- Name: fk_11e93b5d7634c214; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d7634c214 FOREIGN KEY (nadrejenogostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2944 (class 2606 OID 41515527)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 41515537)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 41515522)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2985 (class 2606 OID 41515727)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 41515732)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2983 (class 2606 OID 41515737)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3016 (class 2606 OID 41515897)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 41515892)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 41515412)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 41515417)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 41515642)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3011 (class 2606 OID 41515877)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 41515872)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3010 (class 2606 OID 41515882)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 41515867)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3014 (class 2606 OID 41515862)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 41515637)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2939 (class 2606 OID 41515502)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2938 (class 2606 OID 41515507)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 41515682)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 41515692)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 41515687)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 41515467)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 41515462)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 41515627)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 41515852)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2988 (class 2606 OID 41515742)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 41515747)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2986 (class 2606 OID 41515752)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 41515887)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2990 (class 2606 OID 41515772)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2993 (class 2606 OID 41515757)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2989 (class 2606 OID 41515777)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 41515767)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2992 (class 2606 OID 41515762)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 41515457)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 41515452)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 41515397)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 41515392)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 41515662)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 41515372)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 41515377)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2971 (class 2606 OID 41515677)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 41515672)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2973 (class 2606 OID 41515667)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 41515427)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 41515422)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 41515432)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 41515482)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 41515357)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 41515602)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 41515592)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 41515587)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 41515597)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 41515362)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 41515367)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 41515647)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 41515912)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2981 (class 2606 OID 41515722)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 41515717)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 41515917)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 41515922)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 41515632)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 41515707)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2979 (class 2606 OID 41515712)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2999 (class 2606 OID 41515827)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 41515822)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3003 (class 2606 OID 41515807)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 41515812)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 41515817)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 41515442)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 41515437)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 41515447)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2968 (class 2606 OID 41515657)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 41515652)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 41515837)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3005 (class 2606 OID 41515842)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2996 (class 2606 OID 41515797)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2995 (class 2606 OID 41515802)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2998 (class 2606 OID 41515787)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 41515792)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 41515577)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 41515582)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 41515697)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 41515702)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 41515552)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 41515557)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 41515622)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 41515617)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 41515607)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 41515612)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 41515782)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 41515472)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 41515477)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2937 (class 2606 OID 41515497)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2936 (class 2606 OID 41515487)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2935 (class 2606 OID 41515492)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 41515832)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 41515847)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 41515857)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 41515902)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 41515907)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 41515387)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 41515382)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 41515402)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 41515407)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 41515572)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 41515567)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 41515562)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-28 16:57:12 CET

--
-- PostgreSQL database dump complete
--

