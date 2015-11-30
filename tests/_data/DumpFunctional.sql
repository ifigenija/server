--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-30 12:44:36 CET

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
-- TOC entry 183 (class 1259 OID 30124556)
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
-- TOC entry 237 (class 1259 OID 30125170)
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
-- TOC entry 236 (class 1259 OID 30125153)
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
-- TOC entry 182 (class 1259 OID 30124549)
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
-- TOC entry 181 (class 1259 OID 30124547)
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
-- TOC entry 227 (class 1259 OID 30125030)
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
-- TOC entry 230 (class 1259 OID 30125060)
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
-- TOC entry 251 (class 1259 OID 30125463)
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
-- TOC entry 203 (class 1259 OID 30124804)
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
-- TOC entry 205 (class 1259 OID 30124836)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 30124841)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 30125385)
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
-- TOC entry 194 (class 1259 OID 30124701)
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
-- TOC entry 238 (class 1259 OID 30125183)
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
-- TOC entry 223 (class 1259 OID 30124984)
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
-- TOC entry 200 (class 1259 OID 30124775)
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
-- TOC entry 197 (class 1259 OID 30124741)
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
-- TOC entry 195 (class 1259 OID 30124718)
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
-- TOC entry 212 (class 1259 OID 30124898)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 30125443)
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
-- TOC entry 250 (class 1259 OID 30125456)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 30125478)
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
-- TOC entry 216 (class 1259 OID 30124923)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 30124675)
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
-- TOC entry 185 (class 1259 OID 30124575)
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
-- TOC entry 189 (class 1259 OID 30124642)
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
-- TOC entry 186 (class 1259 OID 30124586)
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
-- TOC entry 178 (class 1259 OID 30124521)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 30124540)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 30124930)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 30124964)
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
-- TOC entry 233 (class 1259 OID 30125101)
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
-- TOC entry 188 (class 1259 OID 30124622)
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
-- TOC entry 191 (class 1259 OID 30124667)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 30125329)
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
-- TOC entry 213 (class 1259 OID 30124904)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 30124652)
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
-- TOC entry 202 (class 1259 OID 30124796)
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
-- TOC entry 198 (class 1259 OID 30124756)
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
-- TOC entry 199 (class 1259 OID 30124768)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 30124916)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 30125343)
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
-- TOC entry 242 (class 1259 OID 30125353)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 30125252)
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
-- TOC entry 243 (class 1259 OID 30125361)
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
-- TOC entry 219 (class 1259 OID 30124945)
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
-- TOC entry 211 (class 1259 OID 30124889)
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
-- TOC entry 210 (class 1259 OID 30124879)
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
-- TOC entry 232 (class 1259 OID 30125090)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 30125020)
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
-- TOC entry 196 (class 1259 OID 30124730)
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
-- TOC entry 175 (class 1259 OID 30124492)
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
-- TOC entry 174 (class 1259 OID 30124490)
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
-- TOC entry 220 (class 1259 OID 30124958)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 30124530)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 30124514)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 30124972)
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
-- TOC entry 214 (class 1259 OID 30124910)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 30124856)
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
-- TOC entry 173 (class 1259 OID 30124479)
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
-- TOC entry 172 (class 1259 OID 30124471)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 30124466)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 30125037)
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
-- TOC entry 187 (class 1259 OID 30124614)
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
-- TOC entry 209 (class 1259 OID 30124866)
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
-- TOC entry 231 (class 1259 OID 30125078)
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
-- TOC entry 184 (class 1259 OID 30124565)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 30125373)
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
-- TOC entry 207 (class 1259 OID 30124846)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 30124687)
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
-- TOC entry 176 (class 1259 OID 30124501)
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
-- TOC entry 235 (class 1259 OID 30125128)
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
-- TOC entry 201 (class 1259 OID 30124786)
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
-- TOC entry 218 (class 1259 OID 30124937)
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
-- TOC entry 229 (class 1259 OID 30125051)
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
-- TOC entry 247 (class 1259 OID 30125423)
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
-- TOC entry 246 (class 1259 OID 30125392)
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
-- TOC entry 248 (class 1259 OID 30125435)
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
-- TOC entry 225 (class 1259 OID 30125009)
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
-- TOC entry 204 (class 1259 OID 30124830)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 30125118)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 30124999)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 30124552)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 30124495)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3107 (class 0 OID 30124556)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-565c-36a1-e2c3-4d9fc8c5bf18	10	30	Otroci	Abonma za otroke	200
000a0000-565c-36a1-b67e-de57d9a9e453	20	60	Mladina	Abonma za mladino	400
000a0000-565c-36a1-e089-5b63e692b413	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3161 (class 0 OID 30125170)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-565c-36a1-2ca1-dc8bbc1e423f	000d0000-565c-36a1-e35e-1946c0fc8391	\N	00090000-565c-36a1-d74c-c27b605be904	000b0000-565c-36a1-b7e4-e8e5fd620617	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-565c-36a1-c73d-6fe2b12f0b3d	000d0000-565c-36a1-0ce9-0b7ca7225847	00100000-565c-36a1-a6ea-07f17b339666	00090000-565c-36a1-7fdf-0e103283a962	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-565c-36a1-b10d-06bf87701afb	000d0000-565c-36a1-d97a-e17a4f5ead79	00100000-565c-36a1-73e4-a326e36e29d2	00090000-565c-36a1-d4b1-06d5e23b1385	\N	0003	t	\N	2015-11-30	\N	2	t	\N	f	f
000c0000-565c-36a1-4d34-5f040422756c	000d0000-565c-36a1-68ed-7c3bebd5e873	\N	00090000-565c-36a1-510b-a16931b8de1c	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-565c-36a1-7c77-e1001aab0cc9	000d0000-565c-36a1-3ee3-a7f55942e1d4	\N	00090000-565c-36a1-6027-59143662e490	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-565c-36a1-9812-23558c4f6649	000d0000-565c-36a1-6e38-abececcb09d7	\N	00090000-565c-36a1-f803-f71ab525f440	000b0000-565c-36a1-c930-c62c23cc5dc2	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-565c-36a1-6ea9-9ee39eb24453	000d0000-565c-36a1-3a95-007dafe10b75	00100000-565c-36a1-2b2a-8eb8b3b59045	00090000-565c-36a1-a68f-8f16479c53cc	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-565c-36a1-dd77-31829f715f30	000d0000-565c-36a1-3a50-a5f9ec25bc9b	\N	00090000-565c-36a1-7327-eb75fc5da5f5	000b0000-565c-36a1-68be-ab7bd0637bde	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-565c-36a1-6c29-63dc6c4d49f0	000d0000-565c-36a1-3a95-007dafe10b75	00100000-565c-36a1-7afe-9aab7fb4754f	00090000-565c-36a1-8bdd-912444673edf	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-565c-36a1-2215-9f15320dfdfe	000d0000-565c-36a1-3a95-007dafe10b75	00100000-565c-36a1-22de-74fe45dfdb10	00090000-565c-36a1-1bab-8f12d3c74435	\N	0010	t	\N	2015-11-30	\N	16	f	\N	f	t
000c0000-565c-36a1-2f6c-8f161563351d	000d0000-565c-36a1-3a95-007dafe10b75	00100000-565c-36a1-5e0e-4f2f2639a313	00090000-565c-36a1-3f95-6b168f0bc348	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-565c-36a1-6f2c-9cb98fd6c6d2	000d0000-565c-36a1-3e9b-0a733a0acea9	00100000-565c-36a1-a6ea-07f17b339666	00090000-565c-36a1-7fdf-0e103283a962	000b0000-565c-36a1-0fbb-6fc5b5b072ac	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3160 (class 0 OID 30125153)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 30124549)
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
-- TOC entry 3151 (class 0 OID 30125030)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-565c-36a1-1696-4165c439f51c	00160000-565c-36a0-1c30-16140477f735	00090000-565c-36a1-4e53-e7e5e2071452	aizv	10	t
003d0000-565c-36a1-9c34-558f84c4f284	00160000-565c-36a0-1c30-16140477f735	00090000-565c-36a1-98da-3e2b86286d46	apri	14	t
003d0000-565c-36a1-e613-69a3901eac57	00160000-565c-36a0-d8f3-98a66a71a7c0	00090000-565c-36a1-d9fb-9b3dae85e4eb	aizv	11	t
003d0000-565c-36a1-1a60-ff829a5b9330	00160000-565c-36a0-176f-8b92530babdb	00090000-565c-36a1-6e6e-4295df3c3cd0	aizv	12	t
003d0000-565c-36a1-6344-93e2d334caff	00160000-565c-36a0-1c30-16140477f735	00090000-565c-36a1-c82a-8411547e3359	apri	18	f
\.


--
-- TOC entry 3154 (class 0 OID 30125060)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-565c-36a0-1c30-16140477f735	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-565c-36a0-d8f3-98a66a71a7c0	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-565c-36a0-176f-8b92530babdb	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3175 (class 0 OID 30125463)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 30124804)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-565c-36a1-a95b-11f6fe8e51de	\N	\N	00200000-565c-36a1-3bc4-b0204b808598	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-565c-36a1-954c-1be755a55828	\N	\N	00200000-565c-36a1-13ea-871f4043268e	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-565c-36a1-c861-a9ee2490e3e3	\N	\N	00200000-565c-36a1-e20f-1b4b49e196ea	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-565c-36a1-1b60-b0ea9fc42721	\N	\N	00200000-565c-36a1-3083-c7b40915c096	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-565c-36a1-a0a5-d954a4db1280	\N	\N	00200000-565c-36a1-782d-36ca613a4fb8	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3129 (class 0 OID 30124836)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 30124841)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 30125385)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 30124701)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-565c-369e-fdc0-4ec6dec7f799	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-565c-369e-906a-0939363ce576	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-565c-369e-77bf-f41a8a27dc39	AL	ALB	008	Albania 	Albanija	\N
00040000-565c-369e-1433-08e182fc93f1	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-565c-369e-9abb-e4f51baef2bc	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-565c-369e-8ea7-05dc9761678b	AD	AND	020	Andorra 	Andora	\N
00040000-565c-369e-799e-106bca8983a0	AO	AGO	024	Angola 	Angola	\N
00040000-565c-369e-a13d-2ad69450aca5	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-565c-369e-3c16-8abc964e6208	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-565c-369e-0e8d-7f76fef82207	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-565c-369e-b411-83049d04f44c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-565c-369e-c831-0210ed112f02	AM	ARM	051	Armenia 	Armenija	\N
00040000-565c-369e-0838-98d9ad2f825e	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-565c-369e-2f3d-4930ba565a6f	AU	AUS	036	Australia 	Avstralija	\N
00040000-565c-369e-500a-e08ae14ec691	AT	AUT	040	Austria 	Avstrija	\N
00040000-565c-369e-17e1-be383adffdd9	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-565c-369e-4e26-81c1bafe64c7	BS	BHS	044	Bahamas 	Bahami	\N
00040000-565c-369e-851e-6e4c79537073	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-565c-369e-fa5d-fa91706fe6a3	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-565c-369e-1068-a9302bd598eb	BB	BRB	052	Barbados 	Barbados	\N
00040000-565c-369e-9e73-054190bfcd22	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-565c-369e-ceaa-7d0ce778398b	BE	BEL	056	Belgium 	Belgija	\N
00040000-565c-369e-b7ac-c2506a619dbf	BZ	BLZ	084	Belize 	Belize	\N
00040000-565c-369e-e528-548517a5c467	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-565c-369e-84a7-1e1ff7b600df	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-565c-369e-4395-d40e1c7a7a5c	BT	BTN	064	Bhutan 	Butan	\N
00040000-565c-369e-0689-5e63c7e7a9a5	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-565c-369e-ef4e-99665c3ae514	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-565c-369e-9e17-3b93b9aa864d	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-565c-369e-4b2b-292536c612dc	BW	BWA	072	Botswana 	Bocvana	\N
00040000-565c-369e-dfcb-d0a169ee8c21	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-565c-369e-e092-1e039fb13918	BR	BRA	076	Brazil 	Brazilija	\N
00040000-565c-369e-9004-f2fd91d4af94	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-565c-369e-65ce-77eccfe49a2c	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-565c-369e-a9a9-4da07ea6f785	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-565c-369e-75be-feb3fa8b1722	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-565c-369e-4480-ca44fccdc781	BI	BDI	108	Burundi 	Burundi 	\N
00040000-565c-369e-4a79-eb9251fdd056	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-565c-369e-0f65-9c5c513bac42	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-565c-369e-6932-02d0df8aa84d	CA	CAN	124	Canada 	Kanada	\N
00040000-565c-369e-4d2d-12d1e5f30817	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-565c-369e-d81f-ab0800f36b86	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-565c-369e-7d20-f4915633a50f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-565c-369e-3a0c-c5b54918613e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-565c-369e-7e99-70fb4ad3f39c	CL	CHL	152	Chile 	Čile	\N
00040000-565c-369e-a564-601a124ad3b7	CN	CHN	156	China 	Kitajska	\N
00040000-565c-369e-36fd-c26c7eaf585c	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-565c-369e-a7e4-a70327dffef8	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-565c-369e-4cba-16fb33ad40ea	CO	COL	170	Colombia 	Kolumbija	\N
00040000-565c-369e-7b22-08754b777d23	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-565c-369e-a6a4-077b2268932b	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-565c-369e-bef6-e00f581f8516	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-565c-369e-50f9-d5066af6be17	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-565c-369e-4310-c0d0216344b9	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-565c-369e-218d-18384b7f90f5	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-565c-369e-dd84-45baccf4ee30	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-565c-369e-f584-87a02ff30624	CU	CUB	192	Cuba 	Kuba	\N
00040000-565c-369e-233e-8f1a3f86c23e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-565c-369e-c5c6-c9f080ccdd53	CY	CYP	196	Cyprus 	Ciper	\N
00040000-565c-369e-af9a-10b43eb3b1dd	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-565c-369e-65c7-158e5274a6c5	DK	DNK	208	Denmark 	Danska	\N
00040000-565c-369e-67a6-99febc11efb1	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-565c-369e-5b1f-340e3d599e9c	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-565c-369e-2986-03218db7d541	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-565c-369e-b8dc-5b5f14236470	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-565c-369e-c6f0-84b5448a7798	EG	EGY	818	Egypt 	Egipt	\N
00040000-565c-369e-55bc-d5ff3cbc8d12	SV	SLV	222	El Salvador 	Salvador	\N
00040000-565c-369e-1d3e-4f124827edf8	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-565c-369e-24b0-d129eb86e63e	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-565c-369e-fdb8-1e177a200b98	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-565c-369e-f146-daa833e5864e	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-565c-369e-7ead-921c325233f9	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-565c-369e-4f9f-717331a5f09e	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-565c-369e-b5c2-f9f89cf6f25c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-565c-369e-acc5-2ab3458ef041	FI	FIN	246	Finland 	Finska	\N
00040000-565c-369e-402c-3ecfd2ae7a53	FR	FRA	250	France 	Francija	\N
00040000-565c-369e-e7f2-08c939725b96	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-565c-369e-be91-6cccca0497b9	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-565c-369e-7a47-030f02e1e118	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-565c-369e-70b7-2ecec16ac3e6	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-565c-369e-8d09-8a9af6400fbc	GA	GAB	266	Gabon 	Gabon	\N
00040000-565c-369e-d019-09255791f5a9	GM	GMB	270	Gambia 	Gambija	\N
00040000-565c-369e-679a-e26c1906bfc6	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-565c-369e-3813-9ebd6a9b5a47	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-565c-369e-342d-224225f84a7f	GH	GHA	288	Ghana 	Gana	\N
00040000-565c-369e-edbe-d524455dbc37	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-565c-369e-21aa-56f156ee1887	GR	GRC	300	Greece 	Grčija	\N
00040000-565c-369e-038c-5cba7751ecd2	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-565c-369e-2475-34f7dcb939cb	GD	GRD	308	Grenada 	Grenada	\N
00040000-565c-369e-e2f1-88653ba9f357	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-565c-369e-513c-6dade292a619	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-565c-369e-32b1-4e65222f89fc	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-565c-369e-7e56-464933b09375	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-565c-369e-38f9-40d88bbc92db	GN	GIN	324	Guinea 	Gvineja	\N
00040000-565c-369e-bcf2-3b9c35b51452	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-565c-369e-8b4a-507e4ae9c28a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-565c-369e-2918-485ad92629e7	HT	HTI	332	Haiti 	Haiti	\N
00040000-565c-369e-675f-c97bfde423db	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-565c-369e-21a5-ef20be9b582e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-565c-369e-ee9a-919b9a79674a	HN	HND	340	Honduras 	Honduras	\N
00040000-565c-369e-f1a1-4e25c2436440	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-565c-369e-8b8b-122a9de9794b	HU	HUN	348	Hungary 	Madžarska	\N
00040000-565c-369e-51c8-91dc79603bb9	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-565c-369e-06c8-efa4bf838ee7	IN	IND	356	India 	Indija	\N
00040000-565c-369e-0efb-22baa82beb22	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-565c-369e-ad66-9392fa13a625	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-565c-369e-a682-68fd2323eab3	IQ	IRQ	368	Iraq 	Irak	\N
00040000-565c-369e-26a7-15fc080b1dea	IE	IRL	372	Ireland 	Irska	\N
00040000-565c-369e-cb85-1bb053ce1320	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-565c-369e-44b0-3aac1115e3cc	IL	ISR	376	Israel 	Izrael	\N
00040000-565c-369e-5b8b-2633503f3d65	IT	ITA	380	Italy 	Italija	\N
00040000-565c-369e-cf38-b9ce85ccb816	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-565c-369e-486b-664b5df0a8a5	JP	JPN	392	Japan 	Japonska	\N
00040000-565c-369e-71fc-cac32ad5afc1	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-565c-369e-3619-10332ca55726	JO	JOR	400	Jordan 	Jordanija	\N
00040000-565c-369e-2a06-79c6c5f8e5d8	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-565c-369e-017a-4311d859b90f	KE	KEN	404	Kenya 	Kenija	\N
00040000-565c-369e-e658-4ddf28d5c673	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-565c-369e-b3f3-01b9aea48fe1	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-565c-369e-d456-d007cf1dc6f9	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-565c-369e-e540-d0e5eba1e1c7	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-565c-369e-fbdd-166f0283bd72	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-565c-369e-634e-d9c5434d9bb4	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-565c-369e-5ee2-9c1444f69ccd	LV	LVA	428	Latvia 	Latvija	\N
00040000-565c-369e-5df1-3ad7754adca3	LB	LBN	422	Lebanon 	Libanon	\N
00040000-565c-369e-83d5-9aed5c2b9a1e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-565c-369e-27da-80526f3418ac	LR	LBR	430	Liberia 	Liberija	\N
00040000-565c-369e-5181-a266f6d8536d	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-565c-369e-5331-fe05b879c5ae	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-565c-369e-aefa-42d1aa431714	LT	LTU	440	Lithuania 	Litva	\N
00040000-565c-369e-7062-1442ab33af77	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-565c-369e-c327-bb63c75d3a4b	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-565c-369e-8b03-86c0551bee1a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-565c-369e-e415-ad7077da1d63	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-565c-369e-7ec0-db5d6853c7d8	MW	MWI	454	Malawi 	Malavi	\N
00040000-565c-369e-5a90-f626716ac98d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-565c-369e-73e2-8b9dc2a3eb17	MV	MDV	462	Maldives 	Maldivi	\N
00040000-565c-369e-5dd0-7d516bb07380	ML	MLI	466	Mali 	Mali	\N
00040000-565c-369e-7a54-db4b32f9702f	MT	MLT	470	Malta 	Malta	\N
00040000-565c-369e-1fb9-f05e04df1de4	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-565c-369e-0011-4ead5c46fca8	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-565c-369e-ff73-b7c55cd5ebde	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-565c-369e-f4ef-a8edb68e8100	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-565c-369e-c088-06fede22a12a	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-565c-369e-2da0-6810e2e2325e	MX	MEX	484	Mexico 	Mehika	\N
00040000-565c-369e-b426-10fb0424e44a	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-565c-369e-4bcd-613c5a99ee77	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-565c-369e-ac98-7322bfa3381c	MC	MCO	492	Monaco 	Monako	\N
00040000-565c-369e-8774-3e568e9a33cb	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-565c-369e-4df8-a0d24affc020	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-565c-369e-8656-d9a50d5504ca	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-565c-369e-b4ad-dd3d45185923	MA	MAR	504	Morocco 	Maroko	\N
00040000-565c-369e-305b-49cc9f5c41f8	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-565c-369e-4eee-a3ab2ffc197b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-565c-369e-7fca-c9e72a2b4b54	NA	NAM	516	Namibia 	Namibija	\N
00040000-565c-369e-90c9-1e9cc1e7ad24	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-565c-369e-8d56-5979627dbb8d	NP	NPL	524	Nepal 	Nepal	\N
00040000-565c-369e-5902-13d3c113eeeb	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-565c-369e-8b0d-0550831ec2d5	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-565c-369e-7400-b6063c770630	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-565c-369e-9fc7-a2f66e25dc83	NE	NER	562	Niger 	Niger 	\N
00040000-565c-369e-209d-0bd6b858c369	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-565c-369e-9ee3-f682b6b349de	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-565c-369e-6674-c7739d1c23cf	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-565c-369e-9308-4c657f625cad	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-565c-369e-0375-e72cac6cf6b4	NO	NOR	578	Norway 	Norveška	\N
00040000-565c-369e-d9c3-0222daa02dee	OM	OMN	512	Oman 	Oman	\N
00040000-565c-369e-6d7d-95a579d171de	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-565c-369e-80cb-dd38e9d32403	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-565c-369e-f575-f6d897be8e56	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-565c-369e-e0e4-809442042c72	PA	PAN	591	Panama 	Panama	\N
00040000-565c-369e-1cc4-346383cafd4f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-565c-369e-8ad8-34e74928e06b	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-565c-369e-619c-592ed49c3e54	PE	PER	604	Peru 	Peru	\N
00040000-565c-369e-2dc7-ae085e6f73e3	PH	PHL	608	Philippines 	Filipini	\N
00040000-565c-369e-8ba8-1ff1b1a5ba55	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-565c-369e-0c80-94d19d8c6f47	PL	POL	616	Poland 	Poljska	\N
00040000-565c-369e-fcd0-3f4f2c19648f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-565c-369e-24cc-2a77b37aa2e9	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-565c-369e-7eed-b6b2bc55ee03	QA	QAT	634	Qatar 	Katar	\N
00040000-565c-369e-72f0-d770f376d040	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-565c-369e-c363-725730a19c83	RO	ROU	642	Romania 	Romunija	\N
00040000-565c-369e-efea-25d5fac2058f	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-565c-369f-a4ee-055105d7d9f9	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-565c-369f-89e9-63b058386eb0	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-565c-369f-67a5-31aab31a136f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-565c-369f-db6d-f4f7934e8297	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-565c-369f-d74c-1c2ec8f7cba0	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-565c-369f-dfec-d11730040c53	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-565c-369f-147a-d5266a8fed9b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-565c-369f-c8a9-3c57fc9133a7	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-565c-369f-38a9-4bd51b487238	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-565c-369f-96e9-5cdba48b5fa2	SM	SMR	674	San Marino 	San Marino	\N
00040000-565c-369f-e2d1-44aaf6aea529	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-565c-369f-bb85-6e5aa1453dbb	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-565c-369f-a764-e2060c035d48	SN	SEN	686	Senegal 	Senegal	\N
00040000-565c-369f-1f29-b0e4d07e58d5	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-565c-369f-f7d8-6135cd4f9a07	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-565c-369f-aded-e7c1d0d0f153	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-565c-369f-9f0e-b42f0536e7cd	SG	SGP	702	Singapore 	Singapur	\N
00040000-565c-369f-740d-21dafbcf08ef	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-565c-369f-5850-ec9968f038e3	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-565c-369f-8e67-fee7475c864f	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-565c-369f-b993-3d851b67f6d9	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-565c-369f-944a-c1a31b873285	SO	SOM	706	Somalia 	Somalija	\N
00040000-565c-369f-5b58-ebcd7c7f43f3	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-565c-369f-b659-ed120797ad1b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-565c-369f-5369-4de07a4b8cfa	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-565c-369f-99e3-91b12cd1f9ef	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-565c-369f-ff93-a088b575e696	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-565c-369f-e04b-990f2c76324c	SD	SDN	729	Sudan 	Sudan	\N
00040000-565c-369f-89be-bd3bcbea5607	SR	SUR	740	Suriname 	Surinam	\N
00040000-565c-369f-3858-308826b5a9fc	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-565c-369f-1bae-e33699d18da3	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-565c-369f-7acf-ae75c0e58e55	SE	SWE	752	Sweden 	Švedska	\N
00040000-565c-369f-d64c-54c8d54d5e3f	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-565c-369f-3806-8117f67fee3d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-565c-369f-c147-aad819b16824	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-565c-369f-f241-17edf87f4908	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-565c-369f-068c-13e06c63b115	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-565c-369f-1ce2-86b94a05b79a	TH	THA	764	Thailand 	Tajska	\N
00040000-565c-369f-5e78-2fe5f825497d	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-565c-369f-c468-7c33b351938a	TG	TGO	768	Togo 	Togo	\N
00040000-565c-369f-00be-b2193280d7c0	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-565c-369f-3738-37582516dc77	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-565c-369f-c107-5cbaf6ac8b8e	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-565c-369f-2a3e-13e2bac6841f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-565c-369f-0594-c88a4039db8b	TR	TUR	792	Turkey 	Turčija	\N
00040000-565c-369f-43dc-b55ecb4a846f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-565c-369f-47d0-3653211e071e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-565c-369f-a1bc-3c154078b6c9	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-565c-369f-bed1-84179d798a93	UG	UGA	800	Uganda 	Uganda	\N
00040000-565c-369f-a805-c12889690afa	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-565c-369f-004d-6e7becde8ceb	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-565c-369f-c320-85c3df5e6e1d	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-565c-369f-8755-5e1641c8e513	US	USA	840	United States 	Združene države Amerike	\N
00040000-565c-369f-e007-dbcb37a94beb	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-565c-369f-016f-6444444950b0	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-565c-369f-9043-967444faa3c2	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-565c-369f-dc2b-19ace6341ca8	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-565c-369f-7694-a6dff4ede427	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-565c-369f-3e3a-14f9ce588df4	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-565c-369f-e8f7-c6dfe3808285	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-565c-369f-deb3-940aad8e37de	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-565c-369f-e51e-a2afcdbb29af	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-565c-369f-0484-d706c49bd781	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-565c-369f-1317-f5162b229009	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-565c-369f-71a4-83d376974078	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-565c-369f-f749-d13da5a274d3	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3162 (class 0 OID 30125183)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-565c-36a1-0f25-e44c33a3fc71	000e0000-565c-36a1-26e0-06fb25ce4ad4	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-565c-369e-dab4-37ac8ecee288	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-565c-36a1-b8b5-e8788d4f250d	000e0000-565c-36a1-34cd-4a9d49f193f6	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-565c-369e-a0bc-3bf76e2e4fd8	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-565c-36a1-9814-5514d96be521	000e0000-565c-36a1-f41e-5592c04e7e78	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-565c-369e-dab4-37ac8ecee288	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-565c-36a1-900f-f3a0ed602540	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-565c-36a1-3ecb-5a15a4d935c4	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3147 (class 0 OID 30124984)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-565c-36a1-3a95-007dafe10b75	000e0000-565c-36a1-34cd-4a9d49f193f6	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-565c-369e-e13b-22c384ab57c4
000d0000-565c-36a1-e35e-1946c0fc8391	000e0000-565c-36a1-34cd-4a9d49f193f6	000c0000-565c-36a1-2ca1-dc8bbc1e423f	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-565c-369e-e13b-22c384ab57c4
000d0000-565c-36a1-0ce9-0b7ca7225847	000e0000-565c-36a1-34cd-4a9d49f193f6	000c0000-565c-36a1-c73d-6fe2b12f0b3d	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-565c-369e-46c8-6d1fec57117b
000d0000-565c-36a1-d97a-e17a4f5ead79	000e0000-565c-36a1-34cd-4a9d49f193f6	000c0000-565c-36a1-b10d-06bf87701afb	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-565c-369e-717e-896577eee2c2
000d0000-565c-36a1-68ed-7c3bebd5e873	000e0000-565c-36a1-34cd-4a9d49f193f6	000c0000-565c-36a1-4d34-5f040422756c	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-565c-369e-7519-1fe1c43db4fb
000d0000-565c-36a1-3ee3-a7f55942e1d4	000e0000-565c-36a1-34cd-4a9d49f193f6	000c0000-565c-36a1-7c77-e1001aab0cc9	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-565c-369e-7519-1fe1c43db4fb
000d0000-565c-36a1-6e38-abececcb09d7	000e0000-565c-36a1-34cd-4a9d49f193f6	000c0000-565c-36a1-9812-23558c4f6649	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-565c-369e-e13b-22c384ab57c4
000d0000-565c-36a1-3a50-a5f9ec25bc9b	000e0000-565c-36a1-34cd-4a9d49f193f6	000c0000-565c-36a1-dd77-31829f715f30	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-565c-369e-73ed-3900008dab30
000d0000-565c-36a1-3e9b-0a733a0acea9	000e0000-565c-36a1-34cd-4a9d49f193f6	000c0000-565c-36a1-6f2c-9cb98fd6c6d2	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-565c-369e-dcbc-fe1a9f4a6dce
\.


--
-- TOC entry 3124 (class 0 OID 30124775)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 30124741)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 30124718)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-565c-36a1-0aca-7fd2b702af22	00080000-565c-36a1-ec87-482348da97f3	00090000-565c-36a1-1bab-8f12d3c74435	AK		igralka
\.


--
-- TOC entry 3136 (class 0 OID 30124898)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 30125443)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-565c-36a1-9f47-2b62f4a16278	00010000-565c-369f-7364-d699ca0ff118	\N	Prva mapa	Root mapa	2015-11-30 12:44:33	2015-11-30 12:44:33	R	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 30125456)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 30125478)
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
-- TOC entry 3140 (class 0 OID 30124923)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 30124675)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-565c-369f-0118-691f2d6fd9d0	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-565c-369f-f904-e3acc8dc192b	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-565c-369f-b42e-67d7ed89d09c	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-565c-369f-8bc4-37e37f32e8ef	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-565c-369f-dd6f-c97cf752defb	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-565c-369f-9053-77132f55dbfb	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-565c-369f-b9ca-3ebf38bc4b8c	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-565c-369f-b8d0-139a25966927	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-565c-369f-003e-e5571ddd2749	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-565c-369f-6ca7-54c5ac152455	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-565c-369f-e009-133431a6ddb2	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-565c-369f-4245-374022018200	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-565c-369f-bac9-50a324e644f1	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-565c-369f-d565-698ece3d36ff	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-565c-36a1-f923-742a43f7ecaa	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-565c-36a1-28b5-c943b4a25f81	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-565c-36a1-e9a5-20a5dd292e31	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-565c-36a1-d87a-1b7b00948792	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-565c-36a1-6e02-00619c4a7bf4	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-565c-36a3-161f-6b8585f9bd99	application.tenant.maticnopodjetje	string	s:36:"00080000-565c-36a3-9662-982ecbb58a8a";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3109 (class 0 OID 30124575)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-565c-36a1-96bf-2bc882f19e2b	00000000-565c-36a1-f923-742a43f7ecaa	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-565c-36a1-b399-47a3918baba8	00000000-565c-36a1-f923-742a43f7ecaa	00010000-565c-369f-7364-d699ca0ff118	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-565c-36a1-4419-9f3d9aec6af4	00000000-565c-36a1-28b5-c943b4a25f81	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3113 (class 0 OID 30124642)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-565c-36a1-3d5f-89c7e7473212	\N	00100000-565c-36a1-a6ea-07f17b339666	00100000-565c-36a1-73e4-a326e36e29d2	01	Gledališče Nimbis
00410000-565c-36a1-7229-c940e8a44c85	00410000-565c-36a1-3d5f-89c7e7473212	00100000-565c-36a1-a6ea-07f17b339666	00100000-565c-36a1-73e4-a326e36e29d2	02	Tehnika
\.


--
-- TOC entry 3110 (class 0 OID 30124586)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-565c-36a1-d74c-c27b605be904	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-565c-36a1-510b-a16931b8de1c	00010000-565c-36a1-9492-ff2a3cef9f6e	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-565c-36a1-d4b1-06d5e23b1385	00010000-565c-36a1-3189-a3d81c490add	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-565c-36a1-8bdd-912444673edf	00010000-565c-36a1-b35b-84f2f59e4a65	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-565c-36a1-eddc-2196adc1a2b3	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-565c-36a1-f803-f71ab525f440	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-565c-36a1-3f95-6b168f0bc348	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-565c-36a1-a68f-8f16479c53cc	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-565c-36a1-1bab-8f12d3c74435	00010000-565c-36a1-e944-9b7b61384c1b	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-565c-36a1-7fdf-0e103283a962	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-565c-36a1-89e7-5e79cd72c884	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-565c-36a1-6027-59143662e490	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-565c-36a1-7327-eb75fc5da5f5	00010000-565c-36a1-bd58-60d07159128e	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-565c-36a1-4e53-e7e5e2071452	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-565c-36a1-98da-3e2b86286d46	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-565c-36a1-d9fb-9b3dae85e4eb	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-565c-36a1-6e6e-4295df3c3cd0	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-565c-36a1-c82a-8411547e3359	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-565c-36a1-306f-200eb668947c	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-565c-36a1-3216-0b15161a551a	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-565c-36a1-fb69-06814f1288ec	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3102 (class 0 OID 30124521)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-565c-369f-cc2a-8f802ae89066	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-565c-369f-b8fa-087e5188c492	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-565c-369f-0d70-f134de456b56	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-565c-369f-9342-bb8db84c32b2	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-565c-369f-9b17-bf39d1412216	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-565c-369f-d298-35e723fef2b5	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-565c-369f-6319-a0b215bcfeff	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-565c-369f-299f-a028a30327ed	Abonma-read	Abonma - branje	t
00030000-565c-369f-d9f0-cde05ded0e82	Abonma-write	Abonma - spreminjanje	t
00030000-565c-369f-0a09-7ce3be3e28f8	Alternacija-read	Alternacija - branje	t
00030000-565c-369f-b7f9-46e98aca2842	Alternacija-write	Alternacija - spreminjanje	t
00030000-565c-369f-8e9a-40b87eb28670	Arhivalija-read	Arhivalija - branje	t
00030000-565c-369f-0c3c-e66265bda4e5	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-565c-369f-50ee-3c5b22c1af6e	AuthStorage-read	AuthStorage - branje	t
00030000-565c-369f-49be-b4cd1e8bfbbc	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-565c-369f-ea06-c68e6747e3ef	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-565c-369f-9ab6-18c9b1576b0e	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-565c-369f-c8d8-53b45b016a31	Besedilo-read	Besedilo - branje	t
00030000-565c-369f-0f3f-a119c11a1179	Besedilo-write	Besedilo - spreminjanje	t
00030000-565c-369f-8f68-9922e4a9f3e1	Dogodek-read	Dogodek - branje	t
00030000-565c-369f-6631-ce61f01958a5	Dogodek-write	Dogodek - spreminjanje	t
00030000-565c-369f-ab56-e96a207ffe2a	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-565c-369f-96a5-06af66327d4a	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-565c-369f-2ee3-3ed24d2106f8	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-565c-369f-47d4-4eee52fb4dbc	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-565c-369f-6336-184b229b1abb	DogodekTrait-read	DogodekTrait - branje	t
00030000-565c-369f-17d8-1f095ff71e4c	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-565c-369f-acaf-40786993a3f3	DrugiVir-read	DrugiVir - branje	t
00030000-565c-369f-f958-cb7ab57470cd	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-565c-369f-f4b6-197c75d27a86	Drzava-read	Drzava - branje	t
00030000-565c-369f-593b-82d0e237324b	Drzava-write	Drzava - spreminjanje	t
00030000-565c-369f-b1f9-eabed01703c3	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-565c-369f-4f52-218fd1ad8356	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-565c-369f-0f04-1566a8691e7e	Funkcija-read	Funkcija - branje	t
00030000-565c-369f-cad7-ed3fb0dd5024	Funkcija-write	Funkcija - spreminjanje	t
00030000-565c-369f-e6aa-051828b086ce	Gostovanje-read	Gostovanje - branje	t
00030000-565c-369f-ad76-7a971c99205a	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-565c-369f-be06-b24946b41514	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-565c-369f-234f-bedb8028d1e7	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-565c-369f-3650-d0f2226a52b2	Kupec-read	Kupec - branje	t
00030000-565c-369f-a048-5c3b2ad913e0	Kupec-write	Kupec - spreminjanje	t
00030000-565c-369f-aaf8-9232f1d32b15	NacinPlacina-read	NacinPlacina - branje	t
00030000-565c-369f-a37f-e49057f74df2	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-565c-369f-8c68-e3ddb726d981	Option-read	Option - branje	t
00030000-565c-369f-bbb0-61b0510ab46c	Option-write	Option - spreminjanje	t
00030000-565c-369f-fb1f-e326ca0bbde5	OptionValue-read	OptionValue - branje	t
00030000-565c-369f-e5c0-781e8d5d521c	OptionValue-write	OptionValue - spreminjanje	t
00030000-565c-369f-7cb4-de2877f4d2a6	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-565c-369f-c763-d070c14b11b6	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-565c-369f-1972-12d8e4c4a8be	Oseba-read	Oseba - branje	t
00030000-565c-369f-a1d0-a3fbee62f033	Oseba-write	Oseba - spreminjanje	t
00030000-565c-369f-d330-6669afa152e5	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-565c-369f-a815-2d695de4091c	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-565c-369f-78c8-bcdda0d64c4b	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-565c-369f-242b-2444ac1cd321	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-565c-369f-ab8d-48eac14d9c52	Pogodba-read	Pogodba - branje	t
00030000-565c-369f-f44d-1858825f707f	Pogodba-write	Pogodba - spreminjanje	t
00030000-565c-369f-5142-5f35a761aaa8	Popa-read	Popa - branje	t
00030000-565c-369f-2f86-04870d1fd82f	Popa-write	Popa - spreminjanje	t
00030000-565c-369f-487a-f840b3c22d54	Posta-read	Posta - branje	t
00030000-565c-369f-a367-6df3f4b571de	Posta-write	Posta - spreminjanje	t
00030000-565c-369f-a1f7-654e1dddb95b	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-565c-369f-4cd0-7da4bd1b7aae	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-565c-369f-c258-2faaf584a296	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-565c-369f-0303-b7681e75d1de	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-565c-369f-98e8-6c8270f7d7a1	PostniNaslov-read	PostniNaslov - branje	t
00030000-565c-369f-9ae7-a5d54ffbaca9	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-565c-369f-0c3c-7a739926f9b9	Praznik-read	Praznik - branje	t
00030000-565c-369f-bba3-aa28db295bb3	Praznik-write	Praznik - spreminjanje	t
00030000-565c-369f-1263-fc3fd14c0267	Predstava-read	Predstava - branje	t
00030000-565c-369f-a4ff-182f4308406e	Predstava-write	Predstava - spreminjanje	t
00030000-565c-369f-decd-f7dc35e3fdba	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-565c-369f-a963-328c4d4db40b	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-565c-369f-9c3f-5ee10a7fd12c	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-565c-369f-a529-310fbe0cb67f	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-565c-369f-b07f-01a580e7915a	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-565c-369f-fe1f-a421ecda6840	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-565c-369f-1277-24f307c1d5c9	ProgramDela-read	ProgramDela - branje	t
00030000-565c-369f-d1b7-7103730cf026	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-565c-369f-c0a6-5c3fff4fb3e0	ProgramFestival-read	ProgramFestival - branje	t
00030000-565c-369f-8877-f60edc4e73a7	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-565c-369f-fe8d-a5a9f1a75d2d	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-565c-369f-2731-705e35fe9461	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-565c-369f-b424-f7a1876b152e	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-565c-369f-e6d8-0caf875c173d	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-565c-369f-73bc-d39405e4fdd2	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-565c-369f-12a6-111b2cc9aabb	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-565c-369f-83d4-8404ce312b8c	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-565c-369f-2900-78c86185cda2	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-565c-369f-0231-b90886cfd5f0	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-565c-369f-5c64-3e3c52b9dc25	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-565c-369f-86cd-2897931dd9cc	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-565c-369f-e95e-0cef300d7088	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-565c-369f-37c1-f6576405c167	ProgramRazno-read	ProgramRazno - branje	t
00030000-565c-369f-4c6b-38a2615e7af0	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-565c-369f-10cc-aabc0038761d	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-565c-369f-46ae-31e10cd12fb9	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-565c-369f-1fcc-62bd4c30a52d	Prostor-read	Prostor - branje	t
00030000-565c-369f-1c55-264625d85e51	Prostor-write	Prostor - spreminjanje	t
00030000-565c-369f-6aed-5b8919abb35f	Racun-read	Racun - branje	t
00030000-565c-369f-ed9a-4fbc9f97e1fb	Racun-write	Racun - spreminjanje	t
00030000-565c-369f-557a-309a484da7e2	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-565c-369f-14e4-9f7f6e97126b	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-565c-369f-9585-e63ce7bcfb51	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-565c-369f-7b91-1e7a433429a9	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-565c-369f-4f58-9d2768651ed6	Rekvizit-read	Rekvizit - branje	t
00030000-565c-369f-c9e8-5779d6ce8c00	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-565c-369f-1017-b5236b9d666a	Revizija-read	Revizija - branje	t
00030000-565c-369f-7aed-49e701f04a55	Revizija-write	Revizija - spreminjanje	t
00030000-565c-369f-581a-19970e5d7f9f	Rezervacija-read	Rezervacija - branje	t
00030000-565c-369f-b06b-570f49340f9b	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-565c-369f-bd20-d73798706f26	SedezniRed-read	SedezniRed - branje	t
00030000-565c-369f-b136-36fa3b90282e	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-565c-369f-68e9-ba1710a40c97	Sedez-read	Sedez - branje	t
00030000-565c-369f-5fc4-835749ec7dc7	Sedez-write	Sedez - spreminjanje	t
00030000-565c-369f-a4fd-8774212d49ef	Sezona-read	Sezona - branje	t
00030000-565c-369f-819a-3b066c060ed1	Sezona-write	Sezona - spreminjanje	t
00030000-565c-369f-83e9-ad7c251022a8	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-565c-369f-22a6-d7c482b68719	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-565c-369f-a6fd-1d395401cb7a	Stevilcenje-read	Stevilcenje - branje	t
00030000-565c-369f-bcd8-e0f741c4a0d7	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-565c-369f-5bb8-bd8371c2a00e	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-565c-369f-bccc-3ca1df432dc5	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-565c-369f-99bf-1e39650dfe33	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-565c-369f-de88-5b046fe51110	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-565c-369f-f6c5-b92b60cd3e6b	Telefonska-read	Telefonska - branje	t
00030000-565c-369f-b628-d402f9cf770b	Telefonska-write	Telefonska - spreminjanje	t
00030000-565c-369f-fb02-7a6e718f67cb	TerminStoritve-read	TerminStoritve - branje	t
00030000-565c-369f-bd01-f55043708e5c	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-565c-369f-1396-cfa107138ab4	TipFunkcije-read	TipFunkcije - branje	t
00030000-565c-369f-8b8c-6f842706c335	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-565c-369f-f233-d8281b7028e0	TipPopa-read	TipPopa - branje	t
00030000-565c-369f-47b6-4ec506a33c17	TipPopa-write	TipPopa - spreminjanje	t
00030000-565c-369f-2611-ba10123e7e1c	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-565c-369f-5e5e-87769f0699e8	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-565c-369f-bf74-1bee7c12cd45	TipVaje-read	TipVaje - branje	t
00030000-565c-369f-9fd0-f4d376800066	TipVaje-write	TipVaje - spreminjanje	t
00030000-565c-369f-b016-26474d66780b	Trr-read	Trr - branje	t
00030000-565c-369f-44ec-6f7dc495e386	Trr-write	Trr - spreminjanje	t
00030000-565c-369f-4f16-f3dcadaaea8c	Uprizoritev-read	Uprizoritev - branje	t
00030000-565c-369f-31c0-6f9080e4ca43	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-565c-369f-aa2e-b95efb52548e	Vaja-read	Vaja - branje	t
00030000-565c-369f-abd0-969486c47090	Vaja-write	Vaja - spreminjanje	t
00030000-565c-369f-e777-7395771a631b	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-565c-369f-1c03-6c6068845157	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-565c-369f-3925-c15101672906	VrstaStroska-read	VrstaStroska - branje	t
00030000-565c-369f-0bdb-5e575fbb4fde	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-565c-369f-59a3-eb43d31ac3f3	Zaposlitev-read	Zaposlitev - branje	t
00030000-565c-369f-cb05-f2f4608e0bea	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-565c-369f-2aa8-17b6f81ff22c	Zasedenost-read	Zasedenost - branje	t
00030000-565c-369f-2683-a87ab12ab6dd	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-565c-369f-eeb2-2b3cb27cee04	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-565c-369f-2a60-5e61b04fa28c	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-565c-369f-daad-4b1eaa2b4f9d	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-565c-369f-6e25-9a767c10bbd5	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-565c-369f-68b7-2569f7ec4d5a	Job-read	Branje opravil - samo zase - branje	t
00030000-565c-369f-e2a7-4709ee54a8a6	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-565c-369f-f8fd-72bf5a79e201	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-565c-369f-14e3-6a638e4d6dac	Report-read	Report - branje	t
00030000-565c-369f-bbdb-80bae1005d8f	Report-write	Report - spreminjanje	t
00030000-565c-369f-889c-07d61a38bc0a	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-565c-369f-4ce7-4048f851b79a	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-565c-369f-f806-347e6c5f9809	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-565c-369f-b8c3-d0f61055b83f	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-565c-369f-e97b-48b3e18bd878	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-565c-369f-2633-e47e93e9425c	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-565c-369f-e561-46a3c9f54892	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-565c-369f-a95b-feb8203daae8	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-565c-369f-5de5-e758d7ec2d3a	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-565c-369f-d83c-32005d9a2de7	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-565c-369f-18c4-af023d6b4f65	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-565c-369f-244a-cb6641623ecb	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-565c-369f-6109-baf17b39808d	Datoteka-write	Datoteka - spreminjanje	t
00030000-565c-369f-2d9a-9eac853348c7	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3104 (class 0 OID 30124540)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-565c-369f-302b-2d099312663a	00030000-565c-369f-b8fa-087e5188c492
00020000-565c-369f-302b-2d099312663a	00030000-565c-369f-cc2a-8f802ae89066
00020000-565c-369f-ff88-7fcb1364468e	00030000-565c-369f-f4b6-197c75d27a86
00020000-565c-369f-0e9c-b0a82a20ac70	00030000-565c-369f-9ab6-18c9b1576b0e
00020000-565c-369f-0e9c-b0a82a20ac70	00030000-565c-369f-0f3f-a119c11a1179
00020000-565c-369f-0e9c-b0a82a20ac70	00030000-565c-369f-6109-baf17b39808d
00020000-565c-369f-0e9c-b0a82a20ac70	00030000-565c-369f-e561-46a3c9f54892
00020000-565c-369f-0e9c-b0a82a20ac70	00030000-565c-369f-5de5-e758d7ec2d3a
00020000-565c-369f-0e9c-b0a82a20ac70	00030000-565c-369f-ea06-c68e6747e3ef
00020000-565c-369f-0e9c-b0a82a20ac70	00030000-565c-369f-c8d8-53b45b016a31
00020000-565c-369f-0e9c-b0a82a20ac70	00030000-565c-369f-2d9a-9eac853348c7
00020000-565c-369f-0e9c-b0a82a20ac70	00030000-565c-369f-1972-12d8e4c4a8be
00020000-565c-369f-0e9c-b0a82a20ac70	00030000-565c-369f-a95b-feb8203daae8
00020000-565c-369f-0e9c-b0a82a20ac70	00030000-565c-369f-d83c-32005d9a2de7
00020000-565c-369f-4e50-dd310cd65970	00030000-565c-369f-ea06-c68e6747e3ef
00020000-565c-369f-4e50-dd310cd65970	00030000-565c-369f-c8d8-53b45b016a31
00020000-565c-369f-4e50-dd310cd65970	00030000-565c-369f-2d9a-9eac853348c7
00020000-565c-369f-4e50-dd310cd65970	00030000-565c-369f-a95b-feb8203daae8
00020000-565c-369f-4e50-dd310cd65970	00030000-565c-369f-d83c-32005d9a2de7
00020000-565c-369f-31a7-98d9a0097c1f	00030000-565c-369f-1972-12d8e4c4a8be
00020000-565c-369f-31a7-98d9a0097c1f	00030000-565c-369f-59a3-eb43d31ac3f3
00020000-565c-369f-31a7-98d9a0097c1f	00030000-565c-369f-cb05-f2f4608e0bea
00020000-565c-369f-31a7-98d9a0097c1f	00030000-565c-369f-7cb4-de2877f4d2a6
00020000-565c-369f-e44d-d62fb904cb65	00030000-565c-369f-59a3-eb43d31ac3f3
00020000-565c-369f-e44d-d62fb904cb65	00030000-565c-369f-7cb4-de2877f4d2a6
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-f6c5-b92b60cd3e6b
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-98e8-6c8270f7d7a1
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-1972-12d8e4c4a8be
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-a95b-feb8203daae8
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-b016-26474d66780b
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-5142-5f35a761aaa8
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-2d9a-9eac853348c7
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-d83c-32005d9a2de7
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-be06-b24946b41514
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-b07f-01a580e7915a
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-b628-d402f9cf770b
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-9ae7-a5d54ffbaca9
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-e561-46a3c9f54892
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-44ec-6f7dc495e386
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-2f86-04870d1fd82f
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-6109-baf17b39808d
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-5de5-e758d7ec2d3a
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-234f-bedb8028d1e7
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-fe1f-a421ecda6840
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-f4b6-197c75d27a86
00020000-565c-369f-90e2-0840c51684dc	00030000-565c-369f-f233-d8281b7028e0
00020000-565c-369f-2375-b59945c39792	00030000-565c-369f-f6c5-b92b60cd3e6b
00020000-565c-369f-2375-b59945c39792	00030000-565c-369f-98e8-6c8270f7d7a1
00020000-565c-369f-2375-b59945c39792	00030000-565c-369f-a95b-feb8203daae8
00020000-565c-369f-2375-b59945c39792	00030000-565c-369f-b016-26474d66780b
00020000-565c-369f-2375-b59945c39792	00030000-565c-369f-5142-5f35a761aaa8
00020000-565c-369f-2375-b59945c39792	00030000-565c-369f-2d9a-9eac853348c7
00020000-565c-369f-2375-b59945c39792	00030000-565c-369f-d83c-32005d9a2de7
00020000-565c-369f-2375-b59945c39792	00030000-565c-369f-be06-b24946b41514
00020000-565c-369f-2375-b59945c39792	00030000-565c-369f-b07f-01a580e7915a
00020000-565c-369f-2375-b59945c39792	00030000-565c-369f-f4b6-197c75d27a86
00020000-565c-369f-2375-b59945c39792	00030000-565c-369f-f233-d8281b7028e0
00020000-565c-369f-da85-b7df2c21d7cc	00030000-565c-369f-f233-d8281b7028e0
00020000-565c-369f-da85-b7df2c21d7cc	00030000-565c-369f-47b6-4ec506a33c17
00020000-565c-369f-0ed3-8d148188c550	00030000-565c-369f-f233-d8281b7028e0
00020000-565c-369f-3bdf-2713714542ca	00030000-565c-369f-487a-f840b3c22d54
00020000-565c-369f-3bdf-2713714542ca	00030000-565c-369f-a367-6df3f4b571de
00020000-565c-369f-524a-78dddc65ddc2	00030000-565c-369f-487a-f840b3c22d54
00020000-565c-369f-0c8d-4d05dc0fd7cd	00030000-565c-369f-f4b6-197c75d27a86
00020000-565c-369f-0c8d-4d05dc0fd7cd	00030000-565c-369f-593b-82d0e237324b
00020000-565c-369f-cbf8-82f8f4d228d9	00030000-565c-369f-f4b6-197c75d27a86
00020000-565c-369f-d6bb-4ddd8572606a	00030000-565c-369f-daad-4b1eaa2b4f9d
00020000-565c-369f-d6bb-4ddd8572606a	00030000-565c-369f-6e25-9a767c10bbd5
00020000-565c-369f-f7ca-cbafa0c32f79	00030000-565c-369f-daad-4b1eaa2b4f9d
00020000-565c-369f-35b3-8b5c685a104d	00030000-565c-369f-eeb2-2b3cb27cee04
00020000-565c-369f-35b3-8b5c685a104d	00030000-565c-369f-2a60-5e61b04fa28c
00020000-565c-369f-59bf-72b142e336a3	00030000-565c-369f-eeb2-2b3cb27cee04
00020000-565c-369f-8f61-7c8b590ffde7	00030000-565c-369f-299f-a028a30327ed
00020000-565c-369f-8f61-7c8b590ffde7	00030000-565c-369f-d9f0-cde05ded0e82
00020000-565c-369f-b659-fb85e332c7ee	00030000-565c-369f-299f-a028a30327ed
00020000-565c-369f-1084-726e774b8b27	00030000-565c-369f-1fcc-62bd4c30a52d
00020000-565c-369f-1084-726e774b8b27	00030000-565c-369f-1c55-264625d85e51
00020000-565c-369f-1084-726e774b8b27	00030000-565c-369f-5142-5f35a761aaa8
00020000-565c-369f-1084-726e774b8b27	00030000-565c-369f-98e8-6c8270f7d7a1
00020000-565c-369f-1084-726e774b8b27	00030000-565c-369f-9ae7-a5d54ffbaca9
00020000-565c-369f-1084-726e774b8b27	00030000-565c-369f-f4b6-197c75d27a86
00020000-565c-369f-c869-99ddcdd99e34	00030000-565c-369f-1fcc-62bd4c30a52d
00020000-565c-369f-c869-99ddcdd99e34	00030000-565c-369f-5142-5f35a761aaa8
00020000-565c-369f-c869-99ddcdd99e34	00030000-565c-369f-98e8-6c8270f7d7a1
00020000-565c-369f-6521-2e680baab174	00030000-565c-369f-3925-c15101672906
00020000-565c-369f-6521-2e680baab174	00030000-565c-369f-0bdb-5e575fbb4fde
00020000-565c-369f-fea3-60e4e5768b6d	00030000-565c-369f-3925-c15101672906
00020000-565c-369f-7c97-8b16d2fa2956	00030000-565c-369f-c763-d070c14b11b6
00020000-565c-369f-7c97-8b16d2fa2956	00030000-565c-369f-7cb4-de2877f4d2a6
00020000-565c-369f-7c97-8b16d2fa2956	00030000-565c-369f-59a3-eb43d31ac3f3
00020000-565c-369f-7c97-8b16d2fa2956	00030000-565c-369f-6109-baf17b39808d
00020000-565c-369f-7c97-8b16d2fa2956	00030000-565c-369f-2d9a-9eac853348c7
00020000-565c-369f-7c97-8b16d2fa2956	00030000-565c-369f-e561-46a3c9f54892
00020000-565c-369f-7c97-8b16d2fa2956	00030000-565c-369f-a95b-feb8203daae8
00020000-565c-369f-7c97-8b16d2fa2956	00030000-565c-369f-5de5-e758d7ec2d3a
00020000-565c-369f-7c97-8b16d2fa2956	00030000-565c-369f-d83c-32005d9a2de7
00020000-565c-369f-ec18-0c841ee19563	00030000-565c-369f-7cb4-de2877f4d2a6
00020000-565c-369f-ec18-0c841ee19563	00030000-565c-369f-59a3-eb43d31ac3f3
00020000-565c-369f-ec18-0c841ee19563	00030000-565c-369f-2d9a-9eac853348c7
00020000-565c-369f-ec18-0c841ee19563	00030000-565c-369f-a95b-feb8203daae8
00020000-565c-369f-ec18-0c841ee19563	00030000-565c-369f-d83c-32005d9a2de7
00020000-565c-369f-1b11-27d05196268c	00030000-565c-369f-bf74-1bee7c12cd45
00020000-565c-369f-1b11-27d05196268c	00030000-565c-369f-9fd0-f4d376800066
00020000-565c-369f-9b27-917c7e5705f9	00030000-565c-369f-bf74-1bee7c12cd45
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-d298-35e723fef2b5
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-6319-a0b215bcfeff
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-1277-24f307c1d5c9
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-d1b7-7103730cf026
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-c0a6-5c3fff4fb3e0
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-8877-f60edc4e73a7
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-fe8d-a5a9f1a75d2d
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-2731-705e35fe9461
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-b424-f7a1876b152e
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-e6d8-0caf875c173d
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-73bc-d39405e4fdd2
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-12a6-111b2cc9aabb
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-83d4-8404ce312b8c
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-2900-78c86185cda2
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-0231-b90886cfd5f0
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-5c64-3e3c52b9dc25
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-86cd-2897931dd9cc
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-e95e-0cef300d7088
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-37c1-f6576405c167
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-4c6b-38a2615e7af0
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-10cc-aabc0038761d
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-46ae-31e10cd12fb9
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-a529-310fbe0cb67f
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-f958-cb7ab57470cd
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-4cd0-7da4bd1b7aae
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-acaf-40786993a3f3
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-9c3f-5ee10a7fd12c
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-b07f-01a580e7915a
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-a1f7-654e1dddb95b
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-3925-c15101672906
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-4f16-f3dcadaaea8c
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-99bf-1e39650dfe33
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-0f04-1566a8691e7e
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-0a09-7ce3be3e28f8
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-1396-cfa107138ab4
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-1972-12d8e4c4a8be
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-ab8d-48eac14d9c52
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-f4b6-197c75d27a86
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-5142-5f35a761aaa8
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-6109-baf17b39808d
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-e561-46a3c9f54892
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-5de5-e758d7ec2d3a
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-2d9a-9eac853348c7
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-a95b-feb8203daae8
00020000-565c-369f-8c65-fa51dda30e7b	00030000-565c-369f-d83c-32005d9a2de7
00020000-565c-369f-735e-b6db1559bc81	00030000-565c-369f-1277-24f307c1d5c9
00020000-565c-369f-735e-b6db1559bc81	00030000-565c-369f-c0a6-5c3fff4fb3e0
00020000-565c-369f-735e-b6db1559bc81	00030000-565c-369f-fe8d-a5a9f1a75d2d
00020000-565c-369f-735e-b6db1559bc81	00030000-565c-369f-b424-f7a1876b152e
00020000-565c-369f-735e-b6db1559bc81	00030000-565c-369f-73bc-d39405e4fdd2
00020000-565c-369f-735e-b6db1559bc81	00030000-565c-369f-83d4-8404ce312b8c
00020000-565c-369f-735e-b6db1559bc81	00030000-565c-369f-0231-b90886cfd5f0
00020000-565c-369f-735e-b6db1559bc81	00030000-565c-369f-86cd-2897931dd9cc
00020000-565c-369f-735e-b6db1559bc81	00030000-565c-369f-37c1-f6576405c167
00020000-565c-369f-735e-b6db1559bc81	00030000-565c-369f-10cc-aabc0038761d
00020000-565c-369f-735e-b6db1559bc81	00030000-565c-369f-9c3f-5ee10a7fd12c
00020000-565c-369f-735e-b6db1559bc81	00030000-565c-369f-acaf-40786993a3f3
00020000-565c-369f-735e-b6db1559bc81	00030000-565c-369f-a1f7-654e1dddb95b
00020000-565c-369f-735e-b6db1559bc81	00030000-565c-369f-f4b6-197c75d27a86
00020000-565c-369f-735e-b6db1559bc81	00030000-565c-369f-14e3-6a638e4d6dac
00020000-565c-369f-735e-b6db1559bc81	00030000-565c-369f-2d9a-9eac853348c7
00020000-565c-369f-735e-b6db1559bc81	00030000-565c-369f-a95b-feb8203daae8
00020000-565c-369f-735e-b6db1559bc81	00030000-565c-369f-d83c-32005d9a2de7
00020000-565c-369f-222d-c9dbae1c2bbe	00030000-565c-369f-4f16-f3dcadaaea8c
00020000-565c-369f-222d-c9dbae1c2bbe	00030000-565c-369f-31c0-6f9080e4ca43
00020000-565c-369f-222d-c9dbae1c2bbe	00030000-565c-369f-0a09-7ce3be3e28f8
00020000-565c-369f-222d-c9dbae1c2bbe	00030000-565c-369f-b7f9-46e98aca2842
00020000-565c-369f-222d-c9dbae1c2bbe	00030000-565c-369f-c8d8-53b45b016a31
00020000-565c-369f-222d-c9dbae1c2bbe	00030000-565c-369f-0f04-1566a8691e7e
00020000-565c-369f-222d-c9dbae1c2bbe	00030000-565c-369f-cad7-ed3fb0dd5024
00020000-565c-369f-222d-c9dbae1c2bbe	00030000-565c-369f-1972-12d8e4c4a8be
00020000-565c-369f-222d-c9dbae1c2bbe	00030000-565c-369f-b07f-01a580e7915a
00020000-565c-369f-222d-c9dbae1c2bbe	00030000-565c-369f-1396-cfa107138ab4
00020000-565c-369f-222d-c9dbae1c2bbe	00030000-565c-369f-2d9a-9eac853348c7
00020000-565c-369f-222d-c9dbae1c2bbe	00030000-565c-369f-6109-baf17b39808d
00020000-565c-369f-222d-c9dbae1c2bbe	00030000-565c-369f-a95b-feb8203daae8
00020000-565c-369f-222d-c9dbae1c2bbe	00030000-565c-369f-e561-46a3c9f54892
00020000-565c-369f-222d-c9dbae1c2bbe	00030000-565c-369f-d83c-32005d9a2de7
00020000-565c-369f-222d-c9dbae1c2bbe	00030000-565c-369f-5de5-e758d7ec2d3a
00020000-565c-369f-471f-04015be25be6	00030000-565c-369f-4f16-f3dcadaaea8c
00020000-565c-369f-471f-04015be25be6	00030000-565c-369f-0a09-7ce3be3e28f8
00020000-565c-369f-471f-04015be25be6	00030000-565c-369f-c8d8-53b45b016a31
00020000-565c-369f-471f-04015be25be6	00030000-565c-369f-0f04-1566a8691e7e
00020000-565c-369f-471f-04015be25be6	00030000-565c-369f-1972-12d8e4c4a8be
00020000-565c-369f-471f-04015be25be6	00030000-565c-369f-b07f-01a580e7915a
00020000-565c-369f-471f-04015be25be6	00030000-565c-369f-1396-cfa107138ab4
00020000-565c-369f-471f-04015be25be6	00030000-565c-369f-2d9a-9eac853348c7
00020000-565c-369f-471f-04015be25be6	00030000-565c-369f-a95b-feb8203daae8
00020000-565c-369f-471f-04015be25be6	00030000-565c-369f-e561-46a3c9f54892
00020000-565c-369f-471f-04015be25be6	00030000-565c-369f-d83c-32005d9a2de7
00020000-565c-369f-d610-655b29f85066	00030000-565c-369f-0a09-7ce3be3e28f8
00020000-565c-369f-d610-655b29f85066	00030000-565c-369f-b7f9-46e98aca2842
00020000-565c-369f-d610-655b29f85066	00030000-565c-369f-0f04-1566a8691e7e
00020000-565c-369f-d610-655b29f85066	00030000-565c-369f-1972-12d8e4c4a8be
00020000-565c-369f-d610-655b29f85066	00030000-565c-369f-ab8d-48eac14d9c52
00020000-565c-369f-d610-655b29f85066	00030000-565c-369f-f44d-1858825f707f
00020000-565c-369f-d610-655b29f85066	00030000-565c-369f-5142-5f35a761aaa8
00020000-565c-369f-d610-655b29f85066	00030000-565c-369f-b07f-01a580e7915a
00020000-565c-369f-d610-655b29f85066	00030000-565c-369f-99bf-1e39650dfe33
00020000-565c-369f-d610-655b29f85066	00030000-565c-369f-de88-5b046fe51110
00020000-565c-369f-d610-655b29f85066	00030000-565c-369f-1396-cfa107138ab4
00020000-565c-369f-d610-655b29f85066	00030000-565c-369f-b016-26474d66780b
00020000-565c-369f-d610-655b29f85066	00030000-565c-369f-4f16-f3dcadaaea8c
00020000-565c-369f-d610-655b29f85066	00030000-565c-369f-59a3-eb43d31ac3f3
00020000-565c-369f-ea68-2eb53947df53	00030000-565c-369f-0a09-7ce3be3e28f8
00020000-565c-369f-ea68-2eb53947df53	00030000-565c-369f-0f04-1566a8691e7e
00020000-565c-369f-ea68-2eb53947df53	00030000-565c-369f-1972-12d8e4c4a8be
00020000-565c-369f-ea68-2eb53947df53	00030000-565c-369f-ab8d-48eac14d9c52
00020000-565c-369f-ea68-2eb53947df53	00030000-565c-369f-5142-5f35a761aaa8
00020000-565c-369f-ea68-2eb53947df53	00030000-565c-369f-b07f-01a580e7915a
00020000-565c-369f-ea68-2eb53947df53	00030000-565c-369f-99bf-1e39650dfe33
00020000-565c-369f-ea68-2eb53947df53	00030000-565c-369f-1396-cfa107138ab4
00020000-565c-369f-ea68-2eb53947df53	00030000-565c-369f-b016-26474d66780b
00020000-565c-369f-ea68-2eb53947df53	00030000-565c-369f-4f16-f3dcadaaea8c
00020000-565c-369f-ea68-2eb53947df53	00030000-565c-369f-59a3-eb43d31ac3f3
00020000-565c-369f-c881-f000025ebeb0	00030000-565c-369f-99bf-1e39650dfe33
00020000-565c-369f-c881-f000025ebeb0	00030000-565c-369f-4f16-f3dcadaaea8c
00020000-565c-369f-c881-f000025ebeb0	00030000-565c-369f-0f04-1566a8691e7e
00020000-565c-369f-c881-f000025ebeb0	00030000-565c-369f-ab8d-48eac14d9c52
00020000-565c-369f-c881-f000025ebeb0	00030000-565c-369f-b07f-01a580e7915a
00020000-565c-369f-c881-f000025ebeb0	00030000-565c-369f-1396-cfa107138ab4
00020000-565c-369f-c881-f000025ebeb0	00030000-565c-369f-1972-12d8e4c4a8be
00020000-565c-369f-2c38-6a3c8b5ab642	00030000-565c-369f-99bf-1e39650dfe33
00020000-565c-369f-2c38-6a3c8b5ab642	00030000-565c-369f-de88-5b046fe51110
00020000-565c-369f-2c38-6a3c8b5ab642	00030000-565c-369f-4f16-f3dcadaaea8c
00020000-565c-369f-2c38-6a3c8b5ab642	00030000-565c-369f-5142-5f35a761aaa8
00020000-565c-369f-11de-e940b319eae8	00030000-565c-369f-99bf-1e39650dfe33
00020000-565c-369f-11de-e940b319eae8	00030000-565c-369f-4f16-f3dcadaaea8c
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-cc2a-8f802ae89066
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-b8fa-087e5188c492
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-299f-a028a30327ed
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-d9f0-cde05ded0e82
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-0a09-7ce3be3e28f8
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-b7f9-46e98aca2842
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-8e9a-40b87eb28670
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-0c3c-e66265bda4e5
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-50ee-3c5b22c1af6e
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-49be-b4cd1e8bfbbc
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-ea06-c68e6747e3ef
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-9ab6-18c9b1576b0e
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-c8d8-53b45b016a31
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-0f3f-a119c11a1179
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-2d9a-9eac853348c7
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-6109-baf17b39808d
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-8f68-9922e4a9f3e1
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-9342-bb8db84c32b2
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-6631-ce61f01958a5
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-ab56-e96a207ffe2a
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-96a5-06af66327d4a
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-2ee3-3ed24d2106f8
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-47d4-4eee52fb4dbc
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-acaf-40786993a3f3
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-f958-cb7ab57470cd
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-f4b6-197c75d27a86
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-593b-82d0e237324b
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-b1f9-eabed01703c3
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-4f52-218fd1ad8356
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-0f04-1566a8691e7e
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-cad7-ed3fb0dd5024
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-e6aa-051828b086ce
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-ad76-7a971c99205a
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-f8fd-72bf5a79e201
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-68b7-2569f7ec4d5a
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-e2a7-4709ee54a8a6
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-be06-b24946b41514
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-234f-bedb8028d1e7
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-3650-d0f2226a52b2
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-a048-5c3b2ad913e0
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-889c-07d61a38bc0a
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-4ce7-4048f851b79a
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-f806-347e6c5f9809
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-b8c3-d0f61055b83f
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-2633-e47e93e9425c
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-e97b-48b3e18bd878
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-aaf8-9232f1d32b15
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-a37f-e49057f74df2
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-8c68-e3ddb726d981
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-bbb0-61b0510ab46c
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-fb1f-e326ca0bbde5
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-e5c0-781e8d5d521c
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-7cb4-de2877f4d2a6
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-c763-d070c14b11b6
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-1972-12d8e4c4a8be
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-9b17-bf39d1412216
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-a1d0-a3fbee62f033
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-d330-6669afa152e5
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-a815-2d695de4091c
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-78c8-bcdda0d64c4b
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-242b-2444ac1cd321
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-ab8d-48eac14d9c52
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-f44d-1858825f707f
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-5142-5f35a761aaa8
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-2f86-04870d1fd82f
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-487a-f840b3c22d54
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-a367-6df3f4b571de
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-a1f7-654e1dddb95b
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-4cd0-7da4bd1b7aae
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-c258-2faaf584a296
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-0303-b7681e75d1de
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-98e8-6c8270f7d7a1
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-9ae7-a5d54ffbaca9
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-0c3c-7a739926f9b9
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-bba3-aa28db295bb3
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-1263-fc3fd14c0267
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-a4ff-182f4308406e
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-decd-f7dc35e3fdba
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-a963-328c4d4db40b
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-9c3f-5ee10a7fd12c
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-a529-310fbe0cb67f
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-b07f-01a580e7915a
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-fe1f-a421ecda6840
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-d298-35e723fef2b5
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-1277-24f307c1d5c9
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-6319-a0b215bcfeff
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-d1b7-7103730cf026
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-c0a6-5c3fff4fb3e0
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-8877-f60edc4e73a7
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-fe8d-a5a9f1a75d2d
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-2731-705e35fe9461
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-b424-f7a1876b152e
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-e6d8-0caf875c173d
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-73bc-d39405e4fdd2
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-12a6-111b2cc9aabb
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-83d4-8404ce312b8c
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-2900-78c86185cda2
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-0231-b90886cfd5f0
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-5c64-3e3c52b9dc25
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-86cd-2897931dd9cc
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-e95e-0cef300d7088
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-37c1-f6576405c167
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-4c6b-38a2615e7af0
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-10cc-aabc0038761d
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-46ae-31e10cd12fb9
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-1fcc-62bd4c30a52d
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-1c55-264625d85e51
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-6aed-5b8919abb35f
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-ed9a-4fbc9f97e1fb
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-557a-309a484da7e2
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-14e4-9f7f6e97126b
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-4f58-9d2768651ed6
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-c9e8-5779d6ce8c00
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-9585-e63ce7bcfb51
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-7b91-1e7a433429a9
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-14e3-6a638e4d6dac
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-bbdb-80bae1005d8f
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-1017-b5236b9d666a
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-7aed-49e701f04a55
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-581a-19970e5d7f9f
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-b06b-570f49340f9b
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-68e9-ba1710a40c97
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-5fc4-835749ec7dc7
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-bd20-d73798706f26
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-b136-36fa3b90282e
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-a4fd-8774212d49ef
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-819a-3b066c060ed1
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-a6fd-1d395401cb7a
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-bcd8-e0f741c4a0d7
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-83e9-ad7c251022a8
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-22a6-d7c482b68719
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-5bb8-bd8371c2a00e
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-bccc-3ca1df432dc5
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-99bf-1e39650dfe33
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-de88-5b046fe51110
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-f6c5-b92b60cd3e6b
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-b628-d402f9cf770b
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-fb02-7a6e718f67cb
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-0d70-f134de456b56
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-bd01-f55043708e5c
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-1396-cfa107138ab4
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-8b8c-6f842706c335
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-f233-d8281b7028e0
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-47b6-4ec506a33c17
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-2611-ba10123e7e1c
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-5e5e-87769f0699e8
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-bf74-1bee7c12cd45
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-9fd0-f4d376800066
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-b016-26474d66780b
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-44ec-6f7dc495e386
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-4f16-f3dcadaaea8c
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-31c0-6f9080e4ca43
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-aa2e-b95efb52548e
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-abd0-969486c47090
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-e777-7395771a631b
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-1c03-6c6068845157
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-3925-c15101672906
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-0bdb-5e575fbb4fde
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-244a-cb6641623ecb
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-18c4-af023d6b4f65
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-a95b-feb8203daae8
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-e561-46a3c9f54892
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-d83c-32005d9a2de7
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-5de5-e758d7ec2d3a
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-59a3-eb43d31ac3f3
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-cb05-f2f4608e0bea
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-2aa8-17b6f81ff22c
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-2683-a87ab12ab6dd
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-eeb2-2b3cb27cee04
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-2a60-5e61b04fa28c
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-daad-4b1eaa2b4f9d
00020000-565c-36a1-bcf1-60df864bf5df	00030000-565c-369f-6e25-9a767c10bbd5
00020000-565c-36a1-c98a-d912cda46e6f	00030000-565c-369f-d83c-32005d9a2de7
00020000-565c-36a1-63ac-07ed9fa6b20a	00030000-565c-369f-5de5-e758d7ec2d3a
00020000-565c-36a1-8e2d-f3436173c8bb	00030000-565c-369f-31c0-6f9080e4ca43
00020000-565c-36a1-d0c3-9cc7e7ae3b65	00030000-565c-369f-4f16-f3dcadaaea8c
00020000-565c-36a1-5abc-2ee4e47117e4	00030000-565c-369f-4ce7-4048f851b79a
00020000-565c-36a1-9470-818259ce101e	00030000-565c-369f-f806-347e6c5f9809
00020000-565c-36a1-78b7-458d5437c7cf	00030000-565c-369f-b8c3-d0f61055b83f
00020000-565c-36a1-5420-eb4bf48d9dac	00030000-565c-369f-889c-07d61a38bc0a
00020000-565c-36a1-b3f8-5d53d8f1651a	00030000-565c-369f-2633-e47e93e9425c
00020000-565c-36a1-4abf-5188b743ff36	00030000-565c-369f-e97b-48b3e18bd878
00020000-565c-36a1-f58e-735a53bf3e3e	00030000-565c-369f-a95b-feb8203daae8
00020000-565c-36a1-aca8-257e3d8e37cc	00030000-565c-369f-e561-46a3c9f54892
00020000-565c-36a1-3c82-c8daf4fbca88	00030000-565c-369f-a1d0-a3fbee62f033
00020000-565c-36a1-8312-c16895565672	00030000-565c-369f-1972-12d8e4c4a8be
00020000-565c-36a1-761d-2e00eca7a093	00030000-565c-369f-6109-baf17b39808d
00020000-565c-36a1-91fa-cba230e6065e	00030000-565c-369f-2d9a-9eac853348c7
00020000-565c-36a1-b371-5ca02462f2ca	00030000-565c-369f-5142-5f35a761aaa8
00020000-565c-36a1-b371-5ca02462f2ca	00030000-565c-369f-2f86-04870d1fd82f
00020000-565c-36a1-b371-5ca02462f2ca	00030000-565c-369f-4f16-f3dcadaaea8c
\.


--
-- TOC entry 3141 (class 0 OID 30124930)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 30124964)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 30125101)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-565c-36a1-b7e4-e8e5fd620617	00090000-565c-36a1-d74c-c27b605be904	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-565c-36a1-c930-c62c23cc5dc2	00090000-565c-36a1-f803-f71ab525f440	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-565c-36a1-68be-ab7bd0637bde	00090000-565c-36a1-7327-eb75fc5da5f5	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-565c-36a1-0fbb-6fc5b5b072ac	00090000-565c-36a1-7fdf-0e103283a962	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3112 (class 0 OID 30124622)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-565c-36a1-ec87-482348da97f3	\N	00040000-565c-369f-8e67-fee7475c864f	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-36a1-7bce-0597103ca733	\N	00040000-565c-369f-8e67-fee7475c864f	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-565c-36a1-d777-d0b094e84a19	\N	00040000-565c-369f-8e67-fee7475c864f	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-36a1-f0f1-976832c2a8a2	\N	00040000-565c-369f-8e67-fee7475c864f	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-36a1-d5c2-7cc2b3575c77	\N	00040000-565c-369f-8e67-fee7475c864f	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-36a1-b37e-2364985fd219	\N	00040000-565c-369e-b411-83049d04f44c	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-36a1-84ab-656595e98334	\N	00040000-565c-369e-dd84-45baccf4ee30	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-36a1-3b5b-331bc77b1f5e	\N	00040000-565c-369e-500a-e08ae14ec691	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-36a1-2f81-4bcec14d6b38	\N	00040000-565c-369e-3813-9ebd6a9b5a47	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-36a3-9662-982ecbb58a8a	\N	00040000-565c-369f-8e67-fee7475c864f	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3115 (class 0 OID 30124667)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-565c-369e-6404-e7fdd09f57e0	8341	Adlešiči
00050000-565c-369e-a675-7a65635ba77d	5270	Ajdovščina
00050000-565c-369e-e775-29c36a6398c6	6280	Ankaran/Ancarano
00050000-565c-369e-6233-bbafdf6abc1c	9253	Apače
00050000-565c-369e-0aed-bd999e2d61a2	8253	Artiče
00050000-565c-369e-b49b-a41e8e893ca6	4275	Begunje na Gorenjskem
00050000-565c-369e-1bda-41d0f3caf95c	1382	Begunje pri Cerknici
00050000-565c-369e-aadb-637263d38266	9231	Beltinci
00050000-565c-369e-2b5f-f1a345335b55	2234	Benedikt
00050000-565c-369e-e01c-0600291df4ff	2345	Bistrica ob Dravi
00050000-565c-369e-a6a6-a2ae39510051	3256	Bistrica ob Sotli
00050000-565c-369e-6020-bf6e1fbfe7f4	8259	Bizeljsko
00050000-565c-369e-c595-3198204e1cb4	1223	Blagovica
00050000-565c-369e-3a7c-d0336866bb9c	8283	Blanca
00050000-565c-369e-d4e3-91251c63f488	4260	Bled
00050000-565c-369e-0c4b-8727eed24f5a	4273	Blejska Dobrava
00050000-565c-369e-4439-48d114544d0a	9265	Bodonci
00050000-565c-369e-b052-d2dff08ad50c	9222	Bogojina
00050000-565c-369e-98eb-06a9056f71d0	4263	Bohinjska Bela
00050000-565c-369e-09a1-a3dcaec9e735	4264	Bohinjska Bistrica
00050000-565c-369e-d511-53d2c6ddc93a	4265	Bohinjsko jezero
00050000-565c-369e-f9f5-1f9e874a1b84	1353	Borovnica
00050000-565c-369e-4b00-13f9dc6ec245	8294	Boštanj
00050000-565c-369e-6810-93e08be0aba8	5230	Bovec
00050000-565c-369e-4039-5277012e3d0f	5295	Branik
00050000-565c-369e-634c-5b8705c23d13	3314	Braslovče
00050000-565c-369e-db66-5d042dfacfa1	5223	Breginj
00050000-565c-369e-b85b-1a980603ff13	8280	Brestanica
00050000-565c-369e-d5dd-ed0af3ebffed	2354	Bresternica
00050000-565c-369e-2d4d-872162fb5c91	4243	Brezje
00050000-565c-369e-6ba0-52a4a71d4b60	1351	Brezovica pri Ljubljani
00050000-565c-369e-8b34-d0eb6b2de1f9	8250	Brežice
00050000-565c-369e-edb3-1f73b592afcd	4210	Brnik - Aerodrom
00050000-565c-369e-c826-8960d994cab4	8321	Brusnice
00050000-565c-369e-35d8-30f6a99cb7f2	3255	Buče
00050000-565c-369e-cb62-a71ef2efb911	8276	Bučka 
00050000-565c-369e-4ad2-894d18099b2c	9261	Cankova
00050000-565c-369e-f358-553f80af08af	3000	Celje 
00050000-565c-369e-d126-199a7baf330d	3001	Celje - poštni predali
00050000-565c-369e-ad67-b0787dcc7b2a	4207	Cerklje na Gorenjskem
00050000-565c-369e-53fb-1629272af614	8263	Cerklje ob Krki
00050000-565c-369e-f25a-00da5cfaa892	1380	Cerknica
00050000-565c-369e-afcf-dcc43140f242	5282	Cerkno
00050000-565c-369e-36d0-f71be6b9b6d3	2236	Cerkvenjak
00050000-565c-369e-748f-2c80d2058b76	2215	Ceršak
00050000-565c-369e-09c6-dd1f3992b7e7	2326	Cirkovce
00050000-565c-369e-3abf-76a1b88700cd	2282	Cirkulane
00050000-565c-369e-7323-9e9a9573953d	5273	Col
00050000-565c-369e-29fb-79b477d469f1	8251	Čatež ob Savi
00050000-565c-369e-07cd-2c247ab8381d	1413	Čemšenik
00050000-565c-369e-a18a-72cbadd54bd8	5253	Čepovan
00050000-565c-369e-0833-cd975bd82826	9232	Črenšovci
00050000-565c-369e-8ce7-06c524d437b4	2393	Črna na Koroškem
00050000-565c-369e-faac-4326dccd90b9	6275	Črni Kal
00050000-565c-369e-ed54-f5866419f1b8	5274	Črni Vrh nad Idrijo
00050000-565c-369e-7727-272dbab8f04b	5262	Črniče
00050000-565c-369e-1217-0d170b83b40f	8340	Črnomelj
00050000-565c-369e-629f-86ab65f00543	6271	Dekani
00050000-565c-369e-1a9d-95fef15c052e	5210	Deskle
00050000-565c-369e-64ec-377055d5fa4c	2253	Destrnik
00050000-565c-369e-f5e1-17c5fcf90383	6215	Divača
00050000-565c-369e-a00d-ada97f33212f	1233	Dob
00050000-565c-369e-9004-ad8c3af0034b	3224	Dobje pri Planini
00050000-565c-369e-3b88-92dd8650a99f	8257	Dobova
00050000-565c-369e-358e-d42c38435bd5	1423	Dobovec
00050000-565c-369e-b164-df7a00d2b817	5263	Dobravlje
00050000-565c-369e-a76a-5558b5090daa	3204	Dobrna
00050000-565c-369e-b94e-6cf0ddccdb69	8211	Dobrnič
00050000-565c-369e-a403-4e693d957dd8	1356	Dobrova
00050000-565c-369e-26fb-ef8587a5f4ef	9223	Dobrovnik/Dobronak 
00050000-565c-369e-4e1a-e43a76dee601	5212	Dobrovo v Brdih
00050000-565c-369e-e0c2-9976247bc4ca	1431	Dol pri Hrastniku
00050000-565c-369e-4dd1-474d2351d9a9	1262	Dol pri Ljubljani
00050000-565c-369e-8694-995e3d7184ad	1273	Dole pri Litiji
00050000-565c-369e-1137-147bfd0cf56f	1331	Dolenja vas
00050000-565c-369e-a33f-05a49bb97aeb	8350	Dolenjske Toplice
00050000-565c-369e-3445-cdba807381ff	1230	Domžale
00050000-565c-369e-3058-851682f51a33	2252	Dornava
00050000-565c-369e-b00e-b13ed26fd1f3	5294	Dornberk
00050000-565c-369e-9b24-ce1cba07a85b	1319	Draga
00050000-565c-369e-a433-a5c7336cd219	8343	Dragatuš
00050000-565c-369e-871f-de131df2185b	3222	Dramlje
00050000-565c-369e-ca3e-ffba698f3f49	2370	Dravograd
00050000-565c-369e-6850-f485ac02b4a6	4203	Duplje
00050000-565c-369e-4aa9-d0d8edee985f	6221	Dutovlje
00050000-565c-369e-b9a1-0802dc354d39	8361	Dvor
00050000-565c-369e-878f-dbdcde710755	2343	Fala
00050000-565c-369e-e4a8-2ca113387bc8	9208	Fokovci
00050000-565c-369e-7389-a0122628e3f1	2313	Fram
00050000-565c-369e-a48a-e037fa5e4276	3213	Frankolovo
00050000-565c-369e-8f11-2adae395fe0d	1274	Gabrovka
00050000-565c-369e-d157-f8a5e83c01c2	8254	Globoko
00050000-565c-369e-dbff-aedb5336d768	5275	Godovič
00050000-565c-369e-4e37-5fc09968d9bb	4204	Golnik
00050000-565c-369e-4cf9-63825f18e2ad	3303	Gomilsko
00050000-565c-369e-d6b1-d1fedc2366cf	4224	Gorenja vas
00050000-565c-369e-be33-bda0efedd7b5	3263	Gorica pri Slivnici
00050000-565c-369e-e5b2-e50438161f6b	2272	Gorišnica
00050000-565c-369e-1b6f-3213f6b0b92d	9250	Gornja Radgona
00050000-565c-369e-c58d-a74e2724f8cc	3342	Gornji Grad
00050000-565c-369e-5b8a-5e01d3144deb	4282	Gozd Martuljek
00050000-565c-369e-b320-96a2eca52c5c	6272	Gračišče
00050000-565c-369e-0e0d-f6d404af9160	9264	Grad
00050000-565c-369e-d1b9-ad80134838eb	8332	Gradac
00050000-565c-369e-da1b-e7e5436b140e	1384	Grahovo
00050000-565c-369e-8f88-d45a0db7ab52	5242	Grahovo ob Bači
00050000-565c-369e-4580-53c3c3201759	5251	Grgar
00050000-565c-369e-442e-332cd1bf1c63	3302	Griže
00050000-565c-369e-ee5b-96c6d9dfda69	3231	Grobelno
00050000-565c-369e-da62-d56293bb39a8	1290	Grosuplje
00050000-565c-369e-20f6-f6de2490e8ad	2288	Hajdina
00050000-565c-369e-0e80-888c6d286ddd	8362	Hinje
00050000-565c-369e-9666-f74b8b3d19d8	2311	Hoče
00050000-565c-369e-5c53-82ff9d1694f9	9205	Hodoš/Hodos
00050000-565c-369e-c58f-4fa8b22e7ea2	1354	Horjul
00050000-565c-369e-3298-421ea5dca2aa	1372	Hotedršica
00050000-565c-369e-e0c2-443b854d92d6	1430	Hrastnik
00050000-565c-369e-55ff-7864a9202530	6225	Hruševje
00050000-565c-369e-e419-60a89087a5ea	4276	Hrušica
00050000-565c-369e-1b11-4bd67c592675	5280	Idrija
00050000-565c-369e-0fcf-abae609c3281	1292	Ig
00050000-565c-369e-559a-d91814d0e803	6250	Ilirska Bistrica
00050000-565c-369e-0dfa-ac2f455fe2f5	6251	Ilirska Bistrica-Trnovo
00050000-565c-369e-3f36-d33d0938cd4c	1295	Ivančna Gorica
00050000-565c-369e-5bc5-40f84ab4f8f1	2259	Ivanjkovci
00050000-565c-369e-e2e1-9057e471f453	1411	Izlake
00050000-565c-369e-e916-b358188d0646	6310	Izola/Isola
00050000-565c-369e-a104-d788fbf19e5c	2222	Jakobski Dol
00050000-565c-369e-f245-7766762aa64c	2221	Jarenina
00050000-565c-369e-04a9-457c5dcca423	6254	Jelšane
00050000-565c-369e-f10f-1c6d976767ff	4270	Jesenice
00050000-565c-369e-e7f6-f380b14c3586	8261	Jesenice na Dolenjskem
00050000-565c-369e-3209-d0b09815f101	3273	Jurklošter
00050000-565c-369e-0399-8ea793283a16	2223	Jurovski Dol
00050000-565c-369e-8fea-42df7cf41fa2	2256	Juršinci
00050000-565c-369e-7ddc-7b218cc72ac5	5214	Kal nad Kanalom
00050000-565c-369e-86ca-5ec273ea121b	3233	Kalobje
00050000-565c-369e-9a22-f1ccda1af69e	4246	Kamna Gorica
00050000-565c-369e-e995-70748ccd83b8	2351	Kamnica
00050000-565c-369e-4a70-b308ee105116	1241	Kamnik
00050000-565c-369e-e33c-46b9c85d72e9	5213	Kanal
00050000-565c-369e-76b0-cbb3fe5bfbe5	8258	Kapele
00050000-565c-369e-babd-2a7003a89780	2362	Kapla
00050000-565c-369e-b959-989a3ac89b73	2325	Kidričevo
00050000-565c-369e-e463-af507b935dba	1412	Kisovec
00050000-565c-369e-40d6-a03de32f9a70	6253	Knežak
00050000-565c-369e-1d2c-a2e5d2891824	5222	Kobarid
00050000-565c-369e-17de-051749c0a622	9227	Kobilje
00050000-565c-369e-133d-71e837807ad3	1330	Kočevje
00050000-565c-369e-907b-2285f0aa0eb5	1338	Kočevska Reka
00050000-565c-369e-47a3-68be6a08b2f2	2276	Kog
00050000-565c-369e-c941-f6781dcdc1bf	5211	Kojsko
00050000-565c-369e-802e-fc3f06c47a4f	6223	Komen
00050000-565c-369e-1afb-fd7dbe232303	1218	Komenda
00050000-565c-369e-871a-d33c3a56ed4d	6000	Koper/Capodistria 
00050000-565c-369e-84e1-b1aeadacd35c	6001	Koper/Capodistria - poštni predali
00050000-565c-369e-701d-4271becf6d80	8282	Koprivnica
00050000-565c-369e-f95f-04798ae174c4	5296	Kostanjevica na Krasu
00050000-565c-369e-e129-ea4fb17644d9	8311	Kostanjevica na Krki
00050000-565c-369e-95a2-8df07cdfb856	1336	Kostel
00050000-565c-369e-89aa-1803a6f23aac	6256	Košana
00050000-565c-369e-759b-e1b57cc99011	2394	Kotlje
00050000-565c-369e-3887-5530fa56a0d4	6240	Kozina
00050000-565c-369e-25e1-f5c3f3352805	3260	Kozje
00050000-565c-369e-0cbc-a88ef24a2261	4000	Kranj 
00050000-565c-369e-2df4-78bd023bf764	4001	Kranj - poštni predali
00050000-565c-369e-51af-e68fc3198d43	4280	Kranjska Gora
00050000-565c-369e-18c5-4c1fec800688	1281	Kresnice
00050000-565c-369e-cc2f-d960b792c65b	4294	Križe
00050000-565c-369e-d289-eb3bf702e304	9206	Križevci
00050000-565c-369e-e262-00e20cc5411e	9242	Križevci pri Ljutomeru
00050000-565c-369e-2632-497a8b503b81	1301	Krka
00050000-565c-369e-0ae7-9e0376dde6fe	8296	Krmelj
00050000-565c-369e-16f7-a88ed2c24bfb	4245	Kropa
00050000-565c-369e-2b7d-c2d07552993c	8262	Krška vas
00050000-565c-369e-9dd8-e1e95199c612	8270	Krško
00050000-565c-369e-cde6-e96c2d7b2a0b	9263	Kuzma
00050000-565c-369e-83aa-94dafcafdfdb	2318	Laporje
00050000-565c-369e-348f-f76303e237f1	3270	Laško
00050000-565c-369e-dfcd-13f7a9d0f1bf	1219	Laze v Tuhinju
00050000-565c-369e-bae8-a98a01871f27	2230	Lenart v Slovenskih goricah
00050000-565c-369e-9d6c-d78a758e1954	9220	Lendava/Lendva
00050000-565c-369e-92cf-056fb54afb19	4248	Lesce
00050000-565c-369e-1159-06a3028e32bd	3261	Lesično
00050000-565c-369e-0f4f-2093736f4d0e	8273	Leskovec pri Krškem
00050000-565c-369e-4a1f-434e53401010	2372	Libeliče
00050000-565c-369e-cb6c-fd1cd811cdd3	2341	Limbuš
00050000-565c-369e-349d-a8764c98c410	1270	Litija
00050000-565c-369e-78da-e557e5b4a71f	3202	Ljubečna
00050000-565c-369e-9010-eed2a9ffb663	1000	Ljubljana 
00050000-565c-369e-a0c4-ff495de416fa	1001	Ljubljana - poštni predali
00050000-565c-369e-7cf2-984648ded855	1231	Ljubljana - Črnuče
00050000-565c-369e-7775-9b653b4ec548	1261	Ljubljana - Dobrunje
00050000-565c-369e-382a-9274f6fad52e	1260	Ljubljana - Polje
00050000-565c-369e-0037-e6a502ce5c59	1210	Ljubljana - Šentvid
00050000-565c-369e-7e14-1d592bb77048	1211	Ljubljana - Šmartno
00050000-565c-369e-f87c-ec69b36a6d52	3333	Ljubno ob Savinji
00050000-565c-369e-5a3a-cd82a5f8999c	9240	Ljutomer
00050000-565c-369e-5e70-240679a1bdbb	3215	Loče
00050000-565c-369e-3b59-786b8105abb7	5231	Log pod Mangartom
00050000-565c-369e-9c80-eda8f0266c09	1358	Log pri Brezovici
00050000-565c-369e-c71e-467e1f598fb2	1370	Logatec
00050000-565c-369e-7c64-775751681c6b	1371	Logatec
00050000-565c-369e-3faf-13298007ec5c	1434	Loka pri Zidanem Mostu
00050000-565c-369e-e5d9-35e75071e24f	3223	Loka pri Žusmu
00050000-565c-369e-cdae-207a29acaf0c	6219	Lokev
00050000-565c-369e-f584-c136c15fa527	1318	Loški Potok
00050000-565c-369e-5243-7aefdaf5f7be	2324	Lovrenc na Dravskem polju
00050000-565c-369e-8921-b3af9a7392bb	2344	Lovrenc na Pohorju
00050000-565c-369e-58ed-bdc8f9e23844	3334	Luče
00050000-565c-369e-aff2-55f566d06860	1225	Lukovica
00050000-565c-369e-fc30-175f141b7714	9202	Mačkovci
00050000-565c-369e-b3f5-8681faaf4d7c	2322	Majšperk
00050000-565c-369e-dd7b-7f549bbbc4c9	2321	Makole
00050000-565c-369e-c45a-1b65dde03b1d	9243	Mala Nedelja
00050000-565c-369e-7410-abab3f8d33a8	2229	Malečnik
00050000-565c-369e-8df8-f5a569726777	6273	Marezige
00050000-565c-369e-c588-b90396fbb62c	2000	Maribor 
00050000-565c-369e-1e1a-12a7170d8ad7	2001	Maribor - poštni predali
00050000-565c-369e-0e88-c19a6aae5aff	2206	Marjeta na Dravskem polju
00050000-565c-369e-742a-8d1000e894e3	2281	Markovci
00050000-565c-369e-d83e-49cdb36aa9e4	9221	Martjanci
00050000-565c-369e-0a50-3a5653dbca47	6242	Materija
00050000-565c-369e-576a-1371c38a458f	4211	Mavčiče
00050000-565c-369e-157c-8abc591f8a6c	1215	Medvode
00050000-565c-369e-f4f6-27939a51f862	1234	Mengeš
00050000-565c-369e-ea4e-a4e6258c0128	8330	Metlika
00050000-565c-369e-5d2a-b29f2a3ecd8f	2392	Mežica
00050000-565c-369e-5aa0-cabb6b12b435	2204	Miklavž na Dravskem polju
00050000-565c-369e-89ad-7a0c8fc13e89	2275	Miklavž pri Ormožu
00050000-565c-369e-32f6-23e5d3beb354	5291	Miren
00050000-565c-369e-0195-5821893dd5e7	8233	Mirna
00050000-565c-369e-ab52-bea5b19c5210	8216	Mirna Peč
00050000-565c-369e-6f5c-01d9c2115e0a	2382	Mislinja
00050000-565c-369e-578c-43c36d7497a0	4281	Mojstrana
00050000-565c-369e-071d-38ea82f746b0	8230	Mokronog
00050000-565c-369e-dc37-a3d745dff286	1251	Moravče
00050000-565c-369e-f8b9-803d1ee8d53d	9226	Moravske Toplice
00050000-565c-369e-55c8-e224983a5c05	5216	Most na Soči
00050000-565c-369e-825c-fc6d43f1c80f	1221	Motnik
00050000-565c-369e-831b-d338e7570892	3330	Mozirje
00050000-565c-369e-d8af-84c7ba8c49b9	9000	Murska Sobota 
00050000-565c-369e-a8f3-68a489e9082f	9001	Murska Sobota - poštni predali
00050000-565c-369e-4d9f-035fc78a738c	2366	Muta
00050000-565c-369e-0a39-ec44abc03bf3	4202	Naklo
00050000-565c-369e-0f82-cd85611c9561	3331	Nazarje
00050000-565c-369e-9461-53470f0ebb13	1357	Notranje Gorice
00050000-565c-369e-488b-ce4b0a979663	3203	Nova Cerkev
00050000-565c-369e-2a67-7b52ba8525ed	5000	Nova Gorica 
00050000-565c-369e-18de-28e3efae60bd	5001	Nova Gorica - poštni predali
00050000-565c-369e-448f-0393036f32a2	1385	Nova vas
00050000-565c-369e-4cb2-e9a5d181633c	8000	Novo mesto
00050000-565c-369e-b6f3-02ae93ffd33d	8001	Novo mesto - poštni predali
00050000-565c-369e-a238-277a323ec60a	6243	Obrov
00050000-565c-369e-ad03-25f83fb8fa20	9233	Odranci
00050000-565c-369e-f0a6-5c37463594c2	2317	Oplotnica
00050000-565c-369e-d41d-f2190834ad47	2312	Orehova vas
00050000-565c-369e-0c5d-a28ab0d21196	2270	Ormož
00050000-565c-369e-82f5-64be05e453d4	1316	Ortnek
00050000-565c-369e-28fb-e46be8adce67	1337	Osilnica
00050000-565c-369e-6365-5d9cd37c00f4	8222	Otočec
00050000-565c-369e-d3b0-e884a3db41fc	2361	Ožbalt
00050000-565c-369e-bbfd-cafca83aae08	2231	Pernica
00050000-565c-369e-087f-e2b5659540c1	2211	Pesnica pri Mariboru
00050000-565c-369e-e43f-1e64b41ab8dd	9203	Petrovci
00050000-565c-369e-a8ec-70e714b78dcf	3301	Petrovče
00050000-565c-369e-db4b-9aa437cd4f4f	6330	Piran/Pirano
00050000-565c-369e-19c0-2489c30d09af	8255	Pišece
00050000-565c-369e-157e-dbafe2044a4c	6257	Pivka
00050000-565c-369e-5908-fa2333c07ca6	6232	Planina
00050000-565c-369e-1746-e66588b26347	3225	Planina pri Sevnici
00050000-565c-369e-d1b4-934b4424a03e	6276	Pobegi
00050000-565c-369e-c7a6-9f9e4ed744a7	8312	Podbočje
00050000-565c-369e-2992-ffe9c7a93254	5243	Podbrdo
00050000-565c-369e-1854-ec09f436d6bb	3254	Podčetrtek
00050000-565c-369e-64c9-6339d777d62d	2273	Podgorci
00050000-565c-369e-917a-8b6d15b47c6f	6216	Podgorje
00050000-565c-369e-edaf-a45c460b5eeb	2381	Podgorje pri Slovenj Gradcu
00050000-565c-369e-fc95-7349f54c6d90	6244	Podgrad
00050000-565c-369e-2777-1e5c663208fb	1414	Podkum
00050000-565c-369e-827e-384912e1560a	2286	Podlehnik
00050000-565c-369e-f19b-2438bc1500cd	5272	Podnanos
00050000-565c-369e-e18e-bd5ddfc72a19	4244	Podnart
00050000-565c-369e-1023-4047e0dc18c0	3241	Podplat
00050000-565c-369e-23f7-2e6cd1268497	3257	Podsreda
00050000-565c-369e-7aa7-57405bc51893	2363	Podvelka
00050000-565c-369e-5950-638da155a49d	2208	Pohorje
00050000-565c-369e-1c1c-c242e87d4cb6	2257	Polenšak
00050000-565c-369e-98a6-69cc0d8ce51e	1355	Polhov Gradec
00050000-565c-369e-1a82-2b442fcf12e5	4223	Poljane nad Škofjo Loko
00050000-565c-369e-9a74-6154e12ad138	2319	Poljčane
00050000-565c-369e-dcdc-16b28d3fb543	1272	Polšnik
00050000-565c-369e-ad52-2b9bf03b2008	3313	Polzela
00050000-565c-369e-8a9f-9e872865e7c4	3232	Ponikva
00050000-565c-369e-86ee-b6be36bf2806	6320	Portorož/Portorose
00050000-565c-369e-22d9-2f70d8ea4ae0	6230	Postojna
00050000-565c-369e-36b1-1f3a470f830c	2331	Pragersko
00050000-565c-369e-6278-9b2ec9bc4ec5	3312	Prebold
00050000-565c-369e-7ea6-cde3d2441f95	4205	Preddvor
00050000-565c-369e-18b5-cb5cb4b6e5be	6255	Prem
00050000-565c-369e-d5bb-851560f90f1e	1352	Preserje
00050000-565c-369e-78cd-61a157ce1974	6258	Prestranek
00050000-565c-369e-6ad9-d94bceef0427	2391	Prevalje
00050000-565c-369e-9fd9-96747710b32c	3262	Prevorje
00050000-565c-369e-57c4-963fcf1135c4	1276	Primskovo 
00050000-565c-369e-0636-2a6c83fc74c1	3253	Pristava pri Mestinju
00050000-565c-369e-4565-9a47eded1dea	9207	Prosenjakovci/Partosfalva
00050000-565c-369e-9c8f-a6e33225063d	5297	Prvačina
00050000-565c-369e-bdd3-91ebb7b5784b	2250	Ptuj
00050000-565c-369e-0de8-716c2c695304	2323	Ptujska Gora
00050000-565c-369e-b683-075d51fa9add	9201	Puconci
00050000-565c-369e-a0c0-4efbbd8e3637	2327	Rače
00050000-565c-369e-4b6d-383fba4fb9d6	1433	Radeče
00050000-565c-369e-8114-95de7a50d50d	9252	Radenci
00050000-565c-369e-12b1-3caa340de000	2360	Radlje ob Dravi
00050000-565c-369e-e463-56d4a492fd3f	1235	Radomlje
00050000-565c-369e-4b1c-3ef6c0495a2b	4240	Radovljica
00050000-565c-369e-4fbf-a01da07a504c	8274	Raka
00050000-565c-369e-3cf5-9aa39503302e	1381	Rakek
00050000-565c-369e-19b9-7e281e8e1b7b	4283	Rateče - Planica
00050000-565c-369e-986f-b78277788558	2390	Ravne na Koroškem
00050000-565c-369e-2536-210997a1715d	9246	Razkrižje
00050000-565c-369e-a3b7-18e4452de5ea	3332	Rečica ob Savinji
00050000-565c-369e-cacb-7cd1b20a6249	5292	Renče
00050000-565c-369e-53e5-7880a079c7f1	1310	Ribnica
00050000-565c-369e-6501-7c58192aaf91	2364	Ribnica na Pohorju
00050000-565c-369e-e800-a6f9d99e808c	3272	Rimske Toplice
00050000-565c-369e-c312-a892da8d4b00	1314	Rob
00050000-565c-369e-5f88-52205f136194	5215	Ročinj
00050000-565c-369e-eaf8-5858b168c165	3250	Rogaška Slatina
00050000-565c-369e-5dba-bdbec628f2ca	9262	Rogašovci
00050000-565c-369e-51c5-6986350470ec	3252	Rogatec
00050000-565c-369e-d4ef-f02f5dd2fcc9	1373	Rovte
00050000-565c-369e-81da-cd197e14f1a7	2342	Ruše
00050000-565c-369e-c6a5-d810f8e0a310	1282	Sava
00050000-565c-369e-6f96-a9dc391331a2	6333	Sečovlje/Sicciole
00050000-565c-369e-c236-aa7b32973090	4227	Selca
00050000-565c-369e-27e5-bdac1c60c9d0	2352	Selnica ob Dravi
00050000-565c-369e-aec3-1750f409bacc	8333	Semič
00050000-565c-369e-bef5-dbbb2a60a1d2	8281	Senovo
00050000-565c-369e-e8ea-15b411a5bb08	6224	Senožeče
00050000-565c-369e-a638-9510b4ad9c37	8290	Sevnica
00050000-565c-369e-d155-786e78cc3597	6210	Sežana
00050000-565c-369e-82e9-4a1880256285	2214	Sladki Vrh
00050000-565c-369e-ca9b-5701a8260e65	5283	Slap ob Idrijci
00050000-565c-369e-ec9b-1afc8b8a96ed	2380	Slovenj Gradec
00050000-565c-369e-4606-3d5109b80c7f	2310	Slovenska Bistrica
00050000-565c-369e-e388-f7ec8df7c9b6	3210	Slovenske Konjice
00050000-565c-369e-364a-ca338c7f9293	1216	Smlednik
00050000-565c-369e-bc45-11dcc1c88054	5232	Soča
00050000-565c-369e-ef5b-c15d127be72b	1317	Sodražica
00050000-565c-369e-393f-4d371814891b	3335	Solčava
00050000-565c-369e-7823-8c9728fed791	5250	Solkan
00050000-565c-369e-2eae-84e92264107a	4229	Sorica
00050000-565c-369e-00cf-133f3a979cc6	4225	Sovodenj
00050000-565c-369e-5cd1-3173dbc41185	5281	Spodnja Idrija
00050000-565c-369e-67fc-2712536ff43e	2241	Spodnji Duplek
00050000-565c-369e-749d-ac8fac2d97a0	9245	Spodnji Ivanjci
00050000-565c-369e-d746-a8ffbc1d3731	2277	Središče ob Dravi
00050000-565c-369e-a2fe-c955339486b3	4267	Srednja vas v Bohinju
00050000-565c-369e-59b8-839488e0ca7a	8256	Sromlje 
00050000-565c-369e-b398-688f10e316b1	5224	Srpenica
00050000-565c-369e-6e7e-5e38d3473671	1242	Stahovica
00050000-565c-369e-cb23-49d7726fb8e4	1332	Stara Cerkev
00050000-565c-369e-b8ef-945ebae8cbe2	8342	Stari trg ob Kolpi
00050000-565c-369e-ec9b-eb61ba7bb0bc	1386	Stari trg pri Ložu
00050000-565c-369e-58d3-683c2b50f420	2205	Starše
00050000-565c-369e-a7ee-10bd36ddfc48	2289	Stoperce
00050000-565c-369e-968d-74e079e046a1	8322	Stopiče
00050000-565c-369e-4526-c95206bb70bf	3206	Stranice
00050000-565c-369e-fc42-88a8e3d2c416	8351	Straža
00050000-565c-369e-02fe-f58365af3de0	1313	Struge
00050000-565c-369e-2f44-08879e2f667c	8293	Studenec
00050000-565c-369e-e3a3-f6e75cb04691	8331	Suhor
00050000-565c-369e-cef3-9c0674e2e598	2233	Sv. Ana v Slovenskih goricah
00050000-565c-369e-07f1-f6a5b2bc2a16	2235	Sv. Trojica v Slovenskih goricah
00050000-565c-369e-6de2-f986ede28ee7	2353	Sveti Duh na Ostrem Vrhu
00050000-565c-369e-b849-7a22ac7c3be3	9244	Sveti Jurij ob Ščavnici
00050000-565c-369e-c91d-234e39b55c01	3264	Sveti Štefan
00050000-565c-369e-bc6f-c84b1cfeb0f6	2258	Sveti Tomaž
00050000-565c-369e-653b-f2466f182840	9204	Šalovci
00050000-565c-369e-be17-078b15b3ead6	5261	Šempas
00050000-565c-369e-959c-b5cb67a58ae3	5290	Šempeter pri Gorici
00050000-565c-369e-23d2-b80a87cb00a2	3311	Šempeter v Savinjski dolini
00050000-565c-369e-6a86-f66818a3eb11	4208	Šenčur
00050000-565c-369e-4d02-715582e94720	2212	Šentilj v Slovenskih goricah
00050000-565c-369e-175e-f5b5eeab9f45	8297	Šentjanž
00050000-565c-369e-da9c-01247a2d2090	2373	Šentjanž pri Dravogradu
00050000-565c-369e-c537-465a7050f6f2	8310	Šentjernej
00050000-565c-369e-55db-483eae708522	3230	Šentjur
00050000-565c-369e-fb8c-057ffa888354	3271	Šentrupert
00050000-565c-369e-aa0b-16e7d6737806	8232	Šentrupert
00050000-565c-369e-335d-36a956133998	1296	Šentvid pri Stični
00050000-565c-369e-2f44-ea115716448c	8275	Škocjan
00050000-565c-369e-8d83-a17577a3cfd6	6281	Škofije
00050000-565c-369e-90d0-ddcbb121504a	4220	Škofja Loka
00050000-565c-369e-de12-a1a7113f2df1	3211	Škofja vas
00050000-565c-369e-3578-68a1aea6e455	1291	Škofljica
00050000-565c-369e-c58b-333926ea8cab	6274	Šmarje
00050000-565c-369e-1592-511a8e6cec66	1293	Šmarje - Sap
00050000-565c-369e-4c73-764bc0fc6534	3240	Šmarje pri Jelšah
00050000-565c-369e-ebae-7e54bd0d6c17	8220	Šmarješke Toplice
00050000-565c-369e-b3cf-d46f0f036d56	2315	Šmartno na Pohorju
00050000-565c-369e-27ad-514ecf7a2bbf	3341	Šmartno ob Dreti
00050000-565c-369e-dc7e-3d6d83429335	3327	Šmartno ob Paki
00050000-565c-369e-2123-b18cee324d82	1275	Šmartno pri Litiji
00050000-565c-369e-be27-057f8644e2b6	2383	Šmartno pri Slovenj Gradcu
00050000-565c-369e-e319-5ded75d29768	3201	Šmartno v Rožni dolini
00050000-565c-369e-96a7-c091abf7b4d2	3325	Šoštanj
00050000-565c-369e-18f3-a1109dccfd6b	6222	Štanjel
00050000-565c-369e-1a83-8553c8a46f74	3220	Štore
00050000-565c-369e-cb4d-b660f19dcdcb	3304	Tabor
00050000-565c-369e-b300-09952591f911	3221	Teharje
00050000-565c-369e-2e9f-5d71a39736cb	9251	Tišina
00050000-565c-369e-698c-7c56519d09c3	5220	Tolmin
00050000-565c-369e-e87c-155325eaa386	3326	Topolšica
00050000-565c-369e-396d-ae1c62c5773a	2371	Trbonje
00050000-565c-369e-7733-76f1689cf197	1420	Trbovlje
00050000-565c-369e-f541-76a93d004bf5	8231	Trebelno 
00050000-565c-369e-9e29-a3639373cde1	8210	Trebnje
00050000-565c-369e-6a4f-3deaa5987fde	5252	Trnovo pri Gorici
00050000-565c-369e-004b-32cd7be71f06	2254	Trnovska vas
00050000-565c-369e-85a0-f1262ba21587	1222	Trojane
00050000-565c-369e-b4c3-da8c22e121cf	1236	Trzin
00050000-565c-369e-9f83-9f3d193b5fb2	4290	Tržič
00050000-565c-369e-6f4e-f1167ae7144e	8295	Tržišče
00050000-565c-369e-24ec-249bd14d0c2a	1311	Turjak
00050000-565c-369e-f273-98c26f3827d9	9224	Turnišče
00050000-565c-369e-b082-634db5c7b528	8323	Uršna sela
00050000-565c-369e-f20c-055244bc3297	1252	Vače
00050000-565c-369e-70ef-24449b9e15fe	3320	Velenje 
00050000-565c-369e-6bdb-c7f7e97c65c3	3322	Velenje - poštni predali
00050000-565c-369e-70f8-d2f36ebfa2b8	8212	Velika Loka
00050000-565c-369e-5e0e-03f29fc17d00	2274	Velika Nedelja
00050000-565c-369e-3f61-83608e54028c	9225	Velika Polana
00050000-565c-369e-5127-78c96f8a52b9	1315	Velike Lašče
00050000-565c-369e-8956-94dd47e59383	8213	Veliki Gaber
00050000-565c-369e-e6fa-8138a5fa0282	9241	Veržej
00050000-565c-369e-5ac2-c192a494e567	1312	Videm - Dobrepolje
00050000-565c-369e-33a1-dcb1b8195f1b	2284	Videm pri Ptuju
00050000-565c-369e-9ba3-ea410455ed5e	8344	Vinica
00050000-565c-369e-0c66-3a91ffdde5ad	5271	Vipava
00050000-565c-369e-11cf-72693bee98ea	4212	Visoko
00050000-565c-369e-95b9-34d418cefa77	1294	Višnja Gora
00050000-565c-369e-7261-6653138f91f7	3205	Vitanje
00050000-565c-369e-32c0-a98cf0e7ead5	2255	Vitomarci
00050000-565c-369e-eba8-6b014e1d3612	1217	Vodice
00050000-565c-369e-5ebe-e4f22b395919	3212	Vojnik\t
00050000-565c-369e-dc18-e8c7987a4820	5293	Volčja Draga
00050000-565c-369e-aa3f-7de8bf902c88	2232	Voličina
00050000-565c-369e-abae-8bce1af805a5	3305	Vransko
00050000-565c-369e-0160-e8f216211478	6217	Vremski Britof
00050000-565c-369e-a747-df7e403a19f0	1360	Vrhnika
00050000-565c-369e-8895-7eb7197d65cf	2365	Vuhred
00050000-565c-369e-8b3d-a7b43e7e0059	2367	Vuzenica
00050000-565c-369e-4840-3c3716a15eb0	8292	Zabukovje 
00050000-565c-369e-116e-ea81372a6d6d	1410	Zagorje ob Savi
00050000-565c-369e-8132-c56b4147e2bb	1303	Zagradec
00050000-565c-369e-e8e3-857b07646e9c	2283	Zavrč
00050000-565c-369e-ddc2-8b2f1e93a3db	8272	Zdole 
00050000-565c-369e-9ccf-4ac9d0eb08cf	4201	Zgornja Besnica
00050000-565c-369e-8638-30cb30425a0e	2242	Zgornja Korena
00050000-565c-369e-892d-22a5794e38ff	2201	Zgornja Kungota
00050000-565c-369e-de3b-3c6a6f9dd0c2	2316	Zgornja Ložnica
00050000-565c-369e-efc0-0c6e62a7aaec	2314	Zgornja Polskava
00050000-565c-369e-7d46-525e7fc119b8	2213	Zgornja Velka
00050000-565c-369e-509b-ad5c1a828f8f	4247	Zgornje Gorje
00050000-565c-369e-5c6a-3c87251b553d	4206	Zgornje Jezersko
00050000-565c-369e-7aa4-6c79f372d821	2285	Zgornji Leskovec
00050000-565c-369e-51d9-6f4f5a3424ee	1432	Zidani Most
00050000-565c-369e-a92f-c0ffb21fe23e	3214	Zreče
00050000-565c-369e-560e-bc0931a29bb1	4209	Žabnica
00050000-565c-369e-2be9-a30589bde96d	3310	Žalec
00050000-565c-369e-a959-7ba11237223c	4228	Železniki
00050000-565c-369e-92ee-b714328d4ebd	2287	Žetale
00050000-565c-369e-d0ba-c12883cf8b29	4226	Žiri
00050000-565c-369e-e926-4831c725b8c4	4274	Žirovnica
00050000-565c-369e-2102-7c31294b8260	8360	Žužemberk
\.


--
-- TOC entry 3164 (class 0 OID 30125329)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 30124904)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 30124652)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-565c-36a1-3929-da25cfa85703	00080000-565c-36a1-ec87-482348da97f3	\N	00040000-565c-369f-8e67-fee7475c864f	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-565c-36a1-b438-6c6ea800e60a	00080000-565c-36a1-ec87-482348da97f3	\N	00040000-565c-369f-8e67-fee7475c864f	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-565c-36a1-2f5a-4891fde94246	00080000-565c-36a1-7bce-0597103ca733	\N	00040000-565c-369f-8e67-fee7475c864f	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3126 (class 0 OID 30124796)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-565c-369f-7fcc-f28e56c1a6c3	novo leto	1	1	\N	t
00430000-565c-369f-bc4b-fb69826b52bc	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-565c-369f-c23e-7d494359e95e	dan upora proti okupatorju	27	4	\N	t
00430000-565c-369f-f3b9-016b801eb89f	praznik dela	1	5	\N	t
00430000-565c-369f-e269-87c81c8d9cd0	praznik dela	2	5	\N	t
00430000-565c-369f-480c-24b20d66c801	dan Primoža Trubarja	8	6	\N	f
00430000-565c-369f-97d8-fd8fe02d90f3	dan državnosti	25	6	\N	t
00430000-565c-369f-c2c4-720521ddd396	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-565c-369f-3d9c-b3ef32d1507e	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-565c-369f-0755-fbda09298dbc	dan suverenosti	25	10	\N	f
00430000-565c-369f-c680-5c9df87fb707	dan spomina na mrtve	1	11	\N	t
00430000-565c-369f-d3d3-11d3086e88d1	dan Rudolfa Maistra	23	11	\N	f
00430000-565c-369f-c1d5-ad893c3854f4	božič	25	12	\N	t
00430000-565c-369f-f586-bd98f4529058	dan samostojnosti in enotnosti	26	12	\N	t
00430000-565c-369f-98e5-e327c961774b	Marijino vnebovzetje	15	8	\N	t
00430000-565c-369f-7736-df115fe46072	dan reformacije	31	10	\N	t
00430000-565c-369f-cb11-5d1e33a61b4d	velikonočna nedelja	27	3	2016	t
00430000-565c-369f-0e69-3d7b6080c3e3	velikonočna nedelja	16	4	2017	t
00430000-565c-369f-4ce8-1e8a9a9b411e	velikonočna nedelja	1	4	2018	t
00430000-565c-369f-1797-e42c725b1a48	velikonočna nedelja	21	4	2019	t
00430000-565c-369f-94c7-6a505c333b7d	velikonočna nedelja	12	4	2020	t
00430000-565c-369f-b322-eb1914020fa5	velikonočna nedelja	4	4	2021	t
00430000-565c-369f-2f48-d594808e11b7	velikonočna nedelja	17	4	2022	t
00430000-565c-369f-0b10-1fdf569b6999	velikonočna nedelja	9	4	2023	t
00430000-565c-369f-7061-67a36cd56588	velikonočna nedelja	31	3	2024	t
00430000-565c-369f-24d0-f16b10e5d151	velikonočna nedelja	20	4	2025	t
00430000-565c-369f-1473-ba2a298d58a7	velikonočna nedelja	5	4	2026	t
00430000-565c-369f-1f96-a785c9f02c10	velikonočna nedelja	28	3	2027	t
00430000-565c-369f-58e8-d953d598d959	velikonočna nedelja	16	4	2028	t
00430000-565c-369f-3561-00006430c08f	velikonočna nedelja	1	4	2029	t
00430000-565c-369f-79e2-5494c48a188f	velikonočna nedelja	21	4	2030	t
00430000-565c-369f-9b7c-77ba96158df0	velikonočni ponedeljek	28	3	2016	t
00430000-565c-369f-4ec1-a469849a160e	velikonočni ponedeljek	17	4	2017	t
00430000-565c-369f-aa61-034da5d51df4	velikonočni ponedeljek	2	4	2018	t
00430000-565c-369f-dc11-a78acfb411ee	velikonočni ponedeljek	22	4	2019	t
00430000-565c-369f-3611-2890c69f75cd	velikonočni ponedeljek	13	4	2020	t
00430000-565c-369f-3930-788712154fbe	velikonočni ponedeljek	5	4	2021	t
00430000-565c-369f-cdc7-7f8fce33070f	velikonočni ponedeljek	18	4	2022	t
00430000-565c-369f-ca15-80175baee2ab	velikonočni ponedeljek	10	4	2023	t
00430000-565c-369f-5fe1-469ccf797291	velikonočni ponedeljek	1	4	2024	t
00430000-565c-369f-b7f1-9ffc1be943a3	velikonočni ponedeljek	21	4	2025	t
00430000-565c-369f-6ee9-2c765cce79d0	velikonočni ponedeljek	6	4	2026	t
00430000-565c-369f-77ea-1fff1d75c2a5	velikonočni ponedeljek	29	3	2027	t
00430000-565c-369f-37db-349efabd987f	velikonočni ponedeljek	17	4	2028	t
00430000-565c-369f-fe3a-905891274bc4	velikonočni ponedeljek	2	4	2029	t
00430000-565c-369f-1853-92a4222444c7	velikonočni ponedeljek	22	4	2030	t
00430000-565c-369f-b87a-220e962cd034	binkoštna nedelja - binkošti	15	5	2016	t
00430000-565c-369f-4e01-6851b4987ef7	binkoštna nedelja - binkošti	4	6	2017	t
00430000-565c-369f-16aa-3a7084819864	binkoštna nedelja - binkošti	20	5	2018	t
00430000-565c-369f-6bb5-32ce8be2a300	binkoštna nedelja - binkošti	9	6	2019	t
00430000-565c-369f-48a5-cff5d49902ec	binkoštna nedelja - binkošti	31	5	2020	t
00430000-565c-369f-baef-4296fcd0321f	binkoštna nedelja - binkošti	23	5	2021	t
00430000-565c-369f-8969-3f6a6c57608a	binkoštna nedelja - binkošti	5	6	2022	t
00430000-565c-369f-6a77-ce076b3a6d48	binkoštna nedelja - binkošti	28	5	2023	t
00430000-565c-369f-8ce4-7a8ee6a44d51	binkoštna nedelja - binkošti	19	5	2024	t
00430000-565c-369f-595a-380db407dc64	binkoštna nedelja - binkošti	8	6	2025	t
00430000-565c-369f-ad3a-b89702cd2eea	binkoštna nedelja - binkošti	24	5	2026	t
00430000-565c-369f-c42d-9a6572fbd43b	binkoštna nedelja - binkošti	16	5	2027	t
00430000-565c-369f-76d6-66cc2bd6a1c5	binkoštna nedelja - binkošti	4	6	2028	t
00430000-565c-369f-f4a0-4979cb08cda9	binkoštna nedelja - binkošti	20	5	2029	t
00430000-565c-369f-612e-319913d0b0f0	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3122 (class 0 OID 30124756)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 30124768)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 30124916)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 30125343)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 30125353)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-565c-36a1-21c4-c6c5904ed5e7	00080000-565c-36a1-d777-d0b094e84a19	0987	AK
00190000-565c-36a1-f066-bf7a44f38a98	00080000-565c-36a1-7bce-0597103ca733	0989	AK
00190000-565c-36a1-e883-ce3d4c941be2	00080000-565c-36a1-f0f1-976832c2a8a2	0986	AK
00190000-565c-36a1-e9d8-afc182b1a01f	00080000-565c-36a1-b37e-2364985fd219	0984	AK
00190000-565c-36a1-24c8-58d347731f71	00080000-565c-36a1-84ab-656595e98334	0983	AK
00190000-565c-36a1-cd36-cabe61dc64e9	00080000-565c-36a1-3b5b-331bc77b1f5e	0982	AK
00190000-565c-36a3-17e2-fcc3e01b710f	00080000-565c-36a3-9662-982ecbb58a8a	1001	AK
\.


--
-- TOC entry 3163 (class 0 OID 30125252)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-565c-36a1-d9fe-577f6b51e2b0	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3167 (class 0 OID 30125361)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 30124945)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-565c-36a0-e175-3f53bf79b3f7	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-565c-36a0-13d0-a1ca7c982a6f	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-565c-36a0-a52c-66b60eec81d5	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-565c-36a0-2e4a-e0b5e21c6897	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-565c-36a0-25ad-58fcda841347	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-565c-36a0-8cc6-2ce648f2c77c	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-565c-36a0-cc69-a1fbff36b387	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3135 (class 0 OID 30124889)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 30124879)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 30125090)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 30125020)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 30124730)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 30124492)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-565c-36a3-9662-982ecbb58a8a	00010000-565c-369f-66fc-d3a372a2a92e	2015-11-30 12:44:35	INS	a:0:{}
2	App\\Entity\\Option	00000000-565c-36a3-161f-6b8585f9bd99	00010000-565c-369f-66fc-d3a372a2a92e	2015-11-30 12:44:35	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-565c-36a3-17e2-fcc3e01b710f	00010000-565c-369f-66fc-d3a372a2a92e	2015-11-30 12:44:35	INS	a:0:{}
\.


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3144 (class 0 OID 30124958)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 30124530)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-565c-369f-302b-2d099312663a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-565c-369f-ff88-7fcb1364468e	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-565c-369f-264e-e0dbe1eb2b38	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-565c-369f-a812-41884362baf9	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-565c-369f-0e9c-b0a82a20ac70	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-565c-369f-4e50-dd310cd65970	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-565c-369f-31a7-98d9a0097c1f	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-565c-369f-e44d-d62fb904cb65	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-565c-369f-90e2-0840c51684dc	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-565c-369f-2375-b59945c39792	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-565c-369f-da85-b7df2c21d7cc	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-565c-369f-0ed3-8d148188c550	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-565c-369f-3bdf-2713714542ca	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-565c-369f-524a-78dddc65ddc2	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-565c-369f-0c8d-4d05dc0fd7cd	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-565c-369f-cbf8-82f8f4d228d9	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-565c-369f-d6bb-4ddd8572606a	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-565c-369f-f7ca-cbafa0c32f79	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-565c-369f-35b3-8b5c685a104d	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-565c-369f-59bf-72b142e336a3	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-565c-369f-8f61-7c8b590ffde7	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-565c-369f-b659-fb85e332c7ee	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-565c-369f-1084-726e774b8b27	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-565c-369f-c869-99ddcdd99e34	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-565c-369f-6521-2e680baab174	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-565c-369f-fea3-60e4e5768b6d	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-565c-369f-7c97-8b16d2fa2956	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-565c-369f-ec18-0c841ee19563	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-565c-369f-1b11-27d05196268c	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-565c-369f-9b27-917c7e5705f9	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-565c-369f-8c65-fa51dda30e7b	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-565c-369f-735e-b6db1559bc81	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-565c-369f-222d-c9dbae1c2bbe	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-565c-369f-471f-04015be25be6	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-565c-369f-d610-655b29f85066	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-565c-369f-ea68-2eb53947df53	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-565c-369f-c881-f000025ebeb0	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-565c-369f-2c38-6a3c8b5ab642	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-565c-369f-11de-e940b319eae8	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-565c-36a1-bcf1-60df864bf5df	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-565c-36a1-c98a-d912cda46e6f	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-565c-36a1-63ac-07ed9fa6b20a	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-565c-36a1-8e2d-f3436173c8bb	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-565c-36a1-d0c3-9cc7e7ae3b65	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-565c-36a1-5abc-2ee4e47117e4	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-565c-36a1-9470-818259ce101e	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-565c-36a1-78b7-458d5437c7cf	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-565c-36a1-5420-eb4bf48d9dac	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-565c-36a1-b3f8-5d53d8f1651a	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-565c-36a1-4abf-5188b743ff36	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-565c-36a1-f58e-735a53bf3e3e	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-565c-36a1-aca8-257e3d8e37cc	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-565c-36a1-3c82-c8daf4fbca88	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-565c-36a1-8312-c16895565672	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-565c-36a1-761d-2e00eca7a093	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-565c-36a1-91fa-cba230e6065e	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-565c-36a1-b371-5ca02462f2ca	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
\.


--
-- TOC entry 3101 (class 0 OID 30124514)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-565c-369f-7364-d699ca0ff118	00020000-565c-369f-264e-e0dbe1eb2b38
00010000-565c-369f-66fc-d3a372a2a92e	00020000-565c-369f-264e-e0dbe1eb2b38
00010000-565c-36a1-65fa-9491ae640e8d	00020000-565c-36a1-bcf1-60df864bf5df
00010000-565c-36a1-b7b6-93452b2434e5	00020000-565c-36a1-c98a-d912cda46e6f
00010000-565c-36a1-b7b6-93452b2434e5	00020000-565c-36a1-5abc-2ee4e47117e4
00010000-565c-36a1-b7b6-93452b2434e5	00020000-565c-36a1-b3f8-5d53d8f1651a
00010000-565c-36a1-b7b6-93452b2434e5	00020000-565c-36a1-f58e-735a53bf3e3e
00010000-565c-36a1-b7b6-93452b2434e5	00020000-565c-36a1-8312-c16895565672
00010000-565c-36a1-b7b6-93452b2434e5	00020000-565c-36a1-91fa-cba230e6065e
00010000-565c-36a1-b7b6-93452b2434e5	00020000-565c-36a1-8e2d-f3436173c8bb
00010000-565c-36a1-75ce-d48d1480912b	00020000-565c-36a1-c98a-d912cda46e6f
00010000-565c-36a1-75ce-d48d1480912b	00020000-565c-36a1-63ac-07ed9fa6b20a
00010000-565c-36a1-75ce-d48d1480912b	00020000-565c-36a1-8e2d-f3436173c8bb
00010000-565c-36a1-75ce-d48d1480912b	00020000-565c-36a1-d0c3-9cc7e7ae3b65
00010000-565c-36a1-6afc-910640e067d0	00020000-565c-36a1-c98a-d912cda46e6f
00010000-565c-36a1-6afc-910640e067d0	00020000-565c-36a1-63ac-07ed9fa6b20a
00010000-565c-36a1-6afc-910640e067d0	00020000-565c-36a1-8e2d-f3436173c8bb
00010000-565c-36a1-6afc-910640e067d0	00020000-565c-36a1-d0c3-9cc7e7ae3b65
00010000-565c-36a1-6afc-910640e067d0	00020000-565c-36a1-f58e-735a53bf3e3e
00010000-565c-36a1-3899-18bd08ce23d8	00020000-565c-36a1-63ac-07ed9fa6b20a
00010000-565c-36a1-3899-18bd08ce23d8	00020000-565c-36a1-9470-818259ce101e
00010000-565c-36a1-3899-18bd08ce23d8	00020000-565c-36a1-4abf-5188b743ff36
00010000-565c-36a1-3899-18bd08ce23d8	00020000-565c-36a1-aca8-257e3d8e37cc
00010000-565c-36a1-3899-18bd08ce23d8	00020000-565c-36a1-f58e-735a53bf3e3e
00010000-565c-36a1-3899-18bd08ce23d8	00020000-565c-36a1-761d-2e00eca7a093
00010000-565c-36a1-ea8a-a0b064f1b028	00020000-565c-36a1-63ac-07ed9fa6b20a
00010000-565c-36a1-ea8a-a0b064f1b028	00020000-565c-36a1-9470-818259ce101e
00010000-565c-36a1-ea8a-a0b064f1b028	00020000-565c-36a1-5420-eb4bf48d9dac
00010000-565c-36a1-ea8a-a0b064f1b028	00020000-565c-36a1-4abf-5188b743ff36
00010000-565c-36a1-ea8a-a0b064f1b028	00020000-565c-36a1-aca8-257e3d8e37cc
00010000-565c-36a1-ea8a-a0b064f1b028	00020000-565c-36a1-f58e-735a53bf3e3e
00010000-565c-36a1-ea8a-a0b064f1b028	00020000-565c-36a1-761d-2e00eca7a093
00010000-565c-36a1-8448-4bb2bc566353	00020000-565c-36a1-63ac-07ed9fa6b20a
00010000-565c-36a1-8448-4bb2bc566353	00020000-565c-36a1-8e2d-f3436173c8bb
00010000-565c-36a1-8448-4bb2bc566353	00020000-565c-36a1-9470-818259ce101e
00010000-565c-36a1-8448-4bb2bc566353	00020000-565c-36a1-78b7-458d5437c7cf
00010000-565c-36a1-8448-4bb2bc566353	00020000-565c-36a1-5420-eb4bf48d9dac
00010000-565c-36a1-8448-4bb2bc566353	00020000-565c-36a1-5abc-2ee4e47117e4
00010000-565c-36a1-8448-4bb2bc566353	00020000-565c-36a1-4abf-5188b743ff36
00010000-565c-36a1-8448-4bb2bc566353	00020000-565c-36a1-aca8-257e3d8e37cc
00010000-565c-36a1-8448-4bb2bc566353	00020000-565c-36a1-f58e-735a53bf3e3e
00010000-565c-36a1-8448-4bb2bc566353	00020000-565c-36a1-761d-2e00eca7a093
00010000-565c-36a1-aa2a-1de8dd8fe8a3	00020000-565c-36a1-c98a-d912cda46e6f
00010000-565c-36a1-aa2a-1de8dd8fe8a3	00020000-565c-36a1-d0c3-9cc7e7ae3b65
00010000-565c-36a1-aa2a-1de8dd8fe8a3	00020000-565c-36a1-5abc-2ee4e47117e4
00010000-565c-36a1-aa2a-1de8dd8fe8a3	00020000-565c-36a1-b3f8-5d53d8f1651a
00010000-565c-36a1-aa2a-1de8dd8fe8a3	00020000-565c-36a1-f58e-735a53bf3e3e
00010000-565c-36a1-aa2a-1de8dd8fe8a3	00020000-565c-36a1-8312-c16895565672
00010000-565c-36a1-aa2a-1de8dd8fe8a3	00020000-565c-36a1-91fa-cba230e6065e
00010000-565c-36a1-3554-4cc82908b3e2	00020000-565c-36a1-b371-5ca02462f2ca
\.


--
-- TOC entry 3146 (class 0 OID 30124972)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 30124910)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 30124856)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-565c-36a1-3e48-6f6c0f13772a	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-565c-36a1-9e51-27a6e7b260c6	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-565c-36a1-4967-54ced9c22b2a	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3097 (class 0 OID 30124479)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-565c-369e-57b9-4ac049a1663c	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-565c-369e-c822-d37f4a7485bc	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-565c-369e-c531-aa0b9e67fd06	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-565c-369e-7701-a5e6589c4b2d	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-565c-369e-c424-2e3bee25c528	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3096 (class 0 OID 30124471)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-565c-369e-6e9a-a650cac4adbc	00230000-565c-369e-7701-a5e6589c4b2d	popa
00240000-565c-369e-4404-17f5f8eeae8e	00230000-565c-369e-7701-a5e6589c4b2d	oseba
00240000-565c-369e-eda0-0bda690a6d0d	00230000-565c-369e-7701-a5e6589c4b2d	tippopa
00240000-565c-369e-b2b2-50a2a64501d4	00230000-565c-369e-7701-a5e6589c4b2d	organizacijskaenota
00240000-565c-369e-340e-94c680101feb	00230000-565c-369e-7701-a5e6589c4b2d	sezona
00240000-565c-369e-93bc-469d4d53e0ce	00230000-565c-369e-7701-a5e6589c4b2d	tipvaje
00240000-565c-369e-b6f9-5f05c07a1716	00230000-565c-369e-c822-d37f4a7485bc	prostor
00240000-565c-369e-80c5-e2f76730971a	00230000-565c-369e-7701-a5e6589c4b2d	besedilo
00240000-565c-369e-7202-ccb8d48a02ee	00230000-565c-369e-7701-a5e6589c4b2d	uprizoritev
00240000-565c-369e-aa53-435afc665bbf	00230000-565c-369e-7701-a5e6589c4b2d	funkcija
00240000-565c-369e-7787-3a870cc50337	00230000-565c-369e-7701-a5e6589c4b2d	tipfunkcije
00240000-565c-369e-d2b2-7c2c1c0c2d7b	00230000-565c-369e-7701-a5e6589c4b2d	alternacija
00240000-565c-369e-6218-8a9dd9846850	00230000-565c-369e-57b9-4ac049a1663c	pogodba
00240000-565c-369e-60a8-b8bec7152e55	00230000-565c-369e-7701-a5e6589c4b2d	zaposlitev
00240000-565c-369e-a714-35c73106c2cf	00230000-565c-369e-7701-a5e6589c4b2d	zvrstuprizoritve
00240000-565c-369e-3d24-e052ce9d3817	00230000-565c-369e-57b9-4ac049a1663c	programdela
00240000-565c-369e-0d6d-acdc10bd568f	00230000-565c-369e-7701-a5e6589c4b2d	zapis
\.


--
-- TOC entry 3095 (class 0 OID 30124466)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
766d415d-0b09-448b-b903-847f88b84747	00240000-565c-369e-6e9a-a650cac4adbc	0	1001
\.


--
-- TOC entry 3152 (class 0 OID 30125037)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-565c-36a1-e853-acd25a8390c9	000e0000-565c-36a1-34cd-4a9d49f193f6	00080000-565c-36a1-ec87-482348da97f3	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-565c-369f-b3d8-b0fd8b1812b5
00270000-565c-36a1-4c2f-71f8ae3dfe87	000e0000-565c-36a1-34cd-4a9d49f193f6	00080000-565c-36a1-ec87-482348da97f3	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-565c-369f-b3d8-b0fd8b1812b5
\.


--
-- TOC entry 3111 (class 0 OID 30124614)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 30124866)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-565c-36a1-cb27-95691badb31b	00180000-565c-36a1-a95b-11f6fe8e51de	000c0000-565c-36a1-2ca1-dc8bbc1e423f	00090000-565c-36a1-d74c-c27b605be904	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565c-36a1-4354-b566db3588ef	00180000-565c-36a1-a95b-11f6fe8e51de	000c0000-565c-36a1-c73d-6fe2b12f0b3d	00090000-565c-36a1-7fdf-0e103283a962	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565c-36a1-62df-0720bc7862d7	00180000-565c-36a1-a95b-11f6fe8e51de	000c0000-565c-36a1-b10d-06bf87701afb	00090000-565c-36a1-d4b1-06d5e23b1385	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565c-36a1-c802-db58e61092f2	00180000-565c-36a1-a95b-11f6fe8e51de	000c0000-565c-36a1-4d34-5f040422756c	00090000-565c-36a1-510b-a16931b8de1c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565c-36a1-5e56-4889344312be	00180000-565c-36a1-a95b-11f6fe8e51de	000c0000-565c-36a1-7c77-e1001aab0cc9	00090000-565c-36a1-6027-59143662e490	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565c-36a1-5891-9f002cb22509	00180000-565c-36a1-c861-a9ee2490e3e3	\N	00090000-565c-36a1-6027-59143662e490	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-565c-36a1-52fe-f65806189092	00180000-565c-36a1-c861-a9ee2490e3e3	\N	00090000-565c-36a1-7fdf-0e103283a962	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3155 (class 0 OID 30125078)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-565c-369e-dcbc-fe1a9f4a6dce	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-565c-369e-a8cd-1508d46294e1	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-565c-369e-6187-7427fcb3d425	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-565c-369e-46c8-6d1fec57117b	04	Režija	Režija	Režija	umetnik	30
000f0000-565c-369e-37ea-bc9d14c36c39	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-565c-369e-3a84-111b581e69b3	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-565c-369e-d871-54e75248bda9	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-565c-369e-f04e-329235ecc76f	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-565c-369e-8b92-1e4b95bb3636	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-565c-369e-f519-f2611f9bb02f	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-565c-369e-73ed-3900008dab30	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-565c-369e-97ba-6b02e3dab331	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-565c-369e-6250-d58e2f934076	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-565c-369e-9106-211f56a95932	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-565c-369e-e13b-22c384ab57c4	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-565c-369e-ddc6-044d488a3f8c	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-565c-369e-7519-1fe1c43db4fb	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-565c-369e-717e-896577eee2c2	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3108 (class 0 OID 30124565)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-565c-36a1-8a99-5c77d9e7d525	0001	šola	osnovna ali srednja šola
00400000-565c-36a1-105c-1e56428a4dbf	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-565c-36a1-8e18-bb2de36e81f2	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3168 (class 0 OID 30125373)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-565c-369e-0d64-080dd2e0ceae	01	Velika predstava	f	1.00	1.00
002b0000-565c-369e-40f2-cd6e0e3ac7e2	02	Mala predstava	f	0.50	0.50
002b0000-565c-369e-f75e-270a9d9f0ad8	03	Mala koprodukcija	t	0.40	1.00
002b0000-565c-369e-dab4-37ac8ecee288	04	Srednja koprodukcija	t	0.70	2.00
002b0000-565c-369e-a0bc-3bf76e2e4fd8	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3131 (class 0 OID 30124846)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-565c-369e-92db-7850e359f35f	0001	prva vaja	prva vaja
00420000-565c-369e-44e3-97eb83d9dd08	0002	tehnična vaja	tehnična vaja
00420000-565c-369e-aaf7-2f6a87c12ce7	0003	lučna vaja	lučna vaja
00420000-565c-369e-60ab-309644ec7a2e	0004	kostumska vaja	kostumska vaja
00420000-565c-369e-7f55-5e46526e44ce	0005	foto vaja	foto vaja
00420000-565c-369e-12b8-bffe986f17ca	0006	1. glavna vaja	1. glavna vaja
00420000-565c-369e-a345-942479f10625	0007	2. glavna vaja	2. glavna vaja
00420000-565c-369e-83d6-97cc557601ba	0008	1. generalka	1. generalka
00420000-565c-369e-ec04-c85a1dec8a21	0009	2. generalka	2. generalka
00420000-565c-369e-2f36-9ccbe514a31d	0010	odprta generalka	odprta generalka
00420000-565c-369e-8947-0c2170d3f2e7	0011	obnovitvena vaja	obnovitvena vaja
00420000-565c-369e-a826-72a28d71e60f	0012	pevska vaja	pevska vaja
00420000-565c-369e-3987-5d87059cc824	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-565c-369e-765d-1bc7f71746fc	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3117 (class 0 OID 30124687)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 30124501)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-565c-369f-66fc-d3a372a2a92e	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROkB6mpFDzzQwDr18U.eg31X06QffBVe6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-565c-36a1-3189-a3d81c490add	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-565c-36a1-9492-ff2a3cef9f6e	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-565c-36a1-e944-9b7b61384c1b	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-565c-36a1-bd58-60d07159128e	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-565c-36a1-b35b-84f2f59e4a65	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-565c-36a1-6353-3a302718c550	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-565c-36a1-fb62-5c33e2e39525	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-565c-36a1-0da6-59937f0656d2	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-565c-36a1-5fe8-5f8940f071bb	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-565c-36a1-65fa-9491ae640e8d	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-565c-36a1-38de-6734757678e9	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-565c-36a1-b7b6-93452b2434e5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-565c-36a1-75ce-d48d1480912b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-565c-36a1-6afc-910640e067d0	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-565c-36a1-3899-18bd08ce23d8	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-565c-36a1-ea8a-a0b064f1b028	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-565c-36a1-8448-4bb2bc566353	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-565c-36a1-aa2a-1de8dd8fe8a3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-565c-36a1-3554-4cc82908b3e2	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-565c-369f-7364-d699ca0ff118	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 30125128)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-565c-36a1-26e0-06fb25ce4ad4	00160000-565c-36a0-1c30-16140477f735	\N	00140000-565c-369e-b069-85fbd36a33b2	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-565c-36a0-25ad-58fcda841347
000e0000-565c-36a1-34cd-4a9d49f193f6	00160000-565c-36a0-176f-8b92530babdb	\N	00140000-565c-369e-97c3-10d5899a41fa	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-565c-36a0-8cc6-2ce648f2c77c
000e0000-565c-36a1-f41e-5592c04e7e78	\N	\N	00140000-565c-369e-97c3-10d5899a41fa	00190000-565c-36a1-21c4-c6c5904ed5e7	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-565c-36a0-25ad-58fcda841347
000e0000-565c-36a1-9eb8-36b57f760d74	\N	\N	00140000-565c-369e-97c3-10d5899a41fa	00190000-565c-36a1-21c4-c6c5904ed5e7	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-565c-36a0-25ad-58fcda841347
000e0000-565c-36a1-0fcb-3d3f0f2c52f1	\N	\N	00140000-565c-369e-97c3-10d5899a41fa	00190000-565c-36a1-21c4-c6c5904ed5e7	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-565c-36a0-e175-3f53bf79b3f7
000e0000-565c-36a1-a1d1-2fce8573749e	\N	\N	00140000-565c-369e-97c3-10d5899a41fa	00190000-565c-36a1-21c4-c6c5904ed5e7	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-565c-36a0-e175-3f53bf79b3f7
\.


--
-- TOC entry 3125 (class 0 OID 30124786)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-565c-36a1-3bc4-b0204b808598	\N	000e0000-565c-36a1-34cd-4a9d49f193f6	1	
00200000-565c-36a1-13ea-871f4043268e	\N	000e0000-565c-36a1-34cd-4a9d49f193f6	2	
00200000-565c-36a1-e20f-1b4b49e196ea	\N	000e0000-565c-36a1-34cd-4a9d49f193f6	3	
00200000-565c-36a1-3083-c7b40915c096	\N	000e0000-565c-36a1-34cd-4a9d49f193f6	4	
00200000-565c-36a1-782d-36ca613a4fb8	\N	000e0000-565c-36a1-34cd-4a9d49f193f6	5	
\.


--
-- TOC entry 3142 (class 0 OID 30124937)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 30125051)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-565c-369f-2442-71bb363abbae	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-565c-369f-c5d6-9201bc14c2ca	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-565c-369f-fd7c-9ec3cbd70171	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-565c-369f-6157-73579dbaf955	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-565c-369f-6b40-8817221a937b	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-565c-369f-fc5e-4315e53f5352	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-565c-369f-622e-4cb892abcd94	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-565c-369f-839b-7223dddab16f	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-565c-369f-b3d8-b0fd8b1812b5	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-565c-369f-366e-6c9d485b7f4f	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-565c-369f-bdb6-51a24ec122e8	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-565c-369f-b1ac-d9220674c383	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-565c-369f-66bf-c19a1f250c7d	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-565c-369f-3747-dc87afba6f42	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-565c-369f-eb9a-99341d010006	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-565c-369f-46a0-53f4c1b6fa3e	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-565c-369f-4c5e-59172c9c136a	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-565c-369f-1915-832771692ab3	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-565c-369f-983a-cf97beb8c1fd	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-565c-369f-4fa1-b315a863898b	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-565c-369f-3fc4-cbf0f09c209e	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-565c-369f-6333-044c0ca6c4fa	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-565c-369f-11f0-20a941e078d0	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-565c-369f-0ed2-44946dd75bdd	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-565c-369f-e160-3166106814e0	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-565c-369f-f15d-b20830e57211	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-565c-369f-dcf0-62dc8cc4d5d2	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-565c-369f-e56c-c53b4955c35d	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3171 (class 0 OID 30125423)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 30125392)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 30125435)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 30125009)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-565c-36a1-a6ea-07f17b339666	00090000-565c-36a1-7fdf-0e103283a962	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565c-36a1-73e4-a326e36e29d2	00090000-565c-36a1-d4b1-06d5e23b1385	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565c-36a1-2b2a-8eb8b3b59045	00090000-565c-36a1-a68f-8f16479c53cc	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565c-36a1-7afe-9aab7fb4754f	00090000-565c-36a1-8bdd-912444673edf	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565c-36a1-22de-74fe45dfdb10	00090000-565c-36a1-1bab-8f12d3c74435	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565c-36a1-5e0e-4f2f2639a313	00090000-565c-36a1-3f95-6b168f0bc348	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3128 (class 0 OID 30124830)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 30125118)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-565c-369e-b069-85fbd36a33b2	01	Drama	drama (SURS 01)
00140000-565c-369e-792d-81680358b0c8	02	Opera	opera (SURS 02)
00140000-565c-369e-8243-5b7b68f464b9	03	Balet	balet (SURS 03)
00140000-565c-369e-2ec6-234ed5536167	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-565c-369e-65cc-46a6c4997612	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-565c-369e-97c3-10d5899a41fa	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-565c-369e-0ec5-be24f557b5bd	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3148 (class 0 OID 30124999)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2590 (class 2606 OID 30124564)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 30125177)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 30125167)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 30124555)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 30125034)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 30125076)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 30125476)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 30124818)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 30124840)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 30124845)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 30125390)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 30124713)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 30125246)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 30124995)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 30124784)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 30124751)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 30124727)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 30124902)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 30125453)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 30125460)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2871 (class 2606 OID 30125484)
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
-- TOC entry 2728 (class 2606 OID 30124929)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 30124685)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 30124583)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 30124647)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 30124610)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 30124544)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2579 (class 2606 OID 30124529)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 30124935)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 30124971)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 30125113)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 30124638)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 30124673)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 30125341)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 30124908)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 30124663)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 30124803)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 30124772)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2657 (class 2606 OID 30124764)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 30124920)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 30125350)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 30125358)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 30125328)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 30125371)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 30124953)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 30124893)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 30124884)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 30125100)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 30125027)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 30124739)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 30124500)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 30124962)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 30124518)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2581 (class 2606 OID 30124538)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 30124980)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 30124915)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 30124864)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 30124488)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 30124476)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 30124470)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 30125047)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 30124619)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 30124875)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 30125087)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 30124572)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 30125383)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 30124853)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 30124698)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 30124513)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 30125146)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 30124793)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 30124943)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 30125059)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 30125433)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 30125417)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 30125441)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 30125017)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 30124834)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 30125126)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 30125007)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 1259 OID 30124828)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2674 (class 1259 OID 30124829)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2675 (class 1259 OID 30124827)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2676 (class 1259 OID 30124826)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2677 (class 1259 OID 30124825)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2771 (class 1259 OID 30125048)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2772 (class 1259 OID 30125049)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2773 (class 1259 OID 30125050)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2857 (class 1259 OID 30125455)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2858 (class 1259 OID 30125454)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2608 (class 1259 OID 30124640)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2609 (class 1259 OID 30124641)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 30124936)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2844 (class 1259 OID 30125421)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2845 (class 1259 OID 30125420)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2846 (class 1259 OID 30125422)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2847 (class 1259 OID 30125419)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2848 (class 1259 OID 30125418)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2723 (class 1259 OID 30124922)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2724 (class 1259 OID 30124921)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2665 (class 1259 OID 30124794)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2666 (class 1259 OID 30124795)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2753 (class 1259 OID 30124996)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2754 (class 1259 OID 30124998)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2755 (class 1259 OID 30124997)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2640 (class 1259 OID 30124729)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 30124728)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2835 (class 1259 OID 30125372)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2787 (class 1259 OID 30125115)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2788 (class 1259 OID 30125116)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 30125117)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2854 (class 1259 OID 30125442)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2796 (class 1259 OID 30125151)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2797 (class 1259 OID 30125148)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2798 (class 1259 OID 30125152)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2799 (class 1259 OID 30125150)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2800 (class 1259 OID 30125149)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2630 (class 1259 OID 30124700)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 30124699)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 30124613)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2741 (class 1259 OID 30124963)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2583 (class 1259 OID 30124545)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2584 (class 1259 OID 30124546)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2746 (class 1259 OID 30124983)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 30124982)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2748 (class 1259 OID 30124981)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2613 (class 1259 OID 30124650)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2614 (class 1259 OID 30124649)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2615 (class 1259 OID 30124651)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2653 (class 1259 OID 30124767)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2654 (class 1259 OID 30124765)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 30124766)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2563 (class 1259 OID 30124478)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2703 (class 1259 OID 30124888)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2704 (class 1259 OID 30124886)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2705 (class 1259 OID 30124885)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2706 (class 1259 OID 30124887)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2574 (class 1259 OID 30124519)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 30124520)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2732 (class 1259 OID 30124944)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2867 (class 1259 OID 30125477)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2769 (class 1259 OID 30125036)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2770 (class 1259 OID 30125035)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2868 (class 1259 OID 30125485)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2869 (class 1259 OID 30125486)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2718 (class 1259 OID 30124909)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2763 (class 1259 OID 30125028)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2764 (class 1259 OID 30125029)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2817 (class 1259 OID 30125251)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2818 (class 1259 OID 30125250)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2819 (class 1259 OID 30125247)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2820 (class 1259 OID 30125248)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2821 (class 1259 OID 30125249)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2619 (class 1259 OID 30124665)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 30124664)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2621 (class 1259 OID 30124666)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2735 (class 1259 OID 30124957)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2736 (class 1259 OID 30124956)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 30125351)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2828 (class 1259 OID 30125352)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2810 (class 1259 OID 30125181)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 30125182)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2812 (class 1259 OID 30125179)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2813 (class 1259 OID 30125180)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2759 (class 1259 OID 30125018)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2760 (class 1259 OID 30125019)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2709 (class 1259 OID 30124897)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2710 (class 1259 OID 30124896)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2711 (class 1259 OID 30124894)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2712 (class 1259 OID 30124895)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2806 (class 1259 OID 30125169)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2807 (class 1259 OID 30125168)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2644 (class 1259 OID 30124740)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2647 (class 1259 OID 30124754)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2648 (class 1259 OID 30124753)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2649 (class 1259 OID 30124752)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2650 (class 1259 OID 30124755)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2664 (class 1259 OID 30124785)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2658 (class 1259 OID 30124773)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2659 (class 1259 OID 30124774)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2824 (class 1259 OID 30125342)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2843 (class 1259 OID 30125391)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2861 (class 1259 OID 30125461)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2862 (class 1259 OID 30125462)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2595 (class 1259 OID 30124585)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2596 (class 1259 OID 30124584)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2604 (class 1259 OID 30124620)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 30124621)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2684 (class 1259 OID 30124835)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2698 (class 1259 OID 30124878)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2699 (class 1259 OID 30124877)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2700 (class 1259 OID 30124876)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2678 (class 1259 OID 30124820)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2679 (class 1259 OID 30124821)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2680 (class 1259 OID 30124824)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2681 (class 1259 OID 30124819)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2682 (class 1259 OID 30124823)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2683 (class 1259 OID 30124822)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2612 (class 1259 OID 30124639)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 30124573)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 30124574)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2636 (class 1259 OID 30124714)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 30124716)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2638 (class 1259 OID 30124715)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2639 (class 1259 OID 30124717)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2717 (class 1259 OID 30124903)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2792 (class 1259 OID 30125114)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2801 (class 1259 OID 30125147)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2783 (class 1259 OID 30125088)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2784 (class 1259 OID 30125089)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2602 (class 1259 OID 30124611)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 30124612)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2756 (class 1259 OID 30125008)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 30124489)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 30124686)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2618 (class 1259 OID 30124648)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 30124477)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2840 (class 1259 OID 30125384)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 30124955)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2740 (class 1259 OID 30124954)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 30124854)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 30124855)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2814 (class 1259 OID 30125178)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 30124674)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2793 (class 1259 OID 30125127)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2851 (class 1259 OID 30125434)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2833 (class 1259 OID 30125359)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2834 (class 1259 OID 30125360)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2780 (class 1259 OID 30125077)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2697 (class 1259 OID 30124865)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 30124539)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2911 (class 2606 OID 30125657)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2910 (class 2606 OID 30125662)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2905 (class 2606 OID 30125687)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2907 (class 2606 OID 30125677)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2912 (class 2606 OID 30125652)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2908 (class 2606 OID 30125672)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2906 (class 2606 OID 30125682)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2909 (class 2606 OID 30125667)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2948 (class 2606 OID 30125857)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2947 (class 2606 OID 30125862)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2946 (class 2606 OID 30125867)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2980 (class 2606 OID 30126032)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2981 (class 2606 OID 30126027)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 30125542)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2883 (class 2606 OID 30125547)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 30125772)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2975 (class 2606 OID 30126012)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 30126007)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2974 (class 2606 OID 30126017)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2977 (class 2606 OID 30126002)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2978 (class 2606 OID 30125997)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2927 (class 2606 OID 30125767)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2928 (class 2606 OID 30125762)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2904 (class 2606 OID 30125642)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2903 (class 2606 OID 30125647)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2939 (class 2606 OID 30125812)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 30125822)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2938 (class 2606 OID 30125817)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2893 (class 2606 OID 30125597)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2894 (class 2606 OID 30125592)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 30125752)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2972 (class 2606 OID 30125987)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2951 (class 2606 OID 30125872)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2950 (class 2606 OID 30125877)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2949 (class 2606 OID 30125882)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2979 (class 2606 OID 30126022)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2953 (class 2606 OID 30125902)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2956 (class 2606 OID 30125887)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2952 (class 2606 OID 30125907)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 30125897)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2955 (class 2606 OID 30125892)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2891 (class 2606 OID 30125587)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 30125582)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2879 (class 2606 OID 30125527)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2880 (class 2606 OID 30125522)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2933 (class 2606 OID 30125792)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2876 (class 2606 OID 30125502)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2875 (class 2606 OID 30125507)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2934 (class 2606 OID 30125807)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 30125802)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2936 (class 2606 OID 30125797)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2886 (class 2606 OID 30125557)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2887 (class 2606 OID 30125552)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2885 (class 2606 OID 30125562)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2897 (class 2606 OID 30125622)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 30125612)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2898 (class 2606 OID 30125617)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2872 (class 2606 OID 30125487)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2917 (class 2606 OID 30125727)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2919 (class 2606 OID 30125717)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2920 (class 2606 OID 30125712)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2918 (class 2606 OID 30125722)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 30125492)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2873 (class 2606 OID 30125497)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2930 (class 2606 OID 30125777)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2984 (class 2606 OID 30126047)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 30125852)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2945 (class 2606 OID 30125847)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2986 (class 2606 OID 30126052)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 30126057)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2926 (class 2606 OID 30125757)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2943 (class 2606 OID 30125837)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2942 (class 2606 OID 30125842)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2963 (class 2606 OID 30125962)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 30125957)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2967 (class 2606 OID 30125942)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2966 (class 2606 OID 30125947)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2965 (class 2606 OID 30125952)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2889 (class 2606 OID 30125572)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 30125567)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 30125577)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2931 (class 2606 OID 30125787)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2932 (class 2606 OID 30125782)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 30125972)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2969 (class 2606 OID 30125977)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2960 (class 2606 OID 30125932)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2959 (class 2606 OID 30125937)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2962 (class 2606 OID 30125922)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2961 (class 2606 OID 30125927)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2941 (class 2606 OID 30125827)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2940 (class 2606 OID 30125832)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2921 (class 2606 OID 30125747)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2922 (class 2606 OID 30125742)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2924 (class 2606 OID 30125732)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2923 (class 2606 OID 30125737)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2957 (class 2606 OID 30125917)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2958 (class 2606 OID 30125912)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2895 (class 2606 OID 30125602)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2896 (class 2606 OID 30125607)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2902 (class 2606 OID 30125637)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2901 (class 2606 OID 30125627)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2900 (class 2606 OID 30125632)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 30125967)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2971 (class 2606 OID 30125982)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2973 (class 2606 OID 30125992)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2983 (class 2606 OID 30126037)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2982 (class 2606 OID 30126042)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2877 (class 2606 OID 30125517)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 30125512)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2882 (class 2606 OID 30125532)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2881 (class 2606 OID 30125537)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2913 (class 2606 OID 30125692)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2914 (class 2606 OID 30125707)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2915 (class 2606 OID 30125702)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2916 (class 2606 OID 30125697)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-30 12:44:36 CET

--
-- PostgreSQL database dump complete
--

