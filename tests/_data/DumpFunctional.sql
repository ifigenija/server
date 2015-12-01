--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-01 16:40:26 CET

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
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 30246405)
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
-- TOC entry 237 (class 1259 OID 30247019)
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
-- TOC entry 236 (class 1259 OID 30247002)
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
-- TOC entry 182 (class 1259 OID 30246398)
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
-- TOC entry 181 (class 1259 OID 30246396)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 30246879)
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
-- TOC entry 230 (class 1259 OID 30246909)
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
-- TOC entry 251 (class 1259 OID 30247312)
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
-- TOC entry 203 (class 1259 OID 30246653)
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
-- TOC entry 205 (class 1259 OID 30246685)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 30246690)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 30247234)
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
-- TOC entry 194 (class 1259 OID 30246550)
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
-- TOC entry 238 (class 1259 OID 30247032)
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
-- TOC entry 223 (class 1259 OID 30246833)
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
-- TOC entry 200 (class 1259 OID 30246624)
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
-- TOC entry 197 (class 1259 OID 30246590)
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
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 30246567)
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
-- TOC entry 212 (class 1259 OID 30246747)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 30247292)
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
-- TOC entry 250 (class 1259 OID 30247305)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 30247327)
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
-- TOC entry 170 (class 1259 OID 25231831)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 30246772)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 30246524)
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
-- TOC entry 185 (class 1259 OID 30246424)
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
-- TOC entry 189 (class 1259 OID 30246491)
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
-- TOC entry 186 (class 1259 OID 30246435)
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
-- TOC entry 178 (class 1259 OID 30246370)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 30246389)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 30246779)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 30246813)
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
-- TOC entry 233 (class 1259 OID 30246950)
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
-- TOC entry 188 (class 1259 OID 30246471)
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
-- TOC entry 191 (class 1259 OID 30246516)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 30247178)
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
-- TOC entry 213 (class 1259 OID 30246753)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 30246501)
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
-- TOC entry 202 (class 1259 OID 30246645)
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
-- TOC entry 198 (class 1259 OID 30246605)
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
-- TOC entry 199 (class 1259 OID 30246617)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 30246765)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 30247192)
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
-- TOC entry 242 (class 1259 OID 30247202)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 30247101)
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
    stizvponpremgost numeric(15,2) DEFAULT 0::numeric,
    stizvponpremkopr integer,
    stizvponpremint integer,
    stizvponpremkoprint integer,
    stizvponprej numeric(15,2) DEFAULT 0::numeric,
    stizvponprejdoma integer,
    stizvponprejzamejo numeric(15,2) DEFAULT 0::numeric,
    stizvponprejgost numeric(15,2) DEFAULT 0::numeric,
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
    stobiskponpremkopr integer,
    stobiskponpremkoprint integer,
    stobiskponpremgost integer,
    stobiskponpremzamejo integer,
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
-- TOC entry 243 (class 1259 OID 30247210)
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
-- TOC entry 219 (class 1259 OID 30246794)
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
-- TOC entry 211 (class 1259 OID 30246738)
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
-- TOC entry 210 (class 1259 OID 30246728)
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
-- TOC entry 232 (class 1259 OID 30246939)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 30246869)
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
-- TOC entry 196 (class 1259 OID 30246579)
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
-- TOC entry 175 (class 1259 OID 30246341)
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
-- TOC entry 174 (class 1259 OID 30246339)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 30246807)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 30246379)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 30246363)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 30246821)
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
-- TOC entry 214 (class 1259 OID 30246759)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 30246705)
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
-- TOC entry 173 (class 1259 OID 30246328)
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
-- TOC entry 172 (class 1259 OID 30246320)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 30246315)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 30246886)
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
-- TOC entry 187 (class 1259 OID 30246463)
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
-- TOC entry 209 (class 1259 OID 30246715)
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
-- TOC entry 231 (class 1259 OID 30246927)
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
-- TOC entry 184 (class 1259 OID 30246414)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 30247222)
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
-- TOC entry 207 (class 1259 OID 30246695)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 30246536)
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
-- TOC entry 176 (class 1259 OID 30246350)
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
-- TOC entry 235 (class 1259 OID 30246977)
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
-- TOC entry 201 (class 1259 OID 30246635)
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
-- TOC entry 218 (class 1259 OID 30246786)
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
-- TOC entry 229 (class 1259 OID 30246900)
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
-- TOC entry 247 (class 1259 OID 30247272)
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
-- TOC entry 246 (class 1259 OID 30247241)
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
-- TOC entry 248 (class 1259 OID 30247284)
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
-- TOC entry 225 (class 1259 OID 30246858)
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
    tip integer,
    delovnaobveza integer,
    malica character varying(255) DEFAULT NULL::character varying,
    izmenskodelo boolean,
    individualnapogodba boolean,
    jezaposlenvdrugemjz boolean,
    jenastopajoci boolean,
    organizacijskaenota_id uuid
);


--
-- TOC entry 204 (class 1259 OID 30246679)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 30246967)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 30246848)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 30246401)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 30246344)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3107 (class 0 OID 30246405)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-565d-bf67-87c8-17f94ee432a1	10	30	Otroci	Abonma za otroke	200
000a0000-565d-bf67-5ee7-91d1c00490df	20	60	Mladina	Abonma za mladino	400
000a0000-565d-bf67-ec62-05b238b514a0	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3161 (class 0 OID 30247019)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-565d-bf67-2459-d27b9498440b	000d0000-565d-bf67-82ea-1b3136687279	\N	00090000-565d-bf67-41e4-7fcbc17ba4a7	000b0000-565d-bf67-ebf9-e6c05aacc749	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-565d-bf67-25ad-f4f6485a513a	000d0000-565d-bf67-0381-0abe3c4e645b	00100000-565d-bf67-6abd-03b2f1c1bc2f	00090000-565d-bf67-3a6e-731c243ea618	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-565d-bf67-d07c-52dfb39da442	000d0000-565d-bf67-4b35-d6f4cb6b0518	00100000-565d-bf67-1515-c90ba8460994	00090000-565d-bf67-781d-ff356e70182b	\N	0003	t	\N	2015-12-01	\N	2	t	\N	f	f
000c0000-565d-bf67-33d8-5965f41ac11e	000d0000-565d-bf67-f94c-f876ac63eebc	\N	00090000-565d-bf67-2a20-38aecddc8699	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-565d-bf67-3b6a-f3af1541184c	000d0000-565d-bf67-9fbc-2acc732ebfec	\N	00090000-565d-bf67-1d1f-33cdd11bbfad	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-565d-bf67-338a-586e5b5c1368	000d0000-565d-bf67-e988-03fc8731d969	\N	00090000-565d-bf67-6fa6-29c17c3205e9	000b0000-565d-bf67-8bb9-95e8cb408ade	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-565d-bf67-2005-21824be82ba3	000d0000-565d-bf67-d6f0-53b93451a99a	00100000-565d-bf67-ce90-b5419e2799fb	00090000-565d-bf67-585e-ca0c4502fea1	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-565d-bf67-b653-58ccb6a7da14	000d0000-565d-bf67-37b2-e99d04aed108	\N	00090000-565d-bf67-fd0a-8cfc5c1555ff	000b0000-565d-bf67-3241-ee6884fb3213	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-565d-bf67-0207-a5f26ff2efb1	000d0000-565d-bf67-d6f0-53b93451a99a	00100000-565d-bf67-25e0-c975c0757833	00090000-565d-bf67-8305-f45cf4e4225e	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-565d-bf67-5497-a4b2f3d56c37	000d0000-565d-bf67-d6f0-53b93451a99a	00100000-565d-bf67-511a-1d5370a8c715	00090000-565d-bf67-c840-759a533cfcbc	\N	0010	t	\N	2015-12-01	\N	16	f	\N	f	t
000c0000-565d-bf67-57f2-a462a070e289	000d0000-565d-bf67-d6f0-53b93451a99a	00100000-565d-bf67-3871-aeba49ad5385	00090000-565d-bf67-6cad-1f193a55b458	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-565d-bf67-9bc2-5de6e1bab124	000d0000-565d-bf67-0f74-1dfabc226a09	00100000-565d-bf67-6abd-03b2f1c1bc2f	00090000-565d-bf67-3a6e-731c243ea618	000b0000-565d-bf67-1f28-faa7ee404c3e	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3160 (class 0 OID 30247002)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 30246398)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3151 (class 0 OID 30246879)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-565d-bf67-1884-5cd384f4e8d8	00160000-565d-bf67-0caa-52899fd0e9f7	00090000-565d-bf67-f265-ae91cd13e9d7	aizv	10	t
003d0000-565d-bf67-d30e-370044523804	00160000-565d-bf67-0caa-52899fd0e9f7	00090000-565d-bf67-a2f9-771eaf5b1c41	apri	14	t
003d0000-565d-bf67-a425-f0cf6836402a	00160000-565d-bf67-1695-a8d808e6b63b	00090000-565d-bf67-a94b-4aa946b8df29	aizv	11	t
003d0000-565d-bf67-394c-5171a36d22b5	00160000-565d-bf67-64ce-5cb10ef10bc2	00090000-565d-bf67-12e8-75acd9dd42db	aizv	12	t
003d0000-565d-bf67-f891-fdc4c1eaeb57	00160000-565d-bf67-0caa-52899fd0e9f7	00090000-565d-bf67-ce15-a347d2dca27b	apri	18	f
\.


--
-- TOC entry 3154 (class 0 OID 30246909)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-565d-bf67-0caa-52899fd0e9f7	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-565d-bf67-1695-a8d808e6b63b	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-565d-bf67-64ce-5cb10ef10bc2	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3175 (class 0 OID 30247312)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 30246653)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-565d-bf67-a7b1-b1a0f86271f8	\N	\N	00200000-565d-bf67-6bb2-92587aaf319b	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-565d-bf67-a8ec-0c373b29adf2	\N	\N	00200000-565d-bf67-f811-d0b0f32ca1c5	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-565d-bf67-911c-857120c2af44	\N	\N	00200000-565d-bf67-9b85-53d40bacf93f	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-565d-bf67-1c87-71935eb6e7d0	\N	\N	00200000-565d-bf67-b489-411a1bd70109	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-565d-bf67-dc58-a0ef578cac2f	\N	\N	00200000-565d-bf67-2e88-4175ee981401	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3129 (class 0 OID 30246685)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 30246690)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 30247234)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 30246550)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-565d-bf64-2ab3-0b43eda395be	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-565d-bf64-7bad-96b717ff59e2	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-565d-bf64-c78d-d3e06c4cf10a	AL	ALB	008	Albania 	Albanija	\N
00040000-565d-bf64-5a89-d272a7012caa	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-565d-bf64-0bb7-adb981aeca29	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-565d-bf64-1c11-6cd76ce90386	AD	AND	020	Andorra 	Andora	\N
00040000-565d-bf64-cdc1-57eac02f487e	AO	AGO	024	Angola 	Angola	\N
00040000-565d-bf64-2b97-68b286a200a1	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-565d-bf64-2ac3-eead5be33540	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-565d-bf64-60b5-122c8c47c154	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-565d-bf64-d1c6-f3db45f7b90d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-565d-bf64-e79b-41e10f40ace1	AM	ARM	051	Armenia 	Armenija	\N
00040000-565d-bf64-5a21-7d42dce0566e	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-565d-bf64-c0b4-b8a0d5f6f028	AU	AUS	036	Australia 	Avstralija	\N
00040000-565d-bf64-88e0-b394f98afba9	AT	AUT	040	Austria 	Avstrija	\N
00040000-565d-bf64-dcdb-775b091508b3	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-565d-bf64-fa14-8dcc06d92b8d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-565d-bf64-31af-7df7c543be3d	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-565d-bf64-a2f6-99daf1355ed2	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-565d-bf64-169c-a833772233db	BB	BRB	052	Barbados 	Barbados	\N
00040000-565d-bf64-f4a0-b0ad2f78071e	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-565d-bf64-1528-7e254faf2702	BE	BEL	056	Belgium 	Belgija	\N
00040000-565d-bf64-e863-948041fa42f7	BZ	BLZ	084	Belize 	Belize	\N
00040000-565d-bf64-6d0f-8113638bf834	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-565d-bf64-ab74-3161a21cac4a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-565d-bf64-e792-6d78c2a0c2a4	BT	BTN	064	Bhutan 	Butan	\N
00040000-565d-bf64-18f4-aa8feb089714	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-565d-bf64-a9a5-67c5b9324488	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-565d-bf64-585c-1e27c6f3c1f6	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-565d-bf64-08e9-6ecc598f11de	BW	BWA	072	Botswana 	Bocvana	\N
00040000-565d-bf64-293e-297bebb63b6d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-565d-bf64-9a5f-0b5bf92805bf	BR	BRA	076	Brazil 	Brazilija	\N
00040000-565d-bf64-2052-e7f453d74436	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-565d-bf64-5409-f11c324ba285	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-565d-bf64-cf04-074465de1230	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-565d-bf64-a423-1843399522df	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-565d-bf64-60d5-85c1e2de3057	BI	BDI	108	Burundi 	Burundi 	\N
00040000-565d-bf64-59dc-f47d78e8a917	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-565d-bf64-1271-717b273a930d	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-565d-bf64-fa2c-c8e9f9495d9f	CA	CAN	124	Canada 	Kanada	\N
00040000-565d-bf64-2cef-7e0014592766	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-565d-bf64-afd0-704a8cf271ee	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-565d-bf64-bb1d-d1c438efc98b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-565d-bf64-9f5f-78151576aa30	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-565d-bf64-ae7c-8daad77f38d4	CL	CHL	152	Chile 	Čile	\N
00040000-565d-bf64-2644-15e40a036b90	CN	CHN	156	China 	Kitajska	\N
00040000-565d-bf64-5d79-779e0881c795	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-565d-bf64-1d2d-9efa9453e5f5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-565d-bf64-ec0b-23df3432db0d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-565d-bf64-206a-32966693a8e7	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-565d-bf64-c4c8-26403430c1f7	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-565d-bf64-9d29-55407626c8b7	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-565d-bf64-e202-c5747a6a190e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-565d-bf64-5b90-9a25cd482ef2	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-565d-bf64-c632-0eb499420a81	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-565d-bf64-977e-582108056548	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-565d-bf64-0cd3-a16884ac5312	CU	CUB	192	Cuba 	Kuba	\N
00040000-565d-bf64-f86c-ef923e7527c9	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-565d-bf64-341a-9a60faffd870	CY	CYP	196	Cyprus 	Ciper	\N
00040000-565d-bf64-99fc-2e65573bb289	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-565d-bf64-debf-a75474852673	DK	DNK	208	Denmark 	Danska	\N
00040000-565d-bf64-3c67-35554e3432a0	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-565d-bf64-5562-ac4c983f500d	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-565d-bf64-7c78-787f8c1009be	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-565d-bf64-d1dc-4df1b02baa40	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-565d-bf64-bc0f-c86c0644bde0	EG	EGY	818	Egypt 	Egipt	\N
00040000-565d-bf64-fc85-2cc9de5fcdef	SV	SLV	222	El Salvador 	Salvador	\N
00040000-565d-bf64-aaeb-ec84413b8c04	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-565d-bf64-62c7-2984750b3130	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-565d-bf64-ec8f-63326f2cd2f4	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-565d-bf64-7235-d952674d0927	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-565d-bf64-e9ed-99e8304e8464	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-565d-bf64-f3d5-6dd096c320a8	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-565d-bf64-c0c5-9bcf38f7cdd8	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-565d-bf64-df87-d8c531154e9e	FI	FIN	246	Finland 	Finska	\N
00040000-565d-bf64-5949-694b0345ea40	FR	FRA	250	France 	Francija	\N
00040000-565d-bf64-7be6-0749ed37743c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-565d-bf64-9ff1-6293ca24bcac	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-565d-bf64-8838-c47876e9cb97	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-565d-bf64-089a-0cb743626a7c	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-565d-bf64-0f7d-bfa4b309d786	GA	GAB	266	Gabon 	Gabon	\N
00040000-565d-bf64-3389-c95cb4142fc1	GM	GMB	270	Gambia 	Gambija	\N
00040000-565d-bf64-a4a6-71dc8608c55c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-565d-bf64-896a-51cf6a7eadc5	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-565d-bf64-b14c-aec715c5ab52	GH	GHA	288	Ghana 	Gana	\N
00040000-565d-bf64-b5a8-ef1f41579fd4	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-565d-bf64-c9b6-b40f1c4fa2ca	GR	GRC	300	Greece 	Grčija	\N
00040000-565d-bf64-ad28-2b6b7f28ff2a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-565d-bf64-b0bf-847a73163b37	GD	GRD	308	Grenada 	Grenada	\N
00040000-565d-bf64-bca9-1e4b296981b5	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-565d-bf64-e1a5-312d25da60ea	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-565d-bf64-27f9-e2f39dfa8a89	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-565d-bf64-e3ec-436fc6994e3c	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-565d-bf64-0f11-57ff111b2363	GN	GIN	324	Guinea 	Gvineja	\N
00040000-565d-bf64-b482-2a994acb1058	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-565d-bf64-8a1a-9b6bf61d9c79	GY	GUY	328	Guyana 	Gvajana	\N
00040000-565d-bf64-9e4b-e3f6c816013a	HT	HTI	332	Haiti 	Haiti	\N
00040000-565d-bf64-ea7d-5bed7cba6854	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-565d-bf64-6de9-82b8366ec16c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-565d-bf64-a3bf-6c9e91674a64	HN	HND	340	Honduras 	Honduras	\N
00040000-565d-bf64-a658-623b7540d5e6	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-565d-bf64-7f32-9f4c9b5dbf49	HU	HUN	348	Hungary 	Madžarska	\N
00040000-565d-bf64-0dae-489fae679ee2	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-565d-bf64-3f7c-97a8df78ba86	IN	IND	356	India 	Indija	\N
00040000-565d-bf64-552e-711319788940	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-565d-bf64-c53d-7f9dc41169ee	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-565d-bf64-101b-9f5c754a796c	IQ	IRQ	368	Iraq 	Irak	\N
00040000-565d-bf64-5b92-2dfde1175cab	IE	IRL	372	Ireland 	Irska	\N
00040000-565d-bf64-fd6a-37f2321d3aff	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-565d-bf64-1222-c2260cd10a44	IL	ISR	376	Israel 	Izrael	\N
00040000-565d-bf64-82e7-f7372f19ef04	IT	ITA	380	Italy 	Italija	\N
00040000-565d-bf64-eb43-3a82a9a2a592	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-565d-bf64-cafb-670c90448715	JP	JPN	392	Japan 	Japonska	\N
00040000-565d-bf64-0aeb-af2f72680869	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-565d-bf64-0714-ac312a579e70	JO	JOR	400	Jordan 	Jordanija	\N
00040000-565d-bf64-3017-5141b16ef1d1	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-565d-bf64-792c-761a66e0101b	KE	KEN	404	Kenya 	Kenija	\N
00040000-565d-bf64-4d65-1524d8a26836	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-565d-bf64-fa85-253a7f6e5873	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-565d-bf64-fedd-3c175169bf34	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-565d-bf64-533f-1e452291ee5e	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-565d-bf64-50fa-61175c7ecd40	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-565d-bf64-4238-8bc3b46a622e	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-565d-bf64-3fff-4afc0c3bd5a0	LV	LVA	428	Latvia 	Latvija	\N
00040000-565d-bf64-57d3-a2adf656750b	LB	LBN	422	Lebanon 	Libanon	\N
00040000-565d-bf64-72f8-1cc27dce6bdb	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-565d-bf64-40c5-18f5b981ae75	LR	LBR	430	Liberia 	Liberija	\N
00040000-565d-bf64-1fb0-fe457f2c011c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-565d-bf64-0e62-cb9a72b5f9a0	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-565d-bf64-952c-8f916ffd35b6	LT	LTU	440	Lithuania 	Litva	\N
00040000-565d-bf64-f7e0-16dafc1e6da0	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-565d-bf64-3e84-8c981ac5bbfb	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-565d-bf64-df2d-603ae50ecd4b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-565d-bf64-9625-49a8920d7573	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-565d-bf64-dede-8e999e634800	MW	MWI	454	Malawi 	Malavi	\N
00040000-565d-bf64-67b4-1400c4742d8f	MY	MYS	458	Malaysia 	Malezija	\N
00040000-565d-bf64-535d-f45f8fcf249b	MV	MDV	462	Maldives 	Maldivi	\N
00040000-565d-bf64-4cf0-039d598fb1c7	ML	MLI	466	Mali 	Mali	\N
00040000-565d-bf64-dbb0-bf12b488f06e	MT	MLT	470	Malta 	Malta	\N
00040000-565d-bf64-b254-09e74ad55484	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-565d-bf64-1dc6-b25b192409d7	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-565d-bf64-afec-f7f2375ff54d	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-565d-bf64-21e6-a4d57b734cfb	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-565d-bf64-adca-29e3443c688f	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-565d-bf64-970d-eb8fa56a7ae7	MX	MEX	484	Mexico 	Mehika	\N
00040000-565d-bf64-5aa3-48d4eaa96b04	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-565d-bf64-6048-dc377a3e89d7	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-565d-bf64-4a40-d801b0101e39	MC	MCO	492	Monaco 	Monako	\N
00040000-565d-bf64-b902-9625cd973158	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-565d-bf64-8866-2236554e14ac	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-565d-bf64-a992-e208ceeff7ee	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-565d-bf64-4822-e60909f09665	MA	MAR	504	Morocco 	Maroko	\N
00040000-565d-bf64-62c4-6f7478606f4f	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-565d-bf64-5bcd-d154955544f5	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-565d-bf64-0588-ea49d5cc471d	NA	NAM	516	Namibia 	Namibija	\N
00040000-565d-bf64-454b-c36dfbf9d824	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-565d-bf64-6922-11b4e46b0c24	NP	NPL	524	Nepal 	Nepal	\N
00040000-565d-bf64-933d-e20b2fcd6a93	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-565d-bf64-8536-4647d07eaca8	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-565d-bf64-a434-955a7ac464da	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-565d-bf64-5fe0-2601e2a1e6bd	NE	NER	562	Niger 	Niger 	\N
00040000-565d-bf64-0dae-9377153a8b72	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-565d-bf64-6603-8aea610f2f39	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-565d-bf64-6308-bc8835dbf33f	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-565d-bf64-fa37-359f453e4034	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-565d-bf64-c5d7-ee4129b3ed86	NO	NOR	578	Norway 	Norveška	\N
00040000-565d-bf64-ef4f-44c7486bfa2a	OM	OMN	512	Oman 	Oman	\N
00040000-565d-bf64-de69-4badd5fd9c17	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-565d-bf64-7314-4672df1e3c08	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-565d-bf64-3693-a45bc218c7ec	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-565d-bf64-8b02-ede1c4300b91	PA	PAN	591	Panama 	Panama	\N
00040000-565d-bf64-47ee-e828d0aaa608	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-565d-bf64-6b61-0f0baed69a03	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-565d-bf64-285f-e503f75011b8	PE	PER	604	Peru 	Peru	\N
00040000-565d-bf64-ade0-aeb537b5303d	PH	PHL	608	Philippines 	Filipini	\N
00040000-565d-bf64-c0f0-eca8c37413c3	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-565d-bf64-362c-822f71d22a26	PL	POL	616	Poland 	Poljska	\N
00040000-565d-bf64-0c93-e8cf19e6e5e0	PT	PRT	620	Portugal 	Portugalska	\N
00040000-565d-bf64-4c74-99f3ab045ce3	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-565d-bf64-e409-eee569726cc9	QA	QAT	634	Qatar 	Katar	\N
00040000-565d-bf64-574a-e143dd3e17ea	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-565d-bf64-f23d-0d73e1ea83a5	RO	ROU	642	Romania 	Romunija	\N
00040000-565d-bf64-57c9-f969f1ef811b	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-565d-bf64-abb9-f4e001117df5	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-565d-bf64-c729-f00d08785c8a	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-565d-bf64-f1cc-9b8b4fdd3a6e	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-565d-bf64-9d88-485c0042390f	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-565d-bf64-da1d-fd6d9c87189a	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-565d-bf64-e472-c56bdf1ee850	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-565d-bf64-0850-4532bea8a24d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-565d-bf64-fbed-ea4ef835a9f5	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-565d-bf64-7ed4-bd8f91e87bb2	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-565d-bf64-48ae-311032b57584	SM	SMR	674	San Marino 	San Marino	\N
00040000-565d-bf64-0c00-4077cc1b0392	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-565d-bf64-59da-5a4eccca3abd	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-565d-bf64-aff7-cb6ed5a8f141	SN	SEN	686	Senegal 	Senegal	\N
00040000-565d-bf64-00a1-9445b4c862a7	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-565d-bf64-afd8-a6d9fcf7157e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-565d-bf64-67dc-bb1be9f4fbe4	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-565d-bf64-ba0d-ba59b491f3c5	SG	SGP	702	Singapore 	Singapur	\N
00040000-565d-bf64-2977-c1fdc1abf0c2	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-565d-bf64-7701-5afed1031575	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-565d-bf64-5a95-e369ddaea9f9	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-565d-bf64-e4e2-58a374be672f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-565d-bf64-7b5f-4f2fce437272	SO	SOM	706	Somalia 	Somalija	\N
00040000-565d-bf64-a52b-50c61d43d342	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-565d-bf64-e74a-772dde824a8f	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-565d-bf64-9fa7-81bb5d1d3a55	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-565d-bf64-bc09-c81c8f9fa14b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-565d-bf64-a123-fdd35b97034a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-565d-bf64-1e47-addcf0e25a7c	SD	SDN	729	Sudan 	Sudan	\N
00040000-565d-bf64-e50d-744d7e492357	SR	SUR	740	Suriname 	Surinam	\N
00040000-565d-bf64-197b-9a7da44dc8d7	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-565d-bf64-1bf6-ad6bd2c0f07a	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-565d-bf64-b33f-d48de78fc713	SE	SWE	752	Sweden 	Švedska	\N
00040000-565d-bf64-3c9e-8541afb7c4e9	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-565d-bf64-80f9-d5431d76ed8e	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-565d-bf64-cab1-ffeee5f48877	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-565d-bf64-933c-41d061531f4b	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-565d-bf64-78f8-a746209dc289	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-565d-bf64-f351-f7606ed9ad78	TH	THA	764	Thailand 	Tajska	\N
00040000-565d-bf64-e726-7da94fbe356c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-565d-bf64-b5b8-be45773fd29b	TG	TGO	768	Togo 	Togo	\N
00040000-565d-bf64-9a08-23db667314a4	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-565d-bf64-315c-e7354197c7f7	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-565d-bf64-e0e2-68a13419375d	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-565d-bf64-e3a2-f8843d37cc53	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-565d-bf64-651a-06914b035b05	TR	TUR	792	Turkey 	Turčija	\N
00040000-565d-bf64-d842-4a87a11cdea0	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-565d-bf64-4a44-e5d4c67c9d8e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-565d-bf64-3581-c65c9e4d8584	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-565d-bf64-e0a4-9e3db0c8a8a3	UG	UGA	800	Uganda 	Uganda	\N
00040000-565d-bf64-8ecd-394f693018ec	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-565d-bf64-d1ee-3f289d6ef548	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-565d-bf64-0071-29e83673054f	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-565d-bf64-4e26-b32be2cb27be	US	USA	840	United States 	Združene države Amerike	\N
00040000-565d-bf64-a34d-2919a365f38f	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-565d-bf64-7f43-952ece47e85c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-565d-bf64-e661-61e9554b6689	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-565d-bf64-1e1c-0a6467625ee6	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-565d-bf64-25d8-b353a6248234	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-565d-bf64-04cc-b4ed2cd3d9f6	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-565d-bf64-78d4-3b413b094090	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-565d-bf64-4f56-ea4f1922166d	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-565d-bf64-e9d0-5552dc8161aa	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-565d-bf64-0b6b-3e1a41d73989	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-565d-bf64-238b-ee9877edd411	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-565d-bf64-ae18-b5f8ada460b0	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-565d-bf64-c8c0-5579b5d6df25	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3162 (class 0 OID 30247032)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-565d-bf67-0750-9d7beedbe228	000e0000-565d-bf67-9062-01e28b9fde16	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-565d-bf64-4421-d492f8addcc4	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-565d-bf67-58d2-1149026d3bf7	000e0000-565d-bf67-22b3-2c46373c148f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-565d-bf64-8cd3-e788c7da0fd5	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-565d-bf67-28e3-915158854368	000e0000-565d-bf67-9287-e5eeeeaa5759	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-565d-bf64-4421-d492f8addcc4	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-565d-bf67-c824-5a2f1fea5c7e	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-565d-bf67-6a16-248f06a7bfe0	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3147 (class 0 OID 30246833)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-565d-bf67-d6f0-53b93451a99a	000e0000-565d-bf67-22b3-2c46373c148f	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-565d-bf64-fc4d-cb80475fe1d0
000d0000-565d-bf67-82ea-1b3136687279	000e0000-565d-bf67-22b3-2c46373c148f	000c0000-565d-bf67-2459-d27b9498440b	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-565d-bf64-fc4d-cb80475fe1d0
000d0000-565d-bf67-0381-0abe3c4e645b	000e0000-565d-bf67-22b3-2c46373c148f	000c0000-565d-bf67-25ad-f4f6485a513a	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-565d-bf64-cd6b-6b95f398ecd6
000d0000-565d-bf67-4b35-d6f4cb6b0518	000e0000-565d-bf67-22b3-2c46373c148f	000c0000-565d-bf67-d07c-52dfb39da442	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-565d-bf64-59be-ee7a36a6bbbb
000d0000-565d-bf67-f94c-f876ac63eebc	000e0000-565d-bf67-22b3-2c46373c148f	000c0000-565d-bf67-33d8-5965f41ac11e	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-565d-bf64-7d15-3b04e1ff80b4
000d0000-565d-bf67-9fbc-2acc732ebfec	000e0000-565d-bf67-22b3-2c46373c148f	000c0000-565d-bf67-3b6a-f3af1541184c	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-565d-bf64-7d15-3b04e1ff80b4
000d0000-565d-bf67-e988-03fc8731d969	000e0000-565d-bf67-22b3-2c46373c148f	000c0000-565d-bf67-338a-586e5b5c1368	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-565d-bf64-fc4d-cb80475fe1d0
000d0000-565d-bf67-37b2-e99d04aed108	000e0000-565d-bf67-22b3-2c46373c148f	000c0000-565d-bf67-b653-58ccb6a7da14	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-565d-bf64-0afc-a67eadcdc213
000d0000-565d-bf67-0f74-1dfabc226a09	000e0000-565d-bf67-22b3-2c46373c148f	000c0000-565d-bf67-9bc2-5de6e1bab124	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-565d-bf64-bba4-87aaa3387354
\.


--
-- TOC entry 3124 (class 0 OID 30246624)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 30246590)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 30246567)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-565d-bf67-2a58-e2e6709d5c3f	00080000-565d-bf67-61d2-260f4e710ec6	00090000-565d-bf67-c840-759a533cfcbc	AK		igralka
\.


--
-- TOC entry 3136 (class 0 OID 30246747)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 30247292)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-565d-bf67-92e3-deb3f1abdda8	00010000-565d-bf65-66a6-22f29d68e0b2	\N	Prva mapa	Root mapa	2015-12-01 16:40:23	2015-12-01 16:40:23	R	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 30247305)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 30247327)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 25231831)
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
\.


--
-- TOC entry 3140 (class 0 OID 30246772)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 30246524)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-565d-bf65-cecb-7237aa246ca5	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-565d-bf65-e727-9b978b72add3	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-565d-bf65-1bf5-db35709045c3	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-565d-bf65-e3d4-326a9c08c1ed	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-565d-bf65-692d-34bc55d03997	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-565d-bf65-885a-13b8d24c27a6	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-565d-bf65-e310-818ba8b89a8c	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-565d-bf65-48c9-b7a3c36ab741	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-565d-bf65-cfef-8c99aaf474d5	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-565d-bf65-3556-fb612ac9ae49	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-565d-bf65-0bef-bfa125d0b3ff	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-565d-bf65-2d5a-4f5369c0d0f9	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-565d-bf65-84a0-80517eb685d4	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-565d-bf65-e3c6-9087db212aa8	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-565d-bf67-0a2e-e572d3bea7db	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-565d-bf67-5185-452e5c23ca51	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-565d-bf67-08ba-22b581abfb63	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-565d-bf67-773e-64618ece2d0d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-565d-bf67-f833-d3da4af4871b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-565d-bf69-2991-29dba35b052b	application.tenant.maticnopodjetje	string	s:36:"00080000-565d-bf69-4dfe-b319b58ceaa7";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3109 (class 0 OID 30246424)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-565d-bf67-cd73-401ea8f763b4	00000000-565d-bf67-0a2e-e572d3bea7db	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-565d-bf67-9b74-c7fb1f765753	00000000-565d-bf67-0a2e-e572d3bea7db	00010000-565d-bf65-66a6-22f29d68e0b2	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-565d-bf67-21ab-974700d0439f	00000000-565d-bf67-5185-452e5c23ca51	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3113 (class 0 OID 30246491)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-565d-bf67-69db-e18b6a5f7d0a	\N	00100000-565d-bf67-6abd-03b2f1c1bc2f	00100000-565d-bf67-1515-c90ba8460994	01	Gledališče Nimbis
00410000-565d-bf67-9a61-f68d95347cda	00410000-565d-bf67-69db-e18b6a5f7d0a	00100000-565d-bf67-6abd-03b2f1c1bc2f	00100000-565d-bf67-1515-c90ba8460994	02	Tehnika
\.


--
-- TOC entry 3110 (class 0 OID 30246435)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-565d-bf67-41e4-7fcbc17ba4a7	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-565d-bf67-2a20-38aecddc8699	00010000-565d-bf67-b075-c3e73a6d805f	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-565d-bf67-781d-ff356e70182b	00010000-565d-bf67-8b63-7a0378bc0e68	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-565d-bf67-8305-f45cf4e4225e	00010000-565d-bf67-2f7b-85a01fb31349	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-565d-bf67-34fd-68f769e3404e	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-565d-bf67-6fa6-29c17c3205e9	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-565d-bf67-6cad-1f193a55b458	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-565d-bf67-585e-ca0c4502fea1	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-565d-bf67-c840-759a533cfcbc	00010000-565d-bf67-1441-ee39a9b3e7fd	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-565d-bf67-3a6e-731c243ea618	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-565d-bf67-3cab-333b3ed230b2	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-565d-bf67-1d1f-33cdd11bbfad	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-565d-bf67-fd0a-8cfc5c1555ff	00010000-565d-bf67-4866-6f3eb05ab742	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-565d-bf67-f265-ae91cd13e9d7	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-565d-bf67-a2f9-771eaf5b1c41	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-565d-bf67-a94b-4aa946b8df29	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-565d-bf67-12e8-75acd9dd42db	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-565d-bf67-ce15-a347d2dca27b	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-565d-bf67-99b9-a2b2ee59af13	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-565d-bf67-5391-6db80403d278	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-565d-bf67-c7a3-2ad1d65dedcf	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3102 (class 0 OID 30246370)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-565d-bf65-02ee-40b712789ed0	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-565d-bf65-b5c3-c09479734b67	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-565d-bf65-e489-3c38cd8d4f7f	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-565d-bf65-79c7-30978289c163	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-565d-bf65-15e5-b36b0f225775	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-565d-bf65-09bb-e8e0ac41d502	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-565d-bf65-efc3-4ffdbb5b01d8	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-565d-bf65-c0bf-18f82552cb2f	Abonma-read	Abonma - branje	t
00030000-565d-bf65-d21e-7f813493b2b1	Abonma-write	Abonma - spreminjanje	t
00030000-565d-bf65-614f-03b84d3b00d2	Alternacija-read	Alternacija - branje	t
00030000-565d-bf65-9a17-e86b0eca34fb	Alternacija-write	Alternacija - spreminjanje	t
00030000-565d-bf65-a55f-f662376f1a62	Arhivalija-read	Arhivalija - branje	t
00030000-565d-bf65-4c81-5545942fea3c	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-565d-bf65-ebd1-2f3c57181cea	AuthStorage-read	AuthStorage - branje	t
00030000-565d-bf65-8127-baa331b87fdd	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-565d-bf65-75c6-5fbe3e16a942	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-565d-bf65-c131-62bad7aefb68	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-565d-bf65-aaf7-aae82e6993b7	Besedilo-read	Besedilo - branje	t
00030000-565d-bf65-4638-091b9e278ec2	Besedilo-write	Besedilo - spreminjanje	t
00030000-565d-bf65-3861-c94058728b9a	Dogodek-read	Dogodek - branje	t
00030000-565d-bf65-b55b-1688cb6d1046	Dogodek-write	Dogodek - spreminjanje	t
00030000-565d-bf65-6492-53052e4929e0	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-565d-bf65-ece5-b33680bce080	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-565d-bf65-ca1e-0bfdf8e542e4	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-565d-bf65-a6e8-ce6766032ee9	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-565d-bf65-1b02-f81c995cccb5	DogodekTrait-read	DogodekTrait - branje	t
00030000-565d-bf65-214e-1175df2ef3e3	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-565d-bf65-8f0e-7d7dd8ea0ea8	DrugiVir-read	DrugiVir - branje	t
00030000-565d-bf65-f87d-5b6a2754b34f	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-565d-bf65-aef6-34ae49179e9c	Drzava-read	Drzava - branje	t
00030000-565d-bf65-d245-230323e5b0bb	Drzava-write	Drzava - spreminjanje	t
00030000-565d-bf65-1409-767f7087813b	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-565d-bf65-cbf0-1af76a967a86	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-565d-bf65-f4c2-a586b761163a	Funkcija-read	Funkcija - branje	t
00030000-565d-bf65-9946-54a55dabe805	Funkcija-write	Funkcija - spreminjanje	t
00030000-565d-bf65-7eee-617d2ca4d5e6	Gostovanje-read	Gostovanje - branje	t
00030000-565d-bf65-a489-dab9a118066a	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-565d-bf65-5431-b323b2caf8bc	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-565d-bf65-ced0-b0397a188917	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-565d-bf65-fba1-dbe2c3d4d2e9	Kupec-read	Kupec - branje	t
00030000-565d-bf65-c808-2568eac64883	Kupec-write	Kupec - spreminjanje	t
00030000-565d-bf65-27ad-20ec317be8e8	NacinPlacina-read	NacinPlacina - branje	t
00030000-565d-bf65-326f-8c972f123706	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-565d-bf65-065e-adc3eb972102	Option-read	Option - branje	t
00030000-565d-bf65-fbe2-82d3c834254d	Option-write	Option - spreminjanje	t
00030000-565d-bf65-e349-507ff323a381	OptionValue-read	OptionValue - branje	t
00030000-565d-bf65-6daa-d55253eae522	OptionValue-write	OptionValue - spreminjanje	t
00030000-565d-bf65-647b-62c9a9f347a0	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-565d-bf65-408e-f5f3df97dcdd	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-565d-bf65-b3d9-9c88703f75ec	Oseba-read	Oseba - branje	t
00030000-565d-bf65-9895-abc7ec57f6a9	Oseba-write	Oseba - spreminjanje	t
00030000-565d-bf65-bf31-cc9a25b848ca	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-565d-bf65-b575-e6107f174dfe	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-565d-bf65-4f61-7ed20c82e837	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-565d-bf65-3371-eaf63317407a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-565d-bf65-db49-0d5c44aebf46	Pogodba-read	Pogodba - branje	t
00030000-565d-bf65-675b-abc8b65da09f	Pogodba-write	Pogodba - spreminjanje	t
00030000-565d-bf65-e179-d2d25bffb923	Popa-read	Popa - branje	t
00030000-565d-bf65-8aad-3da092966d69	Popa-write	Popa - spreminjanje	t
00030000-565d-bf65-cfe5-0635dd55dc60	Posta-read	Posta - branje	t
00030000-565d-bf65-6050-ba44deff6926	Posta-write	Posta - spreminjanje	t
00030000-565d-bf65-21ed-3535cf5e46f2	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-565d-bf65-59f3-f6128393b25b	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-565d-bf65-5da0-e1b1e0acaa8e	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-565d-bf65-a319-c82f225fd432	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-565d-bf65-ef0c-2bc420d7a01d	PostniNaslov-read	PostniNaslov - branje	t
00030000-565d-bf65-c04a-2d043178d99b	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-565d-bf65-9691-402c7ee738bf	Praznik-read	Praznik - branje	t
00030000-565d-bf65-a963-d6f1f467e0d1	Praznik-write	Praznik - spreminjanje	t
00030000-565d-bf65-f52f-1129d272d5a8	Predstava-read	Predstava - branje	t
00030000-565d-bf65-e5f5-f77334194224	Predstava-write	Predstava - spreminjanje	t
00030000-565d-bf65-9a6f-e3cc2ecdb7b2	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-565d-bf65-28ed-7649aea046f6	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-565d-bf65-91f2-2d0f942824b4	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-565d-bf65-74ef-6c1785b2f54a	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-565d-bf65-c831-f2988ae37260	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-565d-bf65-03c0-7ab2a43c9120	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-565d-bf65-d838-acb78f4783b9	ProgramDela-read	ProgramDela - branje	t
00030000-565d-bf65-82d6-01f8974eb7dc	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-565d-bf65-3dfe-339f89e38a31	ProgramFestival-read	ProgramFestival - branje	t
00030000-565d-bf65-0396-3287de034863	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-565d-bf65-1232-23b400daa4bc	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-565d-bf65-ad0e-5b80bb83ba72	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-565d-bf65-13d9-4ec037d73d7d	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-565d-bf65-3803-d5762c974b93	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-565d-bf65-3ea8-3dacc54f9ebc	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-565d-bf65-1d9e-ab67d08a50dd	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-565d-bf65-2216-d995db178c67	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-565d-bf65-819a-17faf74da557	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-565d-bf65-73d4-91f88e083f86	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-565d-bf65-df18-fb4770c89d02	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-565d-bf65-e078-573ffb97ef4f	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-565d-bf65-7541-df610c544709	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-565d-bf65-e987-d505cde4230a	ProgramRazno-read	ProgramRazno - branje	t
00030000-565d-bf65-bce5-a9e550d08186	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-565d-bf65-25a4-170afebb87ce	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-565d-bf65-d783-2d8403c94d01	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-565d-bf65-f083-3144cac04fc2	Prostor-read	Prostor - branje	t
00030000-565d-bf65-53e8-47bc674b9e2e	Prostor-write	Prostor - spreminjanje	t
00030000-565d-bf65-4d51-7b18bc964c40	Racun-read	Racun - branje	t
00030000-565d-bf65-bc0c-909bed4e4af9	Racun-write	Racun - spreminjanje	t
00030000-565d-bf65-7ac8-ffdd7de6a115	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-565d-bf65-4b6c-a82dd5d433b6	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-565d-bf65-ff20-9bcf8bcd9abc	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-565d-bf65-598d-1008efd54ffd	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-565d-bf65-4e89-c1ee01bd496f	Rekvizit-read	Rekvizit - branje	t
00030000-565d-bf65-0eb4-23bab9df731b	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-565d-bf65-8b31-f108111f7411	Revizija-read	Revizija - branje	t
00030000-565d-bf65-8563-bb9efd633ed8	Revizija-write	Revizija - spreminjanje	t
00030000-565d-bf65-b7eb-5ce70746f269	Rezervacija-read	Rezervacija - branje	t
00030000-565d-bf65-ed44-07a6ccc5897a	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-565d-bf65-8c64-e2b9ca47e932	SedezniRed-read	SedezniRed - branje	t
00030000-565d-bf65-d3e8-b8d3594060f1	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-565d-bf65-257e-06e66f0582e7	Sedez-read	Sedez - branje	t
00030000-565d-bf65-ac9d-12b0d0de68f3	Sedez-write	Sedez - spreminjanje	t
00030000-565d-bf65-7a69-d84087194ea7	Sezona-read	Sezona - branje	t
00030000-565d-bf65-66db-6f0af7d6b401	Sezona-write	Sezona - spreminjanje	t
00030000-565d-bf65-4b6f-0aac58fb42e3	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-565d-bf65-6e39-20adc8cfc4fe	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-565d-bf65-2480-748afcc3250a	Stevilcenje-read	Stevilcenje - branje	t
00030000-565d-bf65-2036-2b232a3b293c	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-565d-bf65-c6b1-0eded55e618c	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-565d-bf65-8dac-f9e383bc095f	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-565d-bf65-b181-824c5e571302	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-565d-bf65-739c-c9832abec6bd	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-565d-bf65-dec6-8f70ffc1bff7	Telefonska-read	Telefonska - branje	t
00030000-565d-bf65-0749-d1efaad6bf02	Telefonska-write	Telefonska - spreminjanje	t
00030000-565d-bf65-b536-e844d814a477	TerminStoritve-read	TerminStoritve - branje	t
00030000-565d-bf65-d62e-d0c772f15c1d	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-565d-bf65-4c8b-c3f60b022022	TipFunkcije-read	TipFunkcije - branje	t
00030000-565d-bf65-5e3f-0766189c242d	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-565d-bf65-391b-7f1db117fe9b	TipPopa-read	TipPopa - branje	t
00030000-565d-bf65-e2bd-397c68fb7795	TipPopa-write	TipPopa - spreminjanje	t
00030000-565d-bf65-f920-66b8fae4ca4f	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-565d-bf65-c32e-0cab3980d2c1	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-565d-bf65-1774-e9028102bb26	TipVaje-read	TipVaje - branje	t
00030000-565d-bf65-c2cc-8f248dcf6ce3	TipVaje-write	TipVaje - spreminjanje	t
00030000-565d-bf65-dc55-1372edac37c9	Trr-read	Trr - branje	t
00030000-565d-bf65-d525-c1b33c432175	Trr-write	Trr - spreminjanje	t
00030000-565d-bf65-123b-f806fe850ac8	Uprizoritev-read	Uprizoritev - branje	t
00030000-565d-bf65-6dcb-2b4fe210f1ab	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-565d-bf65-5e68-20b019a973f8	Vaja-read	Vaja - branje	t
00030000-565d-bf65-c4f9-49aec17cd6f9	Vaja-write	Vaja - spreminjanje	t
00030000-565d-bf65-dd1c-a14ead9e62b5	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-565d-bf65-70e3-6217bcb982e0	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-565d-bf65-0916-785c89a334e8	VrstaStroska-read	VrstaStroska - branje	t
00030000-565d-bf65-3131-b6b0788e0173	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-565d-bf65-aa63-44b419134944	Zaposlitev-read	Zaposlitev - branje	t
00030000-565d-bf65-7d95-7e3d04dbe28e	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-565d-bf65-7ac5-f266ccc1b5a0	Zasedenost-read	Zasedenost - branje	t
00030000-565d-bf65-2853-0139beef3e46	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-565d-bf65-23e6-fbc8685549a7	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-565d-bf65-d96d-2f9beefaeff5	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-565d-bf65-6102-8f6fc8cc81d0	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-565d-bf65-3888-543290f8599f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-565d-bf65-7f96-2335714067d3	Job-read	Branje opravil - samo zase - branje	t
00030000-565d-bf65-7ceb-e347402247ca	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-565d-bf65-f7a0-a7bb5e43a7e7	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-565d-bf65-2836-738a34f2d96b	Report-read	Report - branje	t
00030000-565d-bf65-5c5c-4defebc98f0a	Report-write	Report - spreminjanje	t
00030000-565d-bf65-15a0-525556bf0e81	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-565d-bf65-fede-2993cfa7fd40	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-565d-bf65-c62f-f8c94f0c9512	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-565d-bf65-783e-080dcd4aa063	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-565d-bf65-d4b3-51f82b6b5965	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-565d-bf65-c650-3c3afccdd52f	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-565d-bf65-4943-5295ee8587a2	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-565d-bf65-fece-093f679aa1e9	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-565d-bf65-7963-07e0b8b399ba	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-565d-bf65-297b-eed3569b27b5	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-565d-bf65-5764-2403fa7be544	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-565d-bf65-be6a-919d8bd00a7d	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-565d-bf65-1066-904bb9ddeb76	Datoteka-write	Datoteka - spreminjanje	t
00030000-565d-bf65-f824-11af86624078	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3104 (class 0 OID 30246389)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-565d-bf65-40ab-46c4c2d544f9	00030000-565d-bf65-b5c3-c09479734b67
00020000-565d-bf65-40ab-46c4c2d544f9	00030000-565d-bf65-02ee-40b712789ed0
00020000-565d-bf65-376d-f1f586431814	00030000-565d-bf65-aef6-34ae49179e9c
00020000-565d-bf65-4c0d-14e3b7eec6b6	00030000-565d-bf65-c131-62bad7aefb68
00020000-565d-bf65-4c0d-14e3b7eec6b6	00030000-565d-bf65-4638-091b9e278ec2
00020000-565d-bf65-4c0d-14e3b7eec6b6	00030000-565d-bf65-1066-904bb9ddeb76
00020000-565d-bf65-4c0d-14e3b7eec6b6	00030000-565d-bf65-4943-5295ee8587a2
00020000-565d-bf65-4c0d-14e3b7eec6b6	00030000-565d-bf65-7963-07e0b8b399ba
00020000-565d-bf65-4c0d-14e3b7eec6b6	00030000-565d-bf65-75c6-5fbe3e16a942
00020000-565d-bf65-4c0d-14e3b7eec6b6	00030000-565d-bf65-aaf7-aae82e6993b7
00020000-565d-bf65-4c0d-14e3b7eec6b6	00030000-565d-bf65-f824-11af86624078
00020000-565d-bf65-4c0d-14e3b7eec6b6	00030000-565d-bf65-b3d9-9c88703f75ec
00020000-565d-bf65-4c0d-14e3b7eec6b6	00030000-565d-bf65-fece-093f679aa1e9
00020000-565d-bf65-4c0d-14e3b7eec6b6	00030000-565d-bf65-297b-eed3569b27b5
00020000-565d-bf65-4ba9-3f8fc4ba6446	00030000-565d-bf65-75c6-5fbe3e16a942
00020000-565d-bf65-4ba9-3f8fc4ba6446	00030000-565d-bf65-aaf7-aae82e6993b7
00020000-565d-bf65-4ba9-3f8fc4ba6446	00030000-565d-bf65-f824-11af86624078
00020000-565d-bf65-4ba9-3f8fc4ba6446	00030000-565d-bf65-fece-093f679aa1e9
00020000-565d-bf65-4ba9-3f8fc4ba6446	00030000-565d-bf65-297b-eed3569b27b5
00020000-565d-bf65-b4ba-22ca1c2024e0	00030000-565d-bf65-b3d9-9c88703f75ec
00020000-565d-bf65-b4ba-22ca1c2024e0	00030000-565d-bf65-aa63-44b419134944
00020000-565d-bf65-b4ba-22ca1c2024e0	00030000-565d-bf65-7d95-7e3d04dbe28e
00020000-565d-bf65-b4ba-22ca1c2024e0	00030000-565d-bf65-647b-62c9a9f347a0
00020000-565d-bf65-4e85-257640aff73e	00030000-565d-bf65-aa63-44b419134944
00020000-565d-bf65-4e85-257640aff73e	00030000-565d-bf65-647b-62c9a9f347a0
00020000-565d-bf65-de9e-db52e942063c	00030000-565d-bf65-9895-abc7ec57f6a9
00020000-565d-bf65-de9e-db52e942063c	00030000-565d-bf65-b3d9-9c88703f75ec
00020000-565d-bf65-de9e-db52e942063c	00030000-565d-bf65-aef6-34ae49179e9c
00020000-565d-bf65-de9e-db52e942063c	00030000-565d-bf65-ef0c-2bc420d7a01d
00020000-565d-bf65-de9e-db52e942063c	00030000-565d-bf65-c04a-2d043178d99b
00020000-565d-bf65-de9e-db52e942063c	00030000-565d-bf65-dec6-8f70ffc1bff7
00020000-565d-bf65-de9e-db52e942063c	00030000-565d-bf65-0749-d1efaad6bf02
00020000-565d-bf65-de9e-db52e942063c	00030000-565d-bf65-f824-11af86624078
00020000-565d-bf65-de9e-db52e942063c	00030000-565d-bf65-1066-904bb9ddeb76
00020000-565d-bf65-de9e-db52e942063c	00030000-565d-bf65-297b-eed3569b27b5
00020000-565d-bf65-de9e-db52e942063c	00030000-565d-bf65-7963-07e0b8b399ba
00020000-565d-bf65-de9e-db52e942063c	00030000-565d-bf65-fece-093f679aa1e9
00020000-565d-bf65-de9e-db52e942063c	00030000-565d-bf65-4943-5295ee8587a2
00020000-565d-bf65-24b0-660b7825aa1f	00030000-565d-bf65-b3d9-9c88703f75ec
00020000-565d-bf65-24b0-660b7825aa1f	00030000-565d-bf65-aef6-34ae49179e9c
00020000-565d-bf65-24b0-660b7825aa1f	00030000-565d-bf65-ef0c-2bc420d7a01d
00020000-565d-bf65-24b0-660b7825aa1f	00030000-565d-bf65-dec6-8f70ffc1bff7
00020000-565d-bf65-24b0-660b7825aa1f	00030000-565d-bf65-f824-11af86624078
00020000-565d-bf65-24b0-660b7825aa1f	00030000-565d-bf65-297b-eed3569b27b5
00020000-565d-bf65-24b0-660b7825aa1f	00030000-565d-bf65-fece-093f679aa1e9
00020000-565d-bf65-1344-7af749f51799	00030000-565d-bf65-15e5-b36b0f225775
00020000-565d-bf65-1344-7af749f51799	00030000-565d-bf65-9895-abc7ec57f6a9
00020000-565d-bf65-1344-7af749f51799	00030000-565d-bf65-b3d9-9c88703f75ec
00020000-565d-bf65-1344-7af749f51799	00030000-565d-bf65-f824-11af86624078
00020000-565d-bf65-1344-7af749f51799	00030000-565d-bf65-1066-904bb9ddeb76
00020000-565d-bf65-1344-7af749f51799	00030000-565d-bf65-297b-eed3569b27b5
00020000-565d-bf65-1344-7af749f51799	00030000-565d-bf65-7963-07e0b8b399ba
00020000-565d-bf65-1344-7af749f51799	00030000-565d-bf65-fece-093f679aa1e9
00020000-565d-bf65-1344-7af749f51799	00030000-565d-bf65-4943-5295ee8587a2
00020000-565d-bf65-9a9e-8f5fd2fd57e5	00030000-565d-bf65-b3d9-9c88703f75ec
00020000-565d-bf65-9a9e-8f5fd2fd57e5	00030000-565d-bf65-dc55-1372edac37c9
00020000-565d-bf65-9a9e-8f5fd2fd57e5	00030000-565d-bf65-f824-11af86624078
00020000-565d-bf65-9a9e-8f5fd2fd57e5	00030000-565d-bf65-297b-eed3569b27b5
00020000-565d-bf65-9a9e-8f5fd2fd57e5	00030000-565d-bf65-fece-093f679aa1e9
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-dec6-8f70ffc1bff7
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-ef0c-2bc420d7a01d
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-b3d9-9c88703f75ec
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-fece-093f679aa1e9
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-dc55-1372edac37c9
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-e179-d2d25bffb923
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-f824-11af86624078
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-297b-eed3569b27b5
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-5431-b323b2caf8bc
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-c831-f2988ae37260
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-0749-d1efaad6bf02
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-c04a-2d043178d99b
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-4943-5295ee8587a2
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-d525-c1b33c432175
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-8aad-3da092966d69
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-1066-904bb9ddeb76
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-7963-07e0b8b399ba
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-ced0-b0397a188917
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-03c0-7ab2a43c9120
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-aef6-34ae49179e9c
00020000-565d-bf65-bf5a-14bf8ecaa502	00030000-565d-bf65-391b-7f1db117fe9b
00020000-565d-bf65-35e0-0ff2680e7f19	00030000-565d-bf65-dec6-8f70ffc1bff7
00020000-565d-bf65-35e0-0ff2680e7f19	00030000-565d-bf65-ef0c-2bc420d7a01d
00020000-565d-bf65-35e0-0ff2680e7f19	00030000-565d-bf65-fece-093f679aa1e9
00020000-565d-bf65-35e0-0ff2680e7f19	00030000-565d-bf65-dc55-1372edac37c9
00020000-565d-bf65-35e0-0ff2680e7f19	00030000-565d-bf65-e179-d2d25bffb923
00020000-565d-bf65-35e0-0ff2680e7f19	00030000-565d-bf65-f824-11af86624078
00020000-565d-bf65-35e0-0ff2680e7f19	00030000-565d-bf65-297b-eed3569b27b5
00020000-565d-bf65-35e0-0ff2680e7f19	00030000-565d-bf65-5431-b323b2caf8bc
00020000-565d-bf65-35e0-0ff2680e7f19	00030000-565d-bf65-c831-f2988ae37260
00020000-565d-bf65-35e0-0ff2680e7f19	00030000-565d-bf65-aef6-34ae49179e9c
00020000-565d-bf65-35e0-0ff2680e7f19	00030000-565d-bf65-391b-7f1db117fe9b
00020000-565d-bf65-54a3-9d1fc8a4a17b	00030000-565d-bf65-391b-7f1db117fe9b
00020000-565d-bf65-54a3-9d1fc8a4a17b	00030000-565d-bf65-e2bd-397c68fb7795
00020000-565d-bf65-1ddc-258368bb414c	00030000-565d-bf65-391b-7f1db117fe9b
00020000-565d-bf65-a09c-5988952d1599	00030000-565d-bf65-cfe5-0635dd55dc60
00020000-565d-bf65-a09c-5988952d1599	00030000-565d-bf65-6050-ba44deff6926
00020000-565d-bf65-d0ec-68cc5373dd46	00030000-565d-bf65-cfe5-0635dd55dc60
00020000-565d-bf65-43f4-cae383b6a1aa	00030000-565d-bf65-aef6-34ae49179e9c
00020000-565d-bf65-43f4-cae383b6a1aa	00030000-565d-bf65-d245-230323e5b0bb
00020000-565d-bf65-f063-f97feb9d053f	00030000-565d-bf65-aef6-34ae49179e9c
00020000-565d-bf65-ea78-a04c08f252a5	00030000-565d-bf65-6102-8f6fc8cc81d0
00020000-565d-bf65-ea78-a04c08f252a5	00030000-565d-bf65-3888-543290f8599f
00020000-565d-bf65-40f3-d72d7f78b141	00030000-565d-bf65-6102-8f6fc8cc81d0
00020000-565d-bf65-d384-7c1298695db4	00030000-565d-bf65-23e6-fbc8685549a7
00020000-565d-bf65-d384-7c1298695db4	00030000-565d-bf65-d96d-2f9beefaeff5
00020000-565d-bf65-0502-f70f2c7e7246	00030000-565d-bf65-23e6-fbc8685549a7
00020000-565d-bf65-e540-1540fe3cee99	00030000-565d-bf65-c0bf-18f82552cb2f
00020000-565d-bf65-e540-1540fe3cee99	00030000-565d-bf65-d21e-7f813493b2b1
00020000-565d-bf65-9490-057a59c94243	00030000-565d-bf65-c0bf-18f82552cb2f
00020000-565d-bf65-9250-959d30673e50	00030000-565d-bf65-f083-3144cac04fc2
00020000-565d-bf65-9250-959d30673e50	00030000-565d-bf65-53e8-47bc674b9e2e
00020000-565d-bf65-9250-959d30673e50	00030000-565d-bf65-e179-d2d25bffb923
00020000-565d-bf65-9250-959d30673e50	00030000-565d-bf65-ef0c-2bc420d7a01d
00020000-565d-bf65-9250-959d30673e50	00030000-565d-bf65-c04a-2d043178d99b
00020000-565d-bf65-9250-959d30673e50	00030000-565d-bf65-aef6-34ae49179e9c
00020000-565d-bf65-c205-e77016d333d1	00030000-565d-bf65-f083-3144cac04fc2
00020000-565d-bf65-c205-e77016d333d1	00030000-565d-bf65-e179-d2d25bffb923
00020000-565d-bf65-c205-e77016d333d1	00030000-565d-bf65-ef0c-2bc420d7a01d
00020000-565d-bf65-7bcd-74fddaef2db6	00030000-565d-bf65-0916-785c89a334e8
00020000-565d-bf65-7bcd-74fddaef2db6	00030000-565d-bf65-3131-b6b0788e0173
00020000-565d-bf65-ff82-d65422bfe0d6	00030000-565d-bf65-0916-785c89a334e8
00020000-565d-bf65-c3a0-545d15a59bc6	00030000-565d-bf65-408e-f5f3df97dcdd
00020000-565d-bf65-c3a0-545d15a59bc6	00030000-565d-bf65-647b-62c9a9f347a0
00020000-565d-bf65-c3a0-545d15a59bc6	00030000-565d-bf65-aa63-44b419134944
00020000-565d-bf65-c3a0-545d15a59bc6	00030000-565d-bf65-1066-904bb9ddeb76
00020000-565d-bf65-c3a0-545d15a59bc6	00030000-565d-bf65-f824-11af86624078
00020000-565d-bf65-c3a0-545d15a59bc6	00030000-565d-bf65-4943-5295ee8587a2
00020000-565d-bf65-c3a0-545d15a59bc6	00030000-565d-bf65-fece-093f679aa1e9
00020000-565d-bf65-c3a0-545d15a59bc6	00030000-565d-bf65-7963-07e0b8b399ba
00020000-565d-bf65-c3a0-545d15a59bc6	00030000-565d-bf65-297b-eed3569b27b5
00020000-565d-bf65-c074-51c3dfd1a147	00030000-565d-bf65-647b-62c9a9f347a0
00020000-565d-bf65-c074-51c3dfd1a147	00030000-565d-bf65-aa63-44b419134944
00020000-565d-bf65-c074-51c3dfd1a147	00030000-565d-bf65-f824-11af86624078
00020000-565d-bf65-c074-51c3dfd1a147	00030000-565d-bf65-fece-093f679aa1e9
00020000-565d-bf65-c074-51c3dfd1a147	00030000-565d-bf65-297b-eed3569b27b5
00020000-565d-bf65-c110-25c02712a55d	00030000-565d-bf65-1774-e9028102bb26
00020000-565d-bf65-c110-25c02712a55d	00030000-565d-bf65-c2cc-8f248dcf6ce3
00020000-565d-bf65-11d7-317556bf91eb	00030000-565d-bf65-1774-e9028102bb26
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-09bb-e8e0ac41d502
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-efc3-4ffdbb5b01d8
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-d838-acb78f4783b9
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-82d6-01f8974eb7dc
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-3dfe-339f89e38a31
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-0396-3287de034863
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-1232-23b400daa4bc
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-ad0e-5b80bb83ba72
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-13d9-4ec037d73d7d
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-3803-d5762c974b93
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-3ea8-3dacc54f9ebc
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-1d9e-ab67d08a50dd
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-2216-d995db178c67
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-819a-17faf74da557
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-73d4-91f88e083f86
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-df18-fb4770c89d02
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-e078-573ffb97ef4f
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-7541-df610c544709
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-e987-d505cde4230a
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-bce5-a9e550d08186
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-25a4-170afebb87ce
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-d783-2d8403c94d01
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-74ef-6c1785b2f54a
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-f87d-5b6a2754b34f
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-59f3-f6128393b25b
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-7ceb-e347402247ca
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-8f0e-7d7dd8ea0ea8
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-91f2-2d0f942824b4
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-c831-f2988ae37260
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-21ed-3535cf5e46f2
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-0916-785c89a334e8
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-123b-f806fe850ac8
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-b181-824c5e571302
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-f4c2-a586b761163a
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-614f-03b84d3b00d2
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-4c8b-c3f60b022022
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-b3d9-9c88703f75ec
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-db49-0d5c44aebf46
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-aef6-34ae49179e9c
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-e179-d2d25bffb923
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-1066-904bb9ddeb76
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-4943-5295ee8587a2
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-7963-07e0b8b399ba
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-7f96-2335714067d3
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-f824-11af86624078
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-fece-093f679aa1e9
00020000-565d-bf65-7bd8-4124cd1ffb4f	00030000-565d-bf65-297b-eed3569b27b5
00020000-565d-bf65-4f2e-f964180b6fba	00030000-565d-bf65-d838-acb78f4783b9
00020000-565d-bf65-4f2e-f964180b6fba	00030000-565d-bf65-3dfe-339f89e38a31
00020000-565d-bf65-4f2e-f964180b6fba	00030000-565d-bf65-1232-23b400daa4bc
00020000-565d-bf65-4f2e-f964180b6fba	00030000-565d-bf65-13d9-4ec037d73d7d
00020000-565d-bf65-4f2e-f964180b6fba	00030000-565d-bf65-3ea8-3dacc54f9ebc
00020000-565d-bf65-4f2e-f964180b6fba	00030000-565d-bf65-2216-d995db178c67
00020000-565d-bf65-4f2e-f964180b6fba	00030000-565d-bf65-73d4-91f88e083f86
00020000-565d-bf65-4f2e-f964180b6fba	00030000-565d-bf65-e078-573ffb97ef4f
00020000-565d-bf65-4f2e-f964180b6fba	00030000-565d-bf65-e987-d505cde4230a
00020000-565d-bf65-4f2e-f964180b6fba	00030000-565d-bf65-25a4-170afebb87ce
00020000-565d-bf65-4f2e-f964180b6fba	00030000-565d-bf65-91f2-2d0f942824b4
00020000-565d-bf65-4f2e-f964180b6fba	00030000-565d-bf65-8f0e-7d7dd8ea0ea8
00020000-565d-bf65-4f2e-f964180b6fba	00030000-565d-bf65-21ed-3535cf5e46f2
00020000-565d-bf65-4f2e-f964180b6fba	00030000-565d-bf65-aef6-34ae49179e9c
00020000-565d-bf65-4f2e-f964180b6fba	00030000-565d-bf65-7f96-2335714067d3
00020000-565d-bf65-4f2e-f964180b6fba	00030000-565d-bf65-f824-11af86624078
00020000-565d-bf65-4f2e-f964180b6fba	00030000-565d-bf65-fece-093f679aa1e9
00020000-565d-bf65-4f2e-f964180b6fba	00030000-565d-bf65-297b-eed3569b27b5
00020000-565d-bf65-813e-a1845b4317ca	00030000-565d-bf65-123b-f806fe850ac8
00020000-565d-bf65-813e-a1845b4317ca	00030000-565d-bf65-6dcb-2b4fe210f1ab
00020000-565d-bf65-813e-a1845b4317ca	00030000-565d-bf65-614f-03b84d3b00d2
00020000-565d-bf65-813e-a1845b4317ca	00030000-565d-bf65-9a17-e86b0eca34fb
00020000-565d-bf65-813e-a1845b4317ca	00030000-565d-bf65-aaf7-aae82e6993b7
00020000-565d-bf65-813e-a1845b4317ca	00030000-565d-bf65-f4c2-a586b761163a
00020000-565d-bf65-813e-a1845b4317ca	00030000-565d-bf65-9946-54a55dabe805
00020000-565d-bf65-813e-a1845b4317ca	00030000-565d-bf65-b3d9-9c88703f75ec
00020000-565d-bf65-813e-a1845b4317ca	00030000-565d-bf65-c831-f2988ae37260
00020000-565d-bf65-813e-a1845b4317ca	00030000-565d-bf65-4c8b-c3f60b022022
00020000-565d-bf65-813e-a1845b4317ca	00030000-565d-bf65-f824-11af86624078
00020000-565d-bf65-813e-a1845b4317ca	00030000-565d-bf65-1066-904bb9ddeb76
00020000-565d-bf65-813e-a1845b4317ca	00030000-565d-bf65-fece-093f679aa1e9
00020000-565d-bf65-813e-a1845b4317ca	00030000-565d-bf65-4943-5295ee8587a2
00020000-565d-bf65-813e-a1845b4317ca	00030000-565d-bf65-297b-eed3569b27b5
00020000-565d-bf65-813e-a1845b4317ca	00030000-565d-bf65-7963-07e0b8b399ba
00020000-565d-bf65-d889-ee760b87f913	00030000-565d-bf65-123b-f806fe850ac8
00020000-565d-bf65-d889-ee760b87f913	00030000-565d-bf65-614f-03b84d3b00d2
00020000-565d-bf65-d889-ee760b87f913	00030000-565d-bf65-aaf7-aae82e6993b7
00020000-565d-bf65-d889-ee760b87f913	00030000-565d-bf65-f4c2-a586b761163a
00020000-565d-bf65-d889-ee760b87f913	00030000-565d-bf65-b3d9-9c88703f75ec
00020000-565d-bf65-d889-ee760b87f913	00030000-565d-bf65-c831-f2988ae37260
00020000-565d-bf65-d889-ee760b87f913	00030000-565d-bf65-4c8b-c3f60b022022
00020000-565d-bf65-d889-ee760b87f913	00030000-565d-bf65-f824-11af86624078
00020000-565d-bf65-d889-ee760b87f913	00030000-565d-bf65-fece-093f679aa1e9
00020000-565d-bf65-d889-ee760b87f913	00030000-565d-bf65-4943-5295ee8587a2
00020000-565d-bf65-d889-ee760b87f913	00030000-565d-bf65-297b-eed3569b27b5
00020000-565d-bf65-ebd7-80c87528d831	00030000-565d-bf65-614f-03b84d3b00d2
00020000-565d-bf65-ebd7-80c87528d831	00030000-565d-bf65-9a17-e86b0eca34fb
00020000-565d-bf65-ebd7-80c87528d831	00030000-565d-bf65-f4c2-a586b761163a
00020000-565d-bf65-ebd7-80c87528d831	00030000-565d-bf65-b3d9-9c88703f75ec
00020000-565d-bf65-ebd7-80c87528d831	00030000-565d-bf65-db49-0d5c44aebf46
00020000-565d-bf65-ebd7-80c87528d831	00030000-565d-bf65-675b-abc8b65da09f
00020000-565d-bf65-ebd7-80c87528d831	00030000-565d-bf65-e179-d2d25bffb923
00020000-565d-bf65-ebd7-80c87528d831	00030000-565d-bf65-c831-f2988ae37260
00020000-565d-bf65-ebd7-80c87528d831	00030000-565d-bf65-b181-824c5e571302
00020000-565d-bf65-ebd7-80c87528d831	00030000-565d-bf65-739c-c9832abec6bd
00020000-565d-bf65-ebd7-80c87528d831	00030000-565d-bf65-4c8b-c3f60b022022
00020000-565d-bf65-ebd7-80c87528d831	00030000-565d-bf65-dc55-1372edac37c9
00020000-565d-bf65-ebd7-80c87528d831	00030000-565d-bf65-123b-f806fe850ac8
00020000-565d-bf65-ebd7-80c87528d831	00030000-565d-bf65-aa63-44b419134944
00020000-565d-bf65-0be3-e213a8f5eebc	00030000-565d-bf65-614f-03b84d3b00d2
00020000-565d-bf65-0be3-e213a8f5eebc	00030000-565d-bf65-f4c2-a586b761163a
00020000-565d-bf65-0be3-e213a8f5eebc	00030000-565d-bf65-b3d9-9c88703f75ec
00020000-565d-bf65-0be3-e213a8f5eebc	00030000-565d-bf65-db49-0d5c44aebf46
00020000-565d-bf65-0be3-e213a8f5eebc	00030000-565d-bf65-e179-d2d25bffb923
00020000-565d-bf65-0be3-e213a8f5eebc	00030000-565d-bf65-c831-f2988ae37260
00020000-565d-bf65-0be3-e213a8f5eebc	00030000-565d-bf65-b181-824c5e571302
00020000-565d-bf65-0be3-e213a8f5eebc	00030000-565d-bf65-4c8b-c3f60b022022
00020000-565d-bf65-0be3-e213a8f5eebc	00030000-565d-bf65-dc55-1372edac37c9
00020000-565d-bf65-0be3-e213a8f5eebc	00030000-565d-bf65-123b-f806fe850ac8
00020000-565d-bf65-0be3-e213a8f5eebc	00030000-565d-bf65-aa63-44b419134944
00020000-565d-bf65-f203-cc3850f17e29	00030000-565d-bf65-b181-824c5e571302
00020000-565d-bf65-f203-cc3850f17e29	00030000-565d-bf65-123b-f806fe850ac8
00020000-565d-bf65-f203-cc3850f17e29	00030000-565d-bf65-f4c2-a586b761163a
00020000-565d-bf65-f203-cc3850f17e29	00030000-565d-bf65-db49-0d5c44aebf46
00020000-565d-bf65-f203-cc3850f17e29	00030000-565d-bf65-c831-f2988ae37260
00020000-565d-bf65-f203-cc3850f17e29	00030000-565d-bf65-4c8b-c3f60b022022
00020000-565d-bf65-f203-cc3850f17e29	00030000-565d-bf65-b3d9-9c88703f75ec
00020000-565d-bf65-f6e8-21db3e1cd913	00030000-565d-bf65-b181-824c5e571302
00020000-565d-bf65-f6e8-21db3e1cd913	00030000-565d-bf65-739c-c9832abec6bd
00020000-565d-bf65-f6e8-21db3e1cd913	00030000-565d-bf65-123b-f806fe850ac8
00020000-565d-bf65-f6e8-21db3e1cd913	00030000-565d-bf65-e179-d2d25bffb923
00020000-565d-bf65-37c5-6aa3bc2de954	00030000-565d-bf65-b181-824c5e571302
00020000-565d-bf65-37c5-6aa3bc2de954	00030000-565d-bf65-123b-f806fe850ac8
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-c0bf-18f82552cb2f
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-614f-03b84d3b00d2
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-75c6-5fbe3e16a942
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-c131-62bad7aefb68
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-aaf7-aae82e6993b7
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-4638-091b9e278ec2
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-f824-11af86624078
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-1066-904bb9ddeb76
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-aef6-34ae49179e9c
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-f4c2-a586b761163a
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-5431-b323b2caf8bc
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-647b-62c9a9f347a0
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-b3d9-9c88703f75ec
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-9895-abc7ec57f6a9
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-e179-d2d25bffb923
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-cfe5-0635dd55dc60
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-ef0c-2bc420d7a01d
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-c04a-2d043178d99b
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-c831-f2988ae37260
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-f083-3144cac04fc2
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-dec6-8f70ffc1bff7
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-0749-d1efaad6bf02
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-4c8b-c3f60b022022
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-391b-7f1db117fe9b
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-1774-e9028102bb26
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-dc55-1372edac37c9
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-123b-f806fe850ac8
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-0916-785c89a334e8
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-297b-eed3569b27b5
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-7963-07e0b8b399ba
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-fece-093f679aa1e9
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-4943-5295ee8587a2
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-aa63-44b419134944
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-23e6-fbc8685549a7
00020000-565d-bf65-86f0-10c0f788f994	00030000-565d-bf65-6102-8f6fc8cc81d0
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-02ee-40b712789ed0
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-b5c3-c09479734b67
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-c0bf-18f82552cb2f
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-d21e-7f813493b2b1
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-614f-03b84d3b00d2
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-9a17-e86b0eca34fb
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-a55f-f662376f1a62
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-4c81-5545942fea3c
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-ebd1-2f3c57181cea
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-8127-baa331b87fdd
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-75c6-5fbe3e16a942
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-c131-62bad7aefb68
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-aaf7-aae82e6993b7
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-4638-091b9e278ec2
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-f824-11af86624078
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-1066-904bb9ddeb76
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-3861-c94058728b9a
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-79c7-30978289c163
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-b55b-1688cb6d1046
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-6492-53052e4929e0
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-ece5-b33680bce080
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-ca1e-0bfdf8e542e4
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-a6e8-ce6766032ee9
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-8f0e-7d7dd8ea0ea8
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-f87d-5b6a2754b34f
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-aef6-34ae49179e9c
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-d245-230323e5b0bb
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-1409-767f7087813b
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-cbf0-1af76a967a86
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-f4c2-a586b761163a
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-9946-54a55dabe805
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-7eee-617d2ca4d5e6
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-a489-dab9a118066a
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-f7a0-a7bb5e43a7e7
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-7f96-2335714067d3
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-7ceb-e347402247ca
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-5431-b323b2caf8bc
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-ced0-b0397a188917
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-fba1-dbe2c3d4d2e9
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-c808-2568eac64883
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-15a0-525556bf0e81
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-fede-2993cfa7fd40
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-c62f-f8c94f0c9512
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-783e-080dcd4aa063
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-c650-3c3afccdd52f
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-d4b3-51f82b6b5965
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-27ad-20ec317be8e8
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-326f-8c972f123706
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-065e-adc3eb972102
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-fbe2-82d3c834254d
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-e349-507ff323a381
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-6daa-d55253eae522
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-647b-62c9a9f347a0
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-408e-f5f3df97dcdd
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-b3d9-9c88703f75ec
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-15e5-b36b0f225775
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-9895-abc7ec57f6a9
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-bf31-cc9a25b848ca
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-b575-e6107f174dfe
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-4f61-7ed20c82e837
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-3371-eaf63317407a
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-db49-0d5c44aebf46
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-675b-abc8b65da09f
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-e179-d2d25bffb923
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-8aad-3da092966d69
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-cfe5-0635dd55dc60
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-6050-ba44deff6926
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-21ed-3535cf5e46f2
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-59f3-f6128393b25b
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-5da0-e1b1e0acaa8e
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-a319-c82f225fd432
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-ef0c-2bc420d7a01d
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-c04a-2d043178d99b
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-9691-402c7ee738bf
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-a963-d6f1f467e0d1
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-f52f-1129d272d5a8
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-e5f5-f77334194224
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-9a6f-e3cc2ecdb7b2
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-28ed-7649aea046f6
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-91f2-2d0f942824b4
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-74ef-6c1785b2f54a
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-c831-f2988ae37260
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-03c0-7ab2a43c9120
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-09bb-e8e0ac41d502
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-d838-acb78f4783b9
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-efc3-4ffdbb5b01d8
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-82d6-01f8974eb7dc
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-3dfe-339f89e38a31
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-0396-3287de034863
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-1232-23b400daa4bc
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-ad0e-5b80bb83ba72
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-13d9-4ec037d73d7d
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-3803-d5762c974b93
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-3ea8-3dacc54f9ebc
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-1d9e-ab67d08a50dd
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-2216-d995db178c67
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-819a-17faf74da557
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-73d4-91f88e083f86
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-df18-fb4770c89d02
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-e078-573ffb97ef4f
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-7541-df610c544709
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-e987-d505cde4230a
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-bce5-a9e550d08186
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-25a4-170afebb87ce
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-d783-2d8403c94d01
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-f083-3144cac04fc2
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-53e8-47bc674b9e2e
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-4d51-7b18bc964c40
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-bc0c-909bed4e4af9
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-7ac8-ffdd7de6a115
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-4b6c-a82dd5d433b6
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-4e89-c1ee01bd496f
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-0eb4-23bab9df731b
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-ff20-9bcf8bcd9abc
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-598d-1008efd54ffd
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-2836-738a34f2d96b
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-5c5c-4defebc98f0a
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-8b31-f108111f7411
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-8563-bb9efd633ed8
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-b7eb-5ce70746f269
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-ed44-07a6ccc5897a
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-257e-06e66f0582e7
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-ac9d-12b0d0de68f3
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-8c64-e2b9ca47e932
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-d3e8-b8d3594060f1
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-7a69-d84087194ea7
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-66db-6f0af7d6b401
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-2480-748afcc3250a
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-2036-2b232a3b293c
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-4b6f-0aac58fb42e3
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-6e39-20adc8cfc4fe
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-c6b1-0eded55e618c
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-8dac-f9e383bc095f
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-b181-824c5e571302
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-739c-c9832abec6bd
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-dec6-8f70ffc1bff7
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-0749-d1efaad6bf02
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-b536-e844d814a477
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-e489-3c38cd8d4f7f
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-d62e-d0c772f15c1d
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-4c8b-c3f60b022022
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-5e3f-0766189c242d
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-391b-7f1db117fe9b
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-e2bd-397c68fb7795
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-f920-66b8fae4ca4f
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-c32e-0cab3980d2c1
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-1774-e9028102bb26
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-c2cc-8f248dcf6ce3
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-dc55-1372edac37c9
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-d525-c1b33c432175
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-123b-f806fe850ac8
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-6dcb-2b4fe210f1ab
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-5e68-20b019a973f8
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-c4f9-49aec17cd6f9
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-dd1c-a14ead9e62b5
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-70e3-6217bcb982e0
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-0916-785c89a334e8
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-3131-b6b0788e0173
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-be6a-919d8bd00a7d
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-5764-2403fa7be544
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-fece-093f679aa1e9
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-4943-5295ee8587a2
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-297b-eed3569b27b5
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-7963-07e0b8b399ba
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-aa63-44b419134944
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-7d95-7e3d04dbe28e
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-7ac5-f266ccc1b5a0
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-2853-0139beef3e46
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-23e6-fbc8685549a7
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-d96d-2f9beefaeff5
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-6102-8f6fc8cc81d0
00020000-565d-bf67-2c23-1af6ac858ed4	00030000-565d-bf65-3888-543290f8599f
00020000-565d-bf67-0580-357516be0691	00030000-565d-bf65-297b-eed3569b27b5
00020000-565d-bf67-7a55-391e71eb0fa1	00030000-565d-bf65-7963-07e0b8b399ba
00020000-565d-bf67-3fc4-8a143793afdb	00030000-565d-bf65-6dcb-2b4fe210f1ab
00020000-565d-bf67-00c6-23828561d8ac	00030000-565d-bf65-123b-f806fe850ac8
00020000-565d-bf67-bc04-6c269601a8d9	00030000-565d-bf65-fede-2993cfa7fd40
00020000-565d-bf67-a769-edd630fe915e	00030000-565d-bf65-c62f-f8c94f0c9512
00020000-565d-bf67-e313-f1f4937bb2e2	00030000-565d-bf65-783e-080dcd4aa063
00020000-565d-bf67-cb62-c57eeb36ce54	00030000-565d-bf65-15a0-525556bf0e81
00020000-565d-bf67-6ada-b3849df2abf2	00030000-565d-bf65-c650-3c3afccdd52f
00020000-565d-bf67-8c16-ba7d6d80726c	00030000-565d-bf65-d4b3-51f82b6b5965
00020000-565d-bf67-87a3-c2e6d87bcc44	00030000-565d-bf65-fece-093f679aa1e9
00020000-565d-bf67-19f8-2a319fa4e759	00030000-565d-bf65-4943-5295ee8587a2
00020000-565d-bf67-7c05-adbfffe24065	00030000-565d-bf65-9895-abc7ec57f6a9
00020000-565d-bf67-d53b-9c5233abee2d	00030000-565d-bf65-b3d9-9c88703f75ec
00020000-565d-bf67-2790-e507906a646e	00030000-565d-bf65-1066-904bb9ddeb76
00020000-565d-bf67-53c7-f4a57bf09d74	00030000-565d-bf65-f824-11af86624078
00020000-565d-bf67-ad81-78370ae70079	00030000-565d-bf65-e179-d2d25bffb923
00020000-565d-bf67-ad81-78370ae70079	00030000-565d-bf65-8aad-3da092966d69
00020000-565d-bf67-ad81-78370ae70079	00030000-565d-bf65-123b-f806fe850ac8
\.


--
-- TOC entry 3141 (class 0 OID 30246779)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 30246813)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 30246950)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-565d-bf67-ebf9-e6c05aacc749	00090000-565d-bf67-41e4-7fcbc17ba4a7	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-565d-bf67-8bb9-95e8cb408ade	00090000-565d-bf67-6fa6-29c17c3205e9	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-565d-bf67-3241-ee6884fb3213	00090000-565d-bf67-fd0a-8cfc5c1555ff	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-565d-bf67-1f28-faa7ee404c3e	00090000-565d-bf67-3a6e-731c243ea618	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3112 (class 0 OID 30246471)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-565d-bf67-61d2-260f4e710ec6	\N	00040000-565d-bf64-5a95-e369ddaea9f9	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565d-bf67-e18d-3a5c276b63cc	\N	00040000-565d-bf64-5a95-e369ddaea9f9	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-565d-bf67-0c9b-1027ef5a4cca	\N	00040000-565d-bf64-5a95-e369ddaea9f9	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565d-bf67-79f4-f756c09eb950	\N	00040000-565d-bf64-5a95-e369ddaea9f9	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565d-bf67-4588-c2df9fa6d8fe	\N	00040000-565d-bf64-5a95-e369ddaea9f9	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565d-bf67-ed45-83aa1dc3d118	\N	00040000-565d-bf64-d1c6-f3db45f7b90d	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565d-bf67-da5a-3ad6b013a087	\N	00040000-565d-bf64-977e-582108056548	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565d-bf67-15f3-ec57a83e4b8c	\N	00040000-565d-bf64-88e0-b394f98afba9	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565d-bf67-5765-8c9d9c8b2831	\N	00040000-565d-bf64-896a-51cf6a7eadc5	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565d-bf69-4dfe-b319b58ceaa7	\N	00040000-565d-bf64-5a95-e369ddaea9f9	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3115 (class 0 OID 30246516)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-565d-bf64-fb5a-454491d3e88e	8341	Adlešiči
00050000-565d-bf64-8ab0-ed0e5dcbae3d	5270	Ajdovščina
00050000-565d-bf64-6547-d99e9e20cfea	6280	Ankaran/Ancarano
00050000-565d-bf64-2a75-d0649aeb1bea	9253	Apače
00050000-565d-bf64-6ff8-6265d34987a0	8253	Artiče
00050000-565d-bf64-68cf-ba95e0ebf74c	4275	Begunje na Gorenjskem
00050000-565d-bf64-7eed-3420b3d676db	1382	Begunje pri Cerknici
00050000-565d-bf64-1489-529ecb560de5	9231	Beltinci
00050000-565d-bf64-53f0-3b6fb3afdd83	2234	Benedikt
00050000-565d-bf64-5971-bb4c2b6b5dd5	2345	Bistrica ob Dravi
00050000-565d-bf64-fa03-f21eb2c8e5c3	3256	Bistrica ob Sotli
00050000-565d-bf64-eff0-f2196e5ec873	8259	Bizeljsko
00050000-565d-bf64-80c9-ea69918d4417	1223	Blagovica
00050000-565d-bf64-855e-1097ee63ab9d	8283	Blanca
00050000-565d-bf64-a44c-30924d7c7073	4260	Bled
00050000-565d-bf64-dbfc-775a2ad7fd3a	4273	Blejska Dobrava
00050000-565d-bf64-406a-a577f629d978	9265	Bodonci
00050000-565d-bf64-91fa-70347c57ac5e	9222	Bogojina
00050000-565d-bf64-fe89-abcb8655df76	4263	Bohinjska Bela
00050000-565d-bf64-8dda-7e36600f3e01	4264	Bohinjska Bistrica
00050000-565d-bf64-2fb1-93fff30ac38d	4265	Bohinjsko jezero
00050000-565d-bf64-6f9b-a89a0732b193	1353	Borovnica
00050000-565d-bf64-76ed-a070242b2e3a	8294	Boštanj
00050000-565d-bf64-19fc-c77ecacf59fa	5230	Bovec
00050000-565d-bf64-15e8-758ed2993cc2	5295	Branik
00050000-565d-bf64-b6a5-efdaf38a8751	3314	Braslovče
00050000-565d-bf64-fd9c-88e9fa76fbc6	5223	Breginj
00050000-565d-bf64-b3bd-01e07ae6874c	8280	Brestanica
00050000-565d-bf64-ce15-5790e20af639	2354	Bresternica
00050000-565d-bf64-b533-0b47a96d07e9	4243	Brezje
00050000-565d-bf64-414c-f543ae6c428c	1351	Brezovica pri Ljubljani
00050000-565d-bf64-35fe-591bc91a4dc2	8250	Brežice
00050000-565d-bf64-ea0a-11c123bbbee5	4210	Brnik - Aerodrom
00050000-565d-bf64-8912-c25221fdaa86	8321	Brusnice
00050000-565d-bf64-4a5b-c4d603916f69	3255	Buče
00050000-565d-bf64-4bea-03fc2811fe57	8276	Bučka 
00050000-565d-bf64-650c-164c5d61a370	9261	Cankova
00050000-565d-bf64-7975-a0473c5ed943	3000	Celje 
00050000-565d-bf64-25fa-aba97c58bc69	3001	Celje - poštni predali
00050000-565d-bf64-d0f4-c3b12af21a0f	4207	Cerklje na Gorenjskem
00050000-565d-bf64-430f-42a0621e61d3	8263	Cerklje ob Krki
00050000-565d-bf64-48b7-1d88318ef500	1380	Cerknica
00050000-565d-bf64-5429-fcb9b986c76d	5282	Cerkno
00050000-565d-bf64-9448-e5fb5ff42452	2236	Cerkvenjak
00050000-565d-bf64-02f3-42d2251bd5eb	2215	Ceršak
00050000-565d-bf64-0b53-bc2f732e0a3e	2326	Cirkovce
00050000-565d-bf64-7c71-5959b41a757e	2282	Cirkulane
00050000-565d-bf64-5d2c-d046d5423481	5273	Col
00050000-565d-bf64-c3ed-cc8d2f0b7881	8251	Čatež ob Savi
00050000-565d-bf64-41a9-97ff049bacd2	1413	Čemšenik
00050000-565d-bf64-9055-945488625b41	5253	Čepovan
00050000-565d-bf64-8402-35fcdb537728	9232	Črenšovci
00050000-565d-bf64-cfd5-4e02000070ef	2393	Črna na Koroškem
00050000-565d-bf64-dcc0-48fba608c117	6275	Črni Kal
00050000-565d-bf64-4812-aa3f45b4c2d2	5274	Črni Vrh nad Idrijo
00050000-565d-bf64-cfe7-1edbafd2989d	5262	Črniče
00050000-565d-bf64-f907-bc84bd18e1b9	8340	Črnomelj
00050000-565d-bf64-ca48-8643bbb63042	6271	Dekani
00050000-565d-bf64-a1cb-b8e3d350ae1a	5210	Deskle
00050000-565d-bf64-6569-edd908594e90	2253	Destrnik
00050000-565d-bf64-084e-ed06e8574db0	6215	Divača
00050000-565d-bf64-3f99-85cfdde94b99	1233	Dob
00050000-565d-bf64-6103-7fcdf22c96c0	3224	Dobje pri Planini
00050000-565d-bf64-c960-b8048e4d466b	8257	Dobova
00050000-565d-bf64-3a3d-a1dd5cab5a81	1423	Dobovec
00050000-565d-bf64-695c-a5d5b6d4d741	5263	Dobravlje
00050000-565d-bf64-f6ae-3a917417a59d	3204	Dobrna
00050000-565d-bf64-bb64-b83a5940f96f	8211	Dobrnič
00050000-565d-bf64-a808-e3c1bbbf34d4	1356	Dobrova
00050000-565d-bf64-9294-7b9c8311bf44	9223	Dobrovnik/Dobronak 
00050000-565d-bf64-6147-12c9f12ff59b	5212	Dobrovo v Brdih
00050000-565d-bf64-efe4-efa4209de7e6	1431	Dol pri Hrastniku
00050000-565d-bf64-6548-d2cd123396ad	1262	Dol pri Ljubljani
00050000-565d-bf64-6341-fa6963fc5834	1273	Dole pri Litiji
00050000-565d-bf64-544e-610312700b82	1331	Dolenja vas
00050000-565d-bf64-b18a-abb76e7714ee	8350	Dolenjske Toplice
00050000-565d-bf64-c9be-a090832edcf3	1230	Domžale
00050000-565d-bf64-37b0-884b5ea057a4	2252	Dornava
00050000-565d-bf64-9970-0bae3fadf298	5294	Dornberk
00050000-565d-bf64-9cab-639767058a30	1319	Draga
00050000-565d-bf64-0fa6-0493185b45b5	8343	Dragatuš
00050000-565d-bf64-4d7c-1a373f8c32ca	3222	Dramlje
00050000-565d-bf64-c8bd-4a36329ffd7f	2370	Dravograd
00050000-565d-bf64-b49b-eb54b93ade67	4203	Duplje
00050000-565d-bf64-9105-7709c5f353c8	6221	Dutovlje
00050000-565d-bf64-4294-52ff7cbcd552	8361	Dvor
00050000-565d-bf64-0e02-dae6a3f8d77a	2343	Fala
00050000-565d-bf64-1379-d210af41bf61	9208	Fokovci
00050000-565d-bf64-01fe-a7533cce8a82	2313	Fram
00050000-565d-bf64-6350-51209cffe768	3213	Frankolovo
00050000-565d-bf64-e710-2b6953a3f40a	1274	Gabrovka
00050000-565d-bf64-0391-5fc5b1e388f9	8254	Globoko
00050000-565d-bf64-cc54-5a32902e5fe6	5275	Godovič
00050000-565d-bf64-8034-cd71a34826be	4204	Golnik
00050000-565d-bf64-9aec-b918aa8c9575	3303	Gomilsko
00050000-565d-bf64-7864-3cee85e72aab	4224	Gorenja vas
00050000-565d-bf64-3225-f8dc2970618c	3263	Gorica pri Slivnici
00050000-565d-bf64-c1b2-359e01ad1ab7	2272	Gorišnica
00050000-565d-bf64-ca85-64179c6ca8c7	9250	Gornja Radgona
00050000-565d-bf64-0eff-0e70896628b6	3342	Gornji Grad
00050000-565d-bf64-b622-570de895b0a8	4282	Gozd Martuljek
00050000-565d-bf64-a469-3a0ef57a7f03	6272	Gračišče
00050000-565d-bf64-399a-83e105824075	9264	Grad
00050000-565d-bf64-1007-a4f52b4b2626	8332	Gradac
00050000-565d-bf64-0f6c-1028c9569d76	1384	Grahovo
00050000-565d-bf64-83b3-043525e7a6e2	5242	Grahovo ob Bači
00050000-565d-bf64-fef2-b94d7fe76c19	5251	Grgar
00050000-565d-bf64-fce0-a6211a2f6b9d	3302	Griže
00050000-565d-bf64-f803-063ca2d21d16	3231	Grobelno
00050000-565d-bf64-f6d9-84ac56f6585f	1290	Grosuplje
00050000-565d-bf64-84b8-603efaf08339	2288	Hajdina
00050000-565d-bf64-d0e0-8a984578876f	8362	Hinje
00050000-565d-bf64-dd1a-388dfa9c1095	2311	Hoče
00050000-565d-bf64-a4bd-63e21e52bad7	9205	Hodoš/Hodos
00050000-565d-bf64-77bc-86e704f966d8	1354	Horjul
00050000-565d-bf64-ee02-b58f2eca1368	1372	Hotedršica
00050000-565d-bf64-7018-01ec8cc00e47	1430	Hrastnik
00050000-565d-bf64-cba9-fa35dbc5aad5	6225	Hruševje
00050000-565d-bf64-b004-c2e730870a7e	4276	Hrušica
00050000-565d-bf64-303f-624d2f0db538	5280	Idrija
00050000-565d-bf64-d76a-9fe95453bf73	1292	Ig
00050000-565d-bf64-6fc6-71bfd5623103	6250	Ilirska Bistrica
00050000-565d-bf64-4b3a-2805cfe2056f	6251	Ilirska Bistrica-Trnovo
00050000-565d-bf64-f71c-420e65d896a4	1295	Ivančna Gorica
00050000-565d-bf64-ee7a-1494eced6f2b	2259	Ivanjkovci
00050000-565d-bf64-0f20-f1c9a571e684	1411	Izlake
00050000-565d-bf64-4d22-3b4cc5dff56b	6310	Izola/Isola
00050000-565d-bf64-9f7c-560a24a46a2b	2222	Jakobski Dol
00050000-565d-bf64-960a-f7b9b191042b	2221	Jarenina
00050000-565d-bf64-6383-1c22058a20ed	6254	Jelšane
00050000-565d-bf64-f044-32ded6d4dc99	4270	Jesenice
00050000-565d-bf64-1fbb-f1b91f904b70	8261	Jesenice na Dolenjskem
00050000-565d-bf64-8fbb-910bc0e10517	3273	Jurklošter
00050000-565d-bf64-5fc1-17312ba0eca3	2223	Jurovski Dol
00050000-565d-bf64-9d0d-d908171c424f	2256	Juršinci
00050000-565d-bf64-f07e-dae4d6b37b92	5214	Kal nad Kanalom
00050000-565d-bf64-44d8-c2f0ab1e3172	3233	Kalobje
00050000-565d-bf64-41de-3f6cb260b57d	4246	Kamna Gorica
00050000-565d-bf64-68b3-64ca44b01123	2351	Kamnica
00050000-565d-bf64-2041-ef889489f2b2	1241	Kamnik
00050000-565d-bf64-8a50-9fb108600729	5213	Kanal
00050000-565d-bf64-3d53-424ca2c2f868	8258	Kapele
00050000-565d-bf64-f759-5118acf9d4f5	2362	Kapla
00050000-565d-bf64-41a1-bb4674cd52a4	2325	Kidričevo
00050000-565d-bf64-2579-7512e9db9e11	1412	Kisovec
00050000-565d-bf64-4aac-3381f2cb7ae2	6253	Knežak
00050000-565d-bf64-f3c7-ca2689a934a5	5222	Kobarid
00050000-565d-bf64-48b6-fda410aa45d1	9227	Kobilje
00050000-565d-bf64-20c7-cb6d67d585e3	1330	Kočevje
00050000-565d-bf64-c2c4-1c497f3aba2f	1338	Kočevska Reka
00050000-565d-bf64-5e57-7afb71b97691	2276	Kog
00050000-565d-bf64-566b-70f60e5489ce	5211	Kojsko
00050000-565d-bf64-d6cc-dca1e11d0a04	6223	Komen
00050000-565d-bf64-b488-57bcb25c6870	1218	Komenda
00050000-565d-bf64-31d5-b6f5daa5e263	6000	Koper/Capodistria 
00050000-565d-bf64-fddb-2c0d0130c37c	6001	Koper/Capodistria - poštni predali
00050000-565d-bf64-060e-e32fe24313be	8282	Koprivnica
00050000-565d-bf64-524c-fd35982b793a	5296	Kostanjevica na Krasu
00050000-565d-bf64-d5e1-b3aed09d00ff	8311	Kostanjevica na Krki
00050000-565d-bf64-d6e6-328ecdde470a	1336	Kostel
00050000-565d-bf64-3d31-d89c7c7b2140	6256	Košana
00050000-565d-bf64-755f-c47641bdd963	2394	Kotlje
00050000-565d-bf64-4c5d-7a83f270383b	6240	Kozina
00050000-565d-bf64-5291-47e3070ead39	3260	Kozje
00050000-565d-bf64-dffa-5e45b6c400de	4000	Kranj 
00050000-565d-bf64-2f56-9eae377ad99f	4001	Kranj - poštni predali
00050000-565d-bf64-4031-cd49937dafc6	4280	Kranjska Gora
00050000-565d-bf64-3689-33ee14306f7d	1281	Kresnice
00050000-565d-bf64-c7e9-a82f957f61b1	4294	Križe
00050000-565d-bf64-755b-91d8101ecf54	9206	Križevci
00050000-565d-bf64-a024-b80716e52e51	9242	Križevci pri Ljutomeru
00050000-565d-bf64-a9fa-eeff3f637190	1301	Krka
00050000-565d-bf64-ec3f-86b16334ded2	8296	Krmelj
00050000-565d-bf64-cf71-5984669acc9d	4245	Kropa
00050000-565d-bf64-0be5-37121474e24d	8262	Krška vas
00050000-565d-bf64-3f90-971618e5612c	8270	Krško
00050000-565d-bf64-ddcd-5ce11fd00258	9263	Kuzma
00050000-565d-bf64-0744-4fd3e1555372	2318	Laporje
00050000-565d-bf64-2e83-33a333c72442	3270	Laško
00050000-565d-bf64-c119-5fd029c6645a	1219	Laze v Tuhinju
00050000-565d-bf64-de2a-87b91084e7d1	2230	Lenart v Slovenskih goricah
00050000-565d-bf64-0f8a-cfd0d53c1fda	9220	Lendava/Lendva
00050000-565d-bf64-aa58-ad9b52dec87d	4248	Lesce
00050000-565d-bf64-4797-61a1b7121553	3261	Lesično
00050000-565d-bf64-c992-0426d18aed79	8273	Leskovec pri Krškem
00050000-565d-bf64-4178-e68ba7e3e848	2372	Libeliče
00050000-565d-bf64-fb33-7d3ad75b911b	2341	Limbuš
00050000-565d-bf64-19b2-d85504bd5825	1270	Litija
00050000-565d-bf64-c735-ee119bb191d8	3202	Ljubečna
00050000-565d-bf64-34bc-dd355619290b	1000	Ljubljana 
00050000-565d-bf64-87b0-465f93b6b7d2	1001	Ljubljana - poštni predali
00050000-565d-bf64-f622-63e3de5a018f	1231	Ljubljana - Črnuče
00050000-565d-bf64-a0a4-ed853010643c	1261	Ljubljana - Dobrunje
00050000-565d-bf64-c227-31b1df23db61	1260	Ljubljana - Polje
00050000-565d-bf64-478d-daf4834f78c6	1210	Ljubljana - Šentvid
00050000-565d-bf64-830b-0eeb34cade7f	1211	Ljubljana - Šmartno
00050000-565d-bf64-84fc-b18d04362011	3333	Ljubno ob Savinji
00050000-565d-bf64-4039-d9664d181c6a	9240	Ljutomer
00050000-565d-bf64-8bf0-32a3ac75d5fd	3215	Loče
00050000-565d-bf64-707a-08486812a66e	5231	Log pod Mangartom
00050000-565d-bf64-2a22-d31c94427a65	1358	Log pri Brezovici
00050000-565d-bf64-31ec-e187a0f09519	1370	Logatec
00050000-565d-bf64-9019-9049297ca880	1371	Logatec
00050000-565d-bf64-fb16-a0fddef2c2a5	1434	Loka pri Zidanem Mostu
00050000-565d-bf64-5c7e-4b9fb1e83b93	3223	Loka pri Žusmu
00050000-565d-bf64-baa9-041f445ee393	6219	Lokev
00050000-565d-bf64-2ce9-b1d25e646487	1318	Loški Potok
00050000-565d-bf64-702c-1e44f6ae70ac	2324	Lovrenc na Dravskem polju
00050000-565d-bf64-e52a-49729f572848	2344	Lovrenc na Pohorju
00050000-565d-bf64-ad5f-ce07c22d3cca	3334	Luče
00050000-565d-bf64-1b3c-fada49a6a1ef	1225	Lukovica
00050000-565d-bf64-35a5-6c41d54105c4	9202	Mačkovci
00050000-565d-bf64-d429-5ab46f2fbaf4	2322	Majšperk
00050000-565d-bf64-1f91-fa875c84bc84	2321	Makole
00050000-565d-bf64-0d78-22578eb9e1a2	9243	Mala Nedelja
00050000-565d-bf64-fd4b-ac3d0ef1aa60	2229	Malečnik
00050000-565d-bf64-2c08-c4a3a22978d7	6273	Marezige
00050000-565d-bf64-2b1f-b580646cba8a	2000	Maribor 
00050000-565d-bf64-7dde-7b6bbead3b6b	2001	Maribor - poštni predali
00050000-565d-bf64-d20f-ff715f6072cc	2206	Marjeta na Dravskem polju
00050000-565d-bf64-e4bd-43e51f4336fa	2281	Markovci
00050000-565d-bf64-24e8-9df7b14a858f	9221	Martjanci
00050000-565d-bf64-62c2-2757f0e3aa93	6242	Materija
00050000-565d-bf64-4a13-c40ae05e7ff6	4211	Mavčiče
00050000-565d-bf64-a2a7-6c4587c581d7	1215	Medvode
00050000-565d-bf64-10cd-c0d045f6c3b2	1234	Mengeš
00050000-565d-bf64-69f9-0d306242fde6	8330	Metlika
00050000-565d-bf64-f9dc-a6d641ebae05	2392	Mežica
00050000-565d-bf64-9854-b63e2b10f670	2204	Miklavž na Dravskem polju
00050000-565d-bf64-4850-3be7bbc83ae5	2275	Miklavž pri Ormožu
00050000-565d-bf64-f626-7a659a663257	5291	Miren
00050000-565d-bf64-d522-60528e778f90	8233	Mirna
00050000-565d-bf64-73ff-bb7cdb2fb6a6	8216	Mirna Peč
00050000-565d-bf64-7ce3-eff9c33b4607	2382	Mislinja
00050000-565d-bf64-8d70-ae620d6c4d22	4281	Mojstrana
00050000-565d-bf64-18de-ed266e2bda49	8230	Mokronog
00050000-565d-bf64-4282-2920838896c1	1251	Moravče
00050000-565d-bf64-4e56-d8375333cc2f	9226	Moravske Toplice
00050000-565d-bf64-7026-21789c9683ef	5216	Most na Soči
00050000-565d-bf64-358d-13c1623f315b	1221	Motnik
00050000-565d-bf64-1a81-9f9295d8988c	3330	Mozirje
00050000-565d-bf64-3033-0bf619b0c1b0	9000	Murska Sobota 
00050000-565d-bf64-dd45-b8c6bc503e57	9001	Murska Sobota - poštni predali
00050000-565d-bf64-a6c5-492bb944ab85	2366	Muta
00050000-565d-bf64-1bef-da27dcdc93f2	4202	Naklo
00050000-565d-bf64-f96a-654064776dd8	3331	Nazarje
00050000-565d-bf64-2c61-beb7d3217d66	1357	Notranje Gorice
00050000-565d-bf64-fe23-66f5486ad04c	3203	Nova Cerkev
00050000-565d-bf64-31d4-6ecc82cd00fa	5000	Nova Gorica 
00050000-565d-bf64-2081-7b4247c84201	5001	Nova Gorica - poštni predali
00050000-565d-bf64-e37f-b1bc22ac735c	1385	Nova vas
00050000-565d-bf64-de01-39224ead1d49	8000	Novo mesto
00050000-565d-bf64-f370-189d6466f400	8001	Novo mesto - poštni predali
00050000-565d-bf64-222a-6204a764f42e	6243	Obrov
00050000-565d-bf64-54bb-a5c1cac9a774	9233	Odranci
00050000-565d-bf64-09f3-9fa4221c29f3	2317	Oplotnica
00050000-565d-bf64-019d-be0b372705da	2312	Orehova vas
00050000-565d-bf64-889f-7c977677d399	2270	Ormož
00050000-565d-bf64-1047-b7babfa27c4c	1316	Ortnek
00050000-565d-bf64-fb06-6f23972c5696	1337	Osilnica
00050000-565d-bf64-1fac-4e93f5f6f44f	8222	Otočec
00050000-565d-bf64-dea5-790d241d8f90	2361	Ožbalt
00050000-565d-bf64-32d3-e10395a86ba7	2231	Pernica
00050000-565d-bf64-5675-7062a977b98d	2211	Pesnica pri Mariboru
00050000-565d-bf64-a91a-08096e0caa4e	9203	Petrovci
00050000-565d-bf64-0726-7c2cf4c147a8	3301	Petrovče
00050000-565d-bf64-e00b-5907070afd0c	6330	Piran/Pirano
00050000-565d-bf64-dad0-fc081581a52b	8255	Pišece
00050000-565d-bf64-d9ce-0fb6c2d1e0af	6257	Pivka
00050000-565d-bf64-8661-d243987da763	6232	Planina
00050000-565d-bf64-35fb-a35fb1a75c74	3225	Planina pri Sevnici
00050000-565d-bf64-1556-95dc86738873	6276	Pobegi
00050000-565d-bf64-bf68-db30a6f2e1ec	8312	Podbočje
00050000-565d-bf64-7bda-ad01963ccb38	5243	Podbrdo
00050000-565d-bf64-951e-22fcc188e572	3254	Podčetrtek
00050000-565d-bf64-c5a8-ff2524a2b7c9	2273	Podgorci
00050000-565d-bf64-3837-c518fb099393	6216	Podgorje
00050000-565d-bf64-09e7-8637896ce4f1	2381	Podgorje pri Slovenj Gradcu
00050000-565d-bf64-5c81-00552b66918f	6244	Podgrad
00050000-565d-bf64-75d9-9a8b362d9d4c	1414	Podkum
00050000-565d-bf64-5ba0-b13e5b9f2cc0	2286	Podlehnik
00050000-565d-bf64-87f7-3afe8a7a0665	5272	Podnanos
00050000-565d-bf64-e3af-d3e704399d3d	4244	Podnart
00050000-565d-bf64-718a-4fe40cccf1d9	3241	Podplat
00050000-565d-bf64-c2a1-96022230ad41	3257	Podsreda
00050000-565d-bf64-13f8-9dddb3542bd5	2363	Podvelka
00050000-565d-bf64-753e-e4cb10e12eec	2208	Pohorje
00050000-565d-bf64-8120-e84e2418f24c	2257	Polenšak
00050000-565d-bf64-b066-16cb761ce9ea	1355	Polhov Gradec
00050000-565d-bf64-9470-73522edb454e	4223	Poljane nad Škofjo Loko
00050000-565d-bf64-2c90-1de45db8af97	2319	Poljčane
00050000-565d-bf64-3c7c-b1a871982830	1272	Polšnik
00050000-565d-bf64-181c-8adefa385e83	3313	Polzela
00050000-565d-bf64-0832-c3d8b5083c32	3232	Ponikva
00050000-565d-bf64-386d-be615ed34388	6320	Portorož/Portorose
00050000-565d-bf64-ffd3-18b38a8bade8	6230	Postojna
00050000-565d-bf64-9771-c6a872245e7f	2331	Pragersko
00050000-565d-bf64-74ad-6ec1f3f0dcd1	3312	Prebold
00050000-565d-bf64-3f02-7cfd8a7c7351	4205	Preddvor
00050000-565d-bf64-36aa-ebef41f047e4	6255	Prem
00050000-565d-bf64-e9c3-f7e05cdfea1f	1352	Preserje
00050000-565d-bf64-301c-c1895b1c8ddc	6258	Prestranek
00050000-565d-bf64-1717-fac154d1190f	2391	Prevalje
00050000-565d-bf64-a0ca-d8127e68171c	3262	Prevorje
00050000-565d-bf64-a2fc-45d9db0721fb	1276	Primskovo 
00050000-565d-bf64-8ea2-31bb7b109991	3253	Pristava pri Mestinju
00050000-565d-bf64-d8b5-6485e6bf6b03	9207	Prosenjakovci/Partosfalva
00050000-565d-bf64-922b-ba6bc36efbf7	5297	Prvačina
00050000-565d-bf64-2c55-b7875b0d8451	2250	Ptuj
00050000-565d-bf64-0f46-578827474c8e	2323	Ptujska Gora
00050000-565d-bf64-d69b-9b6ca7d800a1	9201	Puconci
00050000-565d-bf64-8c6b-3042305610cb	2327	Rače
00050000-565d-bf64-324f-612cfde7bef3	1433	Radeče
00050000-565d-bf64-8063-96bcbf3d49a9	9252	Radenci
00050000-565d-bf64-bcd5-1114deaf5e79	2360	Radlje ob Dravi
00050000-565d-bf64-0e4f-40bb3d98cdcc	1235	Radomlje
00050000-565d-bf64-dfd1-8a2f911d0585	4240	Radovljica
00050000-565d-bf64-1dc9-3099b4d11699	8274	Raka
00050000-565d-bf64-3e0a-5ba7e2fcbc22	1381	Rakek
00050000-565d-bf64-2b88-ef2c067d5edb	4283	Rateče - Planica
00050000-565d-bf64-33a5-69b747879d31	2390	Ravne na Koroškem
00050000-565d-bf64-18ef-2a7e1211bd8c	9246	Razkrižje
00050000-565d-bf64-c330-e125c3b544c9	3332	Rečica ob Savinji
00050000-565d-bf64-5985-ce8f2bd28799	5292	Renče
00050000-565d-bf64-a192-106141893f48	1310	Ribnica
00050000-565d-bf64-dfe8-3c498ccd3d8f	2364	Ribnica na Pohorju
00050000-565d-bf64-d0b1-6051bb15ff94	3272	Rimske Toplice
00050000-565d-bf64-3bb5-ea354c5b15a9	1314	Rob
00050000-565d-bf64-e0dd-c1eb3298edc9	5215	Ročinj
00050000-565d-bf64-14f8-370a9bb87f42	3250	Rogaška Slatina
00050000-565d-bf64-80e3-d5c323238f4c	9262	Rogašovci
00050000-565d-bf64-8310-bbfde8c9721f	3252	Rogatec
00050000-565d-bf64-7e72-a8a7de6d8b05	1373	Rovte
00050000-565d-bf64-0a2e-9d02d5a38072	2342	Ruše
00050000-565d-bf64-670f-03e73d36a8b2	1282	Sava
00050000-565d-bf64-9efe-fa39bfb2f609	6333	Sečovlje/Sicciole
00050000-565d-bf64-c123-31b26f405fc5	4227	Selca
00050000-565d-bf64-00e8-21624e694d0c	2352	Selnica ob Dravi
00050000-565d-bf64-b9e3-332284536050	8333	Semič
00050000-565d-bf64-4a5a-e7be07a3baf0	8281	Senovo
00050000-565d-bf64-1d44-870b56dd58c4	6224	Senožeče
00050000-565d-bf64-641e-14726563350c	8290	Sevnica
00050000-565d-bf64-913a-0e4fc3572714	6210	Sežana
00050000-565d-bf64-2868-fcab1e87bd80	2214	Sladki Vrh
00050000-565d-bf64-a34c-c386e5a81b02	5283	Slap ob Idrijci
00050000-565d-bf64-7239-98a71e40742e	2380	Slovenj Gradec
00050000-565d-bf64-941b-bb8c10d27629	2310	Slovenska Bistrica
00050000-565d-bf64-faf6-00dadf6c9e47	3210	Slovenske Konjice
00050000-565d-bf64-1f00-f9f7cf2518d2	1216	Smlednik
00050000-565d-bf64-8bfb-eee8253fc892	5232	Soča
00050000-565d-bf64-ae8f-5845cb99e02e	1317	Sodražica
00050000-565d-bf64-9fd9-d7f750c128c2	3335	Solčava
00050000-565d-bf64-cc80-1a2739dafd3c	5250	Solkan
00050000-565d-bf64-c24a-3efdf8e1f8af	4229	Sorica
00050000-565d-bf64-e567-2b053f89d5b1	4225	Sovodenj
00050000-565d-bf64-689b-51c11a2b2b47	5281	Spodnja Idrija
00050000-565d-bf64-ec4b-6bb205ac4a95	2241	Spodnji Duplek
00050000-565d-bf64-4fbe-147d2db42bcc	9245	Spodnji Ivanjci
00050000-565d-bf64-84ff-6a1dee4ef74f	2277	Središče ob Dravi
00050000-565d-bf64-14bc-5faf0b48ccb9	4267	Srednja vas v Bohinju
00050000-565d-bf64-549d-d9b5e2d9ad06	8256	Sromlje 
00050000-565d-bf64-1253-80bf5a85237c	5224	Srpenica
00050000-565d-bf64-48db-5e4e0b3ebcfe	1242	Stahovica
00050000-565d-bf64-326b-8924a175331e	1332	Stara Cerkev
00050000-565d-bf64-2bbb-b622f034aba4	8342	Stari trg ob Kolpi
00050000-565d-bf64-ea9d-35de9d42eda8	1386	Stari trg pri Ložu
00050000-565d-bf64-eeb8-31a3b9d56681	2205	Starše
00050000-565d-bf64-b1bf-c386930f7d40	2289	Stoperce
00050000-565d-bf64-018f-226e38f89dac	8322	Stopiče
00050000-565d-bf64-51e7-e1f98665dff9	3206	Stranice
00050000-565d-bf64-1afa-47211ea3c9ab	8351	Straža
00050000-565d-bf64-21f1-45973af7a95b	1313	Struge
00050000-565d-bf64-326e-bbedd4cf5d84	8293	Studenec
00050000-565d-bf64-d38c-98e09a362849	8331	Suhor
00050000-565d-bf64-03eb-fed54b600e30	2233	Sv. Ana v Slovenskih goricah
00050000-565d-bf64-1ae7-8d7ae81105f6	2235	Sv. Trojica v Slovenskih goricah
00050000-565d-bf64-974a-23b7fbb5ee4e	2353	Sveti Duh na Ostrem Vrhu
00050000-565d-bf64-6e23-efece177f3ab	9244	Sveti Jurij ob Ščavnici
00050000-565d-bf64-e6c8-3f374dc14522	3264	Sveti Štefan
00050000-565d-bf64-f3eb-386afe4615a6	2258	Sveti Tomaž
00050000-565d-bf64-3b2f-b08c056fc5ed	9204	Šalovci
00050000-565d-bf64-8422-311ed9f13adb	5261	Šempas
00050000-565d-bf64-9c1f-d3f89d2b6bce	5290	Šempeter pri Gorici
00050000-565d-bf64-9d0e-ec89b0c6980a	3311	Šempeter v Savinjski dolini
00050000-565d-bf64-d8d5-006408d83e9a	4208	Šenčur
00050000-565d-bf64-5b75-1c7eb6fb6756	2212	Šentilj v Slovenskih goricah
00050000-565d-bf64-e7b5-4f52ae8297e5	8297	Šentjanž
00050000-565d-bf64-8e96-2fbff47a74ad	2373	Šentjanž pri Dravogradu
00050000-565d-bf64-5c3f-f0b3f6b984b8	8310	Šentjernej
00050000-565d-bf64-7142-2441cab09039	3230	Šentjur
00050000-565d-bf64-be9b-b38b1d899f32	3271	Šentrupert
00050000-565d-bf64-b2ea-a8ae577dfdc4	8232	Šentrupert
00050000-565d-bf64-fbce-92c65fe0ad60	1296	Šentvid pri Stični
00050000-565d-bf64-7c8e-e24a935e0aaf	8275	Škocjan
00050000-565d-bf64-9f28-3b962203c199	6281	Škofije
00050000-565d-bf64-9e6f-e74af466cb06	4220	Škofja Loka
00050000-565d-bf64-6f6e-f223200d19a8	3211	Škofja vas
00050000-565d-bf64-9f5f-705921aab12c	1291	Škofljica
00050000-565d-bf64-1a1c-d732151526a6	6274	Šmarje
00050000-565d-bf64-fc38-5bc4dba8292d	1293	Šmarje - Sap
00050000-565d-bf64-4a49-d49d8802cae3	3240	Šmarje pri Jelšah
00050000-565d-bf64-72fb-1b421a85601a	8220	Šmarješke Toplice
00050000-565d-bf64-694f-cbf4f79bc904	2315	Šmartno na Pohorju
00050000-565d-bf64-dc6d-d8f0481c641e	3341	Šmartno ob Dreti
00050000-565d-bf64-eb9f-38dbb3c47ff5	3327	Šmartno ob Paki
00050000-565d-bf64-4a50-53b064225c8f	1275	Šmartno pri Litiji
00050000-565d-bf64-627d-0e87fa6baa39	2383	Šmartno pri Slovenj Gradcu
00050000-565d-bf64-83a7-915baa59e705	3201	Šmartno v Rožni dolini
00050000-565d-bf64-6f66-2030da31079f	3325	Šoštanj
00050000-565d-bf64-35fb-3c2b4e2ff6f8	6222	Štanjel
00050000-565d-bf64-085b-1236930539ee	3220	Štore
00050000-565d-bf64-115a-9a85904b43ec	3304	Tabor
00050000-565d-bf64-f21a-0abc48a5fcb5	3221	Teharje
00050000-565d-bf64-e87c-eaa815c1ef18	9251	Tišina
00050000-565d-bf64-d1ae-fa77d3d6896b	5220	Tolmin
00050000-565d-bf64-6b2c-dfe33ded373e	3326	Topolšica
00050000-565d-bf64-4672-4c2256e3b5ae	2371	Trbonje
00050000-565d-bf64-e4e4-15af1180e500	1420	Trbovlje
00050000-565d-bf64-ad9d-338cacbf0b71	8231	Trebelno 
00050000-565d-bf64-1996-16fe1e60352e	8210	Trebnje
00050000-565d-bf64-5fff-a8c5598351d4	5252	Trnovo pri Gorici
00050000-565d-bf64-2407-242c891b0313	2254	Trnovska vas
00050000-565d-bf64-0f1b-939b79eb108e	1222	Trojane
00050000-565d-bf64-de9f-e9454778fb93	1236	Trzin
00050000-565d-bf64-9b12-0f7eabd0ffc1	4290	Tržič
00050000-565d-bf64-267a-a4b434b0f5a1	8295	Tržišče
00050000-565d-bf64-cf87-b4bd22d04086	1311	Turjak
00050000-565d-bf64-ba4b-601f4dc3cdae	9224	Turnišče
00050000-565d-bf64-bbc2-9dd6ce24f6c6	8323	Uršna sela
00050000-565d-bf64-0b7f-f93690beb3b6	1252	Vače
00050000-565d-bf64-538c-fa3ddbf907ec	3320	Velenje 
00050000-565d-bf64-de3b-268759c2da61	3322	Velenje - poštni predali
00050000-565d-bf64-19e5-2485b3670a51	8212	Velika Loka
00050000-565d-bf64-2a86-6f8dec178c05	2274	Velika Nedelja
00050000-565d-bf64-21ad-512c37626ed5	9225	Velika Polana
00050000-565d-bf64-e2e3-0ba9fa55689a	1315	Velike Lašče
00050000-565d-bf64-1106-ec61071d8fd4	8213	Veliki Gaber
00050000-565d-bf64-aa4f-3f5062f350d9	9241	Veržej
00050000-565d-bf64-ebb5-a1c3741c9cca	1312	Videm - Dobrepolje
00050000-565d-bf64-7a50-b83d41ff53c7	2284	Videm pri Ptuju
00050000-565d-bf64-5719-a2eb8a2d9e9d	8344	Vinica
00050000-565d-bf64-bd5a-bfab5788fa80	5271	Vipava
00050000-565d-bf64-c1dc-aa4a76b11598	4212	Visoko
00050000-565d-bf64-3877-ac67d1830724	1294	Višnja Gora
00050000-565d-bf64-4c99-6d82c7bfe52c	3205	Vitanje
00050000-565d-bf64-ffd9-2afb45eda982	2255	Vitomarci
00050000-565d-bf64-0373-43572663f41a	1217	Vodice
00050000-565d-bf64-312b-7205a0a42f54	3212	Vojnik\t
00050000-565d-bf64-4112-5805edfeb2d5	5293	Volčja Draga
00050000-565d-bf64-57b3-4e03d03c8b9a	2232	Voličina
00050000-565d-bf64-0863-46be9b61cd68	3305	Vransko
00050000-565d-bf64-cda8-ea95523daa79	6217	Vremski Britof
00050000-565d-bf64-3929-59611aa1a573	1360	Vrhnika
00050000-565d-bf64-e774-f0777124a54f	2365	Vuhred
00050000-565d-bf64-9b36-4278f7da4f39	2367	Vuzenica
00050000-565d-bf64-e694-106bb3ac4d14	8292	Zabukovje 
00050000-565d-bf64-072c-a88f0fc59282	1410	Zagorje ob Savi
00050000-565d-bf64-2a7a-b486541f9ed7	1303	Zagradec
00050000-565d-bf64-5dfd-4afd53111eb6	2283	Zavrč
00050000-565d-bf64-eda5-c8d5a563288c	8272	Zdole 
00050000-565d-bf64-dd7b-bf3061a48358	4201	Zgornja Besnica
00050000-565d-bf64-ce30-954d7c201f22	2242	Zgornja Korena
00050000-565d-bf64-4f38-34db6ef97d9f	2201	Zgornja Kungota
00050000-565d-bf64-4de9-e5cd6d2b1ca1	2316	Zgornja Ložnica
00050000-565d-bf64-c8e9-bf35b98f7b6c	2314	Zgornja Polskava
00050000-565d-bf64-eee2-1db177e6be5a	2213	Zgornja Velka
00050000-565d-bf64-9d5c-6436feac04ff	4247	Zgornje Gorje
00050000-565d-bf64-ce47-e7d4b9f848b3	4206	Zgornje Jezersko
00050000-565d-bf64-0d91-a7d00e1e8e2b	2285	Zgornji Leskovec
00050000-565d-bf64-73fd-8d5bdaaac8c0	1432	Zidani Most
00050000-565d-bf64-106c-e48d65ad88b1	3214	Zreče
00050000-565d-bf64-8f92-1e2fe52befb8	4209	Žabnica
00050000-565d-bf64-889b-4754083b9614	3310	Žalec
00050000-565d-bf64-a57c-79ffa593ec41	4228	Železniki
00050000-565d-bf64-424d-8f15c6bac39c	2287	Žetale
00050000-565d-bf64-796e-c32f9b928e84	4226	Žiri
00050000-565d-bf64-8497-d361a7d42a8f	4274	Žirovnica
00050000-565d-bf64-dd3d-6b8a21002f59	8360	Žužemberk
\.


--
-- TOC entry 3164 (class 0 OID 30247178)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 30246753)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 30246501)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-565d-bf67-de03-7ab08e203177	00080000-565d-bf67-61d2-260f4e710ec6	\N	00040000-565d-bf64-5a95-e369ddaea9f9	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-565d-bf67-cc8e-65f82e3cfcb9	00080000-565d-bf67-61d2-260f4e710ec6	\N	00040000-565d-bf64-5a95-e369ddaea9f9	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-565d-bf67-d94a-9a90c003ee66	00080000-565d-bf67-e18d-3a5c276b63cc	\N	00040000-565d-bf64-5a95-e369ddaea9f9	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3126 (class 0 OID 30246645)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-565d-bf65-db30-0dcd07c1752c	novo leto	1	1	\N	t
00430000-565d-bf65-5c94-79d28e34c432	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-565d-bf65-a1ca-f329a7529c78	dan upora proti okupatorju	27	4	\N	t
00430000-565d-bf65-d127-0611c0203b97	praznik dela	1	5	\N	t
00430000-565d-bf65-3bb9-12661ec76066	praznik dela	2	5	\N	t
00430000-565d-bf65-fc66-e1ed1c4f6c04	dan Primoža Trubarja	8	6	\N	f
00430000-565d-bf65-a198-0d3bfa2481e6	dan državnosti	25	6	\N	t
00430000-565d-bf65-bba6-fa76ff1b616e	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-565d-bf65-4963-3f223ae2c428	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-565d-bf65-5d40-89818f4aac8f	dan suverenosti	25	10	\N	f
00430000-565d-bf65-c362-0f304cf8534b	dan spomina na mrtve	1	11	\N	t
00430000-565d-bf65-c881-2a56e5f0a139	dan Rudolfa Maistra	23	11	\N	f
00430000-565d-bf65-62ad-8e6c4e68aba7	božič	25	12	\N	t
00430000-565d-bf65-7a24-871bc9f8e873	dan samostojnosti in enotnosti	26	12	\N	t
00430000-565d-bf65-2a9a-2c4ab8a2b028	Marijino vnebovzetje	15	8	\N	t
00430000-565d-bf65-d822-1308aa399092	dan reformacije	31	10	\N	t
00430000-565d-bf65-a0e4-2e59f7a4d467	velikonočna nedelja	27	3	2016	t
00430000-565d-bf65-05a6-2e5f24a81b37	velikonočna nedelja	16	4	2017	t
00430000-565d-bf65-c50f-87e2e9f58048	velikonočna nedelja	1	4	2018	t
00430000-565d-bf65-cd72-bd50ec464cbf	velikonočna nedelja	21	4	2019	t
00430000-565d-bf65-410c-67e148ba22fb	velikonočna nedelja	12	4	2020	t
00430000-565d-bf65-3a26-488e13614905	velikonočna nedelja	4	4	2021	t
00430000-565d-bf65-8296-8b7f7e47fa0a	velikonočna nedelja	17	4	2022	t
00430000-565d-bf65-e601-69b0a38965b1	velikonočna nedelja	9	4	2023	t
00430000-565d-bf65-5414-f9c4adddb62d	velikonočna nedelja	31	3	2024	t
00430000-565d-bf65-84f1-f08036b22222	velikonočna nedelja	20	4	2025	t
00430000-565d-bf65-c999-75d52f2332cd	velikonočna nedelja	5	4	2026	t
00430000-565d-bf65-ece2-2d09d3c59088	velikonočna nedelja	28	3	2027	t
00430000-565d-bf65-d026-67669896c720	velikonočna nedelja	16	4	2028	t
00430000-565d-bf65-c886-1c24c96ea0b9	velikonočna nedelja	1	4	2029	t
00430000-565d-bf65-f860-9fcda4073f7f	velikonočna nedelja	21	4	2030	t
00430000-565d-bf65-7a91-fb0d9d1d71e1	velikonočni ponedeljek	28	3	2016	t
00430000-565d-bf65-a7a3-6ee110174881	velikonočni ponedeljek	17	4	2017	t
00430000-565d-bf65-3cd0-61fdf615939f	velikonočni ponedeljek	2	4	2018	t
00430000-565d-bf65-2df9-16e7f2e64546	velikonočni ponedeljek	22	4	2019	t
00430000-565d-bf65-7ac4-2190baf81784	velikonočni ponedeljek	13	4	2020	t
00430000-565d-bf65-cfe7-6c9c30ea3bea	velikonočni ponedeljek	5	4	2021	t
00430000-565d-bf65-113e-b632532d356c	velikonočni ponedeljek	18	4	2022	t
00430000-565d-bf65-7ce3-63c62760a15a	velikonočni ponedeljek	10	4	2023	t
00430000-565d-bf65-9431-1891856e33e9	velikonočni ponedeljek	1	4	2024	t
00430000-565d-bf65-bb9f-10e8aa70f61d	velikonočni ponedeljek	21	4	2025	t
00430000-565d-bf65-157f-711c31939f03	velikonočni ponedeljek	6	4	2026	t
00430000-565d-bf65-6d2d-5bfb30181a49	velikonočni ponedeljek	29	3	2027	t
00430000-565d-bf65-b8e1-4f36bc199ee3	velikonočni ponedeljek	17	4	2028	t
00430000-565d-bf65-1201-27c5b639ff69	velikonočni ponedeljek	2	4	2029	t
00430000-565d-bf65-21c3-9b452b89f7cc	velikonočni ponedeljek	22	4	2030	t
00430000-565d-bf65-dbb4-1daca159c6b6	binkoštna nedelja - binkošti	15	5	2016	t
00430000-565d-bf65-726e-168247ee13f9	binkoštna nedelja - binkošti	4	6	2017	t
00430000-565d-bf65-275a-84aeedd5cee5	binkoštna nedelja - binkošti	20	5	2018	t
00430000-565d-bf65-6217-fd220468b87c	binkoštna nedelja - binkošti	9	6	2019	t
00430000-565d-bf65-9fbc-f01a4e956428	binkoštna nedelja - binkošti	31	5	2020	t
00430000-565d-bf65-f9f4-afbf0cc582dd	binkoštna nedelja - binkošti	23	5	2021	t
00430000-565d-bf65-6201-e35a77266e3d	binkoštna nedelja - binkošti	5	6	2022	t
00430000-565d-bf65-4de0-71bad89134ad	binkoštna nedelja - binkošti	28	5	2023	t
00430000-565d-bf65-72ec-c71a0f3340a0	binkoštna nedelja - binkošti	19	5	2024	t
00430000-565d-bf65-6cbc-ea09730b6b6a	binkoštna nedelja - binkošti	8	6	2025	t
00430000-565d-bf65-a69b-d4d095e2a704	binkoštna nedelja - binkošti	24	5	2026	t
00430000-565d-bf65-9ffa-e74dc258c829	binkoštna nedelja - binkošti	16	5	2027	t
00430000-565d-bf65-8f64-a77ea34c0f50	binkoštna nedelja - binkošti	4	6	2028	t
00430000-565d-bf65-db7a-89f897e190c4	binkoštna nedelja - binkošti	20	5	2029	t
00430000-565d-bf65-031b-7264b1f3f9b6	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3122 (class 0 OID 30246605)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 30246617)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 30246765)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 30247192)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 30247202)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-565d-bf67-9578-ffbaf454a06f	00080000-565d-bf67-0c9b-1027ef5a4cca	0987	AK
00190000-565d-bf67-50d6-4cf4b71440de	00080000-565d-bf67-e18d-3a5c276b63cc	0989	AK
00190000-565d-bf67-e8f0-34f70005ac3e	00080000-565d-bf67-79f4-f756c09eb950	0986	AK
00190000-565d-bf67-ae86-01e9e78eaf87	00080000-565d-bf67-ed45-83aa1dc3d118	0984	AK
00190000-565d-bf67-b5f8-237646036a12	00080000-565d-bf67-da5a-3ad6b013a087	0983	AK
00190000-565d-bf67-a592-d5d7651e9965	00080000-565d-bf67-15f3-ec57a83e4b8c	0982	AK
00190000-565d-bf69-35bd-794e529a474b	00080000-565d-bf69-4dfe-b319b58ceaa7	1001	AK
\.


--
-- TOC entry 3163 (class 0 OID 30247101)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-565d-bf67-34c2-b642bddb78e5	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3167 (class 0 OID 30247210)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 30246794)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-565d-bf67-fb5b-f71c11b621ef	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-565d-bf67-890d-fd2d5a17c34d	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-565d-bf67-83f7-0ff2e4c30591	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-565d-bf67-2d50-1cd033613aa8	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-565d-bf67-4ffd-41ed916178d4	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-565d-bf67-93af-9645bbbfc642	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-565d-bf67-d4cc-0e458d366be6	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3135 (class 0 OID 30246738)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 30246728)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 30246939)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 30246869)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 30246579)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 30246341)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-565d-bf69-4dfe-b319b58ceaa7	00010000-565d-bf65-d756-6104511c4f5b	2015-12-01 16:40:25	INS	a:0:{}
2	App\\Entity\\Option	00000000-565d-bf69-2991-29dba35b052b	00010000-565d-bf65-d756-6104511c4f5b	2015-12-01 16:40:25	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-565d-bf69-35bd-794e529a474b	00010000-565d-bf65-d756-6104511c4f5b	2015-12-01 16:40:25	INS	a:0:{}
\.


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3144 (class 0 OID 30246807)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 30246379)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-565d-bf65-40ab-46c4c2d544f9	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-565d-bf65-376d-f1f586431814	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-565d-bf65-582a-93a34976859f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-565d-bf65-b94c-d201b4ab1862	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-565d-bf65-4c0d-14e3b7eec6b6	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-565d-bf65-4ba9-3f8fc4ba6446	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-565d-bf65-b4ba-22ca1c2024e0	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-565d-bf65-4e85-257640aff73e	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-565d-bf65-de9e-db52e942063c	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-565d-bf65-24b0-660b7825aa1f	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-565d-bf65-1344-7af749f51799	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-565d-bf65-9a9e-8f5fd2fd57e5	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-565d-bf65-bf5a-14bf8ecaa502	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-565d-bf65-35e0-0ff2680e7f19	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-565d-bf65-54a3-9d1fc8a4a17b	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-565d-bf65-1ddc-258368bb414c	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-565d-bf65-a09c-5988952d1599	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-565d-bf65-d0ec-68cc5373dd46	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-565d-bf65-43f4-cae383b6a1aa	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-565d-bf65-f063-f97feb9d053f	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-565d-bf65-ea78-a04c08f252a5	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-565d-bf65-40f3-d72d7f78b141	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-565d-bf65-d384-7c1298695db4	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-565d-bf65-0502-f70f2c7e7246	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-565d-bf65-e540-1540fe3cee99	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-565d-bf65-9490-057a59c94243	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-565d-bf65-9250-959d30673e50	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-565d-bf65-c205-e77016d333d1	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-565d-bf65-7bcd-74fddaef2db6	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-565d-bf65-ff82-d65422bfe0d6	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-565d-bf65-c3a0-545d15a59bc6	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-565d-bf65-c074-51c3dfd1a147	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-565d-bf65-c110-25c02712a55d	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-565d-bf65-11d7-317556bf91eb	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-565d-bf65-7bd8-4124cd1ffb4f	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-565d-bf65-4f2e-f964180b6fba	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-565d-bf65-813e-a1845b4317ca	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-565d-bf65-d889-ee760b87f913	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-565d-bf65-ebd7-80c87528d831	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-565d-bf65-0be3-e213a8f5eebc	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-565d-bf65-f203-cc3850f17e29	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-565d-bf65-f6e8-21db3e1cd913	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-565d-bf65-37c5-6aa3bc2de954	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-565d-bf65-86f0-10c0f788f994	arhivar	arhivar	t
00020000-565d-bf67-2c23-1af6ac858ed4	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-565d-bf67-0580-357516be0691	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-565d-bf67-7a55-391e71eb0fa1	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-565d-bf67-3fc4-8a143793afdb	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-565d-bf67-00c6-23828561d8ac	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-565d-bf67-bc04-6c269601a8d9	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-565d-bf67-a769-edd630fe915e	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-565d-bf67-e313-f1f4937bb2e2	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-565d-bf67-cb62-c57eeb36ce54	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-565d-bf67-6ada-b3849df2abf2	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-565d-bf67-8c16-ba7d6d80726c	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-565d-bf67-87a3-c2e6d87bcc44	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-565d-bf67-19f8-2a319fa4e759	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-565d-bf67-7c05-adbfffe24065	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-565d-bf67-d53b-9c5233abee2d	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-565d-bf67-2790-e507906a646e	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-565d-bf67-53c7-f4a57bf09d74	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-565d-bf67-ad81-78370ae70079	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
\.


--
-- TOC entry 3101 (class 0 OID 30246363)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-565d-bf65-66a6-22f29d68e0b2	00020000-565d-bf65-582a-93a34976859f
00010000-565d-bf65-d756-6104511c4f5b	00020000-565d-bf65-582a-93a34976859f
00010000-565d-bf67-cf42-353c4153847d	00020000-565d-bf67-2c23-1af6ac858ed4
00010000-565d-bf67-2520-0dfcfc52914f	00020000-565d-bf67-0580-357516be0691
00010000-565d-bf67-2520-0dfcfc52914f	00020000-565d-bf67-bc04-6c269601a8d9
00010000-565d-bf67-2520-0dfcfc52914f	00020000-565d-bf67-6ada-b3849df2abf2
00010000-565d-bf67-2520-0dfcfc52914f	00020000-565d-bf67-87a3-c2e6d87bcc44
00010000-565d-bf67-2520-0dfcfc52914f	00020000-565d-bf67-d53b-9c5233abee2d
00010000-565d-bf67-2520-0dfcfc52914f	00020000-565d-bf67-53c7-f4a57bf09d74
00010000-565d-bf67-2520-0dfcfc52914f	00020000-565d-bf67-3fc4-8a143793afdb
00010000-565d-bf67-5a5b-975bc2331b5b	00020000-565d-bf67-0580-357516be0691
00010000-565d-bf67-5a5b-975bc2331b5b	00020000-565d-bf67-7a55-391e71eb0fa1
00010000-565d-bf67-5a5b-975bc2331b5b	00020000-565d-bf67-3fc4-8a143793afdb
00010000-565d-bf67-5a5b-975bc2331b5b	00020000-565d-bf67-00c6-23828561d8ac
00010000-565d-bf67-60d7-059f59722a1a	00020000-565d-bf67-0580-357516be0691
00010000-565d-bf67-60d7-059f59722a1a	00020000-565d-bf67-7a55-391e71eb0fa1
00010000-565d-bf67-60d7-059f59722a1a	00020000-565d-bf67-3fc4-8a143793afdb
00010000-565d-bf67-60d7-059f59722a1a	00020000-565d-bf67-00c6-23828561d8ac
00010000-565d-bf67-60d7-059f59722a1a	00020000-565d-bf67-87a3-c2e6d87bcc44
00010000-565d-bf67-7f36-7daf1f5f8ab0	00020000-565d-bf67-7a55-391e71eb0fa1
00010000-565d-bf67-7f36-7daf1f5f8ab0	00020000-565d-bf67-a769-edd630fe915e
00010000-565d-bf67-7f36-7daf1f5f8ab0	00020000-565d-bf67-8c16-ba7d6d80726c
00010000-565d-bf67-7f36-7daf1f5f8ab0	00020000-565d-bf67-19f8-2a319fa4e759
00010000-565d-bf67-7f36-7daf1f5f8ab0	00020000-565d-bf67-87a3-c2e6d87bcc44
00010000-565d-bf67-7f36-7daf1f5f8ab0	00020000-565d-bf67-2790-e507906a646e
00010000-565d-bf67-ede5-8a22d8f49031	00020000-565d-bf67-7a55-391e71eb0fa1
00010000-565d-bf67-ede5-8a22d8f49031	00020000-565d-bf67-a769-edd630fe915e
00010000-565d-bf67-ede5-8a22d8f49031	00020000-565d-bf67-cb62-c57eeb36ce54
00010000-565d-bf67-ede5-8a22d8f49031	00020000-565d-bf67-8c16-ba7d6d80726c
00010000-565d-bf67-ede5-8a22d8f49031	00020000-565d-bf67-19f8-2a319fa4e759
00010000-565d-bf67-ede5-8a22d8f49031	00020000-565d-bf67-87a3-c2e6d87bcc44
00010000-565d-bf67-ede5-8a22d8f49031	00020000-565d-bf67-2790-e507906a646e
00010000-565d-bf67-d7bd-635ea86e7933	00020000-565d-bf67-7a55-391e71eb0fa1
00010000-565d-bf67-d7bd-635ea86e7933	00020000-565d-bf67-3fc4-8a143793afdb
00010000-565d-bf67-d7bd-635ea86e7933	00020000-565d-bf67-a769-edd630fe915e
00010000-565d-bf67-d7bd-635ea86e7933	00020000-565d-bf67-e313-f1f4937bb2e2
00010000-565d-bf67-d7bd-635ea86e7933	00020000-565d-bf67-cb62-c57eeb36ce54
00010000-565d-bf67-d7bd-635ea86e7933	00020000-565d-bf67-bc04-6c269601a8d9
00010000-565d-bf67-d7bd-635ea86e7933	00020000-565d-bf67-8c16-ba7d6d80726c
00010000-565d-bf67-d7bd-635ea86e7933	00020000-565d-bf67-19f8-2a319fa4e759
00010000-565d-bf67-d7bd-635ea86e7933	00020000-565d-bf67-87a3-c2e6d87bcc44
00010000-565d-bf67-d7bd-635ea86e7933	00020000-565d-bf67-2790-e507906a646e
00010000-565d-bf67-9842-eccb988c7af4	00020000-565d-bf67-0580-357516be0691
00010000-565d-bf67-9842-eccb988c7af4	00020000-565d-bf67-00c6-23828561d8ac
00010000-565d-bf67-9842-eccb988c7af4	00020000-565d-bf67-bc04-6c269601a8d9
00010000-565d-bf67-9842-eccb988c7af4	00020000-565d-bf67-6ada-b3849df2abf2
00010000-565d-bf67-9842-eccb988c7af4	00020000-565d-bf67-87a3-c2e6d87bcc44
00010000-565d-bf67-9842-eccb988c7af4	00020000-565d-bf67-d53b-9c5233abee2d
00010000-565d-bf67-9842-eccb988c7af4	00020000-565d-bf67-53c7-f4a57bf09d74
00010000-565d-bf67-78dd-4d09eb6d5235	00020000-565d-bf67-ad81-78370ae70079
\.


--
-- TOC entry 3146 (class 0 OID 30246821)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 30246759)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 30246705)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-565d-bf67-2cfa-5f2275391497	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-565d-bf67-c434-e72e3119d4d0	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-565d-bf67-083a-12993a4c9a8d	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3097 (class 0 OID 30246328)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-565d-bf64-9698-177a8190574c	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-565d-bf64-c70c-34a5c5e902cd	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-565d-bf64-5ebd-39df2e26fa06	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-565d-bf64-1dde-ed86af8c13b3	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-565d-bf64-7052-ec11aff2a67b	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3096 (class 0 OID 30246320)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-565d-bf64-aea1-cd6f8f0f3cc7	00230000-565d-bf64-1dde-ed86af8c13b3	popa
00240000-565d-bf64-0fbb-4d6ff112a991	00230000-565d-bf64-1dde-ed86af8c13b3	oseba
00240000-565d-bf64-2972-2ebe0c1017c6	00230000-565d-bf64-1dde-ed86af8c13b3	tippopa
00240000-565d-bf64-d053-e80232a7b94c	00230000-565d-bf64-1dde-ed86af8c13b3	organizacijskaenota
00240000-565d-bf64-f550-1bb086fd7440	00230000-565d-bf64-1dde-ed86af8c13b3	sezona
00240000-565d-bf64-c04e-03f84ccc2d0c	00230000-565d-bf64-1dde-ed86af8c13b3	tipvaje
00240000-565d-bf64-9192-9a6dc31bd560	00230000-565d-bf64-c70c-34a5c5e902cd	prostor
00240000-565d-bf64-ec55-58a08e07862b	00230000-565d-bf64-1dde-ed86af8c13b3	besedilo
00240000-565d-bf64-8fbd-bb9805846c57	00230000-565d-bf64-1dde-ed86af8c13b3	uprizoritev
00240000-565d-bf64-aa94-804038135dd7	00230000-565d-bf64-1dde-ed86af8c13b3	funkcija
00240000-565d-bf64-cdea-bc846bdf486c	00230000-565d-bf64-1dde-ed86af8c13b3	tipfunkcije
00240000-565d-bf64-0547-5652e8822e54	00230000-565d-bf64-1dde-ed86af8c13b3	alternacija
00240000-565d-bf64-4ff0-3ae599e06a2a	00230000-565d-bf64-9698-177a8190574c	pogodba
00240000-565d-bf64-d54b-14c8425c20ac	00230000-565d-bf64-1dde-ed86af8c13b3	zaposlitev
00240000-565d-bf64-b487-962b320e4184	00230000-565d-bf64-1dde-ed86af8c13b3	zvrstuprizoritve
00240000-565d-bf64-35db-21286d4ce831	00230000-565d-bf64-9698-177a8190574c	programdela
00240000-565d-bf64-df25-7b5134e0e116	00230000-565d-bf64-1dde-ed86af8c13b3	zapis
\.


--
-- TOC entry 3095 (class 0 OID 30246315)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
e5d0d00c-8a98-4984-9f63-c40d3d0d7cf6	00240000-565d-bf64-aea1-cd6f8f0f3cc7	0	1001
\.


--
-- TOC entry 3152 (class 0 OID 30246886)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-565d-bf67-5dba-85c36339864a	000e0000-565d-bf67-22b3-2c46373c148f	00080000-565d-bf67-61d2-260f4e710ec6	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-565d-bf65-06a9-cdd643c41f43
00270000-565d-bf67-9d85-da516a46471e	000e0000-565d-bf67-22b3-2c46373c148f	00080000-565d-bf67-61d2-260f4e710ec6	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-565d-bf65-06a9-cdd643c41f43
\.


--
-- TOC entry 3111 (class 0 OID 30246463)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 30246715)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-565d-bf67-7e6e-d866c5eda8d0	00180000-565d-bf67-a7b1-b1a0f86271f8	000c0000-565d-bf67-2459-d27b9498440b	00090000-565d-bf67-41e4-7fcbc17ba4a7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565d-bf67-8e9c-c5c3114f24dd	00180000-565d-bf67-a7b1-b1a0f86271f8	000c0000-565d-bf67-25ad-f4f6485a513a	00090000-565d-bf67-3a6e-731c243ea618	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565d-bf67-fc4e-ca36a3e1bdb1	00180000-565d-bf67-a7b1-b1a0f86271f8	000c0000-565d-bf67-d07c-52dfb39da442	00090000-565d-bf67-781d-ff356e70182b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565d-bf67-dd18-3f20f863ba49	00180000-565d-bf67-a7b1-b1a0f86271f8	000c0000-565d-bf67-33d8-5965f41ac11e	00090000-565d-bf67-2a20-38aecddc8699	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565d-bf67-3e3a-adf783cae440	00180000-565d-bf67-a7b1-b1a0f86271f8	000c0000-565d-bf67-3b6a-f3af1541184c	00090000-565d-bf67-1d1f-33cdd11bbfad	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565d-bf67-ee20-71a362c173fc	00180000-565d-bf67-911c-857120c2af44	\N	00090000-565d-bf67-1d1f-33cdd11bbfad	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-565d-bf67-7c99-9214568c0904	00180000-565d-bf67-911c-857120c2af44	\N	00090000-565d-bf67-3a6e-731c243ea618	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3155 (class 0 OID 30246927)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-565d-bf64-bba4-87aaa3387354	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-565d-bf64-22e2-e3c8e500a628	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-565d-bf64-b2da-db2922599cc1	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-565d-bf64-cd6b-6b95f398ecd6	04	Režija	Režija	Režija	umetnik	30
000f0000-565d-bf64-a29e-13f3b6e96a4a	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-565d-bf64-bf0a-164b4823d298	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-565d-bf64-0814-d3133a4988cb	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-565d-bf64-6649-40ff6df42db5	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-565d-bf64-5aac-44b167b94fba	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-565d-bf64-8f64-158447bcaa77	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-565d-bf64-0afc-a67eadcdc213	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-565d-bf64-6811-7b3968052720	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-565d-bf64-6c5c-3a296b821b21	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-565d-bf64-4c66-adeff21e205a	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-565d-bf64-fc4d-cb80475fe1d0	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-565d-bf64-d233-d4b126f1960c	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-565d-bf64-7d15-3b04e1ff80b4	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-565d-bf64-59be-ee7a36a6bbbb	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3108 (class 0 OID 30246414)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-565d-bf67-f92f-b8a60b3bd493	0001	šola	osnovna ali srednja šola
00400000-565d-bf67-c44e-50452c6d5a49	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-565d-bf67-a602-8850c54b428d	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3168 (class 0 OID 30247222)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-565d-bf64-fc43-4d93523bbeb9	01	Velika predstava	f	1.00	1.00
002b0000-565d-bf64-8b84-a469f0849c01	02	Mala predstava	f	0.50	0.50
002b0000-565d-bf64-1b3f-b841864ac3ec	03	Mala koprodukcija	t	0.40	1.00
002b0000-565d-bf64-4421-d492f8addcc4	04	Srednja koprodukcija	t	0.70	2.00
002b0000-565d-bf64-8cd3-e788c7da0fd5	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3131 (class 0 OID 30246695)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-565d-bf64-679b-e4703b2c04cb	0001	prva vaja	prva vaja
00420000-565d-bf64-104d-045ab67f35d3	0002	tehnična vaja	tehnična vaja
00420000-565d-bf64-76f6-4edc1c33048a	0003	lučna vaja	lučna vaja
00420000-565d-bf64-a818-406d7a6c3098	0004	kostumska vaja	kostumska vaja
00420000-565d-bf64-1140-6974b26dce3d	0005	foto vaja	foto vaja
00420000-565d-bf64-1752-6089cb8e9781	0006	1. glavna vaja	1. glavna vaja
00420000-565d-bf64-3aa6-b51649883b5b	0007	2. glavna vaja	2. glavna vaja
00420000-565d-bf64-71b4-a482e3117275	0008	1. generalka	1. generalka
00420000-565d-bf64-58d1-2cea5afb01ef	0009	2. generalka	2. generalka
00420000-565d-bf64-94b7-bf6e8a57e69f	0010	odprta generalka	odprta generalka
00420000-565d-bf64-7bc9-c9b2d4629515	0011	obnovitvena vaja	obnovitvena vaja
00420000-565d-bf64-d449-eff80c90da38	0012	pevska vaja	pevska vaja
00420000-565d-bf64-33d4-d42686c31c67	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-565d-bf64-4539-1e3ed9aeb581	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3117 (class 0 OID 30246536)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 30246350)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-565d-bf65-d756-6104511c4f5b	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROI9uah18TIToENnG6hGJX70c1TO3Xx4.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-565d-bf67-8b63-7a0378bc0e68	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-565d-bf67-b075-c3e73a6d805f	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-565d-bf67-1441-ee39a9b3e7fd	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-565d-bf67-4866-6f3eb05ab742	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-565d-bf67-2f7b-85a01fb31349	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-565d-bf67-f133-03636b8950cf	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-565d-bf67-31c9-3b0d689ae9a9	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-565d-bf67-741a-9e47f53f6a00	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-565d-bf67-55d2-db9904442ab3	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-565d-bf67-cf42-353c4153847d	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-565d-bf67-47c1-3a818e5a3da9	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-565d-bf67-2520-0dfcfc52914f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-565d-bf67-5a5b-975bc2331b5b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-565d-bf67-60d7-059f59722a1a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-565d-bf67-7f36-7daf1f5f8ab0	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-565d-bf67-ede5-8a22d8f49031	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-565d-bf67-d7bd-635ea86e7933	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-565d-bf67-9842-eccb988c7af4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-565d-bf67-78dd-4d09eb6d5235	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-565d-bf65-66a6-22f29d68e0b2	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 30246977)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-565d-bf67-9062-01e28b9fde16	00160000-565d-bf67-0caa-52899fd0e9f7	\N	00140000-565d-bf64-91d7-f9b1d4915389	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-565d-bf67-4ffd-41ed916178d4
000e0000-565d-bf67-22b3-2c46373c148f	00160000-565d-bf67-64ce-5cb10ef10bc2	\N	00140000-565d-bf64-24b5-a2f1d1853ac4	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-565d-bf67-93af-9645bbbfc642
000e0000-565d-bf67-9287-e5eeeeaa5759	\N	\N	00140000-565d-bf64-24b5-a2f1d1853ac4	00190000-565d-bf67-9578-ffbaf454a06f	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-565d-bf67-4ffd-41ed916178d4
000e0000-565d-bf67-f839-e5e34092c5c5	\N	\N	00140000-565d-bf64-24b5-a2f1d1853ac4	00190000-565d-bf67-9578-ffbaf454a06f	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-565d-bf67-4ffd-41ed916178d4
000e0000-565d-bf67-2b41-5f383a053cd0	\N	\N	00140000-565d-bf64-24b5-a2f1d1853ac4	00190000-565d-bf67-9578-ffbaf454a06f	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-565d-bf67-fb5b-f71c11b621ef
000e0000-565d-bf67-37e0-4403e7c2f07d	\N	\N	00140000-565d-bf64-24b5-a2f1d1853ac4	00190000-565d-bf67-9578-ffbaf454a06f	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-565d-bf67-fb5b-f71c11b621ef
\.


--
-- TOC entry 3125 (class 0 OID 30246635)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-565d-bf67-6bb2-92587aaf319b	\N	000e0000-565d-bf67-22b3-2c46373c148f	1	
00200000-565d-bf67-f811-d0b0f32ca1c5	\N	000e0000-565d-bf67-22b3-2c46373c148f	2	
00200000-565d-bf67-9b85-53d40bacf93f	\N	000e0000-565d-bf67-22b3-2c46373c148f	3	
00200000-565d-bf67-b489-411a1bd70109	\N	000e0000-565d-bf67-22b3-2c46373c148f	4	
00200000-565d-bf67-2e88-4175ee981401	\N	000e0000-565d-bf67-22b3-2c46373c148f	5	
\.


--
-- TOC entry 3142 (class 0 OID 30246786)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 30246900)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-565d-bf65-ad3b-7039e2e8d22d	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-565d-bf65-cfa6-4c9e1dc96e08	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-565d-bf65-9ec5-a83afa4f6454	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-565d-bf65-c1dc-0e27148a629e	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-565d-bf65-b454-eff689548da3	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-565d-bf65-454a-321c4fddc102	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-565d-bf65-e359-968e92d68188	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-565d-bf65-1d68-943888e87b52	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-565d-bf65-06a9-cdd643c41f43	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-565d-bf65-ea3a-b7abbb915ca4	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-565d-bf65-81a1-f9dcbe808587	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-565d-bf65-d90e-81bb3125dd58	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-565d-bf65-5b14-2fc117fae54e	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-565d-bf65-3563-91012b2a65ab	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-565d-bf65-4174-1664db4bc604	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-565d-bf65-b003-aea2c79309d6	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-565d-bf65-7ef5-fcd136c86525	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-565d-bf65-7008-aefaf88d84d5	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-565d-bf65-edc0-1d4853cd390d	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-565d-bf65-8a09-c32bfc18a2db	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-565d-bf65-1d01-f87ec498bb63	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-565d-bf65-871d-2e62e1f27762	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-565d-bf65-232a-09bd706509d5	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-565d-bf65-2668-010d55d1cc2b	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-565d-bf65-1761-efc31f0d097f	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-565d-bf65-1c1d-de7bd3b2d50e	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-565d-bf65-4ff3-86cee395a854	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-565d-bf65-f8ed-f860c63f79f8	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3171 (class 0 OID 30247272)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 30247241)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 30247284)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 30246858)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-565d-bf67-6abd-03b2f1c1bc2f	00090000-565d-bf67-3a6e-731c243ea618	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565d-bf67-1515-c90ba8460994	00090000-565d-bf67-781d-ff356e70182b	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565d-bf67-ce90-b5419e2799fb	00090000-565d-bf67-585e-ca0c4502fea1	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565d-bf67-25e0-c975c0757833	00090000-565d-bf67-8305-f45cf4e4225e	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565d-bf67-511a-1d5370a8c715	00090000-565d-bf67-c840-759a533cfcbc	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565d-bf67-3871-aeba49ad5385	00090000-565d-bf67-6cad-1f193a55b458	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3128 (class 0 OID 30246679)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 30246967)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-565d-bf64-91d7-f9b1d4915389	01	Drama	drama (SURS 01)
00140000-565d-bf64-a23f-6b350a50e068	02	Opera	opera (SURS 02)
00140000-565d-bf64-4842-d80af8621c1b	03	Balet	balet (SURS 03)
00140000-565d-bf64-cb50-bde3a53aebd1	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-565d-bf64-8f18-7fb44d59288d	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-565d-bf64-24b5-a2f1d1853ac4	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-565d-bf64-688d-0be3411bbf4f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3148 (class 0 OID 30246848)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2590 (class 2606 OID 30246413)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 30247026)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 30247016)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 30246404)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 30246883)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 30246925)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 30247325)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 30246667)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 30246689)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 30246694)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 30247239)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 30246562)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 30247095)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 30246844)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 30246633)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 30246600)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 30246576)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 30246751)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 30247302)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 30247309)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2871 (class 2606 OID 30247333)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 25231835)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2728 (class 2606 OID 30246778)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 30246534)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 30246432)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 30246496)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 30246459)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 30246393)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2579 (class 2606 OID 30246378)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 30246784)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 30246820)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 30246962)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 30246487)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 30246522)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 30247190)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 30246757)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 30246512)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 30246652)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 30246621)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2657 (class 2606 OID 30246613)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 30246769)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 30247199)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 30247207)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 30247177)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 30247220)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 30246802)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 30246742)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 30246733)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 30246949)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 30246876)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 30246588)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 30246349)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 30246811)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 30246367)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2581 (class 2606 OID 30246387)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 30246829)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 30246764)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 30246713)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 30246337)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 30246325)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 30246319)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 30246896)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 30246468)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 30246724)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 30246936)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 30246421)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 30247232)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 30246702)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 30246547)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 30246362)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 30246995)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 30246642)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 30246792)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 30246908)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 30247282)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 30247266)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 30247290)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 30246866)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 30246683)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 30246975)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 30246856)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 1259 OID 30246677)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2674 (class 1259 OID 30246678)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2675 (class 1259 OID 30246676)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2676 (class 1259 OID 30246675)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2677 (class 1259 OID 30246674)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2771 (class 1259 OID 30246897)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2772 (class 1259 OID 30246898)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2773 (class 1259 OID 30246899)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2857 (class 1259 OID 30247304)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2858 (class 1259 OID 30247303)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2608 (class 1259 OID 30246489)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2609 (class 1259 OID 30246490)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 30246785)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2844 (class 1259 OID 30247270)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2845 (class 1259 OID 30247269)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2846 (class 1259 OID 30247271)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2847 (class 1259 OID 30247268)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2848 (class 1259 OID 30247267)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2723 (class 1259 OID 30246771)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2724 (class 1259 OID 30246770)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2665 (class 1259 OID 30246643)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2666 (class 1259 OID 30246644)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2753 (class 1259 OID 30246845)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2754 (class 1259 OID 30246847)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2755 (class 1259 OID 30246846)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2640 (class 1259 OID 30246578)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 30246577)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2835 (class 1259 OID 30247221)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2787 (class 1259 OID 30246964)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2788 (class 1259 OID 30246965)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 30246966)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2854 (class 1259 OID 30247291)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2796 (class 1259 OID 30247000)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2797 (class 1259 OID 30246997)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2798 (class 1259 OID 30247001)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2799 (class 1259 OID 30246999)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2800 (class 1259 OID 30246998)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2630 (class 1259 OID 30246549)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 30246548)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 30246462)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2741 (class 1259 OID 30246812)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2583 (class 1259 OID 30246394)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2584 (class 1259 OID 30246395)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2746 (class 1259 OID 30246832)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 30246831)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2748 (class 1259 OID 30246830)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2613 (class 1259 OID 30246499)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2614 (class 1259 OID 30246498)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2615 (class 1259 OID 30246500)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2653 (class 1259 OID 30246616)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2654 (class 1259 OID 30246614)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 30246615)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2563 (class 1259 OID 30246327)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2703 (class 1259 OID 30246737)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2704 (class 1259 OID 30246735)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2705 (class 1259 OID 30246734)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2706 (class 1259 OID 30246736)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2574 (class 1259 OID 30246368)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 30246369)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2732 (class 1259 OID 30246793)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2867 (class 1259 OID 30247326)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2769 (class 1259 OID 30246885)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2770 (class 1259 OID 30246884)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2868 (class 1259 OID 30247334)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2869 (class 1259 OID 30247335)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2718 (class 1259 OID 30246758)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2763 (class 1259 OID 30246877)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2764 (class 1259 OID 30246878)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2817 (class 1259 OID 30247100)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2818 (class 1259 OID 30247099)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2819 (class 1259 OID 30247096)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2820 (class 1259 OID 30247097)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2821 (class 1259 OID 30247098)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2619 (class 1259 OID 30246514)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 30246513)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2621 (class 1259 OID 30246515)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2735 (class 1259 OID 30246806)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2736 (class 1259 OID 30246805)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 30247200)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2828 (class 1259 OID 30247201)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2810 (class 1259 OID 30247030)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 30247031)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2812 (class 1259 OID 30247028)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2813 (class 1259 OID 30247029)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2759 (class 1259 OID 30246867)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2760 (class 1259 OID 30246868)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2709 (class 1259 OID 30246746)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2710 (class 1259 OID 30246745)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2711 (class 1259 OID 30246743)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2712 (class 1259 OID 30246744)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2806 (class 1259 OID 30247018)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2807 (class 1259 OID 30247017)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2644 (class 1259 OID 30246589)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2647 (class 1259 OID 30246603)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2648 (class 1259 OID 30246602)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2649 (class 1259 OID 30246601)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2650 (class 1259 OID 30246604)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2664 (class 1259 OID 30246634)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2658 (class 1259 OID 30246622)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2659 (class 1259 OID 30246623)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2824 (class 1259 OID 30247191)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2843 (class 1259 OID 30247240)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2861 (class 1259 OID 30247310)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2862 (class 1259 OID 30247311)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2595 (class 1259 OID 30246434)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2596 (class 1259 OID 30246433)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2604 (class 1259 OID 30246469)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 30246470)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2684 (class 1259 OID 30246684)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2698 (class 1259 OID 30246727)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2699 (class 1259 OID 30246726)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2700 (class 1259 OID 30246725)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2678 (class 1259 OID 30246669)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2679 (class 1259 OID 30246670)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2680 (class 1259 OID 30246673)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2681 (class 1259 OID 30246668)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2682 (class 1259 OID 30246672)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2683 (class 1259 OID 30246671)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2612 (class 1259 OID 30246488)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 30246422)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 30246423)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2636 (class 1259 OID 30246563)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 30246565)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2638 (class 1259 OID 30246564)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2639 (class 1259 OID 30246566)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2717 (class 1259 OID 30246752)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2792 (class 1259 OID 30246963)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2801 (class 1259 OID 30246996)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2783 (class 1259 OID 30246937)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2784 (class 1259 OID 30246938)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2602 (class 1259 OID 30246460)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 30246461)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2756 (class 1259 OID 30246857)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 30246338)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 30246535)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2618 (class 1259 OID 30246497)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 30246326)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2840 (class 1259 OID 30247233)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 30246804)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2740 (class 1259 OID 30246803)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 30246703)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 30246704)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2814 (class 1259 OID 30247027)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 30246523)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2793 (class 1259 OID 30246976)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2851 (class 1259 OID 30247283)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2833 (class 1259 OID 30247208)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2834 (class 1259 OID 30247209)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2780 (class 1259 OID 30246926)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2697 (class 1259 OID 30246714)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 30246388)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2911 (class 2606 OID 30247506)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2910 (class 2606 OID 30247511)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2905 (class 2606 OID 30247536)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2907 (class 2606 OID 30247526)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2912 (class 2606 OID 30247501)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2908 (class 2606 OID 30247521)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2906 (class 2606 OID 30247531)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2909 (class 2606 OID 30247516)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2948 (class 2606 OID 30247706)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2947 (class 2606 OID 30247711)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2946 (class 2606 OID 30247716)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2980 (class 2606 OID 30247881)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2981 (class 2606 OID 30247876)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 30247391)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2883 (class 2606 OID 30247396)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 30247621)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2975 (class 2606 OID 30247861)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 30247856)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2974 (class 2606 OID 30247866)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2977 (class 2606 OID 30247851)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2978 (class 2606 OID 30247846)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2927 (class 2606 OID 30247616)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2928 (class 2606 OID 30247611)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2904 (class 2606 OID 30247491)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2903 (class 2606 OID 30247496)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2939 (class 2606 OID 30247661)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 30247671)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2938 (class 2606 OID 30247666)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2893 (class 2606 OID 30247446)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2894 (class 2606 OID 30247441)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 30247601)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2972 (class 2606 OID 30247836)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2951 (class 2606 OID 30247721)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2950 (class 2606 OID 30247726)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2949 (class 2606 OID 30247731)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2979 (class 2606 OID 30247871)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2953 (class 2606 OID 30247751)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2956 (class 2606 OID 30247736)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2952 (class 2606 OID 30247756)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 30247746)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2955 (class 2606 OID 30247741)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2891 (class 2606 OID 30247436)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 30247431)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2879 (class 2606 OID 30247376)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2880 (class 2606 OID 30247371)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2933 (class 2606 OID 30247641)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2876 (class 2606 OID 30247351)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2875 (class 2606 OID 30247356)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2934 (class 2606 OID 30247656)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 30247651)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2936 (class 2606 OID 30247646)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2886 (class 2606 OID 30247406)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2887 (class 2606 OID 30247401)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2885 (class 2606 OID 30247411)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2897 (class 2606 OID 30247471)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 30247461)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2898 (class 2606 OID 30247466)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2872 (class 2606 OID 30247336)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2917 (class 2606 OID 30247576)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2919 (class 2606 OID 30247566)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2920 (class 2606 OID 30247561)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2918 (class 2606 OID 30247571)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 30247341)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2873 (class 2606 OID 30247346)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2930 (class 2606 OID 30247626)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2984 (class 2606 OID 30247896)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 30247701)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2945 (class 2606 OID 30247696)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2986 (class 2606 OID 30247901)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 30247906)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2926 (class 2606 OID 30247606)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2943 (class 2606 OID 30247686)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2942 (class 2606 OID 30247691)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2963 (class 2606 OID 30247811)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 30247806)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2967 (class 2606 OID 30247791)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2966 (class 2606 OID 30247796)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2965 (class 2606 OID 30247801)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2889 (class 2606 OID 30247421)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 30247416)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 30247426)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2931 (class 2606 OID 30247636)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2932 (class 2606 OID 30247631)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 30247821)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2969 (class 2606 OID 30247826)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2960 (class 2606 OID 30247781)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2959 (class 2606 OID 30247786)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2962 (class 2606 OID 30247771)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2961 (class 2606 OID 30247776)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2941 (class 2606 OID 30247676)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2940 (class 2606 OID 30247681)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2921 (class 2606 OID 30247596)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2922 (class 2606 OID 30247591)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2924 (class 2606 OID 30247581)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2923 (class 2606 OID 30247586)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2957 (class 2606 OID 30247766)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2958 (class 2606 OID 30247761)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2895 (class 2606 OID 30247451)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2896 (class 2606 OID 30247456)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2902 (class 2606 OID 30247486)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2901 (class 2606 OID 30247476)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2900 (class 2606 OID 30247481)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 30247816)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2971 (class 2606 OID 30247831)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2973 (class 2606 OID 30247841)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2983 (class 2606 OID 30247886)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2982 (class 2606 OID 30247891)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2877 (class 2606 OID 30247366)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 30247361)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2882 (class 2606 OID 30247381)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2881 (class 2606 OID 30247386)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2913 (class 2606 OID 30247541)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2914 (class 2606 OID 30247556)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2915 (class 2606 OID 30247551)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2916 (class 2606 OID 30247546)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-01 16:40:26 CET

--
-- PostgreSQL database dump complete
--

