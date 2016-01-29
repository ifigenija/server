--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-29 15:21:54 CET

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
-- TOC entry 185 (class 1259 OID 41961147)
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
-- TOC entry 241 (class 1259 OID 41961765)
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
-- TOC entry 240 (class 1259 OID 41961749)
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
-- TOC entry 184 (class 1259 OID 41961140)
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
-- TOC entry 183 (class 1259 OID 41961138)
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
-- TOC entry 231 (class 1259 OID 41961626)
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
-- TOC entry 234 (class 1259 OID 41961656)
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
-- TOC entry 255 (class 1259 OID 41962068)
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
-- TOC entry 212 (class 1259 OID 41961462)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 41961387)
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
-- TOC entry 206 (class 1259 OID 41961413)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 41961418)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 41961990)
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
-- TOC entry 196 (class 1259 OID 41961293)
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
-- TOC entry 242 (class 1259 OID 41961778)
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
-- TOC entry 227 (class 1259 OID 41961584)
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
-- TOC entry 202 (class 1259 OID 41961361)
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
-- TOC entry 199 (class 1259 OID 41961333)
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
-- TOC entry 197 (class 1259 OID 41961310)
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
-- TOC entry 216 (class 1259 OID 41961498)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 41962048)
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
-- TOC entry 254 (class 1259 OID 41962061)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 41962083)
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
-- TOC entry 220 (class 1259 OID 41961522)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 41961267)
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
-- TOC entry 187 (class 1259 OID 41961167)
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
-- TOC entry 191 (class 1259 OID 41961234)
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
-- TOC entry 188 (class 1259 OID 41961178)
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
-- TOC entry 180 (class 1259 OID 41961112)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 41961131)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 41961529)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 41961564)
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
-- TOC entry 237 (class 1259 OID 41961697)
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
-- TOC entry 190 (class 1259 OID 41961214)
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
-- TOC entry 193 (class 1259 OID 41961259)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 41961934)
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
-- TOC entry 217 (class 1259 OID 41961504)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 41961244)
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
-- TOC entry 204 (class 1259 OID 41961379)
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
-- TOC entry 200 (class 1259 OID 41961348)
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
-- TOC entry 201 (class 1259 OID 41961354)
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
-- TOC entry 219 (class 1259 OID 41961516)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 41961948)
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
-- TOC entry 246 (class 1259 OID 41961958)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 41961847)
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
-- TOC entry 247 (class 1259 OID 41961966)
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
-- TOC entry 223 (class 1259 OID 41961544)
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
-- TOC entry 215 (class 1259 OID 41961489)
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
-- TOC entry 214 (class 1259 OID 41961479)
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
-- TOC entry 236 (class 1259 OID 41961686)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 41961616)
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
-- TOC entry 198 (class 1259 OID 41961322)
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
-- TOC entry 177 (class 1259 OID 41961083)
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
-- TOC entry 176 (class 1259 OID 41961081)
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
-- TOC entry 224 (class 1259 OID 41961558)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 41961121)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 41961105)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 41961572)
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
-- TOC entry 218 (class 1259 OID 41961510)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 41961433)
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
-- TOC entry 175 (class 1259 OID 41961070)
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
-- TOC entry 174 (class 1259 OID 41961062)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 41961057)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 41961633)
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
-- TOC entry 189 (class 1259 OID 41961206)
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
-- TOC entry 211 (class 1259 OID 41961452)
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
-- TOC entry 213 (class 1259 OID 41961469)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 41961674)
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
-- TOC entry 186 (class 1259 OID 41961157)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 41961978)
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
-- TOC entry 208 (class 1259 OID 41961423)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 41961279)
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
-- TOC entry 178 (class 1259 OID 41961092)
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
-- TOC entry 239 (class 1259 OID 41961724)
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
-- TOC entry 210 (class 1259 OID 41961443)
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
-- TOC entry 203 (class 1259 OID 41961372)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 41961536)
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
-- TOC entry 233 (class 1259 OID 41961647)
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
-- TOC entry 251 (class 1259 OID 41962028)
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
-- TOC entry 250 (class 1259 OID 41961997)
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
-- TOC entry 252 (class 1259 OID 41962040)
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
-- TOC entry 229 (class 1259 OID 41961609)
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
-- TOC entry 238 (class 1259 OID 41961714)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 41961599)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 41961143)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 41961086)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 41961147)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56ab-757e-2774-5168b6330630	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56ab-757e-be7f-d2b5e5a81b46	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56ab-757e-b33a-f7d5ea917ed5	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 41961765)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56ab-757e-8805-c7e952dd1f2c	000d0000-56ab-757e-9b3c-26a33d8ecd76	\N	00090000-56ab-757e-f03a-4d4644fc6576	000b0000-56ab-757e-5f3e-d4fb75f30b53	0001	f	\N	\N	\N	3	t	t	t
000c0000-56ab-757e-c02c-eb20ca277a69	000d0000-56ab-757e-a2a0-4a9de99fe0a7	00100000-56ab-757e-7249-7dc8dda2ceae	00090000-56ab-757e-2bab-897a2f0663e3	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56ab-757e-47e4-d56352a2fa77	000d0000-56ab-757e-71c0-a000119cf6e0	00100000-56ab-757e-c063-cd98119e70f1	00090000-56ab-757e-10eb-a3e9b4528d68	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56ab-757e-8557-0cb819c7656b	000d0000-56ab-757e-e99e-851f699f0fce	\N	00090000-56ab-757e-6764-51eaade28cbf	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56ab-757e-710b-4fc171e177e9	000d0000-56ab-757e-61e5-504ee2b2ba41	\N	00090000-56ab-757e-d791-698e54e7db90	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56ab-757e-c2e0-aa4b25495ff4	000d0000-56ab-757e-09ba-9c7b8be9aaa8	\N	00090000-56ab-757e-505f-a3d47ba8d34f	000b0000-56ab-757e-b08a-5598173f5af5	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56ab-757e-33f1-74c61f6d7831	000d0000-56ab-757e-543e-64a4d28e3c77	00100000-56ab-757e-180a-dd13247c6e5c	00090000-56ab-757e-577e-4b257e1ed110	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56ab-757e-fc5a-8096be828f51	000d0000-56ab-757e-b560-21a980732e04	\N	00090000-56ab-757e-cc05-e729c756c020	000b0000-56ab-757e-e524-b72b613db972	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56ab-757e-1bb0-eec53e00f9a0	000d0000-56ab-757e-543e-64a4d28e3c77	00100000-56ab-757e-2864-997be6822b55	00090000-56ab-757e-a3f7-fff2d7cf07e3	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56ab-757e-425d-f4d859dcddcf	000d0000-56ab-757e-543e-64a4d28e3c77	00100000-56ab-757e-6b99-556cd2009116	00090000-56ab-757e-f31e-98209912cb3d	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56ab-757e-5b09-eae1d843170f	000d0000-56ab-757e-543e-64a4d28e3c77	00100000-56ab-757e-9629-043151a772f5	00090000-56ab-757e-705c-0e68b076a29f	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56ab-757e-7c3d-77016976c03b	000d0000-56ab-757e-2966-ef4a84159ef4	00100000-56ab-757e-7249-7dc8dda2ceae	00090000-56ab-757e-2bab-897a2f0663e3	000b0000-56ab-757e-93bf-3de584c0c010	0012	t	\N	\N	\N	2	t	t	t
000c0000-56ab-757e-51c3-11e816dd7b1a	000d0000-56ab-757e-04b7-403d3f45f092	\N	00090000-56ab-757e-cc05-e729c756c020	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56ab-757e-ebc7-10e2a639487e	000d0000-56ab-757e-04b7-403d3f45f092	\N	00090000-56ab-757e-f77a-dcfbd474848e	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56ab-757e-3a73-df25c345831d	000d0000-56ab-757e-c862-1b020f074668	00100000-56ab-757e-c063-cd98119e70f1	00090000-56ab-757e-10eb-a3e9b4528d68	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56ab-757e-2146-94e0a261fb07	000d0000-56ab-757e-c862-1b020f074668	\N	00090000-56ab-757e-f77a-dcfbd474848e	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56ab-757e-7099-6e3b5285cb64	000d0000-56ab-757e-212f-9fa34e41e0a5	\N	00090000-56ab-757e-f77a-dcfbd474848e	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56ab-757e-c223-7c19dc9a2101	000d0000-56ab-757e-212f-9fa34e41e0a5	\N	00090000-56ab-757e-cc05-e729c756c020	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56ab-757f-a6db-9861c54a66a2	000d0000-56ab-757e-f8f1-99fb27384ad4	00100000-56ab-757e-180a-dd13247c6e5c	00090000-56ab-757e-577e-4b257e1ed110	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56ab-757f-8708-beffdbc390e6	000d0000-56ab-757e-f8f1-99fb27384ad4	\N	00090000-56ab-757e-f77a-dcfbd474848e	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56ab-757f-42f0-72e88662946c	000d0000-56ab-757e-d149-56831abdab08	\N	00090000-56ab-757e-f77a-dcfbd474848e	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56ab-757f-494c-2b95ccb54c0d	000d0000-56ab-757e-d149-56831abdab08	00100000-56ab-757e-180a-dd13247c6e5c	00090000-56ab-757e-577e-4b257e1ed110	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56ab-757f-e9d5-d4a5d8bfed4e	000d0000-56ab-757e-a63f-27dfca5a198d	\N	00090000-56ab-757e-f77a-dcfbd474848e	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56ab-757f-9713-ed6cbf46fd2f	000d0000-56ab-757e-be44-9a7a325fabb4	\N	00090000-56ab-757e-cc05-e729c756c020	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56ab-757f-c6c4-b13b47c0a23d	000d0000-56ab-757e-be98-be943747aa1c	\N	00090000-56ab-757e-cc05-e729c756c020	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56ab-757f-ca6f-8a913de2a4c1	000d0000-56ab-757e-be98-be943747aa1c	00100000-56ab-757e-c063-cd98119e70f1	00090000-56ab-757e-10eb-a3e9b4528d68	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56ab-757f-3697-d6d83f563685	000d0000-56ab-757e-3100-90b9ab81a8ff	\N	00090000-56ab-757e-e977-424a605d168d	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56ab-757f-995c-587d96e4f56d	000d0000-56ab-757e-3100-90b9ab81a8ff	\N	00090000-56ab-757e-5651-392676a7dce9	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56ab-757f-754f-8890b081fe1a	000d0000-56ab-757e-61b7-733ec83cb552	\N	00090000-56ab-757e-cc05-e729c756c020	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56ab-757f-a097-8dc27f57514e	000d0000-56ab-757e-61b7-733ec83cb552	00100000-56ab-757e-c063-cd98119e70f1	00090000-56ab-757e-10eb-a3e9b4528d68	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56ab-757f-f1ea-5f583eebf0f4	000d0000-56ab-757e-61b7-733ec83cb552	\N	00090000-56ab-757e-5651-392676a7dce9	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56ab-757f-525f-ed574003d778	000d0000-56ab-757e-61b7-733ec83cb552	\N	00090000-56ab-757e-e977-424a605d168d	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56ab-757f-0da0-cb0adbdc5388	000d0000-56ab-757e-ab95-cf044a97aa84	\N	00090000-56ab-757e-cc05-e729c756c020	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56ab-757f-3334-9f63552af62f	000d0000-56ab-757e-43fb-91b2a18c06ae	00100000-56ab-757e-c063-cd98119e70f1	00090000-56ab-757e-10eb-a3e9b4528d68	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56ab-757f-b6b1-f05b86948e77	000d0000-56ab-757e-43fb-91b2a18c06ae	\N	00090000-56ab-757e-f77a-dcfbd474848e	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 41961749)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 41961140)
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
-- TOC entry 3191 (class 0 OID 41961626)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56ab-757e-2be1-788f6f4fa4e8	00160000-56ab-757e-bf6b-5a52f053008d	00090000-56ab-757e-5651-392676a7dce9	aizv	10	t
003d0000-56ab-757e-fa95-f978a9bf15bb	00160000-56ab-757e-bf6b-5a52f053008d	00090000-56ab-757e-e9af-89beec2c9022	apri	14	t
003d0000-56ab-757e-33d6-b9ec8e087272	00160000-56ab-757e-4b12-f31a1b094426	00090000-56ab-757e-e977-424a605d168d	aizv	11	t
003d0000-56ab-757e-592c-91c225c3b6b3	00160000-56ab-757e-cb02-d155192bd1e1	00090000-56ab-757e-aea5-308e6c95fc28	aizv	12	t
003d0000-56ab-757e-13e3-6e213433e912	00160000-56ab-757e-bf6b-5a52f053008d	00090000-56ab-757e-f77a-dcfbd474848e	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 41961656)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56ab-757e-bf6b-5a52f053008d	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56ab-757e-4b12-f31a1b094426	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56ab-757e-cb02-d155192bd1e1	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 41962068)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 41961462)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 41961387)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva, nadrejenogostovanje_id) FROM stdin;
00180000-56ab-757e-b3f8-36c0f7f7b319	\N	\N	\N	\N	00440000-56ab-757e-6f83-e0b63e33f6f3	00220000-56ab-757e-ecf3-81c18eae2759	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N	\N
00180000-56ab-757e-8cc4-499de5f045d0	\N	\N	\N	\N	00440000-56ab-757e-243b-6f6a68abafaa	00220000-56ab-757e-6a03-56eaf8554678	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N	\N
00180000-56ab-757e-ec6a-a6878e17b4ed	\N	\N	\N	001e0000-56ab-757e-d9f1-39dd4dc910dd	\N	00220000-56ab-757e-ecf3-81c18eae2759	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N	\N
00180000-56ab-757e-941d-4750b5103ff4	\N	\N	\N	001e0000-56ab-757e-2be5-bf5f79bdc11a	\N	00220000-56ab-757e-6a03-56eaf8554678	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N	\N
00180000-56ab-757f-01d7-59b2eefd32b0	\N	00200000-56ab-757f-c3e7-bb04710649f8	\N	\N	\N	00220000-56ab-757e-e1a1-92fd6b1af26b	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	Vaja 1.	\N	\N
00180000-56ab-757f-5d8c-40d3518305ec	\N	00200000-56ab-757f-8c1f-e68b470a0fcd	\N	\N	\N	00220000-56ab-757e-e1a1-92fd6b1af26b	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	Vaja 2.	\N	\N
00180000-56ab-757f-e2a7-bc9edb8965ab	\N	00200000-56ab-757f-7cda-7e808f1f28f4	\N	\N	\N	00220000-56ab-757e-6a03-56eaf8554678	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 3.	\N	\N
00180000-56ab-757f-4bfc-06c7d592ab5b	\N	00200000-56ab-757f-6ea1-200038417e87	\N	\N	\N	00220000-56ab-757e-f66c-0145731184a1	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	Vaja 4.	\N	\N
00180000-56ab-757f-6583-b08c9dc7403d	\N	00200000-56ab-757f-c1de-0f13d754dac3	\N	\N	\N	00220000-56ab-757e-4cc5-efdcfe5f0092	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	Vaja 5.	\N	\N
00180000-56ab-757f-3bb3-884d36842025	\N	00200000-56ab-757f-0b15-12c9010b0bd8	\N	\N	\N	00220000-56ab-757e-6a03-56eaf8554678	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 6.	\N	\N
00180000-56ab-757f-e39b-62b8098d2438	\N	00200000-56ab-757f-964a-89c1afbdadf9	\N	\N	\N	00220000-56ab-757e-4cc5-efdcfe5f0092	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 7.	\N	\N
00180000-56ab-757f-1f0c-4c8f3a56d46f	\N	00200000-56ab-757f-d584-29f859dd68e2	\N	\N	\N	00220000-56ab-757e-4cc5-efdcfe5f0092	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 8.	\N	\N
00180000-56ab-757f-655a-7e5b4e5340af	\N	00200000-56ab-757f-1c3a-84f193e12129	\N	\N	\N	00220000-56ab-757e-e1a1-92fd6b1af26b	001f0000-56ab-757e-45ca-f60e80f3de81	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	Vaja 9.	\N	\N
00180000-56ab-757f-3ded-1fffef82ff97	\N	00200000-56ab-757f-c531-65c108eb3622	\N	\N	\N	00220000-56ab-757e-e1a1-92fd6b1af26b	001f0000-56ab-757e-45ca-f60e80f3de81	2014-06-11 07:00:00	2014-06-12 15:00:00	400s	200s	\N	Vaja 10.	\N	\N
00180000-56ab-757f-a1a0-07bab08ac95f	\N	\N	001c0000-56ab-757f-bde3-16292dfe25ad	\N	\N	\N	001f0000-56ab-757e-002a-c3ddaf6b39eb	2015-03-10 07:00:00	2015-03-20 23:00:00	200s	300s	\N	Gostovanje 1.	#001122	\N
00180000-56ab-757f-b51a-8610c9703966	001b0000-56ab-757f-e006-51ef9e682ffa	\N	\N	\N	\N	00220000-56ab-757e-ecf3-81c18eae2759	001f0000-56ab-757e-45ca-f60e80f3de81	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N	\N
00180000-56ab-757f-90df-3f828aea8955	001b0000-56ab-757f-c7e6-adc3446cd47c	\N	\N	\N	\N	00220000-56ab-757e-6a03-56eaf8554678	001f0000-56ab-757e-45ca-f60e80f3de81	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N	\N
00180000-56ab-757f-6109-a6c40deba6f8	001b0000-56ab-757f-f891-6c14b5126157	\N	\N	\N	\N	00220000-56ab-757e-ecf3-81c18eae2759	001f0000-56ab-757e-45ca-f60e80f3de81	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N	\N
00180000-56ab-757f-07ae-f10793126370	001b0000-56ab-757f-a022-9bee5bc20074	\N	\N	\N	\N	00220000-56ab-757e-ecf3-81c18eae2759	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N	\N
00180000-56ab-757f-8a71-8825a58b24f7	001b0000-56ab-757f-1883-95f99e86d16b	\N	\N	\N	\N	00220000-56ab-757e-ecf3-81c18eae2759	001f0000-56ab-757e-002a-c3ddaf6b39eb	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N	\N
00180000-56ab-757f-7a13-3ea1319fb762	001b0000-56ab-757f-fd9f-eb8c7ba52173	\N	\N	\N	\N	00220000-56ab-757e-ecf3-81c18eae2759	001f0000-56ab-757e-002a-c3ddaf6b39eb	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N	\N
00180000-56ab-757f-e1ed-aa6ed0ea5c45	001b0000-56ab-757f-14e5-a946e248594d	\N	\N	\N	\N	00220000-56ab-757e-ecf3-81c18eae2759	001f0000-56ab-757e-45ca-f60e80f3de81	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N	\N
00180000-56ab-757f-9aad-dd87b648d46a	001b0000-56ab-757f-df0a-ef1693d41b2f	\N	\N	\N	\N	00220000-56ab-757e-ecf3-81c18eae2759	001f0000-56ab-757e-002a-c3ddaf6b39eb	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N	\N
00180000-56ab-757f-b14e-c5159f4af1df	001b0000-56ab-757f-b058-6b5154480820	\N	\N	\N	\N	00220000-56ab-757e-ecf3-81c18eae2759	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N	\N
00180000-56ab-757f-3116-5865b3b64a7a	001b0000-56ab-757f-ed84-dd7ae0b15356	\N	\N	\N	\N	00220000-56ab-757e-ecf3-81c18eae2759	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N	\N
00180000-56ab-757f-16a6-88de4ee0ab71	001b0000-56ab-757f-61c9-24e02f5bdfe6	\N	\N	\N	\N	00220000-56ab-757e-ecf3-81c18eae2759	001f0000-56ab-757e-002a-c3ddaf6b39eb	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N	\N
00180000-56ab-757f-4e19-864cb422cbde	001b0000-56ab-757f-54b3-39034dd9e353	\N	\N	\N	\N	00220000-56ab-757e-ecf3-81c18eae2759	001f0000-56ab-757e-a4fe-efc9e7fb3f52	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N	\N
00180000-56ab-757f-4878-a17d6538639b	001b0000-56ab-757f-da59-b722a3a0d11b	\N	\N	\N	\N	00220000-56ab-757e-ecf3-81c18eae2759	001f0000-56ab-757e-a4fe-efc9e7fb3f52	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N	\N
00180000-56ab-757f-53d7-5b214366b645	001b0000-56ab-757f-222d-eb013353613b	\N	\N	\N	\N	00220000-56ab-757e-ecf3-81c18eae2759	001f0000-56ab-757e-002a-c3ddaf6b39eb	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N	\N
00180000-56ab-757f-becf-78cf1116ea4c	001b0000-56ab-757f-dc93-c8d77f6ef4e3	\N	\N	\N	\N	\N	001f0000-56ab-757e-002a-c3ddaf6b39eb	2015-03-15 20:00:00	2015-03-15 23:00:00	200s	100s	\N	Predstava 15.	\N	001c0000-56ab-757f-bde3-16292dfe25ad
00180000-56ab-757f-6ec3-9c1b7c387ed0	001b0000-56ab-757f-d5d4-8138d0968bcb	\N	\N	\N	\N	\N	001f0000-56ab-757e-002a-c3ddaf6b39eb	2015-03-16 20:00:00	2015-03-16 23:00:00	200s	100s	\N	Predstava 16.	\N	001c0000-56ab-757f-bde3-16292dfe25ad
\.


--
-- TOC entry 3166 (class 0 OID 41961413)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56ab-757e-d9f1-39dd4dc910dd
001e0000-56ab-757e-2be5-bf5f79bdc11a
\.


--
-- TOC entry 3167 (class 0 OID 41961418)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56ab-757e-6f83-e0b63e33f6f3
00440000-56ab-757e-243b-6f6a68abafaa
\.


--
-- TOC entry 3209 (class 0 OID 41961990)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 41961293)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56ab-757b-efe8-28b5d56bcba9	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56ab-757b-1b79-acd1de812da1	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56ab-757b-6994-cec35d3d5f8d	AL	ALB	008	Albania 	Albanija	\N
00040000-56ab-757b-92ff-e3802a1c2816	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56ab-757b-60bf-d4cee8ca2d88	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56ab-757b-873e-89d1c3516706	AD	AND	020	Andorra 	Andora	\N
00040000-56ab-757b-e7bf-33457e3d5276	AO	AGO	024	Angola 	Angola	\N
00040000-56ab-757b-07ed-6cc2028b4b98	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56ab-757b-f902-8cb0c3226e04	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56ab-757b-6f22-27a76bf0ec68	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56ab-757b-c670-d41f9f63950c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56ab-757b-2dc5-2d694c1a0248	AM	ARM	051	Armenia 	Armenija	\N
00040000-56ab-757b-2631-ab7f782ec0dc	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56ab-757b-34c7-798da04c59b2	AU	AUS	036	Australia 	Avstralija	\N
00040000-56ab-757b-6784-8732bcfdde10	AT	AUT	040	Austria 	Avstrija	\N
00040000-56ab-757b-50af-514ac773987b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56ab-757b-45f5-e878a288b2ae	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56ab-757b-6fab-80e0d111f06e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56ab-757b-9ef4-828296d72ac4	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56ab-757b-cb9e-26eddcde4db2	BB	BRB	052	Barbados 	Barbados	\N
00040000-56ab-757b-77d0-fd8bdd8b31b5	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56ab-757b-7183-ac3649c1f67c	BE	BEL	056	Belgium 	Belgija	\N
00040000-56ab-757b-e55a-5bb8ccbe82ba	BZ	BLZ	084	Belize 	Belize	\N
00040000-56ab-757b-8e25-78f1d2196fbf	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56ab-757b-cb24-0139cee3ea99	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56ab-757b-b3c2-4549334886fb	BT	BTN	064	Bhutan 	Butan	\N
00040000-56ab-757b-62bf-5d1ce8b2ee79	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56ab-757b-948e-412b1eebae72	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56ab-757b-25da-788a326d091f	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56ab-757b-6280-9e7f1fd0982f	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56ab-757b-dab2-89efd3b615d1	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56ab-757b-f059-6122c44dfe6f	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56ab-757b-ba0e-877422bbe06f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56ab-757b-c359-c6918a29fea9	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56ab-757b-f607-1ab6edf97b56	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56ab-757b-73a5-0f8f5c4b3986	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56ab-757b-2118-713c3396617b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56ab-757b-d0c3-ab491b15018a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56ab-757b-c17c-1ad1a0c29da7	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56ab-757b-d631-5d7d360cfe60	CA	CAN	124	Canada 	Kanada	\N
00040000-56ab-757b-0aa2-10dff5cc816d	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56ab-757b-435b-c53fb1412cfc	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56ab-757b-e323-1b25c5f81325	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56ab-757b-5de9-c944bbf98264	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56ab-757b-6929-d248724da8c6	CL	CHL	152	Chile 	Čile	\N
00040000-56ab-757b-574e-36f0556de309	CN	CHN	156	China 	Kitajska	\N
00040000-56ab-757b-46e5-6adcc7d855de	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56ab-757b-8f06-69bb033e66a4	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56ab-757b-e48e-ece4401a44d3	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56ab-757b-aa79-ff21d8ed867d	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56ab-757b-7f47-b50545276980	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56ab-757b-7598-b0926778e7ee	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56ab-757b-1c77-e29aea19d6ad	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56ab-757b-c208-ac8353a4ab1a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56ab-757b-f1dd-0e0b50cf488c	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56ab-757b-4709-ce4742a0272a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56ab-757b-97be-a32f17d9d7e5	CU	CUB	192	Cuba 	Kuba	\N
00040000-56ab-757b-fc1e-4a7f193d098b	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56ab-757b-c25f-5366832b360f	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56ab-757b-415c-7a72e0055904	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56ab-757b-83c4-b519046cbec6	DK	DNK	208	Denmark 	Danska	\N
00040000-56ab-757b-bb58-6cec99cd0a72	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56ab-757b-28d4-620d90d7ab91	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56ab-757b-2366-78dfbb0121d6	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56ab-757b-bebc-a1602ccb5ba4	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56ab-757b-c1fa-f9d67d299dac	EG	EGY	818	Egypt 	Egipt	\N
00040000-56ab-757b-3fd9-47d3a74a412f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56ab-757b-1b86-9a57f2cb6a6e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56ab-757b-e64e-88472140b486	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56ab-757b-9ec5-df46aa71b7ed	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56ab-757b-89c2-5f8e76eaa1ae	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56ab-757b-395d-f4f6ed018e26	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56ab-757b-1557-9890cdb2f500	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56ab-757b-c5b9-eb1b92b5d7ce	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56ab-757b-d48e-daadba0013ba	FI	FIN	246	Finland 	Finska	\N
00040000-56ab-757b-5058-34a65b5cbaaa	FR	FRA	250	France 	Francija	\N
00040000-56ab-757b-0048-92b348beeb92	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56ab-757b-2116-54da5b026c6f	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56ab-757b-2c0a-c3ab3026901f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56ab-757b-eeac-b6b3a4405781	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56ab-757b-5949-8b505b4d14f9	GA	GAB	266	Gabon 	Gabon	\N
00040000-56ab-757b-ebbd-55e789f3adb4	GM	GMB	270	Gambia 	Gambija	\N
00040000-56ab-757b-0fe7-10f69c9e1baf	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56ab-757b-dfc8-e0432b3ebbec	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56ab-757b-4d5d-92ed73f35214	GH	GHA	288	Ghana 	Gana	\N
00040000-56ab-757b-f03d-454ff35420d1	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56ab-757b-bd7e-33559c413211	GR	GRC	300	Greece 	Grčija	\N
00040000-56ab-757b-7b4e-4f7a7939616b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56ab-757b-57c0-b6f3574b414d	GD	GRD	308	Grenada 	Grenada	\N
00040000-56ab-757b-cce2-862c1fa6781e	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56ab-757b-0a96-7de95e2fedd7	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56ab-757b-3b47-283e866f11bc	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56ab-757b-2a34-45f0af2a3803	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56ab-757b-4327-f18bd629e9c5	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56ab-757b-8e17-09ed5d886080	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56ab-757b-52c3-31ea52d3eb19	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56ab-757b-3dbd-a7272317d1de	HT	HTI	332	Haiti 	Haiti	\N
00040000-56ab-757b-a69b-76a555e34791	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56ab-757b-d75a-eec492663d9f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56ab-757b-5829-6f757a78b1fb	HN	HND	340	Honduras 	Honduras	\N
00040000-56ab-757b-e7c4-d76fb8341f99	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56ab-757b-1db6-0013e1587a8d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56ab-757b-3645-8886c44de82a	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56ab-757b-fd22-a7c2f0a7611d	IN	IND	356	India 	Indija	\N
00040000-56ab-757b-8387-d89ca3d1a512	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56ab-757b-80b9-b0f1f71390dd	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56ab-757b-9f7b-41b4330348f6	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56ab-757b-5fb2-79bc97ccb400	IE	IRL	372	Ireland 	Irska	\N
00040000-56ab-757b-fdda-53d913d2d0ac	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56ab-757b-d80f-0a2e29bb2061	IL	ISR	376	Israel 	Izrael	\N
00040000-56ab-757b-52d8-44d975e8452a	IT	ITA	380	Italy 	Italija	\N
00040000-56ab-757b-cef2-0fdf73ab9a4f	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56ab-757b-859c-30ac23cff24a	JP	JPN	392	Japan 	Japonska	\N
00040000-56ab-757b-b44e-299c461deb8f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56ab-757b-dbb2-629ef5c844ca	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56ab-757b-f56e-bcb9415065dc	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56ab-757b-eb25-cb01085efdb0	KE	KEN	404	Kenya 	Kenija	\N
00040000-56ab-757b-33a6-29bab22c030d	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56ab-757b-e726-7097d39bf798	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56ab-757b-d85e-35d22de29492	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56ab-757b-24ee-14c9f6cea7a6	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56ab-757b-0c9b-b1740556906b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56ab-757b-1dd1-193e1df50c4a	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56ab-757b-d034-3b819ad03aba	LV	LVA	428	Latvia 	Latvija	\N
00040000-56ab-757b-77b1-931170b6d76d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56ab-757b-778c-5c149985bab7	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56ab-757b-4bfb-b0f95f12e6bd	LR	LBR	430	Liberia 	Liberija	\N
00040000-56ab-757b-35a8-dc162680a5a9	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56ab-757b-eb12-b7243bb2f940	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56ab-757b-f77b-5e19e6a3ba90	LT	LTU	440	Lithuania 	Litva	\N
00040000-56ab-757b-a2b4-589b5c2fdff4	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56ab-757b-5074-4bd569ad653b	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56ab-757b-8ebe-582f29cca241	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56ab-757b-4122-33933cbb38d0	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56ab-757b-2ffe-526035ee74e9	MW	MWI	454	Malawi 	Malavi	\N
00040000-56ab-757b-b715-d303c10d0d28	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56ab-757b-178f-905224dfc643	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56ab-757b-d653-432b33c9c1e6	ML	MLI	466	Mali 	Mali	\N
00040000-56ab-757b-fcb8-235524a7271c	MT	MLT	470	Malta 	Malta	\N
00040000-56ab-757b-35ab-8011e19be2e9	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56ab-757b-4f2f-9eee3f619d35	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56ab-757b-0de0-a1ad51991fb8	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56ab-757b-95b3-ce03539da104	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56ab-757b-f0dd-e49093da7ada	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56ab-757b-7845-db9573cced2b	MX	MEX	484	Mexico 	Mehika	\N
00040000-56ab-757b-a186-c08c79f25df6	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56ab-757b-08fc-26f2930441c7	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56ab-757b-a6a6-e3be72a94090	MC	MCO	492	Monaco 	Monako	\N
00040000-56ab-757b-6775-bf9623455a8e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56ab-757b-fb68-5f7f8b0b5fe8	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56ab-757b-3207-3db8b00bd6ae	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56ab-757b-51ff-833c417a1f71	MA	MAR	504	Morocco 	Maroko	\N
00040000-56ab-757b-20e5-e9c8e00d8cc2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56ab-757b-8fcc-1eaec45d1caf	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56ab-757b-8554-a6128c93a9b4	NA	NAM	516	Namibia 	Namibija	\N
00040000-56ab-757b-3509-69371780f7e5	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56ab-757b-6f81-04f243ba13cd	NP	NPL	524	Nepal 	Nepal	\N
00040000-56ab-757b-657b-5aaa87f0e0db	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56ab-757b-7980-69289cf6f4ff	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56ab-757b-0b6e-992cef5023b0	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56ab-757b-b590-d78c2ebbcf24	NE	NER	562	Niger 	Niger 	\N
00040000-56ab-757b-2f7c-80495ee4f451	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56ab-757b-7a72-ce4e5f7f22c0	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56ab-757b-5b85-951d4f1cae61	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56ab-757b-1744-ed8e538b7820	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56ab-757b-f292-1a2c1d2592aa	NO	NOR	578	Norway 	Norveška	\N
00040000-56ab-757b-692a-6953d2a271db	OM	OMN	512	Oman 	Oman	\N
00040000-56ab-757b-8440-0737ba8515d9	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56ab-757b-5b0e-5c9537a5da79	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56ab-757b-a08a-05ecd9b8f6cd	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56ab-757b-4df1-ba41f0ffd2ca	PA	PAN	591	Panama 	Panama	\N
00040000-56ab-757b-15d7-4bc8056d54b7	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56ab-757b-57b5-b09ca6c507f6	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56ab-757b-5082-9435d9334933	PE	PER	604	Peru 	Peru	\N
00040000-56ab-757b-c440-c8cce2824a30	PH	PHL	608	Philippines 	Filipini	\N
00040000-56ab-757b-a75e-996a2f1df27a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56ab-757b-7f69-76a4aa216764	PL	POL	616	Poland 	Poljska	\N
00040000-56ab-757b-141c-57a87a7c3caa	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56ab-757b-d2d8-138aa591312d	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56ab-757b-3b75-dc7eebb50537	QA	QAT	634	Qatar 	Katar	\N
00040000-56ab-757b-5864-42870894b413	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56ab-757b-8714-db5b5e4452b4	RO	ROU	642	Romania 	Romunija	\N
00040000-56ab-757b-b976-796d55e97294	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56ab-757b-88ee-1c5b333b05c5	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56ab-757b-6672-1a956ba3b4e5	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56ab-757b-6b1a-6798b6ef6d6e	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56ab-757b-cd77-53cc66c64b59	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56ab-757b-fc7a-30a73b402798	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56ab-757b-408b-5228b20fad96	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56ab-757b-1c05-ba65eada2d63	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56ab-757b-2daa-925fb18ddfd6	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56ab-757b-ba25-26c1c74093d0	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56ab-757b-9a4a-3aee9993edc4	SM	SMR	674	San Marino 	San Marino	\N
00040000-56ab-757b-bffb-e6980fe9bf17	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56ab-757b-92cc-353b29ad4007	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56ab-757b-2063-d04b3469156d	SN	SEN	686	Senegal 	Senegal	\N
00040000-56ab-757b-45cd-2fbaa4607c41	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56ab-757b-8128-ef86365df475	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56ab-757b-e585-4dee685b1aa4	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56ab-757b-1186-46c4fe5adf77	SG	SGP	702	Singapore 	Singapur	\N
00040000-56ab-757b-535a-bce403a3fb90	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56ab-757b-2d31-e6e185caf8a4	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56ab-757b-db7f-3d3c80c3f958	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56ab-757b-8ae3-78e2dc0797de	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56ab-757b-7f0f-0050f01327bb	SO	SOM	706	Somalia 	Somalija	\N
00040000-56ab-757b-1630-0a4069222217	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56ab-757b-4c9c-dd8f9a00c33a	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56ab-757b-bdcd-f7aa168604c6	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56ab-757b-5f0a-b1cbdc84d147	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56ab-757b-dcdf-16439dfefd56	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56ab-757b-fe02-c1f92c37e659	SD	SDN	729	Sudan 	Sudan	\N
00040000-56ab-757b-bae0-21ab73a5dc32	SR	SUR	740	Suriname 	Surinam	\N
00040000-56ab-757b-b4f8-9e8bc3dcd89b	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56ab-757b-03e3-d095b16dab79	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56ab-757b-99d2-2e0ca89a6744	SE	SWE	752	Sweden 	Švedska	\N
00040000-56ab-757b-188a-13c80b53923a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56ab-757b-1c66-2451094ede8c	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56ab-757b-e7c4-198a72ee9bd5	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56ab-757b-483f-0b8c027e627e	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56ab-757b-2407-54b2da54c946	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56ab-757b-2009-1da191a35212	TH	THA	764	Thailand 	Tajska	\N
00040000-56ab-757b-e66a-d9d7e7b9d83c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56ab-757b-10f1-9b2107e6caf1	TG	TGO	768	Togo 	Togo	\N
00040000-56ab-757b-44c2-f6d7e9fbe815	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56ab-757b-a91b-c50c7714e5e7	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56ab-757b-676d-c6b8ae26ca8b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56ab-757b-4e3e-eb50c1c13938	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56ab-757b-3432-d46fc91398e8	TR	TUR	792	Turkey 	Turčija	\N
00040000-56ab-757b-34a2-69c826fe06eb	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56ab-757b-15cb-ffa88050c32e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56ab-757b-567d-7b60040d9893	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56ab-757b-9f8b-6bc132797800	UG	UGA	800	Uganda 	Uganda	\N
00040000-56ab-757b-ce38-a048563ab090	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56ab-757b-a0ea-e0f855a12a3e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56ab-757b-a33c-b7b56b4d81e9	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56ab-757b-7024-85a91ec114fa	US	USA	840	United States 	Združene države Amerike	\N
00040000-56ab-757b-2347-ea8550462e92	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56ab-757b-1545-bda82ee8f96f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56ab-757b-ab60-33124d787bd7	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56ab-757b-1ab4-81ac9e2f4a70	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56ab-757b-d32f-7a9671139591	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56ab-757b-45a1-aa1dfe1e2ec8	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56ab-757b-7fee-92fcd2025542	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56ab-757b-e028-6084ed930529	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56ab-757b-af22-9b880c9682dd	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56ab-757b-08bc-e4fa2369a1ca	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56ab-757b-443a-350ec9d556a0	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56ab-757b-dd62-40fcb8c738e9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56ab-757b-4328-61f361871389	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 41961778)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56ab-757e-7275-574f8bc15ae0	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56ab-757e-0c77-37e360f38733	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56ab-757e-7cfb-c2aca0b18fa0	000e0000-56ab-757e-d82f-6a342e69ca90	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56ab-757b-6521-3000eca93e80	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56ab-757e-91c3-e2b17401c85b	000e0000-56ab-757e-4c97-0703349a8fcb	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56ab-757b-ea13-228a481239f5	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56ab-757e-0cb7-aebe1f46f825	000e0000-56ab-757e-8e07-328abb16242e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56ab-757b-6521-3000eca93e80	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 41961584)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56ab-757e-eba8-9c924734e817	000e0000-56ab-757e-4c97-0703349a8fcb	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56ab-757b-1c97-755406bf7088
000d0000-56ab-757e-09b0-c645844f99bc	000e0000-56ab-757e-4436-b800cbcd1a96	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56ab-757b-b996-ea4205991a0b
000d0000-56ab-757e-00e3-138d7e4dcf63	000e0000-56ab-757e-4436-b800cbcd1a96	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56ab-757b-ed9b-98c11e9716f5
000d0000-56ab-757e-9b3c-26a33d8ecd76	000e0000-56ab-757e-4c97-0703349a8fcb	000c0000-56ab-757e-8805-c7e952dd1f2c	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56ab-757b-b996-ea4205991a0b
000d0000-56ab-757e-a2a0-4a9de99fe0a7	000e0000-56ab-757e-4c97-0703349a8fcb	000c0000-56ab-757e-c02c-eb20ca277a69	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56ab-757b-ed9b-98c11e9716f5
000d0000-56ab-757e-71c0-a000119cf6e0	000e0000-56ab-757e-4c97-0703349a8fcb	000c0000-56ab-757e-47e4-d56352a2fa77	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56ab-757b-cf75-8e66e03b5e52
000d0000-56ab-757e-e99e-851f699f0fce	000e0000-56ab-757e-4c97-0703349a8fcb	000c0000-56ab-757e-8557-0cb819c7656b	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56ab-757b-1c97-755406bf7088
000d0000-56ab-757e-61e5-504ee2b2ba41	000e0000-56ab-757e-4c97-0703349a8fcb	000c0000-56ab-757e-710b-4fc171e177e9	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56ab-757b-1c97-755406bf7088
000d0000-56ab-757e-09ba-9c7b8be9aaa8	000e0000-56ab-757e-4c97-0703349a8fcb	000c0000-56ab-757e-c2e0-aa4b25495ff4	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56ab-757b-b996-ea4205991a0b
000d0000-56ab-757e-543e-64a4d28e3c77	000e0000-56ab-757e-4c97-0703349a8fcb	000c0000-56ab-757e-1bb0-eec53e00f9a0	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56ab-757b-b996-ea4205991a0b
000d0000-56ab-757e-b560-21a980732e04	000e0000-56ab-757e-4c97-0703349a8fcb	000c0000-56ab-757e-fc5a-8096be828f51	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56ab-757b-8852-06194e4b0b3b
000d0000-56ab-757e-2966-ef4a84159ef4	000e0000-56ab-757e-4c97-0703349a8fcb	000c0000-56ab-757e-7c3d-77016976c03b	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56ab-757b-ac60-73f4ca12bd31
000d0000-56ab-757e-04b7-403d3f45f092	000e0000-56ab-757e-95f6-55cea972dd60	000c0000-56ab-757e-51c3-11e816dd7b1a	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56ab-757b-ed9b-98c11e9716f5
000d0000-56ab-757e-c862-1b020f074668	000e0000-56ab-757e-4ca4-9628de032a0e	000c0000-56ab-757e-3a73-df25c345831d	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56ab-757b-ed9b-98c11e9716f5
000d0000-56ab-757e-212f-9fa34e41e0a5	000e0000-56ab-757e-4ca4-9628de032a0e	000c0000-56ab-757e-7099-6e3b5285cb64	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56ab-757b-ed9b-98c11e9716f5
000d0000-56ab-757e-f8f1-99fb27384ad4	000e0000-56ab-757e-62b4-1ec99a2f9e85	000c0000-56ab-757f-a6db-9861c54a66a2	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56ab-757b-ed9b-98c11e9716f5
000d0000-56ab-757e-d149-56831abdab08	000e0000-56ab-757e-40af-34f2c6945535	000c0000-56ab-757f-42f0-72e88662946c	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56ab-757b-ed9b-98c11e9716f5
000d0000-56ab-757e-a63f-27dfca5a198d	000e0000-56ab-757e-4e52-ab62cc00254b	000c0000-56ab-757f-e9d5-d4a5d8bfed4e	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56ab-757b-ed9b-98c11e9716f5
000d0000-56ab-757e-be44-9a7a325fabb4	000e0000-56ab-757e-5c74-70133f5f5be9	000c0000-56ab-757f-9713-ed6cbf46fd2f	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56ab-757b-ed9b-98c11e9716f5
000d0000-56ab-757e-be98-be943747aa1c	000e0000-56ab-757e-b770-f24e2e55bb4f	000c0000-56ab-757f-c6c4-b13b47c0a23d	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56ab-757b-ed9b-98c11e9716f5
000d0000-56ab-757e-3100-90b9ab81a8ff	000e0000-56ab-757e-8d3a-d08b2d1b89d3	000c0000-56ab-757f-3697-d6d83f563685	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56ab-757b-ed9b-98c11e9716f5
000d0000-56ab-757e-61b7-733ec83cb552	000e0000-56ab-757e-8d3a-d08b2d1b89d3	000c0000-56ab-757f-754f-8890b081fe1a	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56ab-757b-ed9b-98c11e9716f5
000d0000-56ab-757e-ab95-cf044a97aa84	000e0000-56ab-757e-8e40-47710bb75f68	000c0000-56ab-757f-0da0-cb0adbdc5388	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56ab-757b-ed9b-98c11e9716f5
000d0000-56ab-757e-43fb-91b2a18c06ae	000e0000-56ab-757e-8e40-47710bb75f68	000c0000-56ab-757f-3334-9f63552af62f	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56ab-757b-ed9b-98c11e9716f5
\.


--
-- TOC entry 3162 (class 0 OID 41961361)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
001c0000-56ab-757f-bde3-16292dfe25ad	00040000-56ab-757b-3645-8886c44de82a		\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 41961333)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 41961310)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56ab-757e-71e0-109fae9a44a3	00080000-56ab-757e-c8f6-279657cc683e	00090000-56ab-757e-f31e-98209912cb3d	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 41961498)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 41962048)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56ab-757e-76fe-cfad89528ebd	00010000-56ab-757c-c576-b3f070af910c	\N	Prva mapa	Root mapa	2016-01-29 15:21:50	2016-01-29 15:21:50	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 41962061)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 41962083)
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
-- TOC entry 3180 (class 0 OID 41961522)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 41961267)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56ab-757c-7f56-814459b06d55	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56ab-757c-5c55-4758b400a7aa	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56ab-757c-ef30-272308b20d64	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56ab-757c-4ce9-d78745278ccc	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56ab-757c-73ee-0658f1139d94	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56ab-757c-ed64-e25410da7a3f	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56ab-757c-5787-391ea296e4f2	dogodek.delte	array	a:14:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delGosZac";a:2:{s:5:"label";s:37:"Delta začetka pri dogodku gostovanje";s:5:"value";i:0;}s:9:"delGosKon";a:2:{s:5:"label";s:34:"Delta konca pri dogodku gostovanje";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56ab-757c-e4e8-b71964c54ea1	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56ab-757c-ca47-1e1e4c1f07a7	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56ab-757c-b949-b2f321a9aa1b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56ab-757c-a73b-be82c54b31c3	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56ab-757c-188b-5c439dd43b12	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56ab-757c-2c06-0b03a4d2e9fe	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56ab-757c-5601-4b8db86204f2	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56ab-757c-653a-81751eeea7d0	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56ab-757c-dbfd-4f44963635b8	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56ab-757c-d693-fd7534d734ef	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56ab-757e-3234-8a518e08a3dd	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56ab-757e-2d60-108b35a414bb	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56ab-757e-0aee-fc1aed79d751	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56ab-757e-d12a-0206f9cf7884	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56ab-757e-c473-0a9237f550ca	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56ab-757e-8f87-08c9dcdb5dbb	tomaz.barva.ozadja	array	s:4:"siva";	t	f	f	\N	barva ozadja tomaž
00000000-56ab-7580-02f6-cba8b5f28d7e	application.tenant.maticnopodjetje	string	s:36:"00080000-56ab-7580-c5cd-24f36f4a4fe5";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 41961167)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56ab-757e-c527-993bc8af994a	00000000-56ab-757e-3234-8a518e08a3dd	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56ab-757e-67ca-f5699231381e	00000000-56ab-757e-3234-8a518e08a3dd	00010000-56ab-757c-c576-b3f070af910c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56ab-757e-efe8-f8653d37619e	00000000-56ab-757e-2d60-108b35a414bb	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
00000000-56ab-757e-714a-83bd179fd8cf	00000000-56ab-757e-8f87-08c9dcdb5dbb	\N	s:6:"zelena";	t
00000000-56ab-757e-7bcc-4e2b205441bd	00000000-56ab-757e-8f87-08c9dcdb5dbb	00010000-56ab-757c-c576-b3f070af910c	s:6:"rdeča";	f
\.


--
-- TOC entry 3151 (class 0 OID 41961234)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56ab-757e-54b7-562da6c18bb8	\N	00100000-56ab-757e-7249-7dc8dda2ceae	00100000-56ab-757e-c063-cd98119e70f1	01	Gledališče Nimbis
00410000-56ab-757e-c9bd-2a2c39d50a41	00410000-56ab-757e-54b7-562da6c18bb8	00100000-56ab-757e-7249-7dc8dda2ceae	00100000-56ab-757e-c063-cd98119e70f1	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 41961178)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56ab-757e-f03a-4d4644fc6576	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56ab-757e-6764-51eaade28cbf	00010000-56ab-757e-e43c-b15d803f49c9	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56ab-757e-10eb-a3e9b4528d68	00010000-56ab-757e-b144-0c056aefba86	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56ab-757e-a3f7-fff2d7cf07e3	00010000-56ab-757e-3c15-d2ea61d5e54b	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56ab-757e-7e59-4314ba5d14d7	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56ab-757e-505f-a3d47ba8d34f	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56ab-757e-705c-0e68b076a29f	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56ab-757e-577e-4b257e1ed110	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56ab-757e-f31e-98209912cb3d	00010000-56ab-757e-8f88-12754e0d79c8	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56ab-757e-2bab-897a2f0663e3	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56ab-757e-a3d6-8bd9793202f3	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-757e-d791-698e54e7db90	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56ab-757e-cc05-e729c756c020	00010000-56ab-757e-dbb6-33d12c14586c	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-757e-5651-392676a7dce9	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-757e-e9af-89beec2c9022	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-757e-e977-424a605d168d	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-757e-aea5-308e6c95fc28	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-757e-f77a-dcfbd474848e	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56ab-757e-efd4-8736c0dfc10f	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-757e-1216-a437f34e18f8	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56ab-757e-fad5-9f766644a99b	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 41961112)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56ab-757c-5878-c6d0d2cdf96a	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56ab-757c-b4d3-5f1211bf43db	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56ab-757c-1312-648be52992ab	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56ab-757c-4428-5c8a40a08593	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56ab-757c-ace9-a3062f046025	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56ab-757c-dc4b-11f62850a923	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56ab-757c-baa7-9c0abb612357	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56ab-757c-3e4c-dc3260fa0446	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56ab-757c-7424-9564b2f40d09	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56ab-757c-a487-384c41a970c2	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56ab-757c-d976-e0b4abfca2fc	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56ab-757c-ee64-e2d74d7c40f7	Abonma-read	Abonma - branje	t
00030000-56ab-757c-ef6c-9b1cc3e6755f	Abonma-write	Abonma - spreminjanje	t
00030000-56ab-757c-4243-7cdc8f41b848	Alternacija-read	Alternacija - branje	t
00030000-56ab-757c-3771-f9d8538a228b	Alternacija-write	Alternacija - spreminjanje	t
00030000-56ab-757c-2fb4-bd25be4a09d0	Arhivalija-read	Arhivalija - branje	t
00030000-56ab-757c-411d-20b05fb02fd2	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56ab-757c-c8c8-984b248c6497	AuthStorage-read	AuthStorage - branje	t
00030000-56ab-757c-cd0b-4354c1cdae4b	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56ab-757c-8700-17f2ee25676d	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56ab-757c-2c7d-e902c87a706b	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56ab-757c-c4e2-f1101e5718c2	Besedilo-read	Besedilo - branje	t
00030000-56ab-757c-eb1b-68fcde19a06c	Besedilo-write	Besedilo - spreminjanje	t
00030000-56ab-757c-b3b2-be610867e525	Dodatek-read	Dodatek - branje	t
00030000-56ab-757c-43e2-5c41e1d75505	Dodatek-write	Dodatek - spreminjanje	t
00030000-56ab-757c-8646-7e3053764c1b	Dogodek-read	Dogodek - branje	t
00030000-56ab-757c-469a-a982e323334a	Dogodek-write	Dogodek - spreminjanje	t
00030000-56ab-757c-dcc2-4c90d94f3a96	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56ab-757c-d102-6ae6bf2efcc5	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56ab-757c-e943-fba80acffb2f	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56ab-757c-1121-c1766e856571	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56ab-757c-011f-50877df3dba4	DogodekTrait-read	DogodekTrait - branje	t
00030000-56ab-757c-1893-d8df63eebcad	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56ab-757c-3c0e-3a98e5cd3745	DrugiVir-read	DrugiVir - branje	t
00030000-56ab-757c-9f4f-570c22073d4a	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56ab-757c-3458-d738380f4e56	Drzava-read	Drzava - branje	t
00030000-56ab-757c-3792-d44e2bd59d3e	Drzava-write	Drzava - spreminjanje	t
00030000-56ab-757c-acb7-20883e616601	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56ab-757c-1eda-e2cfe6539c7f	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56ab-757c-a27a-cc7f81fd86bc	Funkcija-read	Funkcija - branje	t
00030000-56ab-757c-db12-e91ec1f96bc9	Funkcija-write	Funkcija - spreminjanje	t
00030000-56ab-757c-0cb1-26aba871fe91	Gostovanje-read	Gostovanje - branje	t
00030000-56ab-757c-eb5b-2123d919576f	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56ab-757c-54cb-127d92e3e533	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56ab-757c-218b-9935a7341966	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56ab-757c-fdab-c801455c8298	Kupec-read	Kupec - branje	t
00030000-56ab-757c-f952-fd6f925d393e	Kupec-write	Kupec - spreminjanje	t
00030000-56ab-757c-10ed-2fbdb318176f	NacinPlacina-read	NacinPlacina - branje	t
00030000-56ab-757c-5cd3-b36648d1a5b6	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56ab-757c-21f6-89e0245d20b7	Option-read	Option - branje	t
00030000-56ab-757c-141f-16175cee4694	Option-write	Option - spreminjanje	t
00030000-56ab-757c-9909-b3f42d0dc6a4	OptionValue-read	OptionValue - branje	t
00030000-56ab-757c-6d4b-57d4d101420e	OptionValue-write	OptionValue - spreminjanje	t
00030000-56ab-757c-777d-e55389317f01	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56ab-757c-fa66-5d6c7c2c4acc	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56ab-757c-4d2d-dc63d11469fc	Oseba-read	Oseba - branje	t
00030000-56ab-757c-6d15-1fcb301a4b08	Oseba-write	Oseba - spreminjanje	t
00030000-56ab-757c-362d-5362f8c5d002	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56ab-757c-7b46-bcdf288750cb	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56ab-757c-2eef-c504acbcdd7a	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56ab-757c-ac4b-da6d5666c524	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56ab-757c-529a-fbe085dc051a	Pogodba-read	Pogodba - branje	t
00030000-56ab-757c-e174-86549893dc76	Pogodba-write	Pogodba - spreminjanje	t
00030000-56ab-757c-4726-641c4ebaa1ab	Popa-read	Popa - branje	t
00030000-56ab-757c-0149-6ed0c4b82b85	Popa-write	Popa - spreminjanje	t
00030000-56ab-757c-088c-bb733a02ac37	Posta-read	Posta - branje	t
00030000-56ab-757c-7100-02a7e29e9637	Posta-write	Posta - spreminjanje	t
00030000-56ab-757c-5268-4789806a7af9	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56ab-757c-f711-ffde5d716c95	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56ab-757c-9884-ba314e784f89	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56ab-757c-2d4b-efe85024f4b3	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56ab-757c-777e-0c788d716458	PostniNaslov-read	PostniNaslov - branje	t
00030000-56ab-757c-73b8-4e24920ad1ba	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56ab-757c-e360-cafa07a62cc2	Praznik-read	Praznik - branje	t
00030000-56ab-757c-56d1-24f7d31bb86d	Praznik-write	Praznik - spreminjanje	t
00030000-56ab-757c-9dc7-467d75075495	Predstava-read	Predstava - branje	t
00030000-56ab-757c-0e1e-65ebaa658ae2	Predstava-write	Predstava - spreminjanje	t
00030000-56ab-757c-6e41-b423af7cd52a	Ura-read	Ura - branje	t
00030000-56ab-757c-e618-0b20ac8f3c0f	Ura-write	Ura - spreminjanje	t
00030000-56ab-757c-df10-90c52172adb4	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56ab-757c-1225-5c951a97251c	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56ab-757c-f2c8-565c1dd396b4	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56ab-757c-03c0-ff93c2c19d57	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56ab-757c-23ad-e4860aca5699	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56ab-757c-4fbc-a2ee2e1b75cd	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56ab-757c-7764-091c44c279bc	ProgramDela-read	ProgramDela - branje	t
00030000-56ab-757c-6d99-4072f2b7e689	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56ab-757c-a52a-14016d810cf2	ProgramFestival-read	ProgramFestival - branje	t
00030000-56ab-757c-01ce-db72a5145a01	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56ab-757c-b305-014f4ac65452	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56ab-757c-3b87-e90095a216d2	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56ab-757c-47fa-ef2ade06d3ac	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56ab-757c-db7f-b6d5cf117b5a	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56ab-757c-0b61-74bad81ac20f	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56ab-757c-9cc2-1b3c4cc010ff	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56ab-757c-a191-4ece579de153	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56ab-757c-c68e-2e1b8fb999c5	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56ab-757c-0c3b-73401d57e5ed	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56ab-757c-4d48-e8d339def334	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56ab-757c-620a-faab9df9cb0c	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56ab-757c-cd8c-a08a1508abe8	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56ab-757c-4cc9-922691d991e9	ProgramRazno-read	ProgramRazno - branje	t
00030000-56ab-757c-09c9-a64347b97669	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56ab-757c-2d5a-810e6ac4fd4d	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56ab-757c-d94d-e55d20657745	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56ab-757c-ffde-c084fb8fa7bc	Prostor-read	Prostor - branje	t
00030000-56ab-757c-8e04-ece3dfa15a51	Prostor-write	Prostor - spreminjanje	t
00030000-56ab-757c-af73-01f564cf0c90	Racun-read	Racun - branje	t
00030000-56ab-757c-cb6b-96a29f54eb9a	Racun-write	Racun - spreminjanje	t
00030000-56ab-757c-3ddb-ada6020dd6d8	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56ab-757c-0e25-d375328038b6	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56ab-757c-c85d-e465649a8ead	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56ab-757c-881a-fb39fd21754a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56ab-757c-8935-56a9b95ae20d	Rekvizit-read	Rekvizit - branje	t
00030000-56ab-757c-9c17-e0362da554e8	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56ab-757c-439e-a52ae850b176	Revizija-read	Revizija - branje	t
00030000-56ab-757c-4623-f6d8092a6479	Revizija-write	Revizija - spreminjanje	t
00030000-56ab-757c-ab65-748035ae2c1a	Rezervacija-read	Rezervacija - branje	t
00030000-56ab-757c-fe71-07e97ecee5c9	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56ab-757c-2340-f86fbfd05e15	SedezniRed-read	SedezniRed - branje	t
00030000-56ab-757c-ff1b-75f801c98949	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56ab-757c-9426-ca1008827523	Sedez-read	Sedez - branje	t
00030000-56ab-757c-ffca-c173d070e42e	Sedez-write	Sedez - spreminjanje	t
00030000-56ab-757c-da87-6c7d40cc7ba4	Sezona-read	Sezona - branje	t
00030000-56ab-757c-1d58-4e8c612c1c52	Sezona-write	Sezona - spreminjanje	t
00030000-56ab-757c-0396-339428003421	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56ab-757c-5cbc-a55504abf212	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56ab-757c-b338-bcfcd5ced9ca	Telefonska-read	Telefonska - branje	t
00030000-56ab-757c-b38a-01357b0ff4d7	Telefonska-write	Telefonska - spreminjanje	t
00030000-56ab-757c-52fe-e5e63a3db1f6	TerminStoritve-read	TerminStoritve - branje	t
00030000-56ab-757c-e976-fb27268b9ee6	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56ab-757c-1911-f2235fdaf10a	TipDodatka-read	TipDodatka - branje	t
00030000-56ab-757c-0021-bb7cb5eb7a63	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56ab-757c-fc79-8b85f51f2a0c	TipFunkcije-read	TipFunkcije - branje	t
00030000-56ab-757c-131b-ed1824324532	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56ab-757c-3569-5605b84dac36	TipPopa-read	TipPopa - branje	t
00030000-56ab-757c-f28f-4311fd87efc8	TipPopa-write	TipPopa - spreminjanje	t
00030000-56ab-757c-782a-49a04d3bdcf4	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56ab-757c-4115-25f581d4997d	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56ab-757c-45f3-d832b46e5e52	TipVaje-read	TipVaje - branje	t
00030000-56ab-757c-bdd1-3f863f0fcade	TipVaje-write	TipVaje - spreminjanje	t
00030000-56ab-757c-138e-d4e862acb519	Trr-read	Trr - branje	t
00030000-56ab-757c-402d-a51b36e2ada9	Trr-write	Trr - spreminjanje	t
00030000-56ab-757c-ee2e-75a110a56bf0	Uprizoritev-read	Uprizoritev - branje	t
00030000-56ab-757c-81ea-10ff76f06e56	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56ab-757c-cc1b-941745823968	Vaja-read	Vaja - branje	t
00030000-56ab-757c-ee6c-90da9f20fcf4	Vaja-write	Vaja - spreminjanje	t
00030000-56ab-757c-234f-f067882a5d9c	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56ab-757c-b470-ca88a1a11458	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56ab-757c-f009-80b9cadbe151	VrstaStroska-read	VrstaStroska - branje	t
00030000-56ab-757c-3fac-aacd61ea0df4	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56ab-757c-09be-dce1ff346c36	Zaposlitev-read	Zaposlitev - branje	t
00030000-56ab-757c-3441-dbced32d28d9	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56ab-757c-f5ac-b49f4fdea97a	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56ab-757c-fc23-6a77338ff2aa	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56ab-757c-aad3-f7cd0773ecc9	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56ab-757c-d83f-b1f61f7979a7	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56ab-757c-50df-29237fe51184	Job-read	Branje opravil - samo zase - branje	t
00030000-56ab-757c-736a-2e3c5660e581	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56ab-757c-9760-83eb6999782f	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56ab-757c-924d-cef8e39e9b81	Report-read	Report - branje	t
00030000-56ab-757c-b38e-f3d787e5b0e7	Report-write	Report - spreminjanje	t
00030000-56ab-757c-d612-e60a6e04cb99	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56ab-757c-a9b0-dcffca58eb69	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56ab-757c-2480-17ff8a7e40e5	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56ab-757c-079b-2f1e44187dd8	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56ab-757c-776c-b631a68d04e0	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56ab-757c-d5ca-e5218c29d145	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56ab-757c-31e5-3a60b1c19983	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56ab-757c-3bf2-f936a66006eb	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56ab-757c-ddbc-4f5a978b3f6d	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56ab-757c-8227-ccc947ee7664	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56ab-757c-8958-46c69d2481c7	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56ab-757c-e516-0dbf2dcce18a	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56ab-757c-a66b-25b7383e3582	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56ab-757c-2d60-4b75ee4d8b3d	Datoteka-write	Datoteka - spreminjanje	t
00030000-56ab-757c-8243-9a48902529b7	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 41961131)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56ab-757c-3183-7a519eaa7dd3	00030000-56ab-757c-b4d3-5f1211bf43db
00020000-56ab-757c-3183-7a519eaa7dd3	00030000-56ab-757c-5878-c6d0d2cdf96a
00020000-56ab-757c-9edd-be53afa2e6e2	00030000-56ab-757c-3458-d738380f4e56
00020000-56ab-757c-05e8-b7616cc03ea7	00030000-56ab-757c-2c7d-e902c87a706b
00020000-56ab-757c-05e8-b7616cc03ea7	00030000-56ab-757c-eb1b-68fcde19a06c
00020000-56ab-757c-05e8-b7616cc03ea7	00030000-56ab-757c-2d60-4b75ee4d8b3d
00020000-56ab-757c-05e8-b7616cc03ea7	00030000-56ab-757c-6d15-1fcb301a4b08
00020000-56ab-757c-05e8-b7616cc03ea7	00030000-56ab-757c-3bf2-f936a66006eb
00020000-56ab-757c-05e8-b7616cc03ea7	00030000-56ab-757c-8227-ccc947ee7664
00020000-56ab-757c-05e8-b7616cc03ea7	00030000-56ab-757c-8700-17f2ee25676d
00020000-56ab-757c-05e8-b7616cc03ea7	00030000-56ab-757c-c4e2-f1101e5718c2
00020000-56ab-757c-05e8-b7616cc03ea7	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757c-05e8-b7616cc03ea7	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-05e8-b7616cc03ea7	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-05e8-b7616cc03ea7	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757c-2fb4-1344bac0910b	00030000-56ab-757c-8700-17f2ee25676d
00020000-56ab-757c-2fb4-1344bac0910b	00030000-56ab-757c-c4e2-f1101e5718c2
00020000-56ab-757c-2fb4-1344bac0910b	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757c-2fb4-1344bac0910b	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-2fb4-1344bac0910b	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757c-2fb4-1344bac0910b	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-bd7c-b9fe058c733a	00030000-56ab-757c-09be-dce1ff346c36
00020000-56ab-757c-bd7c-b9fe058c733a	00030000-56ab-757c-3441-dbced32d28d9
00020000-56ab-757c-bd7c-b9fe058c733a	00030000-56ab-757c-dc4b-11f62850a923
00020000-56ab-757c-bd7c-b9fe058c733a	00030000-56ab-757c-ace9-a3062f046025
00020000-56ab-757c-bd7c-b9fe058c733a	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-bd7c-b9fe058c733a	00030000-56ab-757c-6d15-1fcb301a4b08
00020000-56ab-757c-bd7c-b9fe058c733a	00030000-56ab-757c-777d-e55389317f01
00020000-56ab-757c-42de-11cae684cd60	00030000-56ab-757c-09be-dce1ff346c36
00020000-56ab-757c-42de-11cae684cd60	00030000-56ab-757c-dc4b-11f62850a923
00020000-56ab-757c-42de-11cae684cd60	00030000-56ab-757c-777d-e55389317f01
00020000-56ab-757c-2051-a7d0e5cb52d3	00030000-56ab-757c-6d15-1fcb301a4b08
00020000-56ab-757c-2051-a7d0e5cb52d3	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-2051-a7d0e5cb52d3	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757c-2051-a7d0e5cb52d3	00030000-56ab-757c-2d60-4b75ee4d8b3d
00020000-56ab-757c-2051-a7d0e5cb52d3	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757c-2051-a7d0e5cb52d3	00030000-56ab-757c-8227-ccc947ee7664
00020000-56ab-757c-2051-a7d0e5cb52d3	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-2051-a7d0e5cb52d3	00030000-56ab-757c-3bf2-f936a66006eb
00020000-56ab-757c-ae51-6f20200cbcbd	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-ae51-6f20200cbcbd	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757c-ae51-6f20200cbcbd	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757c-ae51-6f20200cbcbd	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-3dc2-e5a51536da32	00030000-56ab-757c-6d15-1fcb301a4b08
00020000-56ab-757c-3dc2-e5a51536da32	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-3dc2-e5a51536da32	00030000-56ab-757c-dc4b-11f62850a923
00020000-56ab-757c-3dc2-e5a51536da32	00030000-56ab-757c-ace9-a3062f046025
00020000-56ab-757c-3dc2-e5a51536da32	00030000-56ab-757c-138e-d4e862acb519
00020000-56ab-757c-3dc2-e5a51536da32	00030000-56ab-757c-402d-a51b36e2ada9
00020000-56ab-757c-3dc2-e5a51536da32	00030000-56ab-757c-777e-0c788d716458
00020000-56ab-757c-3dc2-e5a51536da32	00030000-56ab-757c-73b8-4e24920ad1ba
00020000-56ab-757c-3dc2-e5a51536da32	00030000-56ab-757c-b338-bcfcd5ced9ca
00020000-56ab-757c-3dc2-e5a51536da32	00030000-56ab-757c-b38a-01357b0ff4d7
00020000-56ab-757c-3dc2-e5a51536da32	00030000-56ab-757c-3458-d738380f4e56
00020000-56ab-757c-3dc2-e5a51536da32	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-b047-af925862953c	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-b047-af925862953c	00030000-56ab-757c-dc4b-11f62850a923
00020000-56ab-757c-b047-af925862953c	00030000-56ab-757c-138e-d4e862acb519
00020000-56ab-757c-b047-af925862953c	00030000-56ab-757c-777e-0c788d716458
00020000-56ab-757c-b047-af925862953c	00030000-56ab-757c-b338-bcfcd5ced9ca
00020000-56ab-757c-b047-af925862953c	00030000-56ab-757c-3458-d738380f4e56
00020000-56ab-757c-b047-af925862953c	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-b338-bcfcd5ced9ca
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-777e-0c788d716458
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-138e-d4e862acb519
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-4726-641c4ebaa1ab
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-54cb-127d92e3e533
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-23ad-e4860aca5699
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-b38a-01357b0ff4d7
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-73b8-4e24920ad1ba
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-3bf2-f936a66006eb
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-402d-a51b36e2ada9
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-0149-6ed0c4b82b85
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-2d60-4b75ee4d8b3d
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-8227-ccc947ee7664
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-218b-9935a7341966
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-4fbc-a2ee2e1b75cd
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-3458-d738380f4e56
00020000-56ab-757c-6eff-b844df7f0096	00030000-56ab-757c-3569-5605b84dac36
00020000-56ab-757c-3be2-b4518932ad32	00030000-56ab-757c-b338-bcfcd5ced9ca
00020000-56ab-757c-3be2-b4518932ad32	00030000-56ab-757c-777e-0c788d716458
00020000-56ab-757c-3be2-b4518932ad32	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-3be2-b4518932ad32	00030000-56ab-757c-138e-d4e862acb519
00020000-56ab-757c-3be2-b4518932ad32	00030000-56ab-757c-4726-641c4ebaa1ab
00020000-56ab-757c-3be2-b4518932ad32	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757c-3be2-b4518932ad32	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757c-3be2-b4518932ad32	00030000-56ab-757c-54cb-127d92e3e533
00020000-56ab-757c-3be2-b4518932ad32	00030000-56ab-757c-23ad-e4860aca5699
00020000-56ab-757c-3be2-b4518932ad32	00030000-56ab-757c-3458-d738380f4e56
00020000-56ab-757c-3be2-b4518932ad32	00030000-56ab-757c-3569-5605b84dac36
00020000-56ab-757c-5eea-9a17fe85249d	00030000-56ab-757c-3569-5605b84dac36
00020000-56ab-757c-5eea-9a17fe85249d	00030000-56ab-757c-f28f-4311fd87efc8
00020000-56ab-757c-880a-e7c0bec294aa	00030000-56ab-757c-3569-5605b84dac36
00020000-56ab-757c-2988-cd3b088c2ddd	00030000-56ab-757c-088c-bb733a02ac37
00020000-56ab-757c-2988-cd3b088c2ddd	00030000-56ab-757c-7100-02a7e29e9637
00020000-56ab-757c-6500-435a3ce238e3	00030000-56ab-757c-088c-bb733a02ac37
00020000-56ab-757c-40f1-3fc2dd9e17a0	00030000-56ab-757c-3458-d738380f4e56
00020000-56ab-757c-40f1-3fc2dd9e17a0	00030000-56ab-757c-3792-d44e2bd59d3e
00020000-56ab-757c-7586-d6483b77fb06	00030000-56ab-757c-3458-d738380f4e56
00020000-56ab-757c-0b16-e5a0b375d5c4	00030000-56ab-757c-aad3-f7cd0773ecc9
00020000-56ab-757c-0b16-e5a0b375d5c4	00030000-56ab-757c-d83f-b1f61f7979a7
00020000-56ab-757c-0d68-6a8b77be0129	00030000-56ab-757c-aad3-f7cd0773ecc9
00020000-56ab-757c-da07-f20d538fba5d	00030000-56ab-757c-f5ac-b49f4fdea97a
00020000-56ab-757c-da07-f20d538fba5d	00030000-56ab-757c-fc23-6a77338ff2aa
00020000-56ab-757c-c579-665548cf3bf8	00030000-56ab-757c-f5ac-b49f4fdea97a
00020000-56ab-757c-8399-74c94b2f51b3	00030000-56ab-757c-ee64-e2d74d7c40f7
00020000-56ab-757c-8399-74c94b2f51b3	00030000-56ab-757c-ef6c-9b1cc3e6755f
00020000-56ab-757c-10cc-b31308dcb716	00030000-56ab-757c-ee64-e2d74d7c40f7
00020000-56ab-757c-d498-fd47e63ad605	00030000-56ab-757c-ffde-c084fb8fa7bc
00020000-56ab-757c-d498-fd47e63ad605	00030000-56ab-757c-8e04-ece3dfa15a51
00020000-56ab-757c-d498-fd47e63ad605	00030000-56ab-757c-4726-641c4ebaa1ab
00020000-56ab-757c-d498-fd47e63ad605	00030000-56ab-757c-777e-0c788d716458
00020000-56ab-757c-d498-fd47e63ad605	00030000-56ab-757c-73b8-4e24920ad1ba
00020000-56ab-757c-d498-fd47e63ad605	00030000-56ab-757c-3458-d738380f4e56
00020000-56ab-757c-30a4-3f2a63b20efc	00030000-56ab-757c-ffde-c084fb8fa7bc
00020000-56ab-757c-30a4-3f2a63b20efc	00030000-56ab-757c-4726-641c4ebaa1ab
00020000-56ab-757c-30a4-3f2a63b20efc	00030000-56ab-757c-777e-0c788d716458
00020000-56ab-757c-50e4-06f23a5da728	00030000-56ab-757c-f009-80b9cadbe151
00020000-56ab-757c-50e4-06f23a5da728	00030000-56ab-757c-3fac-aacd61ea0df4
00020000-56ab-757c-c1a8-6d4a94e5dadd	00030000-56ab-757c-f009-80b9cadbe151
00020000-56ab-757c-7a5e-7c2b21edd257	00030000-56ab-757c-fa66-5d6c7c2c4acc
00020000-56ab-757c-7a5e-7c2b21edd257	00030000-56ab-757c-777d-e55389317f01
00020000-56ab-757c-7a5e-7c2b21edd257	00030000-56ab-757c-09be-dce1ff346c36
00020000-56ab-757c-7a5e-7c2b21edd257	00030000-56ab-757c-2d60-4b75ee4d8b3d
00020000-56ab-757c-7a5e-7c2b21edd257	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757c-7a5e-7c2b21edd257	00030000-56ab-757c-3bf2-f936a66006eb
00020000-56ab-757c-7a5e-7c2b21edd257	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-7a5e-7c2b21edd257	00030000-56ab-757c-8227-ccc947ee7664
00020000-56ab-757c-7a5e-7c2b21edd257	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757c-9747-26984b186f80	00030000-56ab-757c-777d-e55389317f01
00020000-56ab-757c-9747-26984b186f80	00030000-56ab-757c-09be-dce1ff346c36
00020000-56ab-757c-9747-26984b186f80	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757c-9747-26984b186f80	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-9747-26984b186f80	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757c-086b-9983dd092056	00030000-56ab-757c-45f3-d832b46e5e52
00020000-56ab-757c-086b-9983dd092056	00030000-56ab-757c-bdd1-3f863f0fcade
00020000-56ab-757c-4066-c1831b9aaded	00030000-56ab-757c-45f3-d832b46e5e52
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-baa7-9c0abb612357
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-3e4c-dc3260fa0446
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-7764-091c44c279bc
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-6d99-4072f2b7e689
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-a52a-14016d810cf2
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-01ce-db72a5145a01
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-b305-014f4ac65452
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-3b87-e90095a216d2
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-47fa-ef2ade06d3ac
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-db7f-b6d5cf117b5a
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-0b61-74bad81ac20f
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-9cc2-1b3c4cc010ff
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-a191-4ece579de153
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-c68e-2e1b8fb999c5
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-0c3b-73401d57e5ed
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-4d48-e8d339def334
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-620a-faab9df9cb0c
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-cd8c-a08a1508abe8
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-4cc9-922691d991e9
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-09c9-a64347b97669
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-2d5a-810e6ac4fd4d
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-d94d-e55d20657745
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-03c0-ff93c2c19d57
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-9f4f-570c22073d4a
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-f711-ffde5d716c95
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-736a-2e3c5660e581
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-3c0e-3a98e5cd3745
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-f2c8-565c1dd396b4
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-23ad-e4860aca5699
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-5268-4789806a7af9
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-f009-80b9cadbe151
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-ee2e-75a110a56bf0
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-0396-339428003421
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-a27a-cc7f81fd86bc
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-4243-7cdc8f41b848
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-fc79-8b85f51f2a0c
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-529a-fbe085dc051a
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-3458-d738380f4e56
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-4726-641c4ebaa1ab
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-2d60-4b75ee4d8b3d
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-3bf2-f936a66006eb
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-8227-ccc947ee7664
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-50df-29237fe51184
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-3397-4d65416160b8	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757c-3407-cc59fc3f2ea7	00030000-56ab-757c-7764-091c44c279bc
00020000-56ab-757c-3407-cc59fc3f2ea7	00030000-56ab-757c-a52a-14016d810cf2
00020000-56ab-757c-3407-cc59fc3f2ea7	00030000-56ab-757c-b305-014f4ac65452
00020000-56ab-757c-3407-cc59fc3f2ea7	00030000-56ab-757c-47fa-ef2ade06d3ac
00020000-56ab-757c-3407-cc59fc3f2ea7	00030000-56ab-757c-0b61-74bad81ac20f
00020000-56ab-757c-3407-cc59fc3f2ea7	00030000-56ab-757c-a191-4ece579de153
00020000-56ab-757c-3407-cc59fc3f2ea7	00030000-56ab-757c-0c3b-73401d57e5ed
00020000-56ab-757c-3407-cc59fc3f2ea7	00030000-56ab-757c-620a-faab9df9cb0c
00020000-56ab-757c-3407-cc59fc3f2ea7	00030000-56ab-757c-4cc9-922691d991e9
00020000-56ab-757c-3407-cc59fc3f2ea7	00030000-56ab-757c-2d5a-810e6ac4fd4d
00020000-56ab-757c-3407-cc59fc3f2ea7	00030000-56ab-757c-f2c8-565c1dd396b4
00020000-56ab-757c-3407-cc59fc3f2ea7	00030000-56ab-757c-3c0e-3a98e5cd3745
00020000-56ab-757c-3407-cc59fc3f2ea7	00030000-56ab-757c-5268-4789806a7af9
00020000-56ab-757c-3407-cc59fc3f2ea7	00030000-56ab-757c-3458-d738380f4e56
00020000-56ab-757c-3407-cc59fc3f2ea7	00030000-56ab-757c-50df-29237fe51184
00020000-56ab-757c-3407-cc59fc3f2ea7	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757c-3407-cc59fc3f2ea7	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-3407-cc59fc3f2ea7	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757c-3004-927174bca331	00030000-56ab-757c-ee2e-75a110a56bf0
00020000-56ab-757c-3004-927174bca331	00030000-56ab-757c-81ea-10ff76f06e56
00020000-56ab-757c-3004-927174bca331	00030000-56ab-757c-4243-7cdc8f41b848
00020000-56ab-757c-3004-927174bca331	00030000-56ab-757c-3771-f9d8538a228b
00020000-56ab-757c-3004-927174bca331	00030000-56ab-757c-7424-9564b2f40d09
00020000-56ab-757c-3004-927174bca331	00030000-56ab-757c-c4e2-f1101e5718c2
00020000-56ab-757c-3004-927174bca331	00030000-56ab-757c-a27a-cc7f81fd86bc
00020000-56ab-757c-3004-927174bca331	00030000-56ab-757c-db12-e91ec1f96bc9
00020000-56ab-757c-3004-927174bca331	00030000-56ab-757c-a487-384c41a970c2
00020000-56ab-757c-3004-927174bca331	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-3004-927174bca331	00030000-56ab-757c-23ad-e4860aca5699
00020000-56ab-757c-3004-927174bca331	00030000-56ab-757c-fc79-8b85f51f2a0c
00020000-56ab-757c-3004-927174bca331	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757c-3004-927174bca331	00030000-56ab-757c-2d60-4b75ee4d8b3d
00020000-56ab-757c-3004-927174bca331	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-3004-927174bca331	00030000-56ab-757c-3bf2-f936a66006eb
00020000-56ab-757c-3004-927174bca331	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757c-3004-927174bca331	00030000-56ab-757c-8227-ccc947ee7664
00020000-56ab-757c-dbe5-e79b83fb1215	00030000-56ab-757c-ee2e-75a110a56bf0
00020000-56ab-757c-dbe5-e79b83fb1215	00030000-56ab-757c-4243-7cdc8f41b848
00020000-56ab-757c-dbe5-e79b83fb1215	00030000-56ab-757c-c4e2-f1101e5718c2
00020000-56ab-757c-dbe5-e79b83fb1215	00030000-56ab-757c-a27a-cc7f81fd86bc
00020000-56ab-757c-dbe5-e79b83fb1215	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-dbe5-e79b83fb1215	00030000-56ab-757c-23ad-e4860aca5699
00020000-56ab-757c-dbe5-e79b83fb1215	00030000-56ab-757c-fc79-8b85f51f2a0c
00020000-56ab-757c-dbe5-e79b83fb1215	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757c-dbe5-e79b83fb1215	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-dbe5-e79b83fb1215	00030000-56ab-757c-3bf2-f936a66006eb
00020000-56ab-757c-dbe5-e79b83fb1215	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757c-0e1c-06309787b388	00030000-56ab-757c-4243-7cdc8f41b848
00020000-56ab-757c-0e1c-06309787b388	00030000-56ab-757c-3771-f9d8538a228b
00020000-56ab-757c-0e1c-06309787b388	00030000-56ab-757c-a27a-cc7f81fd86bc
00020000-56ab-757c-0e1c-06309787b388	00030000-56ab-757c-db12-e91ec1f96bc9
00020000-56ab-757c-0e1c-06309787b388	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-0e1c-06309787b388	00030000-56ab-757c-fc79-8b85f51f2a0c
00020000-56ab-757c-0e1c-06309787b388	00030000-56ab-757c-ee2e-75a110a56bf0
00020000-56ab-757c-0e1c-06309787b388	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-c2d6-aadd7b0d7ca2	00030000-56ab-757c-4243-7cdc8f41b848
00020000-56ab-757c-c2d6-aadd7b0d7ca2	00030000-56ab-757c-3771-f9d8538a228b
00020000-56ab-757c-c2d6-aadd7b0d7ca2	00030000-56ab-757c-7424-9564b2f40d09
00020000-56ab-757c-c2d6-aadd7b0d7ca2	00030000-56ab-757c-a27a-cc7f81fd86bc
00020000-56ab-757c-c2d6-aadd7b0d7ca2	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-c2d6-aadd7b0d7ca2	00030000-56ab-757c-dc4b-11f62850a923
00020000-56ab-757c-c2d6-aadd7b0d7ca2	00030000-56ab-757c-ace9-a3062f046025
00020000-56ab-757c-c2d6-aadd7b0d7ca2	00030000-56ab-757c-529a-fbe085dc051a
00020000-56ab-757c-c2d6-aadd7b0d7ca2	00030000-56ab-757c-e174-86549893dc76
00020000-56ab-757c-c2d6-aadd7b0d7ca2	00030000-56ab-757c-4726-641c4ebaa1ab
00020000-56ab-757c-c2d6-aadd7b0d7ca2	00030000-56ab-757c-23ad-e4860aca5699
00020000-56ab-757c-c2d6-aadd7b0d7ca2	00030000-56ab-757c-0396-339428003421
00020000-56ab-757c-c2d6-aadd7b0d7ca2	00030000-56ab-757c-5cbc-a55504abf212
00020000-56ab-757c-c2d6-aadd7b0d7ca2	00030000-56ab-757c-fc79-8b85f51f2a0c
00020000-56ab-757c-c2d6-aadd7b0d7ca2	00030000-56ab-757c-138e-d4e862acb519
00020000-56ab-757c-c2d6-aadd7b0d7ca2	00030000-56ab-757c-ee2e-75a110a56bf0
00020000-56ab-757c-c2d6-aadd7b0d7ca2	00030000-56ab-757c-09be-dce1ff346c36
00020000-56ab-757c-5028-f9ca4c547a88	00030000-56ab-757c-4243-7cdc8f41b848
00020000-56ab-757c-5028-f9ca4c547a88	00030000-56ab-757c-a27a-cc7f81fd86bc
00020000-56ab-757c-5028-f9ca4c547a88	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-5028-f9ca4c547a88	00030000-56ab-757c-dc4b-11f62850a923
00020000-56ab-757c-5028-f9ca4c547a88	00030000-56ab-757c-529a-fbe085dc051a
00020000-56ab-757c-5028-f9ca4c547a88	00030000-56ab-757c-4726-641c4ebaa1ab
00020000-56ab-757c-5028-f9ca4c547a88	00030000-56ab-757c-23ad-e4860aca5699
00020000-56ab-757c-5028-f9ca4c547a88	00030000-56ab-757c-0396-339428003421
00020000-56ab-757c-5028-f9ca4c547a88	00030000-56ab-757c-fc79-8b85f51f2a0c
00020000-56ab-757c-5028-f9ca4c547a88	00030000-56ab-757c-138e-d4e862acb519
00020000-56ab-757c-5028-f9ca4c547a88	00030000-56ab-757c-ee2e-75a110a56bf0
00020000-56ab-757c-5028-f9ca4c547a88	00030000-56ab-757c-09be-dce1ff346c36
00020000-56ab-757c-56e3-14e8881e4597	00030000-56ab-757c-0396-339428003421
00020000-56ab-757c-56e3-14e8881e4597	00030000-56ab-757c-ee2e-75a110a56bf0
00020000-56ab-757c-56e3-14e8881e4597	00030000-56ab-757c-a27a-cc7f81fd86bc
00020000-56ab-757c-56e3-14e8881e4597	00030000-56ab-757c-529a-fbe085dc051a
00020000-56ab-757c-56e3-14e8881e4597	00030000-56ab-757c-23ad-e4860aca5699
00020000-56ab-757c-56e3-14e8881e4597	00030000-56ab-757c-fc79-8b85f51f2a0c
00020000-56ab-757c-56e3-14e8881e4597	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-6f3c-e9b7ffe26e73	00030000-56ab-757c-0396-339428003421
00020000-56ab-757c-6f3c-e9b7ffe26e73	00030000-56ab-757c-5cbc-a55504abf212
00020000-56ab-757c-6f3c-e9b7ffe26e73	00030000-56ab-757c-ee2e-75a110a56bf0
00020000-56ab-757c-6f3c-e9b7ffe26e73	00030000-56ab-757c-4726-641c4ebaa1ab
00020000-56ab-757c-5752-96c3b0c330f6	00030000-56ab-757c-0396-339428003421
00020000-56ab-757c-5752-96c3b0c330f6	00030000-56ab-757c-ee2e-75a110a56bf0
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-ee64-e2d74d7c40f7
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-4243-7cdc8f41b848
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-3771-f9d8538a228b
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-7424-9564b2f40d09
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-8700-17f2ee25676d
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-2c7d-e902c87a706b
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-c4e2-f1101e5718c2
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-eb1b-68fcde19a06c
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-2d60-4b75ee4d8b3d
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-3c0e-3a98e5cd3745
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-9f4f-570c22073d4a
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-3458-d738380f4e56
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-a27a-cc7f81fd86bc
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-db12-e91ec1f96bc9
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-a487-384c41a970c2
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-50df-29237fe51184
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-736a-2e3c5660e581
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-54cb-127d92e3e533
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-777d-e55389317f01
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-6d15-1fcb301a4b08
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-dc4b-11f62850a923
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-ace9-a3062f046025
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-529a-fbe085dc051a
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-e174-86549893dc76
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-4726-641c4ebaa1ab
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-088c-bb733a02ac37
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-5268-4789806a7af9
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-f711-ffde5d716c95
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-777e-0c788d716458
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-f2c8-565c1dd396b4
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-03c0-ff93c2c19d57
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-23ad-e4860aca5699
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-baa7-9c0abb612357
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-7764-091c44c279bc
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-3e4c-dc3260fa0446
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-6d99-4072f2b7e689
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-a52a-14016d810cf2
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-01ce-db72a5145a01
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-b305-014f4ac65452
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-3b87-e90095a216d2
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-47fa-ef2ade06d3ac
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-db7f-b6d5cf117b5a
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-0b61-74bad81ac20f
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-9cc2-1b3c4cc010ff
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-a191-4ece579de153
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-c68e-2e1b8fb999c5
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-0c3b-73401d57e5ed
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-4d48-e8d339def334
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-620a-faab9df9cb0c
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-cd8c-a08a1508abe8
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-4cc9-922691d991e9
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-09c9-a64347b97669
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-2d5a-810e6ac4fd4d
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-d94d-e55d20657745
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-ffde-c084fb8fa7bc
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-0396-339428003421
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-5cbc-a55504abf212
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-b338-bcfcd5ced9ca
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-fc79-8b85f51f2a0c
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-3569-5605b84dac36
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-45f3-d832b46e5e52
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-138e-d4e862acb519
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-ee2e-75a110a56bf0
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-81ea-10ff76f06e56
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-f009-80b9cadbe151
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-8227-ccc947ee7664
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-3bf2-f936a66006eb
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-09be-dce1ff346c36
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-f5ac-b49f4fdea97a
00020000-56ab-757c-7f82-857cfa026bc8	00030000-56ab-757c-aad3-f7cd0773ecc9
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-ee64-e2d74d7c40f7
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-4243-7cdc8f41b848
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-8700-17f2ee25676d
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-2c7d-e902c87a706b
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-c4e2-f1101e5718c2
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-eb1b-68fcde19a06c
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-2d60-4b75ee4d8b3d
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-3458-d738380f4e56
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-a27a-cc7f81fd86bc
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-54cb-127d92e3e533
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-777d-e55389317f01
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-6d15-1fcb301a4b08
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-dc4b-11f62850a923
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-4726-641c4ebaa1ab
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-088c-bb733a02ac37
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-777e-0c788d716458
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-23ad-e4860aca5699
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-ffde-c084fb8fa7bc
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-b338-bcfcd5ced9ca
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-fc79-8b85f51f2a0c
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-3569-5605b84dac36
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-45f3-d832b46e5e52
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-138e-d4e862acb519
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-ee2e-75a110a56bf0
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-f009-80b9cadbe151
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-8227-ccc947ee7664
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-3bf2-f936a66006eb
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-09be-dce1ff346c36
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-f5ac-b49f4fdea97a
00020000-56ab-757c-fca4-114bdb977ad8	00030000-56ab-757c-aad3-f7cd0773ecc9
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-ee64-e2d74d7c40f7
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-4243-7cdc8f41b848
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-3771-f9d8538a228b
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-7424-9564b2f40d09
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-8700-17f2ee25676d
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-2c7d-e902c87a706b
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-c4e2-f1101e5718c2
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-eb1b-68fcde19a06c
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-2d60-4b75ee4d8b3d
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-3458-d738380f4e56
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-a27a-cc7f81fd86bc
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-db12-e91ec1f96bc9
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-a487-384c41a970c2
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-54cb-127d92e3e533
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-777d-e55389317f01
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-6d15-1fcb301a4b08
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-dc4b-11f62850a923
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-4726-641c4ebaa1ab
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-088c-bb733a02ac37
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-777e-0c788d716458
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-23ad-e4860aca5699
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-ffde-c084fb8fa7bc
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-b338-bcfcd5ced9ca
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-fc79-8b85f51f2a0c
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-3569-5605b84dac36
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-45f3-d832b46e5e52
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-138e-d4e862acb519
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-ee2e-75a110a56bf0
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-81ea-10ff76f06e56
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-f009-80b9cadbe151
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-8227-ccc947ee7664
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-3bf2-f936a66006eb
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-09be-dce1ff346c36
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-f5ac-b49f4fdea97a
00020000-56ab-757c-26fb-4924a2c87282	00030000-56ab-757c-aad3-f7cd0773ecc9
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-4243-7cdc8f41b848
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-3771-f9d8538a228b
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-7424-9564b2f40d09
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-8700-17f2ee25676d
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-2c7d-e902c87a706b
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-c4e2-f1101e5718c2
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-eb1b-68fcde19a06c
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-2d60-4b75ee4d8b3d
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-3c0e-3a98e5cd3745
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-9f4f-570c22073d4a
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-3458-d738380f4e56
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-a27a-cc7f81fd86bc
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-db12-e91ec1f96bc9
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-a487-384c41a970c2
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-50df-29237fe51184
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-736a-2e3c5660e581
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-54cb-127d92e3e533
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-218b-9935a7341966
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-777d-e55389317f01
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-6d15-1fcb301a4b08
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-dc4b-11f62850a923
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-ace9-a3062f046025
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-529a-fbe085dc051a
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-e174-86549893dc76
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-4726-641c4ebaa1ab
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-0149-6ed0c4b82b85
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-088c-bb733a02ac37
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-5268-4789806a7af9
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-f711-ffde5d716c95
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-777e-0c788d716458
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-73b8-4e24920ad1ba
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-f2c8-565c1dd396b4
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-03c0-ff93c2c19d57
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-23ad-e4860aca5699
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-4fbc-a2ee2e1b75cd
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-baa7-9c0abb612357
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-7764-091c44c279bc
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-3e4c-dc3260fa0446
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-6d99-4072f2b7e689
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-a52a-14016d810cf2
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-01ce-db72a5145a01
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-b305-014f4ac65452
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-3b87-e90095a216d2
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-47fa-ef2ade06d3ac
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-db7f-b6d5cf117b5a
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-0b61-74bad81ac20f
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-9cc2-1b3c4cc010ff
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-a191-4ece579de153
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-c68e-2e1b8fb999c5
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-0c3b-73401d57e5ed
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-4d48-e8d339def334
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-620a-faab9df9cb0c
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-cd8c-a08a1508abe8
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-4cc9-922691d991e9
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-09c9-a64347b97669
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-2d5a-810e6ac4fd4d
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-d94d-e55d20657745
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-ffde-c084fb8fa7bc
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-0396-339428003421
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-5cbc-a55504abf212
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-b338-bcfcd5ced9ca
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-b38a-01357b0ff4d7
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-fc79-8b85f51f2a0c
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-3569-5605b84dac36
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-138e-d4e862acb519
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-402d-a51b36e2ada9
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-ee2e-75a110a56bf0
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-81ea-10ff76f06e56
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-f009-80b9cadbe151
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-8227-ccc947ee7664
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-3bf2-f936a66006eb
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-09be-dce1ff346c36
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-3441-dbced32d28d9
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-f5ac-b49f4fdea97a
00020000-56ab-757c-9e11-a69c149a3ede	00030000-56ab-757c-aad3-f7cd0773ecc9
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-ee64-e2d74d7c40f7
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-4243-7cdc8f41b848
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-3771-f9d8538a228b
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-7424-9564b2f40d09
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-8700-17f2ee25676d
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-2c7d-e902c87a706b
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-c4e2-f1101e5718c2
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-eb1b-68fcde19a06c
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-2d60-4b75ee4d8b3d
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-3458-d738380f4e56
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-a27a-cc7f81fd86bc
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-db12-e91ec1f96bc9
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-a487-384c41a970c2
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-54cb-127d92e3e533
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-218b-9935a7341966
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-777d-e55389317f01
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-6d15-1fcb301a4b08
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-dc4b-11f62850a923
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-ace9-a3062f046025
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-529a-fbe085dc051a
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-4726-641c4ebaa1ab
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-0149-6ed0c4b82b85
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-088c-bb733a02ac37
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-777e-0c788d716458
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-73b8-4e24920ad1ba
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-23ad-e4860aca5699
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-4fbc-a2ee2e1b75cd
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-ffde-c084fb8fa7bc
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-0396-339428003421
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-b338-bcfcd5ced9ca
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-b38a-01357b0ff4d7
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-fc79-8b85f51f2a0c
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-3569-5605b84dac36
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-45f3-d832b46e5e52
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-138e-d4e862acb519
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-402d-a51b36e2ada9
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-ee2e-75a110a56bf0
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-81ea-10ff76f06e56
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-f009-80b9cadbe151
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-8227-ccc947ee7664
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-3bf2-f936a66006eb
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-09be-dce1ff346c36
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-3441-dbced32d28d9
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-f5ac-b49f4fdea97a
00020000-56ab-757c-741a-d706ac2c466f	00030000-56ab-757c-aad3-f7cd0773ecc9
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-ee64-e2d74d7c40f7
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-4243-7cdc8f41b848
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-3771-f9d8538a228b
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-8700-17f2ee25676d
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-c4e2-f1101e5718c2
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-3458-d738380f4e56
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-a27a-cc7f81fd86bc
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-db12-e91ec1f96bc9
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-54cb-127d92e3e533
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-777d-e55389317f01
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-dc4b-11f62850a923
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-529a-fbe085dc051a
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-4726-641c4ebaa1ab
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-088c-bb733a02ac37
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-777e-0c788d716458
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-23ad-e4860aca5699
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-ffde-c084fb8fa7bc
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-0396-339428003421
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-b338-bcfcd5ced9ca
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-fc79-8b85f51f2a0c
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-3569-5605b84dac36
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-45f3-d832b46e5e52
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-138e-d4e862acb519
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-ee2e-75a110a56bf0
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-f009-80b9cadbe151
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-09be-dce1ff346c36
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-f5ac-b49f4fdea97a
00020000-56ab-757c-02f6-2e28f1e9cc0f	00030000-56ab-757c-aad3-f7cd0773ecc9
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-ee64-e2d74d7c40f7
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-4243-7cdc8f41b848
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-3771-f9d8538a228b
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-7424-9564b2f40d09
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-c4e2-f1101e5718c2
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-2d60-4b75ee4d8b3d
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-3c0e-3a98e5cd3745
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-9f4f-570c22073d4a
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-3458-d738380f4e56
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-a27a-cc7f81fd86bc
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-50df-29237fe51184
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-736a-2e3c5660e581
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-54cb-127d92e3e533
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-218b-9935a7341966
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-777d-e55389317f01
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-fa66-5d6c7c2c4acc
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-6d15-1fcb301a4b08
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-dc4b-11f62850a923
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-ace9-a3062f046025
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-529a-fbe085dc051a
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-e174-86549893dc76
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-4726-641c4ebaa1ab
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-0149-6ed0c4b82b85
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-088c-bb733a02ac37
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-5268-4789806a7af9
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-f711-ffde5d716c95
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-777e-0c788d716458
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-73b8-4e24920ad1ba
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-f2c8-565c1dd396b4
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-03c0-ff93c2c19d57
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-23ad-e4860aca5699
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-4fbc-a2ee2e1b75cd
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-baa7-9c0abb612357
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-7764-091c44c279bc
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-3e4c-dc3260fa0446
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-6d99-4072f2b7e689
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-a52a-14016d810cf2
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-01ce-db72a5145a01
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-b305-014f4ac65452
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-3b87-e90095a216d2
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-47fa-ef2ade06d3ac
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-db7f-b6d5cf117b5a
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-0b61-74bad81ac20f
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-9cc2-1b3c4cc010ff
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-a191-4ece579de153
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-c68e-2e1b8fb999c5
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-0c3b-73401d57e5ed
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-4d48-e8d339def334
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-620a-faab9df9cb0c
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-cd8c-a08a1508abe8
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-4cc9-922691d991e9
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-09c9-a64347b97669
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-2d5a-810e6ac4fd4d
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-d94d-e55d20657745
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-ffde-c084fb8fa7bc
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-0396-339428003421
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-5cbc-a55504abf212
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-b338-bcfcd5ced9ca
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-b38a-01357b0ff4d7
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-fc79-8b85f51f2a0c
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-3569-5605b84dac36
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-45f3-d832b46e5e52
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-138e-d4e862acb519
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-402d-a51b36e2ada9
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-ee2e-75a110a56bf0
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-f009-80b9cadbe151
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-3fac-aacd61ea0df4
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-8227-ccc947ee7664
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-3bf2-f936a66006eb
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-09be-dce1ff346c36
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-3441-dbced32d28d9
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-f5ac-b49f4fdea97a
00020000-56ab-757c-008e-54fdd513a56f	00030000-56ab-757c-aad3-f7cd0773ecc9
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-5878-c6d0d2cdf96a
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-b4d3-5f1211bf43db
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-ee64-e2d74d7c40f7
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-ef6c-9b1cc3e6755f
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-4243-7cdc8f41b848
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-7424-9564b2f40d09
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-3771-f9d8538a228b
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-2fb4-bd25be4a09d0
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-411d-20b05fb02fd2
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-c8c8-984b248c6497
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-cd0b-4354c1cdae4b
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-8700-17f2ee25676d
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-2c7d-e902c87a706b
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-c4e2-f1101e5718c2
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-eb1b-68fcde19a06c
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-2d60-4b75ee4d8b3d
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-8646-7e3053764c1b
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-4428-5c8a40a08593
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-dcc2-4c90d94f3a96
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-d102-6ae6bf2efcc5
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-e943-fba80acffb2f
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-1121-c1766e856571
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-011f-50877df3dba4
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-1893-d8df63eebcad
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-469a-a982e323334a
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-3c0e-3a98e5cd3745
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-9f4f-570c22073d4a
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-3458-d738380f4e56
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-3792-d44e2bd59d3e
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-acb7-20883e616601
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-1eda-e2cfe6539c7f
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-a27a-cc7f81fd86bc
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-a487-384c41a970c2
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-db12-e91ec1f96bc9
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-0cb1-26aba871fe91
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-eb5b-2123d919576f
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-9760-83eb6999782f
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-50df-29237fe51184
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-736a-2e3c5660e581
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-54cb-127d92e3e533
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-218b-9935a7341966
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-fdab-c801455c8298
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-f952-fd6f925d393e
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-31e5-3a60b1c19983
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-d5ca-e5218c29d145
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-a9b0-dcffca58eb69
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-2480-17ff8a7e40e5
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-079b-2f1e44187dd8
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-776c-b631a68d04e0
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-10ed-2fbdb318176f
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-5cd3-b36648d1a5b6
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-21f6-89e0245d20b7
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-9909-b3f42d0dc6a4
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-6d4b-57d4d101420e
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-d976-e0b4abfca2fc
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-141f-16175cee4694
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-777d-e55389317f01
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-fa66-5d6c7c2c4acc
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-6d15-1fcb301a4b08
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-dc4b-11f62850a923
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-ace9-a3062f046025
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-362d-5362f8c5d002
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-7b46-bcdf288750cb
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-2eef-c504acbcdd7a
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-ac4b-da6d5666c524
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-529a-fbe085dc051a
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-e174-86549893dc76
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-4726-641c4ebaa1ab
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-0149-6ed0c4b82b85
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-088c-bb733a02ac37
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-5268-4789806a7af9
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-f711-ffde5d716c95
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-9884-ba314e784f89
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-2d4b-efe85024f4b3
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-7100-02a7e29e9637
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-777e-0c788d716458
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-73b8-4e24920ad1ba
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-e360-cafa07a62cc2
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-56d1-24f7d31bb86d
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-9dc7-467d75075495
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-0e1e-65ebaa658ae2
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-df10-90c52172adb4
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-1225-5c951a97251c
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-f2c8-565c1dd396b4
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-03c0-ff93c2c19d57
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-23ad-e4860aca5699
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-4fbc-a2ee2e1b75cd
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-baa7-9c0abb612357
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-7764-091c44c279bc
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-3e4c-dc3260fa0446
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-6d99-4072f2b7e689
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-a52a-14016d810cf2
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-01ce-db72a5145a01
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-b305-014f4ac65452
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-3b87-e90095a216d2
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-47fa-ef2ade06d3ac
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-db7f-b6d5cf117b5a
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-0b61-74bad81ac20f
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-9cc2-1b3c4cc010ff
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-a191-4ece579de153
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-c68e-2e1b8fb999c5
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-0c3b-73401d57e5ed
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-4d48-e8d339def334
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-620a-faab9df9cb0c
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-cd8c-a08a1508abe8
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-4cc9-922691d991e9
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-09c9-a64347b97669
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-2d5a-810e6ac4fd4d
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-d94d-e55d20657745
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-ffde-c084fb8fa7bc
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-8e04-ece3dfa15a51
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-af73-01f564cf0c90
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-cb6b-96a29f54eb9a
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-3ddb-ada6020dd6d8
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-0e25-d375328038b6
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-c85d-e465649a8ead
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-881a-fb39fd21754a
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-8935-56a9b95ae20d
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-9c17-e0362da554e8
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-924d-cef8e39e9b81
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-b38e-f3d787e5b0e7
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-439e-a52ae850b176
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-4623-f6d8092a6479
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-ab65-748035ae2c1a
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-fe71-07e97ecee5c9
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-2340-f86fbfd05e15
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-ff1b-75f801c98949
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-9426-ca1008827523
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-ffca-c173d070e42e
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-da87-6c7d40cc7ba4
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-1d58-4e8c612c1c52
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-d612-e60a6e04cb99
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-0396-339428003421
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-5cbc-a55504abf212
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-b338-bcfcd5ced9ca
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-b38a-01357b0ff4d7
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-52fe-e5e63a3db1f6
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-1312-648be52992ab
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-e976-fb27268b9ee6
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-fc79-8b85f51f2a0c
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-131b-ed1824324532
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-3569-5605b84dac36
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-f28f-4311fd87efc8
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-782a-49a04d3bdcf4
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-4115-25f581d4997d
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-45f3-d832b46e5e52
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-bdd1-3f863f0fcade
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-138e-d4e862acb519
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-402d-a51b36e2ada9
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-ee2e-75a110a56bf0
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-81ea-10ff76f06e56
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-cc1b-941745823968
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-ee6c-90da9f20fcf4
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-234f-f067882a5d9c
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-b470-ca88a1a11458
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-f009-80b9cadbe151
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-3fac-aacd61ea0df4
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-a66b-25b7383e3582
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-e516-0dbf2dcce18a
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-8227-ccc947ee7664
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-3bf2-f936a66006eb
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-09be-dce1ff346c36
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-3441-dbced32d28d9
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-f5ac-b49f4fdea97a
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-fc23-6a77338ff2aa
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-aad3-f7cd0773ecc9
00020000-56ab-757e-96e4-31c14b8d0256	00030000-56ab-757c-d83f-b1f61f7979a7
00020000-56ab-757e-96f8-98038472cada	00030000-56ab-757c-8958-46c69d2481c7
00020000-56ab-757e-08ac-3de05267cca8	00030000-56ab-757c-8227-ccc947ee7664
00020000-56ab-757e-b80f-be9db7f3a552	00030000-56ab-757c-81ea-10ff76f06e56
00020000-56ab-757e-8ece-b63c62a4cdf4	00030000-56ab-757c-ee2e-75a110a56bf0
00020000-56ab-757e-d3ba-23f390270220	00030000-56ab-757c-2480-17ff8a7e40e5
00020000-56ab-757e-640f-2b5cc7b4bae3	00030000-56ab-757c-079b-2f1e44187dd8
00020000-56ab-757e-a427-4ff2e2f12a07	00030000-56ab-757c-776c-b631a68d04e0
00020000-56ab-757e-b24a-51668af45de2	00030000-56ab-757c-a9b0-dcffca58eb69
00020000-56ab-757e-23da-509eb742d383	00030000-56ab-757c-31e5-3a60b1c19983
00020000-56ab-757e-3122-f1bcdea0341b	00030000-56ab-757c-d5ca-e5218c29d145
00020000-56ab-757e-196e-be7fb2165df7	00030000-56ab-757c-ddbc-4f5a978b3f6d
00020000-56ab-757e-bf60-602bc7810272	00030000-56ab-757c-3bf2-f936a66006eb
00020000-56ab-757e-e0b2-3df84e56094c	00030000-56ab-757c-4d2d-dc63d11469fc
00020000-56ab-757e-e33d-2b5a7048a929	00030000-56ab-757c-6d15-1fcb301a4b08
00020000-56ab-757e-74a5-a5b15fc39d6a	00030000-56ab-757c-ace9-a3062f046025
00020000-56ab-757e-48e4-69814f156350	00030000-56ab-757c-dc4b-11f62850a923
00020000-56ab-757e-ee96-f99c19b66090	00030000-56ab-757c-2d60-4b75ee4d8b3d
00020000-56ab-757e-7b00-e15efb9f12bb	00030000-56ab-757c-8243-9a48902529b7
00020000-56ab-757e-8b80-435e1e00edf9	00030000-56ab-757c-4726-641c4ebaa1ab
00020000-56ab-757e-8b80-435e1e00edf9	00030000-56ab-757c-0149-6ed0c4b82b85
00020000-56ab-757e-8b80-435e1e00edf9	00030000-56ab-757c-ee2e-75a110a56bf0
00020000-56ab-757e-0468-fd66a479dcaf	00030000-56ab-757c-138e-d4e862acb519
00020000-56ab-757e-beec-66e3a4e17393	00030000-56ab-757c-402d-a51b36e2ada9
00020000-56ab-757e-3b42-9c4a0ed45913	00030000-56ab-757c-d612-e60a6e04cb99
00020000-56ab-757e-6c8d-ce03097c0cd2	00030000-56ab-757c-b338-bcfcd5ced9ca
00020000-56ab-757e-3020-bbaeb2f1efd4	00030000-56ab-757c-b38a-01357b0ff4d7
00020000-56ab-757e-c8a7-b152876de5e5	00030000-56ab-757c-777e-0c788d716458
00020000-56ab-757e-78bc-18024ffbbdba	00030000-56ab-757c-73b8-4e24920ad1ba
00020000-56ab-757e-1874-0094aeb4462b	00030000-56ab-757c-09be-dce1ff346c36
00020000-56ab-757e-c4fd-6619a97e1b1d	00030000-56ab-757c-3441-dbced32d28d9
00020000-56ab-757e-229f-d1298f373f87	00030000-56ab-757c-529a-fbe085dc051a
00020000-56ab-757e-8393-28ee11cad720	00030000-56ab-757c-e174-86549893dc76
00020000-56ab-757e-71ca-3dca25138f28	00030000-56ab-757c-0396-339428003421
00020000-56ab-757e-8d14-57b129c99162	00030000-56ab-757c-5cbc-a55504abf212
00020000-56ab-757e-12dc-9711ce2f78c4	00030000-56ab-757c-4243-7cdc8f41b848
00020000-56ab-757e-9943-8855fe83a6cc	00030000-56ab-757c-3771-f9d8538a228b
00020000-56ab-757e-0a71-fdfcf80950a7	00030000-56ab-757c-7424-9564b2f40d09
00020000-56ab-757e-0cae-cc6e176ae298	00030000-56ab-757c-a27a-cc7f81fd86bc
00020000-56ab-757e-373a-311d70a936f6	00030000-56ab-757c-db12-e91ec1f96bc9
00020000-56ab-757e-a02c-1f3d10be8f7e	00030000-56ab-757c-a487-384c41a970c2
\.


--
-- TOC entry 3181 (class 0 OID 41961529)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 41961564)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 41961697)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56ab-757e-5f3e-d4fb75f30b53	00090000-56ab-757e-f03a-4d4644fc6576	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56ab-757e-b08a-5598173f5af5	00090000-56ab-757e-505f-a3d47ba8d34f	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56ab-757e-e524-b72b613db972	00090000-56ab-757e-cc05-e729c756c020	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56ab-757e-93bf-3de584c0c010	00090000-56ab-757e-2bab-897a2f0663e3	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 41961214)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56ab-757e-c8f6-279657cc683e	\N	00040000-56ab-757b-db7f-3d3c80c3f958	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-757e-6c9b-54d95f0e0bf0	\N	00040000-56ab-757b-db7f-3d3c80c3f958	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56ab-757e-c9d4-1b0c27999a40	\N	00040000-56ab-757b-db7f-3d3c80c3f958	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-757e-22d5-97a68a40ffec	\N	00040000-56ab-757b-db7f-3d3c80c3f958	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-757e-1837-07b22d303d6c	\N	00040000-56ab-757b-db7f-3d3c80c3f958	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-757e-5089-a6230a589209	\N	00040000-56ab-757b-c670-d41f9f63950c	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-757e-3e53-f06b4c0a880d	\N	00040000-56ab-757b-4709-ce4742a0272a	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-757e-2cdc-5d2c5a21ac3f	\N	00040000-56ab-757b-6784-8732bcfdde10	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-757e-26a2-75d462a690a5	\N	00040000-56ab-757b-dfc8-e0432b3ebbec	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56ab-7580-c5cd-24f36f4a4fe5	\N	00040000-56ab-757b-db7f-3d3c80c3f958	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 41961259)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56ab-757b-08d0-f0703dac5da1	8341	Adlešiči
00050000-56ab-757b-6c2a-6a76ca172f06	5270	Ajdovščina
00050000-56ab-757b-c8fe-b6240a248ac1	6280	Ankaran/Ancarano
00050000-56ab-757b-f510-bf2ac930ff12	9253	Apače
00050000-56ab-757b-fa28-fb9b23958682	8253	Artiče
00050000-56ab-757b-ded0-86156f2dbc78	4275	Begunje na Gorenjskem
00050000-56ab-757b-b9c3-15ad8ea85693	1382	Begunje pri Cerknici
00050000-56ab-757b-036c-d902a5785e9c	9231	Beltinci
00050000-56ab-757b-0917-78587af0def9	2234	Benedikt
00050000-56ab-757b-51a8-02380260434c	2345	Bistrica ob Dravi
00050000-56ab-757b-b20b-b9ee79426460	3256	Bistrica ob Sotli
00050000-56ab-757b-b40a-ef90cd7f16a3	8259	Bizeljsko
00050000-56ab-757b-a3b9-22d5950aae1e	1223	Blagovica
00050000-56ab-757b-066a-cf6e1d42ff68	8283	Blanca
00050000-56ab-757b-a447-e29f9242a5bc	4260	Bled
00050000-56ab-757b-a900-141288f8c273	4273	Blejska Dobrava
00050000-56ab-757b-aa9d-75e18fe7f468	9265	Bodonci
00050000-56ab-757b-0e91-afb3562fb625	9222	Bogojina
00050000-56ab-757b-da74-f2d35df40874	4263	Bohinjska Bela
00050000-56ab-757b-36ca-8549d71345b8	4264	Bohinjska Bistrica
00050000-56ab-757b-6929-8f2be0630261	4265	Bohinjsko jezero
00050000-56ab-757b-53b1-29fa77bff99f	1353	Borovnica
00050000-56ab-757b-d071-875bb99fa944	8294	Boštanj
00050000-56ab-757b-de23-a81780f62b07	5230	Bovec
00050000-56ab-757b-a427-f267a46e1d63	5295	Branik
00050000-56ab-757b-8f6f-6748d6c2de1a	3314	Braslovče
00050000-56ab-757b-4698-86ab9cb90de9	5223	Breginj
00050000-56ab-757b-1acf-992b72b90905	8280	Brestanica
00050000-56ab-757b-cf6e-0f26b977afa5	2354	Bresternica
00050000-56ab-757b-2b19-a0e53a974b99	4243	Brezje
00050000-56ab-757b-829f-895bbf563b18	1351	Brezovica pri Ljubljani
00050000-56ab-757b-5d21-1cb63c0807dc	8250	Brežice
00050000-56ab-757b-21f4-9262a75b54a2	4210	Brnik - Aerodrom
00050000-56ab-757b-a613-3aae3a12c75a	8321	Brusnice
00050000-56ab-757b-bc31-4789441e7525	3255	Buče
00050000-56ab-757b-4bcb-6fa96656b0ca	8276	Bučka 
00050000-56ab-757b-184a-a2d5761816f6	9261	Cankova
00050000-56ab-757b-7232-c6fbd7b580a0	3000	Celje 
00050000-56ab-757b-0fa8-0c968e4be19c	3001	Celje - poštni predali
00050000-56ab-757b-efc7-d7f8eb173401	4207	Cerklje na Gorenjskem
00050000-56ab-757b-f186-524389920e20	8263	Cerklje ob Krki
00050000-56ab-757b-d765-0d01da5e674e	1380	Cerknica
00050000-56ab-757b-2fe5-707056729762	5282	Cerkno
00050000-56ab-757b-771d-2ad26bbd45df	2236	Cerkvenjak
00050000-56ab-757b-2922-8eea59c0615c	2215	Ceršak
00050000-56ab-757b-9951-f093e2800029	2326	Cirkovce
00050000-56ab-757b-47a7-14db65bd8220	2282	Cirkulane
00050000-56ab-757b-6103-3c23e4c00b99	5273	Col
00050000-56ab-757b-86d1-f56eaf2b62d1	8251	Čatež ob Savi
00050000-56ab-757b-c8bb-1d883e2ac46f	1413	Čemšenik
00050000-56ab-757b-2cf6-ca3dcb200391	5253	Čepovan
00050000-56ab-757b-69d7-367282b8e59e	9232	Črenšovci
00050000-56ab-757b-67fa-526c13607e32	2393	Črna na Koroškem
00050000-56ab-757b-b611-8cef0a71dabf	6275	Črni Kal
00050000-56ab-757b-513b-9dd54cfed660	5274	Črni Vrh nad Idrijo
00050000-56ab-757b-b07d-93c21f4a320e	5262	Črniče
00050000-56ab-757b-248d-97b8b64ab296	8340	Črnomelj
00050000-56ab-757b-074d-e38b32005d4a	6271	Dekani
00050000-56ab-757b-d6cf-f37f731079e8	5210	Deskle
00050000-56ab-757b-dc26-fda23ea29797	2253	Destrnik
00050000-56ab-757b-1aa9-edca0bde86b8	6215	Divača
00050000-56ab-757b-02eb-2ea26b83da8c	1233	Dob
00050000-56ab-757b-50a7-84e6a019ddf8	3224	Dobje pri Planini
00050000-56ab-757b-c758-e0465819e4ee	8257	Dobova
00050000-56ab-757b-1d0c-8f966c6c11b0	1423	Dobovec
00050000-56ab-757b-17cb-2ff5462d07ac	5263	Dobravlje
00050000-56ab-757b-ee76-fd9b613a4070	3204	Dobrna
00050000-56ab-757b-a83a-e55cf4c675a7	8211	Dobrnič
00050000-56ab-757b-c28c-c49b81a507fa	1356	Dobrova
00050000-56ab-757b-a3bc-c5357305bc8d	9223	Dobrovnik/Dobronak 
00050000-56ab-757b-9209-66d545c1cfcd	5212	Dobrovo v Brdih
00050000-56ab-757b-86c1-a45ce60ff18e	1431	Dol pri Hrastniku
00050000-56ab-757b-53f2-de1e26884df0	1262	Dol pri Ljubljani
00050000-56ab-757b-1698-3452ad791c86	1273	Dole pri Litiji
00050000-56ab-757b-2342-44b9fc8423d7	1331	Dolenja vas
00050000-56ab-757b-4442-b845473c7c66	8350	Dolenjske Toplice
00050000-56ab-757b-9b28-fbd1162de545	1230	Domžale
00050000-56ab-757b-22d5-9161b85e99fa	2252	Dornava
00050000-56ab-757b-1dc3-3776f9cc40da	5294	Dornberk
00050000-56ab-757b-0cb1-80af709c1ebc	1319	Draga
00050000-56ab-757b-afc9-04c692594e67	8343	Dragatuš
00050000-56ab-757b-ea87-095d874369a1	3222	Dramlje
00050000-56ab-757b-0234-736e177cfe68	2370	Dravograd
00050000-56ab-757b-1efa-387db4611ab5	4203	Duplje
00050000-56ab-757b-eb53-64d86d397fe7	6221	Dutovlje
00050000-56ab-757b-b96d-9a65e59c76dc	8361	Dvor
00050000-56ab-757b-7272-cddd562de1f1	2343	Fala
00050000-56ab-757b-4fff-25505abb8076	9208	Fokovci
00050000-56ab-757b-c301-752ede1e958b	2313	Fram
00050000-56ab-757b-6d67-f157cb67494a	3213	Frankolovo
00050000-56ab-757b-b075-2d3dd310cb22	1274	Gabrovka
00050000-56ab-757b-b57f-b77f27177cdd	8254	Globoko
00050000-56ab-757b-7172-38c7bd8e9d02	5275	Godovič
00050000-56ab-757b-da06-1167edebd502	4204	Golnik
00050000-56ab-757b-5e25-5ebc1442c1bf	3303	Gomilsko
00050000-56ab-757b-c286-cb31433f7c7f	4224	Gorenja vas
00050000-56ab-757b-e7ed-12042d85ecca	3263	Gorica pri Slivnici
00050000-56ab-757b-4a38-0755ce4d1a51	2272	Gorišnica
00050000-56ab-757b-832d-13fe408e7491	9250	Gornja Radgona
00050000-56ab-757b-9887-f1d4dba49a6c	3342	Gornji Grad
00050000-56ab-757b-f6fa-57638a91b085	4282	Gozd Martuljek
00050000-56ab-757b-cabd-97c60a1735e6	6272	Gračišče
00050000-56ab-757b-25b7-ef17ecbe35a9	9264	Grad
00050000-56ab-757b-6838-e481677107e4	8332	Gradac
00050000-56ab-757b-c281-a9a60c1bf597	1384	Grahovo
00050000-56ab-757b-d60d-0c3e39452218	5242	Grahovo ob Bači
00050000-56ab-757b-499f-2f9c175697d8	5251	Grgar
00050000-56ab-757b-6bca-45a2b3de4692	3302	Griže
00050000-56ab-757b-26d4-180ec3466eda	3231	Grobelno
00050000-56ab-757b-dfab-26a643fcf5a3	1290	Grosuplje
00050000-56ab-757b-18d3-5d76e62786d8	2288	Hajdina
00050000-56ab-757b-6ede-967fe3fde2fb	8362	Hinje
00050000-56ab-757b-53a6-3e835f363560	2311	Hoče
00050000-56ab-757b-d7a8-dcac1c44bfe4	9205	Hodoš/Hodos
00050000-56ab-757b-b25e-670e26136ce8	1354	Horjul
00050000-56ab-757b-9dc7-4f9309e9bc4c	1372	Hotedršica
00050000-56ab-757b-5084-00afa70e2e51	1430	Hrastnik
00050000-56ab-757b-58aa-64015fe281b1	6225	Hruševje
00050000-56ab-757b-891e-b420b54c3f50	4276	Hrušica
00050000-56ab-757b-1645-b857dbd99fec	5280	Idrija
00050000-56ab-757b-c6b2-9af953c19274	1292	Ig
00050000-56ab-757b-3949-6acccb642a87	6250	Ilirska Bistrica
00050000-56ab-757b-59c0-8c837d803d2e	6251	Ilirska Bistrica-Trnovo
00050000-56ab-757b-6ba3-dbb609198f46	1295	Ivančna Gorica
00050000-56ab-757b-0877-81c326f33d19	2259	Ivanjkovci
00050000-56ab-757b-ed3a-ed67ab4adbc5	1411	Izlake
00050000-56ab-757b-e14a-a77a8370a628	6310	Izola/Isola
00050000-56ab-757b-8691-4defa2586b6f	2222	Jakobski Dol
00050000-56ab-757b-f7ef-0739fe2b1087	2221	Jarenina
00050000-56ab-757b-da09-c75c5356f01d	6254	Jelšane
00050000-56ab-757b-b9f8-f8cccf810945	4270	Jesenice
00050000-56ab-757b-19b7-0689639f1e61	8261	Jesenice na Dolenjskem
00050000-56ab-757b-304f-413ff6d3f276	3273	Jurklošter
00050000-56ab-757b-e532-a424b6d534ce	2223	Jurovski Dol
00050000-56ab-757b-02bb-e29cfad7ef89	2256	Juršinci
00050000-56ab-757b-bca2-34706932cd5d	5214	Kal nad Kanalom
00050000-56ab-757b-da58-92c3798591c4	3233	Kalobje
00050000-56ab-757b-d3ad-4c4f10076d28	4246	Kamna Gorica
00050000-56ab-757b-199e-6665a929712e	2351	Kamnica
00050000-56ab-757b-cfe9-b5a376cc75f2	1241	Kamnik
00050000-56ab-757b-8fec-efa2d079ab7f	5213	Kanal
00050000-56ab-757b-f5e4-83298311713b	8258	Kapele
00050000-56ab-757b-aa05-b9ff4a7b49ef	2362	Kapla
00050000-56ab-757b-4520-d51790baf759	2325	Kidričevo
00050000-56ab-757b-f23e-d1d19764425a	1412	Kisovec
00050000-56ab-757b-5919-6915b49ea7fb	6253	Knežak
00050000-56ab-757b-355f-258cc4ae731c	5222	Kobarid
00050000-56ab-757b-e791-3f89aa8f43a5	9227	Kobilje
00050000-56ab-757b-8145-31984cf116e0	1330	Kočevje
00050000-56ab-757b-12b6-7153529546b6	1338	Kočevska Reka
00050000-56ab-757b-797c-483f55ec399c	2276	Kog
00050000-56ab-757b-d971-de5eea5b94f0	5211	Kojsko
00050000-56ab-757b-4e4e-ef693f5b8a89	6223	Komen
00050000-56ab-757b-a5cc-c6e6053f9218	1218	Komenda
00050000-56ab-757b-7016-1f40879b0163	6000	Koper/Capodistria 
00050000-56ab-757b-ef1f-08e925124d8b	6001	Koper/Capodistria - poštni predali
00050000-56ab-757b-9925-e35e293da9cc	8282	Koprivnica
00050000-56ab-757b-1b85-84f910d23846	5296	Kostanjevica na Krasu
00050000-56ab-757b-dea3-e1b92899f51f	8311	Kostanjevica na Krki
00050000-56ab-757b-9958-41e7334b294b	1336	Kostel
00050000-56ab-757b-ea11-7a25e3747fbb	6256	Košana
00050000-56ab-757b-a929-2909babfcdcd	2394	Kotlje
00050000-56ab-757b-fa7b-fc821ec8f44b	6240	Kozina
00050000-56ab-757b-644d-2901036fe309	3260	Kozje
00050000-56ab-757b-7109-d2db57734da3	4000	Kranj 
00050000-56ab-757b-2121-481a695681fc	4001	Kranj - poštni predali
00050000-56ab-757b-c211-64e7c267ec5d	4280	Kranjska Gora
00050000-56ab-757b-edbf-67f60aebf72a	1281	Kresnice
00050000-56ab-757b-0b2c-95f1ea2fe0f7	4294	Križe
00050000-56ab-757b-1901-dd89a9397c85	9206	Križevci
00050000-56ab-757b-6c51-6516c62df181	9242	Križevci pri Ljutomeru
00050000-56ab-757b-4e7a-783c393b7961	1301	Krka
00050000-56ab-757b-448e-0bf281246da7	8296	Krmelj
00050000-56ab-757b-c565-dbfde844abf3	4245	Kropa
00050000-56ab-757b-3300-c99be87a67bb	8262	Krška vas
00050000-56ab-757b-ba60-7f78ce1629bf	8270	Krško
00050000-56ab-757b-bb08-df7abfbcb9ad	9263	Kuzma
00050000-56ab-757b-4949-4c71c6f5235e	2318	Laporje
00050000-56ab-757b-6df9-401e927df8e2	3270	Laško
00050000-56ab-757b-c0ff-66abbcc08afa	1219	Laze v Tuhinju
00050000-56ab-757b-6b8a-8212dc51f786	2230	Lenart v Slovenskih goricah
00050000-56ab-757b-c7d6-9b5ab9473f02	9220	Lendava/Lendva
00050000-56ab-757b-d90b-741dfda7f873	4248	Lesce
00050000-56ab-757b-de72-f7ab9112adc4	3261	Lesično
00050000-56ab-757b-4119-f4d05416859b	8273	Leskovec pri Krškem
00050000-56ab-757b-5bbb-496afa09574b	2372	Libeliče
00050000-56ab-757b-6894-6490cc980ac2	2341	Limbuš
00050000-56ab-757b-cdec-d291d313f6de	1270	Litija
00050000-56ab-757b-4410-d6bfe168a5f3	3202	Ljubečna
00050000-56ab-757b-01db-846113661f13	1000	Ljubljana 
00050000-56ab-757b-4c39-9f206b628ddd	1001	Ljubljana - poštni predali
00050000-56ab-757b-b3d1-6e67be0eea7c	1231	Ljubljana - Črnuče
00050000-56ab-757b-c535-893f45946b85	1261	Ljubljana - Dobrunje
00050000-56ab-757b-7a6b-6b4d7e9c0283	1260	Ljubljana - Polje
00050000-56ab-757b-9023-f4de5b48099b	1210	Ljubljana - Šentvid
00050000-56ab-757b-87b1-7f811b2d3a74	1211	Ljubljana - Šmartno
00050000-56ab-757b-c7cd-bfe367ef111f	3333	Ljubno ob Savinji
00050000-56ab-757b-8b16-f11408ac9fd4	9240	Ljutomer
00050000-56ab-757b-014c-f93cbe604fda	3215	Loče
00050000-56ab-757b-4cc3-fff7bae766f9	5231	Log pod Mangartom
00050000-56ab-757b-0433-7a5b57c0df21	1358	Log pri Brezovici
00050000-56ab-757b-6abf-6371c4d8918b	1370	Logatec
00050000-56ab-757b-a9c0-90d8f51c8ff3	1371	Logatec
00050000-56ab-757b-b7a4-efe448b0cb14	1434	Loka pri Zidanem Mostu
00050000-56ab-757b-c2c6-b6a98642ce84	3223	Loka pri Žusmu
00050000-56ab-757b-84b2-56504b4141b0	6219	Lokev
00050000-56ab-757b-98d2-652bf9ce1491	1318	Loški Potok
00050000-56ab-757b-a295-d7f0ea427c8b	2324	Lovrenc na Dravskem polju
00050000-56ab-757b-ef9c-30afdf1b4c29	2344	Lovrenc na Pohorju
00050000-56ab-757b-7631-6cc3accce09b	3334	Luče
00050000-56ab-757b-905a-0edc4f9fb164	1225	Lukovica
00050000-56ab-757b-9ab6-c3318a566363	9202	Mačkovci
00050000-56ab-757b-4a54-8f0732522cbe	2322	Majšperk
00050000-56ab-757b-2720-62ca08d80bc4	2321	Makole
00050000-56ab-757b-7110-cd0e9b4840ff	9243	Mala Nedelja
00050000-56ab-757b-7e33-e330764e6338	2229	Malečnik
00050000-56ab-757b-ce1f-432fe423c1e7	6273	Marezige
00050000-56ab-757b-7a5e-f14ecece095a	2000	Maribor 
00050000-56ab-757b-9eb1-7408ac30acee	2001	Maribor - poštni predali
00050000-56ab-757b-1f04-8fb7da470634	2206	Marjeta na Dravskem polju
00050000-56ab-757b-6405-3c4091e1b20f	2281	Markovci
00050000-56ab-757b-c870-198539f48213	9221	Martjanci
00050000-56ab-757b-03bc-4328dc0e16ad	6242	Materija
00050000-56ab-757b-1976-64736cd375b1	4211	Mavčiče
00050000-56ab-757b-e9ef-bd40a822cf2b	1215	Medvode
00050000-56ab-757b-9394-f631344fbf37	1234	Mengeš
00050000-56ab-757b-d553-eaf57e382a6a	8330	Metlika
00050000-56ab-757b-2d1f-22073b073d87	2392	Mežica
00050000-56ab-757b-25c3-b88546e734bd	2204	Miklavž na Dravskem polju
00050000-56ab-757b-8e31-83a8d15d4dbb	2275	Miklavž pri Ormožu
00050000-56ab-757b-1efc-8d3657169d7c	5291	Miren
00050000-56ab-757b-d719-36ce0fe7325b	8233	Mirna
00050000-56ab-757b-3f53-bdf8f2d92fcd	8216	Mirna Peč
00050000-56ab-757b-8096-b850d4121350	2382	Mislinja
00050000-56ab-757b-ff5c-2bd1dbe4fe2d	4281	Mojstrana
00050000-56ab-757b-46f5-8296e50e7105	8230	Mokronog
00050000-56ab-757b-53c3-d1b5f725db32	1251	Moravče
00050000-56ab-757b-d991-3402d3e26ddb	9226	Moravske Toplice
00050000-56ab-757b-96cf-763556e5d1fe	5216	Most na Soči
00050000-56ab-757b-7dc0-6ff444e7ea9d	1221	Motnik
00050000-56ab-757b-514e-46f0141f4bc4	3330	Mozirje
00050000-56ab-757b-6827-ab913333ed79	9000	Murska Sobota 
00050000-56ab-757b-1df0-b2d42161e1d5	9001	Murska Sobota - poštni predali
00050000-56ab-757b-15ac-706699e2e8d3	2366	Muta
00050000-56ab-757b-7a69-e2823b534eea	4202	Naklo
00050000-56ab-757b-31c6-03c2aa615b92	3331	Nazarje
00050000-56ab-757b-370d-531285d25efd	1357	Notranje Gorice
00050000-56ab-757b-066f-99b1d63cc44f	3203	Nova Cerkev
00050000-56ab-757b-120b-091318e3a2d0	5000	Nova Gorica 
00050000-56ab-757b-cca7-08bfc43a2faf	5001	Nova Gorica - poštni predali
00050000-56ab-757b-9cc6-8413e314015f	1385	Nova vas
00050000-56ab-757b-19f3-bbcf8b518438	8000	Novo mesto
00050000-56ab-757b-7a86-7bbfbaaa4a86	8001	Novo mesto - poštni predali
00050000-56ab-757b-d7ec-2539c0ff0070	6243	Obrov
00050000-56ab-757b-b6ea-6bcb2c066336	9233	Odranci
00050000-56ab-757b-130e-f6ca79ab8ca0	2317	Oplotnica
00050000-56ab-757b-ac82-7ae3e94f6160	2312	Orehova vas
00050000-56ab-757b-7cae-b6b8c652f82b	2270	Ormož
00050000-56ab-757b-8d3a-cda5dc070b0d	1316	Ortnek
00050000-56ab-757b-1c0d-e5632d493499	1337	Osilnica
00050000-56ab-757b-20c0-8655c4f21bb2	8222	Otočec
00050000-56ab-757b-9714-9ecb07cc67a1	2361	Ožbalt
00050000-56ab-757b-0eee-6bc14a9221cf	2231	Pernica
00050000-56ab-757b-e202-461c722d684d	2211	Pesnica pri Mariboru
00050000-56ab-757b-475a-cd2dfeeefc9c	9203	Petrovci
00050000-56ab-757b-827c-5505dcc3974e	3301	Petrovče
00050000-56ab-757b-2086-6e667683b9d8	6330	Piran/Pirano
00050000-56ab-757b-7103-8212524462e3	8255	Pišece
00050000-56ab-757b-909f-d483c106c6ea	6257	Pivka
00050000-56ab-757b-a1f5-807b6a5dcb35	6232	Planina
00050000-56ab-757b-ef7a-2c9e381e9b2b	3225	Planina pri Sevnici
00050000-56ab-757b-65a4-c66050fabf9e	6276	Pobegi
00050000-56ab-757b-106c-db182517b8c5	8312	Podbočje
00050000-56ab-757b-cc5f-2443da421194	5243	Podbrdo
00050000-56ab-757b-5e86-fa3ee7839698	3254	Podčetrtek
00050000-56ab-757b-c3a3-b2d15ff79eba	2273	Podgorci
00050000-56ab-757b-cc21-4f05cf2a0674	6216	Podgorje
00050000-56ab-757b-c46a-7f11fb934a3c	2381	Podgorje pri Slovenj Gradcu
00050000-56ab-757b-fe76-c3b0075c9eb0	6244	Podgrad
00050000-56ab-757b-e201-683ea83648ef	1414	Podkum
00050000-56ab-757b-d28c-f7359ee1f3c8	2286	Podlehnik
00050000-56ab-757b-86b3-c5c8ef4747b8	5272	Podnanos
00050000-56ab-757b-90ec-47c19dc64bed	4244	Podnart
00050000-56ab-757b-cb81-37920899acd7	3241	Podplat
00050000-56ab-757b-c123-3eb136b3ee3e	3257	Podsreda
00050000-56ab-757b-ccbb-a2566d6b9d5b	2363	Podvelka
00050000-56ab-757b-a171-b8ea03cd8e73	2208	Pohorje
00050000-56ab-757b-19db-798aedf6d0e8	2257	Polenšak
00050000-56ab-757b-0152-1ab91fcbd00c	1355	Polhov Gradec
00050000-56ab-757b-41d1-aa5265ceaf67	4223	Poljane nad Škofjo Loko
00050000-56ab-757b-d55f-24219db17aa1	2319	Poljčane
00050000-56ab-757b-48c6-f7f77da84f70	1272	Polšnik
00050000-56ab-757b-69d8-7dacdf40fed2	3313	Polzela
00050000-56ab-757b-9eec-b4cd6f39bf6b	3232	Ponikva
00050000-56ab-757b-202b-3bee7574f232	6320	Portorož/Portorose
00050000-56ab-757b-fd93-ba3b25679905	6230	Postojna
00050000-56ab-757b-78b6-9786e478ea43	2331	Pragersko
00050000-56ab-757b-6159-c95e1bdc810e	3312	Prebold
00050000-56ab-757b-e112-da3942aa00bb	4205	Preddvor
00050000-56ab-757b-f416-a39ac9892f4b	6255	Prem
00050000-56ab-757b-5985-32e4227f5d76	1352	Preserje
00050000-56ab-757b-d04b-2fe5c0cd530f	6258	Prestranek
00050000-56ab-757b-3bf1-a479ccd1d8e3	2391	Prevalje
00050000-56ab-757b-7af2-ea862f5c0619	3262	Prevorje
00050000-56ab-757b-da05-90b2db118e87	1276	Primskovo 
00050000-56ab-757b-11d1-481c43b7479b	3253	Pristava pri Mestinju
00050000-56ab-757b-bff8-77f38116e14f	9207	Prosenjakovci/Partosfalva
00050000-56ab-757b-ecac-3e88ff2d722d	5297	Prvačina
00050000-56ab-757b-103e-bd155edcfa72	2250	Ptuj
00050000-56ab-757b-36b5-0699842b06da	2323	Ptujska Gora
00050000-56ab-757b-a310-929f8c97fc4b	9201	Puconci
00050000-56ab-757b-f362-f01c2cfd65f6	2327	Rače
00050000-56ab-757b-a625-ded57974a252	1433	Radeče
00050000-56ab-757b-c472-a2c555d92295	9252	Radenci
00050000-56ab-757b-9a7c-02fa75d980cc	2360	Radlje ob Dravi
00050000-56ab-757b-fac7-9ae0aeb039be	1235	Radomlje
00050000-56ab-757b-a2c1-76e81a926391	4240	Radovljica
00050000-56ab-757b-82d3-e902d010bb9c	8274	Raka
00050000-56ab-757b-e3a6-f318345ee271	1381	Rakek
00050000-56ab-757b-be77-0eed52e89a65	4283	Rateče - Planica
00050000-56ab-757b-502e-02fdfc24b713	2390	Ravne na Koroškem
00050000-56ab-757b-f7dc-9aeae9edfcad	9246	Razkrižje
00050000-56ab-757b-7d00-2226978f4367	3332	Rečica ob Savinji
00050000-56ab-757b-5846-0bca240d5098	5292	Renče
00050000-56ab-757b-3c7c-986704cca574	1310	Ribnica
00050000-56ab-757b-14cb-bfc2880fad5e	2364	Ribnica na Pohorju
00050000-56ab-757b-8a63-a23996b4aefb	3272	Rimske Toplice
00050000-56ab-757b-083a-e98ce1a05dba	1314	Rob
00050000-56ab-757b-94dd-4c70b3416e7f	5215	Ročinj
00050000-56ab-757b-4eb9-2b51444291dc	3250	Rogaška Slatina
00050000-56ab-757b-e936-79977f07e12f	9262	Rogašovci
00050000-56ab-757b-c610-1a3013510b30	3252	Rogatec
00050000-56ab-757b-74fc-c270cc0f4e45	1373	Rovte
00050000-56ab-757b-c625-d58e25403573	2342	Ruše
00050000-56ab-757b-e631-a4ff7b5fb22b	1282	Sava
00050000-56ab-757b-1382-8bfd2e7a449b	6333	Sečovlje/Sicciole
00050000-56ab-757b-9edd-308c2978595b	4227	Selca
00050000-56ab-757b-452d-869413f6dee9	2352	Selnica ob Dravi
00050000-56ab-757b-0573-75d6bc49bde4	8333	Semič
00050000-56ab-757b-2900-2bfadec3e83b	8281	Senovo
00050000-56ab-757b-c4d8-e3484d456a82	6224	Senožeče
00050000-56ab-757b-07e8-27dba2c29fcc	8290	Sevnica
00050000-56ab-757b-f019-6e131959c22a	6210	Sežana
00050000-56ab-757b-9bd6-8cd88c6e6ff6	2214	Sladki Vrh
00050000-56ab-757b-2343-d08411a300f3	5283	Slap ob Idrijci
00050000-56ab-757b-a740-a09d0c8c9269	2380	Slovenj Gradec
00050000-56ab-757b-d112-cd979ae4f3fb	2310	Slovenska Bistrica
00050000-56ab-757b-9329-4f3107499ea2	3210	Slovenske Konjice
00050000-56ab-757b-c620-9152b939b49d	1216	Smlednik
00050000-56ab-757b-94e4-699a022bbd8e	5232	Soča
00050000-56ab-757b-27e9-aac667bec97f	1317	Sodražica
00050000-56ab-757b-a133-6c03b5f8fd08	3335	Solčava
00050000-56ab-757b-314f-d534f2dee9b2	5250	Solkan
00050000-56ab-757b-6eb5-fe8064bda705	4229	Sorica
00050000-56ab-757b-c653-b457f182c093	4225	Sovodenj
00050000-56ab-757b-fbf3-352f6f4a3fe4	5281	Spodnja Idrija
00050000-56ab-757b-af5b-82c1c8bc1f68	2241	Spodnji Duplek
00050000-56ab-757b-6e1c-a3eb7d0ccdd8	9245	Spodnji Ivanjci
00050000-56ab-757b-fa0f-8dab963aece7	2277	Središče ob Dravi
00050000-56ab-757b-7f58-31e39bfc1086	4267	Srednja vas v Bohinju
00050000-56ab-757b-58be-25984d1ff970	8256	Sromlje 
00050000-56ab-757b-7469-0c909a27ea71	5224	Srpenica
00050000-56ab-757b-c3b5-2433bfb8c71e	1242	Stahovica
00050000-56ab-757b-1092-38fb34264516	1332	Stara Cerkev
00050000-56ab-757b-ecc0-9ab05f060155	8342	Stari trg ob Kolpi
00050000-56ab-757b-7bf2-f6f99a04016c	1386	Stari trg pri Ložu
00050000-56ab-757b-b860-26fd6a4ed2db	2205	Starše
00050000-56ab-757b-2231-d62867f0ca61	2289	Stoperce
00050000-56ab-757b-9ff5-69fc258fda2b	8322	Stopiče
00050000-56ab-757b-4a7b-b9e854f0bfd1	3206	Stranice
00050000-56ab-757b-fc30-2599aa8fbf7f	8351	Straža
00050000-56ab-757b-9725-afafd8968df2	1313	Struge
00050000-56ab-757b-945a-4f203437829d	8293	Studenec
00050000-56ab-757b-c3a6-c27d5c1d8d47	8331	Suhor
00050000-56ab-757b-5486-920136b607c8	2233	Sv. Ana v Slovenskih goricah
00050000-56ab-757b-538d-a01f7a40273f	2235	Sv. Trojica v Slovenskih goricah
00050000-56ab-757b-21db-4d122dd1c912	2353	Sveti Duh na Ostrem Vrhu
00050000-56ab-757b-57a1-1f4c9e5b0c51	9244	Sveti Jurij ob Ščavnici
00050000-56ab-757b-a838-2027de787515	3264	Sveti Štefan
00050000-56ab-757b-9a71-bd2a2e9c0807	2258	Sveti Tomaž
00050000-56ab-757b-9837-8f34bfabfe84	9204	Šalovci
00050000-56ab-757b-ed0b-04f8b293a1b6	5261	Šempas
00050000-56ab-757b-f368-c3487820ea3d	5290	Šempeter pri Gorici
00050000-56ab-757b-b478-c57d2e5adb77	3311	Šempeter v Savinjski dolini
00050000-56ab-757b-8139-df4e75e49133	4208	Šenčur
00050000-56ab-757b-e586-4e9b4f2ff5eb	2212	Šentilj v Slovenskih goricah
00050000-56ab-757b-8224-77e566c1fae8	8297	Šentjanž
00050000-56ab-757b-eba4-078f3f85fa82	2373	Šentjanž pri Dravogradu
00050000-56ab-757b-cc15-9857ae6c7f22	8310	Šentjernej
00050000-56ab-757b-3de7-1c35433981a9	3230	Šentjur
00050000-56ab-757b-e5ca-b35b64e67ed3	3271	Šentrupert
00050000-56ab-757b-2452-9b9f5a8b3ca5	8232	Šentrupert
00050000-56ab-757b-df07-b24d26938d19	1296	Šentvid pri Stični
00050000-56ab-757b-2722-0525f9ffe91f	8275	Škocjan
00050000-56ab-757b-e0b0-ae0cdd4343b7	6281	Škofije
00050000-56ab-757b-fab3-28030940f0bc	4220	Škofja Loka
00050000-56ab-757b-fd97-34e6e1a792fd	3211	Škofja vas
00050000-56ab-757b-1ba4-607027b48a53	1291	Škofljica
00050000-56ab-757b-7fe9-a0f9068e5a37	6274	Šmarje
00050000-56ab-757b-fb69-3fd16acf262a	1293	Šmarje - Sap
00050000-56ab-757b-3307-b566ca0eef35	3240	Šmarje pri Jelšah
00050000-56ab-757b-db18-5d152b34a375	8220	Šmarješke Toplice
00050000-56ab-757b-9a24-3cbde4279964	2315	Šmartno na Pohorju
00050000-56ab-757b-cccd-978bba1d771c	3341	Šmartno ob Dreti
00050000-56ab-757b-d4bb-bc00cb0c2598	3327	Šmartno ob Paki
00050000-56ab-757b-eb9b-3f74f9dc51d9	1275	Šmartno pri Litiji
00050000-56ab-757b-6bac-08de29e2c7eb	2383	Šmartno pri Slovenj Gradcu
00050000-56ab-757b-130a-316cd883003d	3201	Šmartno v Rožni dolini
00050000-56ab-757b-a005-6db080ebc0a9	3325	Šoštanj
00050000-56ab-757b-ac78-073f5a56a366	6222	Štanjel
00050000-56ab-757b-3e81-efdc6575dd22	3220	Štore
00050000-56ab-757b-1f9e-18f2dd5b342e	3304	Tabor
00050000-56ab-757b-9128-5b3e6942313d	3221	Teharje
00050000-56ab-757b-0110-a668d7c8d5da	9251	Tišina
00050000-56ab-757b-b932-9ca13c007d19	5220	Tolmin
00050000-56ab-757b-765f-1edeb8904d11	3326	Topolšica
00050000-56ab-757b-21a1-62836dffb779	2371	Trbonje
00050000-56ab-757b-3beb-b189dd81c7c6	1420	Trbovlje
00050000-56ab-757b-d877-64fe1b79d706	8231	Trebelno 
00050000-56ab-757b-9e73-6b21d25f66fc	8210	Trebnje
00050000-56ab-757b-c010-7a8844db95c2	5252	Trnovo pri Gorici
00050000-56ab-757b-e1f3-555d4fc57bb4	2254	Trnovska vas
00050000-56ab-757b-4351-aed49a932f46	1222	Trojane
00050000-56ab-757b-9c00-0955f8a2389f	1236	Trzin
00050000-56ab-757b-0628-1efd6c321432	4290	Tržič
00050000-56ab-757b-e916-f0cc36d6ae2a	8295	Tržišče
00050000-56ab-757b-b7fa-c462955d6180	1311	Turjak
00050000-56ab-757b-fc8a-91cb77a8ce4c	9224	Turnišče
00050000-56ab-757b-08b7-e43da7fe8365	8323	Uršna sela
00050000-56ab-757b-29ff-3cb627a3d9cf	1252	Vače
00050000-56ab-757b-6ee8-f833d3b443c2	3320	Velenje 
00050000-56ab-757b-2d27-97867f330980	3322	Velenje - poštni predali
00050000-56ab-757b-f033-01753fe3b3c3	8212	Velika Loka
00050000-56ab-757b-f4a7-81e1a9fa8d84	2274	Velika Nedelja
00050000-56ab-757b-da55-1c10aab37652	9225	Velika Polana
00050000-56ab-757b-78ac-0596a776fb95	1315	Velike Lašče
00050000-56ab-757b-7d8f-d7b379f268f2	8213	Veliki Gaber
00050000-56ab-757b-b9e3-abc06010cf5f	9241	Veržej
00050000-56ab-757b-352d-9f9b46432a86	1312	Videm - Dobrepolje
00050000-56ab-757b-4589-32fcc284af6b	2284	Videm pri Ptuju
00050000-56ab-757b-71a2-41ee92e12652	8344	Vinica
00050000-56ab-757b-cbbc-bba62b3ccf0b	5271	Vipava
00050000-56ab-757b-995b-699c31ab5c98	4212	Visoko
00050000-56ab-757b-588f-ce4aeccdfb79	1294	Višnja Gora
00050000-56ab-757b-3528-03bfbc19ef4a	3205	Vitanje
00050000-56ab-757b-c087-e15e471a5687	2255	Vitomarci
00050000-56ab-757b-e248-fc78b0de4d64	1217	Vodice
00050000-56ab-757b-ddcc-e8e68ec069c4	3212	Vojnik\t
00050000-56ab-757b-09a3-bdbb3e179d31	5293	Volčja Draga
00050000-56ab-757b-fed1-0e140585d758	2232	Voličina
00050000-56ab-757b-2735-71fed62a5c5f	3305	Vransko
00050000-56ab-757b-28df-1f5dc0f34e9e	6217	Vremski Britof
00050000-56ab-757b-4f82-8b59cb37d4ef	1360	Vrhnika
00050000-56ab-757b-ac66-dde8e89b6c44	2365	Vuhred
00050000-56ab-757b-eae3-c1902ede1291	2367	Vuzenica
00050000-56ab-757b-2124-10ae3c59da95	8292	Zabukovje 
00050000-56ab-757b-fbb3-9001bd778ce6	1410	Zagorje ob Savi
00050000-56ab-757b-bbdc-986b0bc5641b	1303	Zagradec
00050000-56ab-757b-c9b6-fd5ba39b1e7b	2283	Zavrč
00050000-56ab-757b-ccb8-26e96ce3bb6c	8272	Zdole 
00050000-56ab-757b-3e49-3fcb24000f67	4201	Zgornja Besnica
00050000-56ab-757b-30a5-fe46ec4557b3	2242	Zgornja Korena
00050000-56ab-757b-630b-af1c7c5d885d	2201	Zgornja Kungota
00050000-56ab-757b-2eab-961290e9e06a	2316	Zgornja Ložnica
00050000-56ab-757b-8068-21ee8adeab8f	2314	Zgornja Polskava
00050000-56ab-757b-137a-9b4e6277d638	2213	Zgornja Velka
00050000-56ab-757b-1097-6a9862b9b756	4247	Zgornje Gorje
00050000-56ab-757b-b367-3bb69805b870	4206	Zgornje Jezersko
00050000-56ab-757b-5753-964a8f337f52	2285	Zgornji Leskovec
00050000-56ab-757b-47f6-0f139a342e02	1432	Zidani Most
00050000-56ab-757b-6da9-6932f8d6b3a4	3214	Zreče
00050000-56ab-757b-8dba-b1d77e765fbc	4209	Žabnica
00050000-56ab-757b-9488-a06aa4f2df0b	3310	Žalec
00050000-56ab-757b-58c7-aef79f006f7a	4228	Železniki
00050000-56ab-757b-6086-4039e31df3f9	2287	Žetale
00050000-56ab-757b-941d-aa46470c579d	4226	Žiri
00050000-56ab-757b-60ce-dc28a6083db1	4274	Žirovnica
00050000-56ab-757b-2966-74391439bee7	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 41961934)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 41961504)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 41961244)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56ab-757e-08e9-63e0f79c23da	00080000-56ab-757e-c8f6-279657cc683e	\N	00040000-56ab-757b-db7f-3d3c80c3f958	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56ab-757e-f5e4-07a0988cf8cb	00080000-56ab-757e-c8f6-279657cc683e	\N	00040000-56ab-757b-db7f-3d3c80c3f958	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56ab-757e-92e6-3f5034ce4ed9	00080000-56ab-757e-6c9b-54d95f0e0bf0	\N	00040000-56ab-757b-db7f-3d3c80c3f958	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 41961379)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56ab-757b-c814-bb70229e9ae3	novo leto	1	1	\N	t
00430000-56ab-757b-dfa4-929c7aaf3cd6	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56ab-757b-a2d8-c27c74bbad62	dan upora proti okupatorju	27	4	\N	t
00430000-56ab-757b-f3b8-0f820961e3a2	praznik dela	1	5	\N	t
00430000-56ab-757b-069d-7860cf8f4725	praznik dela	2	5	\N	t
00430000-56ab-757b-2642-c74cda759f6a	dan Primoža Trubarja	8	6	\N	f
00430000-56ab-757b-4e34-a730d0d173fa	dan državnosti	25	6	\N	t
00430000-56ab-757b-77d1-8c9df9f28a9e	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56ab-757b-dcf7-6513a8c8ea06	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56ab-757b-eaa2-28cb48a52cd9	dan suverenosti	25	10	\N	f
00430000-56ab-757b-7939-c195a87ffa3a	dan spomina na mrtve	1	11	\N	t
00430000-56ab-757b-2734-ebcf78f95c1c	dan Rudolfa Maistra	23	11	\N	f
00430000-56ab-757b-7896-fd0dbe3a0f26	božič	25	12	\N	t
00430000-56ab-757b-4f44-bdaf8363053c	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56ab-757b-2173-f11a1f545c81	Marijino vnebovzetje	15	8	\N	t
00430000-56ab-757b-d1a8-094a1945dca1	dan reformacije	31	10	\N	t
00430000-56ab-757b-f19a-6377044e236c	velikonočna nedelja	27	3	2016	t
00430000-56ab-757b-a5f4-67023bc77b83	velikonočna nedelja	16	4	2017	t
00430000-56ab-757b-f124-35841daa090d	velikonočna nedelja	1	4	2018	t
00430000-56ab-757b-5dda-e4816c1c65cd	velikonočna nedelja	21	4	2019	t
00430000-56ab-757b-035f-a1de7b01ba32	velikonočna nedelja	12	4	2020	t
00430000-56ab-757b-9ffe-1115cc3572ea	velikonočna nedelja	4	4	2021	t
00430000-56ab-757b-dc16-4c4a875d5ab4	velikonočna nedelja	17	4	2022	t
00430000-56ab-757b-a23e-d08ddde98d2e	velikonočna nedelja	9	4	2023	t
00430000-56ab-757b-1c2c-979b3703847d	velikonočna nedelja	31	3	2024	t
00430000-56ab-757b-febf-659c0f108373	velikonočna nedelja	20	4	2025	t
00430000-56ab-757b-b4d4-ac25809dc465	velikonočna nedelja	5	4	2026	t
00430000-56ab-757b-890e-e8ac9643c059	velikonočna nedelja	28	3	2027	t
00430000-56ab-757b-20d9-6c273f1b1e06	velikonočna nedelja	16	4	2028	t
00430000-56ab-757b-f5e5-6f0d821ab98c	velikonočna nedelja	1	4	2029	t
00430000-56ab-757b-b3c7-b7e066dff127	velikonočna nedelja	21	4	2030	t
00430000-56ab-757b-1f61-5b8239addf11	velikonočni ponedeljek	28	3	2016	t
00430000-56ab-757b-1083-7c8c6cc35a63	velikonočni ponedeljek	17	4	2017	t
00430000-56ab-757b-3ca0-24f0fe57b28f	velikonočni ponedeljek	2	4	2018	t
00430000-56ab-757b-7a04-7f0019208b1b	velikonočni ponedeljek	22	4	2019	t
00430000-56ab-757b-0327-6f861a99e773	velikonočni ponedeljek	13	4	2020	t
00430000-56ab-757b-1bd8-13522e946c64	velikonočni ponedeljek	5	4	2021	t
00430000-56ab-757b-2e15-5e5c216efb80	velikonočni ponedeljek	18	4	2022	t
00430000-56ab-757b-8e2c-9f7c173d9605	velikonočni ponedeljek	10	4	2023	t
00430000-56ab-757c-82ba-53f1dd6a0bea	velikonočni ponedeljek	1	4	2024	t
00430000-56ab-757c-c670-32e39fd00106	velikonočni ponedeljek	21	4	2025	t
00430000-56ab-757c-2dfd-83d2b65b5fba	velikonočni ponedeljek	6	4	2026	t
00430000-56ab-757c-f86d-92f0e2b245f8	velikonočni ponedeljek	29	3	2027	t
00430000-56ab-757c-5757-7fd957425fc4	velikonočni ponedeljek	17	4	2028	t
00430000-56ab-757c-4137-9b499636293f	velikonočni ponedeljek	2	4	2029	t
00430000-56ab-757c-bf2e-73090f6b5be5	velikonočni ponedeljek	22	4	2030	t
00430000-56ab-757c-4a7f-60e6f4613e31	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56ab-757c-c335-6c01508acbc3	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56ab-757c-467b-758064cbfa28	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56ab-757c-6d97-d8d49368c8c0	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56ab-757c-8225-ecbe58181a31	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56ab-757c-6902-5ba7a85e9b51	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56ab-757c-2bf3-a00ec6b0e594	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56ab-757c-b59c-84a0c7079482	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56ab-757c-e853-356e50f5a54c	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56ab-757c-7c84-fff48b82d383	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56ab-757c-e32d-968b109d25ff	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56ab-757c-7c7e-b3d111a064fa	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56ab-757c-dfa4-079d65b9d98b	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56ab-757c-da35-cb0e337a1a0b	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56ab-757c-dfa7-d87d3de5a6a4	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 41961348)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56ab-757f-a022-9bee5bc20074	000e0000-56ab-757e-4c97-0703349a8fcb	1	1	\N
001b0000-56ab-757f-b058-6b5154480820	000e0000-56ab-757e-4c97-0703349a8fcb	1	2	\N
001b0000-56ab-757f-e006-51ef9e682ffa	000e0000-56ab-757e-4c97-0703349a8fcb	1	3	1
001b0000-56ab-757f-c7e6-adc3446cd47c	000e0000-56ab-757e-4c97-0703349a8fcb	2	4	2
001b0000-56ab-757f-f891-6c14b5126157	000e0000-56ab-757e-4c97-0703349a8fcb	4	5	3
001b0000-56ab-757f-ed84-dd7ae0b15356	000e0000-56ab-757e-d82f-6a342e69ca90	1	1	\N
001b0000-56ab-757f-14e5-a946e248594d	000e0000-56ab-757e-d82f-6a342e69ca90	3	2	1
001b0000-56ab-757f-da59-b722a3a0d11b	000e0000-56ab-757e-d82f-6a342e69ca90	1	5	1
001b0000-56ab-757f-dc93-c8d77f6ef4e3	000e0000-56ab-757e-4c97-0703349a8fcb	1	6	1
001b0000-56ab-757f-d5d4-8138d0968bcb	000e0000-56ab-757e-4c97-0703349a8fcb	2	7	2
001b0000-56ab-757f-1883-95f99e86d16b	000e0000-56ab-757e-4c97-0703349a8fcb	5	9	4
001b0000-56ab-757f-fd9f-eb8c7ba52173	000e0000-56ab-757e-4c97-0703349a8fcb	7	10	5
001b0000-56ab-757f-df0a-ef1693d41b2f	000e0000-56ab-757e-d82f-6a342e69ca90	4	3	1
001b0000-56ab-757f-61c9-24e02f5bdfe6	000e0000-56ab-757e-4c97-0703349a8fcb	3	8	3
001b0000-56ab-757f-54b3-39034dd9e353	000e0000-56ab-757e-4c97-0703349a8fcb	2	11	1
001b0000-56ab-757f-222d-eb013353613b	000e0000-56ab-757e-d82f-6a342e69ca90	6	4	2
\.


--
-- TOC entry 3161 (class 0 OID 41961354)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56ab-757f-e006-51ef9e682ffa	000a0000-56ab-757e-2774-5168b6330630
001b0000-56ab-757f-e006-51ef9e682ffa	000a0000-56ab-757e-be7f-d2b5e5a81b46
001b0000-56ab-757f-c7e6-adc3446cd47c	000a0000-56ab-757e-be7f-d2b5e5a81b46
001b0000-56ab-757f-c7e6-adc3446cd47c	000a0000-56ab-757e-b33a-f7d5ea917ed5
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 41961516)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 41961948)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 41961958)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56ab-757e-83fb-d241a34f23eb	00080000-56ab-757e-c9d4-1b0c27999a40	0987	AK
00190000-56ab-757e-37ca-7498b204c332	00080000-56ab-757e-6c9b-54d95f0e0bf0	0989	AK
00190000-56ab-757e-da9e-71aef2650a20	00080000-56ab-757e-22d5-97a68a40ffec	0986	AK
00190000-56ab-757e-b0d6-be153f20b14d	00080000-56ab-757e-5089-a6230a589209	0984	AK
00190000-56ab-757e-9033-ea36746e22d0	00080000-56ab-757e-3e53-f06b4c0a880d	0983	AK
00190000-56ab-757e-8d43-19d26c77ed90	00080000-56ab-757e-2cdc-5d2c5a21ac3f	0982	AK
00190000-56ab-7580-a4e2-be096d2afd8c	00080000-56ab-7580-c5cd-24f36f4a4fe5	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 41961847)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56ab-757e-556c-4ce47682ef86	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 41961966)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 41961544)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56ab-757e-ecf3-81c18eae2759	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56ab-757e-6a03-56eaf8554678	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56ab-757e-f66c-0145731184a1	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56ab-757e-9fd9-494722827a77	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56ab-757e-e1a1-92fd6b1af26b	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56ab-757e-4cc5-efdcfe5f0092	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56ab-757e-cea0-d57ecc205418	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 41961489)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 41961479)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 41961686)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 41961616)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 41961322)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 41961083)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56ab-7580-c5cd-24f36f4a4fe5	00010000-56ab-757c-199f-2b9e9809ec1a	2016-01-29 15:21:52	INS	a:0:{}
2	App\\Entity\\Option	00000000-56ab-7580-02f6-cba8b5f28d7e	00010000-56ab-757c-199f-2b9e9809ec1a	2016-01-29 15:21:52	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56ab-7580-a4e2-be096d2afd8c	00010000-56ab-757c-199f-2b9e9809ec1a	2016-01-29 15:21:52	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 41961558)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 41961121)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56ab-757c-3183-7a519eaa7dd3	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56ab-757c-9edd-be53afa2e6e2	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56ab-757c-94ca-a393da1d952f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56ab-757c-a8a0-2b2f1016f534	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56ab-757c-05e8-b7616cc03ea7	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56ab-757c-2fb4-1344bac0910b	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56ab-757c-bd7c-b9fe058c733a	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56ab-757c-42de-11cae684cd60	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56ab-757c-2051-a7d0e5cb52d3	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-757c-ae51-6f20200cbcbd	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-757c-3dc2-e5a51536da32	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-757c-b047-af925862953c	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56ab-757c-6eff-b844df7f0096	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56ab-757c-3be2-b4518932ad32	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56ab-757c-5eea-9a17fe85249d	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56ab-757c-880a-e7c0bec294aa	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56ab-757c-2988-cd3b088c2ddd	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56ab-757c-6500-435a3ce238e3	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56ab-757c-40f1-3fc2dd9e17a0	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56ab-757c-7586-d6483b77fb06	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56ab-757c-0b16-e5a0b375d5c4	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56ab-757c-0d68-6a8b77be0129	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56ab-757c-da07-f20d538fba5d	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56ab-757c-c579-665548cf3bf8	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56ab-757c-8399-74c94b2f51b3	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56ab-757c-10cc-b31308dcb716	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56ab-757c-d498-fd47e63ad605	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56ab-757c-30a4-3f2a63b20efc	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56ab-757c-50e4-06f23a5da728	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56ab-757c-c1a8-6d4a94e5dadd	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56ab-757c-7a5e-7c2b21edd257	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56ab-757c-9747-26984b186f80	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56ab-757c-086b-9983dd092056	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56ab-757c-4066-c1831b9aaded	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56ab-757c-3397-4d65416160b8	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56ab-757c-3407-cc59fc3f2ea7	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56ab-757c-3004-927174bca331	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56ab-757c-dbe5-e79b83fb1215	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56ab-757c-0e1c-06309787b388	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56ab-757c-c2d6-aadd7b0d7ca2	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56ab-757c-5028-f9ca4c547a88	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56ab-757c-56e3-14e8881e4597	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56ab-757c-6f3c-e9b7ffe26e73	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56ab-757c-5752-96c3b0c330f6	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56ab-757c-7f82-857cfa026bc8	direktor	minimalne pravice za direktorja	t
00020000-56ab-757c-fca4-114bdb977ad8	arhivar	arhivar	t
00020000-56ab-757c-26fb-4924a2c87282	dramaturg	dramaturg	t
00020000-56ab-757c-9e11-a69c149a3ede	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56ab-757c-741a-d706ac2c466f	poslovni-sekretar	poslovni sekretar	t
00020000-56ab-757c-02f6-2e28f1e9cc0f	vodja-tehnike	vodja tehnike	t
00020000-56ab-757c-008e-54fdd513a56f	racunovodja	računovodja	t
00020000-56ab-757e-96e4-31c14b8d0256	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56ab-757e-96f8-98038472cada	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-08ac-3de05267cca8	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-b80f-be9db7f3a552	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-8ece-b63c62a4cdf4	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-d3ba-23f390270220	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-640f-2b5cc7b4bae3	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-a427-4ff2e2f12a07	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-b24a-51668af45de2	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-23da-509eb742d383	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-3122-f1bcdea0341b	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-196e-be7fb2165df7	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-bf60-602bc7810272	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-e0b2-3df84e56094c	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-e33d-2b5a7048a929	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-74a5-a5b15fc39d6a	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-48e4-69814f156350	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-ee96-f99c19b66090	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-7b00-e15efb9f12bb	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-8b80-435e1e00edf9	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56ab-757e-0468-fd66a479dcaf	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-beec-66e3a4e17393	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-3b42-9c4a0ed45913	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-6c8d-ce03097c0cd2	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-3020-bbaeb2f1efd4	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-c8a7-b152876de5e5	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-78bc-18024ffbbdba	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-1874-0094aeb4462b	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-c4fd-6619a97e1b1d	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-229f-d1298f373f87	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-8393-28ee11cad720	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-71ca-3dca25138f28	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-8d14-57b129c99162	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-12dc-9711ce2f78c4	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-9943-8855fe83a6cc	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-0a71-fdfcf80950a7	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-0cae-cc6e176ae298	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-373a-311d70a936f6	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56ab-757e-a02c-1f3d10be8f7e	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 41961105)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56ab-757c-c576-b3f070af910c	00020000-56ab-757c-94ca-a393da1d952f
00010000-56ab-757c-199f-2b9e9809ec1a	00020000-56ab-757c-94ca-a393da1d952f
00010000-56ab-757e-935d-232d61b9ef67	00020000-56ab-757e-96e4-31c14b8d0256
00010000-56ab-757e-cbca-1a0fb9f981a3	00020000-56ab-757e-96f8-98038472cada
00010000-56ab-757e-cbca-1a0fb9f981a3	00020000-56ab-757e-d3ba-23f390270220
00010000-56ab-757e-cbca-1a0fb9f981a3	00020000-56ab-757e-23da-509eb742d383
00010000-56ab-757e-cbca-1a0fb9f981a3	00020000-56ab-757e-196e-be7fb2165df7
00010000-56ab-757e-cbca-1a0fb9f981a3	00020000-56ab-757e-e0b2-3df84e56094c
00010000-56ab-757e-cbca-1a0fb9f981a3	00020000-56ab-757e-7b00-e15efb9f12bb
00010000-56ab-757e-cbca-1a0fb9f981a3	00020000-56ab-757e-b80f-be9db7f3a552
00010000-56ab-757e-cbca-1a0fb9f981a3	00020000-56ab-757e-0468-fd66a479dcaf
00010000-56ab-757e-cbca-1a0fb9f981a3	00020000-56ab-757e-6c8d-ce03097c0cd2
00010000-56ab-757e-cbca-1a0fb9f981a3	00020000-56ab-757e-c8a7-b152876de5e5
00010000-56ab-757e-cbca-1a0fb9f981a3	00020000-56ab-757e-1874-0094aeb4462b
00010000-56ab-757e-cbca-1a0fb9f981a3	00020000-56ab-757e-229f-d1298f373f87
00010000-56ab-757e-cbca-1a0fb9f981a3	00020000-56ab-757e-12dc-9711ce2f78c4
00010000-56ab-757e-7b36-e19bacb3dab3	00020000-56ab-757e-96f8-98038472cada
00010000-56ab-757e-7b36-e19bacb3dab3	00020000-56ab-757e-08ac-3de05267cca8
00010000-56ab-757e-7b36-e19bacb3dab3	00020000-56ab-757e-b80f-be9db7f3a552
00010000-56ab-757e-7b36-e19bacb3dab3	00020000-56ab-757e-8ece-b63c62a4cdf4
00010000-56ab-757e-7b36-e19bacb3dab3	00020000-56ab-757e-e0b2-3df84e56094c
00010000-56ab-757e-7b36-e19bacb3dab3	00020000-56ab-757e-48e4-69814f156350
00010000-56ab-757e-7b36-e19bacb3dab3	00020000-56ab-757e-0468-fd66a479dcaf
00010000-56ab-757e-7b36-e19bacb3dab3	00020000-56ab-757e-6c8d-ce03097c0cd2
00010000-56ab-757e-7b36-e19bacb3dab3	00020000-56ab-757e-c8a7-b152876de5e5
00010000-56ab-757e-7b36-e19bacb3dab3	00020000-56ab-757e-1874-0094aeb4462b
00010000-56ab-757e-7b36-e19bacb3dab3	00020000-56ab-757e-229f-d1298f373f87
00010000-56ab-757e-7b36-e19bacb3dab3	00020000-56ab-757e-12dc-9711ce2f78c4
00010000-56ab-757e-76d5-1928b6d82cff	00020000-56ab-757e-96f8-98038472cada
00010000-56ab-757e-76d5-1928b6d82cff	00020000-56ab-757e-08ac-3de05267cca8
00010000-56ab-757e-76d5-1928b6d82cff	00020000-56ab-757e-b80f-be9db7f3a552
00010000-56ab-757e-76d5-1928b6d82cff	00020000-56ab-757e-8ece-b63c62a4cdf4
00010000-56ab-757e-76d5-1928b6d82cff	00020000-56ab-757e-196e-be7fb2165df7
00010000-56ab-757e-76d5-1928b6d82cff	00020000-56ab-757e-e0b2-3df84e56094c
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-08ac-3de05267cca8
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-640f-2b5cc7b4bae3
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-3122-f1bcdea0341b
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-bf60-602bc7810272
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-196e-be7fb2165df7
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-ee96-f99c19b66090
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-e0b2-3df84e56094c
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-e33d-2b5a7048a929
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-0468-fd66a479dcaf
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-beec-66e3a4e17393
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-6c8d-ce03097c0cd2
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-3020-bbaeb2f1efd4
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-c8a7-b152876de5e5
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-78bc-18024ffbbdba
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-1874-0094aeb4462b
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-c4fd-6619a97e1b1d
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-229f-d1298f373f87
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-8393-28ee11cad720
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-12dc-9711ce2f78c4
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-9943-8855fe83a6cc
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-0cae-cc6e176ae298
00010000-56ab-757e-8ec8-eb7cb809fec8	00020000-56ab-757e-373a-311d70a936f6
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-08ac-3de05267cca8
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-640f-2b5cc7b4bae3
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-b24a-51668af45de2
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-3122-f1bcdea0341b
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-bf60-602bc7810272
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-196e-be7fb2165df7
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-ee96-f99c19b66090
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-e0b2-3df84e56094c
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-e33d-2b5a7048a929
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-74a5-a5b15fc39d6a
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-0468-fd66a479dcaf
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-beec-66e3a4e17393
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-3b42-9c4a0ed45913
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-6c8d-ce03097c0cd2
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-3020-bbaeb2f1efd4
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-c8a7-b152876de5e5
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-78bc-18024ffbbdba
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-1874-0094aeb4462b
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-c4fd-6619a97e1b1d
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-229f-d1298f373f87
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-8393-28ee11cad720
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-12dc-9711ce2f78c4
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-9943-8855fe83a6cc
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-0a71-fdfcf80950a7
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-0cae-cc6e176ae298
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-373a-311d70a936f6
00010000-56ab-757e-4e06-679790513880	00020000-56ab-757e-a02c-1f3d10be8f7e
00010000-56ab-757e-6d50-c554feb76b9b	00020000-56ab-757e-08ac-3de05267cca8
00010000-56ab-757e-6d50-c554feb76b9b	00020000-56ab-757e-b80f-be9db7f3a552
00010000-56ab-757e-6d50-c554feb76b9b	00020000-56ab-757e-640f-2b5cc7b4bae3
00010000-56ab-757e-6d50-c554feb76b9b	00020000-56ab-757e-a427-4ff2e2f12a07
00010000-56ab-757e-6d50-c554feb76b9b	00020000-56ab-757e-b24a-51668af45de2
00010000-56ab-757e-6d50-c554feb76b9b	00020000-56ab-757e-d3ba-23f390270220
00010000-56ab-757e-6d50-c554feb76b9b	00020000-56ab-757e-3122-f1bcdea0341b
00010000-56ab-757e-6d50-c554feb76b9b	00020000-56ab-757e-bf60-602bc7810272
00010000-56ab-757e-6d50-c554feb76b9b	00020000-56ab-757e-196e-be7fb2165df7
00010000-56ab-757e-6d50-c554feb76b9b	00020000-56ab-757e-ee96-f99c19b66090
00010000-56ab-757e-b33a-ac7139adba03	00020000-56ab-757e-96f8-98038472cada
00010000-56ab-757e-b33a-ac7139adba03	00020000-56ab-757e-8ece-b63c62a4cdf4
00010000-56ab-757e-b33a-ac7139adba03	00020000-56ab-757e-d3ba-23f390270220
00010000-56ab-757e-b33a-ac7139adba03	00020000-56ab-757e-23da-509eb742d383
00010000-56ab-757e-b33a-ac7139adba03	00020000-56ab-757e-196e-be7fb2165df7
00010000-56ab-757e-b33a-ac7139adba03	00020000-56ab-757e-e0b2-3df84e56094c
00010000-56ab-757e-b33a-ac7139adba03	00020000-56ab-757e-7b00-e15efb9f12bb
00010000-56ab-757e-b33a-ac7139adba03	00020000-56ab-757e-71ca-3dca25138f28
00010000-56ab-757e-075a-34ea50ad2e86	00020000-56ab-757e-8b80-435e1e00edf9
00010000-56ab-757e-ef1f-37106807faa1	00020000-56ab-757c-7f82-857cfa026bc8
00010000-56ab-757e-ed8d-dc9f77de88ef	00020000-56ab-757c-fca4-114bdb977ad8
00010000-56ab-757e-7c6d-32c19e4bb944	00020000-56ab-757c-26fb-4924a2c87282
00010000-56ab-757e-1341-ef79232152bd	00020000-56ab-757c-9e11-a69c149a3ede
00010000-56ab-757e-4aee-d37473846762	00020000-56ab-757c-741a-d706ac2c466f
00010000-56ab-757e-9289-7b54e65b4412	00020000-56ab-757c-02f6-2e28f1e9cc0f
00010000-56ab-757e-59bc-a3584237ff7b	00020000-56ab-757c-008e-54fdd513a56f
\.


--
-- TOC entry 3186 (class 0 OID 41961572)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 41961510)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 41961433)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56ab-757e-45ca-f60e80f3de81	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56ab-757e-002a-c3ddaf6b39eb	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56ab-757e-a4fe-efc9e7fb3f52	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56ab-757e-02bf-db59a11fae72	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 41961070)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56ab-757b-0849-458c16d73d0b	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56ab-757b-f956-542b17eaf763	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56ab-757b-f527-81dde8309cc2	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56ab-757b-5106-f77d12d9a449	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56ab-757b-5bbc-e145ef6896fc	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 41961062)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56ab-757b-e16a-bc725f2fde9c	00230000-56ab-757b-5106-f77d12d9a449	popa
00240000-56ab-757b-d4bd-ce8c52e057df	00230000-56ab-757b-5106-f77d12d9a449	oseba
00240000-56ab-757b-04fb-e8b994cbbbe0	00230000-56ab-757b-5106-f77d12d9a449	tippopa
00240000-56ab-757b-e1a3-db36dcd0de83	00230000-56ab-757b-5106-f77d12d9a449	organizacijskaenota
00240000-56ab-757b-6743-69f79fb74d8e	00230000-56ab-757b-5106-f77d12d9a449	sezona
00240000-56ab-757b-c4bb-9547b39619bb	00230000-56ab-757b-5106-f77d12d9a449	tipvaje
00240000-56ab-757b-315a-f0811773b04c	00230000-56ab-757b-5106-f77d12d9a449	tipdodatka
00240000-56ab-757b-8322-ff846d59f4f5	00230000-56ab-757b-f956-542b17eaf763	prostor
00240000-56ab-757b-3a99-e2f6da8291d0	00230000-56ab-757b-5106-f77d12d9a449	besedilo
00240000-56ab-757b-7aec-be390270f931	00230000-56ab-757b-5106-f77d12d9a449	uprizoritev
00240000-56ab-757b-ad1a-fa28206d4841	00230000-56ab-757b-5106-f77d12d9a449	funkcija
00240000-56ab-757b-e079-b5723e63a7ff	00230000-56ab-757b-5106-f77d12d9a449	tipfunkcije
00240000-56ab-757b-ab12-30be248358c2	00230000-56ab-757b-5106-f77d12d9a449	alternacija
00240000-56ab-757b-bbc5-5cbcaccc34ba	00230000-56ab-757b-0849-458c16d73d0b	pogodba
00240000-56ab-757b-146d-2d31f5e4ab03	00230000-56ab-757b-5106-f77d12d9a449	zaposlitev
00240000-56ab-757b-7dcc-4a2ac4b1a30c	00230000-56ab-757b-5106-f77d12d9a449	zvrstuprizoritve
00240000-56ab-757b-a24a-101008bb2496	00230000-56ab-757b-0849-458c16d73d0b	programdela
00240000-56ab-757b-c9ef-d8566ab33ec5	00230000-56ab-757b-5106-f77d12d9a449	zapis
\.


--
-- TOC entry 3133 (class 0 OID 41961057)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
d43f7e4e-c5d8-448f-98d0-450cd86d2ea2	00240000-56ab-757b-e16a-bc725f2fde9c	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 41961633)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56ab-757e-4d55-52fcbfcbddb0	000e0000-56ab-757e-4c97-0703349a8fcb	00080000-56ab-757e-c8f6-279657cc683e	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56ab-757b-3d94-0cb1810dffd8
00270000-56ab-757e-b7b5-575f8b281de9	000e0000-56ab-757e-4c97-0703349a8fcb	00080000-56ab-757e-c8f6-279657cc683e	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56ab-757b-3d94-0cb1810dffd8
\.


--
-- TOC entry 3149 (class 0 OID 41961206)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 41961452)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56ab-757f-a290-d27b86b436b7	00180000-56ab-757f-01d7-59b2eefd32b0	000c0000-56ab-757e-8805-c7e952dd1f2c	00090000-56ab-757e-f03a-4d4644fc6576	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-757f-24e5-29611d0ef302	00180000-56ab-757f-01d7-59b2eefd32b0	000c0000-56ab-757e-c02c-eb20ca277a69	00090000-56ab-757e-2bab-897a2f0663e3	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-757f-2e07-d5a618b79b66	00180000-56ab-757f-01d7-59b2eefd32b0	000c0000-56ab-757e-47e4-d56352a2fa77	00090000-56ab-757e-10eb-a3e9b4528d68	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-757f-2596-a7fa904b1dbc	00180000-56ab-757f-01d7-59b2eefd32b0	000c0000-56ab-757e-8557-0cb819c7656b	00090000-56ab-757e-6764-51eaade28cbf	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-757f-1b70-c8b34cfec427	00180000-56ab-757f-01d7-59b2eefd32b0	000c0000-56ab-757e-710b-4fc171e177e9	00090000-56ab-757e-d791-698e54e7db90	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56ab-757f-92bf-4d57eeab9dec	00180000-56ab-757f-b51a-8610c9703966	\N	00090000-56ab-757e-d791-698e54e7db90	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56ab-757f-1dd6-721945ea98fb	00180000-56ab-757f-e2a7-bc9edb8965ab	\N	00090000-56ab-757e-2bab-897a2f0663e3	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56ab-757f-24e0-5d23d9d12054	00180000-56ab-757f-01d7-59b2eefd32b0	\N	00090000-56ab-757e-5651-392676a7dce9	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 41961469)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56ab-757b-48d1-ba7481a95902	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56ab-757b-770d-1aa6fa081867	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56ab-757b-7e1b-f25d9ddb0001	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56ab-757b-c7f6-3414d996f81b	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56ab-757b-673a-41e82b571af8	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56ab-757b-da2d-e0962bc82587	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 41961674)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56ab-757b-ac60-73f4ca12bd31	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56ab-757b-1069-c5969a94e90f	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56ab-757b-2d30-8434e508c9c8	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56ab-757b-ed9b-98c11e9716f5	04	Režija	Režija	Režija	umetnik	30
000f0000-56ab-757b-58b0-6a4b6f0d8b46	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56ab-757b-90bf-378fedd59f08	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56ab-757b-7951-1518f01fa4c4	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56ab-757b-b1cc-a0b17df83084	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56ab-757b-e673-2841f5c44ac3	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56ab-757b-1455-8510986fa3a8	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56ab-757b-8852-06194e4b0b3b	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56ab-757b-a74f-c0070b16a19c	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56ab-757b-d559-895569261a52	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56ab-757b-fbf3-4fb7d7719807	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56ab-757b-b996-ea4205991a0b	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56ab-757b-a6a5-b3702e056ad2	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56ab-757b-1c97-755406bf7088	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56ab-757b-cf75-8e66e03b5e52	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56ab-757b-a887-172f75455f42	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 41961157)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56ab-757e-ba7b-a52c01e82ecf	0001	šola	osnovna ali srednja šola
00400000-56ab-757e-b38f-9c9389b74ef2	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56ab-757e-d015-081a3b64a464	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 41961978)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56ab-757b-4271-bf9589e1f70f	01	Velika predstava	f	1.00	1.00
002b0000-56ab-757b-75fd-04db13507a83	02	Mala predstava	f	0.50	0.50
002b0000-56ab-757b-1b1b-dd1c1c2c685b	03	Mala koprodukcija	t	0.40	1.00
002b0000-56ab-757b-6521-3000eca93e80	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56ab-757b-ea13-228a481239f5	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 41961423)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56ab-757b-5303-a5771300a8af	0001	prva vaja	prva vaja
00420000-56ab-757b-f25f-4dc00a948e0b	0002	tehnična vaja	tehnična vaja
00420000-56ab-757b-31b7-705e0042b391	0003	lučna vaja	lučna vaja
00420000-56ab-757b-aa7b-22827d45bbbf	0004	kostumska vaja	kostumska vaja
00420000-56ab-757b-6143-9e5c398cc328	0005	foto vaja	foto vaja
00420000-56ab-757b-778c-49c6d5ca4d8c	0006	1. glavna vaja	1. glavna vaja
00420000-56ab-757b-547c-51c1bfd26c3d	0007	2. glavna vaja	2. glavna vaja
00420000-56ab-757b-9df0-61fd2f53056d	0008	1. generalka	1. generalka
00420000-56ab-757b-9920-0b53b7da604b	0009	2. generalka	2. generalka
00420000-56ab-757b-8568-e93e84688ec2	0010	odprta generalka	odprta generalka
00420000-56ab-757b-49a8-bef0616465f3	0011	obnovitvena vaja	obnovitvena vaja
00420000-56ab-757b-948a-28f0e8807e7b	0012	italijanka	krajša "obnovitvena" vaja
00420000-56ab-757b-137a-4143940792fa	0013	pevska vaja	pevska vaja
00420000-56ab-757b-6d66-86c8b1fb0c6f	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56ab-757b-735d-42211066399e	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56ab-757b-0ff6-979353a6db92	0016	orientacijska vaja	orientacijska vaja
00420000-56ab-757b-2ca9-dc2cb878fb1b	0017	situacijska vaja	situacijska vaja
00420000-56ab-757b-c39d-2368a430ae59	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 41961279)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 41961092)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56ab-757c-199f-2b9e9809ec1a	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROpNqmTEKW/7.kpMXSaY/1gnigVttT7va	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56ab-757e-b144-0c056aefba86	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56ab-757e-e43c-b15d803f49c9	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56ab-757e-8f88-12754e0d79c8	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56ab-757e-dbb6-33d12c14586c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56ab-757e-3c15-d2ea61d5e54b	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56ab-757e-97dd-bc0ed02c3b68	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56ab-757e-5c07-620ba797baf5	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56ab-757e-9d5f-323cb9479d04	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56ab-757e-a7f8-b3f6816cc73e	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56ab-757e-935d-232d61b9ef67	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56ab-757e-2333-034b5df5cfd3	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56ab-757e-cbca-1a0fb9f981a3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56ab-757e-7b36-e19bacb3dab3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56ab-757e-76d5-1928b6d82cff	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56ab-757e-8ec8-eb7cb809fec8	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56ab-757e-4e06-679790513880	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56ab-757e-6d50-c554feb76b9b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56ab-757e-b33a-ac7139adba03	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56ab-757e-075a-34ea50ad2e86	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56ab-757e-ef1f-37106807faa1	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56ab-757e-ed8d-dc9f77de88ef	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56ab-757e-7c6d-32c19e4bb944	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56ab-757e-1341-ef79232152bd	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56ab-757e-4aee-d37473846762	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56ab-757e-9289-7b54e65b4412	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56ab-757e-59bc-a3584237ff7b	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56ab-757c-c576-b3f070af910c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 41961724)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56ab-757e-d82f-6a342e69ca90	00160000-56ab-757e-bf6b-5a52f053008d	\N	00140000-56ab-757b-38c8-f6d625359996	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56ab-757e-e1a1-92fd6b1af26b
000e0000-56ab-757e-4c97-0703349a8fcb	00160000-56ab-757e-cb02-d155192bd1e1	\N	00140000-56ab-757b-e65a-2ebd366d4f92	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56ab-757e-4cc5-efdcfe5f0092
000e0000-56ab-757e-8e07-328abb16242e	\N	\N	00140000-56ab-757b-e65a-2ebd366d4f92	00190000-56ab-757e-83fb-d241a34f23eb	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56ab-757e-e1a1-92fd6b1af26b
000e0000-56ab-757e-a2bb-5da458cd9f17	\N	\N	00140000-56ab-757b-e65a-2ebd366d4f92	00190000-56ab-757e-83fb-d241a34f23eb	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56ab-757e-e1a1-92fd6b1af26b
000e0000-56ab-757e-4436-b800cbcd1a96	\N	\N	00140000-56ab-757b-e65a-2ebd366d4f92	00190000-56ab-757e-83fb-d241a34f23eb	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-757e-ecf3-81c18eae2759
000e0000-56ab-757e-13d4-76aade344dff	\N	\N	00140000-56ab-757b-e65a-2ebd366d4f92	00190000-56ab-757e-83fb-d241a34f23eb	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-757e-ecf3-81c18eae2759
000e0000-56ab-757e-95f6-55cea972dd60	\N	\N	00140000-56ab-757b-f79f-86218a1629cc	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-757e-ecf3-81c18eae2759
000e0000-56ab-757e-4ca4-9628de032a0e	\N	\N	00140000-56ab-757b-f79f-86218a1629cc	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-757e-ecf3-81c18eae2759
000e0000-56ab-757e-62b4-1ec99a2f9e85	\N	\N	00140000-56ab-757b-f79f-86218a1629cc	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-757e-ecf3-81c18eae2759
000e0000-56ab-757e-40af-34f2c6945535	\N	\N	00140000-56ab-757b-f79f-86218a1629cc	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-757e-ecf3-81c18eae2759
000e0000-56ab-757e-4e52-ab62cc00254b	\N	\N	00140000-56ab-757b-f79f-86218a1629cc	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-757e-ecf3-81c18eae2759
000e0000-56ab-757e-5c74-70133f5f5be9	\N	\N	00140000-56ab-757b-f79f-86218a1629cc	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-757e-ecf3-81c18eae2759
000e0000-56ab-757e-b770-f24e2e55bb4f	\N	\N	00140000-56ab-757b-f79f-86218a1629cc	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-757e-ecf3-81c18eae2759
000e0000-56ab-757e-8d3a-d08b2d1b89d3	\N	\N	00140000-56ab-757b-f79f-86218a1629cc	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-757e-ecf3-81c18eae2759
000e0000-56ab-757e-8e40-47710bb75f68	\N	\N	00140000-56ab-757b-f79f-86218a1629cc	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56ab-757e-ecf3-81c18eae2759
\.


--
-- TOC entry 3170 (class 0 OID 41961443)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 41961372)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56ab-757f-c3e7-bb04710649f8	\N	000e0000-56ab-757e-4c97-0703349a8fcb	3
00200000-56ab-757f-8c1f-e68b470a0fcd	\N	000e0000-56ab-757e-4c97-0703349a8fcb	4
00200000-56ab-757f-7cda-7e808f1f28f4	\N	000e0000-56ab-757e-4c97-0703349a8fcb	6
00200000-56ab-757f-6ea1-200038417e87	\N	000e0000-56ab-757e-4c97-0703349a8fcb	5
00200000-56ab-757f-c1de-0f13d754dac3	\N	000e0000-56ab-757e-4c97-0703349a8fcb	7
00200000-56ab-757f-0b15-12c9010b0bd8	\N	000e0000-56ab-757e-d82f-6a342e69ca90	1
00200000-56ab-757f-964a-89c1afbdadf9	\N	000e0000-56ab-757e-4c97-0703349a8fcb	2
00200000-56ab-757f-d584-29f859dd68e2	\N	000e0000-56ab-757e-4c97-0703349a8fcb	1
00200000-56ab-757f-1c3a-84f193e12129	\N	000e0000-56ab-757e-4c97-0703349a8fcb	8
00200000-56ab-757f-c531-65c108eb3622	\N	000e0000-56ab-757e-4c97-0703349a8fcb	9
\.


--
-- TOC entry 3182 (class 0 OID 41961536)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 41961647)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56ab-757b-1ad7-69c4e298ddac	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56ab-757b-7ea1-23b0de9fbea6	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56ab-757b-b2c1-8807c797279f	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56ab-757b-a40d-4cbc42a96daa	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56ab-757b-0960-e299db2f3164	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56ab-757b-68c2-7c7d05253ec7	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56ab-757b-774e-84ba013cffd2	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56ab-757b-ea71-b356f6c9a232	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56ab-757b-3d94-0cb1810dffd8	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56ab-757b-c02c-d13fa79acd8d	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56ab-757b-5077-89ff6bee1f08	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56ab-757b-cc5a-505cc7910377	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56ab-757b-3803-9eee8719fd4e	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56ab-757b-8a91-f172b5929e36	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56ab-757b-c80e-673e5d3f0049	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56ab-757b-1818-5c8c6ccc1340	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56ab-757b-ed69-25920272f59f	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56ab-757b-5bac-ef193577d573	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56ab-757b-f8fa-1cb63398cbd3	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56ab-757b-10e9-e372ddaecb69	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56ab-757b-18b3-dabf86c5555a	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56ab-757b-ede8-0a8bfbfa5462	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56ab-757b-33b8-bd025325bef8	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56ab-757b-7695-244460b7ef9d	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56ab-757b-e5a7-31c2a8cbb2a0	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56ab-757b-fc46-dc2b90ddc26a	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56ab-757b-78b8-30fcf147c5b2	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56ab-757b-8fb4-d49b760acbec	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 41962028)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 41961997)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 41962040)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 41961609)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56ab-757e-7249-7dc8dda2ceae	00090000-56ab-757e-2bab-897a2f0663e3	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-757e-c063-cd98119e70f1	00090000-56ab-757e-10eb-a3e9b4528d68	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-757e-180a-dd13247c6e5c	00090000-56ab-757e-577e-4b257e1ed110	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-757e-2864-997be6822b55	00090000-56ab-757e-a3f7-fff2d7cf07e3	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-757e-6b99-556cd2009116	00090000-56ab-757e-f31e-98209912cb3d	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56ab-757e-9629-043151a772f5	00090000-56ab-757e-705c-0e68b076a29f	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 41961714)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56ab-757b-38c8-f6d625359996	01	Drama	drama (SURS 01)
00140000-56ab-757b-a26e-83a0dbbb8dde	02	Opera	opera (SURS 02)
00140000-56ab-757b-e730-41d4b34619da	03	Balet	balet (SURS 03)
00140000-56ab-757b-ef95-7d4a92d2b506	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56ab-757b-f79f-86218a1629cc	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56ab-757b-e65a-2ebd366d4f92	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56ab-757b-c56f-6a5383f2c4f2	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 41961599)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 41961156)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 41961772)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 41961763)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 41961146)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 41961630)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 41961672)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 41962081)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 41961466)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 41961401)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 41961417)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 41961422)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 41961995)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 41961305)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 41961841)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 41961595)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 41961370)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 41961343)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 41961319)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 41961502)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 41962058)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 41962065)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 41962089)
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
-- TOC entry 2766 (class 2606 OID 41961528)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 41961277)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 41961175)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 41961239)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 41961202)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 41961135)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 41961120)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 41961534)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 41961571)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 41961709)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 41961230)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 41961265)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 41961946)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 41961508)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 41961255)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 41961386)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 41961358)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 41961352)
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
-- TOC entry 2764 (class 2606 OID 41961520)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 41961955)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 41961963)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 41961933)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 41961976)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 41961553)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 41961493)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 41961484)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 41961696)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 41961623)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 41961331)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 41961091)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 41961562)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 41961109)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 41961129)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 41961580)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 41961515)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 41961441)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 41961079)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 41961067)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 41961061)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 41961643)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 41961211)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 41961458)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 41961476)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 41961683)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 41961164)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 41961988)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 41961430)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 41961290)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 41961104)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 41961742)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 41961449)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 41961376)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 41961542)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 41961655)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 41962038)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 41962022)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 41962046)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 41961613)
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
-- TOC entry 2833 (class 2606 OID 41961722)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 41961607)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 41961411)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 41961412)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 41961410)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 41961408)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 41961409)
-- Name: idx_11e93b5d7634c214; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d7634c214 ON dogodek USING btree (nadrejenogostovanje_id);


--
-- TOC entry 2708 (class 1259 OID 41961407)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 41961644)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 41961645)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 41961646)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 41962060)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 41962059)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 41961232)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 41961233)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 41961535)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 41962026)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 41962025)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 41962027)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 41962024)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 41962023)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 41961521)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 41961377)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 41961378)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 41961596)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 41961598)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 41961597)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 41961321)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 41961320)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 41961977)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 41961711)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 41961712)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 41961713)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 41962047)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 41961747)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 41961744)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 41961748)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 41961746)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 41961745)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 41961292)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 41961291)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 41961205)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 41961563)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 41961136)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 41961137)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 41961583)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 41961582)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 41961581)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 41961242)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 41961241)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 41961243)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 41961353)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2595 (class 1259 OID 41961069)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 41961488)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 41961486)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 41961485)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 41961487)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 41961110)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 41961111)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 41961543)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 41962082)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 41961632)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 41961631)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 41962090)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 41962091)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 41961509)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 41961624)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 41961625)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 41961846)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 41961845)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 41961842)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 41961843)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 41961844)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 41961257)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 41961256)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 41961258)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 41961557)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 41961556)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 41961956)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 41961957)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 41961776)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 41961777)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 41961774)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 41961775)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 41961467)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 41961468)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 41961614)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 41961615)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 41961450)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 41961497)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 41961496)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 41961494)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 41961495)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 41961764)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 41961332)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 41961346)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 41961345)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 41961344)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 41961347)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 41961371)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 41961359)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 41961360)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 41961947)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 41961996)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 41962066)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 41962067)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 41961177)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 41961176)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 41961212)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 41961213)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 41961461)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 41961460)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 41961459)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 41961403)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 41961406)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 41961402)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 41961405)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 41961404)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 41961231)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 41961165)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 41961166)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 41961306)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 41961308)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 41961307)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 41961309)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 41961503)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 41961710)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 41961743)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 41961684)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 41961685)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 41961203)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 41961204)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 41961477)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 41961478)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 41961608)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 41961080)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 41961278)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 41961240)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 41961068)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 41961989)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 41961555)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 41961554)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 41961431)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 41961432)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 41961773)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 41961451)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 41961266)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 41961723)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 41962039)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 41961964)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 41961965)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 41961673)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 41961442)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 41961130)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2941 (class 2606 OID 41962252)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2946 (class 2606 OID 41962277)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2944 (class 2606 OID 41962267)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2940 (class 2606 OID 41962247)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2947 (class 2606 OID 41962282)
-- Name: fk_11e93b5d7634c214; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d7634c214 FOREIGN KEY (nadrejenogostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2943 (class 2606 OID 41962262)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2945 (class 2606 OID 41962272)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2942 (class 2606 OID 41962257)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2983 (class 2606 OID 41962462)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 41962467)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2985 (class 2606 OID 41962472)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3017 (class 2606 OID 41962632)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3016 (class 2606 OID 41962627)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2920 (class 2606 OID 41962147)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2921 (class 2606 OID 41962152)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 41962377)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3013 (class 2606 OID 41962612)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 41962607)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3014 (class 2606 OID 41962617)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3011 (class 2606 OID 41962602)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3010 (class 2606 OID 41962597)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 41962372)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2938 (class 2606 OID 41962237)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2939 (class 2606 OID 41962242)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 41962417)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 41962427)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 41962422)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2931 (class 2606 OID 41962202)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2930 (class 2606 OID 41962197)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 41962362)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 41962587)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2986 (class 2606 OID 41962477)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 41962482)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2988 (class 2606 OID 41962487)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 41962622)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2992 (class 2606 OID 41962507)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2989 (class 2606 OID 41962492)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2993 (class 2606 OID 41962512)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 41962502)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2990 (class 2606 OID 41962497)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2929 (class 2606 OID 41962192)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2928 (class 2606 OID 41962187)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2917 (class 2606 OID 41962132)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2916 (class 2606 OID 41962127)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 41962397)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2912 (class 2606 OID 41962107)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2913 (class 2606 OID 41962112)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2973 (class 2606 OID 41962412)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 41962407)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2971 (class 2606 OID 41962402)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 41962162)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2922 (class 2606 OID 41962157)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2924 (class 2606 OID 41962167)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 41962217)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 41962092)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2958 (class 2606 OID 41962337)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2956 (class 2606 OID 41962327)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2955 (class 2606 OID 41962322)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2957 (class 2606 OID 41962332)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2910 (class 2606 OID 41962097)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2911 (class 2606 OID 41962102)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 41962382)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 41962647)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2982 (class 2606 OID 41962457)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2981 (class 2606 OID 41962452)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3021 (class 2606 OID 41962652)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3022 (class 2606 OID 41962657)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 41962367)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2979 (class 2606 OID 41962442)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2980 (class 2606 OID 41962447)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3003 (class 2606 OID 41962562)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3002 (class 2606 OID 41962557)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2999 (class 2606 OID 41962542)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3000 (class 2606 OID 41962547)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 41962552)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 41962177)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 41962172)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 41962182)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2969 (class 2606 OID 41962392)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2968 (class 2606 OID 41962387)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3005 (class 2606 OID 41962572)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3006 (class 2606 OID 41962577)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2997 (class 2606 OID 41962532)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2998 (class 2606 OID 41962537)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2995 (class 2606 OID 41962522)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2996 (class 2606 OID 41962527)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2953 (class 2606 OID 41962312)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2954 (class 2606 OID 41962317)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2977 (class 2606 OID 41962432)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2978 (class 2606 OID 41962437)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2948 (class 2606 OID 41962287)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2949 (class 2606 OID 41962292)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2962 (class 2606 OID 41962357)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2961 (class 2606 OID 41962352)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2959 (class 2606 OID 41962342)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2960 (class 2606 OID 41962347)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 41962517)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 41962207)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 41962212)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2937 (class 2606 OID 41962232)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2935 (class 2606 OID 41962222)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2936 (class 2606 OID 41962227)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 41962567)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 41962582)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 41962592)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3018 (class 2606 OID 41962637)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3019 (class 2606 OID 41962642)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2915 (class 2606 OID 41962122)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2914 (class 2606 OID 41962117)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2918 (class 2606 OID 41962137)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 41962142)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 41962307)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 41962302)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2950 (class 2606 OID 41962297)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-29 15:21:54 CET

--
-- PostgreSQL database dump complete
--

