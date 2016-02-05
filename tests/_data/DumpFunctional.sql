--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-02-05 16:47:52 CET

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
-- TOC entry 185 (class 1259 OID 43859381)
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
-- TOC entry 241 (class 1259 OID 43859999)
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
-- TOC entry 240 (class 1259 OID 43859983)
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
-- TOC entry 184 (class 1259 OID 43859374)
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
-- TOC entry 183 (class 1259 OID 43859372)
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
-- TOC entry 231 (class 1259 OID 43859860)
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
-- TOC entry 234 (class 1259 OID 43859890)
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
-- TOC entry 255 (class 1259 OID 43860302)
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
-- TOC entry 212 (class 1259 OID 43859696)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 43859621)
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
-- TOC entry 206 (class 1259 OID 43859647)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 43859652)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 43860224)
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
-- TOC entry 196 (class 1259 OID 43859527)
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
-- TOC entry 242 (class 1259 OID 43860012)
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
-- TOC entry 227 (class 1259 OID 43859818)
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
-- TOC entry 202 (class 1259 OID 43859595)
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
-- TOC entry 199 (class 1259 OID 43859567)
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
-- TOC entry 197 (class 1259 OID 43859544)
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
-- TOC entry 216 (class 1259 OID 43859732)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 43860282)
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
-- TOC entry 254 (class 1259 OID 43860295)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 43860317)
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
-- TOC entry 220 (class 1259 OID 43859756)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 43859501)
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
-- TOC entry 187 (class 1259 OID 43859401)
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
-- TOC entry 191 (class 1259 OID 43859468)
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
-- TOC entry 188 (class 1259 OID 43859412)
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
-- TOC entry 180 (class 1259 OID 43859346)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 43859365)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 43859763)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 43859798)
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
-- TOC entry 237 (class 1259 OID 43859931)
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
-- TOC entry 190 (class 1259 OID 43859448)
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
-- TOC entry 193 (class 1259 OID 43859493)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 43860168)
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
-- TOC entry 217 (class 1259 OID 43859738)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 43859478)
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
-- TOC entry 204 (class 1259 OID 43859613)
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
-- TOC entry 200 (class 1259 OID 43859582)
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
-- TOC entry 201 (class 1259 OID 43859588)
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
-- TOC entry 219 (class 1259 OID 43859750)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 43860182)
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
-- TOC entry 246 (class 1259 OID 43860192)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 43860081)
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
-- TOC entry 247 (class 1259 OID 43860200)
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
-- TOC entry 223 (class 1259 OID 43859778)
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
-- TOC entry 215 (class 1259 OID 43859723)
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
-- TOC entry 214 (class 1259 OID 43859713)
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
-- TOC entry 236 (class 1259 OID 43859920)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 43859850)
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
-- TOC entry 198 (class 1259 OID 43859556)
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
-- TOC entry 177 (class 1259 OID 43859317)
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
-- TOC entry 176 (class 1259 OID 43859315)
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
-- TOC entry 224 (class 1259 OID 43859792)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 43859355)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 43859339)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 43859806)
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
-- TOC entry 218 (class 1259 OID 43859744)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 43859667)
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
-- TOC entry 175 (class 1259 OID 43859304)
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
-- TOC entry 174 (class 1259 OID 43859296)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 43859291)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 43859867)
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
-- TOC entry 189 (class 1259 OID 43859440)
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
-- TOC entry 211 (class 1259 OID 43859686)
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
-- TOC entry 213 (class 1259 OID 43859703)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 43859908)
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
-- TOC entry 186 (class 1259 OID 43859391)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 43860212)
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
-- TOC entry 208 (class 1259 OID 43859657)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 43859513)
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
-- TOC entry 178 (class 1259 OID 43859326)
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
-- TOC entry 239 (class 1259 OID 43859958)
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
-- TOC entry 210 (class 1259 OID 43859677)
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
-- TOC entry 203 (class 1259 OID 43859606)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 43859770)
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
-- TOC entry 233 (class 1259 OID 43859881)
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
-- TOC entry 251 (class 1259 OID 43860262)
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
-- TOC entry 250 (class 1259 OID 43860231)
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
-- TOC entry 252 (class 1259 OID 43860274)
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
-- TOC entry 229 (class 1259 OID 43859843)
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
-- TOC entry 238 (class 1259 OID 43859948)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 43859833)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 43859377)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 43859320)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 43859381)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56b4-c424-c522-bcdd518146eb	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56b4-c424-0b3c-58684de25045	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56b4-c424-7d30-65cfa253434e	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 43859999)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56b4-c425-7e7a-a0d9392989d4	000d0000-56b4-c425-d536-ef5a88a09cf4	\N	00090000-56b4-c424-f9dd-ce73b3437a19	000b0000-56b4-c424-b3d3-c981938e5e49	0001	f	\N	\N	\N	3	t	t	t
000c0000-56b4-c425-69ec-bb67243a0207	000d0000-56b4-c425-efb5-3246e2a8cbb2	00100000-56b4-c424-3366-06ee3ca8bd10	00090000-56b4-c424-d316-95c173aa5215	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56b4-c425-9adc-873f872e76db	000d0000-56b4-c425-9ace-9797c0687076	00100000-56b4-c424-4676-35206d6371dd	00090000-56b4-c424-22ab-19eda40fe9f3	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56b4-c425-01f4-547d55f76079	000d0000-56b4-c425-f209-96e1a17ad0f2	\N	00090000-56b4-c424-3c78-34efcb969189	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56b4-c425-131e-0fb1f7f57b4d	000d0000-56b4-c425-0ead-11b65c9ea862	\N	00090000-56b4-c424-6ed7-a742044469e9	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56b4-c425-0c6e-bd02ed624724	000d0000-56b4-c425-5f22-7f1439ed7e32	\N	00090000-56b4-c424-d598-c50e26cfc0df	000b0000-56b4-c424-4d26-6de9ee5fb258	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56b4-c425-f88d-5f8eb05a34bb	000d0000-56b4-c425-bcba-906dbcca3278	00100000-56b4-c424-d067-3804236cbd75	00090000-56b4-c424-7e77-e6d1edf71e24	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56b4-c425-d4fe-5392dbeb3951	000d0000-56b4-c425-834e-5b03707e2a1d	\N	00090000-56b4-c424-be28-056116acea87	000b0000-56b4-c424-29b0-7b59de913a07	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56b4-c425-edc9-f27e5f416841	000d0000-56b4-c425-bcba-906dbcca3278	00100000-56b4-c424-3a2d-8892b4b3db28	00090000-56b4-c424-5127-6616c7b774b6	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56b4-c425-bc64-94710401f682	000d0000-56b4-c425-bcba-906dbcca3278	00100000-56b4-c424-7051-c5c1c3ddb965	00090000-56b4-c424-5e68-1cc2a371c74d	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56b4-c425-b29a-1d40ec379f74	000d0000-56b4-c425-bcba-906dbcca3278	00100000-56b4-c424-4f82-2346d78c1958	00090000-56b4-c424-2981-2d98b395aed2	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56b4-c425-b7c0-886516db24ba	000d0000-56b4-c425-eea7-60e038c92f37	00100000-56b4-c424-3366-06ee3ca8bd10	00090000-56b4-c424-d316-95c173aa5215	000b0000-56b4-c424-470e-bfb80fb7b1f7	0012	t	\N	\N	\N	2	t	t	t
000c0000-56b4-c425-88a0-9300862e204e	000d0000-56b4-c425-1c8c-2162976d8561	\N	00090000-56b4-c424-be28-056116acea87	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56b4-c425-7046-3f004877620b	000d0000-56b4-c425-1c8c-2162976d8561	\N	00090000-56b4-c424-60a9-a172faf4f4ae	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56b4-c425-c4df-e81477c5a0a6	000d0000-56b4-c425-4403-f5715922d314	00100000-56b4-c424-4676-35206d6371dd	00090000-56b4-c424-22ab-19eda40fe9f3	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56b4-c425-edef-86e05cbf154e	000d0000-56b4-c425-4403-f5715922d314	\N	00090000-56b4-c424-60a9-a172faf4f4ae	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56b4-c425-9463-6d5db7386ac2	000d0000-56b4-c425-9cc3-dcdaadcd7e16	\N	00090000-56b4-c424-60a9-a172faf4f4ae	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56b4-c425-1d35-3cf2b0ca92e2	000d0000-56b4-c425-9cc3-dcdaadcd7e16	\N	00090000-56b4-c424-be28-056116acea87	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56b4-c425-ca96-572eb139d4e3	000d0000-56b4-c425-03f5-a26673c26f71	00100000-56b4-c424-d067-3804236cbd75	00090000-56b4-c424-7e77-e6d1edf71e24	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56b4-c425-e009-6d67c29e634b	000d0000-56b4-c425-03f5-a26673c26f71	\N	00090000-56b4-c424-60a9-a172faf4f4ae	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56b4-c425-1d0e-c86800054b0f	000d0000-56b4-c425-2790-eb6b486ded0b	\N	00090000-56b4-c424-60a9-a172faf4f4ae	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56b4-c425-ed4a-bcabf090f84f	000d0000-56b4-c425-2790-eb6b486ded0b	00100000-56b4-c424-d067-3804236cbd75	00090000-56b4-c424-7e77-e6d1edf71e24	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56b4-c425-584f-4d85900399a5	000d0000-56b4-c425-a31f-a04874114aea	\N	00090000-56b4-c424-60a9-a172faf4f4ae	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56b4-c425-7959-ca81920468c5	000d0000-56b4-c425-f780-c2802aca873c	\N	00090000-56b4-c424-be28-056116acea87	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56b4-c425-94a4-78112a352402	000d0000-56b4-c425-3af7-8326e327c237	\N	00090000-56b4-c424-be28-056116acea87	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56b4-c425-ee29-e97f47fe4421	000d0000-56b4-c425-3af7-8326e327c237	00100000-56b4-c424-4676-35206d6371dd	00090000-56b4-c424-22ab-19eda40fe9f3	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56b4-c425-cade-5c531579a450	000d0000-56b4-c425-76b6-33a7f870f7a1	\N	00090000-56b4-c424-9187-6e1c9075cc5a	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56b4-c425-2458-a0d7b963393b	000d0000-56b4-c425-76b6-33a7f870f7a1	\N	00090000-56b4-c424-ddc6-31242a042753	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56b4-c425-e24a-82e4af1d7223	000d0000-56b4-c425-84c3-24e5cd2cfeeb	\N	00090000-56b4-c424-be28-056116acea87	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56b4-c425-12ae-6f2d2631b623	000d0000-56b4-c425-84c3-24e5cd2cfeeb	00100000-56b4-c424-4676-35206d6371dd	00090000-56b4-c424-22ab-19eda40fe9f3	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56b4-c425-cfe9-6b746cfa338a	000d0000-56b4-c425-84c3-24e5cd2cfeeb	\N	00090000-56b4-c424-ddc6-31242a042753	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56b4-c425-604c-0882bfaf3518	000d0000-56b4-c425-84c3-24e5cd2cfeeb	\N	00090000-56b4-c424-9187-6e1c9075cc5a	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56b4-c425-2944-2ef4ad90af34	000d0000-56b4-c425-4829-b1ca57220b06	\N	00090000-56b4-c424-be28-056116acea87	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56b4-c425-65c1-1a59631a0e97	000d0000-56b4-c425-9063-e0e1c927b221	00100000-56b4-c424-4676-35206d6371dd	00090000-56b4-c424-22ab-19eda40fe9f3	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56b4-c425-1ccc-50ca6587062c	000d0000-56b4-c425-9063-e0e1c927b221	\N	00090000-56b4-c424-60a9-a172faf4f4ae	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 43859983)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 43859374)
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
-- TOC entry 3191 (class 0 OID 43859860)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56b4-c424-9d61-5b1869363227	00160000-56b4-c424-9a66-df3f50ce5d2f	00090000-56b4-c424-ddc6-31242a042753	aizv	10	t
003d0000-56b4-c424-24ab-5ee1d591cbe4	00160000-56b4-c424-9a66-df3f50ce5d2f	00090000-56b4-c424-4351-a3ca65e99578	apri	14	t
003d0000-56b4-c424-f531-f7eb89e5ea40	00160000-56b4-c424-f2cf-a4e3b6b5e33d	00090000-56b4-c424-9187-6e1c9075cc5a	aizv	11	t
003d0000-56b4-c425-905f-0043f4148d22	00160000-56b4-c424-b674-60c71e95a8e4	00090000-56b4-c424-0c78-f80e82cc3716	aizv	12	t
003d0000-56b4-c425-de6f-9519d83bc18e	00160000-56b4-c424-9a66-df3f50ce5d2f	00090000-56b4-c424-60a9-a172faf4f4ae	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 43859890)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56b4-c424-9a66-df3f50ce5d2f	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56b4-c424-f2cf-a4e3b6b5e33d	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56b4-c424-b674-60c71e95a8e4	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 43860302)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 43859696)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 43859621)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva, nadrejenogostovanje_id) FROM stdin;
00180000-56b4-c424-ed00-8edd456cd0e7	\N	\N	\N	\N	00440000-56b4-c424-1be1-56add46f24f9	00220000-56b4-c424-fcf1-62a7eee4f083	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N	\N
00180000-56b4-c424-399f-252ffccee6bb	\N	\N	\N	\N	00440000-56b4-c424-d6f7-586878d5a042	00220000-56b4-c424-c5fa-322d50b43a3b	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N	\N
00180000-56b4-c424-f3d0-63ff10d079b3	\N	\N	\N	001e0000-56b4-c424-6e32-367ab591f016	\N	00220000-56b4-c424-fcf1-62a7eee4f083	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N	\N
00180000-56b4-c424-63af-bd9db1cc39a1	\N	\N	\N	001e0000-56b4-c424-a538-8af0400cadf2	\N	00220000-56b4-c424-c5fa-322d50b43a3b	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N	\N
00180000-56b4-c425-3ef7-e3dc9a6822b1	\N	00200000-56b4-c425-db56-6f7bdc0f348d	\N	\N	\N	00220000-56b4-c424-a16b-048832eb8398	\N	2012-05-20 10:00:00	2012-05-20 12:00:00	200s	200s	\N	Vaja 1.	\N	\N
00180000-56b4-c425-2dc6-657d601f7d54	\N	00200000-56b4-c425-bcdb-3d68074924e0	\N	\N	\N	00220000-56b4-c424-a16b-048832eb8398	001f0000-56b4-c424-6303-31c7e3d3de2c	2015-06-04 10:00:00	2015-06-04 12:00:00	400s	200s	\N	Vaja 2.	\N	\N
00180000-56b4-c425-7889-8d16eec91a4c	\N	00200000-56b4-c425-ec43-58c3bccd7441	\N	\N	\N	00220000-56b4-c424-c5fa-322d50b43a3b	\N	2012-08-01 20:00:00	2012-08-01 23:00:00	400s	200s	\N	Vaja 3.	\N	\N
00180000-56b4-c425-992b-3585a00c20c5	\N	00200000-56b4-c425-71e0-4e0bed74303c	\N	\N	\N	00220000-56b4-c424-15f5-2ac6d3931ab4	\N	2012-08-01 20:00:00	2012-08-01 23:00:00	200s	200s	\N	Vaja 4.	\N	\N
00180000-56b4-c425-4d50-0c6ce5acc503	\N	00200000-56b4-c425-7f34-2924beecf726	\N	\N	\N	00220000-56b4-c424-a89c-37432e767b11	\N	2012-08-01 20:00:00	2012-08-01 23:00:00	500s	200s	\N	Vaja 5.	\N	\N
00180000-56b4-c425-6315-2a2dbf9e4927	\N	00200000-56b4-c425-04f8-fa5f2f65d918	\N	\N	\N	00220000-56b4-c424-c5fa-322d50b43a3b	\N	2012-08-01 20:00:00	2012-08-01 23:00:00	400s	200s	\N	Vaja 6.	\N	\N
00180000-56b4-c425-09c0-02ac5edc0ee9	\N	00200000-56b4-c425-087f-42a4c9338871	\N	\N	\N	00220000-56b4-c424-a89c-37432e767b11	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 7.	\N	\N
00180000-56b4-c425-c752-55a1098537ca	\N	00200000-56b4-c425-d852-6b82391500a0	\N	\N	\N	00220000-56b4-c424-a89c-37432e767b11	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 8.	\N	\N
00180000-56b4-c425-a32b-b5c40133dfce	\N	00200000-56b4-c425-1bf5-3826b69e43c0	\N	\N	\N	00220000-56b4-c424-a16b-048832eb8398	001f0000-56b4-c424-4711-2f919e27ef7a	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	Vaja 9.	\N	\N
00180000-56b4-c425-f8c9-a469dd7fd370	\N	00200000-56b4-c425-8948-802e39e4d523	\N	\N	\N	00220000-56b4-c424-a16b-048832eb8398	001f0000-56b4-c424-4711-2f919e27ef7a	2014-06-11 07:00:00	2014-06-12 15:00:00	400s	200s	\N	Vaja 10.	\N	\N
00180000-56b4-c425-8a4f-6f759593f7e3	\N	00200000-56b4-c425-96d8-0147e85c5d97	\N	\N	\N	00220000-56b4-c424-a16b-048832eb8398	\N	2012-06-04 10:00:00	2012-06-04 12:00:00	400s	200s	\N	Vaja 11.	\N	\N
00180000-56b4-c425-880f-c8ecd6fa80b0	\N	\N	001c0000-56b4-c425-0730-7f9800d18cbe	\N	\N	\N	001f0000-56b4-c424-6303-31c7e3d3de2c	2015-03-10 07:00:00	2015-03-20 23:00:00	200s	300s	\N	Gostovanje 1.	#001122	\N
00180000-56b4-c425-b799-4ae5d5b15e24	001b0000-56b4-c425-7677-73123be1e4c2	\N	\N	\N	\N	00220000-56b4-c424-fcf1-62a7eee4f083	001f0000-56b4-c424-4711-2f919e27ef7a	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N	\N
00180000-56b4-c425-80c4-eee9dd16e389	001b0000-56b4-c425-fff4-8cad2cb80ce0	\N	\N	\N	\N	00220000-56b4-c424-c5fa-322d50b43a3b	001f0000-56b4-c424-4711-2f919e27ef7a	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N	\N
00180000-56b4-c425-fc78-37eaca3978b1	001b0000-56b4-c425-6d46-ff361e06d1af	\N	\N	\N	\N	00220000-56b4-c424-fcf1-62a7eee4f083	001f0000-56b4-c424-4711-2f919e27ef7a	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N	\N
00180000-56b4-c425-50ce-293ee62f6d27	001b0000-56b4-c425-c3f3-da63db6365aa	\N	\N	\N	\N	00220000-56b4-c424-fcf1-62a7eee4f083	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N	\N
00180000-56b4-c425-97b7-78dc2c527a13	001b0000-56b4-c425-cc8d-490b9800a960	\N	\N	\N	\N	00220000-56b4-c424-fcf1-62a7eee4f083	001f0000-56b4-c424-6303-31c7e3d3de2c	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N	\N
00180000-56b4-c425-fae3-25c613ccd448	001b0000-56b4-c425-44a1-180d58c005ab	\N	\N	\N	\N	00220000-56b4-c424-fcf1-62a7eee4f083	001f0000-56b4-c424-6303-31c7e3d3de2c	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N	\N
00180000-56b4-c425-e99d-0ef5a0bfd2b6	001b0000-56b4-c425-705a-1a2a3ac09b49	\N	\N	\N	\N	00220000-56b4-c424-fcf1-62a7eee4f083	001f0000-56b4-c424-4711-2f919e27ef7a	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N	\N
00180000-56b4-c425-c8ed-bc1e62b0127d	001b0000-56b4-c425-f84d-5fc0ef17713e	\N	\N	\N	\N	00220000-56b4-c424-fcf1-62a7eee4f083	001f0000-56b4-c424-6303-31c7e3d3de2c	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N	\N
00180000-56b4-c425-3872-b103697cf910	001b0000-56b4-c425-8a81-8f3c1b62ba12	\N	\N	\N	\N	00220000-56b4-c424-fcf1-62a7eee4f083	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N	\N
00180000-56b4-c425-bed8-224c72fc1966	001b0000-56b4-c425-336e-e0fa5034385d	\N	\N	\N	\N	00220000-56b4-c424-fcf1-62a7eee4f083	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N	\N
00180000-56b4-c425-26ea-ce186f292292	001b0000-56b4-c425-057d-4fd1a1a5a7e8	\N	\N	\N	\N	00220000-56b4-c424-fcf1-62a7eee4f083	001f0000-56b4-c424-6303-31c7e3d3de2c	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N	\N
00180000-56b4-c425-29f4-f75836521b11	001b0000-56b4-c425-54e0-9155f71ba828	\N	\N	\N	\N	00220000-56b4-c424-fcf1-62a7eee4f083	001f0000-56b4-c424-1be8-4795fd8723c2	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N	\N
00180000-56b4-c425-da3e-c2016136bdc5	001b0000-56b4-c425-1f12-6832d04a82dd	\N	\N	\N	\N	00220000-56b4-c424-fcf1-62a7eee4f083	001f0000-56b4-c424-1be8-4795fd8723c2	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N	\N
00180000-56b4-c425-6420-6ddf6bb9469d	001b0000-56b4-c425-8833-434fc72feb82	\N	\N	\N	\N	00220000-56b4-c424-fcf1-62a7eee4f083	001f0000-56b4-c424-6303-31c7e3d3de2c	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N	\N
00180000-56b4-c425-faac-9f36b9c0fcac	001b0000-56b4-c425-6438-6189fb8b264f	\N	\N	\N	\N	\N	001f0000-56b4-c424-6303-31c7e3d3de2c	2015-03-15 20:00:00	2015-03-15 23:00:00	200s	100s	\N	Predstava 15.	\N	001c0000-56b4-c425-0730-7f9800d18cbe
00180000-56b4-c425-f5ad-2a5ee4c81dba	001b0000-56b4-c425-53bc-193ee50d2252	\N	\N	\N	\N	\N	001f0000-56b4-c424-6303-31c7e3d3de2c	2015-03-16 20:00:00	2015-03-16 23:00:00	200s	100s	\N	Predstava 16.	\N	001c0000-56b4-c425-0730-7f9800d18cbe
\.


--
-- TOC entry 3166 (class 0 OID 43859647)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56b4-c424-6e32-367ab591f016
001e0000-56b4-c424-a538-8af0400cadf2
\.


--
-- TOC entry 3167 (class 0 OID 43859652)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56b4-c424-1be1-56add46f24f9
00440000-56b4-c424-d6f7-586878d5a042
\.


--
-- TOC entry 3209 (class 0 OID 43860224)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 43859527)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56b4-c421-5c77-90dd4405ac75	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56b4-c421-d953-a321ecdf96b6	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56b4-c421-0b68-7787460c9ad5	AL	ALB	008	Albania 	Albanija	\N
00040000-56b4-c421-3a47-4c31a78e7b0e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56b4-c421-d59f-5b4a5e0ece05	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56b4-c421-0923-c0f92dfd5f9a	AD	AND	020	Andorra 	Andora	\N
00040000-56b4-c421-0ffe-f2679253da22	AO	AGO	024	Angola 	Angola	\N
00040000-56b4-c421-608e-d29348b299d2	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56b4-c421-c30b-23f7674d176c	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56b4-c421-1bd0-aeab58b5ab8c	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56b4-c421-0818-e1d9be0788b6	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56b4-c421-9c3d-4dbb046cddb4	AM	ARM	051	Armenia 	Armenija	\N
00040000-56b4-c421-611d-846225ce2875	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56b4-c421-6254-70515269ff5c	AU	AUS	036	Australia 	Avstralija	\N
00040000-56b4-c421-af7d-30776e0d921b	AT	AUT	040	Austria 	Avstrija	\N
00040000-56b4-c421-7e54-d20f9363e51d	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56b4-c421-f21e-0c1c5f0fa26d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56b4-c421-e273-b5e8897782d4	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56b4-c421-dde5-0dda4b06051e	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56b4-c421-eec1-4cd057244c3b	BB	BRB	052	Barbados 	Barbados	\N
00040000-56b4-c421-0027-14620e1d802c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56b4-c421-6a1a-cfb06e0bc5a4	BE	BEL	056	Belgium 	Belgija	\N
00040000-56b4-c421-a22c-3f837abb1eee	BZ	BLZ	084	Belize 	Belize	\N
00040000-56b4-c421-df92-be4d711b9afa	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56b4-c421-6a60-208c63d556d4	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56b4-c421-ecc6-5c5f437ad3f7	BT	BTN	064	Bhutan 	Butan	\N
00040000-56b4-c421-8032-63fd7b3b942e	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56b4-c421-5ce8-217e52f2775e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56b4-c421-a5ba-4bfbb06e421d	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56b4-c421-8fc7-e4c5c82b00c3	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56b4-c421-d595-be5fe36a0d58	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56b4-c421-25f6-7a17a254becf	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56b4-c421-9a33-c6168a35ac1e	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56b4-c421-3a16-b211dfbc1803	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56b4-c421-ca8c-a0a8afc914db	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56b4-c421-339b-fc1f63128c50	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56b4-c421-e19c-c2153dd1ee6b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56b4-c421-b7d5-cf8a10752f21	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56b4-c421-4a8f-89054f91d8ad	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56b4-c421-2c3d-0dd290718b9f	CA	CAN	124	Canada 	Kanada	\N
00040000-56b4-c421-1c46-4edd6cfef4ac	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56b4-c421-f800-da71b64670af	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56b4-c421-7269-5c1937910dc9	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56b4-c421-d6ad-59c4ae5ecdd0	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56b4-c421-8b54-7e646ea3c8a1	CL	CHL	152	Chile 	Čile	\N
00040000-56b4-c421-323b-30d9b1537437	CN	CHN	156	China 	Kitajska	\N
00040000-56b4-c421-f8fa-4fa6fb4add42	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56b4-c421-7e0d-edbc08f76107	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56b4-c421-c51a-249366754b7b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56b4-c421-5f69-2f6e6ebddc4a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56b4-c421-3683-cf97d4113b39	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56b4-c421-fdfc-5454d32b3a0b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56b4-c421-1e90-7a251a45e900	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56b4-c421-f7aa-3b09ae28127a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56b4-c421-c714-7eb54c453fdd	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56b4-c421-5739-5aeb8476b168	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56b4-c421-ee58-4f62d36689c8	CU	CUB	192	Cuba 	Kuba	\N
00040000-56b4-c421-882b-d08a23a7d8cf	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56b4-c421-9cbc-b67cba81b3b3	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56b4-c421-304f-30e365959421	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56b4-c421-5d9b-5fa340e26f1e	DK	DNK	208	Denmark 	Danska	\N
00040000-56b4-c421-c2f6-c239b6a7b011	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56b4-c421-0ac8-45cb13441d50	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56b4-c421-bb1e-e6bd7cdf1538	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56b4-c421-2702-49cb03e1ffb5	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56b4-c421-2832-165bacdfbcdc	EG	EGY	818	Egypt 	Egipt	\N
00040000-56b4-c421-fb59-be0f9a66fa23	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56b4-c421-dc2d-d5d0eb77117e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56b4-c421-a276-00c230896ec6	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56b4-c421-d5ce-b748b5b27b5b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56b4-c421-54dc-7ac3a468df05	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56b4-c421-76ec-4a9a63abdf4c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56b4-c421-43d9-93e33ed9b9ae	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56b4-c421-37d5-70eafde33b30	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56b4-c421-26aa-91aae2eaecac	FI	FIN	246	Finland 	Finska	\N
00040000-56b4-c421-4bdd-965a30d47090	FR	FRA	250	France 	Francija	\N
00040000-56b4-c421-604e-9c41f1ea4577	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56b4-c421-6114-05fdb5385ad6	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56b4-c421-9861-5fa96ec2fdae	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56b4-c421-c7a6-3862592a00e2	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56b4-c421-7335-7bd7e3b051f4	GA	GAB	266	Gabon 	Gabon	\N
00040000-56b4-c421-6010-86a64fd3c9f5	GM	GMB	270	Gambia 	Gambija	\N
00040000-56b4-c421-4be1-aa5b322f23e0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56b4-c421-6ddf-0ab0a88f16ca	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56b4-c421-2bf5-3b4abb94db91	GH	GHA	288	Ghana 	Gana	\N
00040000-56b4-c421-aa34-a52a883356b0	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56b4-c421-0b9b-28f106047cf9	GR	GRC	300	Greece 	Grčija	\N
00040000-56b4-c421-4ad2-9c49f988ee9b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56b4-c421-fbc5-22c2fea8ae9f	GD	GRD	308	Grenada 	Grenada	\N
00040000-56b4-c421-0726-a5a5a5f6c821	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56b4-c421-ba5a-925b8ed423c3	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56b4-c421-c29a-44414ea4ff04	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56b4-c421-be5a-c1aa00745148	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56b4-c421-d3cc-ecfc0c590b73	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56b4-c421-490e-e2c942d51eb6	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56b4-c421-eeb9-7523971a33c5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56b4-c421-d586-418a30233a23	HT	HTI	332	Haiti 	Haiti	\N
00040000-56b4-c421-e27d-1da18b27e5ff	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56b4-c421-03e0-98c4a84d4469	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56b4-c421-9033-01b47d34ae5a	HN	HND	340	Honduras 	Honduras	\N
00040000-56b4-c421-d8d1-c130fda20464	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56b4-c421-57e6-cdb95bed8f71	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56b4-c421-a7cf-b343263f5e93	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56b4-c421-d1ba-2122388ec878	IN	IND	356	India 	Indija	\N
00040000-56b4-c421-0d89-33b81d39310f	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56b4-c421-0cc0-3920d886dda1	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56b4-c421-ed48-b6461afea4dc	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56b4-c421-9648-0664a53c3994	IE	IRL	372	Ireland 	Irska	\N
00040000-56b4-c421-becb-7f208c71f631	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56b4-c421-a24d-d7701b516edd	IL	ISR	376	Israel 	Izrael	\N
00040000-56b4-c421-b6ee-0c9378747858	IT	ITA	380	Italy 	Italija	\N
00040000-56b4-c421-764f-6a594d163056	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56b4-c421-1924-b1a3ad4e56f1	JP	JPN	392	Japan 	Japonska	\N
00040000-56b4-c421-b647-9fd78f277be4	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56b4-c421-06f1-2b91b1be0891	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56b4-c421-932d-bf551f2948f4	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56b4-c421-98fa-7805bba24003	KE	KEN	404	Kenya 	Kenija	\N
00040000-56b4-c421-be7d-4f25e4261b72	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56b4-c421-e6fe-a75b5ba1a69b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56b4-c421-dd74-26ea36cccbe7	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56b4-c421-52f4-a73a2a6241ca	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56b4-c421-3d5f-cf5aa8ff3e03	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56b4-c421-696a-349769924493	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56b4-c421-25ac-60f618f667c4	LV	LVA	428	Latvia 	Latvija	\N
00040000-56b4-c421-8e59-ba36c634fcd4	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56b4-c421-07a7-6ba294a5f370	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56b4-c421-b2fc-10edd28642e8	LR	LBR	430	Liberia 	Liberija	\N
00040000-56b4-c421-5c4b-75e6c043eb7f	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56b4-c421-e9e4-83b333b5d633	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56b4-c421-80f0-ad4e19bc4920	LT	LTU	440	Lithuania 	Litva	\N
00040000-56b4-c421-4c78-784532c5688f	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56b4-c421-220c-903405ef0318	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56b4-c421-4285-87c8e7dcbea6	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56b4-c421-cda8-e80b7ff3ec28	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56b4-c421-7457-b180c923faa2	MW	MWI	454	Malawi 	Malavi	\N
00040000-56b4-c421-e374-c43bc53c8d3c	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56b4-c421-a891-cbc1a8d273aa	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56b4-c421-f4b9-817ce9ef4373	ML	MLI	466	Mali 	Mali	\N
00040000-56b4-c421-2b35-328ca061e821	MT	MLT	470	Malta 	Malta	\N
00040000-56b4-c421-577b-a06587206a44	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56b4-c421-0105-af0e6e1d26e8	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56b4-c421-3d2e-278758cd952b	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56b4-c421-0785-329668e07b9c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56b4-c421-7c96-347fe342f828	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56b4-c421-5203-d6272a6bb280	MX	MEX	484	Mexico 	Mehika	\N
00040000-56b4-c421-c756-bffde04375d5	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56b4-c421-03d1-17c5b643fda4	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56b4-c421-e5c0-71d620a62b6e	MC	MCO	492	Monaco 	Monako	\N
00040000-56b4-c421-080f-3e53f1c6acee	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56b4-c421-113b-527dfd2b72c2	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56b4-c421-5e52-6c7b7ccd5341	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56b4-c421-7126-d44688a6a5f1	MA	MAR	504	Morocco 	Maroko	\N
00040000-56b4-c421-2d3a-7a3e242b619e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56b4-c421-7132-a53cb6c14142	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56b4-c421-11f4-7f46b01aeeb9	NA	NAM	516	Namibia 	Namibija	\N
00040000-56b4-c421-e488-d81346b4a0ab	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56b4-c421-3efa-0ff14f16256f	NP	NPL	524	Nepal 	Nepal	\N
00040000-56b4-c421-d2b1-ad6ff3211cfa	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56b4-c421-baa4-3414575aa404	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56b4-c421-4c74-7eaf37a071c3	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56b4-c421-9107-7db8a0320c8c	NE	NER	562	Niger 	Niger 	\N
00040000-56b4-c421-aef8-ca16bd1658da	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56b4-c421-6a5e-a70ff557413e	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56b4-c421-893a-419e34744b89	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56b4-c421-30c9-2bbcbbb240ae	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56b4-c421-d0f7-c267bfc4f43d	NO	NOR	578	Norway 	Norveška	\N
00040000-56b4-c421-2197-6cb9f12cb646	OM	OMN	512	Oman 	Oman	\N
00040000-56b4-c421-08a0-5cb08ce4ceaf	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56b4-c421-a0a8-d8a49f223134	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56b4-c421-478e-510e5030eeda	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56b4-c421-2679-8b7c825186d2	PA	PAN	591	Panama 	Panama	\N
00040000-56b4-c421-f2b2-bfd1223e53da	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56b4-c421-b0ca-54ef0b481037	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56b4-c421-617b-c60a0bc34dfe	PE	PER	604	Peru 	Peru	\N
00040000-56b4-c421-4e3b-c39edcfba54a	PH	PHL	608	Philippines 	Filipini	\N
00040000-56b4-c421-3f19-1169c62d9771	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56b4-c421-4bc2-4c40465ede07	PL	POL	616	Poland 	Poljska	\N
00040000-56b4-c421-c05d-1c4e3bafaaba	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56b4-c421-3ba6-bc833a84aec6	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56b4-c421-d3b9-b7479cdc13ff	QA	QAT	634	Qatar 	Katar	\N
00040000-56b4-c421-dd16-21454de33172	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56b4-c421-409f-851a04045e02	RO	ROU	642	Romania 	Romunija	\N
00040000-56b4-c421-0229-c391d47759d5	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56b4-c421-e5cb-582cc098ed35	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56b4-c421-68d2-2abba5bdb158	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56b4-c421-a50a-bf43725215cd	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56b4-c421-f10c-cd7936ccc0e1	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56b4-c421-f780-18a820f2e7bf	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56b4-c421-07c8-ed96ab75bb2e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56b4-c421-8d49-f61e4e0461b9	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56b4-c421-9379-7fd7a1361018	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56b4-c421-34c5-924825af64fa	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56b4-c421-ba95-d739f5082582	SM	SMR	674	San Marino 	San Marino	\N
00040000-56b4-c421-0457-3ed9ee7783bb	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56b4-c421-d61c-eb660c725cf3	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56b4-c421-4b76-c32e091f61a6	SN	SEN	686	Senegal 	Senegal	\N
00040000-56b4-c421-310d-f99fbc642d7a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56b4-c421-ca4d-e81be5920780	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56b4-c421-b43b-4c2108a041b5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56b4-c421-afe6-e0bc00c9b06b	SG	SGP	702	Singapore 	Singapur	\N
00040000-56b4-c421-c212-19c324d9740d	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56b4-c421-ec96-0b8178173cd6	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56b4-c421-d6cf-926f0dfa0736	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56b4-c421-727e-f001427f283d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56b4-c421-a164-d9a567539eca	SO	SOM	706	Somalia 	Somalija	\N
00040000-56b4-c421-812a-05ec67e8f652	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56b4-c421-18f0-1e593d545ba2	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56b4-c421-e661-504da5d79d2d	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56b4-c421-8e5a-45a5332efed8	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56b4-c421-0aae-fe73b0506fea	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56b4-c421-6c7f-fea57bce8229	SD	SDN	729	Sudan 	Sudan	\N
00040000-56b4-c421-3677-1fba49a4b0ad	SR	SUR	740	Suriname 	Surinam	\N
00040000-56b4-c421-bb4e-40def89d6ef3	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56b4-c421-2209-bc12d30117c9	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56b4-c421-ebf8-1e1a13430767	SE	SWE	752	Sweden 	Švedska	\N
00040000-56b4-c421-c9ab-a5092a601183	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56b4-c421-f713-7646e0f6ec67	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56b4-c421-ce4b-2d230911b21e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56b4-c421-91f7-71370e9670fa	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56b4-c421-7d80-6b69fd5c2528	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56b4-c421-cd6b-1cf58088be72	TH	THA	764	Thailand 	Tajska	\N
00040000-56b4-c421-610c-1a22e5406d4a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56b4-c421-b1ff-88eb0d053bf7	TG	TGO	768	Togo 	Togo	\N
00040000-56b4-c421-907d-e9c7bec253a8	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56b4-c421-b60d-3e1e40f2ce0c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56b4-c421-0357-48cc5a72faf7	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56b4-c421-37aa-4e63e2ce22e5	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56b4-c421-4e2f-ea4f47578186	TR	TUR	792	Turkey 	Turčija	\N
00040000-56b4-c421-2ad3-f13509edfe56	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56b4-c421-8ffa-8ae5ab9a5904	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56b4-c421-5e94-3ede1652972d	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56b4-c421-3f39-1cd1e2fbe70d	UG	UGA	800	Uganda 	Uganda	\N
00040000-56b4-c421-79ce-95da07f48e48	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56b4-c421-903d-c6fff662c76a	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56b4-c421-82b5-0b7aeeaa7e05	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56b4-c421-6da8-b1039f48d7bc	US	USA	840	United States 	Združene države Amerike	\N
00040000-56b4-c421-6d6c-1d5f7b7b6d40	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56b4-c421-5436-694072d7777e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56b4-c421-d3bb-2c12ecac32ec	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56b4-c421-76cf-ba16c6f5fd09	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56b4-c421-b8cd-be03bfe41886	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56b4-c421-ad6c-cdabbde9abd1	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56b4-c421-883a-0ef44d224c7c	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56b4-c421-3305-7c13c997381e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56b4-c421-6ac2-44a0d0df79e6	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56b4-c421-a980-da1e2f41bdd2	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56b4-c421-0cb7-c5c787618a34	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56b4-c421-8aac-005aa1fd2b75	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56b4-c421-aeb5-e5b907148a9e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 43860012)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56b4-c425-2a6e-d665e13153e3	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56b4-c425-3eea-c2cc94cf16cc	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56b4-c425-f5a3-b7971e67e7ad	000e0000-56b4-c425-0d84-f5a0612a9a91	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56b4-c420-cfee-fc79045033aa	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56b4-c425-618b-5feef0e3cbb4	000e0000-56b4-c425-7b93-dec29c07d310	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56b4-c420-77eb-51666ec62f14	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56b4-c425-5092-e769a76b60c9	000e0000-56b4-c425-db81-9ec0558bd60b	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56b4-c420-cfee-fc79045033aa	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 43859818)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56b4-c425-fd45-ad527a2b9080	000e0000-56b4-c425-7b93-dec29c07d310	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56b4-c421-4ca4-6d29307aafe6
000d0000-56b4-c425-eb07-86ec6fa2e4cb	000e0000-56b4-c425-95df-2dab11f4e8b6	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56b4-c421-9100-09bdb45c1d23
000d0000-56b4-c425-bf7e-5853f4273675	000e0000-56b4-c425-95df-2dab11f4e8b6	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56b4-c421-3cc5-33d1ac1db246
000d0000-56b4-c425-d536-ef5a88a09cf4	000e0000-56b4-c425-7b93-dec29c07d310	000c0000-56b4-c425-7e7a-a0d9392989d4	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56b4-c421-9100-09bdb45c1d23
000d0000-56b4-c425-efb5-3246e2a8cbb2	000e0000-56b4-c425-7b93-dec29c07d310	000c0000-56b4-c425-69ec-bb67243a0207	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56b4-c421-3cc5-33d1ac1db246
000d0000-56b4-c425-9ace-9797c0687076	000e0000-56b4-c425-7b93-dec29c07d310	000c0000-56b4-c425-9adc-873f872e76db	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56b4-c421-0618-77110b1ad1a8
000d0000-56b4-c425-f209-96e1a17ad0f2	000e0000-56b4-c425-7b93-dec29c07d310	000c0000-56b4-c425-01f4-547d55f76079	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56b4-c421-4ca4-6d29307aafe6
000d0000-56b4-c425-0ead-11b65c9ea862	000e0000-56b4-c425-7b93-dec29c07d310	000c0000-56b4-c425-131e-0fb1f7f57b4d	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56b4-c421-4ca4-6d29307aafe6
000d0000-56b4-c425-5f22-7f1439ed7e32	000e0000-56b4-c425-7b93-dec29c07d310	000c0000-56b4-c425-0c6e-bd02ed624724	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56b4-c421-9100-09bdb45c1d23
000d0000-56b4-c425-bcba-906dbcca3278	000e0000-56b4-c425-7b93-dec29c07d310	000c0000-56b4-c425-edc9-f27e5f416841	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56b4-c421-9100-09bdb45c1d23
000d0000-56b4-c425-834e-5b03707e2a1d	000e0000-56b4-c425-7b93-dec29c07d310	000c0000-56b4-c425-d4fe-5392dbeb3951	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56b4-c421-b4d3-854537ac643c
000d0000-56b4-c425-eea7-60e038c92f37	000e0000-56b4-c425-7b93-dec29c07d310	000c0000-56b4-c425-b7c0-886516db24ba	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56b4-c421-fce3-7329747d73a2
000d0000-56b4-c425-1c8c-2162976d8561	000e0000-56b4-c425-68a7-26b74c3b2696	000c0000-56b4-c425-88a0-9300862e204e	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56b4-c421-3cc5-33d1ac1db246
000d0000-56b4-c425-4403-f5715922d314	000e0000-56b4-c425-b068-a40f03eb30cb	000c0000-56b4-c425-c4df-e81477c5a0a6	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56b4-c421-3cc5-33d1ac1db246
000d0000-56b4-c425-9cc3-dcdaadcd7e16	000e0000-56b4-c425-b068-a40f03eb30cb	000c0000-56b4-c425-9463-6d5db7386ac2	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56b4-c421-3cc5-33d1ac1db246
000d0000-56b4-c425-03f5-a26673c26f71	000e0000-56b4-c425-cf21-1df8b6f2448c	000c0000-56b4-c425-ca96-572eb139d4e3	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56b4-c421-3cc5-33d1ac1db246
000d0000-56b4-c425-2790-eb6b486ded0b	000e0000-56b4-c425-0473-5d11086f1bcf	000c0000-56b4-c425-1d0e-c86800054b0f	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56b4-c421-3cc5-33d1ac1db246
000d0000-56b4-c425-a31f-a04874114aea	000e0000-56b4-c425-96ec-afca2a9e8ce7	000c0000-56b4-c425-584f-4d85900399a5	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56b4-c421-3cc5-33d1ac1db246
000d0000-56b4-c425-f780-c2802aca873c	000e0000-56b4-c425-09d8-dee880c9b302	000c0000-56b4-c425-7959-ca81920468c5	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56b4-c421-3cc5-33d1ac1db246
000d0000-56b4-c425-3af7-8326e327c237	000e0000-56b4-c425-0bc3-fa734eed61ab	000c0000-56b4-c425-94a4-78112a352402	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56b4-c421-3cc5-33d1ac1db246
000d0000-56b4-c425-76b6-33a7f870f7a1	000e0000-56b4-c425-5d17-c11e3576d199	000c0000-56b4-c425-cade-5c531579a450	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56b4-c421-3cc5-33d1ac1db246
000d0000-56b4-c425-84c3-24e5cd2cfeeb	000e0000-56b4-c425-5d17-c11e3576d199	000c0000-56b4-c425-e24a-82e4af1d7223	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56b4-c421-3cc5-33d1ac1db246
000d0000-56b4-c425-4829-b1ca57220b06	000e0000-56b4-c425-122b-682df5417695	000c0000-56b4-c425-2944-2ef4ad90af34	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56b4-c421-3cc5-33d1ac1db246
000d0000-56b4-c425-9063-e0e1c927b221	000e0000-56b4-c425-122b-682df5417695	000c0000-56b4-c425-65c1-1a59631a0e97	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56b4-c421-3cc5-33d1ac1db246
\.


--
-- TOC entry 3162 (class 0 OID 43859595)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
001c0000-56b4-c425-0730-7f9800d18cbe	00040000-56b4-c421-a7cf-b343263f5e93		\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 43859567)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 43859544)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56b4-c424-1628-d14c3a9c7dcc	00080000-56b4-c424-9247-60c26da2a265	00090000-56b4-c424-5e68-1cc2a371c74d	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 43859732)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 43860282)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56b4-c424-7fb6-5077a8cb5f1d	00010000-56b4-c422-29d9-da06879c1436	\N	Prva mapa	Root mapa	2016-02-05 16:47:48	2016-02-05 16:47:48	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 43860295)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 43860317)
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
-- TOC entry 3180 (class 0 OID 43859756)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 43859501)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56b4-c422-39e6-9ccae70fef78	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56b4-c422-20f6-0fc99366b534	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56b4-c422-271d-bac9aa5c893f	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56b4-c422-59ee-f656cb6907bb	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56b4-c422-837b-1d4a3420feaf	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56b4-c422-21b7-279bb7db7f09	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:7:"splosni";}s:4:"600s";a:2:{s:5:"label";s:17:"Tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56b4-c422-f15c-26e9d10e5691	dogodek.delte	array	a:14:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delGosZac";a:2:{s:5:"label";s:37:"Delta začetka pri dogodku gostovanje";s:5:"value";i:0;}s:9:"delGosKon";a:2:{s:5:"label";s:34:"Delta konca pri dogodku gostovanje";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56b4-c422-fb72-672474ce9bf0	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56b4-c422-5ffa-ee9fb5c6fc67	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56b4-c422-7019-3c40a5c955a9	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56b4-c422-5a48-0f1fd37c9934	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56b4-c422-078b-be71cd7ea940	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56b4-c422-7977-a1a0b5518472	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56b4-c422-b804-84bbe2d686f8	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56b4-c422-e93f-e82d2ec17c3e	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56b4-c422-88ae-253937af4c60	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56b4-c422-582d-2c2357c59e6c	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56b4-c424-0bff-e93ddca38ca8	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56b4-c424-ba52-05e63efaa1c7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56b4-c424-414e-cd6cf32e2aaf	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56b4-c424-f330-faa8e6f770d7	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56b4-c424-3a41-5adab7469ff2	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56b4-c424-5165-e35d37b236a0	tomaz.barva.ozadja	array	s:4:"siva";	t	f	f	\N	barva ozadja tomaž
00000000-56b4-c427-bed9-fc0fa669d246	application.tenant.maticnopodjetje	string	s:36:"00080000-56b4-c427-3aad-394501ef4e50";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 43859401)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56b4-c424-7212-10f1bb46ea65	00000000-56b4-c424-0bff-e93ddca38ca8	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56b4-c424-ea29-c0221ab83dbc	00000000-56b4-c424-0bff-e93ddca38ca8	00010000-56b4-c422-29d9-da06879c1436	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56b4-c424-20a1-e5546a091a24	00000000-56b4-c424-ba52-05e63efaa1c7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
00000000-56b4-c424-6196-26cb524bc541	00000000-56b4-c424-5165-e35d37b236a0	\N	s:6:"zelena";	t
00000000-56b4-c424-7a17-c816883b789d	00000000-56b4-c424-5165-e35d37b236a0	00010000-56b4-c422-29d9-da06879c1436	s:6:"rdeča";	f
\.


--
-- TOC entry 3151 (class 0 OID 43859468)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56b4-c424-880c-fa88e37036ce	\N	00100000-56b4-c424-3366-06ee3ca8bd10	00100000-56b4-c424-4676-35206d6371dd	01	Gledališče Nimbis
00410000-56b4-c424-d212-d0638ddd51a2	00410000-56b4-c424-880c-fa88e37036ce	00100000-56b4-c424-3366-06ee3ca8bd10	00100000-56b4-c424-4676-35206d6371dd	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 43859412)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56b4-c424-f9dd-ce73b3437a19	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56b4-c424-3c78-34efcb969189	00010000-56b4-c424-961a-cb79b57feb06	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56b4-c424-22ab-19eda40fe9f3	00010000-56b4-c424-feeb-3b8aa4d6a994	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56b4-c424-5127-6616c7b774b6	00010000-56b4-c424-1fea-52c66bfc501d	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56b4-c424-47cd-e2c8f91c62f9	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56b4-c424-d598-c50e26cfc0df	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56b4-c424-2981-2d98b395aed2	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56b4-c424-7e77-e6d1edf71e24	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56b4-c424-5e68-1cc2a371c74d	00010000-56b4-c424-69fd-0c1b7d6a5d9d	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56b4-c424-d316-95c173aa5215	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56b4-c424-f574-afa1d609e206	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56b4-c424-6ed7-a742044469e9	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56b4-c424-be28-056116acea87	00010000-56b4-c424-8fbb-a744e2ae69b7	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56b4-c424-ddc6-31242a042753	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56b4-c424-4351-a3ca65e99578	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56b4-c424-9187-6e1c9075cc5a	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56b4-c424-0c78-f80e82cc3716	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56b4-c424-60a9-a172faf4f4ae	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56b4-c424-441b-603da4767063	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56b4-c424-c3d3-2913a7cc2a41	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56b4-c424-c2af-66e577f4f2f9	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 43859346)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56b4-c421-b4ea-2bc0c2de0c5b	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56b4-c421-532d-9b6db98d63f1	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56b4-c421-7ac6-264d89c48e75	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56b4-c421-25bd-c72752ef4b55	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56b4-c421-e93a-56cbe77c81c8	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56b4-c421-78ca-7f30f6899367	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56b4-c421-4ee5-e77aa29e5842	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56b4-c421-3f61-f00eed40420e	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56b4-c421-820e-5b4ef04cf749	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56b4-c421-1713-1e9d1d3860c2	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56b4-c421-378b-7c9cf028758a	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56b4-c421-1477-416755764d9c	Abonma-read	Abonma - branje	t
00030000-56b4-c421-45c9-d6909609d459	Abonma-write	Abonma - spreminjanje	t
00030000-56b4-c421-b3f8-d4df52dadcf7	Alternacija-read	Alternacija - branje	t
00030000-56b4-c421-9226-d966b9e7c4ac	Alternacija-write	Alternacija - spreminjanje	t
00030000-56b4-c421-60c9-b85150804756	Arhivalija-read	Arhivalija - branje	t
00030000-56b4-c421-10cb-c1f5392ec1bf	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56b4-c421-18fd-c2e3004c4e04	AuthStorage-read	AuthStorage - branje	t
00030000-56b4-c421-142d-9e1622d9b5df	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56b4-c421-63d1-319e4c3b2bf6	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56b4-c421-5e9e-ada374a38ecf	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56b4-c421-2c0a-03f432657904	Besedilo-read	Besedilo - branje	t
00030000-56b4-c421-f215-4abb5eabcb56	Besedilo-write	Besedilo - spreminjanje	t
00030000-56b4-c421-6427-2fdc6b8f4823	Dodatek-read	Dodatek - branje	t
00030000-56b4-c421-87be-7c0bdf476e97	Dodatek-write	Dodatek - spreminjanje	t
00030000-56b4-c421-d3f4-4e1e5e5af0e1	Dogodek-read	Dogodek - branje	t
00030000-56b4-c421-6a5b-ef66f6f523af	Dogodek-write	Dogodek - spreminjanje	t
00030000-56b4-c421-6440-5f55325e6281	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56b4-c421-9e8a-cd4af3d7d1b6	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56b4-c421-98d7-9c7e9a518442	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56b4-c421-7505-964571eba028	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56b4-c421-2f53-08abc63af238	DogodekTrait-read	DogodekTrait - branje	t
00030000-56b4-c421-cc97-0dbc99ace898	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56b4-c421-4fac-cf317dc93338	DrugiVir-read	DrugiVir - branje	t
00030000-56b4-c421-3c2a-c09b950e69be	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56b4-c421-f589-035cc7501b3e	Drzava-read	Drzava - branje	t
00030000-56b4-c421-2c10-d27bb5a38309	Drzava-write	Drzava - spreminjanje	t
00030000-56b4-c421-6a98-8e0a289cf897	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56b4-c421-09ed-649efabe5e25	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56b4-c421-713b-60f369d037a0	Funkcija-read	Funkcija - branje	t
00030000-56b4-c421-6094-c6fcf98ca37e	Funkcija-write	Funkcija - spreminjanje	t
00030000-56b4-c421-7dd8-160f27ff1aba	Gostovanje-read	Gostovanje - branje	t
00030000-56b4-c421-5f6f-2604d029eadf	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56b4-c421-3a49-75d9d2dd7604	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56b4-c421-1706-ca097cba237f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56b4-c421-e26f-f194fa0e9880	Kupec-read	Kupec - branje	t
00030000-56b4-c421-a42b-5db434e66b02	Kupec-write	Kupec - spreminjanje	t
00030000-56b4-c421-9438-af3c3c498cc0	NacinPlacina-read	NacinPlacina - branje	t
00030000-56b4-c421-c15b-c80a1aad00b6	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56b4-c421-18c8-41ef0285ca49	Option-read	Option - branje	t
00030000-56b4-c421-9008-5ae7ceb4c279	Option-write	Option - spreminjanje	t
00030000-56b4-c421-5f08-db9399badbd4	OptionValue-read	OptionValue - branje	t
00030000-56b4-c421-ac93-737e611336fc	OptionValue-write	OptionValue - spreminjanje	t
00030000-56b4-c421-2dba-d63c813dd4a1	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56b4-c421-7f95-100c291968e3	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56b4-c421-4265-dd8ade69cf12	Oseba-read	Oseba - branje	t
00030000-56b4-c421-8870-8b0c29a86193	Oseba-write	Oseba - spreminjanje	t
00030000-56b4-c421-d4e7-6c56f0641a6d	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56b4-c421-2aad-7a7d2dcacb1c	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56b4-c421-5098-af2c16a706cb	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56b4-c421-e8bf-8cd991112479	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56b4-c421-8eea-58274329c098	Pogodba-read	Pogodba - branje	t
00030000-56b4-c421-02f7-7c3dae07ae5c	Pogodba-write	Pogodba - spreminjanje	t
00030000-56b4-c421-d1b4-022b85ebf8e7	Popa-read	Popa - branje	t
00030000-56b4-c421-a0a0-1fb3a57088ac	Popa-write	Popa - spreminjanje	t
00030000-56b4-c421-d514-e7705d6dfcfb	Posta-read	Posta - branje	t
00030000-56b4-c421-4b20-3050226e3685	Posta-write	Posta - spreminjanje	t
00030000-56b4-c421-3170-551c9a68046f	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56b4-c421-7d16-338ba0cb31b7	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56b4-c421-af61-c758ac36ae98	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56b4-c421-0806-594b2cfe499b	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56b4-c421-1891-7f8b43b09244	PostniNaslov-read	PostniNaslov - branje	t
00030000-56b4-c421-b9c6-deb210c3cd3a	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56b4-c421-0284-e1431220f90f	Praznik-read	Praznik - branje	t
00030000-56b4-c421-bc6f-ddf97b43c355	Praznik-write	Praznik - spreminjanje	t
00030000-56b4-c421-8d55-3cec12e73d52	Predstava-read	Predstava - branje	t
00030000-56b4-c421-2e7d-95b81d4fdcfd	Predstava-write	Predstava - spreminjanje	t
00030000-56b4-c421-54ce-5b97462fdb1a	Ura-read	Ura - branje	t
00030000-56b4-c421-60c7-c5914816c5e1	Ura-write	Ura - spreminjanje	t
00030000-56b4-c421-b62f-5b88312f9d24	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56b4-c421-32f0-a36e30965b0f	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56b4-c421-fbff-f713782dd7d9	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56b4-c421-1eb0-e8b39ee7edd5	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56b4-c421-9d15-defa2c0217d0	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56b4-c421-f5dd-0b1bf722999a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56b4-c421-9fea-32e007a84d5b	ProgramDela-read	ProgramDela - branje	t
00030000-56b4-c421-411a-7561cebe9533	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56b4-c421-df70-03759e8ad94a	ProgramFestival-read	ProgramFestival - branje	t
00030000-56b4-c421-3d87-d54da0d50ea7	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56b4-c421-c061-7e7dd9135c5b	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56b4-c421-dc7c-e278b93155ef	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56b4-c421-7d94-76da83cf9a37	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56b4-c421-46e2-402fa44fc673	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56b4-c421-87fd-f5a4a2a748e1	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56b4-c421-fe12-2ccf29229320	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56b4-c421-b909-ac0850281c92	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56b4-c421-e2af-ffddd138105a	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56b4-c421-d04b-f930cf2a1516	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56b4-c421-1592-efa7ca5a4058	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56b4-c421-29e7-d8c1e4627a3f	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56b4-c421-9f58-8c51b8f6ba82	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56b4-c421-6472-da9ac45be1f5	ProgramRazno-read	ProgramRazno - branje	t
00030000-56b4-c421-6613-6ff1a8f11742	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56b4-c421-8bb7-cae099866802	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56b4-c421-3cdc-f07fadcba4ee	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56b4-c421-82c9-482ae136d5ed	Prostor-read	Prostor - branje	t
00030000-56b4-c421-0070-95cd0ca8c66e	Prostor-write	Prostor - spreminjanje	t
00030000-56b4-c421-1c60-1bbbb8069a45	Racun-read	Racun - branje	t
00030000-56b4-c421-81e9-74f3ae3db83b	Racun-write	Racun - spreminjanje	t
00030000-56b4-c421-1377-61220c14d54c	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56b4-c421-179b-c581efff3525	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56b4-c421-fca5-0b0b7487fc8d	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56b4-c421-faf6-4b7460997dc2	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56b4-c421-4862-410a34986664	Rekvizit-read	Rekvizit - branje	t
00030000-56b4-c421-053b-2a711523c91c	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56b4-c421-f587-a8dad0c92297	Revizija-read	Revizija - branje	t
00030000-56b4-c421-214e-4b2298ab07ca	Revizija-write	Revizija - spreminjanje	t
00030000-56b4-c421-e92f-02fb4203033a	Rezervacija-read	Rezervacija - branje	t
00030000-56b4-c421-862f-1881eaae57e3	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56b4-c421-617e-94d10666d4c0	SedezniRed-read	SedezniRed - branje	t
00030000-56b4-c421-ed91-c7a9b2dba0fa	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56b4-c421-5ef7-8e0536846f4c	Sedez-read	Sedez - branje	t
00030000-56b4-c421-2751-cd29f65482de	Sedez-write	Sedez - spreminjanje	t
00030000-56b4-c421-9a42-fc156215dc53	Sezona-read	Sezona - branje	t
00030000-56b4-c421-e976-8395a36d31bc	Sezona-write	Sezona - spreminjanje	t
00030000-56b4-c421-393b-b6d24e86c5a1	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56b4-c421-3822-39cea1118971	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56b4-c421-6b9e-b337fc49dfa7	Telefonska-read	Telefonska - branje	t
00030000-56b4-c421-c3d3-7a8d9d001280	Telefonska-write	Telefonska - spreminjanje	t
00030000-56b4-c421-43a0-b00a651e2630	TerminStoritve-read	TerminStoritve - branje	t
00030000-56b4-c421-132f-cc478e7791b6	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56b4-c421-c0d7-2235cac5ddc0	TipDodatka-read	TipDodatka - branje	t
00030000-56b4-c421-ed24-9bbb95930bb3	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56b4-c421-543c-39679c9585a2	TipFunkcije-read	TipFunkcije - branje	t
00030000-56b4-c421-3659-7de5602c5ecb	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56b4-c421-69e8-ab6d0f3d5b06	TipPopa-read	TipPopa - branje	t
00030000-56b4-c421-45a7-cab6678d430b	TipPopa-write	TipPopa - spreminjanje	t
00030000-56b4-c421-aafe-151d5dbed18d	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56b4-c421-71a3-15a94c4c19b5	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56b4-c421-51ba-e90966fd1fd3	TipVaje-read	TipVaje - branje	t
00030000-56b4-c421-92a2-fb065b5bb04f	TipVaje-write	TipVaje - spreminjanje	t
00030000-56b4-c421-f219-2abb810d6094	Trr-read	Trr - branje	t
00030000-56b4-c421-3639-370cdc1ca701	Trr-write	Trr - spreminjanje	t
00030000-56b4-c421-1586-d9e92e83fbd9	Uprizoritev-read	Uprizoritev - branje	t
00030000-56b4-c421-6f12-f546dbce58f4	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56b4-c421-212f-d2f2cf28674b	Vaja-read	Vaja - branje	t
00030000-56b4-c421-a451-b70e6efd740c	Vaja-write	Vaja - spreminjanje	t
00030000-56b4-c421-e17d-f9c53c484aa5	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56b4-c421-702a-43bdbb234804	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56b4-c421-2399-0781130cc115	VrstaStroska-read	VrstaStroska - branje	t
00030000-56b4-c421-a83d-4f1d7e7fe57f	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56b4-c421-cbcd-cb85218b991f	Zaposlitev-read	Zaposlitev - branje	t
00030000-56b4-c421-6b27-aab6e6f36401	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56b4-c421-65e7-60c314ff9d3c	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56b4-c421-213b-bc932642781b	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56b4-c421-7bc5-ae5fe8078044	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56b4-c421-fe36-010872cef4f8	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56b4-c421-b390-3256601272ef	Job-read	Branje opravil - samo zase - branje	t
00030000-56b4-c421-211f-9c3e6e6521c3	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56b4-c421-55ab-16796f8423eb	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56b4-c421-7927-b070f221370c	Report-read	Report - branje	t
00030000-56b4-c421-d222-b103d2b2a64a	Report-write	Report - spreminjanje	t
00030000-56b4-c421-f42f-7812bc024616	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56b4-c421-9e77-528f4c774dba	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56b4-c421-bacc-abefe7087b79	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56b4-c421-b37c-c517d90fe657	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56b4-c421-c221-6045f9733144	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56b4-c421-6a5a-a62de1a6861e	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56b4-c421-764c-77d313cd9803	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56b4-c421-5012-17986f872188	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56b4-c421-bbdc-0f7ef5215ca8	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56b4-c421-6b68-113743a54e12	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56b4-c421-31d8-96e5d4063bf5	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56b4-c421-f5ed-a77069fe8328	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56b4-c421-5485-6b32b3ce8c08	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56b4-c421-9b01-1767fa6fdd11	Datoteka-write	Datoteka - spreminjanje	t
00030000-56b4-c421-8d47-3e1d0db8ebc9	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 43859365)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56b4-c421-1d78-0ffbcb490913	00030000-56b4-c421-532d-9b6db98d63f1
00020000-56b4-c421-1d78-0ffbcb490913	00030000-56b4-c421-b4ea-2bc0c2de0c5b
00020000-56b4-c421-2749-c4bc02d870db	00030000-56b4-c421-f589-035cc7501b3e
00020000-56b4-c421-ead6-99721e7ce749	00030000-56b4-c421-5e9e-ada374a38ecf
00020000-56b4-c421-ead6-99721e7ce749	00030000-56b4-c421-f215-4abb5eabcb56
00020000-56b4-c421-ead6-99721e7ce749	00030000-56b4-c421-9b01-1767fa6fdd11
00020000-56b4-c421-ead6-99721e7ce749	00030000-56b4-c421-8870-8b0c29a86193
00020000-56b4-c421-ead6-99721e7ce749	00030000-56b4-c421-5012-17986f872188
00020000-56b4-c421-ead6-99721e7ce749	00030000-56b4-c421-6b68-113743a54e12
00020000-56b4-c421-ead6-99721e7ce749	00030000-56b4-c421-63d1-319e4c3b2bf6
00020000-56b4-c421-ead6-99721e7ce749	00030000-56b4-c421-2c0a-03f432657904
00020000-56b4-c421-ead6-99721e7ce749	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c421-ead6-99721e7ce749	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c421-ead6-99721e7ce749	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c421-ead6-99721e7ce749	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c421-9e8d-e1e7382075cd	00030000-56b4-c421-63d1-319e4c3b2bf6
00020000-56b4-c421-9e8d-e1e7382075cd	00030000-56b4-c421-2c0a-03f432657904
00020000-56b4-c421-9e8d-e1e7382075cd	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c421-9e8d-e1e7382075cd	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c421-9e8d-e1e7382075cd	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c421-9e8d-e1e7382075cd	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c421-9552-e31c47af24ad	00030000-56b4-c421-cbcd-cb85218b991f
00020000-56b4-c421-9552-e31c47af24ad	00030000-56b4-c421-6b27-aab6e6f36401
00020000-56b4-c421-9552-e31c47af24ad	00030000-56b4-c421-78ca-7f30f6899367
00020000-56b4-c421-9552-e31c47af24ad	00030000-56b4-c421-e93a-56cbe77c81c8
00020000-56b4-c421-9552-e31c47af24ad	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c421-9552-e31c47af24ad	00030000-56b4-c421-8870-8b0c29a86193
00020000-56b4-c421-9552-e31c47af24ad	00030000-56b4-c421-2dba-d63c813dd4a1
00020000-56b4-c421-8faa-75ed51f52539	00030000-56b4-c421-cbcd-cb85218b991f
00020000-56b4-c421-8faa-75ed51f52539	00030000-56b4-c421-78ca-7f30f6899367
00020000-56b4-c421-8faa-75ed51f52539	00030000-56b4-c421-2dba-d63c813dd4a1
00020000-56b4-c421-7c4e-fde80eff048e	00030000-56b4-c421-8870-8b0c29a86193
00020000-56b4-c421-7c4e-fde80eff048e	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c421-7c4e-fde80eff048e	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c421-7c4e-fde80eff048e	00030000-56b4-c421-9b01-1767fa6fdd11
00020000-56b4-c421-7c4e-fde80eff048e	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c421-7c4e-fde80eff048e	00030000-56b4-c421-6b68-113743a54e12
00020000-56b4-c421-7c4e-fde80eff048e	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c421-7c4e-fde80eff048e	00030000-56b4-c421-5012-17986f872188
00020000-56b4-c421-7fe5-153e8731ae62	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c421-7fe5-153e8731ae62	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c421-7fe5-153e8731ae62	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c421-7fe5-153e8731ae62	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c421-4045-1a4f4a35af7e	00030000-56b4-c421-8870-8b0c29a86193
00020000-56b4-c421-4045-1a4f4a35af7e	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c421-4045-1a4f4a35af7e	00030000-56b4-c421-78ca-7f30f6899367
00020000-56b4-c421-4045-1a4f4a35af7e	00030000-56b4-c421-e93a-56cbe77c81c8
00020000-56b4-c421-4045-1a4f4a35af7e	00030000-56b4-c421-f219-2abb810d6094
00020000-56b4-c421-4045-1a4f4a35af7e	00030000-56b4-c421-3639-370cdc1ca701
00020000-56b4-c421-4045-1a4f4a35af7e	00030000-56b4-c421-1891-7f8b43b09244
00020000-56b4-c421-4045-1a4f4a35af7e	00030000-56b4-c421-b9c6-deb210c3cd3a
00020000-56b4-c421-4045-1a4f4a35af7e	00030000-56b4-c421-6b9e-b337fc49dfa7
00020000-56b4-c421-4045-1a4f4a35af7e	00030000-56b4-c421-c3d3-7a8d9d001280
00020000-56b4-c421-4045-1a4f4a35af7e	00030000-56b4-c421-f589-035cc7501b3e
00020000-56b4-c421-4045-1a4f4a35af7e	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c421-3883-a15219b38cf3	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c421-3883-a15219b38cf3	00030000-56b4-c421-78ca-7f30f6899367
00020000-56b4-c421-3883-a15219b38cf3	00030000-56b4-c421-f219-2abb810d6094
00020000-56b4-c421-3883-a15219b38cf3	00030000-56b4-c421-1891-7f8b43b09244
00020000-56b4-c421-3883-a15219b38cf3	00030000-56b4-c421-6b9e-b337fc49dfa7
00020000-56b4-c421-3883-a15219b38cf3	00030000-56b4-c421-f589-035cc7501b3e
00020000-56b4-c421-3883-a15219b38cf3	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-6b9e-b337fc49dfa7
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-1891-7f8b43b09244
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-f219-2abb810d6094
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-d1b4-022b85ebf8e7
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-3a49-75d9d2dd7604
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-9d15-defa2c0217d0
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-c3d3-7a8d9d001280
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-b9c6-deb210c3cd3a
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-5012-17986f872188
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-3639-370cdc1ca701
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-a0a0-1fb3a57088ac
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-9b01-1767fa6fdd11
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-6b68-113743a54e12
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-1706-ca097cba237f
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-f5dd-0b1bf722999a
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-f589-035cc7501b3e
00020000-56b4-c421-7b4b-2247a7594746	00030000-56b4-c421-69e8-ab6d0f3d5b06
00020000-56b4-c421-7fdf-44351a1ee6d5	00030000-56b4-c421-6b9e-b337fc49dfa7
00020000-56b4-c421-7fdf-44351a1ee6d5	00030000-56b4-c421-1891-7f8b43b09244
00020000-56b4-c421-7fdf-44351a1ee6d5	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c421-7fdf-44351a1ee6d5	00030000-56b4-c421-f219-2abb810d6094
00020000-56b4-c421-7fdf-44351a1ee6d5	00030000-56b4-c421-d1b4-022b85ebf8e7
00020000-56b4-c421-7fdf-44351a1ee6d5	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c421-7fdf-44351a1ee6d5	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c421-7fdf-44351a1ee6d5	00030000-56b4-c421-3a49-75d9d2dd7604
00020000-56b4-c421-7fdf-44351a1ee6d5	00030000-56b4-c421-9d15-defa2c0217d0
00020000-56b4-c421-7fdf-44351a1ee6d5	00030000-56b4-c421-f589-035cc7501b3e
00020000-56b4-c421-7fdf-44351a1ee6d5	00030000-56b4-c421-69e8-ab6d0f3d5b06
00020000-56b4-c421-4e37-b0fbd3a9b126	00030000-56b4-c421-69e8-ab6d0f3d5b06
00020000-56b4-c421-4e37-b0fbd3a9b126	00030000-56b4-c421-45a7-cab6678d430b
00020000-56b4-c421-3d9b-a254b9248d5a	00030000-56b4-c421-69e8-ab6d0f3d5b06
00020000-56b4-c421-ee03-bb3e5353230f	00030000-56b4-c421-d514-e7705d6dfcfb
00020000-56b4-c421-ee03-bb3e5353230f	00030000-56b4-c421-4b20-3050226e3685
00020000-56b4-c421-13f3-254be84e525b	00030000-56b4-c421-d514-e7705d6dfcfb
00020000-56b4-c421-e9df-700bba8fe007	00030000-56b4-c421-f589-035cc7501b3e
00020000-56b4-c421-e9df-700bba8fe007	00030000-56b4-c421-2c10-d27bb5a38309
00020000-56b4-c421-c2de-0e40348712d1	00030000-56b4-c421-f589-035cc7501b3e
00020000-56b4-c421-1462-f928fc935678	00030000-56b4-c421-7bc5-ae5fe8078044
00020000-56b4-c421-1462-f928fc935678	00030000-56b4-c421-fe36-010872cef4f8
00020000-56b4-c421-7d51-b3af4801e788	00030000-56b4-c421-7bc5-ae5fe8078044
00020000-56b4-c421-606c-f65cef11ceb5	00030000-56b4-c421-65e7-60c314ff9d3c
00020000-56b4-c421-606c-f65cef11ceb5	00030000-56b4-c421-213b-bc932642781b
00020000-56b4-c421-e356-abdaa32718d0	00030000-56b4-c421-65e7-60c314ff9d3c
00020000-56b4-c421-6de7-77b730829e29	00030000-56b4-c421-1477-416755764d9c
00020000-56b4-c421-6de7-77b730829e29	00030000-56b4-c421-45c9-d6909609d459
00020000-56b4-c421-ac84-5169bc13b002	00030000-56b4-c421-1477-416755764d9c
00020000-56b4-c421-3132-f9f88c9ed529	00030000-56b4-c421-82c9-482ae136d5ed
00020000-56b4-c421-3132-f9f88c9ed529	00030000-56b4-c421-0070-95cd0ca8c66e
00020000-56b4-c421-3132-f9f88c9ed529	00030000-56b4-c421-d1b4-022b85ebf8e7
00020000-56b4-c421-3132-f9f88c9ed529	00030000-56b4-c421-1891-7f8b43b09244
00020000-56b4-c421-3132-f9f88c9ed529	00030000-56b4-c421-b9c6-deb210c3cd3a
00020000-56b4-c421-3132-f9f88c9ed529	00030000-56b4-c421-f589-035cc7501b3e
00020000-56b4-c421-59fd-1302ff44b590	00030000-56b4-c421-82c9-482ae136d5ed
00020000-56b4-c421-59fd-1302ff44b590	00030000-56b4-c421-d1b4-022b85ebf8e7
00020000-56b4-c421-59fd-1302ff44b590	00030000-56b4-c421-1891-7f8b43b09244
00020000-56b4-c421-6639-20fd8cc37edc	00030000-56b4-c421-2399-0781130cc115
00020000-56b4-c421-6639-20fd8cc37edc	00030000-56b4-c421-a83d-4f1d7e7fe57f
00020000-56b4-c421-181e-10f80711a955	00030000-56b4-c421-2399-0781130cc115
00020000-56b4-c421-f9ac-f13dc5e2c27b	00030000-56b4-c421-7f95-100c291968e3
00020000-56b4-c421-f9ac-f13dc5e2c27b	00030000-56b4-c421-2dba-d63c813dd4a1
00020000-56b4-c421-f9ac-f13dc5e2c27b	00030000-56b4-c421-cbcd-cb85218b991f
00020000-56b4-c421-f9ac-f13dc5e2c27b	00030000-56b4-c421-9b01-1767fa6fdd11
00020000-56b4-c421-f9ac-f13dc5e2c27b	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c421-f9ac-f13dc5e2c27b	00030000-56b4-c421-5012-17986f872188
00020000-56b4-c421-f9ac-f13dc5e2c27b	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c421-f9ac-f13dc5e2c27b	00030000-56b4-c421-6b68-113743a54e12
00020000-56b4-c421-f9ac-f13dc5e2c27b	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c421-a3e1-7989ceb00e3c	00030000-56b4-c421-2dba-d63c813dd4a1
00020000-56b4-c421-a3e1-7989ceb00e3c	00030000-56b4-c421-cbcd-cb85218b991f
00020000-56b4-c421-a3e1-7989ceb00e3c	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c421-a3e1-7989ceb00e3c	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c421-a3e1-7989ceb00e3c	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c421-e1c3-f893eb4a8fff	00030000-56b4-c421-51ba-e90966fd1fd3
00020000-56b4-c421-e1c3-f893eb4a8fff	00030000-56b4-c421-92a2-fb065b5bb04f
00020000-56b4-c421-21ca-70c2810c7578	00030000-56b4-c421-51ba-e90966fd1fd3
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-4ee5-e77aa29e5842
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-3f61-f00eed40420e
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-9fea-32e007a84d5b
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-411a-7561cebe9533
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-df70-03759e8ad94a
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-3d87-d54da0d50ea7
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-c061-7e7dd9135c5b
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-dc7c-e278b93155ef
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-7d94-76da83cf9a37
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-46e2-402fa44fc673
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-87fd-f5a4a2a748e1
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-fe12-2ccf29229320
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-b909-ac0850281c92
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-e2af-ffddd138105a
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-d04b-f930cf2a1516
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-1592-efa7ca5a4058
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-29e7-d8c1e4627a3f
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-9f58-8c51b8f6ba82
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-6472-da9ac45be1f5
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-6613-6ff1a8f11742
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-8bb7-cae099866802
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-3cdc-f07fadcba4ee
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-1eb0-e8b39ee7edd5
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-3c2a-c09b950e69be
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-7d16-338ba0cb31b7
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-211f-9c3e6e6521c3
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-4fac-cf317dc93338
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-fbff-f713782dd7d9
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-9d15-defa2c0217d0
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-3170-551c9a68046f
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-2399-0781130cc115
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-1586-d9e92e83fbd9
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-393b-b6d24e86c5a1
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-713b-60f369d037a0
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-b3f8-d4df52dadcf7
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-543c-39679c9585a2
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-8eea-58274329c098
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-f589-035cc7501b3e
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-d1b4-022b85ebf8e7
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-9b01-1767fa6fdd11
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-5012-17986f872188
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-6b68-113743a54e12
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-b390-3256601272ef
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c421-ac5c-ec583ecea8b7	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c421-475f-bff56d143b39	00030000-56b4-c421-9fea-32e007a84d5b
00020000-56b4-c421-475f-bff56d143b39	00030000-56b4-c421-df70-03759e8ad94a
00020000-56b4-c421-475f-bff56d143b39	00030000-56b4-c421-c061-7e7dd9135c5b
00020000-56b4-c421-475f-bff56d143b39	00030000-56b4-c421-7d94-76da83cf9a37
00020000-56b4-c421-475f-bff56d143b39	00030000-56b4-c421-87fd-f5a4a2a748e1
00020000-56b4-c421-475f-bff56d143b39	00030000-56b4-c421-b909-ac0850281c92
00020000-56b4-c421-475f-bff56d143b39	00030000-56b4-c421-d04b-f930cf2a1516
00020000-56b4-c421-475f-bff56d143b39	00030000-56b4-c421-29e7-d8c1e4627a3f
00020000-56b4-c421-475f-bff56d143b39	00030000-56b4-c421-6472-da9ac45be1f5
00020000-56b4-c421-475f-bff56d143b39	00030000-56b4-c421-8bb7-cae099866802
00020000-56b4-c421-475f-bff56d143b39	00030000-56b4-c421-fbff-f713782dd7d9
00020000-56b4-c421-475f-bff56d143b39	00030000-56b4-c421-4fac-cf317dc93338
00020000-56b4-c421-475f-bff56d143b39	00030000-56b4-c421-3170-551c9a68046f
00020000-56b4-c421-475f-bff56d143b39	00030000-56b4-c421-f589-035cc7501b3e
00020000-56b4-c421-475f-bff56d143b39	00030000-56b4-c421-b390-3256601272ef
00020000-56b4-c421-475f-bff56d143b39	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c421-475f-bff56d143b39	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c421-475f-bff56d143b39	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c421-d1e5-d98058c16d40	00030000-56b4-c421-1586-d9e92e83fbd9
00020000-56b4-c421-d1e5-d98058c16d40	00030000-56b4-c421-6f12-f546dbce58f4
00020000-56b4-c421-d1e5-d98058c16d40	00030000-56b4-c421-b3f8-d4df52dadcf7
00020000-56b4-c421-d1e5-d98058c16d40	00030000-56b4-c421-9226-d966b9e7c4ac
00020000-56b4-c421-d1e5-d98058c16d40	00030000-56b4-c421-820e-5b4ef04cf749
00020000-56b4-c421-d1e5-d98058c16d40	00030000-56b4-c421-2c0a-03f432657904
00020000-56b4-c421-d1e5-d98058c16d40	00030000-56b4-c421-713b-60f369d037a0
00020000-56b4-c421-d1e5-d98058c16d40	00030000-56b4-c421-6094-c6fcf98ca37e
00020000-56b4-c421-d1e5-d98058c16d40	00030000-56b4-c421-1713-1e9d1d3860c2
00020000-56b4-c421-d1e5-d98058c16d40	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c421-d1e5-d98058c16d40	00030000-56b4-c421-9d15-defa2c0217d0
00020000-56b4-c421-d1e5-d98058c16d40	00030000-56b4-c421-543c-39679c9585a2
00020000-56b4-c421-d1e5-d98058c16d40	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c421-d1e5-d98058c16d40	00030000-56b4-c421-9b01-1767fa6fdd11
00020000-56b4-c421-d1e5-d98058c16d40	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c421-d1e5-d98058c16d40	00030000-56b4-c421-5012-17986f872188
00020000-56b4-c421-d1e5-d98058c16d40	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c421-d1e5-d98058c16d40	00030000-56b4-c421-6b68-113743a54e12
00020000-56b4-c421-6d89-b6f6e482d700	00030000-56b4-c421-1586-d9e92e83fbd9
00020000-56b4-c421-6d89-b6f6e482d700	00030000-56b4-c421-b3f8-d4df52dadcf7
00020000-56b4-c421-6d89-b6f6e482d700	00030000-56b4-c421-2c0a-03f432657904
00020000-56b4-c421-6d89-b6f6e482d700	00030000-56b4-c421-713b-60f369d037a0
00020000-56b4-c421-6d89-b6f6e482d700	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c421-6d89-b6f6e482d700	00030000-56b4-c421-9d15-defa2c0217d0
00020000-56b4-c421-6d89-b6f6e482d700	00030000-56b4-c421-543c-39679c9585a2
00020000-56b4-c421-6d89-b6f6e482d700	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c421-6d89-b6f6e482d700	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c421-6d89-b6f6e482d700	00030000-56b4-c421-5012-17986f872188
00020000-56b4-c421-6d89-b6f6e482d700	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c421-822f-fd3014be2260	00030000-56b4-c421-b3f8-d4df52dadcf7
00020000-56b4-c421-822f-fd3014be2260	00030000-56b4-c421-9226-d966b9e7c4ac
00020000-56b4-c421-822f-fd3014be2260	00030000-56b4-c421-713b-60f369d037a0
00020000-56b4-c421-822f-fd3014be2260	00030000-56b4-c421-6094-c6fcf98ca37e
00020000-56b4-c421-822f-fd3014be2260	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c421-822f-fd3014be2260	00030000-56b4-c421-543c-39679c9585a2
00020000-56b4-c421-822f-fd3014be2260	00030000-56b4-c421-1586-d9e92e83fbd9
00020000-56b4-c421-822f-fd3014be2260	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c421-8086-0a7e1111012c	00030000-56b4-c421-b3f8-d4df52dadcf7
00020000-56b4-c421-8086-0a7e1111012c	00030000-56b4-c421-9226-d966b9e7c4ac
00020000-56b4-c421-8086-0a7e1111012c	00030000-56b4-c421-820e-5b4ef04cf749
00020000-56b4-c421-8086-0a7e1111012c	00030000-56b4-c421-713b-60f369d037a0
00020000-56b4-c421-8086-0a7e1111012c	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c421-8086-0a7e1111012c	00030000-56b4-c421-78ca-7f30f6899367
00020000-56b4-c421-8086-0a7e1111012c	00030000-56b4-c421-e93a-56cbe77c81c8
00020000-56b4-c421-8086-0a7e1111012c	00030000-56b4-c421-8eea-58274329c098
00020000-56b4-c421-8086-0a7e1111012c	00030000-56b4-c421-02f7-7c3dae07ae5c
00020000-56b4-c421-8086-0a7e1111012c	00030000-56b4-c421-d1b4-022b85ebf8e7
00020000-56b4-c421-8086-0a7e1111012c	00030000-56b4-c421-9d15-defa2c0217d0
00020000-56b4-c421-8086-0a7e1111012c	00030000-56b4-c421-393b-b6d24e86c5a1
00020000-56b4-c421-8086-0a7e1111012c	00030000-56b4-c421-3822-39cea1118971
00020000-56b4-c421-8086-0a7e1111012c	00030000-56b4-c421-543c-39679c9585a2
00020000-56b4-c421-8086-0a7e1111012c	00030000-56b4-c421-f219-2abb810d6094
00020000-56b4-c421-8086-0a7e1111012c	00030000-56b4-c421-1586-d9e92e83fbd9
00020000-56b4-c421-8086-0a7e1111012c	00030000-56b4-c421-cbcd-cb85218b991f
00020000-56b4-c421-bd89-89543a68be8e	00030000-56b4-c421-b3f8-d4df52dadcf7
00020000-56b4-c421-bd89-89543a68be8e	00030000-56b4-c421-713b-60f369d037a0
00020000-56b4-c421-bd89-89543a68be8e	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c421-bd89-89543a68be8e	00030000-56b4-c421-78ca-7f30f6899367
00020000-56b4-c421-bd89-89543a68be8e	00030000-56b4-c421-8eea-58274329c098
00020000-56b4-c421-bd89-89543a68be8e	00030000-56b4-c421-d1b4-022b85ebf8e7
00020000-56b4-c421-bd89-89543a68be8e	00030000-56b4-c421-9d15-defa2c0217d0
00020000-56b4-c421-bd89-89543a68be8e	00030000-56b4-c421-393b-b6d24e86c5a1
00020000-56b4-c421-bd89-89543a68be8e	00030000-56b4-c421-543c-39679c9585a2
00020000-56b4-c421-bd89-89543a68be8e	00030000-56b4-c421-f219-2abb810d6094
00020000-56b4-c421-bd89-89543a68be8e	00030000-56b4-c421-1586-d9e92e83fbd9
00020000-56b4-c421-bd89-89543a68be8e	00030000-56b4-c421-cbcd-cb85218b991f
00020000-56b4-c421-2962-7884065a9e2e	00030000-56b4-c421-393b-b6d24e86c5a1
00020000-56b4-c421-2962-7884065a9e2e	00030000-56b4-c421-1586-d9e92e83fbd9
00020000-56b4-c421-2962-7884065a9e2e	00030000-56b4-c421-713b-60f369d037a0
00020000-56b4-c421-2962-7884065a9e2e	00030000-56b4-c421-8eea-58274329c098
00020000-56b4-c421-2962-7884065a9e2e	00030000-56b4-c421-9d15-defa2c0217d0
00020000-56b4-c421-2962-7884065a9e2e	00030000-56b4-c421-543c-39679c9585a2
00020000-56b4-c421-2962-7884065a9e2e	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c421-51a2-d6d82ae2e3ad	00030000-56b4-c421-393b-b6d24e86c5a1
00020000-56b4-c421-51a2-d6d82ae2e3ad	00030000-56b4-c421-3822-39cea1118971
00020000-56b4-c421-51a2-d6d82ae2e3ad	00030000-56b4-c421-1586-d9e92e83fbd9
00020000-56b4-c421-51a2-d6d82ae2e3ad	00030000-56b4-c421-d1b4-022b85ebf8e7
00020000-56b4-c421-4baa-ff50b7da2eb7	00030000-56b4-c421-393b-b6d24e86c5a1
00020000-56b4-c421-4baa-ff50b7da2eb7	00030000-56b4-c421-1586-d9e92e83fbd9
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-1477-416755764d9c
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-b3f8-d4df52dadcf7
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-9226-d966b9e7c4ac
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-820e-5b4ef04cf749
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-63d1-319e4c3b2bf6
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-5e9e-ada374a38ecf
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-2c0a-03f432657904
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-f215-4abb5eabcb56
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-9b01-1767fa6fdd11
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-4fac-cf317dc93338
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-3c2a-c09b950e69be
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-f589-035cc7501b3e
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-713b-60f369d037a0
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-6094-c6fcf98ca37e
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-1713-1e9d1d3860c2
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-b390-3256601272ef
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-211f-9c3e6e6521c3
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-3a49-75d9d2dd7604
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-2dba-d63c813dd4a1
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-8870-8b0c29a86193
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-78ca-7f30f6899367
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-e93a-56cbe77c81c8
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-8eea-58274329c098
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-02f7-7c3dae07ae5c
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-d1b4-022b85ebf8e7
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-d514-e7705d6dfcfb
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-3170-551c9a68046f
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-7d16-338ba0cb31b7
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-1891-7f8b43b09244
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-fbff-f713782dd7d9
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-1eb0-e8b39ee7edd5
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-9d15-defa2c0217d0
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-4ee5-e77aa29e5842
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-9fea-32e007a84d5b
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-3f61-f00eed40420e
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-411a-7561cebe9533
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-df70-03759e8ad94a
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-3d87-d54da0d50ea7
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-c061-7e7dd9135c5b
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-dc7c-e278b93155ef
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-7d94-76da83cf9a37
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-46e2-402fa44fc673
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-87fd-f5a4a2a748e1
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-fe12-2ccf29229320
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-b909-ac0850281c92
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-e2af-ffddd138105a
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-d04b-f930cf2a1516
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-1592-efa7ca5a4058
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-29e7-d8c1e4627a3f
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-9f58-8c51b8f6ba82
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-6472-da9ac45be1f5
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-6613-6ff1a8f11742
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-8bb7-cae099866802
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-3cdc-f07fadcba4ee
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-82c9-482ae136d5ed
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-393b-b6d24e86c5a1
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-3822-39cea1118971
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-6b9e-b337fc49dfa7
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-543c-39679c9585a2
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-69e8-ab6d0f3d5b06
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-51ba-e90966fd1fd3
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-f219-2abb810d6094
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-1586-d9e92e83fbd9
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-6f12-f546dbce58f4
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-2399-0781130cc115
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-6b68-113743a54e12
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-5012-17986f872188
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-cbcd-cb85218b991f
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-65e7-60c314ff9d3c
00020000-56b4-c421-66c0-c70336dfc744	00030000-56b4-c421-7bc5-ae5fe8078044
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-1477-416755764d9c
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-b3f8-d4df52dadcf7
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-63d1-319e4c3b2bf6
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-5e9e-ada374a38ecf
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-2c0a-03f432657904
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-f215-4abb5eabcb56
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-9b01-1767fa6fdd11
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-f589-035cc7501b3e
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-713b-60f369d037a0
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-3a49-75d9d2dd7604
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-2dba-d63c813dd4a1
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-8870-8b0c29a86193
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-78ca-7f30f6899367
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-d1b4-022b85ebf8e7
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-d514-e7705d6dfcfb
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-1891-7f8b43b09244
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-9d15-defa2c0217d0
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-82c9-482ae136d5ed
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-6b9e-b337fc49dfa7
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-543c-39679c9585a2
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-69e8-ab6d0f3d5b06
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-51ba-e90966fd1fd3
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-f219-2abb810d6094
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-1586-d9e92e83fbd9
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-2399-0781130cc115
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-6b68-113743a54e12
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-5012-17986f872188
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-cbcd-cb85218b991f
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-65e7-60c314ff9d3c
00020000-56b4-c421-e34d-be93136cbf26	00030000-56b4-c421-7bc5-ae5fe8078044
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-1477-416755764d9c
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-b3f8-d4df52dadcf7
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-9226-d966b9e7c4ac
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-820e-5b4ef04cf749
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-63d1-319e4c3b2bf6
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-5e9e-ada374a38ecf
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-2c0a-03f432657904
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-f215-4abb5eabcb56
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-9b01-1767fa6fdd11
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-f589-035cc7501b3e
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-713b-60f369d037a0
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-6094-c6fcf98ca37e
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-1713-1e9d1d3860c2
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-3a49-75d9d2dd7604
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-2dba-d63c813dd4a1
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-8870-8b0c29a86193
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-78ca-7f30f6899367
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-d1b4-022b85ebf8e7
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-d514-e7705d6dfcfb
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-1891-7f8b43b09244
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-9d15-defa2c0217d0
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-82c9-482ae136d5ed
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-6b9e-b337fc49dfa7
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-543c-39679c9585a2
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-69e8-ab6d0f3d5b06
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-51ba-e90966fd1fd3
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-f219-2abb810d6094
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-1586-d9e92e83fbd9
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-6f12-f546dbce58f4
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-2399-0781130cc115
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-6b68-113743a54e12
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-5012-17986f872188
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-cbcd-cb85218b991f
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-65e7-60c314ff9d3c
00020000-56b4-c421-6690-48ca2a9cad08	00030000-56b4-c421-7bc5-ae5fe8078044
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-b3f8-d4df52dadcf7
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-9226-d966b9e7c4ac
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-820e-5b4ef04cf749
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-63d1-319e4c3b2bf6
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-5e9e-ada374a38ecf
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-2c0a-03f432657904
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-f215-4abb5eabcb56
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-9b01-1767fa6fdd11
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-4fac-cf317dc93338
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-3c2a-c09b950e69be
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-f589-035cc7501b3e
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-713b-60f369d037a0
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-6094-c6fcf98ca37e
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-1713-1e9d1d3860c2
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-b390-3256601272ef
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-211f-9c3e6e6521c3
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-3a49-75d9d2dd7604
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-1706-ca097cba237f
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-2dba-d63c813dd4a1
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-8870-8b0c29a86193
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-78ca-7f30f6899367
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-e93a-56cbe77c81c8
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-8eea-58274329c098
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-02f7-7c3dae07ae5c
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-d1b4-022b85ebf8e7
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-a0a0-1fb3a57088ac
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-d514-e7705d6dfcfb
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-3170-551c9a68046f
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-7d16-338ba0cb31b7
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-1891-7f8b43b09244
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-b9c6-deb210c3cd3a
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-fbff-f713782dd7d9
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-1eb0-e8b39ee7edd5
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-9d15-defa2c0217d0
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-f5dd-0b1bf722999a
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-4ee5-e77aa29e5842
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-9fea-32e007a84d5b
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-3f61-f00eed40420e
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-411a-7561cebe9533
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-df70-03759e8ad94a
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-3d87-d54da0d50ea7
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-c061-7e7dd9135c5b
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-dc7c-e278b93155ef
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-7d94-76da83cf9a37
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-46e2-402fa44fc673
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-87fd-f5a4a2a748e1
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-fe12-2ccf29229320
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-b909-ac0850281c92
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-e2af-ffddd138105a
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-d04b-f930cf2a1516
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-1592-efa7ca5a4058
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-29e7-d8c1e4627a3f
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-9f58-8c51b8f6ba82
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-6472-da9ac45be1f5
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-6613-6ff1a8f11742
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-8bb7-cae099866802
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-3cdc-f07fadcba4ee
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-82c9-482ae136d5ed
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-393b-b6d24e86c5a1
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-3822-39cea1118971
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-6b9e-b337fc49dfa7
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-c3d3-7a8d9d001280
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-543c-39679c9585a2
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-69e8-ab6d0f3d5b06
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-f219-2abb810d6094
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-3639-370cdc1ca701
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-1586-d9e92e83fbd9
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-6f12-f546dbce58f4
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-2399-0781130cc115
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-6b68-113743a54e12
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-5012-17986f872188
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-cbcd-cb85218b991f
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-6b27-aab6e6f36401
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-65e7-60c314ff9d3c
00020000-56b4-c422-696b-c79e4f852642	00030000-56b4-c421-7bc5-ae5fe8078044
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-1477-416755764d9c
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-b3f8-d4df52dadcf7
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-9226-d966b9e7c4ac
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-820e-5b4ef04cf749
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-63d1-319e4c3b2bf6
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-5e9e-ada374a38ecf
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-2c0a-03f432657904
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-f215-4abb5eabcb56
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-9b01-1767fa6fdd11
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-f589-035cc7501b3e
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-713b-60f369d037a0
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-6094-c6fcf98ca37e
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-1713-1e9d1d3860c2
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-3a49-75d9d2dd7604
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-1706-ca097cba237f
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-2dba-d63c813dd4a1
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-8870-8b0c29a86193
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-78ca-7f30f6899367
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-e93a-56cbe77c81c8
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-8eea-58274329c098
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-d1b4-022b85ebf8e7
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-a0a0-1fb3a57088ac
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-d514-e7705d6dfcfb
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-1891-7f8b43b09244
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-b9c6-deb210c3cd3a
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-9d15-defa2c0217d0
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-f5dd-0b1bf722999a
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-82c9-482ae136d5ed
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-393b-b6d24e86c5a1
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-6b9e-b337fc49dfa7
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-c3d3-7a8d9d001280
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-543c-39679c9585a2
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-69e8-ab6d0f3d5b06
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-51ba-e90966fd1fd3
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-f219-2abb810d6094
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-3639-370cdc1ca701
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-1586-d9e92e83fbd9
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-6f12-f546dbce58f4
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-2399-0781130cc115
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-6b68-113743a54e12
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-5012-17986f872188
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-cbcd-cb85218b991f
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-6b27-aab6e6f36401
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-65e7-60c314ff9d3c
00020000-56b4-c422-ce58-02dc67db904f	00030000-56b4-c421-7bc5-ae5fe8078044
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-1477-416755764d9c
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-b3f8-d4df52dadcf7
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-9226-d966b9e7c4ac
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-63d1-319e4c3b2bf6
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-2c0a-03f432657904
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-f589-035cc7501b3e
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-713b-60f369d037a0
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-6094-c6fcf98ca37e
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-3a49-75d9d2dd7604
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-2dba-d63c813dd4a1
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-78ca-7f30f6899367
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-8eea-58274329c098
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-d1b4-022b85ebf8e7
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-d514-e7705d6dfcfb
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-1891-7f8b43b09244
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-9d15-defa2c0217d0
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-82c9-482ae136d5ed
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-393b-b6d24e86c5a1
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-6b9e-b337fc49dfa7
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-543c-39679c9585a2
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-69e8-ab6d0f3d5b06
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-51ba-e90966fd1fd3
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-f219-2abb810d6094
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-1586-d9e92e83fbd9
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-2399-0781130cc115
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-cbcd-cb85218b991f
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-65e7-60c314ff9d3c
00020000-56b4-c422-5f62-3f3d3acec181	00030000-56b4-c421-7bc5-ae5fe8078044
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-1477-416755764d9c
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-b3f8-d4df52dadcf7
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-9226-d966b9e7c4ac
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-820e-5b4ef04cf749
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-2c0a-03f432657904
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-9b01-1767fa6fdd11
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-4fac-cf317dc93338
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-3c2a-c09b950e69be
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-f589-035cc7501b3e
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-713b-60f369d037a0
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-b390-3256601272ef
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-211f-9c3e6e6521c3
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-3a49-75d9d2dd7604
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-1706-ca097cba237f
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-2dba-d63c813dd4a1
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-7f95-100c291968e3
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-8870-8b0c29a86193
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-78ca-7f30f6899367
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-e93a-56cbe77c81c8
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-8eea-58274329c098
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-02f7-7c3dae07ae5c
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-d1b4-022b85ebf8e7
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-a0a0-1fb3a57088ac
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-d514-e7705d6dfcfb
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-3170-551c9a68046f
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-7d16-338ba0cb31b7
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-1891-7f8b43b09244
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-b9c6-deb210c3cd3a
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-fbff-f713782dd7d9
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-1eb0-e8b39ee7edd5
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-9d15-defa2c0217d0
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-f5dd-0b1bf722999a
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-4ee5-e77aa29e5842
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-9fea-32e007a84d5b
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-3f61-f00eed40420e
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-411a-7561cebe9533
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-df70-03759e8ad94a
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-3d87-d54da0d50ea7
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-c061-7e7dd9135c5b
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-dc7c-e278b93155ef
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-7d94-76da83cf9a37
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-46e2-402fa44fc673
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-87fd-f5a4a2a748e1
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-fe12-2ccf29229320
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-b909-ac0850281c92
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-e2af-ffddd138105a
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-d04b-f930cf2a1516
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-1592-efa7ca5a4058
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-29e7-d8c1e4627a3f
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-9f58-8c51b8f6ba82
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-6472-da9ac45be1f5
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-6613-6ff1a8f11742
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-8bb7-cae099866802
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-3cdc-f07fadcba4ee
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-82c9-482ae136d5ed
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-393b-b6d24e86c5a1
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-3822-39cea1118971
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-6b9e-b337fc49dfa7
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-c3d3-7a8d9d001280
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-543c-39679c9585a2
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-69e8-ab6d0f3d5b06
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-51ba-e90966fd1fd3
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-f219-2abb810d6094
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-3639-370cdc1ca701
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-1586-d9e92e83fbd9
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-2399-0781130cc115
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-a83d-4f1d7e7fe57f
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-6b68-113743a54e12
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-5012-17986f872188
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-cbcd-cb85218b991f
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-6b27-aab6e6f36401
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-65e7-60c314ff9d3c
00020000-56b4-c422-c708-4a79be2adb06	00030000-56b4-c421-7bc5-ae5fe8078044
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-b4ea-2bc0c2de0c5b
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-532d-9b6db98d63f1
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-1477-416755764d9c
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-45c9-d6909609d459
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-b3f8-d4df52dadcf7
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-820e-5b4ef04cf749
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-9226-d966b9e7c4ac
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-60c9-b85150804756
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-10cb-c1f5392ec1bf
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-18fd-c2e3004c4e04
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-142d-9e1622d9b5df
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-63d1-319e4c3b2bf6
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-5e9e-ada374a38ecf
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-2c0a-03f432657904
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-f215-4abb5eabcb56
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-9b01-1767fa6fdd11
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-d3f4-4e1e5e5af0e1
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-25bd-c72752ef4b55
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-6440-5f55325e6281
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-9e8a-cd4af3d7d1b6
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-98d7-9c7e9a518442
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-7505-964571eba028
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-2f53-08abc63af238
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-cc97-0dbc99ace898
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-6a5b-ef66f6f523af
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-4fac-cf317dc93338
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-3c2a-c09b950e69be
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-f589-035cc7501b3e
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-2c10-d27bb5a38309
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-6a98-8e0a289cf897
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-09ed-649efabe5e25
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-713b-60f369d037a0
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-1713-1e9d1d3860c2
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-6094-c6fcf98ca37e
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-7dd8-160f27ff1aba
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-5f6f-2604d029eadf
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-55ab-16796f8423eb
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-b390-3256601272ef
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-211f-9c3e6e6521c3
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-3a49-75d9d2dd7604
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-1706-ca097cba237f
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-e26f-f194fa0e9880
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-a42b-5db434e66b02
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-764c-77d313cd9803
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-6a5a-a62de1a6861e
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-9e77-528f4c774dba
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-bacc-abefe7087b79
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-b37c-c517d90fe657
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-c221-6045f9733144
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-9438-af3c3c498cc0
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-c15b-c80a1aad00b6
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-18c8-41ef0285ca49
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-5f08-db9399badbd4
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-ac93-737e611336fc
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-378b-7c9cf028758a
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-9008-5ae7ceb4c279
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-2dba-d63c813dd4a1
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-7f95-100c291968e3
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-8870-8b0c29a86193
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-78ca-7f30f6899367
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-e93a-56cbe77c81c8
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-d4e7-6c56f0641a6d
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-2aad-7a7d2dcacb1c
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-5098-af2c16a706cb
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-e8bf-8cd991112479
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-8eea-58274329c098
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-02f7-7c3dae07ae5c
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-d1b4-022b85ebf8e7
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-a0a0-1fb3a57088ac
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-d514-e7705d6dfcfb
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-3170-551c9a68046f
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-7d16-338ba0cb31b7
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-af61-c758ac36ae98
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-0806-594b2cfe499b
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-4b20-3050226e3685
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-1891-7f8b43b09244
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-b9c6-deb210c3cd3a
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-0284-e1431220f90f
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-bc6f-ddf97b43c355
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-8d55-3cec12e73d52
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-2e7d-95b81d4fdcfd
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-b62f-5b88312f9d24
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-32f0-a36e30965b0f
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-fbff-f713782dd7d9
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-1eb0-e8b39ee7edd5
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-9d15-defa2c0217d0
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-f5dd-0b1bf722999a
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-4ee5-e77aa29e5842
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-9fea-32e007a84d5b
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-3f61-f00eed40420e
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-411a-7561cebe9533
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-df70-03759e8ad94a
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-3d87-d54da0d50ea7
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-c061-7e7dd9135c5b
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-dc7c-e278b93155ef
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-7d94-76da83cf9a37
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-46e2-402fa44fc673
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-87fd-f5a4a2a748e1
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-fe12-2ccf29229320
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-b909-ac0850281c92
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-e2af-ffddd138105a
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-d04b-f930cf2a1516
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-1592-efa7ca5a4058
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-29e7-d8c1e4627a3f
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-9f58-8c51b8f6ba82
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-6472-da9ac45be1f5
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-6613-6ff1a8f11742
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-8bb7-cae099866802
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-3cdc-f07fadcba4ee
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-82c9-482ae136d5ed
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-0070-95cd0ca8c66e
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-1c60-1bbbb8069a45
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-81e9-74f3ae3db83b
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-1377-61220c14d54c
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-179b-c581efff3525
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-fca5-0b0b7487fc8d
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-faf6-4b7460997dc2
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-4862-410a34986664
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-053b-2a711523c91c
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-7927-b070f221370c
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-d222-b103d2b2a64a
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-f587-a8dad0c92297
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-214e-4b2298ab07ca
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-e92f-02fb4203033a
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-862f-1881eaae57e3
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-617e-94d10666d4c0
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-ed91-c7a9b2dba0fa
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-5ef7-8e0536846f4c
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-2751-cd29f65482de
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-9a42-fc156215dc53
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-e976-8395a36d31bc
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-f42f-7812bc024616
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-393b-b6d24e86c5a1
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-3822-39cea1118971
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-6b9e-b337fc49dfa7
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-c3d3-7a8d9d001280
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-43a0-b00a651e2630
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-7ac6-264d89c48e75
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-132f-cc478e7791b6
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-543c-39679c9585a2
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-3659-7de5602c5ecb
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-69e8-ab6d0f3d5b06
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-45a7-cab6678d430b
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-aafe-151d5dbed18d
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-71a3-15a94c4c19b5
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-51ba-e90966fd1fd3
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-92a2-fb065b5bb04f
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-f219-2abb810d6094
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-3639-370cdc1ca701
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-1586-d9e92e83fbd9
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-6f12-f546dbce58f4
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-212f-d2f2cf28674b
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-a451-b70e6efd740c
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-e17d-f9c53c484aa5
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-702a-43bdbb234804
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-2399-0781130cc115
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-a83d-4f1d7e7fe57f
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-5485-6b32b3ce8c08
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-f5ed-a77069fe8328
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-6b68-113743a54e12
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-5012-17986f872188
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-cbcd-cb85218b991f
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-6b27-aab6e6f36401
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-65e7-60c314ff9d3c
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-213b-bc932642781b
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-7bc5-ae5fe8078044
00020000-56b4-c424-3216-005fff8d6b79	00030000-56b4-c421-fe36-010872cef4f8
00020000-56b4-c424-c60e-0188d00e91f1	00030000-56b4-c421-31d8-96e5d4063bf5
00020000-56b4-c424-cbd2-e9549fbcfd06	00030000-56b4-c421-6b68-113743a54e12
00020000-56b4-c424-7ad4-014780cde17e	00030000-56b4-c421-6f12-f546dbce58f4
00020000-56b4-c424-5fef-604b1d07200e	00030000-56b4-c421-1586-d9e92e83fbd9
00020000-56b4-c424-43b4-28ff774a1c9d	00030000-56b4-c421-bacc-abefe7087b79
00020000-56b4-c424-f7d1-b965e709be1f	00030000-56b4-c421-b37c-c517d90fe657
00020000-56b4-c424-a50c-36954866dd0b	00030000-56b4-c421-c221-6045f9733144
00020000-56b4-c424-d845-204ba3d09a56	00030000-56b4-c421-9e77-528f4c774dba
00020000-56b4-c424-86cf-7b19a9338cc8	00030000-56b4-c421-764c-77d313cd9803
00020000-56b4-c424-8e4d-7f4c0721e619	00030000-56b4-c421-6a5a-a62de1a6861e
00020000-56b4-c424-0dcc-398c845ab53b	00030000-56b4-c421-bbdc-0f7ef5215ca8
00020000-56b4-c424-c9ba-387172360d14	00030000-56b4-c421-5012-17986f872188
00020000-56b4-c424-a4f9-2d26ffe9df74	00030000-56b4-c421-4265-dd8ade69cf12
00020000-56b4-c424-5ec4-a516c682ab9e	00030000-56b4-c421-8870-8b0c29a86193
00020000-56b4-c424-84f8-daeb493809da	00030000-56b4-c421-e93a-56cbe77c81c8
00020000-56b4-c424-1b55-b12f767da7da	00030000-56b4-c421-78ca-7f30f6899367
00020000-56b4-c424-3ed6-789c33a95418	00030000-56b4-c421-9b01-1767fa6fdd11
00020000-56b4-c424-47da-f99e52da2090	00030000-56b4-c421-8d47-3e1d0db8ebc9
00020000-56b4-c424-2f56-92b4ec459f60	00030000-56b4-c421-d1b4-022b85ebf8e7
00020000-56b4-c424-2f56-92b4ec459f60	00030000-56b4-c421-a0a0-1fb3a57088ac
00020000-56b4-c424-2f56-92b4ec459f60	00030000-56b4-c421-1586-d9e92e83fbd9
00020000-56b4-c424-9736-f779c18b8087	00030000-56b4-c421-f219-2abb810d6094
00020000-56b4-c424-c5ce-d6821b07e818	00030000-56b4-c421-3639-370cdc1ca701
00020000-56b4-c424-b857-4f5d635dd41e	00030000-56b4-c421-f42f-7812bc024616
00020000-56b4-c424-0b38-6c8235025ecc	00030000-56b4-c421-6b9e-b337fc49dfa7
00020000-56b4-c424-7339-c60b8282f221	00030000-56b4-c421-c3d3-7a8d9d001280
00020000-56b4-c424-ecca-677fa3a7a1fd	00030000-56b4-c421-1891-7f8b43b09244
00020000-56b4-c424-1d76-27b17f80be26	00030000-56b4-c421-b9c6-deb210c3cd3a
00020000-56b4-c424-e4dd-eb109c94b8d8	00030000-56b4-c421-cbcd-cb85218b991f
00020000-56b4-c424-018a-67cdf79c4db2	00030000-56b4-c421-6b27-aab6e6f36401
00020000-56b4-c424-956f-34b06283f448	00030000-56b4-c421-8eea-58274329c098
00020000-56b4-c424-0286-144b2888cb9a	00030000-56b4-c421-02f7-7c3dae07ae5c
00020000-56b4-c424-e090-fbad2ca04a4d	00030000-56b4-c421-393b-b6d24e86c5a1
00020000-56b4-c424-f07f-10b580c76cae	00030000-56b4-c421-3822-39cea1118971
00020000-56b4-c424-472c-a38b934d4f8a	00030000-56b4-c421-b3f8-d4df52dadcf7
00020000-56b4-c424-3b6d-5875c26c1a44	00030000-56b4-c421-9226-d966b9e7c4ac
00020000-56b4-c424-1e29-43d149e50e75	00030000-56b4-c421-820e-5b4ef04cf749
00020000-56b4-c424-aaeb-b11ce6ef02cd	00030000-56b4-c421-713b-60f369d037a0
00020000-56b4-c424-dce8-1ff22bac483d	00030000-56b4-c421-6094-c6fcf98ca37e
00020000-56b4-c424-11dc-ccd7e455ad5b	00030000-56b4-c421-1713-1e9d1d3860c2
\.


--
-- TOC entry 3181 (class 0 OID 43859763)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 43859798)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 43859931)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56b4-c424-b3d3-c981938e5e49	00090000-56b4-c424-f9dd-ce73b3437a19	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56b4-c424-4d26-6de9ee5fb258	00090000-56b4-c424-d598-c50e26cfc0df	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56b4-c424-29b0-7b59de913a07	00090000-56b4-c424-be28-056116acea87	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56b4-c424-470e-bfb80fb7b1f7	00090000-56b4-c424-d316-95c173aa5215	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 43859448)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56b4-c424-9247-60c26da2a265	\N	00040000-56b4-c421-d6cf-926f0dfa0736	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b4-c424-00c0-bc7f8dd1a8f7	\N	00040000-56b4-c421-d6cf-926f0dfa0736	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56b4-c424-3325-274f00aca894	\N	00040000-56b4-c421-d6cf-926f0dfa0736	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b4-c424-aee4-2dd56265c602	\N	00040000-56b4-c421-d6cf-926f0dfa0736	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b4-c424-d860-80bbb197d95b	\N	00040000-56b4-c421-d6cf-926f0dfa0736	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b4-c424-2e6d-57e93cbba5b2	\N	00040000-56b4-c421-0818-e1d9be0788b6	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b4-c424-3edc-0754626a96f5	\N	00040000-56b4-c421-5739-5aeb8476b168	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b4-c424-687b-bf6b6e39e41e	\N	00040000-56b4-c421-af7d-30776e0d921b	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b4-c424-7e63-ac405ab1f33b	\N	00040000-56b4-c421-6ddf-0ab0a88f16ca	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b4-c427-3aad-394501ef4e50	\N	00040000-56b4-c421-d6cf-926f0dfa0736	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 43859493)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56b4-c420-afc8-92ab64181247	8341	Adlešiči
00050000-56b4-c420-c0a4-3ee99e712181	5270	Ajdovščina
00050000-56b4-c420-eda6-e2e0bde69848	6280	Ankaran/Ancarano
00050000-56b4-c420-a671-10ecc59d2775	9253	Apače
00050000-56b4-c420-fc68-7e5904781e37	8253	Artiče
00050000-56b4-c420-01c9-4b6f91b9eba8	4275	Begunje na Gorenjskem
00050000-56b4-c420-e44c-26f3528239fb	1382	Begunje pri Cerknici
00050000-56b4-c420-e70f-89281082f685	9231	Beltinci
00050000-56b4-c420-16dc-790a43fd8e9c	2234	Benedikt
00050000-56b4-c420-5315-3412177bdd6c	2345	Bistrica ob Dravi
00050000-56b4-c420-3312-77fe5529b75a	3256	Bistrica ob Sotli
00050000-56b4-c420-a0d8-06faeb783671	8259	Bizeljsko
00050000-56b4-c420-6742-76b9df1fffa2	1223	Blagovica
00050000-56b4-c420-6ffd-a02e502cfc34	8283	Blanca
00050000-56b4-c420-e162-f339bdd9d9a6	4260	Bled
00050000-56b4-c420-29f0-0813362720e6	4273	Blejska Dobrava
00050000-56b4-c420-41ed-4c0a3b8c55da	9265	Bodonci
00050000-56b4-c420-aa7a-c6fdbde4f8cc	9222	Bogojina
00050000-56b4-c420-6709-3e2f198249cc	4263	Bohinjska Bela
00050000-56b4-c420-9cf3-38f46ef5bc3b	4264	Bohinjska Bistrica
00050000-56b4-c420-bf4c-0b07f8405316	4265	Bohinjsko jezero
00050000-56b4-c420-bf39-414e1d0562ab	1353	Borovnica
00050000-56b4-c420-adfa-aca890127e2c	8294	Boštanj
00050000-56b4-c420-4076-e4963dc67fa3	5230	Bovec
00050000-56b4-c420-7bed-cd7a4ff9c72f	5295	Branik
00050000-56b4-c420-630e-4ed2a6d3ad88	3314	Braslovče
00050000-56b4-c420-b1d7-d230a62f047c	5223	Breginj
00050000-56b4-c420-1d40-be2d6e31181d	8280	Brestanica
00050000-56b4-c420-d931-fdb6f0124d48	2354	Bresternica
00050000-56b4-c420-5f34-150bd3fd7cf7	4243	Brezje
00050000-56b4-c420-5ebf-b95ae3f7211b	1351	Brezovica pri Ljubljani
00050000-56b4-c420-86f6-932e94b6caab	8250	Brežice
00050000-56b4-c420-684b-7517ac1ec307	4210	Brnik - Aerodrom
00050000-56b4-c420-f3ac-29366a45b4a5	8321	Brusnice
00050000-56b4-c420-2041-e607b915feef	3255	Buče
00050000-56b4-c420-a611-7bf0ac6ef030	8276	Bučka 
00050000-56b4-c420-2f9d-4a7d661ea558	9261	Cankova
00050000-56b4-c420-8d39-6d8efae3a567	3000	Celje 
00050000-56b4-c420-1e6a-3c26a4d9539f	3001	Celje - poštni predali
00050000-56b4-c420-de94-fac633e2cae0	4207	Cerklje na Gorenjskem
00050000-56b4-c420-5339-4138890f6d16	8263	Cerklje ob Krki
00050000-56b4-c420-e13c-20631bfcf2d2	1380	Cerknica
00050000-56b4-c420-05d6-fb9314acb592	5282	Cerkno
00050000-56b4-c420-b2a1-f9e5b777b386	2236	Cerkvenjak
00050000-56b4-c420-0532-89d6bbb097de	2215	Ceršak
00050000-56b4-c420-7af1-706c036bf02d	2326	Cirkovce
00050000-56b4-c420-f0bd-531e4b4593de	2282	Cirkulane
00050000-56b4-c420-4d8a-d04d4a850aee	5273	Col
00050000-56b4-c420-9ab9-717fa3741795	8251	Čatež ob Savi
00050000-56b4-c420-9eff-9f1c497e54d1	1413	Čemšenik
00050000-56b4-c420-6977-d7580f8f5c02	5253	Čepovan
00050000-56b4-c420-9163-f4a328890af5	9232	Črenšovci
00050000-56b4-c420-fed3-db4adfe8ac06	2393	Črna na Koroškem
00050000-56b4-c420-b8a8-b62d7cb5e755	6275	Črni Kal
00050000-56b4-c420-4415-e800bd96fca2	5274	Črni Vrh nad Idrijo
00050000-56b4-c420-7c0b-57310a754ab3	5262	Črniče
00050000-56b4-c420-256d-8ec25ea54fe3	8340	Črnomelj
00050000-56b4-c420-19e3-a247c2feeaed	6271	Dekani
00050000-56b4-c420-11d2-147d347b0c39	5210	Deskle
00050000-56b4-c420-0a8f-5f4edd9e85b6	2253	Destrnik
00050000-56b4-c420-0aca-610a98495a83	6215	Divača
00050000-56b4-c420-5534-8849b56a6883	1233	Dob
00050000-56b4-c420-346b-e655299f47c7	3224	Dobje pri Planini
00050000-56b4-c420-87cd-8aca8d468fe5	8257	Dobova
00050000-56b4-c420-172f-ad3084cf5fcf	1423	Dobovec
00050000-56b4-c420-1183-666f4be0cc3a	5263	Dobravlje
00050000-56b4-c420-c750-800fd90992e5	3204	Dobrna
00050000-56b4-c420-aed2-9018927ff2fc	8211	Dobrnič
00050000-56b4-c420-1082-0ea7889e5148	1356	Dobrova
00050000-56b4-c420-f489-87a37b2138e4	9223	Dobrovnik/Dobronak 
00050000-56b4-c420-ff68-07ced29038a3	5212	Dobrovo v Brdih
00050000-56b4-c420-bf5e-89b19806c5e5	1431	Dol pri Hrastniku
00050000-56b4-c420-c82c-2c95625ef61d	1262	Dol pri Ljubljani
00050000-56b4-c420-3e05-830b654da457	1273	Dole pri Litiji
00050000-56b4-c420-1eb1-751d546a4cf2	1331	Dolenja vas
00050000-56b4-c420-1ebe-492e8555b364	8350	Dolenjske Toplice
00050000-56b4-c420-1436-2be1c07b77ee	1230	Domžale
00050000-56b4-c420-5a30-c090ad4afeb9	2252	Dornava
00050000-56b4-c420-1f10-17fc17e9dca4	5294	Dornberk
00050000-56b4-c420-74f9-90fb47b31f15	1319	Draga
00050000-56b4-c420-0bc9-ad7ed004611d	8343	Dragatuš
00050000-56b4-c420-91c1-911dbab0dc97	3222	Dramlje
00050000-56b4-c420-4a96-307e14c066fc	2370	Dravograd
00050000-56b4-c420-d921-3d8b5e48fb12	4203	Duplje
00050000-56b4-c420-5030-5bc176b72815	6221	Dutovlje
00050000-56b4-c420-4ed6-2c5ca6b44d5c	8361	Dvor
00050000-56b4-c420-4c24-7691857c0b3d	2343	Fala
00050000-56b4-c420-54c1-4879442ba8ae	9208	Fokovci
00050000-56b4-c420-9fa1-b00f7208b45d	2313	Fram
00050000-56b4-c420-f06d-8e3c1e2a0bcb	3213	Frankolovo
00050000-56b4-c420-be58-32247fd5dcd4	1274	Gabrovka
00050000-56b4-c420-b0be-615074e11dd5	8254	Globoko
00050000-56b4-c420-baa1-8ab5639f354f	5275	Godovič
00050000-56b4-c420-c5d5-67f303fccdfe	4204	Golnik
00050000-56b4-c420-ca4a-1f54bf25b03c	3303	Gomilsko
00050000-56b4-c420-4326-612282ca884c	4224	Gorenja vas
00050000-56b4-c420-d506-e323f85dfb93	3263	Gorica pri Slivnici
00050000-56b4-c420-2037-724cd0c8d796	2272	Gorišnica
00050000-56b4-c420-3092-d035b341a995	9250	Gornja Radgona
00050000-56b4-c420-e5ca-f5c8c3d1bdd7	3342	Gornji Grad
00050000-56b4-c420-65d0-a59775a92c24	4282	Gozd Martuljek
00050000-56b4-c420-e9a1-fdc667b6a1a8	6272	Gračišče
00050000-56b4-c420-bfe3-e06631abaabe	9264	Grad
00050000-56b4-c420-f0ff-3542f336ffb0	8332	Gradac
00050000-56b4-c420-564c-4547b979a611	1384	Grahovo
00050000-56b4-c420-d86d-a703a9e52c86	5242	Grahovo ob Bači
00050000-56b4-c420-e47d-fe82c1fe5ba9	5251	Grgar
00050000-56b4-c420-dea4-0f51edfd0c60	3302	Griže
00050000-56b4-c420-60b3-87094a42054e	3231	Grobelno
00050000-56b4-c420-d574-a17229a729a6	1290	Grosuplje
00050000-56b4-c420-eba2-e26c3fa128d6	2288	Hajdina
00050000-56b4-c420-d7c6-e4185b6c6f96	8362	Hinje
00050000-56b4-c420-ffe1-bc07f0ca1e76	2311	Hoče
00050000-56b4-c420-00dc-05bedfc97444	9205	Hodoš/Hodos
00050000-56b4-c420-9a65-bbf4e1f1e5bd	1354	Horjul
00050000-56b4-c420-d53a-de20737cb582	1372	Hotedršica
00050000-56b4-c420-3071-fe79f905cb22	1430	Hrastnik
00050000-56b4-c420-4f9d-78641c95fff0	6225	Hruševje
00050000-56b4-c420-0e44-8e87e5adfdb5	4276	Hrušica
00050000-56b4-c420-2a3e-0807831d229d	5280	Idrija
00050000-56b4-c420-d485-b31ca58239a4	1292	Ig
00050000-56b4-c420-bec9-4d56faf63a94	6250	Ilirska Bistrica
00050000-56b4-c420-f8f1-ce2e7b7faf43	6251	Ilirska Bistrica-Trnovo
00050000-56b4-c420-4181-5a544b931f1e	1295	Ivančna Gorica
00050000-56b4-c420-f955-d45c207b2bdc	2259	Ivanjkovci
00050000-56b4-c420-62f4-699f60cee546	1411	Izlake
00050000-56b4-c420-bec5-b3ff9d062d8c	6310	Izola/Isola
00050000-56b4-c420-d669-9eae4677de56	2222	Jakobski Dol
00050000-56b4-c420-b56b-87c5eb470957	2221	Jarenina
00050000-56b4-c420-ca35-e7b837a7f569	6254	Jelšane
00050000-56b4-c420-ebe9-800e97caab5e	4270	Jesenice
00050000-56b4-c420-200e-02420014ad18	8261	Jesenice na Dolenjskem
00050000-56b4-c420-e687-0876d2102fb5	3273	Jurklošter
00050000-56b4-c420-f810-ec12e523e466	2223	Jurovski Dol
00050000-56b4-c420-d131-61681be4ad9b	2256	Juršinci
00050000-56b4-c420-45b4-05d8c95bb68b	5214	Kal nad Kanalom
00050000-56b4-c420-ff8b-6d8d3e718e16	3233	Kalobje
00050000-56b4-c420-58a7-b41f795663dd	4246	Kamna Gorica
00050000-56b4-c420-f01c-5b3287d17694	2351	Kamnica
00050000-56b4-c420-8d0d-0aa69e9b081f	1241	Kamnik
00050000-56b4-c420-9b3f-091303e06587	5213	Kanal
00050000-56b4-c420-4e32-fb1c27c8f854	8258	Kapele
00050000-56b4-c420-cf86-38679313ee8d	2362	Kapla
00050000-56b4-c420-67c6-c391658481ed	2325	Kidričevo
00050000-56b4-c420-839c-3218a420a611	1412	Kisovec
00050000-56b4-c420-0658-d22d63a71c54	6253	Knežak
00050000-56b4-c420-c96a-cd55ca1eaee1	5222	Kobarid
00050000-56b4-c420-ddc2-1d9f25b3e037	9227	Kobilje
00050000-56b4-c420-3110-47eca3bd068a	1330	Kočevje
00050000-56b4-c420-f58f-e28f6c970558	1338	Kočevska Reka
00050000-56b4-c420-4b80-5d310c9e8044	2276	Kog
00050000-56b4-c420-9753-d897bb7501fe	5211	Kojsko
00050000-56b4-c420-8140-f58e30842295	6223	Komen
00050000-56b4-c420-42cf-1ba9f8915b3c	1218	Komenda
00050000-56b4-c420-f67d-90c73509f799	6000	Koper/Capodistria 
00050000-56b4-c420-7a49-f37a3ac4d9b7	6001	Koper/Capodistria - poštni predali
00050000-56b4-c420-2098-9d03ddec8e17	8282	Koprivnica
00050000-56b4-c420-ef6d-bb1aca264110	5296	Kostanjevica na Krasu
00050000-56b4-c420-a752-74cba31bbc63	8311	Kostanjevica na Krki
00050000-56b4-c420-0095-c5d33adf1c1d	1336	Kostel
00050000-56b4-c420-1bf6-621dfe0ab267	6256	Košana
00050000-56b4-c420-9762-87306c8fb838	2394	Kotlje
00050000-56b4-c420-47e3-e482e73fe979	6240	Kozina
00050000-56b4-c420-cd0e-610a9461e08d	3260	Kozje
00050000-56b4-c420-2ce4-cb8a7dd9b204	4000	Kranj 
00050000-56b4-c420-4e0f-6afcc29d782f	4001	Kranj - poštni predali
00050000-56b4-c420-9ade-8c32b9114061	4280	Kranjska Gora
00050000-56b4-c420-e087-76b69b830a69	1281	Kresnice
00050000-56b4-c420-7dbf-cceebbecbbe0	4294	Križe
00050000-56b4-c420-9b03-4868f08d0d03	9206	Križevci
00050000-56b4-c420-e32d-51110c43898d	9242	Križevci pri Ljutomeru
00050000-56b4-c420-feb2-16997366cf19	1301	Krka
00050000-56b4-c420-521a-6f0de2ae141b	8296	Krmelj
00050000-56b4-c420-934e-8717c0898e61	4245	Kropa
00050000-56b4-c420-67b0-6c8a27b251a9	8262	Krška vas
00050000-56b4-c420-cffb-6cc98f672253	8270	Krško
00050000-56b4-c420-e172-355d45651f9f	9263	Kuzma
00050000-56b4-c420-292a-447266ffd1df	2318	Laporje
00050000-56b4-c420-3083-4195e32ed44c	3270	Laško
00050000-56b4-c420-f568-ce051de54f85	1219	Laze v Tuhinju
00050000-56b4-c420-abda-d06b9fd158ed	2230	Lenart v Slovenskih goricah
00050000-56b4-c420-7d3e-eaeaf80164ef	9220	Lendava/Lendva
00050000-56b4-c420-1500-fd72518b5a10	4248	Lesce
00050000-56b4-c420-aeb8-2c1108fda5ae	3261	Lesično
00050000-56b4-c420-d5c1-fdf6bebc6501	8273	Leskovec pri Krškem
00050000-56b4-c420-e7be-44c2c1731c2f	2372	Libeliče
00050000-56b4-c420-21d5-a33e87040947	2341	Limbuš
00050000-56b4-c420-ca8b-e76f6cf252e6	1270	Litija
00050000-56b4-c420-b671-30924e7f2753	3202	Ljubečna
00050000-56b4-c420-343d-30713b2a16fc	1000	Ljubljana 
00050000-56b4-c420-7dff-00323c94c76b	1001	Ljubljana - poštni predali
00050000-56b4-c420-cccf-d9bd47c2a155	1231	Ljubljana - Črnuče
00050000-56b4-c420-18eb-b7a22cf08440	1261	Ljubljana - Dobrunje
00050000-56b4-c420-f7cd-970f1270f031	1260	Ljubljana - Polje
00050000-56b4-c420-f833-7856815a5e02	1210	Ljubljana - Šentvid
00050000-56b4-c420-b22b-6d68d64cfac5	1211	Ljubljana - Šmartno
00050000-56b4-c420-aecd-7190d674fa7d	3333	Ljubno ob Savinji
00050000-56b4-c420-1635-d4b282a63541	9240	Ljutomer
00050000-56b4-c420-ca4b-1bdf1755f414	3215	Loče
00050000-56b4-c420-082e-495c75529076	5231	Log pod Mangartom
00050000-56b4-c420-932e-69e29ec73d7d	1358	Log pri Brezovici
00050000-56b4-c420-d882-1ff19afb4019	1370	Logatec
00050000-56b4-c420-8da7-d1bceaaef2c0	1371	Logatec
00050000-56b4-c420-8a44-5734109a4732	1434	Loka pri Zidanem Mostu
00050000-56b4-c420-7115-f20515dc1190	3223	Loka pri Žusmu
00050000-56b4-c420-bc46-521ac8eea37a	6219	Lokev
00050000-56b4-c420-4434-d5d86d22de0a	1318	Loški Potok
00050000-56b4-c420-23a1-64737b2326b7	2324	Lovrenc na Dravskem polju
00050000-56b4-c420-cd5c-58bdd3d60881	2344	Lovrenc na Pohorju
00050000-56b4-c420-c2cb-eb1080322126	3334	Luče
00050000-56b4-c420-3997-0234764e6dc0	1225	Lukovica
00050000-56b4-c420-db34-daf7bb8159d5	9202	Mačkovci
00050000-56b4-c420-c25b-5d89d8adb926	2322	Majšperk
00050000-56b4-c420-6b16-ac8b1a7f6d1a	2321	Makole
00050000-56b4-c420-8631-c33d27a7601a	9243	Mala Nedelja
00050000-56b4-c420-69db-f326c3285a31	2229	Malečnik
00050000-56b4-c420-3c2a-d1093cbd5a85	6273	Marezige
00050000-56b4-c420-fced-b7b46781bf18	2000	Maribor 
00050000-56b4-c420-28a7-eecc0a3735ba	2001	Maribor - poštni predali
00050000-56b4-c420-fa77-e63b4ad3cd2c	2206	Marjeta na Dravskem polju
00050000-56b4-c420-f93b-9dc6ba77e8c9	2281	Markovci
00050000-56b4-c420-d879-f3e2ff47d5e8	9221	Martjanci
00050000-56b4-c420-2aa5-20954992cb2c	6242	Materija
00050000-56b4-c420-1db0-2146db8b6200	4211	Mavčiče
00050000-56b4-c420-f63c-5772fae61de2	1215	Medvode
00050000-56b4-c420-47ab-292d0417c6a8	1234	Mengeš
00050000-56b4-c420-c2c3-7f866fc93b3c	8330	Metlika
00050000-56b4-c420-c6e4-5f250d4e09dc	2392	Mežica
00050000-56b4-c420-e4c0-b641ce347df5	2204	Miklavž na Dravskem polju
00050000-56b4-c420-2cb4-70d5c631fa08	2275	Miklavž pri Ormožu
00050000-56b4-c420-58f1-26e5e2a493e1	5291	Miren
00050000-56b4-c420-5888-92449287d93e	8233	Mirna
00050000-56b4-c420-5780-6755b170c52d	8216	Mirna Peč
00050000-56b4-c420-a797-3b9131a2a3e0	2382	Mislinja
00050000-56b4-c420-222d-ec0a0ec3d024	4281	Mojstrana
00050000-56b4-c420-e55c-7c3d0a126e83	8230	Mokronog
00050000-56b4-c420-cbdb-4f7e392a1982	1251	Moravče
00050000-56b4-c420-f66c-1a1dd28a4792	9226	Moravske Toplice
00050000-56b4-c420-7807-673ac43e8c06	5216	Most na Soči
00050000-56b4-c420-9bb3-dfea84cc0a02	1221	Motnik
00050000-56b4-c420-789a-2c8aa1371051	3330	Mozirje
00050000-56b4-c420-9107-a5173227b0aa	9000	Murska Sobota 
00050000-56b4-c420-d63a-cc6174616a59	9001	Murska Sobota - poštni predali
00050000-56b4-c420-1d1d-d9d2f5ae4739	2366	Muta
00050000-56b4-c420-ff74-fae054790cbb	4202	Naklo
00050000-56b4-c420-5b3f-9caca69da1a8	3331	Nazarje
00050000-56b4-c420-b7ab-1b92f04611b1	1357	Notranje Gorice
00050000-56b4-c420-75c9-954888f191d7	3203	Nova Cerkev
00050000-56b4-c420-f272-be536aa7adab	5000	Nova Gorica 
00050000-56b4-c420-1599-dbd51212dd88	5001	Nova Gorica - poštni predali
00050000-56b4-c420-6b3d-e782df35979b	1385	Nova vas
00050000-56b4-c420-558f-eff8767a1dad	8000	Novo mesto
00050000-56b4-c420-2792-3d9b465fdf33	8001	Novo mesto - poštni predali
00050000-56b4-c420-d69c-e8994ff002fe	6243	Obrov
00050000-56b4-c420-4717-c08c0b5a1fd9	9233	Odranci
00050000-56b4-c420-80e9-e4f001eaa39b	2317	Oplotnica
00050000-56b4-c420-1d55-4b20271aa005	2312	Orehova vas
00050000-56b4-c420-e5e2-e59a812c25f8	2270	Ormož
00050000-56b4-c420-39e1-5b54bf7acfae	1316	Ortnek
00050000-56b4-c420-6f4f-c03e31dd846b	1337	Osilnica
00050000-56b4-c420-939c-fd35499434db	8222	Otočec
00050000-56b4-c420-ed8b-b98c4b27f3d0	2361	Ožbalt
00050000-56b4-c420-b1d3-170ce5bb4f3f	2231	Pernica
00050000-56b4-c420-2fd1-8d437c6a24ae	2211	Pesnica pri Mariboru
00050000-56b4-c420-38bf-b866f02cc056	9203	Petrovci
00050000-56b4-c420-25eb-639116fd1da3	3301	Petrovče
00050000-56b4-c420-16ea-05fe6b6701eb	6330	Piran/Pirano
00050000-56b4-c420-4095-ddabc98c24cb	8255	Pišece
00050000-56b4-c420-7ab9-74061070edbd	6257	Pivka
00050000-56b4-c420-1a9f-f213220e5688	6232	Planina
00050000-56b4-c420-1eec-fae261776877	3225	Planina pri Sevnici
00050000-56b4-c420-fc8f-f5193b1e4645	6276	Pobegi
00050000-56b4-c420-6334-3b25fdf604f5	8312	Podbočje
00050000-56b4-c420-534a-85ea454a2fc3	5243	Podbrdo
00050000-56b4-c420-8b7c-9ec5cf7798cb	3254	Podčetrtek
00050000-56b4-c420-28db-0cc3c1e7031c	2273	Podgorci
00050000-56b4-c420-4a84-46c61b3ea885	6216	Podgorje
00050000-56b4-c420-0e88-af63c41516e2	2381	Podgorje pri Slovenj Gradcu
00050000-56b4-c420-8c47-fc142240c377	6244	Podgrad
00050000-56b4-c420-0f5c-485caf13531e	1414	Podkum
00050000-56b4-c420-2743-fbe79ab80cb3	2286	Podlehnik
00050000-56b4-c420-6ebf-9a660e3d5efe	5272	Podnanos
00050000-56b4-c420-c1e5-56593667cb8e	4244	Podnart
00050000-56b4-c420-34c0-710fa8ec56d4	3241	Podplat
00050000-56b4-c420-b83f-939d8e170509	3257	Podsreda
00050000-56b4-c420-fbb7-ecbfb795fb00	2363	Podvelka
00050000-56b4-c420-fae2-3ba0918bfde9	2208	Pohorje
00050000-56b4-c420-c8c1-53526df2e455	2257	Polenšak
00050000-56b4-c420-0e03-ee8b415d6ab2	1355	Polhov Gradec
00050000-56b4-c420-3ea2-604fe22dba87	4223	Poljane nad Škofjo Loko
00050000-56b4-c420-d048-0a558ff01f7e	2319	Poljčane
00050000-56b4-c420-2957-d3a0f45c4889	1272	Polšnik
00050000-56b4-c420-e2f6-96192a28a5cd	3313	Polzela
00050000-56b4-c420-b052-f49b06a8dfe7	3232	Ponikva
00050000-56b4-c420-a1d1-db7e46b7bd75	6320	Portorož/Portorose
00050000-56b4-c420-9da2-50e4bde3110e	6230	Postojna
00050000-56b4-c420-c492-8ff7f7707478	2331	Pragersko
00050000-56b4-c420-4f14-8e7da0bae283	3312	Prebold
00050000-56b4-c420-f4ce-320246b318ca	4205	Preddvor
00050000-56b4-c420-81e7-08d05240736e	6255	Prem
00050000-56b4-c420-ef1e-afef33527264	1352	Preserje
00050000-56b4-c420-4ab2-f1ef9ad75a71	6258	Prestranek
00050000-56b4-c420-c02f-4ae469cc4781	2391	Prevalje
00050000-56b4-c420-49af-61263ddccec8	3262	Prevorje
00050000-56b4-c420-4077-be5b24173e09	1276	Primskovo 
00050000-56b4-c420-a2f8-79e97e31fe7b	3253	Pristava pri Mestinju
00050000-56b4-c420-a7a9-58d2e4c4ca4b	9207	Prosenjakovci/Partosfalva
00050000-56b4-c420-e699-931161b7d157	5297	Prvačina
00050000-56b4-c420-4b99-b1f99936e22e	2250	Ptuj
00050000-56b4-c420-8c9b-6d473f262efc	2323	Ptujska Gora
00050000-56b4-c420-1ee9-2831858f5de7	9201	Puconci
00050000-56b4-c420-ab53-fbdd0549e64a	2327	Rače
00050000-56b4-c420-176f-64d87fcbf15f	1433	Radeče
00050000-56b4-c420-2e21-ec9d18097a73	9252	Radenci
00050000-56b4-c420-72e5-e6aac5a0a220	2360	Radlje ob Dravi
00050000-56b4-c420-e0a0-732ff7208c90	1235	Radomlje
00050000-56b4-c420-a67a-216d2d6227b4	4240	Radovljica
00050000-56b4-c420-8536-636652c4b3b9	8274	Raka
00050000-56b4-c420-a21e-6e918b1bba66	1381	Rakek
00050000-56b4-c420-a77d-485c727951c9	4283	Rateče - Planica
00050000-56b4-c420-57b0-04528c3a20e2	2390	Ravne na Koroškem
00050000-56b4-c420-14f5-661537785754	9246	Razkrižje
00050000-56b4-c420-84f6-7b17dd813362	3332	Rečica ob Savinji
00050000-56b4-c420-8688-1be28b2763c4	5292	Renče
00050000-56b4-c420-d890-fc90c98d0e45	1310	Ribnica
00050000-56b4-c420-b097-dc00a1ec98bd	2364	Ribnica na Pohorju
00050000-56b4-c420-226e-8419817e01bf	3272	Rimske Toplice
00050000-56b4-c420-5bee-d5f8cb8aa196	1314	Rob
00050000-56b4-c420-849b-c554cc67c060	5215	Ročinj
00050000-56b4-c420-60f1-27fc61e0e6b1	3250	Rogaška Slatina
00050000-56b4-c420-5b39-e154403c220d	9262	Rogašovci
00050000-56b4-c420-4f2b-039047a517d7	3252	Rogatec
00050000-56b4-c420-4aa2-07791e062ac1	1373	Rovte
00050000-56b4-c420-af97-ded4cae9420c	2342	Ruše
00050000-56b4-c420-081d-c069c32daf45	1282	Sava
00050000-56b4-c420-3818-25b73e548750	6333	Sečovlje/Sicciole
00050000-56b4-c420-1166-02b25c69fc79	4227	Selca
00050000-56b4-c420-fcd6-25b12cba723d	2352	Selnica ob Dravi
00050000-56b4-c420-ddd3-c69df5815e57	8333	Semič
00050000-56b4-c420-befe-236daff8491c	8281	Senovo
00050000-56b4-c420-ef99-df7d7b1a8138	6224	Senožeče
00050000-56b4-c420-b157-31f7faf7cccc	8290	Sevnica
00050000-56b4-c420-429f-2968822db8cf	6210	Sežana
00050000-56b4-c420-ec67-9a21b5505157	2214	Sladki Vrh
00050000-56b4-c420-0195-28501ed32c6f	5283	Slap ob Idrijci
00050000-56b4-c420-58e0-15f5169f7f9b	2380	Slovenj Gradec
00050000-56b4-c420-ddf0-4d09d6a5a43e	2310	Slovenska Bistrica
00050000-56b4-c420-357c-db25fa0ac7d5	3210	Slovenske Konjice
00050000-56b4-c420-8205-c03617dae679	1216	Smlednik
00050000-56b4-c420-251b-b6611af3bfe6	5232	Soča
00050000-56b4-c420-5bb1-898716c13e6f	1317	Sodražica
00050000-56b4-c420-fa8c-91b2c96628a3	3335	Solčava
00050000-56b4-c420-ada2-69b694ff544f	5250	Solkan
00050000-56b4-c420-e1ab-b8fd8d14618a	4229	Sorica
00050000-56b4-c420-d8ed-a1474baf3b12	4225	Sovodenj
00050000-56b4-c420-5a01-e59d635dbb4f	5281	Spodnja Idrija
00050000-56b4-c420-7316-102155539451	2241	Spodnji Duplek
00050000-56b4-c420-0ebe-440bbe850b00	9245	Spodnji Ivanjci
00050000-56b4-c420-6ec7-2df6dbd08177	2277	Središče ob Dravi
00050000-56b4-c420-a0b9-9cf1802ad077	4267	Srednja vas v Bohinju
00050000-56b4-c420-9714-5a871361b52c	8256	Sromlje 
00050000-56b4-c420-a26e-0d68fdfe80ce	5224	Srpenica
00050000-56b4-c420-0981-1e2c79ed2ec5	1242	Stahovica
00050000-56b4-c420-7873-0e6df3bb6a34	1332	Stara Cerkev
00050000-56b4-c420-a5c1-5a1d667f30bb	8342	Stari trg ob Kolpi
00050000-56b4-c420-8045-8f142ee12886	1386	Stari trg pri Ložu
00050000-56b4-c420-924a-8c05d541bf95	2205	Starše
00050000-56b4-c420-46eb-fece4045bf5b	2289	Stoperce
00050000-56b4-c420-a99a-b4a72fb12b39	8322	Stopiče
00050000-56b4-c420-d91c-74aae2e3d7f8	3206	Stranice
00050000-56b4-c420-e564-5747226d8374	8351	Straža
00050000-56b4-c420-7c3e-b86627d23ac0	1313	Struge
00050000-56b4-c420-a3e7-01b78c614196	8293	Studenec
00050000-56b4-c420-5c9f-6b424d900dcf	8331	Suhor
00050000-56b4-c420-b69d-e84e7b28a7f7	2233	Sv. Ana v Slovenskih goricah
00050000-56b4-c420-3373-64b85bafbc80	2235	Sv. Trojica v Slovenskih goricah
00050000-56b4-c420-9e67-f9df8edd0b9c	2353	Sveti Duh na Ostrem Vrhu
00050000-56b4-c420-aee4-acd870041390	9244	Sveti Jurij ob Ščavnici
00050000-56b4-c420-6dd0-3f24ecc5f491	3264	Sveti Štefan
00050000-56b4-c420-a41d-5ab46583aa65	2258	Sveti Tomaž
00050000-56b4-c420-d090-33ecf3404ba4	9204	Šalovci
00050000-56b4-c420-a783-1512649f84a2	5261	Šempas
00050000-56b4-c420-3a2a-fb03141fed0b	5290	Šempeter pri Gorici
00050000-56b4-c420-7f9f-bdb9e2705505	3311	Šempeter v Savinjski dolini
00050000-56b4-c420-3302-efad644d1631	4208	Šenčur
00050000-56b4-c420-c904-ade827121870	2212	Šentilj v Slovenskih goricah
00050000-56b4-c420-8e78-9883458388b9	8297	Šentjanž
00050000-56b4-c420-6709-26882d38446e	2373	Šentjanž pri Dravogradu
00050000-56b4-c420-5e51-90cb27850a44	8310	Šentjernej
00050000-56b4-c420-fc09-f8da11d2ebd9	3230	Šentjur
00050000-56b4-c420-dcb8-8218dd572c03	3271	Šentrupert
00050000-56b4-c420-8b29-44852f4d615a	8232	Šentrupert
00050000-56b4-c420-702c-75cd872f1444	1296	Šentvid pri Stični
00050000-56b4-c420-9c21-5fe7acff9db9	8275	Škocjan
00050000-56b4-c420-995a-eec981eba44f	6281	Škofije
00050000-56b4-c420-9c54-df88376460f4	4220	Škofja Loka
00050000-56b4-c420-ba2a-8d74e14e096c	3211	Škofja vas
00050000-56b4-c420-d50e-0bacc28ab0a9	1291	Škofljica
00050000-56b4-c420-c445-074ac1884959	6274	Šmarje
00050000-56b4-c420-4c8a-5adb59ac1cd6	1293	Šmarje - Sap
00050000-56b4-c420-c034-1a1c5bf55aa3	3240	Šmarje pri Jelšah
00050000-56b4-c420-7323-b88333cc328c	8220	Šmarješke Toplice
00050000-56b4-c420-0402-3184583394d5	2315	Šmartno na Pohorju
00050000-56b4-c420-1c20-355df2d4472e	3341	Šmartno ob Dreti
00050000-56b4-c420-947d-eb06a00e6821	3327	Šmartno ob Paki
00050000-56b4-c420-8ac7-faca9ca09d60	1275	Šmartno pri Litiji
00050000-56b4-c420-616a-e1f57e0e8288	2383	Šmartno pri Slovenj Gradcu
00050000-56b4-c420-89b4-dcc30591cd2b	3201	Šmartno v Rožni dolini
00050000-56b4-c420-a85e-233af2a792f5	3325	Šoštanj
00050000-56b4-c420-5d84-e1227e7a2eba	6222	Štanjel
00050000-56b4-c420-f919-0e549f4a7335	3220	Štore
00050000-56b4-c420-8f24-f2f556773797	3304	Tabor
00050000-56b4-c420-14ed-b4e8a96e3119	3221	Teharje
00050000-56b4-c420-98ec-96732c6c4163	9251	Tišina
00050000-56b4-c420-edd1-b9a03f46f056	5220	Tolmin
00050000-56b4-c420-5095-ac63f1c2f3b7	3326	Topolšica
00050000-56b4-c420-79d9-4d25653c7fcc	2371	Trbonje
00050000-56b4-c420-392a-e02499f815b7	1420	Trbovlje
00050000-56b4-c420-6dca-6bad8b23e67a	8231	Trebelno 
00050000-56b4-c420-b4b1-214fccc7672e	8210	Trebnje
00050000-56b4-c420-71a0-e6d22def6874	5252	Trnovo pri Gorici
00050000-56b4-c420-6898-9cba3fc4d667	2254	Trnovska vas
00050000-56b4-c420-a573-70da60e4fdb5	1222	Trojane
00050000-56b4-c420-fb27-580c226286b2	1236	Trzin
00050000-56b4-c420-05d0-d3bead51a8b8	4290	Tržič
00050000-56b4-c420-540b-99686ef5d54e	8295	Tržišče
00050000-56b4-c420-e8df-f0e341f5c380	1311	Turjak
00050000-56b4-c420-7afe-0411a778ecaa	9224	Turnišče
00050000-56b4-c420-9695-e3a09fb87f42	8323	Uršna sela
00050000-56b4-c420-6dd4-6c884eedc0cd	1252	Vače
00050000-56b4-c420-ca3b-49b40785aa1e	3320	Velenje 
00050000-56b4-c420-a4af-074fb5dea030	3322	Velenje - poštni predali
00050000-56b4-c420-6b2d-308d82e1b021	8212	Velika Loka
00050000-56b4-c420-8563-90d181c41b82	2274	Velika Nedelja
00050000-56b4-c420-23b3-45b0b23ff845	9225	Velika Polana
00050000-56b4-c420-5611-147867a7fef4	1315	Velike Lašče
00050000-56b4-c420-c38c-14b8a3f5236a	8213	Veliki Gaber
00050000-56b4-c420-e60f-87f41cc9a57f	9241	Veržej
00050000-56b4-c420-b755-61c7ed4d7f2d	1312	Videm - Dobrepolje
00050000-56b4-c420-7f7d-438a9e04cbef	2284	Videm pri Ptuju
00050000-56b4-c420-4167-d716e71bdc3d	8344	Vinica
00050000-56b4-c420-b626-33406e7dc710	5271	Vipava
00050000-56b4-c420-64fc-cd4fb5491055	4212	Visoko
00050000-56b4-c420-e85f-ac9f35f5ea0e	1294	Višnja Gora
00050000-56b4-c420-1731-21100726fbf3	3205	Vitanje
00050000-56b4-c420-9fae-44ccb866646d	2255	Vitomarci
00050000-56b4-c420-4d0c-9eb364a9616a	1217	Vodice
00050000-56b4-c420-8577-4a2af1110452	3212	Vojnik\t
00050000-56b4-c420-96d2-9805f100c22f	5293	Volčja Draga
00050000-56b4-c420-32f8-3abc223e5b65	2232	Voličina
00050000-56b4-c420-4430-74380027c7b2	3305	Vransko
00050000-56b4-c420-a02d-2aece36e8a66	6217	Vremski Britof
00050000-56b4-c420-bdbe-659faf5159a8	1360	Vrhnika
00050000-56b4-c420-0bad-4dc5fff72b0f	2365	Vuhred
00050000-56b4-c420-d2a8-09fa30075e8f	2367	Vuzenica
00050000-56b4-c420-3fc5-7f62039685c1	8292	Zabukovje 
00050000-56b4-c420-1379-358bb072751b	1410	Zagorje ob Savi
00050000-56b4-c420-d28e-67dc3fec8b55	1303	Zagradec
00050000-56b4-c420-d783-80eb29819276	2283	Zavrč
00050000-56b4-c420-43c7-18e2d75a401a	8272	Zdole 
00050000-56b4-c420-cbc5-1ca8074d5447	4201	Zgornja Besnica
00050000-56b4-c420-90ad-5f0fb063745d	2242	Zgornja Korena
00050000-56b4-c420-2575-915fddca4e11	2201	Zgornja Kungota
00050000-56b4-c420-3110-3337a1661326	2316	Zgornja Ložnica
00050000-56b4-c420-42b3-56241a241a4f	2314	Zgornja Polskava
00050000-56b4-c420-636e-b63c99125181	2213	Zgornja Velka
00050000-56b4-c420-d2e5-0eee2aa17479	4247	Zgornje Gorje
00050000-56b4-c420-705b-05e97722bb5f	4206	Zgornje Jezersko
00050000-56b4-c420-35dd-8cbb10e3beb2	2285	Zgornji Leskovec
00050000-56b4-c420-dea4-fe89120c9159	1432	Zidani Most
00050000-56b4-c420-c18f-01c572e79ad3	3214	Zreče
00050000-56b4-c420-b6cd-529f8157f7d9	4209	Žabnica
00050000-56b4-c420-3b60-51aebb4dff5b	3310	Žalec
00050000-56b4-c420-fea6-760af07e2501	4228	Železniki
00050000-56b4-c420-d29d-8c88834d8060	2287	Žetale
00050000-56b4-c420-d327-6cc33a99af2d	4226	Žiri
00050000-56b4-c420-6f35-056a77290f99	4274	Žirovnica
00050000-56b4-c420-d4d0-501e910ee8f6	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 43860168)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 43859738)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 43859478)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56b4-c424-7e14-806243e2bfd5	00080000-56b4-c424-9247-60c26da2a265	\N	00040000-56b4-c421-d6cf-926f0dfa0736	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56b4-c424-bef6-e4903bd48480	00080000-56b4-c424-9247-60c26da2a265	\N	00040000-56b4-c421-d6cf-926f0dfa0736	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56b4-c424-3098-59549b7934f5	00080000-56b4-c424-00c0-bc7f8dd1a8f7	\N	00040000-56b4-c421-d6cf-926f0dfa0736	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 43859613)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56b4-c421-5f17-9c5b143717d6	novo leto	1	1	\N	t
00430000-56b4-c421-b0ce-8149e6ae5148	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56b4-c421-5852-71ae6ba06eb3	dan upora proti okupatorju	27	4	\N	t
00430000-56b4-c421-92ed-21e3305e4295	praznik dela	1	5	\N	t
00430000-56b4-c421-f891-0560e2767a3a	praznik dela	2	5	\N	t
00430000-56b4-c421-34f0-40cdd8ec3931	dan Primoža Trubarja	8	6	\N	f
00430000-56b4-c421-f5b7-5cc1dea091c4	dan državnosti	25	6	\N	t
00430000-56b4-c421-9e7c-02894a4b3bad	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56b4-c421-07c4-33e0212effbb	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56b4-c421-c9ff-f7ee69319c15	dan suverenosti	25	10	\N	f
00430000-56b4-c421-16a1-06631a691539	dan spomina na mrtve	1	11	\N	t
00430000-56b4-c421-620a-2d8627e1c0fe	dan Rudolfa Maistra	23	11	\N	f
00430000-56b4-c421-0620-e31eb03efd66	božič	25	12	\N	t
00430000-56b4-c421-e4bf-2984501d851b	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56b4-c421-b1e6-d256f6db65ff	Marijino vnebovzetje	15	8	\N	t
00430000-56b4-c421-4cbd-3deaaade8c2b	dan reformacije	31	10	\N	t
00430000-56b4-c421-9c3e-e75017a153a1	velikonočna nedelja	27	3	2016	t
00430000-56b4-c421-5574-d229d4b1c089	velikonočna nedelja	16	4	2017	t
00430000-56b4-c421-0817-ec936b0bc98f	velikonočna nedelja	1	4	2018	t
00430000-56b4-c421-094f-dfd4abfaee22	velikonočna nedelja	21	4	2019	t
00430000-56b4-c421-aefa-bb7e6ce53382	velikonočna nedelja	12	4	2020	t
00430000-56b4-c421-a7ca-1f62cfc287ec	velikonočna nedelja	4	4	2021	t
00430000-56b4-c421-f1a9-b95946f274d6	velikonočna nedelja	17	4	2022	t
00430000-56b4-c421-0a95-479a1cecd330	velikonočna nedelja	9	4	2023	t
00430000-56b4-c421-186e-c2fe950d2dc7	velikonočna nedelja	31	3	2024	t
00430000-56b4-c421-b449-97d7522ac11d	velikonočna nedelja	20	4	2025	t
00430000-56b4-c421-065a-e77cb8be7249	velikonočna nedelja	5	4	2026	t
00430000-56b4-c421-8064-a2b2858e9be6	velikonočna nedelja	28	3	2027	t
00430000-56b4-c421-31a8-d749d4045f31	velikonočna nedelja	16	4	2028	t
00430000-56b4-c421-0b39-517a39592b4f	velikonočna nedelja	1	4	2029	t
00430000-56b4-c421-93ec-5f17b710643c	velikonočna nedelja	21	4	2030	t
00430000-56b4-c421-dab4-e9d6fde2ba6b	velikonočni ponedeljek	28	3	2016	t
00430000-56b4-c421-13cf-10d31dba2122	velikonočni ponedeljek	17	4	2017	t
00430000-56b4-c421-9497-cafebaa0a8e1	velikonočni ponedeljek	2	4	2018	t
00430000-56b4-c421-3999-09990e8fda05	velikonočni ponedeljek	22	4	2019	t
00430000-56b4-c421-f842-07a9233382c4	velikonočni ponedeljek	13	4	2020	t
00430000-56b4-c421-b6d6-8765ae227f7b	velikonočni ponedeljek	5	4	2021	t
00430000-56b4-c421-b434-764ffd0da3be	velikonočni ponedeljek	18	4	2022	t
00430000-56b4-c421-d2b1-af05100140e9	velikonočni ponedeljek	10	4	2023	t
00430000-56b4-c421-a7a5-97732f856fbb	velikonočni ponedeljek	1	4	2024	t
00430000-56b4-c421-78b8-4d9b71239db1	velikonočni ponedeljek	21	4	2025	t
00430000-56b4-c421-8718-78a65faffad7	velikonočni ponedeljek	6	4	2026	t
00430000-56b4-c421-8f58-62b2af1fa251	velikonočni ponedeljek	29	3	2027	t
00430000-56b4-c421-1cec-bface871c986	velikonočni ponedeljek	17	4	2028	t
00430000-56b4-c421-5a6d-d2881f91a379	velikonočni ponedeljek	2	4	2029	t
00430000-56b4-c421-43d6-b1e316d840e9	velikonočni ponedeljek	22	4	2030	t
00430000-56b4-c421-afc5-221845ff8feb	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56b4-c421-f103-d8ca4a9eaf69	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56b4-c421-80ff-957de3c0066b	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56b4-c421-b0be-4f5fd27eb44e	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56b4-c421-9dde-49259ec813c5	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56b4-c421-e268-6a096701f8cc	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56b4-c421-31b5-bd7400d71a9d	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56b4-c421-6dc4-4e0354cc4475	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56b4-c421-7306-c882aa89929e	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56b4-c421-4894-02f3340bf37c	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56b4-c421-ef23-4764b6678f6d	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56b4-c421-4d61-6b313c50c566	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56b4-c421-c075-e65efedacd74	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56b4-c421-5f92-b58d5a1d2037	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56b4-c421-e270-987a532266f2	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 43859582)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56b4-c425-7677-73123be1e4c2	000e0000-56b4-c425-7b93-dec29c07d310	1	3	1
001b0000-56b4-c425-fff4-8cad2cb80ce0	000e0000-56b4-c425-7b93-dec29c07d310	2	4	2
001b0000-56b4-c425-6d46-ff361e06d1af	000e0000-56b4-c425-7b93-dec29c07d310	4	5	3
001b0000-56b4-c425-c3f3-da63db6365aa	000e0000-56b4-c425-7b93-dec29c07d310	\N	1	\N
001b0000-56b4-c425-cc8d-490b9800a960	000e0000-56b4-c425-7b93-dec29c07d310	5	9	4
001b0000-56b4-c425-44a1-180d58c005ab	000e0000-56b4-c425-7b93-dec29c07d310	7	10	5
001b0000-56b4-c425-705a-1a2a3ac09b49	000e0000-56b4-c425-0d84-f5a0612a9a91	3	2	1
001b0000-56b4-c425-f84d-5fc0ef17713e	000e0000-56b4-c425-0d84-f5a0612a9a91	4	3	1
001b0000-56b4-c425-8a81-8f3c1b62ba12	000e0000-56b4-c425-7b93-dec29c07d310	\N	2	\N
001b0000-56b4-c425-336e-e0fa5034385d	000e0000-56b4-c425-0d84-f5a0612a9a91	\N	1	\N
001b0000-56b4-c425-057d-4fd1a1a5a7e8	000e0000-56b4-c425-7b93-dec29c07d310	3	8	3
001b0000-56b4-c425-54e0-9155f71ba828	000e0000-56b4-c425-7b93-dec29c07d310	2	11	1
001b0000-56b4-c425-1f12-6832d04a82dd	000e0000-56b4-c425-0d84-f5a0612a9a91	1	5	1
001b0000-56b4-c425-8833-434fc72feb82	000e0000-56b4-c425-0d84-f5a0612a9a91	6	4	2
001b0000-56b4-c425-6438-6189fb8b264f	000e0000-56b4-c425-7b93-dec29c07d310	1	6	1
001b0000-56b4-c425-53bc-193ee50d2252	000e0000-56b4-c425-7b93-dec29c07d310	2	7	2
\.


--
-- TOC entry 3161 (class 0 OID 43859588)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56b4-c425-7677-73123be1e4c2	000a0000-56b4-c424-c522-bcdd518146eb
001b0000-56b4-c425-7677-73123be1e4c2	000a0000-56b4-c424-0b3c-58684de25045
001b0000-56b4-c425-fff4-8cad2cb80ce0	000a0000-56b4-c424-0b3c-58684de25045
001b0000-56b4-c425-fff4-8cad2cb80ce0	000a0000-56b4-c424-7d30-65cfa253434e
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 43859750)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 43860182)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 43860192)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56b4-c424-8c2b-754ba6446896	00080000-56b4-c424-3325-274f00aca894	0987	AK
00190000-56b4-c424-dd4c-c43a327aa25d	00080000-56b4-c424-00c0-bc7f8dd1a8f7	0989	AK
00190000-56b4-c424-ccd2-252db3a98f31	00080000-56b4-c424-aee4-2dd56265c602	0986	AK
00190000-56b4-c424-f447-91d9ffc97694	00080000-56b4-c424-2e6d-57e93cbba5b2	0984	AK
00190000-56b4-c424-094c-32fe6ae0cea1	00080000-56b4-c424-3edc-0754626a96f5	0983	AK
00190000-56b4-c424-dd39-df8e9c19aac2	00080000-56b4-c424-687b-bf6b6e39e41e	0982	AK
00190000-56b4-c427-b9ba-610aeefc6ebf	00080000-56b4-c427-3aad-394501ef4e50	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 43860081)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56b4-c425-51fb-da7865b5ca56	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 43860200)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 43859778)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56b4-c424-fcf1-62a7eee4f083	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56b4-c424-c5fa-322d50b43a3b	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56b4-c424-15f5-2ac6d3931ab4	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56b4-c424-7bd7-469c3d95b701	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56b4-c424-a16b-048832eb8398	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56b4-c424-a89c-37432e767b11	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56b4-c424-9904-2d53ea85a0cd	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 43859723)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 43859713)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 43859920)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 43859850)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 43859556)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 43859317)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56b4-c427-3aad-394501ef4e50	00010000-56b4-c422-a7ca-adcfaf6b6e6c	2016-02-05 16:47:51	INS	a:0:{}
2	App\\Entity\\Option	00000000-56b4-c427-bed9-fc0fa669d246	00010000-56b4-c422-a7ca-adcfaf6b6e6c	2016-02-05 16:47:51	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56b4-c427-b9ba-610aeefc6ebf	00010000-56b4-c422-a7ca-adcfaf6b6e6c	2016-02-05 16:47:51	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 43859792)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 43859355)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56b4-c421-1d78-0ffbcb490913	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56b4-c421-2749-c4bc02d870db	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56b4-c421-a702-81367f60cb2d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56b4-c421-4842-2fd3d7cc8197	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56b4-c421-ead6-99721e7ce749	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56b4-c421-9e8d-e1e7382075cd	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56b4-c421-9552-e31c47af24ad	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56b4-c421-8faa-75ed51f52539	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56b4-c421-7c4e-fde80eff048e	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56b4-c421-7fe5-153e8731ae62	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56b4-c421-4045-1a4f4a35af7e	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56b4-c421-3883-a15219b38cf3	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56b4-c421-7b4b-2247a7594746	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56b4-c421-7fdf-44351a1ee6d5	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56b4-c421-4e37-b0fbd3a9b126	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56b4-c421-3d9b-a254b9248d5a	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56b4-c421-ee03-bb3e5353230f	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56b4-c421-13f3-254be84e525b	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56b4-c421-e9df-700bba8fe007	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56b4-c421-c2de-0e40348712d1	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56b4-c421-1462-f928fc935678	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56b4-c421-7d51-b3af4801e788	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56b4-c421-606c-f65cef11ceb5	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56b4-c421-e356-abdaa32718d0	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56b4-c421-6de7-77b730829e29	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56b4-c421-ac84-5169bc13b002	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56b4-c421-3132-f9f88c9ed529	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56b4-c421-59fd-1302ff44b590	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56b4-c421-6639-20fd8cc37edc	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56b4-c421-181e-10f80711a955	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56b4-c421-f9ac-f13dc5e2c27b	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56b4-c421-a3e1-7989ceb00e3c	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56b4-c421-e1c3-f893eb4a8fff	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56b4-c421-21ca-70c2810c7578	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56b4-c421-ac5c-ec583ecea8b7	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56b4-c421-475f-bff56d143b39	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56b4-c421-d1e5-d98058c16d40	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56b4-c421-6d89-b6f6e482d700	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56b4-c421-822f-fd3014be2260	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56b4-c421-8086-0a7e1111012c	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56b4-c421-bd89-89543a68be8e	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56b4-c421-2962-7884065a9e2e	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56b4-c421-51a2-d6d82ae2e3ad	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56b4-c421-4baa-ff50b7da2eb7	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56b4-c421-66c0-c70336dfc744	direktor	minimalne pravice za direktorja	t
00020000-56b4-c421-e34d-be93136cbf26	arhivar	arhivar	t
00020000-56b4-c421-6690-48ca2a9cad08	dramaturg	dramaturg	t
00020000-56b4-c422-696b-c79e4f852642	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56b4-c422-ce58-02dc67db904f	poslovni-sekretar	poslovni sekretar	t
00020000-56b4-c422-5f62-3f3d3acec181	vodja-tehnike	vodja tehnike	t
00020000-56b4-c422-c708-4a79be2adb06	racunovodja	računovodja	t
00020000-56b4-c424-3216-005fff8d6b79	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56b4-c424-c60e-0188d00e91f1	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-cbd2-e9549fbcfd06	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-7ad4-014780cde17e	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-5fef-604b1d07200e	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-43b4-28ff774a1c9d	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-f7d1-b965e709be1f	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-a50c-36954866dd0b	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-d845-204ba3d09a56	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-86cf-7b19a9338cc8	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-8e4d-7f4c0721e619	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-0dcc-398c845ab53b	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-c9ba-387172360d14	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-a4f9-2d26ffe9df74	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-5ec4-a516c682ab9e	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-84f8-daeb493809da	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-1b55-b12f767da7da	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-3ed6-789c33a95418	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-47da-f99e52da2090	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-2f56-92b4ec459f60	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56b4-c424-9736-f779c18b8087	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-c5ce-d6821b07e818	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-b857-4f5d635dd41e	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-0b38-6c8235025ecc	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-7339-c60b8282f221	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-ecca-677fa3a7a1fd	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-1d76-27b17f80be26	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-e4dd-eb109c94b8d8	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-018a-67cdf79c4db2	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-956f-34b06283f448	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-0286-144b2888cb9a	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-e090-fbad2ca04a4d	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-f07f-10b580c76cae	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-472c-a38b934d4f8a	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-3b6d-5875c26c1a44	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-1e29-43d149e50e75	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-aaeb-b11ce6ef02cd	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-dce8-1ff22bac483d	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56b4-c424-11dc-ccd7e455ad5b	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 43859339)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56b4-c422-29d9-da06879c1436	00020000-56b4-c421-a702-81367f60cb2d
00010000-56b4-c422-a7ca-adcfaf6b6e6c	00020000-56b4-c421-a702-81367f60cb2d
00010000-56b4-c424-f33f-fe3b75f8063c	00020000-56b4-c424-3216-005fff8d6b79
00010000-56b4-c424-8159-c43258e25cf3	00020000-56b4-c424-c60e-0188d00e91f1
00010000-56b4-c424-8159-c43258e25cf3	00020000-56b4-c424-43b4-28ff774a1c9d
00010000-56b4-c424-8159-c43258e25cf3	00020000-56b4-c424-86cf-7b19a9338cc8
00010000-56b4-c424-8159-c43258e25cf3	00020000-56b4-c424-0dcc-398c845ab53b
00010000-56b4-c424-8159-c43258e25cf3	00020000-56b4-c424-a4f9-2d26ffe9df74
00010000-56b4-c424-8159-c43258e25cf3	00020000-56b4-c424-47da-f99e52da2090
00010000-56b4-c424-8159-c43258e25cf3	00020000-56b4-c424-7ad4-014780cde17e
00010000-56b4-c424-8159-c43258e25cf3	00020000-56b4-c424-9736-f779c18b8087
00010000-56b4-c424-8159-c43258e25cf3	00020000-56b4-c424-0b38-6c8235025ecc
00010000-56b4-c424-8159-c43258e25cf3	00020000-56b4-c424-ecca-677fa3a7a1fd
00010000-56b4-c424-8159-c43258e25cf3	00020000-56b4-c424-e4dd-eb109c94b8d8
00010000-56b4-c424-8159-c43258e25cf3	00020000-56b4-c424-956f-34b06283f448
00010000-56b4-c424-8159-c43258e25cf3	00020000-56b4-c424-472c-a38b934d4f8a
00010000-56b4-c424-b079-5efa11f6d976	00020000-56b4-c424-c60e-0188d00e91f1
00010000-56b4-c424-b079-5efa11f6d976	00020000-56b4-c424-cbd2-e9549fbcfd06
00010000-56b4-c424-b079-5efa11f6d976	00020000-56b4-c424-7ad4-014780cde17e
00010000-56b4-c424-b079-5efa11f6d976	00020000-56b4-c424-5fef-604b1d07200e
00010000-56b4-c424-b079-5efa11f6d976	00020000-56b4-c424-a4f9-2d26ffe9df74
00010000-56b4-c424-b079-5efa11f6d976	00020000-56b4-c424-1b55-b12f767da7da
00010000-56b4-c424-b079-5efa11f6d976	00020000-56b4-c424-9736-f779c18b8087
00010000-56b4-c424-b079-5efa11f6d976	00020000-56b4-c424-0b38-6c8235025ecc
00010000-56b4-c424-b079-5efa11f6d976	00020000-56b4-c424-ecca-677fa3a7a1fd
00010000-56b4-c424-b079-5efa11f6d976	00020000-56b4-c424-e4dd-eb109c94b8d8
00010000-56b4-c424-b079-5efa11f6d976	00020000-56b4-c424-956f-34b06283f448
00010000-56b4-c424-b079-5efa11f6d976	00020000-56b4-c424-472c-a38b934d4f8a
00010000-56b4-c424-9c4f-4fe3b3bc33e1	00020000-56b4-c424-c60e-0188d00e91f1
00010000-56b4-c424-9c4f-4fe3b3bc33e1	00020000-56b4-c424-cbd2-e9549fbcfd06
00010000-56b4-c424-9c4f-4fe3b3bc33e1	00020000-56b4-c424-7ad4-014780cde17e
00010000-56b4-c424-9c4f-4fe3b3bc33e1	00020000-56b4-c424-5fef-604b1d07200e
00010000-56b4-c424-9c4f-4fe3b3bc33e1	00020000-56b4-c424-0dcc-398c845ab53b
00010000-56b4-c424-9c4f-4fe3b3bc33e1	00020000-56b4-c424-a4f9-2d26ffe9df74
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-cbd2-e9549fbcfd06
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-f7d1-b965e709be1f
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-8e4d-7f4c0721e619
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-c9ba-387172360d14
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-0dcc-398c845ab53b
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-3ed6-789c33a95418
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-a4f9-2d26ffe9df74
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-5ec4-a516c682ab9e
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-9736-f779c18b8087
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-c5ce-d6821b07e818
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-0b38-6c8235025ecc
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-7339-c60b8282f221
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-ecca-677fa3a7a1fd
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-1d76-27b17f80be26
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-e4dd-eb109c94b8d8
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-018a-67cdf79c4db2
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-956f-34b06283f448
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-0286-144b2888cb9a
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-472c-a38b934d4f8a
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-3b6d-5875c26c1a44
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-aaeb-b11ce6ef02cd
00010000-56b4-c424-2edc-09da98cf2310	00020000-56b4-c424-dce8-1ff22bac483d
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-cbd2-e9549fbcfd06
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-f7d1-b965e709be1f
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-d845-204ba3d09a56
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-8e4d-7f4c0721e619
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-c9ba-387172360d14
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-0dcc-398c845ab53b
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-3ed6-789c33a95418
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-a4f9-2d26ffe9df74
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-5ec4-a516c682ab9e
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-84f8-daeb493809da
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-9736-f779c18b8087
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-c5ce-d6821b07e818
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-b857-4f5d635dd41e
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-0b38-6c8235025ecc
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-7339-c60b8282f221
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-ecca-677fa3a7a1fd
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-1d76-27b17f80be26
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-e4dd-eb109c94b8d8
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-018a-67cdf79c4db2
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-956f-34b06283f448
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-0286-144b2888cb9a
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-472c-a38b934d4f8a
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-3b6d-5875c26c1a44
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-1e29-43d149e50e75
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-aaeb-b11ce6ef02cd
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-dce8-1ff22bac483d
00010000-56b4-c424-9fa0-9a322e0c4b4f	00020000-56b4-c424-11dc-ccd7e455ad5b
00010000-56b4-c424-98f9-c6ac9e1ab130	00020000-56b4-c424-cbd2-e9549fbcfd06
00010000-56b4-c424-98f9-c6ac9e1ab130	00020000-56b4-c424-7ad4-014780cde17e
00010000-56b4-c424-98f9-c6ac9e1ab130	00020000-56b4-c424-f7d1-b965e709be1f
00010000-56b4-c424-98f9-c6ac9e1ab130	00020000-56b4-c424-a50c-36954866dd0b
00010000-56b4-c424-98f9-c6ac9e1ab130	00020000-56b4-c424-d845-204ba3d09a56
00010000-56b4-c424-98f9-c6ac9e1ab130	00020000-56b4-c424-43b4-28ff774a1c9d
00010000-56b4-c424-98f9-c6ac9e1ab130	00020000-56b4-c424-8e4d-7f4c0721e619
00010000-56b4-c424-98f9-c6ac9e1ab130	00020000-56b4-c424-c9ba-387172360d14
00010000-56b4-c424-98f9-c6ac9e1ab130	00020000-56b4-c424-0dcc-398c845ab53b
00010000-56b4-c424-98f9-c6ac9e1ab130	00020000-56b4-c424-3ed6-789c33a95418
00010000-56b4-c424-00af-605b2a13eb1d	00020000-56b4-c424-c60e-0188d00e91f1
00010000-56b4-c424-00af-605b2a13eb1d	00020000-56b4-c424-5fef-604b1d07200e
00010000-56b4-c424-00af-605b2a13eb1d	00020000-56b4-c424-43b4-28ff774a1c9d
00010000-56b4-c424-00af-605b2a13eb1d	00020000-56b4-c424-86cf-7b19a9338cc8
00010000-56b4-c424-00af-605b2a13eb1d	00020000-56b4-c424-0dcc-398c845ab53b
00010000-56b4-c424-00af-605b2a13eb1d	00020000-56b4-c424-a4f9-2d26ffe9df74
00010000-56b4-c424-00af-605b2a13eb1d	00020000-56b4-c424-47da-f99e52da2090
00010000-56b4-c424-00af-605b2a13eb1d	00020000-56b4-c424-e090-fbad2ca04a4d
00010000-56b4-c424-38c4-dc3060324a65	00020000-56b4-c424-2f56-92b4ec459f60
00010000-56b4-c424-943d-309ee3dcb195	00020000-56b4-c421-66c0-c70336dfc744
00010000-56b4-c424-3674-f1bf6078f255	00020000-56b4-c421-e34d-be93136cbf26
00010000-56b4-c424-786b-eaa58588f33e	00020000-56b4-c421-6690-48ca2a9cad08
00010000-56b4-c424-bd22-7eedf20fc01b	00020000-56b4-c422-696b-c79e4f852642
00010000-56b4-c424-8531-0cfc892f03b5	00020000-56b4-c422-ce58-02dc67db904f
00010000-56b4-c424-911b-60a0765d72f9	00020000-56b4-c422-5f62-3f3d3acec181
00010000-56b4-c424-1ba8-ba9f81197cfc	00020000-56b4-c422-c708-4a79be2adb06
\.


--
-- TOC entry 3186 (class 0 OID 43859806)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 43859744)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 43859667)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56b4-c424-4711-2f919e27ef7a	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56b4-c424-6303-31c7e3d3de2c	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56b4-c424-1be8-4795fd8723c2	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56b4-c424-6bdf-c3d866784672	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 43859304)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56b4-c421-8475-2eb02cb7cb98	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56b4-c421-c199-962db962f0d0	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56b4-c421-7075-304c92da85a1	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56b4-c421-b8c9-0850308ef76e	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56b4-c421-87d9-dd31146e4542	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 43859296)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56b4-c421-8b88-626b332e61ef	00230000-56b4-c421-b8c9-0850308ef76e	popa
00240000-56b4-c421-ad36-afbc8164ef15	00230000-56b4-c421-b8c9-0850308ef76e	oseba
00240000-56b4-c421-22bb-d97e87d0a67f	00230000-56b4-c421-b8c9-0850308ef76e	tippopa
00240000-56b4-c421-c2af-c63aa705eb35	00230000-56b4-c421-b8c9-0850308ef76e	organizacijskaenota
00240000-56b4-c421-0a21-744cef8d71e5	00230000-56b4-c421-b8c9-0850308ef76e	sezona
00240000-56b4-c421-d33c-91e77b7dfe2a	00230000-56b4-c421-b8c9-0850308ef76e	tipvaje
00240000-56b4-c421-3729-01bf3d50d411	00230000-56b4-c421-b8c9-0850308ef76e	tipdodatka
00240000-56b4-c421-ae19-dcd95a2e30b5	00230000-56b4-c421-c199-962db962f0d0	prostor
00240000-56b4-c421-0b39-a6ec9e6e4f93	00230000-56b4-c421-b8c9-0850308ef76e	besedilo
00240000-56b4-c421-1e20-5d7dd280cce1	00230000-56b4-c421-b8c9-0850308ef76e	uprizoritev
00240000-56b4-c421-03f5-449660a2fd29	00230000-56b4-c421-b8c9-0850308ef76e	funkcija
00240000-56b4-c421-9619-85493ec79f32	00230000-56b4-c421-b8c9-0850308ef76e	tipfunkcije
00240000-56b4-c421-620f-aa0ada0b4ed0	00230000-56b4-c421-b8c9-0850308ef76e	alternacija
00240000-56b4-c421-42f0-4be288d36d87	00230000-56b4-c421-8475-2eb02cb7cb98	pogodba
00240000-56b4-c421-cbd5-f1458d0a317b	00230000-56b4-c421-b8c9-0850308ef76e	zaposlitev
00240000-56b4-c421-7926-02bb1dc4c22d	00230000-56b4-c421-b8c9-0850308ef76e	zvrstuprizoritve
00240000-56b4-c421-dd03-07a0fac88313	00230000-56b4-c421-8475-2eb02cb7cb98	programdela
00240000-56b4-c421-794b-85baae5e51d3	00230000-56b4-c421-b8c9-0850308ef76e	zapis
\.


--
-- TOC entry 3133 (class 0 OID 43859291)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
4dd8e90a-0952-4448-8dc6-c1c8c435aa83	00240000-56b4-c421-8b88-626b332e61ef	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 43859867)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56b4-c425-b192-9692dab9301f	000e0000-56b4-c425-7b93-dec29c07d310	00080000-56b4-c424-9247-60c26da2a265	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56b4-c421-6262-2de5b0294182
00270000-56b4-c425-120d-c4a64c9f56d9	000e0000-56b4-c425-7b93-dec29c07d310	00080000-56b4-c424-9247-60c26da2a265	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56b4-c421-6262-2de5b0294182
\.


--
-- TOC entry 3149 (class 0 OID 43859440)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 43859686)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56b4-c425-a911-dcfad818f3a0	00180000-56b4-c425-3ef7-e3dc9a6822b1	000c0000-56b4-c425-7e7a-a0d9392989d4	00090000-56b4-c424-f9dd-ce73b3437a19	1630080	2015-06-26 10:00:00	1630020	2015-06-26 11:00:00	f	f	f	f	\N
001a0000-56b4-c425-87c6-c60718bc6544	00180000-56b4-c425-3ef7-e3dc9a6822b1	000c0000-56b4-c425-69ec-bb67243a0207	00090000-56b4-c424-d316-95c173aa5215	1630080	2015-06-26 10:00:00	1630020	2015-06-26 11:00:00	f	f	f	f	\N
001a0000-56b4-c425-6561-2dc51d240a84	00180000-56b4-c425-3ef7-e3dc9a6822b1	000c0000-56b4-c425-9adc-873f872e76db	00090000-56b4-c424-22ab-19eda40fe9f3	1630080	2015-06-26 10:00:00	1630020	2015-06-26 11:00:00	f	f	f	f	\N
001a0000-56b4-c425-df4b-d60a63535952	00180000-56b4-c425-3ef7-e3dc9a6822b1	000c0000-56b4-c425-01f4-547d55f76079	00090000-56b4-c424-3c78-34efcb969189	1630080	2015-06-26 10:00:00	1630020	2015-06-26 11:00:00	f	f	f	f	\N
001a0000-56b4-c425-6ad2-fc0d31131181	00180000-56b4-c425-3ef7-e3dc9a6822b1	000c0000-56b4-c425-131e-0fb1f7f57b4d	00090000-56b4-c424-6ed7-a742044469e9	1630080	2015-06-26 10:00:00	1630020	2015-06-26 11:00:00	f	f	f	f	\N
001a0000-56b4-c425-1b7c-650dd3827dc4	00180000-56b4-c425-b799-4ae5d5b15e24	\N	00090000-56b4-c424-6ed7-a742044469e9	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	f	f	\N
001a0000-56b4-c425-d88a-f7d644aa342d	00180000-56b4-c425-7889-8d16eec91a4c	\N	00090000-56b4-c424-d316-95c173aa5215	1576800	2015-08-01 20:00:00	1576830	2015-08-01 23:30:00	f	t	f	f	\N
001a0000-56b4-c425-ad90-4f4a5ee46537	00180000-56b4-c425-3ef7-e3dc9a6822b1	\N	00090000-56b4-c424-ddc6-31242a042753	1682520	2015-08-01 20:00:00	1682610	2015-08-01 23:30:00	f	t	f	f	\N
001a0000-56b4-c425-c245-18fc36109288	00180000-56b4-c425-880f-c8ecd6fa80b0	\N	00090000-56b4-c424-f9dd-ce73b3437a19	0	2015-03-10 07:00:00	0	2015-03-20 23:00:00	f	f	t	f	\N
001a0000-56b4-c425-e5ae-abc1769a33f8	00180000-56b4-c425-880f-c8ecd6fa80b0	\N	00090000-56b4-c424-d316-95c173aa5215	0	2015-03-10 07:00:00	0	2015-03-20 23:00:00	f	f	t	f	\N
001a0000-56b4-c425-7228-a0147a02cddd	00180000-56b4-c425-880f-c8ecd6fa80b0	\N	00090000-56b4-c424-5127-6616c7b774b6	0	2015-03-10 07:00:00	15840	2015-03-31 23:00:00	f	f	t	f	\N
001a0000-56b4-c425-cbdd-ed857715bc96	00180000-56b4-c425-faac-9f36b9c0fcac	000c0000-56b4-c425-7e7a-a0d9392989d4	00090000-56b4-c424-f9dd-ce73b3437a19	0	2015-03-15 20:00:00	120	2015-03-15 23:00:00	f	f	f	f	\N
001a0000-56b4-c425-21ea-33c150d3891d	00180000-56b4-c425-faac-9f36b9c0fcac	000c0000-56b4-c425-69ec-bb67243a0207	00090000-56b4-c424-d316-95c173aa5215	0	2015-03-15 20:00:00	120	2015-03-15 23:00:00	f	f	f	f	\N
001a0000-56b4-c425-f600-8d4d5f7e0395	\N	\N	00090000-56b4-c424-60a9-a172faf4f4ae	\N	2015-01-01 00:00:00	\N	2015-07-01 00:00:00	f	f	f	t	\N
\.


--
-- TOC entry 3173 (class 0 OID 43859703)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56b4-c421-a55d-eaf56c3d04bd	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56b4-c421-ee4c-ac7ac6712927	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56b4-c421-2a1a-80239f989bac	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56b4-c421-db39-f44e5437c444	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56b4-c421-2952-4a3352df959b	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56b4-c421-2db9-017aea3fdd8e	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 43859908)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56b4-c421-fce3-7329747d73a2	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56b4-c421-3f04-8eaf3d0d1fdf	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56b4-c421-d75b-0c05c18d7eb7	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56b4-c421-3cc5-33d1ac1db246	04	Režija	Režija	Režija	umetnik	30
000f0000-56b4-c421-2b87-a8f6e9a78b4c	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56b4-c421-d7a3-16630280c9bc	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56b4-c421-f50f-577ccfac71ad	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56b4-c421-0388-d5920e364f2e	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56b4-c421-be96-583668859422	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56b4-c421-1163-7d78578510ba	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56b4-c421-b4d3-854537ac643c	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56b4-c421-8853-96df5be4adfb	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56b4-c421-b6d8-61083776af5d	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56b4-c421-d412-84e94b38380c	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56b4-c421-9100-09bdb45c1d23	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56b4-c421-6cb4-1278f3466da2	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56b4-c421-4ca4-6d29307aafe6	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56b4-c421-0618-77110b1ad1a8	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56b4-c421-2009-a44156cbaa69	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 43859391)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56b4-c424-9bbb-8b93692f3435	0001	šola	osnovna ali srednja šola
00400000-56b4-c424-dbd7-5ffb0fa2cd52	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56b4-c424-2116-210a0c7b9b93	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 43860212)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56b4-c420-d0a5-9c276a43ad09	01	Velika predstava	f	1.00	1.00
002b0000-56b4-c420-df4a-46b478483cc8	02	Mala predstava	f	0.50	0.50
002b0000-56b4-c420-2f84-c0d4eb30973c	03	Mala koprodukcija	t	0.40	1.00
002b0000-56b4-c420-cfee-fc79045033aa	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56b4-c420-77eb-51666ec62f14	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 43859657)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56b4-c420-4de8-88c30a914fae	0001	prva vaja	prva vaja
00420000-56b4-c420-5944-65d928d02a87	0002	tehnična vaja	tehnična vaja
00420000-56b4-c420-d67c-d01a9a4edf73	0003	lučna vaja	lučna vaja
00420000-56b4-c420-06aa-731e56867464	0004	kostumska vaja	kostumska vaja
00420000-56b4-c420-6b36-20638bdd266b	0005	foto vaja	foto vaja
00420000-56b4-c420-d96b-33b1abdc7de1	0006	1. glavna vaja	1. glavna vaja
00420000-56b4-c420-ad9d-7451ddf4a40e	0007	2. glavna vaja	2. glavna vaja
00420000-56b4-c420-103b-2069dab472c3	0008	1. generalka	1. generalka
00420000-56b4-c420-689a-5493533a40bb	0009	2. generalka	2. generalka
00420000-56b4-c420-1fe8-aaea2064e7fc	0010	odprta generalka	odprta generalka
00420000-56b4-c420-6778-30a9d7d901d3	0011	obnovitvena vaja	obnovitvena vaja
00420000-56b4-c420-1e39-086dfd2915c9	0012	italijanka	krajša "obnovitvena" vaja
00420000-56b4-c420-d71d-81781eed114d	0013	pevska vaja	pevska vaja
00420000-56b4-c420-8cde-cff3f632800d	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56b4-c420-2a0d-3200bfa3624d	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56b4-c420-285c-f5b49f62d26a	0016	orientacijska vaja	orientacijska vaja
00420000-56b4-c420-1080-babe76d41b7d	0017	situacijska vaja	situacijska vaja
00420000-56b4-c420-330a-9e6d341db2d1	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 43859513)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 43859326)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56b4-c422-a7ca-adcfaf6b6e6c	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROnUihUZLeBVgXzYe1mHZl0XxcDQ/ZjcG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56b4-c424-feeb-3b8aa4d6a994	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56b4-c424-961a-cb79b57feb06	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56b4-c424-69fd-0c1b7d6a5d9d	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56b4-c424-8fbb-a744e2ae69b7	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56b4-c424-1fea-52c66bfc501d	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56b4-c424-df5a-e468b63e6de3	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56b4-c424-5f36-482ef06855c9	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56b4-c424-c0a9-98a8c9e75a43	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56b4-c424-47c9-94a17579b59a	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56b4-c424-f33f-fe3b75f8063c	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56b4-c424-e99f-a4b9837ed4b4	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56b4-c424-8159-c43258e25cf3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56b4-c424-b079-5efa11f6d976	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56b4-c424-9c4f-4fe3b3bc33e1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56b4-c424-2edc-09da98cf2310	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56b4-c424-9fa0-9a322e0c4b4f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56b4-c424-98f9-c6ac9e1ab130	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56b4-c424-00af-605b2a13eb1d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56b4-c424-38c4-dc3060324a65	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56b4-c424-943d-309ee3dcb195	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56b4-c424-3674-f1bf6078f255	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56b4-c424-786b-eaa58588f33e	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56b4-c424-bd22-7eedf20fc01b	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56b4-c424-8531-0cfc892f03b5	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56b4-c424-911b-60a0765d72f9	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56b4-c424-1ba8-ba9f81197cfc	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56b4-c422-29d9-da06879c1436	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 43859958)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56b4-c425-0d84-f5a0612a9a91	00160000-56b4-c424-9a66-df3f50ce5d2f	\N	00140000-56b4-c421-cd3e-a2a11a67ae3a	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56b4-c424-a16b-048832eb8398
000e0000-56b4-c425-7b93-dec29c07d310	00160000-56b4-c424-b674-60c71e95a8e4	\N	00140000-56b4-c421-056a-94b555c01324	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56b4-c424-a89c-37432e767b11
000e0000-56b4-c425-db81-9ec0558bd60b	\N	\N	00140000-56b4-c421-056a-94b555c01324	00190000-56b4-c424-8c2b-754ba6446896	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56b4-c424-a16b-048832eb8398
000e0000-56b4-c425-9793-8b57ee4ff501	\N	\N	00140000-56b4-c421-056a-94b555c01324	00190000-56b4-c424-8c2b-754ba6446896	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56b4-c424-a16b-048832eb8398
000e0000-56b4-c425-95df-2dab11f4e8b6	\N	\N	00140000-56b4-c421-056a-94b555c01324	00190000-56b4-c424-8c2b-754ba6446896	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b4-c424-fcf1-62a7eee4f083
000e0000-56b4-c425-06b0-ddd637d145ed	\N	\N	00140000-56b4-c421-056a-94b555c01324	00190000-56b4-c424-8c2b-754ba6446896	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b4-c424-fcf1-62a7eee4f083
000e0000-56b4-c425-68a7-26b74c3b2696	\N	\N	00140000-56b4-c421-691e-e2c00cdafc28	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b4-c424-fcf1-62a7eee4f083
000e0000-56b4-c425-b068-a40f03eb30cb	\N	\N	00140000-56b4-c421-691e-e2c00cdafc28	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b4-c424-fcf1-62a7eee4f083
000e0000-56b4-c425-cf21-1df8b6f2448c	\N	\N	00140000-56b4-c421-691e-e2c00cdafc28	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b4-c424-fcf1-62a7eee4f083
000e0000-56b4-c425-0473-5d11086f1bcf	\N	\N	00140000-56b4-c421-691e-e2c00cdafc28	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b4-c424-fcf1-62a7eee4f083
000e0000-56b4-c425-96ec-afca2a9e8ce7	\N	\N	00140000-56b4-c421-691e-e2c00cdafc28	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b4-c424-fcf1-62a7eee4f083
000e0000-56b4-c425-09d8-dee880c9b302	\N	\N	00140000-56b4-c421-691e-e2c00cdafc28	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b4-c424-fcf1-62a7eee4f083
000e0000-56b4-c425-0bc3-fa734eed61ab	\N	\N	00140000-56b4-c421-691e-e2c00cdafc28	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b4-c424-fcf1-62a7eee4f083
000e0000-56b4-c425-5d17-c11e3576d199	\N	\N	00140000-56b4-c421-691e-e2c00cdafc28	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b4-c424-fcf1-62a7eee4f083
000e0000-56b4-c425-122b-682df5417695	\N	\N	00140000-56b4-c421-691e-e2c00cdafc28	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b4-c424-fcf1-62a7eee4f083
\.


--
-- TOC entry 3170 (class 0 OID 43859677)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 43859606)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56b4-c425-db56-6f7bdc0f348d	\N	000e0000-56b4-c425-7b93-dec29c07d310	3
00200000-56b4-c425-bcdb-3d68074924e0	\N	000e0000-56b4-c425-7b93-dec29c07d310	10
00200000-56b4-c425-ec43-58c3bccd7441	\N	000e0000-56b4-c425-7b93-dec29c07d310	6
00200000-56b4-c425-71e0-4e0bed74303c	\N	000e0000-56b4-c425-7b93-dec29c07d310	5
00200000-56b4-c425-7f34-2924beecf726	\N	000e0000-56b4-c425-7b93-dec29c07d310	7
00200000-56b4-c425-04f8-fa5f2f65d918	\N	000e0000-56b4-c425-0d84-f5a0612a9a91	1
00200000-56b4-c425-087f-42a4c9338871	\N	000e0000-56b4-c425-7b93-dec29c07d310	2
00200000-56b4-c425-d852-6b82391500a0	\N	000e0000-56b4-c425-7b93-dec29c07d310	1
00200000-56b4-c425-1bf5-3826b69e43c0	\N	000e0000-56b4-c425-7b93-dec29c07d310	8
00200000-56b4-c425-8948-802e39e4d523	\N	000e0000-56b4-c425-7b93-dec29c07d310	9
00200000-56b4-c425-96d8-0147e85c5d97	\N	000e0000-56b4-c425-7b93-dec29c07d310	4
\.


--
-- TOC entry 3182 (class 0 OID 43859770)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 43859881)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56b4-c421-6cb4-eed4f0ff3ca6	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56b4-c421-3c12-bd4be95e3108	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56b4-c421-4eb8-fce1cecadef7	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56b4-c421-3611-95f602d8e855	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56b4-c421-8f61-d3bc2852884e	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56b4-c421-0fac-b44f01e2afbb	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56b4-c421-7913-760cdd88dece	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56b4-c421-b806-91e08c6c29a0	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56b4-c421-6262-2de5b0294182	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56b4-c421-10fb-d9cb1ba8fbba	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56b4-c421-ed30-244e7c4ae223	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56b4-c421-777b-ab960c188636	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56b4-c421-41f9-90fdb735dced	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56b4-c421-8be4-96a64b4bf7a4	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56b4-c421-38ef-3697e58cd5e1	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56b4-c421-4578-6fa3d5787ede	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56b4-c421-1398-1d0c4fc7fc5e	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56b4-c421-a3ef-e9770c5fd6df	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56b4-c421-73c3-a844e2a231a7	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56b4-c421-faa9-c907e7da86dc	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56b4-c421-f33f-e4b58eaed0b5	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56b4-c421-a25e-4cc05c6f971e	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56b4-c421-12b7-e14b54095c0d	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56b4-c421-b704-68211b3de91d	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56b4-c421-7ac4-1f49d4ef1b2d	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56b4-c421-c2bc-dc86d6996ce4	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56b4-c421-5e13-515ff0473cad	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56b4-c421-0721-9d0ed68e175f	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 43860262)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 43860231)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 43860274)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 43859843)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56b4-c424-3366-06ee3ca8bd10	00090000-56b4-c424-d316-95c173aa5215	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56b4-c424-4676-35206d6371dd	00090000-56b4-c424-22ab-19eda40fe9f3	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56b4-c424-d067-3804236cbd75	00090000-56b4-c424-7e77-e6d1edf71e24	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56b4-c424-3a2d-8892b4b3db28	00090000-56b4-c424-5127-6616c7b774b6	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56b4-c424-7051-c5c1c3ddb965	00090000-56b4-c424-5e68-1cc2a371c74d	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56b4-c424-4f82-2346d78c1958	00090000-56b4-c424-2981-2d98b395aed2	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 43859948)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56b4-c421-cd3e-a2a11a67ae3a	01	Drama	drama (SURS 01)
00140000-56b4-c421-9d04-ed57916121f0	02	Opera	opera (SURS 02)
00140000-56b4-c421-a495-a9899c5d72b9	03	Balet	balet (SURS 03)
00140000-56b4-c421-d89d-5732926edc26	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56b4-c421-691e-e2c00cdafc28	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56b4-c421-056a-94b555c01324	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56b4-c421-cd29-ed2769fbd487	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 43859833)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 43859390)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 43860006)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 43859997)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 43859380)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 43859864)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 43859906)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 43860315)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 43859700)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 43859635)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 43859651)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 43859656)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 43860229)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 43859539)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 43860075)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 43859829)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 43859604)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 43859577)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 43859553)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 43859736)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 43860292)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 43860299)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 43860323)
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
-- TOC entry 2766 (class 2606 OID 43859762)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 43859511)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 43859409)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 43859473)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 43859436)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 43859369)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 43859354)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 43859768)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 43859805)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 43859943)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 43859464)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 43859499)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 43860180)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 43859742)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 43859489)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 43859620)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 43859592)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 43859586)
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
-- TOC entry 2764 (class 2606 OID 43859754)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 43860189)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 43860197)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 43860167)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 43860210)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 43859787)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 43859727)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 43859718)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 43859930)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 43859857)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 43859565)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 43859325)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 43859796)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 43859343)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 43859363)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 43859814)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 43859749)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 43859675)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 43859313)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 43859301)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 43859295)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 43859877)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 43859445)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 43859692)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 43859710)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 43859917)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 43859398)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 43860222)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 43859664)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 43859524)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 43859338)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 43859976)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 43859683)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 43859610)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 43859776)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 43859889)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 43860272)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 43860256)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 43860280)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 43859847)
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
-- TOC entry 2833 (class 2606 OID 43859956)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 43859841)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 43859645)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 43859646)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 43859644)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 43859642)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 43859643)
-- Name: idx_11e93b5d7634c214; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d7634c214 ON dogodek USING btree (nadrejenogostovanje_id);


--
-- TOC entry 2708 (class 1259 OID 43859641)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 43859878)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 43859879)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 43859880)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 43860294)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 43860293)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 43859466)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 43859467)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 43859769)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 43860260)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 43860259)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 43860261)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 43860258)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 43860257)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 43859755)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 43859611)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 43859612)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 43859830)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 43859832)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 43859831)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 43859555)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 43859554)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 43860211)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 43859945)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 43859946)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 43859947)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 43860281)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 43859981)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 43859978)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 43859982)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 43859980)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 43859979)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 43859526)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 43859525)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 43859439)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 43859797)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 43859370)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 43859371)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 43859817)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 43859816)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 43859815)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 43859476)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 43859475)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 43859477)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 43859587)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2595 (class 1259 OID 43859303)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 43859722)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 43859720)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 43859719)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 43859721)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 43859344)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 43859345)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 43859777)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 43860316)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 43859866)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 43859865)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 43860324)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 43860325)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 43859743)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 43859858)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 43859859)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 43860080)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 43860079)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 43860076)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 43860077)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 43860078)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 43859491)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 43859490)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 43859492)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 43859791)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 43859790)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 43860190)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 43860191)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 43860010)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 43860011)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 43860008)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 43860009)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 43859701)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 43859702)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 43859848)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 43859849)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 43859684)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 43859731)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 43859730)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 43859728)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 43859729)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 43859998)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 43859566)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 43859580)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 43859579)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 43859578)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 43859581)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 43859605)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 43859593)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 43859594)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 43860181)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 43860230)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 43860300)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 43860301)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 43859411)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 43859410)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 43859446)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 43859447)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 43859695)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 43859694)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 43859693)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 43859637)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 43859640)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 43859636)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 43859639)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 43859638)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 43859465)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 43859399)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 43859400)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 43859540)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 43859542)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 43859541)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 43859543)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 43859737)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 43859944)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 43859977)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 43859918)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 43859919)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 43859437)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 43859438)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 43859711)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 43859712)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 43859842)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 43859314)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 43859512)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 43859474)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 43859302)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 43860223)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 43859789)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 43859788)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 43859665)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 43859666)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 43860007)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 43859685)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 43859500)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 43859957)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 43860273)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 43860198)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 43860199)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 43859907)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 43859676)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 43859364)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 43860486)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 43860511)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 43860501)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 43860481)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2940 (class 2606 OID 43860516)
-- Name: fk_11e93b5d7634c214; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d7634c214 FOREIGN KEY (nadrejenogostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2944 (class 2606 OID 43860496)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 43860506)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 43860491)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2985 (class 2606 OID 43860696)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 43860701)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2983 (class 2606 OID 43860706)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3016 (class 2606 OID 43860866)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 43860861)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 43860381)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 43860386)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 43860611)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3011 (class 2606 OID 43860846)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 43860841)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3010 (class 2606 OID 43860851)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 43860836)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3014 (class 2606 OID 43860831)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 43860606)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2939 (class 2606 OID 43860471)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2938 (class 2606 OID 43860476)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 43860651)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 43860661)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 43860656)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 43860436)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 43860431)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 43860596)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 43860821)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2988 (class 2606 OID 43860711)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 43860716)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2986 (class 2606 OID 43860721)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 43860856)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2990 (class 2606 OID 43860741)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2993 (class 2606 OID 43860726)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2989 (class 2606 OID 43860746)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 43860736)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2992 (class 2606 OID 43860731)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 43860426)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 43860421)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 43860366)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 43860361)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 43860631)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 43860341)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 43860346)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2971 (class 2606 OID 43860646)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 43860641)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2973 (class 2606 OID 43860636)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 43860396)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 43860391)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 43860401)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 43860451)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 43860326)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 43860571)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 43860561)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 43860556)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 43860566)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 43860331)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 43860336)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 43860616)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 43860881)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2981 (class 2606 OID 43860691)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 43860686)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 43860886)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 43860891)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 43860601)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 43860676)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2979 (class 2606 OID 43860681)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2999 (class 2606 OID 43860796)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 43860791)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3003 (class 2606 OID 43860776)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 43860781)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 43860786)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 43860411)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 43860406)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 43860416)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2968 (class 2606 OID 43860626)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 43860621)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 43860806)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3005 (class 2606 OID 43860811)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2996 (class 2606 OID 43860766)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2995 (class 2606 OID 43860771)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2998 (class 2606 OID 43860756)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 43860761)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 43860546)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 43860551)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 43860666)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 43860671)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 43860521)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 43860526)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 43860591)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 43860586)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 43860576)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 43860581)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 43860751)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 43860441)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 43860446)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2937 (class 2606 OID 43860466)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2936 (class 2606 OID 43860456)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2935 (class 2606 OID 43860461)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 43860801)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 43860816)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 43860826)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 43860871)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 43860876)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 43860356)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 43860351)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 43860371)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 43860376)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 43860541)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 43860536)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 43860531)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-02-05 16:47:53 CET

--
-- PostgreSQL database dump complete
--

