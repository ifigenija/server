--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-18 14:39:14 CET

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
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 257
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 37460240)
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
-- TOC entry 241 (class 1259 OID 37460858)
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
-- TOC entry 240 (class 1259 OID 37460842)
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
-- TOC entry 184 (class 1259 OID 37460233)
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
-- TOC entry 183 (class 1259 OID 37460231)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 37460719)
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
-- TOC entry 234 (class 1259 OID 37460749)
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
-- TOC entry 255 (class 1259 OID 37461161)
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
-- TOC entry 212 (class 1259 OID 37460555)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 37460481)
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
    allday boolean DEFAULT false,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(4) DEFAULT NULL::character varying,
    razred character varying(4) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 37460506)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 37460511)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 37461083)
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
-- TOC entry 196 (class 1259 OID 37460385)
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
-- TOC entry 242 (class 1259 OID 37460871)
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
-- TOC entry 227 (class 1259 OID 37460677)
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
-- TOC entry 202 (class 1259 OID 37460455)
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
-- TOC entry 199 (class 1259 OID 37460425)
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
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 197 (class 1259 OID 37460402)
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
-- TOC entry 216 (class 1259 OID 37460591)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 37461141)
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
-- TOC entry 254 (class 1259 OID 37461154)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 37461176)
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
-- TOC entry 220 (class 1259 OID 37460616)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 37460359)
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
-- TOC entry 187 (class 1259 OID 37460259)
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
-- TOC entry 191 (class 1259 OID 37460326)
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
-- TOC entry 188 (class 1259 OID 37460270)
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
-- TOC entry 180 (class 1259 OID 37460205)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 37460224)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 37460623)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 37460657)
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
-- TOC entry 237 (class 1259 OID 37460790)
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
-- TOC entry 190 (class 1259 OID 37460306)
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
-- TOC entry 193 (class 1259 OID 37460351)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 37461027)
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
-- TOC entry 217 (class 1259 OID 37460597)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 37460336)
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
-- TOC entry 204 (class 1259 OID 37460473)
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
-- TOC entry 200 (class 1259 OID 37460440)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporedna integer,
    zaporednasez integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 201 (class 1259 OID 37460448)
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
-- TOC entry 219 (class 1259 OID 37460609)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 37461041)
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
-- TOC entry 246 (class 1259 OID 37461051)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 37460940)
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
-- TOC entry 247 (class 1259 OID 37461059)
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
-- TOC entry 223 (class 1259 OID 37460638)
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
-- TOC entry 215 (class 1259 OID 37460582)
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
-- TOC entry 214 (class 1259 OID 37460572)
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
-- TOC entry 236 (class 1259 OID 37460779)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 37460709)
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
-- TOC entry 198 (class 1259 OID 37460414)
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
-- TOC entry 177 (class 1259 OID 37460176)
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
-- TOC entry 176 (class 1259 OID 37460174)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 37460651)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 37460214)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 37460198)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 37460665)
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
-- TOC entry 218 (class 1259 OID 37460603)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 37460526)
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
-- TOC entry 175 (class 1259 OID 37460163)
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
-- TOC entry 174 (class 1259 OID 37460155)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 37460150)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 37460726)
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
-- TOC entry 189 (class 1259 OID 37460298)
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
-- TOC entry 211 (class 1259 OID 37460545)
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
-- TOC entry 213 (class 1259 OID 37460562)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 37460767)
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
-- TOC entry 186 (class 1259 OID 37460249)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 37461071)
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
-- TOC entry 208 (class 1259 OID 37460516)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 37460371)
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
-- TOC entry 178 (class 1259 OID 37460185)
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
-- TOC entry 239 (class 1259 OID 37460817)
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
-- TOC entry 210 (class 1259 OID 37460536)
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
-- TOC entry 203 (class 1259 OID 37460466)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 37460630)
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
-- TOC entry 233 (class 1259 OID 37460740)
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
-- TOC entry 251 (class 1259 OID 37461121)
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
-- TOC entry 250 (class 1259 OID 37461090)
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
-- TOC entry 252 (class 1259 OID 37461133)
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
-- TOC entry 229 (class 1259 OID 37460702)
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
-- TOC entry 238 (class 1259 OID 37460807)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 37460692)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 37460236)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 37460179)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3146 (class 0 OID 37460240)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-569c-eaff-9d21-92ad5e05162a	10	30	Otroci	Abonma za otroke	200
000a0000-569c-eaff-e820-de25b0e0aaca	20	60	Mladina	Abonma za mladino	400
000a0000-569c-eaff-e585-0da7107e99fb	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3202 (class 0 OID 37460858)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-569c-eaff-2afa-2184d6f3d6d4	000d0000-569c-eaff-62a7-64e69525c187	\N	00090000-569c-eaff-fde0-472199fc7dc5	000b0000-569c-eaff-ddfb-35e02baa7208	0001	f	\N	\N	\N	3	t	t	t
000c0000-569c-eaff-9c9a-ff0bcae31cf1	000d0000-569c-eaff-e145-6b13de51f289	00100000-569c-eaff-f853-2976103f8097	00090000-569c-eaff-b8ac-86a1a9b06c87	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-569c-eaff-1952-401aba93716b	000d0000-569c-eaff-9edb-5de7577207cf	00100000-569c-eaff-aff4-487d5affe540	00090000-569c-eaff-ebc0-09d7da382ff5	\N	0003	t	\N	2016-01-18	\N	2	t	f	f
000c0000-569c-eaff-ca52-db10d37b1ee5	000d0000-569c-eaff-af64-8ecb5891fe3e	\N	00090000-569c-eaff-7963-97fac02f7822	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-569c-eaff-9f28-8044b31a2070	000d0000-569c-eaff-45c8-f5c967e723b5	\N	00090000-569c-eaff-78ef-ad1d3b247b03	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-569c-eaff-c486-621e855b3964	000d0000-569c-eaff-5136-2d4cbaf2f5b9	\N	00090000-569c-eaff-2f1e-0c1b8b430a9f	000b0000-569c-eaff-0a73-9d22ae32a8b8	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-569c-eaff-dec8-0f67d1edd98d	000d0000-569c-eaff-ac62-ad884249d49a	00100000-569c-eaff-42ca-b374f3ce72b8	00090000-569c-eaff-ac8e-71b9f67a0235	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-569c-eaff-27af-05cb615d76c8	000d0000-569c-eaff-25c7-4bec93475a4d	\N	00090000-569c-eaff-9800-0bc8b53b9122	000b0000-569c-eaff-4ae7-04d060d86f34	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-569c-eaff-c9f8-b63787654971	000d0000-569c-eaff-ac62-ad884249d49a	00100000-569c-eaff-c8f8-6ae64fa1066d	00090000-569c-eaff-8618-f5ff5f35976c	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-569c-eaff-aca0-2614fc3b2416	000d0000-569c-eaff-ac62-ad884249d49a	00100000-569c-eaff-fccd-ef6038ee13d1	00090000-569c-eaff-281e-c01bac29b3db	\N	0010	t	\N	2016-01-18	\N	16	f	f	t
000c0000-569c-eaff-fe24-16d574ceecd1	000d0000-569c-eaff-ac62-ad884249d49a	00100000-569c-eaff-6d00-c964db44a33c	00090000-569c-eaff-7307-e235ab821180	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-569c-eaff-3b58-fad692c73c91	000d0000-569c-eaff-927c-0b0389bbf7fc	00100000-569c-eaff-f853-2976103f8097	00090000-569c-eaff-b8ac-86a1a9b06c87	000b0000-569c-eaff-ffe2-3b01e209c013	0012	t	\N	\N	\N	2	t	t	t
000c0000-569c-eaff-0487-81fcbf87f42e	000d0000-569c-eaff-f0a8-26912a0d492a	\N	00090000-569c-eaff-9800-0bc8b53b9122	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-569c-eaff-f6c0-931d1469dcf4	000d0000-569c-eaff-f0a8-26912a0d492a	\N	00090000-569c-eaff-0503-e90e6fdaed76	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-569c-eaff-b20a-5761869039d3	000d0000-569c-eaff-50dc-a0db464fb80b	00100000-569c-eaff-aff4-487d5affe540	00090000-569c-eaff-ebc0-09d7da382ff5	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-569c-eaff-8bd5-d5fa8262de2f	000d0000-569c-eaff-50dc-a0db464fb80b	\N	00090000-569c-eaff-0503-e90e6fdaed76	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-569c-eaff-7645-ac83095cd66c	000d0000-569c-eaff-b4e9-43ad3f5d080e	\N	00090000-569c-eaff-0503-e90e6fdaed76	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-569c-eaff-defa-0d87ef3915ef	000d0000-569c-eaff-b4e9-43ad3f5d080e	\N	00090000-569c-eaff-9800-0bc8b53b9122	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-569c-eaff-3545-1f8d264c826d	000d0000-569c-eaff-c728-09ce3c40aa14	00100000-569c-eaff-42ca-b374f3ce72b8	00090000-569c-eaff-ac8e-71b9f67a0235	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-569c-eaff-3e8b-acfc1d7b107b	000d0000-569c-eaff-c728-09ce3c40aa14	\N	00090000-569c-eaff-0503-e90e6fdaed76	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-569c-eaff-dd55-a925b97236a1	000d0000-569c-eaff-8495-978f2334f3b3	\N	00090000-569c-eaff-0503-e90e6fdaed76	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-569c-eaff-89e7-675f6a4eab3f	000d0000-569c-eaff-8495-978f2334f3b3	00100000-569c-eaff-42ca-b374f3ce72b8	00090000-569c-eaff-ac8e-71b9f67a0235	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-569c-eaff-3e75-a866c4b2d3f9	000d0000-569c-eaff-e291-bc83bcf6af55	\N	00090000-569c-eaff-0503-e90e6fdaed76	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-569c-eaff-18ee-04101402e246	000d0000-569c-eaff-dd84-f44a0fc22797	\N	00090000-569c-eaff-9800-0bc8b53b9122	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-569c-eaff-0d5d-a38cf328ee15	000d0000-569c-eaff-bc07-50b4b62c24f0	\N	00090000-569c-eaff-9800-0bc8b53b9122	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-569c-eaff-53ed-ba6de5d34956	000d0000-569c-eaff-bc07-50b4b62c24f0	00100000-569c-eaff-aff4-487d5affe540	00090000-569c-eaff-ebc0-09d7da382ff5	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-569c-eaff-f2bd-c43cd5051664	000d0000-569c-eaff-ec42-91a1a6eeeafa	\N	00090000-569c-eaff-20bc-b1480683336d	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-569c-eaff-8cb0-0103a2ea2111	000d0000-569c-eaff-ec42-91a1a6eeeafa	\N	00090000-569c-eaff-8f64-712103bff50e	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-569c-eaff-14e7-afa26d3b7da8	000d0000-569c-eaff-4d36-85722ea42a83	\N	00090000-569c-eaff-9800-0bc8b53b9122	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-569c-eaff-7319-f174826ea0f9	000d0000-569c-eaff-4d36-85722ea42a83	00100000-569c-eaff-aff4-487d5affe540	00090000-569c-eaff-ebc0-09d7da382ff5	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-569c-eaff-eb05-363a53316f52	000d0000-569c-eaff-4d36-85722ea42a83	\N	00090000-569c-eaff-8f64-712103bff50e	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-569c-eaff-a903-9a40c39cd8c5	000d0000-569c-eaff-4d36-85722ea42a83	\N	00090000-569c-eaff-20bc-b1480683336d	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-569c-eaff-0057-afb749867854	000d0000-569c-eaff-dda9-8c13e1ce6667	\N	00090000-569c-eaff-9800-0bc8b53b9122	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-569c-eaff-aed8-10abae07f941	000d0000-569c-eaff-9a69-60ad9e6d81f9	00100000-569c-eaff-aff4-487d5affe540	00090000-569c-eaff-ebc0-09d7da382ff5	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-569c-eaff-097b-220a7797f074	000d0000-569c-eaff-9a69-60ad9e6d81f9	\N	00090000-569c-eaff-0503-e90e6fdaed76	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3201 (class 0 OID 37460842)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 37460233)
-- Dependencies: 184
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3192 (class 0 OID 37460719)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-569c-eaff-36eb-d0e8adbd0c5a	00160000-569c-eafe-0fbd-7dceea7f48aa	00090000-569c-eaff-8f64-712103bff50e	aizv	10	t
003d0000-569c-eaff-21ff-afee18720aaa	00160000-569c-eafe-0fbd-7dceea7f48aa	00090000-569c-eaff-958b-a101793daa06	apri	14	t
003d0000-569c-eaff-134d-07a2beba2153	00160000-569c-eafe-bc03-83302fbed118	00090000-569c-eaff-20bc-b1480683336d	aizv	11	t
003d0000-569c-eaff-ec81-9e83bd2f9e3f	00160000-569c-eafe-3813-43f573a84612	00090000-569c-eaff-1dfa-87032c35ade3	aizv	12	t
003d0000-569c-eaff-70c0-acb28a0fb9df	00160000-569c-eafe-0fbd-7dceea7f48aa	00090000-569c-eaff-0503-e90e6fdaed76	apri	18	f
\.


--
-- TOC entry 3195 (class 0 OID 37460749)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-569c-eafe-0fbd-7dceea7f48aa	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-569c-eafe-bc03-83302fbed118	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-569c-eafe-3813-43f573a84612	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3216 (class 0 OID 37461161)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 37460555)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 37460481)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-569c-eaff-52e2-69888647624c	\N	00200000-569c-eaff-e24a-56900508e191	\N	\N	\N	00220000-569c-eafe-5694-f0dd8c8348ff	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-569c-eaff-57a3-cc336c5a398c	\N	00200000-569c-eaff-55f5-52fb80726b6b	\N	\N	\N	00220000-569c-eafe-5694-f0dd8c8348ff	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-569c-eaff-db77-5efbbd0778a2	\N	00200000-569c-eaff-7597-bb424fee3e12	\N	\N	\N	00220000-569c-eafe-9861-3698ed8a11f6	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-569c-eaff-18ae-0a75922ac45b	\N	00200000-569c-eaff-5db3-1bb01c7d6531	\N	\N	\N	00220000-569c-eafe-6855-51a48c9d0395	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-569c-eaff-93ec-21caa567551d	\N	00200000-569c-eaff-c121-dfff8ee3dde7	\N	\N	\N	00220000-569c-eafe-bf8b-eaa1dbc3f536	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
00180000-569c-eaff-2b3a-b0f20eac8548	001b0000-569c-eaff-43d3-5c38f7463f9e	\N	\N	\N	\N	00220000-569c-eafe-bdca-6c8f26b7b260	\N	f	2014-05-10 23:00:00	2014-05-10 23:00:00	200s	100s	\N	Predstava 1
\.


--
-- TOC entry 3167 (class 0 OID 37460506)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 37460511)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 37461083)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 37460385)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-569c-eafb-fb14-08d5ac49e2e9	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-569c-eafb-ef2b-f496efc509f2	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-569c-eafb-49c0-567771e09b69	AL	ALB	008	Albania 	Albanija	\N
00040000-569c-eafc-7477-529c377ffa3a	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-569c-eafc-156e-3123fdd5f3ec	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-569c-eafc-5949-83f4b429e59c	AD	AND	020	Andorra 	Andora	\N
00040000-569c-eafc-92c9-951143f16d35	AO	AGO	024	Angola 	Angola	\N
00040000-569c-eafc-1233-1bda6d6bac51	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-569c-eafc-fd17-6162c06a1f33	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-569c-eafc-7b37-093bfc77c009	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-569c-eafc-8ee6-f5d27e135d77	AR	ARG	032	Argentina 	Argenitna	\N
00040000-569c-eafc-0419-2499237c4fed	AM	ARM	051	Armenia 	Armenija	\N
00040000-569c-eafc-43a9-fcb5751c46d5	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-569c-eafc-83f7-5e7893b287dc	AU	AUS	036	Australia 	Avstralija	\N
00040000-569c-eafc-fd0f-b41a7a6c013b	AT	AUT	040	Austria 	Avstrija	\N
00040000-569c-eafc-4caf-5fc93ea704d5	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-569c-eafc-dc9b-3446d3d9045b	BS	BHS	044	Bahamas 	Bahami	\N
00040000-569c-eafc-8107-fd675e67661d	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-569c-eafc-e34c-999ad8c04caf	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-569c-eafc-6b17-6e7b72a5bc2a	BB	BRB	052	Barbados 	Barbados	\N
00040000-569c-eafc-bec1-48f322304f80	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-569c-eafc-b9d9-de97c7e26858	BE	BEL	056	Belgium 	Belgija	\N
00040000-569c-eafc-37aa-4e4398d3a37d	BZ	BLZ	084	Belize 	Belize	\N
00040000-569c-eafc-8a09-26738b9cb908	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-569c-eafc-c4ad-6581324c430c	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-569c-eafc-2585-4c22bd2bbdad	BT	BTN	064	Bhutan 	Butan	\N
00040000-569c-eafc-605a-0781ffd2964d	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-569c-eafc-cc4b-95f2098838f5	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-569c-eafc-f814-4fa6c04f08b9	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-569c-eafc-85b1-d1ade506b077	BW	BWA	072	Botswana 	Bocvana	\N
00040000-569c-eafc-1abb-760d6e27c23d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-569c-eafc-02d3-f69a28744015	BR	BRA	076	Brazil 	Brazilija	\N
00040000-569c-eafc-7e7d-db4dcb78bc52	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-569c-eafc-4882-f12116ba3a3b	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-569c-eafc-b2a5-b6d8fdda93a9	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-569c-eafc-9cca-c645817aee6c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-569c-eafc-8b46-82c4e13e198a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-569c-eafc-1995-8531a873b8bd	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-569c-eafc-d9b1-80334203b84f	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-569c-eafc-fc43-d71411b10960	CA	CAN	124	Canada 	Kanada	\N
00040000-569c-eafc-f420-9f77cae876f2	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-569c-eafc-17d7-919aaa1ac8e5	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-569c-eafc-e494-edaf5d954c15	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-569c-eafc-e7ba-07cf7e9ec335	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-569c-eafc-7047-2e3a58841189	CL	CHL	152	Chile 	Čile	\N
00040000-569c-eafc-6a65-a0f0cb87a929	CN	CHN	156	China 	Kitajska	\N
00040000-569c-eafc-0589-000182f29d9e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-569c-eafc-2c24-ffbd664a7133	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-569c-eafc-61ae-60d6bf1d68c3	CO	COL	170	Colombia 	Kolumbija	\N
00040000-569c-eafc-58cc-f523660a82a6	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-569c-eafc-4aa5-c3c7082fceee	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-569c-eafc-828e-475afa0afd14	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-569c-eafc-6757-a609bf8f454b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-569c-eafc-bdfa-edccc6213b27	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-569c-eafc-8e5a-59be48e5fa2a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-569c-eafc-6dfc-23a6f1d0c172	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-569c-eafc-0899-d7d4f878e074	CU	CUB	192	Cuba 	Kuba	\N
00040000-569c-eafc-47a9-6bd537abf83a	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-569c-eafc-98d0-de67936f90a1	CY	CYP	196	Cyprus 	Ciper	\N
00040000-569c-eafc-ba71-1e998cccb447	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-569c-eafc-e80b-62d676acd57e	DK	DNK	208	Denmark 	Danska	\N
00040000-569c-eafc-f8fa-7665468fa8ce	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-569c-eafc-f535-a9ad7f5e754a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-569c-eafc-a019-f9f788930f75	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-569c-eafc-c8d1-ddd00f435807	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-569c-eafc-d618-6b38b80a32f7	EG	EGY	818	Egypt 	Egipt	\N
00040000-569c-eafc-45cc-41cf25f6702b	SV	SLV	222	El Salvador 	Salvador	\N
00040000-569c-eafc-167d-16941f2b790c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-569c-eafc-bb41-b1adab16093d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-569c-eafc-c985-4d0e391e2609	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-569c-eafc-7a9e-8a43b058a3b7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-569c-eafc-9713-fcefa5d3ab97	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-569c-eafc-3914-d83e4edd8beb	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-569c-eafc-cb6e-6d2f20872fee	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-569c-eafc-1a44-0674c9682da7	FI	FIN	246	Finland 	Finska	\N
00040000-569c-eafc-ced9-c34bd56615fb	FR	FRA	250	France 	Francija	\N
00040000-569c-eafc-0278-5c55dd432fe0	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-569c-eafc-1735-6895fe03db46	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-569c-eafc-290c-3eafdb591e38	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-569c-eafc-b260-9935c965f7eb	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-569c-eafc-7eed-770061e74e2f	GA	GAB	266	Gabon 	Gabon	\N
00040000-569c-eafc-1716-7e46668666c9	GM	GMB	270	Gambia 	Gambija	\N
00040000-569c-eafc-1e08-6f46efd846cc	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-569c-eafc-8700-a05d5ddb51d6	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-569c-eafc-c572-0ec525488c7b	GH	GHA	288	Ghana 	Gana	\N
00040000-569c-eafc-c4de-0dcced4e01e7	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-569c-eafc-667e-5902f826a8b1	GR	GRC	300	Greece 	Grčija	\N
00040000-569c-eafc-901e-cadc860fb313	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-569c-eafc-3d48-bb441141c700	GD	GRD	308	Grenada 	Grenada	\N
00040000-569c-eafc-058a-693fb1778c13	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-569c-eafc-1415-db9b30025cdb	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-569c-eafc-bf79-e8cede06c30c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-569c-eafc-42b0-7ade156325df	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-569c-eafc-fb9e-3130dc28bc08	GN	GIN	324	Guinea 	Gvineja	\N
00040000-569c-eafc-1ebe-d38b96d46c5d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-569c-eafc-9d08-8a50ba4f2bda	GY	GUY	328	Guyana 	Gvajana	\N
00040000-569c-eafc-9be8-7be77ba986bb	HT	HTI	332	Haiti 	Haiti	\N
00040000-569c-eafc-ff2f-b1435c4a093b	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-569c-eafc-eac3-4912090c499d	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-569c-eafc-21e1-8354e1a13305	HN	HND	340	Honduras 	Honduras	\N
00040000-569c-eafc-e5cc-66c5abd8246e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-569c-eafc-86d3-9420d15761cd	HU	HUN	348	Hungary 	Madžarska	\N
00040000-569c-eafc-f524-e34f08b6461d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-569c-eafc-8394-e79105061ea4	IN	IND	356	India 	Indija	\N
00040000-569c-eafc-a80b-c5a05b6a30e2	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-569c-eafc-cc69-249cd3d60d79	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-569c-eafc-3909-d9ee2c06dac8	IQ	IRQ	368	Iraq 	Irak	\N
00040000-569c-eafc-3a1f-bdc363aa5542	IE	IRL	372	Ireland 	Irska	\N
00040000-569c-eafc-4ed6-76ca9f485896	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-569c-eafc-1731-bc61db951b7b	IL	ISR	376	Israel 	Izrael	\N
00040000-569c-eafc-bf8f-9922aeba0e31	IT	ITA	380	Italy 	Italija	\N
00040000-569c-eafc-8a09-70c8a1afad41	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-569c-eafc-f01f-41215fd48130	JP	JPN	392	Japan 	Japonska	\N
00040000-569c-eafc-e8e3-d62e338f0792	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-569c-eafc-7161-f3d848ad15ab	JO	JOR	400	Jordan 	Jordanija	\N
00040000-569c-eafc-e4ee-a8dec72fea75	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-569c-eafc-33cb-74ff49ca50ca	KE	KEN	404	Kenya 	Kenija	\N
00040000-569c-eafc-0a47-5d87542a8f7c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-569c-eafc-5f3a-66f72a1ef99b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-569c-eafc-ed42-cf7b38a7ed13	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-569c-eafc-ab27-afc7973eef2a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-569c-eafc-2190-de43abd9fc06	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-569c-eafc-8972-4dc70ce24a6c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-569c-eafc-5af4-d7b636e74ed7	LV	LVA	428	Latvia 	Latvija	\N
00040000-569c-eafc-7008-32116cfd4d0b	LB	LBN	422	Lebanon 	Libanon	\N
00040000-569c-eafc-9a5b-6dadd5957980	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-569c-eafc-3a7b-dbd43440a06c	LR	LBR	430	Liberia 	Liberija	\N
00040000-569c-eafc-ead0-c9d70cfce937	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-569c-eafc-8bc7-d70e7d53fd89	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-569c-eafc-b8ae-5c972a8c3a53	LT	LTU	440	Lithuania 	Litva	\N
00040000-569c-eafc-6847-3072cc694460	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-569c-eafc-4eac-fe4a4b06a7a6	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-569c-eafc-5986-eba6b8dd1516	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-569c-eafc-1f9c-ae25ada45901	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-569c-eafc-0a6f-41bc8ac8ea0e	MW	MWI	454	Malawi 	Malavi	\N
00040000-569c-eafc-f280-f9ac7f6b4da0	MY	MYS	458	Malaysia 	Malezija	\N
00040000-569c-eafc-518b-385da0d2c604	MV	MDV	462	Maldives 	Maldivi	\N
00040000-569c-eafc-7c12-721b3ea2696e	ML	MLI	466	Mali 	Mali	\N
00040000-569c-eafc-a0d0-d3f0d1b20902	MT	MLT	470	Malta 	Malta	\N
00040000-569c-eafc-16d4-6f9997656913	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-569c-eafc-4d7f-085dfea72e31	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-569c-eafc-be33-53ab7c1c4522	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-569c-eafc-d562-ee69cc9600e0	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-569c-eafc-171e-0605b1a1ae20	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-569c-eafc-2e73-6b4233e11488	MX	MEX	484	Mexico 	Mehika	\N
00040000-569c-eafc-a838-addc6d28413f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-569c-eafc-7a5a-12ba147312f4	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-569c-eafc-388f-c3fdfcce1f2b	MC	MCO	492	Monaco 	Monako	\N
00040000-569c-eafc-3e8c-cb94519471dc	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-569c-eafc-175b-9f8a124e3b55	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-569c-eafc-70cd-7ce7f3ffe62f	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-569c-eafc-f35f-823446dc8055	MA	MAR	504	Morocco 	Maroko	\N
00040000-569c-eafc-089d-659e97244ce2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-569c-eafc-b2da-06f65a91c724	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-569c-eafc-d062-b101347436dd	NA	NAM	516	Namibia 	Namibija	\N
00040000-569c-eafc-f273-562ef2c102d9	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-569c-eafc-ce1d-9bda5210befa	NP	NPL	524	Nepal 	Nepal	\N
00040000-569c-eafc-f4d2-bd202af5ae56	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-569c-eafc-40d1-05a9b3e1f92d	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-569c-eafc-bfd8-1df028663bad	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-569c-eafc-ccee-4f69e33daa43	NE	NER	562	Niger 	Niger 	\N
00040000-569c-eafc-0fda-05e2a45bfec5	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-569c-eafc-1dab-31985b23e1d6	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-569c-eafc-5b97-2c1582a46c90	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-569c-eafc-7174-2e1a3e4d818f	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-569c-eafc-e3d4-9ea0493bc654	NO	NOR	578	Norway 	Norveška	\N
00040000-569c-eafc-a0c7-989131542c1b	OM	OMN	512	Oman 	Oman	\N
00040000-569c-eafc-4733-a03264dcd0a1	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-569c-eafc-4f08-d4e31c89adde	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-569c-eafc-a97b-ae14fd2ca1e1	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-569c-eafc-a121-40bcd9521747	PA	PAN	591	Panama 	Panama	\N
00040000-569c-eafc-d122-a29c91d57c63	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-569c-eafc-8fef-9204452e7d65	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-569c-eafc-696b-80e9dcc7d9e1	PE	PER	604	Peru 	Peru	\N
00040000-569c-eafc-f9ad-82c5c1a40d60	PH	PHL	608	Philippines 	Filipini	\N
00040000-569c-eafc-8214-c20b4718840c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-569c-eafc-3fd3-5e8f113625e2	PL	POL	616	Poland 	Poljska	\N
00040000-569c-eafc-e9ac-d452ea158392	PT	PRT	620	Portugal 	Portugalska	\N
00040000-569c-eafc-1ecc-0234ff5f52d4	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-569c-eafc-2aa7-8c8a29af1fac	QA	QAT	634	Qatar 	Katar	\N
00040000-569c-eafc-3754-74f0d5d3911d	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-569c-eafc-809c-11210c5609a8	RO	ROU	642	Romania 	Romunija	\N
00040000-569c-eafc-ff4c-f2f3aadacd5e	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-569c-eafc-abd6-69074c79b3d6	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-569c-eafc-30d6-0d23abc3b6cf	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-569c-eafc-97e1-1e67cd0b719f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-569c-eafc-1996-d718043a79f0	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-569c-eafc-d2cd-f9dfbc13a308	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-569c-eafc-be77-da3742b66389	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-569c-eafc-7288-ea13b5da92e1	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-569c-eafc-1a8a-0df91b220655	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-569c-eafc-c75f-f49148ef637d	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-569c-eafc-3bdb-262356e3b40c	SM	SMR	674	San Marino 	San Marino	\N
00040000-569c-eafc-454a-8547b1e11ed4	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-569c-eafc-9919-713ba9b0b10c	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-569c-eafc-4e63-8344736118e9	SN	SEN	686	Senegal 	Senegal	\N
00040000-569c-eafc-15d0-52c51c14b681	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-569c-eafc-844a-25fed828b1b2	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-569c-eafc-1053-4bb8f6e3ffd7	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-569c-eafc-b58c-694ab1006423	SG	SGP	702	Singapore 	Singapur	\N
00040000-569c-eafc-d66c-de3f4157c569	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-569c-eafc-0968-831272f83437	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-569c-eafc-a347-252cef0dca1b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-569c-eafc-0d49-940d7f868d4f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-569c-eafc-3285-10ee13834fc0	SO	SOM	706	Somalia 	Somalija	\N
00040000-569c-eafc-a96f-c534bc4d3d57	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-569c-eafc-0925-4e07f6a14011	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-569c-eafc-193a-846964b8d96e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-569c-eafc-5f4a-b436fa495101	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-569c-eafc-29b3-b622ea915052	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-569c-eafc-55e9-f61394d9a1f2	SD	SDN	729	Sudan 	Sudan	\N
00040000-569c-eafc-c2e1-490505e5f7c9	SR	SUR	740	Suriname 	Surinam	\N
00040000-569c-eafc-b986-8a423d989879	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-569c-eafc-bedf-942b4edabf98	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-569c-eafc-449d-bf835afce9ff	SE	SWE	752	Sweden 	Švedska	\N
00040000-569c-eafc-b4c4-89aa99e73e10	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-569c-eafc-b501-dd33fb7b1272	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-569c-eafc-4430-bdb0db994c02	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-569c-eafc-0da5-69c6e070cdb6	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-569c-eafc-eab9-150ecb766227	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-569c-eafc-c0f8-587be778e9c3	TH	THA	764	Thailand 	Tajska	\N
00040000-569c-eafc-5b4d-fe2f86db9d04	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-569c-eafc-c8ea-e5a904113ab6	TG	TGO	768	Togo 	Togo	\N
00040000-569c-eafc-0568-1933a4621385	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-569c-eafc-56dd-06ce33278aa1	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-569c-eafc-d5a7-7b5ae7edaf51	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-569c-eafc-19a7-dc5f9f35831c	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-569c-eafc-b5ea-e273f4734e6e	TR	TUR	792	Turkey 	Turčija	\N
00040000-569c-eafc-c1a2-1159df4d4bfa	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-569c-eafc-8045-c2a5ce2c2b8b	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569c-eafc-2598-56223cad5ec1	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-569c-eafc-73ad-374070172c6d	UG	UGA	800	Uganda 	Uganda	\N
00040000-569c-eafc-5820-f9616445be68	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-569c-eafc-0d04-7b39421b8ddf	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-569c-eafc-7013-84ea5c036640	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-569c-eafc-25a8-049350019547	US	USA	840	United States 	Združene države Amerike	\N
00040000-569c-eafc-cdcb-f53d5f58c224	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-569c-eafc-7d8d-a883ae6af75c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-569c-eafc-e326-282d5549977e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-569c-eafc-6264-80072dd951a6	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-569c-eafc-7bc9-06e30e9ed128	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-569c-eafc-5c3c-55fb655aeaec	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-569c-eafc-e1e1-f65a0208999c	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569c-eafc-7779-be02f3490746	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-569c-eafc-3063-d10dfb3589b6	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-569c-eafc-4d18-483543b5e60f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-569c-eafc-817c-fab5ca19c13b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-569c-eafc-01ae-1752a8fb77cc	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-569c-eafc-e788-ebd70df475b0	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3203 (class 0 OID 37460871)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-569c-eaff-31e0-02f46b5d464a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-569c-eaff-f302-487e8a6fdcca	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569c-eaff-6395-99b06f091410	000e0000-569c-eaff-6d30-95ee3f865677	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569c-eafb-1f09-33b5730a5eef	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569c-eaff-23d1-93c7bdb259e1	000e0000-569c-eaff-867a-70518cfdf8b2	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569c-eafb-3114-8975a87f0ad5	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569c-eaff-66aa-76de1b4907bd	000e0000-569c-eaff-7e70-48f9db15495b	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569c-eafb-1f09-33b5730a5eef	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3188 (class 0 OID 37460677)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-569c-eaff-e4e8-75b33bbde835	000e0000-569c-eaff-867a-70518cfdf8b2	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-569c-eafb-4c0e-1eda66603a3f
000d0000-569c-eaff-ac11-5e3ebda945c0	000e0000-569c-eaff-0a4a-3f976f5406b2	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-569c-eafb-4c5f-76d79d70aaad
000d0000-569c-eaff-f359-9db04ec88900	000e0000-569c-eaff-0a4a-3f976f5406b2	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-569c-eafb-e6e7-e48de888ba14
000d0000-569c-eaff-62a7-64e69525c187	000e0000-569c-eaff-867a-70518cfdf8b2	000c0000-569c-eaff-2afa-2184d6f3d6d4	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-569c-eafb-4c5f-76d79d70aaad
000d0000-569c-eaff-e145-6b13de51f289	000e0000-569c-eaff-867a-70518cfdf8b2	000c0000-569c-eaff-9c9a-ff0bcae31cf1	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-569c-eafb-e6e7-e48de888ba14
000d0000-569c-eaff-9edb-5de7577207cf	000e0000-569c-eaff-867a-70518cfdf8b2	000c0000-569c-eaff-1952-401aba93716b	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-569c-eafb-b577-dcc50c5c0f0d
000d0000-569c-eaff-af64-8ecb5891fe3e	000e0000-569c-eaff-867a-70518cfdf8b2	000c0000-569c-eaff-ca52-db10d37b1ee5	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-569c-eafb-4c0e-1eda66603a3f
000d0000-569c-eaff-45c8-f5c967e723b5	000e0000-569c-eaff-867a-70518cfdf8b2	000c0000-569c-eaff-9f28-8044b31a2070	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-569c-eafb-4c0e-1eda66603a3f
000d0000-569c-eaff-5136-2d4cbaf2f5b9	000e0000-569c-eaff-867a-70518cfdf8b2	000c0000-569c-eaff-c486-621e855b3964	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-569c-eafb-4c5f-76d79d70aaad
000d0000-569c-eaff-ac62-ad884249d49a	000e0000-569c-eaff-867a-70518cfdf8b2	000c0000-569c-eaff-c9f8-b63787654971	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-569c-eafb-4c5f-76d79d70aaad
000d0000-569c-eaff-25c7-4bec93475a4d	000e0000-569c-eaff-867a-70518cfdf8b2	000c0000-569c-eaff-27af-05cb615d76c8	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-569c-eafb-498e-5833ba1bf13c
000d0000-569c-eaff-927c-0b0389bbf7fc	000e0000-569c-eaff-867a-70518cfdf8b2	000c0000-569c-eaff-3b58-fad692c73c91	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-569c-eafb-b37a-989640904ed5
000d0000-569c-eaff-f0a8-26912a0d492a	000e0000-569c-eaff-466b-3ce517c4764e	000c0000-569c-eaff-0487-81fcbf87f42e	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-569c-eafb-e6e7-e48de888ba14
000d0000-569c-eaff-50dc-a0db464fb80b	000e0000-569c-eaff-0bef-e2609d4fc23f	000c0000-569c-eaff-b20a-5761869039d3	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-569c-eafb-e6e7-e48de888ba14
000d0000-569c-eaff-b4e9-43ad3f5d080e	000e0000-569c-eaff-0bef-e2609d4fc23f	000c0000-569c-eaff-7645-ac83095cd66c	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-569c-eafb-e6e7-e48de888ba14
000d0000-569c-eaff-c728-09ce3c40aa14	000e0000-569c-eaff-88da-176b932953da	000c0000-569c-eaff-3545-1f8d264c826d	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-569c-eafb-e6e7-e48de888ba14
000d0000-569c-eaff-8495-978f2334f3b3	000e0000-569c-eaff-49ff-5bdc948c92bd	000c0000-569c-eaff-dd55-a925b97236a1	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-569c-eafb-e6e7-e48de888ba14
000d0000-569c-eaff-e291-bc83bcf6af55	000e0000-569c-eaff-4413-d81ca8508fff	000c0000-569c-eaff-3e75-a866c4b2d3f9	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-569c-eafb-e6e7-e48de888ba14
000d0000-569c-eaff-dd84-f44a0fc22797	000e0000-569c-eaff-8337-912ad565595e	000c0000-569c-eaff-18ee-04101402e246	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-569c-eafb-e6e7-e48de888ba14
000d0000-569c-eaff-bc07-50b4b62c24f0	000e0000-569c-eaff-279e-b730dbcdaad7	000c0000-569c-eaff-0d5d-a38cf328ee15	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-569c-eafb-e6e7-e48de888ba14
000d0000-569c-eaff-ec42-91a1a6eeeafa	000e0000-569c-eaff-09cf-69d2d8f37ffe	000c0000-569c-eaff-f2bd-c43cd5051664	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-569c-eafb-e6e7-e48de888ba14
000d0000-569c-eaff-4d36-85722ea42a83	000e0000-569c-eaff-09cf-69d2d8f37ffe	000c0000-569c-eaff-14e7-afa26d3b7da8	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-569c-eafb-e6e7-e48de888ba14
000d0000-569c-eaff-dda9-8c13e1ce6667	000e0000-569c-eaff-b3c7-3bd0893a16c2	000c0000-569c-eaff-0057-afb749867854	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-569c-eafb-e6e7-e48de888ba14
000d0000-569c-eaff-9a69-60ad9e6d81f9	000e0000-569c-eaff-b3c7-3bd0893a16c2	000c0000-569c-eaff-aed8-10abae07f941	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-569c-eafb-e6e7-e48de888ba14
\.


--
-- TOC entry 3163 (class 0 OID 37460455)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 37460425)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 37460402)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-569c-eaff-ed36-44e4ddc4eae2	00080000-569c-eaff-49e7-bc1472a1f4c5	00090000-569c-eaff-281e-c01bac29b3db	AK		igralka
\.


--
-- TOC entry 3177 (class 0 OID 37460591)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3214 (class 0 OID 37461141)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-569c-eaff-a933-2f2edb8b8787	00010000-569c-eafd-7082-68b4ff254999	\N	Prva mapa	Root mapa	2016-01-18 14:39:11	2016-01-18 14:39:11	R	\N	\N
\.


--
-- TOC entry 3215 (class 0 OID 37461154)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3217 (class 0 OID 37461176)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 34548309)
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
-- TOC entry 3181 (class 0 OID 37460616)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 37460359)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-569c-eafd-a714-b39c77367b2d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-569c-eafd-ee0d-0533595a08c2	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-569c-eafd-4a36-27399568d905	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-569c-eafd-10a8-1f41707f6aa1	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-569c-eafd-06da-27df3e925d4e	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-569c-eafd-d3d9-366525c9d532	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-569c-eafd-b945-e8b6d9766f83	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-569c-eafd-8806-20a885b822af	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-569c-eafd-16bb-dd44d8d75ac3	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569c-eafd-f9ad-628cfa6a3ea4	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569c-eafd-e845-f88b9986755e	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-569c-eafd-6321-2ca5ec1081fb	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-569c-eafd-4720-ba44a108b4cd	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-569c-eafd-5677-743d1e61a5ee	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-569c-eafd-b1c6-385cb479141b	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-569c-eafe-b0e7-b8043a1b5ac5	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-569c-eafe-b095-6710a7fae3bd	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-569c-eafe-1ab2-894d20e30b9a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-569c-eafe-dfb4-c920eab65f7b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-569c-eafe-a7c4-17b00eab9073	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-569c-eb01-04c5-7a54af5c346a	application.tenant.maticnopodjetje	string	s:36:"00080000-569c-eb01-2880-6056bba05276";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3148 (class 0 OID 37460259)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-569c-eafe-ca1d-df5e1e7761b8	00000000-569c-eafe-b0e7-b8043a1b5ac5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-569c-eafe-29b7-e6bc9028d884	00000000-569c-eafe-b0e7-b8043a1b5ac5	00010000-569c-eafd-7082-68b4ff254999	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-569c-eafe-a357-58f125bc7769	00000000-569c-eafe-b095-6710a7fae3bd	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3152 (class 0 OID 37460326)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-569c-eaff-35fa-5edb14edc77c	\N	00100000-569c-eaff-f853-2976103f8097	00100000-569c-eaff-aff4-487d5affe540	01	Gledališče Nimbis
00410000-569c-eaff-6e2e-03ff08e73446	00410000-569c-eaff-35fa-5edb14edc77c	00100000-569c-eaff-f853-2976103f8097	00100000-569c-eaff-aff4-487d5affe540	02	Tehnika
\.


--
-- TOC entry 3149 (class 0 OID 37460270)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-569c-eaff-fde0-472199fc7dc5	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-569c-eaff-7963-97fac02f7822	00010000-569c-eaff-54ea-4d634a0bae45	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-569c-eaff-ebc0-09d7da382ff5	00010000-569c-eaff-edd5-419113f52a2c	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-569c-eaff-8618-f5ff5f35976c	00010000-569c-eaff-0bfc-11487d000813	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-569c-eaff-dd1b-1920ea6cc761	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-569c-eaff-2f1e-0c1b8b430a9f	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-569c-eaff-7307-e235ab821180	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-569c-eaff-ac8e-71b9f67a0235	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-569c-eaff-281e-c01bac29b3db	00010000-569c-eaff-4ca3-3158c011c077	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-569c-eaff-b8ac-86a1a9b06c87	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-569c-eaff-0512-34cf53b53c49	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569c-eaff-78ef-ad1d3b247b03	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-569c-eaff-9800-0bc8b53b9122	00010000-569c-eaff-d7cc-edcad9f4bf8a	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569c-eaff-8f64-712103bff50e	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-569c-eaff-958b-a101793daa06	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-569c-eaff-20bc-b1480683336d	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-569c-eaff-1dfa-87032c35ade3	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569c-eaff-0503-e90e6fdaed76	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569c-eaff-7895-e2672812e145	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-569c-eaff-2f86-85153e443acf	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-569c-eaff-961a-713800ba2745	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3141 (class 0 OID 37460205)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-569c-eafc-caa3-298ef81d66c5	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-569c-eafc-ee7f-9e680764f7a2	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-569c-eafc-089b-a80d5ef74c82	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-569c-eafc-cdfc-9cf8eab17269	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-569c-eafc-0e1b-346fb3e2f15e	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-569c-eafc-a247-eac6aebf8f39	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-569c-eafc-2576-634498d868c3	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-569c-eafc-2f6f-372755ac54ca	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-569c-eafc-5657-58062a4a36cd	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-569c-eafc-e7da-82bddbe1f9d5	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-569c-eafc-f720-0a7ef871dd80	Abonma-read	Abonma - branje	t
00030000-569c-eafc-c1d6-c59e7e0b5f4f	Abonma-write	Abonma - spreminjanje	t
00030000-569c-eafc-ab3d-55b0a4ab5152	Alternacija-read	Alternacija - branje	t
00030000-569c-eafc-f867-ad8b0314fe09	Alternacija-write	Alternacija - spreminjanje	t
00030000-569c-eafc-86ec-a7814b3ded3e	Arhivalija-read	Arhivalija - branje	t
00030000-569c-eafc-6cc5-3d183a7d6437	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-569c-eafc-a2ee-40c02616e156	AuthStorage-read	AuthStorage - branje	t
00030000-569c-eafc-8f12-2ea499eed1ea	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-569c-eafc-abb7-b5858995d388	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-569c-eafc-bd92-3bcee162e4c1	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-569c-eafc-2ef7-cfbb7daea150	Besedilo-read	Besedilo - branje	t
00030000-569c-eafc-bb76-3926ded9fc4d	Besedilo-write	Besedilo - spreminjanje	t
00030000-569c-eafc-0276-5ef060e4c9f4	Dodatek-read	Dodatek - branje	t
00030000-569c-eafc-64d2-2f7b5b3e7919	Dodatek-write	Dodatek - spreminjanje	t
00030000-569c-eafc-34e2-c63f38a7fade	Dogodek-read	Dogodek - branje	t
00030000-569c-eafc-62d7-a79371799dc7	Dogodek-write	Dogodek - spreminjanje	t
00030000-569c-eafc-13c8-efdf295f1818	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-569c-eafc-dec3-e2d406862c26	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-569c-eafc-4a14-997e85805ca3	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-569c-eafc-41f0-e6f30576f729	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-569c-eafc-2d29-b046d6f1948f	DogodekTrait-read	DogodekTrait - branje	t
00030000-569c-eafc-872c-d0d7555acbea	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-569c-eafc-bbcd-2ec52a0cdd10	DrugiVir-read	DrugiVir - branje	t
00030000-569c-eafc-0657-e6e8ef12d30f	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-569c-eafc-a710-f92323ecfa24	Drzava-read	Drzava - branje	t
00030000-569c-eafc-33c6-517c398c54dc	Drzava-write	Drzava - spreminjanje	t
00030000-569c-eafc-00d7-43737a593751	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-569c-eafc-9a09-71fc5daf1ab3	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-569c-eafc-ce3c-a2544a8fb5dd	Funkcija-read	Funkcija - branje	t
00030000-569c-eafc-4648-078e647a9cb4	Funkcija-write	Funkcija - spreminjanje	t
00030000-569c-eafc-3e1c-294c5639292d	Gostovanje-read	Gostovanje - branje	t
00030000-569c-eafc-447f-c673e5aa9264	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-569c-eafc-77be-9b34a0e645e4	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-569c-eafc-b044-e52ad6f23e0e	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-569c-eafc-eedb-b3f555141adb	Kupec-read	Kupec - branje	t
00030000-569c-eafc-7687-ccb5d79c6779	Kupec-write	Kupec - spreminjanje	t
00030000-569c-eafc-b494-d5c49bb66d95	NacinPlacina-read	NacinPlacina - branje	t
00030000-569c-eafc-a0e7-eedf6fd5bf90	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-569c-eafc-a42d-de85d40dd951	Option-read	Option - branje	t
00030000-569c-eafc-5f14-be2b25d4ddad	Option-write	Option - spreminjanje	t
00030000-569c-eafc-6689-79ffe566fad9	OptionValue-read	OptionValue - branje	t
00030000-569c-eafc-3afd-a7d2e0c54a77	OptionValue-write	OptionValue - spreminjanje	t
00030000-569c-eafc-052d-2cff5586bcd4	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-569c-eafc-db3a-880976cc868c	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-569c-eafc-e792-2cdd5a89ef1a	Oseba-read	Oseba - branje	t
00030000-569c-eafc-94e6-e10973d6f099	Oseba-write	Oseba - spreminjanje	t
00030000-569c-eafc-8b97-bcfe798c9305	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-569c-eafc-5125-6693c386462c	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-569c-eafc-9695-75057b504134	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-569c-eafc-f659-b60e257fa2d1	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-569c-eafc-f84e-935f27b60d31	Pogodba-read	Pogodba - branje	t
00030000-569c-eafc-4e65-06d40df9d0a5	Pogodba-write	Pogodba - spreminjanje	t
00030000-569c-eafc-0485-1ce9baf39180	Popa-read	Popa - branje	t
00030000-569c-eafc-e90a-462d34433df2	Popa-write	Popa - spreminjanje	t
00030000-569c-eafc-823e-8222939c57e9	Posta-read	Posta - branje	t
00030000-569c-eafc-2cec-0d422fb8da84	Posta-write	Posta - spreminjanje	t
00030000-569c-eafc-dc90-4d8e678ee7c4	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-569c-eafc-ef47-e559031d142d	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-569c-eafc-3ab1-1726520ce2a0	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-569c-eafc-43c6-84ed75db6aa8	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-569c-eafc-e7d6-2ae202ff8bde	PostniNaslov-read	PostniNaslov - branje	t
00030000-569c-eafc-34c6-4a8ef26467b2	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-569c-eafc-8b40-d26f443673c5	Praznik-read	Praznik - branje	t
00030000-569c-eafc-bba6-2976dc97737c	Praznik-write	Praznik - spreminjanje	t
00030000-569c-eafc-2cb1-56ab23f79b22	Predstava-read	Predstava - branje	t
00030000-569c-eafc-8e85-b2ca34cf1b6c	Predstava-write	Predstava - spreminjanje	t
00030000-569c-eafc-fd12-81cdc36e34a3	Ura-read	Ura - branje	t
00030000-569c-eafc-de8f-2c45d2a931d9	Ura-write	Ura - spreminjanje	t
00030000-569c-eafc-4eca-3402df3d9b2f	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-569c-eafc-07db-e866c7e19db9	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-569c-eafc-ccd5-0aee2cac2a09	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-569c-eafc-25b2-be5a21ac92bf	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-569c-eafc-237c-5fc4bf2a2afb	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-569c-eafc-8398-4406f308d70a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-569c-eafc-9e13-79ec68dd0bad	ProgramDela-read	ProgramDela - branje	t
00030000-569c-eafc-59d1-fa0d1320bead	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-569c-eafc-16ae-4524ce3a1856	ProgramFestival-read	ProgramFestival - branje	t
00030000-569c-eafc-c768-f04f70482db7	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-569c-eafc-3ccc-835fc747ae02	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-569c-eafc-928b-32ccd7416b30	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-569c-eafc-36cf-27b92c3cbd88	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-569c-eafc-f09a-4dbbd475be21	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-569c-eafc-6cd2-f900f4bf8fe4	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-569c-eafc-7783-b4746d2919f8	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-569c-eafc-3f58-fcda8b7bd219	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-569c-eafc-9cf2-474b2cb47e06	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-569c-eafc-bd78-e64e91bf45c2	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-569c-eafc-5521-73a6f64cde00	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-569c-eafc-350a-8d5ace365e81	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-569c-eafc-25f2-3e441037557e	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-569c-eafc-3e79-a97ae48edab8	ProgramRazno-read	ProgramRazno - branje	t
00030000-569c-eafc-4ec1-04f18e369c70	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-569c-eafc-525c-451541021151	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-569c-eafc-efe9-72a57f17e4b6	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-569c-eafc-8367-fcc18861afdb	Prostor-read	Prostor - branje	t
00030000-569c-eafc-d4cf-08b52e754fb5	Prostor-write	Prostor - spreminjanje	t
00030000-569c-eafc-b7fc-aec9faa0d02e	Racun-read	Racun - branje	t
00030000-569c-eafc-b3e4-79997fca947e	Racun-write	Racun - spreminjanje	t
00030000-569c-eafc-c7e6-e2cc1422d280	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-569c-eafc-dde7-6b5bceddfa6e	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-569c-eafc-2202-b653a58827a4	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-569c-eafc-bf49-4a2eaedcc1b3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-569c-eafc-d71b-29c2688f9ce9	Rekvizit-read	Rekvizit - branje	t
00030000-569c-eafc-ae21-a5d160e88d61	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-569c-eafc-8436-89f605ca7ddc	Revizija-read	Revizija - branje	t
00030000-569c-eafc-64c4-d449cdf981f4	Revizija-write	Revizija - spreminjanje	t
00030000-569c-eafc-c656-03a7161b0a46	Rezervacija-read	Rezervacija - branje	t
00030000-569c-eafc-1c6d-13c52fefebac	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-569c-eafc-4c4d-1752d2fe011e	SedezniRed-read	SedezniRed - branje	t
00030000-569c-eafc-8cb7-ca7cf6a24624	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-569c-eafc-2e6a-7350adfea3c2	Sedez-read	Sedez - branje	t
00030000-569c-eafc-8485-579fa82e1571	Sedez-write	Sedez - spreminjanje	t
00030000-569c-eafc-f0fc-b7b81a1f81cc	Sezona-read	Sezona - branje	t
00030000-569c-eafc-1cb5-f49708a3e663	Sezona-write	Sezona - spreminjanje	t
00030000-569c-eafc-aada-f9e5dd2f740c	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-569c-eafc-7923-6860c07d8864	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-569c-eafc-ea70-179bf9cf4280	Telefonska-read	Telefonska - branje	t
00030000-569c-eafc-e4e8-20060a25b44e	Telefonska-write	Telefonska - spreminjanje	t
00030000-569c-eafc-1210-c420649da95d	TerminStoritve-read	TerminStoritve - branje	t
00030000-569c-eafc-5fdd-8505e223d7d9	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-569c-eafc-0b19-3baec41c7d74	TipDodatka-read	TipDodatka - branje	t
00030000-569c-eafc-b1c7-5195c8f48048	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-569c-eafc-1f65-453f0ba5011a	TipFunkcije-read	TipFunkcije - branje	t
00030000-569c-eafc-a770-06b7e065440b	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-569c-eafc-d343-293255246636	TipPopa-read	TipPopa - branje	t
00030000-569c-eafc-d7f0-b4cd335ba946	TipPopa-write	TipPopa - spreminjanje	t
00030000-569c-eafc-0df2-e6dc8acf5ee1	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-569c-eafc-502b-ed2e6a6e9b5b	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-569c-eafc-5cdc-618795e671fe	TipVaje-read	TipVaje - branje	t
00030000-569c-eafc-9fce-a1d9e592a811	TipVaje-write	TipVaje - spreminjanje	t
00030000-569c-eafc-2b08-307163b64246	Trr-read	Trr - branje	t
00030000-569c-eafc-2b89-1c2ffb5ce049	Trr-write	Trr - spreminjanje	t
00030000-569c-eafc-9c56-21a7c489cf52	Uprizoritev-read	Uprizoritev - branje	t
00030000-569c-eafc-34a6-d653b10f71a5	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-569c-eafc-a61f-b3ae0ed7f186	Vaja-read	Vaja - branje	t
00030000-569c-eafc-c090-0b50c7b308eb	Vaja-write	Vaja - spreminjanje	t
00030000-569c-eafc-95fa-7de1ce1ac522	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-569c-eafc-4308-fd9c5c527c6b	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-569c-eafc-e521-7e2c57423c0c	VrstaStroska-read	VrstaStroska - branje	t
00030000-569c-eafc-61b1-1f4d35830d4b	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-569c-eafc-826e-148720aae03c	Zaposlitev-read	Zaposlitev - branje	t
00030000-569c-eafc-6604-d9b4400b5292	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-569c-eafc-09df-d4dc86759304	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-569c-eafc-35a7-3a5cbd00de15	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-569c-eafc-10be-b53aa415cee4	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-569c-eafc-a7ab-db55e5a07d6c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-569c-eafc-8215-6261d27ad050	Job-read	Branje opravil - samo zase - branje	t
00030000-569c-eafc-a96d-79bf2fcf6dcf	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-569c-eafc-1fb1-8a4f9f3ec107	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-569c-eafc-5806-804e6b2b2dfb	Report-read	Report - branje	t
00030000-569c-eafc-0b78-0fa77d78dc49	Report-write	Report - spreminjanje	t
00030000-569c-eafc-4558-551d449de923	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-569c-eafc-0ad1-ae4f05fb0069	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-569c-eafc-cfd2-c33fe2cae185	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-569c-eafc-b0c3-472c05c306c9	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-569c-eafc-35a1-988733f3dae4	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-569c-eafc-d446-1f85362a396b	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-569c-eafc-3e0f-2a74d55f1c09	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-569c-eafc-5e1b-d6fd2f95a34a	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-569c-eafc-57ad-60f51e5a5b13	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-569c-eafc-d8af-731df04d97ea	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569c-eafc-9f56-2d84eaa78ade	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569c-eafc-9bae-e147e10619a4	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-569c-eafc-b91c-ecffae8b363a	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-569c-eafc-7804-fa3616bcc98a	Datoteka-write	Datoteka - spreminjanje	t
00030000-569c-eafc-eb81-7c49e1b4c306	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3143 (class 0 OID 37460224)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-569c-eafc-9010-2df8261fe4cc	00030000-569c-eafc-ee7f-9e680764f7a2
00020000-569c-eafc-9010-2df8261fe4cc	00030000-569c-eafc-caa3-298ef81d66c5
00020000-569c-eafc-a0b8-c2e0ce956720	00030000-569c-eafc-a710-f92323ecfa24
00020000-569c-eafc-b014-e7862633b69a	00030000-569c-eafc-bd92-3bcee162e4c1
00020000-569c-eafc-b014-e7862633b69a	00030000-569c-eafc-bb76-3926ded9fc4d
00020000-569c-eafc-b014-e7862633b69a	00030000-569c-eafc-7804-fa3616bcc98a
00020000-569c-eafc-b014-e7862633b69a	00030000-569c-eafc-94e6-e10973d6f099
00020000-569c-eafc-b014-e7862633b69a	00030000-569c-eafc-5e1b-d6fd2f95a34a
00020000-569c-eafc-b014-e7862633b69a	00030000-569c-eafc-d8af-731df04d97ea
00020000-569c-eafc-b014-e7862633b69a	00030000-569c-eafc-abb7-b5858995d388
00020000-569c-eafc-b014-e7862633b69a	00030000-569c-eafc-2ef7-cfbb7daea150
00020000-569c-eafc-b014-e7862633b69a	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafc-b014-e7862633b69a	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafc-b014-e7862633b69a	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafc-b014-e7862633b69a	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafc-df35-4b3092685535	00030000-569c-eafc-abb7-b5858995d388
00020000-569c-eafc-df35-4b3092685535	00030000-569c-eafc-2ef7-cfbb7daea150
00020000-569c-eafc-df35-4b3092685535	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafc-df35-4b3092685535	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafc-df35-4b3092685535	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafc-df35-4b3092685535	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafc-ef04-140ade61a09e	00030000-569c-eafc-826e-148720aae03c
00020000-569c-eafc-ef04-140ade61a09e	00030000-569c-eafc-6604-d9b4400b5292
00020000-569c-eafc-ef04-140ade61a09e	00030000-569c-eafc-a247-eac6aebf8f39
00020000-569c-eafc-ef04-140ade61a09e	00030000-569c-eafc-0e1b-346fb3e2f15e
00020000-569c-eafc-ef04-140ade61a09e	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafc-ef04-140ade61a09e	00030000-569c-eafc-94e6-e10973d6f099
00020000-569c-eafc-ef04-140ade61a09e	00030000-569c-eafc-052d-2cff5586bcd4
00020000-569c-eafc-1f58-04b0a1f5ecdb	00030000-569c-eafc-826e-148720aae03c
00020000-569c-eafc-1f58-04b0a1f5ecdb	00030000-569c-eafc-a247-eac6aebf8f39
00020000-569c-eafc-1f58-04b0a1f5ecdb	00030000-569c-eafc-052d-2cff5586bcd4
00020000-569c-eafc-76f8-b885acde5f0e	00030000-569c-eafc-94e6-e10973d6f099
00020000-569c-eafc-76f8-b885acde5f0e	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafc-76f8-b885acde5f0e	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafc-76f8-b885acde5f0e	00030000-569c-eafc-7804-fa3616bcc98a
00020000-569c-eafc-76f8-b885acde5f0e	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafc-76f8-b885acde5f0e	00030000-569c-eafc-d8af-731df04d97ea
00020000-569c-eafc-76f8-b885acde5f0e	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafc-76f8-b885acde5f0e	00030000-569c-eafc-5e1b-d6fd2f95a34a
00020000-569c-eafc-60a5-11c67f7ea1e1	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafc-60a5-11c67f7ea1e1	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafc-60a5-11c67f7ea1e1	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafc-60a5-11c67f7ea1e1	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafc-a728-987d5e748168	00030000-569c-eafc-94e6-e10973d6f099
00020000-569c-eafc-a728-987d5e748168	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafc-a728-987d5e748168	00030000-569c-eafc-a247-eac6aebf8f39
00020000-569c-eafc-a728-987d5e748168	00030000-569c-eafc-0e1b-346fb3e2f15e
00020000-569c-eafc-a728-987d5e748168	00030000-569c-eafc-2b08-307163b64246
00020000-569c-eafc-a728-987d5e748168	00030000-569c-eafc-2b89-1c2ffb5ce049
00020000-569c-eafc-a728-987d5e748168	00030000-569c-eafc-e7d6-2ae202ff8bde
00020000-569c-eafc-a728-987d5e748168	00030000-569c-eafc-34c6-4a8ef26467b2
00020000-569c-eafc-a728-987d5e748168	00030000-569c-eafc-ea70-179bf9cf4280
00020000-569c-eafc-a728-987d5e748168	00030000-569c-eafc-e4e8-20060a25b44e
00020000-569c-eafc-a728-987d5e748168	00030000-569c-eafc-a710-f92323ecfa24
00020000-569c-eafc-a728-987d5e748168	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafc-cd92-c858e3afa67f	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafc-cd92-c858e3afa67f	00030000-569c-eafc-a247-eac6aebf8f39
00020000-569c-eafc-cd92-c858e3afa67f	00030000-569c-eafc-2b08-307163b64246
00020000-569c-eafc-cd92-c858e3afa67f	00030000-569c-eafc-e7d6-2ae202ff8bde
00020000-569c-eafc-cd92-c858e3afa67f	00030000-569c-eafc-ea70-179bf9cf4280
00020000-569c-eafc-cd92-c858e3afa67f	00030000-569c-eafc-a710-f92323ecfa24
00020000-569c-eafc-cd92-c858e3afa67f	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-ea70-179bf9cf4280
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-e7d6-2ae202ff8bde
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-2b08-307163b64246
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-0485-1ce9baf39180
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-77be-9b34a0e645e4
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-237c-5fc4bf2a2afb
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-e4e8-20060a25b44e
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-34c6-4a8ef26467b2
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-5e1b-d6fd2f95a34a
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-2b89-1c2ffb5ce049
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-e90a-462d34433df2
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-7804-fa3616bcc98a
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-d8af-731df04d97ea
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-b044-e52ad6f23e0e
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-8398-4406f308d70a
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-a710-f92323ecfa24
00020000-569c-eafc-c6f2-be7b730965ae	00030000-569c-eafc-d343-293255246636
00020000-569c-eafc-edda-342bf6906fdc	00030000-569c-eafc-ea70-179bf9cf4280
00020000-569c-eafc-edda-342bf6906fdc	00030000-569c-eafc-e7d6-2ae202ff8bde
00020000-569c-eafc-edda-342bf6906fdc	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafc-edda-342bf6906fdc	00030000-569c-eafc-2b08-307163b64246
00020000-569c-eafc-edda-342bf6906fdc	00030000-569c-eafc-0485-1ce9baf39180
00020000-569c-eafc-edda-342bf6906fdc	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafc-edda-342bf6906fdc	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafc-edda-342bf6906fdc	00030000-569c-eafc-77be-9b34a0e645e4
00020000-569c-eafc-edda-342bf6906fdc	00030000-569c-eafc-237c-5fc4bf2a2afb
00020000-569c-eafc-edda-342bf6906fdc	00030000-569c-eafc-a710-f92323ecfa24
00020000-569c-eafc-edda-342bf6906fdc	00030000-569c-eafc-d343-293255246636
00020000-569c-eafc-3c23-2bbac39fffd1	00030000-569c-eafc-d343-293255246636
00020000-569c-eafc-3c23-2bbac39fffd1	00030000-569c-eafc-d7f0-b4cd335ba946
00020000-569c-eafc-1068-351953bc12bb	00030000-569c-eafc-d343-293255246636
00020000-569c-eafc-02b0-ec2c9d942732	00030000-569c-eafc-823e-8222939c57e9
00020000-569c-eafc-02b0-ec2c9d942732	00030000-569c-eafc-2cec-0d422fb8da84
00020000-569c-eafc-70a2-d1b8eaf982b8	00030000-569c-eafc-823e-8222939c57e9
00020000-569c-eafc-8708-916941983c41	00030000-569c-eafc-a710-f92323ecfa24
00020000-569c-eafc-8708-916941983c41	00030000-569c-eafc-33c6-517c398c54dc
00020000-569c-eafc-1d16-5172d5f8d1e9	00030000-569c-eafc-a710-f92323ecfa24
00020000-569c-eafc-b6dd-88cee0b82bb5	00030000-569c-eafc-10be-b53aa415cee4
00020000-569c-eafc-b6dd-88cee0b82bb5	00030000-569c-eafc-a7ab-db55e5a07d6c
00020000-569c-eafc-0a8e-572166e9888d	00030000-569c-eafc-10be-b53aa415cee4
00020000-569c-eafc-2d65-ba2ab2898db5	00030000-569c-eafc-09df-d4dc86759304
00020000-569c-eafc-2d65-ba2ab2898db5	00030000-569c-eafc-35a7-3a5cbd00de15
00020000-569c-eafc-143d-8d712df6dcf8	00030000-569c-eafc-09df-d4dc86759304
00020000-569c-eafc-21e3-622b72791ee8	00030000-569c-eafc-f720-0a7ef871dd80
00020000-569c-eafc-21e3-622b72791ee8	00030000-569c-eafc-c1d6-c59e7e0b5f4f
00020000-569c-eafc-327d-e4620e8f811f	00030000-569c-eafc-f720-0a7ef871dd80
00020000-569c-eafc-b566-2ce3970de4a9	00030000-569c-eafc-8367-fcc18861afdb
00020000-569c-eafc-b566-2ce3970de4a9	00030000-569c-eafc-d4cf-08b52e754fb5
00020000-569c-eafc-b566-2ce3970de4a9	00030000-569c-eafc-0485-1ce9baf39180
00020000-569c-eafc-b566-2ce3970de4a9	00030000-569c-eafc-e7d6-2ae202ff8bde
00020000-569c-eafc-b566-2ce3970de4a9	00030000-569c-eafc-34c6-4a8ef26467b2
00020000-569c-eafc-b566-2ce3970de4a9	00030000-569c-eafc-a710-f92323ecfa24
00020000-569c-eafc-c1a7-4bee3778f5db	00030000-569c-eafc-8367-fcc18861afdb
00020000-569c-eafc-c1a7-4bee3778f5db	00030000-569c-eafc-0485-1ce9baf39180
00020000-569c-eafc-c1a7-4bee3778f5db	00030000-569c-eafc-e7d6-2ae202ff8bde
00020000-569c-eafc-f4b4-a88307881fea	00030000-569c-eafc-e521-7e2c57423c0c
00020000-569c-eafc-f4b4-a88307881fea	00030000-569c-eafc-61b1-1f4d35830d4b
00020000-569c-eafc-16ef-abf9a16e1c7e	00030000-569c-eafc-e521-7e2c57423c0c
00020000-569c-eafc-4465-06678b575bf2	00030000-569c-eafc-db3a-880976cc868c
00020000-569c-eafc-4465-06678b575bf2	00030000-569c-eafc-052d-2cff5586bcd4
00020000-569c-eafc-4465-06678b575bf2	00030000-569c-eafc-826e-148720aae03c
00020000-569c-eafc-4465-06678b575bf2	00030000-569c-eafc-7804-fa3616bcc98a
00020000-569c-eafc-4465-06678b575bf2	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafc-4465-06678b575bf2	00030000-569c-eafc-5e1b-d6fd2f95a34a
00020000-569c-eafc-4465-06678b575bf2	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafc-4465-06678b575bf2	00030000-569c-eafc-d8af-731df04d97ea
00020000-569c-eafc-4465-06678b575bf2	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafc-b1f0-1e96986ddf7d	00030000-569c-eafc-052d-2cff5586bcd4
00020000-569c-eafc-b1f0-1e96986ddf7d	00030000-569c-eafc-826e-148720aae03c
00020000-569c-eafc-b1f0-1e96986ddf7d	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafc-b1f0-1e96986ddf7d	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafc-b1f0-1e96986ddf7d	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafc-608c-56e2375f842f	00030000-569c-eafc-5cdc-618795e671fe
00020000-569c-eafc-608c-56e2375f842f	00030000-569c-eafc-9fce-a1d9e592a811
00020000-569c-eafc-cd3b-bfcb18f99613	00030000-569c-eafc-5cdc-618795e671fe
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-2576-634498d868c3
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-2f6f-372755ac54ca
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-9e13-79ec68dd0bad
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-59d1-fa0d1320bead
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-16ae-4524ce3a1856
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-c768-f04f70482db7
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-3ccc-835fc747ae02
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-928b-32ccd7416b30
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-36cf-27b92c3cbd88
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-f09a-4dbbd475be21
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-6cd2-f900f4bf8fe4
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-7783-b4746d2919f8
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-3f58-fcda8b7bd219
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-9cf2-474b2cb47e06
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-bd78-e64e91bf45c2
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-5521-73a6f64cde00
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-350a-8d5ace365e81
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-25f2-3e441037557e
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-3e79-a97ae48edab8
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-4ec1-04f18e369c70
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-525c-451541021151
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-efe9-72a57f17e4b6
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-25b2-be5a21ac92bf
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-0657-e6e8ef12d30f
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-ef47-e559031d142d
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-a96d-79bf2fcf6dcf
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-bbcd-2ec52a0cdd10
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-ccd5-0aee2cac2a09
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-237c-5fc4bf2a2afb
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-dc90-4d8e678ee7c4
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-e521-7e2c57423c0c
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-9c56-21a7c489cf52
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-aada-f9e5dd2f740c
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-ce3c-a2544a8fb5dd
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-ab3d-55b0a4ab5152
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-1f65-453f0ba5011a
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-f84e-935f27b60d31
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-a710-f92323ecfa24
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-0485-1ce9baf39180
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-7804-fa3616bcc98a
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-5e1b-d6fd2f95a34a
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-d8af-731df04d97ea
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-8215-6261d27ad050
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafc-b6d5-7402b0f62d8f	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafc-db85-e50ba80e2822	00030000-569c-eafc-9e13-79ec68dd0bad
00020000-569c-eafc-db85-e50ba80e2822	00030000-569c-eafc-16ae-4524ce3a1856
00020000-569c-eafc-db85-e50ba80e2822	00030000-569c-eafc-3ccc-835fc747ae02
00020000-569c-eafc-db85-e50ba80e2822	00030000-569c-eafc-36cf-27b92c3cbd88
00020000-569c-eafc-db85-e50ba80e2822	00030000-569c-eafc-6cd2-f900f4bf8fe4
00020000-569c-eafc-db85-e50ba80e2822	00030000-569c-eafc-3f58-fcda8b7bd219
00020000-569c-eafc-db85-e50ba80e2822	00030000-569c-eafc-bd78-e64e91bf45c2
00020000-569c-eafc-db85-e50ba80e2822	00030000-569c-eafc-350a-8d5ace365e81
00020000-569c-eafc-db85-e50ba80e2822	00030000-569c-eafc-3e79-a97ae48edab8
00020000-569c-eafc-db85-e50ba80e2822	00030000-569c-eafc-525c-451541021151
00020000-569c-eafc-db85-e50ba80e2822	00030000-569c-eafc-ccd5-0aee2cac2a09
00020000-569c-eafc-db85-e50ba80e2822	00030000-569c-eafc-bbcd-2ec52a0cdd10
00020000-569c-eafc-db85-e50ba80e2822	00030000-569c-eafc-dc90-4d8e678ee7c4
00020000-569c-eafc-db85-e50ba80e2822	00030000-569c-eafc-a710-f92323ecfa24
00020000-569c-eafc-db85-e50ba80e2822	00030000-569c-eafc-8215-6261d27ad050
00020000-569c-eafc-db85-e50ba80e2822	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafc-db85-e50ba80e2822	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafc-db85-e50ba80e2822	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafc-47c4-3b27b4cf029c	00030000-569c-eafc-9c56-21a7c489cf52
00020000-569c-eafc-47c4-3b27b4cf029c	00030000-569c-eafc-34a6-d653b10f71a5
00020000-569c-eafc-47c4-3b27b4cf029c	00030000-569c-eafc-ab3d-55b0a4ab5152
00020000-569c-eafc-47c4-3b27b4cf029c	00030000-569c-eafc-f867-ad8b0314fe09
00020000-569c-eafc-47c4-3b27b4cf029c	00030000-569c-eafc-5657-58062a4a36cd
00020000-569c-eafc-47c4-3b27b4cf029c	00030000-569c-eafc-2ef7-cfbb7daea150
00020000-569c-eafc-47c4-3b27b4cf029c	00030000-569c-eafc-ce3c-a2544a8fb5dd
00020000-569c-eafc-47c4-3b27b4cf029c	00030000-569c-eafc-4648-078e647a9cb4
00020000-569c-eafc-47c4-3b27b4cf029c	00030000-569c-eafc-e7da-82bddbe1f9d5
00020000-569c-eafc-47c4-3b27b4cf029c	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafc-47c4-3b27b4cf029c	00030000-569c-eafc-237c-5fc4bf2a2afb
00020000-569c-eafc-47c4-3b27b4cf029c	00030000-569c-eafc-1f65-453f0ba5011a
00020000-569c-eafc-47c4-3b27b4cf029c	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafc-47c4-3b27b4cf029c	00030000-569c-eafc-7804-fa3616bcc98a
00020000-569c-eafc-47c4-3b27b4cf029c	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafc-47c4-3b27b4cf029c	00030000-569c-eafc-5e1b-d6fd2f95a34a
00020000-569c-eafc-47c4-3b27b4cf029c	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafc-47c4-3b27b4cf029c	00030000-569c-eafc-d8af-731df04d97ea
00020000-569c-eafc-f360-6fc4037a53ae	00030000-569c-eafc-9c56-21a7c489cf52
00020000-569c-eafc-f360-6fc4037a53ae	00030000-569c-eafc-ab3d-55b0a4ab5152
00020000-569c-eafc-f360-6fc4037a53ae	00030000-569c-eafc-2ef7-cfbb7daea150
00020000-569c-eafc-f360-6fc4037a53ae	00030000-569c-eafc-ce3c-a2544a8fb5dd
00020000-569c-eafc-f360-6fc4037a53ae	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafc-f360-6fc4037a53ae	00030000-569c-eafc-237c-5fc4bf2a2afb
00020000-569c-eafc-f360-6fc4037a53ae	00030000-569c-eafc-1f65-453f0ba5011a
00020000-569c-eafc-f360-6fc4037a53ae	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafc-f360-6fc4037a53ae	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafc-f360-6fc4037a53ae	00030000-569c-eafc-5e1b-d6fd2f95a34a
00020000-569c-eafc-f360-6fc4037a53ae	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafc-6649-8b5c8baf3512	00030000-569c-eafc-ab3d-55b0a4ab5152
00020000-569c-eafc-6649-8b5c8baf3512	00030000-569c-eafc-f867-ad8b0314fe09
00020000-569c-eafc-6649-8b5c8baf3512	00030000-569c-eafc-ce3c-a2544a8fb5dd
00020000-569c-eafc-6649-8b5c8baf3512	00030000-569c-eafc-4648-078e647a9cb4
00020000-569c-eafc-6649-8b5c8baf3512	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafc-6649-8b5c8baf3512	00030000-569c-eafc-1f65-453f0ba5011a
00020000-569c-eafc-6649-8b5c8baf3512	00030000-569c-eafc-9c56-21a7c489cf52
00020000-569c-eafc-6649-8b5c8baf3512	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafc-b2b2-0a81dbda368e	00030000-569c-eafc-ab3d-55b0a4ab5152
00020000-569c-eafc-b2b2-0a81dbda368e	00030000-569c-eafc-f867-ad8b0314fe09
00020000-569c-eafc-b2b2-0a81dbda368e	00030000-569c-eafc-5657-58062a4a36cd
00020000-569c-eafc-b2b2-0a81dbda368e	00030000-569c-eafc-ce3c-a2544a8fb5dd
00020000-569c-eafc-b2b2-0a81dbda368e	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafc-b2b2-0a81dbda368e	00030000-569c-eafc-a247-eac6aebf8f39
00020000-569c-eafc-b2b2-0a81dbda368e	00030000-569c-eafc-0e1b-346fb3e2f15e
00020000-569c-eafc-b2b2-0a81dbda368e	00030000-569c-eafc-f84e-935f27b60d31
00020000-569c-eafc-b2b2-0a81dbda368e	00030000-569c-eafc-4e65-06d40df9d0a5
00020000-569c-eafc-b2b2-0a81dbda368e	00030000-569c-eafc-0485-1ce9baf39180
00020000-569c-eafc-b2b2-0a81dbda368e	00030000-569c-eafc-237c-5fc4bf2a2afb
00020000-569c-eafc-b2b2-0a81dbda368e	00030000-569c-eafc-aada-f9e5dd2f740c
00020000-569c-eafc-b2b2-0a81dbda368e	00030000-569c-eafc-7923-6860c07d8864
00020000-569c-eafc-b2b2-0a81dbda368e	00030000-569c-eafc-1f65-453f0ba5011a
00020000-569c-eafc-b2b2-0a81dbda368e	00030000-569c-eafc-2b08-307163b64246
00020000-569c-eafc-b2b2-0a81dbda368e	00030000-569c-eafc-9c56-21a7c489cf52
00020000-569c-eafc-b2b2-0a81dbda368e	00030000-569c-eafc-826e-148720aae03c
00020000-569c-eafc-e937-43ff41a05b8e	00030000-569c-eafc-ab3d-55b0a4ab5152
00020000-569c-eafc-e937-43ff41a05b8e	00030000-569c-eafc-ce3c-a2544a8fb5dd
00020000-569c-eafc-e937-43ff41a05b8e	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafc-e937-43ff41a05b8e	00030000-569c-eafc-a247-eac6aebf8f39
00020000-569c-eafc-e937-43ff41a05b8e	00030000-569c-eafc-f84e-935f27b60d31
00020000-569c-eafc-e937-43ff41a05b8e	00030000-569c-eafc-0485-1ce9baf39180
00020000-569c-eafc-e937-43ff41a05b8e	00030000-569c-eafc-237c-5fc4bf2a2afb
00020000-569c-eafc-e937-43ff41a05b8e	00030000-569c-eafc-aada-f9e5dd2f740c
00020000-569c-eafc-e937-43ff41a05b8e	00030000-569c-eafc-1f65-453f0ba5011a
00020000-569c-eafc-e937-43ff41a05b8e	00030000-569c-eafc-2b08-307163b64246
00020000-569c-eafc-e937-43ff41a05b8e	00030000-569c-eafc-9c56-21a7c489cf52
00020000-569c-eafc-e937-43ff41a05b8e	00030000-569c-eafc-826e-148720aae03c
00020000-569c-eafc-41f9-169b317663f1	00030000-569c-eafc-aada-f9e5dd2f740c
00020000-569c-eafc-41f9-169b317663f1	00030000-569c-eafc-9c56-21a7c489cf52
00020000-569c-eafc-41f9-169b317663f1	00030000-569c-eafc-ce3c-a2544a8fb5dd
00020000-569c-eafc-41f9-169b317663f1	00030000-569c-eafc-f84e-935f27b60d31
00020000-569c-eafc-41f9-169b317663f1	00030000-569c-eafc-237c-5fc4bf2a2afb
00020000-569c-eafc-41f9-169b317663f1	00030000-569c-eafc-1f65-453f0ba5011a
00020000-569c-eafc-41f9-169b317663f1	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafc-6187-99180911cbbc	00030000-569c-eafc-aada-f9e5dd2f740c
00020000-569c-eafc-6187-99180911cbbc	00030000-569c-eafc-7923-6860c07d8864
00020000-569c-eafc-6187-99180911cbbc	00030000-569c-eafc-9c56-21a7c489cf52
00020000-569c-eafc-6187-99180911cbbc	00030000-569c-eafc-0485-1ce9baf39180
00020000-569c-eafc-495a-dfa2c9e64205	00030000-569c-eafc-aada-f9e5dd2f740c
00020000-569c-eafc-495a-dfa2c9e64205	00030000-569c-eafc-9c56-21a7c489cf52
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-f720-0a7ef871dd80
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-ab3d-55b0a4ab5152
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-f867-ad8b0314fe09
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-5657-58062a4a36cd
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-abb7-b5858995d388
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-bd92-3bcee162e4c1
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-2ef7-cfbb7daea150
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-bb76-3926ded9fc4d
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-7804-fa3616bcc98a
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-bbcd-2ec52a0cdd10
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-0657-e6e8ef12d30f
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-a710-f92323ecfa24
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-ce3c-a2544a8fb5dd
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-4648-078e647a9cb4
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-e7da-82bddbe1f9d5
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-8215-6261d27ad050
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-a96d-79bf2fcf6dcf
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-77be-9b34a0e645e4
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-052d-2cff5586bcd4
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-94e6-e10973d6f099
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-a247-eac6aebf8f39
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-0e1b-346fb3e2f15e
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-f84e-935f27b60d31
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-4e65-06d40df9d0a5
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-0485-1ce9baf39180
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-823e-8222939c57e9
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-dc90-4d8e678ee7c4
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-ef47-e559031d142d
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-e7d6-2ae202ff8bde
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-ccd5-0aee2cac2a09
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-25b2-be5a21ac92bf
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-237c-5fc4bf2a2afb
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-2576-634498d868c3
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-9e13-79ec68dd0bad
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-2f6f-372755ac54ca
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-59d1-fa0d1320bead
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-16ae-4524ce3a1856
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-c768-f04f70482db7
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-3ccc-835fc747ae02
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-928b-32ccd7416b30
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-36cf-27b92c3cbd88
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-f09a-4dbbd475be21
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-6cd2-f900f4bf8fe4
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-7783-b4746d2919f8
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-3f58-fcda8b7bd219
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-9cf2-474b2cb47e06
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-bd78-e64e91bf45c2
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-5521-73a6f64cde00
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-350a-8d5ace365e81
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-25f2-3e441037557e
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-3e79-a97ae48edab8
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-4ec1-04f18e369c70
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-525c-451541021151
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-efe9-72a57f17e4b6
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-8367-fcc18861afdb
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-aada-f9e5dd2f740c
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-7923-6860c07d8864
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-ea70-179bf9cf4280
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-1f65-453f0ba5011a
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-d343-293255246636
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-5cdc-618795e671fe
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-2b08-307163b64246
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-9c56-21a7c489cf52
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-34a6-d653b10f71a5
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-e521-7e2c57423c0c
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-d8af-731df04d97ea
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-5e1b-d6fd2f95a34a
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-826e-148720aae03c
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-09df-d4dc86759304
00020000-569c-eafc-f6b7-e8fa0388ccf0	00030000-569c-eafc-10be-b53aa415cee4
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-f720-0a7ef871dd80
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-ab3d-55b0a4ab5152
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-abb7-b5858995d388
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-bd92-3bcee162e4c1
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-2ef7-cfbb7daea150
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-bb76-3926ded9fc4d
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-7804-fa3616bcc98a
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-a710-f92323ecfa24
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-ce3c-a2544a8fb5dd
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-77be-9b34a0e645e4
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-052d-2cff5586bcd4
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-94e6-e10973d6f099
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-a247-eac6aebf8f39
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-0485-1ce9baf39180
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-823e-8222939c57e9
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-e7d6-2ae202ff8bde
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-237c-5fc4bf2a2afb
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-8367-fcc18861afdb
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-ea70-179bf9cf4280
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-1f65-453f0ba5011a
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-d343-293255246636
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-5cdc-618795e671fe
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-2b08-307163b64246
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-9c56-21a7c489cf52
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-e521-7e2c57423c0c
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-d8af-731df04d97ea
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-5e1b-d6fd2f95a34a
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-826e-148720aae03c
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-09df-d4dc86759304
00020000-569c-eafc-60eb-35e1229d0d60	00030000-569c-eafc-10be-b53aa415cee4
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-f720-0a7ef871dd80
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-ab3d-55b0a4ab5152
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-f867-ad8b0314fe09
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-5657-58062a4a36cd
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-abb7-b5858995d388
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-bd92-3bcee162e4c1
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-2ef7-cfbb7daea150
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-bb76-3926ded9fc4d
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-7804-fa3616bcc98a
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-a710-f92323ecfa24
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-ce3c-a2544a8fb5dd
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-4648-078e647a9cb4
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-e7da-82bddbe1f9d5
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-77be-9b34a0e645e4
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-052d-2cff5586bcd4
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-94e6-e10973d6f099
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-a247-eac6aebf8f39
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-0485-1ce9baf39180
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-823e-8222939c57e9
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-e7d6-2ae202ff8bde
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-237c-5fc4bf2a2afb
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-8367-fcc18861afdb
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-ea70-179bf9cf4280
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-1f65-453f0ba5011a
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-d343-293255246636
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-5cdc-618795e671fe
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-2b08-307163b64246
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-9c56-21a7c489cf52
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-34a6-d653b10f71a5
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-e521-7e2c57423c0c
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-d8af-731df04d97ea
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-5e1b-d6fd2f95a34a
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-826e-148720aae03c
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-09df-d4dc86759304
00020000-569c-eafd-820c-f90523e423c6	00030000-569c-eafc-10be-b53aa415cee4
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-ab3d-55b0a4ab5152
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-f867-ad8b0314fe09
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-5657-58062a4a36cd
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-abb7-b5858995d388
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-bd92-3bcee162e4c1
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-2ef7-cfbb7daea150
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-bb76-3926ded9fc4d
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-7804-fa3616bcc98a
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-bbcd-2ec52a0cdd10
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-0657-e6e8ef12d30f
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-a710-f92323ecfa24
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-ce3c-a2544a8fb5dd
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-4648-078e647a9cb4
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-e7da-82bddbe1f9d5
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-8215-6261d27ad050
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-a96d-79bf2fcf6dcf
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-77be-9b34a0e645e4
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-b044-e52ad6f23e0e
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-052d-2cff5586bcd4
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-94e6-e10973d6f099
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-a247-eac6aebf8f39
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-0e1b-346fb3e2f15e
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-f84e-935f27b60d31
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-4e65-06d40df9d0a5
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-0485-1ce9baf39180
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-e90a-462d34433df2
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-823e-8222939c57e9
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-dc90-4d8e678ee7c4
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-ef47-e559031d142d
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-e7d6-2ae202ff8bde
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-34c6-4a8ef26467b2
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-ccd5-0aee2cac2a09
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-25b2-be5a21ac92bf
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-237c-5fc4bf2a2afb
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-8398-4406f308d70a
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-2576-634498d868c3
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-9e13-79ec68dd0bad
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-2f6f-372755ac54ca
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-59d1-fa0d1320bead
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-16ae-4524ce3a1856
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-c768-f04f70482db7
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-3ccc-835fc747ae02
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-928b-32ccd7416b30
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-36cf-27b92c3cbd88
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-f09a-4dbbd475be21
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-6cd2-f900f4bf8fe4
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-7783-b4746d2919f8
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-3f58-fcda8b7bd219
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-9cf2-474b2cb47e06
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-bd78-e64e91bf45c2
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-5521-73a6f64cde00
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-350a-8d5ace365e81
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-25f2-3e441037557e
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-3e79-a97ae48edab8
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-4ec1-04f18e369c70
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-525c-451541021151
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-efe9-72a57f17e4b6
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-8367-fcc18861afdb
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-aada-f9e5dd2f740c
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-7923-6860c07d8864
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-ea70-179bf9cf4280
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-e4e8-20060a25b44e
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-1f65-453f0ba5011a
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-d343-293255246636
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-2b08-307163b64246
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-2b89-1c2ffb5ce049
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-9c56-21a7c489cf52
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-34a6-d653b10f71a5
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-e521-7e2c57423c0c
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-d8af-731df04d97ea
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-5e1b-d6fd2f95a34a
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-826e-148720aae03c
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-6604-d9b4400b5292
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-09df-d4dc86759304
00020000-569c-eafd-bde5-70fce4f360ae	00030000-569c-eafc-10be-b53aa415cee4
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-f720-0a7ef871dd80
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-ab3d-55b0a4ab5152
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-f867-ad8b0314fe09
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-5657-58062a4a36cd
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-abb7-b5858995d388
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-bd92-3bcee162e4c1
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-2ef7-cfbb7daea150
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-bb76-3926ded9fc4d
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-7804-fa3616bcc98a
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-a710-f92323ecfa24
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-ce3c-a2544a8fb5dd
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-4648-078e647a9cb4
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-e7da-82bddbe1f9d5
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-77be-9b34a0e645e4
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-b044-e52ad6f23e0e
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-052d-2cff5586bcd4
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-94e6-e10973d6f099
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-a247-eac6aebf8f39
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-0e1b-346fb3e2f15e
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-f84e-935f27b60d31
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-0485-1ce9baf39180
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-e90a-462d34433df2
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-823e-8222939c57e9
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-e7d6-2ae202ff8bde
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-34c6-4a8ef26467b2
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-237c-5fc4bf2a2afb
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-8398-4406f308d70a
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-8367-fcc18861afdb
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-aada-f9e5dd2f740c
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-ea70-179bf9cf4280
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-e4e8-20060a25b44e
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-1f65-453f0ba5011a
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-d343-293255246636
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-5cdc-618795e671fe
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-2b08-307163b64246
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-2b89-1c2ffb5ce049
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-9c56-21a7c489cf52
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-34a6-d653b10f71a5
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-e521-7e2c57423c0c
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-d8af-731df04d97ea
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-5e1b-d6fd2f95a34a
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-826e-148720aae03c
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-6604-d9b4400b5292
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-09df-d4dc86759304
00020000-569c-eafd-3097-438e5a70a4de	00030000-569c-eafc-10be-b53aa415cee4
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-f720-0a7ef871dd80
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-ab3d-55b0a4ab5152
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-f867-ad8b0314fe09
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-abb7-b5858995d388
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-2ef7-cfbb7daea150
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-a710-f92323ecfa24
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-ce3c-a2544a8fb5dd
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-4648-078e647a9cb4
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-77be-9b34a0e645e4
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-052d-2cff5586bcd4
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-a247-eac6aebf8f39
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-f84e-935f27b60d31
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-0485-1ce9baf39180
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-823e-8222939c57e9
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-e7d6-2ae202ff8bde
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-237c-5fc4bf2a2afb
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-8367-fcc18861afdb
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-aada-f9e5dd2f740c
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-ea70-179bf9cf4280
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-1f65-453f0ba5011a
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-d343-293255246636
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-5cdc-618795e671fe
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-2b08-307163b64246
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-9c56-21a7c489cf52
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-e521-7e2c57423c0c
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-826e-148720aae03c
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-09df-d4dc86759304
00020000-569c-eafd-d42e-a7289d5296f8	00030000-569c-eafc-10be-b53aa415cee4
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-f720-0a7ef871dd80
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-ab3d-55b0a4ab5152
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-f867-ad8b0314fe09
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-5657-58062a4a36cd
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-2ef7-cfbb7daea150
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-7804-fa3616bcc98a
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-bbcd-2ec52a0cdd10
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-0657-e6e8ef12d30f
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-a710-f92323ecfa24
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-ce3c-a2544a8fb5dd
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-8215-6261d27ad050
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-a96d-79bf2fcf6dcf
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-77be-9b34a0e645e4
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-b044-e52ad6f23e0e
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-052d-2cff5586bcd4
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-db3a-880976cc868c
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-94e6-e10973d6f099
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-a247-eac6aebf8f39
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-0e1b-346fb3e2f15e
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-f84e-935f27b60d31
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-4e65-06d40df9d0a5
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-0485-1ce9baf39180
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-e90a-462d34433df2
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-823e-8222939c57e9
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-dc90-4d8e678ee7c4
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-ef47-e559031d142d
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-e7d6-2ae202ff8bde
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-34c6-4a8ef26467b2
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-ccd5-0aee2cac2a09
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-25b2-be5a21ac92bf
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-237c-5fc4bf2a2afb
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-8398-4406f308d70a
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-2576-634498d868c3
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-9e13-79ec68dd0bad
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-2f6f-372755ac54ca
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-59d1-fa0d1320bead
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-16ae-4524ce3a1856
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-c768-f04f70482db7
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-3ccc-835fc747ae02
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-928b-32ccd7416b30
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-36cf-27b92c3cbd88
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-f09a-4dbbd475be21
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-6cd2-f900f4bf8fe4
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-7783-b4746d2919f8
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-3f58-fcda8b7bd219
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-9cf2-474b2cb47e06
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-bd78-e64e91bf45c2
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-5521-73a6f64cde00
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-350a-8d5ace365e81
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-25f2-3e441037557e
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-3e79-a97ae48edab8
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-4ec1-04f18e369c70
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-525c-451541021151
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-efe9-72a57f17e4b6
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-8367-fcc18861afdb
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-aada-f9e5dd2f740c
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-7923-6860c07d8864
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-ea70-179bf9cf4280
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-e4e8-20060a25b44e
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-1f65-453f0ba5011a
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-d343-293255246636
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-5cdc-618795e671fe
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-2b08-307163b64246
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-2b89-1c2ffb5ce049
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-9c56-21a7c489cf52
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-e521-7e2c57423c0c
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-61b1-1f4d35830d4b
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-d8af-731df04d97ea
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-5e1b-d6fd2f95a34a
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-826e-148720aae03c
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-6604-d9b4400b5292
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-09df-d4dc86759304
00020000-569c-eafd-d65e-a2160543db4d	00030000-569c-eafc-10be-b53aa415cee4
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-caa3-298ef81d66c5
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-ee7f-9e680764f7a2
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-f720-0a7ef871dd80
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-c1d6-c59e7e0b5f4f
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-ab3d-55b0a4ab5152
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-5657-58062a4a36cd
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-f867-ad8b0314fe09
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-86ec-a7814b3ded3e
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-6cc5-3d183a7d6437
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-a2ee-40c02616e156
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-8f12-2ea499eed1ea
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-abb7-b5858995d388
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-bd92-3bcee162e4c1
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-2ef7-cfbb7daea150
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-bb76-3926ded9fc4d
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-7804-fa3616bcc98a
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-34e2-c63f38a7fade
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-cdfc-9cf8eab17269
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-13c8-efdf295f1818
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-dec3-e2d406862c26
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-4a14-997e85805ca3
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-41f0-e6f30576f729
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-2d29-b046d6f1948f
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-872c-d0d7555acbea
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-62d7-a79371799dc7
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-bbcd-2ec52a0cdd10
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-0657-e6e8ef12d30f
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-a710-f92323ecfa24
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-33c6-517c398c54dc
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-00d7-43737a593751
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-9a09-71fc5daf1ab3
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-ce3c-a2544a8fb5dd
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-e7da-82bddbe1f9d5
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-4648-078e647a9cb4
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-3e1c-294c5639292d
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-447f-c673e5aa9264
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-1fb1-8a4f9f3ec107
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-8215-6261d27ad050
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-a96d-79bf2fcf6dcf
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-77be-9b34a0e645e4
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-b044-e52ad6f23e0e
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-eedb-b3f555141adb
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-7687-ccb5d79c6779
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-3e0f-2a74d55f1c09
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-d446-1f85362a396b
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-0ad1-ae4f05fb0069
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-cfd2-c33fe2cae185
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-b0c3-472c05c306c9
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-35a1-988733f3dae4
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-b494-d5c49bb66d95
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-a0e7-eedf6fd5bf90
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-a42d-de85d40dd951
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-6689-79ffe566fad9
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-3afd-a7d2e0c54a77
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-5f14-be2b25d4ddad
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-052d-2cff5586bcd4
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-db3a-880976cc868c
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-94e6-e10973d6f099
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-a247-eac6aebf8f39
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-0e1b-346fb3e2f15e
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-8b97-bcfe798c9305
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-5125-6693c386462c
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-9695-75057b504134
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-f659-b60e257fa2d1
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-f84e-935f27b60d31
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-4e65-06d40df9d0a5
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-0485-1ce9baf39180
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-e90a-462d34433df2
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-823e-8222939c57e9
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-dc90-4d8e678ee7c4
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-ef47-e559031d142d
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-3ab1-1726520ce2a0
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-43c6-84ed75db6aa8
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-2cec-0d422fb8da84
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-e7d6-2ae202ff8bde
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-34c6-4a8ef26467b2
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-8b40-d26f443673c5
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-bba6-2976dc97737c
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-2cb1-56ab23f79b22
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-8e85-b2ca34cf1b6c
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-4eca-3402df3d9b2f
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-07db-e866c7e19db9
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-ccd5-0aee2cac2a09
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-25b2-be5a21ac92bf
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-237c-5fc4bf2a2afb
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-8398-4406f308d70a
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-2576-634498d868c3
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-9e13-79ec68dd0bad
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-2f6f-372755ac54ca
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-59d1-fa0d1320bead
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-16ae-4524ce3a1856
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-c768-f04f70482db7
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-3ccc-835fc747ae02
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-928b-32ccd7416b30
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-36cf-27b92c3cbd88
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-f09a-4dbbd475be21
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-6cd2-f900f4bf8fe4
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-7783-b4746d2919f8
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-3f58-fcda8b7bd219
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-9cf2-474b2cb47e06
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-bd78-e64e91bf45c2
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-5521-73a6f64cde00
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-350a-8d5ace365e81
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-25f2-3e441037557e
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-3e79-a97ae48edab8
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-4ec1-04f18e369c70
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-525c-451541021151
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-efe9-72a57f17e4b6
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-8367-fcc18861afdb
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-d4cf-08b52e754fb5
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-b7fc-aec9faa0d02e
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-b3e4-79997fca947e
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-c7e6-e2cc1422d280
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-dde7-6b5bceddfa6e
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-2202-b653a58827a4
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-bf49-4a2eaedcc1b3
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-d71b-29c2688f9ce9
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-ae21-a5d160e88d61
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-5806-804e6b2b2dfb
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-0b78-0fa77d78dc49
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-8436-89f605ca7ddc
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-64c4-d449cdf981f4
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-c656-03a7161b0a46
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-1c6d-13c52fefebac
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-4c4d-1752d2fe011e
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-8cb7-ca7cf6a24624
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-2e6a-7350adfea3c2
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-8485-579fa82e1571
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-f0fc-b7b81a1f81cc
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-1cb5-f49708a3e663
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-4558-551d449de923
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-aada-f9e5dd2f740c
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-7923-6860c07d8864
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-ea70-179bf9cf4280
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-e4e8-20060a25b44e
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-1210-c420649da95d
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-089b-a80d5ef74c82
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-5fdd-8505e223d7d9
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-1f65-453f0ba5011a
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-a770-06b7e065440b
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-d343-293255246636
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-d7f0-b4cd335ba946
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-0df2-e6dc8acf5ee1
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-502b-ed2e6a6e9b5b
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-5cdc-618795e671fe
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-9fce-a1d9e592a811
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-2b08-307163b64246
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-2b89-1c2ffb5ce049
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-9c56-21a7c489cf52
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-34a6-d653b10f71a5
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-a61f-b3ae0ed7f186
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-c090-0b50c7b308eb
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-95fa-7de1ce1ac522
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-4308-fd9c5c527c6b
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-e521-7e2c57423c0c
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-61b1-1f4d35830d4b
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-b91c-ecffae8b363a
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-9bae-e147e10619a4
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-d8af-731df04d97ea
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-5e1b-d6fd2f95a34a
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-826e-148720aae03c
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-6604-d9b4400b5292
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-09df-d4dc86759304
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-35a7-3a5cbd00de15
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-10be-b53aa415cee4
00020000-569c-eafe-7f67-a01fed064b97	00030000-569c-eafc-a7ab-db55e5a07d6c
00020000-569c-eafe-211b-0be2171742dd	00030000-569c-eafc-9f56-2d84eaa78ade
00020000-569c-eafe-f10e-5cbf61ac7369	00030000-569c-eafc-d8af-731df04d97ea
00020000-569c-eafe-988d-e5b69e9526c4	00030000-569c-eafc-34a6-d653b10f71a5
00020000-569c-eafe-ea74-914c324570f0	00030000-569c-eafc-9c56-21a7c489cf52
00020000-569c-eafe-3ce7-cc3bda6e47f1	00030000-569c-eafc-cfd2-c33fe2cae185
00020000-569c-eafe-3c19-cab9be6298c2	00030000-569c-eafc-b0c3-472c05c306c9
00020000-569c-eafe-8058-8cc2413bf411	00030000-569c-eafc-35a1-988733f3dae4
00020000-569c-eafe-483c-aa1bd53cd83b	00030000-569c-eafc-0ad1-ae4f05fb0069
00020000-569c-eafe-f65e-0bb82dbb414e	00030000-569c-eafc-3e0f-2a74d55f1c09
00020000-569c-eafe-3550-de7d7dc7a997	00030000-569c-eafc-d446-1f85362a396b
00020000-569c-eafe-d70e-2057f90fcc23	00030000-569c-eafc-57ad-60f51e5a5b13
00020000-569c-eafe-b33b-1b82090cc87c	00030000-569c-eafc-5e1b-d6fd2f95a34a
00020000-569c-eafe-4b94-8c32f264c4b9	00030000-569c-eafc-e792-2cdd5a89ef1a
00020000-569c-eafe-6f9e-69b00d89b4a4	00030000-569c-eafc-94e6-e10973d6f099
00020000-569c-eafe-b202-894c454c7c90	00030000-569c-eafc-0e1b-346fb3e2f15e
00020000-569c-eafe-da47-7431be924ce4	00030000-569c-eafc-a247-eac6aebf8f39
00020000-569c-eafe-7afe-0cc307ed28a8	00030000-569c-eafc-7804-fa3616bcc98a
00020000-569c-eafe-207f-aa3d445726cc	00030000-569c-eafc-eb81-7c49e1b4c306
00020000-569c-eafe-0eca-07dcec456018	00030000-569c-eafc-0485-1ce9baf39180
00020000-569c-eafe-0eca-07dcec456018	00030000-569c-eafc-e90a-462d34433df2
00020000-569c-eafe-0eca-07dcec456018	00030000-569c-eafc-9c56-21a7c489cf52
00020000-569c-eafe-a61b-fe5eb1141825	00030000-569c-eafc-2b08-307163b64246
00020000-569c-eafe-05ef-b25d0e24d321	00030000-569c-eafc-2b89-1c2ffb5ce049
00020000-569c-eafe-e508-e931ca5e527d	00030000-569c-eafc-4558-551d449de923
00020000-569c-eafe-526b-472b3654764f	00030000-569c-eafc-ea70-179bf9cf4280
00020000-569c-eafe-249a-f7990a743174	00030000-569c-eafc-e4e8-20060a25b44e
00020000-569c-eafe-cf45-36fd2203bee3	00030000-569c-eafc-e7d6-2ae202ff8bde
00020000-569c-eafe-85c0-be7d2b1401f1	00030000-569c-eafc-34c6-4a8ef26467b2
00020000-569c-eafe-fef1-ac3a4324a3a1	00030000-569c-eafc-826e-148720aae03c
00020000-569c-eafe-f08b-c7eb19d2311c	00030000-569c-eafc-6604-d9b4400b5292
00020000-569c-eafe-06fd-a9a7681ddeb5	00030000-569c-eafc-f84e-935f27b60d31
00020000-569c-eafe-7a56-93334c257421	00030000-569c-eafc-4e65-06d40df9d0a5
00020000-569c-eafe-664c-148cf8afa114	00030000-569c-eafc-aada-f9e5dd2f740c
00020000-569c-eafe-b9fb-1dbac6a8f415	00030000-569c-eafc-7923-6860c07d8864
00020000-569c-eafe-46ab-050988480e48	00030000-569c-eafc-ab3d-55b0a4ab5152
00020000-569c-eafe-cffa-bf167c87ebed	00030000-569c-eafc-f867-ad8b0314fe09
00020000-569c-eafe-e5a8-05e347087a6d	00030000-569c-eafc-5657-58062a4a36cd
00020000-569c-eafe-f20a-41a5e5ff6e85	00030000-569c-eafc-ce3c-a2544a8fb5dd
00020000-569c-eaff-1988-7370f33508ca	00030000-569c-eafc-4648-078e647a9cb4
00020000-569c-eaff-78d2-e233a1e4e63d	00030000-569c-eafc-e7da-82bddbe1f9d5
\.


--
-- TOC entry 3182 (class 0 OID 37460623)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 37460657)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 37460790)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-569c-eaff-ddfb-35e02baa7208	00090000-569c-eaff-fde0-472199fc7dc5	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-569c-eaff-0a73-9d22ae32a8b8	00090000-569c-eaff-2f1e-0c1b8b430a9f	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-569c-eaff-4ae7-04d060d86f34	00090000-569c-eaff-9800-0bc8b53b9122	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-569c-eaff-ffe2-3b01e209c013	00090000-569c-eaff-b8ac-86a1a9b06c87	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3151 (class 0 OID 37460306)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-569c-eaff-49e7-bc1472a1f4c5	\N	00040000-569c-eafc-a347-252cef0dca1b	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-eaff-1211-6df054f7082e	\N	00040000-569c-eafc-a347-252cef0dca1b	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-569c-eaff-9cf4-72e9c2e268df	\N	00040000-569c-eafc-a347-252cef0dca1b	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-eaff-5ae1-c9e039eedb4b	\N	00040000-569c-eafc-a347-252cef0dca1b	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-eaff-01da-f9bec3d7a31b	\N	00040000-569c-eafc-a347-252cef0dca1b	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-eaff-9cf9-5d7e534553bb	\N	00040000-569c-eafc-8ee6-f5d27e135d77	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-eaff-a5f9-df8f1768b306	\N	00040000-569c-eafc-6dfc-23a6f1d0c172	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-eaff-8157-f9b92c292ee4	\N	00040000-569c-eafc-fd0f-b41a7a6c013b	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-eaff-d4b1-8b042755aa0b	\N	00040000-569c-eafc-8700-a05d5ddb51d6	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-eb01-2880-6056bba05276	\N	00040000-569c-eafc-a347-252cef0dca1b	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3154 (class 0 OID 37460351)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-569c-eafb-06bf-ebd0d9e5780d	8341	Adlešiči
00050000-569c-eafb-bdf9-b0fb9b80988f	5270	Ajdovščina
00050000-569c-eafb-3eee-66029a9d397b	6280	Ankaran/Ancarano
00050000-569c-eafb-86c9-e5be80318e27	9253	Apače
00050000-569c-eafb-8ef2-0658ab0c1f8d	8253	Artiče
00050000-569c-eafb-1b48-e191171104e1	4275	Begunje na Gorenjskem
00050000-569c-eafb-066f-a22773fd9cb1	1382	Begunje pri Cerknici
00050000-569c-eafb-3ae2-776042ecfce6	9231	Beltinci
00050000-569c-eafb-dace-1429c8161532	2234	Benedikt
00050000-569c-eafb-de70-1f349e18f1a8	2345	Bistrica ob Dravi
00050000-569c-eafb-0f6b-080987a6b113	3256	Bistrica ob Sotli
00050000-569c-eafb-f684-bae63ad04aa1	8259	Bizeljsko
00050000-569c-eafb-b094-17ed3c7df760	1223	Blagovica
00050000-569c-eafb-c34a-d88ebd7b7d43	8283	Blanca
00050000-569c-eafb-6fc0-cfeda3355893	4260	Bled
00050000-569c-eafb-dc72-4c00466c461d	4273	Blejska Dobrava
00050000-569c-eafb-c19b-c98dc756f34a	9265	Bodonci
00050000-569c-eafb-151b-54097e4b8270	9222	Bogojina
00050000-569c-eafb-3953-9896d12c980c	4263	Bohinjska Bela
00050000-569c-eafb-0846-f106d715e9f0	4264	Bohinjska Bistrica
00050000-569c-eafb-3488-e6cb8abb848c	4265	Bohinjsko jezero
00050000-569c-eafb-db50-ce24eee10326	1353	Borovnica
00050000-569c-eafb-8581-e6a983bbc1ca	8294	Boštanj
00050000-569c-eafb-e5e5-88b92992dd03	5230	Bovec
00050000-569c-eafb-a59c-3e5c46003923	5295	Branik
00050000-569c-eafb-a506-745d45252c8e	3314	Braslovče
00050000-569c-eafb-fa0e-6c3afa4a1c0c	5223	Breginj
00050000-569c-eafb-562b-266aba25dbca	8280	Brestanica
00050000-569c-eafb-020c-be05b4fb28cd	2354	Bresternica
00050000-569c-eafb-a68a-72c827221a69	4243	Brezje
00050000-569c-eafb-fd54-4a4ad67c8aa7	1351	Brezovica pri Ljubljani
00050000-569c-eafb-4d40-2074875eecff	8250	Brežice
00050000-569c-eafb-d746-7fc51a2680ec	4210	Brnik - Aerodrom
00050000-569c-eafb-b708-7cef60a71f1f	8321	Brusnice
00050000-569c-eafb-e898-4d4ef0bd6e71	3255	Buče
00050000-569c-eafb-da81-5ae610c9e5de	8276	Bučka 
00050000-569c-eafb-9883-4ca17c308172	9261	Cankova
00050000-569c-eafb-0af0-540cbfa15233	3000	Celje 
00050000-569c-eafb-1d8e-a4f9a06b33e6	3001	Celje - poštni predali
00050000-569c-eafb-77e9-4db6c2499c1f	4207	Cerklje na Gorenjskem
00050000-569c-eafb-5538-8fe374064e2e	8263	Cerklje ob Krki
00050000-569c-eafb-5d19-95b9814d2331	1380	Cerknica
00050000-569c-eafb-0a28-3e7704b8670c	5282	Cerkno
00050000-569c-eafb-a74b-994dfb19bd93	2236	Cerkvenjak
00050000-569c-eafb-c19a-45d75e0a22a3	2215	Ceršak
00050000-569c-eafb-2f9c-8ed3aef9417a	2326	Cirkovce
00050000-569c-eafb-0795-30c8cc4ee55a	2282	Cirkulane
00050000-569c-eafb-1c16-d79d40104c54	5273	Col
00050000-569c-eafb-5179-04df50a5e733	8251	Čatež ob Savi
00050000-569c-eafb-7093-ba45bd986c21	1413	Čemšenik
00050000-569c-eafb-248d-3298feac2b3d	5253	Čepovan
00050000-569c-eafb-4e05-6ac20d375839	9232	Črenšovci
00050000-569c-eafb-294d-18f70c672881	2393	Črna na Koroškem
00050000-569c-eafb-9f22-c0da67f554cb	6275	Črni Kal
00050000-569c-eafb-2c4b-1a7e13173167	5274	Črni Vrh nad Idrijo
00050000-569c-eafb-ef35-4c2f9815054d	5262	Črniče
00050000-569c-eafb-679d-7db3381c3c93	8340	Črnomelj
00050000-569c-eafb-dbfb-082f86c3140e	6271	Dekani
00050000-569c-eafb-c3fa-7125224af4e4	5210	Deskle
00050000-569c-eafb-e305-b99eafc7c561	2253	Destrnik
00050000-569c-eafb-3bdc-cbff9f5140db	6215	Divača
00050000-569c-eafb-f361-db5665053560	1233	Dob
00050000-569c-eafb-8bb8-939c379b5da9	3224	Dobje pri Planini
00050000-569c-eafb-2afd-637dac110df1	8257	Dobova
00050000-569c-eafb-4c83-4a854d040329	1423	Dobovec
00050000-569c-eafb-fd34-ca96eb37b61c	5263	Dobravlje
00050000-569c-eafb-8b36-aef0007b6655	3204	Dobrna
00050000-569c-eafb-483e-1eff565eff42	8211	Dobrnič
00050000-569c-eafb-af2e-00a3d3a3e516	1356	Dobrova
00050000-569c-eafb-2a28-71bcdba7300f	9223	Dobrovnik/Dobronak 
00050000-569c-eafb-54f5-316fb7d35c83	5212	Dobrovo v Brdih
00050000-569c-eafb-1ea2-78e9f3a57dda	1431	Dol pri Hrastniku
00050000-569c-eafb-46fb-fb5dfaeb7e19	1262	Dol pri Ljubljani
00050000-569c-eafb-244e-36de4a67be9c	1273	Dole pri Litiji
00050000-569c-eafb-5c5a-0c1b62172e4f	1331	Dolenja vas
00050000-569c-eafb-d3e4-0e9da0bdc9b4	8350	Dolenjske Toplice
00050000-569c-eafb-44fe-b58bce1e190d	1230	Domžale
00050000-569c-eafb-2b18-938e08e410db	2252	Dornava
00050000-569c-eafb-c90d-c8df374c2768	5294	Dornberk
00050000-569c-eafb-ffb2-09f6739cc534	1319	Draga
00050000-569c-eafb-0c6f-298e7483c0b0	8343	Dragatuš
00050000-569c-eafb-90dc-f8c652b304d1	3222	Dramlje
00050000-569c-eafb-5670-f0176dacd955	2370	Dravograd
00050000-569c-eafb-2f7f-2a08bdda3398	4203	Duplje
00050000-569c-eafb-c5e8-041fa3cad5e6	6221	Dutovlje
00050000-569c-eafb-f38c-881f6ca76eba	8361	Dvor
00050000-569c-eafb-0031-ee2ed73a9840	2343	Fala
00050000-569c-eafb-f8d5-1adbe56e4a37	9208	Fokovci
00050000-569c-eafb-a7e8-e20df2512cd4	2313	Fram
00050000-569c-eafb-63d9-0c247612115a	3213	Frankolovo
00050000-569c-eafb-b60e-3071cfc2c24a	1274	Gabrovka
00050000-569c-eafb-146e-3641f0155a9f	8254	Globoko
00050000-569c-eafb-0f59-851f4ad43fdf	5275	Godovič
00050000-569c-eafb-a0d1-ed873490d14a	4204	Golnik
00050000-569c-eafb-bea6-a24f87f51f53	3303	Gomilsko
00050000-569c-eafb-774e-22b9a433c4ab	4224	Gorenja vas
00050000-569c-eafb-a039-8bc75b88a202	3263	Gorica pri Slivnici
00050000-569c-eafb-1a43-4f76ccd51d4f	2272	Gorišnica
00050000-569c-eafb-566d-6f1e44ec0cd4	9250	Gornja Radgona
00050000-569c-eafb-10fa-1234cec56b0d	3342	Gornji Grad
00050000-569c-eafb-fc24-2422475d3da4	4282	Gozd Martuljek
00050000-569c-eafb-842a-eecf7f177ae2	6272	Gračišče
00050000-569c-eafb-cce4-b383c74e1cde	9264	Grad
00050000-569c-eafb-8e5d-ce7288b9bdc4	8332	Gradac
00050000-569c-eafb-15b0-0c957fae80bc	1384	Grahovo
00050000-569c-eafb-44d1-eca80e037f18	5242	Grahovo ob Bači
00050000-569c-eafb-7ae3-2e2c16010370	5251	Grgar
00050000-569c-eafb-43cd-c8cf65b6647c	3302	Griže
00050000-569c-eafb-33bd-7e97cf81a8b1	3231	Grobelno
00050000-569c-eafb-6d8d-079a2fb9aab7	1290	Grosuplje
00050000-569c-eafb-d87b-930781472172	2288	Hajdina
00050000-569c-eafb-9c3f-2ab0b9ee7f4d	8362	Hinje
00050000-569c-eafb-0090-823fdea1086f	2311	Hoče
00050000-569c-eafb-40d1-a9d85aebfe7d	9205	Hodoš/Hodos
00050000-569c-eafb-b62a-1cf672c2d935	1354	Horjul
00050000-569c-eafb-5bbc-ba9b7ec31e86	1372	Hotedršica
00050000-569c-eafb-f01e-e67fba2675ac	1430	Hrastnik
00050000-569c-eafb-3c7c-df9e2b3480d0	6225	Hruševje
00050000-569c-eafb-3a6c-f1d116f79ae9	4276	Hrušica
00050000-569c-eafb-3b8b-02122540eb50	5280	Idrija
00050000-569c-eafb-67cc-d9c5d3f7adca	1292	Ig
00050000-569c-eafb-10e7-686f6752cf70	6250	Ilirska Bistrica
00050000-569c-eafb-94ea-9a4f14b8897a	6251	Ilirska Bistrica-Trnovo
00050000-569c-eafb-1332-f177d7272c81	1295	Ivančna Gorica
00050000-569c-eafb-99cc-b6c5d2eb2575	2259	Ivanjkovci
00050000-569c-eafb-ee6a-cda212055c38	1411	Izlake
00050000-569c-eafb-1c1f-d3a840cccfa6	6310	Izola/Isola
00050000-569c-eafb-45d6-baae03a2366b	2222	Jakobski Dol
00050000-569c-eafb-1efe-e2cb1ccfa7db	2221	Jarenina
00050000-569c-eafb-2710-a7e2373dfa2f	6254	Jelšane
00050000-569c-eafb-2135-bbc73376112f	4270	Jesenice
00050000-569c-eafb-14f5-6f50c37eda0d	8261	Jesenice na Dolenjskem
00050000-569c-eafb-ec8e-44040e517403	3273	Jurklošter
00050000-569c-eafb-ac10-845b83925109	2223	Jurovski Dol
00050000-569c-eafb-290f-d99f7b5cec43	2256	Juršinci
00050000-569c-eafb-4c5d-6f199f299aa4	5214	Kal nad Kanalom
00050000-569c-eafb-b32c-cbe556cee1b2	3233	Kalobje
00050000-569c-eafb-1aab-211ed26c114d	4246	Kamna Gorica
00050000-569c-eafb-3541-a1f9d43435ce	2351	Kamnica
00050000-569c-eafb-953c-9e9d015de71b	1241	Kamnik
00050000-569c-eafb-1e98-2db502f8078a	5213	Kanal
00050000-569c-eafb-15e1-e2dd374e8cbb	8258	Kapele
00050000-569c-eafb-5868-ed78fcf958f7	2362	Kapla
00050000-569c-eafb-a37a-8cb834d9f098	2325	Kidričevo
00050000-569c-eafb-ede1-f46d97c77fd7	1412	Kisovec
00050000-569c-eafb-a5b4-394ea57f3f5c	6253	Knežak
00050000-569c-eafb-702a-8cfb69880a86	5222	Kobarid
00050000-569c-eafb-ca91-746b7b957057	9227	Kobilje
00050000-569c-eafb-45d9-32e9c8bc0f76	1330	Kočevje
00050000-569c-eafb-2443-242f82539838	1338	Kočevska Reka
00050000-569c-eafb-6d65-8e618bdeecdb	2276	Kog
00050000-569c-eafb-065c-bad9ea6aa960	5211	Kojsko
00050000-569c-eafb-6ec4-1293ebe4ba07	6223	Komen
00050000-569c-eafb-fd3c-3acf163e7640	1218	Komenda
00050000-569c-eafb-3783-b6451bf46498	6000	Koper/Capodistria 
00050000-569c-eafb-56b1-90836a0b3322	6001	Koper/Capodistria - poštni predali
00050000-569c-eafb-3383-4a9e1d0af216	8282	Koprivnica
00050000-569c-eafb-4a97-ef50f200c4aa	5296	Kostanjevica na Krasu
00050000-569c-eafb-cce3-6fee15be21f3	8311	Kostanjevica na Krki
00050000-569c-eafb-d4f6-b010b2aeb4c9	1336	Kostel
00050000-569c-eafb-fe49-fc271daeff4c	6256	Košana
00050000-569c-eafb-79d6-f438403b2158	2394	Kotlje
00050000-569c-eafb-883b-5f7623095c04	6240	Kozina
00050000-569c-eafb-e23c-cda15748e4de	3260	Kozje
00050000-569c-eafb-226e-19d3f40fa835	4000	Kranj 
00050000-569c-eafb-e375-2f7c9914e33b	4001	Kranj - poštni predali
00050000-569c-eafb-8c85-35f283752063	4280	Kranjska Gora
00050000-569c-eafb-a3e2-659b58336f5e	1281	Kresnice
00050000-569c-eafb-a767-4c2fbc934014	4294	Križe
00050000-569c-eafb-9c71-bec817072a9e	9206	Križevci
00050000-569c-eafb-5e89-9d512422ea70	9242	Križevci pri Ljutomeru
00050000-569c-eafb-fbcc-c1928c69f237	1301	Krka
00050000-569c-eafb-7fe4-42cfcdc5be1b	8296	Krmelj
00050000-569c-eafb-0121-3d5de7a15a71	4245	Kropa
00050000-569c-eafb-f92e-4c920d2d9494	8262	Krška vas
00050000-569c-eafb-65cd-40579f27c54c	8270	Krško
00050000-569c-eafb-7547-628d64d3ed4c	9263	Kuzma
00050000-569c-eafb-7207-0351d996e4b3	2318	Laporje
00050000-569c-eafb-1791-f978bb70e538	3270	Laško
00050000-569c-eafb-72ff-c5662baa03c5	1219	Laze v Tuhinju
00050000-569c-eafb-a423-720a581a74f0	2230	Lenart v Slovenskih goricah
00050000-569c-eafb-99c9-aa750d42ccf2	9220	Lendava/Lendva
00050000-569c-eafb-9ff1-1cc815e33619	4248	Lesce
00050000-569c-eafb-3cac-e82c1498581e	3261	Lesično
00050000-569c-eafb-f836-a3d5eb0bbf7d	8273	Leskovec pri Krškem
00050000-569c-eafb-bfd9-f48a153834a2	2372	Libeliče
00050000-569c-eafb-94c5-b87c7e7b602a	2341	Limbuš
00050000-569c-eafb-8c52-4f1c17da2453	1270	Litija
00050000-569c-eafb-12d0-22894be89739	3202	Ljubečna
00050000-569c-eafb-0d90-097060d31fe5	1000	Ljubljana 
00050000-569c-eafb-4715-fbd588e2a393	1001	Ljubljana - poštni predali
00050000-569c-eafb-5127-34396e87ba55	1231	Ljubljana - Črnuče
00050000-569c-eafb-e5b9-121c89f9b589	1261	Ljubljana - Dobrunje
00050000-569c-eafb-427e-742d088a52d3	1260	Ljubljana - Polje
00050000-569c-eafb-36e4-9cad7251439d	1210	Ljubljana - Šentvid
00050000-569c-eafb-867b-f12b7d103bbf	1211	Ljubljana - Šmartno
00050000-569c-eafb-cfac-d26827fdc156	3333	Ljubno ob Savinji
00050000-569c-eafb-93eb-cce9d9df40b4	9240	Ljutomer
00050000-569c-eafb-1111-bc769a30163e	3215	Loče
00050000-569c-eafb-4de4-c7c06f37e03d	5231	Log pod Mangartom
00050000-569c-eafb-0b10-7964e9480dc8	1358	Log pri Brezovici
00050000-569c-eafb-389c-5d72cba096a8	1370	Logatec
00050000-569c-eafb-582f-34d404b3e9d2	1371	Logatec
00050000-569c-eafb-ec81-782e0489d645	1434	Loka pri Zidanem Mostu
00050000-569c-eafb-8063-7779536b2a0c	3223	Loka pri Žusmu
00050000-569c-eafb-58fc-9df65088c735	6219	Lokev
00050000-569c-eafb-5f6a-182c07167a46	1318	Loški Potok
00050000-569c-eafb-e87c-bbd65846ab16	2324	Lovrenc na Dravskem polju
00050000-569c-eafb-c9ca-4081ff149d4a	2344	Lovrenc na Pohorju
00050000-569c-eafb-3882-73787b7661e1	3334	Luče
00050000-569c-eafb-af48-2516a12c0251	1225	Lukovica
00050000-569c-eafb-18c1-fd5be6c66faa	9202	Mačkovci
00050000-569c-eafb-e3bc-a0e7efa7b0b0	2322	Majšperk
00050000-569c-eafb-ee20-5cbc86d0da21	2321	Makole
00050000-569c-eafb-d8f3-e02825d31cb7	9243	Mala Nedelja
00050000-569c-eafb-87d2-8a9dbda053dd	2229	Malečnik
00050000-569c-eafb-b256-eb57500db074	6273	Marezige
00050000-569c-eafb-2776-befe60975268	2000	Maribor 
00050000-569c-eafb-afbf-ceb5c0b14191	2001	Maribor - poštni predali
00050000-569c-eafb-0b29-e3426560e72d	2206	Marjeta na Dravskem polju
00050000-569c-eafb-d9dc-bc11bcea220f	2281	Markovci
00050000-569c-eafb-abc8-d1b2cb3217a5	9221	Martjanci
00050000-569c-eafb-60f4-07ae3f8b5118	6242	Materija
00050000-569c-eafb-24e6-cc9f323bc051	4211	Mavčiče
00050000-569c-eafb-cd7d-beb609b7a490	1215	Medvode
00050000-569c-eafb-0d6d-8c6eef161900	1234	Mengeš
00050000-569c-eafb-2760-f1e674970e1d	8330	Metlika
00050000-569c-eafb-3eae-c1ab5e32e163	2392	Mežica
00050000-569c-eafb-0f5b-49cddd00899f	2204	Miklavž na Dravskem polju
00050000-569c-eafb-b738-e353c39e20d0	2275	Miklavž pri Ormožu
00050000-569c-eafb-93a6-55fa185a8a9e	5291	Miren
00050000-569c-eafb-d7f0-4b381ef0e668	8233	Mirna
00050000-569c-eafb-85b3-db97c70dfb83	8216	Mirna Peč
00050000-569c-eafb-0ba0-422040075474	2382	Mislinja
00050000-569c-eafb-b51b-715c2afe3cbc	4281	Mojstrana
00050000-569c-eafb-53cf-a061a29111f4	8230	Mokronog
00050000-569c-eafb-2fa5-3f28137d50b2	1251	Moravče
00050000-569c-eafb-dc7f-ab84e154423f	9226	Moravske Toplice
00050000-569c-eafb-7341-89ff406a2322	5216	Most na Soči
00050000-569c-eafb-ed52-408b19bfafea	1221	Motnik
00050000-569c-eafb-fa80-b870750f52a4	3330	Mozirje
00050000-569c-eafb-7ea2-20f0ad70df6b	9000	Murska Sobota 
00050000-569c-eafb-36a5-3ae77c94f17c	9001	Murska Sobota - poštni predali
00050000-569c-eafb-d680-4ab90a450db8	2366	Muta
00050000-569c-eafb-b60d-6ddfc5039608	4202	Naklo
00050000-569c-eafb-3fb8-5f0c06369f12	3331	Nazarje
00050000-569c-eafb-d858-d2d1ad17de9e	1357	Notranje Gorice
00050000-569c-eafb-6a13-d241fd391dd0	3203	Nova Cerkev
00050000-569c-eafb-7f14-6340e075b7ec	5000	Nova Gorica 
00050000-569c-eafb-4e8a-6147f5683cde	5001	Nova Gorica - poštni predali
00050000-569c-eafb-003d-6f5478965785	1385	Nova vas
00050000-569c-eafb-72fa-704228a8edea	8000	Novo mesto
00050000-569c-eafb-96dc-4e7ae59fdc3e	8001	Novo mesto - poštni predali
00050000-569c-eafb-665f-81f1ef6c8032	6243	Obrov
00050000-569c-eafb-a543-927f9aafa627	9233	Odranci
00050000-569c-eafb-fb1e-2949eb02624f	2317	Oplotnica
00050000-569c-eafb-940b-562292fa028b	2312	Orehova vas
00050000-569c-eafb-e9d3-6ee4b768ee6e	2270	Ormož
00050000-569c-eafb-83a1-406a71e70218	1316	Ortnek
00050000-569c-eafb-1f62-80de5730651d	1337	Osilnica
00050000-569c-eafb-142d-dd99621423fe	8222	Otočec
00050000-569c-eafb-c137-5d66b5b19edc	2361	Ožbalt
00050000-569c-eafb-8aa3-ebad62a7fea7	2231	Pernica
00050000-569c-eafb-4b9e-463287780273	2211	Pesnica pri Mariboru
00050000-569c-eafb-0722-0d3aa1fbcc08	9203	Petrovci
00050000-569c-eafb-3b7c-43c0b0221712	3301	Petrovče
00050000-569c-eafb-c9ab-1bd585e23ded	6330	Piran/Pirano
00050000-569c-eafb-de0d-0c6e61114abe	8255	Pišece
00050000-569c-eafb-41bb-c8bb812a87bf	6257	Pivka
00050000-569c-eafb-5c1a-565bbb9e5405	6232	Planina
00050000-569c-eafb-7230-f0ef19ef2693	3225	Planina pri Sevnici
00050000-569c-eafb-2c69-f4736da5c7af	6276	Pobegi
00050000-569c-eafb-46a3-6d944d7680ab	8312	Podbočje
00050000-569c-eafb-64f8-c6445ccd0f7c	5243	Podbrdo
00050000-569c-eafb-59f6-72b00c0974f2	3254	Podčetrtek
00050000-569c-eafb-6e5a-33852d7d8ebe	2273	Podgorci
00050000-569c-eafb-0291-8cde534d0e2d	6216	Podgorje
00050000-569c-eafb-e73d-88e6564f71b6	2381	Podgorje pri Slovenj Gradcu
00050000-569c-eafb-bdc6-1dbef91d0ea5	6244	Podgrad
00050000-569c-eafb-9b2e-3b6fb36053fc	1414	Podkum
00050000-569c-eafb-0756-dea8d4f010e3	2286	Podlehnik
00050000-569c-eafb-f58e-85725bf8d1d9	5272	Podnanos
00050000-569c-eafb-b99b-bc482e9236f6	4244	Podnart
00050000-569c-eafb-29cd-15f87c7f43ee	3241	Podplat
00050000-569c-eafb-593e-39f417c29a1f	3257	Podsreda
00050000-569c-eafb-7cae-27b65aa99765	2363	Podvelka
00050000-569c-eafb-6ec6-da1617e5e09f	2208	Pohorje
00050000-569c-eafb-0172-d8b94e07685a	2257	Polenšak
00050000-569c-eafb-c23e-d3ad752f5ab9	1355	Polhov Gradec
00050000-569c-eafb-7880-576bdad0b42f	4223	Poljane nad Škofjo Loko
00050000-569c-eafb-5132-90846a3099ab	2319	Poljčane
00050000-569c-eafb-5c73-13f9276046a0	1272	Polšnik
00050000-569c-eafb-4f6a-29fcb2d42ac0	3313	Polzela
00050000-569c-eafb-3b7c-058fe2f3ae6a	3232	Ponikva
00050000-569c-eafb-1459-2a753fea7c86	6320	Portorož/Portorose
00050000-569c-eafb-bd03-bf4d8b5660a3	6230	Postojna
00050000-569c-eafb-6565-ec813fa65264	2331	Pragersko
00050000-569c-eafb-1ddd-20125ea33a97	3312	Prebold
00050000-569c-eafb-6f0e-85fe1ce34e6e	4205	Preddvor
00050000-569c-eafb-9ba7-f4be9e89ffa4	6255	Prem
00050000-569c-eafb-d6e8-5c923474529c	1352	Preserje
00050000-569c-eafb-5135-140b20aa52d0	6258	Prestranek
00050000-569c-eafb-6e12-4ed65eb9e90f	2391	Prevalje
00050000-569c-eafb-be61-5fb923b482e7	3262	Prevorje
00050000-569c-eafb-54a0-2f1b2c984ea6	1276	Primskovo 
00050000-569c-eafb-8a44-46959580d9fb	3253	Pristava pri Mestinju
00050000-569c-eafb-07d6-616f93fae6f4	9207	Prosenjakovci/Partosfalva
00050000-569c-eafb-b90f-2215b67f2c7d	5297	Prvačina
00050000-569c-eafb-1e18-9f43ddca51ba	2250	Ptuj
00050000-569c-eafb-ebe3-42116929d2ba	2323	Ptujska Gora
00050000-569c-eafb-6032-263222455a12	9201	Puconci
00050000-569c-eafb-a41d-eb578fa9f942	2327	Rače
00050000-569c-eafb-260e-94c4d52965b2	1433	Radeče
00050000-569c-eafb-feb0-1ea2ad2f07e7	9252	Radenci
00050000-569c-eafb-a693-ab98e5ee784c	2360	Radlje ob Dravi
00050000-569c-eafb-e0bb-05a4982ad237	1235	Radomlje
00050000-569c-eafb-be52-f7206c6d262e	4240	Radovljica
00050000-569c-eafb-0466-4c19a8b18bb0	8274	Raka
00050000-569c-eafb-6b45-f9c9c1b0209c	1381	Rakek
00050000-569c-eafb-850f-3c324c05caea	4283	Rateče - Planica
00050000-569c-eafb-f0dc-d1d079d52813	2390	Ravne na Koroškem
00050000-569c-eafb-ad20-33b788a51879	9246	Razkrižje
00050000-569c-eafb-92a9-758d71a952a2	3332	Rečica ob Savinji
00050000-569c-eafb-98e1-bdb6b30cae8f	5292	Renče
00050000-569c-eafb-9775-14a66a261fd4	1310	Ribnica
00050000-569c-eafb-72d0-aefca10c1266	2364	Ribnica na Pohorju
00050000-569c-eafb-eb56-97d41b874522	3272	Rimske Toplice
00050000-569c-eafb-0e48-a73417e75604	1314	Rob
00050000-569c-eafb-111b-d591ba61fd3b	5215	Ročinj
00050000-569c-eafb-4ff1-ec8aef5021c6	3250	Rogaška Slatina
00050000-569c-eafb-5442-eea05d486909	9262	Rogašovci
00050000-569c-eafb-f3d2-2da230fd91ff	3252	Rogatec
00050000-569c-eafb-7073-63726b42585b	1373	Rovte
00050000-569c-eafb-6555-d0cbb728d514	2342	Ruše
00050000-569c-eafb-c339-59f80687509f	1282	Sava
00050000-569c-eafb-f8c9-f4cca9dd4caf	6333	Sečovlje/Sicciole
00050000-569c-eafb-39ca-9b912a8a91bd	4227	Selca
00050000-569c-eafb-5c46-97866ce1bcc8	2352	Selnica ob Dravi
00050000-569c-eafb-1fc8-eec6ecc98748	8333	Semič
00050000-569c-eafb-b112-675acc72cc49	8281	Senovo
00050000-569c-eafb-fb70-c194ac7fc4bf	6224	Senožeče
00050000-569c-eafb-c49a-aeb990b5e11d	8290	Sevnica
00050000-569c-eafb-7be4-128339020e36	6210	Sežana
00050000-569c-eafb-5be2-932f65e39a34	2214	Sladki Vrh
00050000-569c-eafb-19b1-1cf5fadc7497	5283	Slap ob Idrijci
00050000-569c-eafb-009d-0e12ad595a7d	2380	Slovenj Gradec
00050000-569c-eafb-7756-0ed81219dab6	2310	Slovenska Bistrica
00050000-569c-eafb-de53-9db6a1b3a67d	3210	Slovenske Konjice
00050000-569c-eafb-d09a-1db07836b40b	1216	Smlednik
00050000-569c-eafb-3934-3f4d55db1d34	5232	Soča
00050000-569c-eafb-dc98-e5682fa5bee8	1317	Sodražica
00050000-569c-eafb-6d28-a11a7f5af261	3335	Solčava
00050000-569c-eafb-ee0d-e89150078df5	5250	Solkan
00050000-569c-eafb-6a13-f24f3ec31ce8	4229	Sorica
00050000-569c-eafb-0935-be050dd496b4	4225	Sovodenj
00050000-569c-eafb-e8c7-6004a0aa9517	5281	Spodnja Idrija
00050000-569c-eafb-adfd-0b77d801f7e6	2241	Spodnji Duplek
00050000-569c-eafb-4b19-71ab20e85012	9245	Spodnji Ivanjci
00050000-569c-eafb-af74-511c6a3741de	2277	Središče ob Dravi
00050000-569c-eafb-f90e-a7eae2042275	4267	Srednja vas v Bohinju
00050000-569c-eafb-c426-72f97f434b81	8256	Sromlje 
00050000-569c-eafb-b3d8-73d4f8ae7311	5224	Srpenica
00050000-569c-eafb-93ac-c514fdc644b6	1242	Stahovica
00050000-569c-eafb-042e-60a7b1e64326	1332	Stara Cerkev
00050000-569c-eafb-ff52-5c8712147b3d	8342	Stari trg ob Kolpi
00050000-569c-eafb-3048-7f8b6721ecb1	1386	Stari trg pri Ložu
00050000-569c-eafb-39ca-f9c185a2aac9	2205	Starše
00050000-569c-eafb-403c-8f4c1b4874e9	2289	Stoperce
00050000-569c-eafb-702f-c0fe1a302bc1	8322	Stopiče
00050000-569c-eafb-d714-57e9a2c77e05	3206	Stranice
00050000-569c-eafb-c16f-c1fb6887702b	8351	Straža
00050000-569c-eafb-786c-03f15c0dea1e	1313	Struge
00050000-569c-eafb-3c55-0018ce7c66f3	8293	Studenec
00050000-569c-eafb-0043-368bc6e4d528	8331	Suhor
00050000-569c-eafb-f5c0-cfee402ac7e6	2233	Sv. Ana v Slovenskih goricah
00050000-569c-eafb-fedc-a22609494cc4	2235	Sv. Trojica v Slovenskih goricah
00050000-569c-eafb-5fb0-fc44203a884f	2353	Sveti Duh na Ostrem Vrhu
00050000-569c-eafb-785a-6788234ec49f	9244	Sveti Jurij ob Ščavnici
00050000-569c-eafb-5659-3d9d238dc64f	3264	Sveti Štefan
00050000-569c-eafb-fe1e-2463978688f2	2258	Sveti Tomaž
00050000-569c-eafb-b26b-26e40add9dbd	9204	Šalovci
00050000-569c-eafb-c615-87b07a4883d0	5261	Šempas
00050000-569c-eafb-ae02-20d6f4ae9c15	5290	Šempeter pri Gorici
00050000-569c-eafb-d199-78e3b5d9a5f8	3311	Šempeter v Savinjski dolini
00050000-569c-eafb-d5c4-4bf7920fcb3d	4208	Šenčur
00050000-569c-eafb-fa0a-3e68b8ffb144	2212	Šentilj v Slovenskih goricah
00050000-569c-eafb-1b80-32572c0a00c3	8297	Šentjanž
00050000-569c-eafb-e000-a623de33cf72	2373	Šentjanž pri Dravogradu
00050000-569c-eafb-1ea1-83d13a053d96	8310	Šentjernej
00050000-569c-eafb-d3a6-c3450d2ec145	3230	Šentjur
00050000-569c-eafb-37b2-8db6e3892bea	3271	Šentrupert
00050000-569c-eafb-1f47-fe078119d8a6	8232	Šentrupert
00050000-569c-eafb-fe24-00b876f47283	1296	Šentvid pri Stični
00050000-569c-eafb-b6e1-457efd67d3a7	8275	Škocjan
00050000-569c-eafb-5bf2-4e345f870cdc	6281	Škofije
00050000-569c-eafb-f194-d78bde502de3	4220	Škofja Loka
00050000-569c-eafb-c155-175166ad131f	3211	Škofja vas
00050000-569c-eafb-731a-32b2b7afe883	1291	Škofljica
00050000-569c-eafb-34c7-e993d2ed6b8d	6274	Šmarje
00050000-569c-eafb-f262-0687d837a3f6	1293	Šmarje - Sap
00050000-569c-eafb-d092-ed18f8908b72	3240	Šmarje pri Jelšah
00050000-569c-eafb-8ab7-364fb0284d00	8220	Šmarješke Toplice
00050000-569c-eafb-ceda-5b3a18cf91df	2315	Šmartno na Pohorju
00050000-569c-eafb-b69c-4d903c81b9b2	3341	Šmartno ob Dreti
00050000-569c-eafb-75e6-2b711f257b9d	3327	Šmartno ob Paki
00050000-569c-eafb-8b6c-3d1e8c7b7a6f	1275	Šmartno pri Litiji
00050000-569c-eafb-3637-1c42b57dd370	2383	Šmartno pri Slovenj Gradcu
00050000-569c-eafb-991a-abae59180d5a	3201	Šmartno v Rožni dolini
00050000-569c-eafb-fc81-0c9805be2155	3325	Šoštanj
00050000-569c-eafb-2b52-a0e4532b28de	6222	Štanjel
00050000-569c-eafb-b1b1-391bbfd78c07	3220	Štore
00050000-569c-eafb-3173-7ae1b6c910af	3304	Tabor
00050000-569c-eafb-39c7-58fe9d6bfdda	3221	Teharje
00050000-569c-eafb-f4cf-9d93bff6f418	9251	Tišina
00050000-569c-eafb-7809-63d4865f4a94	5220	Tolmin
00050000-569c-eafb-8265-d50058fd2f30	3326	Topolšica
00050000-569c-eafb-7c63-965374b1d29a	2371	Trbonje
00050000-569c-eafb-cdc4-e1d84e8a1ccf	1420	Trbovlje
00050000-569c-eafb-544c-dcceb453f9a6	8231	Trebelno 
00050000-569c-eafb-035b-ac67616c7be3	8210	Trebnje
00050000-569c-eafb-df8a-e7a71df72317	5252	Trnovo pri Gorici
00050000-569c-eafb-9d9f-80d0efbf2156	2254	Trnovska vas
00050000-569c-eafb-17d0-35895c08c8d8	1222	Trojane
00050000-569c-eafb-6264-7c5b015b47b8	1236	Trzin
00050000-569c-eafb-f40c-f10846ddb353	4290	Tržič
00050000-569c-eafb-43b6-444a5f6674c0	8295	Tržišče
00050000-569c-eafb-bccf-a4f1e3ca37ea	1311	Turjak
00050000-569c-eafb-3816-30e410eebe8d	9224	Turnišče
00050000-569c-eafb-d079-8e5f43414a3a	8323	Uršna sela
00050000-569c-eafb-002c-ec6a3b603375	1252	Vače
00050000-569c-eafb-243e-63eadee4516b	3320	Velenje 
00050000-569c-eafb-d2d6-e2f90a53fd4f	3322	Velenje - poštni predali
00050000-569c-eafb-bc6a-3851bb53b6b8	8212	Velika Loka
00050000-569c-eafb-ecd9-57b49969bfc8	2274	Velika Nedelja
00050000-569c-eafb-4467-87e387136f79	9225	Velika Polana
00050000-569c-eafb-8e60-db413dff7c40	1315	Velike Lašče
00050000-569c-eafb-2aff-b59ce95858fc	8213	Veliki Gaber
00050000-569c-eafb-bcff-4a0ec0d07c1e	9241	Veržej
00050000-569c-eafb-7e21-b4a90c8a6b8b	1312	Videm - Dobrepolje
00050000-569c-eafb-a818-ec69a3c5d12e	2284	Videm pri Ptuju
00050000-569c-eafb-18a2-4d853600fcb5	8344	Vinica
00050000-569c-eafb-fead-fc0bc08d248f	5271	Vipava
00050000-569c-eafb-9e37-59b85a9f9f7e	4212	Visoko
00050000-569c-eafb-acf8-aa9a70f8ee83	1294	Višnja Gora
00050000-569c-eafb-7b29-cfdec44ceae6	3205	Vitanje
00050000-569c-eafb-cb04-74dbb8fa688a	2255	Vitomarci
00050000-569c-eafb-26e3-b4f92d6a9377	1217	Vodice
00050000-569c-eafb-083f-cc2429bbcbfb	3212	Vojnik\t
00050000-569c-eafb-f1cd-ccfb70931a84	5293	Volčja Draga
00050000-569c-eafb-2873-2f23f7408d22	2232	Voličina
00050000-569c-eafb-e577-32a85b438eb0	3305	Vransko
00050000-569c-eafb-46fb-b12431b892a1	6217	Vremski Britof
00050000-569c-eafb-42d5-2e3bc7fba99b	1360	Vrhnika
00050000-569c-eafb-9b6b-3592f1007cfd	2365	Vuhred
00050000-569c-eafb-f777-341c2f32f22a	2367	Vuzenica
00050000-569c-eafb-44a0-7568efb522d5	8292	Zabukovje 
00050000-569c-eafb-1f01-6aed36632cca	1410	Zagorje ob Savi
00050000-569c-eafb-9314-cc42deaa9340	1303	Zagradec
00050000-569c-eafb-f317-12f759cda23c	2283	Zavrč
00050000-569c-eafb-d219-c05d1c0c0901	8272	Zdole 
00050000-569c-eafb-579b-6f5809c7b438	4201	Zgornja Besnica
00050000-569c-eafb-213f-fcc01f121ef0	2242	Zgornja Korena
00050000-569c-eafb-2e18-4718d9df3a96	2201	Zgornja Kungota
00050000-569c-eafb-0624-37592a482bd2	2316	Zgornja Ložnica
00050000-569c-eafb-5304-b8f8e2cf5465	2314	Zgornja Polskava
00050000-569c-eafb-2ef5-ae27862be5da	2213	Zgornja Velka
00050000-569c-eafb-4ff5-8e0da9df106b	4247	Zgornje Gorje
00050000-569c-eafb-0ff8-eb16cc6a80d1	4206	Zgornje Jezersko
00050000-569c-eafb-eabc-0b3cba887dc3	2285	Zgornji Leskovec
00050000-569c-eafb-f61c-a0be51676277	1432	Zidani Most
00050000-569c-eafb-ee6e-9924bf7b3fca	3214	Zreče
00050000-569c-eafb-1d2c-848efca2ef34	4209	Žabnica
00050000-569c-eafb-b6ea-73298b372e07	3310	Žalec
00050000-569c-eafb-7877-b87b3a571774	4228	Železniki
00050000-569c-eafb-4a37-c7bf3f904418	2287	Žetale
00050000-569c-eafb-a19f-49b5073504ff	4226	Žiri
00050000-569c-eafb-05ca-3b3fdc0ef2d6	4274	Žirovnica
00050000-569c-eafb-60a9-0ba5c1afb72c	8360	Žužemberk
\.


--
-- TOC entry 3205 (class 0 OID 37461027)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 37460597)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 37460336)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-569c-eaff-8d13-4cdd4bb9bcea	00080000-569c-eaff-49e7-bc1472a1f4c5	\N	00040000-569c-eafc-a347-252cef0dca1b	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-569c-eaff-74c0-c2f5ceff1734	00080000-569c-eaff-49e7-bc1472a1f4c5	\N	00040000-569c-eafc-a347-252cef0dca1b	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-569c-eaff-d23e-aff8d2b98bb3	00080000-569c-eaff-1211-6df054f7082e	\N	00040000-569c-eafc-a347-252cef0dca1b	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3165 (class 0 OID 37460473)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-569c-eafc-d013-fc083867d1db	novo leto	1	1	\N	t
00430000-569c-eafc-bfbe-1963e48ab5fb	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-569c-eafc-bc27-573f10114871	dan upora proti okupatorju	27	4	\N	t
00430000-569c-eafc-de26-324f05824afb	praznik dela	1	5	\N	t
00430000-569c-eafc-a65a-2f50f0194dca	praznik dela	2	5	\N	t
00430000-569c-eafc-a324-53438c74cb73	dan Primoža Trubarja	8	6	\N	f
00430000-569c-eafc-505e-5886d046c55f	dan državnosti	25	6	\N	t
00430000-569c-eafc-2793-52fe40973c50	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-569c-eafc-bffe-d59aba2e17f9	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-569c-eafc-134c-5ee243d0f88a	dan suverenosti	25	10	\N	f
00430000-569c-eafc-012f-95aa634fa1a9	dan spomina na mrtve	1	11	\N	t
00430000-569c-eafc-1de4-739446d489dc	dan Rudolfa Maistra	23	11	\N	f
00430000-569c-eafc-7947-fb25a719a2a3	božič	25	12	\N	t
00430000-569c-eafc-0a00-dc12dc963fff	dan samostojnosti in enotnosti	26	12	\N	t
00430000-569c-eafc-29f9-cd3e39a76c5e	Marijino vnebovzetje	15	8	\N	t
00430000-569c-eafc-33d5-dc145bccbca4	dan reformacije	31	10	\N	t
00430000-569c-eafc-b469-75d9a71b0289	velikonočna nedelja	27	3	2016	t
00430000-569c-eafc-a9fb-e1e7871b619b	velikonočna nedelja	16	4	2017	t
00430000-569c-eafc-0f53-4d9b570915d9	velikonočna nedelja	1	4	2018	t
00430000-569c-eafc-03db-25119e3fa25a	velikonočna nedelja	21	4	2019	t
00430000-569c-eafc-a1ef-ef0c891577b0	velikonočna nedelja	12	4	2020	t
00430000-569c-eafc-c66a-9119cd76e7f8	velikonočna nedelja	4	4	2021	t
00430000-569c-eafc-e50b-195a8250476a	velikonočna nedelja	17	4	2022	t
00430000-569c-eafc-90a6-3eb45ef9b0ed	velikonočna nedelja	9	4	2023	t
00430000-569c-eafc-68ec-dc73b6f31449	velikonočna nedelja	31	3	2024	t
00430000-569c-eafc-8e97-22cdc2786306	velikonočna nedelja	20	4	2025	t
00430000-569c-eafc-d7f5-3cae414353f6	velikonočna nedelja	5	4	2026	t
00430000-569c-eafc-d45e-d84ff7305713	velikonočna nedelja	28	3	2027	t
00430000-569c-eafc-31be-ad7c7477704c	velikonočna nedelja	16	4	2028	t
00430000-569c-eafc-0364-9c9286f34da0	velikonočna nedelja	1	4	2029	t
00430000-569c-eafc-e52f-d38460075976	velikonočna nedelja	21	4	2030	t
00430000-569c-eafc-22c7-6256867c6bf4	velikonočni ponedeljek	28	3	2016	t
00430000-569c-eafc-2f67-38804b747ace	velikonočni ponedeljek	17	4	2017	t
00430000-569c-eafc-f5f9-57f5aa270c3e	velikonočni ponedeljek	2	4	2018	t
00430000-569c-eafc-afa2-277f9fbbc993	velikonočni ponedeljek	22	4	2019	t
00430000-569c-eafc-dd0a-afacd613d067	velikonočni ponedeljek	13	4	2020	t
00430000-569c-eafc-fb86-fa53a6ad528c	velikonočni ponedeljek	5	4	2021	t
00430000-569c-eafc-72c8-83adbc976843	velikonočni ponedeljek	18	4	2022	t
00430000-569c-eafc-f916-ab37a60b32da	velikonočni ponedeljek	10	4	2023	t
00430000-569c-eafc-82ae-561dbeaa05c9	velikonočni ponedeljek	1	4	2024	t
00430000-569c-eafc-bab6-65ae308d6042	velikonočni ponedeljek	21	4	2025	t
00430000-569c-eafc-8264-92cf9512dd67	velikonočni ponedeljek	6	4	2026	t
00430000-569c-eafc-6b55-4d6b75c95b79	velikonočni ponedeljek	29	3	2027	t
00430000-569c-eafc-d522-0312f4fc6248	velikonočni ponedeljek	17	4	2028	t
00430000-569c-eafc-cc7a-7ee7fe871c13	velikonočni ponedeljek	2	4	2029	t
00430000-569c-eafc-9932-55a083231ac1	velikonočni ponedeljek	22	4	2030	t
00430000-569c-eafc-5c05-7d6b87a365e8	binkoštna nedelja - binkošti	15	5	2016	t
00430000-569c-eafc-256e-2e0dc1657e4a	binkoštna nedelja - binkošti	4	6	2017	t
00430000-569c-eafc-fbd8-a00487c5ac1a	binkoštna nedelja - binkošti	20	5	2018	t
00430000-569c-eafc-2866-99d76a99bff9	binkoštna nedelja - binkošti	9	6	2019	t
00430000-569c-eafc-eb23-1c3862b7ecb0	binkoštna nedelja - binkošti	31	5	2020	t
00430000-569c-eafc-ca11-7a5c6a14b3c1	binkoštna nedelja - binkošti	23	5	2021	t
00430000-569c-eafc-e0b7-aec2da2d32c7	binkoštna nedelja - binkošti	5	6	2022	t
00430000-569c-eafc-358a-cf22a8d954fb	binkoštna nedelja - binkošti	28	5	2023	t
00430000-569c-eafc-969b-c2e7e85a3278	binkoštna nedelja - binkošti	19	5	2024	t
00430000-569c-eafc-f2a5-3fde75f7dfd1	binkoštna nedelja - binkošti	8	6	2025	t
00430000-569c-eafc-a64b-cfc95c9495a1	binkoštna nedelja - binkošti	24	5	2026	t
00430000-569c-eafc-e861-ec59cae789f4	binkoštna nedelja - binkošti	16	5	2027	t
00430000-569c-eafc-26d1-66eaf7f93794	binkoštna nedelja - binkošti	4	6	2028	t
00430000-569c-eafc-085c-6144b53c8af1	binkoštna nedelja - binkošti	20	5	2029	t
00430000-569c-eafc-1596-d8e6158a87a9	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3161 (class 0 OID 37460440)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
001b0000-569c-eaff-43d3-5c38f7463f9e	000e0000-569c-eaff-867a-70518cfdf8b2	\N	1	\N	\N
\.


--
-- TOC entry 3162 (class 0 OID 37460448)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 37460609)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 37461041)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3207 (class 0 OID 37461051)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-569c-eaff-1b97-24f133ea3d7a	00080000-569c-eaff-9cf4-72e9c2e268df	0987	AK
00190000-569c-eaff-2b8f-ef1a6ba523ab	00080000-569c-eaff-1211-6df054f7082e	0989	AK
00190000-569c-eaff-05cd-b829012b599e	00080000-569c-eaff-5ae1-c9e039eedb4b	0986	AK
00190000-569c-eaff-6304-53e0f20af0a4	00080000-569c-eaff-9cf9-5d7e534553bb	0984	AK
00190000-569c-eaff-31ea-152b8b930181	00080000-569c-eaff-a5f9-df8f1768b306	0983	AK
00190000-569c-eaff-0a1e-1d8fd9d1e4f2	00080000-569c-eaff-8157-f9b92c292ee4	0982	AK
00190000-569c-eb01-163b-3282a46be054	00080000-569c-eb01-2880-6056bba05276	1001	AK
\.


--
-- TOC entry 3204 (class 0 OID 37460940)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-569c-eaff-698c-8193b442e831	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3208 (class 0 OID 37461059)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 37460638)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-569c-eafe-bdca-6c8f26b7b260	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-569c-eafe-9861-3698ed8a11f6	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-569c-eafe-6855-51a48c9d0395	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-569c-eafe-416f-acbdcbf9a483	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-569c-eafe-5694-f0dd8c8348ff	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-569c-eafe-bf8b-eaa1dbc3f536	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-569c-eafe-7dd1-eac8f1cd253d	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3176 (class 0 OID 37460582)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 37460572)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 37460779)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 37460709)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 37460414)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 37460176)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-569c-eb01-2880-6056bba05276	00010000-569c-eafd-315c-4d1013d1e356	2016-01-18 14:39:13	INS	a:0:{}
2	App\\Entity\\Option	00000000-569c-eb01-04c5-7a54af5c346a	00010000-569c-eafd-315c-4d1013d1e356	2016-01-18 14:39:13	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-569c-eb01-163b-3282a46be054	00010000-569c-eafd-315c-4d1013d1e356	2016-01-18 14:39:13	INS	a:0:{}
\.


--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3185 (class 0 OID 37460651)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 37460214)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-569c-eafc-9010-2df8261fe4cc	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-569c-eafc-a0b8-c2e0ce956720	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-569c-eafc-051c-fa135f9c1b40	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-569c-eafc-f94e-bab61328151b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-569c-eafc-b014-e7862633b69a	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-569c-eafc-df35-4b3092685535	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-569c-eafc-ef04-140ade61a09e	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-569c-eafc-1f58-04b0a1f5ecdb	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-569c-eafc-76f8-b885acde5f0e	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569c-eafc-60a5-11c67f7ea1e1	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569c-eafc-a728-987d5e748168	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569c-eafc-cd92-c858e3afa67f	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569c-eafc-c6f2-be7b730965ae	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-569c-eafc-edda-342bf6906fdc	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-569c-eafc-3c23-2bbac39fffd1	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569c-eafc-1068-351953bc12bb	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569c-eafc-02b0-ec2c9d942732	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-569c-eafc-70a2-d1b8eaf982b8	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-569c-eafc-8708-916941983c41	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-569c-eafc-1d16-5172d5f8d1e9	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-569c-eafc-b6dd-88cee0b82bb5	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569c-eafc-0a8e-572166e9888d	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569c-eafc-2d65-ba2ab2898db5	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569c-eafc-143d-8d712df6dcf8	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569c-eafc-21e3-622b72791ee8	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-569c-eafc-327d-e4620e8f811f	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-569c-eafc-b566-2ce3970de4a9	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-569c-eafc-c1a7-4bee3778f5db	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-569c-eafc-f4b4-a88307881fea	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-569c-eafc-16ef-abf9a16e1c7e	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-569c-eafc-4465-06678b575bf2	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-569c-eafc-b1f0-1e96986ddf7d	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-569c-eafc-608c-56e2375f842f	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-569c-eafc-cd3b-bfcb18f99613	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-569c-eafc-b6d5-7402b0f62d8f	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-569c-eafc-db85-e50ba80e2822	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-569c-eafc-47c4-3b27b4cf029c	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-569c-eafc-f360-6fc4037a53ae	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-569c-eafc-6649-8b5c8baf3512	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-569c-eafc-b2b2-0a81dbda368e	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-569c-eafc-e937-43ff41a05b8e	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-569c-eafc-41f9-169b317663f1	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-569c-eafc-6187-99180911cbbc	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569c-eafc-495a-dfa2c9e64205	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569c-eafc-f6b7-e8fa0388ccf0	direktor	minimalne pravice za direktorja	t
00020000-569c-eafc-60eb-35e1229d0d60	arhivar	arhivar	t
00020000-569c-eafd-820c-f90523e423c6	dramaturg	dramaturg	t
00020000-569c-eafd-bde5-70fce4f360ae	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-569c-eafd-3097-438e5a70a4de	poslovni-sekretar	poslovni sekretar	t
00020000-569c-eafd-d42e-a7289d5296f8	vodja-tehnike	vodja tehnike	t
00020000-569c-eafd-d65e-a2160543db4d	racunovodja	računovodja	t
00020000-569c-eafe-7f67-a01fed064b97	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-569c-eafe-211b-0be2171742dd	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-f10e-5cbf61ac7369	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-988d-e5b69e9526c4	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-ea74-914c324570f0	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-3ce7-cc3bda6e47f1	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-3c19-cab9be6298c2	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-8058-8cc2413bf411	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-483c-aa1bd53cd83b	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-f65e-0bb82dbb414e	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-3550-de7d7dc7a997	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-d70e-2057f90fcc23	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-b33b-1b82090cc87c	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-4b94-8c32f264c4b9	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-6f9e-69b00d89b4a4	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-b202-894c454c7c90	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-da47-7431be924ce4	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-7afe-0cc307ed28a8	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-207f-aa3d445726cc	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-0eca-07dcec456018	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-569c-eafe-a61b-fe5eb1141825	Trr-read	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-05ef-b25d0e24d321	Trr-write	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-e508-e931ca5e527d	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-526b-472b3654764f	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-249a-f7990a743174	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-cf45-36fd2203bee3	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-85c0-be7d2b1401f1	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-fef1-ac3a4324a3a1	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-f08b-c7eb19d2311c	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-06fd-a9a7681ddeb5	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-7a56-93334c257421	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-664c-148cf8afa114	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-b9fb-1dbac6a8f415	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-46ab-050988480e48	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-cffa-bf167c87ebed	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-e5a8-05e347087a6d	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-569c-eafe-f20a-41a5e5ff6e85	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-569c-eaff-1988-7370f33508ca	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-569c-eaff-78d2-e233a1e4e63d	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3140 (class 0 OID 37460198)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-569c-eafd-7082-68b4ff254999	00020000-569c-eafc-051c-fa135f9c1b40
00010000-569c-eafd-315c-4d1013d1e356	00020000-569c-eafc-051c-fa135f9c1b40
00010000-569c-eaff-82ed-a4c7ea4b02a1	00020000-569c-eafe-7f67-a01fed064b97
00010000-569c-eaff-dea4-ce4e5ed6bd93	00020000-569c-eafe-211b-0be2171742dd
00010000-569c-eaff-dea4-ce4e5ed6bd93	00020000-569c-eafe-3ce7-cc3bda6e47f1
00010000-569c-eaff-dea4-ce4e5ed6bd93	00020000-569c-eafe-f65e-0bb82dbb414e
00010000-569c-eaff-dea4-ce4e5ed6bd93	00020000-569c-eafe-d70e-2057f90fcc23
00010000-569c-eaff-dea4-ce4e5ed6bd93	00020000-569c-eafe-4b94-8c32f264c4b9
00010000-569c-eaff-dea4-ce4e5ed6bd93	00020000-569c-eafe-207f-aa3d445726cc
00010000-569c-eaff-dea4-ce4e5ed6bd93	00020000-569c-eafe-988d-e5b69e9526c4
00010000-569c-eaff-dea4-ce4e5ed6bd93	00020000-569c-eafe-a61b-fe5eb1141825
00010000-569c-eaff-dea4-ce4e5ed6bd93	00020000-569c-eafe-526b-472b3654764f
00010000-569c-eaff-dea4-ce4e5ed6bd93	00020000-569c-eafe-cf45-36fd2203bee3
00010000-569c-eaff-dea4-ce4e5ed6bd93	00020000-569c-eafe-fef1-ac3a4324a3a1
00010000-569c-eaff-dea4-ce4e5ed6bd93	00020000-569c-eafe-06fd-a9a7681ddeb5
00010000-569c-eaff-dea4-ce4e5ed6bd93	00020000-569c-eafe-46ab-050988480e48
00010000-569c-eaff-4ca9-249963a0f438	00020000-569c-eafe-211b-0be2171742dd
00010000-569c-eaff-4ca9-249963a0f438	00020000-569c-eafe-f10e-5cbf61ac7369
00010000-569c-eaff-4ca9-249963a0f438	00020000-569c-eafe-988d-e5b69e9526c4
00010000-569c-eaff-4ca9-249963a0f438	00020000-569c-eafe-ea74-914c324570f0
00010000-569c-eaff-4ca9-249963a0f438	00020000-569c-eafe-4b94-8c32f264c4b9
00010000-569c-eaff-4ca9-249963a0f438	00020000-569c-eafe-da47-7431be924ce4
00010000-569c-eaff-4ca9-249963a0f438	00020000-569c-eafe-a61b-fe5eb1141825
00010000-569c-eaff-4ca9-249963a0f438	00020000-569c-eafe-526b-472b3654764f
00010000-569c-eaff-4ca9-249963a0f438	00020000-569c-eafe-cf45-36fd2203bee3
00010000-569c-eaff-4ca9-249963a0f438	00020000-569c-eafe-fef1-ac3a4324a3a1
00010000-569c-eaff-4ca9-249963a0f438	00020000-569c-eafe-06fd-a9a7681ddeb5
00010000-569c-eaff-4ca9-249963a0f438	00020000-569c-eafe-46ab-050988480e48
00010000-569c-eaff-1701-cb73e89fed73	00020000-569c-eafe-211b-0be2171742dd
00010000-569c-eaff-1701-cb73e89fed73	00020000-569c-eafe-f10e-5cbf61ac7369
00010000-569c-eaff-1701-cb73e89fed73	00020000-569c-eafe-988d-e5b69e9526c4
00010000-569c-eaff-1701-cb73e89fed73	00020000-569c-eafe-ea74-914c324570f0
00010000-569c-eaff-1701-cb73e89fed73	00020000-569c-eafe-d70e-2057f90fcc23
00010000-569c-eaff-1701-cb73e89fed73	00020000-569c-eafe-4b94-8c32f264c4b9
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-f10e-5cbf61ac7369
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-3c19-cab9be6298c2
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-3550-de7d7dc7a997
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-b33b-1b82090cc87c
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-d70e-2057f90fcc23
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-7afe-0cc307ed28a8
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-4b94-8c32f264c4b9
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-6f9e-69b00d89b4a4
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-a61b-fe5eb1141825
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-05ef-b25d0e24d321
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-526b-472b3654764f
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-249a-f7990a743174
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-cf45-36fd2203bee3
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-85c0-be7d2b1401f1
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-fef1-ac3a4324a3a1
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-f08b-c7eb19d2311c
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-06fd-a9a7681ddeb5
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-7a56-93334c257421
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-46ab-050988480e48
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-cffa-bf167c87ebed
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eafe-f20a-41a5e5ff6e85
00010000-569c-eaff-8b34-dcbed36dad76	00020000-569c-eaff-1988-7370f33508ca
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-f10e-5cbf61ac7369
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-3c19-cab9be6298c2
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-483c-aa1bd53cd83b
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-3550-de7d7dc7a997
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-b33b-1b82090cc87c
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-d70e-2057f90fcc23
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-7afe-0cc307ed28a8
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-4b94-8c32f264c4b9
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-6f9e-69b00d89b4a4
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-b202-894c454c7c90
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-a61b-fe5eb1141825
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-05ef-b25d0e24d321
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-e508-e931ca5e527d
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-526b-472b3654764f
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-249a-f7990a743174
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-cf45-36fd2203bee3
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-85c0-be7d2b1401f1
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-fef1-ac3a4324a3a1
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-f08b-c7eb19d2311c
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-06fd-a9a7681ddeb5
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-7a56-93334c257421
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-46ab-050988480e48
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-cffa-bf167c87ebed
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-e5a8-05e347087a6d
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eafe-f20a-41a5e5ff6e85
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eaff-1988-7370f33508ca
00010000-569c-eaff-aafc-cafe282a04f5	00020000-569c-eaff-78d2-e233a1e4e63d
00010000-569c-eaff-3ec2-e7213f5f0c7d	00020000-569c-eafe-f10e-5cbf61ac7369
00010000-569c-eaff-3ec2-e7213f5f0c7d	00020000-569c-eafe-988d-e5b69e9526c4
00010000-569c-eaff-3ec2-e7213f5f0c7d	00020000-569c-eafe-3c19-cab9be6298c2
00010000-569c-eaff-3ec2-e7213f5f0c7d	00020000-569c-eafe-8058-8cc2413bf411
00010000-569c-eaff-3ec2-e7213f5f0c7d	00020000-569c-eafe-483c-aa1bd53cd83b
00010000-569c-eaff-3ec2-e7213f5f0c7d	00020000-569c-eafe-3ce7-cc3bda6e47f1
00010000-569c-eaff-3ec2-e7213f5f0c7d	00020000-569c-eafe-3550-de7d7dc7a997
00010000-569c-eaff-3ec2-e7213f5f0c7d	00020000-569c-eafe-b33b-1b82090cc87c
00010000-569c-eaff-3ec2-e7213f5f0c7d	00020000-569c-eafe-d70e-2057f90fcc23
00010000-569c-eaff-3ec2-e7213f5f0c7d	00020000-569c-eafe-7afe-0cc307ed28a8
00010000-569c-eaff-df8e-f950bc9be1e5	00020000-569c-eafe-211b-0be2171742dd
00010000-569c-eaff-df8e-f950bc9be1e5	00020000-569c-eafe-ea74-914c324570f0
00010000-569c-eaff-df8e-f950bc9be1e5	00020000-569c-eafe-3ce7-cc3bda6e47f1
00010000-569c-eaff-df8e-f950bc9be1e5	00020000-569c-eafe-f65e-0bb82dbb414e
00010000-569c-eaff-df8e-f950bc9be1e5	00020000-569c-eafe-d70e-2057f90fcc23
00010000-569c-eaff-df8e-f950bc9be1e5	00020000-569c-eafe-4b94-8c32f264c4b9
00010000-569c-eaff-df8e-f950bc9be1e5	00020000-569c-eafe-207f-aa3d445726cc
00010000-569c-eaff-df8e-f950bc9be1e5	00020000-569c-eafe-664c-148cf8afa114
00010000-569c-eaff-7ea7-ff05fb488123	00020000-569c-eafe-0eca-07dcec456018
00010000-569c-eaff-4bc6-1d7152f00030	00020000-569c-eafc-f6b7-e8fa0388ccf0
00010000-569c-eaff-4443-06df93d5cb8a	00020000-569c-eafc-60eb-35e1229d0d60
00010000-569c-eaff-a3ad-bae04686a68d	00020000-569c-eafd-820c-f90523e423c6
00010000-569c-eaff-a30d-1e611b424a67	00020000-569c-eafd-bde5-70fce4f360ae
00010000-569c-eaff-03b7-225a8f972467	00020000-569c-eafd-3097-438e5a70a4de
00010000-569c-eaff-e1a6-18ac787e96ee	00020000-569c-eafd-d42e-a7289d5296f8
00010000-569c-eaff-9771-e96bf7594f81	00020000-569c-eafd-d65e-a2160543db4d
\.


--
-- TOC entry 3187 (class 0 OID 37460665)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 37460603)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 37460526)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-569c-eafe-a2ca-1d51665bc182	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-569c-eafe-18b7-4bbabbc24cf5	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-569c-eafe-a633-0c85db196030	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3136 (class 0 OID 37460163)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-569c-eafb-fabf-57d3caca3cbd	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-569c-eafb-1f8c-79c0bc57fd27	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-569c-eafb-5cfa-7964a306fd0c	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-569c-eafb-705b-8c0b656b4316	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-569c-eafb-bde3-d08b8d9b0275	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3135 (class 0 OID 37460155)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-569c-eafb-f1e1-f9fedcaf1804	00230000-569c-eafb-705b-8c0b656b4316	popa
00240000-569c-eafb-5f10-3c7abfb7d10c	00230000-569c-eafb-705b-8c0b656b4316	oseba
00240000-569c-eafb-dfe0-5b0099d5bb71	00230000-569c-eafb-705b-8c0b656b4316	tippopa
00240000-569c-eafb-8d44-c2db2bec3fc2	00230000-569c-eafb-705b-8c0b656b4316	organizacijskaenota
00240000-569c-eafb-2b47-aeb8ffb6811b	00230000-569c-eafb-705b-8c0b656b4316	sezona
00240000-569c-eafb-4be2-ba6e0a494afd	00230000-569c-eafb-705b-8c0b656b4316	tipvaje
00240000-569c-eafb-9044-3bf2ffda75ce	00230000-569c-eafb-705b-8c0b656b4316	tipdodatka
00240000-569c-eafb-ec93-462e3649588c	00230000-569c-eafb-1f8c-79c0bc57fd27	prostor
00240000-569c-eafb-c44b-837ad0ea7c73	00230000-569c-eafb-705b-8c0b656b4316	besedilo
00240000-569c-eafb-ff0d-25d0cba69636	00230000-569c-eafb-705b-8c0b656b4316	uprizoritev
00240000-569c-eafb-3e00-e844db4bb57d	00230000-569c-eafb-705b-8c0b656b4316	funkcija
00240000-569c-eafb-4cc0-e1d5228bec14	00230000-569c-eafb-705b-8c0b656b4316	tipfunkcije
00240000-569c-eafb-9108-1451f9e714d9	00230000-569c-eafb-705b-8c0b656b4316	alternacija
00240000-569c-eafb-5b75-71d079f3f468	00230000-569c-eafb-fabf-57d3caca3cbd	pogodba
00240000-569c-eafb-53fb-e8650a81b538	00230000-569c-eafb-705b-8c0b656b4316	zaposlitev
00240000-569c-eafb-ecbd-9a76b3daf84c	00230000-569c-eafb-705b-8c0b656b4316	zvrstuprizoritve
00240000-569c-eafb-5970-4fbacd6f0ebd	00230000-569c-eafb-fabf-57d3caca3cbd	programdela
00240000-569c-eafb-3305-5c15ef376515	00230000-569c-eafb-705b-8c0b656b4316	zapis
\.


--
-- TOC entry 3134 (class 0 OID 37460150)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
29f20700-acb2-4936-8700-21bb4e3505b4	00240000-569c-eafb-f1e1-f9fedcaf1804	0	1001
\.


--
-- TOC entry 3193 (class 0 OID 37460726)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-569c-eaff-bc81-99914d8767ad	000e0000-569c-eaff-867a-70518cfdf8b2	00080000-569c-eaff-49e7-bc1472a1f4c5	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-569c-eafc-bd9b-b4e66097db6a
00270000-569c-eaff-023b-b6bfcc1d3fb5	000e0000-569c-eaff-867a-70518cfdf8b2	00080000-569c-eaff-49e7-bc1472a1f4c5	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-569c-eafc-bd9b-b4e66097db6a
\.


--
-- TOC entry 3150 (class 0 OID 37460298)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 37460545)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-569c-eaff-e1bf-1ebb1828031e	00180000-569c-eaff-52e2-69888647624c	000c0000-569c-eaff-2afa-2184d6f3d6d4	00090000-569c-eaff-fde0-472199fc7dc5	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569c-eaff-575f-52c1e052a139	00180000-569c-eaff-52e2-69888647624c	000c0000-569c-eaff-9c9a-ff0bcae31cf1	00090000-569c-eaff-b8ac-86a1a9b06c87	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569c-eaff-023a-9bfb26d4c294	00180000-569c-eaff-52e2-69888647624c	000c0000-569c-eaff-1952-401aba93716b	00090000-569c-eaff-ebc0-09d7da382ff5	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569c-eaff-6d03-1ed54ae8ce16	00180000-569c-eaff-52e2-69888647624c	000c0000-569c-eaff-ca52-db10d37b1ee5	00090000-569c-eaff-7963-97fac02f7822	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569c-eaff-6b3b-4f980a5b7c01	00180000-569c-eaff-52e2-69888647624c	000c0000-569c-eaff-9f28-8044b31a2070	00090000-569c-eaff-78ef-ad1d3b247b03	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569c-eaff-7e9f-3075f429eee2	00180000-569c-eaff-2b3a-b0f20eac8548	\N	00090000-569c-eaff-78ef-ad1d3b247b03	644940	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-569c-eaff-fa2b-aa92917fe4c2	00180000-569c-eaff-db77-5efbbd0778a2	\N	00090000-569c-eaff-b8ac-86a1a9b06c87	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 37460562)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-569c-eafb-4a2c-876d3f41e3e0	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-569c-eafb-3592-e5b77576dfe1	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-569c-eafb-93aa-8d2f3a385fc7	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-569c-eafb-f3d4-0d76fd5518d4	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-569c-eafb-7b55-123acc4e61b2	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-569c-eafb-b71d-a30d86b4158c	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3196 (class 0 OID 37460767)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-569c-eafb-b37a-989640904ed5	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-569c-eafb-a2b7-627d1cfb1e27	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-569c-eafb-4722-03d3cafc646b	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-569c-eafb-e6e7-e48de888ba14	04	Režija	Režija	Režija	umetnik	30
000f0000-569c-eafb-6867-92f5cdb2f7f7	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-569c-eafb-14a7-44afb22bcb72	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-569c-eafb-4407-df68d7249380	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-569c-eafb-94ab-dd1e4273ebbd	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-569c-eafb-b56b-b612247ac9b0	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-569c-eafb-499e-2d6ebc6dad86	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-569c-eafb-498e-5833ba1bf13c	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-569c-eafb-9090-fe8b5a67cbbf	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-569c-eafb-2db4-4c6cc84d7755	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-569c-eafb-8c38-3c40703f51d8	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-569c-eafb-4c5f-76d79d70aaad	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-569c-eafb-5843-f5ed8f4b2c3f	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-569c-eafb-4c0e-1eda66603a3f	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-569c-eafb-b577-dcc50c5c0f0d	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-569c-eafb-d3a9-74a29b8617b4	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3147 (class 0 OID 37460249)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-569c-eafe-21d9-2dd6ea523e8b	0001	šola	osnovna ali srednja šola
00400000-569c-eafe-0a66-1167f3488e6a	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-569c-eafe-a364-308c1d8946ab	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3209 (class 0 OID 37461071)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-569c-eafb-c13c-f170e8e2b2e9	01	Velika predstava	f	1.00	1.00
002b0000-569c-eafb-fa1c-fc8df0084b85	02	Mala predstava	f	0.50	0.50
002b0000-569c-eafb-db4a-ea4bf0d8ed9d	03	Mala koprodukcija	t	0.40	1.00
002b0000-569c-eafb-1f09-33b5730a5eef	04	Srednja koprodukcija	t	0.70	2.00
002b0000-569c-eafb-3114-8975a87f0ad5	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3169 (class 0 OID 37460516)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-569c-eafb-1816-39b0d35f8472	0001	prva vaja	prva vaja
00420000-569c-eafb-c84b-953168a75ef4	0002	tehnična vaja	tehnična vaja
00420000-569c-eafb-7a5c-58f2c230809d	0003	lučna vaja	lučna vaja
00420000-569c-eafb-d97d-665cbf467608	0004	kostumska vaja	kostumska vaja
00420000-569c-eafb-e9f3-f89313ffed56	0005	foto vaja	foto vaja
00420000-569c-eafb-eec7-a82d28cc92a1	0006	1. glavna vaja	1. glavna vaja
00420000-569c-eafb-7298-b085589cb6e4	0007	2. glavna vaja	2. glavna vaja
00420000-569c-eafb-f930-72c3439fbd18	0008	1. generalka	1. generalka
00420000-569c-eafb-2a60-5ae7bd3b59ee	0009	2. generalka	2. generalka
00420000-569c-eafb-004a-a2f3e70ba9c9	0010	odprta generalka	odprta generalka
00420000-569c-eafb-1b58-395910af16ce	0011	obnovitvena vaja	obnovitvena vaja
00420000-569c-eafb-c6ae-f9aca4ccec95	0012	italijanka	krajša "obnovitvena" vaja
00420000-569c-eafb-40fe-f7de0b9f5422	0013	pevska vaja	pevska vaja
00420000-569c-eafb-8b8f-c216d388b346	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-569c-eafb-c578-36cb048258e0	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-569c-eafb-c016-f7fe61b7490d	0016	orientacijska vaja	orientacijska vaja
00420000-569c-eafb-1a1d-dfea2a2d6d50	0017	situacijska vaja	situacijska vaja
00420000-569c-eafb-17d5-41a9ef93587a	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3156 (class 0 OID 37460371)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 37460185)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-569c-eafd-315c-4d1013d1e356	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROsKhMzt6oaAkWINANhKZNy3c9yRgA2Da	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-569c-eaff-edd5-419113f52a2c	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-569c-eaff-54ea-4d634a0bae45	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-569c-eaff-4ca3-3158c011c077	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-569c-eaff-d7cc-edcad9f4bf8a	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-569c-eaff-0bfc-11487d000813	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-569c-eaff-14d2-ffded503dba0	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-569c-eaff-f655-f53bfeca3058	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-569c-eaff-6f8f-f6233dd4e6ae	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-569c-eaff-7c6a-8ce085318df2	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-569c-eaff-82ed-a4c7ea4b02a1	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-569c-eaff-7387-32dbad05df19	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-569c-eaff-dea4-ce4e5ed6bd93	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-569c-eaff-4ca9-249963a0f438	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-569c-eaff-1701-cb73e89fed73	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-569c-eaff-8b34-dcbed36dad76	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-569c-eaff-aafc-cafe282a04f5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-569c-eaff-3ec2-e7213f5f0c7d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-569c-eaff-df8e-f950bc9be1e5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-569c-eaff-7ea7-ff05fb488123	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-569c-eaff-4bc6-1d7152f00030	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-569c-eaff-4443-06df93d5cb8a	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-569c-eaff-a3ad-bae04686a68d	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-569c-eaff-a30d-1e611b424a67	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-569c-eaff-03b7-225a8f972467	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-569c-eaff-e1a6-18ac787e96ee	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-569c-eaff-9771-e96bf7594f81	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-569c-eafd-7082-68b4ff254999	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3200 (class 0 OID 37460817)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-569c-eaff-6d30-95ee3f865677	00160000-569c-eafe-0fbd-7dceea7f48aa	\N	00140000-569c-eafb-5234-957a0ceaef43	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-569c-eafe-5694-f0dd8c8348ff
000e0000-569c-eaff-867a-70518cfdf8b2	00160000-569c-eafe-3813-43f573a84612	\N	00140000-569c-eafb-b0bc-f77e3bee7bc0	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-569c-eafe-bf8b-eaa1dbc3f536
000e0000-569c-eaff-7e70-48f9db15495b	\N	\N	00140000-569c-eafb-b0bc-f77e3bee7bc0	00190000-569c-eaff-1b97-24f133ea3d7a	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569c-eafe-5694-f0dd8c8348ff
000e0000-569c-eaff-a339-f4b5a3532c1f	\N	\N	00140000-569c-eafb-b0bc-f77e3bee7bc0	00190000-569c-eaff-1b97-24f133ea3d7a	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569c-eafe-5694-f0dd8c8348ff
000e0000-569c-eaff-0a4a-3f976f5406b2	\N	\N	00140000-569c-eafb-b0bc-f77e3bee7bc0	00190000-569c-eaff-1b97-24f133ea3d7a	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-eafe-bdca-6c8f26b7b260
000e0000-569c-eaff-223c-506134870067	\N	\N	00140000-569c-eafb-b0bc-f77e3bee7bc0	00190000-569c-eaff-1b97-24f133ea3d7a	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-eafe-bdca-6c8f26b7b260
000e0000-569c-eaff-466b-3ce517c4764e	\N	\N	00140000-569c-eafb-5156-c3c66dddd20f	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-eafe-bdca-6c8f26b7b260
000e0000-569c-eaff-0bef-e2609d4fc23f	\N	\N	00140000-569c-eafb-5156-c3c66dddd20f	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-eafe-bdca-6c8f26b7b260
000e0000-569c-eaff-88da-176b932953da	\N	\N	00140000-569c-eafb-5156-c3c66dddd20f	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-eafe-bdca-6c8f26b7b260
000e0000-569c-eaff-49ff-5bdc948c92bd	\N	\N	00140000-569c-eafb-5156-c3c66dddd20f	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-eafe-bdca-6c8f26b7b260
000e0000-569c-eaff-4413-d81ca8508fff	\N	\N	00140000-569c-eafb-5156-c3c66dddd20f	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-eafe-bdca-6c8f26b7b260
000e0000-569c-eaff-8337-912ad565595e	\N	\N	00140000-569c-eafb-5156-c3c66dddd20f	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-eafe-bdca-6c8f26b7b260
000e0000-569c-eaff-279e-b730dbcdaad7	\N	\N	00140000-569c-eafb-5156-c3c66dddd20f	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-eafe-bdca-6c8f26b7b260
000e0000-569c-eaff-09cf-69d2d8f37ffe	\N	\N	00140000-569c-eafb-5156-c3c66dddd20f	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-eafe-bdca-6c8f26b7b260
000e0000-569c-eaff-b3c7-3bd0893a16c2	\N	\N	00140000-569c-eafb-5156-c3c66dddd20f	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-eafe-bdca-6c8f26b7b260
\.


--
-- TOC entry 3171 (class 0 OID 37460536)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 37460466)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-569c-eaff-e24a-56900508e191	\N	000e0000-569c-eaff-867a-70518cfdf8b2	1
00200000-569c-eaff-55f5-52fb80726b6b	\N	000e0000-569c-eaff-867a-70518cfdf8b2	2
00200000-569c-eaff-7597-bb424fee3e12	\N	000e0000-569c-eaff-867a-70518cfdf8b2	3
00200000-569c-eaff-5db3-1bb01c7d6531	\N	000e0000-569c-eaff-867a-70518cfdf8b2	4
00200000-569c-eaff-c121-dfff8ee3dde7	\N	000e0000-569c-eaff-867a-70518cfdf8b2	5
\.


--
-- TOC entry 3183 (class 0 OID 37460630)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 37460740)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-569c-eafc-7637-81a63cb00d12	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-569c-eafc-e4ed-2a58bb27ddfd	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-569c-eafc-2d4f-9fa4d73523c2	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-569c-eafc-6288-8bc08f718f64	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-569c-eafc-bd05-cb9c960bab8f	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-569c-eafc-4b45-5bd664898e6d	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-569c-eafc-b19f-22f6a5de86e9	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-569c-eafc-c57d-b51497b18e68	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-569c-eafc-bd9b-b4e66097db6a	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-569c-eafc-2210-896ab06d105f	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-569c-eafc-e3fa-716be2a37a79	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-569c-eafc-ae51-1e55bd7808d9	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-569c-eafc-4c25-056dd35ab4bd	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-569c-eafc-23bc-8a9d7e1f54df	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-569c-eafc-ebea-fb5f0dc1329e	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-569c-eafc-5a85-4bd5df40891b	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-569c-eafc-4058-005d5fe88952	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-569c-eafc-2653-884d6f5db76b	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-569c-eafc-00c4-b89461722350	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-569c-eafc-6b70-1c401daaa89b	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-569c-eafc-f719-85d58fadabc0	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-569c-eafc-28dd-c9e8cdae4121	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-569c-eafc-0708-a799e0b0dec0	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-569c-eafc-f1c7-3c7688946c7e	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-569c-eafc-599d-64a50ddab11c	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-569c-eafc-daab-f6fa5f3e7866	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-569c-eafc-20f8-a495da5f8b27	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-569c-eafc-ec24-926a228fa6d1	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3212 (class 0 OID 37461121)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3211 (class 0 OID 37461090)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 37461133)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 37460702)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-569c-eaff-f853-2976103f8097	00090000-569c-eaff-b8ac-86a1a9b06c87	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-569c-eaff-aff4-487d5affe540	00090000-569c-eaff-ebc0-09d7da382ff5	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-569c-eaff-42ca-b374f3ce72b8	00090000-569c-eaff-ac8e-71b9f67a0235	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569c-eaff-c8f8-6ae64fa1066d	00090000-569c-eaff-8618-f5ff5f35976c	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569c-eaff-fccd-ef6038ee13d1	00090000-569c-eaff-281e-c01bac29b3db	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-569c-eaff-6d00-c964db44a33c	00090000-569c-eaff-7307-e235ab821180	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3133 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 37460807)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-569c-eafb-5234-957a0ceaef43	01	Drama	drama (SURS 01)
00140000-569c-eafb-2506-4751080a4f28	02	Opera	opera (SURS 02)
00140000-569c-eafb-fb20-3c635af60d4f	03	Balet	balet (SURS 03)
00140000-569c-eafb-1208-b436c47de979	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-569c-eafb-5156-c3c66dddd20f	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-569c-eafb-b0bc-f77e3bee7bc0	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-569c-eafb-a1c5-e22ddb285a8f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3189 (class 0 OID 37460692)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2621 (class 2606 OID 37460248)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 37460865)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 37460856)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 37460239)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 37460723)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 37460765)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 37461174)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 37460559)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 37460495)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 37460510)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 37460515)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 37461088)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 37460397)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 37460934)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 37460688)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 37460464)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 37460435)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 37460411)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 37460595)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 37461151)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 37461158)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 37461182)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2766 (class 2606 OID 37460622)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 37460369)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 37460267)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 37460331)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 37460294)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 37460228)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2610 (class 2606 OID 37460213)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 37460628)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 37460664)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 37460802)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 37460322)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 37460357)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 37461039)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 37460601)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 37460347)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 37460480)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 37460452)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 37460445)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 36291782)
-- Name: prisotnost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT prisotnost_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 37460613)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 37461048)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 37461056)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 37461026)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 37461069)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 37460646)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 37460586)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 37460577)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 37460789)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 37460716)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 37460423)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 37460184)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 37460655)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 37460202)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2612 (class 2606 OID 37460222)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 37460673)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 37460608)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 37460534)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 37460172)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 37460160)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 37460154)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 37460736)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 37460303)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 37460551)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 37460569)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 37460776)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 37460256)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 37461081)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 37460523)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 37460382)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 37460197)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 37460835)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 37460542)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 37460470)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 37460636)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 37460748)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 37461131)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 37461115)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 37461139)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 37460706)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 37017867)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 37460815)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 37460700)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 37460504)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 37460505)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 37460503)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 37460502)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 37460501)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 37460737)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 37460738)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 37460739)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 37461153)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 37461152)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2639 (class 1259 OID 37460324)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2640 (class 1259 OID 37460325)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 37460629)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 37461119)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 37461118)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 37461120)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 37461117)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 37461116)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2761 (class 1259 OID 37460615)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2762 (class 1259 OID 37460614)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 37460471)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 37460472)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 37460689)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 37460691)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 37460690)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2671 (class 1259 OID 37460413)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2672 (class 1259 OID 37460412)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 37461070)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 37460804)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 37460805)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 37460806)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 37461140)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 37460840)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 37460837)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 37460841)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 37460839)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 37460838)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2661 (class 1259 OID 37460384)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2662 (class 1259 OID 37460383)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2630 (class 1259 OID 37460297)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 37460656)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2614 (class 1259 OID 37460229)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2615 (class 1259 OID 37460230)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 37460676)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 37460675)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 37460674)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2644 (class 1259 OID 37460334)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2645 (class 1259 OID 37460333)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2646 (class 1259 OID 37460335)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2684 (class 1259 OID 37460446)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2685 (class 1259 OID 37460447)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2594 (class 1259 OID 37460162)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2741 (class 1259 OID 37460581)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2742 (class 1259 OID 37460579)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2743 (class 1259 OID 37460578)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2744 (class 1259 OID 37460580)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2605 (class 1259 OID 37460203)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2606 (class 1259 OID 37460204)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 37460637)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 37461175)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 37460725)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 37460724)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 37461183)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 37461184)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2756 (class 1259 OID 37460602)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 37460717)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 37460718)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 37460939)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 37460938)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 37460935)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 37460936)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 37460937)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2650 (class 1259 OID 37460349)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2651 (class 1259 OID 37460348)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2652 (class 1259 OID 37460350)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 37460650)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 37460649)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 37461049)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 37461050)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 37460869)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 37460870)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 37460867)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 37460868)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2585 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2735 (class 1259 OID 37460560)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2736 (class 1259 OID 37460561)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 37460707)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 37460708)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2724 (class 1259 OID 37460543)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2747 (class 1259 OID 37460590)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2748 (class 1259 OID 37460589)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2749 (class 1259 OID 37460587)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2750 (class 1259 OID 37460588)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 37460857)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2675 (class 1259 OID 37460424)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2678 (class 1259 OID 37460438)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2679 (class 1259 OID 37460437)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2680 (class 1259 OID 37460436)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2681 (class 1259 OID 37460439)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 37460465)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 37460453)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 37460454)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 37461040)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 37461089)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 37461159)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 37461160)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2626 (class 1259 OID 37460269)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2627 (class 1259 OID 37460268)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2635 (class 1259 OID 37460304)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2636 (class 1259 OID 37460305)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2728 (class 1259 OID 37460554)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 37460553)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2730 (class 1259 OID 37460552)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2708 (class 1259 OID 37460497)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2709 (class 1259 OID 37460500)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2710 (class 1259 OID 37460496)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2711 (class 1259 OID 37460499)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2712 (class 1259 OID 37460498)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 37460323)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 37460257)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 37460258)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2667 (class 1259 OID 37460398)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 37460400)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2669 (class 1259 OID 37460399)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2670 (class 1259 OID 37460401)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2755 (class 1259 OID 37460596)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 37460803)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 37460836)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 37460777)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 37460778)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2633 (class 1259 OID 37460295)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 37460296)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2739 (class 1259 OID 37460570)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2740 (class 1259 OID 37460571)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 37460701)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 37460173)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2660 (class 1259 OID 37460370)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2649 (class 1259 OID 37460332)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 37460161)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 37461082)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 37460648)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 37460647)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2719 (class 1259 OID 37460524)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 37460525)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 37460866)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2725 (class 1259 OID 37460544)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2657 (class 1259 OID 37460358)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 37460816)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 37461132)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 37461057)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 37461058)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 37460766)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2723 (class 1259 OID 37460535)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 37460223)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2942 (class 2606 OID 37461350)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2947 (class 2606 OID 37461375)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2945 (class 2606 OID 37461365)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2941 (class 2606 OID 37461345)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2944 (class 2606 OID 37461360)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2946 (class 2606 OID 37461370)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2943 (class 2606 OID 37461355)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2984 (class 2606 OID 37461560)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2985 (class 2606 OID 37461565)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2986 (class 2606 OID 37461570)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3018 (class 2606 OID 37461730)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 37461725)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2920 (class 2606 OID 37461240)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2921 (class 2606 OID 37461245)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2967 (class 2606 OID 37461475)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3014 (class 2606 OID 37461710)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 37461705)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3015 (class 2606 OID 37461715)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 37461700)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3011 (class 2606 OID 37461695)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2966 (class 2606 OID 37461470)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2965 (class 2606 OID 37461465)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2939 (class 2606 OID 37461335)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2940 (class 2606 OID 37461340)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2975 (class 2606 OID 37461515)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 37461525)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2976 (class 2606 OID 37461520)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2931 (class 2606 OID 37461295)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2930 (class 2606 OID 37461290)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 37461455)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 37461685)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2987 (class 2606 OID 37461575)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2988 (class 2606 OID 37461580)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2989 (class 2606 OID 37461585)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3016 (class 2606 OID 37461720)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2993 (class 2606 OID 37461605)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2990 (class 2606 OID 37461590)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2994 (class 2606 OID 37461610)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2992 (class 2606 OID 37461600)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2991 (class 2606 OID 37461595)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2929 (class 2606 OID 37461285)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2928 (class 2606 OID 37461280)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2917 (class 2606 OID 37461225)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2916 (class 2606 OID 37461220)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2971 (class 2606 OID 37461495)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2912 (class 2606 OID 37461200)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2913 (class 2606 OID 37461205)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2974 (class 2606 OID 37461510)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2973 (class 2606 OID 37461505)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2972 (class 2606 OID 37461500)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 37461255)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2922 (class 2606 OID 37461250)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2924 (class 2606 OID 37461260)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 37461310)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 37461315)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2909 (class 2606 OID 37461185)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2958 (class 2606 OID 37461430)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2956 (class 2606 OID 37461420)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2955 (class 2606 OID 37461415)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2957 (class 2606 OID 37461425)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2910 (class 2606 OID 37461190)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2911 (class 2606 OID 37461195)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2968 (class 2606 OID 37461480)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3021 (class 2606 OID 37461745)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2983 (class 2606 OID 37461555)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 37461550)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 37461750)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3023 (class 2606 OID 37461755)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 37461460)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 37461540)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2981 (class 2606 OID 37461545)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3004 (class 2606 OID 37461660)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3003 (class 2606 OID 37461655)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3000 (class 2606 OID 37461640)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3001 (class 2606 OID 37461645)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3002 (class 2606 OID 37461650)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 37461270)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 37461265)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 37461275)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2970 (class 2606 OID 37461490)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 37461485)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 37461670)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3007 (class 2606 OID 37461675)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2998 (class 2606 OID 37461630)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2999 (class 2606 OID 37461635)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2996 (class 2606 OID 37461620)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 37461625)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2953 (class 2606 OID 37461405)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2954 (class 2606 OID 37461410)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 37461530)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2979 (class 2606 OID 37461535)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2948 (class 2606 OID 37461380)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2949 (class 2606 OID 37461385)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2962 (class 2606 OID 37461450)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2961 (class 2606 OID 37461445)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2959 (class 2606 OID 37461435)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2960 (class 2606 OID 37461440)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2995 (class 2606 OID 37461615)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 37461300)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 37461305)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 37461330)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2936 (class 2606 OID 37461320)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2937 (class 2606 OID 37461325)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3005 (class 2606 OID 37461665)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3008 (class 2606 OID 37461680)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3010 (class 2606 OID 37461690)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 37461735)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3020 (class 2606 OID 37461740)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2915 (class 2606 OID 37461215)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2914 (class 2606 OID 37461210)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2918 (class 2606 OID 37461230)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 37461235)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 37461400)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 37461395)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2950 (class 2606 OID 37461390)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-18 14:39:14 CET

--
-- PostgreSQL database dump complete
--

