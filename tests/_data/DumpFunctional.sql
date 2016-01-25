--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-25 12:04:05 CET

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
-- TOC entry 185 (class 1259 OID 40116822)
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
-- TOC entry 241 (class 1259 OID 40117440)
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
-- TOC entry 240 (class 1259 OID 40117424)
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
-- TOC entry 184 (class 1259 OID 40116815)
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
-- TOC entry 183 (class 1259 OID 40116813)
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
-- TOC entry 231 (class 1259 OID 40117301)
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
-- TOC entry 234 (class 1259 OID 40117331)
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
-- TOC entry 255 (class 1259 OID 40117743)
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
-- TOC entry 212 (class 1259 OID 40117137)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 40117063)
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
-- TOC entry 206 (class 1259 OID 40117088)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 40117093)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 40117665)
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
-- TOC entry 196 (class 1259 OID 40116968)
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
-- TOC entry 242 (class 1259 OID 40117453)
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
-- TOC entry 227 (class 1259 OID 40117259)
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
-- TOC entry 202 (class 1259 OID 40117037)
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
-- TOC entry 199 (class 1259 OID 40117008)
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
-- TOC entry 197 (class 1259 OID 40116985)
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
-- TOC entry 216 (class 1259 OID 40117173)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 40117723)
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
-- TOC entry 254 (class 1259 OID 40117736)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 40117758)
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
-- TOC entry 220 (class 1259 OID 40117197)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 40116942)
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
-- TOC entry 187 (class 1259 OID 40116842)
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
-- TOC entry 191 (class 1259 OID 40116909)
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
-- TOC entry 188 (class 1259 OID 40116853)
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
-- TOC entry 180 (class 1259 OID 40116787)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 40116806)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 40117204)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 40117239)
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
-- TOC entry 237 (class 1259 OID 40117372)
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
-- TOC entry 190 (class 1259 OID 40116889)
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
-- TOC entry 193 (class 1259 OID 40116934)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 40117609)
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
-- TOC entry 217 (class 1259 OID 40117179)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 40116919)
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
-- TOC entry 204 (class 1259 OID 40117055)
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
-- TOC entry 200 (class 1259 OID 40117023)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporedna integer,
    zaporednasez integer
);


--
-- TOC entry 201 (class 1259 OID 40117030)
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
-- TOC entry 219 (class 1259 OID 40117191)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 40117623)
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
-- TOC entry 246 (class 1259 OID 40117633)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 40117522)
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
-- TOC entry 247 (class 1259 OID 40117641)
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
-- TOC entry 223 (class 1259 OID 40117219)
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
-- TOC entry 215 (class 1259 OID 40117164)
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
-- TOC entry 214 (class 1259 OID 40117154)
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
-- TOC entry 236 (class 1259 OID 40117361)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 40117291)
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
-- TOC entry 198 (class 1259 OID 40116997)
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
-- TOC entry 177 (class 1259 OID 40116758)
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
-- TOC entry 176 (class 1259 OID 40116756)
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
-- TOC entry 224 (class 1259 OID 40117233)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 40116796)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 40116780)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 40117247)
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
-- TOC entry 218 (class 1259 OID 40117185)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 40117108)
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
-- TOC entry 175 (class 1259 OID 40116745)
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
-- TOC entry 174 (class 1259 OID 40116737)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 40116732)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 40117308)
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
-- TOC entry 189 (class 1259 OID 40116881)
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
-- TOC entry 211 (class 1259 OID 40117127)
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
-- TOC entry 213 (class 1259 OID 40117144)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 40117349)
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
-- TOC entry 186 (class 1259 OID 40116832)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 40117653)
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
-- TOC entry 208 (class 1259 OID 40117098)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 40116954)
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
-- TOC entry 178 (class 1259 OID 40116767)
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
-- TOC entry 239 (class 1259 OID 40117399)
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
-- TOC entry 210 (class 1259 OID 40117118)
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
-- TOC entry 203 (class 1259 OID 40117048)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 40117211)
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
-- TOC entry 233 (class 1259 OID 40117322)
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
-- TOC entry 251 (class 1259 OID 40117703)
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
-- TOC entry 250 (class 1259 OID 40117672)
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
-- TOC entry 252 (class 1259 OID 40117715)
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
-- TOC entry 229 (class 1259 OID 40117284)
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
-- TOC entry 238 (class 1259 OID 40117389)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 40117274)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 40116818)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 40116761)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 40116822)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56a6-0121-5f2b-d8c339a4f7ff	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56a6-0121-1a9e-dd8a3fe57e9f	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56a6-0121-d3bf-16990cb3fd48	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 40117440)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56a6-0122-0797-476c3d66e4ff	000d0000-56a6-0122-f14d-943db5bf50f9	\N	00090000-56a6-0122-2573-d11647f14d44	000b0000-56a6-0122-93af-f0fff952e829	0001	f	\N	\N	\N	3	t	t	t
000c0000-56a6-0122-7f57-914fbd652767	000d0000-56a6-0122-2235-a1006fa4d922	00100000-56a6-0122-475f-42b08b76290b	00090000-56a6-0122-d140-5a9baade2a6b	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56a6-0122-f870-77b5b344f02a	000d0000-56a6-0122-ae29-baef6bab8417	00100000-56a6-0122-5291-a7e4816191c6	00090000-56a6-0122-4f98-2d98c5e408e5	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56a6-0122-f23b-afef686ed63a	000d0000-56a6-0122-df02-39cd14851e90	\N	00090000-56a6-0122-ec82-1a5eabe85a69	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56a6-0122-5e02-d5c934a8f8d3	000d0000-56a6-0122-05bc-76bc77769090	\N	00090000-56a6-0122-3e48-554289819c70	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56a6-0122-f8a4-7f96380aacb9	000d0000-56a6-0122-ddec-76b58aac1067	\N	00090000-56a6-0122-d3a1-7ab5853c7659	000b0000-56a6-0122-458e-7eeef12fe30a	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56a6-0122-95f9-5427055a2aca	000d0000-56a6-0122-7d4d-bb324ca18a5f	00100000-56a6-0122-f1d4-8b21f4617150	00090000-56a6-0122-8113-39ea43b22cf8	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56a6-0122-1eea-db1cade94c91	000d0000-56a6-0122-3e3c-2c6f7bdf7dba	\N	00090000-56a6-0122-d42d-307f5f654e41	000b0000-56a6-0122-b195-dbc2560a5fa6	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56a6-0122-c2ab-3b4b0089de0d	000d0000-56a6-0122-7d4d-bb324ca18a5f	00100000-56a6-0122-cb69-be696ffe30d5	00090000-56a6-0122-d7e3-45024831f15c	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56a6-0122-0291-d4a883948206	000d0000-56a6-0122-7d4d-bb324ca18a5f	00100000-56a6-0122-b211-8792b039c500	00090000-56a6-0122-4d63-9af11b9efcf5	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56a6-0122-cacb-0d02fd880350	000d0000-56a6-0122-7d4d-bb324ca18a5f	00100000-56a6-0122-e2c0-4e8988ea1d38	00090000-56a6-0122-13ed-ae70625d2e35	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56a6-0122-bdbe-1268ab3bfcbc	000d0000-56a6-0122-d68c-9a1a457b8b17	00100000-56a6-0122-475f-42b08b76290b	00090000-56a6-0122-d140-5a9baade2a6b	000b0000-56a6-0122-a22a-b9f21840e7ac	0012	t	\N	\N	\N	2	t	t	t
000c0000-56a6-0122-59e1-768d12a11e5a	000d0000-56a6-0122-e41f-c1df42ea85b2	\N	00090000-56a6-0122-d42d-307f5f654e41	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56a6-0122-eb80-342b9b7b6962	000d0000-56a6-0122-e41f-c1df42ea85b2	\N	00090000-56a6-0122-979e-d74095d49b52	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56a6-0122-ea8f-1af18a8d8db3	000d0000-56a6-0122-ac35-b6598cb2bcf8	00100000-56a6-0122-5291-a7e4816191c6	00090000-56a6-0122-4f98-2d98c5e408e5	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56a6-0122-9705-bfd104ad3e38	000d0000-56a6-0122-ac35-b6598cb2bcf8	\N	00090000-56a6-0122-979e-d74095d49b52	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56a6-0122-a955-e0daaf3845bd	000d0000-56a6-0122-2469-b15f64744944	\N	00090000-56a6-0122-979e-d74095d49b52	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56a6-0122-31b9-7c98541488af	000d0000-56a6-0122-2469-b15f64744944	\N	00090000-56a6-0122-d42d-307f5f654e41	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56a6-0122-b81b-423604f65c06	000d0000-56a6-0122-c091-735ef88ed9fa	00100000-56a6-0122-f1d4-8b21f4617150	00090000-56a6-0122-8113-39ea43b22cf8	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56a6-0122-c77e-7973ef75d9b4	000d0000-56a6-0122-c091-735ef88ed9fa	\N	00090000-56a6-0122-979e-d74095d49b52	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56a6-0122-facf-22f2cacda82a	000d0000-56a6-0122-78ad-4aa6cb5763e1	\N	00090000-56a6-0122-979e-d74095d49b52	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56a6-0122-b411-7ea00b7828c0	000d0000-56a6-0122-78ad-4aa6cb5763e1	00100000-56a6-0122-f1d4-8b21f4617150	00090000-56a6-0122-8113-39ea43b22cf8	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56a6-0122-f912-05597eed3d4d	000d0000-56a6-0122-2910-43c4ad3285cd	\N	00090000-56a6-0122-979e-d74095d49b52	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56a6-0122-63d5-ae4285b3cb45	000d0000-56a6-0122-4185-0766e4b74f5a	\N	00090000-56a6-0122-d42d-307f5f654e41	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56a6-0122-1078-db6db6d01ff2	000d0000-56a6-0122-a91a-c1d8c140c0f6	\N	00090000-56a6-0122-d42d-307f5f654e41	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56a6-0122-97ee-85fbca6160de	000d0000-56a6-0122-a91a-c1d8c140c0f6	00100000-56a6-0122-5291-a7e4816191c6	00090000-56a6-0122-4f98-2d98c5e408e5	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56a6-0122-ed86-40da7370fddc	000d0000-56a6-0122-5aaf-da6483aa9abf	\N	00090000-56a6-0122-3065-49c717e88e52	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56a6-0122-7e75-878e382e2b41	000d0000-56a6-0122-5aaf-da6483aa9abf	\N	00090000-56a6-0122-7b5d-1f67e742ee35	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56a6-0122-a62d-d9c45fb949c9	000d0000-56a6-0122-4a2b-5a24be5ec2d1	\N	00090000-56a6-0122-d42d-307f5f654e41	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56a6-0122-7640-efa05da101b4	000d0000-56a6-0122-4a2b-5a24be5ec2d1	00100000-56a6-0122-5291-a7e4816191c6	00090000-56a6-0122-4f98-2d98c5e408e5	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56a6-0122-2aec-513313936c2f	000d0000-56a6-0122-4a2b-5a24be5ec2d1	\N	00090000-56a6-0122-7b5d-1f67e742ee35	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56a6-0122-7780-247c4ea519fb	000d0000-56a6-0122-4a2b-5a24be5ec2d1	\N	00090000-56a6-0122-3065-49c717e88e52	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56a6-0122-e3b5-97325c66a89f	000d0000-56a6-0122-395b-86bd7991e289	\N	00090000-56a6-0122-d42d-307f5f654e41	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56a6-0122-142a-b9efa1235f5b	000d0000-56a6-0122-bfb0-3de60c021578	00100000-56a6-0122-5291-a7e4816191c6	00090000-56a6-0122-4f98-2d98c5e408e5	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56a6-0122-3e59-e75eae6b92f6	000d0000-56a6-0122-bfb0-3de60c021578	\N	00090000-56a6-0122-979e-d74095d49b52	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 40117424)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 40116815)
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
-- TOC entry 3191 (class 0 OID 40117301)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56a6-0122-2f5b-2a22c03d442a	00160000-56a6-0121-27f1-7cb5b6fbda3f	00090000-56a6-0122-7b5d-1f67e742ee35	aizv	10	t
003d0000-56a6-0122-2932-f091e5fb4642	00160000-56a6-0121-27f1-7cb5b6fbda3f	00090000-56a6-0122-a562-007f09caa13b	apri	14	t
003d0000-56a6-0122-560c-c27941672a26	00160000-56a6-0121-aaf3-000f5d1434d4	00090000-56a6-0122-3065-49c717e88e52	aizv	11	t
003d0000-56a6-0122-e4ab-54def4354871	00160000-56a6-0121-64f3-673ebaaf7a94	00090000-56a6-0122-ef92-6f1ba7e47ea0	aizv	12	t
003d0000-56a6-0122-1fbf-6e3a14c76c3f	00160000-56a6-0121-27f1-7cb5b6fbda3f	00090000-56a6-0122-979e-d74095d49b52	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 40117331)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56a6-0121-27f1-7cb5b6fbda3f	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56a6-0121-aaf3-000f5d1434d4	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56a6-0121-64f3-673ebaaf7a94	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 40117743)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 40117137)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 40117063)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva) FROM stdin;
00180000-56a6-0122-ccb9-76bf40c743bc	\N	\N	\N	\N	00440000-56a6-0122-7223-2a2f0b960e61	00220000-56a6-0121-91a2-f1908dd65d1a	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N
00180000-56a6-0122-ad5b-df497c2ded63	\N	\N	\N	\N	00440000-56a6-0122-b195-cbee9794f809	00220000-56a6-0121-ce4f-48aff9e7eef2	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N
00180000-56a6-0122-36fa-d3b53a33bd6d	\N	\N	\N	001e0000-56a6-0122-178e-e87a1accd5de	\N	00220000-56a6-0121-91a2-f1908dd65d1a	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N
00180000-56a6-0122-77c5-53d9ff8cfd69	\N	\N	\N	001e0000-56a6-0122-6095-101aaed28c63	\N	00220000-56a6-0121-ce4f-48aff9e7eef2	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N
00180000-56a6-0122-6e64-8013470eeafe	\N	00200000-56a6-0122-cdbc-d087b875abcd	\N	\N	\N	00220000-56a6-0122-4bce-24477cb28bb1	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1	\N
00180000-56a6-0122-c674-a847e7ba53fb	\N	00200000-56a6-0122-139b-c173cc5ddc58	\N	\N	\N	00220000-56a6-0122-4bce-24477cb28bb1	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2	\N
00180000-56a6-0122-60c4-bbf9f512f853	\N	00200000-56a6-0122-0566-7c0d71e0597a	\N	\N	\N	00220000-56a6-0121-ce4f-48aff9e7eef2	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3	\N
00180000-56a6-0122-164f-d047fec5a623	\N	00200000-56a6-0122-5b67-5dcf9585dbae	\N	\N	\N	00220000-56a6-0122-137d-52deb7f6a275	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4	\N
00180000-56a6-0122-1773-9227d8bd88ff	\N	00200000-56a6-0122-55fd-2fa93289e293	\N	\N	\N	00220000-56a6-0122-a4b6-0f24e46d79b0	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5	\N
00180000-56a6-0122-9021-6327988feeef	001b0000-56a6-0122-43b8-5e38c8e3c0c6	\N	\N	\N	\N	00220000-56a6-0121-91a2-f1908dd65d1a	001f0000-56a6-0121-a8cd-5e2aa447931b	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1	\N
00180000-56a6-0122-c1ad-2945fbfbae65	001b0000-56a6-0122-8126-1e28fcdeadd6	\N	\N	\N	\N	00220000-56a6-0121-ce4f-48aff9e7eef2	001f0000-56a6-0121-a8cd-5e2aa447931b	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2	\N
00180000-56a6-0122-1ae0-f55a76d81a8c	001b0000-56a6-0122-1bd2-86d9ee8272e6	\N	\N	\N	\N	00220000-56a6-0121-91a2-f1908dd65d1a	001f0000-56a6-0121-a8cd-5e2aa447931b	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3	\N
\.


--
-- TOC entry 3166 (class 0 OID 40117088)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56a6-0122-178e-e87a1accd5de
001e0000-56a6-0122-6095-101aaed28c63
\.


--
-- TOC entry 3167 (class 0 OID 40117093)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56a6-0122-7223-2a2f0b960e61
00440000-56a6-0122-b195-cbee9794f809
\.


--
-- TOC entry 3209 (class 0 OID 40117665)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 40116968)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56a6-011e-cb03-8d8faa0263f6	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56a6-011e-26d2-87fae857bc47	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56a6-011e-e821-8e66d21ae09c	AL	ALB	008	Albania 	Albanija	\N
00040000-56a6-011e-5c6f-e9fd93203638	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56a6-011e-8e46-10c69b1ecd65	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56a6-011e-0382-7d629131b12e	AD	AND	020	Andorra 	Andora	\N
00040000-56a6-011e-5bb7-9689eac0859c	AO	AGO	024	Angola 	Angola	\N
00040000-56a6-011e-2524-d5ffd7beb6be	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56a6-011e-161f-543b34f67c43	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56a6-011e-eacd-0e2cecfa37b4	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56a6-011e-bd01-227668c36732	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56a6-011e-97dc-8a1309db3d13	AM	ARM	051	Armenia 	Armenija	\N
00040000-56a6-011e-fb7b-e38dc193fbc5	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56a6-011e-d9ef-222aa0c02fa7	AU	AUS	036	Australia 	Avstralija	\N
00040000-56a6-011e-7d8a-8f65f2df3c8d	AT	AUT	040	Austria 	Avstrija	\N
00040000-56a6-011e-e011-27c4bd9c9106	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56a6-011e-1af3-8d9d29fa7617	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56a6-011e-4339-53ed59041ff4	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56a6-011e-77a8-55b1a34c78f8	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56a6-011e-6f6a-5db13303e22d	BB	BRB	052	Barbados 	Barbados	\N
00040000-56a6-011e-371f-171858a63c74	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56a6-011e-f142-bef64f06fffa	BE	BEL	056	Belgium 	Belgija	\N
00040000-56a6-011e-4885-92334b4bdca0	BZ	BLZ	084	Belize 	Belize	\N
00040000-56a6-011e-4dc1-ec5c33a39e5d	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56a6-011e-ddd2-d8adc85dc425	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56a6-011e-0c14-ae1a87b12fa2	BT	BTN	064	Bhutan 	Butan	\N
00040000-56a6-011e-892d-20ed869ab6c0	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56a6-011e-ca53-1b9570dbcb2b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56a6-011e-181b-8ce22eea3fac	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56a6-011e-c623-0531be40fa7d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56a6-011e-3501-4f1856e8142d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56a6-011e-a2b1-3e0af1bfbc83	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56a6-011e-2402-2f8a0cce7fb8	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56a6-011e-73f8-0e450e52497f	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56a6-011e-b279-1c53a919a2e6	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56a6-011e-b956-e999a9f4b8a7	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56a6-011e-3159-fc737879305a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56a6-011e-33ca-775c27ad5357	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56a6-011e-f734-6950035837a2	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56a6-011e-2018-d762dd3765a0	CA	CAN	124	Canada 	Kanada	\N
00040000-56a6-011e-3d76-4ceb918f7cf5	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56a6-011e-0c16-b0c70fd40313	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56a6-011e-f2d0-146891ffe935	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56a6-011e-f547-5f4c393e68f8	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56a6-011e-4980-ef8cd228a1d1	CL	CHL	152	Chile 	Čile	\N
00040000-56a6-011e-9f8b-bc85a488b3d2	CN	CHN	156	China 	Kitajska	\N
00040000-56a6-011e-d475-a6ae17d57f6e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56a6-011e-282a-1e32cbdefa39	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56a6-011e-f5ad-7f0a844dcc29	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56a6-011e-542c-454b98ce2398	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56a6-011e-8a92-328b19db7c80	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56a6-011e-20d5-52d76ca0bce7	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56a6-011e-1f4d-5d084ee905fe	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56a6-011e-189e-e92f162d96c5	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56a6-011e-67e1-7420799e9c3d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56a6-011e-f7f7-9863abe467e2	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56a6-011e-829b-7b168777ca77	CU	CUB	192	Cuba 	Kuba	\N
00040000-56a6-011e-d5ce-c02ac28ce16f	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56a6-011e-7b2b-e5197f7d909a	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56a6-011e-6ca2-ddefeecb12d5	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56a6-011e-f7a6-b15c8d87373d	DK	DNK	208	Denmark 	Danska	\N
00040000-56a6-011e-dda0-6e6c04ce8654	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56a6-011e-d1f9-c1cd27a15e5b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56a6-011e-8bf2-d9ef085e242f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56a6-011e-bb65-50445c6d6241	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56a6-011e-4eb4-3a3cf1460979	EG	EGY	818	Egypt 	Egipt	\N
00040000-56a6-011e-ac96-6d600c60115a	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56a6-011e-49d5-d960fd149fff	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56a6-011e-7f9b-da0fa1f75cbb	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56a6-011e-4042-2e6027afae2d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56a6-011e-4ffc-6aa0c20c5caf	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56a6-011e-aff1-5688d882a716	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56a6-011e-e629-c7af85599570	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56a6-011e-97de-727deb01a72a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56a6-011e-43cf-24b455c104fc	FI	FIN	246	Finland 	Finska	\N
00040000-56a6-011e-9dfc-c3d8926e00d7	FR	FRA	250	France 	Francija	\N
00040000-56a6-011e-96ff-2f799da797a0	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56a6-011e-19b4-500a8caf8920	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56a6-011e-4929-62291f6c407b	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56a6-011e-1bae-2cf09659d03b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56a6-011e-7ee3-a3eebedafe1d	GA	GAB	266	Gabon 	Gabon	\N
00040000-56a6-011e-8137-82da54bd70a4	GM	GMB	270	Gambia 	Gambija	\N
00040000-56a6-011e-151d-6ecc33b28fd3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56a6-011e-a584-e6011479a938	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56a6-011e-4f3c-9c18d993aaa2	GH	GHA	288	Ghana 	Gana	\N
00040000-56a6-011e-c594-6aa8e2f9a59b	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56a6-011e-4f36-cfa602c65f15	GR	GRC	300	Greece 	Grčija	\N
00040000-56a6-011e-1b42-85aa1955c6a0	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56a6-011e-52a2-eaa9b2ea6b3a	GD	GRD	308	Grenada 	Grenada	\N
00040000-56a6-011e-2a9f-d65aec7255dc	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56a6-011e-1d33-d6b268ec1b99	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56a6-011e-7eaa-8d17e2acc459	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56a6-011e-ab16-742dc9a0e639	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56a6-011e-5422-8de6ef7b0627	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56a6-011e-2229-e3efea642089	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56a6-011e-a55e-e878f67acb4b	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56a6-011e-68d7-90f57c1dcbed	HT	HTI	332	Haiti 	Haiti	\N
00040000-56a6-011e-ea92-59e91e0e1ad5	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56a6-011e-f5f0-d1d6240dd085	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56a6-011e-b06e-188aab7b447a	HN	HND	340	Honduras 	Honduras	\N
00040000-56a6-011e-4c38-f7c32bc5a043	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56a6-011e-dd4e-6780e177a5cc	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56a6-011e-e4ec-b5458984b8a8	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56a6-011e-d0bd-a9e18acf5aee	IN	IND	356	India 	Indija	\N
00040000-56a6-011e-21e6-3ff612d8b059	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56a6-011e-9f30-e2385812b57b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56a6-011e-6726-32dd56882fdf	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56a6-011e-b602-5491860b63a9	IE	IRL	372	Ireland 	Irska	\N
00040000-56a6-011e-bcb0-f6ddcda4de68	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56a6-011e-9e32-55cf0f0e32e1	IL	ISR	376	Israel 	Izrael	\N
00040000-56a6-011e-d6d7-524985da7887	IT	ITA	380	Italy 	Italija	\N
00040000-56a6-011e-e2a9-2fae059e532b	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56a6-011e-7d25-a769255b05d4	JP	JPN	392	Japan 	Japonska	\N
00040000-56a6-011e-2750-8a32019b512d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56a6-011e-dfd2-8a95b61cc823	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56a6-011e-f6ff-44dcde64934e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56a6-011e-f610-9fea66fb6cf3	KE	KEN	404	Kenya 	Kenija	\N
00040000-56a6-011e-5ab0-2e6a4c585c4c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56a6-011e-1ff5-29e1b6f01007	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56a6-011e-3c1f-6c6f432dfda4	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56a6-011e-8b6b-523993120188	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56a6-011e-de92-a864046550ce	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56a6-011e-5116-c43811c8ab15	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56a6-011e-dee5-b9603836fcb0	LV	LVA	428	Latvia 	Latvija	\N
00040000-56a6-011e-990f-a671bec7f4fd	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56a6-011e-e908-ee6f3e8e575f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56a6-011e-0efb-540df4e189f6	LR	LBR	430	Liberia 	Liberija	\N
00040000-56a6-011e-0f91-715cb8d6ff47	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56a6-011e-ff83-f2dc8663809d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56a6-011e-b4ea-2a15aad06175	LT	LTU	440	Lithuania 	Litva	\N
00040000-56a6-011e-1612-7f87b6fa63ea	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56a6-011e-9f5e-09533445383f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56a6-011e-c8e0-661cf2828037	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56a6-011e-4ae6-85cfb9d68cfc	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56a6-011e-d251-6cac070554a5	MW	MWI	454	Malawi 	Malavi	\N
00040000-56a6-011e-cf34-ff25cc368910	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56a6-011e-c244-8c70cf9770fc	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56a6-011e-b452-196464c71e9f	ML	MLI	466	Mali 	Mali	\N
00040000-56a6-011e-1081-b4cf98540a34	MT	MLT	470	Malta 	Malta	\N
00040000-56a6-011e-1cc7-39f27320591b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56a6-011e-2f67-a8ade2095aae	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56a6-011e-e5f4-7ce2f8b699e8	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56a6-011e-2408-737925d54434	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56a6-011e-5088-c5661a4f8c83	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56a6-011e-3c51-7a187a5e4cd9	MX	MEX	484	Mexico 	Mehika	\N
00040000-56a6-011e-56af-6e735de359bb	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56a6-011e-0759-8f97c370bf28	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56a6-011e-5f1d-0174657e5ae8	MC	MCO	492	Monaco 	Monako	\N
00040000-56a6-011e-9c87-211ad4bfb58e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56a6-011e-1129-e431f6cf8b32	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56a6-011e-85e9-ee896904d982	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56a6-011e-b0df-1a99524879cc	MA	MAR	504	Morocco 	Maroko	\N
00040000-56a6-011e-c4c1-cd141f514384	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56a6-011e-8fc3-a85dd69b3b7f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56a6-011e-ab23-878dfe34e658	NA	NAM	516	Namibia 	Namibija	\N
00040000-56a6-011e-c3f0-34cf843fa0ff	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56a6-011e-c71b-57e38bab19de	NP	NPL	524	Nepal 	Nepal	\N
00040000-56a6-011e-9c5b-e212aa703f0c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56a6-011e-158a-296e1951cd80	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56a6-011e-f923-9c57f6a84a3b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56a6-011e-c79e-c9b053bbdb70	NE	NER	562	Niger 	Niger 	\N
00040000-56a6-011e-44ae-ee523ce4676e	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56a6-011e-741d-437c94b095db	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56a6-011e-7a27-d59ab20f66a8	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56a6-011e-b272-ff237b74f0bb	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56a6-011e-d851-b56886d771dc	NO	NOR	578	Norway 	Norveška	\N
00040000-56a6-011e-21cd-b10beb8822a9	OM	OMN	512	Oman 	Oman	\N
00040000-56a6-011e-4627-54a258ff229e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56a6-011e-474f-f55e0f6018b8	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56a6-011e-8fe1-815f570b104c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56a6-011e-4231-7505f8f516dd	PA	PAN	591	Panama 	Panama	\N
00040000-56a6-011e-bac0-f2b46b687618	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56a6-011e-f59b-fcd23a71d5ee	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56a6-011e-56b6-4ade08c9c2e4	PE	PER	604	Peru 	Peru	\N
00040000-56a6-011e-232d-9cd1a7b154c2	PH	PHL	608	Philippines 	Filipini	\N
00040000-56a6-011e-cbef-3eafb2ba5841	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56a6-011e-0d97-b8504355c099	PL	POL	616	Poland 	Poljska	\N
00040000-56a6-011e-c36d-25cdddda3376	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56a6-011e-3d97-5f3c32de373f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56a6-011e-6b07-a2b9591ae74c	QA	QAT	634	Qatar 	Katar	\N
00040000-56a6-011e-84dd-ac5a46bc8a7a	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56a6-011e-a248-f40983365c52	RO	ROU	642	Romania 	Romunija	\N
00040000-56a6-011e-adca-700c30ca0de6	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56a6-011e-1e9e-d63f21a686a1	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56a6-011e-f539-b70978355d1b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56a6-011e-b682-5e34ef7d71c9	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56a6-011e-3b4c-10f58882568d	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56a6-011e-b40e-e7e373627eca	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56a6-011e-5f88-298520089ff2	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56a6-011e-278e-be409b992172	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56a6-011e-8a7d-b8e14fc1983d	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56a6-011e-c212-5b7e6907b175	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56a6-011e-fcd9-15fd1ca1963a	SM	SMR	674	San Marino 	San Marino	\N
00040000-56a6-011e-2cdd-d96d4cb43006	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56a6-011e-f862-cb08ba5e299b	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56a6-011e-df24-971ed1737a7b	SN	SEN	686	Senegal 	Senegal	\N
00040000-56a6-011e-f31f-c753cb2dcf74	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56a6-011e-26cd-c9ce6c8b7825	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56a6-011e-307d-1e37a14d162c	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56a6-011e-856c-b4d9caee103d	SG	SGP	702	Singapore 	Singapur	\N
00040000-56a6-011e-e6b8-5bf4fa394b0d	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56a6-011e-ef17-4bf505b337e0	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56a6-011e-7541-c64d190be661	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56a6-011e-efd4-5d27f7af91c2	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56a6-011e-7f67-7c0f1defd040	SO	SOM	706	Somalia 	Somalija	\N
00040000-56a6-011e-d4bb-457a30b44b58	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56a6-011e-210c-5b12636efd3d	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56a6-011e-8352-2186a6867845	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56a6-011e-15e3-48023047dc34	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56a6-011e-d55e-b786422ff66b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56a6-011e-95e6-578a6968bdf3	SD	SDN	729	Sudan 	Sudan	\N
00040000-56a6-011e-02ec-0b68f44882f2	SR	SUR	740	Suriname 	Surinam	\N
00040000-56a6-011e-c64d-0e003a30c00e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56a6-011e-99ca-92744c7a32be	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56a6-011e-79f4-72cef58e3028	SE	SWE	752	Sweden 	Švedska	\N
00040000-56a6-011e-9c38-2442cb288ed5	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56a6-011e-3317-fad506b0a843	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56a6-011e-6ae1-91519664f5ab	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56a6-011e-6277-b147c219a24e	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56a6-011e-2211-4630f30cf6bf	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56a6-011e-a6df-883c17a1ce35	TH	THA	764	Thailand 	Tajska	\N
00040000-56a6-011e-b91b-a1077906a132	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56a6-011e-fe68-802b64fd4570	TG	TGO	768	Togo 	Togo	\N
00040000-56a6-011e-147e-a94395acbb34	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56a6-011e-6760-d6e29415dee6	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56a6-011e-bbd0-bf1a0858ae51	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56a6-011e-8fb2-066d4d05e1c5	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56a6-011e-1fbf-1c864405a88b	TR	TUR	792	Turkey 	Turčija	\N
00040000-56a6-011e-e704-2e4d4397b62a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56a6-011e-e782-1947f29d33ce	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a6-011e-78b3-98fa42d0db64	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56a6-011e-c0a3-7f9190110f6b	UG	UGA	800	Uganda 	Uganda	\N
00040000-56a6-011e-e95a-d76310e0b72f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56a6-011e-512c-d6aa1cc2b6ed	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56a6-011e-69c7-7a9a5a678937	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56a6-011e-a3c9-614ac5f30904	US	USA	840	United States 	Združene države Amerike	\N
00040000-56a6-011e-5854-be9ebdfbe6da	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56a6-011e-0cd8-005782b23a76	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56a6-011e-81fd-a059d2bd31e8	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56a6-011e-2b60-1b4e2df5091a	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56a6-011e-b999-9836911384a2	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56a6-011e-68d3-1dcd906e2ea2	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56a6-011e-674b-54a391d672ef	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a6-011e-a136-c6ff275c7f46	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56a6-011e-b11a-aeb88535c162	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56a6-011e-8a8d-4b21b81109a4	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56a6-011e-8e2d-9eb84318523b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56a6-011e-75ef-32e7c2c19550	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56a6-011e-5954-c815ad93bf9c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 40117453)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56a6-0122-e984-8db2e58ac296	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56a6-0122-7f05-7a1bbd9795cb	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a6-0122-4f8e-0c7bde25a957	000e0000-56a6-0122-5fd4-26d327b5c9da	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a6-011e-2f64-de1c71525fc6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a6-0122-722f-34a63c976cb4	000e0000-56a6-0122-eac3-90caeccd82be	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a6-011e-070f-36c1cb7d5358	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a6-0122-9383-de2630b4fbcf	000e0000-56a6-0122-f37e-6b8da8dd6f3e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a6-011e-2f64-de1c71525fc6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 40117259)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56a6-0122-4603-5cab17a4806e	000e0000-56a6-0122-eac3-90caeccd82be	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56a6-011e-ebd9-d9408c1f095a
000d0000-56a6-0122-f057-20565086de59	000e0000-56a6-0122-ef83-0938b8dc6ce4	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56a6-011e-104f-80a23c20857b
000d0000-56a6-0122-b3fc-c7522b600563	000e0000-56a6-0122-ef83-0938b8dc6ce4	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56a6-011e-d26b-81d87c19dc81
000d0000-56a6-0122-f14d-943db5bf50f9	000e0000-56a6-0122-eac3-90caeccd82be	000c0000-56a6-0122-0797-476c3d66e4ff	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56a6-011e-104f-80a23c20857b
000d0000-56a6-0122-2235-a1006fa4d922	000e0000-56a6-0122-eac3-90caeccd82be	000c0000-56a6-0122-7f57-914fbd652767	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56a6-011e-d26b-81d87c19dc81
000d0000-56a6-0122-ae29-baef6bab8417	000e0000-56a6-0122-eac3-90caeccd82be	000c0000-56a6-0122-f870-77b5b344f02a	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56a6-011e-3084-6aa7cc0500e7
000d0000-56a6-0122-df02-39cd14851e90	000e0000-56a6-0122-eac3-90caeccd82be	000c0000-56a6-0122-f23b-afef686ed63a	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56a6-011e-ebd9-d9408c1f095a
000d0000-56a6-0122-05bc-76bc77769090	000e0000-56a6-0122-eac3-90caeccd82be	000c0000-56a6-0122-5e02-d5c934a8f8d3	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56a6-011e-ebd9-d9408c1f095a
000d0000-56a6-0122-ddec-76b58aac1067	000e0000-56a6-0122-eac3-90caeccd82be	000c0000-56a6-0122-f8a4-7f96380aacb9	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56a6-011e-104f-80a23c20857b
000d0000-56a6-0122-7d4d-bb324ca18a5f	000e0000-56a6-0122-eac3-90caeccd82be	000c0000-56a6-0122-c2ab-3b4b0089de0d	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56a6-011e-104f-80a23c20857b
000d0000-56a6-0122-3e3c-2c6f7bdf7dba	000e0000-56a6-0122-eac3-90caeccd82be	000c0000-56a6-0122-1eea-db1cade94c91	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56a6-011e-0f29-350c84fdf4d8
000d0000-56a6-0122-d68c-9a1a457b8b17	000e0000-56a6-0122-eac3-90caeccd82be	000c0000-56a6-0122-bdbe-1268ab3bfcbc	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56a6-011e-23a2-ed3ca7dc1fce
000d0000-56a6-0122-e41f-c1df42ea85b2	000e0000-56a6-0122-aa35-84fa13630d97	000c0000-56a6-0122-59e1-768d12a11e5a	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56a6-011e-d26b-81d87c19dc81
000d0000-56a6-0122-ac35-b6598cb2bcf8	000e0000-56a6-0122-d662-e6591b4d3687	000c0000-56a6-0122-ea8f-1af18a8d8db3	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56a6-011e-d26b-81d87c19dc81
000d0000-56a6-0122-2469-b15f64744944	000e0000-56a6-0122-d662-e6591b4d3687	000c0000-56a6-0122-a955-e0daaf3845bd	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56a6-011e-d26b-81d87c19dc81
000d0000-56a6-0122-c091-735ef88ed9fa	000e0000-56a6-0122-fd96-e2a260081d54	000c0000-56a6-0122-b81b-423604f65c06	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56a6-011e-d26b-81d87c19dc81
000d0000-56a6-0122-78ad-4aa6cb5763e1	000e0000-56a6-0122-9040-6b9c97ab7aeb	000c0000-56a6-0122-facf-22f2cacda82a	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56a6-011e-d26b-81d87c19dc81
000d0000-56a6-0122-2910-43c4ad3285cd	000e0000-56a6-0122-3f3a-d83cd17008c5	000c0000-56a6-0122-f912-05597eed3d4d	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56a6-011e-d26b-81d87c19dc81
000d0000-56a6-0122-4185-0766e4b74f5a	000e0000-56a6-0122-c674-40ef7b04fd27	000c0000-56a6-0122-63d5-ae4285b3cb45	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56a6-011e-d26b-81d87c19dc81
000d0000-56a6-0122-a91a-c1d8c140c0f6	000e0000-56a6-0122-9c17-eee0090f2431	000c0000-56a6-0122-1078-db6db6d01ff2	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56a6-011e-d26b-81d87c19dc81
000d0000-56a6-0122-5aaf-da6483aa9abf	000e0000-56a6-0122-148e-bcb7dc026249	000c0000-56a6-0122-ed86-40da7370fddc	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56a6-011e-d26b-81d87c19dc81
000d0000-56a6-0122-4a2b-5a24be5ec2d1	000e0000-56a6-0122-148e-bcb7dc026249	000c0000-56a6-0122-a62d-d9c45fb949c9	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56a6-011e-d26b-81d87c19dc81
000d0000-56a6-0122-395b-86bd7991e289	000e0000-56a6-0122-b4c7-29708d268458	000c0000-56a6-0122-e3b5-97325c66a89f	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56a6-011e-d26b-81d87c19dc81
000d0000-56a6-0122-bfb0-3de60c021578	000e0000-56a6-0122-b4c7-29708d268458	000c0000-56a6-0122-142a-b9efa1235f5b	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56a6-011e-d26b-81d87c19dc81
\.


--
-- TOC entry 3162 (class 0 OID 40117037)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 40117008)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 40116985)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56a6-0122-ddb1-60ef049d633f	00080000-56a6-0122-d240-15a43f250b07	00090000-56a6-0122-4d63-9af11b9efcf5	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 40117173)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 40117723)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56a6-0122-eec9-92fe9d71ae6b	00010000-56a6-011f-5ece-3e418bf39bda	\N	Prva mapa	Root mapa	2016-01-25 12:04:02	2016-01-25 12:04:02	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 40117736)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 40117758)
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
-- TOC entry 3180 (class 0 OID 40117197)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 40116942)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56a6-011f-79d7-7e113ce35f0b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56a6-011f-464f-5e31cd1b15b2	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56a6-011f-e24f-bc1f0b7096f1	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56a6-011f-4086-0659002ed477	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56a6-011f-df88-8c13ef6dd563	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56a6-011f-23ba-de510727272a	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56a6-011f-5bff-07baa7382175	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56a6-011f-7be6-2392ab8c9cfc	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56a6-011f-c8ce-ebc15b577486	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56a6-011f-6710-252374e4f86a	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56a6-011f-2e82-14da730d8781	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a6-011f-cc6b-2be16f85ad92	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a6-011f-d581-b0436191fafa	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56a6-011f-3600-bd47dd28e260	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56a6-011f-4a7e-0547ed40d05c	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56a6-011f-08f5-cd630551b049	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56a6-011f-309e-1781b55ad663	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56a6-0121-5fda-9025277e738e	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56a6-0121-514f-0f18438a8a91	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56a6-0121-9b44-0d7bb462952b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56a6-0121-9532-a8dd6b08fd8a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56a6-0121-9b76-c609fc434c4a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56a6-0124-2085-a6e3a23b28b4	application.tenant.maticnopodjetje	string	s:36:"00080000-56a6-0124-97e3-f93715e40f0d";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 40116842)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56a6-0121-1496-e003666d6298	00000000-56a6-0121-5fda-9025277e738e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56a6-0121-add6-c2577c2759c7	00000000-56a6-0121-5fda-9025277e738e	00010000-56a6-011f-5ece-3e418bf39bda	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56a6-0121-fef7-315343f1af43	00000000-56a6-0121-514f-0f18438a8a91	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3151 (class 0 OID 40116909)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56a6-0122-9bc3-cb512774f997	\N	00100000-56a6-0122-475f-42b08b76290b	00100000-56a6-0122-5291-a7e4816191c6	01	Gledališče Nimbis
00410000-56a6-0122-badc-20b284a04cbe	00410000-56a6-0122-9bc3-cb512774f997	00100000-56a6-0122-475f-42b08b76290b	00100000-56a6-0122-5291-a7e4816191c6	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 40116853)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56a6-0122-2573-d11647f14d44	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56a6-0122-ec82-1a5eabe85a69	00010000-56a6-0122-b7e4-8363f8fb3404	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56a6-0122-4f98-2d98c5e408e5	00010000-56a6-0122-82c6-14b0fb2591c8	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56a6-0122-d7e3-45024831f15c	00010000-56a6-0122-2fa4-5eef6904f3d9	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56a6-0122-75a5-1cd0a37ee8c1	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56a6-0122-d3a1-7ab5853c7659	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56a6-0122-13ed-ae70625d2e35	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56a6-0122-8113-39ea43b22cf8	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56a6-0122-4d63-9af11b9efcf5	00010000-56a6-0122-056b-311bd2b2569d	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56a6-0122-d140-5a9baade2a6b	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56a6-0122-3eaa-7d6d3590d308	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a6-0122-3e48-554289819c70	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56a6-0122-d42d-307f5f654e41	00010000-56a6-0122-feec-ce236cdcebea	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a6-0122-7b5d-1f67e742ee35	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a6-0122-a562-007f09caa13b	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a6-0122-3065-49c717e88e52	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a6-0122-ef92-6f1ba7e47ea0	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a6-0122-979e-d74095d49b52	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a6-0122-8ca7-8e46c62fddf9	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a6-0122-8b01-591b2b6ef417	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a6-0122-34b5-79c105391b21	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 40116787)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56a6-011f-ede9-80e700855b70	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56a6-011f-b599-4d5fb839420f	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56a6-011f-630a-c5157a51463c	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56a6-011f-5e27-e5882211f2fe	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56a6-011f-64f9-742409cfd02b	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56a6-011f-94eb-4395190e05b2	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56a6-011f-bf2b-28518a66ccd8	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56a6-011f-0805-01731a000227	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56a6-011f-0433-2e803b20403d	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56a6-011f-36a7-351cea5d73f8	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56a6-011f-397a-19c58011cd4b	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56a6-011f-bb1a-5f8326db7bae	Abonma-read	Abonma - branje	t
00030000-56a6-011f-0f38-458a68eec218	Abonma-write	Abonma - spreminjanje	t
00030000-56a6-011f-5e40-1f2d93a9be60	Alternacija-read	Alternacija - branje	t
00030000-56a6-011f-294f-e0927e48a40a	Alternacija-write	Alternacija - spreminjanje	t
00030000-56a6-011f-f42e-5185cec8a1ab	Arhivalija-read	Arhivalija - branje	t
00030000-56a6-011f-f0fe-669542195737	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56a6-011f-5c89-5c73fc3ebeec	AuthStorage-read	AuthStorage - branje	t
00030000-56a6-011f-b8cf-8c8555f2f6e3	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56a6-011f-c46b-1bb4627521ba	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56a6-011f-0d25-6fe72c31ec83	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56a6-011f-83a3-2b5fe783a591	Besedilo-read	Besedilo - branje	t
00030000-56a6-011f-a98c-ec4d9914c893	Besedilo-write	Besedilo - spreminjanje	t
00030000-56a6-011f-ae99-7991dfb4f650	Dodatek-read	Dodatek - branje	t
00030000-56a6-011f-b565-4b2e4833dc96	Dodatek-write	Dodatek - spreminjanje	t
00030000-56a6-011f-02b7-9aab8f579fe4	Dogodek-read	Dogodek - branje	t
00030000-56a6-011f-429a-f004942c4e19	Dogodek-write	Dogodek - spreminjanje	t
00030000-56a6-011f-8541-25466c77dcb6	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56a6-011f-7b7b-c05f451d8a14	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56a6-011f-af42-d4e636dda0eb	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56a6-011f-bba5-1ce7c2eb83e3	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56a6-011f-055d-a9c538761b88	DogodekTrait-read	DogodekTrait - branje	t
00030000-56a6-011f-ecdf-e5528c7bf08d	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56a6-011f-0a3d-d8134d28ae71	DrugiVir-read	DrugiVir - branje	t
00030000-56a6-011f-b63c-c7eca6ab5390	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56a6-011f-20ee-1a09cedce119	Drzava-read	Drzava - branje	t
00030000-56a6-011f-9276-74e43c9ce812	Drzava-write	Drzava - spreminjanje	t
00030000-56a6-011f-1c4b-2b88f6b060a3	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56a6-011f-9671-5d39083fe88a	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56a6-011f-179e-a18bf39fe864	Funkcija-read	Funkcija - branje	t
00030000-56a6-011f-6139-595fedc1c750	Funkcija-write	Funkcija - spreminjanje	t
00030000-56a6-011f-bbae-b16e9b64d7e6	Gostovanje-read	Gostovanje - branje	t
00030000-56a6-011f-4469-dc449d144578	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56a6-011f-59b5-f2a0478409e5	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56a6-011f-ec95-4e8258512cb6	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56a6-011f-f2aa-e7727b0ab4d9	Kupec-read	Kupec - branje	t
00030000-56a6-011f-8bb8-b2506e220819	Kupec-write	Kupec - spreminjanje	t
00030000-56a6-011f-8a40-94d1c3323688	NacinPlacina-read	NacinPlacina - branje	t
00030000-56a6-011f-0b5d-85636db3cffc	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56a6-011f-3bf6-3b09f7dfd49f	Option-read	Option - branje	t
00030000-56a6-011f-52e3-d1bc58b1f650	Option-write	Option - spreminjanje	t
00030000-56a6-011f-4774-cdb66e0b15a8	OptionValue-read	OptionValue - branje	t
00030000-56a6-011f-12be-3bf7b9bf699d	OptionValue-write	OptionValue - spreminjanje	t
00030000-56a6-011f-3f8b-d0f3be89885b	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56a6-011f-326d-2d1980de8126	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56a6-011f-a8ea-89b50c888a89	Oseba-read	Oseba - branje	t
00030000-56a6-011f-5077-e9ea4dae1522	Oseba-write	Oseba - spreminjanje	t
00030000-56a6-011f-32bb-896580c15a72	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56a6-011f-6efe-263145340fe7	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56a6-011f-8fcb-5c0d75aa953a	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56a6-011f-69c8-457278789523	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56a6-011f-2b35-84366e9c2bae	Pogodba-read	Pogodba - branje	t
00030000-56a6-011f-64c5-80fe75b37b21	Pogodba-write	Pogodba - spreminjanje	t
00030000-56a6-011f-b7a9-e85058ad21b6	Popa-read	Popa - branje	t
00030000-56a6-011f-58fe-76b3686ddf75	Popa-write	Popa - spreminjanje	t
00030000-56a6-011f-e0b3-2a4123f166cb	Posta-read	Posta - branje	t
00030000-56a6-011f-a8f7-c10e74936387	Posta-write	Posta - spreminjanje	t
00030000-56a6-011f-3400-7a640043f46a	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56a6-011f-00b7-a538921f98d7	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56a6-011f-2cf2-00cd487db827	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56a6-011f-eeed-59e148e51cb6	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56a6-011f-d3ba-f3a639172cf7	PostniNaslov-read	PostniNaslov - branje	t
00030000-56a6-011f-86f2-fa0fc931d3a3	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56a6-011f-3c54-17476a4de51b	Praznik-read	Praznik - branje	t
00030000-56a6-011f-39a9-61332c053fc3	Praznik-write	Praznik - spreminjanje	t
00030000-56a6-011f-11a7-9584a032b8d7	Predstava-read	Predstava - branje	t
00030000-56a6-011f-50ff-15d9bf59f30e	Predstava-write	Predstava - spreminjanje	t
00030000-56a6-011f-a531-ee1355c5958d	Ura-read	Ura - branje	t
00030000-56a6-011f-72b5-0eddc80c29b1	Ura-write	Ura - spreminjanje	t
00030000-56a6-011f-7933-cc67475aa1ec	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56a6-011f-f0c0-e854e643f496	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56a6-011f-5adb-0ec17110c863	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56a6-011f-1565-4631ebab29bf	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56a6-011f-92ca-e91b6a96d33a	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56a6-011f-0383-5929d5a6f294	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56a6-011f-290e-e9faaa5cead6	ProgramDela-read	ProgramDela - branje	t
00030000-56a6-011f-2374-d40c8779fca3	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56a6-011f-cd5a-4d7d5c5ec3dd	ProgramFestival-read	ProgramFestival - branje	t
00030000-56a6-011f-375a-079a1bcc62c1	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56a6-011f-4256-91b60cd0945b	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56a6-011f-00a6-08201718d44a	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56a6-011f-9476-ecb9afd6be08	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56a6-011f-0935-66bf47418d8c	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56a6-011f-6356-e15839bc1fc5	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56a6-011f-1f7b-2b0a83d93de8	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56a6-011f-4917-677405dc97c0	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56a6-011f-d03e-29e55d0b9a6b	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56a6-011f-2422-4b4117ac14a7	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56a6-011f-7ab3-a2e9d729ddcf	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56a6-011f-5fd9-0b46575eb93b	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56a6-011f-b2d4-0bc7d0cf0aac	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56a6-011f-0613-dc6b5127af7f	ProgramRazno-read	ProgramRazno - branje	t
00030000-56a6-011f-9cc4-fece077dbafc	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56a6-011f-7fc5-4417f3d1bf24	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56a6-011f-39c9-aaabe29eef47	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56a6-011f-a0d6-e5280cb526cb	Prostor-read	Prostor - branje	t
00030000-56a6-011f-73f4-74d099067bbf	Prostor-write	Prostor - spreminjanje	t
00030000-56a6-011f-c0e2-bd7c8259cef5	Racun-read	Racun - branje	t
00030000-56a6-011f-f260-e819df3e95cc	Racun-write	Racun - spreminjanje	t
00030000-56a6-011f-47ba-4f88cf276763	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56a6-011f-0f23-98262c3b491f	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56a6-011f-bac9-74c667b6556f	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56a6-011f-781e-0af0bdc66d9a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56a6-011f-4550-4758b667aa20	Rekvizit-read	Rekvizit - branje	t
00030000-56a6-011f-ed25-b62f33854636	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56a6-011f-5982-86a332ce04f5	Revizija-read	Revizija - branje	t
00030000-56a6-011f-ab73-27d30e575fea	Revizija-write	Revizija - spreminjanje	t
00030000-56a6-011f-6081-c279735fd8e6	Rezervacija-read	Rezervacija - branje	t
00030000-56a6-011f-7869-168926457417	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56a6-011f-ac06-41a2e925395b	SedezniRed-read	SedezniRed - branje	t
00030000-56a6-011f-4e3d-b1af1ae9fe1e	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56a6-011f-ae26-0ae74717728a	Sedez-read	Sedez - branje	t
00030000-56a6-011f-e7e0-5c2ba4458fbe	Sedez-write	Sedez - spreminjanje	t
00030000-56a6-011f-ece1-5e6bab279c65	Sezona-read	Sezona - branje	t
00030000-56a6-011f-17ba-14a85c3ce5b4	Sezona-write	Sezona - spreminjanje	t
00030000-56a6-011f-1e2f-35b09a7515dd	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56a6-011f-8d4d-983fce5ba67d	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56a6-011f-40b3-b58f1beeadf6	Telefonska-read	Telefonska - branje	t
00030000-56a6-011f-84df-263360e20dd6	Telefonska-write	Telefonska - spreminjanje	t
00030000-56a6-011f-b439-a994df0fb73b	TerminStoritve-read	TerminStoritve - branje	t
00030000-56a6-011f-c6f5-573d62db44f9	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56a6-011f-17fd-da9a507bbc1b	TipDodatka-read	TipDodatka - branje	t
00030000-56a6-011f-d55e-61a377b06e77	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56a6-011f-1d91-8e45217b125a	TipFunkcije-read	TipFunkcije - branje	t
00030000-56a6-011f-1839-6653cdf27f60	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56a6-011f-30fd-272a65c6e518	TipPopa-read	TipPopa - branje	t
00030000-56a6-011f-66a3-e14ddce42d70	TipPopa-write	TipPopa - spreminjanje	t
00030000-56a6-011f-ea69-2e18de41789d	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56a6-011f-2aee-85d2e43086c6	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56a6-011f-1a5d-f42ec6eb6614	TipVaje-read	TipVaje - branje	t
00030000-56a6-011f-3333-ff264223b1cb	TipVaje-write	TipVaje - spreminjanje	t
00030000-56a6-011f-e105-8d69e7e3f422	Trr-read	Trr - branje	t
00030000-56a6-011f-6a8a-4a90ed05e50b	Trr-write	Trr - spreminjanje	t
00030000-56a6-011f-ea27-5e95b6597a30	Uprizoritev-read	Uprizoritev - branje	t
00030000-56a6-011f-6c6a-09988444374c	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56a6-011f-9ded-226c89e3440e	Vaja-read	Vaja - branje	t
00030000-56a6-011f-175e-75ab4c74d6c7	Vaja-write	Vaja - spreminjanje	t
00030000-56a6-011f-309f-981fc42e2af4	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56a6-011f-090e-a59015082420	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56a6-011f-aead-6d87f0d8da80	VrstaStroska-read	VrstaStroska - branje	t
00030000-56a6-011f-f125-ad5fcde1f505	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56a6-011f-1795-239826a7978f	Zaposlitev-read	Zaposlitev - branje	t
00030000-56a6-011f-565b-07875dd2a75a	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56a6-011f-115d-c4ce9e6e36d8	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56a6-011f-c453-7d8cfb16fba2	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56a6-011f-ddca-96276a0de2ce	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56a6-011f-b417-73b111e5450a	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56a6-011f-947f-565da15fdbbd	Job-read	Branje opravil - samo zase - branje	t
00030000-56a6-011f-1de7-8f9443f09948	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56a6-011f-8b35-36a1fae8b17c	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56a6-011f-d8a7-fcf93b3fea98	Report-read	Report - branje	t
00030000-56a6-011f-aebd-efa992000e83	Report-write	Report - spreminjanje	t
00030000-56a6-011f-647b-1af76319fdfa	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56a6-011f-2074-17ce74c47065	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56a6-011f-acd6-b94a75bcc6c6	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56a6-011f-c5a7-e01f5bb5f4cc	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56a6-011f-f1cc-206dd52be902	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56a6-011f-e69f-f90e6a63a783	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56a6-011f-0101-135a27593a56	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56a6-011f-cf03-830775e52690	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a6-011f-9ea2-828b1ad72947	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a6-011f-d796-3018ee84ce84	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a6-011f-7cba-f11441123f5b	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a6-011f-8eba-801c156688ec	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56a6-011f-2be5-30cefa82dbed	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56a6-011f-e2a1-2f5301d36395	Datoteka-write	Datoteka - spreminjanje	t
00030000-56a6-011f-7775-05454f0d6911	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 40116806)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56a6-011f-9e57-6d05a1f8db9a	00030000-56a6-011f-b599-4d5fb839420f
00020000-56a6-011f-9e57-6d05a1f8db9a	00030000-56a6-011f-ede9-80e700855b70
00020000-56a6-011f-55bc-c1e9d23d88e1	00030000-56a6-011f-20ee-1a09cedce119
00020000-56a6-011f-01d7-7b6dd9c33016	00030000-56a6-011f-0d25-6fe72c31ec83
00020000-56a6-011f-01d7-7b6dd9c33016	00030000-56a6-011f-a98c-ec4d9914c893
00020000-56a6-011f-01d7-7b6dd9c33016	00030000-56a6-011f-e2a1-2f5301d36395
00020000-56a6-011f-01d7-7b6dd9c33016	00030000-56a6-011f-5077-e9ea4dae1522
00020000-56a6-011f-01d7-7b6dd9c33016	00030000-56a6-011f-cf03-830775e52690
00020000-56a6-011f-01d7-7b6dd9c33016	00030000-56a6-011f-d796-3018ee84ce84
00020000-56a6-011f-01d7-7b6dd9c33016	00030000-56a6-011f-c46b-1bb4627521ba
00020000-56a6-011f-01d7-7b6dd9c33016	00030000-56a6-011f-83a3-2b5fe783a591
00020000-56a6-011f-01d7-7b6dd9c33016	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-011f-01d7-7b6dd9c33016	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-01d7-7b6dd9c33016	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-01d7-7b6dd9c33016	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-011f-e852-09b4f6e7eda4	00030000-56a6-011f-c46b-1bb4627521ba
00020000-56a6-011f-e852-09b4f6e7eda4	00030000-56a6-011f-83a3-2b5fe783a591
00020000-56a6-011f-e852-09b4f6e7eda4	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-011f-e852-09b4f6e7eda4	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-e852-09b4f6e7eda4	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-011f-e852-09b4f6e7eda4	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-944b-9d774bcab808	00030000-56a6-011f-1795-239826a7978f
00020000-56a6-011f-944b-9d774bcab808	00030000-56a6-011f-565b-07875dd2a75a
00020000-56a6-011f-944b-9d774bcab808	00030000-56a6-011f-94eb-4395190e05b2
00020000-56a6-011f-944b-9d774bcab808	00030000-56a6-011f-64f9-742409cfd02b
00020000-56a6-011f-944b-9d774bcab808	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-944b-9d774bcab808	00030000-56a6-011f-5077-e9ea4dae1522
00020000-56a6-011f-944b-9d774bcab808	00030000-56a6-011f-3f8b-d0f3be89885b
00020000-56a6-011f-f2e2-f678bd80ec35	00030000-56a6-011f-1795-239826a7978f
00020000-56a6-011f-f2e2-f678bd80ec35	00030000-56a6-011f-94eb-4395190e05b2
00020000-56a6-011f-f2e2-f678bd80ec35	00030000-56a6-011f-3f8b-d0f3be89885b
00020000-56a6-011f-afe4-da9e70504278	00030000-56a6-011f-5077-e9ea4dae1522
00020000-56a6-011f-afe4-da9e70504278	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-afe4-da9e70504278	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-011f-afe4-da9e70504278	00030000-56a6-011f-e2a1-2f5301d36395
00020000-56a6-011f-afe4-da9e70504278	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-011f-afe4-da9e70504278	00030000-56a6-011f-d796-3018ee84ce84
00020000-56a6-011f-afe4-da9e70504278	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-afe4-da9e70504278	00030000-56a6-011f-cf03-830775e52690
00020000-56a6-011f-3ca1-0bf25767612e	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-3ca1-0bf25767612e	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-011f-3ca1-0bf25767612e	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-011f-3ca1-0bf25767612e	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-e133-626bc1cd3dd5	00030000-56a6-011f-5077-e9ea4dae1522
00020000-56a6-011f-e133-626bc1cd3dd5	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-e133-626bc1cd3dd5	00030000-56a6-011f-94eb-4395190e05b2
00020000-56a6-011f-e133-626bc1cd3dd5	00030000-56a6-011f-64f9-742409cfd02b
00020000-56a6-011f-e133-626bc1cd3dd5	00030000-56a6-011f-e105-8d69e7e3f422
00020000-56a6-011f-e133-626bc1cd3dd5	00030000-56a6-011f-6a8a-4a90ed05e50b
00020000-56a6-011f-e133-626bc1cd3dd5	00030000-56a6-011f-d3ba-f3a639172cf7
00020000-56a6-011f-e133-626bc1cd3dd5	00030000-56a6-011f-86f2-fa0fc931d3a3
00020000-56a6-011f-e133-626bc1cd3dd5	00030000-56a6-011f-40b3-b58f1beeadf6
00020000-56a6-011f-e133-626bc1cd3dd5	00030000-56a6-011f-84df-263360e20dd6
00020000-56a6-011f-e133-626bc1cd3dd5	00030000-56a6-011f-20ee-1a09cedce119
00020000-56a6-011f-e133-626bc1cd3dd5	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-46aa-f83252c782f4	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-46aa-f83252c782f4	00030000-56a6-011f-94eb-4395190e05b2
00020000-56a6-011f-46aa-f83252c782f4	00030000-56a6-011f-e105-8d69e7e3f422
00020000-56a6-011f-46aa-f83252c782f4	00030000-56a6-011f-d3ba-f3a639172cf7
00020000-56a6-011f-46aa-f83252c782f4	00030000-56a6-011f-40b3-b58f1beeadf6
00020000-56a6-011f-46aa-f83252c782f4	00030000-56a6-011f-20ee-1a09cedce119
00020000-56a6-011f-46aa-f83252c782f4	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-40b3-b58f1beeadf6
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-d3ba-f3a639172cf7
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-e105-8d69e7e3f422
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-b7a9-e85058ad21b6
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-59b5-f2a0478409e5
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-92ca-e91b6a96d33a
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-84df-263360e20dd6
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-86f2-fa0fc931d3a3
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-cf03-830775e52690
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-6a8a-4a90ed05e50b
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-58fe-76b3686ddf75
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-e2a1-2f5301d36395
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-d796-3018ee84ce84
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-ec95-4e8258512cb6
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-0383-5929d5a6f294
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-20ee-1a09cedce119
00020000-56a6-011f-d9a3-44e880e769f1	00030000-56a6-011f-30fd-272a65c6e518
00020000-56a6-011f-0c3a-c43978506d52	00030000-56a6-011f-40b3-b58f1beeadf6
00020000-56a6-011f-0c3a-c43978506d52	00030000-56a6-011f-d3ba-f3a639172cf7
00020000-56a6-011f-0c3a-c43978506d52	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-0c3a-c43978506d52	00030000-56a6-011f-e105-8d69e7e3f422
00020000-56a6-011f-0c3a-c43978506d52	00030000-56a6-011f-b7a9-e85058ad21b6
00020000-56a6-011f-0c3a-c43978506d52	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-011f-0c3a-c43978506d52	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-011f-0c3a-c43978506d52	00030000-56a6-011f-59b5-f2a0478409e5
00020000-56a6-011f-0c3a-c43978506d52	00030000-56a6-011f-92ca-e91b6a96d33a
00020000-56a6-011f-0c3a-c43978506d52	00030000-56a6-011f-20ee-1a09cedce119
00020000-56a6-011f-0c3a-c43978506d52	00030000-56a6-011f-30fd-272a65c6e518
00020000-56a6-011f-ff1a-32b6993392f0	00030000-56a6-011f-30fd-272a65c6e518
00020000-56a6-011f-ff1a-32b6993392f0	00030000-56a6-011f-66a3-e14ddce42d70
00020000-56a6-011f-b6f8-705440747947	00030000-56a6-011f-30fd-272a65c6e518
00020000-56a6-011f-f242-b71a72ba3061	00030000-56a6-011f-e0b3-2a4123f166cb
00020000-56a6-011f-f242-b71a72ba3061	00030000-56a6-011f-a8f7-c10e74936387
00020000-56a6-011f-d763-02f39576f14e	00030000-56a6-011f-e0b3-2a4123f166cb
00020000-56a6-011f-9324-99524192771a	00030000-56a6-011f-20ee-1a09cedce119
00020000-56a6-011f-9324-99524192771a	00030000-56a6-011f-9276-74e43c9ce812
00020000-56a6-011f-fe53-d5e6f3c493bc	00030000-56a6-011f-20ee-1a09cedce119
00020000-56a6-011f-3ddc-34aadb8b46d4	00030000-56a6-011f-ddca-96276a0de2ce
00020000-56a6-011f-3ddc-34aadb8b46d4	00030000-56a6-011f-b417-73b111e5450a
00020000-56a6-011f-7af9-2034b9322c6e	00030000-56a6-011f-ddca-96276a0de2ce
00020000-56a6-011f-3d3e-80f607f5f0a2	00030000-56a6-011f-115d-c4ce9e6e36d8
00020000-56a6-011f-3d3e-80f607f5f0a2	00030000-56a6-011f-c453-7d8cfb16fba2
00020000-56a6-011f-2610-4efdd9f8fdb8	00030000-56a6-011f-115d-c4ce9e6e36d8
00020000-56a6-011f-67c7-60c9b765e0ef	00030000-56a6-011f-bb1a-5f8326db7bae
00020000-56a6-011f-67c7-60c9b765e0ef	00030000-56a6-011f-0f38-458a68eec218
00020000-56a6-011f-ac2b-8435d4e7d7f9	00030000-56a6-011f-bb1a-5f8326db7bae
00020000-56a6-011f-0132-1a7ab9290f25	00030000-56a6-011f-a0d6-e5280cb526cb
00020000-56a6-011f-0132-1a7ab9290f25	00030000-56a6-011f-73f4-74d099067bbf
00020000-56a6-011f-0132-1a7ab9290f25	00030000-56a6-011f-b7a9-e85058ad21b6
00020000-56a6-011f-0132-1a7ab9290f25	00030000-56a6-011f-d3ba-f3a639172cf7
00020000-56a6-011f-0132-1a7ab9290f25	00030000-56a6-011f-86f2-fa0fc931d3a3
00020000-56a6-011f-0132-1a7ab9290f25	00030000-56a6-011f-20ee-1a09cedce119
00020000-56a6-011f-91f6-8e1f8534c63e	00030000-56a6-011f-a0d6-e5280cb526cb
00020000-56a6-011f-91f6-8e1f8534c63e	00030000-56a6-011f-b7a9-e85058ad21b6
00020000-56a6-011f-91f6-8e1f8534c63e	00030000-56a6-011f-d3ba-f3a639172cf7
00020000-56a6-011f-67c6-a6588b6dfe08	00030000-56a6-011f-aead-6d87f0d8da80
00020000-56a6-011f-67c6-a6588b6dfe08	00030000-56a6-011f-f125-ad5fcde1f505
00020000-56a6-011f-7445-46e3d0b52037	00030000-56a6-011f-aead-6d87f0d8da80
00020000-56a6-011f-5dd3-0145f1b5cfb5	00030000-56a6-011f-326d-2d1980de8126
00020000-56a6-011f-5dd3-0145f1b5cfb5	00030000-56a6-011f-3f8b-d0f3be89885b
00020000-56a6-011f-5dd3-0145f1b5cfb5	00030000-56a6-011f-1795-239826a7978f
00020000-56a6-011f-5dd3-0145f1b5cfb5	00030000-56a6-011f-e2a1-2f5301d36395
00020000-56a6-011f-5dd3-0145f1b5cfb5	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-011f-5dd3-0145f1b5cfb5	00030000-56a6-011f-cf03-830775e52690
00020000-56a6-011f-5dd3-0145f1b5cfb5	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-5dd3-0145f1b5cfb5	00030000-56a6-011f-d796-3018ee84ce84
00020000-56a6-011f-5dd3-0145f1b5cfb5	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-011f-ffaa-cd47bcefa72f	00030000-56a6-011f-3f8b-d0f3be89885b
00020000-56a6-011f-ffaa-cd47bcefa72f	00030000-56a6-011f-1795-239826a7978f
00020000-56a6-011f-ffaa-cd47bcefa72f	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-011f-ffaa-cd47bcefa72f	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-ffaa-cd47bcefa72f	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-011f-8039-8c17569763c3	00030000-56a6-011f-1a5d-f42ec6eb6614
00020000-56a6-011f-8039-8c17569763c3	00030000-56a6-011f-3333-ff264223b1cb
00020000-56a6-011f-368d-1d356cbcfc0e	00030000-56a6-011f-1a5d-f42ec6eb6614
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-bf2b-28518a66ccd8
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-0805-01731a000227
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-290e-e9faaa5cead6
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-2374-d40c8779fca3
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-cd5a-4d7d5c5ec3dd
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-375a-079a1bcc62c1
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-4256-91b60cd0945b
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-00a6-08201718d44a
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-9476-ecb9afd6be08
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-0935-66bf47418d8c
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-6356-e15839bc1fc5
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-1f7b-2b0a83d93de8
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-4917-677405dc97c0
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-d03e-29e55d0b9a6b
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-2422-4b4117ac14a7
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-7ab3-a2e9d729ddcf
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-5fd9-0b46575eb93b
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-b2d4-0bc7d0cf0aac
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-0613-dc6b5127af7f
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-9cc4-fece077dbafc
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-7fc5-4417f3d1bf24
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-39c9-aaabe29eef47
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-1565-4631ebab29bf
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-b63c-c7eca6ab5390
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-00b7-a538921f98d7
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-1de7-8f9443f09948
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-0a3d-d8134d28ae71
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-5adb-0ec17110c863
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-92ca-e91b6a96d33a
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-3400-7a640043f46a
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-aead-6d87f0d8da80
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-ea27-5e95b6597a30
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-1e2f-35b09a7515dd
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-179e-a18bf39fe864
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-5e40-1f2d93a9be60
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-1d91-8e45217b125a
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-2b35-84366e9c2bae
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-20ee-1a09cedce119
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-b7a9-e85058ad21b6
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-e2a1-2f5301d36395
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-cf03-830775e52690
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-d796-3018ee84ce84
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-947f-565da15fdbbd
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-80ce-7f40a9523ea9	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-011f-15ac-ae7d1d64bd21	00030000-56a6-011f-290e-e9faaa5cead6
00020000-56a6-011f-15ac-ae7d1d64bd21	00030000-56a6-011f-cd5a-4d7d5c5ec3dd
00020000-56a6-011f-15ac-ae7d1d64bd21	00030000-56a6-011f-4256-91b60cd0945b
00020000-56a6-011f-15ac-ae7d1d64bd21	00030000-56a6-011f-9476-ecb9afd6be08
00020000-56a6-011f-15ac-ae7d1d64bd21	00030000-56a6-011f-6356-e15839bc1fc5
00020000-56a6-011f-15ac-ae7d1d64bd21	00030000-56a6-011f-4917-677405dc97c0
00020000-56a6-011f-15ac-ae7d1d64bd21	00030000-56a6-011f-2422-4b4117ac14a7
00020000-56a6-011f-15ac-ae7d1d64bd21	00030000-56a6-011f-5fd9-0b46575eb93b
00020000-56a6-011f-15ac-ae7d1d64bd21	00030000-56a6-011f-0613-dc6b5127af7f
00020000-56a6-011f-15ac-ae7d1d64bd21	00030000-56a6-011f-7fc5-4417f3d1bf24
00020000-56a6-011f-15ac-ae7d1d64bd21	00030000-56a6-011f-5adb-0ec17110c863
00020000-56a6-011f-15ac-ae7d1d64bd21	00030000-56a6-011f-0a3d-d8134d28ae71
00020000-56a6-011f-15ac-ae7d1d64bd21	00030000-56a6-011f-3400-7a640043f46a
00020000-56a6-011f-15ac-ae7d1d64bd21	00030000-56a6-011f-20ee-1a09cedce119
00020000-56a6-011f-15ac-ae7d1d64bd21	00030000-56a6-011f-947f-565da15fdbbd
00020000-56a6-011f-15ac-ae7d1d64bd21	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-011f-15ac-ae7d1d64bd21	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-15ac-ae7d1d64bd21	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-011f-4685-64a9556c11bb	00030000-56a6-011f-ea27-5e95b6597a30
00020000-56a6-011f-4685-64a9556c11bb	00030000-56a6-011f-6c6a-09988444374c
00020000-56a6-011f-4685-64a9556c11bb	00030000-56a6-011f-5e40-1f2d93a9be60
00020000-56a6-011f-4685-64a9556c11bb	00030000-56a6-011f-294f-e0927e48a40a
00020000-56a6-011f-4685-64a9556c11bb	00030000-56a6-011f-0433-2e803b20403d
00020000-56a6-011f-4685-64a9556c11bb	00030000-56a6-011f-83a3-2b5fe783a591
00020000-56a6-011f-4685-64a9556c11bb	00030000-56a6-011f-179e-a18bf39fe864
00020000-56a6-011f-4685-64a9556c11bb	00030000-56a6-011f-6139-595fedc1c750
00020000-56a6-011f-4685-64a9556c11bb	00030000-56a6-011f-36a7-351cea5d73f8
00020000-56a6-011f-4685-64a9556c11bb	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-4685-64a9556c11bb	00030000-56a6-011f-92ca-e91b6a96d33a
00020000-56a6-011f-4685-64a9556c11bb	00030000-56a6-011f-1d91-8e45217b125a
00020000-56a6-011f-4685-64a9556c11bb	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-011f-4685-64a9556c11bb	00030000-56a6-011f-e2a1-2f5301d36395
00020000-56a6-011f-4685-64a9556c11bb	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-4685-64a9556c11bb	00030000-56a6-011f-cf03-830775e52690
00020000-56a6-011f-4685-64a9556c11bb	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-011f-4685-64a9556c11bb	00030000-56a6-011f-d796-3018ee84ce84
00020000-56a6-011f-76ad-0553bb5f53bf	00030000-56a6-011f-ea27-5e95b6597a30
00020000-56a6-011f-76ad-0553bb5f53bf	00030000-56a6-011f-5e40-1f2d93a9be60
00020000-56a6-011f-76ad-0553bb5f53bf	00030000-56a6-011f-83a3-2b5fe783a591
00020000-56a6-011f-76ad-0553bb5f53bf	00030000-56a6-011f-179e-a18bf39fe864
00020000-56a6-011f-76ad-0553bb5f53bf	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-76ad-0553bb5f53bf	00030000-56a6-011f-92ca-e91b6a96d33a
00020000-56a6-011f-76ad-0553bb5f53bf	00030000-56a6-011f-1d91-8e45217b125a
00020000-56a6-011f-76ad-0553bb5f53bf	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-011f-76ad-0553bb5f53bf	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-76ad-0553bb5f53bf	00030000-56a6-011f-cf03-830775e52690
00020000-56a6-011f-76ad-0553bb5f53bf	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-011f-6d1c-596b5140ffe1	00030000-56a6-011f-5e40-1f2d93a9be60
00020000-56a6-011f-6d1c-596b5140ffe1	00030000-56a6-011f-294f-e0927e48a40a
00020000-56a6-011f-6d1c-596b5140ffe1	00030000-56a6-011f-179e-a18bf39fe864
00020000-56a6-011f-6d1c-596b5140ffe1	00030000-56a6-011f-6139-595fedc1c750
00020000-56a6-011f-6d1c-596b5140ffe1	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-6d1c-596b5140ffe1	00030000-56a6-011f-1d91-8e45217b125a
00020000-56a6-011f-6d1c-596b5140ffe1	00030000-56a6-011f-ea27-5e95b6597a30
00020000-56a6-011f-6d1c-596b5140ffe1	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-d7f5-5cc40f3ee2f2	00030000-56a6-011f-5e40-1f2d93a9be60
00020000-56a6-011f-d7f5-5cc40f3ee2f2	00030000-56a6-011f-294f-e0927e48a40a
00020000-56a6-011f-d7f5-5cc40f3ee2f2	00030000-56a6-011f-0433-2e803b20403d
00020000-56a6-011f-d7f5-5cc40f3ee2f2	00030000-56a6-011f-179e-a18bf39fe864
00020000-56a6-011f-d7f5-5cc40f3ee2f2	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-d7f5-5cc40f3ee2f2	00030000-56a6-011f-94eb-4395190e05b2
00020000-56a6-011f-d7f5-5cc40f3ee2f2	00030000-56a6-011f-64f9-742409cfd02b
00020000-56a6-011f-d7f5-5cc40f3ee2f2	00030000-56a6-011f-2b35-84366e9c2bae
00020000-56a6-011f-d7f5-5cc40f3ee2f2	00030000-56a6-011f-64c5-80fe75b37b21
00020000-56a6-011f-d7f5-5cc40f3ee2f2	00030000-56a6-011f-b7a9-e85058ad21b6
00020000-56a6-011f-d7f5-5cc40f3ee2f2	00030000-56a6-011f-92ca-e91b6a96d33a
00020000-56a6-011f-d7f5-5cc40f3ee2f2	00030000-56a6-011f-1e2f-35b09a7515dd
00020000-56a6-011f-d7f5-5cc40f3ee2f2	00030000-56a6-011f-8d4d-983fce5ba67d
00020000-56a6-011f-d7f5-5cc40f3ee2f2	00030000-56a6-011f-1d91-8e45217b125a
00020000-56a6-011f-d7f5-5cc40f3ee2f2	00030000-56a6-011f-e105-8d69e7e3f422
00020000-56a6-011f-d7f5-5cc40f3ee2f2	00030000-56a6-011f-ea27-5e95b6597a30
00020000-56a6-011f-d7f5-5cc40f3ee2f2	00030000-56a6-011f-1795-239826a7978f
00020000-56a6-011f-0fd8-5db4f9f1ba37	00030000-56a6-011f-5e40-1f2d93a9be60
00020000-56a6-011f-0fd8-5db4f9f1ba37	00030000-56a6-011f-179e-a18bf39fe864
00020000-56a6-011f-0fd8-5db4f9f1ba37	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-0fd8-5db4f9f1ba37	00030000-56a6-011f-94eb-4395190e05b2
00020000-56a6-011f-0fd8-5db4f9f1ba37	00030000-56a6-011f-2b35-84366e9c2bae
00020000-56a6-011f-0fd8-5db4f9f1ba37	00030000-56a6-011f-b7a9-e85058ad21b6
00020000-56a6-011f-0fd8-5db4f9f1ba37	00030000-56a6-011f-92ca-e91b6a96d33a
00020000-56a6-011f-0fd8-5db4f9f1ba37	00030000-56a6-011f-1e2f-35b09a7515dd
00020000-56a6-011f-0fd8-5db4f9f1ba37	00030000-56a6-011f-1d91-8e45217b125a
00020000-56a6-011f-0fd8-5db4f9f1ba37	00030000-56a6-011f-e105-8d69e7e3f422
00020000-56a6-011f-0fd8-5db4f9f1ba37	00030000-56a6-011f-ea27-5e95b6597a30
00020000-56a6-011f-0fd8-5db4f9f1ba37	00030000-56a6-011f-1795-239826a7978f
00020000-56a6-011f-f575-a35bb3576ff2	00030000-56a6-011f-1e2f-35b09a7515dd
00020000-56a6-011f-f575-a35bb3576ff2	00030000-56a6-011f-ea27-5e95b6597a30
00020000-56a6-011f-f575-a35bb3576ff2	00030000-56a6-011f-179e-a18bf39fe864
00020000-56a6-011f-f575-a35bb3576ff2	00030000-56a6-011f-2b35-84366e9c2bae
00020000-56a6-011f-f575-a35bb3576ff2	00030000-56a6-011f-92ca-e91b6a96d33a
00020000-56a6-011f-f575-a35bb3576ff2	00030000-56a6-011f-1d91-8e45217b125a
00020000-56a6-011f-f575-a35bb3576ff2	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-7fa0-8f75c5b76923	00030000-56a6-011f-1e2f-35b09a7515dd
00020000-56a6-011f-7fa0-8f75c5b76923	00030000-56a6-011f-8d4d-983fce5ba67d
00020000-56a6-011f-7fa0-8f75c5b76923	00030000-56a6-011f-ea27-5e95b6597a30
00020000-56a6-011f-7fa0-8f75c5b76923	00030000-56a6-011f-b7a9-e85058ad21b6
00020000-56a6-011f-229b-6001a5972731	00030000-56a6-011f-1e2f-35b09a7515dd
00020000-56a6-011f-229b-6001a5972731	00030000-56a6-011f-ea27-5e95b6597a30
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-bb1a-5f8326db7bae
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-5e40-1f2d93a9be60
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-294f-e0927e48a40a
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-0433-2e803b20403d
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-c46b-1bb4627521ba
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-0d25-6fe72c31ec83
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-83a3-2b5fe783a591
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-a98c-ec4d9914c893
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-e2a1-2f5301d36395
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-0a3d-d8134d28ae71
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-b63c-c7eca6ab5390
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-20ee-1a09cedce119
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-179e-a18bf39fe864
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-6139-595fedc1c750
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-36a7-351cea5d73f8
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-947f-565da15fdbbd
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-1de7-8f9443f09948
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-59b5-f2a0478409e5
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-3f8b-d0f3be89885b
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-5077-e9ea4dae1522
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-94eb-4395190e05b2
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-64f9-742409cfd02b
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-2b35-84366e9c2bae
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-64c5-80fe75b37b21
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-b7a9-e85058ad21b6
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-e0b3-2a4123f166cb
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-3400-7a640043f46a
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-00b7-a538921f98d7
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-d3ba-f3a639172cf7
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-5adb-0ec17110c863
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-1565-4631ebab29bf
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-92ca-e91b6a96d33a
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-bf2b-28518a66ccd8
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-290e-e9faaa5cead6
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-0805-01731a000227
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-2374-d40c8779fca3
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-cd5a-4d7d5c5ec3dd
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-375a-079a1bcc62c1
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-4256-91b60cd0945b
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-00a6-08201718d44a
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-9476-ecb9afd6be08
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-0935-66bf47418d8c
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-6356-e15839bc1fc5
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-1f7b-2b0a83d93de8
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-4917-677405dc97c0
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-d03e-29e55d0b9a6b
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-2422-4b4117ac14a7
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-7ab3-a2e9d729ddcf
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-5fd9-0b46575eb93b
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-b2d4-0bc7d0cf0aac
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-0613-dc6b5127af7f
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-9cc4-fece077dbafc
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-7fc5-4417f3d1bf24
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-39c9-aaabe29eef47
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-a0d6-e5280cb526cb
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-1e2f-35b09a7515dd
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-8d4d-983fce5ba67d
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-40b3-b58f1beeadf6
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-1d91-8e45217b125a
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-30fd-272a65c6e518
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-1a5d-f42ec6eb6614
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-e105-8d69e7e3f422
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-ea27-5e95b6597a30
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-6c6a-09988444374c
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-aead-6d87f0d8da80
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-d796-3018ee84ce84
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-cf03-830775e52690
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-1795-239826a7978f
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-115d-c4ce9e6e36d8
00020000-56a6-011f-5826-7c14318296c2	00030000-56a6-011f-ddca-96276a0de2ce
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-bb1a-5f8326db7bae
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-5e40-1f2d93a9be60
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-c46b-1bb4627521ba
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-0d25-6fe72c31ec83
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-83a3-2b5fe783a591
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-a98c-ec4d9914c893
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-e2a1-2f5301d36395
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-20ee-1a09cedce119
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-179e-a18bf39fe864
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-59b5-f2a0478409e5
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-3f8b-d0f3be89885b
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-5077-e9ea4dae1522
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-94eb-4395190e05b2
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-b7a9-e85058ad21b6
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-e0b3-2a4123f166cb
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-d3ba-f3a639172cf7
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-92ca-e91b6a96d33a
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-a0d6-e5280cb526cb
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-40b3-b58f1beeadf6
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-1d91-8e45217b125a
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-30fd-272a65c6e518
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-1a5d-f42ec6eb6614
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-e105-8d69e7e3f422
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-ea27-5e95b6597a30
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-aead-6d87f0d8da80
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-d796-3018ee84ce84
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-cf03-830775e52690
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-1795-239826a7978f
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-115d-c4ce9e6e36d8
00020000-56a6-011f-7613-ede9ab4e40c5	00030000-56a6-011f-ddca-96276a0de2ce
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-bb1a-5f8326db7bae
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-5e40-1f2d93a9be60
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-294f-e0927e48a40a
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-0433-2e803b20403d
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-c46b-1bb4627521ba
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-0d25-6fe72c31ec83
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-83a3-2b5fe783a591
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-a98c-ec4d9914c893
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-e2a1-2f5301d36395
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-20ee-1a09cedce119
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-179e-a18bf39fe864
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-6139-595fedc1c750
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-36a7-351cea5d73f8
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-59b5-f2a0478409e5
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-3f8b-d0f3be89885b
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-5077-e9ea4dae1522
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-94eb-4395190e05b2
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-b7a9-e85058ad21b6
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-e0b3-2a4123f166cb
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-d3ba-f3a639172cf7
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-92ca-e91b6a96d33a
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-a0d6-e5280cb526cb
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-40b3-b58f1beeadf6
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-1d91-8e45217b125a
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-30fd-272a65c6e518
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-1a5d-f42ec6eb6614
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-e105-8d69e7e3f422
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-ea27-5e95b6597a30
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-6c6a-09988444374c
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-aead-6d87f0d8da80
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-d796-3018ee84ce84
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-cf03-830775e52690
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-1795-239826a7978f
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-115d-c4ce9e6e36d8
00020000-56a6-011f-df58-37801aa0f7ac	00030000-56a6-011f-ddca-96276a0de2ce
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-5e40-1f2d93a9be60
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-294f-e0927e48a40a
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-0433-2e803b20403d
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-c46b-1bb4627521ba
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-0d25-6fe72c31ec83
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-83a3-2b5fe783a591
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-a98c-ec4d9914c893
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-e2a1-2f5301d36395
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-0a3d-d8134d28ae71
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-b63c-c7eca6ab5390
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-20ee-1a09cedce119
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-179e-a18bf39fe864
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-6139-595fedc1c750
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-36a7-351cea5d73f8
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-947f-565da15fdbbd
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-1de7-8f9443f09948
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-59b5-f2a0478409e5
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-ec95-4e8258512cb6
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-3f8b-d0f3be89885b
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-5077-e9ea4dae1522
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-94eb-4395190e05b2
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-64f9-742409cfd02b
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-2b35-84366e9c2bae
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-64c5-80fe75b37b21
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-b7a9-e85058ad21b6
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-58fe-76b3686ddf75
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-e0b3-2a4123f166cb
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-3400-7a640043f46a
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-00b7-a538921f98d7
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-d3ba-f3a639172cf7
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-86f2-fa0fc931d3a3
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-5adb-0ec17110c863
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-1565-4631ebab29bf
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-92ca-e91b6a96d33a
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-0383-5929d5a6f294
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-bf2b-28518a66ccd8
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-290e-e9faaa5cead6
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-0805-01731a000227
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-2374-d40c8779fca3
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-cd5a-4d7d5c5ec3dd
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-375a-079a1bcc62c1
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-4256-91b60cd0945b
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-00a6-08201718d44a
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-9476-ecb9afd6be08
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-0935-66bf47418d8c
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-6356-e15839bc1fc5
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-1f7b-2b0a83d93de8
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-4917-677405dc97c0
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-d03e-29e55d0b9a6b
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-2422-4b4117ac14a7
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-7ab3-a2e9d729ddcf
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-5fd9-0b46575eb93b
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-b2d4-0bc7d0cf0aac
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-0613-dc6b5127af7f
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-9cc4-fece077dbafc
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-7fc5-4417f3d1bf24
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-39c9-aaabe29eef47
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-a0d6-e5280cb526cb
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-1e2f-35b09a7515dd
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-8d4d-983fce5ba67d
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-40b3-b58f1beeadf6
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-84df-263360e20dd6
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-1d91-8e45217b125a
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-30fd-272a65c6e518
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-e105-8d69e7e3f422
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-6a8a-4a90ed05e50b
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-ea27-5e95b6597a30
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-6c6a-09988444374c
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-aead-6d87f0d8da80
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-d796-3018ee84ce84
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-cf03-830775e52690
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-1795-239826a7978f
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-565b-07875dd2a75a
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-115d-c4ce9e6e36d8
00020000-56a6-011f-ee50-24eef433e60e	00030000-56a6-011f-ddca-96276a0de2ce
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-bb1a-5f8326db7bae
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-5e40-1f2d93a9be60
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-294f-e0927e48a40a
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-0433-2e803b20403d
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-c46b-1bb4627521ba
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-0d25-6fe72c31ec83
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-83a3-2b5fe783a591
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-a98c-ec4d9914c893
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-e2a1-2f5301d36395
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-20ee-1a09cedce119
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-179e-a18bf39fe864
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-6139-595fedc1c750
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-36a7-351cea5d73f8
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-59b5-f2a0478409e5
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-ec95-4e8258512cb6
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-3f8b-d0f3be89885b
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-5077-e9ea4dae1522
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-94eb-4395190e05b2
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-64f9-742409cfd02b
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-2b35-84366e9c2bae
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-b7a9-e85058ad21b6
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-58fe-76b3686ddf75
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-e0b3-2a4123f166cb
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-d3ba-f3a639172cf7
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-86f2-fa0fc931d3a3
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-92ca-e91b6a96d33a
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-0383-5929d5a6f294
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-a0d6-e5280cb526cb
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-1e2f-35b09a7515dd
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-40b3-b58f1beeadf6
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-84df-263360e20dd6
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-1d91-8e45217b125a
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-30fd-272a65c6e518
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-1a5d-f42ec6eb6614
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-e105-8d69e7e3f422
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-6a8a-4a90ed05e50b
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-ea27-5e95b6597a30
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-6c6a-09988444374c
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-aead-6d87f0d8da80
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-d796-3018ee84ce84
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-cf03-830775e52690
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-1795-239826a7978f
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-565b-07875dd2a75a
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-115d-c4ce9e6e36d8
00020000-56a6-011f-59e6-8ebec2812c10	00030000-56a6-011f-ddca-96276a0de2ce
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-bb1a-5f8326db7bae
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-5e40-1f2d93a9be60
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-294f-e0927e48a40a
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-c46b-1bb4627521ba
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-83a3-2b5fe783a591
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-20ee-1a09cedce119
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-179e-a18bf39fe864
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-6139-595fedc1c750
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-59b5-f2a0478409e5
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-3f8b-d0f3be89885b
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-94eb-4395190e05b2
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-2b35-84366e9c2bae
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-b7a9-e85058ad21b6
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-e0b3-2a4123f166cb
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-d3ba-f3a639172cf7
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-92ca-e91b6a96d33a
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-a0d6-e5280cb526cb
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-1e2f-35b09a7515dd
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-40b3-b58f1beeadf6
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-1d91-8e45217b125a
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-30fd-272a65c6e518
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-1a5d-f42ec6eb6614
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-e105-8d69e7e3f422
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-ea27-5e95b6597a30
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-aead-6d87f0d8da80
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-1795-239826a7978f
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-115d-c4ce9e6e36d8
00020000-56a6-011f-af93-bee28a1cf041	00030000-56a6-011f-ddca-96276a0de2ce
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-bb1a-5f8326db7bae
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-5e40-1f2d93a9be60
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-294f-e0927e48a40a
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-0433-2e803b20403d
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-83a3-2b5fe783a591
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-e2a1-2f5301d36395
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-0a3d-d8134d28ae71
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-b63c-c7eca6ab5390
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-20ee-1a09cedce119
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-179e-a18bf39fe864
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-947f-565da15fdbbd
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-1de7-8f9443f09948
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-59b5-f2a0478409e5
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-ec95-4e8258512cb6
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-3f8b-d0f3be89885b
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-326d-2d1980de8126
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-5077-e9ea4dae1522
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-94eb-4395190e05b2
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-64f9-742409cfd02b
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-2b35-84366e9c2bae
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-64c5-80fe75b37b21
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-b7a9-e85058ad21b6
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-58fe-76b3686ddf75
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-e0b3-2a4123f166cb
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-3400-7a640043f46a
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-00b7-a538921f98d7
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-d3ba-f3a639172cf7
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-86f2-fa0fc931d3a3
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-5adb-0ec17110c863
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-1565-4631ebab29bf
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-92ca-e91b6a96d33a
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-0383-5929d5a6f294
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-bf2b-28518a66ccd8
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-290e-e9faaa5cead6
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-0805-01731a000227
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-2374-d40c8779fca3
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-cd5a-4d7d5c5ec3dd
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-375a-079a1bcc62c1
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-4256-91b60cd0945b
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-00a6-08201718d44a
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-9476-ecb9afd6be08
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-0935-66bf47418d8c
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-6356-e15839bc1fc5
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-1f7b-2b0a83d93de8
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-4917-677405dc97c0
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-d03e-29e55d0b9a6b
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-2422-4b4117ac14a7
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-7ab3-a2e9d729ddcf
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-5fd9-0b46575eb93b
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-b2d4-0bc7d0cf0aac
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-0613-dc6b5127af7f
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-9cc4-fece077dbafc
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-7fc5-4417f3d1bf24
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-39c9-aaabe29eef47
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-a0d6-e5280cb526cb
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-1e2f-35b09a7515dd
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-8d4d-983fce5ba67d
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-40b3-b58f1beeadf6
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-84df-263360e20dd6
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-1d91-8e45217b125a
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-30fd-272a65c6e518
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-1a5d-f42ec6eb6614
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-e105-8d69e7e3f422
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-6a8a-4a90ed05e50b
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-ea27-5e95b6597a30
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-aead-6d87f0d8da80
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-f125-ad5fcde1f505
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-d796-3018ee84ce84
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-cf03-830775e52690
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-1795-239826a7978f
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-565b-07875dd2a75a
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-115d-c4ce9e6e36d8
00020000-56a6-011f-b0c6-c664c3291d22	00030000-56a6-011f-ddca-96276a0de2ce
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-ede9-80e700855b70
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-b599-4d5fb839420f
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-bb1a-5f8326db7bae
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-0f38-458a68eec218
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-5e40-1f2d93a9be60
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-0433-2e803b20403d
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-294f-e0927e48a40a
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-f42e-5185cec8a1ab
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-f0fe-669542195737
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-5c89-5c73fc3ebeec
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-b8cf-8c8555f2f6e3
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-c46b-1bb4627521ba
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-0d25-6fe72c31ec83
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-83a3-2b5fe783a591
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-a98c-ec4d9914c893
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-e2a1-2f5301d36395
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-02b7-9aab8f579fe4
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-5e27-e5882211f2fe
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-8541-25466c77dcb6
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-7b7b-c05f451d8a14
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-af42-d4e636dda0eb
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-bba5-1ce7c2eb83e3
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-055d-a9c538761b88
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-ecdf-e5528c7bf08d
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-429a-f004942c4e19
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-0a3d-d8134d28ae71
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-b63c-c7eca6ab5390
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-20ee-1a09cedce119
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-9276-74e43c9ce812
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-1c4b-2b88f6b060a3
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-9671-5d39083fe88a
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-179e-a18bf39fe864
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-36a7-351cea5d73f8
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-6139-595fedc1c750
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-bbae-b16e9b64d7e6
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-4469-dc449d144578
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-8b35-36a1fae8b17c
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-947f-565da15fdbbd
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-1de7-8f9443f09948
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-59b5-f2a0478409e5
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-ec95-4e8258512cb6
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-f2aa-e7727b0ab4d9
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-8bb8-b2506e220819
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-0101-135a27593a56
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-e69f-f90e6a63a783
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-2074-17ce74c47065
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-acd6-b94a75bcc6c6
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-c5a7-e01f5bb5f4cc
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-f1cc-206dd52be902
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-8a40-94d1c3323688
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-0b5d-85636db3cffc
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-3bf6-3b09f7dfd49f
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-4774-cdb66e0b15a8
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-12be-3bf7b9bf699d
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-397a-19c58011cd4b
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-52e3-d1bc58b1f650
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-3f8b-d0f3be89885b
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-326d-2d1980de8126
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-5077-e9ea4dae1522
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-94eb-4395190e05b2
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-64f9-742409cfd02b
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-32bb-896580c15a72
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-6efe-263145340fe7
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-8fcb-5c0d75aa953a
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-69c8-457278789523
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-2b35-84366e9c2bae
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-64c5-80fe75b37b21
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-b7a9-e85058ad21b6
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-58fe-76b3686ddf75
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-e0b3-2a4123f166cb
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-3400-7a640043f46a
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-00b7-a538921f98d7
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-2cf2-00cd487db827
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-eeed-59e148e51cb6
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-a8f7-c10e74936387
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-d3ba-f3a639172cf7
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-86f2-fa0fc931d3a3
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-3c54-17476a4de51b
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-39a9-61332c053fc3
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-11a7-9584a032b8d7
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-50ff-15d9bf59f30e
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-7933-cc67475aa1ec
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-f0c0-e854e643f496
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-5adb-0ec17110c863
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-1565-4631ebab29bf
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-92ca-e91b6a96d33a
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-0383-5929d5a6f294
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-bf2b-28518a66ccd8
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-290e-e9faaa5cead6
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-0805-01731a000227
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-2374-d40c8779fca3
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-cd5a-4d7d5c5ec3dd
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-375a-079a1bcc62c1
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-4256-91b60cd0945b
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-00a6-08201718d44a
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-9476-ecb9afd6be08
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-0935-66bf47418d8c
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-6356-e15839bc1fc5
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-1f7b-2b0a83d93de8
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-4917-677405dc97c0
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-d03e-29e55d0b9a6b
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-2422-4b4117ac14a7
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-7ab3-a2e9d729ddcf
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-5fd9-0b46575eb93b
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-b2d4-0bc7d0cf0aac
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-0613-dc6b5127af7f
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-9cc4-fece077dbafc
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-7fc5-4417f3d1bf24
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-39c9-aaabe29eef47
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-a0d6-e5280cb526cb
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-73f4-74d099067bbf
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-c0e2-bd7c8259cef5
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-f260-e819df3e95cc
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-47ba-4f88cf276763
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-0f23-98262c3b491f
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-bac9-74c667b6556f
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-781e-0af0bdc66d9a
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-4550-4758b667aa20
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-ed25-b62f33854636
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-d8a7-fcf93b3fea98
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-aebd-efa992000e83
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-5982-86a332ce04f5
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-ab73-27d30e575fea
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-6081-c279735fd8e6
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-7869-168926457417
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-ac06-41a2e925395b
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-4e3d-b1af1ae9fe1e
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-ae26-0ae74717728a
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-e7e0-5c2ba4458fbe
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-ece1-5e6bab279c65
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-17ba-14a85c3ce5b4
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-647b-1af76319fdfa
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-1e2f-35b09a7515dd
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-8d4d-983fce5ba67d
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-40b3-b58f1beeadf6
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-84df-263360e20dd6
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-b439-a994df0fb73b
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-630a-c5157a51463c
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-c6f5-573d62db44f9
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-1d91-8e45217b125a
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-1839-6653cdf27f60
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-30fd-272a65c6e518
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-66a3-e14ddce42d70
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-ea69-2e18de41789d
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-2aee-85d2e43086c6
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-1a5d-f42ec6eb6614
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-3333-ff264223b1cb
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-e105-8d69e7e3f422
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-6a8a-4a90ed05e50b
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-ea27-5e95b6597a30
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-6c6a-09988444374c
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-9ded-226c89e3440e
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-175e-75ab4c74d6c7
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-309f-981fc42e2af4
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-090e-a59015082420
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-aead-6d87f0d8da80
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-f125-ad5fcde1f505
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-2be5-30cefa82dbed
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-8eba-801c156688ec
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-d796-3018ee84ce84
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-cf03-830775e52690
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-1795-239826a7978f
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-565b-07875dd2a75a
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-115d-c4ce9e6e36d8
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-c453-7d8cfb16fba2
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-ddca-96276a0de2ce
00020000-56a6-0121-ef57-30441fe41723	00030000-56a6-011f-b417-73b111e5450a
00020000-56a6-0121-2db3-3630b513e86e	00030000-56a6-011f-7cba-f11441123f5b
00020000-56a6-0121-ed27-db9793afb902	00030000-56a6-011f-d796-3018ee84ce84
00020000-56a6-0121-e40c-53908cce6676	00030000-56a6-011f-6c6a-09988444374c
00020000-56a6-0121-6110-a8cc77384fbb	00030000-56a6-011f-ea27-5e95b6597a30
00020000-56a6-0121-ced4-f0a2d643b32e	00030000-56a6-011f-acd6-b94a75bcc6c6
00020000-56a6-0121-915d-3d996ff7c62d	00030000-56a6-011f-c5a7-e01f5bb5f4cc
00020000-56a6-0121-b3fc-e15bb1a5da7f	00030000-56a6-011f-f1cc-206dd52be902
00020000-56a6-0121-2f45-c3e14e5d70cd	00030000-56a6-011f-2074-17ce74c47065
00020000-56a6-0121-bc5a-60bfad0ab6d1	00030000-56a6-011f-0101-135a27593a56
00020000-56a6-0121-c9b0-dccf7058c8ec	00030000-56a6-011f-e69f-f90e6a63a783
00020000-56a6-0121-784b-87f4c024d1dc	00030000-56a6-011f-9ea2-828b1ad72947
00020000-56a6-0121-9550-675a6331481e	00030000-56a6-011f-cf03-830775e52690
00020000-56a6-0121-de81-8a99b6fc6ca2	00030000-56a6-011f-a8ea-89b50c888a89
00020000-56a6-0121-49cc-b988c8b39819	00030000-56a6-011f-5077-e9ea4dae1522
00020000-56a6-0121-8a10-fcec1ed33972	00030000-56a6-011f-64f9-742409cfd02b
00020000-56a6-0121-64b3-48fdf90d27b7	00030000-56a6-011f-94eb-4395190e05b2
00020000-56a6-0121-a807-e12a0303be2f	00030000-56a6-011f-e2a1-2f5301d36395
00020000-56a6-0121-9497-9164b7179e35	00030000-56a6-011f-7775-05454f0d6911
00020000-56a6-0121-52c8-c85f1afcbfd5	00030000-56a6-011f-b7a9-e85058ad21b6
00020000-56a6-0121-52c8-c85f1afcbfd5	00030000-56a6-011f-58fe-76b3686ddf75
00020000-56a6-0121-52c8-c85f1afcbfd5	00030000-56a6-011f-ea27-5e95b6597a30
00020000-56a6-0121-de48-7431709d2525	00030000-56a6-011f-e105-8d69e7e3f422
00020000-56a6-0121-1fb9-54fb0686a7de	00030000-56a6-011f-6a8a-4a90ed05e50b
00020000-56a6-0121-3b41-0b54aa04e131	00030000-56a6-011f-647b-1af76319fdfa
00020000-56a6-0121-e692-40cf017354aa	00030000-56a6-011f-40b3-b58f1beeadf6
00020000-56a6-0121-01b0-182bcf98a62b	00030000-56a6-011f-84df-263360e20dd6
00020000-56a6-0121-67b9-e167e52729d6	00030000-56a6-011f-d3ba-f3a639172cf7
00020000-56a6-0121-ce81-a174f3a08c79	00030000-56a6-011f-86f2-fa0fc931d3a3
00020000-56a6-0121-5e45-5f1f6a47b43f	00030000-56a6-011f-1795-239826a7978f
00020000-56a6-0121-3bb3-64ccdde03796	00030000-56a6-011f-565b-07875dd2a75a
00020000-56a6-0121-3fa5-3ba11e932a0d	00030000-56a6-011f-2b35-84366e9c2bae
00020000-56a6-0121-d4c8-7a02d9ba17a9	00030000-56a6-011f-64c5-80fe75b37b21
00020000-56a6-0121-fa1c-326b0d7b9ef8	00030000-56a6-011f-1e2f-35b09a7515dd
00020000-56a6-0121-072e-e751e4497775	00030000-56a6-011f-8d4d-983fce5ba67d
00020000-56a6-0121-197a-88a10c96a62f	00030000-56a6-011f-5e40-1f2d93a9be60
00020000-56a6-0121-9031-749bae756dca	00030000-56a6-011f-294f-e0927e48a40a
00020000-56a6-0121-370e-bf1861eb2c6e	00030000-56a6-011f-0433-2e803b20403d
00020000-56a6-0121-9a35-d027ca0f3e57	00030000-56a6-011f-179e-a18bf39fe864
00020000-56a6-0121-7cd4-ba911d5c4df8	00030000-56a6-011f-6139-595fedc1c750
00020000-56a6-0121-556e-2bcae380e4e5	00030000-56a6-011f-36a7-351cea5d73f8
\.


--
-- TOC entry 3181 (class 0 OID 40117204)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 40117239)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 40117372)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56a6-0122-93af-f0fff952e829	00090000-56a6-0122-2573-d11647f14d44	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56a6-0122-458e-7eeef12fe30a	00090000-56a6-0122-d3a1-7ab5853c7659	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56a6-0122-b195-dbc2560a5fa6	00090000-56a6-0122-d42d-307f5f654e41	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56a6-0122-a22a-b9f21840e7ac	00090000-56a6-0122-d140-5a9baade2a6b	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 40116889)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56a6-0122-d240-15a43f250b07	\N	00040000-56a6-011e-7541-c64d190be661	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a6-0122-9993-dae40a336e6c	\N	00040000-56a6-011e-7541-c64d190be661	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56a6-0122-6458-07f38af0fe4d	\N	00040000-56a6-011e-7541-c64d190be661	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a6-0122-724a-00af059ccd9c	\N	00040000-56a6-011e-7541-c64d190be661	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a6-0122-b72e-30dd494d0f7f	\N	00040000-56a6-011e-7541-c64d190be661	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a6-0122-ac62-a0ff1b3d87a6	\N	00040000-56a6-011e-bd01-227668c36732	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a6-0122-b102-8cd9f8f90769	\N	00040000-56a6-011e-f7f7-9863abe467e2	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a6-0122-0fef-e73b84955212	\N	00040000-56a6-011e-7d8a-8f65f2df3c8d	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a6-0122-90d5-83e649cfce19	\N	00040000-56a6-011e-a584-e6011479a938	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a6-0124-97e3-f93715e40f0d	\N	00040000-56a6-011e-7541-c64d190be661	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 40116934)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56a6-011e-41be-09492a850657	8341	Adlešiči
00050000-56a6-011e-8370-e15006b9fbee	5270	Ajdovščina
00050000-56a6-011e-90dd-bb49a168331f	6280	Ankaran/Ancarano
00050000-56a6-011e-7506-ad0566137fc1	9253	Apače
00050000-56a6-011e-d75d-bad94e3c4629	8253	Artiče
00050000-56a6-011e-0798-e1b39dd6f9a9	4275	Begunje na Gorenjskem
00050000-56a6-011e-5a80-b05b2006779f	1382	Begunje pri Cerknici
00050000-56a6-011e-b176-5c3438a5fa44	9231	Beltinci
00050000-56a6-011e-53ed-11c5e7770159	2234	Benedikt
00050000-56a6-011e-e733-6ecf3a535364	2345	Bistrica ob Dravi
00050000-56a6-011e-2f33-1916c5d3e549	3256	Bistrica ob Sotli
00050000-56a6-011e-d814-8e2abecf97e0	8259	Bizeljsko
00050000-56a6-011e-4e25-e32924eeb833	1223	Blagovica
00050000-56a6-011e-128b-b97eccb8fc1c	8283	Blanca
00050000-56a6-011e-9a0c-a5a7e816da26	4260	Bled
00050000-56a6-011e-2847-577895ebd74a	4273	Blejska Dobrava
00050000-56a6-011e-a65e-8e2ea786cb01	9265	Bodonci
00050000-56a6-011e-fa00-2deb8dcaa917	9222	Bogojina
00050000-56a6-011e-2c82-d3b40ecae3c7	4263	Bohinjska Bela
00050000-56a6-011e-dd47-295501a8cda2	4264	Bohinjska Bistrica
00050000-56a6-011e-b9c7-90c72f3c02d1	4265	Bohinjsko jezero
00050000-56a6-011e-234e-7b4a9d5afe7b	1353	Borovnica
00050000-56a6-011e-516f-d258cd153acd	8294	Boštanj
00050000-56a6-011e-4d1e-f5649ee46e1c	5230	Bovec
00050000-56a6-011e-08c2-e1f276342446	5295	Branik
00050000-56a6-011e-33b2-da4297322ef7	3314	Braslovče
00050000-56a6-011e-45ef-061681819954	5223	Breginj
00050000-56a6-011e-8d17-83f81c988345	8280	Brestanica
00050000-56a6-011e-c4c6-4b6027420c43	2354	Bresternica
00050000-56a6-011e-9956-ddb59c18a1ab	4243	Brezje
00050000-56a6-011e-67a6-f7ebbafd6c45	1351	Brezovica pri Ljubljani
00050000-56a6-011e-3ffe-7c632112cf08	8250	Brežice
00050000-56a6-011e-e5e1-c5bc5ee04057	4210	Brnik - Aerodrom
00050000-56a6-011e-0544-f06d01a80e6d	8321	Brusnice
00050000-56a6-011e-02b0-6ae876465046	3255	Buče
00050000-56a6-011e-7046-9bd10b28f3b8	8276	Bučka 
00050000-56a6-011e-0d50-5ea91bab01a5	9261	Cankova
00050000-56a6-011e-9f2d-c789144e8826	3000	Celje 
00050000-56a6-011e-2971-c003d66f5145	3001	Celje - poštni predali
00050000-56a6-011e-56d6-cc36d3a6dc55	4207	Cerklje na Gorenjskem
00050000-56a6-011e-4bff-a7f880547850	8263	Cerklje ob Krki
00050000-56a6-011e-0ce0-4578d600aa36	1380	Cerknica
00050000-56a6-011e-5785-dd89a927b359	5282	Cerkno
00050000-56a6-011e-ddae-c1423cf70e2c	2236	Cerkvenjak
00050000-56a6-011e-81cf-55351f83aa7d	2215	Ceršak
00050000-56a6-011e-404d-2f832fd22b04	2326	Cirkovce
00050000-56a6-011e-461d-5bd43bd04e45	2282	Cirkulane
00050000-56a6-011e-cae3-9492318c3fd0	5273	Col
00050000-56a6-011e-f00c-6ba558e439f3	8251	Čatež ob Savi
00050000-56a6-011e-70b9-fd7a03e65868	1413	Čemšenik
00050000-56a6-011e-31c7-0b4cb7a73abc	5253	Čepovan
00050000-56a6-011e-dc64-e50f0da65841	9232	Črenšovci
00050000-56a6-011e-7c00-5db418581f08	2393	Črna na Koroškem
00050000-56a6-011e-1dd5-6fa7ce7b5baf	6275	Črni Kal
00050000-56a6-011e-7906-5365d1a48365	5274	Črni Vrh nad Idrijo
00050000-56a6-011e-930f-3b42f5204e47	5262	Črniče
00050000-56a6-011e-1be1-76beac86552e	8340	Črnomelj
00050000-56a6-011e-a5fd-b6326df8f78f	6271	Dekani
00050000-56a6-011e-c7ce-489891046f44	5210	Deskle
00050000-56a6-011e-7b86-ac109b6095b0	2253	Destrnik
00050000-56a6-011e-ff98-feb9cc8bde1a	6215	Divača
00050000-56a6-011e-e416-d555bdd2d5d1	1233	Dob
00050000-56a6-011e-cf23-3a264a7141d3	3224	Dobje pri Planini
00050000-56a6-011e-5b5a-119f887ab9fa	8257	Dobova
00050000-56a6-011e-8860-99158b3c904d	1423	Dobovec
00050000-56a6-011e-7bb7-0759a9d9228b	5263	Dobravlje
00050000-56a6-011e-1607-1d98111bb22a	3204	Dobrna
00050000-56a6-011e-3ce2-82e48939f162	8211	Dobrnič
00050000-56a6-011e-3717-0323662f6557	1356	Dobrova
00050000-56a6-011e-e5e8-8d317a59cf3b	9223	Dobrovnik/Dobronak 
00050000-56a6-011e-3026-3fd15b7a89af	5212	Dobrovo v Brdih
00050000-56a6-011e-5b8a-70eaf976ac81	1431	Dol pri Hrastniku
00050000-56a6-011e-ac28-6e7c3148a7fd	1262	Dol pri Ljubljani
00050000-56a6-011e-174c-55f3319ac9ca	1273	Dole pri Litiji
00050000-56a6-011e-ee50-03ce7031f971	1331	Dolenja vas
00050000-56a6-011e-69ba-1dfd402939c5	8350	Dolenjske Toplice
00050000-56a6-011e-b73a-7bd101465ab3	1230	Domžale
00050000-56a6-011e-e1c1-cbf2e5bc494d	2252	Dornava
00050000-56a6-011e-d145-e73123c81564	5294	Dornberk
00050000-56a6-011e-1e3d-71e57caa136a	1319	Draga
00050000-56a6-011e-9a20-7e9fa86c1633	8343	Dragatuš
00050000-56a6-011e-6f94-bd33fd2d0a2d	3222	Dramlje
00050000-56a6-011e-b489-d02a031b99b9	2370	Dravograd
00050000-56a6-011e-5679-0cd6469dd2f5	4203	Duplje
00050000-56a6-011e-a589-75d529dcda22	6221	Dutovlje
00050000-56a6-011e-7d02-defe7ab572f1	8361	Dvor
00050000-56a6-011e-b79d-06c01aeb3427	2343	Fala
00050000-56a6-011e-6016-115651af5ff8	9208	Fokovci
00050000-56a6-011e-7006-b690d1af55e8	2313	Fram
00050000-56a6-011e-5e98-27168af631af	3213	Frankolovo
00050000-56a6-011e-6e3d-6d011e4bb680	1274	Gabrovka
00050000-56a6-011e-5459-9fd3fd857ce2	8254	Globoko
00050000-56a6-011e-de1a-7f5d4d7063d8	5275	Godovič
00050000-56a6-011e-7030-819889223783	4204	Golnik
00050000-56a6-011e-b285-bbf43ab7405d	3303	Gomilsko
00050000-56a6-011e-a3d1-e7f9ad069c1f	4224	Gorenja vas
00050000-56a6-011e-27f1-3a25d7f98105	3263	Gorica pri Slivnici
00050000-56a6-011e-3637-7b01530f3273	2272	Gorišnica
00050000-56a6-011e-51e5-5dbb6c173fb6	9250	Gornja Radgona
00050000-56a6-011e-8e65-ddc3546843ac	3342	Gornji Grad
00050000-56a6-011e-3c85-1c109da50c4a	4282	Gozd Martuljek
00050000-56a6-011e-699c-78af4d2fa9fb	6272	Gračišče
00050000-56a6-011e-8215-5afd27156281	9264	Grad
00050000-56a6-011e-434b-0e5ff3fb7367	8332	Gradac
00050000-56a6-011e-b938-15e9cff1de9f	1384	Grahovo
00050000-56a6-011e-fe7e-5d816491ced9	5242	Grahovo ob Bači
00050000-56a6-011e-dd47-1b85edf60b63	5251	Grgar
00050000-56a6-011e-d1b3-499cb8627c95	3302	Griže
00050000-56a6-011e-791f-f9fb4744255b	3231	Grobelno
00050000-56a6-011e-f890-2f1026b53ea4	1290	Grosuplje
00050000-56a6-011e-6c1a-b7e6e841ae97	2288	Hajdina
00050000-56a6-011e-e8a8-625a78c2d6d1	8362	Hinje
00050000-56a6-011e-7609-9e2ebad337fe	2311	Hoče
00050000-56a6-011e-11ef-99f5b11d71a0	9205	Hodoš/Hodos
00050000-56a6-011e-32d0-686d753cb0cd	1354	Horjul
00050000-56a6-011e-ce82-e63c8f47f2ab	1372	Hotedršica
00050000-56a6-011e-b226-93b835a0c06d	1430	Hrastnik
00050000-56a6-011e-88c0-2af69d6cc364	6225	Hruševje
00050000-56a6-011e-62a4-264a990ed828	4276	Hrušica
00050000-56a6-011e-4897-d0bee3efe1bd	5280	Idrija
00050000-56a6-011e-1a93-774ef642009e	1292	Ig
00050000-56a6-011e-e557-5387b68b80a1	6250	Ilirska Bistrica
00050000-56a6-011e-a908-bebcaac292a2	6251	Ilirska Bistrica-Trnovo
00050000-56a6-011e-a67d-ad15a7665845	1295	Ivančna Gorica
00050000-56a6-011e-4109-89270f4f9df4	2259	Ivanjkovci
00050000-56a6-011e-1a84-0461496459df	1411	Izlake
00050000-56a6-011e-bc17-eb6e3a980795	6310	Izola/Isola
00050000-56a6-011e-2d55-1f37f27f7977	2222	Jakobski Dol
00050000-56a6-011e-51f2-24a8b2f62790	2221	Jarenina
00050000-56a6-011e-9164-89e2b5638f89	6254	Jelšane
00050000-56a6-011e-c022-e2d727cdabdc	4270	Jesenice
00050000-56a6-011e-32cf-02e811c28e84	8261	Jesenice na Dolenjskem
00050000-56a6-011e-01fa-7adf925353b2	3273	Jurklošter
00050000-56a6-011e-5ece-aaa50c34c89b	2223	Jurovski Dol
00050000-56a6-011e-4946-00794f33bb94	2256	Juršinci
00050000-56a6-011e-01e9-80c7eda1aa96	5214	Kal nad Kanalom
00050000-56a6-011e-5df8-31ed983a6f8a	3233	Kalobje
00050000-56a6-011e-e2ec-709a0cddc933	4246	Kamna Gorica
00050000-56a6-011e-82c5-0b86c8cb07bb	2351	Kamnica
00050000-56a6-011e-9b64-200b6c2b8f8f	1241	Kamnik
00050000-56a6-011e-8207-6837331edf84	5213	Kanal
00050000-56a6-011e-f37d-f98bae472f38	8258	Kapele
00050000-56a6-011e-7794-8e69d47e40bd	2362	Kapla
00050000-56a6-011e-392a-4bf9f0155b0d	2325	Kidričevo
00050000-56a6-011e-976c-b4e95f775fcd	1412	Kisovec
00050000-56a6-011e-cfc1-5cb4b8fa1124	6253	Knežak
00050000-56a6-011e-6138-edf3c161cae0	5222	Kobarid
00050000-56a6-011e-e7fd-31a76cc14c99	9227	Kobilje
00050000-56a6-011e-28f9-27d1ca1fc1db	1330	Kočevje
00050000-56a6-011e-2803-9082c1ea3404	1338	Kočevska Reka
00050000-56a6-011e-3010-41f3aa275ba9	2276	Kog
00050000-56a6-011e-badf-c792ae8a8bb1	5211	Kojsko
00050000-56a6-011e-fc28-7c5894f4948b	6223	Komen
00050000-56a6-011e-11cb-fd05c6638215	1218	Komenda
00050000-56a6-011e-fafe-1e83efead21b	6000	Koper/Capodistria 
00050000-56a6-011e-ef0c-1468ab3ba1e3	6001	Koper/Capodistria - poštni predali
00050000-56a6-011e-02f0-0ec33f9c0d02	8282	Koprivnica
00050000-56a6-011e-1d27-a0e08aeb09f9	5296	Kostanjevica na Krasu
00050000-56a6-011e-ac0e-d87f70a2cf03	8311	Kostanjevica na Krki
00050000-56a6-011e-4c0a-226f908b55cd	1336	Kostel
00050000-56a6-011e-5201-da61282669d5	6256	Košana
00050000-56a6-011e-95d6-7a2bc6985688	2394	Kotlje
00050000-56a6-011e-f118-fd7d355b1173	6240	Kozina
00050000-56a6-011e-2f09-86fcdc8c7e0a	3260	Kozje
00050000-56a6-011e-22d9-a1f25a801561	4000	Kranj 
00050000-56a6-011e-4309-c83296866c8f	4001	Kranj - poštni predali
00050000-56a6-011e-8eb3-713eb7999b78	4280	Kranjska Gora
00050000-56a6-011e-0c8f-7cd1c910bb1e	1281	Kresnice
00050000-56a6-011e-8d2d-0e330fbe1d17	4294	Križe
00050000-56a6-011e-0e16-16fbf935467e	9206	Križevci
00050000-56a6-011e-3c81-0cb873e07e6e	9242	Križevci pri Ljutomeru
00050000-56a6-011e-8490-8e9a6af8544d	1301	Krka
00050000-56a6-011e-af7c-2b856929e80a	8296	Krmelj
00050000-56a6-011e-cb20-61390d9e2626	4245	Kropa
00050000-56a6-011e-5384-ea5f6443e9fc	8262	Krška vas
00050000-56a6-011e-362c-0a48dd207315	8270	Krško
00050000-56a6-011e-2e50-28be899fc9a2	9263	Kuzma
00050000-56a6-011e-e99c-e08490ac207b	2318	Laporje
00050000-56a6-011e-8db8-da9a339e4c20	3270	Laško
00050000-56a6-011e-2e45-22822dda0353	1219	Laze v Tuhinju
00050000-56a6-011e-6e8f-59431a7e56a1	2230	Lenart v Slovenskih goricah
00050000-56a6-011e-c9db-202715341fc9	9220	Lendava/Lendva
00050000-56a6-011e-68e7-e25f9518efa2	4248	Lesce
00050000-56a6-011e-8b56-e584b691102b	3261	Lesično
00050000-56a6-011e-9c04-dcbf70449ce6	8273	Leskovec pri Krškem
00050000-56a6-011e-e965-48dc566cecc9	2372	Libeliče
00050000-56a6-011e-4a9e-87e131e649dc	2341	Limbuš
00050000-56a6-011e-3eef-48a8abd9115c	1270	Litija
00050000-56a6-011e-f0fb-76e09204fa47	3202	Ljubečna
00050000-56a6-011e-0fbc-00484b965b4c	1000	Ljubljana 
00050000-56a6-011e-6624-b94ae8aeaa3b	1001	Ljubljana - poštni predali
00050000-56a6-011e-284e-202b0d6bd02d	1231	Ljubljana - Črnuče
00050000-56a6-011e-f484-ebefc502410d	1261	Ljubljana - Dobrunje
00050000-56a6-011e-a886-50f1596ebf4e	1260	Ljubljana - Polje
00050000-56a6-011e-db87-aac8535dafa6	1210	Ljubljana - Šentvid
00050000-56a6-011e-9595-fa1196c63b29	1211	Ljubljana - Šmartno
00050000-56a6-011e-f70b-5d82eeb88dd9	3333	Ljubno ob Savinji
00050000-56a6-011e-627e-c0ceb1789f8e	9240	Ljutomer
00050000-56a6-011e-8b19-2b7208b8cb38	3215	Loče
00050000-56a6-011e-807c-35ad91759f19	5231	Log pod Mangartom
00050000-56a6-011e-56ee-82b9091d2007	1358	Log pri Brezovici
00050000-56a6-011e-83eb-87a741ae396a	1370	Logatec
00050000-56a6-011e-5242-d9e94b326261	1371	Logatec
00050000-56a6-011e-c75a-c5402219fccf	1434	Loka pri Zidanem Mostu
00050000-56a6-011e-810b-6a1b6aaa2109	3223	Loka pri Žusmu
00050000-56a6-011e-ede3-2a75d449d456	6219	Lokev
00050000-56a6-011e-a0f0-4f4871ba7d59	1318	Loški Potok
00050000-56a6-011e-2195-ef568286cb3b	2324	Lovrenc na Dravskem polju
00050000-56a6-011e-5eaf-0ecff4e1d20a	2344	Lovrenc na Pohorju
00050000-56a6-011e-06f6-9ed503546d93	3334	Luče
00050000-56a6-011e-81f0-479cbde818d7	1225	Lukovica
00050000-56a6-011e-fc40-30694ca40c08	9202	Mačkovci
00050000-56a6-011e-559e-1240797cfa80	2322	Majšperk
00050000-56a6-011e-6730-0bc571f9f2f8	2321	Makole
00050000-56a6-011e-e401-eee98d5b2d5c	9243	Mala Nedelja
00050000-56a6-011e-3738-eacbbecb18ab	2229	Malečnik
00050000-56a6-011e-352d-e75e09805e5e	6273	Marezige
00050000-56a6-011e-e7ed-08c24d7809ac	2000	Maribor 
00050000-56a6-011e-7adb-b143b2cd0c59	2001	Maribor - poštni predali
00050000-56a6-011e-8656-164225ace584	2206	Marjeta na Dravskem polju
00050000-56a6-011e-afb9-0477ed5640b2	2281	Markovci
00050000-56a6-011e-6189-cfd1b13df46d	9221	Martjanci
00050000-56a6-011e-c367-e00614aca5b7	6242	Materija
00050000-56a6-011e-f43d-1a420b4ee7c1	4211	Mavčiče
00050000-56a6-011e-ee69-49d2ce6bb37a	1215	Medvode
00050000-56a6-011e-c75a-55dbe079a30e	1234	Mengeš
00050000-56a6-011e-f092-d1bb24f725fb	8330	Metlika
00050000-56a6-011e-a1fd-58314929f576	2392	Mežica
00050000-56a6-011e-3941-bbed9025d316	2204	Miklavž na Dravskem polju
00050000-56a6-011e-e115-80cf5ce96ed8	2275	Miklavž pri Ormožu
00050000-56a6-011e-1eb1-c4050f985e99	5291	Miren
00050000-56a6-011e-ee60-48a85f558c70	8233	Mirna
00050000-56a6-011e-1786-82fdc64fac80	8216	Mirna Peč
00050000-56a6-011e-50ec-6709e815b71a	2382	Mislinja
00050000-56a6-011e-14d0-bc61e7bfa4e0	4281	Mojstrana
00050000-56a6-011e-a61b-129c84cf33f2	8230	Mokronog
00050000-56a6-011e-9dee-22dc966a599c	1251	Moravče
00050000-56a6-011e-e6c2-a465cc8b3e7f	9226	Moravske Toplice
00050000-56a6-011e-cabf-d880cc260634	5216	Most na Soči
00050000-56a6-011e-b8e5-952b2bebe0cd	1221	Motnik
00050000-56a6-011e-6987-8349f429e536	3330	Mozirje
00050000-56a6-011e-1018-e99084ccb165	9000	Murska Sobota 
00050000-56a6-011e-2be2-ca2b3f84c540	9001	Murska Sobota - poštni predali
00050000-56a6-011e-0cf8-013b6efd09ae	2366	Muta
00050000-56a6-011e-1849-169074197246	4202	Naklo
00050000-56a6-011e-0ae5-154a0b3d2275	3331	Nazarje
00050000-56a6-011e-da7e-e5126cc97949	1357	Notranje Gorice
00050000-56a6-011e-10b3-6a0002f348e7	3203	Nova Cerkev
00050000-56a6-011e-1e13-be072eafefec	5000	Nova Gorica 
00050000-56a6-011e-fdae-bf3a4e56d366	5001	Nova Gorica - poštni predali
00050000-56a6-011e-a64b-d7908bf88e2e	1385	Nova vas
00050000-56a6-011e-b5f8-4102afe4fa34	8000	Novo mesto
00050000-56a6-011e-6617-00bf8f636ed0	8001	Novo mesto - poštni predali
00050000-56a6-011e-fe3d-30d45efdeda1	6243	Obrov
00050000-56a6-011e-428a-c131e86489a1	9233	Odranci
00050000-56a6-011e-adbe-3548025b6124	2317	Oplotnica
00050000-56a6-011e-321d-4b5b97c59b5f	2312	Orehova vas
00050000-56a6-011e-c9a2-f123d63cb812	2270	Ormož
00050000-56a6-011e-8041-4c772f26ea0b	1316	Ortnek
00050000-56a6-011e-6dcd-a215c113f1af	1337	Osilnica
00050000-56a6-011e-ed2c-1b50394f2d72	8222	Otočec
00050000-56a6-011e-f44b-b801f97ed3a7	2361	Ožbalt
00050000-56a6-011e-5941-87e0fc1df521	2231	Pernica
00050000-56a6-011e-a020-0dc9aba75faa	2211	Pesnica pri Mariboru
00050000-56a6-011e-d8ac-b889452ed7ec	9203	Petrovci
00050000-56a6-011e-cc51-ece8e11a6929	3301	Petrovče
00050000-56a6-011e-e19d-555a8d85d163	6330	Piran/Pirano
00050000-56a6-011e-acd9-2317e09d19da	8255	Pišece
00050000-56a6-011e-869c-d98fd8c509ad	6257	Pivka
00050000-56a6-011e-0783-a40c71b95c66	6232	Planina
00050000-56a6-011e-ee2b-e9515d9667e5	3225	Planina pri Sevnici
00050000-56a6-011e-dda2-a1d5d53f6548	6276	Pobegi
00050000-56a6-011e-06cf-3fb7f21e996a	8312	Podbočje
00050000-56a6-011e-1f3c-c3f2577eb671	5243	Podbrdo
00050000-56a6-011e-32b0-b8e4f420f528	3254	Podčetrtek
00050000-56a6-011e-3d91-469e60450d91	2273	Podgorci
00050000-56a6-011e-c28f-e7c217e6497a	6216	Podgorje
00050000-56a6-011e-96e1-c0ee9589882f	2381	Podgorje pri Slovenj Gradcu
00050000-56a6-011e-bda7-643a260057af	6244	Podgrad
00050000-56a6-011e-6c86-0f5a0e43df14	1414	Podkum
00050000-56a6-011e-cc28-071e99323888	2286	Podlehnik
00050000-56a6-011e-d4b7-fa1be1ac3977	5272	Podnanos
00050000-56a6-011e-d8a2-680b06772f70	4244	Podnart
00050000-56a6-011e-5386-1d0d9af72cda	3241	Podplat
00050000-56a6-011e-5101-cdd0d5b2df5c	3257	Podsreda
00050000-56a6-011e-0f14-815123ba98e9	2363	Podvelka
00050000-56a6-011e-7aaf-e87c49037605	2208	Pohorje
00050000-56a6-011e-d14d-595b64d333b8	2257	Polenšak
00050000-56a6-011e-3cb1-82875d42775e	1355	Polhov Gradec
00050000-56a6-011e-f7c2-6383618f997a	4223	Poljane nad Škofjo Loko
00050000-56a6-011e-0979-93429019d790	2319	Poljčane
00050000-56a6-011e-9952-9702a02304c0	1272	Polšnik
00050000-56a6-011e-da9a-27c2b09b96c8	3313	Polzela
00050000-56a6-011e-5654-0a512e77ee15	3232	Ponikva
00050000-56a6-011e-df98-dc8d239fac7c	6320	Portorož/Portorose
00050000-56a6-011e-1b2e-d71381df7bb8	6230	Postojna
00050000-56a6-011e-8952-210aaff295fc	2331	Pragersko
00050000-56a6-011e-8040-29b830f805c2	3312	Prebold
00050000-56a6-011e-f78e-adb83481d862	4205	Preddvor
00050000-56a6-011e-8e19-5faa51004b10	6255	Prem
00050000-56a6-011e-2e98-a20a5ae547f3	1352	Preserje
00050000-56a6-011e-e513-4fdb748d3baa	6258	Prestranek
00050000-56a6-011e-23bc-c0695dc4259f	2391	Prevalje
00050000-56a6-011e-166d-278ac9325480	3262	Prevorje
00050000-56a6-011e-fac2-7dc0c9beccbb	1276	Primskovo 
00050000-56a6-011e-b667-c2d2aedb5329	3253	Pristava pri Mestinju
00050000-56a6-011e-48e3-1ae53b6cb1d2	9207	Prosenjakovci/Partosfalva
00050000-56a6-011e-b590-f51f7b2edc30	5297	Prvačina
00050000-56a6-011e-0765-9702a1393f04	2250	Ptuj
00050000-56a6-011e-e144-992fedd0ea3a	2323	Ptujska Gora
00050000-56a6-011e-4566-82fd705c28f7	9201	Puconci
00050000-56a6-011e-1390-747785630c5c	2327	Rače
00050000-56a6-011e-ece1-7ab1af48e299	1433	Radeče
00050000-56a6-011e-8a83-dc03e086070b	9252	Radenci
00050000-56a6-011e-34d1-f138711b0794	2360	Radlje ob Dravi
00050000-56a6-011e-d6bd-2021318bc168	1235	Radomlje
00050000-56a6-011e-f729-bc323c6d486b	4240	Radovljica
00050000-56a6-011e-ab4f-acfd5ab3cd47	8274	Raka
00050000-56a6-011e-0dbc-235c92a7f4ed	1381	Rakek
00050000-56a6-011e-827a-9b310d62e07d	4283	Rateče - Planica
00050000-56a6-011e-8a7d-c74215e59750	2390	Ravne na Koroškem
00050000-56a6-011e-cd26-bc3e6897deef	9246	Razkrižje
00050000-56a6-011e-914e-81139c6ad028	3332	Rečica ob Savinji
00050000-56a6-011e-c14f-57089be943af	5292	Renče
00050000-56a6-011e-e72b-d5bbb47fb7be	1310	Ribnica
00050000-56a6-011e-fc8a-966ec2553434	2364	Ribnica na Pohorju
00050000-56a6-011e-90b9-ae295e1f1259	3272	Rimske Toplice
00050000-56a6-011e-3212-ffc5afc4d866	1314	Rob
00050000-56a6-011e-7091-9585940ba607	5215	Ročinj
00050000-56a6-011e-de63-72042d2203b4	3250	Rogaška Slatina
00050000-56a6-011e-6d4e-9dc760289937	9262	Rogašovci
00050000-56a6-011e-8d1a-04fc44b9fcf9	3252	Rogatec
00050000-56a6-011e-5654-8463a143ef23	1373	Rovte
00050000-56a6-011e-92e2-3116c76cea84	2342	Ruše
00050000-56a6-011e-cef6-204f23cde868	1282	Sava
00050000-56a6-011e-6095-40fdbef42a40	6333	Sečovlje/Sicciole
00050000-56a6-011e-26fd-8af52eda97f8	4227	Selca
00050000-56a6-011e-6e25-dacea3d24361	2352	Selnica ob Dravi
00050000-56a6-011e-c8ca-36f29feec808	8333	Semič
00050000-56a6-011e-7357-6048a8ac090f	8281	Senovo
00050000-56a6-011e-4d9b-269586b7560d	6224	Senožeče
00050000-56a6-011e-f599-830dd7614e19	8290	Sevnica
00050000-56a6-011e-eb0c-d9fafc7a115b	6210	Sežana
00050000-56a6-011e-d746-a5ea4923b6ac	2214	Sladki Vrh
00050000-56a6-011e-44a8-e08d505619d1	5283	Slap ob Idrijci
00050000-56a6-011e-5c79-3dd0b5abb1ad	2380	Slovenj Gradec
00050000-56a6-011e-c4d7-5f4e93b10426	2310	Slovenska Bistrica
00050000-56a6-011e-93e6-11adea84b829	3210	Slovenske Konjice
00050000-56a6-011e-5174-478c33b3843c	1216	Smlednik
00050000-56a6-011e-e282-a8c8a187ff2e	5232	Soča
00050000-56a6-011e-170a-e6c4d9b92d90	1317	Sodražica
00050000-56a6-011e-46fe-8eb4aeb2f26d	3335	Solčava
00050000-56a6-011e-face-6dfe405a870e	5250	Solkan
00050000-56a6-011e-f672-777984103999	4229	Sorica
00050000-56a6-011e-0f80-18779777ccbe	4225	Sovodenj
00050000-56a6-011e-8b24-7d7922588435	5281	Spodnja Idrija
00050000-56a6-011e-237b-8863370c2e5f	2241	Spodnji Duplek
00050000-56a6-011e-390c-2720aaa1eb4b	9245	Spodnji Ivanjci
00050000-56a6-011e-9408-4a5ccc0a4485	2277	Središče ob Dravi
00050000-56a6-011e-909b-a76aa5de424b	4267	Srednja vas v Bohinju
00050000-56a6-011e-10d5-bf782f1b8ef4	8256	Sromlje 
00050000-56a6-011e-70b9-fbcfcdac4f64	5224	Srpenica
00050000-56a6-011e-576f-93c918ca545b	1242	Stahovica
00050000-56a6-011e-cf7e-00279ccda595	1332	Stara Cerkev
00050000-56a6-011e-6103-565c6c014945	8342	Stari trg ob Kolpi
00050000-56a6-011e-d133-a6849c5f0315	1386	Stari trg pri Ložu
00050000-56a6-011e-ea6a-69d99f3ada72	2205	Starše
00050000-56a6-011e-294f-e5f36d7150a4	2289	Stoperce
00050000-56a6-011e-1b36-5e81015e5cad	8322	Stopiče
00050000-56a6-011e-1cf7-71be8330da16	3206	Stranice
00050000-56a6-011e-cf3c-9a23f3e29552	8351	Straža
00050000-56a6-011e-6aa5-7bd536d5d05b	1313	Struge
00050000-56a6-011e-74f7-037deb3270fe	8293	Studenec
00050000-56a6-011e-7140-7bb5fee7e7de	8331	Suhor
00050000-56a6-011e-a3b7-926a01cfb5b5	2233	Sv. Ana v Slovenskih goricah
00050000-56a6-011e-2080-4f229491266c	2235	Sv. Trojica v Slovenskih goricah
00050000-56a6-011e-0f1b-8f153e28d37f	2353	Sveti Duh na Ostrem Vrhu
00050000-56a6-011e-a22b-5911f2b67ba6	9244	Sveti Jurij ob Ščavnici
00050000-56a6-011e-3e71-6a0cec42fc88	3264	Sveti Štefan
00050000-56a6-011e-0c03-54c1ffd98ba3	2258	Sveti Tomaž
00050000-56a6-011e-3b95-c5570be782b5	9204	Šalovci
00050000-56a6-011e-e4c2-9cb050a70e30	5261	Šempas
00050000-56a6-011e-8011-780964cf40f4	5290	Šempeter pri Gorici
00050000-56a6-011e-dd3b-560b0f92d904	3311	Šempeter v Savinjski dolini
00050000-56a6-011e-3f89-63308d48a433	4208	Šenčur
00050000-56a6-011e-41e0-a462b9c7d26c	2212	Šentilj v Slovenskih goricah
00050000-56a6-011e-f04e-92883926ae69	8297	Šentjanž
00050000-56a6-011e-7a8f-52cc29d94703	2373	Šentjanž pri Dravogradu
00050000-56a6-011e-5f31-c7aa077c84f4	8310	Šentjernej
00050000-56a6-011e-092e-352705ca2b2b	3230	Šentjur
00050000-56a6-011e-657c-8b30be7ff671	3271	Šentrupert
00050000-56a6-011e-17b7-4e2cbae6f324	8232	Šentrupert
00050000-56a6-011e-4803-0c5417283ace	1296	Šentvid pri Stični
00050000-56a6-011e-c261-14a7070f4a08	8275	Škocjan
00050000-56a6-011e-4540-621870d8f934	6281	Škofije
00050000-56a6-011e-9b5b-570e9487e52f	4220	Škofja Loka
00050000-56a6-011e-ebba-15e818c91e45	3211	Škofja vas
00050000-56a6-011e-49cd-98e825d0c74f	1291	Škofljica
00050000-56a6-011e-977a-dfa8e03f47d6	6274	Šmarje
00050000-56a6-011e-2920-bc4cee716b06	1293	Šmarje - Sap
00050000-56a6-011e-c886-593c3e96c374	3240	Šmarje pri Jelšah
00050000-56a6-011e-a77b-885a484e745e	8220	Šmarješke Toplice
00050000-56a6-011e-2e4b-138fd81fc4a7	2315	Šmartno na Pohorju
00050000-56a6-011e-ede4-8e44712e6da1	3341	Šmartno ob Dreti
00050000-56a6-011e-64dd-987b5d6e2eb6	3327	Šmartno ob Paki
00050000-56a6-011e-5a51-5dc008aa9982	1275	Šmartno pri Litiji
00050000-56a6-011e-3910-7efea64b14b8	2383	Šmartno pri Slovenj Gradcu
00050000-56a6-011e-fa68-66a6582809b7	3201	Šmartno v Rožni dolini
00050000-56a6-011e-0b24-c8b530480025	3325	Šoštanj
00050000-56a6-011e-2d88-48072461b066	6222	Štanjel
00050000-56a6-011e-8416-44ad636473c5	3220	Štore
00050000-56a6-011e-bae9-b0c79c214abb	3304	Tabor
00050000-56a6-011e-5e50-61fb9d0f6e57	3221	Teharje
00050000-56a6-011e-0af2-aaae444bb4ae	9251	Tišina
00050000-56a6-011e-ed5f-dad08c22844a	5220	Tolmin
00050000-56a6-011e-101e-6d53f386e102	3326	Topolšica
00050000-56a6-011e-4843-5531f633e0e3	2371	Trbonje
00050000-56a6-011e-f2df-affc4ca2e637	1420	Trbovlje
00050000-56a6-011e-aea9-20ad68dbbf28	8231	Trebelno 
00050000-56a6-011e-103a-2f843eda13ab	8210	Trebnje
00050000-56a6-011e-83f4-f87d1746c5ce	5252	Trnovo pri Gorici
00050000-56a6-011e-faf2-113f18a782de	2254	Trnovska vas
00050000-56a6-011e-32ab-f9352802d567	1222	Trojane
00050000-56a6-011e-a499-e9b96945e71b	1236	Trzin
00050000-56a6-011e-528a-23d14887a47e	4290	Tržič
00050000-56a6-011e-f014-ea4d07efc09d	8295	Tržišče
00050000-56a6-011e-f12a-febe880758d8	1311	Turjak
00050000-56a6-011e-04c7-545c1a501b6c	9224	Turnišče
00050000-56a6-011e-15e9-f170e965723e	8323	Uršna sela
00050000-56a6-011e-4f5e-c70e7c2bfc8a	1252	Vače
00050000-56a6-011e-4295-92ff49a7c1e6	3320	Velenje 
00050000-56a6-011e-173a-b18d626184ed	3322	Velenje - poštni predali
00050000-56a6-011e-c61f-55e1f340985c	8212	Velika Loka
00050000-56a6-011e-0b5b-a0308018c2db	2274	Velika Nedelja
00050000-56a6-011e-a017-fca5e9936d44	9225	Velika Polana
00050000-56a6-011e-8259-9555c663a966	1315	Velike Lašče
00050000-56a6-011e-0619-3db42b3d43ef	8213	Veliki Gaber
00050000-56a6-011e-cf23-61c35b66f60f	9241	Veržej
00050000-56a6-011e-3dda-b29e476024c0	1312	Videm - Dobrepolje
00050000-56a6-011e-abfe-eb584ba4be92	2284	Videm pri Ptuju
00050000-56a6-011e-f6f1-c28dd7393b43	8344	Vinica
00050000-56a6-011e-eb33-8d868b8b0393	5271	Vipava
00050000-56a6-011e-8530-09861cd5e7ac	4212	Visoko
00050000-56a6-011e-9716-603d4aa6fe1c	1294	Višnja Gora
00050000-56a6-011e-8200-e5e8edbac784	3205	Vitanje
00050000-56a6-011e-c413-c485192cdf75	2255	Vitomarci
00050000-56a6-011e-b7ec-2f345320ad6e	1217	Vodice
00050000-56a6-011e-a3f9-2e75e8ddea05	3212	Vojnik\t
00050000-56a6-011e-f9b8-0467f48b114a	5293	Volčja Draga
00050000-56a6-011e-7e32-18e90331116a	2232	Voličina
00050000-56a6-011e-f063-792f5882806e	3305	Vransko
00050000-56a6-011e-c81a-556c83b25830	6217	Vremski Britof
00050000-56a6-011e-b4e4-e21568f31d60	1360	Vrhnika
00050000-56a6-011e-5f5a-7ad2b05a7faf	2365	Vuhred
00050000-56a6-011e-4faa-fa3afcf84efd	2367	Vuzenica
00050000-56a6-011e-c25a-3bde1bc86f01	8292	Zabukovje 
00050000-56a6-011e-1e7b-0b628c3a1205	1410	Zagorje ob Savi
00050000-56a6-011e-1c34-8cb50aa42c4c	1303	Zagradec
00050000-56a6-011e-b984-a726207a1a68	2283	Zavrč
00050000-56a6-011e-52da-dd7bb50b789d	8272	Zdole 
00050000-56a6-011e-dec6-e91811d0e30f	4201	Zgornja Besnica
00050000-56a6-011e-3c23-fc7a9a979389	2242	Zgornja Korena
00050000-56a6-011e-9146-2fe0635c713e	2201	Zgornja Kungota
00050000-56a6-011e-7a46-3150bb0ffb2c	2316	Zgornja Ložnica
00050000-56a6-011e-9db1-0c5c29605d87	2314	Zgornja Polskava
00050000-56a6-011e-1eba-6e50f081a2c0	2213	Zgornja Velka
00050000-56a6-011e-7a11-eddacff15338	4247	Zgornje Gorje
00050000-56a6-011e-09b5-b55417161fb9	4206	Zgornje Jezersko
00050000-56a6-011e-5523-3c7da15b8dc9	2285	Zgornji Leskovec
00050000-56a6-011e-92d9-bf0d27acbd6e	1432	Zidani Most
00050000-56a6-011e-b6b2-0dd566f9480c	3214	Zreče
00050000-56a6-011e-6ee3-9ba227ef5b5f	4209	Žabnica
00050000-56a6-011e-aef6-427bf29cf192	3310	Žalec
00050000-56a6-011e-1556-6eb63c9a6c4c	4228	Železniki
00050000-56a6-011e-b5fb-28195f7fa777	2287	Žetale
00050000-56a6-011e-e092-5f31ed260827	4226	Žiri
00050000-56a6-011e-3fa2-c4fe03a0e56e	4274	Žirovnica
00050000-56a6-011e-efcd-2bd9e7010e97	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 40117609)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 40117179)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 40116919)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56a6-0122-321e-161565531aee	00080000-56a6-0122-d240-15a43f250b07	\N	00040000-56a6-011e-7541-c64d190be661	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56a6-0122-53d4-befc108eeab0	00080000-56a6-0122-d240-15a43f250b07	\N	00040000-56a6-011e-7541-c64d190be661	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56a6-0122-b9f1-1f0d3f92ae51	00080000-56a6-0122-9993-dae40a336e6c	\N	00040000-56a6-011e-7541-c64d190be661	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 40117055)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56a6-011e-7ea8-c31604a0a744	novo leto	1	1	\N	t
00430000-56a6-011e-301f-c20c85e1ee4d	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56a6-011e-d9c4-fb88d4cb50ef	dan upora proti okupatorju	27	4	\N	t
00430000-56a6-011e-cc73-762211b16bf7	praznik dela	1	5	\N	t
00430000-56a6-011e-8fc7-40afa77dabb1	praznik dela	2	5	\N	t
00430000-56a6-011e-348b-484d8d6b5c79	dan Primoža Trubarja	8	6	\N	f
00430000-56a6-011e-5823-36357f43009e	dan državnosti	25	6	\N	t
00430000-56a6-011e-a7e7-c431c49bb98d	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56a6-011f-a024-10fdc9c4d724	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56a6-011f-6594-a1d76dea2d48	dan suverenosti	25	10	\N	f
00430000-56a6-011f-4c4e-5617ac4ae7e5	dan spomina na mrtve	1	11	\N	t
00430000-56a6-011f-8c92-21b829220e84	dan Rudolfa Maistra	23	11	\N	f
00430000-56a6-011f-9f3b-4e6ea15c9fd2	božič	25	12	\N	t
00430000-56a6-011f-2c46-a12f8c892b32	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56a6-011f-5afe-096f7a002c9c	Marijino vnebovzetje	15	8	\N	t
00430000-56a6-011f-29ab-40501ff77754	dan reformacije	31	10	\N	t
00430000-56a6-011f-db94-f1070e83ce18	velikonočna nedelja	27	3	2016	t
00430000-56a6-011f-02b3-be0604704071	velikonočna nedelja	16	4	2017	t
00430000-56a6-011f-77ab-4c1df121fe59	velikonočna nedelja	1	4	2018	t
00430000-56a6-011f-d719-816b3c12f4f9	velikonočna nedelja	21	4	2019	t
00430000-56a6-011f-b56c-3ba281f4ed2a	velikonočna nedelja	12	4	2020	t
00430000-56a6-011f-cbcf-152ed063b14e	velikonočna nedelja	4	4	2021	t
00430000-56a6-011f-40cc-274a526dfe00	velikonočna nedelja	17	4	2022	t
00430000-56a6-011f-02d0-71f5b7d3fcab	velikonočna nedelja	9	4	2023	t
00430000-56a6-011f-f0f9-b258c47bd826	velikonočna nedelja	31	3	2024	t
00430000-56a6-011f-d684-57f121176138	velikonočna nedelja	20	4	2025	t
00430000-56a6-011f-3a18-04d0318b6a76	velikonočna nedelja	5	4	2026	t
00430000-56a6-011f-a9db-24c20ff1beae	velikonočna nedelja	28	3	2027	t
00430000-56a6-011f-88a7-fd38fe3b8bc4	velikonočna nedelja	16	4	2028	t
00430000-56a6-011f-58c3-fda56d5bc1a3	velikonočna nedelja	1	4	2029	t
00430000-56a6-011f-fc46-56c483259d0f	velikonočna nedelja	21	4	2030	t
00430000-56a6-011f-f490-56cb974a2672	velikonočni ponedeljek	28	3	2016	t
00430000-56a6-011f-807f-0c973780562b	velikonočni ponedeljek	17	4	2017	t
00430000-56a6-011f-dbe0-a1c906bffe14	velikonočni ponedeljek	2	4	2018	t
00430000-56a6-011f-cea3-9d2ad1bb6b1c	velikonočni ponedeljek	22	4	2019	t
00430000-56a6-011f-80b8-b9447bc2e45f	velikonočni ponedeljek	13	4	2020	t
00430000-56a6-011f-e720-568016a1b780	velikonočni ponedeljek	5	4	2021	t
00430000-56a6-011f-59b8-626e36426c86	velikonočni ponedeljek	18	4	2022	t
00430000-56a6-011f-1de8-eecc87a5bcdf	velikonočni ponedeljek	10	4	2023	t
00430000-56a6-011f-ccc5-c10899361169	velikonočni ponedeljek	1	4	2024	t
00430000-56a6-011f-eb7f-d355c981d80f	velikonočni ponedeljek	21	4	2025	t
00430000-56a6-011f-1cf5-0ddb8b99fea3	velikonočni ponedeljek	6	4	2026	t
00430000-56a6-011f-54b2-faed3328e8d0	velikonočni ponedeljek	29	3	2027	t
00430000-56a6-011f-ef21-eb8ba0088c12	velikonočni ponedeljek	17	4	2028	t
00430000-56a6-011f-f737-328358685527	velikonočni ponedeljek	2	4	2029	t
00430000-56a6-011f-8094-f09f4f285dd9	velikonočni ponedeljek	22	4	2030	t
00430000-56a6-011f-3c79-b4183ce5bf42	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56a6-011f-18c3-8e80c7a11a38	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56a6-011f-bbea-7027b39afc63	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56a6-011f-d1d7-9ba56b72ae30	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56a6-011f-3c24-4dcdf9fccef3	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56a6-011f-f8ac-fd2a50e05817	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56a6-011f-c8ce-bc7de38888b1	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56a6-011f-b911-4061ddf30a07	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56a6-011f-3e21-fb2ea6809e17	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56a6-011f-36b0-3a0b16ab3ff9	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56a6-011f-fa50-75ea525eeb74	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56a6-011f-15e7-cd7718d378e7	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56a6-011f-ce1b-753dffc45cb3	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56a6-011f-6ca6-9697cbc8fc95	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56a6-011f-a329-b698944ecc0d	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 40117023)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, zaporednasez) FROM stdin;
001b0000-56a6-0122-43b8-5e38c8e3c0c6	000e0000-56a6-0122-eac3-90caeccd82be	\N	1	\N
001b0000-56a6-0122-8126-1e28fcdeadd6	000e0000-56a6-0122-eac3-90caeccd82be	\N	2	\N
001b0000-56a6-0122-1bd2-86d9ee8272e6	000e0000-56a6-0122-eac3-90caeccd82be	\N	3	\N
\.


--
-- TOC entry 3161 (class 0 OID 40117030)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56a6-0122-43b8-5e38c8e3c0c6	000a0000-56a6-0121-5f2b-d8c339a4f7ff
001b0000-56a6-0122-43b8-5e38c8e3c0c6	000a0000-56a6-0121-1a9e-dd8a3fe57e9f
001b0000-56a6-0122-8126-1e28fcdeadd6	000a0000-56a6-0121-1a9e-dd8a3fe57e9f
001b0000-56a6-0122-8126-1e28fcdeadd6	000a0000-56a6-0121-d3bf-16990cb3fd48
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 40117191)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 40117623)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 40117633)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56a6-0122-bd65-528404a0dcef	00080000-56a6-0122-6458-07f38af0fe4d	0987	AK
00190000-56a6-0122-274d-c93ee3f3bb45	00080000-56a6-0122-9993-dae40a336e6c	0989	AK
00190000-56a6-0122-3850-a70c6509804f	00080000-56a6-0122-724a-00af059ccd9c	0986	AK
00190000-56a6-0122-6483-69703fe7206c	00080000-56a6-0122-ac62-a0ff1b3d87a6	0984	AK
00190000-56a6-0122-4ef0-5e72c953c231	00080000-56a6-0122-b102-8cd9f8f90769	0983	AK
00190000-56a6-0122-dd0f-644982221154	00080000-56a6-0122-0fef-e73b84955212	0982	AK
00190000-56a6-0124-d772-6fd1ec4770cf	00080000-56a6-0124-97e3-f93715e40f0d	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 40117522)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56a6-0122-3c7d-3765fe61eaea	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 40117641)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 40117219)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56a6-0121-91a2-f1908dd65d1a	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56a6-0121-ce4f-48aff9e7eef2	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56a6-0122-137d-52deb7f6a275	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56a6-0122-fd7b-30f4e511cd53	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56a6-0122-4bce-24477cb28bb1	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56a6-0122-a4b6-0f24e46d79b0	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56a6-0122-323b-8aae15869e1d	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 40117164)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 40117154)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 40117361)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 40117291)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 40116997)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 40116758)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56a6-0124-97e3-f93715e40f0d	00010000-56a6-011f-95e8-d9fe96edcfeb	2016-01-25 12:04:04	INS	a:0:{}
2	App\\Entity\\Option	00000000-56a6-0124-2085-a6e3a23b28b4	00010000-56a6-011f-95e8-d9fe96edcfeb	2016-01-25 12:04:04	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56a6-0124-d772-6fd1ec4770cf	00010000-56a6-011f-95e8-d9fe96edcfeb	2016-01-25 12:04:04	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 40117233)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 40116796)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56a6-011f-9e57-6d05a1f8db9a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56a6-011f-55bc-c1e9d23d88e1	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56a6-011f-05eb-9d1d1c49b83b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56a6-011f-5288-dc0d89966a33	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56a6-011f-01d7-7b6dd9c33016	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56a6-011f-e852-09b4f6e7eda4	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56a6-011f-944b-9d774bcab808	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56a6-011f-f2e2-f678bd80ec35	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56a6-011f-afe4-da9e70504278	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a6-011f-3ca1-0bf25767612e	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a6-011f-e133-626bc1cd3dd5	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a6-011f-46aa-f83252c782f4	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a6-011f-d9a3-44e880e769f1	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a6-011f-0c3a-c43978506d52	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a6-011f-ff1a-32b6993392f0	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a6-011f-b6f8-705440747947	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a6-011f-f242-b71a72ba3061	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56a6-011f-d763-02f39576f14e	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56a6-011f-9324-99524192771a	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56a6-011f-fe53-d5e6f3c493bc	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56a6-011f-3ddc-34aadb8b46d4	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a6-011f-7af9-2034b9322c6e	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a6-011f-3d3e-80f607f5f0a2	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a6-011f-2610-4efdd9f8fdb8	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a6-011f-67c7-60c9b765e0ef	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56a6-011f-ac2b-8435d4e7d7f9	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56a6-011f-0132-1a7ab9290f25	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56a6-011f-91f6-8e1f8534c63e	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56a6-011f-67c6-a6588b6dfe08	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56a6-011f-7445-46e3d0b52037	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56a6-011f-5dd3-0145f1b5cfb5	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56a6-011f-ffaa-cd47bcefa72f	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56a6-011f-8039-8c17569763c3	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56a6-011f-368d-1d356cbcfc0e	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56a6-011f-80ce-7f40a9523ea9	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56a6-011f-15ac-ae7d1d64bd21	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56a6-011f-4685-64a9556c11bb	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56a6-011f-76ad-0553bb5f53bf	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56a6-011f-6d1c-596b5140ffe1	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56a6-011f-d7f5-5cc40f3ee2f2	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56a6-011f-0fd8-5db4f9f1ba37	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56a6-011f-f575-a35bb3576ff2	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56a6-011f-7fa0-8f75c5b76923	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a6-011f-229b-6001a5972731	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a6-011f-5826-7c14318296c2	direktor	minimalne pravice za direktorja	t
00020000-56a6-011f-7613-ede9ab4e40c5	arhivar	arhivar	t
00020000-56a6-011f-df58-37801aa0f7ac	dramaturg	dramaturg	t
00020000-56a6-011f-ee50-24eef433e60e	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56a6-011f-59e6-8ebec2812c10	poslovni-sekretar	poslovni sekretar	t
00020000-56a6-011f-af93-bee28a1cf041	vodja-tehnike	vodja tehnike	t
00020000-56a6-011f-b0c6-c664c3291d22	racunovodja	računovodja	t
00020000-56a6-0121-ef57-30441fe41723	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56a6-0121-2db3-3630b513e86e	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-ed27-db9793afb902	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-e40c-53908cce6676	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-6110-a8cc77384fbb	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-ced4-f0a2d643b32e	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-915d-3d996ff7c62d	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-b3fc-e15bb1a5da7f	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-2f45-c3e14e5d70cd	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-bc5a-60bfad0ab6d1	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-c9b0-dccf7058c8ec	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-784b-87f4c024d1dc	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-9550-675a6331481e	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-de81-8a99b6fc6ca2	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-49cc-b988c8b39819	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-8a10-fcec1ed33972	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-64b3-48fdf90d27b7	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-a807-e12a0303be2f	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-9497-9164b7179e35	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-52c8-c85f1afcbfd5	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56a6-0121-de48-7431709d2525	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-1fb9-54fb0686a7de	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-3b41-0b54aa04e131	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-e692-40cf017354aa	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-01b0-182bcf98a62b	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-67b9-e167e52729d6	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-ce81-a174f3a08c79	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-5e45-5f1f6a47b43f	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-3bb3-64ccdde03796	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-3fa5-3ba11e932a0d	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-d4c8-7a02d9ba17a9	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-fa1c-326b0d7b9ef8	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-072e-e751e4497775	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-197a-88a10c96a62f	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-9031-749bae756dca	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-370e-bf1861eb2c6e	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-9a35-d027ca0f3e57	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-7cd4-ba911d5c4df8	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56a6-0121-556e-2bcae380e4e5	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 40116780)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56a6-011f-5ece-3e418bf39bda	00020000-56a6-011f-05eb-9d1d1c49b83b
00010000-56a6-011f-95e8-d9fe96edcfeb	00020000-56a6-011f-05eb-9d1d1c49b83b
00010000-56a6-0122-64a1-9b5e5eea90b5	00020000-56a6-0121-ef57-30441fe41723
00010000-56a6-0122-92f7-b20f8a1a6a8e	00020000-56a6-0121-2db3-3630b513e86e
00010000-56a6-0122-92f7-b20f8a1a6a8e	00020000-56a6-0121-ced4-f0a2d643b32e
00010000-56a6-0122-92f7-b20f8a1a6a8e	00020000-56a6-0121-bc5a-60bfad0ab6d1
00010000-56a6-0122-92f7-b20f8a1a6a8e	00020000-56a6-0121-784b-87f4c024d1dc
00010000-56a6-0122-92f7-b20f8a1a6a8e	00020000-56a6-0121-de81-8a99b6fc6ca2
00010000-56a6-0122-92f7-b20f8a1a6a8e	00020000-56a6-0121-9497-9164b7179e35
00010000-56a6-0122-92f7-b20f8a1a6a8e	00020000-56a6-0121-e40c-53908cce6676
00010000-56a6-0122-92f7-b20f8a1a6a8e	00020000-56a6-0121-de48-7431709d2525
00010000-56a6-0122-92f7-b20f8a1a6a8e	00020000-56a6-0121-e692-40cf017354aa
00010000-56a6-0122-92f7-b20f8a1a6a8e	00020000-56a6-0121-67b9-e167e52729d6
00010000-56a6-0122-92f7-b20f8a1a6a8e	00020000-56a6-0121-5e45-5f1f6a47b43f
00010000-56a6-0122-92f7-b20f8a1a6a8e	00020000-56a6-0121-3fa5-3ba11e932a0d
00010000-56a6-0122-92f7-b20f8a1a6a8e	00020000-56a6-0121-197a-88a10c96a62f
00010000-56a6-0122-603f-5e1b05bc5477	00020000-56a6-0121-2db3-3630b513e86e
00010000-56a6-0122-603f-5e1b05bc5477	00020000-56a6-0121-ed27-db9793afb902
00010000-56a6-0122-603f-5e1b05bc5477	00020000-56a6-0121-e40c-53908cce6676
00010000-56a6-0122-603f-5e1b05bc5477	00020000-56a6-0121-6110-a8cc77384fbb
00010000-56a6-0122-603f-5e1b05bc5477	00020000-56a6-0121-de81-8a99b6fc6ca2
00010000-56a6-0122-603f-5e1b05bc5477	00020000-56a6-0121-64b3-48fdf90d27b7
00010000-56a6-0122-603f-5e1b05bc5477	00020000-56a6-0121-de48-7431709d2525
00010000-56a6-0122-603f-5e1b05bc5477	00020000-56a6-0121-e692-40cf017354aa
00010000-56a6-0122-603f-5e1b05bc5477	00020000-56a6-0121-67b9-e167e52729d6
00010000-56a6-0122-603f-5e1b05bc5477	00020000-56a6-0121-5e45-5f1f6a47b43f
00010000-56a6-0122-603f-5e1b05bc5477	00020000-56a6-0121-3fa5-3ba11e932a0d
00010000-56a6-0122-603f-5e1b05bc5477	00020000-56a6-0121-197a-88a10c96a62f
00010000-56a6-0122-c742-097542d6b5da	00020000-56a6-0121-2db3-3630b513e86e
00010000-56a6-0122-c742-097542d6b5da	00020000-56a6-0121-ed27-db9793afb902
00010000-56a6-0122-c742-097542d6b5da	00020000-56a6-0121-e40c-53908cce6676
00010000-56a6-0122-c742-097542d6b5da	00020000-56a6-0121-6110-a8cc77384fbb
00010000-56a6-0122-c742-097542d6b5da	00020000-56a6-0121-784b-87f4c024d1dc
00010000-56a6-0122-c742-097542d6b5da	00020000-56a6-0121-de81-8a99b6fc6ca2
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-ed27-db9793afb902
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-915d-3d996ff7c62d
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-c9b0-dccf7058c8ec
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-9550-675a6331481e
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-784b-87f4c024d1dc
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-a807-e12a0303be2f
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-de81-8a99b6fc6ca2
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-49cc-b988c8b39819
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-de48-7431709d2525
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-1fb9-54fb0686a7de
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-e692-40cf017354aa
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-01b0-182bcf98a62b
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-67b9-e167e52729d6
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-ce81-a174f3a08c79
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-5e45-5f1f6a47b43f
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-3bb3-64ccdde03796
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-3fa5-3ba11e932a0d
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-d4c8-7a02d9ba17a9
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-197a-88a10c96a62f
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-9031-749bae756dca
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-9a35-d027ca0f3e57
00010000-56a6-0122-c0f0-b6da49603cdc	00020000-56a6-0121-7cd4-ba911d5c4df8
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-ed27-db9793afb902
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-915d-3d996ff7c62d
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-2f45-c3e14e5d70cd
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-c9b0-dccf7058c8ec
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-9550-675a6331481e
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-784b-87f4c024d1dc
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-a807-e12a0303be2f
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-de81-8a99b6fc6ca2
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-49cc-b988c8b39819
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-8a10-fcec1ed33972
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-de48-7431709d2525
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-1fb9-54fb0686a7de
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-3b41-0b54aa04e131
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-e692-40cf017354aa
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-01b0-182bcf98a62b
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-67b9-e167e52729d6
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-ce81-a174f3a08c79
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-5e45-5f1f6a47b43f
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-3bb3-64ccdde03796
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-3fa5-3ba11e932a0d
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-d4c8-7a02d9ba17a9
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-197a-88a10c96a62f
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-9031-749bae756dca
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-370e-bf1861eb2c6e
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-9a35-d027ca0f3e57
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-7cd4-ba911d5c4df8
00010000-56a6-0122-d2cb-02e27775b116	00020000-56a6-0121-556e-2bcae380e4e5
00010000-56a6-0122-c6b6-6b01e648bdf4	00020000-56a6-0121-ed27-db9793afb902
00010000-56a6-0122-c6b6-6b01e648bdf4	00020000-56a6-0121-e40c-53908cce6676
00010000-56a6-0122-c6b6-6b01e648bdf4	00020000-56a6-0121-915d-3d996ff7c62d
00010000-56a6-0122-c6b6-6b01e648bdf4	00020000-56a6-0121-b3fc-e15bb1a5da7f
00010000-56a6-0122-c6b6-6b01e648bdf4	00020000-56a6-0121-2f45-c3e14e5d70cd
00010000-56a6-0122-c6b6-6b01e648bdf4	00020000-56a6-0121-ced4-f0a2d643b32e
00010000-56a6-0122-c6b6-6b01e648bdf4	00020000-56a6-0121-c9b0-dccf7058c8ec
00010000-56a6-0122-c6b6-6b01e648bdf4	00020000-56a6-0121-9550-675a6331481e
00010000-56a6-0122-c6b6-6b01e648bdf4	00020000-56a6-0121-784b-87f4c024d1dc
00010000-56a6-0122-c6b6-6b01e648bdf4	00020000-56a6-0121-a807-e12a0303be2f
00010000-56a6-0122-7712-bc76f099a284	00020000-56a6-0121-2db3-3630b513e86e
00010000-56a6-0122-7712-bc76f099a284	00020000-56a6-0121-6110-a8cc77384fbb
00010000-56a6-0122-7712-bc76f099a284	00020000-56a6-0121-ced4-f0a2d643b32e
00010000-56a6-0122-7712-bc76f099a284	00020000-56a6-0121-bc5a-60bfad0ab6d1
00010000-56a6-0122-7712-bc76f099a284	00020000-56a6-0121-784b-87f4c024d1dc
00010000-56a6-0122-7712-bc76f099a284	00020000-56a6-0121-de81-8a99b6fc6ca2
00010000-56a6-0122-7712-bc76f099a284	00020000-56a6-0121-9497-9164b7179e35
00010000-56a6-0122-7712-bc76f099a284	00020000-56a6-0121-fa1c-326b0d7b9ef8
00010000-56a6-0122-f3f1-5c843b54cfac	00020000-56a6-0121-52c8-c85f1afcbfd5
00010000-56a6-0122-38b9-240b1cfbd43b	00020000-56a6-011f-5826-7c14318296c2
00010000-56a6-0122-0028-c44c2852dbc9	00020000-56a6-011f-7613-ede9ab4e40c5
00010000-56a6-0122-1a1f-fe3f1fc32119	00020000-56a6-011f-df58-37801aa0f7ac
00010000-56a6-0122-7392-f96afb839a0a	00020000-56a6-011f-ee50-24eef433e60e
00010000-56a6-0122-bd9f-8467efea548c	00020000-56a6-011f-59e6-8ebec2812c10
00010000-56a6-0122-8d85-a26c51994548	00020000-56a6-011f-af93-bee28a1cf041
00010000-56a6-0122-1565-b7a6812dcfd4	00020000-56a6-011f-b0c6-c664c3291d22
\.


--
-- TOC entry 3186 (class 0 OID 40117247)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 40117185)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 40117108)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56a6-0121-a8cd-5e2aa447931b	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56a6-0121-9adf-b1998012bf74	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56a6-0121-6b02-1721f92062de	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56a6-0121-93d5-025d66a7c40c	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 40116745)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56a6-011e-df4c-65f80948dbff	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56a6-011e-97be-e4b23bac218b	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56a6-011e-a67b-ae1a21a6691d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56a6-011e-1227-3dfb43df885b	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56a6-011e-0098-0f4676249dba	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 40116737)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56a6-011e-ead7-9946e21fac1c	00230000-56a6-011e-1227-3dfb43df885b	popa
00240000-56a6-011e-701e-667db25b744c	00230000-56a6-011e-1227-3dfb43df885b	oseba
00240000-56a6-011e-0559-ff5228af7d22	00230000-56a6-011e-1227-3dfb43df885b	tippopa
00240000-56a6-011e-5fe8-38de4fb985e4	00230000-56a6-011e-1227-3dfb43df885b	organizacijskaenota
00240000-56a6-011e-d5e0-df5cf3a103c5	00230000-56a6-011e-1227-3dfb43df885b	sezona
00240000-56a6-011e-1f73-d24f2f26ef74	00230000-56a6-011e-1227-3dfb43df885b	tipvaje
00240000-56a6-011e-0919-f24409d8b99d	00230000-56a6-011e-1227-3dfb43df885b	tipdodatka
00240000-56a6-011e-aee0-1ae0e546f09c	00230000-56a6-011e-97be-e4b23bac218b	prostor
00240000-56a6-011e-dcaa-9295bd050711	00230000-56a6-011e-1227-3dfb43df885b	besedilo
00240000-56a6-011e-37a3-4feb15d0b921	00230000-56a6-011e-1227-3dfb43df885b	uprizoritev
00240000-56a6-011e-3f2f-1f52df248a9b	00230000-56a6-011e-1227-3dfb43df885b	funkcija
00240000-56a6-011e-3904-de2edd4ddf32	00230000-56a6-011e-1227-3dfb43df885b	tipfunkcije
00240000-56a6-011e-bfb8-46a14c2c87f8	00230000-56a6-011e-1227-3dfb43df885b	alternacija
00240000-56a6-011e-d6aa-446a5a11267a	00230000-56a6-011e-df4c-65f80948dbff	pogodba
00240000-56a6-011e-ef35-7bbb64f74e6d	00230000-56a6-011e-1227-3dfb43df885b	zaposlitev
00240000-56a6-011e-e926-97a426177a8a	00230000-56a6-011e-1227-3dfb43df885b	zvrstuprizoritve
00240000-56a6-011e-8c12-17e9852e70f0	00230000-56a6-011e-df4c-65f80948dbff	programdela
00240000-56a6-011e-4131-b82df13a58b1	00230000-56a6-011e-1227-3dfb43df885b	zapis
\.


--
-- TOC entry 3133 (class 0 OID 40116732)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
05693615-3487-4df1-b617-59786c012ce7	00240000-56a6-011e-ead7-9946e21fac1c	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 40117308)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56a6-0122-4e9c-04ef744d18aa	000e0000-56a6-0122-eac3-90caeccd82be	00080000-56a6-0122-d240-15a43f250b07	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56a6-011e-75d3-9545b6fdf48a
00270000-56a6-0122-219e-7cba634f6b67	000e0000-56a6-0122-eac3-90caeccd82be	00080000-56a6-0122-d240-15a43f250b07	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56a6-011e-75d3-9545b6fdf48a
\.


--
-- TOC entry 3149 (class 0 OID 40116881)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 40117127)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56a6-0123-f91f-f8b913346b0f	00180000-56a6-0122-6e64-8013470eeafe	000c0000-56a6-0122-0797-476c3d66e4ff	00090000-56a6-0122-2573-d11647f14d44	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a6-0123-eab8-45ce66b95a00	00180000-56a6-0122-6e64-8013470eeafe	000c0000-56a6-0122-7f57-914fbd652767	00090000-56a6-0122-d140-5a9baade2a6b	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a6-0123-cc9e-5ef1818b4498	00180000-56a6-0122-6e64-8013470eeafe	000c0000-56a6-0122-f870-77b5b344f02a	00090000-56a6-0122-4f98-2d98c5e408e5	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a6-0123-8ead-50f456416b69	00180000-56a6-0122-6e64-8013470eeafe	000c0000-56a6-0122-f23b-afef686ed63a	00090000-56a6-0122-ec82-1a5eabe85a69	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a6-0123-67d9-a472b6884421	00180000-56a6-0122-6e64-8013470eeafe	000c0000-56a6-0122-5e02-d5c934a8f8d3	00090000-56a6-0122-3e48-554289819c70	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a6-0123-496d-bc6620701d2e	00180000-56a6-0122-9021-6327988feeef	\N	00090000-56a6-0122-3e48-554289819c70	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56a6-0123-f561-58df86edf7fb	00180000-56a6-0122-60c4-bbf9f512f853	\N	00090000-56a6-0122-d140-5a9baade2a6b	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56a6-0123-45f0-3cb06fdae3f1	00180000-56a6-0122-6e64-8013470eeafe	\N	00090000-56a6-0122-7b5d-1f67e742ee35	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 40117144)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56a6-011e-5c4e-d435cfa8d430	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56a6-011e-a37d-81b9c63dac06	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56a6-011e-3f6d-b84e69c14cc0	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56a6-011e-d03b-59a71090fd24	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56a6-011e-f270-0fb28aa70609	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56a6-011e-0db6-36337914d566	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 40117349)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56a6-011e-23a2-ed3ca7dc1fce	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56a6-011e-e812-cd1ff76e7513	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56a6-011e-5cb3-7f8a628cb9cb	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56a6-011e-d26b-81d87c19dc81	04	Režija	Režija	Režija	umetnik	30
000f0000-56a6-011e-7d4a-3414b8c095b7	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56a6-011e-a62a-6a9089184eef	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56a6-011e-b8df-98fffbe130ba	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56a6-011e-b62c-13c61d613a94	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56a6-011e-6194-4ed8a4a12193	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56a6-011e-f410-1672ace59584	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56a6-011e-0f29-350c84fdf4d8	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56a6-011e-d907-f44829a0f418	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56a6-011e-644a-b067c4b49088	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56a6-011e-9c1f-07c77f6401a8	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56a6-011e-104f-80a23c20857b	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56a6-011e-453a-fda8f32a4eb8	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56a6-011e-ebd9-d9408c1f095a	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56a6-011e-3084-6aa7cc0500e7	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56a6-011e-98e1-f735b8fddf77	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 40116832)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56a6-0121-15d3-89613d76c36f	0001	šola	osnovna ali srednja šola
00400000-56a6-0121-0873-71df95562db6	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56a6-0121-82f2-48a5bd3eadb7	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 40117653)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56a6-011e-b4a8-7074fecc8071	01	Velika predstava	f	1.00	1.00
002b0000-56a6-011e-07ee-7c5043b9cf78	02	Mala predstava	f	0.50	0.50
002b0000-56a6-011e-d668-c8779ae7ca00	03	Mala koprodukcija	t	0.40	1.00
002b0000-56a6-011e-2f64-de1c71525fc6	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56a6-011e-070f-36c1cb7d5358	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 40117098)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56a6-011e-6c50-8e547ee26b71	0001	prva vaja	prva vaja
00420000-56a6-011e-9032-a0855e6323bb	0002	tehnična vaja	tehnična vaja
00420000-56a6-011e-8233-3ff6da2d51c9	0003	lučna vaja	lučna vaja
00420000-56a6-011e-1676-636606b2b18c	0004	kostumska vaja	kostumska vaja
00420000-56a6-011e-ce22-e3e99e3133d2	0005	foto vaja	foto vaja
00420000-56a6-011e-f7ac-235ca6fe8910	0006	1. glavna vaja	1. glavna vaja
00420000-56a6-011e-0d8e-ba482a18560f	0007	2. glavna vaja	2. glavna vaja
00420000-56a6-011e-6061-fae8e2d3167f	0008	1. generalka	1. generalka
00420000-56a6-011e-c520-0b2d05d05bab	0009	2. generalka	2. generalka
00420000-56a6-011e-c250-0a040b6e1216	0010	odprta generalka	odprta generalka
00420000-56a6-011e-578f-15f22231be30	0011	obnovitvena vaja	obnovitvena vaja
00420000-56a6-011e-a0b7-a185000ee86c	0012	italijanka	krajša "obnovitvena" vaja
00420000-56a6-011e-a8cd-128f15d335bf	0013	pevska vaja	pevska vaja
00420000-56a6-011e-b2d8-403a607eadf4	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56a6-011e-8cfd-d66a1dcff310	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56a6-011e-238d-9b00665c4dda	0016	orientacijska vaja	orientacijska vaja
00420000-56a6-011e-2261-dc1ab51a73d7	0017	situacijska vaja	situacijska vaja
00420000-56a6-011e-ba28-995f84d3ecd4	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 40116954)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 40116767)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56a6-011f-95e8-d9fe96edcfeb	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROF2LgzdNH4TzHPm7ct1JXHuMxIdvovPG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56a6-0122-82c6-14b0fb2591c8	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56a6-0122-b7e4-8363f8fb3404	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56a6-0122-056b-311bd2b2569d	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56a6-0122-feec-ce236cdcebea	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56a6-0122-2fa4-5eef6904f3d9	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56a6-0122-8424-7ecec2ef2590	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56a6-0122-d67a-57bbbe72c7f8	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56a6-0122-74c4-6539d54a8582	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56a6-0122-2194-a4116a79f53a	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56a6-0122-64a1-9b5e5eea90b5	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56a6-0122-8a8d-d636b484a1d3	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56a6-0122-92f7-b20f8a1a6a8e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56a6-0122-603f-5e1b05bc5477	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56a6-0122-c742-097542d6b5da	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56a6-0122-c0f0-b6da49603cdc	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56a6-0122-d2cb-02e27775b116	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56a6-0122-c6b6-6b01e648bdf4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56a6-0122-7712-bc76f099a284	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56a6-0122-f3f1-5c843b54cfac	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56a6-0122-38b9-240b1cfbd43b	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56a6-0122-0028-c44c2852dbc9	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56a6-0122-1a1f-fe3f1fc32119	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56a6-0122-7392-f96afb839a0a	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56a6-0122-bd9f-8467efea548c	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56a6-0122-8d85-a26c51994548	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56a6-0122-1565-b7a6812dcfd4	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56a6-011f-5ece-3e418bf39bda	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 40117399)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56a6-0122-5fd4-26d327b5c9da	00160000-56a6-0121-27f1-7cb5b6fbda3f	\N	00140000-56a6-011e-793a-30859cc2bc39	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56a6-0122-4bce-24477cb28bb1
000e0000-56a6-0122-eac3-90caeccd82be	00160000-56a6-0121-64f3-673ebaaf7a94	\N	00140000-56a6-011e-2a91-ab82412708c4	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56a6-0122-a4b6-0f24e46d79b0
000e0000-56a6-0122-f37e-6b8da8dd6f3e	\N	\N	00140000-56a6-011e-2a91-ab82412708c4	00190000-56a6-0122-bd65-528404a0dcef	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a6-0122-4bce-24477cb28bb1
000e0000-56a6-0122-30d0-46d9b56b05fd	\N	\N	00140000-56a6-011e-2a91-ab82412708c4	00190000-56a6-0122-bd65-528404a0dcef	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a6-0122-4bce-24477cb28bb1
000e0000-56a6-0122-ef83-0938b8dc6ce4	\N	\N	00140000-56a6-011e-2a91-ab82412708c4	00190000-56a6-0122-bd65-528404a0dcef	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-0121-91a2-f1908dd65d1a
000e0000-56a6-0122-0097-463707e65835	\N	\N	00140000-56a6-011e-2a91-ab82412708c4	00190000-56a6-0122-bd65-528404a0dcef	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-0121-91a2-f1908dd65d1a
000e0000-56a6-0122-aa35-84fa13630d97	\N	\N	00140000-56a6-011e-e25c-db09c93fdc59	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-0121-91a2-f1908dd65d1a
000e0000-56a6-0122-d662-e6591b4d3687	\N	\N	00140000-56a6-011e-e25c-db09c93fdc59	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-0121-91a2-f1908dd65d1a
000e0000-56a6-0122-fd96-e2a260081d54	\N	\N	00140000-56a6-011e-e25c-db09c93fdc59	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-0121-91a2-f1908dd65d1a
000e0000-56a6-0122-9040-6b9c97ab7aeb	\N	\N	00140000-56a6-011e-e25c-db09c93fdc59	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-0121-91a2-f1908dd65d1a
000e0000-56a6-0122-3f3a-d83cd17008c5	\N	\N	00140000-56a6-011e-e25c-db09c93fdc59	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-0121-91a2-f1908dd65d1a
000e0000-56a6-0122-c674-40ef7b04fd27	\N	\N	00140000-56a6-011e-e25c-db09c93fdc59	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-0121-91a2-f1908dd65d1a
000e0000-56a6-0122-9c17-eee0090f2431	\N	\N	00140000-56a6-011e-e25c-db09c93fdc59	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-0121-91a2-f1908dd65d1a
000e0000-56a6-0122-148e-bcb7dc026249	\N	\N	00140000-56a6-011e-e25c-db09c93fdc59	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-0121-91a2-f1908dd65d1a
000e0000-56a6-0122-b4c7-29708d268458	\N	\N	00140000-56a6-011e-e25c-db09c93fdc59	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a6-0121-91a2-f1908dd65d1a
\.


--
-- TOC entry 3170 (class 0 OID 40117118)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 40117048)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56a6-0122-cdbc-d087b875abcd	\N	000e0000-56a6-0122-eac3-90caeccd82be	1
00200000-56a6-0122-139b-c173cc5ddc58	\N	000e0000-56a6-0122-eac3-90caeccd82be	2
00200000-56a6-0122-0566-7c0d71e0597a	\N	000e0000-56a6-0122-eac3-90caeccd82be	3
00200000-56a6-0122-5b67-5dcf9585dbae	\N	000e0000-56a6-0122-eac3-90caeccd82be	4
00200000-56a6-0122-55fd-2fa93289e293	\N	000e0000-56a6-0122-eac3-90caeccd82be	5
\.


--
-- TOC entry 3182 (class 0 OID 40117211)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 40117322)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56a6-011e-8a2b-2c79389fcdbb	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56a6-011e-1a9b-aac190f2020c	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56a6-011e-9447-d3b74c9f4267	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56a6-011e-831b-03d1ef0f767d	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56a6-011e-3680-f8df8461aee3	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56a6-011e-7396-f71da0969b46	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56a6-011e-283a-c642dc8f2603	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56a6-011e-5a4c-02429397b473	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56a6-011e-75d3-9545b6fdf48a	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56a6-011e-ffda-e19b4ea173d4	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56a6-011e-be95-b548e2cde61c	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56a6-011e-0440-b7b31b745f10	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56a6-011e-4ebc-a68f855910c7	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56a6-011e-1a5a-2d700a0e3dc9	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56a6-011e-4cd4-0b1215ab8bb1	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56a6-011e-c04a-5507f9ab4ed2	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56a6-011e-b8c1-6e4b2a16f4c2	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56a6-011e-f762-2647a773049c	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56a6-011e-71e1-9973c3d1be0d	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56a6-011e-0b76-302898bd52ff	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56a6-011e-c236-d2817047dab9	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56a6-011e-914c-a0362c163863	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56a6-011e-4614-fb8fefb438f5	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56a6-011e-cee2-0a43187d5e51	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56a6-011e-39bc-e2a3e2e209c5	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56a6-011e-0257-0d332149b618	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56a6-011e-bd58-1c7b086e7cf8	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56a6-011e-19ca-3699dead600b	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 40117703)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 40117672)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 40117715)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 40117284)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56a6-0122-475f-42b08b76290b	00090000-56a6-0122-d140-5a9baade2a6b	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a6-0122-5291-a7e4816191c6	00090000-56a6-0122-4f98-2d98c5e408e5	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a6-0122-f1d4-8b21f4617150	00090000-56a6-0122-8113-39ea43b22cf8	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a6-0122-cb69-be696ffe30d5	00090000-56a6-0122-d7e3-45024831f15c	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a6-0122-b211-8792b039c500	00090000-56a6-0122-4d63-9af11b9efcf5	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a6-0122-e2c0-4e8988ea1d38	00090000-56a6-0122-13ed-ae70625d2e35	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 40117389)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56a6-011e-793a-30859cc2bc39	01	Drama	drama (SURS 01)
00140000-56a6-011e-1689-ca95468097c6	02	Opera	opera (SURS 02)
00140000-56a6-011e-1c36-207577b4c57b	03	Balet	balet (SURS 03)
00140000-56a6-011e-facf-d82d61e45135	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56a6-011e-e25c-db09c93fdc59	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56a6-011e-2a91-ab82412708c4	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56a6-011e-6628-6a4b12309f04	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 40117274)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 40116831)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 40117447)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 40117438)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 40116821)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 40117305)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 40117347)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 40117756)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 40117141)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 40117077)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 40117092)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 40117097)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 40117670)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 40116980)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 40117516)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 40117270)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 40117046)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 40117018)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 40116994)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 40117177)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 40117733)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 40117740)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 40117764)
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
-- TOC entry 2766 (class 2606 OID 40117203)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 40116952)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 40116850)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 40116914)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 40116877)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 40116810)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 40116795)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 40117209)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 40117246)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 40117384)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 40116905)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 40116940)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 40117621)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 40117183)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 40116930)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 40117062)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 40117034)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2688 (class 2606 OID 40117027)
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
-- TOC entry 2764 (class 2606 OID 40117195)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 40117630)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 40117638)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 40117608)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 40117651)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 40117228)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 40117168)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 40117159)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 40117371)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 40117298)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 40117006)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 40116766)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 40117237)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 40116784)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 40116804)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 40117255)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 40117190)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 40117116)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 40116754)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 40116742)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 40116736)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 40117318)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 40116886)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 40117133)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 40117151)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 40117358)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 40116839)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 40117663)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 40117105)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 40116965)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 40116779)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 40117417)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 40117124)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 40117052)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 40117217)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 40117330)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 40117713)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 40117697)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 40117721)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 40117288)
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
-- TOC entry 2833 (class 2606 OID 40117397)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 40117282)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 1259 OID 40117086)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2705 (class 1259 OID 40117087)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2706 (class 1259 OID 40117085)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2707 (class 1259 OID 40117084)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2708 (class 1259 OID 40117083)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 40117319)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 40117320)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 40117321)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 40117735)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 40117734)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 40116907)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 40116908)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 40117210)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 40117701)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 40117700)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 40117702)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 40117699)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 40117698)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 40117196)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2696 (class 1259 OID 40117053)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2697 (class 1259 OID 40117054)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 40117271)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 40117273)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 40117272)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 40116996)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 40116995)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 40117652)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 40117386)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 40117387)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 40117388)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 40117722)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 40117422)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 40117419)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 40117423)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 40117421)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 40117420)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 40116967)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 40116966)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 40116880)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 40117238)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 40116811)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 40116812)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 40117258)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 40117257)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 40117256)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 40116917)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 40116916)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 40116918)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 40117028)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2686 (class 1259 OID 40117029)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2595 (class 1259 OID 40116744)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 40117163)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 40117161)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 40117160)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 40117162)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 40116785)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 40116786)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 40117218)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 40117757)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 40117307)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 40117306)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 40117765)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 40117766)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 40117184)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 40117299)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 40117300)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 40117521)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 40117520)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 40117517)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 40117518)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 40117519)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 40116932)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 40116931)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 40116933)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 40117232)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 40117231)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 40117631)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 40117632)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 40117451)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 40117452)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 40117449)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 40117450)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 40117142)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 40117143)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 40117289)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 40117290)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 40117125)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 40117172)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 40117171)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 40117169)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 40117170)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 40117439)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 40117007)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 40117021)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 40117020)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 40117019)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 40117022)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2695 (class 1259 OID 40117047)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2689 (class 1259 OID 40117035)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2690 (class 1259 OID 40117036)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 40117622)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 40117671)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 40117741)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 40117742)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 40116852)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 40116851)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 40116887)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 40116888)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 40117136)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 40117135)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 40117134)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 40117079)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 40117082)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 40117078)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 40117081)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 40117080)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 40116906)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 40116840)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 40116841)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 40116981)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 40116983)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 40116982)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 40116984)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 40117178)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 40117385)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 40117418)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 40117359)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 40117360)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 40116878)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 40116879)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 40117152)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 40117153)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 40117283)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 40116755)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 40116953)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 40116915)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 40116743)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 40117664)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 40117230)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 40117229)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 40117106)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 40117107)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 40117448)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 40117126)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 40116941)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 40117398)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 40117714)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 40117639)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 40117640)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 40117348)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 40117117)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 40116805)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2942 (class 2606 OID 40117932)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2947 (class 2606 OID 40117957)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2945 (class 2606 OID 40117947)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2941 (class 2606 OID 40117927)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2944 (class 2606 OID 40117942)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2946 (class 2606 OID 40117952)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2943 (class 2606 OID 40117937)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2983 (class 2606 OID 40118137)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 40118142)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2985 (class 2606 OID 40118147)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3017 (class 2606 OID 40118307)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3016 (class 2606 OID 40118302)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2920 (class 2606 OID 40117822)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2921 (class 2606 OID 40117827)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 40118052)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3013 (class 2606 OID 40118287)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 40118282)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3014 (class 2606 OID 40118292)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3011 (class 2606 OID 40118277)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3010 (class 2606 OID 40118272)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 40118047)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2939 (class 2606 OID 40117917)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2940 (class 2606 OID 40117922)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 40118092)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 40118102)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 40118097)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2931 (class 2606 OID 40117877)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2930 (class 2606 OID 40117872)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 40118037)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 40118262)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2986 (class 2606 OID 40118152)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 40118157)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2988 (class 2606 OID 40118162)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 40118297)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2992 (class 2606 OID 40118182)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2989 (class 2606 OID 40118167)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2993 (class 2606 OID 40118187)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 40118177)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2990 (class 2606 OID 40118172)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2929 (class 2606 OID 40117867)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2928 (class 2606 OID 40117862)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2917 (class 2606 OID 40117807)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2916 (class 2606 OID 40117802)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 40118072)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2912 (class 2606 OID 40117782)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2913 (class 2606 OID 40117787)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2973 (class 2606 OID 40118087)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 40118082)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2971 (class 2606 OID 40118077)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 40117837)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2922 (class 2606 OID 40117832)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2924 (class 2606 OID 40117842)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 40117892)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 40117897)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2909 (class 2606 OID 40117767)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2958 (class 2606 OID 40118012)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2956 (class 2606 OID 40118002)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2955 (class 2606 OID 40117997)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2957 (class 2606 OID 40118007)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2910 (class 2606 OID 40117772)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2911 (class 2606 OID 40117777)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 40118057)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 40118322)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2982 (class 2606 OID 40118132)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2981 (class 2606 OID 40118127)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3021 (class 2606 OID 40118327)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3022 (class 2606 OID 40118332)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 40118042)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2979 (class 2606 OID 40118117)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2980 (class 2606 OID 40118122)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3003 (class 2606 OID 40118237)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3002 (class 2606 OID 40118232)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2999 (class 2606 OID 40118217)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3000 (class 2606 OID 40118222)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 40118227)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 40117852)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 40117847)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 40117857)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2969 (class 2606 OID 40118067)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2968 (class 2606 OID 40118062)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3005 (class 2606 OID 40118247)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3006 (class 2606 OID 40118252)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2997 (class 2606 OID 40118207)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2998 (class 2606 OID 40118212)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2995 (class 2606 OID 40118197)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2996 (class 2606 OID 40118202)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2953 (class 2606 OID 40117987)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2954 (class 2606 OID 40117992)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2977 (class 2606 OID 40118107)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2978 (class 2606 OID 40118112)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2948 (class 2606 OID 40117962)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2949 (class 2606 OID 40117967)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2962 (class 2606 OID 40118032)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2961 (class 2606 OID 40118027)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2959 (class 2606 OID 40118017)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2960 (class 2606 OID 40118022)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 40118192)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 40117882)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 40117887)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 40117912)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2936 (class 2606 OID 40117902)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2937 (class 2606 OID 40117907)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 40118242)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 40118257)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 40118267)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3018 (class 2606 OID 40118312)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3019 (class 2606 OID 40118317)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2915 (class 2606 OID 40117797)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2914 (class 2606 OID 40117792)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2918 (class 2606 OID 40117812)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 40117817)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 40117982)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 40117977)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2950 (class 2606 OID 40117972)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-25 12:04:06 CET

--
-- PostgreSQL database dump complete
--

