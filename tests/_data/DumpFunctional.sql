--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-15 16:31:22 CET

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
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 257
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 37078330)
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
-- TOC entry 241 (class 1259 OID 37078949)
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
-- TOC entry 240 (class 1259 OID 37078933)
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
-- TOC entry 184 (class 1259 OID 37078323)
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
-- TOC entry 183 (class 1259 OID 37078321)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 37078810)
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
-- TOC entry 234 (class 1259 OID 37078840)
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
-- TOC entry 255 (class 1259 OID 37079252)
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
-- TOC entry 212 (class 1259 OID 37078646)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 37078572)
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
-- TOC entry 206 (class 1259 OID 37078597)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 37078602)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 37079174)
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
-- TOC entry 196 (class 1259 OID 37078475)
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
-- TOC entry 242 (class 1259 OID 37078962)
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
-- TOC entry 227 (class 1259 OID 37078768)
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
-- TOC entry 202 (class 1259 OID 37078546)
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
-- TOC entry 199 (class 1259 OID 37078515)
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
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 197 (class 1259 OID 37078492)
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
-- TOC entry 216 (class 1259 OID 37078682)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 37079232)
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
-- TOC entry 254 (class 1259 OID 37079245)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 37079267)
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
-- TOC entry 220 (class 1259 OID 37078707)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 37078449)
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
-- TOC entry 187 (class 1259 OID 37078349)
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
-- TOC entry 191 (class 1259 OID 37078416)
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
-- TOC entry 188 (class 1259 OID 37078360)
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
-- TOC entry 180 (class 1259 OID 37078295)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 37078314)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 37078714)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 37078748)
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
-- TOC entry 237 (class 1259 OID 37078881)
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
-- TOC entry 190 (class 1259 OID 37078396)
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
-- TOC entry 193 (class 1259 OID 37078441)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 37079118)
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
-- TOC entry 217 (class 1259 OID 37078688)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 37078426)
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
-- TOC entry 204 (class 1259 OID 37078564)
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
-- TOC entry 200 (class 1259 OID 37078530)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    dezurni_id uuid,
    zaporedna integer,
    zaporednasez integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 201 (class 1259 OID 37078539)
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
-- TOC entry 219 (class 1259 OID 37078700)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 37079132)
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
-- TOC entry 246 (class 1259 OID 37079142)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 37079031)
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
-- TOC entry 247 (class 1259 OID 37079150)
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
-- TOC entry 223 (class 1259 OID 37078729)
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
-- TOC entry 215 (class 1259 OID 37078673)
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
-- TOC entry 214 (class 1259 OID 37078663)
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
-- TOC entry 236 (class 1259 OID 37078870)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 37078800)
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
-- TOC entry 198 (class 1259 OID 37078504)
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
-- TOC entry 177 (class 1259 OID 37078266)
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
-- TOC entry 176 (class 1259 OID 37078264)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 37078742)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 37078304)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 37078288)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 37078756)
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
-- TOC entry 218 (class 1259 OID 37078694)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 37078617)
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
-- TOC entry 175 (class 1259 OID 37078253)
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
-- TOC entry 174 (class 1259 OID 37078245)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 37078240)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 37078817)
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
-- TOC entry 189 (class 1259 OID 37078388)
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
-- TOC entry 211 (class 1259 OID 37078636)
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
-- TOC entry 213 (class 1259 OID 37078653)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 37078858)
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
-- TOC entry 186 (class 1259 OID 37078339)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 37079162)
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
-- TOC entry 208 (class 1259 OID 37078607)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 37078461)
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
-- TOC entry 178 (class 1259 OID 37078275)
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
-- TOC entry 239 (class 1259 OID 37078908)
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
-- TOC entry 210 (class 1259 OID 37078627)
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
-- TOC entry 203 (class 1259 OID 37078557)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 37078721)
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
-- TOC entry 233 (class 1259 OID 37078831)
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
-- TOC entry 251 (class 1259 OID 37079212)
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
-- TOC entry 250 (class 1259 OID 37079181)
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
-- TOC entry 252 (class 1259 OID 37079224)
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
-- TOC entry 229 (class 1259 OID 37078793)
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
-- TOC entry 238 (class 1259 OID 37078898)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 37078783)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 37078326)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 37078269)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3148 (class 0 OID 37078330)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5699-10c6-baba-66b0416881b7	10	30	Otroci	Abonma za otroke	200
000a0000-5699-10c6-7a03-88c28015eaed	20	60	Mladina	Abonma za mladino	400
000a0000-5699-10c6-6ce2-008fdaf15103	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3204 (class 0 OID 37078949)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-5699-10c7-b167-c37690cbe5a2	000d0000-5699-10c7-71b7-7ca16fef6f44	\N	00090000-5699-10c7-ef11-4aacc01cba68	000b0000-5699-10c7-b357-40330b7a40c2	0001	f	\N	\N	\N	3	t	t	t
000c0000-5699-10c7-7774-d2ba4ec8de6f	000d0000-5699-10c7-af01-55993d6919a3	00100000-5699-10c7-456c-59a5915d1e81	00090000-5699-10c7-9377-26191dd715a1	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-5699-10c7-e5d0-2dac1fac9c2a	000d0000-5699-10c7-b099-8ee2f1cf5ccc	00100000-5699-10c7-f36c-48244c88fb79	00090000-5699-10c7-820a-a45bc6cb74c4	\N	0003	t	\N	2016-01-15	\N	2	t	f	f
000c0000-5699-10c7-b790-22ff55b0afcc	000d0000-5699-10c7-d078-624c9ff98252	\N	00090000-5699-10c7-2f77-aa4469088e5b	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-5699-10c7-8b20-f74565305a23	000d0000-5699-10c7-22c4-09b5aa729e96	\N	00090000-5699-10c7-9233-ea0ef44dd48e	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-5699-10c7-2166-663cad428338	000d0000-5699-10c7-f55d-d6018bff3c0b	\N	00090000-5699-10c7-4717-51d7a7d858b1	000b0000-5699-10c7-2f0e-8c14e554d666	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-5699-10c7-e851-a42226042bdf	000d0000-5699-10c7-346f-c1f98afd290a	00100000-5699-10c7-cc2c-118538ab2072	00090000-5699-10c7-1280-27d10567560c	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-5699-10c7-096b-af110db46bb8	000d0000-5699-10c7-e232-da40c4e645f0	\N	00090000-5699-10c7-ab60-127a5f189250	000b0000-5699-10c7-ec79-4e54da3a35ad	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-5699-10c7-e719-36a293369814	000d0000-5699-10c7-346f-c1f98afd290a	00100000-5699-10c7-1454-60b5aae7c763	00090000-5699-10c7-e3d2-350500eded01	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-5699-10c7-5459-cb772bdcdec6	000d0000-5699-10c7-346f-c1f98afd290a	00100000-5699-10c7-e7da-b926d4d20f44	00090000-5699-10c7-392e-4ea79f119223	\N	0010	t	\N	2016-01-15	\N	16	f	f	t
000c0000-5699-10c7-06ed-0cf303e42824	000d0000-5699-10c7-346f-c1f98afd290a	00100000-5699-10c7-d012-8f071b55acba	00090000-5699-10c7-63ac-af0f05c78b9c	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-5699-10c7-4844-e05c6544e90a	000d0000-5699-10c7-6ba5-c99effee4f8b	00100000-5699-10c7-456c-59a5915d1e81	00090000-5699-10c7-9377-26191dd715a1	000b0000-5699-10c7-e4c7-eb3e66fdc800	0012	t	\N	\N	\N	2	t	t	t
000c0000-5699-10c7-f51e-6436cc0f0180	000d0000-5699-10c7-1ea0-c6861dc6a094	\N	00090000-5699-10c7-ab60-127a5f189250	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-5699-10c7-6151-d191bf04f992	000d0000-5699-10c7-1ea0-c6861dc6a094	\N	00090000-5699-10c7-7508-e3ca4aeaa85d	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-5699-10c7-a5ba-f143f8901c5a	000d0000-5699-10c7-7baa-35f60eede3e8	00100000-5699-10c7-f36c-48244c88fb79	00090000-5699-10c7-820a-a45bc6cb74c4	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-5699-10c7-0308-5b082898c268	000d0000-5699-10c7-7baa-35f60eede3e8	\N	00090000-5699-10c7-7508-e3ca4aeaa85d	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-5699-10c7-75fa-558ec4d9508d	000d0000-5699-10c7-691b-1160bed924da	\N	00090000-5699-10c7-7508-e3ca4aeaa85d	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-5699-10c7-60cf-5968a47d206f	000d0000-5699-10c7-691b-1160bed924da	\N	00090000-5699-10c7-ab60-127a5f189250	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-5699-10c7-8c24-0a5f0f60a91b	000d0000-5699-10c7-0263-ba8dd4646695	00100000-5699-10c7-cc2c-118538ab2072	00090000-5699-10c7-1280-27d10567560c	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-5699-10c7-99b5-71e168e43bce	000d0000-5699-10c7-0263-ba8dd4646695	\N	00090000-5699-10c7-7508-e3ca4aeaa85d	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-5699-10c7-e4b8-74502f5b020c	000d0000-5699-10c7-4858-6034a8210840	\N	00090000-5699-10c7-7508-e3ca4aeaa85d	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-5699-10c7-8555-f8d6afac7c52	000d0000-5699-10c7-4858-6034a8210840	00100000-5699-10c7-cc2c-118538ab2072	00090000-5699-10c7-1280-27d10567560c	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-5699-10c7-164f-eace2fb70992	000d0000-5699-10c7-3a59-b77fdadfd436	\N	00090000-5699-10c7-7508-e3ca4aeaa85d	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-5699-10c7-01d0-625251471a17	000d0000-5699-10c7-c990-3c3bfb3f6f25	\N	00090000-5699-10c7-ab60-127a5f189250	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-5699-10c7-b766-15f953146333	000d0000-5699-10c7-9164-1d12e6a46fd3	\N	00090000-5699-10c7-ab60-127a5f189250	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-5699-10c7-13ac-01e16805c440	000d0000-5699-10c7-9164-1d12e6a46fd3	00100000-5699-10c7-f36c-48244c88fb79	00090000-5699-10c7-820a-a45bc6cb74c4	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-5699-10c7-0031-e41df122e14a	000d0000-5699-10c7-c3f8-70ff3492099b	\N	00090000-5699-10c7-28cd-7fba7d75f6c1	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-5699-10c7-4953-9fba8dee3c6d	000d0000-5699-10c7-c3f8-70ff3492099b	\N	00090000-5699-10c7-9e96-9b25c590e8cc	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-5699-10c7-6439-ce55ffa1139a	000d0000-5699-10c7-31ff-78ba668f966c	\N	00090000-5699-10c7-ab60-127a5f189250	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-5699-10c7-3031-3e3990150e44	000d0000-5699-10c7-31ff-78ba668f966c	00100000-5699-10c7-f36c-48244c88fb79	00090000-5699-10c7-820a-a45bc6cb74c4	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-5699-10c7-e6cb-f63b0fd2397e	000d0000-5699-10c7-31ff-78ba668f966c	\N	00090000-5699-10c7-9e96-9b25c590e8cc	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-5699-10c7-be84-d857185a5faf	000d0000-5699-10c7-31ff-78ba668f966c	\N	00090000-5699-10c7-28cd-7fba7d75f6c1	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-5699-10c7-fadb-367f9b314269	000d0000-5699-10c7-13d5-fe9f151169a9	\N	00090000-5699-10c7-ab60-127a5f189250	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-5699-10c7-ac97-c5beae619431	000d0000-5699-10c7-b7af-6456eabe15c4	00100000-5699-10c7-f36c-48244c88fb79	00090000-5699-10c7-820a-a45bc6cb74c4	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-5699-10c7-c309-a3acdcdda29a	000d0000-5699-10c7-b7af-6456eabe15c4	\N	00090000-5699-10c7-7508-e3ca4aeaa85d	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3203 (class 0 OID 37078933)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 37078323)
-- Dependencies: 184
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3194 (class 0 OID 37078810)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5699-10c7-b031-903ce28b17cd	00160000-5699-10c6-0954-d8aac10a200b	00090000-5699-10c7-9e96-9b25c590e8cc	aizv	10	t
003d0000-5699-10c7-e6e5-92f654f43aa6	00160000-5699-10c6-0954-d8aac10a200b	00090000-5699-10c7-f02e-15f227d1ec2c	apri	14	t
003d0000-5699-10c7-a4cc-c0094d72f16f	00160000-5699-10c6-9fd5-e88619e5d92b	00090000-5699-10c7-28cd-7fba7d75f6c1	aizv	11	t
003d0000-5699-10c7-664c-42c2df8f03b8	00160000-5699-10c6-112e-0c991e9ca836	00090000-5699-10c7-051d-8d1425fd606a	aizv	12	t
003d0000-5699-10c7-1d6c-138993d3b745	00160000-5699-10c6-0954-d8aac10a200b	00090000-5699-10c7-7508-e3ca4aeaa85d	apri	18	f
\.


--
-- TOC entry 3197 (class 0 OID 37078840)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5699-10c6-0954-d8aac10a200b	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5699-10c6-9fd5-e88619e5d92b	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5699-10c6-112e-0c991e9ca836	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3218 (class 0 OID 37079252)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 37078646)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 37078572)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5699-10c7-2888-82a188f58f20	\N	00200000-5699-10c7-da1c-e4fd3a243e7e	\N	\N	\N	00220000-5699-10c6-b583-7b13c7a5064d	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5699-10c7-d9e7-228f78287226	\N	00200000-5699-10c7-06d2-ea32064c302b	\N	\N	\N	00220000-5699-10c6-b583-7b13c7a5064d	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-5699-10c7-39bc-4e9c33e71802	\N	00200000-5699-10c7-77b9-74a824a86c6b	\N	\N	\N	00220000-5699-10c6-ba24-31daee24a72c	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5699-10c7-265a-638284cb7669	\N	00200000-5699-10c7-c1d2-ba0900fc2729	\N	\N	\N	00220000-5699-10c6-bb8d-d13533d7bc75	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-5699-10c7-057f-4b87dfbdad55	\N	00200000-5699-10c7-927e-3f3cae8a6fb5	\N	\N	\N	00220000-5699-10c6-59c2-d5ed1db88b1f	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3169 (class 0 OID 37078597)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 37078602)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 37079174)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 37078475)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5699-10c4-2d7a-350569948ead	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5699-10c4-5b92-4776776ab38f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5699-10c4-f8a5-464843b42bf1	AL	ALB	008	Albania 	Albanija	\N
00040000-5699-10c4-c1d1-010774556e20	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5699-10c4-9ac5-935a4b6b2806	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5699-10c4-c5ef-64a91ae55ced	AD	AND	020	Andorra 	Andora	\N
00040000-5699-10c4-94ef-da3fb89ca519	AO	AGO	024	Angola 	Angola	\N
00040000-5699-10c4-b7e6-f3af47805cc4	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5699-10c4-c689-9ccecfebd8c5	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5699-10c4-351e-e4b62cf2dff7	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5699-10c4-8c93-96f773f14c56	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5699-10c4-e5f4-606fb6d98ebc	AM	ARM	051	Armenia 	Armenija	\N
00040000-5699-10c4-a747-220a3dbba554	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5699-10c4-da4c-22a322607709	AU	AUS	036	Australia 	Avstralija	\N
00040000-5699-10c4-ee8e-b2cecb745137	AT	AUT	040	Austria 	Avstrija	\N
00040000-5699-10c4-9c29-21acbe103d53	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5699-10c4-bd77-24cba792e3c4	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5699-10c4-6f2f-758d9ec389f6	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5699-10c4-4a97-0110a5598f4d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5699-10c4-5e12-64779d96785e	BB	BRB	052	Barbados 	Barbados	\N
00040000-5699-10c4-d4b2-20cee3da3b26	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5699-10c4-721b-56290d494854	BE	BEL	056	Belgium 	Belgija	\N
00040000-5699-10c4-b9bd-25a045edd138	BZ	BLZ	084	Belize 	Belize	\N
00040000-5699-10c4-716b-b370b8962825	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5699-10c4-3c99-f765e8712182	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5699-10c4-2e7e-f12a96a37f57	BT	BTN	064	Bhutan 	Butan	\N
00040000-5699-10c4-b3b5-46cfbd0252e8	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5699-10c4-fafe-d92320ad439f	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5699-10c4-ca04-1e30b58687f5	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5699-10c4-ba5f-aef45bd93da2	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5699-10c4-863e-ebd042b0a248	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5699-10c4-3f47-8fd9893b35b5	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5699-10c4-79ca-43a37c91bdc0	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5699-10c4-4aef-4247adc77d8b	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5699-10c4-a6d5-235265860d71	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5699-10c4-25b4-9ab83efd5f5a	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5699-10c4-c171-b4be1f4d22e5	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5699-10c4-5964-cdca96e3d0c0	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5699-10c4-6baf-90dea4e1ce37	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5699-10c4-e168-76e689216617	CA	CAN	124	Canada 	Kanada	\N
00040000-5699-10c4-e059-37bbc30c3ef4	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5699-10c4-fafc-f3790e5a97a5	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5699-10c4-4ace-2f517d09befb	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5699-10c4-5faf-6b93493da66d	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5699-10c4-1776-312869ee4b2e	CL	CHL	152	Chile 	Čile	\N
00040000-5699-10c4-52a8-e9f1986ad37a	CN	CHN	156	China 	Kitajska	\N
00040000-5699-10c4-eea5-1ebae87e5b33	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5699-10c4-b482-e1632553df11	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5699-10c4-0a73-2b0f662a03e4	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5699-10c4-e5b8-decb1401ca67	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5699-10c4-d07b-3a5158e71cc0	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5699-10c4-dcc6-48a5d6b65223	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5699-10c4-30e3-ace8b0559012	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5699-10c4-5f7a-756cab9850f4	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5699-10c4-eee7-461bea3833f1	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5699-10c4-4cd1-4d1b0bda68bf	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5699-10c4-ba25-84de9e2f3bde	CU	CUB	192	Cuba 	Kuba	\N
00040000-5699-10c4-aa82-b646b63d7bea	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5699-10c4-e5a0-e234c3421102	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5699-10c4-c6ba-a21ed564c232	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5699-10c4-d322-94c2107783bf	DK	DNK	208	Denmark 	Danska	\N
00040000-5699-10c4-14c0-6650f2c5d349	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5699-10c4-3067-36713ef3f937	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5699-10c4-2a87-49f560623c51	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5699-10c4-0b28-4b1c37826a0c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5699-10c4-ce47-884c7da5cad7	EG	EGY	818	Egypt 	Egipt	\N
00040000-5699-10c4-bd0d-d6079571aa72	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5699-10c4-2944-9935f362cb3f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5699-10c4-a6f2-b37572e5fb25	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5699-10c4-5e90-e8d2a5fa0781	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5699-10c4-52d8-378212b53ec8	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5699-10c4-3b87-8ef360c7983b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5699-10c4-9092-463ea673d400	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5699-10c4-b1fd-f9be3459cb82	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5699-10c4-25ce-a380c90222a8	FI	FIN	246	Finland 	Finska	\N
00040000-5699-10c4-cf5c-572b6d610fc9	FR	FRA	250	France 	Francija	\N
00040000-5699-10c4-5842-63f02d0846f0	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5699-10c4-f952-8f055e2fbd1e	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5699-10c4-c763-41f797517aa2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5699-10c4-cd94-d7866f06e9c7	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5699-10c4-c4fd-1a6074bd018d	GA	GAB	266	Gabon 	Gabon	\N
00040000-5699-10c4-266e-508fba9c57c3	GM	GMB	270	Gambia 	Gambija	\N
00040000-5699-10c4-605f-8611ee288665	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5699-10c4-a183-fcfe4817d27e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5699-10c4-3485-0430c33cb55e	GH	GHA	288	Ghana 	Gana	\N
00040000-5699-10c4-bfdf-29ee08ca0228	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5699-10c4-aa1d-a7ff5544017c	GR	GRC	300	Greece 	Grčija	\N
00040000-5699-10c4-7b7e-de31f763e17a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5699-10c4-d72b-1813fb7e9aa6	GD	GRD	308	Grenada 	Grenada	\N
00040000-5699-10c4-9927-d50b643859df	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5699-10c4-f45f-083b0014158e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5699-10c4-1390-9a99918f031e	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5699-10c4-b09a-0cfd41da189b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5699-10c4-5784-74accb0b76c3	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5699-10c4-a917-3f25eb41a145	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5699-10c4-aad1-1732fafcb51a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5699-10c4-2bb6-8fadbd607b10	HT	HTI	332	Haiti 	Haiti	\N
00040000-5699-10c4-2c60-20cbec0a8c82	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5699-10c4-885f-2cb9ce1b0e93	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5699-10c4-6483-85461bc1fdbb	HN	HND	340	Honduras 	Honduras	\N
00040000-5699-10c4-dd2b-696dad037543	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5699-10c4-e0c8-8302d39b81cc	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5699-10c4-cc61-799ec48acdd3	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5699-10c4-41db-2bdd9dfa2a21	IN	IND	356	India 	Indija	\N
00040000-5699-10c4-3776-d0ffe4e12915	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5699-10c4-41f4-be529b828e3f	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5699-10c4-86ca-1bdf7451f5e6	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5699-10c4-f2a4-c5a55d2ce1f9	IE	IRL	372	Ireland 	Irska	\N
00040000-5699-10c4-99ff-f8797cef7c3a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5699-10c4-3201-f0180de29641	IL	ISR	376	Israel 	Izrael	\N
00040000-5699-10c4-ef78-4ec65828f3dc	IT	ITA	380	Italy 	Italija	\N
00040000-5699-10c4-e79d-8d6470dfbab4	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5699-10c4-e2b7-ada933fbc274	JP	JPN	392	Japan 	Japonska	\N
00040000-5699-10c4-287d-b027ac05a3a7	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5699-10c4-4020-a9b616e6d193	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5699-10c4-9f3b-848d48b4b45d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5699-10c4-7676-da3c67e3e5e6	KE	KEN	404	Kenya 	Kenija	\N
00040000-5699-10c4-9920-e97812816a3a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5699-10c4-686f-e7d0eaaa36a9	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5699-10c4-3873-4bb487e212d0	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5699-10c4-1b17-04f26fac195f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5699-10c4-129f-49b249e51d66	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5699-10c4-7630-a624ac2a3aae	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5699-10c4-db1d-c1c88088f576	LV	LVA	428	Latvia 	Latvija	\N
00040000-5699-10c4-a4c6-73bb5e07e30e	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5699-10c4-459a-0934ca939f34	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5699-10c4-1cbb-c1e574ef7391	LR	LBR	430	Liberia 	Liberija	\N
00040000-5699-10c4-3196-1087d93a95bd	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5699-10c4-4e18-b412251449da	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5699-10c4-4133-5356b0c5bd29	LT	LTU	440	Lithuania 	Litva	\N
00040000-5699-10c4-f03c-340e5e11653c	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5699-10c4-59bd-408685ddd8de	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5699-10c4-c011-5a44b7587d14	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5699-10c4-3336-a66747ba3ade	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5699-10c4-dbc3-beacff9595ae	MW	MWI	454	Malawi 	Malavi	\N
00040000-5699-10c4-0d68-d714e270a21f	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5699-10c4-9e69-259988255f76	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5699-10c4-02db-c00b85f453ee	ML	MLI	466	Mali 	Mali	\N
00040000-5699-10c4-816d-466eb108ccdc	MT	MLT	470	Malta 	Malta	\N
00040000-5699-10c4-f391-68c00233b44f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5699-10c4-b62c-3de40cbe1ce5	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5699-10c4-1703-f1cd8dc14890	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5699-10c4-9705-a983732b233f	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5699-10c4-20c8-7f2b4d90259d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5699-10c4-5eba-293aa40c4d35	MX	MEX	484	Mexico 	Mehika	\N
00040000-5699-10c4-7269-ce407a52576c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5699-10c4-c584-68c65a76f5d5	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5699-10c4-f96f-a5d87402d7d3	MC	MCO	492	Monaco 	Monako	\N
00040000-5699-10c4-325a-1aa307e06e81	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5699-10c4-9325-ee2419a73e9e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5699-10c4-ceb5-bc7b5490c046	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5699-10c4-f015-6f5bfd8b8deb	MA	MAR	504	Morocco 	Maroko	\N
00040000-5699-10c4-bd5b-63bd22fdce12	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5699-10c4-22ed-6c79981ce2f9	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5699-10c4-bee9-526d0b9ad08e	NA	NAM	516	Namibia 	Namibija	\N
00040000-5699-10c4-24a6-7755752db5bf	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5699-10c4-b300-52301fe58195	NP	NPL	524	Nepal 	Nepal	\N
00040000-5699-10c4-27f8-8f863b5b5e41	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5699-10c4-dcde-dbd0b560f226	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5699-10c4-2db5-b73ce973ff8b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5699-10c4-ea5a-cb05a8e14bb5	NE	NER	562	Niger 	Niger 	\N
00040000-5699-10c4-3b1b-db3b4217e77d	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5699-10c4-ba93-e957395fc940	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5699-10c4-622a-c1a3e8630b90	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5699-10c4-87b5-4a961922dfcd	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5699-10c4-f05c-649408ad938a	NO	NOR	578	Norway 	Norveška	\N
00040000-5699-10c4-1f7f-1ef0f068b0b3	OM	OMN	512	Oman 	Oman	\N
00040000-5699-10c4-dce8-98ee9daa0941	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5699-10c4-b08c-244c649e41b3	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5699-10c4-24e5-5167122d234b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5699-10c4-2fe8-03ee8d005aa1	PA	PAN	591	Panama 	Panama	\N
00040000-5699-10c4-cc46-6a8a5e2acf3a	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5699-10c4-8af0-7eacdf333062	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5699-10c4-acdf-4d5fa13ab228	PE	PER	604	Peru 	Peru	\N
00040000-5699-10c4-ac1e-09b43a1264b6	PH	PHL	608	Philippines 	Filipini	\N
00040000-5699-10c4-2234-b567ae7acd00	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5699-10c4-92fd-3d7c2bc3989c	PL	POL	616	Poland 	Poljska	\N
00040000-5699-10c4-e2b4-0209afc9f965	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5699-10c4-3663-2d4eb56c0cf4	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5699-10c4-67b2-1ee9519080eb	QA	QAT	634	Qatar 	Katar	\N
00040000-5699-10c4-ceb0-017ef3b541a3	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5699-10c4-fca6-4280eb1a6939	RO	ROU	642	Romania 	Romunija	\N
00040000-5699-10c4-6fc3-b1aab9ec991f	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5699-10c4-1c15-73cb458dd822	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5699-10c4-cd7b-16b05fd92889	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5699-10c4-51db-2f1b09ff9363	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5699-10c4-5eea-714c673aa833	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5699-10c4-55ea-9b5554dddaf3	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5699-10c4-c67d-73786c0a05be	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5699-10c4-98f1-709714842252	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5699-10c4-d863-309fe7bb00aa	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5699-10c4-0f85-0ea1696c1260	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5699-10c4-affa-a5197d93b644	SM	SMR	674	San Marino 	San Marino	\N
00040000-5699-10c4-5f7e-012f97788491	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5699-10c4-ff69-ad84f44ba413	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5699-10c4-9695-2021cf343560	SN	SEN	686	Senegal 	Senegal	\N
00040000-5699-10c4-7d5b-6f915bb47b77	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5699-10c4-ffcf-5e63a310aaa3	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5699-10c4-bbc1-3452e05a16a7	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5699-10c4-2d79-d951d2977ac3	SG	SGP	702	Singapore 	Singapur	\N
00040000-5699-10c4-6a2c-7072858cfe6c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5699-10c4-6247-8ecea3de2320	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5699-10c4-0bee-1c000b55d0cb	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5699-10c4-1afe-ac08b0c0b0f0	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5699-10c4-38bd-b3005fc95e9a	SO	SOM	706	Somalia 	Somalija	\N
00040000-5699-10c4-3b46-c5f996b74358	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5699-10c4-6ebd-8ba5742374b8	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5699-10c4-d01a-6f50c913645b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5699-10c4-030d-8177af1800cc	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5699-10c4-1165-5f92fe3dc444	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5699-10c4-73ee-241844460795	SD	SDN	729	Sudan 	Sudan	\N
00040000-5699-10c4-1e26-33f12dd7694d	SR	SUR	740	Suriname 	Surinam	\N
00040000-5699-10c4-9588-606ad40028d2	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5699-10c4-6e4d-7d51148a4bff	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5699-10c4-706e-d48a2a280416	SE	SWE	752	Sweden 	Švedska	\N
00040000-5699-10c4-1203-706f7c9444c7	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5699-10c4-0eab-a7af567998dd	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5699-10c4-e466-4b8bd459c4b8	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5699-10c4-2fe7-3b7f6c891418	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5699-10c4-46d2-cdb8de914b19	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5699-10c4-a6ce-52322304c1fe	TH	THA	764	Thailand 	Tajska	\N
00040000-5699-10c4-c851-ff856f175ee9	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5699-10c4-8590-1da2fde78d41	TG	TGO	768	Togo 	Togo	\N
00040000-5699-10c4-2609-700c767457c5	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5699-10c4-2017-6b1e63bcaa78	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5699-10c4-52b8-d3119a996b52	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5699-10c4-a490-c137fe6c37ad	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5699-10c4-c86f-9b2c37e11ab2	TR	TUR	792	Turkey 	Turčija	\N
00040000-5699-10c4-5c1e-29cc62674a57	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5699-10c4-e07e-52acaf27e0d8	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5699-10c4-ae89-09a356869884	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5699-10c4-4802-92f5e32be511	UG	UGA	800	Uganda 	Uganda	\N
00040000-5699-10c4-f868-1e366c35ed12	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5699-10c4-4c68-6640a244e4cd	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5699-10c4-501c-23914d4368f4	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5699-10c4-231a-d31550175ff0	US	USA	840	United States 	Združene države Amerike	\N
00040000-5699-10c4-e705-d43f1aa985dc	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5699-10c4-e4d3-7e1289529aaa	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5699-10c4-005d-ed8562d4d908	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5699-10c4-48b8-e9f0f219d179	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5699-10c4-58b9-1377dc92b373	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5699-10c4-1997-a59129540255	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5699-10c4-98c3-6b010406ca84	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5699-10c4-e9af-a5c312f629fb	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5699-10c4-498d-2f8bb176985d	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5699-10c4-a160-b9738623d5bb	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5699-10c4-60d8-29ad3b99a732	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5699-10c4-beb5-ab5ccce60cdd	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5699-10c4-294c-7b65aaa51cab	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3205 (class 0 OID 37078962)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5699-10c7-b176-e993d9137973	000e0000-5699-10c7-463f-044f6fdaa0f5	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5699-10c3-e3f4-03b4d3629eb7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5699-10c7-62a6-190873c168a3	000e0000-5699-10c7-b04c-e719d5e0cf29	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5699-10c3-b0e0-693ffc1234fd	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5699-10c7-00e6-9a0d50e7a039	000e0000-5699-10c7-32ce-db5dc86cc86d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5699-10c3-e3f4-03b4d3629eb7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5699-10c7-d7c2-09c47a23470f	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5699-10c7-8232-36fbe06af4a6	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3190 (class 0 OID 37078768)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5699-10c7-fdd3-e3f408ac7d02	000e0000-5699-10c7-b04c-e719d5e0cf29	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-5699-10c4-8c23-6d1da9771d33
000d0000-5699-10c7-770f-3d20aa09ce8f	000e0000-5699-10c7-c82b-f44bc70b5ef9	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-5699-10c4-ff50-c96fb5fb685b
000d0000-5699-10c7-4f00-20edd2768111	000e0000-5699-10c7-c82b-f44bc70b5ef9	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-5699-10c4-12b3-7dd224a6be03
000d0000-5699-10c7-71b7-7ca16fef6f44	000e0000-5699-10c7-b04c-e719d5e0cf29	000c0000-5699-10c7-b167-c37690cbe5a2	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5699-10c4-ff50-c96fb5fb685b
000d0000-5699-10c7-af01-55993d6919a3	000e0000-5699-10c7-b04c-e719d5e0cf29	000c0000-5699-10c7-7774-d2ba4ec8de6f	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5699-10c4-12b3-7dd224a6be03
000d0000-5699-10c7-b099-8ee2f1cf5ccc	000e0000-5699-10c7-b04c-e719d5e0cf29	000c0000-5699-10c7-e5d0-2dac1fac9c2a	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5699-10c4-a91e-af76dd0f90b2
000d0000-5699-10c7-d078-624c9ff98252	000e0000-5699-10c7-b04c-e719d5e0cf29	000c0000-5699-10c7-b790-22ff55b0afcc	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5699-10c4-8c23-6d1da9771d33
000d0000-5699-10c7-22c4-09b5aa729e96	000e0000-5699-10c7-b04c-e719d5e0cf29	000c0000-5699-10c7-8b20-f74565305a23	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5699-10c4-8c23-6d1da9771d33
000d0000-5699-10c7-f55d-d6018bff3c0b	000e0000-5699-10c7-b04c-e719d5e0cf29	000c0000-5699-10c7-2166-663cad428338	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5699-10c4-ff50-c96fb5fb685b
000d0000-5699-10c7-346f-c1f98afd290a	000e0000-5699-10c7-b04c-e719d5e0cf29	000c0000-5699-10c7-e719-36a293369814	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5699-10c4-ff50-c96fb5fb685b
000d0000-5699-10c7-e232-da40c4e645f0	000e0000-5699-10c7-b04c-e719d5e0cf29	000c0000-5699-10c7-096b-af110db46bb8	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5699-10c4-8f34-c69c99ced039
000d0000-5699-10c7-6ba5-c99effee4f8b	000e0000-5699-10c7-b04c-e719d5e0cf29	000c0000-5699-10c7-4844-e05c6544e90a	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5699-10c4-fe7e-402560b224f8
000d0000-5699-10c7-1ea0-c6861dc6a094	000e0000-5699-10c7-7901-57cc2159466a	000c0000-5699-10c7-f51e-6436cc0f0180	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-5699-10c4-12b3-7dd224a6be03
000d0000-5699-10c7-7baa-35f60eede3e8	000e0000-5699-10c7-7059-babec278f894	000c0000-5699-10c7-a5ba-f143f8901c5a	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-5699-10c4-12b3-7dd224a6be03
000d0000-5699-10c7-691b-1160bed924da	000e0000-5699-10c7-7059-babec278f894	000c0000-5699-10c7-75fa-558ec4d9508d	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-5699-10c4-12b3-7dd224a6be03
000d0000-5699-10c7-0263-ba8dd4646695	000e0000-5699-10c7-d4bf-e522cff64313	000c0000-5699-10c7-8c24-0a5f0f60a91b	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-5699-10c4-12b3-7dd224a6be03
000d0000-5699-10c7-4858-6034a8210840	000e0000-5699-10c7-a9da-a41cf0046141	000c0000-5699-10c7-e4b8-74502f5b020c	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-5699-10c4-12b3-7dd224a6be03
000d0000-5699-10c7-3a59-b77fdadfd436	000e0000-5699-10c7-c9f3-80ce15bfcf9d	000c0000-5699-10c7-164f-eace2fb70992	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-5699-10c4-12b3-7dd224a6be03
000d0000-5699-10c7-c990-3c3bfb3f6f25	000e0000-5699-10c7-e8ec-a559283f607b	000c0000-5699-10c7-01d0-625251471a17	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-5699-10c4-12b3-7dd224a6be03
000d0000-5699-10c7-9164-1d12e6a46fd3	000e0000-5699-10c7-7ce5-38fcb23a8782	000c0000-5699-10c7-b766-15f953146333	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-5699-10c4-12b3-7dd224a6be03
000d0000-5699-10c7-c3f8-70ff3492099b	000e0000-5699-10c7-6299-f1a6e6fcc614	000c0000-5699-10c7-0031-e41df122e14a	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-5699-10c4-12b3-7dd224a6be03
000d0000-5699-10c7-31ff-78ba668f966c	000e0000-5699-10c7-6299-f1a6e6fcc614	000c0000-5699-10c7-6439-ce55ffa1139a	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-5699-10c4-12b3-7dd224a6be03
000d0000-5699-10c7-13d5-fe9f151169a9	000e0000-5699-10c7-cf80-22eb2dce6096	000c0000-5699-10c7-fadb-367f9b314269	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-5699-10c4-12b3-7dd224a6be03
000d0000-5699-10c7-b7af-6456eabe15c4	000e0000-5699-10c7-cf80-22eb2dce6096	000c0000-5699-10c7-ac97-c5beae619431	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-5699-10c4-12b3-7dd224a6be03
\.


--
-- TOC entry 3165 (class 0 OID 37078546)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 37078515)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 37078492)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5699-10c7-83b1-a738219da2b5	00080000-5699-10c7-58a7-07a3a843b987	00090000-5699-10c7-392e-4ea79f119223	AK		igralka
\.


--
-- TOC entry 3179 (class 0 OID 37078682)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 37079232)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5699-10c7-d644-f78488ab0953	00010000-5699-10c5-3242-1f28d16003a5	\N	Prva mapa	Root mapa	2016-01-15 16:31:19	2016-01-15 16:31:19	R	\N	\N
\.


--
-- TOC entry 3217 (class 0 OID 37079245)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3219 (class 0 OID 37079267)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 34548309)
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
-- TOC entry 3183 (class 0 OID 37078707)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 37078449)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5699-10c5-e97f-29d841c0d259	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5699-10c5-0029-9c28c78ab17d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5699-10c5-861b-30736e53b5e9	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5699-10c5-b684-ccfcfc4424d5	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5699-10c5-cdd9-c575731303b4	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5699-10c5-6bdb-135dd40b41f9	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5699-10c5-8f54-65cd682f0c41	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-5699-10c5-30c7-43042d25f626	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5699-10c5-2b1f-26ac5c223a50	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5699-10c5-3646-02193250023f	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5699-10c5-7c91-99d249b3e1d1	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5699-10c5-2301-9dd2660a4b1b	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5699-10c5-1dce-8646e4223b9e	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5699-10c5-8b7d-57aefc178bc6	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5699-10c5-a234-7e132e8dd9eb	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5699-10c6-2d28-80a1b3bb41d6	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5699-10c6-e27c-86dace3b3022	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5699-10c6-9913-ca60c6a0ad10	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5699-10c6-6113-95821fae7364	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5699-10c6-a8bb-d58f820a557a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5699-10c8-5ae6-a2c597ee282e	application.tenant.maticnopodjetje	string	s:36:"00080000-5699-10c8-41c5-12c67ce60db5";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3150 (class 0 OID 37078349)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5699-10c6-f4ac-20ffdd162bdc	00000000-5699-10c6-2d28-80a1b3bb41d6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5699-10c6-c5fc-736a0de2e05e	00000000-5699-10c6-2d28-80a1b3bb41d6	00010000-5699-10c5-3242-1f28d16003a5	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5699-10c6-f82b-63a9fd7045d3	00000000-5699-10c6-e27c-86dace3b3022	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3154 (class 0 OID 37078416)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5699-10c7-18ef-61afaeb771b5	\N	00100000-5699-10c7-456c-59a5915d1e81	00100000-5699-10c7-f36c-48244c88fb79	01	Gledališče Nimbis
00410000-5699-10c7-2fc0-35803c15431c	00410000-5699-10c7-18ef-61afaeb771b5	00100000-5699-10c7-456c-59a5915d1e81	00100000-5699-10c7-f36c-48244c88fb79	02	Tehnika
\.


--
-- TOC entry 3151 (class 0 OID 37078360)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5699-10c7-ef11-4aacc01cba68	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5699-10c7-2f77-aa4469088e5b	00010000-5699-10c6-b013-aee510e46e7f	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5699-10c7-820a-a45bc6cb74c4	00010000-5699-10c6-d653-b726f30882bb	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5699-10c7-e3d2-350500eded01	00010000-5699-10c6-366f-d76ae66a69ab	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5699-10c7-2242-ddbc5e36aafb	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5699-10c7-4717-51d7a7d858b1	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5699-10c7-63ac-af0f05c78b9c	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5699-10c7-1280-27d10567560c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5699-10c7-392e-4ea79f119223	00010000-5699-10c6-d25f-ad937ed6b586	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5699-10c7-9377-26191dd715a1	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5699-10c7-64fa-285aa25c1dd1	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5699-10c7-9233-ea0ef44dd48e	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5699-10c7-ab60-127a5f189250	00010000-5699-10c6-4225-b760fe962d23	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5699-10c7-9e96-9b25c590e8cc	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5699-10c7-f02e-15f227d1ec2c	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5699-10c7-28cd-7fba7d75f6c1	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5699-10c7-051d-8d1425fd606a	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5699-10c7-7508-e3ca4aeaa85d	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5699-10c7-be4b-0685c714e69f	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5699-10c7-6648-99e4b51b9a69	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5699-10c7-4a2a-ff06a9eced00	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3143 (class 0 OID 37078295)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5699-10c4-afb0-28b487c17dcc	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5699-10c4-f179-4ebc48a49ccd	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5699-10c4-102b-342d256315c7	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5699-10c4-a108-3869e76b2a30	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5699-10c4-df1a-3847562df9f0	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5699-10c4-24d3-15c893c54b01	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5699-10c4-8537-12e22b05c5d5	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5699-10c4-9d8e-6fd5c50c359c	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5699-10c4-357c-4b98af1f3b3c	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5699-10c4-3e22-aa722615e7e7	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5699-10c4-5c0f-8315949e7217	Abonma-read	Abonma - branje	t
00030000-5699-10c4-c35f-626119e098e0	Abonma-write	Abonma - spreminjanje	t
00030000-5699-10c4-ceba-8d2bc9b8027a	Alternacija-read	Alternacija - branje	t
00030000-5699-10c4-f385-25c38855960b	Alternacija-write	Alternacija - spreminjanje	t
00030000-5699-10c4-cecb-dcf8aa02ce2e	Arhivalija-read	Arhivalija - branje	t
00030000-5699-10c4-3e01-d4918c1e7404	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5699-10c4-8c8d-2eb22a161d72	AuthStorage-read	AuthStorage - branje	t
00030000-5699-10c4-8edf-3e5d396f15cc	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5699-10c4-6ac6-f33f877dc45a	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5699-10c4-8651-a6271b9da989	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5699-10c4-a342-e02f3b68529f	Besedilo-read	Besedilo - branje	t
00030000-5699-10c4-31d1-72198c6bedfd	Besedilo-write	Besedilo - spreminjanje	t
00030000-5699-10c4-c905-0beba9a667e8	Dodatek-read	Dodatek - branje	t
00030000-5699-10c4-76db-8022a39d9c50	Dodatek-write	Dodatek - spreminjanje	t
00030000-5699-10c4-43d0-70769de7a3d2	Dogodek-read	Dogodek - branje	t
00030000-5699-10c4-fff8-d0bf2ad09769	Dogodek-write	Dogodek - spreminjanje	t
00030000-5699-10c4-899a-0bede31c7929	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5699-10c4-06f0-e5631ec7bb12	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5699-10c4-0693-f81fddbb127b	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5699-10c4-4735-4e9dc176bd21	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5699-10c4-0f56-4d3e5d3a8d47	DogodekTrait-read	DogodekTrait - branje	t
00030000-5699-10c4-2897-263d7aa4fbff	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5699-10c4-4298-bb7876993f52	DrugiVir-read	DrugiVir - branje	t
00030000-5699-10c4-a54c-8430b191e123	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5699-10c4-3ef8-652a7543a469	Drzava-read	Drzava - branje	t
00030000-5699-10c4-f0a6-b72ab5a9ca26	Drzava-write	Drzava - spreminjanje	t
00030000-5699-10c4-8145-9a187986cf82	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5699-10c4-f75e-474a54a6cde7	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5699-10c4-69e7-6031350893cb	Funkcija-read	Funkcija - branje	t
00030000-5699-10c4-6249-7ae150730157	Funkcija-write	Funkcija - spreminjanje	t
00030000-5699-10c4-8d71-3c35c2a27a8a	Gostovanje-read	Gostovanje - branje	t
00030000-5699-10c4-b513-c65ad7c8c2b2	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5699-10c4-dcf2-3a607ab7ea20	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5699-10c4-a58e-2cabc5db6652	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5699-10c4-29d8-013f3843e365	Kupec-read	Kupec - branje	t
00030000-5699-10c4-775f-b642d70e1d41	Kupec-write	Kupec - spreminjanje	t
00030000-5699-10c4-294e-a21aa00b3ee8	NacinPlacina-read	NacinPlacina - branje	t
00030000-5699-10c4-1cb1-4b835e55e127	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5699-10c4-f02a-769258a26e43	Option-read	Option - branje	t
00030000-5699-10c4-09da-7d1c573778cb	Option-write	Option - spreminjanje	t
00030000-5699-10c4-1ba4-4818d9e0d3b5	OptionValue-read	OptionValue - branje	t
00030000-5699-10c4-0309-eade13fde92a	OptionValue-write	OptionValue - spreminjanje	t
00030000-5699-10c4-08c2-52d68d385bf2	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5699-10c4-ef86-b92d0a0f7d91	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5699-10c4-2272-011edee4829f	Oseba-read	Oseba - branje	t
00030000-5699-10c4-450e-ef274a4495bd	Oseba-write	Oseba - spreminjanje	t
00030000-5699-10c4-595f-596b2202fab3	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5699-10c4-576b-22d1e9d598a1	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5699-10c4-b8c9-d599a45493ab	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5699-10c4-200c-f323d7f18a67	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5699-10c4-5eaf-fd53ec4ae53c	Pogodba-read	Pogodba - branje	t
00030000-5699-10c4-d417-1965f744f29e	Pogodba-write	Pogodba - spreminjanje	t
00030000-5699-10c4-47a7-f9861b8fdff2	Popa-read	Popa - branje	t
00030000-5699-10c4-9ad1-1b2c0e916442	Popa-write	Popa - spreminjanje	t
00030000-5699-10c4-5038-33b8fcbff2ca	Posta-read	Posta - branje	t
00030000-5699-10c4-2a52-a02693dedcdb	Posta-write	Posta - spreminjanje	t
00030000-5699-10c4-129c-d5304b170132	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5699-10c4-b02b-dfe644dca41f	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5699-10c4-c235-62dcf9621648	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5699-10c4-9cd6-55ed4d832a76	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5699-10c4-5faa-7c197829e42c	PostniNaslov-read	PostniNaslov - branje	t
00030000-5699-10c4-b397-aca4775738bf	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5699-10c4-5678-73b318d638f4	Praznik-read	Praznik - branje	t
00030000-5699-10c4-ae96-23c044e25968	Praznik-write	Praznik - spreminjanje	t
00030000-5699-10c4-152e-358272f2f25c	Predstava-read	Predstava - branje	t
00030000-5699-10c4-3485-42d3d978f63a	Predstava-write	Predstava - spreminjanje	t
00030000-5699-10c4-7638-eb1764eb1940	Ura-read	Ura - branje	t
00030000-5699-10c4-8c38-93a81acc2227	Ura-write	Ura - spreminjanje	t
00030000-5699-10c4-2e62-fdcbce0c6f6e	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5699-10c4-d964-61243242ed8e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5699-10c4-47ab-d6c0bc022fb9	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5699-10c4-3bde-7febc255edc9	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5699-10c4-29bd-3018cd5eab01	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5699-10c4-6d77-ea638af0a70f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5699-10c4-00c5-e7f314a29c91	ProgramDela-read	ProgramDela - branje	t
00030000-5699-10c4-f562-36e0b9682b73	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5699-10c4-17d7-84dbaa917440	ProgramFestival-read	ProgramFestival - branje	t
00030000-5699-10c4-79d8-c99996e61cd4	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5699-10c4-dc74-eaa0488a9972	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5699-10c4-9a4c-7600528b6499	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5699-10c4-bf13-cabfa19428d3	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5699-10c4-a937-65a7de6c02d2	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5699-10c4-80af-2b12fcbf645a	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5699-10c4-b6fd-a6eeddfd1173	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5699-10c4-c243-1406246a5563	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5699-10c4-84bd-42cfa12ff636	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5699-10c4-b06a-b023260b2af2	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5699-10c4-a26a-2a98c55de10b	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5699-10c4-9012-83356594485c	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5699-10c4-fbb6-4d6d700eec7f	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5699-10c4-a656-15a0861fa88b	ProgramRazno-read	ProgramRazno - branje	t
00030000-5699-10c4-e545-cc44138ebcb7	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5699-10c4-4560-59b36629c893	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5699-10c4-2b6f-95aca5a28205	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5699-10c4-ff69-dde1bfd9a1c2	Prostor-read	Prostor - branje	t
00030000-5699-10c4-068f-0961b0bbe96e	Prostor-write	Prostor - spreminjanje	t
00030000-5699-10c4-999c-37926c28753e	Racun-read	Racun - branje	t
00030000-5699-10c4-9851-2499cdb7d34b	Racun-write	Racun - spreminjanje	t
00030000-5699-10c4-8dc9-07bd7226801e	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5699-10c4-cd81-d8f5f28078a9	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5699-10c4-1659-aefa5e49d6e6	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5699-10c4-809e-932a8d40b0f7	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5699-10c4-9fa3-c725d6e3ecdf	Rekvizit-read	Rekvizit - branje	t
00030000-5699-10c4-436b-d8da9086819b	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5699-10c4-f0e2-563b4334ee0f	Revizija-read	Revizija - branje	t
00030000-5699-10c4-bc98-d22a39af5fcf	Revizija-write	Revizija - spreminjanje	t
00030000-5699-10c4-f221-d86db360e6ca	Rezervacija-read	Rezervacija - branje	t
00030000-5699-10c4-9c00-8b7e9dcc59e7	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5699-10c4-5b65-84483773075c	SedezniRed-read	SedezniRed - branje	t
00030000-5699-10c4-e8b0-6e5fc14b98cd	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5699-10c4-efd0-cdc586e3234f	Sedez-read	Sedez - branje	t
00030000-5699-10c4-99b5-fb134be956f1	Sedez-write	Sedez - spreminjanje	t
00030000-5699-10c4-31a9-c847ac07b92a	Sezona-read	Sezona - branje	t
00030000-5699-10c4-1fc7-dc7ad7aac648	Sezona-write	Sezona - spreminjanje	t
00030000-5699-10c4-debe-c01019bd6a26	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5699-10c4-9349-809a89cb68bc	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5699-10c4-d509-e5ee92744d1c	Telefonska-read	Telefonska - branje	t
00030000-5699-10c4-278e-22ad23852eee	Telefonska-write	Telefonska - spreminjanje	t
00030000-5699-10c4-9141-7eb244656492	TerminStoritve-read	TerminStoritve - branje	t
00030000-5699-10c4-8fd2-a26c92c26bba	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5699-10c4-7767-7539d888891d	TipDodatka-read	TipDodatka - branje	t
00030000-5699-10c4-8855-0a37377d64d5	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-5699-10c4-9b7c-e6a2bdb556f9	TipFunkcije-read	TipFunkcije - branje	t
00030000-5699-10c4-4b06-c1eded47ce7f	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5699-10c4-aad9-2eca806d0aa0	TipPopa-read	TipPopa - branje	t
00030000-5699-10c4-c4da-84fdff501b73	TipPopa-write	TipPopa - spreminjanje	t
00030000-5699-10c4-29bf-b9b3d0066681	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5699-10c4-648d-e0c590b590b6	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5699-10c4-f51b-ee4803b62c77	TipVaje-read	TipVaje - branje	t
00030000-5699-10c4-cc57-20ea75a086f7	TipVaje-write	TipVaje - spreminjanje	t
00030000-5699-10c4-0c94-5db87154997b	Trr-read	Trr - branje	t
00030000-5699-10c4-d884-ec7ccdb2582f	Trr-write	Trr - spreminjanje	t
00030000-5699-10c4-127f-0674d9b5d448	Uprizoritev-read	Uprizoritev - branje	t
00030000-5699-10c4-4920-c5e89de13309	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5699-10c4-ba52-a90f09996660	Vaja-read	Vaja - branje	t
00030000-5699-10c4-2035-5bb621b65a0f	Vaja-write	Vaja - spreminjanje	t
00030000-5699-10c4-80f2-3b84c988b5f6	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5699-10c4-5e1b-2e0fc4159835	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5699-10c4-1f0a-a0b6ca2d1b66	VrstaStroska-read	VrstaStroska - branje	t
00030000-5699-10c4-9dcf-82745b3acf21	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5699-10c4-2a34-3256156d736c	Zaposlitev-read	Zaposlitev - branje	t
00030000-5699-10c4-943e-66628f5e49dd	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5699-10c4-9278-1ed026b729c4	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5699-10c4-74d2-092669740d98	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5699-10c4-0aa7-f5161261facb	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5699-10c4-e7f3-89b3dc0818b1	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5699-10c4-ef09-8e26dddcd8f6	Job-read	Branje opravil - samo zase - branje	t
00030000-5699-10c4-b698-6c03edbe3c8a	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5699-10c4-dfec-ba641c6981f6	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5699-10c4-d994-eb661bae22c8	Report-read	Report - branje	t
00030000-5699-10c4-2015-2069b0ead33a	Report-write	Report - spreminjanje	t
00030000-5699-10c4-c162-856c9ff24027	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5699-10c4-9d7a-6a8553630b03	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5699-10c4-1d84-c7e83ba2dbc5	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5699-10c4-86c8-694fb68916ad	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5699-10c4-f142-4030cb3decdd	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5699-10c4-1bab-14392ce98ea4	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5699-10c4-a67d-03a854ca5507	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5699-10c4-cc93-dd5e53adb938	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5699-10c4-a714-9db80e2ef4c2	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5699-10c4-9f90-ba8f286c3f28	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5699-10c4-3271-ec531405e8b0	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5699-10c4-90a0-7af3d7b83382	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5699-10c4-8097-e50245818aaf	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5699-10c4-76db-64638a7853fa	Datoteka-write	Datoteka - spreminjanje	t
00030000-5699-10c4-92fe-a6a08a5ee0d7	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3145 (class 0 OID 37078314)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5699-10c4-5d6e-91e5108c6265	00030000-5699-10c4-f179-4ebc48a49ccd
00020000-5699-10c4-5d6e-91e5108c6265	00030000-5699-10c4-afb0-28b487c17dcc
00020000-5699-10c4-25f4-ceee4525ed97	00030000-5699-10c4-3ef8-652a7543a469
00020000-5699-10c4-865e-ee337600070c	00030000-5699-10c4-8651-a6271b9da989
00020000-5699-10c4-865e-ee337600070c	00030000-5699-10c4-31d1-72198c6bedfd
00020000-5699-10c4-865e-ee337600070c	00030000-5699-10c4-76db-64638a7853fa
00020000-5699-10c4-865e-ee337600070c	00030000-5699-10c4-450e-ef274a4495bd
00020000-5699-10c4-865e-ee337600070c	00030000-5699-10c4-cc93-dd5e53adb938
00020000-5699-10c4-865e-ee337600070c	00030000-5699-10c4-9f90-ba8f286c3f28
00020000-5699-10c4-865e-ee337600070c	00030000-5699-10c4-6ac6-f33f877dc45a
00020000-5699-10c4-865e-ee337600070c	00030000-5699-10c4-a342-e02f3b68529f
00020000-5699-10c4-865e-ee337600070c	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c4-865e-ee337600070c	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c4-865e-ee337600070c	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c4-865e-ee337600070c	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c4-4316-a60e621b3b25	00030000-5699-10c4-6ac6-f33f877dc45a
00020000-5699-10c4-4316-a60e621b3b25	00030000-5699-10c4-a342-e02f3b68529f
00020000-5699-10c4-4316-a60e621b3b25	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c4-4316-a60e621b3b25	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c4-4316-a60e621b3b25	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c4-4316-a60e621b3b25	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c4-fc7e-fdb32d3a2e1c	00030000-5699-10c4-2a34-3256156d736c
00020000-5699-10c4-fc7e-fdb32d3a2e1c	00030000-5699-10c4-943e-66628f5e49dd
00020000-5699-10c4-fc7e-fdb32d3a2e1c	00030000-5699-10c4-24d3-15c893c54b01
00020000-5699-10c4-fc7e-fdb32d3a2e1c	00030000-5699-10c4-df1a-3847562df9f0
00020000-5699-10c4-fc7e-fdb32d3a2e1c	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c4-fc7e-fdb32d3a2e1c	00030000-5699-10c4-450e-ef274a4495bd
00020000-5699-10c4-fc7e-fdb32d3a2e1c	00030000-5699-10c4-08c2-52d68d385bf2
00020000-5699-10c4-d4c6-783baa78243b	00030000-5699-10c4-2a34-3256156d736c
00020000-5699-10c4-d4c6-783baa78243b	00030000-5699-10c4-24d3-15c893c54b01
00020000-5699-10c4-d4c6-783baa78243b	00030000-5699-10c4-08c2-52d68d385bf2
00020000-5699-10c4-1130-3486a696b560	00030000-5699-10c4-450e-ef274a4495bd
00020000-5699-10c4-1130-3486a696b560	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c4-1130-3486a696b560	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c4-1130-3486a696b560	00030000-5699-10c4-76db-64638a7853fa
00020000-5699-10c4-1130-3486a696b560	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c4-1130-3486a696b560	00030000-5699-10c4-9f90-ba8f286c3f28
00020000-5699-10c4-1130-3486a696b560	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c4-1130-3486a696b560	00030000-5699-10c4-cc93-dd5e53adb938
00020000-5699-10c4-0646-2a0668a53787	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c4-0646-2a0668a53787	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c4-0646-2a0668a53787	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c4-0646-2a0668a53787	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c4-e72b-b5bdc397633b	00030000-5699-10c4-450e-ef274a4495bd
00020000-5699-10c4-e72b-b5bdc397633b	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c4-e72b-b5bdc397633b	00030000-5699-10c4-24d3-15c893c54b01
00020000-5699-10c4-e72b-b5bdc397633b	00030000-5699-10c4-df1a-3847562df9f0
00020000-5699-10c4-e72b-b5bdc397633b	00030000-5699-10c4-0c94-5db87154997b
00020000-5699-10c4-e72b-b5bdc397633b	00030000-5699-10c4-d884-ec7ccdb2582f
00020000-5699-10c4-e72b-b5bdc397633b	00030000-5699-10c4-5faa-7c197829e42c
00020000-5699-10c4-e72b-b5bdc397633b	00030000-5699-10c4-b397-aca4775738bf
00020000-5699-10c4-e72b-b5bdc397633b	00030000-5699-10c4-d509-e5ee92744d1c
00020000-5699-10c4-e72b-b5bdc397633b	00030000-5699-10c4-278e-22ad23852eee
00020000-5699-10c4-e72b-b5bdc397633b	00030000-5699-10c4-3ef8-652a7543a469
00020000-5699-10c4-e72b-b5bdc397633b	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c4-5444-0f81cf48ba9c	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c4-5444-0f81cf48ba9c	00030000-5699-10c4-24d3-15c893c54b01
00020000-5699-10c4-5444-0f81cf48ba9c	00030000-5699-10c4-0c94-5db87154997b
00020000-5699-10c4-5444-0f81cf48ba9c	00030000-5699-10c4-5faa-7c197829e42c
00020000-5699-10c4-5444-0f81cf48ba9c	00030000-5699-10c4-d509-e5ee92744d1c
00020000-5699-10c4-5444-0f81cf48ba9c	00030000-5699-10c4-3ef8-652a7543a469
00020000-5699-10c4-5444-0f81cf48ba9c	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-d509-e5ee92744d1c
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-5faa-7c197829e42c
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-0c94-5db87154997b
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-47a7-f9861b8fdff2
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-dcf2-3a607ab7ea20
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-29bd-3018cd5eab01
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-278e-22ad23852eee
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-b397-aca4775738bf
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-cc93-dd5e53adb938
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-d884-ec7ccdb2582f
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-9ad1-1b2c0e916442
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-76db-64638a7853fa
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-9f90-ba8f286c3f28
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-a58e-2cabc5db6652
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-6d77-ea638af0a70f
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-3ef8-652a7543a469
00020000-5699-10c4-3780-dd2539dccafb	00030000-5699-10c4-aad9-2eca806d0aa0
00020000-5699-10c4-97b6-00bec1122e43	00030000-5699-10c4-d509-e5ee92744d1c
00020000-5699-10c4-97b6-00bec1122e43	00030000-5699-10c4-5faa-7c197829e42c
00020000-5699-10c4-97b6-00bec1122e43	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c4-97b6-00bec1122e43	00030000-5699-10c4-0c94-5db87154997b
00020000-5699-10c4-97b6-00bec1122e43	00030000-5699-10c4-47a7-f9861b8fdff2
00020000-5699-10c4-97b6-00bec1122e43	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c4-97b6-00bec1122e43	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c4-97b6-00bec1122e43	00030000-5699-10c4-dcf2-3a607ab7ea20
00020000-5699-10c4-97b6-00bec1122e43	00030000-5699-10c4-29bd-3018cd5eab01
00020000-5699-10c4-97b6-00bec1122e43	00030000-5699-10c4-3ef8-652a7543a469
00020000-5699-10c4-97b6-00bec1122e43	00030000-5699-10c4-aad9-2eca806d0aa0
00020000-5699-10c4-b268-0caf76137207	00030000-5699-10c4-aad9-2eca806d0aa0
00020000-5699-10c4-b268-0caf76137207	00030000-5699-10c4-c4da-84fdff501b73
00020000-5699-10c4-bd4a-f02033c85243	00030000-5699-10c4-aad9-2eca806d0aa0
00020000-5699-10c4-0d14-1841605df896	00030000-5699-10c4-5038-33b8fcbff2ca
00020000-5699-10c4-0d14-1841605df896	00030000-5699-10c4-2a52-a02693dedcdb
00020000-5699-10c4-1d7c-a988becf4dfb	00030000-5699-10c4-5038-33b8fcbff2ca
00020000-5699-10c4-5a3a-e72cac560c5a	00030000-5699-10c4-3ef8-652a7543a469
00020000-5699-10c4-5a3a-e72cac560c5a	00030000-5699-10c4-f0a6-b72ab5a9ca26
00020000-5699-10c4-37c3-4f631b7e5b6f	00030000-5699-10c4-3ef8-652a7543a469
00020000-5699-10c4-8f64-67d2d451e836	00030000-5699-10c4-0aa7-f5161261facb
00020000-5699-10c4-8f64-67d2d451e836	00030000-5699-10c4-e7f3-89b3dc0818b1
00020000-5699-10c4-4f05-391f79641105	00030000-5699-10c4-0aa7-f5161261facb
00020000-5699-10c4-bb86-ba6a1d3497a8	00030000-5699-10c4-9278-1ed026b729c4
00020000-5699-10c4-bb86-ba6a1d3497a8	00030000-5699-10c4-74d2-092669740d98
00020000-5699-10c4-7554-02d92b5fb9c1	00030000-5699-10c4-9278-1ed026b729c4
00020000-5699-10c4-c275-92bf881b3838	00030000-5699-10c4-5c0f-8315949e7217
00020000-5699-10c4-c275-92bf881b3838	00030000-5699-10c4-c35f-626119e098e0
00020000-5699-10c4-a739-f2ea930acb14	00030000-5699-10c4-5c0f-8315949e7217
00020000-5699-10c4-4f39-e2ade935c246	00030000-5699-10c4-ff69-dde1bfd9a1c2
00020000-5699-10c4-4f39-e2ade935c246	00030000-5699-10c4-068f-0961b0bbe96e
00020000-5699-10c4-4f39-e2ade935c246	00030000-5699-10c4-47a7-f9861b8fdff2
00020000-5699-10c4-4f39-e2ade935c246	00030000-5699-10c4-5faa-7c197829e42c
00020000-5699-10c4-4f39-e2ade935c246	00030000-5699-10c4-b397-aca4775738bf
00020000-5699-10c4-4f39-e2ade935c246	00030000-5699-10c4-3ef8-652a7543a469
00020000-5699-10c4-caa6-dcdd4e026467	00030000-5699-10c4-ff69-dde1bfd9a1c2
00020000-5699-10c4-caa6-dcdd4e026467	00030000-5699-10c4-47a7-f9861b8fdff2
00020000-5699-10c4-caa6-dcdd4e026467	00030000-5699-10c4-5faa-7c197829e42c
00020000-5699-10c4-1135-666b1c51b5ab	00030000-5699-10c4-1f0a-a0b6ca2d1b66
00020000-5699-10c4-1135-666b1c51b5ab	00030000-5699-10c4-9dcf-82745b3acf21
00020000-5699-10c4-d188-674d0d0abe3f	00030000-5699-10c4-1f0a-a0b6ca2d1b66
00020000-5699-10c4-8737-481a3573c84d	00030000-5699-10c4-ef86-b92d0a0f7d91
00020000-5699-10c4-8737-481a3573c84d	00030000-5699-10c4-08c2-52d68d385bf2
00020000-5699-10c4-8737-481a3573c84d	00030000-5699-10c4-2a34-3256156d736c
00020000-5699-10c4-8737-481a3573c84d	00030000-5699-10c4-76db-64638a7853fa
00020000-5699-10c4-8737-481a3573c84d	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c4-8737-481a3573c84d	00030000-5699-10c4-cc93-dd5e53adb938
00020000-5699-10c4-8737-481a3573c84d	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c4-8737-481a3573c84d	00030000-5699-10c4-9f90-ba8f286c3f28
00020000-5699-10c4-8737-481a3573c84d	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c4-8fa2-b321ebb7a8eb	00030000-5699-10c4-08c2-52d68d385bf2
00020000-5699-10c4-8fa2-b321ebb7a8eb	00030000-5699-10c4-2a34-3256156d736c
00020000-5699-10c4-8fa2-b321ebb7a8eb	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c4-8fa2-b321ebb7a8eb	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c4-8fa2-b321ebb7a8eb	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c4-cbb5-10520819b645	00030000-5699-10c4-f51b-ee4803b62c77
00020000-5699-10c4-cbb5-10520819b645	00030000-5699-10c4-cc57-20ea75a086f7
00020000-5699-10c4-f8f3-5734ff2f84a0	00030000-5699-10c4-f51b-ee4803b62c77
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-8537-12e22b05c5d5
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-9d8e-6fd5c50c359c
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-00c5-e7f314a29c91
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-f562-36e0b9682b73
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-17d7-84dbaa917440
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-79d8-c99996e61cd4
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-dc74-eaa0488a9972
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-9a4c-7600528b6499
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-bf13-cabfa19428d3
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-a937-65a7de6c02d2
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-80af-2b12fcbf645a
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-b6fd-a6eeddfd1173
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-c243-1406246a5563
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-84bd-42cfa12ff636
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-b06a-b023260b2af2
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-a26a-2a98c55de10b
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-9012-83356594485c
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-fbb6-4d6d700eec7f
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-a656-15a0861fa88b
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-e545-cc44138ebcb7
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-4560-59b36629c893
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-2b6f-95aca5a28205
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-3bde-7febc255edc9
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-a54c-8430b191e123
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-b02b-dfe644dca41f
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-b698-6c03edbe3c8a
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-4298-bb7876993f52
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-47ab-d6c0bc022fb9
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-29bd-3018cd5eab01
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-129c-d5304b170132
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-1f0a-a0b6ca2d1b66
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-127f-0674d9b5d448
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-debe-c01019bd6a26
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-69e7-6031350893cb
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-ceba-8d2bc9b8027a
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-9b7c-e6a2bdb556f9
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-5eaf-fd53ec4ae53c
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-3ef8-652a7543a469
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-47a7-f9861b8fdff2
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-76db-64638a7853fa
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-cc93-dd5e53adb938
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-9f90-ba8f286c3f28
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-ef09-8e26dddcd8f6
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c4-67ca-1d34a0d8d157	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c4-f317-c5c07ec06664	00030000-5699-10c4-00c5-e7f314a29c91
00020000-5699-10c4-f317-c5c07ec06664	00030000-5699-10c4-17d7-84dbaa917440
00020000-5699-10c4-f317-c5c07ec06664	00030000-5699-10c4-dc74-eaa0488a9972
00020000-5699-10c4-f317-c5c07ec06664	00030000-5699-10c4-bf13-cabfa19428d3
00020000-5699-10c4-f317-c5c07ec06664	00030000-5699-10c4-80af-2b12fcbf645a
00020000-5699-10c4-f317-c5c07ec06664	00030000-5699-10c4-c243-1406246a5563
00020000-5699-10c4-f317-c5c07ec06664	00030000-5699-10c4-b06a-b023260b2af2
00020000-5699-10c4-f317-c5c07ec06664	00030000-5699-10c4-9012-83356594485c
00020000-5699-10c4-f317-c5c07ec06664	00030000-5699-10c4-a656-15a0861fa88b
00020000-5699-10c4-f317-c5c07ec06664	00030000-5699-10c4-4560-59b36629c893
00020000-5699-10c4-f317-c5c07ec06664	00030000-5699-10c4-47ab-d6c0bc022fb9
00020000-5699-10c4-f317-c5c07ec06664	00030000-5699-10c4-4298-bb7876993f52
00020000-5699-10c4-f317-c5c07ec06664	00030000-5699-10c4-129c-d5304b170132
00020000-5699-10c4-f317-c5c07ec06664	00030000-5699-10c4-3ef8-652a7543a469
00020000-5699-10c4-f317-c5c07ec06664	00030000-5699-10c4-ef09-8e26dddcd8f6
00020000-5699-10c4-f317-c5c07ec06664	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c4-f317-c5c07ec06664	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c4-f317-c5c07ec06664	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c4-6b36-ec5c72e7fad5	00030000-5699-10c4-127f-0674d9b5d448
00020000-5699-10c4-6b36-ec5c72e7fad5	00030000-5699-10c4-4920-c5e89de13309
00020000-5699-10c4-6b36-ec5c72e7fad5	00030000-5699-10c4-ceba-8d2bc9b8027a
00020000-5699-10c4-6b36-ec5c72e7fad5	00030000-5699-10c4-f385-25c38855960b
00020000-5699-10c4-6b36-ec5c72e7fad5	00030000-5699-10c4-357c-4b98af1f3b3c
00020000-5699-10c4-6b36-ec5c72e7fad5	00030000-5699-10c4-a342-e02f3b68529f
00020000-5699-10c4-6b36-ec5c72e7fad5	00030000-5699-10c4-69e7-6031350893cb
00020000-5699-10c4-6b36-ec5c72e7fad5	00030000-5699-10c4-6249-7ae150730157
00020000-5699-10c4-6b36-ec5c72e7fad5	00030000-5699-10c4-3e22-aa722615e7e7
00020000-5699-10c4-6b36-ec5c72e7fad5	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c4-6b36-ec5c72e7fad5	00030000-5699-10c4-29bd-3018cd5eab01
00020000-5699-10c4-6b36-ec5c72e7fad5	00030000-5699-10c4-9b7c-e6a2bdb556f9
00020000-5699-10c4-6b36-ec5c72e7fad5	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c4-6b36-ec5c72e7fad5	00030000-5699-10c4-76db-64638a7853fa
00020000-5699-10c4-6b36-ec5c72e7fad5	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c4-6b36-ec5c72e7fad5	00030000-5699-10c4-cc93-dd5e53adb938
00020000-5699-10c4-6b36-ec5c72e7fad5	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c4-6b36-ec5c72e7fad5	00030000-5699-10c4-9f90-ba8f286c3f28
00020000-5699-10c4-0929-1f763551c834	00030000-5699-10c4-127f-0674d9b5d448
00020000-5699-10c4-0929-1f763551c834	00030000-5699-10c4-ceba-8d2bc9b8027a
00020000-5699-10c4-0929-1f763551c834	00030000-5699-10c4-a342-e02f3b68529f
00020000-5699-10c4-0929-1f763551c834	00030000-5699-10c4-69e7-6031350893cb
00020000-5699-10c4-0929-1f763551c834	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c4-0929-1f763551c834	00030000-5699-10c4-29bd-3018cd5eab01
00020000-5699-10c4-0929-1f763551c834	00030000-5699-10c4-9b7c-e6a2bdb556f9
00020000-5699-10c4-0929-1f763551c834	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c4-0929-1f763551c834	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c4-0929-1f763551c834	00030000-5699-10c4-cc93-dd5e53adb938
00020000-5699-10c4-0929-1f763551c834	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c4-f6d9-e40cc70829d8	00030000-5699-10c4-ceba-8d2bc9b8027a
00020000-5699-10c4-f6d9-e40cc70829d8	00030000-5699-10c4-f385-25c38855960b
00020000-5699-10c4-f6d9-e40cc70829d8	00030000-5699-10c4-69e7-6031350893cb
00020000-5699-10c4-f6d9-e40cc70829d8	00030000-5699-10c4-6249-7ae150730157
00020000-5699-10c4-f6d9-e40cc70829d8	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c4-f6d9-e40cc70829d8	00030000-5699-10c4-9b7c-e6a2bdb556f9
00020000-5699-10c4-f6d9-e40cc70829d8	00030000-5699-10c4-127f-0674d9b5d448
00020000-5699-10c4-f6d9-e40cc70829d8	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c4-8d46-770c1e161a4c	00030000-5699-10c4-ceba-8d2bc9b8027a
00020000-5699-10c4-8d46-770c1e161a4c	00030000-5699-10c4-f385-25c38855960b
00020000-5699-10c4-8d46-770c1e161a4c	00030000-5699-10c4-357c-4b98af1f3b3c
00020000-5699-10c4-8d46-770c1e161a4c	00030000-5699-10c4-69e7-6031350893cb
00020000-5699-10c4-8d46-770c1e161a4c	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c4-8d46-770c1e161a4c	00030000-5699-10c4-24d3-15c893c54b01
00020000-5699-10c4-8d46-770c1e161a4c	00030000-5699-10c4-df1a-3847562df9f0
00020000-5699-10c4-8d46-770c1e161a4c	00030000-5699-10c4-5eaf-fd53ec4ae53c
00020000-5699-10c4-8d46-770c1e161a4c	00030000-5699-10c4-d417-1965f744f29e
00020000-5699-10c4-8d46-770c1e161a4c	00030000-5699-10c4-47a7-f9861b8fdff2
00020000-5699-10c4-8d46-770c1e161a4c	00030000-5699-10c4-29bd-3018cd5eab01
00020000-5699-10c4-8d46-770c1e161a4c	00030000-5699-10c4-debe-c01019bd6a26
00020000-5699-10c4-8d46-770c1e161a4c	00030000-5699-10c4-9349-809a89cb68bc
00020000-5699-10c4-8d46-770c1e161a4c	00030000-5699-10c4-9b7c-e6a2bdb556f9
00020000-5699-10c4-8d46-770c1e161a4c	00030000-5699-10c4-0c94-5db87154997b
00020000-5699-10c4-8d46-770c1e161a4c	00030000-5699-10c4-127f-0674d9b5d448
00020000-5699-10c4-8d46-770c1e161a4c	00030000-5699-10c4-2a34-3256156d736c
00020000-5699-10c4-bdbf-b20c5322bcca	00030000-5699-10c4-ceba-8d2bc9b8027a
00020000-5699-10c4-bdbf-b20c5322bcca	00030000-5699-10c4-69e7-6031350893cb
00020000-5699-10c4-bdbf-b20c5322bcca	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c4-bdbf-b20c5322bcca	00030000-5699-10c4-24d3-15c893c54b01
00020000-5699-10c4-bdbf-b20c5322bcca	00030000-5699-10c4-5eaf-fd53ec4ae53c
00020000-5699-10c4-bdbf-b20c5322bcca	00030000-5699-10c4-47a7-f9861b8fdff2
00020000-5699-10c4-bdbf-b20c5322bcca	00030000-5699-10c4-29bd-3018cd5eab01
00020000-5699-10c4-bdbf-b20c5322bcca	00030000-5699-10c4-debe-c01019bd6a26
00020000-5699-10c4-bdbf-b20c5322bcca	00030000-5699-10c4-9b7c-e6a2bdb556f9
00020000-5699-10c4-bdbf-b20c5322bcca	00030000-5699-10c4-0c94-5db87154997b
00020000-5699-10c4-bdbf-b20c5322bcca	00030000-5699-10c4-127f-0674d9b5d448
00020000-5699-10c4-bdbf-b20c5322bcca	00030000-5699-10c4-2a34-3256156d736c
00020000-5699-10c4-658a-7e46e1566a7c	00030000-5699-10c4-debe-c01019bd6a26
00020000-5699-10c4-658a-7e46e1566a7c	00030000-5699-10c4-127f-0674d9b5d448
00020000-5699-10c4-658a-7e46e1566a7c	00030000-5699-10c4-69e7-6031350893cb
00020000-5699-10c4-658a-7e46e1566a7c	00030000-5699-10c4-5eaf-fd53ec4ae53c
00020000-5699-10c4-658a-7e46e1566a7c	00030000-5699-10c4-29bd-3018cd5eab01
00020000-5699-10c4-658a-7e46e1566a7c	00030000-5699-10c4-9b7c-e6a2bdb556f9
00020000-5699-10c4-658a-7e46e1566a7c	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c4-4573-73e0f51a2b5e	00030000-5699-10c4-debe-c01019bd6a26
00020000-5699-10c4-4573-73e0f51a2b5e	00030000-5699-10c4-9349-809a89cb68bc
00020000-5699-10c4-4573-73e0f51a2b5e	00030000-5699-10c4-127f-0674d9b5d448
00020000-5699-10c4-4573-73e0f51a2b5e	00030000-5699-10c4-47a7-f9861b8fdff2
00020000-5699-10c4-7de1-9e8fd9afa931	00030000-5699-10c4-debe-c01019bd6a26
00020000-5699-10c4-7de1-9e8fd9afa931	00030000-5699-10c4-127f-0674d9b5d448
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-5c0f-8315949e7217
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-ceba-8d2bc9b8027a
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-f385-25c38855960b
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-357c-4b98af1f3b3c
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-6ac6-f33f877dc45a
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-8651-a6271b9da989
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-a342-e02f3b68529f
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-31d1-72198c6bedfd
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-76db-64638a7853fa
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-4298-bb7876993f52
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-a54c-8430b191e123
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-3ef8-652a7543a469
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-69e7-6031350893cb
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-6249-7ae150730157
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-3e22-aa722615e7e7
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-ef09-8e26dddcd8f6
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-b698-6c03edbe3c8a
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-dcf2-3a607ab7ea20
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-08c2-52d68d385bf2
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-450e-ef274a4495bd
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-24d3-15c893c54b01
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-df1a-3847562df9f0
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-5eaf-fd53ec4ae53c
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-d417-1965f744f29e
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-47a7-f9861b8fdff2
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-5038-33b8fcbff2ca
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-129c-d5304b170132
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-b02b-dfe644dca41f
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-5faa-7c197829e42c
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-47ab-d6c0bc022fb9
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-3bde-7febc255edc9
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-29bd-3018cd5eab01
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-8537-12e22b05c5d5
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-00c5-e7f314a29c91
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-9d8e-6fd5c50c359c
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-f562-36e0b9682b73
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-17d7-84dbaa917440
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-79d8-c99996e61cd4
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-dc74-eaa0488a9972
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-9a4c-7600528b6499
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-bf13-cabfa19428d3
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-a937-65a7de6c02d2
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-80af-2b12fcbf645a
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-b6fd-a6eeddfd1173
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-c243-1406246a5563
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-84bd-42cfa12ff636
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-b06a-b023260b2af2
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-a26a-2a98c55de10b
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-9012-83356594485c
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-fbb6-4d6d700eec7f
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-a656-15a0861fa88b
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-e545-cc44138ebcb7
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-4560-59b36629c893
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-2b6f-95aca5a28205
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-ff69-dde1bfd9a1c2
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-debe-c01019bd6a26
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-9349-809a89cb68bc
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-d509-e5ee92744d1c
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-9b7c-e6a2bdb556f9
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-aad9-2eca806d0aa0
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-f51b-ee4803b62c77
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-0c94-5db87154997b
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-127f-0674d9b5d448
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-4920-c5e89de13309
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-1f0a-a0b6ca2d1b66
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-9f90-ba8f286c3f28
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-cc93-dd5e53adb938
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-2a34-3256156d736c
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-9278-1ed026b729c4
00020000-5699-10c4-685f-74a35ecb1f76	00030000-5699-10c4-0aa7-f5161261facb
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-5c0f-8315949e7217
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-ceba-8d2bc9b8027a
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-6ac6-f33f877dc45a
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-8651-a6271b9da989
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-a342-e02f3b68529f
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-31d1-72198c6bedfd
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-76db-64638a7853fa
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-3ef8-652a7543a469
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-69e7-6031350893cb
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-dcf2-3a607ab7ea20
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-08c2-52d68d385bf2
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-450e-ef274a4495bd
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-24d3-15c893c54b01
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-47a7-f9861b8fdff2
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-5038-33b8fcbff2ca
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-5faa-7c197829e42c
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-29bd-3018cd5eab01
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-ff69-dde1bfd9a1c2
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-d509-e5ee92744d1c
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-9b7c-e6a2bdb556f9
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-aad9-2eca806d0aa0
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-f51b-ee4803b62c77
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-0c94-5db87154997b
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-127f-0674d9b5d448
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-1f0a-a0b6ca2d1b66
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-9f90-ba8f286c3f28
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-cc93-dd5e53adb938
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-2a34-3256156d736c
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-9278-1ed026b729c4
00020000-5699-10c4-3e7b-c973d874f6c7	00030000-5699-10c4-0aa7-f5161261facb
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-5c0f-8315949e7217
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-ceba-8d2bc9b8027a
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-f385-25c38855960b
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-357c-4b98af1f3b3c
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-6ac6-f33f877dc45a
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-8651-a6271b9da989
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-a342-e02f3b68529f
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-31d1-72198c6bedfd
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-76db-64638a7853fa
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-3ef8-652a7543a469
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-69e7-6031350893cb
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-6249-7ae150730157
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-3e22-aa722615e7e7
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-dcf2-3a607ab7ea20
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-08c2-52d68d385bf2
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-450e-ef274a4495bd
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-24d3-15c893c54b01
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-47a7-f9861b8fdff2
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-5038-33b8fcbff2ca
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-5faa-7c197829e42c
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-29bd-3018cd5eab01
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-ff69-dde1bfd9a1c2
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-d509-e5ee92744d1c
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-9b7c-e6a2bdb556f9
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-aad9-2eca806d0aa0
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-f51b-ee4803b62c77
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-0c94-5db87154997b
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-127f-0674d9b5d448
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-4920-c5e89de13309
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-1f0a-a0b6ca2d1b66
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-9f90-ba8f286c3f28
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-cc93-dd5e53adb938
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-2a34-3256156d736c
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-9278-1ed026b729c4
00020000-5699-10c4-adcc-d0b34cbba6bb	00030000-5699-10c4-0aa7-f5161261facb
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-ceba-8d2bc9b8027a
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-f385-25c38855960b
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-357c-4b98af1f3b3c
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-6ac6-f33f877dc45a
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-8651-a6271b9da989
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-a342-e02f3b68529f
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-31d1-72198c6bedfd
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-76db-64638a7853fa
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-4298-bb7876993f52
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-a54c-8430b191e123
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-3ef8-652a7543a469
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-69e7-6031350893cb
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-6249-7ae150730157
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-3e22-aa722615e7e7
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-ef09-8e26dddcd8f6
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-b698-6c03edbe3c8a
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-dcf2-3a607ab7ea20
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-a58e-2cabc5db6652
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-08c2-52d68d385bf2
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-450e-ef274a4495bd
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-24d3-15c893c54b01
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-df1a-3847562df9f0
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-5eaf-fd53ec4ae53c
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-d417-1965f744f29e
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-47a7-f9861b8fdff2
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-9ad1-1b2c0e916442
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-5038-33b8fcbff2ca
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-129c-d5304b170132
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-b02b-dfe644dca41f
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-5faa-7c197829e42c
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-b397-aca4775738bf
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-47ab-d6c0bc022fb9
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-3bde-7febc255edc9
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-29bd-3018cd5eab01
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-6d77-ea638af0a70f
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-8537-12e22b05c5d5
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-00c5-e7f314a29c91
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-9d8e-6fd5c50c359c
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-f562-36e0b9682b73
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-17d7-84dbaa917440
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-79d8-c99996e61cd4
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-dc74-eaa0488a9972
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-9a4c-7600528b6499
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-bf13-cabfa19428d3
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-a937-65a7de6c02d2
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-80af-2b12fcbf645a
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-b6fd-a6eeddfd1173
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-c243-1406246a5563
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-84bd-42cfa12ff636
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-b06a-b023260b2af2
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-a26a-2a98c55de10b
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-9012-83356594485c
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-fbb6-4d6d700eec7f
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-a656-15a0861fa88b
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-e545-cc44138ebcb7
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-4560-59b36629c893
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-2b6f-95aca5a28205
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-ff69-dde1bfd9a1c2
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-debe-c01019bd6a26
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-9349-809a89cb68bc
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-d509-e5ee92744d1c
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-278e-22ad23852eee
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-9b7c-e6a2bdb556f9
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-aad9-2eca806d0aa0
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-0c94-5db87154997b
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-d884-ec7ccdb2582f
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-127f-0674d9b5d448
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-4920-c5e89de13309
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-1f0a-a0b6ca2d1b66
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-9f90-ba8f286c3f28
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-cc93-dd5e53adb938
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-2a34-3256156d736c
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-943e-66628f5e49dd
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-9278-1ed026b729c4
00020000-5699-10c4-b4b8-2751f36c5631	00030000-5699-10c4-0aa7-f5161261facb
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-5c0f-8315949e7217
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-ceba-8d2bc9b8027a
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-f385-25c38855960b
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-357c-4b98af1f3b3c
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-6ac6-f33f877dc45a
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-8651-a6271b9da989
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-a342-e02f3b68529f
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-31d1-72198c6bedfd
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-76db-64638a7853fa
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-3ef8-652a7543a469
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-69e7-6031350893cb
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-6249-7ae150730157
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-3e22-aa722615e7e7
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-dcf2-3a607ab7ea20
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-a58e-2cabc5db6652
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-08c2-52d68d385bf2
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-450e-ef274a4495bd
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-24d3-15c893c54b01
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-df1a-3847562df9f0
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-5eaf-fd53ec4ae53c
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-47a7-f9861b8fdff2
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-9ad1-1b2c0e916442
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-5038-33b8fcbff2ca
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-5faa-7c197829e42c
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-b397-aca4775738bf
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-29bd-3018cd5eab01
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-6d77-ea638af0a70f
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-ff69-dde1bfd9a1c2
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-debe-c01019bd6a26
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-d509-e5ee92744d1c
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-278e-22ad23852eee
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-9b7c-e6a2bdb556f9
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-aad9-2eca806d0aa0
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-f51b-ee4803b62c77
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-0c94-5db87154997b
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-d884-ec7ccdb2582f
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-127f-0674d9b5d448
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-4920-c5e89de13309
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-1f0a-a0b6ca2d1b66
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-9f90-ba8f286c3f28
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-cc93-dd5e53adb938
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-2a34-3256156d736c
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-943e-66628f5e49dd
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-9278-1ed026b729c4
00020000-5699-10c4-55aa-30ab0b6f415e	00030000-5699-10c4-0aa7-f5161261facb
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-5c0f-8315949e7217
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-ceba-8d2bc9b8027a
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-f385-25c38855960b
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-6ac6-f33f877dc45a
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-a342-e02f3b68529f
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-3ef8-652a7543a469
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-69e7-6031350893cb
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-6249-7ae150730157
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-dcf2-3a607ab7ea20
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-08c2-52d68d385bf2
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-24d3-15c893c54b01
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-5eaf-fd53ec4ae53c
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-47a7-f9861b8fdff2
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-5038-33b8fcbff2ca
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-5faa-7c197829e42c
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-29bd-3018cd5eab01
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-ff69-dde1bfd9a1c2
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-debe-c01019bd6a26
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-d509-e5ee92744d1c
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-9b7c-e6a2bdb556f9
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-aad9-2eca806d0aa0
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-f51b-ee4803b62c77
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-0c94-5db87154997b
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-127f-0674d9b5d448
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-1f0a-a0b6ca2d1b66
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-2a34-3256156d736c
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-9278-1ed026b729c4
00020000-5699-10c5-ed00-c7963c67bd85	00030000-5699-10c4-0aa7-f5161261facb
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-5c0f-8315949e7217
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-ceba-8d2bc9b8027a
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-f385-25c38855960b
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-357c-4b98af1f3b3c
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-a342-e02f3b68529f
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-76db-64638a7853fa
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-4298-bb7876993f52
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-a54c-8430b191e123
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-3ef8-652a7543a469
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-69e7-6031350893cb
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-ef09-8e26dddcd8f6
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-b698-6c03edbe3c8a
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-dcf2-3a607ab7ea20
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-a58e-2cabc5db6652
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-08c2-52d68d385bf2
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-ef86-b92d0a0f7d91
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-450e-ef274a4495bd
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-24d3-15c893c54b01
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-df1a-3847562df9f0
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-5eaf-fd53ec4ae53c
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-d417-1965f744f29e
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-47a7-f9861b8fdff2
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-9ad1-1b2c0e916442
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-5038-33b8fcbff2ca
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-129c-d5304b170132
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-b02b-dfe644dca41f
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-5faa-7c197829e42c
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-b397-aca4775738bf
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-47ab-d6c0bc022fb9
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-3bde-7febc255edc9
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-29bd-3018cd5eab01
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-6d77-ea638af0a70f
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-8537-12e22b05c5d5
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-00c5-e7f314a29c91
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-9d8e-6fd5c50c359c
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-f562-36e0b9682b73
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-17d7-84dbaa917440
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-79d8-c99996e61cd4
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-dc74-eaa0488a9972
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-9a4c-7600528b6499
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-bf13-cabfa19428d3
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-a937-65a7de6c02d2
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-80af-2b12fcbf645a
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-b6fd-a6eeddfd1173
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-c243-1406246a5563
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-84bd-42cfa12ff636
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-b06a-b023260b2af2
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-a26a-2a98c55de10b
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-9012-83356594485c
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-fbb6-4d6d700eec7f
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-a656-15a0861fa88b
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-e545-cc44138ebcb7
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-4560-59b36629c893
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-2b6f-95aca5a28205
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-ff69-dde1bfd9a1c2
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-debe-c01019bd6a26
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-9349-809a89cb68bc
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-d509-e5ee92744d1c
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-278e-22ad23852eee
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-9b7c-e6a2bdb556f9
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-aad9-2eca806d0aa0
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-f51b-ee4803b62c77
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-0c94-5db87154997b
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-d884-ec7ccdb2582f
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-127f-0674d9b5d448
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-1f0a-a0b6ca2d1b66
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-9dcf-82745b3acf21
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-9f90-ba8f286c3f28
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-cc93-dd5e53adb938
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-2a34-3256156d736c
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-943e-66628f5e49dd
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-9278-1ed026b729c4
00020000-5699-10c5-2106-acc80b95a105	00030000-5699-10c4-0aa7-f5161261facb
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-afb0-28b487c17dcc
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-f179-4ebc48a49ccd
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-5c0f-8315949e7217
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-c35f-626119e098e0
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-ceba-8d2bc9b8027a
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-357c-4b98af1f3b3c
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-f385-25c38855960b
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-cecb-dcf8aa02ce2e
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-3e01-d4918c1e7404
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-8c8d-2eb22a161d72
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-8edf-3e5d396f15cc
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-6ac6-f33f877dc45a
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-8651-a6271b9da989
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-a342-e02f3b68529f
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-31d1-72198c6bedfd
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-76db-64638a7853fa
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-43d0-70769de7a3d2
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-a108-3869e76b2a30
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-899a-0bede31c7929
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-06f0-e5631ec7bb12
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-0693-f81fddbb127b
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-4735-4e9dc176bd21
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-0f56-4d3e5d3a8d47
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-2897-263d7aa4fbff
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-fff8-d0bf2ad09769
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-4298-bb7876993f52
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-a54c-8430b191e123
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-3ef8-652a7543a469
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-f0a6-b72ab5a9ca26
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-8145-9a187986cf82
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-f75e-474a54a6cde7
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-69e7-6031350893cb
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-3e22-aa722615e7e7
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-6249-7ae150730157
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-8d71-3c35c2a27a8a
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-b513-c65ad7c8c2b2
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-dfec-ba641c6981f6
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-ef09-8e26dddcd8f6
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-b698-6c03edbe3c8a
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-dcf2-3a607ab7ea20
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-a58e-2cabc5db6652
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-29d8-013f3843e365
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-775f-b642d70e1d41
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-a67d-03a854ca5507
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-1bab-14392ce98ea4
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-9d7a-6a8553630b03
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-1d84-c7e83ba2dbc5
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-86c8-694fb68916ad
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-f142-4030cb3decdd
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-294e-a21aa00b3ee8
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-1cb1-4b835e55e127
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-f02a-769258a26e43
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-1ba4-4818d9e0d3b5
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-0309-eade13fde92a
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-09da-7d1c573778cb
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-08c2-52d68d385bf2
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-ef86-b92d0a0f7d91
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-450e-ef274a4495bd
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-24d3-15c893c54b01
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-df1a-3847562df9f0
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-595f-596b2202fab3
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-576b-22d1e9d598a1
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-b8c9-d599a45493ab
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-200c-f323d7f18a67
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-5eaf-fd53ec4ae53c
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-d417-1965f744f29e
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-47a7-f9861b8fdff2
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-9ad1-1b2c0e916442
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-5038-33b8fcbff2ca
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-129c-d5304b170132
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-b02b-dfe644dca41f
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-c235-62dcf9621648
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-9cd6-55ed4d832a76
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-2a52-a02693dedcdb
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-5faa-7c197829e42c
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-b397-aca4775738bf
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-5678-73b318d638f4
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-ae96-23c044e25968
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-152e-358272f2f25c
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-3485-42d3d978f63a
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-2e62-fdcbce0c6f6e
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-d964-61243242ed8e
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-47ab-d6c0bc022fb9
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-3bde-7febc255edc9
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-29bd-3018cd5eab01
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-6d77-ea638af0a70f
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-8537-12e22b05c5d5
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-00c5-e7f314a29c91
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-9d8e-6fd5c50c359c
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-f562-36e0b9682b73
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-17d7-84dbaa917440
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-79d8-c99996e61cd4
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-dc74-eaa0488a9972
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-9a4c-7600528b6499
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-bf13-cabfa19428d3
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-a937-65a7de6c02d2
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-80af-2b12fcbf645a
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-b6fd-a6eeddfd1173
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-c243-1406246a5563
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-84bd-42cfa12ff636
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-b06a-b023260b2af2
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-a26a-2a98c55de10b
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-9012-83356594485c
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-fbb6-4d6d700eec7f
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-a656-15a0861fa88b
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-e545-cc44138ebcb7
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-4560-59b36629c893
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-2b6f-95aca5a28205
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-ff69-dde1bfd9a1c2
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-068f-0961b0bbe96e
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-999c-37926c28753e
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-9851-2499cdb7d34b
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-8dc9-07bd7226801e
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-cd81-d8f5f28078a9
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-1659-aefa5e49d6e6
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-809e-932a8d40b0f7
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-9fa3-c725d6e3ecdf
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-436b-d8da9086819b
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-d994-eb661bae22c8
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-2015-2069b0ead33a
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-f0e2-563b4334ee0f
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-bc98-d22a39af5fcf
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-f221-d86db360e6ca
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-9c00-8b7e9dcc59e7
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-5b65-84483773075c
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-e8b0-6e5fc14b98cd
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-efd0-cdc586e3234f
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-99b5-fb134be956f1
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-31a9-c847ac07b92a
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-1fc7-dc7ad7aac648
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-c162-856c9ff24027
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-debe-c01019bd6a26
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-9349-809a89cb68bc
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-d509-e5ee92744d1c
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-278e-22ad23852eee
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-9141-7eb244656492
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-102b-342d256315c7
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-8fd2-a26c92c26bba
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-9b7c-e6a2bdb556f9
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-4b06-c1eded47ce7f
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-aad9-2eca806d0aa0
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-c4da-84fdff501b73
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-29bf-b9b3d0066681
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-648d-e0c590b590b6
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-f51b-ee4803b62c77
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-cc57-20ea75a086f7
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-0c94-5db87154997b
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-d884-ec7ccdb2582f
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-127f-0674d9b5d448
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-4920-c5e89de13309
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-ba52-a90f09996660
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-2035-5bb621b65a0f
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-80f2-3b84c988b5f6
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-5e1b-2e0fc4159835
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-1f0a-a0b6ca2d1b66
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-9dcf-82745b3acf21
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-8097-e50245818aaf
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-90a0-7af3d7b83382
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-9f90-ba8f286c3f28
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-cc93-dd5e53adb938
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-2a34-3256156d736c
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-943e-66628f5e49dd
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-9278-1ed026b729c4
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-74d2-092669740d98
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-0aa7-f5161261facb
00020000-5699-10c6-3fe0-c9cd8496c29b	00030000-5699-10c4-e7f3-89b3dc0818b1
00020000-5699-10c6-8807-04e7df099b16	00030000-5699-10c4-3271-ec531405e8b0
00020000-5699-10c6-47b5-daa34e374694	00030000-5699-10c4-9f90-ba8f286c3f28
00020000-5699-10c6-8c27-b7ab29a7d58a	00030000-5699-10c4-4920-c5e89de13309
00020000-5699-10c6-c926-ef30d8ea0b33	00030000-5699-10c4-127f-0674d9b5d448
00020000-5699-10c6-e623-402c3ed5c00f	00030000-5699-10c4-1d84-c7e83ba2dbc5
00020000-5699-10c6-59a3-4463ad0e2415	00030000-5699-10c4-86c8-694fb68916ad
00020000-5699-10c6-f388-0fde4c1a6f46	00030000-5699-10c4-f142-4030cb3decdd
00020000-5699-10c6-1fdc-855db0ca5fc2	00030000-5699-10c4-9d7a-6a8553630b03
00020000-5699-10c6-28ab-9031d178f2bf	00030000-5699-10c4-a67d-03a854ca5507
00020000-5699-10c6-9e71-b3e75defc290	00030000-5699-10c4-1bab-14392ce98ea4
00020000-5699-10c6-4fad-2c2ca8af1fb0	00030000-5699-10c4-a714-9db80e2ef4c2
00020000-5699-10c6-a302-7e9aaf77b0c5	00030000-5699-10c4-cc93-dd5e53adb938
00020000-5699-10c6-72e4-2ae05610a5a1	00030000-5699-10c4-2272-011edee4829f
00020000-5699-10c6-4c73-632285826f56	00030000-5699-10c4-450e-ef274a4495bd
00020000-5699-10c6-eb17-3d829686ffc1	00030000-5699-10c4-df1a-3847562df9f0
00020000-5699-10c6-43d6-c9cc450f0c6b	00030000-5699-10c4-24d3-15c893c54b01
00020000-5699-10c6-78a2-9c785b7870c8	00030000-5699-10c4-76db-64638a7853fa
00020000-5699-10c6-fc6f-22ffceda808d	00030000-5699-10c4-92fe-a6a08a5ee0d7
00020000-5699-10c6-a5a6-ec9c29e5bd42	00030000-5699-10c4-47a7-f9861b8fdff2
00020000-5699-10c6-a5a6-ec9c29e5bd42	00030000-5699-10c4-9ad1-1b2c0e916442
00020000-5699-10c6-a5a6-ec9c29e5bd42	00030000-5699-10c4-127f-0674d9b5d448
00020000-5699-10c6-8fa2-d843e52c238c	00030000-5699-10c4-0c94-5db87154997b
00020000-5699-10c6-6afb-66f95ff368c6	00030000-5699-10c4-d884-ec7ccdb2582f
00020000-5699-10c6-b362-2e0fcb5fb549	00030000-5699-10c4-c162-856c9ff24027
00020000-5699-10c6-db99-7fe0ff1224cb	00030000-5699-10c4-d509-e5ee92744d1c
00020000-5699-10c6-21f3-2f90008a2c6f	00030000-5699-10c4-278e-22ad23852eee
00020000-5699-10c6-ca27-b691ceddd436	00030000-5699-10c4-5faa-7c197829e42c
00020000-5699-10c6-3090-1f1b90af2eba	00030000-5699-10c4-b397-aca4775738bf
00020000-5699-10c6-2f5a-3aa42310d3ff	00030000-5699-10c4-2a34-3256156d736c
00020000-5699-10c6-c451-b6998a0f8d10	00030000-5699-10c4-943e-66628f5e49dd
00020000-5699-10c6-6e34-600c20d6c495	00030000-5699-10c4-5eaf-fd53ec4ae53c
00020000-5699-10c6-6a98-acc7d14ffe80	00030000-5699-10c4-d417-1965f744f29e
00020000-5699-10c6-2b49-cfe55e9832d4	00030000-5699-10c4-debe-c01019bd6a26
00020000-5699-10c6-9ddf-a13da1df8a2e	00030000-5699-10c4-9349-809a89cb68bc
00020000-5699-10c6-f53e-f67b10e48027	00030000-5699-10c4-ceba-8d2bc9b8027a
00020000-5699-10c6-b772-fbb5a02cd382	00030000-5699-10c4-f385-25c38855960b
00020000-5699-10c6-1b75-97357b8aaa08	00030000-5699-10c4-357c-4b98af1f3b3c
00020000-5699-10c6-a360-eab7e2c7d322	00030000-5699-10c4-69e7-6031350893cb
00020000-5699-10c6-70bf-6b2ccba198f4	00030000-5699-10c4-6249-7ae150730157
00020000-5699-10c6-9ef2-208ea18aba76	00030000-5699-10c4-3e22-aa722615e7e7
\.


--
-- TOC entry 3184 (class 0 OID 37078714)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3188 (class 0 OID 37078748)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3200 (class 0 OID 37078881)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5699-10c7-b357-40330b7a40c2	00090000-5699-10c7-ef11-4aacc01cba68	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5699-10c7-2f0e-8c14e554d666	00090000-5699-10c7-4717-51d7a7d858b1	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5699-10c7-ec79-4e54da3a35ad	00090000-5699-10c7-ab60-127a5f189250	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5699-10c7-e4c7-eb3e66fdc800	00090000-5699-10c7-9377-26191dd715a1	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3153 (class 0 OID 37078396)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5699-10c7-58a7-07a3a843b987	\N	00040000-5699-10c4-0bee-1c000b55d0cb	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5699-10c7-f3af-08f13522b600	\N	00040000-5699-10c4-0bee-1c000b55d0cb	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5699-10c7-6ad1-23523cfefeb5	\N	00040000-5699-10c4-0bee-1c000b55d0cb	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5699-10c7-f6aa-4317f46e9605	\N	00040000-5699-10c4-0bee-1c000b55d0cb	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5699-10c7-5e32-6b7befe4a56c	\N	00040000-5699-10c4-0bee-1c000b55d0cb	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5699-10c7-9491-b24be10e6e9f	\N	00040000-5699-10c4-8c93-96f773f14c56	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5699-10c7-0863-ed86e3ab59cc	\N	00040000-5699-10c4-4cd1-4d1b0bda68bf	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5699-10c7-71f9-9ef11649b31e	\N	00040000-5699-10c4-ee8e-b2cecb745137	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5699-10c7-9e99-de99e4ee83c2	\N	00040000-5699-10c4-a183-fcfe4817d27e	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5699-10c8-41c5-12c67ce60db5	\N	00040000-5699-10c4-0bee-1c000b55d0cb	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3156 (class 0 OID 37078441)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5699-10c3-6a8b-8423ab77b659	8341	Adlešiči
00050000-5699-10c3-d9a6-5c75da6df49e	5270	Ajdovščina
00050000-5699-10c3-119a-142c0f225802	6280	Ankaran/Ancarano
00050000-5699-10c3-1a3d-3aecc110abd3	9253	Apače
00050000-5699-10c3-55db-33aa0b761ad3	8253	Artiče
00050000-5699-10c3-5a3c-dd61a6b64056	4275	Begunje na Gorenjskem
00050000-5699-10c3-d26f-6be86f4c2ce7	1382	Begunje pri Cerknici
00050000-5699-10c3-269e-52adda05309b	9231	Beltinci
00050000-5699-10c3-4d0e-f6be5a81080e	2234	Benedikt
00050000-5699-10c3-d4a8-058e834abcf2	2345	Bistrica ob Dravi
00050000-5699-10c3-4307-ee9f19e6642f	3256	Bistrica ob Sotli
00050000-5699-10c3-e31b-869ac9daa1b4	8259	Bizeljsko
00050000-5699-10c3-9816-8ddcb8b3f171	1223	Blagovica
00050000-5699-10c3-93f1-827b3d198c34	8283	Blanca
00050000-5699-10c3-36eb-9c75cd98cfa5	4260	Bled
00050000-5699-10c3-aeef-cd2c0fd8d269	4273	Blejska Dobrava
00050000-5699-10c3-7c10-ac6e66f19206	9265	Bodonci
00050000-5699-10c3-f0c3-004b2b64034c	9222	Bogojina
00050000-5699-10c3-8a8c-3c2f030f3622	4263	Bohinjska Bela
00050000-5699-10c3-de1c-50460b6fe84c	4264	Bohinjska Bistrica
00050000-5699-10c3-a7b4-7ca1bdd1f602	4265	Bohinjsko jezero
00050000-5699-10c3-44a3-6c4611f47919	1353	Borovnica
00050000-5699-10c3-be04-e2017724f5d8	8294	Boštanj
00050000-5699-10c3-b600-fcc736cf1db0	5230	Bovec
00050000-5699-10c3-3dc5-13783757c678	5295	Branik
00050000-5699-10c3-b8bf-ac4c71a4e809	3314	Braslovče
00050000-5699-10c3-bcaf-0d9c53f46456	5223	Breginj
00050000-5699-10c3-8614-a3e0c3544f54	8280	Brestanica
00050000-5699-10c3-fc02-6e0b777bf4ba	2354	Bresternica
00050000-5699-10c3-a96f-38fcdbfe4e68	4243	Brezje
00050000-5699-10c3-56d9-ed55d338283d	1351	Brezovica pri Ljubljani
00050000-5699-10c3-751e-be3eb65c3e4f	8250	Brežice
00050000-5699-10c3-733c-f17d4cd1ffd7	4210	Brnik - Aerodrom
00050000-5699-10c3-4441-6c64a9b95f30	8321	Brusnice
00050000-5699-10c3-a0e9-cd9ed3703a61	3255	Buče
00050000-5699-10c3-d3e2-a68762fcd305	8276	Bučka 
00050000-5699-10c3-9ca4-b6e74d6ebb35	9261	Cankova
00050000-5699-10c3-9319-1fa9f2875d2c	3000	Celje 
00050000-5699-10c3-8e62-daae4c2b6dc0	3001	Celje - poštni predali
00050000-5699-10c3-a86d-414561b67ac4	4207	Cerklje na Gorenjskem
00050000-5699-10c3-2073-0058f26bb44e	8263	Cerklje ob Krki
00050000-5699-10c3-1137-a72211ce5dba	1380	Cerknica
00050000-5699-10c3-0b8d-035dfa51cf7a	5282	Cerkno
00050000-5699-10c3-1b74-8187ed8ee376	2236	Cerkvenjak
00050000-5699-10c3-96b4-1b4eeb82d59e	2215	Ceršak
00050000-5699-10c3-a66b-01858be16e3c	2326	Cirkovce
00050000-5699-10c3-9d9d-210e0c226244	2282	Cirkulane
00050000-5699-10c3-71b1-07bda413c38f	5273	Col
00050000-5699-10c3-364a-c816ce904b07	8251	Čatež ob Savi
00050000-5699-10c3-0ba8-6f25630264fc	1413	Čemšenik
00050000-5699-10c3-330c-a49c729db9a9	5253	Čepovan
00050000-5699-10c3-a164-af06ab38f0cd	9232	Črenšovci
00050000-5699-10c3-c518-4214d6c9ee84	2393	Črna na Koroškem
00050000-5699-10c3-a168-f6697db3178f	6275	Črni Kal
00050000-5699-10c3-3261-560261e16b86	5274	Črni Vrh nad Idrijo
00050000-5699-10c3-2c6e-2e14a70b4cb5	5262	Črniče
00050000-5699-10c3-6dfa-da031507f199	8340	Črnomelj
00050000-5699-10c3-7eb6-27656b173d3a	6271	Dekani
00050000-5699-10c3-6341-fdabed697a10	5210	Deskle
00050000-5699-10c3-fe96-ed73c548b6eb	2253	Destrnik
00050000-5699-10c3-fcc3-57e51b8ff8d7	6215	Divača
00050000-5699-10c3-ea43-9887ff622cb7	1233	Dob
00050000-5699-10c3-b0cd-1ee9072835dd	3224	Dobje pri Planini
00050000-5699-10c3-0110-c9ba4d29150e	8257	Dobova
00050000-5699-10c3-2605-6c32bad36997	1423	Dobovec
00050000-5699-10c3-4371-faed267da887	5263	Dobravlje
00050000-5699-10c3-ca01-a829d8969f4a	3204	Dobrna
00050000-5699-10c3-141a-2fcbf6882a8b	8211	Dobrnič
00050000-5699-10c3-045e-c38d28bec848	1356	Dobrova
00050000-5699-10c3-610b-5e273a1af32c	9223	Dobrovnik/Dobronak 
00050000-5699-10c3-428a-efa30ebccce3	5212	Dobrovo v Brdih
00050000-5699-10c3-e40a-2299d4c29f8a	1431	Dol pri Hrastniku
00050000-5699-10c3-bb55-95f938437ab1	1262	Dol pri Ljubljani
00050000-5699-10c3-f45c-bb4d22de27fd	1273	Dole pri Litiji
00050000-5699-10c3-16f9-d3bd69cd7a1e	1331	Dolenja vas
00050000-5699-10c3-00f3-77f8cfcd4da9	8350	Dolenjske Toplice
00050000-5699-10c3-0d1d-0805eb161d77	1230	Domžale
00050000-5699-10c3-58a1-0177a0e050ff	2252	Dornava
00050000-5699-10c3-a340-156e8e0970ff	5294	Dornberk
00050000-5699-10c3-63d8-e4149fb7b1c2	1319	Draga
00050000-5699-10c3-7e52-c9e60831e69e	8343	Dragatuš
00050000-5699-10c3-a863-d026c32f3e4e	3222	Dramlje
00050000-5699-10c3-7739-9c3f7e7be244	2370	Dravograd
00050000-5699-10c3-d774-27acb7dca491	4203	Duplje
00050000-5699-10c3-ab11-fa57d5bd29d3	6221	Dutovlje
00050000-5699-10c3-2d24-37da727180ae	8361	Dvor
00050000-5699-10c3-b53e-7d701c46a72b	2343	Fala
00050000-5699-10c3-0989-6e5dd6a2aeaa	9208	Fokovci
00050000-5699-10c3-c750-8f178832cd4f	2313	Fram
00050000-5699-10c3-2a80-916ebf7c0b10	3213	Frankolovo
00050000-5699-10c3-944d-0eace0fc38b6	1274	Gabrovka
00050000-5699-10c3-4b83-204b59e6e9be	8254	Globoko
00050000-5699-10c3-ca2d-a77209773629	5275	Godovič
00050000-5699-10c3-684b-924e30895ca8	4204	Golnik
00050000-5699-10c3-3e3f-8a7aa5f6dba0	3303	Gomilsko
00050000-5699-10c3-d9af-28c69b4d6fe2	4224	Gorenja vas
00050000-5699-10c3-dada-addeb2489bfd	3263	Gorica pri Slivnici
00050000-5699-10c3-b236-a7fc3ff8f5b4	2272	Gorišnica
00050000-5699-10c3-2048-17e0e42ace23	9250	Gornja Radgona
00050000-5699-10c3-dd8f-3b0c65910e1d	3342	Gornji Grad
00050000-5699-10c3-1352-72da61945f7f	4282	Gozd Martuljek
00050000-5699-10c3-79f3-4a15a1f1bce9	6272	Gračišče
00050000-5699-10c3-fd31-1cf2aa3f6e6b	9264	Grad
00050000-5699-10c3-6cb8-2fba5460edbb	8332	Gradac
00050000-5699-10c3-f9a2-1cbccdd754c2	1384	Grahovo
00050000-5699-10c3-e222-e7204371bbb4	5242	Grahovo ob Bači
00050000-5699-10c3-99c1-bcce9b49ed27	5251	Grgar
00050000-5699-10c3-3e4b-e1b34312225d	3302	Griže
00050000-5699-10c3-9959-8a2067f158a8	3231	Grobelno
00050000-5699-10c3-b6bc-8656cc5d2bce	1290	Grosuplje
00050000-5699-10c3-728f-f9e0ac6933c5	2288	Hajdina
00050000-5699-10c3-d229-8f897e5010d8	8362	Hinje
00050000-5699-10c3-2898-bc9136b0d685	2311	Hoče
00050000-5699-10c3-e866-dd3276cf4920	9205	Hodoš/Hodos
00050000-5699-10c3-2d79-8ae50692722b	1354	Horjul
00050000-5699-10c3-6a77-ddd27628bc2e	1372	Hotedršica
00050000-5699-10c3-e8c0-c3cf947c4947	1430	Hrastnik
00050000-5699-10c3-ceb7-d59a570637b7	6225	Hruševje
00050000-5699-10c3-2681-f1a10ecb6d79	4276	Hrušica
00050000-5699-10c3-d949-7e8b1c511360	5280	Idrija
00050000-5699-10c3-67b6-a8b8da6d3d7a	1292	Ig
00050000-5699-10c3-60b4-9d1cdce26f4e	6250	Ilirska Bistrica
00050000-5699-10c3-135a-f260fbe7c9a4	6251	Ilirska Bistrica-Trnovo
00050000-5699-10c3-a980-c71dc6e47eb1	1295	Ivančna Gorica
00050000-5699-10c3-a5f2-920facd0d051	2259	Ivanjkovci
00050000-5699-10c3-5ffa-4ddf7a9c6639	1411	Izlake
00050000-5699-10c3-e5b2-eec06b5c6b15	6310	Izola/Isola
00050000-5699-10c3-ab34-938a1e607deb	2222	Jakobski Dol
00050000-5699-10c3-20b2-6d5207859f58	2221	Jarenina
00050000-5699-10c3-2876-828a12c6735d	6254	Jelšane
00050000-5699-10c3-4e02-f6ca6887b9ac	4270	Jesenice
00050000-5699-10c3-d02c-261e698033c1	8261	Jesenice na Dolenjskem
00050000-5699-10c3-8b58-7edb5e0a1fa8	3273	Jurklošter
00050000-5699-10c3-cdc4-14ea4b9e1501	2223	Jurovski Dol
00050000-5699-10c3-74da-e6abdd48afd9	2256	Juršinci
00050000-5699-10c3-7a5c-bec75ba4dd50	5214	Kal nad Kanalom
00050000-5699-10c3-bf52-6a7587dbf878	3233	Kalobje
00050000-5699-10c3-a570-0910d0122873	4246	Kamna Gorica
00050000-5699-10c3-7670-14edeeeae830	2351	Kamnica
00050000-5699-10c3-15c2-02b75dfca67d	1241	Kamnik
00050000-5699-10c3-7e6b-0000e5f239c9	5213	Kanal
00050000-5699-10c3-0bf0-9a42be32d7a6	8258	Kapele
00050000-5699-10c3-a2f5-90a31ecc1505	2362	Kapla
00050000-5699-10c3-a5f2-1a5c49a8c650	2325	Kidričevo
00050000-5699-10c3-1da1-a88d3bf23090	1412	Kisovec
00050000-5699-10c3-9a36-1bc6fee73f98	6253	Knežak
00050000-5699-10c3-609b-999769f9d2c4	5222	Kobarid
00050000-5699-10c3-e60b-870325165cad	9227	Kobilje
00050000-5699-10c3-b5ee-233d34796f64	1330	Kočevje
00050000-5699-10c3-33c4-b2946f35b5fe	1338	Kočevska Reka
00050000-5699-10c3-4dc0-5ddee13c4bee	2276	Kog
00050000-5699-10c3-a214-7fb8c9846078	5211	Kojsko
00050000-5699-10c3-446e-d5de8e64a62e	6223	Komen
00050000-5699-10c3-0a52-c037fcda3450	1218	Komenda
00050000-5699-10c3-a579-13ffc51fabbe	6000	Koper/Capodistria 
00050000-5699-10c3-7e06-1968465d8764	6001	Koper/Capodistria - poštni predali
00050000-5699-10c3-fc3d-dc4b320c7e3d	8282	Koprivnica
00050000-5699-10c3-8558-d44465bcc15f	5296	Kostanjevica na Krasu
00050000-5699-10c3-d103-34e0df5eee3c	8311	Kostanjevica na Krki
00050000-5699-10c3-f2dc-b389c345a7fa	1336	Kostel
00050000-5699-10c3-45f5-0d6c8f172664	6256	Košana
00050000-5699-10c3-b803-9b6d8269d549	2394	Kotlje
00050000-5699-10c3-5188-0917e6141bda	6240	Kozina
00050000-5699-10c3-77e4-06f2c0df6135	3260	Kozje
00050000-5699-10c3-9c9b-cdd202da688d	4000	Kranj 
00050000-5699-10c3-ad30-e09c8c3ea001	4001	Kranj - poštni predali
00050000-5699-10c3-e708-af61da2aa2ca	4280	Kranjska Gora
00050000-5699-10c3-6b15-e6631c2de584	1281	Kresnice
00050000-5699-10c3-459e-e35915abdc32	4294	Križe
00050000-5699-10c3-d229-80c906ccf7c5	9206	Križevci
00050000-5699-10c3-5261-75f3fc452cb0	9242	Križevci pri Ljutomeru
00050000-5699-10c3-f1f2-2c073ef23cf1	1301	Krka
00050000-5699-10c3-a6ac-cff7f8ff7a1f	8296	Krmelj
00050000-5699-10c3-5f14-9464cbd5546b	4245	Kropa
00050000-5699-10c3-50ed-89cbcd97de75	8262	Krška vas
00050000-5699-10c3-abc3-831e0fb37a79	8270	Krško
00050000-5699-10c3-078d-878157a8307f	9263	Kuzma
00050000-5699-10c3-eab9-1f87a10e04e5	2318	Laporje
00050000-5699-10c3-b3fd-620f5d488cac	3270	Laško
00050000-5699-10c3-d891-3e1b16f6091e	1219	Laze v Tuhinju
00050000-5699-10c3-2464-4ef2c16dc84d	2230	Lenart v Slovenskih goricah
00050000-5699-10c3-ef8a-de70bc73a351	9220	Lendava/Lendva
00050000-5699-10c3-52a4-7d4b8b8fdc5a	4248	Lesce
00050000-5699-10c3-d7ad-8e51fb573834	3261	Lesično
00050000-5699-10c3-7879-1465357c78c9	8273	Leskovec pri Krškem
00050000-5699-10c3-1660-f3e5b9fd336f	2372	Libeliče
00050000-5699-10c3-b9ef-3a613c7bb7ae	2341	Limbuš
00050000-5699-10c3-9fec-b4fa3ffae0a0	1270	Litija
00050000-5699-10c3-135a-92b591b59c92	3202	Ljubečna
00050000-5699-10c3-ee61-3ea7fb072e34	1000	Ljubljana 
00050000-5699-10c3-2071-445f01debd86	1001	Ljubljana - poštni predali
00050000-5699-10c3-60e9-4f888e05748f	1231	Ljubljana - Črnuče
00050000-5699-10c3-4daa-7bcc8ec3b94e	1261	Ljubljana - Dobrunje
00050000-5699-10c3-f009-e56598d9ed5b	1260	Ljubljana - Polje
00050000-5699-10c3-efa8-1f133dd40eed	1210	Ljubljana - Šentvid
00050000-5699-10c3-f89d-f0741c25f915	1211	Ljubljana - Šmartno
00050000-5699-10c3-5cb6-80a704410107	3333	Ljubno ob Savinji
00050000-5699-10c3-0190-b44c0853bd1f	9240	Ljutomer
00050000-5699-10c3-a48f-d84065acee83	3215	Loče
00050000-5699-10c3-9a5a-c996b23f834b	5231	Log pod Mangartom
00050000-5699-10c3-719d-250a021d1953	1358	Log pri Brezovici
00050000-5699-10c3-cfd8-8b4f58fe5c98	1370	Logatec
00050000-5699-10c3-1a01-415ef9ea9fbf	1371	Logatec
00050000-5699-10c3-908b-0a3c25ab684e	1434	Loka pri Zidanem Mostu
00050000-5699-10c3-9aa1-e712fec1c8d1	3223	Loka pri Žusmu
00050000-5699-10c3-65db-c1669d1d10d9	6219	Lokev
00050000-5699-10c3-a4ae-b80c41a8271f	1318	Loški Potok
00050000-5699-10c3-fd40-fc00bfa71cfb	2324	Lovrenc na Dravskem polju
00050000-5699-10c3-bc99-0beb43dc0160	2344	Lovrenc na Pohorju
00050000-5699-10c3-2886-27bf3d31fa74	3334	Luče
00050000-5699-10c3-defa-5343a0b3594e	1225	Lukovica
00050000-5699-10c3-d755-1dfe0d1976cc	9202	Mačkovci
00050000-5699-10c3-d1fa-57c082e83352	2322	Majšperk
00050000-5699-10c3-4b6d-266deced9a90	2321	Makole
00050000-5699-10c3-4fea-957e3044df99	9243	Mala Nedelja
00050000-5699-10c3-60cf-16d6eea279a6	2229	Malečnik
00050000-5699-10c3-7c5a-639bcc522060	6273	Marezige
00050000-5699-10c3-a72f-b5d2060a4b7d	2000	Maribor 
00050000-5699-10c3-f975-15f45078ac69	2001	Maribor - poštni predali
00050000-5699-10c3-bf52-f6f0723d0266	2206	Marjeta na Dravskem polju
00050000-5699-10c3-f8ba-08d52cb3f6f3	2281	Markovci
00050000-5699-10c3-f6de-c4c1163a1e4d	9221	Martjanci
00050000-5699-10c3-ff07-ea443995a6a5	6242	Materija
00050000-5699-10c3-a409-81c9754ead12	4211	Mavčiče
00050000-5699-10c3-0af3-947c49571a6d	1215	Medvode
00050000-5699-10c3-1868-f8dd6a09ade5	1234	Mengeš
00050000-5699-10c3-026b-752422b87ba9	8330	Metlika
00050000-5699-10c3-aa52-96105c99fe76	2392	Mežica
00050000-5699-10c3-3faa-4a1a2960a7a3	2204	Miklavž na Dravskem polju
00050000-5699-10c3-13ad-9a3d69dd7086	2275	Miklavž pri Ormožu
00050000-5699-10c3-3c75-4e848974e71d	5291	Miren
00050000-5699-10c3-a676-38a77a1f5202	8233	Mirna
00050000-5699-10c3-3c22-e0ec0debc099	8216	Mirna Peč
00050000-5699-10c3-97db-f0734c798639	2382	Mislinja
00050000-5699-10c3-1849-eb9c02bb8626	4281	Mojstrana
00050000-5699-10c3-5eee-5f65836219d5	8230	Mokronog
00050000-5699-10c3-8040-c8e830186a2f	1251	Moravče
00050000-5699-10c3-933b-050552dfa9aa	9226	Moravske Toplice
00050000-5699-10c3-52c3-72274f8ab7e9	5216	Most na Soči
00050000-5699-10c3-857b-37cc3c44c805	1221	Motnik
00050000-5699-10c3-2149-ad373829f718	3330	Mozirje
00050000-5699-10c3-dfc6-af89692fd227	9000	Murska Sobota 
00050000-5699-10c3-983e-65563406b18b	9001	Murska Sobota - poštni predali
00050000-5699-10c3-2665-607b442ae4f1	2366	Muta
00050000-5699-10c3-1fdc-838a985a8e3a	4202	Naklo
00050000-5699-10c3-b0d1-0121c8deb3c1	3331	Nazarje
00050000-5699-10c3-8173-f8dae4043046	1357	Notranje Gorice
00050000-5699-10c3-c8d8-cea8caf4321f	3203	Nova Cerkev
00050000-5699-10c3-b743-dfee7f34245b	5000	Nova Gorica 
00050000-5699-10c3-ddf3-089e81936393	5001	Nova Gorica - poštni predali
00050000-5699-10c3-6fb0-bfad7692be35	1385	Nova vas
00050000-5699-10c3-8a5b-f11cda9787b7	8000	Novo mesto
00050000-5699-10c3-4e26-e20527b084a3	8001	Novo mesto - poštni predali
00050000-5699-10c3-0d4b-ed1e0674706a	6243	Obrov
00050000-5699-10c3-134d-5c5f34aa9e71	9233	Odranci
00050000-5699-10c3-6ad1-62c54cb05ec7	2317	Oplotnica
00050000-5699-10c3-d37f-0eb2e7c61214	2312	Orehova vas
00050000-5699-10c3-2739-5636da8b8d3d	2270	Ormož
00050000-5699-10c3-0ead-cf2c8f472015	1316	Ortnek
00050000-5699-10c3-1faf-d1c410d74561	1337	Osilnica
00050000-5699-10c3-92e8-d9d14aa81422	8222	Otočec
00050000-5699-10c3-156b-07ca2d8a726a	2361	Ožbalt
00050000-5699-10c3-6d9c-7e64cf75298c	2231	Pernica
00050000-5699-10c3-68ef-f5dae4224e67	2211	Pesnica pri Mariboru
00050000-5699-10c3-97ca-e114e23b7eae	9203	Petrovci
00050000-5699-10c3-e80e-212eda8a56f1	3301	Petrovče
00050000-5699-10c3-6d79-33e45b4c9797	6330	Piran/Pirano
00050000-5699-10c3-50b7-dc65f3255908	8255	Pišece
00050000-5699-10c3-a7b0-7fabcea5f024	6257	Pivka
00050000-5699-10c3-def6-815ae38c3554	6232	Planina
00050000-5699-10c3-1d74-5af4309aae49	3225	Planina pri Sevnici
00050000-5699-10c3-1ee2-6314e5851b66	6276	Pobegi
00050000-5699-10c3-73b7-b56346cc6b5d	8312	Podbočje
00050000-5699-10c3-1fab-63589f3e3cf3	5243	Podbrdo
00050000-5699-10c3-4e41-dfc43e40d45b	3254	Podčetrtek
00050000-5699-10c3-b86a-192e35a61960	2273	Podgorci
00050000-5699-10c3-64b7-714670a4089a	6216	Podgorje
00050000-5699-10c3-6f13-034f1e438494	2381	Podgorje pri Slovenj Gradcu
00050000-5699-10c3-063e-2724903d9b2a	6244	Podgrad
00050000-5699-10c3-8367-4cd8b1300cf2	1414	Podkum
00050000-5699-10c3-e125-e7c36c876405	2286	Podlehnik
00050000-5699-10c3-e111-245e68786e83	5272	Podnanos
00050000-5699-10c3-4517-ec4061843550	4244	Podnart
00050000-5699-10c3-a5d4-2af655d50977	3241	Podplat
00050000-5699-10c3-64ab-fd38ad74d356	3257	Podsreda
00050000-5699-10c3-3c43-14dc01b266a0	2363	Podvelka
00050000-5699-10c3-6ae5-2a48506dbc3a	2208	Pohorje
00050000-5699-10c3-fdf0-e9dc493112fa	2257	Polenšak
00050000-5699-10c3-47d2-46a0593ee939	1355	Polhov Gradec
00050000-5699-10c3-0311-db4fff66ee8f	4223	Poljane nad Škofjo Loko
00050000-5699-10c3-359d-58c67e01d147	2319	Poljčane
00050000-5699-10c3-d75e-437fd866f765	1272	Polšnik
00050000-5699-10c3-5694-5e0137004813	3313	Polzela
00050000-5699-10c3-1e08-8dfff64c415d	3232	Ponikva
00050000-5699-10c3-2692-15045f8f534f	6320	Portorož/Portorose
00050000-5699-10c3-4131-df8ba2703b9c	6230	Postojna
00050000-5699-10c3-ace3-3bc1237b3725	2331	Pragersko
00050000-5699-10c3-361a-dab2479ad509	3312	Prebold
00050000-5699-10c3-863b-1ad3e617f71c	4205	Preddvor
00050000-5699-10c3-1cb2-920d6502b71f	6255	Prem
00050000-5699-10c3-6b65-6dbc9c961dee	1352	Preserje
00050000-5699-10c3-3671-b3ed1f9c7515	6258	Prestranek
00050000-5699-10c3-cd5e-3a0b72931a97	2391	Prevalje
00050000-5699-10c3-16df-12645dce9d0c	3262	Prevorje
00050000-5699-10c3-28d4-2c1c1ad3a5de	1276	Primskovo 
00050000-5699-10c3-285c-dae41aad29f0	3253	Pristava pri Mestinju
00050000-5699-10c3-3931-068fc5f20dec	9207	Prosenjakovci/Partosfalva
00050000-5699-10c3-99c6-2ffba120515f	5297	Prvačina
00050000-5699-10c3-03ff-4d6ab084d0ef	2250	Ptuj
00050000-5699-10c3-399a-d07521250435	2323	Ptujska Gora
00050000-5699-10c3-9c89-812b047ee141	9201	Puconci
00050000-5699-10c3-225f-a05911ff433b	2327	Rače
00050000-5699-10c3-2ded-d0cce977f4ae	1433	Radeče
00050000-5699-10c3-d19a-4f20ad4f7c1b	9252	Radenci
00050000-5699-10c3-8314-80839322add4	2360	Radlje ob Dravi
00050000-5699-10c3-0d1c-59e82c6491c1	1235	Radomlje
00050000-5699-10c3-dc26-d40bc2270c9a	4240	Radovljica
00050000-5699-10c3-2e02-a6b8cbce0465	8274	Raka
00050000-5699-10c3-33a6-7dc14db88440	1381	Rakek
00050000-5699-10c3-c348-95e78fdf4834	4283	Rateče - Planica
00050000-5699-10c3-e501-f77448ee465a	2390	Ravne na Koroškem
00050000-5699-10c3-89a6-c6d2c58bb063	9246	Razkrižje
00050000-5699-10c3-ce8c-d65c3810ba4d	3332	Rečica ob Savinji
00050000-5699-10c3-a8f7-78af7d9a6875	5292	Renče
00050000-5699-10c3-cef4-574e85b46062	1310	Ribnica
00050000-5699-10c3-551c-cb9e25a636a9	2364	Ribnica na Pohorju
00050000-5699-10c3-51af-11d1932c6565	3272	Rimske Toplice
00050000-5699-10c3-0f63-d7c88b57d64a	1314	Rob
00050000-5699-10c3-ec84-21435fae6b26	5215	Ročinj
00050000-5699-10c3-0a7d-a07918ff0a7e	3250	Rogaška Slatina
00050000-5699-10c3-86ef-bfc334a2abea	9262	Rogašovci
00050000-5699-10c3-6e38-04f68ea40560	3252	Rogatec
00050000-5699-10c3-49bd-e7c92c3ca995	1373	Rovte
00050000-5699-10c3-52df-f0b019428e20	2342	Ruše
00050000-5699-10c3-3ca6-ed16f850fb89	1282	Sava
00050000-5699-10c3-593f-7da2cb7e477c	6333	Sečovlje/Sicciole
00050000-5699-10c3-89e9-393c3c6cd63b	4227	Selca
00050000-5699-10c3-d7bf-7825f4195848	2352	Selnica ob Dravi
00050000-5699-10c3-bcd2-346aabcbabcf	8333	Semič
00050000-5699-10c3-b717-a2989b4019cb	8281	Senovo
00050000-5699-10c3-8f36-84679779e998	6224	Senožeče
00050000-5699-10c3-f5e0-4bbdf7d5f03d	8290	Sevnica
00050000-5699-10c3-2fe1-5d0f147ffb0a	6210	Sežana
00050000-5699-10c3-8805-b1b55e20bafb	2214	Sladki Vrh
00050000-5699-10c3-25ad-1ddb0f665704	5283	Slap ob Idrijci
00050000-5699-10c3-423b-ae9d958c96c4	2380	Slovenj Gradec
00050000-5699-10c3-6dca-d9f2461b3b70	2310	Slovenska Bistrica
00050000-5699-10c3-f9e8-3552ffa4bdee	3210	Slovenske Konjice
00050000-5699-10c3-a67e-5618ae0f2821	1216	Smlednik
00050000-5699-10c3-7ae9-43cf1d1d6158	5232	Soča
00050000-5699-10c3-1847-06a783e1e97c	1317	Sodražica
00050000-5699-10c3-fb9f-e040ef8cd3e6	3335	Solčava
00050000-5699-10c3-e850-d6d4e2bc3217	5250	Solkan
00050000-5699-10c3-2aaf-fee4f5616320	4229	Sorica
00050000-5699-10c3-908a-dfc1e61aa396	4225	Sovodenj
00050000-5699-10c3-af76-4479bdf1186a	5281	Spodnja Idrija
00050000-5699-10c3-9869-1a91beca09c9	2241	Spodnji Duplek
00050000-5699-10c3-570b-497e589b811d	9245	Spodnji Ivanjci
00050000-5699-10c3-87ab-680ad998e6e2	2277	Središče ob Dravi
00050000-5699-10c3-4a07-9d503eb014e7	4267	Srednja vas v Bohinju
00050000-5699-10c3-ae96-1321c856146d	8256	Sromlje 
00050000-5699-10c3-6963-0ef4057357c1	5224	Srpenica
00050000-5699-10c3-8cc2-bab622d22678	1242	Stahovica
00050000-5699-10c3-0fd1-b04cf6a3d55b	1332	Stara Cerkev
00050000-5699-10c3-ab63-ce073498f329	8342	Stari trg ob Kolpi
00050000-5699-10c3-bb8d-36bf25283e70	1386	Stari trg pri Ložu
00050000-5699-10c3-adbc-84b42abce217	2205	Starše
00050000-5699-10c3-f0c9-4cbb9d09f855	2289	Stoperce
00050000-5699-10c3-3e9b-609c1698cc27	8322	Stopiče
00050000-5699-10c3-aa2e-5e9ee1265359	3206	Stranice
00050000-5699-10c3-8534-ea503abcec3b	8351	Straža
00050000-5699-10c3-38eb-b0b68d997e08	1313	Struge
00050000-5699-10c3-1da3-1e193ad8ddb4	8293	Studenec
00050000-5699-10c3-6044-b1d6eec743e8	8331	Suhor
00050000-5699-10c3-51b7-2c237545c7e4	2233	Sv. Ana v Slovenskih goricah
00050000-5699-10c3-dc47-83480493af71	2235	Sv. Trojica v Slovenskih goricah
00050000-5699-10c3-617e-78f0069da74c	2353	Sveti Duh na Ostrem Vrhu
00050000-5699-10c3-2ecb-299132ab78f9	9244	Sveti Jurij ob Ščavnici
00050000-5699-10c3-e013-0d655bc113fa	3264	Sveti Štefan
00050000-5699-10c3-d858-b06b9ab8342a	2258	Sveti Tomaž
00050000-5699-10c3-3625-56dda32a3517	9204	Šalovci
00050000-5699-10c3-331c-22099d8922c4	5261	Šempas
00050000-5699-10c3-c8a3-ded2a27dfa9d	5290	Šempeter pri Gorici
00050000-5699-10c3-3162-1b4f8c86216d	3311	Šempeter v Savinjski dolini
00050000-5699-10c3-e409-feb4770e9e73	4208	Šenčur
00050000-5699-10c3-f099-e7ad1f09c4e0	2212	Šentilj v Slovenskih goricah
00050000-5699-10c3-e960-773049085e73	8297	Šentjanž
00050000-5699-10c3-476a-b8b7daca3ec4	2373	Šentjanž pri Dravogradu
00050000-5699-10c3-a1c1-1794b15afd45	8310	Šentjernej
00050000-5699-10c3-2f6f-91765e5d9e9d	3230	Šentjur
00050000-5699-10c3-2208-fa2d643f029b	3271	Šentrupert
00050000-5699-10c3-2652-6f711c128582	8232	Šentrupert
00050000-5699-10c3-2d87-840d8194742d	1296	Šentvid pri Stični
00050000-5699-10c3-0479-9e63537d95a6	8275	Škocjan
00050000-5699-10c3-8f18-2a4e05110a9b	6281	Škofije
00050000-5699-10c3-52f6-c2ae1f723a70	4220	Škofja Loka
00050000-5699-10c3-4972-a8588cdb525c	3211	Škofja vas
00050000-5699-10c3-da93-e9520f25e6b6	1291	Škofljica
00050000-5699-10c3-2025-6d7dcc8161c3	6274	Šmarje
00050000-5699-10c3-463b-8d200c60ac83	1293	Šmarje - Sap
00050000-5699-10c3-5c50-6ad1b3582b31	3240	Šmarje pri Jelšah
00050000-5699-10c3-586e-1faebf68efb2	8220	Šmarješke Toplice
00050000-5699-10c3-357f-a90e623b2bbb	2315	Šmartno na Pohorju
00050000-5699-10c3-9eaa-4bf42b034b70	3341	Šmartno ob Dreti
00050000-5699-10c3-38a6-bba1dcb7f51e	3327	Šmartno ob Paki
00050000-5699-10c3-a2ab-5a9de427025e	1275	Šmartno pri Litiji
00050000-5699-10c3-ef4a-581a8233db43	2383	Šmartno pri Slovenj Gradcu
00050000-5699-10c3-ebb2-8c115d26a75f	3201	Šmartno v Rožni dolini
00050000-5699-10c3-cebc-8b549a7df6ee	3325	Šoštanj
00050000-5699-10c3-9dfc-188849dfae44	6222	Štanjel
00050000-5699-10c3-a0cf-63607358f98d	3220	Štore
00050000-5699-10c3-183a-71c037b8571b	3304	Tabor
00050000-5699-10c3-57a4-54b104347c55	3221	Teharje
00050000-5699-10c3-a79f-658f89f68e14	9251	Tišina
00050000-5699-10c3-b5b8-72a65dda8946	5220	Tolmin
00050000-5699-10c3-9999-e1ecd312c33c	3326	Topolšica
00050000-5699-10c3-e1da-ae37de306b68	2371	Trbonje
00050000-5699-10c3-217c-a109164b6c09	1420	Trbovlje
00050000-5699-10c3-b7c3-158d7e67a2c2	8231	Trebelno 
00050000-5699-10c3-4070-9591f123822f	8210	Trebnje
00050000-5699-10c3-88d0-d840ae370f9c	5252	Trnovo pri Gorici
00050000-5699-10c3-4f12-c8b32b35542f	2254	Trnovska vas
00050000-5699-10c3-4be9-2416cfdd8922	1222	Trojane
00050000-5699-10c3-a9a3-696c9e7cf718	1236	Trzin
00050000-5699-10c3-5561-0e9d3d562c22	4290	Tržič
00050000-5699-10c3-db58-8254ab730cb9	8295	Tržišče
00050000-5699-10c3-be37-679b236df3f4	1311	Turjak
00050000-5699-10c3-fdff-4b22a9fa5388	9224	Turnišče
00050000-5699-10c3-236d-2d3875658b82	8323	Uršna sela
00050000-5699-10c3-67b7-a3bd2e304418	1252	Vače
00050000-5699-10c3-afb6-37b3447e8b35	3320	Velenje 
00050000-5699-10c3-53f9-9bfe345b252b	3322	Velenje - poštni predali
00050000-5699-10c3-e461-d63a1968a082	8212	Velika Loka
00050000-5699-10c3-e3e5-ee626c7d440d	2274	Velika Nedelja
00050000-5699-10c3-a7ae-9696c02c4ced	9225	Velika Polana
00050000-5699-10c3-27ea-221d450b48c2	1315	Velike Lašče
00050000-5699-10c3-b6f2-571275035134	8213	Veliki Gaber
00050000-5699-10c3-eaed-2f0c7fca52f2	9241	Veržej
00050000-5699-10c3-a08e-b6f9ed3ba2e2	1312	Videm - Dobrepolje
00050000-5699-10c3-21a6-4b629a65d6cf	2284	Videm pri Ptuju
00050000-5699-10c3-0282-d1204643e409	8344	Vinica
00050000-5699-10c3-1858-bd6894dc4968	5271	Vipava
00050000-5699-10c3-3c59-4e394e95795b	4212	Visoko
00050000-5699-10c3-b804-bb0890016a12	1294	Višnja Gora
00050000-5699-10c3-3769-3c0337a11537	3205	Vitanje
00050000-5699-10c3-d861-fbfa149cc86c	2255	Vitomarci
00050000-5699-10c3-c38e-47741af76703	1217	Vodice
00050000-5699-10c3-ec0d-c5d6a99d65d7	3212	Vojnik\t
00050000-5699-10c3-fe5a-37c2182bb1fc	5293	Volčja Draga
00050000-5699-10c3-102b-8f950ddbb6c3	2232	Voličina
00050000-5699-10c3-be38-bb71eb493716	3305	Vransko
00050000-5699-10c3-0a89-5abbd5b05d39	6217	Vremski Britof
00050000-5699-10c3-5d53-45a15a6543d0	1360	Vrhnika
00050000-5699-10c3-1ab1-76b6fa670ed5	2365	Vuhred
00050000-5699-10c3-6a6b-c24032b1199f	2367	Vuzenica
00050000-5699-10c3-9ee5-b9c464b33f14	8292	Zabukovje 
00050000-5699-10c3-0d36-e4c27618492b	1410	Zagorje ob Savi
00050000-5699-10c3-6060-f51a83181ed8	1303	Zagradec
00050000-5699-10c3-df7c-9d93ffbf840b	2283	Zavrč
00050000-5699-10c3-9ae8-204adebbd923	8272	Zdole 
00050000-5699-10c3-381a-c1337e58bb55	4201	Zgornja Besnica
00050000-5699-10c3-1e56-2a33d35229a1	2242	Zgornja Korena
00050000-5699-10c3-4cfd-fd8141ce1373	2201	Zgornja Kungota
00050000-5699-10c3-e916-6bbf577c040e	2316	Zgornja Ložnica
00050000-5699-10c3-c7a7-c90921471f1b	2314	Zgornja Polskava
00050000-5699-10c3-58fa-65d065b12676	2213	Zgornja Velka
00050000-5699-10c3-dda5-c4cd18bb7b04	4247	Zgornje Gorje
00050000-5699-10c3-f7ab-c5e776373d4d	4206	Zgornje Jezersko
00050000-5699-10c3-5c94-3b3b19dfc9cc	2285	Zgornji Leskovec
00050000-5699-10c3-5888-29ca082e0fae	1432	Zidani Most
00050000-5699-10c3-5828-9eb394f9e82c	3214	Zreče
00050000-5699-10c3-3787-09b5ad56dcca	4209	Žabnica
00050000-5699-10c3-55ee-54715cb08e52	3310	Žalec
00050000-5699-10c3-e93a-c7a56851566d	4228	Železniki
00050000-5699-10c3-c536-63adfb1276e8	2287	Žetale
00050000-5699-10c3-a84e-9d6e9438a5a6	4226	Žiri
00050000-5699-10c3-9a6e-6f90fa02f96e	4274	Žirovnica
00050000-5699-10c3-d6c1-fe1b80c68147	8360	Žužemberk
\.


--
-- TOC entry 3207 (class 0 OID 37079118)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 37078688)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 37078426)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5699-10c7-137d-e9bf683e42ee	00080000-5699-10c7-58a7-07a3a843b987	\N	00040000-5699-10c4-0bee-1c000b55d0cb	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5699-10c7-d350-050788341ffc	00080000-5699-10c7-58a7-07a3a843b987	\N	00040000-5699-10c4-0bee-1c000b55d0cb	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5699-10c7-9c74-60fb8921e6fe	00080000-5699-10c7-f3af-08f13522b600	\N	00040000-5699-10c4-0bee-1c000b55d0cb	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3167 (class 0 OID 37078564)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5699-10c4-a852-80e1cf59823a	novo leto	1	1	\N	t
00430000-5699-10c4-e022-cb9f5e132e60	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5699-10c4-6c76-34500cee08c2	dan upora proti okupatorju	27	4	\N	t
00430000-5699-10c4-1f3a-2e72fa1af112	praznik dela	1	5	\N	t
00430000-5699-10c4-c7f3-9584791779bc	praznik dela	2	5	\N	t
00430000-5699-10c4-5c03-d97df9e8e885	dan Primoža Trubarja	8	6	\N	f
00430000-5699-10c4-e54f-58a3ffda3321	dan državnosti	25	6	\N	t
00430000-5699-10c4-4b9e-a945f8dce3f0	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5699-10c4-c591-29cc47aefca5	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5699-10c4-3d58-24589ca62904	dan suverenosti	25	10	\N	f
00430000-5699-10c4-d586-5442728f001f	dan spomina na mrtve	1	11	\N	t
00430000-5699-10c4-366f-aa1cb989223a	dan Rudolfa Maistra	23	11	\N	f
00430000-5699-10c4-b9e6-74cdd8d73eb8	božič	25	12	\N	t
00430000-5699-10c4-f617-513fa987a163	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5699-10c4-6d03-e1cc2caacbdd	Marijino vnebovzetje	15	8	\N	t
00430000-5699-10c4-2953-e0bc950966ee	dan reformacije	31	10	\N	t
00430000-5699-10c4-2abb-a22dff806a69	velikonočna nedelja	27	3	2016	t
00430000-5699-10c4-a64c-de4d83e39fda	velikonočna nedelja	16	4	2017	t
00430000-5699-10c4-fb87-51925b0dd311	velikonočna nedelja	1	4	2018	t
00430000-5699-10c4-ae5b-d3eab0febd35	velikonočna nedelja	21	4	2019	t
00430000-5699-10c4-6706-2c4f796d607f	velikonočna nedelja	12	4	2020	t
00430000-5699-10c4-90fd-f37ee582f1ca	velikonočna nedelja	4	4	2021	t
00430000-5699-10c4-86fe-7209dbfe2dca	velikonočna nedelja	17	4	2022	t
00430000-5699-10c4-bc71-b709fa2eb07e	velikonočna nedelja	9	4	2023	t
00430000-5699-10c4-7293-a3596fa58fce	velikonočna nedelja	31	3	2024	t
00430000-5699-10c4-a490-39aeb0361849	velikonočna nedelja	20	4	2025	t
00430000-5699-10c4-6d25-78cc52c61556	velikonočna nedelja	5	4	2026	t
00430000-5699-10c4-2fcf-271f92c27840	velikonočna nedelja	28	3	2027	t
00430000-5699-10c4-9ec0-bc2c761f8b7b	velikonočna nedelja	16	4	2028	t
00430000-5699-10c4-75a6-27e6d1a97880	velikonočna nedelja	1	4	2029	t
00430000-5699-10c4-4ca6-823cc9f06f1d	velikonočna nedelja	21	4	2030	t
00430000-5699-10c4-a987-f608eea42b72	velikonočni ponedeljek	28	3	2016	t
00430000-5699-10c4-7472-ec69c277b2e4	velikonočni ponedeljek	17	4	2017	t
00430000-5699-10c4-0e79-4da1100c6561	velikonočni ponedeljek	2	4	2018	t
00430000-5699-10c4-0003-0e088895a4ed	velikonočni ponedeljek	22	4	2019	t
00430000-5699-10c4-99b1-5913eebff000	velikonočni ponedeljek	13	4	2020	t
00430000-5699-10c4-7bb0-dcf6da99c4f0	velikonočni ponedeljek	5	4	2021	t
00430000-5699-10c4-03c7-1c5a5747403f	velikonočni ponedeljek	18	4	2022	t
00430000-5699-10c4-956f-7414e0ba0e2a	velikonočni ponedeljek	10	4	2023	t
00430000-5699-10c4-3b35-edc5f2c6e8f3	velikonočni ponedeljek	1	4	2024	t
00430000-5699-10c4-200f-eec6edd6d12a	velikonočni ponedeljek	21	4	2025	t
00430000-5699-10c4-a3e0-463b55089f79	velikonočni ponedeljek	6	4	2026	t
00430000-5699-10c4-1a28-26d9cf50eea7	velikonočni ponedeljek	29	3	2027	t
00430000-5699-10c4-58bd-a8aafbf81943	velikonočni ponedeljek	17	4	2028	t
00430000-5699-10c4-3901-0c2b3420a03e	velikonočni ponedeljek	2	4	2029	t
00430000-5699-10c4-6fe4-cafe93392f07	velikonočni ponedeljek	22	4	2030	t
00430000-5699-10c4-9c4e-595c53bbd242	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5699-10c4-27d5-2efa18274f74	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5699-10c4-437c-752f196eca43	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5699-10c4-fe76-d8d466f81e66	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5699-10c4-deac-a77f0e26f19c	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5699-10c4-b689-8fb652fe8558	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5699-10c4-3403-f02815dec0e0	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5699-10c4-3bbe-8a7246864834	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5699-10c4-e6db-2d34c92aaf84	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5699-10c4-a3c3-99fdbb9fb89c	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5699-10c4-33e3-3eda0e4ca406	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5699-10c4-a875-ba8dff48c3e4	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5699-10c4-b1fb-bd78466db20a	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5699-10c4-1bb3-af77b65f7fcb	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5699-10c4-77b2-f9ad2a7b900d	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3163 (class 0 OID 37078530)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 37078539)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3182 (class 0 OID 37078700)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3208 (class 0 OID 37079132)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3209 (class 0 OID 37079142)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5699-10c7-d0e0-3598b5a0e886	00080000-5699-10c7-6ad1-23523cfefeb5	0987	AK
00190000-5699-10c7-27a1-aeac607e74de	00080000-5699-10c7-f3af-08f13522b600	0989	AK
00190000-5699-10c7-d12f-704d0e9de878	00080000-5699-10c7-f6aa-4317f46e9605	0986	AK
00190000-5699-10c7-b9f8-99e382485d34	00080000-5699-10c7-9491-b24be10e6e9f	0984	AK
00190000-5699-10c7-995b-41468a0115b8	00080000-5699-10c7-0863-ed86e3ab59cc	0983	AK
00190000-5699-10c7-08e5-34400ed2c618	00080000-5699-10c7-71f9-9ef11649b31e	0982	AK
00190000-5699-10c8-a532-83c5815be2c6	00080000-5699-10c8-41c5-12c67ce60db5	1001	AK
\.


--
-- TOC entry 3206 (class 0 OID 37079031)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5699-10c7-3d56-c42dcfc1f810	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3210 (class 0 OID 37079150)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 37078729)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5699-10c6-c5a5-e7c7c88df1ca	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5699-10c6-ba24-31daee24a72c	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5699-10c6-bb8d-d13533d7bc75	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5699-10c6-001d-fbb2f5d9d4cb	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5699-10c6-b583-7b13c7a5064d	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5699-10c6-59c2-d5ed1db88b1f	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5699-10c6-b98e-340e4cb6393d	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3178 (class 0 OID 37078673)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 37078663)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 37078870)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 37078800)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 37078504)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3140 (class 0 OID 37078266)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5699-10c8-41c5-12c67ce60db5	00010000-5699-10c5-42fd-8b7d2ab5f98d	2016-01-15 16:31:20	INS	a:0:{}
2	App\\Entity\\Option	00000000-5699-10c8-5ae6-a2c597ee282e	00010000-5699-10c5-42fd-8b7d2ab5f98d	2016-01-15 16:31:20	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5699-10c8-a532-83c5815be2c6	00010000-5699-10c5-42fd-8b7d2ab5f98d	2016-01-15 16:31:20	INS	a:0:{}
\.


--
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3187 (class 0 OID 37078742)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 37078304)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5699-10c4-5d6e-91e5108c6265	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5699-10c4-25f4-ceee4525ed97	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5699-10c4-b30c-5c7251d3f54e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5699-10c4-08c7-e4ee06a4e051	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5699-10c4-865e-ee337600070c	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5699-10c4-4316-a60e621b3b25	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5699-10c4-fc7e-fdb32d3a2e1c	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5699-10c4-d4c6-783baa78243b	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5699-10c4-1130-3486a696b560	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5699-10c4-0646-2a0668a53787	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5699-10c4-e72b-b5bdc397633b	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5699-10c4-5444-0f81cf48ba9c	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5699-10c4-3780-dd2539dccafb	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5699-10c4-97b6-00bec1122e43	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5699-10c4-b268-0caf76137207	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5699-10c4-bd4a-f02033c85243	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5699-10c4-0d14-1841605df896	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5699-10c4-1d7c-a988becf4dfb	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5699-10c4-5a3a-e72cac560c5a	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5699-10c4-37c3-4f631b7e5b6f	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5699-10c4-8f64-67d2d451e836	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5699-10c4-4f05-391f79641105	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5699-10c4-bb86-ba6a1d3497a8	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5699-10c4-7554-02d92b5fb9c1	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5699-10c4-c275-92bf881b3838	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5699-10c4-a739-f2ea930acb14	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5699-10c4-4f39-e2ade935c246	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5699-10c4-caa6-dcdd4e026467	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5699-10c4-1135-666b1c51b5ab	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5699-10c4-d188-674d0d0abe3f	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5699-10c4-8737-481a3573c84d	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5699-10c4-8fa2-b321ebb7a8eb	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5699-10c4-cbb5-10520819b645	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5699-10c4-f8f3-5734ff2f84a0	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5699-10c4-67ca-1d34a0d8d157	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5699-10c4-f317-c5c07ec06664	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5699-10c4-6b36-ec5c72e7fad5	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5699-10c4-0929-1f763551c834	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5699-10c4-f6d9-e40cc70829d8	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5699-10c4-8d46-770c1e161a4c	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5699-10c4-bdbf-b20c5322bcca	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5699-10c4-658a-7e46e1566a7c	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5699-10c4-4573-73e0f51a2b5e	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5699-10c4-7de1-9e8fd9afa931	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5699-10c4-685f-74a35ecb1f76	direktor	minimalne pravice za direktorja	t
00020000-5699-10c4-3e7b-c973d874f6c7	arhivar	arhivar	t
00020000-5699-10c4-adcc-d0b34cbba6bb	dramaturg	dramaturg	t
00020000-5699-10c4-b4b8-2751f36c5631	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5699-10c4-55aa-30ab0b6f415e	poslovni-sekretar	poslovni sekretar	t
00020000-5699-10c5-ed00-c7963c67bd85	vodja-tehnike	vodja tehnike	t
00020000-5699-10c5-2106-acc80b95a105	racunovodja	računovodja	t
00020000-5699-10c6-3fe0-c9cd8496c29b	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5699-10c6-8807-04e7df099b16	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-47b5-daa34e374694	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-8c27-b7ab29a7d58a	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-c926-ef30d8ea0b33	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-e623-402c3ed5c00f	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-59a3-4463ad0e2415	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-f388-0fde4c1a6f46	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-1fdc-855db0ca5fc2	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-28ab-9031d178f2bf	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-9e71-b3e75defc290	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-4fad-2c2ca8af1fb0	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-a302-7e9aaf77b0c5	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-72e4-2ae05610a5a1	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-4c73-632285826f56	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-eb17-3d829686ffc1	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-43d6-c9cc450f0c6b	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-78a2-9c785b7870c8	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-fc6f-22ffceda808d	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-a5a6-ec9c29e5bd42	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5699-10c6-8fa2-d843e52c238c	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-6afb-66f95ff368c6	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-b362-2e0fcb5fb549	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-db99-7fe0ff1224cb	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-21f3-2f90008a2c6f	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-ca27-b691ceddd436	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-3090-1f1b90af2eba	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-2f5a-3aa42310d3ff	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-c451-b6998a0f8d10	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-6e34-600c20d6c495	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-6a98-acc7d14ffe80	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-2b49-cfe55e9832d4	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-9ddf-a13da1df8a2e	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-f53e-f67b10e48027	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-b772-fbb5a02cd382	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-1b75-97357b8aaa08	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-a360-eab7e2c7d322	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-70bf-6b2ccba198f4	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5699-10c6-9ef2-208ea18aba76	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3142 (class 0 OID 37078288)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5699-10c5-3242-1f28d16003a5	00020000-5699-10c4-b30c-5c7251d3f54e
00010000-5699-10c5-42fd-8b7d2ab5f98d	00020000-5699-10c4-b30c-5c7251d3f54e
00010000-5699-10c6-a512-62da63ae6afe	00020000-5699-10c6-3fe0-c9cd8496c29b
00010000-5699-10c6-4384-414289339b5f	00020000-5699-10c6-8807-04e7df099b16
00010000-5699-10c6-4384-414289339b5f	00020000-5699-10c6-e623-402c3ed5c00f
00010000-5699-10c6-4384-414289339b5f	00020000-5699-10c6-28ab-9031d178f2bf
00010000-5699-10c6-4384-414289339b5f	00020000-5699-10c6-4fad-2c2ca8af1fb0
00010000-5699-10c6-4384-414289339b5f	00020000-5699-10c6-72e4-2ae05610a5a1
00010000-5699-10c6-4384-414289339b5f	00020000-5699-10c6-fc6f-22ffceda808d
00010000-5699-10c6-4384-414289339b5f	00020000-5699-10c6-8c27-b7ab29a7d58a
00010000-5699-10c6-4384-414289339b5f	00020000-5699-10c6-8fa2-d843e52c238c
00010000-5699-10c6-4384-414289339b5f	00020000-5699-10c6-db99-7fe0ff1224cb
00010000-5699-10c6-4384-414289339b5f	00020000-5699-10c6-ca27-b691ceddd436
00010000-5699-10c6-4384-414289339b5f	00020000-5699-10c6-2f5a-3aa42310d3ff
00010000-5699-10c6-4384-414289339b5f	00020000-5699-10c6-6e34-600c20d6c495
00010000-5699-10c6-4384-414289339b5f	00020000-5699-10c6-f53e-f67b10e48027
00010000-5699-10c6-004c-4544fc176727	00020000-5699-10c6-8807-04e7df099b16
00010000-5699-10c6-004c-4544fc176727	00020000-5699-10c6-47b5-daa34e374694
00010000-5699-10c6-004c-4544fc176727	00020000-5699-10c6-8c27-b7ab29a7d58a
00010000-5699-10c6-004c-4544fc176727	00020000-5699-10c6-c926-ef30d8ea0b33
00010000-5699-10c6-004c-4544fc176727	00020000-5699-10c6-72e4-2ae05610a5a1
00010000-5699-10c6-004c-4544fc176727	00020000-5699-10c6-43d6-c9cc450f0c6b
00010000-5699-10c6-004c-4544fc176727	00020000-5699-10c6-8fa2-d843e52c238c
00010000-5699-10c6-004c-4544fc176727	00020000-5699-10c6-db99-7fe0ff1224cb
00010000-5699-10c6-004c-4544fc176727	00020000-5699-10c6-ca27-b691ceddd436
00010000-5699-10c6-004c-4544fc176727	00020000-5699-10c6-2f5a-3aa42310d3ff
00010000-5699-10c6-004c-4544fc176727	00020000-5699-10c6-6e34-600c20d6c495
00010000-5699-10c6-004c-4544fc176727	00020000-5699-10c6-f53e-f67b10e48027
00010000-5699-10c6-8ef5-59f0678810bb	00020000-5699-10c6-8807-04e7df099b16
00010000-5699-10c6-8ef5-59f0678810bb	00020000-5699-10c6-47b5-daa34e374694
00010000-5699-10c6-8ef5-59f0678810bb	00020000-5699-10c6-8c27-b7ab29a7d58a
00010000-5699-10c6-8ef5-59f0678810bb	00020000-5699-10c6-c926-ef30d8ea0b33
00010000-5699-10c6-8ef5-59f0678810bb	00020000-5699-10c6-4fad-2c2ca8af1fb0
00010000-5699-10c6-8ef5-59f0678810bb	00020000-5699-10c6-72e4-2ae05610a5a1
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-47b5-daa34e374694
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-59a3-4463ad0e2415
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-9e71-b3e75defc290
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-a302-7e9aaf77b0c5
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-4fad-2c2ca8af1fb0
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-78a2-9c785b7870c8
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-72e4-2ae05610a5a1
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-4c73-632285826f56
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-8fa2-d843e52c238c
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-6afb-66f95ff368c6
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-db99-7fe0ff1224cb
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-21f3-2f90008a2c6f
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-ca27-b691ceddd436
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-3090-1f1b90af2eba
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-2f5a-3aa42310d3ff
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-c451-b6998a0f8d10
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-6e34-600c20d6c495
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-6a98-acc7d14ffe80
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-f53e-f67b10e48027
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-b772-fbb5a02cd382
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-a360-eab7e2c7d322
00010000-5699-10c6-225f-f50a7b4def4f	00020000-5699-10c6-70bf-6b2ccba198f4
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-47b5-daa34e374694
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-59a3-4463ad0e2415
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-1fdc-855db0ca5fc2
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-9e71-b3e75defc290
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-a302-7e9aaf77b0c5
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-4fad-2c2ca8af1fb0
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-78a2-9c785b7870c8
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-72e4-2ae05610a5a1
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-4c73-632285826f56
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-eb17-3d829686ffc1
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-8fa2-d843e52c238c
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-6afb-66f95ff368c6
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-b362-2e0fcb5fb549
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-db99-7fe0ff1224cb
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-21f3-2f90008a2c6f
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-ca27-b691ceddd436
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-3090-1f1b90af2eba
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-2f5a-3aa42310d3ff
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-c451-b6998a0f8d10
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-6e34-600c20d6c495
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-6a98-acc7d14ffe80
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-f53e-f67b10e48027
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-b772-fbb5a02cd382
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-1b75-97357b8aaa08
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-a360-eab7e2c7d322
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-70bf-6b2ccba198f4
00010000-5699-10c7-f9aa-2049447134e2	00020000-5699-10c6-9ef2-208ea18aba76
00010000-5699-10c7-dfc1-6bfae3949401	00020000-5699-10c6-47b5-daa34e374694
00010000-5699-10c7-dfc1-6bfae3949401	00020000-5699-10c6-8c27-b7ab29a7d58a
00010000-5699-10c7-dfc1-6bfae3949401	00020000-5699-10c6-59a3-4463ad0e2415
00010000-5699-10c7-dfc1-6bfae3949401	00020000-5699-10c6-f388-0fde4c1a6f46
00010000-5699-10c7-dfc1-6bfae3949401	00020000-5699-10c6-1fdc-855db0ca5fc2
00010000-5699-10c7-dfc1-6bfae3949401	00020000-5699-10c6-e623-402c3ed5c00f
00010000-5699-10c7-dfc1-6bfae3949401	00020000-5699-10c6-9e71-b3e75defc290
00010000-5699-10c7-dfc1-6bfae3949401	00020000-5699-10c6-a302-7e9aaf77b0c5
00010000-5699-10c7-dfc1-6bfae3949401	00020000-5699-10c6-4fad-2c2ca8af1fb0
00010000-5699-10c7-dfc1-6bfae3949401	00020000-5699-10c6-78a2-9c785b7870c8
00010000-5699-10c7-e608-e5ac33200c73	00020000-5699-10c6-8807-04e7df099b16
00010000-5699-10c7-e608-e5ac33200c73	00020000-5699-10c6-c926-ef30d8ea0b33
00010000-5699-10c7-e608-e5ac33200c73	00020000-5699-10c6-e623-402c3ed5c00f
00010000-5699-10c7-e608-e5ac33200c73	00020000-5699-10c6-28ab-9031d178f2bf
00010000-5699-10c7-e608-e5ac33200c73	00020000-5699-10c6-4fad-2c2ca8af1fb0
00010000-5699-10c7-e608-e5ac33200c73	00020000-5699-10c6-72e4-2ae05610a5a1
00010000-5699-10c7-e608-e5ac33200c73	00020000-5699-10c6-fc6f-22ffceda808d
00010000-5699-10c7-e608-e5ac33200c73	00020000-5699-10c6-2b49-cfe55e9832d4
00010000-5699-10c7-ad96-4beaa6433a35	00020000-5699-10c6-a5a6-ec9c29e5bd42
00010000-5699-10c7-bf47-1f445162a3db	00020000-5699-10c4-685f-74a35ecb1f76
00010000-5699-10c7-c147-9168e9a89945	00020000-5699-10c4-3e7b-c973d874f6c7
00010000-5699-10c7-0adb-8a1b63046c86	00020000-5699-10c4-adcc-d0b34cbba6bb
00010000-5699-10c7-16b9-d01cc921fda0	00020000-5699-10c4-b4b8-2751f36c5631
00010000-5699-10c7-e133-4efe7418ff89	00020000-5699-10c4-55aa-30ab0b6f415e
00010000-5699-10c7-71b9-99bfad76683a	00020000-5699-10c5-ed00-c7963c67bd85
00010000-5699-10c7-f896-0be446030979	00020000-5699-10c5-2106-acc80b95a105
\.


--
-- TOC entry 3189 (class 0 OID 37078756)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 37078694)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 37078617)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5699-10c6-c38b-a74cf0b80fd6	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5699-10c6-c0eb-c4f9dad9b4cb	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5699-10c6-895b-68444373f027	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3138 (class 0 OID 37078253)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5699-10c4-041c-7676bea1013a	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5699-10c4-8a10-120a2abcd3e1	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5699-10c4-ee0f-f76eb182e655	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5699-10c4-b262-d8f03305eab1	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5699-10c4-3e04-2b9cd74e33df	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3137 (class 0 OID 37078245)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5699-10c4-216c-d135512433f1	00230000-5699-10c4-b262-d8f03305eab1	popa
00240000-5699-10c4-0ff4-99f0cbd92281	00230000-5699-10c4-b262-d8f03305eab1	oseba
00240000-5699-10c4-21d5-3bab84282f8c	00230000-5699-10c4-b262-d8f03305eab1	tippopa
00240000-5699-10c4-299b-89b121f611f5	00230000-5699-10c4-b262-d8f03305eab1	organizacijskaenota
00240000-5699-10c4-abe2-1f06d728bebc	00230000-5699-10c4-b262-d8f03305eab1	sezona
00240000-5699-10c4-d4e6-df7c008f65b1	00230000-5699-10c4-b262-d8f03305eab1	tipvaje
00240000-5699-10c4-655d-365fb82981e4	00230000-5699-10c4-b262-d8f03305eab1	tipdodatka
00240000-5699-10c4-9084-a9a34db3ff68	00230000-5699-10c4-8a10-120a2abcd3e1	prostor
00240000-5699-10c4-80c3-2c75ec69e895	00230000-5699-10c4-b262-d8f03305eab1	besedilo
00240000-5699-10c4-63fb-9aa5d4bab667	00230000-5699-10c4-b262-d8f03305eab1	uprizoritev
00240000-5699-10c4-939f-4e8b42b82e8f	00230000-5699-10c4-b262-d8f03305eab1	funkcija
00240000-5699-10c4-62e6-b5df184e7a73	00230000-5699-10c4-b262-d8f03305eab1	tipfunkcije
00240000-5699-10c4-a618-6c3fa26880b2	00230000-5699-10c4-b262-d8f03305eab1	alternacija
00240000-5699-10c4-e7d4-8a5b39ecadaa	00230000-5699-10c4-041c-7676bea1013a	pogodba
00240000-5699-10c4-b78d-87742dea2e49	00230000-5699-10c4-b262-d8f03305eab1	zaposlitev
00240000-5699-10c4-5154-7f1aad50c21b	00230000-5699-10c4-b262-d8f03305eab1	zvrstuprizoritve
00240000-5699-10c4-f6f4-da61459b4065	00230000-5699-10c4-041c-7676bea1013a	programdela
00240000-5699-10c4-bc5a-1cd7732341c5	00230000-5699-10c4-b262-d8f03305eab1	zapis
\.


--
-- TOC entry 3136 (class 0 OID 37078240)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
d138faf1-46f6-4d32-a860-9be7348e4240	00240000-5699-10c4-216c-d135512433f1	0	1001
\.


--
-- TOC entry 3195 (class 0 OID 37078817)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5699-10c7-d5aa-0796c5da8216	000e0000-5699-10c7-b04c-e719d5e0cf29	00080000-5699-10c7-58a7-07a3a843b987	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5699-10c4-6496-329113e59414
00270000-5699-10c7-18ac-8cf0a3d6b2e3	000e0000-5699-10c7-b04c-e719d5e0cf29	00080000-5699-10c7-58a7-07a3a843b987	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5699-10c4-6496-329113e59414
\.


--
-- TOC entry 3152 (class 0 OID 37078388)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 37078636)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-5699-10c7-649b-542ce580ba12	00180000-5699-10c7-2888-82a188f58f20	000c0000-5699-10c7-b167-c37690cbe5a2	00090000-5699-10c7-ef11-4aacc01cba68	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-5699-10c7-4851-fd24c103ba50	00180000-5699-10c7-2888-82a188f58f20	000c0000-5699-10c7-7774-d2ba4ec8de6f	00090000-5699-10c7-9377-26191dd715a1	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-5699-10c7-4011-3c41c7f6daa9	00180000-5699-10c7-2888-82a188f58f20	000c0000-5699-10c7-e5d0-2dac1fac9c2a	00090000-5699-10c7-820a-a45bc6cb74c4	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-5699-10c7-64c3-444b64c61986	00180000-5699-10c7-2888-82a188f58f20	000c0000-5699-10c7-b790-22ff55b0afcc	00090000-5699-10c7-2f77-aa4469088e5b	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-5699-10c7-43e2-2d3ea41536ab	00180000-5699-10c7-2888-82a188f58f20	000c0000-5699-10c7-8b20-f74565305a23	00090000-5699-10c7-9233-ea0ef44dd48e	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-5699-10c7-a4a3-813b08e56b0d	00180000-5699-10c7-39bc-4e9c33e71802	\N	00090000-5699-10c7-9233-ea0ef44dd48e	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-5699-10c7-24f7-d352493ad294	00180000-5699-10c7-39bc-4e9c33e71802	\N	00090000-5699-10c7-9377-26191dd715a1	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3176 (class 0 OID 37078653)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-5699-10c4-b0f3-109175b0154d	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-5699-10c4-b826-6226759f1eed	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-5699-10c4-bc64-3bb283cd39fe	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-5699-10c4-5f07-04665c95c630	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-5699-10c4-3e7c-c6ad66ef5655	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-5699-10c4-a77f-57e6dfb07800	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3198 (class 0 OID 37078858)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5699-10c4-fe7e-402560b224f8	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5699-10c4-419e-458d758b561d	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5699-10c4-c525-38cadef6d990	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5699-10c4-12b3-7dd224a6be03	04	Režija	Režija	Režija	umetnik	30
000f0000-5699-10c4-ccf7-0e4ac9fd0765	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5699-10c4-4689-1db6bed034a4	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5699-10c4-17be-539d3d5790b2	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5699-10c4-5791-a0e575909d2e	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5699-10c4-0080-d1975574b8f5	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5699-10c4-4454-ab92fe7b28f2	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5699-10c4-8f34-c69c99ced039	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5699-10c4-afc6-487f37562531	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5699-10c4-1372-755063c26405	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5699-10c4-0d36-2607ea46f110	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5699-10c4-ff50-c96fb5fb685b	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5699-10c4-78d7-b91168b9a046	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5699-10c4-8c23-6d1da9771d33	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5699-10c4-a91e-af76dd0f90b2	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-5699-10c4-4e4c-4dad1c92034a	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3149 (class 0 OID 37078339)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5699-10c6-577b-73d009a5dd97	0001	šola	osnovna ali srednja šola
00400000-5699-10c6-8840-263497620c66	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5699-10c6-6ab6-609a6cb063e9	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3211 (class 0 OID 37079162)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5699-10c3-f0b2-cce9ccd9d56d	01	Velika predstava	f	1.00	1.00
002b0000-5699-10c3-51ef-825d81c40fbf	02	Mala predstava	f	0.50	0.50
002b0000-5699-10c3-7a16-88ae874196c3	03	Mala koprodukcija	t	0.40	1.00
002b0000-5699-10c3-e3f4-03b4d3629eb7	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5699-10c3-b0e0-693ffc1234fd	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3171 (class 0 OID 37078607)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5699-10c3-fc2f-bf7adf996d32	0001	prva vaja	prva vaja
00420000-5699-10c3-809b-bfa941dc009f	0002	tehnična vaja	tehnična vaja
00420000-5699-10c3-c08a-4231655ffab6	0003	lučna vaja	lučna vaja
00420000-5699-10c3-22c3-1e7468e285bc	0004	kostumska vaja	kostumska vaja
00420000-5699-10c3-74b4-ef2aa1d839a8	0005	foto vaja	foto vaja
00420000-5699-10c3-624a-4be74bf0366a	0006	1. glavna vaja	1. glavna vaja
00420000-5699-10c3-164c-6878f64b0b89	0007	2. glavna vaja	2. glavna vaja
00420000-5699-10c3-790d-6c5f9397e7de	0008	1. generalka	1. generalka
00420000-5699-10c3-766e-1a3a91cd9e2d	0009	2. generalka	2. generalka
00420000-5699-10c3-9390-71574da34ef3	0010	odprta generalka	odprta generalka
00420000-5699-10c3-d981-c9cd5446b30d	0011	obnovitvena vaja	obnovitvena vaja
00420000-5699-10c3-3264-21b591da38fa	0012	italijanka	krajša "obnovitvena" vaja
00420000-5699-10c3-304b-e07d285b01cb	0013	pevska vaja	pevska vaja
00420000-5699-10c3-3ab9-3aa83ebfc1a1	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5699-10c4-59b8-9272505e896a	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-5699-10c4-f4f7-ffeb2d28fa67	0016	orientacijska vaja	orientacijska vaja
00420000-5699-10c4-054d-52d1f4f1f3fa	0017	situacijska vaja	situacijska vaja
00420000-5699-10c4-b157-ac53c1f40770	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3158 (class 0 OID 37078461)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 37078275)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5699-10c5-42fd-8b7d2ab5f98d	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROWbfIDSlkV2/wG96qE36QlqXWpcxY/5a	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5699-10c6-d653-b726f30882bb	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5699-10c6-b013-aee510e46e7f	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5699-10c6-d25f-ad937ed6b586	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5699-10c6-4225-b760fe962d23	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5699-10c6-366f-d76ae66a69ab	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5699-10c6-cd80-a14ad993bfcd	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5699-10c6-4c7e-100c267cdb87	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5699-10c6-0a32-5fdc1e8e31e1	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5699-10c6-93c8-c26d8b938133	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5699-10c6-a512-62da63ae6afe	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5699-10c6-4a9b-5a78244235a8	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5699-10c6-4384-414289339b5f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5699-10c6-004c-4544fc176727	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5699-10c6-8ef5-59f0678810bb	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5699-10c6-225f-f50a7b4def4f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5699-10c7-f9aa-2049447134e2	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5699-10c7-dfc1-6bfae3949401	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5699-10c7-e608-e5ac33200c73	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5699-10c7-ad96-4beaa6433a35	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5699-10c7-bf47-1f445162a3db	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5699-10c7-c147-9168e9a89945	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5699-10c7-0adb-8a1b63046c86	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5699-10c7-16b9-d01cc921fda0	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5699-10c7-e133-4efe7418ff89	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5699-10c7-71b9-99bfad76683a	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5699-10c7-f896-0be446030979	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5699-10c5-3242-1f28d16003a5	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3202 (class 0 OID 37078908)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5699-10c7-463f-044f6fdaa0f5	00160000-5699-10c6-0954-d8aac10a200b	\N	00140000-5699-10c4-77c1-12a7d690eaf5	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5699-10c6-b583-7b13c7a5064d
000e0000-5699-10c7-b04c-e719d5e0cf29	00160000-5699-10c6-112e-0c991e9ca836	\N	00140000-5699-10c4-3b4f-cc6c45fdaff2	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5699-10c6-59c2-d5ed1db88b1f
000e0000-5699-10c7-32ce-db5dc86cc86d	\N	\N	00140000-5699-10c4-3b4f-cc6c45fdaff2	00190000-5699-10c7-d0e0-3598b5a0e886	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5699-10c6-b583-7b13c7a5064d
000e0000-5699-10c7-72b2-e518a252494f	\N	\N	00140000-5699-10c4-3b4f-cc6c45fdaff2	00190000-5699-10c7-d0e0-3598b5a0e886	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5699-10c6-b583-7b13c7a5064d
000e0000-5699-10c7-c82b-f44bc70b5ef9	\N	\N	00140000-5699-10c4-3b4f-cc6c45fdaff2	00190000-5699-10c7-d0e0-3598b5a0e886	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-10c6-c5a5-e7c7c88df1ca
000e0000-5699-10c7-e68f-dc9ee0b147be	\N	\N	00140000-5699-10c4-3b4f-cc6c45fdaff2	00190000-5699-10c7-d0e0-3598b5a0e886	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-10c6-c5a5-e7c7c88df1ca
000e0000-5699-10c7-7901-57cc2159466a	\N	\N	00140000-5699-10c4-cddb-4d372e9cf86f	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-10c6-c5a5-e7c7c88df1ca
000e0000-5699-10c7-7059-babec278f894	\N	\N	00140000-5699-10c4-cddb-4d372e9cf86f	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-10c6-c5a5-e7c7c88df1ca
000e0000-5699-10c7-d4bf-e522cff64313	\N	\N	00140000-5699-10c4-cddb-4d372e9cf86f	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-10c6-c5a5-e7c7c88df1ca
000e0000-5699-10c7-a9da-a41cf0046141	\N	\N	00140000-5699-10c4-cddb-4d372e9cf86f	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-10c6-c5a5-e7c7c88df1ca
000e0000-5699-10c7-c9f3-80ce15bfcf9d	\N	\N	00140000-5699-10c4-cddb-4d372e9cf86f	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-10c6-c5a5-e7c7c88df1ca
000e0000-5699-10c7-e8ec-a559283f607b	\N	\N	00140000-5699-10c4-cddb-4d372e9cf86f	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-10c6-c5a5-e7c7c88df1ca
000e0000-5699-10c7-7ce5-38fcb23a8782	\N	\N	00140000-5699-10c4-cddb-4d372e9cf86f	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-10c6-c5a5-e7c7c88df1ca
000e0000-5699-10c7-6299-f1a6e6fcc614	\N	\N	00140000-5699-10c4-cddb-4d372e9cf86f	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-10c6-c5a5-e7c7c88df1ca
000e0000-5699-10c7-cf80-22eb2dce6096	\N	\N	00140000-5699-10c4-cddb-4d372e9cf86f	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5699-10c6-c5a5-e7c7c88df1ca
\.


--
-- TOC entry 3173 (class 0 OID 37078627)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 37078557)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-5699-10c7-da1c-e4fd3a243e7e	\N	000e0000-5699-10c7-b04c-e719d5e0cf29	1
00200000-5699-10c7-06d2-ea32064c302b	\N	000e0000-5699-10c7-b04c-e719d5e0cf29	2
00200000-5699-10c7-77b9-74a824a86c6b	\N	000e0000-5699-10c7-b04c-e719d5e0cf29	3
00200000-5699-10c7-c1d2-ba0900fc2729	\N	000e0000-5699-10c7-b04c-e719d5e0cf29	4
00200000-5699-10c7-927e-3f3cae8a6fb5	\N	000e0000-5699-10c7-b04c-e719d5e0cf29	5
\.


--
-- TOC entry 3185 (class 0 OID 37078721)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 37078831)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5699-10c4-fba5-a39ab0255ca2	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5699-10c4-a258-796ae39049c5	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5699-10c4-819e-6cf3428eda7e	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5699-10c4-c605-33e7550bfcc9	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5699-10c4-ca7d-ce4c4757d53f	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5699-10c4-ca11-7d03c40aa19f	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5699-10c4-c115-20e03d04e247	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5699-10c4-8080-8578da07a740	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5699-10c4-6496-329113e59414	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5699-10c4-29cd-dbf77f553cd0	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5699-10c4-e58e-b735923303ec	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5699-10c4-e5f2-dc38cce63559	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5699-10c4-4b79-b219ba963aaa	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5699-10c4-a104-07fbba7d7221	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5699-10c4-c047-0104825a1ce7	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5699-10c4-e1e4-39e41f579d43	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5699-10c4-b17d-de8eac7e5453	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5699-10c4-c929-2e30edec0957	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5699-10c4-0c30-558db80579e6	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5699-10c4-cb80-88dec7ca30ca	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5699-10c4-db52-2eb9ee7c0d51	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5699-10c4-b424-54db41c5345e	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5699-10c4-3010-cdb4e158401d	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5699-10c4-07f3-6865aa3b3e16	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5699-10c4-2869-159bd9eb481b	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5699-10c4-5656-8d5d4cdffefe	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5699-10c4-11d9-08643eb80276	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5699-10c4-5aec-e5373bb11781	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3214 (class 0 OID 37079212)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 37079181)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3215 (class 0 OID 37079224)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3192 (class 0 OID 37078793)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5699-10c7-456c-59a5915d1e81	00090000-5699-10c7-9377-26191dd715a1	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-5699-10c7-f36c-48244c88fb79	00090000-5699-10c7-820a-a45bc6cb74c4	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-5699-10c7-cc2c-118538ab2072	00090000-5699-10c7-1280-27d10567560c	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5699-10c7-1454-60b5aae7c763	00090000-5699-10c7-e3d2-350500eded01	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5699-10c7-e7da-b926d4d20f44	00090000-5699-10c7-392e-4ea79f119223	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-5699-10c7-d012-8f071b55acba	00090000-5699-10c7-63ac-af0f05c78b9c	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3135 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3201 (class 0 OID 37078898)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5699-10c4-77c1-12a7d690eaf5	01	Drama	drama (SURS 01)
00140000-5699-10c4-e28a-672cc4fd864d	02	Opera	opera (SURS 02)
00140000-5699-10c4-9529-3d834e25d3ad	03	Balet	balet (SURS 03)
00140000-5699-10c4-2aa8-380162eca6a4	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5699-10c4-cddb-4d372e9cf86f	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5699-10c4-3b4f-cc6c45fdaff2	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5699-10c4-673d-ae79630dc83f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3191 (class 0 OID 37078783)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2621 (class 2606 OID 37078338)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 37078956)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 37078947)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 37078329)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 37078814)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 37078856)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2904 (class 2606 OID 37079265)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 37078650)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 37078586)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 37078601)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 37078606)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2880 (class 2606 OID 37079179)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 37078487)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 37079025)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 37078779)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 37078555)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 37078525)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 37078501)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 37078686)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2898 (class 2606 OID 37079242)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2902 (class 2606 OID 37079249)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2909 (class 2606 OID 37079273)
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
-- TOC entry 2767 (class 2606 OID 37078713)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 37078459)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 37078357)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 37078421)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 37078384)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 37078318)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2610 (class 2606 OID 37078303)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 37078719)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 37078755)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 37078893)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 37078412)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 37078447)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 37079130)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 37078692)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 37078437)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 37078571)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 37078543)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2688 (class 2606 OID 37078535)
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
-- TOC entry 2765 (class 2606 OID 37078704)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 37079139)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2870 (class 2606 OID 37079147)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 37079117)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 37079160)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 37078737)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 37078677)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 37078668)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2825 (class 2606 OID 37078880)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 37078807)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 37078513)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 37078274)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 37078746)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 37078292)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2612 (class 2606 OID 37078312)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 37078764)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 37078699)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 37078625)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 37078262)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 37078250)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 37078244)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 37078827)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 37078393)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 37078642)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 37078660)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 37078867)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 37078346)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 37079172)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 37078614)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 37078472)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 37078287)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 37078926)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 37078633)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 37078561)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 37078727)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 37078839)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2891 (class 2606 OID 37079222)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2888 (class 2606 OID 37079206)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2894 (class 2606 OID 37079230)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 37078797)
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
-- TOC entry 2834 (class 2606 OID 37078906)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 37078791)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 1259 OID 37078595)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2705 (class 1259 OID 37078596)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2706 (class 1259 OID 37078594)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2707 (class 1259 OID 37078593)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2708 (class 1259 OID 37078592)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2810 (class 1259 OID 37078828)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2811 (class 1259 OID 37078829)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2812 (class 1259 OID 37078830)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2895 (class 1259 OID 37079244)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2896 (class 1259 OID 37079243)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2639 (class 1259 OID 37078414)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2640 (class 1259 OID 37078415)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2768 (class 1259 OID 37078720)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2882 (class 1259 OID 37079210)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2883 (class 1259 OID 37079209)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2884 (class 1259 OID 37079211)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2885 (class 1259 OID 37079208)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2886 (class 1259 OID 37079207)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 37078706)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2763 (class 1259 OID 37078705)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2696 (class 1259 OID 37078562)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2697 (class 1259 OID 37078563)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 37078780)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2793 (class 1259 OID 37078782)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2794 (class 1259 OID 37078781)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2671 (class 1259 OID 37078503)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2672 (class 1259 OID 37078502)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2873 (class 1259 OID 37079161)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2826 (class 1259 OID 37078895)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2827 (class 1259 OID 37078896)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2828 (class 1259 OID 37078897)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2892 (class 1259 OID 37079231)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2835 (class 1259 OID 37078931)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2836 (class 1259 OID 37078928)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2837 (class 1259 OID 37078932)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2838 (class 1259 OID 37078930)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2839 (class 1259 OID 37078929)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2661 (class 1259 OID 37078474)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2662 (class 1259 OID 37078473)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2630 (class 1259 OID 37078387)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2780 (class 1259 OID 37078747)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2614 (class 1259 OID 37078319)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2615 (class 1259 OID 37078320)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2785 (class 1259 OID 37078767)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2786 (class 1259 OID 37078766)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2787 (class 1259 OID 37078765)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2644 (class 1259 OID 37078424)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2645 (class 1259 OID 37078423)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2646 (class 1259 OID 37078425)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2684 (class 1259 OID 37078538)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2685 (class 1259 OID 37078536)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2686 (class 1259 OID 37078537)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2594 (class 1259 OID 37078252)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 37078672)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 37078670)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 37078669)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 37078671)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2605 (class 1259 OID 37078293)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2606 (class 1259 OID 37078294)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2771 (class 1259 OID 37078728)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2905 (class 1259 OID 37079266)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2808 (class 1259 OID 37078816)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 37078815)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2906 (class 1259 OID 37079274)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2907 (class 1259 OID 37079275)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 37078693)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2802 (class 1259 OID 37078808)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2803 (class 1259 OID 37078809)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2855 (class 1259 OID 37079030)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2856 (class 1259 OID 37079029)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2857 (class 1259 OID 37079026)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2858 (class 1259 OID 37079027)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2859 (class 1259 OID 37079028)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2650 (class 1259 OID 37078439)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2651 (class 1259 OID 37078438)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2652 (class 1259 OID 37078440)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2774 (class 1259 OID 37078741)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2775 (class 1259 OID 37078740)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2865 (class 1259 OID 37079140)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2866 (class 1259 OID 37079141)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2848 (class 1259 OID 37078960)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2849 (class 1259 OID 37078961)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2850 (class 1259 OID 37078958)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2851 (class 1259 OID 37078959)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2585 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 37078651)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 37078652)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2798 (class 1259 OID 37078798)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2799 (class 1259 OID 37078799)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 37078634)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 37078681)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 37078680)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 37078678)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 37078679)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2845 (class 1259 OID 37078948)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2675 (class 1259 OID 37078514)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2678 (class 1259 OID 37078528)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2679 (class 1259 OID 37078527)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2680 (class 1259 OID 37078526)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2681 (class 1259 OID 37078529)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2695 (class 1259 OID 37078556)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2689 (class 1259 OID 37078544)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2690 (class 1259 OID 37078545)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2862 (class 1259 OID 37079131)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2881 (class 1259 OID 37079180)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2899 (class 1259 OID 37079250)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2900 (class 1259 OID 37079251)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2626 (class 1259 OID 37078359)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2627 (class 1259 OID 37078358)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2635 (class 1259 OID 37078394)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2636 (class 1259 OID 37078395)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 37078645)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 37078644)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 37078643)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 37078588)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 37078591)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 37078587)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 37078590)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 37078589)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 37078413)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 37078347)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 37078348)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2667 (class 1259 OID 37078488)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 37078490)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2669 (class 1259 OID 37078489)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2670 (class 1259 OID 37078491)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 37078687)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2831 (class 1259 OID 37078894)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2840 (class 1259 OID 37078927)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 37078868)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2823 (class 1259 OID 37078869)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2633 (class 1259 OID 37078385)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 37078386)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 37078661)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 37078662)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2795 (class 1259 OID 37078792)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 37078263)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2660 (class 1259 OID 37078460)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2649 (class 1259 OID 37078422)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 37078251)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2878 (class 1259 OID 37079173)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2778 (class 1259 OID 37078739)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2779 (class 1259 OID 37078738)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 37078615)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 37078616)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2852 (class 1259 OID 37078957)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 37078635)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2657 (class 1259 OID 37078448)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 37078907)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2889 (class 1259 OID 37079223)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2871 (class 1259 OID 37079148)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2872 (class 1259 OID 37079149)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2819 (class 1259 OID 37078857)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 37078626)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 37078313)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2948 (class 2606 OID 37079446)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2943 (class 2606 OID 37079471)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2945 (class 2606 OID 37079461)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2949 (class 2606 OID 37079441)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2946 (class 2606 OID 37079456)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2944 (class 2606 OID 37079466)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2947 (class 2606 OID 37079451)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2988 (class 2606 OID 37079656)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2987 (class 2606 OID 37079661)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2986 (class 2606 OID 37079666)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3019 (class 2606 OID 37079826)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3020 (class 2606 OID 37079821)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2922 (class 2606 OID 37079331)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2921 (class 2606 OID 37079336)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2969 (class 2606 OID 37079571)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3014 (class 2606 OID 37079806)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3015 (class 2606 OID 37079801)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3013 (class 2606 OID 37079811)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3016 (class 2606 OID 37079796)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3017 (class 2606 OID 37079791)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2967 (class 2606 OID 37079566)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2968 (class 2606 OID 37079561)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2942 (class 2606 OID 37079431)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2941 (class 2606 OID 37079436)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2979 (class 2606 OID 37079611)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 37079621)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2978 (class 2606 OID 37079616)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2931 (class 2606 OID 37079386)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2932 (class 2606 OID 37079381)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2965 (class 2606 OID 37079551)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3011 (class 2606 OID 37079781)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2991 (class 2606 OID 37079671)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2990 (class 2606 OID 37079676)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2989 (class 2606 OID 37079681)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3018 (class 2606 OID 37079816)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2993 (class 2606 OID 37079701)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2996 (class 2606 OID 37079686)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2992 (class 2606 OID 37079706)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2994 (class 2606 OID 37079696)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2995 (class 2606 OID 37079691)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2929 (class 2606 OID 37079376)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2930 (class 2606 OID 37079371)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2917 (class 2606 OID 37079316)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2918 (class 2606 OID 37079311)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2973 (class 2606 OID 37079591)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2914 (class 2606 OID 37079291)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2913 (class 2606 OID 37079296)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2974 (class 2606 OID 37079606)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2975 (class 2606 OID 37079601)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2976 (class 2606 OID 37079596)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2924 (class 2606 OID 37079346)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2925 (class 2606 OID 37079341)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2923 (class 2606 OID 37079351)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2935 (class 2606 OID 37079411)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2937 (class 2606 OID 37079401)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2936 (class 2606 OID 37079406)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2910 (class 2606 OID 37079276)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2957 (class 2606 OID 37079526)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2959 (class 2606 OID 37079516)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2960 (class 2606 OID 37079511)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2958 (class 2606 OID 37079521)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2912 (class 2606 OID 37079281)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2911 (class 2606 OID 37079286)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2970 (class 2606 OID 37079576)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3023 (class 2606 OID 37079841)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2984 (class 2606 OID 37079651)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2985 (class 2606 OID 37079646)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3025 (class 2606 OID 37079846)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3024 (class 2606 OID 37079851)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2966 (class 2606 OID 37079556)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2983 (class 2606 OID 37079636)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2982 (class 2606 OID 37079641)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 37079756)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3003 (class 2606 OID 37079751)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3006 (class 2606 OID 37079736)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3005 (class 2606 OID 37079741)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3004 (class 2606 OID 37079746)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2927 (class 2606 OID 37079361)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2928 (class 2606 OID 37079356)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2926 (class 2606 OID 37079366)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2971 (class 2606 OID 37079586)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2972 (class 2606 OID 37079581)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 37079766)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3008 (class 2606 OID 37079771)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2999 (class 2606 OID 37079726)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2998 (class 2606 OID 37079731)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 3001 (class 2606 OID 37079716)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 3000 (class 2606 OID 37079721)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2956 (class 2606 OID 37079501)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2955 (class 2606 OID 37079506)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2981 (class 2606 OID 37079626)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2980 (class 2606 OID 37079631)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2951 (class 2606 OID 37079476)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2950 (class 2606 OID 37079481)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2961 (class 2606 OID 37079546)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2962 (class 2606 OID 37079541)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2964 (class 2606 OID 37079531)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2963 (class 2606 OID 37079536)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2997 (class 2606 OID 37079711)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2933 (class 2606 OID 37079391)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2934 (class 2606 OID 37079396)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2940 (class 2606 OID 37079426)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2939 (class 2606 OID 37079416)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2938 (class 2606 OID 37079421)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3007 (class 2606 OID 37079761)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3010 (class 2606 OID 37079776)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3012 (class 2606 OID 37079786)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3022 (class 2606 OID 37079831)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3021 (class 2606 OID 37079836)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2915 (class 2606 OID 37079306)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2916 (class 2606 OID 37079301)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2920 (class 2606 OID 37079321)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 37079326)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 37079496)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2953 (class 2606 OID 37079491)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2954 (class 2606 OID 37079486)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-15 16:31:22 CET

--
-- PostgreSQL database dump complete
--

