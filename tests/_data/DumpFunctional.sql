--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-04 13:59:28 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 253 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 34209793)
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
-- TOC entry 237 (class 1259 OID 34210404)
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
    aktivna boolean,
    imapogodbo boolean,
    pomembna boolean
);


--
-- TOC entry 236 (class 1259 OID 34210387)
-- Name: arhivalija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE arhivalija (
    id uuid NOT NULL,
    dogodek_id uuid,
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
-- TOC entry 182 (class 1259 OID 34209786)
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
-- TOC entry 181 (class 1259 OID 34209784)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 34210264)
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
-- TOC entry 230 (class 1259 OID 34210294)
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
-- TOC entry 251 (class 1259 OID 34210707)
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
-- TOC entry 203 (class 1259 OID 34210041)
-- Name: dogodek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodek (
    id uuid NOT NULL,
    predstava_id uuid,
    zasedenost_id uuid,
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
-- TOC entry 205 (class 1259 OID 34210073)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 34210078)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 34210629)
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
-- TOC entry 194 (class 1259 OID 34209938)
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
-- TOC entry 238 (class 1259 OID 34210417)
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
-- TOC entry 223 (class 1259 OID 34210221)
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
    altercount integer DEFAULT 0 NOT NULL,
    tipfunkcije_id uuid
);


--
-- TOC entry 200 (class 1259 OID 34210012)
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
-- TOC entry 197 (class 1259 OID 34209978)
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
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 34209955)
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
-- TOC entry 212 (class 1259 OID 34210135)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 34210687)
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
-- TOC entry 250 (class 1259 OID 34210700)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 34210722)
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
-- TOC entry 170 (class 1259 OID 33138684)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 34210160)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 34209912)
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
-- TOC entry 185 (class 1259 OID 34209812)
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
-- TOC entry 189 (class 1259 OID 34209879)
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
-- TOC entry 186 (class 1259 OID 34209823)
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
-- TOC entry 178 (class 1259 OID 34209758)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 34209777)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 34210167)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 34210201)
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
-- TOC entry 233 (class 1259 OID 34210335)
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
-- TOC entry 188 (class 1259 OID 34209859)
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
-- TOC entry 191 (class 1259 OID 34209904)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 34210573)
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
-- TOC entry 213 (class 1259 OID 34210141)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 34209889)
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
-- TOC entry 202 (class 1259 OID 34210033)
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
-- TOC entry 198 (class 1259 OID 34209993)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    dezurni_id uuid,
    zaporedna integer,
    zaporednasez integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    porocilo text
);


--
-- TOC entry 199 (class 1259 OID 34210005)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 34210153)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 34210587)
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
-- TOC entry 242 (class 1259 OID 34210597)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 34210486)
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
-- TOC entry 243 (class 1259 OID 34210605)
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
-- TOC entry 219 (class 1259 OID 34210182)
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
-- TOC entry 211 (class 1259 OID 34210126)
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
-- TOC entry 210 (class 1259 OID 34210116)
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
-- TOC entry 232 (class 1259 OID 34210324)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 34210254)
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
-- TOC entry 196 (class 1259 OID 34209967)
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
-- TOC entry 175 (class 1259 OID 34209729)
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
-- TOC entry 174 (class 1259 OID 34209727)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 34210195)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 34209767)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 34209751)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 34210209)
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
-- TOC entry 214 (class 1259 OID 34210147)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 34210093)
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
-- TOC entry 173 (class 1259 OID 34209716)
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
-- TOC entry 172 (class 1259 OID 34209708)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 34209703)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 34210271)
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
-- TOC entry 187 (class 1259 OID 34209851)
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
-- TOC entry 209 (class 1259 OID 34210103)
-- Name: terminstoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE terminstoritve (
    id uuid NOT NULL,
    dogodek_id uuid,
    alternacija_id uuid,
    oseba_id uuid NOT NULL,
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    planirankonec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    planiranotraja numeric(15,2) DEFAULT NULL::numeric,
    dezurni boolean,
    gost boolean
);


--
-- TOC entry 231 (class 1259 OID 34210312)
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
-- TOC entry 184 (class 1259 OID 34209802)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 34210617)
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
-- TOC entry 207 (class 1259 OID 34210083)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 34209924)
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
-- TOC entry 176 (class 1259 OID 34209738)
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
-- TOC entry 235 (class 1259 OID 34210362)
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
-- TOC entry 201 (class 1259 OID 34210023)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 218 (class 1259 OID 34210174)
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
-- TOC entry 229 (class 1259 OID 34210285)
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
-- TOC entry 247 (class 1259 OID 34210667)
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
-- TOC entry 246 (class 1259 OID 34210636)
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
-- TOC entry 248 (class 1259 OID 34210679)
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
-- TOC entry 225 (class 1259 OID 34210247)
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
-- TOC entry 204 (class 1259 OID 34210067)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 34210352)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 34210237)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2241 (class 2604 OID 34209789)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2233 (class 2604 OID 34209732)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3116 (class 0 OID 34209793)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-568a-6cac-88df-894cea7f1ed6	10	30	Otroci	Abonma za otroke	200
000a0000-568a-6cac-5209-5fb6bf471baf	20	60	Mladina	Abonma za mladino	400
000a0000-568a-6cac-6f13-07d95c0a48a2	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3170 (class 0 OID 34210404)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-568a-6cad-cea1-acc055c26fc3	000d0000-568a-6cac-6553-393e94771424	\N	00090000-568a-6cac-58bd-d1523363b4b2	000b0000-568a-6cac-0647-d9ad8e28d10d	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-568a-6cad-49f1-710a99bb517c	000d0000-568a-6cac-8a11-506c04321b44	00100000-568a-6cac-b5a7-9e3e3be38a6a	00090000-568a-6cac-301a-48c52c29812b	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-568a-6cad-2163-d569236e62a2	000d0000-568a-6cac-5bbf-e4e2f894a0e8	00100000-568a-6cac-b5f8-a5a9ffbae394	00090000-568a-6cac-938b-1d6c69fb5a1b	\N	0003	t	\N	2016-01-04	\N	2	t	\N	f	f
000c0000-568a-6cad-dd96-0ff7681136b2	000d0000-568a-6cac-0216-c4cb4b58bf2d	\N	00090000-568a-6cac-b13c-7afd7df43ce8	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-568a-6cad-0d8b-88237ee1bdb9	000d0000-568a-6cac-516f-1373336009ee	\N	00090000-568a-6cac-2cee-ccdb944f9335	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-568a-6cad-fc4e-ca6cadcfb0fb	000d0000-568a-6cac-1067-58aa9890b8ba	\N	00090000-568a-6cac-d39c-e77231f7ce8c	000b0000-568a-6cac-f087-f5d8d8e5a2e2	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-568a-6cad-627f-9dce1f767347	000d0000-568a-6cac-be37-90a7d965d1cd	00100000-568a-6cac-c9be-5e56b24babf0	00090000-568a-6cac-e871-fffd577d9aa7	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-568a-6cad-b7d9-d5e3e8d46e8a	000d0000-568a-6cac-e257-eb1d3d967b7c	\N	00090000-568a-6cac-a8af-fe8cca951969	000b0000-568a-6cac-e558-b2474fba864e	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-568a-6cad-faa2-43dff775fd80	000d0000-568a-6cac-be37-90a7d965d1cd	00100000-568a-6cac-8543-d66b9a1ee2d4	00090000-568a-6cac-d7e5-8192fa73dfb4	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-568a-6cad-150a-c7c8ee872422	000d0000-568a-6cac-be37-90a7d965d1cd	00100000-568a-6cac-7ccc-6484c615de28	00090000-568a-6cac-b7fe-9f735454f4dc	\N	0010	t	\N	2016-01-04	\N	16	f	\N	f	t
000c0000-568a-6cad-9eab-927f35130961	000d0000-568a-6cac-be37-90a7d965d1cd	00100000-568a-6cac-ccec-e15db7b26f50	00090000-568a-6cac-c565-f551daf8f43f	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-568a-6cad-afc0-4535bb07f793	000d0000-568a-6cac-25ed-04160864b9f7	00100000-568a-6cac-b5a7-9e3e3be38a6a	00090000-568a-6cac-301a-48c52c29812b	000b0000-568a-6cac-9f56-fdeef38809b3	0012	t	\N	\N	\N	2	t	\N	t	t
000c0000-568a-6cad-10a7-a86b366ba8d2	000d0000-568a-6cac-a6e6-07651c2ea0e6	\N	00090000-568a-6cac-a8af-fe8cca951969	\N	0013	f	\N	\N	\N	2	t	\N	f	t
000c0000-568a-6cad-4969-108c97bc1d03	000d0000-568a-6cac-a6e6-07651c2ea0e6	\N	00090000-568a-6cac-8e8a-6ac381cff93d	\N	0014	f	\N	\N	\N	2	f	\N	f	t
000c0000-568a-6cad-e18c-98c0b13130e1	000d0000-568a-6cac-4af4-d2a5a77e3930	00100000-568a-6cac-b5f8-a5a9ffbae394	00090000-568a-6cac-938b-1d6c69fb5a1b	\N	0015	t	\N	\N	\N	2	t	\N	f	t
000c0000-568a-6cad-2dfa-9a20cb4873ca	000d0000-568a-6cac-4af4-d2a5a77e3930	\N	00090000-568a-6cac-8e8a-6ac381cff93d	\N	0016	f	\N	\N	\N	2	f	\N	f	t
000c0000-568a-6cad-2c35-a6ca2fe0e291	000d0000-568a-6cac-67fa-f8febf8fe682	\N	00090000-568a-6cac-8e8a-6ac381cff93d	\N	0017	f	\N	\N	\N	2	t	\N	f	t
000c0000-568a-6cad-7507-45fd04e4cd58	000d0000-568a-6cac-67fa-f8febf8fe682	\N	00090000-568a-6cac-a8af-fe8cca951969	\N	0018	f	\N	\N	\N	2	f	\N	f	t
000c0000-568a-6cad-c319-f9de82bd12fc	000d0000-568a-6cac-52d8-e6a41ef77380	00100000-568a-6cac-c9be-5e56b24babf0	00090000-568a-6cac-e871-fffd577d9aa7	\N	0019	t	\N	\N	\N	2	t	\N	f	t
000c0000-568a-6cad-5d97-47c69a742c73	000d0000-568a-6cac-52d8-e6a41ef77380	\N	00090000-568a-6cac-8e8a-6ac381cff93d	\N	0020	f	\N	\N	\N	2	f	\N	f	t
000c0000-568a-6cad-c68d-df3f3da432fd	000d0000-568a-6cac-0484-0bfb01ae2298	\N	00090000-568a-6cac-8e8a-6ac381cff93d	\N	0021	f	\N	\N	\N	2	t	\N	f	t
000c0000-568a-6cad-642b-f8c230ff963a	000d0000-568a-6cac-0484-0bfb01ae2298	00100000-568a-6cac-c9be-5e56b24babf0	00090000-568a-6cac-e871-fffd577d9aa7	\N	0022	t	\N	\N	\N	2	f	\N	f	t
000c0000-568a-6cad-b21e-f6896997bfe7	000d0000-568a-6cac-9f1c-8b40fd165171	\N	00090000-568a-6cac-8e8a-6ac381cff93d	\N	0023	f	\N	\N	\N	2	t	\N	f	t
000c0000-568a-6cad-1b4c-d3c70ea9d959	000d0000-568a-6cac-950a-ed585e84be8e	\N	00090000-568a-6cac-a8af-fe8cca951969	\N	0024	f	\N	\N	\N	2	t	\N	f	t
000c0000-568a-6cad-cd6c-5a278761b85c	000d0000-568a-6cac-1a95-22e277e401e0	\N	00090000-568a-6cac-a8af-fe8cca951969	\N	0025	f	\N	\N	\N	2	t	\N	f	t
000c0000-568a-6cad-85ac-94d262fda563	000d0000-568a-6cac-1a95-22e277e401e0	00100000-568a-6cac-b5f8-a5a9ffbae394	00090000-568a-6cac-938b-1d6c69fb5a1b	\N	0026	t	\N	\N	\N	2	f	\N	f	t
000c0000-568a-6cad-2347-f8541615b441	000d0000-568a-6cac-b366-8860518b656c	\N	00090000-568a-6cac-3109-06eb3f2af7a0	\N	0027	f	\N	\N	\N	2	t	\N	f	t
000c0000-568a-6cad-c643-2d56439499bd	000d0000-568a-6cac-b366-8860518b656c	\N	00090000-568a-6cac-2ee7-c1b20811e446	\N	0028	f	\N	\N	\N	2	f	\N	f	t
000c0000-568a-6cad-76bc-f5c4b49cb560	000d0000-568a-6cac-f1a5-3573d93ca7c6	\N	00090000-568a-6cac-a8af-fe8cca951969	\N	0029	f	\N	\N	\N	1	t	\N	f	t
000c0000-568a-6cad-dda6-7531c95ce0dd	000d0000-568a-6cac-f1a5-3573d93ca7c6	00100000-568a-6cac-b5f8-a5a9ffbae394	00090000-568a-6cac-938b-1d6c69fb5a1b	\N	0030	t	\N	\N	\N	2	f	\N	f	t
000c0000-568a-6cad-d461-ac6f4af284a6	000d0000-568a-6cac-f1a5-3573d93ca7c6	\N	00090000-568a-6cac-2ee7-c1b20811e446	\N	0031	f	\N	\N	\N	3	f	\N	f	t
000c0000-568a-6cad-d2f5-aad388d042f5	000d0000-568a-6cac-f1a5-3573d93ca7c6	\N	00090000-568a-6cac-3109-06eb3f2af7a0	\N	0032	f	\N	\N	\N	4	f	\N	f	t
000c0000-568a-6cad-a6e6-88747e926ffa	000d0000-568a-6cac-c84d-a03449a064d2	\N	00090000-568a-6cac-a8af-fe8cca951969	\N	0033	f	\N	\N	\N	4	t	\N	f	t
000c0000-568a-6cad-5a37-43255aaa7ef8	000d0000-568a-6cac-645c-3ea7f63d5f5c	00100000-568a-6cac-b5f8-a5a9ffbae394	00090000-568a-6cac-938b-1d6c69fb5a1b	\N	0034	t	\N	\N	\N	4	t	\N	f	t
000c0000-568a-6cad-4e02-e40dab9a01f5	000d0000-568a-6cac-645c-3ea7f63d5f5c	\N	00090000-568a-6cac-8e8a-6ac381cff93d	\N	0035	f	\N	\N	\N	4	f	\N	f	t
\.


--
-- TOC entry 3169 (class 0 OID 34210387)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 34209786)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3160 (class 0 OID 34210264)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-568a-6cac-ef89-3dc1ce2953af	00160000-568a-6cac-59d6-3e6f89898720	00090000-568a-6cac-2ee7-c1b20811e446	aizv	10	t
003d0000-568a-6cac-9308-b3aa1f1f6b79	00160000-568a-6cac-59d6-3e6f89898720	00090000-568a-6cac-b364-7adeadb0c223	apri	14	t
003d0000-568a-6cac-c4c0-11202846201b	00160000-568a-6cac-cd41-aa535ccb8cdf	00090000-568a-6cac-3109-06eb3f2af7a0	aizv	11	t
003d0000-568a-6cac-baa9-2378582b0c5c	00160000-568a-6cac-77f9-9f40dd5f7fbf	00090000-568a-6cac-898d-c725ce100ca1	aizv	12	t
003d0000-568a-6cac-be55-45232bc29800	00160000-568a-6cac-59d6-3e6f89898720	00090000-568a-6cac-8e8a-6ac381cff93d	apri	18	f
\.


--
-- TOC entry 3163 (class 0 OID 34210294)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-568a-6cac-59d6-3e6f89898720	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-568a-6cac-cd41-aa535ccb8cdf	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-568a-6cac-77f9-9f40dd5f7fbf	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3184 (class 0 OID 34210707)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 34210041)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-568a-6cad-50cf-9963b7177ed9	\N	\N	00200000-568a-6cac-6b00-30ae2641864e	\N	\N	\N	00220000-568a-6cac-2a26-075320a6683b	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-568a-6cad-90cc-d406205d3def	\N	\N	00200000-568a-6cac-3509-5bb9ccb156ae	\N	\N	\N	00220000-568a-6cac-2a26-075320a6683b	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-568a-6cad-a693-f4c2ee9f99a2	\N	\N	00200000-568a-6cac-a14d-d8d298c63ffa	\N	\N	\N	00220000-568a-6cac-023d-e90cc22d7b52	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-568a-6cad-b77a-fe296d508168	\N	\N	00200000-568a-6cac-7a89-d9354c144024	\N	\N	\N	00220000-568a-6cac-3760-8e5544a38a65	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-568a-6cad-05b1-15599c3ffc54	\N	\N	00200000-568a-6cac-0796-7ec475706f97	\N	\N	\N	00220000-568a-6cac-d5f1-18a60f6e1644	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3138 (class 0 OID 34210073)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 34210078)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 34210629)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 34209938)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-568a-6ca9-7d82-6c755f71aedd	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-568a-6ca9-90b4-2b936bd31e90	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-568a-6ca9-fa97-d8f2ec0b104a	AL	ALB	008	Albania 	Albanija	\N
00040000-568a-6ca9-2345-b429a6d675c2	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-568a-6ca9-52b4-4ad3dc7389b5	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-568a-6ca9-5a53-bb1c048035e5	AD	AND	020	Andorra 	Andora	\N
00040000-568a-6ca9-483c-10ff34dcc1a3	AO	AGO	024	Angola 	Angola	\N
00040000-568a-6ca9-ca26-3ce78c6a528a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-568a-6ca9-7c92-19c91d2e5cee	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-568a-6ca9-9e3a-e71e7470dcce	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-568a-6ca9-13ec-5fbca2cbfa3d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-568a-6ca9-33ff-603af38fbb77	AM	ARM	051	Armenia 	Armenija	\N
00040000-568a-6ca9-dbd4-0676e34bbbd2	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-568a-6ca9-7863-ea70d313eff0	AU	AUS	036	Australia 	Avstralija	\N
00040000-568a-6ca9-9411-808e113e0d8c	AT	AUT	040	Austria 	Avstrija	\N
00040000-568a-6ca9-ff10-9d3e54335652	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-568a-6ca9-b6cc-eb6a1b1cbcc8	BS	BHS	044	Bahamas 	Bahami	\N
00040000-568a-6ca9-adb7-e3676c9b94fe	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-568a-6ca9-e2ea-604d6c388e56	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-568a-6ca9-457c-34a0ccec79d9	BB	BRB	052	Barbados 	Barbados	\N
00040000-568a-6ca9-e82f-aa136e7f1249	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-568a-6ca9-8ada-6cf80a5b02c8	BE	BEL	056	Belgium 	Belgija	\N
00040000-568a-6ca9-5428-d654aefc86e9	BZ	BLZ	084	Belize 	Belize	\N
00040000-568a-6ca9-49ea-ecb0f00812cd	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-568a-6ca9-fdd1-6340de2b6ffa	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-568a-6ca9-57d1-93d3d7dda8b7	BT	BTN	064	Bhutan 	Butan	\N
00040000-568a-6ca9-c55a-8c019dd82038	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-568a-6ca9-17e6-2bdff3941799	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-568a-6ca9-0f7a-1701b5df588e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-568a-6ca9-e3b6-7672edc96843	BW	BWA	072	Botswana 	Bocvana	\N
00040000-568a-6ca9-cee0-e12f9c6494f6	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-568a-6ca9-b4e6-65c61bc5ee3a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-568a-6ca9-68aa-149e76bf6ba3	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-568a-6ca9-8bd5-e797b36ba1ae	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-568a-6ca9-58b0-d46d537baf23	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-568a-6ca9-f137-de6f90a1be74	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-568a-6ca9-ec18-4f781c215335	BI	BDI	108	Burundi 	Burundi 	\N
00040000-568a-6ca9-d534-2a18ff290036	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-568a-6ca9-5338-40849c6f486a	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-568a-6ca9-1b14-5e2870b76d02	CA	CAN	124	Canada 	Kanada	\N
00040000-568a-6ca9-780d-293c9d5d927a	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-568a-6ca9-abbc-5ea046ea2d4f	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-568a-6ca9-3390-aa85ce8fa46b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-568a-6ca9-c848-264dd1925c50	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-568a-6ca9-fda6-e47a0207e1cd	CL	CHL	152	Chile 	Čile	\N
00040000-568a-6ca9-9ff5-8dd86c2edcd5	CN	CHN	156	China 	Kitajska	\N
00040000-568a-6ca9-2080-6541a78f87c1	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-568a-6ca9-ab1d-2c201e80291b	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-568a-6ca9-cb3d-93532f485206	CO	COL	170	Colombia 	Kolumbija	\N
00040000-568a-6ca9-9138-a35f1b4edaad	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-568a-6ca9-902c-bb7a16ea2f6e	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-568a-6ca9-1fa7-e928b021d6e2	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-568a-6ca9-3035-ef2fb930b842	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-568a-6ca9-fbc4-519aa29766b0	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-568a-6ca9-ad96-50e4ca5fccca	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-568a-6ca9-1e94-133b90496566	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-568a-6ca9-2e92-54db81d5dd7c	CU	CUB	192	Cuba 	Kuba	\N
00040000-568a-6ca9-4c69-e34b61c73691	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-568a-6ca9-f63e-c67e49fdd953	CY	CYP	196	Cyprus 	Ciper	\N
00040000-568a-6ca9-d008-fe11a8d0073e	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-568a-6ca9-7fce-c521809d5138	DK	DNK	208	Denmark 	Danska	\N
00040000-568a-6ca9-2a26-8b21f580b40c	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-568a-6ca9-f948-a331ee3a62f4	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-568a-6ca9-8eb2-e4bce2b0a33a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-568a-6ca9-37ce-c87f543618e0	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-568a-6ca9-a19e-04add6f19c76	EG	EGY	818	Egypt 	Egipt	\N
00040000-568a-6ca9-e433-eec81e17bbe1	SV	SLV	222	El Salvador 	Salvador	\N
00040000-568a-6ca9-3bf2-46395bbc5062	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-568a-6ca9-1950-bf6c2c901da1	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-568a-6ca9-b5fa-e2235985c46a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-568a-6ca9-0aa4-c9ed75ced32b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-568a-6ca9-533a-e8f81caaf0ad	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-568a-6ca9-ce85-52b37ed18dd4	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-568a-6ca9-6b53-b3338c7799f3	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-568a-6ca9-78b0-93b2731e1c26	FI	FIN	246	Finland 	Finska	\N
00040000-568a-6ca9-50b7-9ea68a835481	FR	FRA	250	France 	Francija	\N
00040000-568a-6ca9-3a26-8f36e7284ec9	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-568a-6ca9-1b12-191454539796	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-568a-6ca9-40af-22a7f2b52c19	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-568a-6ca9-0fbe-e48b6fdcaaec	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-568a-6ca9-6acd-b4f688795103	GA	GAB	266	Gabon 	Gabon	\N
00040000-568a-6ca9-31e3-8372ab12e94b	GM	GMB	270	Gambia 	Gambija	\N
00040000-568a-6ca9-057d-88e2d1b0ce83	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-568a-6ca9-3bbf-6c064655ca08	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-568a-6ca9-c7ab-5c8e2d003391	GH	GHA	288	Ghana 	Gana	\N
00040000-568a-6ca9-7d0e-9678449bcff1	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-568a-6ca9-a2cf-7bd9253c611a	GR	GRC	300	Greece 	Grčija	\N
00040000-568a-6ca9-0822-111bbc3b4c84	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-568a-6ca9-8b23-79795ca5b320	GD	GRD	308	Grenada 	Grenada	\N
00040000-568a-6ca9-d356-aa1cce91d5aa	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-568a-6ca9-e57e-339ff9d9ed5d	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-568a-6ca9-09de-45f7ffb93b84	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-568a-6ca9-5833-daf57c335884	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-568a-6ca9-e164-141f29a566e5	GN	GIN	324	Guinea 	Gvineja	\N
00040000-568a-6ca9-9cce-40511054def9	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-568a-6ca9-8500-36ba3875cdee	GY	GUY	328	Guyana 	Gvajana	\N
00040000-568a-6ca9-8ee6-8917e059e936	HT	HTI	332	Haiti 	Haiti	\N
00040000-568a-6ca9-7819-26386229c967	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-568a-6ca9-65c6-bad3d604d505	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-568a-6ca9-4b27-22973b29640a	HN	HND	340	Honduras 	Honduras	\N
00040000-568a-6ca9-4ded-22e7a0663674	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-568a-6ca9-a784-a4fb798a95cf	HU	HUN	348	Hungary 	Madžarska	\N
00040000-568a-6ca9-a84f-eefa3a504b1d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-568a-6ca9-08d6-56eb735f15b6	IN	IND	356	India 	Indija	\N
00040000-568a-6ca9-4b02-cc68d79aac2c	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-568a-6ca9-ae94-912d2c3f0f9e	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-568a-6ca9-3a3e-2966165a9a7e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-568a-6ca9-df1f-a8c5488ab1fd	IE	IRL	372	Ireland 	Irska	\N
00040000-568a-6ca9-5d38-d310749a9d7d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-568a-6ca9-4081-c961e0202891	IL	ISR	376	Israel 	Izrael	\N
00040000-568a-6ca9-0070-03ece7aa2324	IT	ITA	380	Italy 	Italija	\N
00040000-568a-6ca9-ac54-81ec47e0f927	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-568a-6ca9-a225-cfd47294642e	JP	JPN	392	Japan 	Japonska	\N
00040000-568a-6ca9-ae00-71d85e2032e1	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-568a-6ca9-7f52-9308ca2cf83d	JO	JOR	400	Jordan 	Jordanija	\N
00040000-568a-6ca9-fc1a-aabc79a4a219	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-568a-6ca9-1782-b04d2b6c57e7	KE	KEN	404	Kenya 	Kenija	\N
00040000-568a-6ca9-a73f-f50e1659ddbb	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-568a-6ca9-d7de-c8d3354e3df6	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-568a-6ca9-f97b-59f3a8d99d88	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-568a-6ca9-6d1f-b2b4a086c61e	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-568a-6ca9-0214-32c9c632e57b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-568a-6ca9-01fc-f9bca6c2196c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-568a-6ca9-e0d6-289008b64d19	LV	LVA	428	Latvia 	Latvija	\N
00040000-568a-6ca9-8a31-9d7170cf2cc8	LB	LBN	422	Lebanon 	Libanon	\N
00040000-568a-6ca9-ee18-460661b9f5f8	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-568a-6ca9-35a8-cf1a18560e7f	LR	LBR	430	Liberia 	Liberija	\N
00040000-568a-6ca9-6a4f-1bc144b88310	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-568a-6ca9-e00e-2d1b1026e6b1	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-568a-6ca9-ed5c-46d6c530ff1b	LT	LTU	440	Lithuania 	Litva	\N
00040000-568a-6ca9-5880-31b0157afd17	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-568a-6ca9-f933-5c298c93c982	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-568a-6ca9-3f8a-4b5a133c2e24	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-568a-6ca9-27b9-ebaa8c28f838	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-568a-6ca9-89fe-e680b846d441	MW	MWI	454	Malawi 	Malavi	\N
00040000-568a-6ca9-29c9-2e07cbef5d37	MY	MYS	458	Malaysia 	Malezija	\N
00040000-568a-6ca9-38a4-ceb1a25c2062	MV	MDV	462	Maldives 	Maldivi	\N
00040000-568a-6ca9-b32f-d1e518a1ff68	ML	MLI	466	Mali 	Mali	\N
00040000-568a-6ca9-f67b-712cef9e5765	MT	MLT	470	Malta 	Malta	\N
00040000-568a-6ca9-2384-0e3e7f39ef18	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-568a-6ca9-feb8-7f3f525a5cf0	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-568a-6ca9-ce04-94cdecf8680e	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-568a-6ca9-1036-6ac4b660b40d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-568a-6ca9-0e6e-9538e4ac9735	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-568a-6ca9-c071-a7d829752f0f	MX	MEX	484	Mexico 	Mehika	\N
00040000-568a-6ca9-8fa2-9ec144c44ea0	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-568a-6ca9-f64b-a23e61b25c1e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-568a-6ca9-1e12-a25bf448fd49	MC	MCO	492	Monaco 	Monako	\N
00040000-568a-6ca9-bc44-94f2596ff104	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-568a-6ca9-313c-01d0a6e70970	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-568a-6ca9-0151-4efee3b75b97	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-568a-6ca9-7f67-a38d5cd9e868	MA	MAR	504	Morocco 	Maroko	\N
00040000-568a-6ca9-d518-35020f0fe2db	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-568a-6ca9-cab3-63d105e6780c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-568a-6ca9-8fb1-dd645409d89e	NA	NAM	516	Namibia 	Namibija	\N
00040000-568a-6ca9-e3fb-1ccc5ca15617	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-568a-6ca9-7d86-e62d8ae9b2d5	NP	NPL	524	Nepal 	Nepal	\N
00040000-568a-6ca9-cf48-7f5e608ac6e7	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-568a-6ca9-044e-0bf2ca6555c1	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-568a-6ca9-5d1d-2a3359fa9889	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-568a-6ca9-7d2b-66e91bd79491	NE	NER	562	Niger 	Niger 	\N
00040000-568a-6ca9-5e0c-687408640e2f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-568a-6ca9-57c2-f473bf4a207e	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-568a-6ca9-ceb9-05facd40de45	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-568a-6ca9-2793-e09d1cce2e94	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-568a-6ca9-3102-52ba7e8a9647	NO	NOR	578	Norway 	Norveška	\N
00040000-568a-6ca9-5289-46fac9ed0925	OM	OMN	512	Oman 	Oman	\N
00040000-568a-6ca9-1a3b-edbb9e45bdb3	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-568a-6ca9-7b5b-b3367ce3e7ab	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-568a-6ca9-1435-ddf000cf949c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-568a-6ca9-b5dc-58c560251cf3	PA	PAN	591	Panama 	Panama	\N
00040000-568a-6ca9-6167-10df3e23bac7	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-568a-6ca9-a126-e0a27aa61fc8	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-568a-6ca9-3944-b73ee0de1466	PE	PER	604	Peru 	Peru	\N
00040000-568a-6ca9-0dc8-0898bd9908cf	PH	PHL	608	Philippines 	Filipini	\N
00040000-568a-6ca9-a142-41107bd0ea0d	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-568a-6ca9-b301-b73b75e47dde	PL	POL	616	Poland 	Poljska	\N
00040000-568a-6ca9-1869-3625f586a870	PT	PRT	620	Portugal 	Portugalska	\N
00040000-568a-6ca9-8985-d65612e7a3c9	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-568a-6ca9-0482-99721385ac96	QA	QAT	634	Qatar 	Katar	\N
00040000-568a-6ca9-3953-005fe5054a44	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-568a-6ca9-1d63-50122fe68b61	RO	ROU	642	Romania 	Romunija	\N
00040000-568a-6ca9-606b-81ce222631a7	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-568a-6ca9-eb43-e68353db34ae	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-568a-6ca9-fc97-2a28e5185256	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-568a-6ca9-c773-7888a13be4a4	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-568a-6ca9-801f-5f49e3663645	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-568a-6ca9-f9a7-feb29b3afccf	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-568a-6ca9-10d8-4c657be38f5e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-568a-6ca9-b372-9e912ed83ccc	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-568a-6ca9-312a-ea203c5af4b2	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-568a-6ca9-f111-0724de5d0dce	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-568a-6ca9-22e5-fccf975549c2	SM	SMR	674	San Marino 	San Marino	\N
00040000-568a-6ca9-e9c9-e9124f3c4cb1	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-568a-6ca9-37b4-4977f3c5a324	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-568a-6ca9-2f7f-6085a18d2c17	SN	SEN	686	Senegal 	Senegal	\N
00040000-568a-6ca9-d91c-d4ab6af738f6	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-568a-6ca9-6680-599788ba7c78	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-568a-6ca9-da57-dd44bb019a10	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-568a-6ca9-36e3-5a312442c353	SG	SGP	702	Singapore 	Singapur	\N
00040000-568a-6ca9-5fac-20aa901003a0	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-568a-6ca9-6ff3-7abac9fe9927	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-568a-6ca9-b744-d9662286ab3d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-568a-6ca9-581f-1edd29bc00fb	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-568a-6ca9-31e8-4a1e2b2dbb58	SO	SOM	706	Somalia 	Somalija	\N
00040000-568a-6ca9-5a57-c2a4d8bfd660	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-568a-6ca9-7c4f-c24284535a02	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-568a-6ca9-3407-4e552a092444	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-568a-6ca9-4f77-77d4136c9813	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-568a-6ca9-73da-36ea346ab79e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-568a-6ca9-1d60-fe7c5781fc47	SD	SDN	729	Sudan 	Sudan	\N
00040000-568a-6ca9-555d-ffb5b84fb8cf	SR	SUR	740	Suriname 	Surinam	\N
00040000-568a-6ca9-a341-b7a12716aa87	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-568a-6ca9-84ce-cb9affa8ba53	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-568a-6ca9-bc5a-d902ffff36b8	SE	SWE	752	Sweden 	Švedska	\N
00040000-568a-6ca9-efee-07c5e47428db	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-568a-6ca9-4620-96cfc01e84ab	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-568a-6ca9-0cbb-7e8e83a4fec1	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-568a-6ca9-7afc-91f1291563cc	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-568a-6ca9-4a45-bfbb9f08c087	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-568a-6ca9-a624-7c7230a91b06	TH	THA	764	Thailand 	Tajska	\N
00040000-568a-6ca9-1ef0-c0d4be051d6c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-568a-6ca9-d621-64bf8a8de3c0	TG	TGO	768	Togo 	Togo	\N
00040000-568a-6ca9-7ac7-abe0204f9265	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-568a-6ca9-8c3a-ba8ea9c77588	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-568a-6ca9-5a2d-cbcffe394ff9	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-568a-6ca9-55ec-5ed4d144f4d1	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-568a-6ca9-ffb5-8e5040d54914	TR	TUR	792	Turkey 	Turčija	\N
00040000-568a-6ca9-dff5-f1fba292dc3f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-568a-6ca9-8aa7-d832796558a3	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-568a-6ca9-2fc1-46b901dc6483	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-568a-6ca9-6e95-1a80400cefbf	UG	UGA	800	Uganda 	Uganda	\N
00040000-568a-6ca9-e5b2-c7bc430b5dd0	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-568a-6ca9-dfb2-87569de8e0fc	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-568a-6ca9-d177-7432e16c5c2a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-568a-6ca9-253c-39860d13228d	US	USA	840	United States 	Združene države Amerike	\N
00040000-568a-6ca9-643a-c064807a34d1	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-568a-6ca9-6363-13735072ae1b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-568a-6ca9-0c79-e23ed72cb3fc	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-568a-6ca9-1768-614bab4cd1b4	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-568a-6ca9-b8f9-328d1ad059fb	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-568a-6ca9-5924-9d2400490708	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-568a-6ca9-65a6-8de957d5e5dd	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-568a-6ca9-aaca-18c97d93caad	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-568a-6ca9-fd43-522cf90f66bc	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-568a-6ca9-dbd5-bccaced968b2	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-568a-6ca9-3942-9f4a32c3ea32	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-568a-6ca9-b1b7-d5e4d6b5aed5	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-568a-6ca9-36ee-225077b0159b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3171 (class 0 OID 34210417)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-568a-6cac-98a6-6331a30dd55e	000e0000-568a-6cac-ef8c-a7ed06ce6182	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-568a-6ca8-927e-ac0966d866a3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-568a-6cac-09f8-e437269d6d64	000e0000-568a-6cac-ff46-75596b8271ad	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-568a-6ca8-0f8b-b0944c98a071	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-568a-6cac-0859-87df43fc3d7e	000e0000-568a-6cac-dc1f-ee6afeeed813	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-568a-6ca8-927e-ac0966d866a3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-568a-6cad-a085-addef6733bb9	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-568a-6cad-0c51-68dcaa0125ae	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3156 (class 0 OID 34210221)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-568a-6cac-82cb-762435fa58f8	000e0000-568a-6cac-2b06-93d977c1e6c1	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	0	000f0000-568a-6ca9-75bc-718db009d1ff
000d0000-568a-6cac-67c1-a6d1a13c3050	000e0000-568a-6cac-2b06-93d977c1e6c1	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	0	000f0000-568a-6ca9-6e0c-60d6c1a9522b
000d0000-568a-6cac-6553-393e94771424	000e0000-568a-6cac-ff46-75596b8271ad	000c0000-568a-6cad-cea1-acc055c26fc3	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-568a-6ca9-75bc-718db009d1ff
000d0000-568a-6cac-8a11-506c04321b44	000e0000-568a-6cac-ff46-75596b8271ad	000c0000-568a-6cad-49f1-710a99bb517c	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-568a-6ca9-6e0c-60d6c1a9522b
000d0000-568a-6cac-5bbf-e4e2f894a0e8	000e0000-568a-6cac-ff46-75596b8271ad	000c0000-568a-6cad-2163-d569236e62a2	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-568a-6ca9-0cea-0b2c9ffb3290
000d0000-568a-6cac-0216-c4cb4b58bf2d	000e0000-568a-6cac-ff46-75596b8271ad	000c0000-568a-6cad-dd96-0ff7681136b2	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-568a-6ca9-0db4-53bdc84be5eb
000d0000-568a-6cac-516f-1373336009ee	000e0000-568a-6cac-ff46-75596b8271ad	000c0000-568a-6cad-0d8b-88237ee1bdb9	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-568a-6ca9-0db4-53bdc84be5eb
000d0000-568a-6cac-1067-58aa9890b8ba	000e0000-568a-6cac-ff46-75596b8271ad	000c0000-568a-6cad-fc4e-ca6cadcfb0fb	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-568a-6ca9-75bc-718db009d1ff
000d0000-568a-6cac-be37-90a7d965d1cd	000e0000-568a-6cac-ff46-75596b8271ad	000c0000-568a-6cad-faa2-43dff775fd80	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-568a-6ca9-75bc-718db009d1ff
000d0000-568a-6cac-e257-eb1d3d967b7c	000e0000-568a-6cac-ff46-75596b8271ad	000c0000-568a-6cad-b7d9-d5e3e8d46e8a	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-568a-6ca9-1475-1a5eee14c9be
000d0000-568a-6cac-25ed-04160864b9f7	000e0000-568a-6cac-ff46-75596b8271ad	000c0000-568a-6cad-afc0-4535bb07f793	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-568a-6ca9-d6e3-fde00033f142
000d0000-568a-6cac-a6e6-07651c2ea0e6	000e0000-568a-6cac-b59f-acd088f31b8e	000c0000-568a-6cad-10a7-a86b366ba8d2	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	2	000f0000-568a-6ca9-6e0c-60d6c1a9522b
000d0000-568a-6cac-4af4-d2a5a77e3930	000e0000-568a-6cac-e28d-85774f1dc42f	000c0000-568a-6cad-e18c-98c0b13130e1	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	2	000f0000-568a-6ca9-6e0c-60d6c1a9522b
000d0000-568a-6cac-67fa-f8febf8fe682	000e0000-568a-6cac-e28d-85774f1dc42f	000c0000-568a-6cad-2c35-a6ca2fe0e291	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	2	000f0000-568a-6ca9-6e0c-60d6c1a9522b
000d0000-568a-6cac-52d8-e6a41ef77380	000e0000-568a-6cac-8972-f8357b2c15e8	000c0000-568a-6cad-c319-f9de82bd12fc	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	2	000f0000-568a-6ca9-6e0c-60d6c1a9522b
000d0000-568a-6cac-0484-0bfb01ae2298	000e0000-568a-6cac-b751-f45b35f20395	000c0000-568a-6cad-c68d-df3f3da432fd	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	2	000f0000-568a-6ca9-6e0c-60d6c1a9522b
000d0000-568a-6cac-9f1c-8b40fd165171	000e0000-568a-6cac-f6b8-73bd00c6638b	000c0000-568a-6cad-b21e-f6896997bfe7	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	1	000f0000-568a-6ca9-6e0c-60d6c1a9522b
000d0000-568a-6cac-950a-ed585e84be8e	000e0000-568a-6cac-63e8-c3d60c49665c	000c0000-568a-6cad-1b4c-d3c70ea9d959	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	1	000f0000-568a-6ca9-6e0c-60d6c1a9522b
000d0000-568a-6cac-1a95-22e277e401e0	000e0000-568a-6cac-307a-8744757d07cf	000c0000-568a-6cad-cd6c-5a278761b85c	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	2	000f0000-568a-6ca9-6e0c-60d6c1a9522b
000d0000-568a-6cac-b366-8860518b656c	000e0000-568a-6cac-14b0-ff338bb41b84	000c0000-568a-6cad-2347-f8541615b441	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	2	000f0000-568a-6ca9-6e0c-60d6c1a9522b
000d0000-568a-6cac-f1a5-3573d93ca7c6	000e0000-568a-6cac-14b0-ff338bb41b84	000c0000-568a-6cad-76bc-f5c4b49cb560	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	4	000f0000-568a-6ca9-6e0c-60d6c1a9522b
000d0000-568a-6cac-c84d-a03449a064d2	000e0000-568a-6cac-473e-0294a86ac8a0	000c0000-568a-6cad-a6e6-88747e926ffa	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	1	000f0000-568a-6ca9-6e0c-60d6c1a9522b
000d0000-568a-6cac-645c-3ea7f63d5f5c	000e0000-568a-6cac-473e-0294a86ac8a0	000c0000-568a-6cad-5a37-43255aaa7ef8	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	2	000f0000-568a-6ca9-6e0c-60d6c1a9522b
\.


--
-- TOC entry 3133 (class 0 OID 34210012)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 34209978)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 34209955)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-568a-6cac-4301-dae2ff05dcc9	00080000-568a-6cac-9d23-54c27288c9bf	00090000-568a-6cac-b7fe-9f735454f4dc	AK		igralka
\.


--
-- TOC entry 3145 (class 0 OID 34210135)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3182 (class 0 OID 34210687)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-568a-6cac-f22c-d420c5e29baa	00010000-568a-6caa-d88b-e6ad3c3cca68	\N	Prva mapa	Root mapa	2016-01-04 13:59:24	2016-01-04 13:59:24	R	\N	\N
\.


--
-- TOC entry 3183 (class 0 OID 34210700)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 34210722)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 33138684)
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
\.


--
-- TOC entry 3149 (class 0 OID 34210160)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 34209912)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-568a-6caa-060d-4d7a6b2535e2	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-568a-6caa-5c90-f91a9272fab3	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-568a-6caa-ca9c-2eefa4b3ab16	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-568a-6caa-c24f-47a29d0efa23	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-568a-6caa-d364-80fd3b5fe0af	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-568a-6caa-fc20-f5225289fd8b	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-568a-6caa-10da-951f106cb20f	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-568a-6caa-f710-a8f96db03321	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-568a-6caa-bc48-353b601bec7c	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-568a-6caa-7539-90de6bea9314	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-568a-6caa-99ac-8daffe91bce2	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-568a-6caa-86a2-5ec96bf6af4a	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-568a-6caa-9d91-a5235efb354f	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-568a-6caa-bd6f-ebdbff85b17c	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-568a-6cac-be41-d991cf7af534	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-568a-6cac-8c0e-129021677372	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-568a-6cac-5a39-d70f48130f4b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-568a-6cac-867c-8047419f4fe3	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-568a-6cac-9a7f-e62356a9c14b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-568a-6cae-5916-481299cc3023	application.tenant.maticnopodjetje	string	s:36:"00080000-568a-6cae-aff4-bb3ab5fec1c2";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3118 (class 0 OID 34209812)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-568a-6cac-c109-0d6edac20442	00000000-568a-6cac-be41-d991cf7af534	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-568a-6cac-cef7-e81ddb453dd8	00000000-568a-6cac-be41-d991cf7af534	00010000-568a-6caa-d88b-e6ad3c3cca68	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-568a-6cac-cce1-e1a5ae05372e	00000000-568a-6cac-8c0e-129021677372	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3122 (class 0 OID 34209879)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-568a-6cac-8762-b3accc2a7d4b	\N	00100000-568a-6cac-b5a7-9e3e3be38a6a	00100000-568a-6cac-b5f8-a5a9ffbae394	01	Gledališče Nimbis
00410000-568a-6cac-35cf-2d6883fbe9e2	00410000-568a-6cac-8762-b3accc2a7d4b	00100000-568a-6cac-b5a7-9e3e3be38a6a	00100000-568a-6cac-b5f8-a5a9ffbae394	02	Tehnika
\.


--
-- TOC entry 3119 (class 0 OID 34209823)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-568a-6cac-58bd-d1523363b4b2	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-568a-6cac-b13c-7afd7df43ce8	00010000-568a-6cac-cd68-2643baa82362	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-568a-6cac-938b-1d6c69fb5a1b	00010000-568a-6cac-b06e-ee45dc62bf35	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-568a-6cac-d7e5-8192fa73dfb4	00010000-568a-6cac-bf10-17eda95de849	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-568a-6cac-3cfc-1b5c55096758	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-568a-6cac-d39c-e77231f7ce8c	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-568a-6cac-c565-f551daf8f43f	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-568a-6cac-e871-fffd577d9aa7	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-568a-6cac-b7fe-9f735454f4dc	00010000-568a-6cac-9485-4c0fa62ece6c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-568a-6cac-301a-48c52c29812b	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-568a-6cac-ec5c-f43ab21ea71e	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-568a-6cac-2cee-ccdb944f9335	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-568a-6cac-a8af-fe8cca951969	00010000-568a-6cac-c489-9688137083bd	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-568a-6cac-2ee7-c1b20811e446	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-568a-6cac-b364-7adeadb0c223	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-568a-6cac-3109-06eb3f2af7a0	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-568a-6cac-898d-c725ce100ca1	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-568a-6cac-8e8a-6ac381cff93d	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-568a-6cac-4734-53eb1c99e93c	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-568a-6cac-191c-238e74ffb267	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-568a-6cac-84da-ffe66f2a6b0e	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3111 (class 0 OID 34209758)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-568a-6ca9-a534-50776fc074a0	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-568a-6ca9-3610-1bf151a278b9	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-568a-6ca9-42b4-8f024dcfb639	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-568a-6ca9-b895-3980a9d629d7	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-568a-6ca9-efc1-b3428814805c	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-568a-6ca9-db4f-b8968788b090	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-568a-6ca9-f721-73b681afeb71	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-568a-6ca9-0ba9-f45b8d8743b4	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-568a-6ca9-6b5f-225b1daf105b	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-568a-6ca9-0539-ff7b87e7ed68	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-568a-6ca9-281a-4f0d9b2cb1a7	Abonma-read	Abonma - branje	t
00030000-568a-6ca9-6739-c723e96af877	Abonma-write	Abonma - spreminjanje	t
00030000-568a-6ca9-3a2a-97d94b36f9a9	Alternacija-read	Alternacija - branje	t
00030000-568a-6ca9-5bdd-2ead82b63d1e	Alternacija-write	Alternacija - spreminjanje	t
00030000-568a-6ca9-4304-9791303c45a5	Arhivalija-read	Arhivalija - branje	t
00030000-568a-6ca9-4e23-d46cbda24ee6	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-568a-6ca9-9fda-fec84d0f13e6	AuthStorage-read	AuthStorage - branje	t
00030000-568a-6ca9-0f72-034552fb4875	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-568a-6ca9-2c2a-b9db6f0c0210	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-568a-6ca9-9e02-3a80ba53677a	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-568a-6ca9-62e6-27d54157c6ea	Besedilo-read	Besedilo - branje	t
00030000-568a-6ca9-da1a-609fa5f7d79d	Besedilo-write	Besedilo - spreminjanje	t
00030000-568a-6ca9-82d1-94cb6fe0915c	Dogodek-read	Dogodek - branje	t
00030000-568a-6ca9-c51c-d4a8e1ae01e9	Dogodek-write	Dogodek - spreminjanje	t
00030000-568a-6ca9-4672-2a5270f49365	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-568a-6ca9-46aa-f9ff90b9b0df	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-568a-6ca9-6b0e-dd8610c792d5	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-568a-6ca9-c982-bbb822cd5fa4	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-568a-6ca9-9341-3c28e45ecdff	DogodekTrait-read	DogodekTrait - branje	t
00030000-568a-6ca9-0764-50240a43717f	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-568a-6ca9-6e5c-bb01ee3772b4	DrugiVir-read	DrugiVir - branje	t
00030000-568a-6ca9-e838-7b88604aa923	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-568a-6ca9-9476-3f073513034f	Drzava-read	Drzava - branje	t
00030000-568a-6ca9-1d7e-560ec0a274f9	Drzava-write	Drzava - spreminjanje	t
00030000-568a-6ca9-8c23-03810c192d63	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-568a-6ca9-0660-551ec2070360	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-568a-6ca9-92ce-984010ed4a72	Funkcija-read	Funkcija - branje	t
00030000-568a-6ca9-3fe1-f9332cf9a475	Funkcija-write	Funkcija - spreminjanje	t
00030000-568a-6ca9-85c6-ffc16ecd4965	Gostovanje-read	Gostovanje - branje	t
00030000-568a-6ca9-e514-cabc664ed46b	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-568a-6ca9-0bcc-29ffca163542	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-568a-6ca9-8348-6aebae1faa48	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-568a-6ca9-e4f9-1eeedbe80d05	Kupec-read	Kupec - branje	t
00030000-568a-6ca9-c026-4a97de8f4eca	Kupec-write	Kupec - spreminjanje	t
00030000-568a-6ca9-8b0a-9be442c44ebd	NacinPlacina-read	NacinPlacina - branje	t
00030000-568a-6ca9-7e31-5bbc47bbdfa8	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-568a-6ca9-94d8-68834a239b8c	Option-read	Option - branje	t
00030000-568a-6ca9-eedc-22d57595b559	Option-write	Option - spreminjanje	t
00030000-568a-6ca9-e42d-f8286aeeebac	OptionValue-read	OptionValue - branje	t
00030000-568a-6ca9-1686-d00febb36b7a	OptionValue-write	OptionValue - spreminjanje	t
00030000-568a-6ca9-7c5d-f3e4b184e503	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-568a-6ca9-4967-bc4e24005f5f	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-568a-6ca9-020a-68e004899c5b	Oseba-read	Oseba - branje	t
00030000-568a-6ca9-3613-8b19582e7102	Oseba-write	Oseba - spreminjanje	t
00030000-568a-6ca9-cfff-eb4c464913a2	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-568a-6ca9-9a47-b77d2c6a0ecc	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-568a-6ca9-826d-272e32d8d986	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-568a-6ca9-b21a-03e1ea339f8e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-568a-6ca9-68c5-2eab86e32594	Pogodba-read	Pogodba - branje	t
00030000-568a-6ca9-d80f-029cbd9e02de	Pogodba-write	Pogodba - spreminjanje	t
00030000-568a-6ca9-cdb7-ff988708e662	Popa-read	Popa - branje	t
00030000-568a-6ca9-08d8-07bfa9202219	Popa-write	Popa - spreminjanje	t
00030000-568a-6ca9-8660-83a8354ba7ba	Posta-read	Posta - branje	t
00030000-568a-6ca9-00f4-2737e022e4a8	Posta-write	Posta - spreminjanje	t
00030000-568a-6ca9-dd41-b9ee0bace0db	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-568a-6ca9-97ef-5cdcc5056ac0	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-568a-6ca9-ed1c-76ae96d70d9e	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-568a-6ca9-43aa-27f5e6e50646	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-568a-6ca9-d452-c08d13156a2a	PostniNaslov-read	PostniNaslov - branje	t
00030000-568a-6ca9-fd6f-431613d76f7e	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-568a-6ca9-bb68-385a09cf8e9a	Praznik-read	Praznik - branje	t
00030000-568a-6ca9-fc45-e0c91832e3aa	Praznik-write	Praznik - spreminjanje	t
00030000-568a-6ca9-31a7-ac6a9352652e	Predstava-read	Predstava - branje	t
00030000-568a-6ca9-68ee-eac32e7d1d3c	Predstava-write	Predstava - spreminjanje	t
00030000-568a-6ca9-de0e-4d10a46b4510	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-568a-6ca9-1f44-9353554b2c47	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-568a-6ca9-1006-159cf293e10b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-568a-6ca9-a592-19ce318745e5	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-568a-6ca9-1c68-99523f025a0e	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-568a-6ca9-b233-848ecaf0a8d2	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-568a-6ca9-745c-5ca138a29768	ProgramDela-read	ProgramDela - branje	t
00030000-568a-6ca9-d3b9-4a168d44e264	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-568a-6ca9-7faa-40efb880d6b2	ProgramFestival-read	ProgramFestival - branje	t
00030000-568a-6ca9-d399-6eddc49dfb04	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-568a-6ca9-63ef-6cc959a9cf51	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-568a-6ca9-0234-7741f13387d6	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-568a-6ca9-ec2b-c6eed0de6e0e	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-568a-6ca9-d804-0257252b8979	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-568a-6ca9-2be8-d9184dee3a94	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-568a-6ca9-03d3-6f976940b8a5	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-568a-6ca9-40b6-553990906742	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-568a-6ca9-ac8e-4cf486f17223	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-568a-6ca9-3513-23bc5945d945	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-568a-6ca9-5fc2-0f9d0dfec593	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-568a-6ca9-4832-e4ec63081b24	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-568a-6ca9-aa24-0d95bc1e7e7b	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-568a-6ca9-aa76-04b3e912ea97	ProgramRazno-read	ProgramRazno - branje	t
00030000-568a-6ca9-4b40-3a3b522efd69	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-568a-6ca9-7b49-00ece22fed92	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-568a-6ca9-b4f9-de3f51af8cd6	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-568a-6ca9-9409-8ee80db71de4	Prostor-read	Prostor - branje	t
00030000-568a-6ca9-004f-dae18dd38770	Prostor-write	Prostor - spreminjanje	t
00030000-568a-6ca9-77dd-1356eea7bec2	Racun-read	Racun - branje	t
00030000-568a-6ca9-9a06-cd20213d6f39	Racun-write	Racun - spreminjanje	t
00030000-568a-6ca9-21e9-bb8c10fca1ad	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-568a-6ca9-bead-e1a6021b94fb	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-568a-6ca9-91e8-b735ecffc1bf	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-568a-6ca9-ae14-2349f832686b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-568a-6ca9-cd67-40ff256b1914	Rekvizit-read	Rekvizit - branje	t
00030000-568a-6ca9-eb29-61523388cf83	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-568a-6ca9-f6aa-eace8fc91266	Revizija-read	Revizija - branje	t
00030000-568a-6ca9-9ddb-1e97d0a723bc	Revizija-write	Revizija - spreminjanje	t
00030000-568a-6ca9-e1ce-ad9c41fe9588	Rezervacija-read	Rezervacija - branje	t
00030000-568a-6ca9-2af6-43132d2d2de8	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-568a-6ca9-2833-6aeac86853f2	SedezniRed-read	SedezniRed - branje	t
00030000-568a-6ca9-f550-ec66bccba750	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-568a-6ca9-5e5f-76d6789d4c74	Sedez-read	Sedez - branje	t
00030000-568a-6ca9-61db-ef2e37506425	Sedez-write	Sedez - spreminjanje	t
00030000-568a-6ca9-c0e1-fe6f4efed174	Sezona-read	Sezona - branje	t
00030000-568a-6ca9-937d-249594c9e5eb	Sezona-write	Sezona - spreminjanje	t
00030000-568a-6ca9-7754-57f35a1c041b	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-568a-6ca9-a8ad-87e821d22659	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-568a-6ca9-70e0-c075b7d8c0a5	Telefonska-read	Telefonska - branje	t
00030000-568a-6ca9-ad60-9bad81b7bd10	Telefonska-write	Telefonska - spreminjanje	t
00030000-568a-6ca9-06d7-57125a8f6058	TerminStoritve-read	TerminStoritve - branje	t
00030000-568a-6ca9-72bc-95bf97786ff2	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-568a-6ca9-a525-27a181a6661a	TipFunkcije-read	TipFunkcije - branje	t
00030000-568a-6ca9-27de-4ed7165bfa25	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-568a-6ca9-ea0b-014c385899e9	TipPopa-read	TipPopa - branje	t
00030000-568a-6ca9-87b9-79f0668461b1	TipPopa-write	TipPopa - spreminjanje	t
00030000-568a-6ca9-34d4-1dff7f5b92df	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-568a-6ca9-f768-593318c2e7a7	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-568a-6ca9-ddcc-36d325361422	TipVaje-read	TipVaje - branje	t
00030000-568a-6ca9-57ed-637186396421	TipVaje-write	TipVaje - spreminjanje	t
00030000-568a-6ca9-a4f0-950bba9a2c99	Trr-read	Trr - branje	t
00030000-568a-6ca9-2b87-2aa7a3952339	Trr-write	Trr - spreminjanje	t
00030000-568a-6ca9-8fb3-2b54f8eb8c9f	Uprizoritev-read	Uprizoritev - branje	t
00030000-568a-6ca9-0cdc-368230c3211f	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-568a-6ca9-4514-619ef5762bdf	Vaja-read	Vaja - branje	t
00030000-568a-6ca9-94ed-bc20b82e353a	Vaja-write	Vaja - spreminjanje	t
00030000-568a-6ca9-e648-b4f796bd3800	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-568a-6ca9-c3ee-91a0f61cd3eb	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-568a-6ca9-3a59-013c7ab1e7c5	VrstaStroska-read	VrstaStroska - branje	t
00030000-568a-6ca9-64d4-4c41dcaeb57a	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-568a-6ca9-77bb-6ec48bc14a04	Zaposlitev-read	Zaposlitev - branje	t
00030000-568a-6ca9-c351-17a2dd9069be	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-568a-6ca9-c973-6bbcd336139c	Zasedenost-read	Zasedenost - branje	t
00030000-568a-6ca9-0e08-2848833cc107	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-568a-6ca9-5616-c29294bb5292	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-568a-6ca9-5b08-33943f63b28c	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-568a-6ca9-37d3-2ac3dde65fa1	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-568a-6ca9-211f-7e318fb49aac	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-568a-6ca9-cd48-0009c6d26389	Job-read	Branje opravil - samo zase - branje	t
00030000-568a-6ca9-f0c8-79ea74ac6c37	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-568a-6ca9-ff2b-9482ef7ec0fd	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-568a-6ca9-517e-7864bbf0a39d	Report-read	Report - branje	t
00030000-568a-6ca9-ec16-d649127e5c65	Report-write	Report - spreminjanje	t
00030000-568a-6ca9-49a5-87e8e0618568	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-568a-6ca9-4823-f705ed903f64	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-568a-6ca9-d7ee-8cb6a53cd1df	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-568a-6ca9-39fd-5e37a86088d6	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-568a-6ca9-31f7-8e3458b2ca81	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-568a-6ca9-2877-e80ec573844c	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-568a-6ca9-1fc2-e672eca44516	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-568a-6ca9-9faf-8ce42f77d293	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-568a-6ca9-9b72-9db582de36cb	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-568a-6ca9-20c2-a97f218feb8a	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-568a-6ca9-f8aa-ed54a2145694	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-568a-6ca9-f3bf-047037625d95	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-568a-6ca9-193e-b588fb317cf8	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-568a-6ca9-0cda-2b3a2b39cd15	Datoteka-write	Datoteka - spreminjanje	t
00030000-568a-6ca9-def5-438c4cacf038	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3113 (class 0 OID 34209777)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-568a-6ca9-c296-9baf41043940	00030000-568a-6ca9-3610-1bf151a278b9
00020000-568a-6ca9-c296-9baf41043940	00030000-568a-6ca9-a534-50776fc074a0
00020000-568a-6ca9-b65c-977c39ff17bf	00030000-568a-6ca9-9476-3f073513034f
00020000-568a-6ca9-0d80-222c40b2ffab	00030000-568a-6ca9-9e02-3a80ba53677a
00020000-568a-6ca9-0d80-222c40b2ffab	00030000-568a-6ca9-da1a-609fa5f7d79d
00020000-568a-6ca9-0d80-222c40b2ffab	00030000-568a-6ca9-0cda-2b3a2b39cd15
00020000-568a-6ca9-0d80-222c40b2ffab	00030000-568a-6ca9-3613-8b19582e7102
00020000-568a-6ca9-0d80-222c40b2ffab	00030000-568a-6ca9-9faf-8ce42f77d293
00020000-568a-6ca9-0d80-222c40b2ffab	00030000-568a-6ca9-20c2-a97f218feb8a
00020000-568a-6ca9-0d80-222c40b2ffab	00030000-568a-6ca9-2c2a-b9db6f0c0210
00020000-568a-6ca9-0d80-222c40b2ffab	00030000-568a-6ca9-62e6-27d54157c6ea
00020000-568a-6ca9-0d80-222c40b2ffab	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6ca9-0d80-222c40b2ffab	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6ca9-0d80-222c40b2ffab	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6ca9-0d80-222c40b2ffab	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6ca9-66d6-a6c4ca963883	00030000-568a-6ca9-2c2a-b9db6f0c0210
00020000-568a-6ca9-66d6-a6c4ca963883	00030000-568a-6ca9-62e6-27d54157c6ea
00020000-568a-6ca9-66d6-a6c4ca963883	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6ca9-66d6-a6c4ca963883	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6ca9-66d6-a6c4ca963883	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6ca9-66d6-a6c4ca963883	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6ca9-8605-1585670acadd	00030000-568a-6ca9-77bb-6ec48bc14a04
00020000-568a-6ca9-8605-1585670acadd	00030000-568a-6ca9-c351-17a2dd9069be
00020000-568a-6ca9-8605-1585670acadd	00030000-568a-6ca9-db4f-b8968788b090
00020000-568a-6ca9-8605-1585670acadd	00030000-568a-6ca9-efc1-b3428814805c
00020000-568a-6ca9-8605-1585670acadd	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6ca9-8605-1585670acadd	00030000-568a-6ca9-3613-8b19582e7102
00020000-568a-6ca9-8605-1585670acadd	00030000-568a-6ca9-7c5d-f3e4b184e503
00020000-568a-6ca9-a7ae-917b7c25924c	00030000-568a-6ca9-77bb-6ec48bc14a04
00020000-568a-6ca9-a7ae-917b7c25924c	00030000-568a-6ca9-db4f-b8968788b090
00020000-568a-6ca9-a7ae-917b7c25924c	00030000-568a-6ca9-7c5d-f3e4b184e503
00020000-568a-6ca9-9fa2-566cc887575e	00030000-568a-6ca9-3613-8b19582e7102
00020000-568a-6ca9-9fa2-566cc887575e	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6ca9-9fa2-566cc887575e	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6ca9-9fa2-566cc887575e	00030000-568a-6ca9-0cda-2b3a2b39cd15
00020000-568a-6ca9-9fa2-566cc887575e	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6ca9-9fa2-566cc887575e	00030000-568a-6ca9-20c2-a97f218feb8a
00020000-568a-6ca9-9fa2-566cc887575e	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6ca9-9fa2-566cc887575e	00030000-568a-6ca9-9faf-8ce42f77d293
00020000-568a-6ca9-475f-33d0109354f0	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6ca9-475f-33d0109354f0	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6ca9-475f-33d0109354f0	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6ca9-475f-33d0109354f0	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6ca9-f3f5-039321e3bcd4	00030000-568a-6ca9-3613-8b19582e7102
00020000-568a-6ca9-f3f5-039321e3bcd4	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6ca9-f3f5-039321e3bcd4	00030000-568a-6ca9-db4f-b8968788b090
00020000-568a-6ca9-f3f5-039321e3bcd4	00030000-568a-6ca9-efc1-b3428814805c
00020000-568a-6ca9-f3f5-039321e3bcd4	00030000-568a-6ca9-a4f0-950bba9a2c99
00020000-568a-6ca9-f3f5-039321e3bcd4	00030000-568a-6ca9-2b87-2aa7a3952339
00020000-568a-6ca9-f3f5-039321e3bcd4	00030000-568a-6ca9-d452-c08d13156a2a
00020000-568a-6ca9-f3f5-039321e3bcd4	00030000-568a-6ca9-fd6f-431613d76f7e
00020000-568a-6ca9-f3f5-039321e3bcd4	00030000-568a-6ca9-70e0-c075b7d8c0a5
00020000-568a-6ca9-f3f5-039321e3bcd4	00030000-568a-6ca9-ad60-9bad81b7bd10
00020000-568a-6ca9-f3f5-039321e3bcd4	00030000-568a-6ca9-9476-3f073513034f
00020000-568a-6ca9-f3f5-039321e3bcd4	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6ca9-9ff8-2132792ec8a3	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6ca9-9ff8-2132792ec8a3	00030000-568a-6ca9-db4f-b8968788b090
00020000-568a-6ca9-9ff8-2132792ec8a3	00030000-568a-6ca9-a4f0-950bba9a2c99
00020000-568a-6ca9-9ff8-2132792ec8a3	00030000-568a-6ca9-d452-c08d13156a2a
00020000-568a-6ca9-9ff8-2132792ec8a3	00030000-568a-6ca9-70e0-c075b7d8c0a5
00020000-568a-6ca9-9ff8-2132792ec8a3	00030000-568a-6ca9-9476-3f073513034f
00020000-568a-6ca9-9ff8-2132792ec8a3	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-70e0-c075b7d8c0a5
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-d452-c08d13156a2a
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-a4f0-950bba9a2c99
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-cdb7-ff988708e662
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-0bcc-29ffca163542
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-1c68-99523f025a0e
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-ad60-9bad81b7bd10
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-fd6f-431613d76f7e
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-9faf-8ce42f77d293
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-2b87-2aa7a3952339
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-08d8-07bfa9202219
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-0cda-2b3a2b39cd15
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-20c2-a97f218feb8a
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-8348-6aebae1faa48
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-b233-848ecaf0a8d2
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-9476-3f073513034f
00020000-568a-6ca9-fd82-7be653369847	00030000-568a-6ca9-ea0b-014c385899e9
00020000-568a-6ca9-5a2d-65396ac4cbb2	00030000-568a-6ca9-70e0-c075b7d8c0a5
00020000-568a-6ca9-5a2d-65396ac4cbb2	00030000-568a-6ca9-d452-c08d13156a2a
00020000-568a-6ca9-5a2d-65396ac4cbb2	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6ca9-5a2d-65396ac4cbb2	00030000-568a-6ca9-a4f0-950bba9a2c99
00020000-568a-6ca9-5a2d-65396ac4cbb2	00030000-568a-6ca9-cdb7-ff988708e662
00020000-568a-6ca9-5a2d-65396ac4cbb2	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6ca9-5a2d-65396ac4cbb2	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6ca9-5a2d-65396ac4cbb2	00030000-568a-6ca9-0bcc-29ffca163542
00020000-568a-6ca9-5a2d-65396ac4cbb2	00030000-568a-6ca9-1c68-99523f025a0e
00020000-568a-6ca9-5a2d-65396ac4cbb2	00030000-568a-6ca9-9476-3f073513034f
00020000-568a-6ca9-5a2d-65396ac4cbb2	00030000-568a-6ca9-ea0b-014c385899e9
00020000-568a-6ca9-7dd6-9157a88b88cb	00030000-568a-6ca9-ea0b-014c385899e9
00020000-568a-6ca9-7dd6-9157a88b88cb	00030000-568a-6ca9-87b9-79f0668461b1
00020000-568a-6ca9-3d69-9b6a8af9df1e	00030000-568a-6ca9-ea0b-014c385899e9
00020000-568a-6ca9-5c0d-b705cf19bc46	00030000-568a-6ca9-8660-83a8354ba7ba
00020000-568a-6ca9-5c0d-b705cf19bc46	00030000-568a-6ca9-00f4-2737e022e4a8
00020000-568a-6ca9-3ba7-0fb14f38fec7	00030000-568a-6ca9-8660-83a8354ba7ba
00020000-568a-6ca9-6015-f8313a0642c1	00030000-568a-6ca9-9476-3f073513034f
00020000-568a-6ca9-6015-f8313a0642c1	00030000-568a-6ca9-1d7e-560ec0a274f9
00020000-568a-6ca9-74e4-cca045a53503	00030000-568a-6ca9-9476-3f073513034f
00020000-568a-6ca9-2abd-0580a5b6b1bb	00030000-568a-6ca9-37d3-2ac3dde65fa1
00020000-568a-6ca9-2abd-0580a5b6b1bb	00030000-568a-6ca9-211f-7e318fb49aac
00020000-568a-6ca9-5e9e-9648862d58f0	00030000-568a-6ca9-37d3-2ac3dde65fa1
00020000-568a-6ca9-795e-61853ce904c7	00030000-568a-6ca9-5616-c29294bb5292
00020000-568a-6ca9-795e-61853ce904c7	00030000-568a-6ca9-5b08-33943f63b28c
00020000-568a-6ca9-7225-c2a323f1731d	00030000-568a-6ca9-5616-c29294bb5292
00020000-568a-6ca9-2fcc-66aaccf75f44	00030000-568a-6ca9-281a-4f0d9b2cb1a7
00020000-568a-6ca9-2fcc-66aaccf75f44	00030000-568a-6ca9-6739-c723e96af877
00020000-568a-6ca9-9f50-d3be31a9260e	00030000-568a-6ca9-281a-4f0d9b2cb1a7
00020000-568a-6ca9-9582-5a861c2c0bb1	00030000-568a-6ca9-9409-8ee80db71de4
00020000-568a-6ca9-9582-5a861c2c0bb1	00030000-568a-6ca9-004f-dae18dd38770
00020000-568a-6ca9-9582-5a861c2c0bb1	00030000-568a-6ca9-cdb7-ff988708e662
00020000-568a-6ca9-9582-5a861c2c0bb1	00030000-568a-6ca9-d452-c08d13156a2a
00020000-568a-6ca9-9582-5a861c2c0bb1	00030000-568a-6ca9-fd6f-431613d76f7e
00020000-568a-6ca9-9582-5a861c2c0bb1	00030000-568a-6ca9-9476-3f073513034f
00020000-568a-6ca9-c144-3c0199ccec72	00030000-568a-6ca9-9409-8ee80db71de4
00020000-568a-6ca9-c144-3c0199ccec72	00030000-568a-6ca9-cdb7-ff988708e662
00020000-568a-6ca9-c144-3c0199ccec72	00030000-568a-6ca9-d452-c08d13156a2a
00020000-568a-6ca9-eba0-0586fbd25f23	00030000-568a-6ca9-3a59-013c7ab1e7c5
00020000-568a-6ca9-eba0-0586fbd25f23	00030000-568a-6ca9-64d4-4c41dcaeb57a
00020000-568a-6ca9-6b96-3540c1fd5c06	00030000-568a-6ca9-3a59-013c7ab1e7c5
00020000-568a-6ca9-36ab-abd346340fb2	00030000-568a-6ca9-4967-bc4e24005f5f
00020000-568a-6ca9-36ab-abd346340fb2	00030000-568a-6ca9-7c5d-f3e4b184e503
00020000-568a-6ca9-36ab-abd346340fb2	00030000-568a-6ca9-77bb-6ec48bc14a04
00020000-568a-6ca9-36ab-abd346340fb2	00030000-568a-6ca9-0cda-2b3a2b39cd15
00020000-568a-6ca9-36ab-abd346340fb2	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6ca9-36ab-abd346340fb2	00030000-568a-6ca9-9faf-8ce42f77d293
00020000-568a-6ca9-36ab-abd346340fb2	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6ca9-36ab-abd346340fb2	00030000-568a-6ca9-20c2-a97f218feb8a
00020000-568a-6ca9-36ab-abd346340fb2	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6ca9-34c1-d0503f30737e	00030000-568a-6ca9-7c5d-f3e4b184e503
00020000-568a-6ca9-34c1-d0503f30737e	00030000-568a-6ca9-77bb-6ec48bc14a04
00020000-568a-6ca9-34c1-d0503f30737e	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6ca9-34c1-d0503f30737e	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6ca9-34c1-d0503f30737e	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6ca9-a57c-b96705617ff5	00030000-568a-6ca9-ddcc-36d325361422
00020000-568a-6ca9-a57c-b96705617ff5	00030000-568a-6ca9-57ed-637186396421
00020000-568a-6ca9-68e6-3ec0f1ecb733	00030000-568a-6ca9-ddcc-36d325361422
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-f721-73b681afeb71
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-0ba9-f45b8d8743b4
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-745c-5ca138a29768
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-d3b9-4a168d44e264
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-7faa-40efb880d6b2
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-d399-6eddc49dfb04
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-63ef-6cc959a9cf51
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-0234-7741f13387d6
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-ec2b-c6eed0de6e0e
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-d804-0257252b8979
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-2be8-d9184dee3a94
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-03d3-6f976940b8a5
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-40b6-553990906742
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-ac8e-4cf486f17223
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-3513-23bc5945d945
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-5fc2-0f9d0dfec593
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-4832-e4ec63081b24
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-aa24-0d95bc1e7e7b
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-aa76-04b3e912ea97
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-4b40-3a3b522efd69
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-7b49-00ece22fed92
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-b4f9-de3f51af8cd6
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-a592-19ce318745e5
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-e838-7b88604aa923
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-97ef-5cdcc5056ac0
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-f0c8-79ea74ac6c37
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-6e5c-bb01ee3772b4
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-1006-159cf293e10b
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-1c68-99523f025a0e
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-dd41-b9ee0bace0db
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-3a59-013c7ab1e7c5
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-8fb3-2b54f8eb8c9f
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-7754-57f35a1c041b
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-92ce-984010ed4a72
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-3a2a-97d94b36f9a9
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-a525-27a181a6661a
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-68c5-2eab86e32594
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-9476-3f073513034f
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-cdb7-ff988708e662
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-0cda-2b3a2b39cd15
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-9faf-8ce42f77d293
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-20c2-a97f218feb8a
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-cd48-0009c6d26389
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6ca9-54b2-fe6544f953cf	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6ca9-210a-4dfd510c241b	00030000-568a-6ca9-745c-5ca138a29768
00020000-568a-6ca9-210a-4dfd510c241b	00030000-568a-6ca9-7faa-40efb880d6b2
00020000-568a-6ca9-210a-4dfd510c241b	00030000-568a-6ca9-63ef-6cc959a9cf51
00020000-568a-6ca9-210a-4dfd510c241b	00030000-568a-6ca9-ec2b-c6eed0de6e0e
00020000-568a-6ca9-210a-4dfd510c241b	00030000-568a-6ca9-2be8-d9184dee3a94
00020000-568a-6ca9-210a-4dfd510c241b	00030000-568a-6ca9-40b6-553990906742
00020000-568a-6ca9-210a-4dfd510c241b	00030000-568a-6ca9-3513-23bc5945d945
00020000-568a-6ca9-210a-4dfd510c241b	00030000-568a-6ca9-4832-e4ec63081b24
00020000-568a-6ca9-210a-4dfd510c241b	00030000-568a-6ca9-aa76-04b3e912ea97
00020000-568a-6ca9-210a-4dfd510c241b	00030000-568a-6ca9-7b49-00ece22fed92
00020000-568a-6ca9-210a-4dfd510c241b	00030000-568a-6ca9-1006-159cf293e10b
00020000-568a-6ca9-210a-4dfd510c241b	00030000-568a-6ca9-6e5c-bb01ee3772b4
00020000-568a-6ca9-210a-4dfd510c241b	00030000-568a-6ca9-dd41-b9ee0bace0db
00020000-568a-6ca9-210a-4dfd510c241b	00030000-568a-6ca9-9476-3f073513034f
00020000-568a-6ca9-210a-4dfd510c241b	00030000-568a-6ca9-cd48-0009c6d26389
00020000-568a-6ca9-210a-4dfd510c241b	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6ca9-210a-4dfd510c241b	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6ca9-210a-4dfd510c241b	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6ca9-85f1-dda1d108782c	00030000-568a-6ca9-8fb3-2b54f8eb8c9f
00020000-568a-6ca9-85f1-dda1d108782c	00030000-568a-6ca9-0cdc-368230c3211f
00020000-568a-6ca9-85f1-dda1d108782c	00030000-568a-6ca9-3a2a-97d94b36f9a9
00020000-568a-6ca9-85f1-dda1d108782c	00030000-568a-6ca9-5bdd-2ead82b63d1e
00020000-568a-6ca9-85f1-dda1d108782c	00030000-568a-6ca9-6b5f-225b1daf105b
00020000-568a-6ca9-85f1-dda1d108782c	00030000-568a-6ca9-62e6-27d54157c6ea
00020000-568a-6ca9-85f1-dda1d108782c	00030000-568a-6ca9-92ce-984010ed4a72
00020000-568a-6ca9-85f1-dda1d108782c	00030000-568a-6ca9-3fe1-f9332cf9a475
00020000-568a-6ca9-85f1-dda1d108782c	00030000-568a-6ca9-0539-ff7b87e7ed68
00020000-568a-6ca9-85f1-dda1d108782c	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6ca9-85f1-dda1d108782c	00030000-568a-6ca9-1c68-99523f025a0e
00020000-568a-6ca9-85f1-dda1d108782c	00030000-568a-6ca9-a525-27a181a6661a
00020000-568a-6ca9-85f1-dda1d108782c	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6ca9-85f1-dda1d108782c	00030000-568a-6ca9-0cda-2b3a2b39cd15
00020000-568a-6ca9-85f1-dda1d108782c	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6ca9-85f1-dda1d108782c	00030000-568a-6ca9-9faf-8ce42f77d293
00020000-568a-6ca9-85f1-dda1d108782c	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6ca9-85f1-dda1d108782c	00030000-568a-6ca9-20c2-a97f218feb8a
00020000-568a-6ca9-2ad1-8597bf43aea4	00030000-568a-6ca9-8fb3-2b54f8eb8c9f
00020000-568a-6ca9-2ad1-8597bf43aea4	00030000-568a-6ca9-3a2a-97d94b36f9a9
00020000-568a-6ca9-2ad1-8597bf43aea4	00030000-568a-6ca9-62e6-27d54157c6ea
00020000-568a-6ca9-2ad1-8597bf43aea4	00030000-568a-6ca9-92ce-984010ed4a72
00020000-568a-6ca9-2ad1-8597bf43aea4	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6ca9-2ad1-8597bf43aea4	00030000-568a-6ca9-1c68-99523f025a0e
00020000-568a-6ca9-2ad1-8597bf43aea4	00030000-568a-6ca9-a525-27a181a6661a
00020000-568a-6ca9-2ad1-8597bf43aea4	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6ca9-2ad1-8597bf43aea4	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6ca9-2ad1-8597bf43aea4	00030000-568a-6ca9-9faf-8ce42f77d293
00020000-568a-6ca9-2ad1-8597bf43aea4	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6ca9-13ef-f253a7825181	00030000-568a-6ca9-3a2a-97d94b36f9a9
00020000-568a-6ca9-13ef-f253a7825181	00030000-568a-6ca9-5bdd-2ead82b63d1e
00020000-568a-6ca9-13ef-f253a7825181	00030000-568a-6ca9-92ce-984010ed4a72
00020000-568a-6ca9-13ef-f253a7825181	00030000-568a-6ca9-3fe1-f9332cf9a475
00020000-568a-6ca9-13ef-f253a7825181	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6ca9-13ef-f253a7825181	00030000-568a-6ca9-a525-27a181a6661a
00020000-568a-6ca9-13ef-f253a7825181	00030000-568a-6ca9-8fb3-2b54f8eb8c9f
00020000-568a-6ca9-13ef-f253a7825181	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6ca9-b5a9-7b3f3d62ab63	00030000-568a-6ca9-3a2a-97d94b36f9a9
00020000-568a-6ca9-b5a9-7b3f3d62ab63	00030000-568a-6ca9-5bdd-2ead82b63d1e
00020000-568a-6ca9-b5a9-7b3f3d62ab63	00030000-568a-6ca9-6b5f-225b1daf105b
00020000-568a-6ca9-b5a9-7b3f3d62ab63	00030000-568a-6ca9-92ce-984010ed4a72
00020000-568a-6ca9-b5a9-7b3f3d62ab63	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6ca9-b5a9-7b3f3d62ab63	00030000-568a-6ca9-db4f-b8968788b090
00020000-568a-6ca9-b5a9-7b3f3d62ab63	00030000-568a-6ca9-efc1-b3428814805c
00020000-568a-6ca9-b5a9-7b3f3d62ab63	00030000-568a-6ca9-68c5-2eab86e32594
00020000-568a-6ca9-b5a9-7b3f3d62ab63	00030000-568a-6ca9-d80f-029cbd9e02de
00020000-568a-6ca9-b5a9-7b3f3d62ab63	00030000-568a-6ca9-cdb7-ff988708e662
00020000-568a-6ca9-b5a9-7b3f3d62ab63	00030000-568a-6ca9-1c68-99523f025a0e
00020000-568a-6ca9-b5a9-7b3f3d62ab63	00030000-568a-6ca9-7754-57f35a1c041b
00020000-568a-6ca9-b5a9-7b3f3d62ab63	00030000-568a-6ca9-a8ad-87e821d22659
00020000-568a-6ca9-b5a9-7b3f3d62ab63	00030000-568a-6ca9-a525-27a181a6661a
00020000-568a-6ca9-b5a9-7b3f3d62ab63	00030000-568a-6ca9-a4f0-950bba9a2c99
00020000-568a-6ca9-b5a9-7b3f3d62ab63	00030000-568a-6ca9-8fb3-2b54f8eb8c9f
00020000-568a-6ca9-b5a9-7b3f3d62ab63	00030000-568a-6ca9-77bb-6ec48bc14a04
00020000-568a-6ca9-340b-1353680a0a09	00030000-568a-6ca9-3a2a-97d94b36f9a9
00020000-568a-6ca9-340b-1353680a0a09	00030000-568a-6ca9-92ce-984010ed4a72
00020000-568a-6ca9-340b-1353680a0a09	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6ca9-340b-1353680a0a09	00030000-568a-6ca9-db4f-b8968788b090
00020000-568a-6ca9-340b-1353680a0a09	00030000-568a-6ca9-68c5-2eab86e32594
00020000-568a-6ca9-340b-1353680a0a09	00030000-568a-6ca9-cdb7-ff988708e662
00020000-568a-6ca9-340b-1353680a0a09	00030000-568a-6ca9-1c68-99523f025a0e
00020000-568a-6ca9-340b-1353680a0a09	00030000-568a-6ca9-7754-57f35a1c041b
00020000-568a-6ca9-340b-1353680a0a09	00030000-568a-6ca9-a525-27a181a6661a
00020000-568a-6ca9-340b-1353680a0a09	00030000-568a-6ca9-a4f0-950bba9a2c99
00020000-568a-6ca9-340b-1353680a0a09	00030000-568a-6ca9-8fb3-2b54f8eb8c9f
00020000-568a-6ca9-340b-1353680a0a09	00030000-568a-6ca9-77bb-6ec48bc14a04
00020000-568a-6ca9-741c-e4c7a825f246	00030000-568a-6ca9-7754-57f35a1c041b
00020000-568a-6ca9-741c-e4c7a825f246	00030000-568a-6ca9-8fb3-2b54f8eb8c9f
00020000-568a-6ca9-741c-e4c7a825f246	00030000-568a-6ca9-92ce-984010ed4a72
00020000-568a-6ca9-741c-e4c7a825f246	00030000-568a-6ca9-68c5-2eab86e32594
00020000-568a-6ca9-741c-e4c7a825f246	00030000-568a-6ca9-1c68-99523f025a0e
00020000-568a-6ca9-741c-e4c7a825f246	00030000-568a-6ca9-a525-27a181a6661a
00020000-568a-6ca9-741c-e4c7a825f246	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6ca9-13e2-982ab68132f6	00030000-568a-6ca9-7754-57f35a1c041b
00020000-568a-6ca9-13e2-982ab68132f6	00030000-568a-6ca9-a8ad-87e821d22659
00020000-568a-6ca9-13e2-982ab68132f6	00030000-568a-6ca9-8fb3-2b54f8eb8c9f
00020000-568a-6ca9-13e2-982ab68132f6	00030000-568a-6ca9-cdb7-ff988708e662
00020000-568a-6ca9-6e3b-ee6060e2367e	00030000-568a-6ca9-7754-57f35a1c041b
00020000-568a-6ca9-6e3b-ee6060e2367e	00030000-568a-6ca9-8fb3-2b54f8eb8c9f
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-281a-4f0d9b2cb1a7
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-3a2a-97d94b36f9a9
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-5bdd-2ead82b63d1e
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-6b5f-225b1daf105b
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-2c2a-b9db6f0c0210
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-9e02-3a80ba53677a
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-62e6-27d54157c6ea
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-da1a-609fa5f7d79d
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-0cda-2b3a2b39cd15
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-6e5c-bb01ee3772b4
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-e838-7b88604aa923
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-9476-3f073513034f
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-92ce-984010ed4a72
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-3fe1-f9332cf9a475
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-0539-ff7b87e7ed68
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-cd48-0009c6d26389
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-f0c8-79ea74ac6c37
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-0bcc-29ffca163542
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-7c5d-f3e4b184e503
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-3613-8b19582e7102
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-db4f-b8968788b090
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-efc1-b3428814805c
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-68c5-2eab86e32594
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-d80f-029cbd9e02de
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-cdb7-ff988708e662
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-8660-83a8354ba7ba
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-dd41-b9ee0bace0db
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-97ef-5cdcc5056ac0
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-d452-c08d13156a2a
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-1006-159cf293e10b
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-a592-19ce318745e5
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-1c68-99523f025a0e
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-f721-73b681afeb71
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-745c-5ca138a29768
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-0ba9-f45b8d8743b4
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-d3b9-4a168d44e264
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-7faa-40efb880d6b2
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-d399-6eddc49dfb04
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-63ef-6cc959a9cf51
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-0234-7741f13387d6
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-ec2b-c6eed0de6e0e
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-d804-0257252b8979
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-2be8-d9184dee3a94
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-03d3-6f976940b8a5
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-40b6-553990906742
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-ac8e-4cf486f17223
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-3513-23bc5945d945
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-5fc2-0f9d0dfec593
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-4832-e4ec63081b24
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-aa24-0d95bc1e7e7b
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-aa76-04b3e912ea97
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-4b40-3a3b522efd69
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-7b49-00ece22fed92
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-b4f9-de3f51af8cd6
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-9409-8ee80db71de4
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-7754-57f35a1c041b
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-a8ad-87e821d22659
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-70e0-c075b7d8c0a5
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-a525-27a181a6661a
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-ea0b-014c385899e9
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-ddcc-36d325361422
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-a4f0-950bba9a2c99
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-8fb3-2b54f8eb8c9f
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-0cdc-368230c3211f
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-3a59-013c7ab1e7c5
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-20c2-a97f218feb8a
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-9faf-8ce42f77d293
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-77bb-6ec48bc14a04
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-5616-c29294bb5292
00020000-568a-6ca9-eacc-f3c9d162de06	00030000-568a-6ca9-37d3-2ac3dde65fa1
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-281a-4f0d9b2cb1a7
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-3a2a-97d94b36f9a9
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-2c2a-b9db6f0c0210
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-9e02-3a80ba53677a
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-62e6-27d54157c6ea
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-da1a-609fa5f7d79d
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-0cda-2b3a2b39cd15
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-9476-3f073513034f
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-92ce-984010ed4a72
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-0bcc-29ffca163542
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-7c5d-f3e4b184e503
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-3613-8b19582e7102
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-db4f-b8968788b090
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-cdb7-ff988708e662
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-8660-83a8354ba7ba
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-d452-c08d13156a2a
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-1c68-99523f025a0e
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-9409-8ee80db71de4
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-70e0-c075b7d8c0a5
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-a525-27a181a6661a
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-ea0b-014c385899e9
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-ddcc-36d325361422
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-a4f0-950bba9a2c99
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-8fb3-2b54f8eb8c9f
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-3a59-013c7ab1e7c5
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-20c2-a97f218feb8a
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-9faf-8ce42f77d293
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-77bb-6ec48bc14a04
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-5616-c29294bb5292
00020000-568a-6ca9-8401-5f3abb8a5191	00030000-568a-6ca9-37d3-2ac3dde65fa1
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-281a-4f0d9b2cb1a7
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-3a2a-97d94b36f9a9
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-5bdd-2ead82b63d1e
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-6b5f-225b1daf105b
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-2c2a-b9db6f0c0210
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-9e02-3a80ba53677a
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-62e6-27d54157c6ea
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-da1a-609fa5f7d79d
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-0cda-2b3a2b39cd15
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-9476-3f073513034f
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-92ce-984010ed4a72
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-3fe1-f9332cf9a475
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-0539-ff7b87e7ed68
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-0bcc-29ffca163542
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-7c5d-f3e4b184e503
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-3613-8b19582e7102
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-db4f-b8968788b090
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-cdb7-ff988708e662
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-8660-83a8354ba7ba
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-d452-c08d13156a2a
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-1c68-99523f025a0e
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-9409-8ee80db71de4
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-70e0-c075b7d8c0a5
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-a525-27a181a6661a
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-ea0b-014c385899e9
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-ddcc-36d325361422
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-a4f0-950bba9a2c99
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-8fb3-2b54f8eb8c9f
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-0cdc-368230c3211f
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-3a59-013c7ab1e7c5
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-20c2-a97f218feb8a
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-9faf-8ce42f77d293
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-77bb-6ec48bc14a04
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-5616-c29294bb5292
00020000-568a-6ca9-8d33-b171d0930131	00030000-568a-6ca9-37d3-2ac3dde65fa1
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-3a2a-97d94b36f9a9
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-5bdd-2ead82b63d1e
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-6b5f-225b1daf105b
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-2c2a-b9db6f0c0210
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-9e02-3a80ba53677a
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-62e6-27d54157c6ea
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-da1a-609fa5f7d79d
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-0cda-2b3a2b39cd15
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-6e5c-bb01ee3772b4
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-e838-7b88604aa923
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-9476-3f073513034f
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-92ce-984010ed4a72
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-3fe1-f9332cf9a475
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-0539-ff7b87e7ed68
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-cd48-0009c6d26389
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-f0c8-79ea74ac6c37
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-0bcc-29ffca163542
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-8348-6aebae1faa48
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-7c5d-f3e4b184e503
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-3613-8b19582e7102
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-db4f-b8968788b090
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-efc1-b3428814805c
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-68c5-2eab86e32594
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-d80f-029cbd9e02de
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-cdb7-ff988708e662
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-08d8-07bfa9202219
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-8660-83a8354ba7ba
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-dd41-b9ee0bace0db
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-97ef-5cdcc5056ac0
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-d452-c08d13156a2a
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-fd6f-431613d76f7e
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-1006-159cf293e10b
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-a592-19ce318745e5
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-1c68-99523f025a0e
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-b233-848ecaf0a8d2
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-f721-73b681afeb71
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-745c-5ca138a29768
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-0ba9-f45b8d8743b4
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-d3b9-4a168d44e264
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-7faa-40efb880d6b2
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-d399-6eddc49dfb04
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-63ef-6cc959a9cf51
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-0234-7741f13387d6
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-ec2b-c6eed0de6e0e
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-d804-0257252b8979
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-2be8-d9184dee3a94
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-03d3-6f976940b8a5
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-40b6-553990906742
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-ac8e-4cf486f17223
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-3513-23bc5945d945
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-5fc2-0f9d0dfec593
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-4832-e4ec63081b24
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-aa24-0d95bc1e7e7b
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-aa76-04b3e912ea97
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-4b40-3a3b522efd69
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-7b49-00ece22fed92
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-b4f9-de3f51af8cd6
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-9409-8ee80db71de4
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-7754-57f35a1c041b
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-a8ad-87e821d22659
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-70e0-c075b7d8c0a5
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-ad60-9bad81b7bd10
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-a525-27a181a6661a
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-ea0b-014c385899e9
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-a4f0-950bba9a2c99
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-2b87-2aa7a3952339
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-8fb3-2b54f8eb8c9f
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-0cdc-368230c3211f
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-3a59-013c7ab1e7c5
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-20c2-a97f218feb8a
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-9faf-8ce42f77d293
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-77bb-6ec48bc14a04
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-c351-17a2dd9069be
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-5616-c29294bb5292
00020000-568a-6caa-d217-24a951d08557	00030000-568a-6ca9-37d3-2ac3dde65fa1
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-281a-4f0d9b2cb1a7
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-3a2a-97d94b36f9a9
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-5bdd-2ead82b63d1e
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-6b5f-225b1daf105b
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-2c2a-b9db6f0c0210
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-9e02-3a80ba53677a
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-62e6-27d54157c6ea
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-da1a-609fa5f7d79d
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-0cda-2b3a2b39cd15
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-9476-3f073513034f
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-92ce-984010ed4a72
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-3fe1-f9332cf9a475
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-0539-ff7b87e7ed68
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-0bcc-29ffca163542
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-8348-6aebae1faa48
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-7c5d-f3e4b184e503
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-3613-8b19582e7102
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-db4f-b8968788b090
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-efc1-b3428814805c
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-68c5-2eab86e32594
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-cdb7-ff988708e662
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-08d8-07bfa9202219
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-8660-83a8354ba7ba
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-d452-c08d13156a2a
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-fd6f-431613d76f7e
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-1c68-99523f025a0e
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-b233-848ecaf0a8d2
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-9409-8ee80db71de4
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-7754-57f35a1c041b
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-70e0-c075b7d8c0a5
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-ad60-9bad81b7bd10
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-a525-27a181a6661a
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-ea0b-014c385899e9
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-ddcc-36d325361422
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-a4f0-950bba9a2c99
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-2b87-2aa7a3952339
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-8fb3-2b54f8eb8c9f
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-0cdc-368230c3211f
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-3a59-013c7ab1e7c5
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-20c2-a97f218feb8a
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-9faf-8ce42f77d293
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-77bb-6ec48bc14a04
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-c351-17a2dd9069be
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-5616-c29294bb5292
00020000-568a-6caa-1c8b-058b3f45ebbe	00030000-568a-6ca9-37d3-2ac3dde65fa1
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-281a-4f0d9b2cb1a7
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-3a2a-97d94b36f9a9
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-5bdd-2ead82b63d1e
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-2c2a-b9db6f0c0210
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-62e6-27d54157c6ea
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-9476-3f073513034f
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-92ce-984010ed4a72
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-3fe1-f9332cf9a475
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-0bcc-29ffca163542
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-7c5d-f3e4b184e503
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-db4f-b8968788b090
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-68c5-2eab86e32594
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-cdb7-ff988708e662
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-8660-83a8354ba7ba
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-d452-c08d13156a2a
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-1c68-99523f025a0e
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-9409-8ee80db71de4
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-7754-57f35a1c041b
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-70e0-c075b7d8c0a5
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-a525-27a181a6661a
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-ea0b-014c385899e9
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-ddcc-36d325361422
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-a4f0-950bba9a2c99
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-8fb3-2b54f8eb8c9f
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-3a59-013c7ab1e7c5
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-77bb-6ec48bc14a04
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-5616-c29294bb5292
00020000-568a-6caa-9b58-0afef72c072c	00030000-568a-6ca9-37d3-2ac3dde65fa1
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-281a-4f0d9b2cb1a7
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-3a2a-97d94b36f9a9
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-5bdd-2ead82b63d1e
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-6b5f-225b1daf105b
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-62e6-27d54157c6ea
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-0cda-2b3a2b39cd15
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-6e5c-bb01ee3772b4
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-e838-7b88604aa923
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-9476-3f073513034f
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-92ce-984010ed4a72
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-cd48-0009c6d26389
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-f0c8-79ea74ac6c37
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-0bcc-29ffca163542
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-8348-6aebae1faa48
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-7c5d-f3e4b184e503
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-4967-bc4e24005f5f
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-3613-8b19582e7102
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-db4f-b8968788b090
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-efc1-b3428814805c
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-68c5-2eab86e32594
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-d80f-029cbd9e02de
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-cdb7-ff988708e662
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-08d8-07bfa9202219
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-8660-83a8354ba7ba
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-dd41-b9ee0bace0db
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-97ef-5cdcc5056ac0
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-d452-c08d13156a2a
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-fd6f-431613d76f7e
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-1006-159cf293e10b
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-a592-19ce318745e5
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-1c68-99523f025a0e
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-b233-848ecaf0a8d2
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-f721-73b681afeb71
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-745c-5ca138a29768
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-0ba9-f45b8d8743b4
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-d3b9-4a168d44e264
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-7faa-40efb880d6b2
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-d399-6eddc49dfb04
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-63ef-6cc959a9cf51
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-0234-7741f13387d6
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-ec2b-c6eed0de6e0e
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-d804-0257252b8979
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-2be8-d9184dee3a94
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-03d3-6f976940b8a5
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-40b6-553990906742
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-ac8e-4cf486f17223
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-3513-23bc5945d945
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-5fc2-0f9d0dfec593
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-4832-e4ec63081b24
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-aa24-0d95bc1e7e7b
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-aa76-04b3e912ea97
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-4b40-3a3b522efd69
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-7b49-00ece22fed92
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-b4f9-de3f51af8cd6
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-9409-8ee80db71de4
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-7754-57f35a1c041b
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-a8ad-87e821d22659
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-70e0-c075b7d8c0a5
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-ad60-9bad81b7bd10
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-a525-27a181a6661a
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-ea0b-014c385899e9
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-ddcc-36d325361422
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-a4f0-950bba9a2c99
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-2b87-2aa7a3952339
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-8fb3-2b54f8eb8c9f
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-3a59-013c7ab1e7c5
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-64d4-4c41dcaeb57a
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-20c2-a97f218feb8a
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-9faf-8ce42f77d293
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-77bb-6ec48bc14a04
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-c351-17a2dd9069be
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-5616-c29294bb5292
00020000-568a-6caa-9843-be3801b78a80	00030000-568a-6ca9-37d3-2ac3dde65fa1
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-a534-50776fc074a0
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-3610-1bf151a278b9
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-281a-4f0d9b2cb1a7
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-6739-c723e96af877
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-3a2a-97d94b36f9a9
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-6b5f-225b1daf105b
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-5bdd-2ead82b63d1e
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-4304-9791303c45a5
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-4e23-d46cbda24ee6
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-9fda-fec84d0f13e6
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-0f72-034552fb4875
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-2c2a-b9db6f0c0210
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-9e02-3a80ba53677a
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-62e6-27d54157c6ea
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-da1a-609fa5f7d79d
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-0cda-2b3a2b39cd15
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-82d1-94cb6fe0915c
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-b895-3980a9d629d7
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-4672-2a5270f49365
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-46aa-f9ff90b9b0df
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-6b0e-dd8610c792d5
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-c982-bbb822cd5fa4
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-9341-3c28e45ecdff
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-0764-50240a43717f
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-c51c-d4a8e1ae01e9
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-6e5c-bb01ee3772b4
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-e838-7b88604aa923
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-9476-3f073513034f
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-1d7e-560ec0a274f9
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-8c23-03810c192d63
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-0660-551ec2070360
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-92ce-984010ed4a72
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-0539-ff7b87e7ed68
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-3fe1-f9332cf9a475
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-85c6-ffc16ecd4965
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-e514-cabc664ed46b
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-ff2b-9482ef7ec0fd
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-cd48-0009c6d26389
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-f0c8-79ea74ac6c37
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-0bcc-29ffca163542
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-8348-6aebae1faa48
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-e4f9-1eeedbe80d05
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-c026-4a97de8f4eca
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-1fc2-e672eca44516
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-2877-e80ec573844c
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-4823-f705ed903f64
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-d7ee-8cb6a53cd1df
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-39fd-5e37a86088d6
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-31f7-8e3458b2ca81
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-8b0a-9be442c44ebd
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-7e31-5bbc47bbdfa8
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-94d8-68834a239b8c
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-e42d-f8286aeeebac
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-1686-d00febb36b7a
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-eedc-22d57595b559
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-7c5d-f3e4b184e503
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-4967-bc4e24005f5f
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-3613-8b19582e7102
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-db4f-b8968788b090
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-efc1-b3428814805c
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-cfff-eb4c464913a2
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-9a47-b77d2c6a0ecc
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-826d-272e32d8d986
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-b21a-03e1ea339f8e
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-68c5-2eab86e32594
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-d80f-029cbd9e02de
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-cdb7-ff988708e662
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-08d8-07bfa9202219
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-8660-83a8354ba7ba
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-dd41-b9ee0bace0db
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-97ef-5cdcc5056ac0
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-ed1c-76ae96d70d9e
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-43aa-27f5e6e50646
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-00f4-2737e022e4a8
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-d452-c08d13156a2a
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-fd6f-431613d76f7e
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-bb68-385a09cf8e9a
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-fc45-e0c91832e3aa
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-31a7-ac6a9352652e
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-68ee-eac32e7d1d3c
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-de0e-4d10a46b4510
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-1f44-9353554b2c47
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-1006-159cf293e10b
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-a592-19ce318745e5
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-1c68-99523f025a0e
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-b233-848ecaf0a8d2
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-f721-73b681afeb71
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-745c-5ca138a29768
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-0ba9-f45b8d8743b4
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-d3b9-4a168d44e264
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-7faa-40efb880d6b2
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-d399-6eddc49dfb04
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-63ef-6cc959a9cf51
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-0234-7741f13387d6
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-ec2b-c6eed0de6e0e
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-d804-0257252b8979
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-2be8-d9184dee3a94
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-03d3-6f976940b8a5
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-40b6-553990906742
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-ac8e-4cf486f17223
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-3513-23bc5945d945
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-5fc2-0f9d0dfec593
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-4832-e4ec63081b24
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-aa24-0d95bc1e7e7b
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-aa76-04b3e912ea97
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-4b40-3a3b522efd69
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-7b49-00ece22fed92
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-b4f9-de3f51af8cd6
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-9409-8ee80db71de4
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-004f-dae18dd38770
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-77dd-1356eea7bec2
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-9a06-cd20213d6f39
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-21e9-bb8c10fca1ad
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-bead-e1a6021b94fb
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-91e8-b735ecffc1bf
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-ae14-2349f832686b
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-cd67-40ff256b1914
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-eb29-61523388cf83
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-517e-7864bbf0a39d
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-ec16-d649127e5c65
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-f6aa-eace8fc91266
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-9ddb-1e97d0a723bc
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-e1ce-ad9c41fe9588
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-2af6-43132d2d2de8
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-2833-6aeac86853f2
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-f550-ec66bccba750
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-5e5f-76d6789d4c74
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-61db-ef2e37506425
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-c0e1-fe6f4efed174
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-937d-249594c9e5eb
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-49a5-87e8e0618568
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-7754-57f35a1c041b
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-a8ad-87e821d22659
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-70e0-c075b7d8c0a5
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-ad60-9bad81b7bd10
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-06d7-57125a8f6058
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-42b4-8f024dcfb639
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-72bc-95bf97786ff2
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-a525-27a181a6661a
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-27de-4ed7165bfa25
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-ea0b-014c385899e9
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-87b9-79f0668461b1
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-34d4-1dff7f5b92df
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-f768-593318c2e7a7
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-ddcc-36d325361422
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-57ed-637186396421
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-a4f0-950bba9a2c99
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-2b87-2aa7a3952339
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-8fb3-2b54f8eb8c9f
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-0cdc-368230c3211f
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-4514-619ef5762bdf
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-94ed-bc20b82e353a
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-e648-b4f796bd3800
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-c3ee-91a0f61cd3eb
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-3a59-013c7ab1e7c5
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-64d4-4c41dcaeb57a
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-193e-b588fb317cf8
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-f3bf-047037625d95
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-20c2-a97f218feb8a
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-9faf-8ce42f77d293
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-77bb-6ec48bc14a04
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-c351-17a2dd9069be
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-c973-6bbcd336139c
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-0e08-2848833cc107
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-5616-c29294bb5292
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-5b08-33943f63b28c
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-37d3-2ac3dde65fa1
00020000-568a-6cac-92b2-4f1b3c1b8272	00030000-568a-6ca9-211f-7e318fb49aac
00020000-568a-6cac-fde8-25e7b0efe70a	00030000-568a-6ca9-f8aa-ed54a2145694
00020000-568a-6cac-d8f1-99f2ecb95b64	00030000-568a-6ca9-20c2-a97f218feb8a
00020000-568a-6cac-ac98-8c3d472ff8fd	00030000-568a-6ca9-0cdc-368230c3211f
00020000-568a-6cac-f551-aba32d277baa	00030000-568a-6ca9-8fb3-2b54f8eb8c9f
00020000-568a-6cac-e7f9-e5750942afc1	00030000-568a-6ca9-d7ee-8cb6a53cd1df
00020000-568a-6cac-980c-90caa0c0d87c	00030000-568a-6ca9-39fd-5e37a86088d6
00020000-568a-6cac-b032-9efcdd5170ed	00030000-568a-6ca9-31f7-8e3458b2ca81
00020000-568a-6cac-cd6a-93a0c9f8a48a	00030000-568a-6ca9-4823-f705ed903f64
00020000-568a-6cac-c1e2-96808160fede	00030000-568a-6ca9-1fc2-e672eca44516
00020000-568a-6cac-2775-7522d422f87f	00030000-568a-6ca9-2877-e80ec573844c
00020000-568a-6cac-df66-ecb03516c66b	00030000-568a-6ca9-9b72-9db582de36cb
00020000-568a-6cac-65dc-00a78c06d125	00030000-568a-6ca9-9faf-8ce42f77d293
00020000-568a-6cac-0084-94a97c9dcf81	00030000-568a-6ca9-020a-68e004899c5b
00020000-568a-6cac-8d6a-6caf6b890d96	00030000-568a-6ca9-3613-8b19582e7102
00020000-568a-6cac-155a-3cf8b5c5edd2	00030000-568a-6ca9-efc1-b3428814805c
00020000-568a-6cac-7fc5-44cdfbdad548	00030000-568a-6ca9-db4f-b8968788b090
00020000-568a-6cac-2a11-99517ecbd841	00030000-568a-6ca9-0cda-2b3a2b39cd15
00020000-568a-6cac-8f19-24702882b614	00030000-568a-6ca9-def5-438c4cacf038
00020000-568a-6cac-94dc-0215836c3f6b	00030000-568a-6ca9-cdb7-ff988708e662
00020000-568a-6cac-94dc-0215836c3f6b	00030000-568a-6ca9-08d8-07bfa9202219
00020000-568a-6cac-94dc-0215836c3f6b	00030000-568a-6ca9-8fb3-2b54f8eb8c9f
00020000-568a-6cac-d44c-9e0baa88c11f	00030000-568a-6ca9-a4f0-950bba9a2c99
00020000-568a-6cac-8753-b0c39764b440	00030000-568a-6ca9-2b87-2aa7a3952339
00020000-568a-6cac-f50f-be32214149af	00030000-568a-6ca9-49a5-87e8e0618568
00020000-568a-6cac-f5f5-8b11c0d0aed5	00030000-568a-6ca9-70e0-c075b7d8c0a5
00020000-568a-6cac-395a-3dbc3406bcc2	00030000-568a-6ca9-ad60-9bad81b7bd10
00020000-568a-6cac-6b3f-0402bc00fc4b	00030000-568a-6ca9-d452-c08d13156a2a
00020000-568a-6cac-34c8-88e58fe29b99	00030000-568a-6ca9-fd6f-431613d76f7e
00020000-568a-6cac-4490-820e4caac2f8	00030000-568a-6ca9-77bb-6ec48bc14a04
00020000-568a-6cac-21da-734d44a4d9e2	00030000-568a-6ca9-c351-17a2dd9069be
00020000-568a-6cac-9ca3-4f53a02ea27c	00030000-568a-6ca9-68c5-2eab86e32594
00020000-568a-6cac-7667-9d0973f2e5ce	00030000-568a-6ca9-d80f-029cbd9e02de
00020000-568a-6cac-d8d5-bb323056bf7f	00030000-568a-6ca9-7754-57f35a1c041b
00020000-568a-6cac-1fe3-b846450ff42c	00030000-568a-6ca9-a8ad-87e821d22659
00020000-568a-6cac-d171-2be34a12ab52	00030000-568a-6ca9-3a2a-97d94b36f9a9
00020000-568a-6cac-e804-3d8ae9f19913	00030000-568a-6ca9-5bdd-2ead82b63d1e
00020000-568a-6cac-a81a-40ce980bf105	00030000-568a-6ca9-6b5f-225b1daf105b
00020000-568a-6cac-a211-6c324cb58b2d	00030000-568a-6ca9-92ce-984010ed4a72
00020000-568a-6cac-ef1b-32067ecb834e	00030000-568a-6ca9-3fe1-f9332cf9a475
00020000-568a-6cac-f148-3ee4f64ec7cc	00030000-568a-6ca9-0539-ff7b87e7ed68
\.


--
-- TOC entry 3150 (class 0 OID 34210167)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 34210201)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 34210335)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-568a-6cac-0647-d9ad8e28d10d	00090000-568a-6cac-58bd-d1523363b4b2	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-568a-6cac-f087-f5d8d8e5a2e2	00090000-568a-6cac-d39c-e77231f7ce8c	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-568a-6cac-e558-b2474fba864e	00090000-568a-6cac-a8af-fe8cca951969	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-568a-6cac-9f56-fdeef38809b3	00090000-568a-6cac-301a-48c52c29812b	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3121 (class 0 OID 34209859)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-568a-6cac-9d23-54c27288c9bf	\N	00040000-568a-6ca9-b744-d9662286ab3d	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568a-6cac-f094-888a3eb6686c	\N	00040000-568a-6ca9-b744-d9662286ab3d	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-568a-6cac-da9a-055be1404443	\N	00040000-568a-6ca9-b744-d9662286ab3d	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568a-6cac-b6ec-c28e1978d7a5	\N	00040000-568a-6ca9-b744-d9662286ab3d	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568a-6cac-1d18-01863d15cb76	\N	00040000-568a-6ca9-b744-d9662286ab3d	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568a-6cac-8b1e-251773f2837b	\N	00040000-568a-6ca9-13ec-5fbca2cbfa3d	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568a-6cac-e744-52d04a5fa401	\N	00040000-568a-6ca9-1e94-133b90496566	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568a-6cac-717f-49c455cf4674	\N	00040000-568a-6ca9-9411-808e113e0d8c	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568a-6cac-c924-fa643ee013be	\N	00040000-568a-6ca9-3bbf-6c064655ca08	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568a-6cae-aff4-bb3ab5fec1c2	\N	00040000-568a-6ca9-b744-d9662286ab3d	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3124 (class 0 OID 34209904)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-568a-6ca8-ee7a-c011503dcb03	8341	Adlešiči
00050000-568a-6ca8-d24f-cdc1670fcb01	5270	Ajdovščina
00050000-568a-6ca8-5b65-b8118974deff	6280	Ankaran/Ancarano
00050000-568a-6ca8-3ef7-05836ea5c957	9253	Apače
00050000-568a-6ca8-41fe-a8c7503f9923	8253	Artiče
00050000-568a-6ca8-497a-1bae4291376c	4275	Begunje na Gorenjskem
00050000-568a-6ca8-87ca-9eb2dba788eb	1382	Begunje pri Cerknici
00050000-568a-6ca8-817d-992416a4e734	9231	Beltinci
00050000-568a-6ca8-b0b2-30ee7f8b521a	2234	Benedikt
00050000-568a-6ca8-f359-12a7e5f58f2e	2345	Bistrica ob Dravi
00050000-568a-6ca8-e5a3-98c24d5c9038	3256	Bistrica ob Sotli
00050000-568a-6ca8-bf4b-d10a57e03a2f	8259	Bizeljsko
00050000-568a-6ca8-88c8-3a0f36cbdee2	1223	Blagovica
00050000-568a-6ca8-631e-fd8d18d46460	8283	Blanca
00050000-568a-6ca8-baaf-1f7b35d315f8	4260	Bled
00050000-568a-6ca8-0641-53eaaf0f34d5	4273	Blejska Dobrava
00050000-568a-6ca8-f792-7a6bd5613f8d	9265	Bodonci
00050000-568a-6ca8-37bb-f1aae6205e33	9222	Bogojina
00050000-568a-6ca8-cf00-c6e411fad757	4263	Bohinjska Bela
00050000-568a-6ca8-569a-23f68c7ed3af	4264	Bohinjska Bistrica
00050000-568a-6ca8-accb-05af8c9cf122	4265	Bohinjsko jezero
00050000-568a-6ca8-01f2-8ebea3a07eb5	1353	Borovnica
00050000-568a-6ca8-bfc8-0579cbb2603c	8294	Boštanj
00050000-568a-6ca8-5a59-251c0ec8707a	5230	Bovec
00050000-568a-6ca8-3ef6-c2c0f527ce11	5295	Branik
00050000-568a-6ca8-d742-2fe4442380d8	3314	Braslovče
00050000-568a-6ca8-9f5c-8cf354aaae18	5223	Breginj
00050000-568a-6ca8-dca9-c986c5a9a353	8280	Brestanica
00050000-568a-6ca8-8bf4-5571950bc744	2354	Bresternica
00050000-568a-6ca8-cd1b-140cadb69efc	4243	Brezje
00050000-568a-6ca8-af80-b088bc3bddf3	1351	Brezovica pri Ljubljani
00050000-568a-6ca8-90a8-56efdbb3c66b	8250	Brežice
00050000-568a-6ca8-e5bc-0eee9580b2c3	4210	Brnik - Aerodrom
00050000-568a-6ca8-d6ac-5ec77feca109	8321	Brusnice
00050000-568a-6ca8-f42f-673627ffc3df	3255	Buče
00050000-568a-6ca8-2a98-3a6a53a79a8d	8276	Bučka 
00050000-568a-6ca8-1140-50f606ca613e	9261	Cankova
00050000-568a-6ca8-c5f5-c41ccf09a688	3000	Celje 
00050000-568a-6ca8-10ec-2f01987cd36d	3001	Celje - poštni predali
00050000-568a-6ca8-9ac9-984f805bc8ed	4207	Cerklje na Gorenjskem
00050000-568a-6ca8-9487-22088e71a463	8263	Cerklje ob Krki
00050000-568a-6ca8-6832-c39f9580418e	1380	Cerknica
00050000-568a-6ca8-72c5-59972abb4f04	5282	Cerkno
00050000-568a-6ca8-1486-05b9849ee302	2236	Cerkvenjak
00050000-568a-6ca8-7c6d-3c0c8c9ec7fa	2215	Ceršak
00050000-568a-6ca8-834c-4b14f46656eb	2326	Cirkovce
00050000-568a-6ca8-7ecf-e12c99550a7a	2282	Cirkulane
00050000-568a-6ca8-4797-16980635dd22	5273	Col
00050000-568a-6ca8-9adc-5a91a4fbdcdc	8251	Čatež ob Savi
00050000-568a-6ca8-ac1d-3f949dcede8a	1413	Čemšenik
00050000-568a-6ca8-1136-c2fa18fc5dd9	5253	Čepovan
00050000-568a-6ca8-6e72-ebe8b866c656	9232	Črenšovci
00050000-568a-6ca8-1663-bcd39e47d71a	2393	Črna na Koroškem
00050000-568a-6ca8-6291-5854784a8345	6275	Črni Kal
00050000-568a-6ca8-9362-ca8601fcd582	5274	Črni Vrh nad Idrijo
00050000-568a-6ca8-be44-d0d407271853	5262	Črniče
00050000-568a-6ca8-fb9a-071edcf522e0	8340	Črnomelj
00050000-568a-6ca8-6071-4226487163be	6271	Dekani
00050000-568a-6ca8-9cbf-41774abab8df	5210	Deskle
00050000-568a-6ca8-015e-daae082cab77	2253	Destrnik
00050000-568a-6ca8-ab52-053c969c2562	6215	Divača
00050000-568a-6ca8-0b4b-9f934b0b267a	1233	Dob
00050000-568a-6ca8-9747-938d18541b36	3224	Dobje pri Planini
00050000-568a-6ca8-c737-dfc106aa70ae	8257	Dobova
00050000-568a-6ca8-7380-ff43678529e1	1423	Dobovec
00050000-568a-6ca8-e1a0-94caab6e6a41	5263	Dobravlje
00050000-568a-6ca8-1c2c-0ba98fc7ea40	3204	Dobrna
00050000-568a-6ca8-450a-c37a3044b8aa	8211	Dobrnič
00050000-568a-6ca8-f4bc-ee6621194268	1356	Dobrova
00050000-568a-6ca8-146c-fbd6231a9f2d	9223	Dobrovnik/Dobronak 
00050000-568a-6ca8-b731-c45602bc5ce0	5212	Dobrovo v Brdih
00050000-568a-6ca8-83b7-b5c4c6301a91	1431	Dol pri Hrastniku
00050000-568a-6ca8-2287-6e4c84568633	1262	Dol pri Ljubljani
00050000-568a-6ca8-0ec3-57e239ed892c	1273	Dole pri Litiji
00050000-568a-6ca8-925e-4d5a510e0532	1331	Dolenja vas
00050000-568a-6ca8-78ef-9cfa27c3295f	8350	Dolenjske Toplice
00050000-568a-6ca8-227b-bb398667dc52	1230	Domžale
00050000-568a-6ca8-5f70-0772b3bbb304	2252	Dornava
00050000-568a-6ca8-bcbd-15bb37d4445e	5294	Dornberk
00050000-568a-6ca8-2366-fb9d7059f780	1319	Draga
00050000-568a-6ca8-c824-e9b6f997cc40	8343	Dragatuš
00050000-568a-6ca8-3c21-45b302b9e6b7	3222	Dramlje
00050000-568a-6ca8-aa7d-89d42e26c2e5	2370	Dravograd
00050000-568a-6ca8-90da-f03ace9d576c	4203	Duplje
00050000-568a-6ca8-0306-1e11806a0782	6221	Dutovlje
00050000-568a-6ca8-3651-db3afc9a68e0	8361	Dvor
00050000-568a-6ca8-9cb6-84ea9a1f12db	2343	Fala
00050000-568a-6ca8-5d99-4f885d51d1d1	9208	Fokovci
00050000-568a-6ca8-10fc-5721e4e6deb8	2313	Fram
00050000-568a-6ca8-1e5b-69abc3eb7fd6	3213	Frankolovo
00050000-568a-6ca8-2f5b-0698f94f1778	1274	Gabrovka
00050000-568a-6ca8-97cd-ccff1c4eec76	8254	Globoko
00050000-568a-6ca8-a8ba-89fdf71a5d54	5275	Godovič
00050000-568a-6ca8-a986-b7ac3ca3a5c7	4204	Golnik
00050000-568a-6ca8-8a26-fba93b176a73	3303	Gomilsko
00050000-568a-6ca8-1312-ff8564dcdae1	4224	Gorenja vas
00050000-568a-6ca8-1cb1-d2ed11de13ba	3263	Gorica pri Slivnici
00050000-568a-6ca8-721e-39ec9453f151	2272	Gorišnica
00050000-568a-6ca8-002b-6ec272d64ae7	9250	Gornja Radgona
00050000-568a-6ca8-de51-59d07efeeafa	3342	Gornji Grad
00050000-568a-6ca8-c82f-c8f2432bbcc8	4282	Gozd Martuljek
00050000-568a-6ca8-308c-4be0832dc273	6272	Gračišče
00050000-568a-6ca8-a64f-33dcac8c4032	9264	Grad
00050000-568a-6ca8-7a23-c84a15df3c6f	8332	Gradac
00050000-568a-6ca8-0329-99e89fd88449	1384	Grahovo
00050000-568a-6ca8-d192-e31667c2a217	5242	Grahovo ob Bači
00050000-568a-6ca8-1879-0a804f69104d	5251	Grgar
00050000-568a-6ca8-495e-21727546b0fe	3302	Griže
00050000-568a-6ca8-aca3-f5ac6f793fc9	3231	Grobelno
00050000-568a-6ca8-8abd-b1e576fdd86a	1290	Grosuplje
00050000-568a-6ca8-10a6-b5deb7d33c32	2288	Hajdina
00050000-568a-6ca8-3874-09c4bf470ed2	8362	Hinje
00050000-568a-6ca8-f426-f1885d5e0072	2311	Hoče
00050000-568a-6ca8-a87a-476a80da9fa8	9205	Hodoš/Hodos
00050000-568a-6ca8-14a0-2b58bbf2b174	1354	Horjul
00050000-568a-6ca8-6f62-71a163a0d118	1372	Hotedršica
00050000-568a-6ca8-2ce7-59e42d3de8ef	1430	Hrastnik
00050000-568a-6ca8-5a27-724846280643	6225	Hruševje
00050000-568a-6ca8-03f6-3f12c76c4121	4276	Hrušica
00050000-568a-6ca8-097c-9622cbf08ad2	5280	Idrija
00050000-568a-6ca8-a767-0684e8a84ff6	1292	Ig
00050000-568a-6ca8-f4a7-ff7de822274d	6250	Ilirska Bistrica
00050000-568a-6ca8-d03a-5c1f19aec8bd	6251	Ilirska Bistrica-Trnovo
00050000-568a-6ca8-e9b5-6057a61f1d85	1295	Ivančna Gorica
00050000-568a-6ca8-5ea7-d18e71a234f7	2259	Ivanjkovci
00050000-568a-6ca8-0cea-024296a29add	1411	Izlake
00050000-568a-6ca8-1f4f-e8be3a1d3e61	6310	Izola/Isola
00050000-568a-6ca8-ecb7-8d63b5eb20f4	2222	Jakobski Dol
00050000-568a-6ca8-bd9d-c01d327c1be4	2221	Jarenina
00050000-568a-6ca8-7aaa-abfcef892ec3	6254	Jelšane
00050000-568a-6ca8-ac69-22c90d13018b	4270	Jesenice
00050000-568a-6ca8-d69b-e48d2246e625	8261	Jesenice na Dolenjskem
00050000-568a-6ca8-f295-a7a8713076e3	3273	Jurklošter
00050000-568a-6ca8-1780-8777fe4cd78e	2223	Jurovski Dol
00050000-568a-6ca8-aad8-948af2243afb	2256	Juršinci
00050000-568a-6ca8-efe3-565d4a2adcf9	5214	Kal nad Kanalom
00050000-568a-6ca8-6570-11937521615e	3233	Kalobje
00050000-568a-6ca8-7048-8dbcf83c6e91	4246	Kamna Gorica
00050000-568a-6ca8-09df-a374a430362f	2351	Kamnica
00050000-568a-6ca8-11e6-9597ed9b3860	1241	Kamnik
00050000-568a-6ca8-b82e-33d6573e5861	5213	Kanal
00050000-568a-6ca8-1668-f28baeb54859	8258	Kapele
00050000-568a-6ca8-73ae-d2c479c7fbfb	2362	Kapla
00050000-568a-6ca8-d396-4d4370ef5d1e	2325	Kidričevo
00050000-568a-6ca8-c567-8aa8a7fb3f9e	1412	Kisovec
00050000-568a-6ca8-be5e-f530f886f3a0	6253	Knežak
00050000-568a-6ca8-b9da-e97bf0c50aab	5222	Kobarid
00050000-568a-6ca8-c474-3ccbe544777b	9227	Kobilje
00050000-568a-6ca8-87f9-3852448f7e7d	1330	Kočevje
00050000-568a-6ca8-5f21-2354eb6a6c91	1338	Kočevska Reka
00050000-568a-6ca8-03dd-b6f256b05621	2276	Kog
00050000-568a-6ca8-e84f-5ee54485bf07	5211	Kojsko
00050000-568a-6ca8-d952-cf7351f8025a	6223	Komen
00050000-568a-6ca8-bcc6-021ea7cc87ae	1218	Komenda
00050000-568a-6ca8-4819-6c3e80fcef92	6000	Koper/Capodistria 
00050000-568a-6ca8-1306-253e96a86419	6001	Koper/Capodistria - poštni predali
00050000-568a-6ca8-30d0-3ee61f0f5bd6	8282	Koprivnica
00050000-568a-6ca8-5dc1-13a1fb97848a	5296	Kostanjevica na Krasu
00050000-568a-6ca8-26bf-95a0347ef035	8311	Kostanjevica na Krki
00050000-568a-6ca8-2338-1d3e56ae5c65	1336	Kostel
00050000-568a-6ca8-b0b1-b1df56df6fff	6256	Košana
00050000-568a-6ca8-cae2-df627e2bb4ca	2394	Kotlje
00050000-568a-6ca8-47b5-7ba7a52309d9	6240	Kozina
00050000-568a-6ca8-1054-f314f2c8d86b	3260	Kozje
00050000-568a-6ca8-d419-44d9aa4cadd1	4000	Kranj 
00050000-568a-6ca8-d1e4-57568467711b	4001	Kranj - poštni predali
00050000-568a-6ca8-27ed-e9154f771711	4280	Kranjska Gora
00050000-568a-6ca8-9113-78c5696ff673	1281	Kresnice
00050000-568a-6ca8-4798-339c43f1a400	4294	Križe
00050000-568a-6ca8-a67a-88d14d485406	9206	Križevci
00050000-568a-6ca8-2b7c-43d34a00d7fc	9242	Križevci pri Ljutomeru
00050000-568a-6ca8-1ba0-53f6e746d12a	1301	Krka
00050000-568a-6ca8-a71d-934765eb1cb6	8296	Krmelj
00050000-568a-6ca8-d7ec-c949b3aa2e1e	4245	Kropa
00050000-568a-6ca8-ac81-81e0efca35bb	8262	Krška vas
00050000-568a-6ca8-db0d-2f32d9d2bb41	8270	Krško
00050000-568a-6ca8-740b-1b12f1995e53	9263	Kuzma
00050000-568a-6ca8-469f-aba31071c8df	2318	Laporje
00050000-568a-6ca8-b209-569e0d6a6ccc	3270	Laško
00050000-568a-6ca8-3d25-c067cfc79365	1219	Laze v Tuhinju
00050000-568a-6ca8-ca1c-f5eff5d1b2bd	2230	Lenart v Slovenskih goricah
00050000-568a-6ca8-49ce-a2bf6e5579ce	9220	Lendava/Lendva
00050000-568a-6ca8-c22c-f648cb1e5715	4248	Lesce
00050000-568a-6ca8-e59c-c9b2995ef046	3261	Lesično
00050000-568a-6ca8-fd0c-a5202ee9685f	8273	Leskovec pri Krškem
00050000-568a-6ca8-3893-fa67d23e3819	2372	Libeliče
00050000-568a-6ca8-85e8-f4ad303e8c30	2341	Limbuš
00050000-568a-6ca8-0fc8-203b43a842c6	1270	Litija
00050000-568a-6ca8-e3b5-fb082402acec	3202	Ljubečna
00050000-568a-6ca8-6e1d-e4bbae2d3ed8	1000	Ljubljana 
00050000-568a-6ca8-1c5e-a181ac5f8524	1001	Ljubljana - poštni predali
00050000-568a-6ca8-48d2-30a8078f316c	1231	Ljubljana - Črnuče
00050000-568a-6ca8-9a33-086a96aa7011	1261	Ljubljana - Dobrunje
00050000-568a-6ca8-adde-7f5e460f3cc2	1260	Ljubljana - Polje
00050000-568a-6ca8-d47f-cc82cb8f3386	1210	Ljubljana - Šentvid
00050000-568a-6ca8-91da-c2eab4ab85c9	1211	Ljubljana - Šmartno
00050000-568a-6ca8-41b8-243b8da532f2	3333	Ljubno ob Savinji
00050000-568a-6ca8-93af-c975ceb5427f	9240	Ljutomer
00050000-568a-6ca8-feed-0fe4f5296d74	3215	Loče
00050000-568a-6ca8-1c7c-0be1688ba690	5231	Log pod Mangartom
00050000-568a-6ca8-797d-21bff8a6308c	1358	Log pri Brezovici
00050000-568a-6ca8-861b-219671c5c637	1370	Logatec
00050000-568a-6ca8-e3a9-c4ee3da01592	1371	Logatec
00050000-568a-6ca8-5900-3ab2dcfefab4	1434	Loka pri Zidanem Mostu
00050000-568a-6ca8-7772-05c515dbd328	3223	Loka pri Žusmu
00050000-568a-6ca8-bd5c-02f32352b7bd	6219	Lokev
00050000-568a-6ca8-16b2-43e40d00d6e1	1318	Loški Potok
00050000-568a-6ca8-28f4-3ad958c89d98	2324	Lovrenc na Dravskem polju
00050000-568a-6ca8-0e6d-ffb838843bb2	2344	Lovrenc na Pohorju
00050000-568a-6ca8-300b-08a7822df8bc	3334	Luče
00050000-568a-6ca8-c5ce-62d1c2207b5b	1225	Lukovica
00050000-568a-6ca8-a309-b77d782b53cc	9202	Mačkovci
00050000-568a-6ca8-45e2-c35d1a766fdd	2322	Majšperk
00050000-568a-6ca8-5a8e-43efdd1443dd	2321	Makole
00050000-568a-6ca8-cb1d-1268587a8210	9243	Mala Nedelja
00050000-568a-6ca8-4c64-f3daa44dcc78	2229	Malečnik
00050000-568a-6ca8-931f-2557a0fbeed9	6273	Marezige
00050000-568a-6ca8-4db0-e2d0a45d337f	2000	Maribor 
00050000-568a-6ca8-0e66-484460d7d997	2001	Maribor - poštni predali
00050000-568a-6ca8-810c-63d87108befa	2206	Marjeta na Dravskem polju
00050000-568a-6ca8-a03d-43768eea7650	2281	Markovci
00050000-568a-6ca8-300e-3f2e0778bbab	9221	Martjanci
00050000-568a-6ca8-6740-a87811d322aa	6242	Materija
00050000-568a-6ca8-93ff-373009c17817	4211	Mavčiče
00050000-568a-6ca8-bd54-d2950560c5f9	1215	Medvode
00050000-568a-6ca8-2c44-d3e36afbfa0a	1234	Mengeš
00050000-568a-6ca8-cd7e-fec6cfeafe49	8330	Metlika
00050000-568a-6ca8-6b6e-734432818cd4	2392	Mežica
00050000-568a-6ca8-1329-cbbac99a0edb	2204	Miklavž na Dravskem polju
00050000-568a-6ca8-e158-d9d2bc3a9ae8	2275	Miklavž pri Ormožu
00050000-568a-6ca8-423d-0b47538f80c4	5291	Miren
00050000-568a-6ca8-be6b-589026f33ea2	8233	Mirna
00050000-568a-6ca8-eed2-bd6bb1438b3e	8216	Mirna Peč
00050000-568a-6ca8-caf8-f947baac5580	2382	Mislinja
00050000-568a-6ca8-3431-f67978a561da	4281	Mojstrana
00050000-568a-6ca8-6a24-47655d0e1e92	8230	Mokronog
00050000-568a-6ca8-0553-596ee443e1ed	1251	Moravče
00050000-568a-6ca8-15df-8f8bc8b705b8	9226	Moravske Toplice
00050000-568a-6ca8-c623-0882cd1bbf0e	5216	Most na Soči
00050000-568a-6ca8-82dd-59152c6f9dac	1221	Motnik
00050000-568a-6ca8-e16c-b6c8b5fe970d	3330	Mozirje
00050000-568a-6ca8-b43e-19634f09f326	9000	Murska Sobota 
00050000-568a-6ca8-74f3-708a10e09289	9001	Murska Sobota - poštni predali
00050000-568a-6ca8-67f4-6d9afbbaac60	2366	Muta
00050000-568a-6ca8-0a3f-d989c9d015a0	4202	Naklo
00050000-568a-6ca8-46ea-022c0178956d	3331	Nazarje
00050000-568a-6ca8-6662-65c0836ea747	1357	Notranje Gorice
00050000-568a-6ca8-9d45-ac5ea8e275d1	3203	Nova Cerkev
00050000-568a-6ca8-94fb-e844caf1ea17	5000	Nova Gorica 
00050000-568a-6ca8-b90c-12471702226e	5001	Nova Gorica - poštni predali
00050000-568a-6ca8-eb69-01a448ac44ae	1385	Nova vas
00050000-568a-6ca8-c914-cdb304b8fbb8	8000	Novo mesto
00050000-568a-6ca8-1bce-74e2d4698e6c	8001	Novo mesto - poštni predali
00050000-568a-6ca8-8597-586e43a1332d	6243	Obrov
00050000-568a-6ca8-27e5-9b04876df274	9233	Odranci
00050000-568a-6ca8-6cb5-6d60030bdbf7	2317	Oplotnica
00050000-568a-6ca8-5c6f-ec2a5551ddea	2312	Orehova vas
00050000-568a-6ca8-1ccf-21b7ae00982a	2270	Ormož
00050000-568a-6ca8-b2c3-b97117af26af	1316	Ortnek
00050000-568a-6ca8-8876-43ec4a9bac8d	1337	Osilnica
00050000-568a-6ca8-9396-72244d50bb48	8222	Otočec
00050000-568a-6ca8-b02b-4648a97c6e39	2361	Ožbalt
00050000-568a-6ca8-98e3-4e3095778b17	2231	Pernica
00050000-568a-6ca8-fcb6-39cb1d04f89a	2211	Pesnica pri Mariboru
00050000-568a-6ca8-5d4f-311ccf4536a7	9203	Petrovci
00050000-568a-6ca8-4fba-2f4b33a1f865	3301	Petrovče
00050000-568a-6ca8-8875-5d767cba5ffc	6330	Piran/Pirano
00050000-568a-6ca8-2bf6-40e485532c47	8255	Pišece
00050000-568a-6ca8-fdb0-4880dacaa783	6257	Pivka
00050000-568a-6ca8-aa99-e1077e1971e7	6232	Planina
00050000-568a-6ca8-dc84-d69ec9e2f668	3225	Planina pri Sevnici
00050000-568a-6ca8-0820-4e8cdf718eea	6276	Pobegi
00050000-568a-6ca8-ecaa-d16146cd9690	8312	Podbočje
00050000-568a-6ca8-9c76-7b9fc10cf161	5243	Podbrdo
00050000-568a-6ca8-1051-48aeaedf7e6e	3254	Podčetrtek
00050000-568a-6ca8-7840-1d48d5725164	2273	Podgorci
00050000-568a-6ca8-d280-7cecda039db0	6216	Podgorje
00050000-568a-6ca8-b477-655faff072ec	2381	Podgorje pri Slovenj Gradcu
00050000-568a-6ca8-b1e1-0fda7d2dc71d	6244	Podgrad
00050000-568a-6ca8-c51d-cc9fc3f42141	1414	Podkum
00050000-568a-6ca8-b6ff-4b1b5f829a76	2286	Podlehnik
00050000-568a-6ca8-6e44-37a1054bbdfd	5272	Podnanos
00050000-568a-6ca8-2d14-0c238dddba3e	4244	Podnart
00050000-568a-6ca8-c604-0d8da337c184	3241	Podplat
00050000-568a-6ca8-7221-40dbfe8d1018	3257	Podsreda
00050000-568a-6ca8-562a-7554334aab58	2363	Podvelka
00050000-568a-6ca8-c68d-49ca9ed522ad	2208	Pohorje
00050000-568a-6ca8-e0b5-476eace4e523	2257	Polenšak
00050000-568a-6ca8-e4e4-da344b7e90d6	1355	Polhov Gradec
00050000-568a-6ca8-e251-f10d2b2dd01f	4223	Poljane nad Škofjo Loko
00050000-568a-6ca8-0f51-8ba3ba7f02d3	2319	Poljčane
00050000-568a-6ca8-59ce-d92488f4cd94	1272	Polšnik
00050000-568a-6ca8-a2e4-cd982e27f232	3313	Polzela
00050000-568a-6ca8-fad2-90c95f1f4953	3232	Ponikva
00050000-568a-6ca8-4f10-2d4bdfc14f1f	6320	Portorož/Portorose
00050000-568a-6ca8-1a5c-c9efc1998d45	6230	Postojna
00050000-568a-6ca8-c211-1d8ca0c5c00b	2331	Pragersko
00050000-568a-6ca8-c172-e2c70261eae3	3312	Prebold
00050000-568a-6ca8-098a-74df0ea6ebde	4205	Preddvor
00050000-568a-6ca8-b7d0-325602bace80	6255	Prem
00050000-568a-6ca8-0aab-da1a68d4f21b	1352	Preserje
00050000-568a-6ca8-b3ec-0eb2e4647b91	6258	Prestranek
00050000-568a-6ca8-d34b-c278f3b697bc	2391	Prevalje
00050000-568a-6ca8-97a1-2a7ffe8c7908	3262	Prevorje
00050000-568a-6ca8-c0e5-3c52ef3fd841	1276	Primskovo 
00050000-568a-6ca8-9786-955be9502cb6	3253	Pristava pri Mestinju
00050000-568a-6ca8-c340-38924a3a2a86	9207	Prosenjakovci/Partosfalva
00050000-568a-6ca8-9472-5bd615660f08	5297	Prvačina
00050000-568a-6ca8-68c0-867e0e6cc782	2250	Ptuj
00050000-568a-6ca8-09b9-d903a5abb555	2323	Ptujska Gora
00050000-568a-6ca8-6485-68399f7e030a	9201	Puconci
00050000-568a-6ca8-b8a7-7fe4b46203da	2327	Rače
00050000-568a-6ca8-d621-7856b5a68254	1433	Radeče
00050000-568a-6ca8-3041-119f1a997e75	9252	Radenci
00050000-568a-6ca8-fb2b-e5c43d18135e	2360	Radlje ob Dravi
00050000-568a-6ca8-c051-d5fbdfd87c89	1235	Radomlje
00050000-568a-6ca8-3a8d-c3d5a5d175c0	4240	Radovljica
00050000-568a-6ca8-14cd-c0d3b3bc8e9d	8274	Raka
00050000-568a-6ca8-d6f6-1b354ab985bd	1381	Rakek
00050000-568a-6ca8-298a-e9b497cd9037	4283	Rateče - Planica
00050000-568a-6ca8-8a1f-a14a23b14efd	2390	Ravne na Koroškem
00050000-568a-6ca8-f24f-6efd6229fb10	9246	Razkrižje
00050000-568a-6ca8-aaee-5d797b2af639	3332	Rečica ob Savinji
00050000-568a-6ca8-4668-465deb34d8f3	5292	Renče
00050000-568a-6ca8-bc68-88105de4391c	1310	Ribnica
00050000-568a-6ca8-015f-f4786bce6809	2364	Ribnica na Pohorju
00050000-568a-6ca8-9f60-75229ca97e93	3272	Rimske Toplice
00050000-568a-6ca8-5ccc-36cee47ccee0	1314	Rob
00050000-568a-6ca8-c643-1a34dcdc1003	5215	Ročinj
00050000-568a-6ca8-8c42-6622fe827a84	3250	Rogaška Slatina
00050000-568a-6ca8-4719-4d72804bd145	9262	Rogašovci
00050000-568a-6ca8-bde2-1acb9d1bc070	3252	Rogatec
00050000-568a-6ca8-0ee7-6590aad12336	1373	Rovte
00050000-568a-6ca8-bba8-5418ee774613	2342	Ruše
00050000-568a-6ca8-b11b-e48220aa4144	1282	Sava
00050000-568a-6ca8-a193-d08d50d6708b	6333	Sečovlje/Sicciole
00050000-568a-6ca8-981b-6e915cabfadd	4227	Selca
00050000-568a-6ca8-8515-93a8aa387885	2352	Selnica ob Dravi
00050000-568a-6ca8-b345-b9ba42f68f35	8333	Semič
00050000-568a-6ca8-7d75-cb9b53c452fe	8281	Senovo
00050000-568a-6ca8-21d2-f675bf24ec7c	6224	Senožeče
00050000-568a-6ca8-d5b0-f268a0907fac	8290	Sevnica
00050000-568a-6ca8-26b5-d87da29b891d	6210	Sežana
00050000-568a-6ca8-3269-c2342bbddde2	2214	Sladki Vrh
00050000-568a-6ca8-b3e1-679dbe2e2666	5283	Slap ob Idrijci
00050000-568a-6ca8-226a-b2467e689edb	2380	Slovenj Gradec
00050000-568a-6ca8-1c49-38b12277ba53	2310	Slovenska Bistrica
00050000-568a-6ca8-1949-41af0f2041f4	3210	Slovenske Konjice
00050000-568a-6ca8-461a-b0ebdb0916a8	1216	Smlednik
00050000-568a-6ca8-7c0d-d4d99ceed244	5232	Soča
00050000-568a-6ca8-f4ee-818c5433d79a	1317	Sodražica
00050000-568a-6ca8-a5a2-c114887f104b	3335	Solčava
00050000-568a-6ca8-0e37-795a97e3b200	5250	Solkan
00050000-568a-6ca8-935d-0374dc850b3c	4229	Sorica
00050000-568a-6ca8-8a94-44c64196ddac	4225	Sovodenj
00050000-568a-6ca8-c88c-17dc154f7b2c	5281	Spodnja Idrija
00050000-568a-6ca8-56c1-746e3c4fbd3f	2241	Spodnji Duplek
00050000-568a-6ca8-cd40-7613986550ab	9245	Spodnji Ivanjci
00050000-568a-6ca8-4581-d8b2c322ccfb	2277	Središče ob Dravi
00050000-568a-6ca8-0d02-f345b1e32fbc	4267	Srednja vas v Bohinju
00050000-568a-6ca8-090c-2362a52a4435	8256	Sromlje 
00050000-568a-6ca8-eb8a-a692290d0674	5224	Srpenica
00050000-568a-6ca8-e268-d688d3241e02	1242	Stahovica
00050000-568a-6ca8-6fe4-b50787371ca6	1332	Stara Cerkev
00050000-568a-6ca8-40fa-ea977d8d3128	8342	Stari trg ob Kolpi
00050000-568a-6ca8-66cc-3c976f0fa4e3	1386	Stari trg pri Ložu
00050000-568a-6ca8-4852-94b5bc38873d	2205	Starše
00050000-568a-6ca8-d8bb-d95174b6f86a	2289	Stoperce
00050000-568a-6ca8-338b-d7a3bf6e83ff	8322	Stopiče
00050000-568a-6ca8-a589-3431c7fd55fc	3206	Stranice
00050000-568a-6ca8-dd25-f0eeb0fdd737	8351	Straža
00050000-568a-6ca8-ca09-c04be8a685eb	1313	Struge
00050000-568a-6ca8-ad76-7658a58e934f	8293	Studenec
00050000-568a-6ca8-1c3e-f402f315706a	8331	Suhor
00050000-568a-6ca8-962d-7e455d75574a	2233	Sv. Ana v Slovenskih goricah
00050000-568a-6ca8-d585-c1d25f9789a4	2235	Sv. Trojica v Slovenskih goricah
00050000-568a-6ca8-ebb2-4d09c61a9c01	2353	Sveti Duh na Ostrem Vrhu
00050000-568a-6ca8-be5c-647f103cc177	9244	Sveti Jurij ob Ščavnici
00050000-568a-6ca8-d1fe-7e24b4022095	3264	Sveti Štefan
00050000-568a-6ca8-965d-3ddcbbce8e8c	2258	Sveti Tomaž
00050000-568a-6ca8-57fd-4c35252db6b4	9204	Šalovci
00050000-568a-6ca8-b00d-c2fe905d5eeb	5261	Šempas
00050000-568a-6ca8-b656-ab94778a4796	5290	Šempeter pri Gorici
00050000-568a-6ca8-3604-5a949b90b3e7	3311	Šempeter v Savinjski dolini
00050000-568a-6ca8-b3dc-7953d4912a25	4208	Šenčur
00050000-568a-6ca8-52df-ba0d663b420f	2212	Šentilj v Slovenskih goricah
00050000-568a-6ca8-4c5f-0d223e235fde	8297	Šentjanž
00050000-568a-6ca8-2aeb-dc86fa19d142	2373	Šentjanž pri Dravogradu
00050000-568a-6ca8-2917-4bcbb252249c	8310	Šentjernej
00050000-568a-6ca8-83a6-5ccd6d4a8033	3230	Šentjur
00050000-568a-6ca8-1d5b-a9b80c740086	3271	Šentrupert
00050000-568a-6ca8-f926-251d5abbda0f	8232	Šentrupert
00050000-568a-6ca8-250a-851064429fdd	1296	Šentvid pri Stični
00050000-568a-6ca8-02d8-e05a6a5a524f	8275	Škocjan
00050000-568a-6ca8-816f-8db98d48d772	6281	Škofije
00050000-568a-6ca8-2f39-4f37b3ee6e22	4220	Škofja Loka
00050000-568a-6ca8-41ea-514e27da5772	3211	Škofja vas
00050000-568a-6ca8-b702-f6bbf04f1374	1291	Škofljica
00050000-568a-6ca8-801d-a5fe9a9a6bcd	6274	Šmarje
00050000-568a-6ca8-4781-f788038495ba	1293	Šmarje - Sap
00050000-568a-6ca8-5903-8d3abde5b43e	3240	Šmarje pri Jelšah
00050000-568a-6ca8-a2b0-c1d0903c0044	8220	Šmarješke Toplice
00050000-568a-6ca8-3f63-77b0f073d688	2315	Šmartno na Pohorju
00050000-568a-6ca8-9fed-528f088efc81	3341	Šmartno ob Dreti
00050000-568a-6ca8-2c66-cccd9c1dd46b	3327	Šmartno ob Paki
00050000-568a-6ca8-02b6-42364ef951b7	1275	Šmartno pri Litiji
00050000-568a-6ca8-be1c-e91574ce9030	2383	Šmartno pri Slovenj Gradcu
00050000-568a-6ca8-8e8c-c6495ebcade7	3201	Šmartno v Rožni dolini
00050000-568a-6ca8-b4f1-1e7148e6f326	3325	Šoštanj
00050000-568a-6ca8-a2fe-c7614906d02a	6222	Štanjel
00050000-568a-6ca8-4a01-20a58eaff269	3220	Štore
00050000-568a-6ca8-9633-9896484e59c4	3304	Tabor
00050000-568a-6ca8-a929-9395af1954b3	3221	Teharje
00050000-568a-6ca8-f198-2d878048c8a1	9251	Tišina
00050000-568a-6ca8-4d6c-14be7276e99a	5220	Tolmin
00050000-568a-6ca8-3997-dbeadfdf78a4	3326	Topolšica
00050000-568a-6ca8-b37b-9a2893ee4ba9	2371	Trbonje
00050000-568a-6ca8-cf95-f085cc12ecf6	1420	Trbovlje
00050000-568a-6ca8-1fd3-a1de4db97328	8231	Trebelno 
00050000-568a-6ca8-5e40-ba453b48b374	8210	Trebnje
00050000-568a-6ca8-8943-b700a5de0333	5252	Trnovo pri Gorici
00050000-568a-6ca8-4490-c67a5fe24c95	2254	Trnovska vas
00050000-568a-6ca8-1160-259ed53f4ca4	1222	Trojane
00050000-568a-6ca8-3944-e4595e260aa0	1236	Trzin
00050000-568a-6ca8-4bf9-328d4743c4b4	4290	Tržič
00050000-568a-6ca8-c93b-aeab5d7f9155	8295	Tržišče
00050000-568a-6ca8-ddc1-4b54bec34763	1311	Turjak
00050000-568a-6ca8-89c9-3dd5a5afb58d	9224	Turnišče
00050000-568a-6ca8-a65d-fbbfe19e242f	8323	Uršna sela
00050000-568a-6ca8-4e70-eacaae06f2e9	1252	Vače
00050000-568a-6ca8-47d1-f919ef336672	3320	Velenje 
00050000-568a-6ca8-741b-2d7bf389bab7	3322	Velenje - poštni predali
00050000-568a-6ca8-2aa6-421cbd592119	8212	Velika Loka
00050000-568a-6ca8-241e-8cd1e722a209	2274	Velika Nedelja
00050000-568a-6ca8-52df-924e35d9cd05	9225	Velika Polana
00050000-568a-6ca8-a596-73e95c6f67ea	1315	Velike Lašče
00050000-568a-6ca8-f56a-264b406014b7	8213	Veliki Gaber
00050000-568a-6ca8-9269-cd7786d3f675	9241	Veržej
00050000-568a-6ca8-b661-4dce0248f53c	1312	Videm - Dobrepolje
00050000-568a-6ca8-98dd-7b309b901bf3	2284	Videm pri Ptuju
00050000-568a-6ca8-d995-4e1ebd9c4b2a	8344	Vinica
00050000-568a-6ca8-f3ab-7f91d07b4676	5271	Vipava
00050000-568a-6ca8-af9d-d28854d20ca5	4212	Visoko
00050000-568a-6ca8-185c-9128a32c22bf	1294	Višnja Gora
00050000-568a-6ca8-9bcb-79cff735c9af	3205	Vitanje
00050000-568a-6ca8-12bc-80d72896ca8e	2255	Vitomarci
00050000-568a-6ca8-0f85-a1cf087425f6	1217	Vodice
00050000-568a-6ca8-bf34-6b08a2c22e32	3212	Vojnik\t
00050000-568a-6ca8-b6ff-61d6eadf4144	5293	Volčja Draga
00050000-568a-6ca8-e54f-9d03a2c52297	2232	Voličina
00050000-568a-6ca8-5a11-f2b9a6774bfe	3305	Vransko
00050000-568a-6ca8-d357-eb720255e0db	6217	Vremski Britof
00050000-568a-6ca8-88e9-35c45e985299	1360	Vrhnika
00050000-568a-6ca8-f88b-fe6f2b5ffe29	2365	Vuhred
00050000-568a-6ca8-406a-d33a763ab7ae	2367	Vuzenica
00050000-568a-6ca8-381e-8b0e865e6934	8292	Zabukovje 
00050000-568a-6ca8-1464-cc636f4322a6	1410	Zagorje ob Savi
00050000-568a-6ca8-55b7-d68156f40380	1303	Zagradec
00050000-568a-6ca8-e40a-4189daf37ea8	2283	Zavrč
00050000-568a-6ca8-73e6-625f6de8905d	8272	Zdole 
00050000-568a-6ca8-d8c2-afcfac0ddbcd	4201	Zgornja Besnica
00050000-568a-6ca8-7ad8-59993fc9c690	2242	Zgornja Korena
00050000-568a-6ca8-30bc-468b44cb9075	2201	Zgornja Kungota
00050000-568a-6ca8-c5d3-69a39580be35	2316	Zgornja Ložnica
00050000-568a-6ca8-5aed-c53a5116bcea	2314	Zgornja Polskava
00050000-568a-6ca8-5010-995aa9190f0f	2213	Zgornja Velka
00050000-568a-6ca8-987d-bfafc2f943c3	4247	Zgornje Gorje
00050000-568a-6ca8-0e40-7ca4d5d71f0b	4206	Zgornje Jezersko
00050000-568a-6ca8-6a0a-e318bb2dc5df	2285	Zgornji Leskovec
00050000-568a-6ca8-be24-89c36ae78285	1432	Zidani Most
00050000-568a-6ca8-6951-2b068bf8d2f8	3214	Zreče
00050000-568a-6ca8-3d69-904ff0ff819c	4209	Žabnica
00050000-568a-6ca8-c005-351d1eac06c6	3310	Žalec
00050000-568a-6ca8-5922-1e8a6552fa0d	4228	Železniki
00050000-568a-6ca8-043e-dd412e0814c4	2287	Žetale
00050000-568a-6ca8-166e-bf67240f7b93	4226	Žiri
00050000-568a-6ca8-0d8d-05850ba37627	4274	Žirovnica
00050000-568a-6ca8-9aa8-826338192f06	8360	Žužemberk
\.


--
-- TOC entry 3173 (class 0 OID 34210573)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 34210141)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 34209889)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-568a-6cac-a70b-994b43a3252e	00080000-568a-6cac-9d23-54c27288c9bf	\N	00040000-568a-6ca9-b744-d9662286ab3d	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-568a-6cac-c306-718bbb786ef8	00080000-568a-6cac-9d23-54c27288c9bf	\N	00040000-568a-6ca9-b744-d9662286ab3d	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-568a-6cac-3e48-6c63e3e39631	00080000-568a-6cac-f094-888a3eb6686c	\N	00040000-568a-6ca9-b744-d9662286ab3d	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3135 (class 0 OID 34210033)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-568a-6ca9-986b-eb4fabc0497d	novo leto	1	1	\N	t
00430000-568a-6ca9-d58c-9979237cad31	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-568a-6ca9-183a-72aba3333b46	dan upora proti okupatorju	27	4	\N	t
00430000-568a-6ca9-d18c-bbbcab757bd4	praznik dela	1	5	\N	t
00430000-568a-6ca9-9176-3a0e789aa96e	praznik dela	2	5	\N	t
00430000-568a-6ca9-35b2-ed0f855094fc	dan Primoža Trubarja	8	6	\N	f
00430000-568a-6ca9-725a-1fd80368ceb1	dan državnosti	25	6	\N	t
00430000-568a-6ca9-81c0-ae200faef6ee	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-568a-6ca9-e7c6-7f47d284146e	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-568a-6ca9-dde5-1549ca5a59f5	dan suverenosti	25	10	\N	f
00430000-568a-6ca9-849c-187d5bddb628	dan spomina na mrtve	1	11	\N	t
00430000-568a-6ca9-0347-d3ac6f90b4cb	dan Rudolfa Maistra	23	11	\N	f
00430000-568a-6ca9-633a-f9ac815b3f3e	božič	25	12	\N	t
00430000-568a-6ca9-d4fa-5cc750b68a2f	dan samostojnosti in enotnosti	26	12	\N	t
00430000-568a-6ca9-a9c3-f462e4e1a1bb	Marijino vnebovzetje	15	8	\N	t
00430000-568a-6ca9-1934-c9c261204527	dan reformacije	31	10	\N	t
00430000-568a-6ca9-27dd-7e24cdd79640	velikonočna nedelja	27	3	2016	t
00430000-568a-6ca9-320e-94fee64df28d	velikonočna nedelja	16	4	2017	t
00430000-568a-6ca9-4c5c-2921777bf3ce	velikonočna nedelja	1	4	2018	t
00430000-568a-6ca9-7d95-449bef294440	velikonočna nedelja	21	4	2019	t
00430000-568a-6ca9-2a4f-723fb8da606f	velikonočna nedelja	12	4	2020	t
00430000-568a-6ca9-0f66-4d6f008eaaf6	velikonočna nedelja	4	4	2021	t
00430000-568a-6ca9-9945-ff94360dcb8d	velikonočna nedelja	17	4	2022	t
00430000-568a-6ca9-28f0-1f4466b10a47	velikonočna nedelja	9	4	2023	t
00430000-568a-6ca9-ff27-834794dc66ce	velikonočna nedelja	31	3	2024	t
00430000-568a-6ca9-9195-50c0e7091890	velikonočna nedelja	20	4	2025	t
00430000-568a-6ca9-72ef-ca5812ba6c3a	velikonočna nedelja	5	4	2026	t
00430000-568a-6ca9-ec3d-1654c0546b16	velikonočna nedelja	28	3	2027	t
00430000-568a-6ca9-7557-59b3a2a926c3	velikonočna nedelja	16	4	2028	t
00430000-568a-6ca9-d21d-2f56a1cfd559	velikonočna nedelja	1	4	2029	t
00430000-568a-6ca9-6733-5330e990c4d1	velikonočna nedelja	21	4	2030	t
00430000-568a-6ca9-c972-a73f4bb08835	velikonočni ponedeljek	28	3	2016	t
00430000-568a-6ca9-4728-00a0d32651bf	velikonočni ponedeljek	17	4	2017	t
00430000-568a-6ca9-f871-eb7b33f25597	velikonočni ponedeljek	2	4	2018	t
00430000-568a-6ca9-28db-f694a1be01ae	velikonočni ponedeljek	22	4	2019	t
00430000-568a-6ca9-b0f5-a3fd306fd491	velikonočni ponedeljek	13	4	2020	t
00430000-568a-6ca9-c928-7b8de7afd703	velikonočni ponedeljek	5	4	2021	t
00430000-568a-6ca9-1a37-dcb708496d09	velikonočni ponedeljek	18	4	2022	t
00430000-568a-6ca9-ab41-87ee710f713f	velikonočni ponedeljek	10	4	2023	t
00430000-568a-6ca9-ed77-9b1e47eaaf46	velikonočni ponedeljek	1	4	2024	t
00430000-568a-6ca9-5ed1-0db69a375c34	velikonočni ponedeljek	21	4	2025	t
00430000-568a-6ca9-13ee-4816ca1b1091	velikonočni ponedeljek	6	4	2026	t
00430000-568a-6ca9-44aa-7a194208076d	velikonočni ponedeljek	29	3	2027	t
00430000-568a-6ca9-3d4e-3c4d497f7cce	velikonočni ponedeljek	17	4	2028	t
00430000-568a-6ca9-0184-1e99a546da47	velikonočni ponedeljek	2	4	2029	t
00430000-568a-6ca9-f2d5-b175506ae495	velikonočni ponedeljek	22	4	2030	t
00430000-568a-6ca9-f9e9-07c4eaa55604	binkoštna nedelja - binkošti	15	5	2016	t
00430000-568a-6ca9-9843-0ff8730ce0fb	binkoštna nedelja - binkošti	4	6	2017	t
00430000-568a-6ca9-7294-12ac1bda312c	binkoštna nedelja - binkošti	20	5	2018	t
00430000-568a-6ca9-f80d-c8e8d7561b92	binkoštna nedelja - binkošti	9	6	2019	t
00430000-568a-6ca9-2a4d-e5e90d849a3e	binkoštna nedelja - binkošti	31	5	2020	t
00430000-568a-6ca9-7fb9-befce5c2ef04	binkoštna nedelja - binkošti	23	5	2021	t
00430000-568a-6ca9-ad32-c99e2ba2ff8a	binkoštna nedelja - binkošti	5	6	2022	t
00430000-568a-6ca9-2b97-7ef2b5eb33c1	binkoštna nedelja - binkošti	28	5	2023	t
00430000-568a-6ca9-0d56-bb9e81fe081d	binkoštna nedelja - binkošti	19	5	2024	t
00430000-568a-6ca9-925a-cedb71dc5515	binkoštna nedelja - binkošti	8	6	2025	t
00430000-568a-6ca9-bfc0-48ff63a66329	binkoštna nedelja - binkošti	24	5	2026	t
00430000-568a-6ca9-f334-61d4a8f7affd	binkoštna nedelja - binkošti	16	5	2027	t
00430000-568a-6ca9-fc36-3fe54aa986ec	binkoštna nedelja - binkošti	4	6	2028	t
00430000-568a-6ca9-d8aa-4cc8109956f9	binkoštna nedelja - binkošti	20	5	2029	t
00430000-568a-6ca9-10ce-657db2275fc4	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3131 (class 0 OID 34209993)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 34210005)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 34210153)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 34210587)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 34210597)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-568a-6cac-0e68-74ca5c297df2	00080000-568a-6cac-da9a-055be1404443	0987	AK
00190000-568a-6cac-baa5-f9aec6e2a792	00080000-568a-6cac-f094-888a3eb6686c	0989	AK
00190000-568a-6cac-1df3-2035d1d0439a	00080000-568a-6cac-b6ec-c28e1978d7a5	0986	AK
00190000-568a-6cac-f843-3a4fbceee64f	00080000-568a-6cac-8b1e-251773f2837b	0984	AK
00190000-568a-6cac-94cd-11c92b7fe57c	00080000-568a-6cac-e744-52d04a5fa401	0983	AK
00190000-568a-6cac-8752-bd3c0b4dfcf6	00080000-568a-6cac-717f-49c455cf4674	0982	AK
00190000-568a-6cae-e84d-c4e63f86ddc1	00080000-568a-6cae-aff4-bb3ab5fec1c2	1001	AK
\.


--
-- TOC entry 3172 (class 0 OID 34210486)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-568a-6cad-f42d-6e0a0e3ef3aa	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3176 (class 0 OID 34210605)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 34210182)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-568a-6cac-4500-8d5242e8f669	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-568a-6cac-023d-e90cc22d7b52	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-568a-6cac-3760-8e5544a38a65	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-568a-6cac-c00e-fc25c51f2462	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-568a-6cac-2a26-075320a6683b	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-568a-6cac-d5f1-18a60f6e1644	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-568a-6cac-c6c3-ecb3031d76a2	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3144 (class 0 OID 34210126)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 34210116)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 34210324)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 34210254)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 34209967)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 34209729)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-568a-6cae-aff4-bb3ab5fec1c2	00010000-568a-6caa-27ca-72452575bc77	2016-01-04 13:59:26	INS	a:0:{}
2	App\\Entity\\Option	00000000-568a-6cae-5916-481299cc3023	00010000-568a-6caa-27ca-72452575bc77	2016-01-04 13:59:26	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-568a-6cae-e84d-c4e63f86ddc1	00010000-568a-6caa-27ca-72452575bc77	2016-01-04 13:59:26	INS	a:0:{}
\.


--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3153 (class 0 OID 34210195)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 34209767)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-568a-6ca9-c296-9baf41043940	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-568a-6ca9-b65c-977c39ff17bf	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-568a-6ca9-881e-bcf0c7131529	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-568a-6ca9-6ea7-f3d2627673ab	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-568a-6ca9-0d80-222c40b2ffab	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-568a-6ca9-66d6-a6c4ca963883	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-568a-6ca9-8605-1585670acadd	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-568a-6ca9-a7ae-917b7c25924c	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-568a-6ca9-9fa2-566cc887575e	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-568a-6ca9-475f-33d0109354f0	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-568a-6ca9-f3f5-039321e3bcd4	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-568a-6ca9-9ff8-2132792ec8a3	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-568a-6ca9-fd82-7be653369847	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-568a-6ca9-5a2d-65396ac4cbb2	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-568a-6ca9-7dd6-9157a88b88cb	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-568a-6ca9-3d69-9b6a8af9df1e	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-568a-6ca9-5c0d-b705cf19bc46	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-568a-6ca9-3ba7-0fb14f38fec7	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-568a-6ca9-6015-f8313a0642c1	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-568a-6ca9-74e4-cca045a53503	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-568a-6ca9-2abd-0580a5b6b1bb	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-568a-6ca9-5e9e-9648862d58f0	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-568a-6ca9-795e-61853ce904c7	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-568a-6ca9-7225-c2a323f1731d	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-568a-6ca9-2fcc-66aaccf75f44	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-568a-6ca9-9f50-d3be31a9260e	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-568a-6ca9-9582-5a861c2c0bb1	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-568a-6ca9-c144-3c0199ccec72	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-568a-6ca9-eba0-0586fbd25f23	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-568a-6ca9-6b96-3540c1fd5c06	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-568a-6ca9-36ab-abd346340fb2	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-568a-6ca9-34c1-d0503f30737e	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-568a-6ca9-a57c-b96705617ff5	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-568a-6ca9-68e6-3ec0f1ecb733	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-568a-6ca9-54b2-fe6544f953cf	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-568a-6ca9-210a-4dfd510c241b	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-568a-6ca9-85f1-dda1d108782c	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-568a-6ca9-2ad1-8597bf43aea4	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-568a-6ca9-13ef-f253a7825181	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-568a-6ca9-b5a9-7b3f3d62ab63	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-568a-6ca9-340b-1353680a0a09	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-568a-6ca9-741c-e4c7a825f246	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-568a-6ca9-13e2-982ab68132f6	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-568a-6ca9-6e3b-ee6060e2367e	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-568a-6ca9-eacc-f3c9d162de06	direktor	minimalne pravice za direktorja	t
00020000-568a-6ca9-8401-5f3abb8a5191	arhivar	arhivar	t
00020000-568a-6ca9-8d33-b171d0930131	dramaturg	dramaturg	t
00020000-568a-6caa-d217-24a951d08557	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-568a-6caa-1c8b-058b3f45ebbe	poslovni-sekretar	poslovni sekretar	t
00020000-568a-6caa-9b58-0afef72c072c	vodja-tehnike	vodja tehnike	t
00020000-568a-6caa-9843-be3801b78a80	racunovodja	računovodja	t
00020000-568a-6cac-92b2-4f1b3c1b8272	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-568a-6cac-fde8-25e7b0efe70a	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-d8f1-99f2ecb95b64	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-ac98-8c3d472ff8fd	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-f551-aba32d277baa	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-e7f9-e5750942afc1	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-980c-90caa0c0d87c	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-b032-9efcdd5170ed	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-cd6a-93a0c9f8a48a	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-c1e2-96808160fede	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-2775-7522d422f87f	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-df66-ecb03516c66b	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-65dc-00a78c06d125	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-0084-94a97c9dcf81	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-8d6a-6caf6b890d96	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-155a-3cf8b5c5edd2	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-7fc5-44cdfbdad548	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-2a11-99517ecbd841	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-8f19-24702882b614	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-94dc-0215836c3f6b	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-568a-6cac-d44c-9e0baa88c11f	Trr-read	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-8753-b0c39764b440	Trr-write	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-f50f-be32214149af	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-f5f5-8b11c0d0aed5	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-395a-3dbc3406bcc2	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-6b3f-0402bc00fc4b	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-34c8-88e58fe29b99	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-4490-820e4caac2f8	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-21da-734d44a4d9e2	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-9ca3-4f53a02ea27c	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-7667-9d0973f2e5ce	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-d8d5-bb323056bf7f	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-1fe3-b846450ff42c	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-d171-2be34a12ab52	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-e804-3d8ae9f19913	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-a81a-40ce980bf105	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-a211-6c324cb58b2d	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-ef1b-32067ecb834e	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-568a-6cac-f148-3ee4f64ec7cc	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3110 (class 0 OID 34209751)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-568a-6caa-d88b-e6ad3c3cca68	00020000-568a-6ca9-881e-bcf0c7131529
00010000-568a-6caa-27ca-72452575bc77	00020000-568a-6ca9-881e-bcf0c7131529
00010000-568a-6cac-de65-484e85282465	00020000-568a-6cac-92b2-4f1b3c1b8272
00010000-568a-6cac-276c-34b745850b97	00020000-568a-6cac-fde8-25e7b0efe70a
00010000-568a-6cac-276c-34b745850b97	00020000-568a-6cac-e7f9-e5750942afc1
00010000-568a-6cac-276c-34b745850b97	00020000-568a-6cac-c1e2-96808160fede
00010000-568a-6cac-276c-34b745850b97	00020000-568a-6cac-df66-ecb03516c66b
00010000-568a-6cac-276c-34b745850b97	00020000-568a-6cac-0084-94a97c9dcf81
00010000-568a-6cac-276c-34b745850b97	00020000-568a-6cac-8f19-24702882b614
00010000-568a-6cac-276c-34b745850b97	00020000-568a-6cac-ac98-8c3d472ff8fd
00010000-568a-6cac-276c-34b745850b97	00020000-568a-6cac-d44c-9e0baa88c11f
00010000-568a-6cac-276c-34b745850b97	00020000-568a-6cac-f5f5-8b11c0d0aed5
00010000-568a-6cac-276c-34b745850b97	00020000-568a-6cac-6b3f-0402bc00fc4b
00010000-568a-6cac-276c-34b745850b97	00020000-568a-6cac-4490-820e4caac2f8
00010000-568a-6cac-276c-34b745850b97	00020000-568a-6cac-9ca3-4f53a02ea27c
00010000-568a-6cac-276c-34b745850b97	00020000-568a-6cac-d171-2be34a12ab52
00010000-568a-6cac-906b-da5373f638d5	00020000-568a-6cac-fde8-25e7b0efe70a
00010000-568a-6cac-906b-da5373f638d5	00020000-568a-6cac-d8f1-99f2ecb95b64
00010000-568a-6cac-906b-da5373f638d5	00020000-568a-6cac-ac98-8c3d472ff8fd
00010000-568a-6cac-906b-da5373f638d5	00020000-568a-6cac-f551-aba32d277baa
00010000-568a-6cac-906b-da5373f638d5	00020000-568a-6cac-0084-94a97c9dcf81
00010000-568a-6cac-906b-da5373f638d5	00020000-568a-6cac-7fc5-44cdfbdad548
00010000-568a-6cac-906b-da5373f638d5	00020000-568a-6cac-d44c-9e0baa88c11f
00010000-568a-6cac-906b-da5373f638d5	00020000-568a-6cac-f5f5-8b11c0d0aed5
00010000-568a-6cac-906b-da5373f638d5	00020000-568a-6cac-6b3f-0402bc00fc4b
00010000-568a-6cac-906b-da5373f638d5	00020000-568a-6cac-4490-820e4caac2f8
00010000-568a-6cac-906b-da5373f638d5	00020000-568a-6cac-9ca3-4f53a02ea27c
00010000-568a-6cac-906b-da5373f638d5	00020000-568a-6cac-d171-2be34a12ab52
00010000-568a-6cac-15b2-e58a0518e79b	00020000-568a-6cac-fde8-25e7b0efe70a
00010000-568a-6cac-15b2-e58a0518e79b	00020000-568a-6cac-d8f1-99f2ecb95b64
00010000-568a-6cac-15b2-e58a0518e79b	00020000-568a-6cac-ac98-8c3d472ff8fd
00010000-568a-6cac-15b2-e58a0518e79b	00020000-568a-6cac-f551-aba32d277baa
00010000-568a-6cac-15b2-e58a0518e79b	00020000-568a-6cac-df66-ecb03516c66b
00010000-568a-6cac-15b2-e58a0518e79b	00020000-568a-6cac-0084-94a97c9dcf81
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-d8f1-99f2ecb95b64
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-980c-90caa0c0d87c
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-2775-7522d422f87f
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-65dc-00a78c06d125
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-df66-ecb03516c66b
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-2a11-99517ecbd841
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-0084-94a97c9dcf81
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-8d6a-6caf6b890d96
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-d44c-9e0baa88c11f
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-8753-b0c39764b440
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-f5f5-8b11c0d0aed5
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-395a-3dbc3406bcc2
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-6b3f-0402bc00fc4b
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-34c8-88e58fe29b99
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-4490-820e4caac2f8
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-21da-734d44a4d9e2
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-9ca3-4f53a02ea27c
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-7667-9d0973f2e5ce
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-d171-2be34a12ab52
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-e804-3d8ae9f19913
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-a211-6c324cb58b2d
00010000-568a-6cac-9f95-80fce9b94187	00020000-568a-6cac-ef1b-32067ecb834e
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-d8f1-99f2ecb95b64
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-980c-90caa0c0d87c
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-cd6a-93a0c9f8a48a
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-2775-7522d422f87f
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-65dc-00a78c06d125
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-df66-ecb03516c66b
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-2a11-99517ecbd841
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-0084-94a97c9dcf81
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-8d6a-6caf6b890d96
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-155a-3cf8b5c5edd2
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-d44c-9e0baa88c11f
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-8753-b0c39764b440
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-f50f-be32214149af
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-f5f5-8b11c0d0aed5
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-395a-3dbc3406bcc2
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-6b3f-0402bc00fc4b
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-34c8-88e58fe29b99
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-4490-820e4caac2f8
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-21da-734d44a4d9e2
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-9ca3-4f53a02ea27c
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-7667-9d0973f2e5ce
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-d171-2be34a12ab52
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-e804-3d8ae9f19913
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-a81a-40ce980bf105
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-a211-6c324cb58b2d
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-ef1b-32067ecb834e
00010000-568a-6cac-0eaa-f222a08d0d1f	00020000-568a-6cac-f148-3ee4f64ec7cc
00010000-568a-6cac-26e0-f7582d8b3b56	00020000-568a-6cac-d8f1-99f2ecb95b64
00010000-568a-6cac-26e0-f7582d8b3b56	00020000-568a-6cac-ac98-8c3d472ff8fd
00010000-568a-6cac-26e0-f7582d8b3b56	00020000-568a-6cac-980c-90caa0c0d87c
00010000-568a-6cac-26e0-f7582d8b3b56	00020000-568a-6cac-b032-9efcdd5170ed
00010000-568a-6cac-26e0-f7582d8b3b56	00020000-568a-6cac-cd6a-93a0c9f8a48a
00010000-568a-6cac-26e0-f7582d8b3b56	00020000-568a-6cac-e7f9-e5750942afc1
00010000-568a-6cac-26e0-f7582d8b3b56	00020000-568a-6cac-2775-7522d422f87f
00010000-568a-6cac-26e0-f7582d8b3b56	00020000-568a-6cac-65dc-00a78c06d125
00010000-568a-6cac-26e0-f7582d8b3b56	00020000-568a-6cac-df66-ecb03516c66b
00010000-568a-6cac-26e0-f7582d8b3b56	00020000-568a-6cac-2a11-99517ecbd841
00010000-568a-6cac-8dc2-79b1ad955dc5	00020000-568a-6cac-fde8-25e7b0efe70a
00010000-568a-6cac-8dc2-79b1ad955dc5	00020000-568a-6cac-f551-aba32d277baa
00010000-568a-6cac-8dc2-79b1ad955dc5	00020000-568a-6cac-e7f9-e5750942afc1
00010000-568a-6cac-8dc2-79b1ad955dc5	00020000-568a-6cac-c1e2-96808160fede
00010000-568a-6cac-8dc2-79b1ad955dc5	00020000-568a-6cac-df66-ecb03516c66b
00010000-568a-6cac-8dc2-79b1ad955dc5	00020000-568a-6cac-0084-94a97c9dcf81
00010000-568a-6cac-8dc2-79b1ad955dc5	00020000-568a-6cac-8f19-24702882b614
00010000-568a-6cac-8dc2-79b1ad955dc5	00020000-568a-6cac-d8d5-bb323056bf7f
00010000-568a-6cac-bc82-a7f137d55469	00020000-568a-6cac-94dc-0215836c3f6b
00010000-568a-6cac-a5f4-ec26686ecdee	00020000-568a-6ca9-eacc-f3c9d162de06
00010000-568a-6cac-a8f0-19c73c285421	00020000-568a-6ca9-8401-5f3abb8a5191
00010000-568a-6cac-8e50-09a9832157d8	00020000-568a-6ca9-8d33-b171d0930131
00010000-568a-6cac-d6b9-1607ec11884d	00020000-568a-6caa-d217-24a951d08557
00010000-568a-6cac-96fe-2386bbc796b8	00020000-568a-6caa-1c8b-058b3f45ebbe
00010000-568a-6cac-1276-a8b409afe3f7	00020000-568a-6caa-9b58-0afef72c072c
00010000-568a-6cac-f5bf-0072d9602cfa	00020000-568a-6caa-9843-be3801b78a80
\.


--
-- TOC entry 3155 (class 0 OID 34210209)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 34210147)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 34210093)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-568a-6cac-6b62-20baea9844e7	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-568a-6cac-c0e2-7e48c8871500	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-568a-6cac-ca7d-9b19ad77a879	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3106 (class 0 OID 34209716)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-568a-6ca9-9f29-e9ff2d30f815	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-568a-6ca9-e70b-e5e1d35434f6	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-568a-6ca9-2d73-e162fe9388b7	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-568a-6ca9-de9d-01348932f253	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-568a-6ca9-fe00-f3a50db61262	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3105 (class 0 OID 34209708)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-568a-6ca9-69f5-cf110e096495	00230000-568a-6ca9-de9d-01348932f253	popa
00240000-568a-6ca9-59ee-753575abc5ba	00230000-568a-6ca9-de9d-01348932f253	oseba
00240000-568a-6ca9-23cd-6643aa0ea629	00230000-568a-6ca9-de9d-01348932f253	tippopa
00240000-568a-6ca9-5cce-29adbc271e38	00230000-568a-6ca9-de9d-01348932f253	organizacijskaenota
00240000-568a-6ca9-aae6-c4f38f0aec8e	00230000-568a-6ca9-de9d-01348932f253	sezona
00240000-568a-6ca9-9bda-c43a611def34	00230000-568a-6ca9-de9d-01348932f253	tipvaje
00240000-568a-6ca9-5a80-a2be488602a5	00230000-568a-6ca9-e70b-e5e1d35434f6	prostor
00240000-568a-6ca9-fb54-ea6bfa7f85a9	00230000-568a-6ca9-de9d-01348932f253	besedilo
00240000-568a-6ca9-3f22-c282571b631c	00230000-568a-6ca9-de9d-01348932f253	uprizoritev
00240000-568a-6ca9-8113-c35b45cba155	00230000-568a-6ca9-de9d-01348932f253	funkcija
00240000-568a-6ca9-8134-6ec155530231	00230000-568a-6ca9-de9d-01348932f253	tipfunkcije
00240000-568a-6ca9-b813-ad49c2c35501	00230000-568a-6ca9-de9d-01348932f253	alternacija
00240000-568a-6ca9-e697-446a4c9eb277	00230000-568a-6ca9-9f29-e9ff2d30f815	pogodba
00240000-568a-6ca9-4eca-689b3d84f4a7	00230000-568a-6ca9-de9d-01348932f253	zaposlitev
00240000-568a-6ca9-5eaf-ef47d3b54da8	00230000-568a-6ca9-de9d-01348932f253	zvrstuprizoritve
00240000-568a-6ca9-321c-d17441c6fd48	00230000-568a-6ca9-9f29-e9ff2d30f815	programdela
00240000-568a-6ca9-2d9e-bd7d4c9ad015	00230000-568a-6ca9-de9d-01348932f253	zapis
\.


--
-- TOC entry 3104 (class 0 OID 34209703)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
d635123f-7d80-4a5b-9c97-0594ad6d47fc	00240000-568a-6ca9-69f5-cf110e096495	0	1001
\.


--
-- TOC entry 3161 (class 0 OID 34210271)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-568a-6cad-4e60-fa43b43f57cd	000e0000-568a-6cac-ff46-75596b8271ad	00080000-568a-6cac-9d23-54c27288c9bf	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-568a-6ca9-2590-9de785dee1ad
00270000-568a-6cad-7bb1-dc047fd87136	000e0000-568a-6cac-ff46-75596b8271ad	00080000-568a-6cac-9d23-54c27288c9bf	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-568a-6ca9-2590-9de785dee1ad
\.


--
-- TOC entry 3120 (class 0 OID 34209851)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 34210103)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-568a-6cad-7384-a2658b635b68	00180000-568a-6cad-50cf-9963b7177ed9	000c0000-568a-6cad-cea1-acc055c26fc3	00090000-568a-6cac-58bd-d1523363b4b2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-568a-6cad-82ad-681c8c4f857e	00180000-568a-6cad-50cf-9963b7177ed9	000c0000-568a-6cad-49f1-710a99bb517c	00090000-568a-6cac-301a-48c52c29812b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-568a-6cad-4362-13d14c7ab935	00180000-568a-6cad-50cf-9963b7177ed9	000c0000-568a-6cad-2163-d569236e62a2	00090000-568a-6cac-938b-1d6c69fb5a1b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-568a-6cad-6bbe-db61644ea0e4	00180000-568a-6cad-50cf-9963b7177ed9	000c0000-568a-6cad-dd96-0ff7681136b2	00090000-568a-6cac-b13c-7afd7df43ce8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-568a-6cad-d985-be1c6e7f29b0	00180000-568a-6cad-50cf-9963b7177ed9	000c0000-568a-6cad-0d8b-88237ee1bdb9	00090000-568a-6cac-2cee-ccdb944f9335	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-568a-6cad-4fd8-2a61b7492664	00180000-568a-6cad-a693-f4c2ee9f99a2	\N	00090000-568a-6cac-2cee-ccdb944f9335	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-568a-6cad-f936-b12001adc438	00180000-568a-6cad-a693-f4c2ee9f99a2	\N	00090000-568a-6cac-301a-48c52c29812b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3164 (class 0 OID 34210312)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-568a-6ca9-d6e3-fde00033f142	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-568a-6ca9-1f26-de9e15dd37ab	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-568a-6ca9-9160-1aa850ecd996	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-568a-6ca9-6e0c-60d6c1a9522b	04	Režija	Režija	Režija	umetnik	30
000f0000-568a-6ca9-a568-f376eb9a816e	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-568a-6ca9-9da3-a126c36453aa	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-568a-6ca9-3db2-e55ed6ebc89a	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-568a-6ca9-1f12-e81bec33fbe3	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-568a-6ca9-fff8-7335ffaac51b	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-568a-6ca9-af06-da9f797ba19b	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-568a-6ca9-1475-1a5eee14c9be	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-568a-6ca9-0cb4-b4b77a435c53	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-568a-6ca9-e4cd-2bfac6849c07	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-568a-6ca9-0b63-283ca2ca05c0	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-568a-6ca9-75bc-718db009d1ff	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-568a-6ca9-7e22-07127910e7e9	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-568a-6ca9-0db4-53bdc84be5eb	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-568a-6ca9-0cea-0b2c9ffb3290	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3117 (class 0 OID 34209802)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-568a-6cac-c3f6-a86001e2aa82	0001	šola	osnovna ali srednja šola
00400000-568a-6cac-f2b5-c55b05225fb6	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-568a-6cac-6c16-650efa88c9f4	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3177 (class 0 OID 34210617)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-568a-6ca8-d8e1-7d9629929ba0	01	Velika predstava	f	1.00	1.00
002b0000-568a-6ca8-7727-bd439bf3246f	02	Mala predstava	f	0.50	0.50
002b0000-568a-6ca8-4201-9e5707b81c11	03	Mala koprodukcija	t	0.40	1.00
002b0000-568a-6ca8-927e-ac0966d866a3	04	Srednja koprodukcija	t	0.70	2.00
002b0000-568a-6ca8-0f8b-b0944c98a071	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3140 (class 0 OID 34210083)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-568a-6ca8-b1ae-171135c77fd9	0001	prva vaja	prva vaja
00420000-568a-6ca8-2d5a-c39ab8ade5c8	0002	tehnična vaja	tehnična vaja
00420000-568a-6ca8-06a5-37d2e6df339c	0003	lučna vaja	lučna vaja
00420000-568a-6ca8-8a49-313492ef14f0	0004	kostumska vaja	kostumska vaja
00420000-568a-6ca8-7671-ed6a521619cd	0005	foto vaja	foto vaja
00420000-568a-6ca8-3ea9-d1291c10de1c	0006	1. glavna vaja	1. glavna vaja
00420000-568a-6ca8-c3ee-33742136521f	0007	2. glavna vaja	2. glavna vaja
00420000-568a-6ca8-905f-c50636d5c697	0008	1. generalka	1. generalka
00420000-568a-6ca8-cbe7-bbc2f5fb55c4	0009	2. generalka	2. generalka
00420000-568a-6ca8-601b-35275195f5d1	0010	odprta generalka	odprta generalka
00420000-568a-6ca8-6641-a0683e875b88	0011	obnovitvena vaja	obnovitvena vaja
00420000-568a-6ca8-8c31-f31e2230239b	0012	italijanka	krajša "obnovitvena" vaja
00420000-568a-6ca8-288f-146df62325b8	0013	pevska vaja	pevska vaja
00420000-568a-6ca8-3198-f2a4bdc0b252	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-568a-6ca8-95e5-d8652c0cdf2c	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3126 (class 0 OID 34209924)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3109 (class 0 OID 34209738)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-568a-6caa-27ca-72452575bc77	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRObGYA/UokXtESKcQT/YJFGH5xTmZRspG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-568a-6cac-b06e-ee45dc62bf35	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-568a-6cac-cd68-2643baa82362	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-568a-6cac-9485-4c0fa62ece6c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-568a-6cac-c489-9688137083bd	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-568a-6cac-bf10-17eda95de849	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-568a-6cac-62d8-82d9208985bc	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-568a-6cac-eda6-e1032190d746	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-568a-6cac-da81-d14e5d9b6eb5	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-568a-6cac-f805-152a3b82416e	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-568a-6cac-de65-484e85282465	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-568a-6cac-8b38-9dc20c2b2fd9	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-568a-6cac-276c-34b745850b97	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-568a-6cac-906b-da5373f638d5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-568a-6cac-15b2-e58a0518e79b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-568a-6cac-9f95-80fce9b94187	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-568a-6cac-0eaa-f222a08d0d1f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-568a-6cac-26e0-f7582d8b3b56	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-568a-6cac-8dc2-79b1ad955dc5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-568a-6cac-bc82-a7f137d55469	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-568a-6cac-a5f4-ec26686ecdee	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-568a-6cac-a8f0-19c73c285421	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-568a-6cac-8e50-09a9832157d8	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-568a-6cac-d6b9-1607ec11884d	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-568a-6cac-96fe-2386bbc796b8	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-568a-6cac-1276-a8b409afe3f7	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-568a-6cac-f5bf-0072d9602cfa	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-568a-6caa-d88b-e6ad3c3cca68	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3168 (class 0 OID 34210362)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-568a-6cac-ef8c-a7ed06ce6182	00160000-568a-6cac-59d6-3e6f89898720	\N	00140000-568a-6ca9-8994-c466e15c2143	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-568a-6cac-2a26-075320a6683b
000e0000-568a-6cac-ff46-75596b8271ad	00160000-568a-6cac-77f9-9f40dd5f7fbf	\N	00140000-568a-6ca9-52c6-36f35c791056	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-568a-6cac-d5f1-18a60f6e1644
000e0000-568a-6cac-dc1f-ee6afeeed813	\N	\N	00140000-568a-6ca9-52c6-36f35c791056	00190000-568a-6cac-0e68-74ca5c297df2	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-568a-6cac-2a26-075320a6683b
000e0000-568a-6cac-f625-e5cec0828567	\N	\N	00140000-568a-6ca9-52c6-36f35c791056	00190000-568a-6cac-0e68-74ca5c297df2	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-568a-6cac-2a26-075320a6683b
000e0000-568a-6cac-2b06-93d977c1e6c1	\N	\N	00140000-568a-6ca9-52c6-36f35c791056	00190000-568a-6cac-0e68-74ca5c297df2	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-6cac-4500-8d5242e8f669
000e0000-568a-6cac-b4f0-caf4acfdcd44	\N	\N	00140000-568a-6ca9-52c6-36f35c791056	00190000-568a-6cac-0e68-74ca5c297df2	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-6cac-4500-8d5242e8f669
000e0000-568a-6cac-b59f-acd088f31b8e	\N	\N	00140000-568a-6ca9-405d-4b559f0440bf	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-6cac-4500-8d5242e8f669
000e0000-568a-6cac-e28d-85774f1dc42f	\N	\N	00140000-568a-6ca9-405d-4b559f0440bf	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-6cac-4500-8d5242e8f669
000e0000-568a-6cac-8972-f8357b2c15e8	\N	\N	00140000-568a-6ca9-405d-4b559f0440bf	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-6cac-4500-8d5242e8f669
000e0000-568a-6cac-b751-f45b35f20395	\N	\N	00140000-568a-6ca9-405d-4b559f0440bf	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-6cac-4500-8d5242e8f669
000e0000-568a-6cac-f6b8-73bd00c6638b	\N	\N	00140000-568a-6ca9-405d-4b559f0440bf	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-6cac-4500-8d5242e8f669
000e0000-568a-6cac-63e8-c3d60c49665c	\N	\N	00140000-568a-6ca9-405d-4b559f0440bf	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-6cac-4500-8d5242e8f669
000e0000-568a-6cac-307a-8744757d07cf	\N	\N	00140000-568a-6ca9-405d-4b559f0440bf	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-6cac-4500-8d5242e8f669
000e0000-568a-6cac-14b0-ff338bb41b84	\N	\N	00140000-568a-6ca9-405d-4b559f0440bf	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-6cac-4500-8d5242e8f669
000e0000-568a-6cac-473e-0294a86ac8a0	\N	\N	00140000-568a-6ca9-405d-4b559f0440bf	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-6cac-4500-8d5242e8f669
\.


--
-- TOC entry 3134 (class 0 OID 34210023)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-568a-6cac-6b00-30ae2641864e	\N	000e0000-568a-6cac-ff46-75596b8271ad	1	
00200000-568a-6cac-3509-5bb9ccb156ae	\N	000e0000-568a-6cac-ff46-75596b8271ad	2	
00200000-568a-6cac-a14d-d8d298c63ffa	\N	000e0000-568a-6cac-ff46-75596b8271ad	3	
00200000-568a-6cac-7a89-d9354c144024	\N	000e0000-568a-6cac-ff46-75596b8271ad	4	
00200000-568a-6cac-0796-7ec475706f97	\N	000e0000-568a-6cac-ff46-75596b8271ad	5	
\.


--
-- TOC entry 3151 (class 0 OID 34210174)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 34210285)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-568a-6ca9-4652-841a6791f0ab	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-568a-6ca9-532c-9971afb60af3	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-568a-6ca9-ba84-dd4188b2b3bc	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-568a-6ca9-fe4b-903f7b3759e7	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-568a-6ca9-2ce7-bcdd77ef97ff	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-568a-6ca9-a123-bec538b0bf22	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-568a-6ca9-d34a-13e978865fb0	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-568a-6ca9-5092-201571b78be6	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-568a-6ca9-2590-9de785dee1ad	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-568a-6ca9-594e-2bc9f47fe129	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-568a-6ca9-aea5-6d2a7d49ecd3	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-568a-6ca9-4294-351b21b7c0e9	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-568a-6ca9-5af4-73551b3e8b45	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-568a-6ca9-190c-4ac9f44b6251	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-568a-6ca9-e8d0-401534380bf2	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-568a-6ca9-be62-a4320ba0b5b9	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-568a-6ca9-5c0d-d22d536206fb	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-568a-6ca9-2145-a8fe193e2e2a	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-568a-6ca9-93ce-5ff7bffc8eb4	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-568a-6ca9-4130-4e2c8f92ccae	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-568a-6ca9-7c74-eb06816cf19b	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-568a-6ca9-b47c-e987456154bc	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-568a-6ca9-a818-44839c5763fa	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-568a-6ca9-3a76-3aedf2b291b4	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-568a-6ca9-5e25-037bb87951e0	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-568a-6ca9-3273-3813a51bee79	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-568a-6ca9-48da-ad6aa16a8b57	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-568a-6ca9-ab99-d9c4315728df	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3180 (class 0 OID 34210667)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 34210636)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 34210679)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 34210247)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-568a-6cac-b5a7-9e3e3be38a6a	00090000-568a-6cac-301a-48c52c29812b	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-568a-6cac-b5f8-a5a9ffbae394	00090000-568a-6cac-938b-1d6c69fb5a1b	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-568a-6cac-c9be-5e56b24babf0	00090000-568a-6cac-e871-fffd577d9aa7	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-568a-6cac-8543-d66b9a1ee2d4	00090000-568a-6cac-d7e5-8192fa73dfb4	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-568a-6cac-7ccc-6484c615de28	00090000-568a-6cac-b7fe-9f735454f4dc	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-568a-6cac-ccec-e15db7b26f50	00090000-568a-6cac-c565-f551daf8f43f	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3137 (class 0 OID 34210067)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 34210352)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-568a-6ca9-8994-c466e15c2143	01	Drama	drama (SURS 01)
00140000-568a-6ca9-0aa7-741610da2204	02	Opera	opera (SURS 02)
00140000-568a-6ca9-3841-ab33b587b14c	03	Balet	balet (SURS 03)
00140000-568a-6ca9-a1df-22864012bcbc	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-568a-6ca9-405d-4b559f0440bf	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-568a-6ca9-52c6-36f35c791056	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-568a-6ca9-f1df-a39105f03e8d	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3157 (class 0 OID 34210237)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2599 (class 2606 OID 34209801)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 34210411)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 34210401)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 34209792)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 34210268)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 34210310)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 34210720)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 34210055)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 34210077)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 34210082)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 34210634)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 34209950)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2825 (class 2606 OID 34210480)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 34210233)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 34210021)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 34209988)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 34209964)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 34210139)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 34210697)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2873 (class 2606 OID 34210704)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2880 (class 2606 OID 34210728)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 33138688)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2737 (class 2606 OID 34210166)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 34209922)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 34209820)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 34209884)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 34209847)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 34209781)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2588 (class 2606 OID 34209766)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 34210172)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 34210208)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 34210347)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 34209875)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 34209910)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 34210585)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 34210145)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 34209900)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 34210040)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 34210009)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2666 (class 2606 OID 34210001)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 34210157)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 34210594)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 34210602)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 34210572)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 34210615)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 34210190)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 34210130)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 34210121)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 34210334)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 34210261)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 34209976)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 34209737)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 34210199)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 34209755)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2590 (class 2606 OID 34209775)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 34210217)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 34210152)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 34210101)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 34209725)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 34209713)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 34209707)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 34210281)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 34209856)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 34210112)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 34210321)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 34209809)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 34210627)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 34210090)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 34209935)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 34209750)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 34210380)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 34210030)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 34210180)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 34210293)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 34210677)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2859 (class 2606 OID 34210661)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 34210685)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 34210251)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 34210071)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 34210360)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 34210245)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 1259 OID 34210065)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2683 (class 1259 OID 34210066)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2684 (class 1259 OID 34210064)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2685 (class 1259 OID 34210063)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2686 (class 1259 OID 34210062)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2780 (class 1259 OID 34210282)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2781 (class 1259 OID 34210283)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2782 (class 1259 OID 34210284)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2866 (class 1259 OID 34210699)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2867 (class 1259 OID 34210698)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2617 (class 1259 OID 34209877)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2618 (class 1259 OID 34209878)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2738 (class 1259 OID 34210173)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2853 (class 1259 OID 34210665)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2854 (class 1259 OID 34210664)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2855 (class 1259 OID 34210666)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2856 (class 1259 OID 34210663)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2857 (class 1259 OID 34210662)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2732 (class 1259 OID 34210159)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2733 (class 1259 OID 34210158)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2674 (class 1259 OID 34210031)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2675 (class 1259 OID 34210032)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2762 (class 1259 OID 34210234)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2763 (class 1259 OID 34210236)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2764 (class 1259 OID 34210235)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2649 (class 1259 OID 34209966)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2650 (class 1259 OID 34209965)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2844 (class 1259 OID 34210616)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2796 (class 1259 OID 34210349)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2797 (class 1259 OID 34210350)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2798 (class 1259 OID 34210351)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2863 (class 1259 OID 34210686)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2805 (class 1259 OID 34210385)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2806 (class 1259 OID 34210382)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2807 (class 1259 OID 34210386)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2808 (class 1259 OID 34210384)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2809 (class 1259 OID 34210383)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2639 (class 1259 OID 34209937)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2640 (class 1259 OID 34209936)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2608 (class 1259 OID 34209850)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2750 (class 1259 OID 34210200)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2592 (class 1259 OID 34209782)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2593 (class 1259 OID 34209783)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2755 (class 1259 OID 34210220)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2756 (class 1259 OID 34210219)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2757 (class 1259 OID 34210218)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2622 (class 1259 OID 34209887)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2623 (class 1259 OID 34209886)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2624 (class 1259 OID 34209888)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2662 (class 1259 OID 34210004)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2663 (class 1259 OID 34210002)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2664 (class 1259 OID 34210003)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2572 (class 1259 OID 34209715)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2712 (class 1259 OID 34210125)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2713 (class 1259 OID 34210123)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2714 (class 1259 OID 34210122)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2715 (class 1259 OID 34210124)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2583 (class 1259 OID 34209756)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2584 (class 1259 OID 34209757)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2741 (class 1259 OID 34210181)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2876 (class 1259 OID 34210721)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2778 (class 1259 OID 34210270)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2779 (class 1259 OID 34210269)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2877 (class 1259 OID 34210729)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2878 (class 1259 OID 34210730)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2727 (class 1259 OID 34210146)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2772 (class 1259 OID 34210262)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2773 (class 1259 OID 34210263)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2826 (class 1259 OID 34210485)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2827 (class 1259 OID 34210484)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2828 (class 1259 OID 34210481)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2829 (class 1259 OID 34210482)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2830 (class 1259 OID 34210483)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2628 (class 1259 OID 34209902)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 34209901)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2630 (class 1259 OID 34209903)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2744 (class 1259 OID 34210194)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2745 (class 1259 OID 34210193)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2836 (class 1259 OID 34210595)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2837 (class 1259 OID 34210596)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2819 (class 1259 OID 34210415)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2820 (class 1259 OID 34210416)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2821 (class 1259 OID 34210413)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2822 (class 1259 OID 34210414)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2768 (class 1259 OID 34210252)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2769 (class 1259 OID 34210253)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2718 (class 1259 OID 34210134)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2719 (class 1259 OID 34210133)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2720 (class 1259 OID 34210131)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2721 (class 1259 OID 34210132)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2815 (class 1259 OID 34210403)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2816 (class 1259 OID 34210402)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2653 (class 1259 OID 34209977)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2656 (class 1259 OID 34209991)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2657 (class 1259 OID 34209990)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2658 (class 1259 OID 34209989)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2659 (class 1259 OID 34209992)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2673 (class 1259 OID 34210022)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2667 (class 1259 OID 34210010)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2668 (class 1259 OID 34210011)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2833 (class 1259 OID 34210586)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2852 (class 1259 OID 34210635)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2870 (class 1259 OID 34210705)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2871 (class 1259 OID 34210706)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2604 (class 1259 OID 34209822)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2605 (class 1259 OID 34209821)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2613 (class 1259 OID 34209857)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2614 (class 1259 OID 34209858)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2693 (class 1259 OID 34210072)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2707 (class 1259 OID 34210115)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2708 (class 1259 OID 34210114)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2709 (class 1259 OID 34210113)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2687 (class 1259 OID 34210057)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2688 (class 1259 OID 34210058)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2689 (class 1259 OID 34210061)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2690 (class 1259 OID 34210056)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2691 (class 1259 OID 34210060)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2692 (class 1259 OID 34210059)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2621 (class 1259 OID 34209876)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2602 (class 1259 OID 34209810)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 34209811)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2645 (class 1259 OID 34209951)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 34209953)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2647 (class 1259 OID 34209952)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2648 (class 1259 OID 34209954)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2726 (class 1259 OID 34210140)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2801 (class 1259 OID 34210348)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2810 (class 1259 OID 34210381)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2792 (class 1259 OID 34210322)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2793 (class 1259 OID 34210323)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2611 (class 1259 OID 34209848)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2612 (class 1259 OID 34209849)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2765 (class 1259 OID 34210246)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2578 (class 1259 OID 34209726)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 34209923)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2627 (class 1259 OID 34209885)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2575 (class 1259 OID 34209714)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2849 (class 1259 OID 34210628)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2748 (class 1259 OID 34210192)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2749 (class 1259 OID 34210191)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2702 (class 1259 OID 34210091)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2703 (class 1259 OID 34210092)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2823 (class 1259 OID 34210412)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 34209911)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2802 (class 1259 OID 34210361)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2860 (class 1259 OID 34210678)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2842 (class 1259 OID 34210603)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2843 (class 1259 OID 34210604)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 34210311)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2706 (class 1259 OID 34210102)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 34209776)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2920 (class 2606 OID 34210901)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2919 (class 2606 OID 34210906)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2914 (class 2606 OID 34210931)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2916 (class 2606 OID 34210921)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2921 (class 2606 OID 34210896)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2917 (class 2606 OID 34210916)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2915 (class 2606 OID 34210926)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2918 (class 2606 OID 34210911)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2957 (class 2606 OID 34211101)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2956 (class 2606 OID 34211106)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2955 (class 2606 OID 34211111)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2989 (class 2606 OID 34211276)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2990 (class 2606 OID 34211271)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2893 (class 2606 OID 34210786)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2892 (class 2606 OID 34210791)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2938 (class 2606 OID 34211016)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2984 (class 2606 OID 34211256)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2985 (class 2606 OID 34211251)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2983 (class 2606 OID 34211261)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2986 (class 2606 OID 34211246)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2987 (class 2606 OID 34211241)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2936 (class 2606 OID 34211011)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2937 (class 2606 OID 34211006)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2913 (class 2606 OID 34210886)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2912 (class 2606 OID 34210891)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 34211056)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2946 (class 2606 OID 34211066)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2947 (class 2606 OID 34211061)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2902 (class 2606 OID 34210841)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2903 (class 2606 OID 34210836)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2934 (class 2606 OID 34210996)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2981 (class 2606 OID 34211231)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2960 (class 2606 OID 34211116)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2959 (class 2606 OID 34211121)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2958 (class 2606 OID 34211126)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2988 (class 2606 OID 34211266)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2962 (class 2606 OID 34211146)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2965 (class 2606 OID 34211131)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2961 (class 2606 OID 34211151)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2963 (class 2606 OID 34211141)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2964 (class 2606 OID 34211136)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2900 (class 2606 OID 34210831)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 34210826)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 34210771)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2889 (class 2606 OID 34210766)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2942 (class 2606 OID 34211036)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2885 (class 2606 OID 34210746)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2884 (class 2606 OID 34210751)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2943 (class 2606 OID 34211051)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2944 (class 2606 OID 34211046)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2945 (class 2606 OID 34211041)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2895 (class 2606 OID 34210801)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2896 (class 2606 OID 34210796)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2894 (class 2606 OID 34210806)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2906 (class 2606 OID 34210866)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2908 (class 2606 OID 34210856)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2907 (class 2606 OID 34210861)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2881 (class 2606 OID 34210731)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2926 (class 2606 OID 34210971)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2928 (class 2606 OID 34210961)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2929 (class 2606 OID 34210956)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2927 (class 2606 OID 34210966)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2883 (class 2606 OID 34210736)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2882 (class 2606 OID 34210741)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2939 (class 2606 OID 34211021)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2993 (class 2606 OID 34211291)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2953 (class 2606 OID 34211096)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2954 (class 2606 OID 34211091)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2995 (class 2606 OID 34211296)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2994 (class 2606 OID 34211301)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2935 (class 2606 OID 34211001)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2952 (class 2606 OID 34211081)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2951 (class 2606 OID 34211086)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2972 (class 2606 OID 34211206)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2973 (class 2606 OID 34211201)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2976 (class 2606 OID 34211186)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2975 (class 2606 OID 34211191)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2974 (class 2606 OID 34211196)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2898 (class 2606 OID 34210816)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 34210811)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2897 (class 2606 OID 34210821)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 34211031)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2941 (class 2606 OID 34211026)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2979 (class 2606 OID 34211216)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2978 (class 2606 OID 34211221)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2969 (class 2606 OID 34211176)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2968 (class 2606 OID 34211181)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2971 (class 2606 OID 34211166)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2970 (class 2606 OID 34211171)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2950 (class 2606 OID 34211071)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2949 (class 2606 OID 34211076)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2930 (class 2606 OID 34210991)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2931 (class 2606 OID 34210986)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2933 (class 2606 OID 34210976)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2932 (class 2606 OID 34210981)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2966 (class 2606 OID 34211161)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2967 (class 2606 OID 34211156)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2904 (class 2606 OID 34210846)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2905 (class 2606 OID 34210851)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2911 (class 2606 OID 34210881)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2910 (class 2606 OID 34210871)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2909 (class 2606 OID 34210876)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2977 (class 2606 OID 34211211)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2980 (class 2606 OID 34211226)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2982 (class 2606 OID 34211236)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2992 (class 2606 OID 34211281)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2991 (class 2606 OID 34211286)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2886 (class 2606 OID 34210761)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2887 (class 2606 OID 34210756)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2891 (class 2606 OID 34210776)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 34210781)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2922 (class 2606 OID 34210936)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2923 (class 2606 OID 34210951)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2924 (class 2606 OID 34210946)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2925 (class 2606 OID 34210941)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-04 13:59:28 CET

--
-- PostgreSQL database dump complete
--

