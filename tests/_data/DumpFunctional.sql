--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-02-01 10:18:58 CET

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
-- TOC entry 185 (class 1259 OID 42153552)
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
-- TOC entry 241 (class 1259 OID 42154173)
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
-- TOC entry 240 (class 1259 OID 42154157)
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
-- TOC entry 184 (class 1259 OID 42153545)
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
-- TOC entry 183 (class 1259 OID 42153543)
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
-- TOC entry 231 (class 1259 OID 42154034)
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
-- TOC entry 234 (class 1259 OID 42154064)
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
-- TOC entry 255 (class 1259 OID 42154476)
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
-- TOC entry 212 (class 1259 OID 42153870)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 42153795)
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
-- TOC entry 206 (class 1259 OID 42153821)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 42153826)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 42154398)
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
-- TOC entry 196 (class 1259 OID 42153699)
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
-- TOC entry 242 (class 1259 OID 42154186)
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
-- TOC entry 227 (class 1259 OID 42153992)
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
-- TOC entry 202 (class 1259 OID 42153769)
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
-- TOC entry 199 (class 1259 OID 42153741)
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
-- TOC entry 197 (class 1259 OID 42153717)
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
-- TOC entry 216 (class 1259 OID 42153906)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 42154456)
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
-- TOC entry 254 (class 1259 OID 42154469)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 42154491)
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
-- TOC entry 220 (class 1259 OID 42153930)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 42153673)
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
-- TOC entry 187 (class 1259 OID 42153572)
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
-- TOC entry 191 (class 1259 OID 42153640)
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
-- TOC entry 188 (class 1259 OID 42153583)
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
-- TOC entry 180 (class 1259 OID 42153517)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 42153536)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 42153937)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 42153972)
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
-- TOC entry 237 (class 1259 OID 42154105)
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
-- TOC entry 190 (class 1259 OID 42153620)
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
-- TOC entry 193 (class 1259 OID 42153665)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 42154342)
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
-- TOC entry 217 (class 1259 OID 42153912)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 42153650)
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
-- TOC entry 204 (class 1259 OID 42153787)
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
-- TOC entry 200 (class 1259 OID 42153756)
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
-- TOC entry 201 (class 1259 OID 42153762)
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
-- TOC entry 219 (class 1259 OID 42153924)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 42154356)
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
-- TOC entry 246 (class 1259 OID 42154366)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 42154255)
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
-- TOC entry 247 (class 1259 OID 42154374)
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
-- TOC entry 223 (class 1259 OID 42153952)
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
-- TOC entry 215 (class 1259 OID 42153897)
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
-- TOC entry 214 (class 1259 OID 42153887)
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
-- TOC entry 236 (class 1259 OID 42154094)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 42154024)
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
-- TOC entry 198 (class 1259 OID 42153730)
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
-- TOC entry 177 (class 1259 OID 42153488)
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
-- TOC entry 176 (class 1259 OID 42153486)
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
-- TOC entry 224 (class 1259 OID 42153966)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 42153526)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 42153510)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 42153980)
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
-- TOC entry 218 (class 1259 OID 42153918)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 42153841)
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
-- TOC entry 175 (class 1259 OID 42153475)
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
-- TOC entry 174 (class 1259 OID 42153467)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 42153462)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 42154041)
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
-- TOC entry 189 (class 1259 OID 42153612)
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
-- TOC entry 211 (class 1259 OID 42153860)
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
-- TOC entry 213 (class 1259 OID 42153877)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 42154082)
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
-- TOC entry 186 (class 1259 OID 42153562)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 42154386)
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
-- TOC entry 208 (class 1259 OID 42153831)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 42153685)
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
-- TOC entry 178 (class 1259 OID 42153497)
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
-- TOC entry 239 (class 1259 OID 42154132)
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
-- TOC entry 210 (class 1259 OID 42153851)
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
-- TOC entry 203 (class 1259 OID 42153780)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 42153944)
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
-- TOC entry 233 (class 1259 OID 42154055)
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
-- TOC entry 251 (class 1259 OID 42154436)
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
-- TOC entry 250 (class 1259 OID 42154405)
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
-- TOC entry 252 (class 1259 OID 42154448)
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
-- TOC entry 229 (class 1259 OID 42154017)
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
-- TOC entry 238 (class 1259 OID 42154122)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 42154007)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 42153548)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 42153491)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 42153552)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56af-22fe-a2ec-827a7430cc83	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56af-22fe-de41-58a0f6273bd9	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56af-22fe-e98e-f4952568921d	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 42154173)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56af-22fe-ddf0-39374ce0976c	000d0000-56af-22fe-4386-88eceaabaeb4	\N	00090000-56af-22fe-ae5a-547949bc39da	000b0000-56af-22fe-3fd3-773f99ce5308	0001	f	\N	\N	\N	3	t	t	t
000c0000-56af-22fe-4f4b-846cf5315f34	000d0000-56af-22fe-a785-aa774b0c67df	00100000-56af-22fe-b9c4-bdeae93f449f	00090000-56af-22fe-df3b-8fb35e79b22e	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56af-22fe-b15a-08548e36db35	000d0000-56af-22fe-d2fb-b38afbaa8060	00100000-56af-22fe-9797-5a6f2c347f37	00090000-56af-22fe-05ad-88e7126e09ff	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56af-22fe-cd16-3edffbcef567	000d0000-56af-22fe-4454-c0855c17aff4	\N	00090000-56af-22fe-0024-e37b7a29b2b6	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56af-22ff-099e-464b32da0c65	000d0000-56af-22fe-4476-5f47c42b8d28	\N	00090000-56af-22fe-f820-df5ac7e175e2	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56af-22ff-0f61-fa2d53e41c05	000d0000-56af-22fe-6746-9e2eb833f150	\N	00090000-56af-22fe-0ff1-ef9670b21992	000b0000-56af-22fe-33a0-aed73e7f17b0	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56af-22ff-e54f-73470a16456c	000d0000-56af-22fe-bb03-db91bed9c61c	00100000-56af-22fe-9e2d-2cb6d8da8f0e	00090000-56af-22fe-e8f7-a2b02d2c0dec	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56af-22ff-6bf9-d18bb395cad6	000d0000-56af-22fe-fdd8-eae7c8402d3e	\N	00090000-56af-22fe-3102-d4cc02d75e19	000b0000-56af-22fe-9ccb-71c2829aa4b5	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56af-22ff-7f90-3b12a800f950	000d0000-56af-22fe-bb03-db91bed9c61c	00100000-56af-22fe-e275-1f9ff54cc15b	00090000-56af-22fe-551f-071a93e0bd11	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56af-22ff-a27f-5ec4e42a07ed	000d0000-56af-22fe-bb03-db91bed9c61c	00100000-56af-22fe-a546-fcdad97b1fb2	00090000-56af-22fe-9e76-3c7caf096cd0	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56af-22ff-c8c1-b2197edb06e5	000d0000-56af-22fe-bb03-db91bed9c61c	00100000-56af-22fe-3012-0b51464cde6f	00090000-56af-22fe-15e6-93ab9549995b	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56af-22ff-ca8f-34bab84699c5	000d0000-56af-22fe-00ac-b71a3ff24824	00100000-56af-22fe-b9c4-bdeae93f449f	00090000-56af-22fe-df3b-8fb35e79b22e	000b0000-56af-22fe-8358-69614da633a6	0012	t	\N	\N	\N	2	t	t	t
000c0000-56af-22ff-380a-d643fc852b27	000d0000-56af-22fe-a157-bc5de394a352	\N	00090000-56af-22fe-3102-d4cc02d75e19	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56af-22ff-2b8c-04ce45ee8806	000d0000-56af-22fe-a157-bc5de394a352	\N	00090000-56af-22fe-d37e-dc983ace66a3	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56af-22ff-9df1-38d4dc26ac4f	000d0000-56af-22fe-cddd-942401c25208	00100000-56af-22fe-9797-5a6f2c347f37	00090000-56af-22fe-05ad-88e7126e09ff	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56af-22ff-3d67-cff37ddfce19	000d0000-56af-22fe-cddd-942401c25208	\N	00090000-56af-22fe-d37e-dc983ace66a3	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56af-22ff-e69e-2509d8cfc9df	000d0000-56af-22fe-b0a0-558a713d573d	\N	00090000-56af-22fe-d37e-dc983ace66a3	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56af-22ff-69fa-985d3d4fe347	000d0000-56af-22fe-b0a0-558a713d573d	\N	00090000-56af-22fe-3102-d4cc02d75e19	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56af-22ff-bf7e-6f0bde6981dd	000d0000-56af-22fe-4811-9ba5495ee9aa	00100000-56af-22fe-9e2d-2cb6d8da8f0e	00090000-56af-22fe-e8f7-a2b02d2c0dec	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56af-22ff-c379-a099e1023581	000d0000-56af-22fe-4811-9ba5495ee9aa	\N	00090000-56af-22fe-d37e-dc983ace66a3	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56af-22ff-7ae5-2d66f96bd693	000d0000-56af-22fe-6be1-f49b2af00f7d	\N	00090000-56af-22fe-d37e-dc983ace66a3	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56af-22ff-9051-01a91a1bb715	000d0000-56af-22fe-6be1-f49b2af00f7d	00100000-56af-22fe-9e2d-2cb6d8da8f0e	00090000-56af-22fe-e8f7-a2b02d2c0dec	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56af-22ff-a674-5794fb303a9b	000d0000-56af-22fe-4983-5a59e8fddfdc	\N	00090000-56af-22fe-d37e-dc983ace66a3	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56af-22ff-f2f3-51550121336e	000d0000-56af-22fe-1f79-8ee16758c476	\N	00090000-56af-22fe-3102-d4cc02d75e19	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56af-22ff-3429-9cb6e568fdc0	000d0000-56af-22fe-439b-b106113771af	\N	00090000-56af-22fe-3102-d4cc02d75e19	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56af-22ff-e845-9709a0ba3240	000d0000-56af-22fe-439b-b106113771af	00100000-56af-22fe-9797-5a6f2c347f37	00090000-56af-22fe-05ad-88e7126e09ff	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56af-22ff-42cc-4b59ef8e34ec	000d0000-56af-22fe-cb6e-db8742605c28	\N	00090000-56af-22fe-02ce-cfe62e9bb55f	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56af-22ff-fc6d-7f69b4c5aba4	000d0000-56af-22fe-cb6e-db8742605c28	\N	00090000-56af-22fe-8fda-28add85777c4	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56af-22ff-3209-620da4bc04de	000d0000-56af-22fe-dc9e-9d7deb5b838b	\N	00090000-56af-22fe-3102-d4cc02d75e19	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56af-22ff-9f71-65a55fcb4670	000d0000-56af-22fe-dc9e-9d7deb5b838b	00100000-56af-22fe-9797-5a6f2c347f37	00090000-56af-22fe-05ad-88e7126e09ff	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56af-22ff-2e8c-31720e972a63	000d0000-56af-22fe-dc9e-9d7deb5b838b	\N	00090000-56af-22fe-8fda-28add85777c4	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56af-22ff-bc3e-90a804b5955d	000d0000-56af-22fe-dc9e-9d7deb5b838b	\N	00090000-56af-22fe-02ce-cfe62e9bb55f	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56af-22ff-7c19-8c145b0d611d	000d0000-56af-22fe-afa3-459123e052a1	\N	00090000-56af-22fe-3102-d4cc02d75e19	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56af-22ff-edb8-6e0deb449511	000d0000-56af-22fe-5f65-b47c7e00c36c	00100000-56af-22fe-9797-5a6f2c347f37	00090000-56af-22fe-05ad-88e7126e09ff	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56af-22ff-ea9f-aa5a79f7ec08	000d0000-56af-22fe-5f65-b47c7e00c36c	\N	00090000-56af-22fe-d37e-dc983ace66a3	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 42154157)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 42153545)
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
-- TOC entry 3191 (class 0 OID 42154034)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56af-22fe-76e2-520c664a445b	00160000-56af-22fe-024b-4f81997fec67	00090000-56af-22fe-8fda-28add85777c4	aizv	10	t
003d0000-56af-22fe-d82e-8d5ee8cce2b9	00160000-56af-22fe-024b-4f81997fec67	00090000-56af-22fe-f979-fa9bbb65f6be	apri	14	t
003d0000-56af-22fe-8c02-8bc66953c1c3	00160000-56af-22fe-8d55-aa8b8ec1b7ba	00090000-56af-22fe-02ce-cfe62e9bb55f	aizv	11	t
003d0000-56af-22fe-399f-603dd1087456	00160000-56af-22fe-151a-4d53a89ade4e	00090000-56af-22fe-2c19-c1eaed26a246	aizv	12	t
003d0000-56af-22fe-f4ad-0683f665e28e	00160000-56af-22fe-024b-4f81997fec67	00090000-56af-22fe-d37e-dc983ace66a3	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 42154064)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56af-22fe-024b-4f81997fec67	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56af-22fe-8d55-aa8b8ec1b7ba	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56af-22fe-151a-4d53a89ade4e	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 42154476)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 42153870)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 42153795)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva, nadrejenogostovanje_id) FROM stdin;
00180000-56af-22fe-5cf8-b2e1385b8ce5	\N	\N	\N	\N	00440000-56af-22fe-bd2d-1b06b29f2029	00220000-56af-22fe-d5f8-1e2c62d48906	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N	\N
00180000-56af-22fe-dfda-2861eeca9320	\N	\N	\N	\N	00440000-56af-22fe-9e36-988a3702857b	00220000-56af-22fe-4b06-13c37a7f2890	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N	\N
00180000-56af-22fe-be49-43b242e32efd	\N	\N	\N	001e0000-56af-22fe-8bd7-b02ec7b59c2b	\N	00220000-56af-22fe-d5f8-1e2c62d48906	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N	\N
00180000-56af-22fe-8904-d18db57441ab	\N	\N	\N	001e0000-56af-22fe-de71-1bbe44404be4	\N	00220000-56af-22fe-4b06-13c37a7f2890	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N	\N
00180000-56af-22ff-31f6-11ce2dd83c3c	\N	00200000-56af-22ff-491c-2545bb7dd4d7	\N	\N	\N	00220000-56af-22fe-abdf-5af4e1d6e546	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s	\N	Vaja 1.	\N	\N
00180000-56af-22ff-7647-0865c3f029ff	\N	00200000-56af-22ff-1a32-eb086916d2d3	\N	\N	\N	00220000-56af-22fe-abdf-5af4e1d6e546	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s	\N	Vaja 2.	\N	\N
00180000-56af-22ff-f3af-4057a7528fb4	\N	00200000-56af-22ff-b9fc-9aafe6425d79	\N	\N	\N	00220000-56af-22fe-4b06-13c37a7f2890	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 3.	\N	\N
00180000-56af-22ff-b2ab-77c865bc97fc	\N	00200000-56af-22ff-8505-ecfcba703729	\N	\N	\N	00220000-56af-22fe-b0a1-f35d91c7e690	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s	\N	Vaja 4.	\N	\N
00180000-56af-22ff-7aa7-4e079998fa67	\N	00200000-56af-22ff-1630-6d70974542f1	\N	\N	\N	00220000-56af-22fe-87ff-81afb62dbd36	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s	\N	Vaja 5.	\N	\N
00180000-56af-22ff-f2cc-2c78d91fc7ef	\N	00200000-56af-22ff-27da-11b5fe6762d2	\N	\N	\N	00220000-56af-22fe-4b06-13c37a7f2890	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s	\N	Vaja 6.	\N	\N
00180000-56af-22ff-fb42-9adf72212015	\N	00200000-56af-22ff-0409-5141ee8ce4eb	\N	\N	\N	00220000-56af-22fe-87ff-81afb62dbd36	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 7.	\N	\N
00180000-56af-22ff-106d-9ffa0348abee	\N	00200000-56af-22ff-c437-24588b71dbe8	\N	\N	\N	00220000-56af-22fe-87ff-81afb62dbd36	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 8.	\N	\N
00180000-56af-22ff-9033-7fd7f2566580	\N	00200000-56af-22ff-e897-83e51a14dc58	\N	\N	\N	00220000-56af-22fe-abdf-5af4e1d6e546	001f0000-56af-22fe-7884-0abad46e3ba0	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	Vaja 9.	\N	\N
00180000-56af-22ff-7f23-db1f69823e6a	\N	00200000-56af-22ff-2119-af78642882b0	\N	\N	\N	00220000-56af-22fe-abdf-5af4e1d6e546	001f0000-56af-22fe-7884-0abad46e3ba0	2014-06-11 07:00:00	2014-06-12 15:00:00	400s	200s	\N	Vaja 10.	\N	\N
00180000-56af-22ff-b2d1-b9273b6c004c	\N	\N	001c0000-56af-22ff-a8e3-40f427b3e7d8	\N	\N	\N	001f0000-56af-22fe-8bcb-2f2cdad2a357	2015-03-10 07:00:00	2015-03-20 23:00:00	200s	300s	\N	Gostovanje 1.	#001122	\N
00180000-56af-22ff-4997-44196cd99a9d	001b0000-56af-22ff-a191-d733d5c4a1d1	\N	\N	\N	\N	00220000-56af-22fe-d5f8-1e2c62d48906	001f0000-56af-22fe-7884-0abad46e3ba0	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N	\N
00180000-56af-22ff-c8da-e8f5d682ac67	001b0000-56af-22ff-fc26-0bc9e294f396	\N	\N	\N	\N	00220000-56af-22fe-4b06-13c37a7f2890	001f0000-56af-22fe-7884-0abad46e3ba0	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N	\N
00180000-56af-22ff-5e34-097e1cb6ca7f	001b0000-56af-22ff-cda4-441c357c26de	\N	\N	\N	\N	00220000-56af-22fe-d5f8-1e2c62d48906	001f0000-56af-22fe-7884-0abad46e3ba0	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N	\N
00180000-56af-22ff-9c07-dc1f243a6c9c	001b0000-56af-22ff-0a20-da9cea3af747	\N	\N	\N	\N	00220000-56af-22fe-d5f8-1e2c62d48906	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N	\N
00180000-56af-22ff-78a7-bbd32a0e0763	001b0000-56af-22ff-4b3b-2d6700869f33	\N	\N	\N	\N	00220000-56af-22fe-d5f8-1e2c62d48906	001f0000-56af-22fe-8bcb-2f2cdad2a357	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N	\N
00180000-56af-22ff-0490-ebca2f7b043d	001b0000-56af-22ff-50be-5656316b12af	\N	\N	\N	\N	00220000-56af-22fe-d5f8-1e2c62d48906	001f0000-56af-22fe-8bcb-2f2cdad2a357	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N	\N
00180000-56af-22ff-0cac-4179cd031d19	001b0000-56af-22ff-b410-bfbf93270870	\N	\N	\N	\N	00220000-56af-22fe-d5f8-1e2c62d48906	001f0000-56af-22fe-7884-0abad46e3ba0	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N	\N
00180000-56af-22ff-527b-7dc1263994b1	001b0000-56af-22ff-3043-6f68a24f1690	\N	\N	\N	\N	00220000-56af-22fe-d5f8-1e2c62d48906	001f0000-56af-22fe-8bcb-2f2cdad2a357	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N	\N
00180000-56af-22ff-695c-be0e135021e0	001b0000-56af-22ff-83ee-6a48999a3b1c	\N	\N	\N	\N	00220000-56af-22fe-d5f8-1e2c62d48906	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N	\N
00180000-56af-22ff-4e8b-1ab457e62b52	001b0000-56af-22ff-f5e8-2516e833fd40	\N	\N	\N	\N	00220000-56af-22fe-d5f8-1e2c62d48906	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N	\N
00180000-56af-22ff-f1f1-42b396b8b63a	001b0000-56af-22ff-9d84-ac769b4fb19d	\N	\N	\N	\N	00220000-56af-22fe-d5f8-1e2c62d48906	001f0000-56af-22fe-8bcb-2f2cdad2a357	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N	\N
00180000-56af-22ff-a48c-f6e91cae1573	001b0000-56af-22ff-b7aa-45bd6c3c7210	\N	\N	\N	\N	00220000-56af-22fe-d5f8-1e2c62d48906	001f0000-56af-22fe-85df-3de12a6e665c	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N	\N
00180000-56af-22ff-6b7a-fe7c64ac7266	001b0000-56af-22ff-aa54-14f011612c35	\N	\N	\N	\N	00220000-56af-22fe-d5f8-1e2c62d48906	001f0000-56af-22fe-85df-3de12a6e665c	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N	\N
00180000-56af-22ff-a61e-79cf5e22a1a7	001b0000-56af-22ff-d043-332b2f6c0e49	\N	\N	\N	\N	00220000-56af-22fe-d5f8-1e2c62d48906	001f0000-56af-22fe-8bcb-2f2cdad2a357	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N	\N
00180000-56af-22ff-90b3-bfed88c0e85e	001b0000-56af-22ff-ed54-75650f7d30e2	\N	\N	\N	\N	\N	001f0000-56af-22fe-8bcb-2f2cdad2a357	2015-03-15 20:00:00	2015-03-15 23:00:00	200s	100s	\N	Predstava 15.	\N	001c0000-56af-22ff-a8e3-40f427b3e7d8
00180000-56af-22ff-f7e0-660e15feab48	001b0000-56af-22ff-e769-332f070c34b0	\N	\N	\N	\N	\N	001f0000-56af-22fe-8bcb-2f2cdad2a357	2015-03-16 20:00:00	2015-03-16 23:00:00	200s	100s	\N	Predstava 16.	\N	001c0000-56af-22ff-a8e3-40f427b3e7d8
\.


--
-- TOC entry 3166 (class 0 OID 42153821)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56af-22fe-8bd7-b02ec7b59c2b
001e0000-56af-22fe-de71-1bbe44404be4
\.


--
-- TOC entry 3167 (class 0 OID 42153826)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56af-22fe-bd2d-1b06b29f2029
00440000-56af-22fe-9e36-988a3702857b
\.


--
-- TOC entry 3209 (class 0 OID 42154398)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 42153699)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56af-22fb-f024-3d5ddea977dd	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56af-22fb-4e4d-caa12652527e	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56af-22fb-5522-0c38ab25c21b	AL	ALB	008	Albania 	Albanija	\N
00040000-56af-22fb-71c6-1d81531a943b	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56af-22fb-a0d9-8f65c7db7da2	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56af-22fb-1515-f73639570402	AD	AND	020	Andorra 	Andora	\N
00040000-56af-22fb-5d4e-1dd352e1992f	AO	AGO	024	Angola 	Angola	\N
00040000-56af-22fb-02b1-978e481bb22e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56af-22fb-50d6-448aa379c6ef	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56af-22fb-9a59-709ad8aed2b6	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56af-22fb-b2ae-d0c1bdd9afa8	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56af-22fb-a909-690f31969fa7	AM	ARM	051	Armenia 	Armenija	\N
00040000-56af-22fb-4acf-7c9972cb625f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56af-22fb-256c-20f1d750b7ab	AU	AUS	036	Australia 	Avstralija	\N
00040000-56af-22fb-3f4a-fbc26c7213ff	AT	AUT	040	Austria 	Avstrija	\N
00040000-56af-22fb-8458-85ce636681e5	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56af-22fb-65b0-d998e91522ff	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56af-22fb-5798-6ed5fb49a393	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56af-22fb-6ec7-829c3e180db0	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56af-22fb-2d26-85087c9a9ef9	BB	BRB	052	Barbados 	Barbados	\N
00040000-56af-22fb-a5de-529cb4908141	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56af-22fb-7247-77252ed28499	BE	BEL	056	Belgium 	Belgija	\N
00040000-56af-22fb-a261-56c7c321739a	BZ	BLZ	084	Belize 	Belize	\N
00040000-56af-22fb-a9b2-0a7da32347c2	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56af-22fb-5df2-0e60c0ef1d91	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56af-22fb-ed89-930a740a7751	BT	BTN	064	Bhutan 	Butan	\N
00040000-56af-22fb-32a6-7626c8df5bb2	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56af-22fb-4a2c-26e55cde2bfb	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56af-22fb-57b7-5979b619b090	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56af-22fb-780b-8036c4cd8116	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56af-22fb-63c8-692b23260071	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56af-22fb-c183-2b374919e63d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56af-22fb-f437-fb0331bc4c8d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56af-22fb-c708-41e378572341	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56af-22fb-e53e-365eb456686f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56af-22fb-9f35-7ef34b6434f5	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56af-22fb-ac94-0c108f9be3c5	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56af-22fb-77e8-15e8b09b9c6c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56af-22fb-2df9-c9fe691ce7aa	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56af-22fb-a9f4-4f1305a70fb4	CA	CAN	124	Canada 	Kanada	\N
00040000-56af-22fb-f3b6-6e733b72ae67	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56af-22fb-1657-0bc91893a9fd	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56af-22fb-a6c9-70154a58c76a	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56af-22fb-e73d-112e08b6e5d1	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56af-22fb-5878-fb48c48623dd	CL	CHL	152	Chile 	Čile	\N
00040000-56af-22fb-e467-e8b38f63066c	CN	CHN	156	China 	Kitajska	\N
00040000-56af-22fb-7674-2bcb5ce965b1	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56af-22fb-7098-10bd8e46e339	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56af-22fb-4b74-f86cdacc7720	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56af-22fb-72bf-75c622e0e0f1	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56af-22fb-8a09-fe6dd8b27865	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56af-22fb-3f72-dfda749615bc	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56af-22fb-7125-8dc4cd54b1c1	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56af-22fb-70d3-9ac83fd5f20e	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56af-22fb-5493-3a6818b5f2df	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56af-22fb-6b49-b930aaf0fe9c	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56af-22fb-2340-43f818aad227	CU	CUB	192	Cuba 	Kuba	\N
00040000-56af-22fb-9bac-121c775e0bd4	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56af-22fb-b74e-d5ea254a6851	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56af-22fb-ef00-3c5ce89f62ef	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56af-22fb-70f4-8fd10400195d	DK	DNK	208	Denmark 	Danska	\N
00040000-56af-22fb-cee1-7556e3036c3f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56af-22fb-5201-176f6f247f18	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56af-22fb-565d-7d15abbd7606	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56af-22fb-2f70-f457a59b37af	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56af-22fb-42cd-3726b89bec98	EG	EGY	818	Egypt 	Egipt	\N
00040000-56af-22fb-9122-02b174507391	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56af-22fb-1199-2819f9e848b2	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56af-22fb-1d2a-121a0426506e	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56af-22fb-d280-aaa746d82f78	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56af-22fb-113f-fb1456a66bb6	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56af-22fb-9918-27ce43cf5045	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56af-22fb-17f8-18e824cd8101	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56af-22fb-e8f4-98f7f5f44346	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56af-22fb-e71d-ebccfd7912c3	FI	FIN	246	Finland 	Finska	\N
00040000-56af-22fb-d6d5-905b2e77dec9	FR	FRA	250	France 	Francija	\N
00040000-56af-22fb-d6d7-1edba165fb0e	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56af-22fb-f253-7b47f0fdd217	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56af-22fb-c02d-1d8c0656310f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56af-22fb-ae21-8fba1f46dd5e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56af-22fb-5f00-1d1481aec342	GA	GAB	266	Gabon 	Gabon	\N
00040000-56af-22fb-2d32-e4c58c3dc609	GM	GMB	270	Gambia 	Gambija	\N
00040000-56af-22fb-f31b-50f798e6f26e	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56af-22fb-5567-da6ef6080590	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56af-22fb-cfd0-c966c6ab08bc	GH	GHA	288	Ghana 	Gana	\N
00040000-56af-22fb-1e97-5a36dc1bec6b	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56af-22fb-458e-c6a608a590c7	GR	GRC	300	Greece 	Grčija	\N
00040000-56af-22fb-3c29-6d817eccb471	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56af-22fb-0afd-d2782d35a2be	GD	GRD	308	Grenada 	Grenada	\N
00040000-56af-22fb-0a36-28768a942e55	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56af-22fb-0ddb-9f80e148cd69	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56af-22fb-7916-ea225dd88d1a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56af-22fb-e4fc-e57cd6d9beee	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56af-22fb-2fac-7f9de72710c9	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56af-22fb-3d95-dea423f4b797	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56af-22fb-fdcd-ae946839ff7a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56af-22fb-245d-d1860c307023	HT	HTI	332	Haiti 	Haiti	\N
00040000-56af-22fb-6b8a-d0a487ccf8db	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56af-22fb-7211-274e72a02db8	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56af-22fb-709e-34c5b5c6a343	HN	HND	340	Honduras 	Honduras	\N
00040000-56af-22fb-60a7-8ff90ef315c0	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56af-22fb-8f24-d31d79125219	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56af-22fb-2a1f-e5467ebf3e80	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56af-22fb-a275-9d75388142ed	IN	IND	356	India 	Indija	\N
00040000-56af-22fb-87bc-fde4dfb3d15e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56af-22fb-773e-3bb5fa9cedc1	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56af-22fb-926e-d032c20b72e3	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56af-22fb-266e-d17776a05e48	IE	IRL	372	Ireland 	Irska	\N
00040000-56af-22fb-e4c0-9a0517bb0b43	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56af-22fb-438d-3ff2583504f2	IL	ISR	376	Israel 	Izrael	\N
00040000-56af-22fb-25d5-d0c72563f4c6	IT	ITA	380	Italy 	Italija	\N
00040000-56af-22fb-ce7b-e39d4f1820df	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56af-22fb-f90c-797221985098	JP	JPN	392	Japan 	Japonska	\N
00040000-56af-22fb-a834-f7157041d5b3	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56af-22fb-981e-ca51f62e79b5	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56af-22fb-da31-d359ac73ddc9	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56af-22fb-7a1a-b3cc41cda345	KE	KEN	404	Kenya 	Kenija	\N
00040000-56af-22fb-1e74-a6f8c851a7a2	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56af-22fb-da00-b23ffb5f4d80	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56af-22fb-e01b-3e3e6669de0f	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56af-22fb-b9f0-bcf356495fe5	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56af-22fb-4e0f-df3c77705456	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56af-22fb-170b-1dc4196668f1	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56af-22fb-c1bf-0f9d514ed776	LV	LVA	428	Latvia 	Latvija	\N
00040000-56af-22fb-fe01-490ab3dc3dc5	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56af-22fb-c3d8-a4d99190ffff	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56af-22fb-e83b-b5527b87db1e	LR	LBR	430	Liberia 	Liberija	\N
00040000-56af-22fb-a645-d1c9f3d777ff	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56af-22fb-64db-fccd38ceaa4e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56af-22fb-e98a-acf6ae76d938	LT	LTU	440	Lithuania 	Litva	\N
00040000-56af-22fb-87fe-a146af16edca	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56af-22fb-74e5-ed7c7cdf3a47	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56af-22fb-fb4a-21666fc037ed	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56af-22fb-e2a8-f7c89d462485	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56af-22fb-4ae0-d4eaf5e3038a	MW	MWI	454	Malawi 	Malavi	\N
00040000-56af-22fb-7a54-ba47612456ab	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56af-22fb-fe7b-daeaaa8683fb	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56af-22fb-f642-107a9058de1b	ML	MLI	466	Mali 	Mali	\N
00040000-56af-22fb-e4b1-839f885581d5	MT	MLT	470	Malta 	Malta	\N
00040000-56af-22fb-1b36-ec73b06955c6	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56af-22fb-2f1e-b9f7eae94ac3	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56af-22fb-c20e-481113e439a4	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56af-22fb-a469-88ad7e7167c5	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56af-22fb-0a09-8864c04a998b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56af-22fb-bbed-91bf73c8ede0	MX	MEX	484	Mexico 	Mehika	\N
00040000-56af-22fb-ab35-b4baf0f0ddae	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56af-22fb-f5b8-9fd5762e1bef	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56af-22fb-a3c9-28b72deec7fc	MC	MCO	492	Monaco 	Monako	\N
00040000-56af-22fb-d89b-8c60ed8474be	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56af-22fb-738d-9afa94760d56	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56af-22fb-29ff-84f166d638a8	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56af-22fb-1761-97b619fea76f	MA	MAR	504	Morocco 	Maroko	\N
00040000-56af-22fb-a47c-88564028d8cd	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56af-22fb-775a-418d872d34fd	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56af-22fb-a415-0e6050a39524	NA	NAM	516	Namibia 	Namibija	\N
00040000-56af-22fb-a46e-7148aacee1fb	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56af-22fb-68a2-bebe63320322	NP	NPL	524	Nepal 	Nepal	\N
00040000-56af-22fb-0c09-9f58afb07502	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56af-22fb-a592-a94c74e56a27	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56af-22fb-3e87-6b4e40bc3174	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56af-22fb-dd92-7e1c3e3a065c	NE	NER	562	Niger 	Niger 	\N
00040000-56af-22fb-faeb-c507b17d3dda	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56af-22fb-1448-c6dc264b4eaf	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56af-22fb-f602-9865c0657f89	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56af-22fb-53a1-93f294094747	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56af-22fb-78d8-76ece520a304	NO	NOR	578	Norway 	Norveška	\N
00040000-56af-22fb-52e8-f808148bc1a4	OM	OMN	512	Oman 	Oman	\N
00040000-56af-22fb-8f6a-67360746d9d2	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56af-22fb-7ac2-782258ece42c	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56af-22fb-d28c-922574883794	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56af-22fb-966a-5882633909a9	PA	PAN	591	Panama 	Panama	\N
00040000-56af-22fb-a050-d3ea1c160b34	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56af-22fb-4d7f-5d890ab6cf57	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56af-22fb-94b7-d6569d67790f	PE	PER	604	Peru 	Peru	\N
00040000-56af-22fb-2740-fd50bd5f08c2	PH	PHL	608	Philippines 	Filipini	\N
00040000-56af-22fb-5a7f-4262953e6f90	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56af-22fb-9f51-3877cde1bf2c	PL	POL	616	Poland 	Poljska	\N
00040000-56af-22fb-e24a-e4999cfb3f6a	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56af-22fb-39aa-0a7889c8d67f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56af-22fb-0c79-4234f8d47c81	QA	QAT	634	Qatar 	Katar	\N
00040000-56af-22fb-ed72-c2b5b810d5d9	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56af-22fb-79ac-812c89efe813	RO	ROU	642	Romania 	Romunija	\N
00040000-56af-22fb-fa2c-aa4e7296f152	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56af-22fb-ad68-b16a5dd041e1	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56af-22fb-201f-4c1ce6c69ca4	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56af-22fb-625d-dcbaba839dd0	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56af-22fb-1ecb-cf51f41df80d	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56af-22fb-b790-b769bcf0f8e3	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56af-22fb-f298-b6bd60ee49b4	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56af-22fb-d991-7d7f557d06ae	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56af-22fb-fa24-3337fc8cff12	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56af-22fb-535f-e77445d939f9	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56af-22fb-7ec7-33efdc0ba107	SM	SMR	674	San Marino 	San Marino	\N
00040000-56af-22fb-261b-057bbeaae904	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56af-22fb-8dd4-9ffdfabe21ca	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56af-22fb-eee6-580ff1c4b236	SN	SEN	686	Senegal 	Senegal	\N
00040000-56af-22fb-4fde-dd95298d476a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56af-22fb-16e0-0c3c8e495aa5	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56af-22fb-06b3-bdcb8129fb74	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56af-22fb-59e7-ccc2741a3295	SG	SGP	702	Singapore 	Singapur	\N
00040000-56af-22fb-0b3b-73fd143dfba7	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56af-22fb-094a-7a4ead1bdf88	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56af-22fb-a623-f036b807b02f	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56af-22fb-7c41-60367cb2aef4	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56af-22fb-43ad-ca932819f081	SO	SOM	706	Somalia 	Somalija	\N
00040000-56af-22fb-44f3-5146ddedf145	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56af-22fb-cbae-1dd6007b3f0b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56af-22fb-42e8-400660e0d263	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56af-22fb-c55c-c34b1f9f29f3	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56af-22fb-0b08-5a85f85953f2	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56af-22fb-dd77-691004f05913	SD	SDN	729	Sudan 	Sudan	\N
00040000-56af-22fb-604e-ef1a04668f99	SR	SUR	740	Suriname 	Surinam	\N
00040000-56af-22fb-a05f-1192893205ef	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56af-22fb-37e8-3b8d29ab6e72	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56af-22fb-857b-e07e57fe51e9	SE	SWE	752	Sweden 	Švedska	\N
00040000-56af-22fb-d54f-dc115e5ce0c6	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56af-22fb-7f69-cb073ae4496f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56af-22fb-2e6c-3e32402ef08d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56af-22fb-671e-d69f993c8b5f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56af-22fb-8e65-98f507b59331	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56af-22fb-00ea-389961582107	TH	THA	764	Thailand 	Tajska	\N
00040000-56af-22fb-a3f9-ba2f3123ce6f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56af-22fb-fe8c-e715562c2dad	TG	TGO	768	Togo 	Togo	\N
00040000-56af-22fb-eea2-aec72e3e900f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56af-22fb-6bc4-f68fa0f54ab0	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56af-22fb-9744-ba8ee89c0523	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56af-22fb-4d8a-fb4520f13f6f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56af-22fb-8352-3500fa29627e	TR	TUR	792	Turkey 	Turčija	\N
00040000-56af-22fb-408f-2320afe5607a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56af-22fb-130d-b42cc70020c1	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56af-22fb-37fa-8d32f0edd55b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56af-22fb-a129-9024c63111ba	UG	UGA	800	Uganda 	Uganda	\N
00040000-56af-22fb-1840-f5c947d46ce5	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56af-22fb-4795-a26e6c988746	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56af-22fb-c6ce-f32774c413f3	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56af-22fb-06f2-0b9d239a70f0	US	USA	840	United States 	Združene države Amerike	\N
00040000-56af-22fb-e313-447c726a6bca	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56af-22fb-4da1-1fda44c5c97c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56af-22fb-eff9-54833ba97b66	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56af-22fb-f95b-28982caff337	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56af-22fb-10ee-d9e99a3a83e6	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56af-22fb-e9e0-cc4c996d16ad	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56af-22fb-c45b-bb28efba4a24	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56af-22fb-e1c4-90374269d199	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56af-22fb-0631-c41ee8071faf	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56af-22fb-be86-27406597b36b	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56af-22fb-1948-e83d3756724d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56af-22fb-bffb-470cd65fe235	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56af-22fb-c028-94ea6639838c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 42154186)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56af-22fe-3e3f-e7d1f156b639	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56af-22fe-4ed5-cf5b0f41d3df	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56af-22fe-7109-7c849a5e1904	000e0000-56af-22fe-4f27-6ba8f064af69	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56af-22fb-e8d3-c6cf19847f80	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56af-22fe-ef27-9c3a52ae3302	000e0000-56af-22fe-c040-057868cf956f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56af-22fb-e7de-6330af875cb5	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56af-22fe-fad3-fcbe893cf1f9	000e0000-56af-22fe-5d2e-717d30e7e7f9	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56af-22fb-e8d3-c6cf19847f80	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 42153992)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56af-22fe-36c7-b0322cf70b35	000e0000-56af-22fe-c040-057868cf956f	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56af-22fb-6ad8-69587b9930f9
000d0000-56af-22fe-9242-891b0bb85eae	000e0000-56af-22fe-70ae-a151ce9c3681	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56af-22fb-3312-c61613676207
000d0000-56af-22fe-ae8d-ffb87be65cd5	000e0000-56af-22fe-70ae-a151ce9c3681	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56af-22fb-6ee9-b62eaafb45bb
000d0000-56af-22fe-4386-88eceaabaeb4	000e0000-56af-22fe-c040-057868cf956f	000c0000-56af-22fe-ddf0-39374ce0976c	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56af-22fb-3312-c61613676207
000d0000-56af-22fe-a785-aa774b0c67df	000e0000-56af-22fe-c040-057868cf956f	000c0000-56af-22fe-4f4b-846cf5315f34	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56af-22fb-6ee9-b62eaafb45bb
000d0000-56af-22fe-d2fb-b38afbaa8060	000e0000-56af-22fe-c040-057868cf956f	000c0000-56af-22fe-b15a-08548e36db35	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56af-22fb-9aa5-92269d824613
000d0000-56af-22fe-4454-c0855c17aff4	000e0000-56af-22fe-c040-057868cf956f	000c0000-56af-22fe-cd16-3edffbcef567	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56af-22fb-6ad8-69587b9930f9
000d0000-56af-22fe-4476-5f47c42b8d28	000e0000-56af-22fe-c040-057868cf956f	000c0000-56af-22ff-099e-464b32da0c65	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56af-22fb-6ad8-69587b9930f9
000d0000-56af-22fe-6746-9e2eb833f150	000e0000-56af-22fe-c040-057868cf956f	000c0000-56af-22ff-0f61-fa2d53e41c05	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56af-22fb-3312-c61613676207
000d0000-56af-22fe-bb03-db91bed9c61c	000e0000-56af-22fe-c040-057868cf956f	000c0000-56af-22ff-7f90-3b12a800f950	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56af-22fb-3312-c61613676207
000d0000-56af-22fe-fdd8-eae7c8402d3e	000e0000-56af-22fe-c040-057868cf956f	000c0000-56af-22ff-6bf9-d18bb395cad6	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56af-22fb-f896-a39298884cc4
000d0000-56af-22fe-00ac-b71a3ff24824	000e0000-56af-22fe-c040-057868cf956f	000c0000-56af-22ff-ca8f-34bab84699c5	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56af-22fb-d523-86b4f6067fdf
000d0000-56af-22fe-a157-bc5de394a352	000e0000-56af-22fe-5a07-85539db55c4f	000c0000-56af-22ff-380a-d643fc852b27	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56af-22fb-6ee9-b62eaafb45bb
000d0000-56af-22fe-cddd-942401c25208	000e0000-56af-22fe-a51b-79bb0580f9d9	000c0000-56af-22ff-9df1-38d4dc26ac4f	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56af-22fb-6ee9-b62eaafb45bb
000d0000-56af-22fe-b0a0-558a713d573d	000e0000-56af-22fe-a51b-79bb0580f9d9	000c0000-56af-22ff-e69e-2509d8cfc9df	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56af-22fb-6ee9-b62eaafb45bb
000d0000-56af-22fe-4811-9ba5495ee9aa	000e0000-56af-22fe-77ed-b5616438e368	000c0000-56af-22ff-bf7e-6f0bde6981dd	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56af-22fb-6ee9-b62eaafb45bb
000d0000-56af-22fe-6be1-f49b2af00f7d	000e0000-56af-22fe-698f-5b8783ed1ebd	000c0000-56af-22ff-7ae5-2d66f96bd693	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56af-22fb-6ee9-b62eaafb45bb
000d0000-56af-22fe-4983-5a59e8fddfdc	000e0000-56af-22fe-2e85-225d189360f4	000c0000-56af-22ff-a674-5794fb303a9b	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56af-22fb-6ee9-b62eaafb45bb
000d0000-56af-22fe-1f79-8ee16758c476	000e0000-56af-22fe-e773-4d5a6cefccfa	000c0000-56af-22ff-f2f3-51550121336e	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56af-22fb-6ee9-b62eaafb45bb
000d0000-56af-22fe-439b-b106113771af	000e0000-56af-22fe-b7df-e38f30957d8c	000c0000-56af-22ff-3429-9cb6e568fdc0	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56af-22fb-6ee9-b62eaafb45bb
000d0000-56af-22fe-cb6e-db8742605c28	000e0000-56af-22fe-2ab1-ad73388fe628	000c0000-56af-22ff-42cc-4b59ef8e34ec	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56af-22fb-6ee9-b62eaafb45bb
000d0000-56af-22fe-dc9e-9d7deb5b838b	000e0000-56af-22fe-2ab1-ad73388fe628	000c0000-56af-22ff-3209-620da4bc04de	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56af-22fb-6ee9-b62eaafb45bb
000d0000-56af-22fe-afa3-459123e052a1	000e0000-56af-22fe-68f8-8806a4ad1345	000c0000-56af-22ff-7c19-8c145b0d611d	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56af-22fb-6ee9-b62eaafb45bb
000d0000-56af-22fe-5f65-b47c7e00c36c	000e0000-56af-22fe-68f8-8806a4ad1345	000c0000-56af-22ff-edb8-6e0deb449511	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56af-22fb-6ee9-b62eaafb45bb
\.


--
-- TOC entry 3162 (class 0 OID 42153769)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
001c0000-56af-22ff-a8e3-40f427b3e7d8	00040000-56af-22fb-2a1f-e5467ebf3e80		\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 42153741)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 42153717)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56af-22fe-d77b-471d294ee96c	00080000-56af-22fe-6e7b-8de151ee036e	00090000-56af-22fe-9e76-3c7caf096cd0	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 42153906)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 42154456)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56af-22fe-e4db-18068c72fef2	00010000-56af-22fc-1e20-0d8e8bdd7806	\N	Prva mapa	Root mapa	2016-02-01 10:18:54	2016-02-01 10:18:54	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 42154469)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 42154491)
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
-- TOC entry 3180 (class 0 OID 42153930)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 42153673)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56af-22fc-f6a1-9f265b3d63ed	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56af-22fc-f222-484ef0283607	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56af-22fc-2bad-29bf7ad09dd6	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56af-22fc-de13-b6c006ef5d46	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56af-22fc-eeee-9312ad071415	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56af-22fc-f313-7804ffe45eea	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56af-22fc-6e78-9ff8bab6a34c	dogodek.delte	array	a:14:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delGosZac";a:2:{s:5:"label";s:37:"Delta začetka pri dogodku gostovanje";s:5:"value";i:0;}s:9:"delGosKon";a:2:{s:5:"label";s:34:"Delta konca pri dogodku gostovanje";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56af-22fc-23e0-626e57254d8b	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56af-22fc-6995-a0d76d9fd110	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56af-22fc-0bfc-b7b17a1f5720	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56af-22fc-3bcb-13c42fdc609f	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56af-22fc-6192-5396d4261f71	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56af-22fc-ae2d-ce5f595f72a9	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56af-22fc-1f05-e147566232b6	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56af-22fc-9a09-41ce93d70e33	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56af-22fc-2d33-dfae64a44451	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56af-22fc-8901-2905e5bc7b8c	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56af-22fe-66c4-b1c39a3f21e8	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56af-22fe-db69-3aef4362bd41	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56af-22fe-885d-72feece45dfc	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56af-22fe-ba94-0150e735b5b2	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56af-22fe-80bf-d457221ec897	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56af-22fe-c8e8-2adf18bdabdb	tomaz.barva.ozadja	array	s:4:"siva";	t	f	f	\N	barva ozadja tomaž
00000000-56af-2300-e946-98b5099fe64b	application.tenant.maticnopodjetje	string	s:36:"00080000-56af-2300-e8ad-40383cc9400e";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 42153572)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56af-22fe-e55d-94cb95081694	00000000-56af-22fe-66c4-b1c39a3f21e8	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56af-22fe-f732-c054f8c23941	00000000-56af-22fe-66c4-b1c39a3f21e8	00010000-56af-22fc-1e20-0d8e8bdd7806	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56af-22fe-640c-db788039fdce	00000000-56af-22fe-db69-3aef4362bd41	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
00000000-56af-22fe-d25b-cec81eaa20a3	00000000-56af-22fe-c8e8-2adf18bdabdb	\N	s:6:"zelena";	t
00000000-56af-22fe-c2bc-24da7b97c133	00000000-56af-22fe-c8e8-2adf18bdabdb	00010000-56af-22fc-1e20-0d8e8bdd7806	s:6:"rdeča";	f
\.


--
-- TOC entry 3151 (class 0 OID 42153640)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56af-22fe-b453-bf4a3a602d10	\N	00100000-56af-22fe-b9c4-bdeae93f449f	00100000-56af-22fe-9797-5a6f2c347f37	01	Gledališče Nimbis
00410000-56af-22fe-7a71-04a5f8b988e6	00410000-56af-22fe-b453-bf4a3a602d10	00100000-56af-22fe-b9c4-bdeae93f449f	00100000-56af-22fe-9797-5a6f2c347f37	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 42153583)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56af-22fe-ae5a-547949bc39da	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56af-22fe-0024-e37b7a29b2b6	00010000-56af-22fe-8344-496c7d640daa	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56af-22fe-05ad-88e7126e09ff	00010000-56af-22fe-c3a1-7972be835e24	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56af-22fe-551f-071a93e0bd11	00010000-56af-22fe-a7ca-33661aa855b1	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56af-22fe-13a0-94b85369e41e	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56af-22fe-0ff1-ef9670b21992	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56af-22fe-15e6-93ab9549995b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56af-22fe-e8f7-a2b02d2c0dec	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56af-22fe-9e76-3c7caf096cd0	00010000-56af-22fe-7ca4-9577eef209f7	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56af-22fe-df3b-8fb35e79b22e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56af-22fe-0e40-e13e54c4d2e6	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56af-22fe-f820-df5ac7e175e2	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56af-22fe-3102-d4cc02d75e19	00010000-56af-22fe-191f-995c3baf5f83	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56af-22fe-8fda-28add85777c4	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-22fe-f979-fa9bbb65f6be	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-22fe-02ce-cfe62e9bb55f	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-22fe-2c19-c1eaed26a246	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56af-22fe-d37e-dc983ace66a3	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56af-22fe-7d11-3f0b379f5a9c	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-22fe-7b44-cb847c49e90f	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56af-22fe-73a9-43738443152b	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 42153517)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56af-22fb-ef8f-5e5d11260d73	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56af-22fb-d1c4-dd888053001e	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56af-22fb-ae77-97c1fd7a5d55	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56af-22fb-0dab-68409c41f311	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56af-22fb-8e50-51914764c55e	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56af-22fb-d1c8-959aac3ffce6	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56af-22fb-ca4d-6736da7feeb1	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56af-22fb-0640-5d7217aeee6c	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56af-22fb-2b57-62cfafe6257e	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56af-22fb-7c79-12d4157d534d	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56af-22fb-56c5-1b1531e8e91f	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56af-22fb-a4c2-7e876e9435f2	Abonma-read	Abonma - branje	t
00030000-56af-22fb-890e-b3e2326ccbda	Abonma-write	Abonma - spreminjanje	t
00030000-56af-22fb-b423-58b6392def68	Alternacija-read	Alternacija - branje	t
00030000-56af-22fb-564b-497f79774d10	Alternacija-write	Alternacija - spreminjanje	t
00030000-56af-22fb-1828-2b982dca50e0	Arhivalija-read	Arhivalija - branje	t
00030000-56af-22fb-fd9a-d6a64a573bcf	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56af-22fb-6d49-c13a3775914b	AuthStorage-read	AuthStorage - branje	t
00030000-56af-22fb-7d7e-020f2acd30aa	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56af-22fb-9a12-3a6837a76a7b	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56af-22fb-58a4-c2e5c20771c1	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56af-22fb-821d-b9004a4db058	Besedilo-read	Besedilo - branje	t
00030000-56af-22fb-b138-b2f64bc3a493	Besedilo-write	Besedilo - spreminjanje	t
00030000-56af-22fb-3874-18dcf91723be	Dodatek-read	Dodatek - branje	t
00030000-56af-22fb-8804-77fa7a4ed859	Dodatek-write	Dodatek - spreminjanje	t
00030000-56af-22fb-e185-45a9df288e32	Dogodek-read	Dogodek - branje	t
00030000-56af-22fb-5d3b-225924626588	Dogodek-write	Dogodek - spreminjanje	t
00030000-56af-22fb-fd93-3e078d2544c0	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56af-22fb-3976-318ab1cc95df	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56af-22fb-4f29-10755891539a	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56af-22fb-efac-3f5fef1caeb3	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56af-22fb-7a4d-acd9044dacf4	DogodekTrait-read	DogodekTrait - branje	t
00030000-56af-22fb-693e-1efec9d4c57c	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56af-22fb-1612-28ab6bc9fb13	DrugiVir-read	DrugiVir - branje	t
00030000-56af-22fb-de0f-aa388b42ae76	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56af-22fb-5604-1c5efb9e7c4b	Drzava-read	Drzava - branje	t
00030000-56af-22fb-dc91-0a31c84fe713	Drzava-write	Drzava - spreminjanje	t
00030000-56af-22fb-a1fd-bfed9604c2bf	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56af-22fb-863d-50c794cb78e7	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56af-22fb-2d1e-cd5067aa136c	Funkcija-read	Funkcija - branje	t
00030000-56af-22fb-edc5-76b21085ff71	Funkcija-write	Funkcija - spreminjanje	t
00030000-56af-22fb-2b71-1abc2a8a3e81	Gostovanje-read	Gostovanje - branje	t
00030000-56af-22fb-7644-4b55564a3452	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56af-22fb-ec8d-7d925d2a405a	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56af-22fb-e748-714b6d2cd1c9	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56af-22fb-50f9-9508a855089e	Kupec-read	Kupec - branje	t
00030000-56af-22fb-fc05-56430d204737	Kupec-write	Kupec - spreminjanje	t
00030000-56af-22fb-2db7-50a7d64109ee	NacinPlacina-read	NacinPlacina - branje	t
00030000-56af-22fb-479a-fef7097821a3	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56af-22fb-449c-c7ae8e7dc2db	Option-read	Option - branje	t
00030000-56af-22fb-c65a-1d86ba5741c4	Option-write	Option - spreminjanje	t
00030000-56af-22fb-e110-41c3c6f537fe	OptionValue-read	OptionValue - branje	t
00030000-56af-22fb-048d-4cf1084f1c78	OptionValue-write	OptionValue - spreminjanje	t
00030000-56af-22fb-7841-862250a7e450	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56af-22fb-04d9-248b02420445	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56af-22fb-a107-3ce5b9a94d79	Oseba-read	Oseba - branje	t
00030000-56af-22fb-a91a-3f13c8544727	Oseba-write	Oseba - spreminjanje	t
00030000-56af-22fb-3b35-fc8d646ed38d	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56af-22fb-f391-954b8e159297	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56af-22fb-7d9f-36a555f38a00	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56af-22fb-f5c7-f29cb244bf8e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56af-22fb-cc0e-8624c9620ddd	Pogodba-read	Pogodba - branje	t
00030000-56af-22fb-c975-b551c51edaf2	Pogodba-write	Pogodba - spreminjanje	t
00030000-56af-22fb-8c05-aad6138df400	Popa-read	Popa - branje	t
00030000-56af-22fb-0570-c39e3bf23741	Popa-write	Popa - spreminjanje	t
00030000-56af-22fb-0670-c69fbf706952	Posta-read	Posta - branje	t
00030000-56af-22fb-8f28-7649357525c7	Posta-write	Posta - spreminjanje	t
00030000-56af-22fb-d676-723203ba643d	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56af-22fb-8f76-01fb93d28df3	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56af-22fb-9741-b0f12ec6df6d	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56af-22fb-6595-b9be4bae73cf	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56af-22fb-8731-78728db382ba	PostniNaslov-read	PostniNaslov - branje	t
00030000-56af-22fb-574e-897fe9d2934a	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56af-22fb-41a5-3e413ba056d9	Praznik-read	Praznik - branje	t
00030000-56af-22fb-cb60-46f3debe486c	Praznik-write	Praznik - spreminjanje	t
00030000-56af-22fb-2bd2-c357e238b83c	Predstava-read	Predstava - branje	t
00030000-56af-22fb-d4e1-f665f7019be9	Predstava-write	Predstava - spreminjanje	t
00030000-56af-22fb-f1cc-5a7f462ef69b	Ura-read	Ura - branje	t
00030000-56af-22fb-25dd-7a3e0934820c	Ura-write	Ura - spreminjanje	t
00030000-56af-22fb-27c3-3affe7f2f975	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56af-22fb-b114-704689feb94e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56af-22fb-db5a-b2a6cd476a45	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56af-22fb-1f24-22e1ae5d3c77	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56af-22fb-236d-4d48191b85e7	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56af-22fb-d18a-6acbfe87dc1f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56af-22fb-a354-890e53680ea6	ProgramDela-read	ProgramDela - branje	t
00030000-56af-22fb-5a0c-4834dd76155a	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56af-22fb-eec7-66f1e0ae44fb	ProgramFestival-read	ProgramFestival - branje	t
00030000-56af-22fb-d8f4-be60fa2d436f	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56af-22fb-9dd7-e93feb54cb1d	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56af-22fb-3950-57ee2d1190a9	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56af-22fb-d366-f94199d1b607	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56af-22fb-f2ad-0939dd57d8ea	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56af-22fb-9e96-ff7874cb80a0	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56af-22fb-010e-ed50a45ee356	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56af-22fb-cdc9-38276d54e632	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56af-22fb-7932-9793aeed11e6	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56af-22fb-8da0-a47eab02df1a	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56af-22fb-92e3-a6f20aba7028	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56af-22fb-93b7-bd6e13b3e774	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56af-22fb-1327-a609a7bd568a	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56af-22fb-bdc7-d114bb5bfe4e	ProgramRazno-read	ProgramRazno - branje	t
00030000-56af-22fb-18c6-5faa31a06828	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56af-22fb-40bf-d4456beaa8d0	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56af-22fb-5ca6-fc73de175a36	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56af-22fb-8379-c6ac71dda95b	Prostor-read	Prostor - branje	t
00030000-56af-22fb-bad5-fd43e5d04cd1	Prostor-write	Prostor - spreminjanje	t
00030000-56af-22fb-6091-55fde44505d7	Racun-read	Racun - branje	t
00030000-56af-22fb-81f9-36ba83bec862	Racun-write	Racun - spreminjanje	t
00030000-56af-22fb-e2a6-6e10f2674336	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56af-22fb-581a-998fc58e733f	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56af-22fb-3b48-9ea8c6487e3b	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56af-22fb-de42-c0f5b9bba998	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56af-22fb-f8e2-6cefb9c098fe	Rekvizit-read	Rekvizit - branje	t
00030000-56af-22fb-08b7-4ba7f3f344d5	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56af-22fb-7f94-d8749f582a1e	Revizija-read	Revizija - branje	t
00030000-56af-22fb-c7e6-078a3e1f9888	Revizija-write	Revizija - spreminjanje	t
00030000-56af-22fb-5818-50ca2f085081	Rezervacija-read	Rezervacija - branje	t
00030000-56af-22fb-91d0-3f0a78e20750	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56af-22fb-9d4c-fa40d7af8489	SedezniRed-read	SedezniRed - branje	t
00030000-56af-22fb-5373-6f187adf526d	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56af-22fb-f3fd-08fb6be05f54	Sedez-read	Sedez - branje	t
00030000-56af-22fb-dbcf-de46b844be66	Sedez-write	Sedez - spreminjanje	t
00030000-56af-22fb-0c3c-ee02e62f9ad4	Sezona-read	Sezona - branje	t
00030000-56af-22fb-a78e-c9a964173536	Sezona-write	Sezona - spreminjanje	t
00030000-56af-22fb-150a-c03cd58145c9	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56af-22fb-9d57-2a08651711e5	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56af-22fb-3c84-5c403f26cd08	Telefonska-read	Telefonska - branje	t
00030000-56af-22fb-5e0c-48c387241476	Telefonska-write	Telefonska - spreminjanje	t
00030000-56af-22fb-ad1e-51622e26386b	TerminStoritve-read	TerminStoritve - branje	t
00030000-56af-22fb-2c08-12d349a9f73a	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56af-22fb-fa95-e9c9f869dfc8	TipDodatka-read	TipDodatka - branje	t
00030000-56af-22fb-17ad-06df27554483	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56af-22fb-febb-903eebcfd55b	TipFunkcije-read	TipFunkcije - branje	t
00030000-56af-22fb-6e2f-150c14826e60	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56af-22fb-848e-d32ca59ed6d4	TipPopa-read	TipPopa - branje	t
00030000-56af-22fb-891e-b0b568a07b17	TipPopa-write	TipPopa - spreminjanje	t
00030000-56af-22fb-116f-160fc6dbad8a	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56af-22fb-0374-287e0d8bf639	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56af-22fb-2e96-d92aaf100364	TipVaje-read	TipVaje - branje	t
00030000-56af-22fb-8e7b-64acac12783b	TipVaje-write	TipVaje - spreminjanje	t
00030000-56af-22fb-013b-66e6996dcfe0	Trr-read	Trr - branje	t
00030000-56af-22fb-8242-e04d680088a4	Trr-write	Trr - spreminjanje	t
00030000-56af-22fb-0498-5763ec0dee92	Uprizoritev-read	Uprizoritev - branje	t
00030000-56af-22fb-4a25-4463e1cbdd57	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56af-22fb-8a1b-55851b1adebf	Vaja-read	Vaja - branje	t
00030000-56af-22fb-5229-7a263caf245b	Vaja-write	Vaja - spreminjanje	t
00030000-56af-22fb-f15e-9535dcf48c88	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56af-22fb-13a4-6243e14fa76a	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56af-22fb-bfd6-ab3a6e58929f	VrstaStroska-read	VrstaStroska - branje	t
00030000-56af-22fb-2012-3a3501844fdc	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56af-22fb-a7a9-c00abf59993a	Zaposlitev-read	Zaposlitev - branje	t
00030000-56af-22fb-3502-e9883b18e02c	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56af-22fb-0614-9fc365613194	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56af-22fb-1ba8-4f505e2ba8da	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56af-22fb-38ac-43aeb9af10fd	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56af-22fb-d23b-9f7b74a5f3bb	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56af-22fb-f534-adc09311c2ad	Job-read	Branje opravil - samo zase - branje	t
00030000-56af-22fb-c603-e16b24cbeb12	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56af-22fb-f88b-fe97d3df6a93	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56af-22fb-8e12-06832251f594	Report-read	Report - branje	t
00030000-56af-22fb-931a-2122d0ade5dc	Report-write	Report - spreminjanje	t
00030000-56af-22fb-c69a-332c33f91b6c	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56af-22fb-90e8-b2781122a508	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56af-22fb-61fb-9b83398ae968	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56af-22fb-629c-d587e01f8774	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56af-22fb-8297-01f6b6cff64d	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56af-22fb-26d9-de130fea5b50	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56af-22fb-db8d-15326a802b2b	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56af-22fb-0c97-64928107c0e4	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56af-22fb-b985-f3a490012610	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56af-22fb-15a2-720c061fd3fc	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56af-22fb-cc7e-0f142c5299b0	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56af-22fb-b58a-31cad1476369	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56af-22fb-52a1-da9b5d0cc3ff	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56af-22fb-4367-c9d2faa956c0	Datoteka-write	Datoteka - spreminjanje	t
00030000-56af-22fb-92cd-1593a669d92c	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 42153536)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56af-22fc-55b3-ed421d45c530	00030000-56af-22fb-d1c4-dd888053001e
00020000-56af-22fc-55b3-ed421d45c530	00030000-56af-22fb-ef8f-5e5d11260d73
00020000-56af-22fc-a69f-de86c61543b4	00030000-56af-22fb-5604-1c5efb9e7c4b
00020000-56af-22fc-0e7f-1dc2f91d8f6a	00030000-56af-22fb-58a4-c2e5c20771c1
00020000-56af-22fc-0e7f-1dc2f91d8f6a	00030000-56af-22fb-b138-b2f64bc3a493
00020000-56af-22fc-0e7f-1dc2f91d8f6a	00030000-56af-22fb-4367-c9d2faa956c0
00020000-56af-22fc-0e7f-1dc2f91d8f6a	00030000-56af-22fb-a91a-3f13c8544727
00020000-56af-22fc-0e7f-1dc2f91d8f6a	00030000-56af-22fb-0c97-64928107c0e4
00020000-56af-22fc-0e7f-1dc2f91d8f6a	00030000-56af-22fb-15a2-720c061fd3fc
00020000-56af-22fc-0e7f-1dc2f91d8f6a	00030000-56af-22fb-9a12-3a6837a76a7b
00020000-56af-22fc-0e7f-1dc2f91d8f6a	00030000-56af-22fb-821d-b9004a4db058
00020000-56af-22fc-0e7f-1dc2f91d8f6a	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fc-0e7f-1dc2f91d8f6a	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-0e7f-1dc2f91d8f6a	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-0e7f-1dc2f91d8f6a	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fc-6e40-1966a97ab191	00030000-56af-22fb-9a12-3a6837a76a7b
00020000-56af-22fc-6e40-1966a97ab191	00030000-56af-22fb-821d-b9004a4db058
00020000-56af-22fc-6e40-1966a97ab191	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fc-6e40-1966a97ab191	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-6e40-1966a97ab191	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fc-6e40-1966a97ab191	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-1b1e-af6c1a211d6f	00030000-56af-22fb-a7a9-c00abf59993a
00020000-56af-22fc-1b1e-af6c1a211d6f	00030000-56af-22fb-3502-e9883b18e02c
00020000-56af-22fc-1b1e-af6c1a211d6f	00030000-56af-22fb-d1c8-959aac3ffce6
00020000-56af-22fc-1b1e-af6c1a211d6f	00030000-56af-22fb-8e50-51914764c55e
00020000-56af-22fc-1b1e-af6c1a211d6f	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-1b1e-af6c1a211d6f	00030000-56af-22fb-a91a-3f13c8544727
00020000-56af-22fc-1b1e-af6c1a211d6f	00030000-56af-22fb-7841-862250a7e450
00020000-56af-22fc-e594-6b75342896de	00030000-56af-22fb-a7a9-c00abf59993a
00020000-56af-22fc-e594-6b75342896de	00030000-56af-22fb-d1c8-959aac3ffce6
00020000-56af-22fc-e594-6b75342896de	00030000-56af-22fb-7841-862250a7e450
00020000-56af-22fc-68f8-76191becd046	00030000-56af-22fb-a91a-3f13c8544727
00020000-56af-22fc-68f8-76191becd046	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-68f8-76191becd046	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fc-68f8-76191becd046	00030000-56af-22fb-4367-c9d2faa956c0
00020000-56af-22fc-68f8-76191becd046	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fc-68f8-76191becd046	00030000-56af-22fb-15a2-720c061fd3fc
00020000-56af-22fc-68f8-76191becd046	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-68f8-76191becd046	00030000-56af-22fb-0c97-64928107c0e4
00020000-56af-22fc-466a-108c0e04f18e	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-466a-108c0e04f18e	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fc-466a-108c0e04f18e	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fc-466a-108c0e04f18e	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-dfd8-2a100b651bb1	00030000-56af-22fb-a91a-3f13c8544727
00020000-56af-22fc-dfd8-2a100b651bb1	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-dfd8-2a100b651bb1	00030000-56af-22fb-d1c8-959aac3ffce6
00020000-56af-22fc-dfd8-2a100b651bb1	00030000-56af-22fb-8e50-51914764c55e
00020000-56af-22fc-dfd8-2a100b651bb1	00030000-56af-22fb-013b-66e6996dcfe0
00020000-56af-22fc-dfd8-2a100b651bb1	00030000-56af-22fb-8242-e04d680088a4
00020000-56af-22fc-dfd8-2a100b651bb1	00030000-56af-22fb-8731-78728db382ba
00020000-56af-22fc-dfd8-2a100b651bb1	00030000-56af-22fb-574e-897fe9d2934a
00020000-56af-22fc-dfd8-2a100b651bb1	00030000-56af-22fb-3c84-5c403f26cd08
00020000-56af-22fc-dfd8-2a100b651bb1	00030000-56af-22fb-5e0c-48c387241476
00020000-56af-22fc-dfd8-2a100b651bb1	00030000-56af-22fb-5604-1c5efb9e7c4b
00020000-56af-22fc-dfd8-2a100b651bb1	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-4edb-7536358fb4bc	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-4edb-7536358fb4bc	00030000-56af-22fb-d1c8-959aac3ffce6
00020000-56af-22fc-4edb-7536358fb4bc	00030000-56af-22fb-013b-66e6996dcfe0
00020000-56af-22fc-4edb-7536358fb4bc	00030000-56af-22fb-8731-78728db382ba
00020000-56af-22fc-4edb-7536358fb4bc	00030000-56af-22fb-3c84-5c403f26cd08
00020000-56af-22fc-4edb-7536358fb4bc	00030000-56af-22fb-5604-1c5efb9e7c4b
00020000-56af-22fc-4edb-7536358fb4bc	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-3c84-5c403f26cd08
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-8731-78728db382ba
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-013b-66e6996dcfe0
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-8c05-aad6138df400
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-ec8d-7d925d2a405a
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-236d-4d48191b85e7
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-5e0c-48c387241476
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-574e-897fe9d2934a
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-0c97-64928107c0e4
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-8242-e04d680088a4
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-0570-c39e3bf23741
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-4367-c9d2faa956c0
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-15a2-720c061fd3fc
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-e748-714b6d2cd1c9
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-d18a-6acbfe87dc1f
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-5604-1c5efb9e7c4b
00020000-56af-22fc-2071-57393e6f2c3e	00030000-56af-22fb-848e-d32ca59ed6d4
00020000-56af-22fc-37f7-8c6ef6d28157	00030000-56af-22fb-3c84-5c403f26cd08
00020000-56af-22fc-37f7-8c6ef6d28157	00030000-56af-22fb-8731-78728db382ba
00020000-56af-22fc-37f7-8c6ef6d28157	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-37f7-8c6ef6d28157	00030000-56af-22fb-013b-66e6996dcfe0
00020000-56af-22fc-37f7-8c6ef6d28157	00030000-56af-22fb-8c05-aad6138df400
00020000-56af-22fc-37f7-8c6ef6d28157	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fc-37f7-8c6ef6d28157	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fc-37f7-8c6ef6d28157	00030000-56af-22fb-ec8d-7d925d2a405a
00020000-56af-22fc-37f7-8c6ef6d28157	00030000-56af-22fb-236d-4d48191b85e7
00020000-56af-22fc-37f7-8c6ef6d28157	00030000-56af-22fb-5604-1c5efb9e7c4b
00020000-56af-22fc-37f7-8c6ef6d28157	00030000-56af-22fb-848e-d32ca59ed6d4
00020000-56af-22fc-f147-80c700c89741	00030000-56af-22fb-848e-d32ca59ed6d4
00020000-56af-22fc-f147-80c700c89741	00030000-56af-22fb-891e-b0b568a07b17
00020000-56af-22fc-b7c4-3a91f543a4ed	00030000-56af-22fb-848e-d32ca59ed6d4
00020000-56af-22fc-2da1-4c317c49f315	00030000-56af-22fb-0670-c69fbf706952
00020000-56af-22fc-2da1-4c317c49f315	00030000-56af-22fb-8f28-7649357525c7
00020000-56af-22fc-06f3-6048fbc4e2f4	00030000-56af-22fb-0670-c69fbf706952
00020000-56af-22fc-4919-b92d222949ab	00030000-56af-22fb-5604-1c5efb9e7c4b
00020000-56af-22fc-4919-b92d222949ab	00030000-56af-22fb-dc91-0a31c84fe713
00020000-56af-22fc-bad2-6c8deb0ea6e6	00030000-56af-22fb-5604-1c5efb9e7c4b
00020000-56af-22fc-4d47-ccb658c0f603	00030000-56af-22fb-38ac-43aeb9af10fd
00020000-56af-22fc-4d47-ccb658c0f603	00030000-56af-22fb-d23b-9f7b74a5f3bb
00020000-56af-22fc-80a5-c4249ae9f140	00030000-56af-22fb-38ac-43aeb9af10fd
00020000-56af-22fc-b7f3-b199f618ad2a	00030000-56af-22fb-0614-9fc365613194
00020000-56af-22fc-b7f3-b199f618ad2a	00030000-56af-22fb-1ba8-4f505e2ba8da
00020000-56af-22fc-ec2a-7db77a0f1fd2	00030000-56af-22fb-0614-9fc365613194
00020000-56af-22fc-9014-9f14aa9ded53	00030000-56af-22fb-a4c2-7e876e9435f2
00020000-56af-22fc-9014-9f14aa9ded53	00030000-56af-22fb-890e-b3e2326ccbda
00020000-56af-22fc-8ef5-46dc6df0dce9	00030000-56af-22fb-a4c2-7e876e9435f2
00020000-56af-22fc-c66c-967e90353bd7	00030000-56af-22fb-8379-c6ac71dda95b
00020000-56af-22fc-c66c-967e90353bd7	00030000-56af-22fb-bad5-fd43e5d04cd1
00020000-56af-22fc-c66c-967e90353bd7	00030000-56af-22fb-8c05-aad6138df400
00020000-56af-22fc-c66c-967e90353bd7	00030000-56af-22fb-8731-78728db382ba
00020000-56af-22fc-c66c-967e90353bd7	00030000-56af-22fb-574e-897fe9d2934a
00020000-56af-22fc-c66c-967e90353bd7	00030000-56af-22fb-5604-1c5efb9e7c4b
00020000-56af-22fc-72d0-fef44d2713fc	00030000-56af-22fb-8379-c6ac71dda95b
00020000-56af-22fc-72d0-fef44d2713fc	00030000-56af-22fb-8c05-aad6138df400
00020000-56af-22fc-72d0-fef44d2713fc	00030000-56af-22fb-8731-78728db382ba
00020000-56af-22fc-c932-a89475c0f557	00030000-56af-22fb-bfd6-ab3a6e58929f
00020000-56af-22fc-c932-a89475c0f557	00030000-56af-22fb-2012-3a3501844fdc
00020000-56af-22fc-7f14-f3459782ebe7	00030000-56af-22fb-bfd6-ab3a6e58929f
00020000-56af-22fc-f987-5b9ab58bef80	00030000-56af-22fb-04d9-248b02420445
00020000-56af-22fc-f987-5b9ab58bef80	00030000-56af-22fb-7841-862250a7e450
00020000-56af-22fc-f987-5b9ab58bef80	00030000-56af-22fb-a7a9-c00abf59993a
00020000-56af-22fc-f987-5b9ab58bef80	00030000-56af-22fb-4367-c9d2faa956c0
00020000-56af-22fc-f987-5b9ab58bef80	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fc-f987-5b9ab58bef80	00030000-56af-22fb-0c97-64928107c0e4
00020000-56af-22fc-f987-5b9ab58bef80	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-f987-5b9ab58bef80	00030000-56af-22fb-15a2-720c061fd3fc
00020000-56af-22fc-f987-5b9ab58bef80	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fc-da5b-711f38475807	00030000-56af-22fb-7841-862250a7e450
00020000-56af-22fc-da5b-711f38475807	00030000-56af-22fb-a7a9-c00abf59993a
00020000-56af-22fc-da5b-711f38475807	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fc-da5b-711f38475807	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-da5b-711f38475807	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fc-084f-eb7b85f6b8e3	00030000-56af-22fb-2e96-d92aaf100364
00020000-56af-22fc-084f-eb7b85f6b8e3	00030000-56af-22fb-8e7b-64acac12783b
00020000-56af-22fc-8569-ba4ea961dca2	00030000-56af-22fb-2e96-d92aaf100364
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-ca4d-6736da7feeb1
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-0640-5d7217aeee6c
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-a354-890e53680ea6
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-5a0c-4834dd76155a
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-eec7-66f1e0ae44fb
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-d8f4-be60fa2d436f
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-9dd7-e93feb54cb1d
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-3950-57ee2d1190a9
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-d366-f94199d1b607
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-f2ad-0939dd57d8ea
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-9e96-ff7874cb80a0
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-010e-ed50a45ee356
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-cdc9-38276d54e632
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-7932-9793aeed11e6
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-8da0-a47eab02df1a
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-92e3-a6f20aba7028
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-93b7-bd6e13b3e774
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-1327-a609a7bd568a
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-bdc7-d114bb5bfe4e
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-18c6-5faa31a06828
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-40bf-d4456beaa8d0
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-5ca6-fc73de175a36
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-1f24-22e1ae5d3c77
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-de0f-aa388b42ae76
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-8f76-01fb93d28df3
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-c603-e16b24cbeb12
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-1612-28ab6bc9fb13
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-db5a-b2a6cd476a45
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-236d-4d48191b85e7
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-d676-723203ba643d
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-bfd6-ab3a6e58929f
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-0498-5763ec0dee92
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-150a-c03cd58145c9
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-2d1e-cd5067aa136c
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-b423-58b6392def68
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-febb-903eebcfd55b
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-cc0e-8624c9620ddd
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-5604-1c5efb9e7c4b
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-8c05-aad6138df400
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-4367-c9d2faa956c0
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-0c97-64928107c0e4
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-15a2-720c061fd3fc
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-f534-adc09311c2ad
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-7cec-728a59646b68	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fc-d927-1d4156cedcf7	00030000-56af-22fb-a354-890e53680ea6
00020000-56af-22fc-d927-1d4156cedcf7	00030000-56af-22fb-eec7-66f1e0ae44fb
00020000-56af-22fc-d927-1d4156cedcf7	00030000-56af-22fb-9dd7-e93feb54cb1d
00020000-56af-22fc-d927-1d4156cedcf7	00030000-56af-22fb-d366-f94199d1b607
00020000-56af-22fc-d927-1d4156cedcf7	00030000-56af-22fb-9e96-ff7874cb80a0
00020000-56af-22fc-d927-1d4156cedcf7	00030000-56af-22fb-cdc9-38276d54e632
00020000-56af-22fc-d927-1d4156cedcf7	00030000-56af-22fb-8da0-a47eab02df1a
00020000-56af-22fc-d927-1d4156cedcf7	00030000-56af-22fb-93b7-bd6e13b3e774
00020000-56af-22fc-d927-1d4156cedcf7	00030000-56af-22fb-bdc7-d114bb5bfe4e
00020000-56af-22fc-d927-1d4156cedcf7	00030000-56af-22fb-40bf-d4456beaa8d0
00020000-56af-22fc-d927-1d4156cedcf7	00030000-56af-22fb-db5a-b2a6cd476a45
00020000-56af-22fc-d927-1d4156cedcf7	00030000-56af-22fb-1612-28ab6bc9fb13
00020000-56af-22fc-d927-1d4156cedcf7	00030000-56af-22fb-d676-723203ba643d
00020000-56af-22fc-d927-1d4156cedcf7	00030000-56af-22fb-5604-1c5efb9e7c4b
00020000-56af-22fc-d927-1d4156cedcf7	00030000-56af-22fb-f534-adc09311c2ad
00020000-56af-22fc-d927-1d4156cedcf7	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fc-d927-1d4156cedcf7	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-d927-1d4156cedcf7	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fc-6ddc-a4cc30cf8d1e	00030000-56af-22fb-0498-5763ec0dee92
00020000-56af-22fc-6ddc-a4cc30cf8d1e	00030000-56af-22fb-4a25-4463e1cbdd57
00020000-56af-22fc-6ddc-a4cc30cf8d1e	00030000-56af-22fb-b423-58b6392def68
00020000-56af-22fc-6ddc-a4cc30cf8d1e	00030000-56af-22fb-564b-497f79774d10
00020000-56af-22fc-6ddc-a4cc30cf8d1e	00030000-56af-22fb-2b57-62cfafe6257e
00020000-56af-22fc-6ddc-a4cc30cf8d1e	00030000-56af-22fb-821d-b9004a4db058
00020000-56af-22fc-6ddc-a4cc30cf8d1e	00030000-56af-22fb-2d1e-cd5067aa136c
00020000-56af-22fc-6ddc-a4cc30cf8d1e	00030000-56af-22fb-edc5-76b21085ff71
00020000-56af-22fc-6ddc-a4cc30cf8d1e	00030000-56af-22fb-7c79-12d4157d534d
00020000-56af-22fc-6ddc-a4cc30cf8d1e	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-6ddc-a4cc30cf8d1e	00030000-56af-22fb-236d-4d48191b85e7
00020000-56af-22fc-6ddc-a4cc30cf8d1e	00030000-56af-22fb-febb-903eebcfd55b
00020000-56af-22fc-6ddc-a4cc30cf8d1e	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fc-6ddc-a4cc30cf8d1e	00030000-56af-22fb-4367-c9d2faa956c0
00020000-56af-22fc-6ddc-a4cc30cf8d1e	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-6ddc-a4cc30cf8d1e	00030000-56af-22fb-0c97-64928107c0e4
00020000-56af-22fc-6ddc-a4cc30cf8d1e	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fc-6ddc-a4cc30cf8d1e	00030000-56af-22fb-15a2-720c061fd3fc
00020000-56af-22fc-acaf-66297d3cbc07	00030000-56af-22fb-0498-5763ec0dee92
00020000-56af-22fc-acaf-66297d3cbc07	00030000-56af-22fb-b423-58b6392def68
00020000-56af-22fc-acaf-66297d3cbc07	00030000-56af-22fb-821d-b9004a4db058
00020000-56af-22fc-acaf-66297d3cbc07	00030000-56af-22fb-2d1e-cd5067aa136c
00020000-56af-22fc-acaf-66297d3cbc07	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-acaf-66297d3cbc07	00030000-56af-22fb-236d-4d48191b85e7
00020000-56af-22fc-acaf-66297d3cbc07	00030000-56af-22fb-febb-903eebcfd55b
00020000-56af-22fc-acaf-66297d3cbc07	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fc-acaf-66297d3cbc07	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-acaf-66297d3cbc07	00030000-56af-22fb-0c97-64928107c0e4
00020000-56af-22fc-acaf-66297d3cbc07	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fc-f970-b1532a8b7725	00030000-56af-22fb-b423-58b6392def68
00020000-56af-22fc-f970-b1532a8b7725	00030000-56af-22fb-564b-497f79774d10
00020000-56af-22fc-f970-b1532a8b7725	00030000-56af-22fb-2d1e-cd5067aa136c
00020000-56af-22fc-f970-b1532a8b7725	00030000-56af-22fb-edc5-76b21085ff71
00020000-56af-22fc-f970-b1532a8b7725	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-f970-b1532a8b7725	00030000-56af-22fb-febb-903eebcfd55b
00020000-56af-22fc-f970-b1532a8b7725	00030000-56af-22fb-0498-5763ec0dee92
00020000-56af-22fc-f970-b1532a8b7725	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-921b-53d89749af38	00030000-56af-22fb-b423-58b6392def68
00020000-56af-22fc-921b-53d89749af38	00030000-56af-22fb-564b-497f79774d10
00020000-56af-22fc-921b-53d89749af38	00030000-56af-22fb-2b57-62cfafe6257e
00020000-56af-22fc-921b-53d89749af38	00030000-56af-22fb-2d1e-cd5067aa136c
00020000-56af-22fc-921b-53d89749af38	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-921b-53d89749af38	00030000-56af-22fb-d1c8-959aac3ffce6
00020000-56af-22fc-921b-53d89749af38	00030000-56af-22fb-8e50-51914764c55e
00020000-56af-22fc-921b-53d89749af38	00030000-56af-22fb-cc0e-8624c9620ddd
00020000-56af-22fc-921b-53d89749af38	00030000-56af-22fb-c975-b551c51edaf2
00020000-56af-22fc-921b-53d89749af38	00030000-56af-22fb-8c05-aad6138df400
00020000-56af-22fc-921b-53d89749af38	00030000-56af-22fb-236d-4d48191b85e7
00020000-56af-22fc-921b-53d89749af38	00030000-56af-22fb-150a-c03cd58145c9
00020000-56af-22fc-921b-53d89749af38	00030000-56af-22fb-9d57-2a08651711e5
00020000-56af-22fc-921b-53d89749af38	00030000-56af-22fb-febb-903eebcfd55b
00020000-56af-22fc-921b-53d89749af38	00030000-56af-22fb-013b-66e6996dcfe0
00020000-56af-22fc-921b-53d89749af38	00030000-56af-22fb-0498-5763ec0dee92
00020000-56af-22fc-921b-53d89749af38	00030000-56af-22fb-a7a9-c00abf59993a
00020000-56af-22fc-0ce5-beb562d58b95	00030000-56af-22fb-b423-58b6392def68
00020000-56af-22fc-0ce5-beb562d58b95	00030000-56af-22fb-2d1e-cd5067aa136c
00020000-56af-22fc-0ce5-beb562d58b95	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-0ce5-beb562d58b95	00030000-56af-22fb-d1c8-959aac3ffce6
00020000-56af-22fc-0ce5-beb562d58b95	00030000-56af-22fb-cc0e-8624c9620ddd
00020000-56af-22fc-0ce5-beb562d58b95	00030000-56af-22fb-8c05-aad6138df400
00020000-56af-22fc-0ce5-beb562d58b95	00030000-56af-22fb-236d-4d48191b85e7
00020000-56af-22fc-0ce5-beb562d58b95	00030000-56af-22fb-150a-c03cd58145c9
00020000-56af-22fc-0ce5-beb562d58b95	00030000-56af-22fb-febb-903eebcfd55b
00020000-56af-22fc-0ce5-beb562d58b95	00030000-56af-22fb-013b-66e6996dcfe0
00020000-56af-22fc-0ce5-beb562d58b95	00030000-56af-22fb-0498-5763ec0dee92
00020000-56af-22fc-0ce5-beb562d58b95	00030000-56af-22fb-a7a9-c00abf59993a
00020000-56af-22fc-d113-fa5673059b8d	00030000-56af-22fb-150a-c03cd58145c9
00020000-56af-22fc-d113-fa5673059b8d	00030000-56af-22fb-0498-5763ec0dee92
00020000-56af-22fc-d113-fa5673059b8d	00030000-56af-22fb-2d1e-cd5067aa136c
00020000-56af-22fc-d113-fa5673059b8d	00030000-56af-22fb-cc0e-8624c9620ddd
00020000-56af-22fc-d113-fa5673059b8d	00030000-56af-22fb-236d-4d48191b85e7
00020000-56af-22fc-d113-fa5673059b8d	00030000-56af-22fb-febb-903eebcfd55b
00020000-56af-22fc-d113-fa5673059b8d	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-2445-3b0c85a6d644	00030000-56af-22fb-150a-c03cd58145c9
00020000-56af-22fc-2445-3b0c85a6d644	00030000-56af-22fb-9d57-2a08651711e5
00020000-56af-22fc-2445-3b0c85a6d644	00030000-56af-22fb-0498-5763ec0dee92
00020000-56af-22fc-2445-3b0c85a6d644	00030000-56af-22fb-8c05-aad6138df400
00020000-56af-22fc-0000-b2531d52b07e	00030000-56af-22fb-150a-c03cd58145c9
00020000-56af-22fc-0000-b2531d52b07e	00030000-56af-22fb-0498-5763ec0dee92
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-a4c2-7e876e9435f2
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-b423-58b6392def68
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-564b-497f79774d10
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-2b57-62cfafe6257e
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-9a12-3a6837a76a7b
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-58a4-c2e5c20771c1
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-821d-b9004a4db058
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-b138-b2f64bc3a493
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-4367-c9d2faa956c0
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-1612-28ab6bc9fb13
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-de0f-aa388b42ae76
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-5604-1c5efb9e7c4b
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-2d1e-cd5067aa136c
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-edc5-76b21085ff71
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-7c79-12d4157d534d
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-f534-adc09311c2ad
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-c603-e16b24cbeb12
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-ec8d-7d925d2a405a
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-7841-862250a7e450
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-a91a-3f13c8544727
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-d1c8-959aac3ffce6
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-8e50-51914764c55e
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-cc0e-8624c9620ddd
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-c975-b551c51edaf2
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-8c05-aad6138df400
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-0670-c69fbf706952
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-d676-723203ba643d
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-8f76-01fb93d28df3
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-8731-78728db382ba
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-db5a-b2a6cd476a45
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-1f24-22e1ae5d3c77
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-236d-4d48191b85e7
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-ca4d-6736da7feeb1
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-a354-890e53680ea6
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-0640-5d7217aeee6c
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-5a0c-4834dd76155a
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-eec7-66f1e0ae44fb
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-d8f4-be60fa2d436f
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-9dd7-e93feb54cb1d
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-3950-57ee2d1190a9
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-d366-f94199d1b607
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-f2ad-0939dd57d8ea
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-9e96-ff7874cb80a0
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-010e-ed50a45ee356
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-cdc9-38276d54e632
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-7932-9793aeed11e6
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-8da0-a47eab02df1a
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-92e3-a6f20aba7028
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-93b7-bd6e13b3e774
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-1327-a609a7bd568a
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-bdc7-d114bb5bfe4e
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-18c6-5faa31a06828
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-40bf-d4456beaa8d0
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-5ca6-fc73de175a36
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-8379-c6ac71dda95b
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-150a-c03cd58145c9
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-9d57-2a08651711e5
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-3c84-5c403f26cd08
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-febb-903eebcfd55b
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-848e-d32ca59ed6d4
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-2e96-d92aaf100364
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-013b-66e6996dcfe0
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-0498-5763ec0dee92
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-4a25-4463e1cbdd57
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-bfd6-ab3a6e58929f
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-15a2-720c061fd3fc
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-0c97-64928107c0e4
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-a7a9-c00abf59993a
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-0614-9fc365613194
00020000-56af-22fc-b2a6-d64492174986	00030000-56af-22fb-38ac-43aeb9af10fd
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-a4c2-7e876e9435f2
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-b423-58b6392def68
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-9a12-3a6837a76a7b
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-58a4-c2e5c20771c1
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-821d-b9004a4db058
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-b138-b2f64bc3a493
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-4367-c9d2faa956c0
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-5604-1c5efb9e7c4b
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-2d1e-cd5067aa136c
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-ec8d-7d925d2a405a
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-7841-862250a7e450
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-a91a-3f13c8544727
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-d1c8-959aac3ffce6
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-8c05-aad6138df400
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-0670-c69fbf706952
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-8731-78728db382ba
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-236d-4d48191b85e7
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-8379-c6ac71dda95b
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-3c84-5c403f26cd08
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-febb-903eebcfd55b
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-848e-d32ca59ed6d4
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-2e96-d92aaf100364
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-013b-66e6996dcfe0
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-0498-5763ec0dee92
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-bfd6-ab3a6e58929f
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-15a2-720c061fd3fc
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-0c97-64928107c0e4
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-a7a9-c00abf59993a
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-0614-9fc365613194
00020000-56af-22fc-f281-0fa73fe5e1a2	00030000-56af-22fb-38ac-43aeb9af10fd
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-a4c2-7e876e9435f2
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-b423-58b6392def68
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-564b-497f79774d10
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-2b57-62cfafe6257e
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-9a12-3a6837a76a7b
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-58a4-c2e5c20771c1
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-821d-b9004a4db058
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-b138-b2f64bc3a493
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-4367-c9d2faa956c0
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-5604-1c5efb9e7c4b
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-2d1e-cd5067aa136c
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-edc5-76b21085ff71
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-7c79-12d4157d534d
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-ec8d-7d925d2a405a
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-7841-862250a7e450
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-a91a-3f13c8544727
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-d1c8-959aac3ffce6
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-8c05-aad6138df400
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-0670-c69fbf706952
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-8731-78728db382ba
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-236d-4d48191b85e7
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-8379-c6ac71dda95b
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-3c84-5c403f26cd08
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-febb-903eebcfd55b
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-848e-d32ca59ed6d4
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-2e96-d92aaf100364
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-013b-66e6996dcfe0
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-0498-5763ec0dee92
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-4a25-4463e1cbdd57
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-bfd6-ab3a6e58929f
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-15a2-720c061fd3fc
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-0c97-64928107c0e4
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-a7a9-c00abf59993a
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-0614-9fc365613194
00020000-56af-22fc-6bdc-8752527e2816	00030000-56af-22fb-38ac-43aeb9af10fd
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-b423-58b6392def68
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-564b-497f79774d10
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-2b57-62cfafe6257e
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-9a12-3a6837a76a7b
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-58a4-c2e5c20771c1
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-821d-b9004a4db058
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-b138-b2f64bc3a493
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-4367-c9d2faa956c0
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-1612-28ab6bc9fb13
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-de0f-aa388b42ae76
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-5604-1c5efb9e7c4b
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-2d1e-cd5067aa136c
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-edc5-76b21085ff71
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-7c79-12d4157d534d
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-f534-adc09311c2ad
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-c603-e16b24cbeb12
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-ec8d-7d925d2a405a
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-e748-714b6d2cd1c9
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-7841-862250a7e450
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-a91a-3f13c8544727
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-d1c8-959aac3ffce6
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-8e50-51914764c55e
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-cc0e-8624c9620ddd
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-c975-b551c51edaf2
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-8c05-aad6138df400
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-0570-c39e3bf23741
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-0670-c69fbf706952
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-d676-723203ba643d
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-8f76-01fb93d28df3
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-8731-78728db382ba
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-574e-897fe9d2934a
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-db5a-b2a6cd476a45
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-1f24-22e1ae5d3c77
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-236d-4d48191b85e7
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-d18a-6acbfe87dc1f
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-ca4d-6736da7feeb1
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-a354-890e53680ea6
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-0640-5d7217aeee6c
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-5a0c-4834dd76155a
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-eec7-66f1e0ae44fb
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-d8f4-be60fa2d436f
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-9dd7-e93feb54cb1d
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-3950-57ee2d1190a9
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-d366-f94199d1b607
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-f2ad-0939dd57d8ea
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-9e96-ff7874cb80a0
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-010e-ed50a45ee356
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-cdc9-38276d54e632
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-7932-9793aeed11e6
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-8da0-a47eab02df1a
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-92e3-a6f20aba7028
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-93b7-bd6e13b3e774
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-1327-a609a7bd568a
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-bdc7-d114bb5bfe4e
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-18c6-5faa31a06828
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-40bf-d4456beaa8d0
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-5ca6-fc73de175a36
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-8379-c6ac71dda95b
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-150a-c03cd58145c9
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-9d57-2a08651711e5
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-3c84-5c403f26cd08
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-5e0c-48c387241476
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-febb-903eebcfd55b
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-848e-d32ca59ed6d4
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-013b-66e6996dcfe0
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-8242-e04d680088a4
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-0498-5763ec0dee92
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-4a25-4463e1cbdd57
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-bfd6-ab3a6e58929f
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-15a2-720c061fd3fc
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-0c97-64928107c0e4
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-a7a9-c00abf59993a
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-3502-e9883b18e02c
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-0614-9fc365613194
00020000-56af-22fc-625b-da0b8012d9ab	00030000-56af-22fb-38ac-43aeb9af10fd
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-a4c2-7e876e9435f2
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-b423-58b6392def68
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-564b-497f79774d10
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-2b57-62cfafe6257e
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-9a12-3a6837a76a7b
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-58a4-c2e5c20771c1
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-821d-b9004a4db058
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-b138-b2f64bc3a493
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-4367-c9d2faa956c0
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-5604-1c5efb9e7c4b
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-2d1e-cd5067aa136c
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-edc5-76b21085ff71
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-7c79-12d4157d534d
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-ec8d-7d925d2a405a
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-e748-714b6d2cd1c9
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-7841-862250a7e450
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-a91a-3f13c8544727
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-d1c8-959aac3ffce6
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-8e50-51914764c55e
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-cc0e-8624c9620ddd
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-8c05-aad6138df400
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-0570-c39e3bf23741
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-0670-c69fbf706952
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-8731-78728db382ba
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-574e-897fe9d2934a
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-236d-4d48191b85e7
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-d18a-6acbfe87dc1f
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-8379-c6ac71dda95b
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-150a-c03cd58145c9
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-3c84-5c403f26cd08
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-5e0c-48c387241476
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-febb-903eebcfd55b
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-848e-d32ca59ed6d4
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-2e96-d92aaf100364
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-013b-66e6996dcfe0
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-8242-e04d680088a4
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-0498-5763ec0dee92
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-4a25-4463e1cbdd57
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-bfd6-ab3a6e58929f
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-15a2-720c061fd3fc
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-0c97-64928107c0e4
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-a7a9-c00abf59993a
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-3502-e9883b18e02c
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-0614-9fc365613194
00020000-56af-22fc-a2b4-17be079e0839	00030000-56af-22fb-38ac-43aeb9af10fd
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-a4c2-7e876e9435f2
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-b423-58b6392def68
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-564b-497f79774d10
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-9a12-3a6837a76a7b
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-821d-b9004a4db058
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-5604-1c5efb9e7c4b
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-2d1e-cd5067aa136c
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-edc5-76b21085ff71
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-ec8d-7d925d2a405a
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-7841-862250a7e450
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-d1c8-959aac3ffce6
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-cc0e-8624c9620ddd
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-8c05-aad6138df400
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-0670-c69fbf706952
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-8731-78728db382ba
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-236d-4d48191b85e7
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-8379-c6ac71dda95b
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-150a-c03cd58145c9
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-3c84-5c403f26cd08
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-febb-903eebcfd55b
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-848e-d32ca59ed6d4
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-2e96-d92aaf100364
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-013b-66e6996dcfe0
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-0498-5763ec0dee92
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-bfd6-ab3a6e58929f
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-a7a9-c00abf59993a
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-0614-9fc365613194
00020000-56af-22fc-9500-4e7c84ad2542	00030000-56af-22fb-38ac-43aeb9af10fd
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-a4c2-7e876e9435f2
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-b423-58b6392def68
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-564b-497f79774d10
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-2b57-62cfafe6257e
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-821d-b9004a4db058
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-4367-c9d2faa956c0
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-1612-28ab6bc9fb13
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-de0f-aa388b42ae76
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-5604-1c5efb9e7c4b
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-2d1e-cd5067aa136c
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-f534-adc09311c2ad
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-c603-e16b24cbeb12
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-ec8d-7d925d2a405a
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-e748-714b6d2cd1c9
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-7841-862250a7e450
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-04d9-248b02420445
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-a91a-3f13c8544727
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-d1c8-959aac3ffce6
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-8e50-51914764c55e
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-cc0e-8624c9620ddd
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-c975-b551c51edaf2
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-8c05-aad6138df400
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-0570-c39e3bf23741
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-0670-c69fbf706952
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-d676-723203ba643d
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-8f76-01fb93d28df3
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-8731-78728db382ba
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-574e-897fe9d2934a
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-db5a-b2a6cd476a45
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-1f24-22e1ae5d3c77
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-236d-4d48191b85e7
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-d18a-6acbfe87dc1f
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-ca4d-6736da7feeb1
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-a354-890e53680ea6
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-0640-5d7217aeee6c
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-5a0c-4834dd76155a
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-eec7-66f1e0ae44fb
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-d8f4-be60fa2d436f
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-9dd7-e93feb54cb1d
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-3950-57ee2d1190a9
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-d366-f94199d1b607
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-f2ad-0939dd57d8ea
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-9e96-ff7874cb80a0
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-010e-ed50a45ee356
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-cdc9-38276d54e632
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-7932-9793aeed11e6
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-8da0-a47eab02df1a
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-92e3-a6f20aba7028
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-93b7-bd6e13b3e774
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-1327-a609a7bd568a
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-bdc7-d114bb5bfe4e
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-18c6-5faa31a06828
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-40bf-d4456beaa8d0
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-5ca6-fc73de175a36
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-8379-c6ac71dda95b
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-150a-c03cd58145c9
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-9d57-2a08651711e5
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-3c84-5c403f26cd08
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-5e0c-48c387241476
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-febb-903eebcfd55b
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-848e-d32ca59ed6d4
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-2e96-d92aaf100364
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-013b-66e6996dcfe0
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-8242-e04d680088a4
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-0498-5763ec0dee92
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-bfd6-ab3a6e58929f
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-2012-3a3501844fdc
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-15a2-720c061fd3fc
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-0c97-64928107c0e4
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-a7a9-c00abf59993a
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-3502-e9883b18e02c
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-0614-9fc365613194
00020000-56af-22fc-f39f-21534f25c434	00030000-56af-22fb-38ac-43aeb9af10fd
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-ef8f-5e5d11260d73
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-d1c4-dd888053001e
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-a4c2-7e876e9435f2
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-890e-b3e2326ccbda
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-b423-58b6392def68
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-2b57-62cfafe6257e
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-564b-497f79774d10
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-1828-2b982dca50e0
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-fd9a-d6a64a573bcf
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-6d49-c13a3775914b
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-7d7e-020f2acd30aa
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-9a12-3a6837a76a7b
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-58a4-c2e5c20771c1
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-821d-b9004a4db058
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-b138-b2f64bc3a493
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-4367-c9d2faa956c0
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-e185-45a9df288e32
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-0dab-68409c41f311
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-fd93-3e078d2544c0
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-3976-318ab1cc95df
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-4f29-10755891539a
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-efac-3f5fef1caeb3
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-7a4d-acd9044dacf4
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-693e-1efec9d4c57c
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-5d3b-225924626588
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-1612-28ab6bc9fb13
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-de0f-aa388b42ae76
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-5604-1c5efb9e7c4b
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-dc91-0a31c84fe713
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-a1fd-bfed9604c2bf
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-863d-50c794cb78e7
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-2d1e-cd5067aa136c
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-7c79-12d4157d534d
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-edc5-76b21085ff71
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-2b71-1abc2a8a3e81
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-7644-4b55564a3452
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-f88b-fe97d3df6a93
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-f534-adc09311c2ad
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-c603-e16b24cbeb12
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-ec8d-7d925d2a405a
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-e748-714b6d2cd1c9
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-50f9-9508a855089e
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-fc05-56430d204737
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-db8d-15326a802b2b
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-26d9-de130fea5b50
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-90e8-b2781122a508
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-61fb-9b83398ae968
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-629c-d587e01f8774
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-8297-01f6b6cff64d
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-2db7-50a7d64109ee
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-479a-fef7097821a3
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-449c-c7ae8e7dc2db
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-e110-41c3c6f537fe
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-048d-4cf1084f1c78
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-56c5-1b1531e8e91f
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-c65a-1d86ba5741c4
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-7841-862250a7e450
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-04d9-248b02420445
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-a91a-3f13c8544727
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-d1c8-959aac3ffce6
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-8e50-51914764c55e
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-3b35-fc8d646ed38d
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-f391-954b8e159297
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-7d9f-36a555f38a00
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-f5c7-f29cb244bf8e
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-cc0e-8624c9620ddd
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-c975-b551c51edaf2
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-8c05-aad6138df400
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-0570-c39e3bf23741
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-0670-c69fbf706952
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-d676-723203ba643d
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-8f76-01fb93d28df3
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-9741-b0f12ec6df6d
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-6595-b9be4bae73cf
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-8f28-7649357525c7
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-8731-78728db382ba
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-574e-897fe9d2934a
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-41a5-3e413ba056d9
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-cb60-46f3debe486c
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-2bd2-c357e238b83c
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-d4e1-f665f7019be9
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-27c3-3affe7f2f975
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-b114-704689feb94e
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-db5a-b2a6cd476a45
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-1f24-22e1ae5d3c77
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-236d-4d48191b85e7
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-d18a-6acbfe87dc1f
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-ca4d-6736da7feeb1
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-a354-890e53680ea6
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-0640-5d7217aeee6c
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-5a0c-4834dd76155a
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-eec7-66f1e0ae44fb
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-d8f4-be60fa2d436f
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-9dd7-e93feb54cb1d
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-3950-57ee2d1190a9
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-d366-f94199d1b607
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-f2ad-0939dd57d8ea
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-9e96-ff7874cb80a0
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-010e-ed50a45ee356
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-cdc9-38276d54e632
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-7932-9793aeed11e6
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-8da0-a47eab02df1a
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-92e3-a6f20aba7028
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-93b7-bd6e13b3e774
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-1327-a609a7bd568a
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-bdc7-d114bb5bfe4e
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-18c6-5faa31a06828
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-40bf-d4456beaa8d0
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-5ca6-fc73de175a36
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-8379-c6ac71dda95b
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-bad5-fd43e5d04cd1
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-6091-55fde44505d7
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-81f9-36ba83bec862
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-e2a6-6e10f2674336
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-581a-998fc58e733f
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-3b48-9ea8c6487e3b
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-de42-c0f5b9bba998
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-f8e2-6cefb9c098fe
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-08b7-4ba7f3f344d5
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-8e12-06832251f594
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-931a-2122d0ade5dc
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-7f94-d8749f582a1e
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-c7e6-078a3e1f9888
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-5818-50ca2f085081
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-91d0-3f0a78e20750
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-9d4c-fa40d7af8489
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-5373-6f187adf526d
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-f3fd-08fb6be05f54
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-dbcf-de46b844be66
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-0c3c-ee02e62f9ad4
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-a78e-c9a964173536
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-c69a-332c33f91b6c
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-150a-c03cd58145c9
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-9d57-2a08651711e5
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-3c84-5c403f26cd08
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-5e0c-48c387241476
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-ad1e-51622e26386b
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-ae77-97c1fd7a5d55
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-2c08-12d349a9f73a
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-febb-903eebcfd55b
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-6e2f-150c14826e60
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-848e-d32ca59ed6d4
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-891e-b0b568a07b17
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-116f-160fc6dbad8a
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-0374-287e0d8bf639
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-2e96-d92aaf100364
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-8e7b-64acac12783b
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-013b-66e6996dcfe0
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-8242-e04d680088a4
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-0498-5763ec0dee92
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-4a25-4463e1cbdd57
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-8a1b-55851b1adebf
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-5229-7a263caf245b
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-f15e-9535dcf48c88
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-13a4-6243e14fa76a
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-bfd6-ab3a6e58929f
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-2012-3a3501844fdc
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-52a1-da9b5d0cc3ff
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-b58a-31cad1476369
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-15a2-720c061fd3fc
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-0c97-64928107c0e4
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-a7a9-c00abf59993a
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-3502-e9883b18e02c
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-0614-9fc365613194
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-1ba8-4f505e2ba8da
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-38ac-43aeb9af10fd
00020000-56af-22fe-9f1c-94e47935dac4	00030000-56af-22fb-d23b-9f7b74a5f3bb
00020000-56af-22fe-8cfe-17334956af12	00030000-56af-22fb-cc7e-0f142c5299b0
00020000-56af-22fe-ee6a-be6c25ca9f55	00030000-56af-22fb-15a2-720c061fd3fc
00020000-56af-22fe-ca0b-4082b0d8d4d0	00030000-56af-22fb-4a25-4463e1cbdd57
00020000-56af-22fe-311f-7c91333972c9	00030000-56af-22fb-0498-5763ec0dee92
00020000-56af-22fe-0b5f-26f86268bb8b	00030000-56af-22fb-61fb-9b83398ae968
00020000-56af-22fe-b8be-37fce11136f9	00030000-56af-22fb-629c-d587e01f8774
00020000-56af-22fe-16f5-0b60ba1131b5	00030000-56af-22fb-8297-01f6b6cff64d
00020000-56af-22fe-844f-6a0be1da257d	00030000-56af-22fb-90e8-b2781122a508
00020000-56af-22fe-9f18-4f377e8981ba	00030000-56af-22fb-db8d-15326a802b2b
00020000-56af-22fe-c43d-ebe82b701e30	00030000-56af-22fb-26d9-de130fea5b50
00020000-56af-22fe-104b-7b6ad58fe072	00030000-56af-22fb-b985-f3a490012610
00020000-56af-22fe-3f18-af17d0bf4555	00030000-56af-22fb-0c97-64928107c0e4
00020000-56af-22fe-1291-0661d9de1e63	00030000-56af-22fb-a107-3ce5b9a94d79
00020000-56af-22fe-b3a3-831bf7537847	00030000-56af-22fb-a91a-3f13c8544727
00020000-56af-22fe-b2fc-56f74f06d1c0	00030000-56af-22fb-8e50-51914764c55e
00020000-56af-22fe-2438-7755fd43aa43	00030000-56af-22fb-d1c8-959aac3ffce6
00020000-56af-22fe-5a90-1c732a53d86e	00030000-56af-22fb-4367-c9d2faa956c0
00020000-56af-22fe-befd-0642a54188cb	00030000-56af-22fb-92cd-1593a669d92c
00020000-56af-22fe-4b9c-ff92932d7953	00030000-56af-22fb-8c05-aad6138df400
00020000-56af-22fe-4b9c-ff92932d7953	00030000-56af-22fb-0570-c39e3bf23741
00020000-56af-22fe-4b9c-ff92932d7953	00030000-56af-22fb-0498-5763ec0dee92
00020000-56af-22fe-7c4b-aa32c304af7a	00030000-56af-22fb-013b-66e6996dcfe0
00020000-56af-22fe-6c3a-9eefa912fb4d	00030000-56af-22fb-8242-e04d680088a4
00020000-56af-22fe-5b17-f5e647def0fa	00030000-56af-22fb-c69a-332c33f91b6c
00020000-56af-22fe-9fc7-2caf48a4afeb	00030000-56af-22fb-3c84-5c403f26cd08
00020000-56af-22fe-67b9-7a1ffdcfca7f	00030000-56af-22fb-5e0c-48c387241476
00020000-56af-22fe-c504-9737539c59b2	00030000-56af-22fb-8731-78728db382ba
00020000-56af-22fe-5beb-655716142e6e	00030000-56af-22fb-574e-897fe9d2934a
00020000-56af-22fe-2d34-fe32060725c2	00030000-56af-22fb-a7a9-c00abf59993a
00020000-56af-22fe-ec1e-ba1400e1b2d3	00030000-56af-22fb-3502-e9883b18e02c
00020000-56af-22fe-2511-8908c05ad6b7	00030000-56af-22fb-cc0e-8624c9620ddd
00020000-56af-22fe-7b65-cbd353aadf08	00030000-56af-22fb-c975-b551c51edaf2
00020000-56af-22fe-bf28-64292e9b199d	00030000-56af-22fb-150a-c03cd58145c9
00020000-56af-22fe-41f3-6e4ec9426a43	00030000-56af-22fb-9d57-2a08651711e5
00020000-56af-22fe-3fc0-c671dfbb18d6	00030000-56af-22fb-b423-58b6392def68
00020000-56af-22fe-56e7-1a151125ffb6	00030000-56af-22fb-564b-497f79774d10
00020000-56af-22fe-bafe-ae0da87b060f	00030000-56af-22fb-2b57-62cfafe6257e
00020000-56af-22fe-1ef6-32b1a038d02b	00030000-56af-22fb-2d1e-cd5067aa136c
00020000-56af-22fe-682d-a4761388e5e0	00030000-56af-22fb-edc5-76b21085ff71
00020000-56af-22fe-30eb-bed79ee3badd	00030000-56af-22fb-7c79-12d4157d534d
\.


--
-- TOC entry 3181 (class 0 OID 42153937)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 42153972)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 42154105)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56af-22fe-3fd3-773f99ce5308	00090000-56af-22fe-ae5a-547949bc39da	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56af-22fe-33a0-aed73e7f17b0	00090000-56af-22fe-0ff1-ef9670b21992	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56af-22fe-9ccb-71c2829aa4b5	00090000-56af-22fe-3102-d4cc02d75e19	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56af-22fe-8358-69614da633a6	00090000-56af-22fe-df3b-8fb35e79b22e	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 42153620)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56af-22fe-6e7b-8de151ee036e	\N	00040000-56af-22fb-a623-f036b807b02f	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-22fe-8512-2ef1b0debb8a	\N	00040000-56af-22fb-a623-f036b807b02f	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56af-22fe-9c4c-005306448e8e	\N	00040000-56af-22fb-a623-f036b807b02f	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-22fe-7db8-11f405ccbf51	\N	00040000-56af-22fb-a623-f036b807b02f	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-22fe-3e68-464b159e3f6a	\N	00040000-56af-22fb-a623-f036b807b02f	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-22fe-f3ba-8dd060504fb3	\N	00040000-56af-22fb-b2ae-d0c1bdd9afa8	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-22fe-96af-4b238e18661e	\N	00040000-56af-22fb-6b49-b930aaf0fe9c	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-22fe-6faa-6821687c02cc	\N	00040000-56af-22fb-3f4a-fbc26c7213ff	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-22fe-5698-f5098d94a911	\N	00040000-56af-22fb-5567-da6ef6080590	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56af-2300-e8ad-40383cc9400e	\N	00040000-56af-22fb-a623-f036b807b02f	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 42153665)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56af-22fa-c2be-0b0088b65a48	8341	Adlešiči
00050000-56af-22fa-dd60-d6297b5659b7	5270	Ajdovščina
00050000-56af-22fa-274b-579a67f4d21f	6280	Ankaran/Ancarano
00050000-56af-22fa-6225-e79ce3c30404	9253	Apače
00050000-56af-22fa-0c7b-95c6e0c71575	8253	Artiče
00050000-56af-22fa-eb83-43ee152613e7	4275	Begunje na Gorenjskem
00050000-56af-22fa-28a4-227dbff7e026	1382	Begunje pri Cerknici
00050000-56af-22fa-0ebb-ffe27ec76813	9231	Beltinci
00050000-56af-22fa-fb2b-f0a1d61a7abc	2234	Benedikt
00050000-56af-22fa-f6ce-2fc8998fbf71	2345	Bistrica ob Dravi
00050000-56af-22fa-549f-4a75d3582db4	3256	Bistrica ob Sotli
00050000-56af-22fa-e7b0-6ffb34854ec8	8259	Bizeljsko
00050000-56af-22fa-8798-cc9923a081d8	1223	Blagovica
00050000-56af-22fa-f8af-52736c9de4c3	8283	Blanca
00050000-56af-22fa-1524-5007570269be	4260	Bled
00050000-56af-22fa-c2f9-1da244c83311	4273	Blejska Dobrava
00050000-56af-22fa-f53e-6c8c8a78897e	9265	Bodonci
00050000-56af-22fa-0949-ace824bbb8f5	9222	Bogojina
00050000-56af-22fa-9128-9f3da375502b	4263	Bohinjska Bela
00050000-56af-22fa-599a-f41ba7623e5f	4264	Bohinjska Bistrica
00050000-56af-22fa-e22e-6ec13b93b1a9	4265	Bohinjsko jezero
00050000-56af-22fa-e7b5-64f0c3077df9	1353	Borovnica
00050000-56af-22fa-ec9c-1daf43d7dce1	8294	Boštanj
00050000-56af-22fa-404e-1c2a2a860bfb	5230	Bovec
00050000-56af-22fa-a382-11373adb4b6e	5295	Branik
00050000-56af-22fa-ae82-b2ec8428a48b	3314	Braslovče
00050000-56af-22fa-e7f5-42bf00c69aca	5223	Breginj
00050000-56af-22fa-6218-79c3bea298f2	8280	Brestanica
00050000-56af-22fa-fe1a-b5fd03b6ff6f	2354	Bresternica
00050000-56af-22fa-db39-6abc253b2d2e	4243	Brezje
00050000-56af-22fa-c619-8b9cff2fa26c	1351	Brezovica pri Ljubljani
00050000-56af-22fa-3709-6552f5773a7e	8250	Brežice
00050000-56af-22fa-fe7a-5c8d0ab82323	4210	Brnik - Aerodrom
00050000-56af-22fa-bb37-88cfe5cd9217	8321	Brusnice
00050000-56af-22fa-ab4e-c66c48530e17	3255	Buče
00050000-56af-22fa-7bc6-ffd735dac6ab	8276	Bučka 
00050000-56af-22fa-54ac-31b732c2e63d	9261	Cankova
00050000-56af-22fa-f0ff-7df0284063e5	3000	Celje 
00050000-56af-22fa-3f42-f9028d19c183	3001	Celje - poštni predali
00050000-56af-22fa-cd79-dbe75582591e	4207	Cerklje na Gorenjskem
00050000-56af-22fa-fbc1-648be4d59096	8263	Cerklje ob Krki
00050000-56af-22fa-3a26-d1a4faca2220	1380	Cerknica
00050000-56af-22fa-9cb3-613cca4fe625	5282	Cerkno
00050000-56af-22fa-839e-d3103b137d18	2236	Cerkvenjak
00050000-56af-22fa-51c0-5cb0bcf4158b	2215	Ceršak
00050000-56af-22fa-8112-84504af5d8a5	2326	Cirkovce
00050000-56af-22fa-9b35-1cfafbd35022	2282	Cirkulane
00050000-56af-22fa-fbdd-bccad222d35b	5273	Col
00050000-56af-22fa-d7db-f566bac84c24	8251	Čatež ob Savi
00050000-56af-22fa-8142-777f342fa316	1413	Čemšenik
00050000-56af-22fa-6260-7c50438ecc06	5253	Čepovan
00050000-56af-22fa-f6b9-18685ced5d42	9232	Črenšovci
00050000-56af-22fa-9201-fd88f42d3482	2393	Črna na Koroškem
00050000-56af-22fa-bb5d-9f0acfb34389	6275	Črni Kal
00050000-56af-22fa-1d96-1912d155ccf4	5274	Črni Vrh nad Idrijo
00050000-56af-22fa-5699-972c58245585	5262	Črniče
00050000-56af-22fa-631f-e776ebc545e3	8340	Črnomelj
00050000-56af-22fa-1a41-fe6880ba05c9	6271	Dekani
00050000-56af-22fa-61e3-25000abd923e	5210	Deskle
00050000-56af-22fa-c44a-78e3cf31c8b3	2253	Destrnik
00050000-56af-22fa-af3a-d9575a8f9d43	6215	Divača
00050000-56af-22fa-cab9-df325a88fa40	1233	Dob
00050000-56af-22fa-f900-b731545c9745	3224	Dobje pri Planini
00050000-56af-22fa-e656-db5f1848c7ec	8257	Dobova
00050000-56af-22fa-95ef-9f93d0000678	1423	Dobovec
00050000-56af-22fa-16cf-eb46166dbb2b	5263	Dobravlje
00050000-56af-22fa-930c-17c5cc04d8be	3204	Dobrna
00050000-56af-22fa-30f4-7a6bdf4fdd6b	8211	Dobrnič
00050000-56af-22fa-9020-5e4ab4a3b522	1356	Dobrova
00050000-56af-22fa-303b-911ba8dc1306	9223	Dobrovnik/Dobronak 
00050000-56af-22fa-d0b7-93ccb07209e6	5212	Dobrovo v Brdih
00050000-56af-22fa-4f4f-7eee248cc652	1431	Dol pri Hrastniku
00050000-56af-22fa-d46f-e4dd08c722c7	1262	Dol pri Ljubljani
00050000-56af-22fa-09ff-6680fb3aaf5e	1273	Dole pri Litiji
00050000-56af-22fa-9e11-54f8b6c4f2c3	1331	Dolenja vas
00050000-56af-22fa-7dbf-fca43fea9eeb	8350	Dolenjske Toplice
00050000-56af-22fa-b5ec-f01a3f4d8bc9	1230	Domžale
00050000-56af-22fa-7f91-c9deb2e83155	2252	Dornava
00050000-56af-22fa-780f-a749ff64443c	5294	Dornberk
00050000-56af-22fa-16ac-765220afdc1f	1319	Draga
00050000-56af-22fa-c8ae-ba9657434823	8343	Dragatuš
00050000-56af-22fa-c1df-416ec282c508	3222	Dramlje
00050000-56af-22fa-3fd1-96067bc20944	2370	Dravograd
00050000-56af-22fa-1ac1-4ad2af5f7ef1	4203	Duplje
00050000-56af-22fa-5354-f751da066851	6221	Dutovlje
00050000-56af-22fa-ee62-9ea9998e590f	8361	Dvor
00050000-56af-22fa-234e-c8b5d6756e47	2343	Fala
00050000-56af-22fa-cdcb-933e1e5be8c2	9208	Fokovci
00050000-56af-22fa-f20d-bdf5af187676	2313	Fram
00050000-56af-22fa-ff24-0e21c48b1328	3213	Frankolovo
00050000-56af-22fa-e58e-57e3898d9a2c	1274	Gabrovka
00050000-56af-22fa-be37-99f68537db8e	8254	Globoko
00050000-56af-22fa-f024-563893dc14e1	5275	Godovič
00050000-56af-22fa-3952-6860a1b286a4	4204	Golnik
00050000-56af-22fa-9874-8cc271d305f2	3303	Gomilsko
00050000-56af-22fa-abf1-34b3819f08fe	4224	Gorenja vas
00050000-56af-22fa-2df1-822fcf7aca9b	3263	Gorica pri Slivnici
00050000-56af-22fa-e1f8-232da6cc5de8	2272	Gorišnica
00050000-56af-22fa-e664-a7116403ecf3	9250	Gornja Radgona
00050000-56af-22fa-8341-4140806011bb	3342	Gornji Grad
00050000-56af-22fa-475b-08b369fca383	4282	Gozd Martuljek
00050000-56af-22fa-3a83-e499c2b569bc	6272	Gračišče
00050000-56af-22fa-1616-87665cc79a9a	9264	Grad
00050000-56af-22fa-4050-8c2a42013d25	8332	Gradac
00050000-56af-22fa-9e83-b25a0d5da784	1384	Grahovo
00050000-56af-22fa-c5d7-188db686a8a8	5242	Grahovo ob Bači
00050000-56af-22fa-bb4a-395294a7f503	5251	Grgar
00050000-56af-22fa-f364-b440dcb18feb	3302	Griže
00050000-56af-22fa-a628-1b2cc8766c8c	3231	Grobelno
00050000-56af-22fa-a901-921998ce084a	1290	Grosuplje
00050000-56af-22fa-5e62-e20c60ae95ec	2288	Hajdina
00050000-56af-22fa-b340-7d0a78fdd483	8362	Hinje
00050000-56af-22fa-7892-5b5f6a655a01	2311	Hoče
00050000-56af-22fa-d258-7f848665bba2	9205	Hodoš/Hodos
00050000-56af-22fa-38c7-8fd2c0ecda1e	1354	Horjul
00050000-56af-22fa-aec4-fecf7d3c766a	1372	Hotedršica
00050000-56af-22fa-5d03-4bf0558bdbbd	1430	Hrastnik
00050000-56af-22fa-2965-f6dfc8f34338	6225	Hruševje
00050000-56af-22fa-7838-4674a00df37d	4276	Hrušica
00050000-56af-22fa-2688-991d6ce110ea	5280	Idrija
00050000-56af-22fa-ddd9-897083f855d6	1292	Ig
00050000-56af-22fa-bc95-4e8d521e0252	6250	Ilirska Bistrica
00050000-56af-22fa-a0a5-f37f972891ec	6251	Ilirska Bistrica-Trnovo
00050000-56af-22fa-e69a-934a84de56f4	1295	Ivančna Gorica
00050000-56af-22fa-a0cd-6c2886b410fc	2259	Ivanjkovci
00050000-56af-22fa-d099-2e174558dca2	1411	Izlake
00050000-56af-22fa-fa36-7ecb79f8c6bc	6310	Izola/Isola
00050000-56af-22fa-7bae-b1ce3cbc2a64	2222	Jakobski Dol
00050000-56af-22fa-ee9e-ddfbdf2029f6	2221	Jarenina
00050000-56af-22fa-5fd9-e10ea9c86bb2	6254	Jelšane
00050000-56af-22fa-aec1-d5c9a172c5ea	4270	Jesenice
00050000-56af-22fa-abba-f82266a82431	8261	Jesenice na Dolenjskem
00050000-56af-22fa-0e5f-91950f260488	3273	Jurklošter
00050000-56af-22fa-268f-f81994fb9ec0	2223	Jurovski Dol
00050000-56af-22fa-bfed-dba5dd93f444	2256	Juršinci
00050000-56af-22fa-175c-0162f589bb70	5214	Kal nad Kanalom
00050000-56af-22fa-192b-d62dfcb16a89	3233	Kalobje
00050000-56af-22fa-850d-a09713534ea3	4246	Kamna Gorica
00050000-56af-22fa-ae11-301324af413d	2351	Kamnica
00050000-56af-22fa-8e38-85ea9f9d26d7	1241	Kamnik
00050000-56af-22fa-d8e7-2a9c663ca041	5213	Kanal
00050000-56af-22fa-0ee9-c7b46ff99a1c	8258	Kapele
00050000-56af-22fa-be82-04b9f599794b	2362	Kapla
00050000-56af-22fa-fbd6-75a0991a4c0a	2325	Kidričevo
00050000-56af-22fa-1c62-a355ce6ad8ed	1412	Kisovec
00050000-56af-22fa-0d8e-b4188c7689e5	6253	Knežak
00050000-56af-22fa-8fcc-73a00d36fca8	5222	Kobarid
00050000-56af-22fa-7bba-3d1f3c0ed80d	9227	Kobilje
00050000-56af-22fa-f3e3-3870447ea5df	1330	Kočevje
00050000-56af-22fa-8aaa-1e6b0616e76a	1338	Kočevska Reka
00050000-56af-22fa-47f4-88a9df646367	2276	Kog
00050000-56af-22fa-11c5-89676d422249	5211	Kojsko
00050000-56af-22fa-7c22-6d9339845c7f	6223	Komen
00050000-56af-22fa-6053-6a59b45ea4b0	1218	Komenda
00050000-56af-22fa-684e-0cb3df154c75	6000	Koper/Capodistria 
00050000-56af-22fa-025e-3271419db2e3	6001	Koper/Capodistria - poštni predali
00050000-56af-22fa-8a19-5bfb233e4938	8282	Koprivnica
00050000-56af-22fa-da68-a92a38d6f137	5296	Kostanjevica na Krasu
00050000-56af-22fa-2c80-99f480e48fa0	8311	Kostanjevica na Krki
00050000-56af-22fa-7bea-e84b53616ef2	1336	Kostel
00050000-56af-22fa-a218-e1518d22027d	6256	Košana
00050000-56af-22fa-8c2a-e70e068ae2d8	2394	Kotlje
00050000-56af-22fa-d428-7b18e7585384	6240	Kozina
00050000-56af-22fa-c05c-50f1f024d9f8	3260	Kozje
00050000-56af-22fa-2e19-b46ced73695c	4000	Kranj 
00050000-56af-22fa-30f2-5bd5ae4bf623	4001	Kranj - poštni predali
00050000-56af-22fa-a03d-e75583eb04eb	4280	Kranjska Gora
00050000-56af-22fa-3f44-a1b319a19f87	1281	Kresnice
00050000-56af-22fa-988b-ee3e9a3b1ff4	4294	Križe
00050000-56af-22fa-8c1e-2a658e333c43	9206	Križevci
00050000-56af-22fb-0e18-efe3409eb3c1	9242	Križevci pri Ljutomeru
00050000-56af-22fb-cc96-b0c5b608a341	1301	Krka
00050000-56af-22fb-94e5-0caaa6e27525	8296	Krmelj
00050000-56af-22fb-008e-f08a33f139ef	4245	Kropa
00050000-56af-22fb-b67b-ea4f1cce72bc	8262	Krška vas
00050000-56af-22fb-fe6c-a57c63752444	8270	Krško
00050000-56af-22fb-d8cd-0db411b63ebe	9263	Kuzma
00050000-56af-22fb-14f7-388c7ed58e72	2318	Laporje
00050000-56af-22fb-c9bd-6bf30bfa6ff9	3270	Laško
00050000-56af-22fb-5cc5-42525b4cd825	1219	Laze v Tuhinju
00050000-56af-22fb-2a5b-43c1cd775cd1	2230	Lenart v Slovenskih goricah
00050000-56af-22fb-eb73-ba72258365d3	9220	Lendava/Lendva
00050000-56af-22fb-69de-e79bbc301fb4	4248	Lesce
00050000-56af-22fb-f1cf-655b259f0449	3261	Lesično
00050000-56af-22fb-5fae-fa8b3a8b19d8	8273	Leskovec pri Krškem
00050000-56af-22fb-a8bf-a716c0f329dc	2372	Libeliče
00050000-56af-22fb-062e-670fffbb0ec8	2341	Limbuš
00050000-56af-22fb-3069-1e5edb00a40a	1270	Litija
00050000-56af-22fb-7852-5e6de6429a9a	3202	Ljubečna
00050000-56af-22fb-00d4-8b3de3742e7f	1000	Ljubljana 
00050000-56af-22fb-054c-55d937b6f25c	1001	Ljubljana - poštni predali
00050000-56af-22fb-c353-cb7485cca540	1231	Ljubljana - Črnuče
00050000-56af-22fb-70b8-9b566906bcae	1261	Ljubljana - Dobrunje
00050000-56af-22fb-a962-6a729848315a	1260	Ljubljana - Polje
00050000-56af-22fb-a0c1-5fe7f6fa0d12	1210	Ljubljana - Šentvid
00050000-56af-22fb-e12a-ca552d69b3ce	1211	Ljubljana - Šmartno
00050000-56af-22fb-774f-a405e0458f62	3333	Ljubno ob Savinji
00050000-56af-22fb-7d13-2bc9940a9882	9240	Ljutomer
00050000-56af-22fb-003d-821949377d57	3215	Loče
00050000-56af-22fb-5fa1-97cce8d3d470	5231	Log pod Mangartom
00050000-56af-22fb-a288-0e7422c7ab32	1358	Log pri Brezovici
00050000-56af-22fb-67c3-1244648ce957	1370	Logatec
00050000-56af-22fb-39fe-60562cc9befa	1371	Logatec
00050000-56af-22fb-f3ff-f3933fde1275	1434	Loka pri Zidanem Mostu
00050000-56af-22fb-aa6d-73802c83e531	3223	Loka pri Žusmu
00050000-56af-22fb-77b1-7bc14549ed1b	6219	Lokev
00050000-56af-22fb-a85b-33e825a04403	1318	Loški Potok
00050000-56af-22fb-a098-fe4ca036dc8a	2324	Lovrenc na Dravskem polju
00050000-56af-22fb-6e26-dd1b5e21b814	2344	Lovrenc na Pohorju
00050000-56af-22fb-fe18-98e45a8b0023	3334	Luče
00050000-56af-22fb-d0c8-be9533cb9be0	1225	Lukovica
00050000-56af-22fb-50c4-d79e4489a9f3	9202	Mačkovci
00050000-56af-22fb-933c-d792d8c3e5d7	2322	Majšperk
00050000-56af-22fb-4f60-4ad90d5fce9a	2321	Makole
00050000-56af-22fb-fe31-969122e69350	9243	Mala Nedelja
00050000-56af-22fb-21a2-5978bcea883f	2229	Malečnik
00050000-56af-22fb-6118-72181b4a2c02	6273	Marezige
00050000-56af-22fb-dedc-988aefae4e48	2000	Maribor 
00050000-56af-22fb-102c-b8fe906ce97e	2001	Maribor - poštni predali
00050000-56af-22fb-100d-537ea0237be2	2206	Marjeta na Dravskem polju
00050000-56af-22fb-d974-44ff54fb30f9	2281	Markovci
00050000-56af-22fb-156b-f2cad74b440e	9221	Martjanci
00050000-56af-22fb-096d-cd3baeb92acc	6242	Materija
00050000-56af-22fb-07c9-00b2a5454422	4211	Mavčiče
00050000-56af-22fb-9d47-9ac3519eb138	1215	Medvode
00050000-56af-22fb-9075-0383e1be379b	1234	Mengeš
00050000-56af-22fb-fbc7-b3dc91cc4461	8330	Metlika
00050000-56af-22fb-aabd-e2956179209a	2392	Mežica
00050000-56af-22fb-4cbc-17834a5d71c8	2204	Miklavž na Dravskem polju
00050000-56af-22fb-ae7b-3a6c42a77a00	2275	Miklavž pri Ormožu
00050000-56af-22fb-863a-1cc1b994730b	5291	Miren
00050000-56af-22fb-b6a5-767859a45eaf	8233	Mirna
00050000-56af-22fb-18a4-ba3f824343f5	8216	Mirna Peč
00050000-56af-22fb-a72c-16606a5337e4	2382	Mislinja
00050000-56af-22fb-43b8-05a837267ebe	4281	Mojstrana
00050000-56af-22fb-4ef5-d9434af15afc	8230	Mokronog
00050000-56af-22fb-a4c5-67fa54e6e05b	1251	Moravče
00050000-56af-22fb-921c-154130c2e6cf	9226	Moravske Toplice
00050000-56af-22fb-89fb-1eb5f374030b	5216	Most na Soči
00050000-56af-22fb-865c-01c0b8b78965	1221	Motnik
00050000-56af-22fb-6203-c470f05335e4	3330	Mozirje
00050000-56af-22fb-59ee-4bfd15145189	9000	Murska Sobota 
00050000-56af-22fb-9fb5-61d12a1ba064	9001	Murska Sobota - poštni predali
00050000-56af-22fb-c985-a2516e519025	2366	Muta
00050000-56af-22fb-a5f8-9e7de252040e	4202	Naklo
00050000-56af-22fb-ba2c-e7003aa71d11	3331	Nazarje
00050000-56af-22fb-790c-b5dd3c242cb5	1357	Notranje Gorice
00050000-56af-22fb-4839-5e4ad0bdcfff	3203	Nova Cerkev
00050000-56af-22fb-516a-57433acda02f	5000	Nova Gorica 
00050000-56af-22fb-aa82-a1fdcad91a48	5001	Nova Gorica - poštni predali
00050000-56af-22fb-b361-6ebcda74f192	1385	Nova vas
00050000-56af-22fb-9247-f03dee87c10e	8000	Novo mesto
00050000-56af-22fb-4e30-4fceecf63700	8001	Novo mesto - poštni predali
00050000-56af-22fb-347a-d33b377bbe1d	6243	Obrov
00050000-56af-22fb-da2e-354f93e4b81d	9233	Odranci
00050000-56af-22fb-2925-375a137bca82	2317	Oplotnica
00050000-56af-22fb-5d38-439c4098267f	2312	Orehova vas
00050000-56af-22fb-92f0-e2173653fe40	2270	Ormož
00050000-56af-22fb-d3bc-577ecfbe4ab2	1316	Ortnek
00050000-56af-22fb-119f-1f46fded4e85	1337	Osilnica
00050000-56af-22fb-a3df-42361fd69918	8222	Otočec
00050000-56af-22fb-ac58-6a02014cd3c9	2361	Ožbalt
00050000-56af-22fb-8a6f-75a1868febe4	2231	Pernica
00050000-56af-22fb-f96e-87de4976fc1d	2211	Pesnica pri Mariboru
00050000-56af-22fb-aeac-ba828b55560d	9203	Petrovci
00050000-56af-22fb-3178-2da63a274ef4	3301	Petrovče
00050000-56af-22fb-0b84-adbc2e313894	6330	Piran/Pirano
00050000-56af-22fb-8775-63a929e9d50b	8255	Pišece
00050000-56af-22fb-5ba6-ca4b71d30521	6257	Pivka
00050000-56af-22fb-01ed-f9bb0335b641	6232	Planina
00050000-56af-22fb-5e17-e65f955a8a11	3225	Planina pri Sevnici
00050000-56af-22fb-e306-0206ac3549fb	6276	Pobegi
00050000-56af-22fb-30db-69d788096935	8312	Podbočje
00050000-56af-22fb-5b75-59951eb8400a	5243	Podbrdo
00050000-56af-22fb-d8f7-d9ef6ee358bc	3254	Podčetrtek
00050000-56af-22fb-f45b-92bb0911e323	2273	Podgorci
00050000-56af-22fb-a3fc-3fa6b10fd0f8	6216	Podgorje
00050000-56af-22fb-7c92-88bb45c8f54b	2381	Podgorje pri Slovenj Gradcu
00050000-56af-22fb-b411-07bdc5a75108	6244	Podgrad
00050000-56af-22fb-5a23-b9ea42a47c9a	1414	Podkum
00050000-56af-22fb-8195-9a6816f2b40f	2286	Podlehnik
00050000-56af-22fb-d197-f4b859a3f621	5272	Podnanos
00050000-56af-22fb-82a0-1f2fa4ddad0e	4244	Podnart
00050000-56af-22fb-8400-1960bd6065d6	3241	Podplat
00050000-56af-22fb-f9b9-b532934f5044	3257	Podsreda
00050000-56af-22fb-c860-553911d4cffa	2363	Podvelka
00050000-56af-22fb-8180-b90cb33fec46	2208	Pohorje
00050000-56af-22fb-b858-dd8f5c427438	2257	Polenšak
00050000-56af-22fb-ba82-ffcbd9afc275	1355	Polhov Gradec
00050000-56af-22fb-bf1f-843c4eddce37	4223	Poljane nad Škofjo Loko
00050000-56af-22fb-dbca-9c826d811edd	2319	Poljčane
00050000-56af-22fb-28e8-72b8279ae4c3	1272	Polšnik
00050000-56af-22fb-4b50-c391ca7709d9	3313	Polzela
00050000-56af-22fb-1d28-6563189e9a48	3232	Ponikva
00050000-56af-22fb-9311-260175811879	6320	Portorož/Portorose
00050000-56af-22fb-c64c-12b304acce2a	6230	Postojna
00050000-56af-22fb-10fe-7cd3b039ce1a	2331	Pragersko
00050000-56af-22fb-95de-716bbde80f9f	3312	Prebold
00050000-56af-22fb-65c3-aea3cefd85e1	4205	Preddvor
00050000-56af-22fb-5d95-cd3245a500be	6255	Prem
00050000-56af-22fb-b797-a5808fe11638	1352	Preserje
00050000-56af-22fb-90ad-2d43def31014	6258	Prestranek
00050000-56af-22fb-6b2d-37f0be3c5452	2391	Prevalje
00050000-56af-22fb-1bec-e01ab9075ee8	3262	Prevorje
00050000-56af-22fb-6d95-016d5c0aee21	1276	Primskovo 
00050000-56af-22fb-933c-b9aeb7b35bfd	3253	Pristava pri Mestinju
00050000-56af-22fb-664e-011f58892fe1	9207	Prosenjakovci/Partosfalva
00050000-56af-22fb-8461-370dcb01c798	5297	Prvačina
00050000-56af-22fb-85a0-ff64e6bead91	2250	Ptuj
00050000-56af-22fb-c849-d9733cb5798c	2323	Ptujska Gora
00050000-56af-22fb-866d-e425f951708e	9201	Puconci
00050000-56af-22fb-6d24-bf268f05509a	2327	Rače
00050000-56af-22fb-5d54-c58244148708	1433	Radeče
00050000-56af-22fb-913f-27502b6dc6e8	9252	Radenci
00050000-56af-22fb-715e-cc9f6845792b	2360	Radlje ob Dravi
00050000-56af-22fb-41d8-b28ee56a3315	1235	Radomlje
00050000-56af-22fb-4ad8-006dee906477	4240	Radovljica
00050000-56af-22fb-ea76-b71d5936c37f	8274	Raka
00050000-56af-22fb-2247-1d928c8951ab	1381	Rakek
00050000-56af-22fb-57fb-4457e2398f8e	4283	Rateče - Planica
00050000-56af-22fb-2874-a7ba1f967383	2390	Ravne na Koroškem
00050000-56af-22fb-a9a3-12acdc0662ab	9246	Razkrižje
00050000-56af-22fb-ad27-973a9901fe9d	3332	Rečica ob Savinji
00050000-56af-22fb-64cb-cf74b34bf647	5292	Renče
00050000-56af-22fb-55ff-8092a05dbbce	1310	Ribnica
00050000-56af-22fb-de24-0c442e89dca8	2364	Ribnica na Pohorju
00050000-56af-22fb-0617-2124615a3ab3	3272	Rimske Toplice
00050000-56af-22fb-c129-83ddc19316aa	1314	Rob
00050000-56af-22fb-9edf-e615eb7f965d	5215	Ročinj
00050000-56af-22fb-da10-e11f86534773	3250	Rogaška Slatina
00050000-56af-22fb-2c11-5a8e7a9bac36	9262	Rogašovci
00050000-56af-22fb-34af-ea7e02989759	3252	Rogatec
00050000-56af-22fb-fb47-a3351a08d93c	1373	Rovte
00050000-56af-22fb-9f5a-d979688d223a	2342	Ruše
00050000-56af-22fb-0f6a-c75fe5c594ef	1282	Sava
00050000-56af-22fb-2be9-6bdbc6643d3d	6333	Sečovlje/Sicciole
00050000-56af-22fb-3c6d-01fb5dc3ff53	4227	Selca
00050000-56af-22fb-38fa-4d4cda102d21	2352	Selnica ob Dravi
00050000-56af-22fb-73df-ec2e5df7fc6c	8333	Semič
00050000-56af-22fb-48d2-2d42f68f21a5	8281	Senovo
00050000-56af-22fb-2e7f-8bebeedaf0a6	6224	Senožeče
00050000-56af-22fb-d2a7-b9b6c54e50c7	8290	Sevnica
00050000-56af-22fb-4dcd-261ede69ddb2	6210	Sežana
00050000-56af-22fb-eac5-3918ba96fc60	2214	Sladki Vrh
00050000-56af-22fb-af5f-092f4f89e9a0	5283	Slap ob Idrijci
00050000-56af-22fb-2f9c-a131abf4f16e	2380	Slovenj Gradec
00050000-56af-22fb-7cd0-55793da1b019	2310	Slovenska Bistrica
00050000-56af-22fb-49ee-f76280177d47	3210	Slovenske Konjice
00050000-56af-22fb-3ee9-6533c6bb67e8	1216	Smlednik
00050000-56af-22fb-682a-eeef6276500e	5232	Soča
00050000-56af-22fb-8307-b84b28a3b3e1	1317	Sodražica
00050000-56af-22fb-f3a4-cc10aaafffe5	3335	Solčava
00050000-56af-22fb-9267-cdb59701d0cb	5250	Solkan
00050000-56af-22fb-34f4-330b13ce2950	4229	Sorica
00050000-56af-22fb-f3f3-363fc1de7f91	4225	Sovodenj
00050000-56af-22fb-881b-657a8ed64058	5281	Spodnja Idrija
00050000-56af-22fb-44b5-4d555ded6a45	2241	Spodnji Duplek
00050000-56af-22fb-17e0-5a791772a746	9245	Spodnji Ivanjci
00050000-56af-22fb-9890-09962cf68e68	2277	Središče ob Dravi
00050000-56af-22fb-6173-0b57b21b322f	4267	Srednja vas v Bohinju
00050000-56af-22fb-0e17-ca323cf2d8db	8256	Sromlje 
00050000-56af-22fb-c1e8-e01bd5b958c8	5224	Srpenica
00050000-56af-22fb-26b8-5f93c9ffe01a	1242	Stahovica
00050000-56af-22fb-bed5-877ed201941c	1332	Stara Cerkev
00050000-56af-22fb-3c81-fc91b82ca0b7	8342	Stari trg ob Kolpi
00050000-56af-22fb-8751-f979c766696a	1386	Stari trg pri Ložu
00050000-56af-22fb-526c-94ce177f903a	2205	Starše
00050000-56af-22fb-df09-18f0989d13d9	2289	Stoperce
00050000-56af-22fb-a2d1-afdeaa2691a8	8322	Stopiče
00050000-56af-22fb-192a-e1927f4ec684	3206	Stranice
00050000-56af-22fb-586b-c1b102753b19	8351	Straža
00050000-56af-22fb-f291-88c9460931f0	1313	Struge
00050000-56af-22fb-887f-43ef64387bcf	8293	Studenec
00050000-56af-22fb-e8e7-1a5f33a7dff4	8331	Suhor
00050000-56af-22fb-a64d-a14d1e4fb82b	2233	Sv. Ana v Slovenskih goricah
00050000-56af-22fb-bbf8-26e55590f52e	2235	Sv. Trojica v Slovenskih goricah
00050000-56af-22fb-0646-2b211fe89a5d	2353	Sveti Duh na Ostrem Vrhu
00050000-56af-22fb-5308-5e8e6c4ec154	9244	Sveti Jurij ob Ščavnici
00050000-56af-22fb-28d0-3d12b184f783	3264	Sveti Štefan
00050000-56af-22fb-0234-599e56b30abf	2258	Sveti Tomaž
00050000-56af-22fb-69ae-7313483856a8	9204	Šalovci
00050000-56af-22fb-6eda-99f0feea6b2f	5261	Šempas
00050000-56af-22fb-9abe-90aa13e4caa0	5290	Šempeter pri Gorici
00050000-56af-22fb-37ed-5bf305abe401	3311	Šempeter v Savinjski dolini
00050000-56af-22fb-733b-7533d3a75b62	4208	Šenčur
00050000-56af-22fb-2a42-39868ac437e6	2212	Šentilj v Slovenskih goricah
00050000-56af-22fb-e995-d7528f868499	8297	Šentjanž
00050000-56af-22fb-33ff-16afb6f21cfd	2373	Šentjanž pri Dravogradu
00050000-56af-22fb-1607-ce12cf358153	8310	Šentjernej
00050000-56af-22fb-bba1-3e8c689a38f8	3230	Šentjur
00050000-56af-22fb-379a-837bfa5d782b	3271	Šentrupert
00050000-56af-22fb-ec8e-b36ad9c5b662	8232	Šentrupert
00050000-56af-22fb-93c6-d3ccf551f552	1296	Šentvid pri Stični
00050000-56af-22fb-71af-4405abd8cb8c	8275	Škocjan
00050000-56af-22fb-6f13-fb991ee5e9c0	6281	Škofije
00050000-56af-22fb-4160-05f61871a4ee	4220	Škofja Loka
00050000-56af-22fb-0791-35aa37984c03	3211	Škofja vas
00050000-56af-22fb-c9a6-2d047752edef	1291	Škofljica
00050000-56af-22fb-f46d-c49788232844	6274	Šmarje
00050000-56af-22fb-5dee-998ab9a51d75	1293	Šmarje - Sap
00050000-56af-22fb-fabc-f1e5761ab45b	3240	Šmarje pri Jelšah
00050000-56af-22fb-1ee7-3e8fb30ceeca	8220	Šmarješke Toplice
00050000-56af-22fb-1ea9-e33d6ac54a47	2315	Šmartno na Pohorju
00050000-56af-22fb-5e98-f50d92eb7b23	3341	Šmartno ob Dreti
00050000-56af-22fb-0732-c601f7e2ffbb	3327	Šmartno ob Paki
00050000-56af-22fb-a52f-928591eca4f7	1275	Šmartno pri Litiji
00050000-56af-22fb-63bb-a10bed356c63	2383	Šmartno pri Slovenj Gradcu
00050000-56af-22fb-3c9e-f80cd9fddcf6	3201	Šmartno v Rožni dolini
00050000-56af-22fb-f815-974148cd5c94	3325	Šoštanj
00050000-56af-22fb-c1b4-da82ba5932d1	6222	Štanjel
00050000-56af-22fb-c0cf-68ad9b016626	3220	Štore
00050000-56af-22fb-a09e-a5e1f146b7b9	3304	Tabor
00050000-56af-22fb-7450-bf2e2ccfc615	3221	Teharje
00050000-56af-22fb-c106-852e90ddc2c8	9251	Tišina
00050000-56af-22fb-c0f8-19ecfdbdb92b	5220	Tolmin
00050000-56af-22fb-c103-96204a81136f	3326	Topolšica
00050000-56af-22fb-42e3-dff78beae398	2371	Trbonje
00050000-56af-22fb-206a-1cb0b867a01d	1420	Trbovlje
00050000-56af-22fb-892c-a4424c99dfb8	8231	Trebelno 
00050000-56af-22fb-a1b4-1c734597ce4e	8210	Trebnje
00050000-56af-22fb-3330-8626e07b5243	5252	Trnovo pri Gorici
00050000-56af-22fb-9556-fec80524b851	2254	Trnovska vas
00050000-56af-22fb-5447-c14447a2413a	1222	Trojane
00050000-56af-22fb-e901-a8cd1b24abf3	1236	Trzin
00050000-56af-22fb-1d48-4404f5d09f35	4290	Tržič
00050000-56af-22fb-ac00-3cd7892bdfff	8295	Tržišče
00050000-56af-22fb-c730-f83970af6812	1311	Turjak
00050000-56af-22fb-2727-07355a6004a7	9224	Turnišče
00050000-56af-22fb-b1f6-17546afdc7d2	8323	Uršna sela
00050000-56af-22fb-8e1f-2cceace0960a	1252	Vače
00050000-56af-22fb-0fc6-f149fa40dda2	3320	Velenje 
00050000-56af-22fb-7558-a53d1d9c17e5	3322	Velenje - poštni predali
00050000-56af-22fb-a4b0-87aa7df66b08	8212	Velika Loka
00050000-56af-22fb-af8e-bd670ec7beb3	2274	Velika Nedelja
00050000-56af-22fb-94c6-4cb96ef55362	9225	Velika Polana
00050000-56af-22fb-e4f1-f30f44442ad2	1315	Velike Lašče
00050000-56af-22fb-955e-59b61f569552	8213	Veliki Gaber
00050000-56af-22fb-d811-55a1a266606a	9241	Veržej
00050000-56af-22fb-b16b-ea414fbd160d	1312	Videm - Dobrepolje
00050000-56af-22fb-f7ae-664884c564c1	2284	Videm pri Ptuju
00050000-56af-22fb-0ee4-c5b68542b06c	8344	Vinica
00050000-56af-22fb-61ea-a55c03bb8fcc	5271	Vipava
00050000-56af-22fb-3551-b75a20d88747	4212	Visoko
00050000-56af-22fb-4ab8-c629d560bac9	1294	Višnja Gora
00050000-56af-22fb-5ab1-c20468ea096c	3205	Vitanje
00050000-56af-22fb-b3d2-d4f3e3ebc155	2255	Vitomarci
00050000-56af-22fb-0d8a-a3d7824ef30b	1217	Vodice
00050000-56af-22fb-71ee-6970ab2bc511	3212	Vojnik\t
00050000-56af-22fb-8ee9-bd8c8ca05fe6	5293	Volčja Draga
00050000-56af-22fb-e366-3f7ed2c9795b	2232	Voličina
00050000-56af-22fb-4503-178a74ed1be8	3305	Vransko
00050000-56af-22fb-fb3a-5b753ee56285	6217	Vremski Britof
00050000-56af-22fb-a45f-c1e9e83a9318	1360	Vrhnika
00050000-56af-22fb-a8e7-41acab883acc	2365	Vuhred
00050000-56af-22fb-35db-34f6cfe405dd	2367	Vuzenica
00050000-56af-22fb-9a76-1e1012970bf5	8292	Zabukovje 
00050000-56af-22fb-b881-5f18bc0d6315	1410	Zagorje ob Savi
00050000-56af-22fb-cdd5-5b664f9cf6a8	1303	Zagradec
00050000-56af-22fb-4f8a-6cde79634d35	2283	Zavrč
00050000-56af-22fb-66f0-92629671ba98	8272	Zdole 
00050000-56af-22fb-fb06-8d1ec2bd2e17	4201	Zgornja Besnica
00050000-56af-22fb-ddcd-4621bcceace2	2242	Zgornja Korena
00050000-56af-22fb-6258-596166f111f0	2201	Zgornja Kungota
00050000-56af-22fb-cdfd-3dcc2d60c4cd	2316	Zgornja Ložnica
00050000-56af-22fb-a68a-49db85576ec0	2314	Zgornja Polskava
00050000-56af-22fb-77c3-ff9e92d9972c	2213	Zgornja Velka
00050000-56af-22fb-05cf-72c9ed4051f2	4247	Zgornje Gorje
00050000-56af-22fb-7689-737c63baf6fc	4206	Zgornje Jezersko
00050000-56af-22fb-8ad0-2367fdb7b2e5	2285	Zgornji Leskovec
00050000-56af-22fb-80de-0c92a5045368	1432	Zidani Most
00050000-56af-22fb-88ea-ec6173d51ce3	3214	Zreče
00050000-56af-22fb-e118-76f671b1c6df	4209	Žabnica
00050000-56af-22fb-b30c-9c29cbeab314	3310	Žalec
00050000-56af-22fb-6ac8-fe2dd74ecc85	4228	Železniki
00050000-56af-22fb-8d8e-fc18e9d59e89	2287	Žetale
00050000-56af-22fb-f582-12da442bbba7	4226	Žiri
00050000-56af-22fb-5b09-6105a73e6946	4274	Žirovnica
00050000-56af-22fb-74ff-71c06160ef8a	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 42154342)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 42153912)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 42153650)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56af-22fe-d3e3-5c08409e0ae8	00080000-56af-22fe-6e7b-8de151ee036e	\N	00040000-56af-22fb-a623-f036b807b02f	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56af-22fe-9b48-32b00c3bdd05	00080000-56af-22fe-6e7b-8de151ee036e	\N	00040000-56af-22fb-a623-f036b807b02f	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56af-22fe-b3f0-2bf9e2272b4d	00080000-56af-22fe-8512-2ef1b0debb8a	\N	00040000-56af-22fb-a623-f036b807b02f	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 42153787)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56af-22fb-0b47-8321f6fc8934	novo leto	1	1	\N	t
00430000-56af-22fb-7980-e40f2cc21c57	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56af-22fb-e90c-7bf725837edf	dan upora proti okupatorju	27	4	\N	t
00430000-56af-22fb-5cca-df3a6e2f9c76	praznik dela	1	5	\N	t
00430000-56af-22fb-5103-9e177c1ecc69	praznik dela	2	5	\N	t
00430000-56af-22fb-f8b2-be19c945a31e	dan Primoža Trubarja	8	6	\N	f
00430000-56af-22fb-f6a1-3ca231a33a7c	dan državnosti	25	6	\N	t
00430000-56af-22fb-2d7b-43a9ed03bd1c	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56af-22fb-7a9c-81dcb1cd6826	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56af-22fb-4904-457db4e99bfc	dan suverenosti	25	10	\N	f
00430000-56af-22fb-0ea6-6fd38efd1efe	dan spomina na mrtve	1	11	\N	t
00430000-56af-22fb-35d5-4fc08f098b64	dan Rudolfa Maistra	23	11	\N	f
00430000-56af-22fb-eb23-5aac10f15958	božič	25	12	\N	t
00430000-56af-22fb-6923-ee0c8e3ef3cb	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56af-22fb-a85b-440450445a15	Marijino vnebovzetje	15	8	\N	t
00430000-56af-22fb-18ff-26e03f6c410e	dan reformacije	31	10	\N	t
00430000-56af-22fb-f729-c2e82161e0ac	velikonočna nedelja	27	3	2016	t
00430000-56af-22fb-0ad2-bf223a63cd20	velikonočna nedelja	16	4	2017	t
00430000-56af-22fb-ed71-40fb822d84de	velikonočna nedelja	1	4	2018	t
00430000-56af-22fb-011a-018202371294	velikonočna nedelja	21	4	2019	t
00430000-56af-22fb-4670-9cf39bd26c80	velikonočna nedelja	12	4	2020	t
00430000-56af-22fb-d5f3-f779002365d2	velikonočna nedelja	4	4	2021	t
00430000-56af-22fb-259c-232edfac1db0	velikonočna nedelja	17	4	2022	t
00430000-56af-22fb-f069-ebd14ba9f00e	velikonočna nedelja	9	4	2023	t
00430000-56af-22fb-5360-fd7020e2116e	velikonočna nedelja	31	3	2024	t
00430000-56af-22fb-1bac-54829b56eac4	velikonočna nedelja	20	4	2025	t
00430000-56af-22fb-a50f-687277cdf53c	velikonočna nedelja	5	4	2026	t
00430000-56af-22fb-35ce-b76bc70c7cfd	velikonočna nedelja	28	3	2027	t
00430000-56af-22fb-f394-bbe873e7a160	velikonočna nedelja	16	4	2028	t
00430000-56af-22fb-ab68-4af4488cf02d	velikonočna nedelja	1	4	2029	t
00430000-56af-22fb-d3d0-8a5caecefcf9	velikonočna nedelja	21	4	2030	t
00430000-56af-22fb-832d-aa4ea7a6cfd6	velikonočni ponedeljek	28	3	2016	t
00430000-56af-22fb-a5a3-5ce62c348e45	velikonočni ponedeljek	17	4	2017	t
00430000-56af-22fb-6ec7-1b301dbe246a	velikonočni ponedeljek	2	4	2018	t
00430000-56af-22fb-17ae-69c395eaf180	velikonočni ponedeljek	22	4	2019	t
00430000-56af-22fb-beb6-6cefd7bdff68	velikonočni ponedeljek	13	4	2020	t
00430000-56af-22fb-052d-1155ef967ee6	velikonočni ponedeljek	5	4	2021	t
00430000-56af-22fb-489c-a5f14992f13f	velikonočni ponedeljek	18	4	2022	t
00430000-56af-22fb-fb38-c9ed3f8b4073	velikonočni ponedeljek	10	4	2023	t
00430000-56af-22fb-2318-72decf0750c3	velikonočni ponedeljek	1	4	2024	t
00430000-56af-22fb-0ca4-46eef06df5ca	velikonočni ponedeljek	21	4	2025	t
00430000-56af-22fb-c9f5-7167f29360ca	velikonočni ponedeljek	6	4	2026	t
00430000-56af-22fb-eb0c-c79c69643ade	velikonočni ponedeljek	29	3	2027	t
00430000-56af-22fb-bdd0-99a9b340dd8f	velikonočni ponedeljek	17	4	2028	t
00430000-56af-22fb-db92-f44f42a03abd	velikonočni ponedeljek	2	4	2029	t
00430000-56af-22fb-190e-8ee18127c2a3	velikonočni ponedeljek	22	4	2030	t
00430000-56af-22fb-2395-045ffd7de9a0	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56af-22fb-974b-8980fe8e8f69	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56af-22fb-08b9-abaf2a3efd9c	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56af-22fb-5fa9-7d32e5643f04	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56af-22fb-83a3-81e0130551d0	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56af-22fb-9028-280a9b5c74dc	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56af-22fb-80da-a57f5d3413f8	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56af-22fb-d325-eb66e143608a	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56af-22fb-ba46-16cad16a333f	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56af-22fb-b927-be3c8a1c7886	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56af-22fb-70ce-06f588af000f	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56af-22fb-7298-5c2cb303de88	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56af-22fb-b7d2-cf0e07d9fea1	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56af-22fb-7563-c3b5660444d8	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56af-22fb-331c-45f82bf09aaa	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 42153756)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56af-22ff-a191-d733d5c4a1d1	000e0000-56af-22fe-c040-057868cf956f	1	3	1
001b0000-56af-22ff-fc26-0bc9e294f396	000e0000-56af-22fe-c040-057868cf956f	2	4	2
001b0000-56af-22ff-cda4-441c357c26de	000e0000-56af-22fe-c040-057868cf956f	4	5	3
001b0000-56af-22ff-0a20-da9cea3af747	000e0000-56af-22fe-c040-057868cf956f	\N	1	\N
001b0000-56af-22ff-4b3b-2d6700869f33	000e0000-56af-22fe-c040-057868cf956f	5	9	4
001b0000-56af-22ff-50be-5656316b12af	000e0000-56af-22fe-c040-057868cf956f	7	10	5
001b0000-56af-22ff-b410-bfbf93270870	000e0000-56af-22fe-4f27-6ba8f064af69	3	2	1
001b0000-56af-22ff-3043-6f68a24f1690	000e0000-56af-22fe-4f27-6ba8f064af69	4	3	1
001b0000-56af-22ff-83ee-6a48999a3b1c	000e0000-56af-22fe-c040-057868cf956f	\N	2	\N
001b0000-56af-22ff-f5e8-2516e833fd40	000e0000-56af-22fe-4f27-6ba8f064af69	\N	1	\N
001b0000-56af-22ff-9d84-ac769b4fb19d	000e0000-56af-22fe-c040-057868cf956f	3	8	3
001b0000-56af-22ff-b7aa-45bd6c3c7210	000e0000-56af-22fe-c040-057868cf956f	2	11	1
001b0000-56af-22ff-aa54-14f011612c35	000e0000-56af-22fe-4f27-6ba8f064af69	1	5	1
001b0000-56af-22ff-d043-332b2f6c0e49	000e0000-56af-22fe-4f27-6ba8f064af69	6	4	2
001b0000-56af-22ff-ed54-75650f7d30e2	000e0000-56af-22fe-c040-057868cf956f	1	6	1
001b0000-56af-22ff-e769-332f070c34b0	000e0000-56af-22fe-c040-057868cf956f	2	7	2
\.


--
-- TOC entry 3161 (class 0 OID 42153762)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56af-22ff-a191-d733d5c4a1d1	000a0000-56af-22fe-a2ec-827a7430cc83
001b0000-56af-22ff-a191-d733d5c4a1d1	000a0000-56af-22fe-de41-58a0f6273bd9
001b0000-56af-22ff-fc26-0bc9e294f396	000a0000-56af-22fe-de41-58a0f6273bd9
001b0000-56af-22ff-fc26-0bc9e294f396	000a0000-56af-22fe-e98e-f4952568921d
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 42153924)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 42154356)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 42154366)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56af-22fe-4ff4-c053cf8b63e8	00080000-56af-22fe-9c4c-005306448e8e	0987	AK
00190000-56af-22fe-d0b7-4c626fd2baa6	00080000-56af-22fe-8512-2ef1b0debb8a	0989	AK
00190000-56af-22fe-606a-00f1d95bc755	00080000-56af-22fe-7db8-11f405ccbf51	0986	AK
00190000-56af-22fe-f3fb-5d3f38995101	00080000-56af-22fe-f3ba-8dd060504fb3	0984	AK
00190000-56af-22fe-59d7-75afd83b11c8	00080000-56af-22fe-96af-4b238e18661e	0983	AK
00190000-56af-22fe-f3c8-8c925c1de04d	00080000-56af-22fe-6faa-6821687c02cc	0982	AK
00190000-56af-2300-0c79-8ec56a3c37f7	00080000-56af-2300-e8ad-40383cc9400e	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 42154255)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56af-22fe-664b-da7d434e36d5	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 42154374)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 42153952)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56af-22fe-d5f8-1e2c62d48906	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56af-22fe-4b06-13c37a7f2890	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56af-22fe-b0a1-f35d91c7e690	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56af-22fe-f765-b8e5db1ac60e	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56af-22fe-abdf-5af4e1d6e546	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56af-22fe-87ff-81afb62dbd36	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56af-22fe-4a3a-b99f31b0f72c	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 42153897)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 42153887)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 42154094)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 42154024)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 42153730)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 42153488)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56af-2300-e8ad-40383cc9400e	00010000-56af-22fc-fc57-5d333fe9dcb7	2016-02-01 10:18:56	INS	a:0:{}
2	App\\Entity\\Option	00000000-56af-2300-e946-98b5099fe64b	00010000-56af-22fc-fc57-5d333fe9dcb7	2016-02-01 10:18:56	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56af-2300-0c79-8ec56a3c37f7	00010000-56af-22fc-fc57-5d333fe9dcb7	2016-02-01 10:18:56	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 42153966)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 42153526)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56af-22fc-55b3-ed421d45c530	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56af-22fc-a69f-de86c61543b4	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56af-22fc-6b1a-f113b0f1b00e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56af-22fc-fd87-b82c611b4077	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56af-22fc-0e7f-1dc2f91d8f6a	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56af-22fc-6e40-1966a97ab191	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56af-22fc-1b1e-af6c1a211d6f	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56af-22fc-e594-6b75342896de	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56af-22fc-68f8-76191becd046	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56af-22fc-466a-108c0e04f18e	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56af-22fc-dfd8-2a100b651bb1	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56af-22fc-4edb-7536358fb4bc	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56af-22fc-2071-57393e6f2c3e	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56af-22fc-37f7-8c6ef6d28157	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56af-22fc-f147-80c700c89741	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56af-22fc-b7c4-3a91f543a4ed	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56af-22fc-2da1-4c317c49f315	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56af-22fc-06f3-6048fbc4e2f4	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56af-22fc-4919-b92d222949ab	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56af-22fc-bad2-6c8deb0ea6e6	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56af-22fc-4d47-ccb658c0f603	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56af-22fc-80a5-c4249ae9f140	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56af-22fc-b7f3-b199f618ad2a	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56af-22fc-ec2a-7db77a0f1fd2	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56af-22fc-9014-9f14aa9ded53	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56af-22fc-8ef5-46dc6df0dce9	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56af-22fc-c66c-967e90353bd7	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56af-22fc-72d0-fef44d2713fc	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56af-22fc-c932-a89475c0f557	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56af-22fc-7f14-f3459782ebe7	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56af-22fc-f987-5b9ab58bef80	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56af-22fc-da5b-711f38475807	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56af-22fc-084f-eb7b85f6b8e3	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56af-22fc-8569-ba4ea961dca2	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56af-22fc-7cec-728a59646b68	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56af-22fc-d927-1d4156cedcf7	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56af-22fc-6ddc-a4cc30cf8d1e	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56af-22fc-acaf-66297d3cbc07	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56af-22fc-f970-b1532a8b7725	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56af-22fc-921b-53d89749af38	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56af-22fc-0ce5-beb562d58b95	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56af-22fc-d113-fa5673059b8d	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56af-22fc-2445-3b0c85a6d644	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56af-22fc-0000-b2531d52b07e	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56af-22fc-b2a6-d64492174986	direktor	minimalne pravice za direktorja	t
00020000-56af-22fc-f281-0fa73fe5e1a2	arhivar	arhivar	t
00020000-56af-22fc-6bdc-8752527e2816	dramaturg	dramaturg	t
00020000-56af-22fc-625b-da0b8012d9ab	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56af-22fc-a2b4-17be079e0839	poslovni-sekretar	poslovni sekretar	t
00020000-56af-22fc-9500-4e7c84ad2542	vodja-tehnike	vodja tehnike	t
00020000-56af-22fc-f39f-21534f25c434	racunovodja	računovodja	t
00020000-56af-22fe-9f1c-94e47935dac4	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56af-22fe-8cfe-17334956af12	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-ee6a-be6c25ca9f55	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-ca0b-4082b0d8d4d0	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-311f-7c91333972c9	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-0b5f-26f86268bb8b	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-b8be-37fce11136f9	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-16f5-0b60ba1131b5	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-844f-6a0be1da257d	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-9f18-4f377e8981ba	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-c43d-ebe82b701e30	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-104b-7b6ad58fe072	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-3f18-af17d0bf4555	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-1291-0661d9de1e63	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-b3a3-831bf7537847	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-b2fc-56f74f06d1c0	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-2438-7755fd43aa43	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-5a90-1c732a53d86e	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-befd-0642a54188cb	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-4b9c-ff92932d7953	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56af-22fe-7c4b-aa32c304af7a	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-6c3a-9eefa912fb4d	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-5b17-f5e647def0fa	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-9fc7-2caf48a4afeb	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-67b9-7a1ffdcfca7f	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-c504-9737539c59b2	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-5beb-655716142e6e	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-2d34-fe32060725c2	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-ec1e-ba1400e1b2d3	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-2511-8908c05ad6b7	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-7b65-cbd353aadf08	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-bf28-64292e9b199d	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-41f3-6e4ec9426a43	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-3fc0-c671dfbb18d6	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-56e7-1a151125ffb6	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-bafe-ae0da87b060f	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-1ef6-32b1a038d02b	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-682d-a4761388e5e0	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56af-22fe-30eb-bed79ee3badd	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 42153510)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56af-22fc-1e20-0d8e8bdd7806	00020000-56af-22fc-6b1a-f113b0f1b00e
00010000-56af-22fc-fc57-5d333fe9dcb7	00020000-56af-22fc-6b1a-f113b0f1b00e
00010000-56af-22fe-ac6e-812834effb7a	00020000-56af-22fe-9f1c-94e47935dac4
00010000-56af-22fe-e071-24f4adc15bf7	00020000-56af-22fe-8cfe-17334956af12
00010000-56af-22fe-e071-24f4adc15bf7	00020000-56af-22fe-0b5f-26f86268bb8b
00010000-56af-22fe-e071-24f4adc15bf7	00020000-56af-22fe-9f18-4f377e8981ba
00010000-56af-22fe-e071-24f4adc15bf7	00020000-56af-22fe-104b-7b6ad58fe072
00010000-56af-22fe-e071-24f4adc15bf7	00020000-56af-22fe-1291-0661d9de1e63
00010000-56af-22fe-e071-24f4adc15bf7	00020000-56af-22fe-befd-0642a54188cb
00010000-56af-22fe-e071-24f4adc15bf7	00020000-56af-22fe-ca0b-4082b0d8d4d0
00010000-56af-22fe-e071-24f4adc15bf7	00020000-56af-22fe-7c4b-aa32c304af7a
00010000-56af-22fe-e071-24f4adc15bf7	00020000-56af-22fe-9fc7-2caf48a4afeb
00010000-56af-22fe-e071-24f4adc15bf7	00020000-56af-22fe-c504-9737539c59b2
00010000-56af-22fe-e071-24f4adc15bf7	00020000-56af-22fe-2d34-fe32060725c2
00010000-56af-22fe-e071-24f4adc15bf7	00020000-56af-22fe-2511-8908c05ad6b7
00010000-56af-22fe-e071-24f4adc15bf7	00020000-56af-22fe-3fc0-c671dfbb18d6
00010000-56af-22fe-c066-7a3e65f643ad	00020000-56af-22fe-8cfe-17334956af12
00010000-56af-22fe-c066-7a3e65f643ad	00020000-56af-22fe-ee6a-be6c25ca9f55
00010000-56af-22fe-c066-7a3e65f643ad	00020000-56af-22fe-ca0b-4082b0d8d4d0
00010000-56af-22fe-c066-7a3e65f643ad	00020000-56af-22fe-311f-7c91333972c9
00010000-56af-22fe-c066-7a3e65f643ad	00020000-56af-22fe-1291-0661d9de1e63
00010000-56af-22fe-c066-7a3e65f643ad	00020000-56af-22fe-2438-7755fd43aa43
00010000-56af-22fe-c066-7a3e65f643ad	00020000-56af-22fe-7c4b-aa32c304af7a
00010000-56af-22fe-c066-7a3e65f643ad	00020000-56af-22fe-9fc7-2caf48a4afeb
00010000-56af-22fe-c066-7a3e65f643ad	00020000-56af-22fe-c504-9737539c59b2
00010000-56af-22fe-c066-7a3e65f643ad	00020000-56af-22fe-2d34-fe32060725c2
00010000-56af-22fe-c066-7a3e65f643ad	00020000-56af-22fe-2511-8908c05ad6b7
00010000-56af-22fe-c066-7a3e65f643ad	00020000-56af-22fe-3fc0-c671dfbb18d6
00010000-56af-22fe-d79f-03e861d71c03	00020000-56af-22fe-8cfe-17334956af12
00010000-56af-22fe-d79f-03e861d71c03	00020000-56af-22fe-ee6a-be6c25ca9f55
00010000-56af-22fe-d79f-03e861d71c03	00020000-56af-22fe-ca0b-4082b0d8d4d0
00010000-56af-22fe-d79f-03e861d71c03	00020000-56af-22fe-311f-7c91333972c9
00010000-56af-22fe-d79f-03e861d71c03	00020000-56af-22fe-104b-7b6ad58fe072
00010000-56af-22fe-d79f-03e861d71c03	00020000-56af-22fe-1291-0661d9de1e63
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-ee6a-be6c25ca9f55
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-b8be-37fce11136f9
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-c43d-ebe82b701e30
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-3f18-af17d0bf4555
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-104b-7b6ad58fe072
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-5a90-1c732a53d86e
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-1291-0661d9de1e63
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-b3a3-831bf7537847
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-7c4b-aa32c304af7a
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-6c3a-9eefa912fb4d
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-9fc7-2caf48a4afeb
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-67b9-7a1ffdcfca7f
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-c504-9737539c59b2
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-5beb-655716142e6e
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-2d34-fe32060725c2
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-ec1e-ba1400e1b2d3
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-2511-8908c05ad6b7
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-7b65-cbd353aadf08
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-3fc0-c671dfbb18d6
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-56e7-1a151125ffb6
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-1ef6-32b1a038d02b
00010000-56af-22fe-38e8-105355748f70	00020000-56af-22fe-682d-a4761388e5e0
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-ee6a-be6c25ca9f55
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-b8be-37fce11136f9
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-844f-6a0be1da257d
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-c43d-ebe82b701e30
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-3f18-af17d0bf4555
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-104b-7b6ad58fe072
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-5a90-1c732a53d86e
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-1291-0661d9de1e63
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-b3a3-831bf7537847
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-b2fc-56f74f06d1c0
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-7c4b-aa32c304af7a
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-6c3a-9eefa912fb4d
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-5b17-f5e647def0fa
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-9fc7-2caf48a4afeb
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-67b9-7a1ffdcfca7f
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-c504-9737539c59b2
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-5beb-655716142e6e
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-2d34-fe32060725c2
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-ec1e-ba1400e1b2d3
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-2511-8908c05ad6b7
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-7b65-cbd353aadf08
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-3fc0-c671dfbb18d6
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-56e7-1a151125ffb6
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-bafe-ae0da87b060f
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-1ef6-32b1a038d02b
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-682d-a4761388e5e0
00010000-56af-22fe-b92a-76978a753ac8	00020000-56af-22fe-30eb-bed79ee3badd
00010000-56af-22fe-abe6-04ba8e80627d	00020000-56af-22fe-ee6a-be6c25ca9f55
00010000-56af-22fe-abe6-04ba8e80627d	00020000-56af-22fe-ca0b-4082b0d8d4d0
00010000-56af-22fe-abe6-04ba8e80627d	00020000-56af-22fe-b8be-37fce11136f9
00010000-56af-22fe-abe6-04ba8e80627d	00020000-56af-22fe-16f5-0b60ba1131b5
00010000-56af-22fe-abe6-04ba8e80627d	00020000-56af-22fe-844f-6a0be1da257d
00010000-56af-22fe-abe6-04ba8e80627d	00020000-56af-22fe-0b5f-26f86268bb8b
00010000-56af-22fe-abe6-04ba8e80627d	00020000-56af-22fe-c43d-ebe82b701e30
00010000-56af-22fe-abe6-04ba8e80627d	00020000-56af-22fe-3f18-af17d0bf4555
00010000-56af-22fe-abe6-04ba8e80627d	00020000-56af-22fe-104b-7b6ad58fe072
00010000-56af-22fe-abe6-04ba8e80627d	00020000-56af-22fe-5a90-1c732a53d86e
00010000-56af-22fe-6d7f-a3aabc823cef	00020000-56af-22fe-8cfe-17334956af12
00010000-56af-22fe-6d7f-a3aabc823cef	00020000-56af-22fe-311f-7c91333972c9
00010000-56af-22fe-6d7f-a3aabc823cef	00020000-56af-22fe-0b5f-26f86268bb8b
00010000-56af-22fe-6d7f-a3aabc823cef	00020000-56af-22fe-9f18-4f377e8981ba
00010000-56af-22fe-6d7f-a3aabc823cef	00020000-56af-22fe-104b-7b6ad58fe072
00010000-56af-22fe-6d7f-a3aabc823cef	00020000-56af-22fe-1291-0661d9de1e63
00010000-56af-22fe-6d7f-a3aabc823cef	00020000-56af-22fe-befd-0642a54188cb
00010000-56af-22fe-6d7f-a3aabc823cef	00020000-56af-22fe-bf28-64292e9b199d
00010000-56af-22fe-d578-880248794369	00020000-56af-22fe-4b9c-ff92932d7953
00010000-56af-22fe-afd3-8b6a33081366	00020000-56af-22fc-b2a6-d64492174986
00010000-56af-22fe-0dd0-5addb4281a13	00020000-56af-22fc-f281-0fa73fe5e1a2
00010000-56af-22fe-ce6e-02635fb5dd93	00020000-56af-22fc-6bdc-8752527e2816
00010000-56af-22fe-0429-421a658418f7	00020000-56af-22fc-625b-da0b8012d9ab
00010000-56af-22fe-9e47-0b78fe8ecb2b	00020000-56af-22fc-a2b4-17be079e0839
00010000-56af-22fe-a15c-ea88fc8d62b9	00020000-56af-22fc-9500-4e7c84ad2542
00010000-56af-22fe-1c1c-ef9ab21561cf	00020000-56af-22fc-f39f-21534f25c434
\.


--
-- TOC entry 3186 (class 0 OID 42153980)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 42153918)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 42153841)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56af-22fe-7884-0abad46e3ba0	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56af-22fe-8bcb-2f2cdad2a357	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56af-22fe-85df-3de12a6e665c	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56af-22fe-ff40-a642f93bc1e8	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 42153475)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56af-22fb-3680-09dd43579750	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56af-22fb-8b9b-252c2970eb01	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56af-22fb-6fff-ae1b72f5d172	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56af-22fb-381c-58f6e0631aae	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56af-22fb-1dc9-32f02c6e90c5	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 42153467)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56af-22fb-d68f-3c8087824ec5	00230000-56af-22fb-381c-58f6e0631aae	popa
00240000-56af-22fb-e747-8114e63b4762	00230000-56af-22fb-381c-58f6e0631aae	oseba
00240000-56af-22fb-fbdb-a9511bb59eb2	00230000-56af-22fb-381c-58f6e0631aae	tippopa
00240000-56af-22fb-c387-f56426eeb1a4	00230000-56af-22fb-381c-58f6e0631aae	organizacijskaenota
00240000-56af-22fb-53ac-874103c3f4d0	00230000-56af-22fb-381c-58f6e0631aae	sezona
00240000-56af-22fb-d099-5e71eadf7dfc	00230000-56af-22fb-381c-58f6e0631aae	tipvaje
00240000-56af-22fb-bd7c-b6889aa1bcb8	00230000-56af-22fb-381c-58f6e0631aae	tipdodatka
00240000-56af-22fb-d0ac-0928f9a84355	00230000-56af-22fb-8b9b-252c2970eb01	prostor
00240000-56af-22fb-e551-2baf933fe5cd	00230000-56af-22fb-381c-58f6e0631aae	besedilo
00240000-56af-22fb-f1c1-5ea288038777	00230000-56af-22fb-381c-58f6e0631aae	uprizoritev
00240000-56af-22fb-5719-b0ce8a1ba564	00230000-56af-22fb-381c-58f6e0631aae	funkcija
00240000-56af-22fb-b661-1f9572766e2d	00230000-56af-22fb-381c-58f6e0631aae	tipfunkcije
00240000-56af-22fb-b30f-26be4b58f7f3	00230000-56af-22fb-381c-58f6e0631aae	alternacija
00240000-56af-22fb-8c47-63a0924f482a	00230000-56af-22fb-3680-09dd43579750	pogodba
00240000-56af-22fb-408a-beea2f83a64c	00230000-56af-22fb-381c-58f6e0631aae	zaposlitev
00240000-56af-22fb-b993-dc8e1ec5edf8	00230000-56af-22fb-381c-58f6e0631aae	zvrstuprizoritve
00240000-56af-22fb-821b-2050a84394d3	00230000-56af-22fb-3680-09dd43579750	programdela
00240000-56af-22fb-a4d6-6bda29ae9e18	00230000-56af-22fb-381c-58f6e0631aae	zapis
\.


--
-- TOC entry 3133 (class 0 OID 42153462)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
f8468036-3b31-42a7-b315-2599d2e9ad91	00240000-56af-22fb-d68f-3c8087824ec5	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 42154041)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56af-22fe-b07a-fee4e2d30886	000e0000-56af-22fe-c040-057868cf956f	00080000-56af-22fe-6e7b-8de151ee036e	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56af-22fb-10dd-4186ae126163
00270000-56af-22fe-316e-b88b921bb8cc	000e0000-56af-22fe-c040-057868cf956f	00080000-56af-22fe-6e7b-8de151ee036e	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56af-22fb-10dd-4186ae126163
\.


--
-- TOC entry 3149 (class 0 OID 42153612)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 42153860)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56af-22ff-111a-34314a973c0f	00180000-56af-22ff-31f6-11ce2dd83c3c	000c0000-56af-22fe-ddf0-39374ce0976c	00090000-56af-22fe-ae5a-547949bc39da	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56af-22ff-b7af-6f0ad2bdfcc0	00180000-56af-22ff-31f6-11ce2dd83c3c	000c0000-56af-22fe-4f4b-846cf5315f34	00090000-56af-22fe-df3b-8fb35e79b22e	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56af-22ff-e31f-20d3f072545d	00180000-56af-22ff-31f6-11ce2dd83c3c	000c0000-56af-22fe-b15a-08548e36db35	00090000-56af-22fe-05ad-88e7126e09ff	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56af-22ff-0d4a-091fd4a13424	00180000-56af-22ff-31f6-11ce2dd83c3c	000c0000-56af-22fe-cd16-3edffbcef567	00090000-56af-22fe-0024-e37b7a29b2b6	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56af-22ff-26c7-885b4df69be2	00180000-56af-22ff-31f6-11ce2dd83c3c	000c0000-56af-22ff-099e-464b32da0c65	00090000-56af-22fe-f820-df5ac7e175e2	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56af-22ff-8aff-91dc48d159d6	00180000-56af-22ff-4997-44196cd99a9d	\N	00090000-56af-22fe-f820-df5ac7e175e2	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56af-22ff-8c0b-55af7ecda109	00180000-56af-22ff-f3af-4057a7528fb4	\N	00090000-56af-22fe-df3b-8fb35e79b22e	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56af-22ff-e73f-058cc6b916ff	00180000-56af-22ff-31f6-11ce2dd83c3c	\N	00090000-56af-22fe-8fda-28add85777c4	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 42153877)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56af-22fb-af89-a7accbc90805	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56af-22fb-86fd-4ace7abfed2b	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56af-22fb-40b1-5538c94db5a5	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56af-22fb-798b-285db65e0156	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56af-22fb-0335-bd34a313011d	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56af-22fb-736a-4173282a8ddb	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 42154082)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56af-22fb-d523-86b4f6067fdf	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56af-22fb-8f4b-b5cfa59a637d	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56af-22fb-92a5-d3bfab558376	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56af-22fb-6ee9-b62eaafb45bb	04	Režija	Režija	Režija	umetnik	30
000f0000-56af-22fb-a077-d2df984c2302	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56af-22fb-022e-5a6094fa9b5f	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56af-22fb-955f-d34e73b87921	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56af-22fb-ecbb-c4595be599f1	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56af-22fb-befa-cb53051cda90	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56af-22fb-401d-410b765e4559	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56af-22fb-f896-a39298884cc4	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56af-22fb-e42a-3adb0e1ea736	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56af-22fb-f7a0-e92c0ba2b53f	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56af-22fb-db5c-34c036e8f029	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56af-22fb-3312-c61613676207	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56af-22fb-dc3d-21a23ccf28a7	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56af-22fb-6ad8-69587b9930f9	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56af-22fb-9aa5-92269d824613	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56af-22fb-f43c-4cc3b1c1d0c7	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 42153562)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56af-22fe-9ca8-06deac4dca2f	0001	šola	osnovna ali srednja šola
00400000-56af-22fe-c105-25ca07afde5c	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56af-22fe-75bc-f5452b9bc2fb	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 42154386)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56af-22fb-e090-d96a6cf26e6c	01	Velika predstava	f	1.00	1.00
002b0000-56af-22fb-8cda-8de4895407d9	02	Mala predstava	f	0.50	0.50
002b0000-56af-22fb-1e2a-647daf22d986	03	Mala koprodukcija	t	0.40	1.00
002b0000-56af-22fb-e8d3-c6cf19847f80	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56af-22fb-e7de-6330af875cb5	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 42153831)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56af-22fb-a68a-507d3a468d40	0001	prva vaja	prva vaja
00420000-56af-22fb-3f5d-ff6dac809e39	0002	tehnična vaja	tehnična vaja
00420000-56af-22fb-a7f7-6b9393d58557	0003	lučna vaja	lučna vaja
00420000-56af-22fb-890c-58bda426eca9	0004	kostumska vaja	kostumska vaja
00420000-56af-22fb-7a21-63f0c3c9d305	0005	foto vaja	foto vaja
00420000-56af-22fb-9515-aaf3e0cc88e4	0006	1. glavna vaja	1. glavna vaja
00420000-56af-22fb-d38c-63c7c320c38a	0007	2. glavna vaja	2. glavna vaja
00420000-56af-22fb-79cd-c3ba0b1cc311	0008	1. generalka	1. generalka
00420000-56af-22fb-9a04-484418c3d2ad	0009	2. generalka	2. generalka
00420000-56af-22fb-6d99-d4c70bde5faa	0010	odprta generalka	odprta generalka
00420000-56af-22fb-76e7-62b0a7c8beb8	0011	obnovitvena vaja	obnovitvena vaja
00420000-56af-22fb-fe41-f06fa80a4cef	0012	italijanka	krajša "obnovitvena" vaja
00420000-56af-22fb-ab73-ffc33d1db2f5	0013	pevska vaja	pevska vaja
00420000-56af-22fb-3c0b-d252a3b92bc9	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56af-22fb-93ed-e965dee87c75	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56af-22fb-0fe2-9f8aa975dd46	0016	orientacijska vaja	orientacijska vaja
00420000-56af-22fb-33f1-a179073757f1	0017	situacijska vaja	situacijska vaja
00420000-56af-22fb-f9fe-b5532dcc3c90	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 42153685)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 42153497)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56af-22fc-fc57-5d333fe9dcb7	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROPcyJikegSi2cPd27uq9d.umpd7jK.A.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56af-22fe-c3a1-7972be835e24	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56af-22fe-8344-496c7d640daa	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56af-22fe-7ca4-9577eef209f7	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56af-22fe-191f-995c3baf5f83	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56af-22fe-a7ca-33661aa855b1	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56af-22fe-efd3-435953fb3a2f	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56af-22fe-3666-947853e6b594	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56af-22fe-0076-f7619d8ac1ea	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56af-22fe-dd5c-541ed0a732c2	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56af-22fe-ac6e-812834effb7a	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56af-22fe-24bd-6a054ac5607e	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56af-22fe-e071-24f4adc15bf7	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56af-22fe-c066-7a3e65f643ad	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56af-22fe-d79f-03e861d71c03	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56af-22fe-38e8-105355748f70	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56af-22fe-b92a-76978a753ac8	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56af-22fe-abe6-04ba8e80627d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56af-22fe-6d7f-a3aabc823cef	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56af-22fe-d578-880248794369	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56af-22fe-afd3-8b6a33081366	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56af-22fe-0dd0-5addb4281a13	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56af-22fe-ce6e-02635fb5dd93	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56af-22fe-0429-421a658418f7	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56af-22fe-9e47-0b78fe8ecb2b	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56af-22fe-a15c-ea88fc8d62b9	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56af-22fe-1c1c-ef9ab21561cf	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56af-22fc-1e20-0d8e8bdd7806	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 42154132)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56af-22fe-4f27-6ba8f064af69	00160000-56af-22fe-024b-4f81997fec67	\N	00140000-56af-22fb-bd6d-6e211d25b95b	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56af-22fe-abdf-5af4e1d6e546
000e0000-56af-22fe-c040-057868cf956f	00160000-56af-22fe-151a-4d53a89ade4e	\N	00140000-56af-22fb-50b6-67f647631bdb	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56af-22fe-87ff-81afb62dbd36
000e0000-56af-22fe-5d2e-717d30e7e7f9	\N	\N	00140000-56af-22fb-50b6-67f647631bdb	00190000-56af-22fe-4ff4-c053cf8b63e8	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56af-22fe-abdf-5af4e1d6e546
000e0000-56af-22fe-9560-9069b6dd6708	\N	\N	00140000-56af-22fb-50b6-67f647631bdb	00190000-56af-22fe-4ff4-c053cf8b63e8	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56af-22fe-abdf-5af4e1d6e546
000e0000-56af-22fe-70ae-a151ce9c3681	\N	\N	00140000-56af-22fb-50b6-67f647631bdb	00190000-56af-22fe-4ff4-c053cf8b63e8	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-22fe-d5f8-1e2c62d48906
000e0000-56af-22fe-8e8e-ceb2de59d2b3	\N	\N	00140000-56af-22fb-50b6-67f647631bdb	00190000-56af-22fe-4ff4-c053cf8b63e8	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-22fe-d5f8-1e2c62d48906
000e0000-56af-22fe-5a07-85539db55c4f	\N	\N	00140000-56af-22fb-7e98-64221b0ddf9b	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-22fe-d5f8-1e2c62d48906
000e0000-56af-22fe-a51b-79bb0580f9d9	\N	\N	00140000-56af-22fb-7e98-64221b0ddf9b	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-22fe-d5f8-1e2c62d48906
000e0000-56af-22fe-77ed-b5616438e368	\N	\N	00140000-56af-22fb-7e98-64221b0ddf9b	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-22fe-d5f8-1e2c62d48906
000e0000-56af-22fe-698f-5b8783ed1ebd	\N	\N	00140000-56af-22fb-7e98-64221b0ddf9b	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-22fe-d5f8-1e2c62d48906
000e0000-56af-22fe-2e85-225d189360f4	\N	\N	00140000-56af-22fb-7e98-64221b0ddf9b	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-22fe-d5f8-1e2c62d48906
000e0000-56af-22fe-e773-4d5a6cefccfa	\N	\N	00140000-56af-22fb-7e98-64221b0ddf9b	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-22fe-d5f8-1e2c62d48906
000e0000-56af-22fe-b7df-e38f30957d8c	\N	\N	00140000-56af-22fb-7e98-64221b0ddf9b	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-22fe-d5f8-1e2c62d48906
000e0000-56af-22fe-2ab1-ad73388fe628	\N	\N	00140000-56af-22fb-7e98-64221b0ddf9b	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-22fe-d5f8-1e2c62d48906
000e0000-56af-22fe-68f8-8806a4ad1345	\N	\N	00140000-56af-22fb-7e98-64221b0ddf9b	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56af-22fe-d5f8-1e2c62d48906
\.


--
-- TOC entry 3170 (class 0 OID 42153851)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 42153780)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56af-22ff-491c-2545bb7dd4d7	\N	000e0000-56af-22fe-c040-057868cf956f	3
00200000-56af-22ff-1a32-eb086916d2d3	\N	000e0000-56af-22fe-c040-057868cf956f	4
00200000-56af-22ff-b9fc-9aafe6425d79	\N	000e0000-56af-22fe-c040-057868cf956f	6
00200000-56af-22ff-8505-ecfcba703729	\N	000e0000-56af-22fe-c040-057868cf956f	5
00200000-56af-22ff-1630-6d70974542f1	\N	000e0000-56af-22fe-c040-057868cf956f	7
00200000-56af-22ff-27da-11b5fe6762d2	\N	000e0000-56af-22fe-4f27-6ba8f064af69	1
00200000-56af-22ff-0409-5141ee8ce4eb	\N	000e0000-56af-22fe-c040-057868cf956f	2
00200000-56af-22ff-c437-24588b71dbe8	\N	000e0000-56af-22fe-c040-057868cf956f	1
00200000-56af-22ff-e897-83e51a14dc58	\N	000e0000-56af-22fe-c040-057868cf956f	8
00200000-56af-22ff-2119-af78642882b0	\N	000e0000-56af-22fe-c040-057868cf956f	9
\.


--
-- TOC entry 3182 (class 0 OID 42153944)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 42154055)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56af-22fb-e93e-9388ce02cc17	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56af-22fb-6c14-714cba94d607	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56af-22fb-8e08-03ea3059f8b1	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56af-22fb-db64-369add1a11b5	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56af-22fb-31fa-6c9b581bb18e	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56af-22fb-78ae-cc891a218f55	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56af-22fb-85ce-aaf45a321d1b	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56af-22fb-2e6b-506c12fd5bc1	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56af-22fb-10dd-4186ae126163	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56af-22fb-af1c-ed164757ebd3	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56af-22fb-3fab-690c04d6ce44	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56af-22fb-b205-2c46ad4af961	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56af-22fb-c988-260585067859	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56af-22fb-0b27-48716fdd64d3	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56af-22fb-12c6-e54019add2ff	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56af-22fb-8a11-13ee6d365877	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56af-22fb-1a3b-0ece13913c18	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56af-22fb-8394-a900d938418e	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56af-22fb-fc70-d9fa9a20835a	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56af-22fb-fd83-7d70e9177e42	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56af-22fb-8988-1d2493512dba	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56af-22fb-a522-c8fa1bb73a53	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56af-22fb-e0c9-30baba4f0916	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56af-22fb-9330-0995c4023afb	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56af-22fb-b42e-dad2a34c2fd1	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56af-22fb-2481-28c84bdae140	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56af-22fb-12e9-ab9d9370f131	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56af-22fb-3c73-2ce460ebef1e	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 42154436)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 42154405)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 42154448)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 42154017)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56af-22fe-b9c4-bdeae93f449f	00090000-56af-22fe-df3b-8fb35e79b22e	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-22fe-9797-5a6f2c347f37	00090000-56af-22fe-05ad-88e7126e09ff	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-22fe-9e2d-2cb6d8da8f0e	00090000-56af-22fe-e8f7-a2b02d2c0dec	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-22fe-e275-1f9ff54cc15b	00090000-56af-22fe-551f-071a93e0bd11	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-22fe-a546-fcdad97b1fb2	00090000-56af-22fe-9e76-3c7caf096cd0	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56af-22fe-3012-0b51464cde6f	00090000-56af-22fe-15e6-93ab9549995b	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 42154122)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56af-22fb-bd6d-6e211d25b95b	01	Drama	drama (SURS 01)
00140000-56af-22fb-275d-1595dbd81e72	02	Opera	opera (SURS 02)
00140000-56af-22fb-d0b0-636bc8473713	03	Balet	balet (SURS 03)
00140000-56af-22fb-3ee4-4caf474b78f1	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56af-22fb-7e98-64221b0ddf9b	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56af-22fb-50b6-67f647631bdb	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56af-22fb-d065-1a0cab9c5470	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 42154007)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 42153561)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 42154180)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 42154171)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 42153551)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 42154038)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 42154080)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 42154489)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 42153874)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 42153809)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 42153825)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 42153830)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 42154403)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 42153711)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 42154249)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 42154003)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 42153778)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 42153751)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 42153726)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 42153910)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 42154466)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 42154473)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 42154497)
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
-- TOC entry 2766 (class 2606 OID 42153936)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 42153683)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 42153580)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 42153645)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 42153607)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 42153540)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 42153525)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 42153942)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 42153979)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 42154117)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 42153636)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 42153671)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 42154354)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 42153916)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 42153661)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 42153794)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 42153766)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 42153760)
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
-- TOC entry 2764 (class 2606 OID 42153928)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 42154363)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 42154371)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 42154341)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 42154384)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 42153961)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 42153901)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 42153892)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 42154104)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 42154031)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 42153739)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 42153496)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 42153970)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 42153514)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 42153534)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 42153988)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 42153923)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 42153849)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 42153484)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 42153472)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 42153466)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 42154051)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 42153617)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 42153866)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 42153884)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 42154091)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 42153569)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 42154396)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 42153838)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 42153696)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 42153509)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 42154150)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 42153857)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 42153784)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 42153950)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 42154063)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 42154446)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 42154430)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 42154454)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 42154021)
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
-- TOC entry 2833 (class 2606 OID 42154130)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 42154015)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 42153819)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 42153820)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 42153818)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 42153816)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 42153817)
-- Name: idx_11e93b5d7634c214; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d7634c214 ON dogodek USING btree (nadrejenogostovanje_id);


--
-- TOC entry 2708 (class 1259 OID 42153815)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 42154052)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 42154053)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 42154054)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 42154468)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 42154467)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 42153638)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 42153639)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 42153943)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 42154434)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 42154433)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 42154435)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 42154432)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 42154431)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 42153929)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 42153785)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 42153786)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 42154004)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 42154006)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 42154005)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 42153728)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 42153727)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 42154385)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 42154119)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 42154120)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 42154121)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 42154455)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 42154155)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 42154152)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 42154156)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 42154154)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 42154153)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 42153698)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 42153697)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 42153611)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 42153971)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 42153541)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 42153542)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 42153991)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 42153990)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 42153989)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 42153648)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 42153647)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 42153649)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 42153761)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2595 (class 1259 OID 42153474)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 42153896)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 42153894)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 42153893)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 42153895)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 42153515)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 42153516)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 42153951)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 42154490)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 42154040)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 42154039)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 42154498)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 42154499)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 42153917)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 42154032)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 42154033)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 42154254)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 42154253)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 42154250)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 42154251)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 42154252)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 42153663)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 42153662)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 42153664)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 42153965)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 42153964)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 42154364)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 42154365)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 42154184)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 42154185)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 42154182)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 42154183)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 42153875)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 42153876)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 42154022)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 42154023)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 42153858)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 42153905)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 42153904)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 42153902)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 42153903)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 42154172)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 42153740)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 42153754)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 42153753)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 42153752)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 42153755)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 42153779)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 42153767)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 42153768)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 42154355)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 42154404)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 42154474)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 42154475)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 42153582)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 42153581)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 42153618)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 42153619)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 42153869)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 42153868)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 42153867)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 42153811)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 42153814)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 42153810)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 42153813)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 42153812)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 42153637)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 42153570)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 42153571)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 42153712)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 42153714)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 42153713)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 42153715)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 42153911)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 42154118)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 42154151)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 42154092)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 42154093)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 42153609)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 42153610)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 42153885)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 42153886)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 42154016)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 42153485)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 42153684)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 42153646)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 42153473)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 42154397)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 42153963)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 42153962)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 42153839)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 42153840)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 42154181)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 42153859)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 42153672)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 42154131)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 42154447)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 42154372)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 42154373)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 42154081)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 42153850)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 42153535)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 42154660)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 42154685)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 42154675)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 42154655)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2940 (class 2606 OID 42154690)
-- Name: fk_11e93b5d7634c214; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d7634c214 FOREIGN KEY (nadrejenogostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2944 (class 2606 OID 42154670)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 42154680)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 42154665)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2985 (class 2606 OID 42154870)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 42154875)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2983 (class 2606 OID 42154880)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3016 (class 2606 OID 42155040)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 42155035)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 42154555)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 42154560)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 42154785)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3011 (class 2606 OID 42155020)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 42155015)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3010 (class 2606 OID 42155025)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 42155010)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3014 (class 2606 OID 42155005)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 42154780)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2939 (class 2606 OID 42154645)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2938 (class 2606 OID 42154650)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 42154825)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 42154835)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 42154830)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 42154610)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 42154605)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 42154770)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 42154995)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2988 (class 2606 OID 42154885)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 42154890)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2986 (class 2606 OID 42154895)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 42155030)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2990 (class 2606 OID 42154915)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2993 (class 2606 OID 42154900)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2989 (class 2606 OID 42154920)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 42154910)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2992 (class 2606 OID 42154905)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 42154600)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 42154595)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 42154540)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 42154535)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 42154805)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 42154515)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 42154520)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2971 (class 2606 OID 42154820)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 42154815)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2973 (class 2606 OID 42154810)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 42154570)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 42154565)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 42154575)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 42154625)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 42154500)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 42154745)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 42154735)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 42154730)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 42154740)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 42154505)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 42154510)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 42154790)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 42155055)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2981 (class 2606 OID 42154865)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 42154860)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 42155060)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 42155065)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 42154775)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 42154850)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2979 (class 2606 OID 42154855)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2999 (class 2606 OID 42154970)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 42154965)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3003 (class 2606 OID 42154950)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 42154955)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 42154960)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 42154585)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 42154580)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 42154590)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2968 (class 2606 OID 42154800)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 42154795)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 42154980)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3005 (class 2606 OID 42154985)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2996 (class 2606 OID 42154940)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2995 (class 2606 OID 42154945)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2998 (class 2606 OID 42154930)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 42154935)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 42154720)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 42154725)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 42154840)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 42154845)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 42154695)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 42154700)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 42154765)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 42154760)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 42154750)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 42154755)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 42154925)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 42154615)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 42154620)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2937 (class 2606 OID 42154640)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2936 (class 2606 OID 42154630)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2935 (class 2606 OID 42154635)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 42154975)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 42154990)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 42155000)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 42155045)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 42155050)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 42154530)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 42154525)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 42154545)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 42154550)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 42154715)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 42154710)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 42154705)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-02-01 10:18:58 CET

--
-- PostgreSQL database dump complete
--

