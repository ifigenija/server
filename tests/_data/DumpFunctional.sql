--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-17 11:03:03 CET

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
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 32499865)
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
-- TOC entry 237 (class 1259 OID 32500480)
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
-- TOC entry 236 (class 1259 OID 32500463)
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
-- TOC entry 182 (class 1259 OID 32499858)
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
-- TOC entry 181 (class 1259 OID 32499856)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 32500340)
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
-- TOC entry 230 (class 1259 OID 32500370)
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
-- TOC entry 251 (class 1259 OID 32500783)
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
-- TOC entry 203 (class 1259 OID 32500113)
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
-- TOC entry 205 (class 1259 OID 32500145)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 32500150)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 32500705)
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
-- TOC entry 194 (class 1259 OID 32500010)
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
-- TOC entry 238 (class 1259 OID 32500493)
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
-- TOC entry 223 (class 1259 OID 32500293)
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
-- TOC entry 200 (class 1259 OID 32500084)
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
-- TOC entry 197 (class 1259 OID 32500050)
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
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 32500027)
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
-- TOC entry 212 (class 1259 OID 32500207)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 32500763)
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
-- TOC entry 250 (class 1259 OID 32500776)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 32500798)
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
-- TOC entry 170 (class 1259 OID 32153619)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 32500232)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 32499984)
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
-- TOC entry 185 (class 1259 OID 32499884)
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
-- TOC entry 189 (class 1259 OID 32499951)
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
-- TOC entry 186 (class 1259 OID 32499895)
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
-- TOC entry 178 (class 1259 OID 32499830)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 32499849)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 32500239)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 32500273)
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
-- TOC entry 233 (class 1259 OID 32500411)
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
-- TOC entry 188 (class 1259 OID 32499931)
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
-- TOC entry 191 (class 1259 OID 32499976)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 32500649)
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
-- TOC entry 213 (class 1259 OID 32500213)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 32499961)
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
-- TOC entry 202 (class 1259 OID 32500105)
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
-- TOC entry 198 (class 1259 OID 32500065)
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
-- TOC entry 199 (class 1259 OID 32500077)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 32500225)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 32500663)
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
-- TOC entry 242 (class 1259 OID 32500673)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 32500562)
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
-- TOC entry 243 (class 1259 OID 32500681)
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
-- TOC entry 219 (class 1259 OID 32500254)
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
-- TOC entry 211 (class 1259 OID 32500198)
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
-- TOC entry 210 (class 1259 OID 32500188)
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
-- TOC entry 232 (class 1259 OID 32500400)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 32500330)
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
-- TOC entry 196 (class 1259 OID 32500039)
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
-- TOC entry 175 (class 1259 OID 32499801)
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
-- TOC entry 174 (class 1259 OID 32499799)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 32500267)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 32499839)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 32499823)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 32500281)
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
-- TOC entry 214 (class 1259 OID 32500219)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 32500165)
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
-- TOC entry 173 (class 1259 OID 32499788)
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
-- TOC entry 172 (class 1259 OID 32499780)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 32499775)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 32500347)
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
-- TOC entry 187 (class 1259 OID 32499923)
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
-- TOC entry 209 (class 1259 OID 32500175)
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
-- TOC entry 231 (class 1259 OID 32500388)
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
-- TOC entry 184 (class 1259 OID 32499874)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 32500693)
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
-- TOC entry 207 (class 1259 OID 32500155)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 32499996)
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
-- TOC entry 176 (class 1259 OID 32499810)
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
-- TOC entry 235 (class 1259 OID 32500438)
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
-- TOC entry 201 (class 1259 OID 32500095)
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
-- TOC entry 218 (class 1259 OID 32500246)
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
-- TOC entry 229 (class 1259 OID 32500361)
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
-- TOC entry 247 (class 1259 OID 32500743)
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
-- TOC entry 246 (class 1259 OID 32500712)
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
-- TOC entry 248 (class 1259 OID 32500755)
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
-- TOC entry 225 (class 1259 OID 32500319)
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
-- TOC entry 204 (class 1259 OID 32500139)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 32500428)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 32500309)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 32499861)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 32499804)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3118 (class 0 OID 32499865)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5672-8853-7c5d-f0cf1eab5e1e	10	30	Otroci	Abonma za otroke	200
000a0000-5672-8853-bb87-9807fe0504d0	20	60	Mladina	Abonma za mladino	400
000a0000-5672-8853-6820-ec2af2ff142b	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3172 (class 0 OID 32500480)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5672-8854-70ae-11a8cf34109c	000d0000-5672-8854-74ec-dfce264d1bc4	\N	00090000-5672-8854-82d2-7c9f8e3db83e	000b0000-5672-8854-9832-07fb70442750	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5672-8854-a075-63029d0604ea	000d0000-5672-8854-78fe-f6ca4b73b03d	00100000-5672-8854-a81e-b8da47767037	00090000-5672-8854-4402-4ef78e632931	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5672-8854-b242-62786006f31e	000d0000-5672-8854-905a-19771d974a97	00100000-5672-8854-176b-6f35ac17f0a6	00090000-5672-8854-46bc-08e88199ee4c	\N	0003	t	\N	2015-12-17	\N	2	t	\N	f	f
000c0000-5672-8854-7ddf-2978c3d502a0	000d0000-5672-8854-92f6-1e5f80e0ce07	\N	00090000-5672-8854-4e15-e62e3067e6f2	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5672-8854-9c15-07dd430ac0a3	000d0000-5672-8854-b2ec-dcd3dde6052b	\N	00090000-5672-8854-a3df-4a29d662ae2f	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5672-8854-d072-0ddbecf59f2c	000d0000-5672-8854-a676-242c6cc51064	\N	00090000-5672-8854-f32a-b065aa9e6eb5	000b0000-5672-8854-0a19-92cb3a2053a4	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5672-8854-ecad-4138816fa690	000d0000-5672-8854-845b-92a8e302a939	00100000-5672-8854-d242-52c8dca66d7c	00090000-5672-8854-2c7b-1045826ada11	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5672-8854-7e11-8c056813e3ca	000d0000-5672-8854-1d97-5581dd167a1c	\N	00090000-5672-8854-56fb-27513b99d364	000b0000-5672-8854-504d-bae1f865ebe2	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5672-8854-e2bb-394652bd601e	000d0000-5672-8854-845b-92a8e302a939	00100000-5672-8854-ec55-c4982286bd7e	00090000-5672-8854-c85c-e1dd759e8b93	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5672-8854-1e26-1d24c451f5ab	000d0000-5672-8854-845b-92a8e302a939	00100000-5672-8854-adcc-7b97cb4e4c9f	00090000-5672-8854-cdeb-9ee6ffc2b76b	\N	0010	t	\N	2015-12-17	\N	16	f	\N	f	t
000c0000-5672-8854-7055-7f19bb193f69	000d0000-5672-8854-845b-92a8e302a939	00100000-5672-8854-a02b-2894e0454035	00090000-5672-8854-3728-2cb64eb22cb1	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5672-8854-70b8-381c60f98059	000d0000-5672-8854-f675-e2fdbc0548ae	00100000-5672-8854-a81e-b8da47767037	00090000-5672-8854-4402-4ef78e632931	000b0000-5672-8854-0cac-0e0f9391cb4c	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3171 (class 0 OID 32500463)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 32499858)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3162 (class 0 OID 32500340)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5672-8854-cc6f-2ac4c93f06ba	00160000-5672-8853-50a7-c944456408da	00090000-5672-8854-3880-f3cf84dfc416	aizv	10	t
003d0000-5672-8854-cb0c-bd96405d1555	00160000-5672-8853-50a7-c944456408da	00090000-5672-8854-9502-b758cb0c141e	apri	14	t
003d0000-5672-8854-f530-881557816b2c	00160000-5672-8853-69ca-7918ceef948c	00090000-5672-8854-d4ed-98d36e23b854	aizv	11	t
003d0000-5672-8854-153b-1c6c4c8f90e1	00160000-5672-8853-1d96-50e2300a9a1f	00090000-5672-8854-be04-b3c3778a8e00	aizv	12	t
003d0000-5672-8854-f798-f1e33e350f19	00160000-5672-8853-50a7-c944456408da	00090000-5672-8854-4e86-f92041786dca	apri	18	f
\.


--
-- TOC entry 3165 (class 0 OID 32500370)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5672-8853-50a7-c944456408da	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5672-8853-69ca-7918ceef948c	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5672-8853-1d96-50e2300a9a1f	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3186 (class 0 OID 32500783)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 32500113)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5672-8854-f6b4-c7ce5c6ed56f	\N	\N	00200000-5672-8854-c99a-50c9f047ce58	\N	\N	\N	00220000-5672-8853-f459-c231dc98cc9d	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5672-8854-bc09-9097379f1423	\N	\N	00200000-5672-8854-f8b9-f1051b1fda95	\N	\N	\N	00220000-5672-8853-f459-c231dc98cc9d	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5672-8854-8193-77066739d692	\N	\N	00200000-5672-8854-3155-bcb4d9ab8183	\N	\N	\N	00220000-5672-8853-f48c-0ba269e49224	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5672-8854-25e3-2ca1b2bf8b8e	\N	\N	00200000-5672-8854-ba68-769dbac90f49	\N	\N	\N	00220000-5672-8853-3f85-c969a1322d3f	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5672-8854-e08e-f298b57671f1	\N	\N	00200000-5672-8854-fe2a-8ad6c78c4262	\N	\N	\N	00220000-5672-8853-9b62-417fb39d3999	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3140 (class 0 OID 32500145)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 32500150)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 32500705)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 32500010)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5672-8850-0243-36d27e2a934e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5672-8850-fcaa-41ad0944afec	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5672-8850-a671-ad24944b3965	AL	ALB	008	Albania 	Albanija	\N
00040000-5672-8850-fd17-0ef03d5ca50d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5672-8850-8a87-b860b1003337	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5672-8850-ddd9-08034888cae3	AD	AND	020	Andorra 	Andora	\N
00040000-5672-8850-0205-f10e900e2126	AO	AGO	024	Angola 	Angola	\N
00040000-5672-8850-df38-542713f6867b	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5672-8850-8c03-ced1596886fa	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5672-8850-2291-41218abc67f3	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5672-8850-579c-3f299445d1b8	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5672-8850-3751-ffac338e823a	AM	ARM	051	Armenia 	Armenija	\N
00040000-5672-8850-ea30-1ce3d805313d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5672-8850-102d-0ce64dd66152	AU	AUS	036	Australia 	Avstralija	\N
00040000-5672-8850-e58c-0b078e8679c0	AT	AUT	040	Austria 	Avstrija	\N
00040000-5672-8850-659d-7dc1bffdb8e5	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5672-8850-5cd2-188649d005e2	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5672-8850-8a1f-0863d7812d13	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5672-8850-b914-a91a8ef5e087	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5672-8850-f84c-76b5865cf43a	BB	BRB	052	Barbados 	Barbados	\N
00040000-5672-8850-def4-8add64ddf021	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5672-8850-2460-c73ca627a5cb	BE	BEL	056	Belgium 	Belgija	\N
00040000-5672-8850-0281-842d2e2e1364	BZ	BLZ	084	Belize 	Belize	\N
00040000-5672-8850-06f7-00d298b979a7	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5672-8850-421b-6a19adb34aba	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5672-8850-4018-e6f89d4217f5	BT	BTN	064	Bhutan 	Butan	\N
00040000-5672-8850-a5e4-219c1cc00e60	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5672-8850-8ed6-0b74ddb08a93	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5672-8850-b574-bb6a241ff23a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5672-8850-20f4-6a2c89f75877	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5672-8850-aa8d-ec087d5b4cf6	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5672-8850-2f77-832502f68027	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5672-8850-0ebd-a26828f2b3eb	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5672-8850-a6d9-b8360997229e	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5672-8850-c042-8c95ee2a2672	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5672-8850-0e6f-f6925be1d2e3	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5672-8850-f82e-bbc045bd39e1	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5672-8850-1bcc-52ae4286813f	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5672-8850-1953-03210918f255	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5672-8850-a66a-f4e52075bb20	CA	CAN	124	Canada 	Kanada	\N
00040000-5672-8850-b83f-d7ad5fa5ad16	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5672-8850-7b3b-584eeafdc0a6	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5672-8850-4776-1df516970d6b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5672-8850-9965-da68703ba662	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5672-8850-858b-c42fd2056de6	CL	CHL	152	Chile 	Čile	\N
00040000-5672-8850-3d23-c91c39546dd1	CN	CHN	156	China 	Kitajska	\N
00040000-5672-8850-447e-41f141cf8ac0	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5672-8850-7aea-085adf9f2355	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5672-8850-af27-88ac67e127b5	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5672-8850-03b3-cf758efc02d5	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5672-8850-af2c-b76c70004336	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5672-8850-df8e-d6b56d913199	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5672-8850-8281-fa6774b2299c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5672-8850-5499-b8d5143e6913	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5672-8850-39e3-c4219b1b2548	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5672-8850-fb12-1779f5a10723	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5672-8850-be50-782e076140e4	CU	CUB	192	Cuba 	Kuba	\N
00040000-5672-8850-b304-7c461955852b	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5672-8850-bf76-dc07ad86dfa4	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5672-8850-a4c9-95eb81255d83	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5672-8850-7b96-28a14e79d331	DK	DNK	208	Denmark 	Danska	\N
00040000-5672-8850-2a71-7fc6e146c1ea	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5672-8850-a5e9-ade7f5288630	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5672-8850-f8ee-73ac9dd9f6c5	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5672-8850-006d-eacb13e623ba	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5672-8850-af75-a088af24461b	EG	EGY	818	Egypt 	Egipt	\N
00040000-5672-8850-ba55-222b386bcb97	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5672-8850-7069-346283fc3daa	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5672-8850-ef0e-ef9b850745db	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5672-8850-e85e-6b616d83e21b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5672-8850-009f-e92d35ad1c4c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5672-8850-a390-0ed6c062729e	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5672-8850-8fa4-93b8b5b346bb	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5672-8851-27c0-91e259e94d41	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5672-8851-64cf-84b00bba46a5	FI	FIN	246	Finland 	Finska	\N
00040000-5672-8851-33a6-c224a4706ee9	FR	FRA	250	France 	Francija	\N
00040000-5672-8851-bd15-82028a2a4552	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5672-8851-dd36-8a4a52c9ef51	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5672-8851-927f-dd17ec802820	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5672-8851-5bf2-88f3d78f0031	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5672-8851-acea-a8e029efb37f	GA	GAB	266	Gabon 	Gabon	\N
00040000-5672-8851-9012-4bc5f7701480	GM	GMB	270	Gambia 	Gambija	\N
00040000-5672-8851-26e3-a57b0a138c66	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5672-8851-fcd3-6c9b8dc5fda6	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5672-8851-4afc-79b642de47e7	GH	GHA	288	Ghana 	Gana	\N
00040000-5672-8851-cec4-cc7ce2014d27	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5672-8851-b60c-283652f2f003	GR	GRC	300	Greece 	Grčija	\N
00040000-5672-8851-b9a8-8a24f5ff76af	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5672-8851-d21e-0c6ec496fbd4	GD	GRD	308	Grenada 	Grenada	\N
00040000-5672-8851-3482-d05f259b2443	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5672-8851-1349-0204dde2b9a0	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5672-8851-efe4-2cbfcf9b6ca6	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5672-8851-3810-2f6e3e346047	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5672-8851-88e4-a8c36189a7ac	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5672-8851-5700-77676c0f157a	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5672-8851-f51c-cd5ac68940ae	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5672-8851-e64b-a74d9dadb5ce	HT	HTI	332	Haiti 	Haiti	\N
00040000-5672-8851-b124-600563aea8cd	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5672-8851-4c09-78ef06109551	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5672-8851-f026-f4d25544e2e5	HN	HND	340	Honduras 	Honduras	\N
00040000-5672-8851-e6d0-5eedefee8dfd	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5672-8851-db81-66fc5a2d3566	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5672-8851-9f6d-a4df42eaf7cf	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5672-8851-dd62-ea8d50f1a0e8	IN	IND	356	India 	Indija	\N
00040000-5672-8851-74b4-83fa53a1b360	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5672-8851-e3dd-6bd65a1191c3	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5672-8851-c877-7c234ed9c2aa	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5672-8851-641e-d930abe5c1e5	IE	IRL	372	Ireland 	Irska	\N
00040000-5672-8851-a3f1-c869732694cc	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5672-8851-a089-6eff1548bfbf	IL	ISR	376	Israel 	Izrael	\N
00040000-5672-8851-7dde-f95c37414956	IT	ITA	380	Italy 	Italija	\N
00040000-5672-8851-cfe2-973aa8635239	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5672-8851-2160-483ab88665ce	JP	JPN	392	Japan 	Japonska	\N
00040000-5672-8851-bd72-e2fcafc44000	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5672-8851-1fbf-68ba09ecc813	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5672-8851-a43b-8699e7df68ee	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5672-8851-61b0-5f823bfd8d06	KE	KEN	404	Kenya 	Kenija	\N
00040000-5672-8851-541c-50afc963f718	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5672-8851-aa29-18f672ecf69d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5672-8851-dd37-39e50f3c1dd8	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5672-8851-306b-efa07d575cc3	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5672-8851-9a46-8975148ade80	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5672-8851-7260-50313fed4283	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5672-8851-3d41-a6a2cb1e1b07	LV	LVA	428	Latvia 	Latvija	\N
00040000-5672-8851-5235-6af9dc9ddd28	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5672-8851-83fa-7c6c83d9ea70	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5672-8851-b813-a59b2d5453ea	LR	LBR	430	Liberia 	Liberija	\N
00040000-5672-8851-e3b0-92ad4b2a6220	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5672-8851-e4ca-02dbf0af734e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5672-8851-43b6-ed583f93ec2b	LT	LTU	440	Lithuania 	Litva	\N
00040000-5672-8851-9fc3-12f47a74cd1d	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5672-8851-fd51-de8824b3ae2f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5672-8851-0ed5-0c960fb9744c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5672-8851-5be2-ffefeae2abe2	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5672-8851-89f1-974f48a64e15	MW	MWI	454	Malawi 	Malavi	\N
00040000-5672-8851-ae1c-6005a08b9dbd	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5672-8851-963e-ddcce23ea18b	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5672-8851-b997-596148a2aa49	ML	MLI	466	Mali 	Mali	\N
00040000-5672-8851-9b16-ba82dca1f491	MT	MLT	470	Malta 	Malta	\N
00040000-5672-8851-c646-5be9d5a6ed98	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5672-8851-5ae1-2b35cbebae6f	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5672-8851-d671-5e89811a70c2	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5672-8851-2d50-ee58f1a58e10	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5672-8851-fd86-6a2b8592e41e	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5672-8851-2b9c-b6ad18960d96	MX	MEX	484	Mexico 	Mehika	\N
00040000-5672-8851-b13e-d9b2345e143b	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5672-8851-9e9a-1c7bdf44bcf8	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5672-8851-01ef-b339851a6a54	MC	MCO	492	Monaco 	Monako	\N
00040000-5672-8851-a363-bc32f359b911	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5672-8851-c69d-c0b1f5317f19	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5672-8851-4e58-88f8544dbe6b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5672-8851-d9f0-564b2c960b5e	MA	MAR	504	Morocco 	Maroko	\N
00040000-5672-8851-afed-82b8d07be43c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5672-8851-adce-addd5cbb6e5c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5672-8851-48ec-77824067b0ba	NA	NAM	516	Namibia 	Namibija	\N
00040000-5672-8851-4540-aa5d86a363b9	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5672-8851-9245-75f3a997b206	NP	NPL	524	Nepal 	Nepal	\N
00040000-5672-8851-7e06-245f152f997b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5672-8851-34c3-b10207be36ff	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5672-8851-3d80-bafedab0fd58	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5672-8851-f535-b90b2ebe17c8	NE	NER	562	Niger 	Niger 	\N
00040000-5672-8851-22bd-c476eab46081	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5672-8851-cbe5-072a19629074	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5672-8851-87eb-e2050a611745	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5672-8851-8729-ff0363a0a12f	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5672-8851-a8a7-a97b57ac7047	NO	NOR	578	Norway 	Norveška	\N
00040000-5672-8851-3709-5e2b2eec29c1	OM	OMN	512	Oman 	Oman	\N
00040000-5672-8851-8b79-4fee22a99191	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5672-8851-3cae-d39056d68efc	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5672-8851-15e4-c4f74ac8ce14	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5672-8851-bbc6-baf63d5a77dc	PA	PAN	591	Panama 	Panama	\N
00040000-5672-8851-1d11-5a4638202ab9	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5672-8851-5065-a1d62d11233c	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5672-8851-da53-50ae4353baf4	PE	PER	604	Peru 	Peru	\N
00040000-5672-8851-ff7c-bb03bca8bdfb	PH	PHL	608	Philippines 	Filipini	\N
00040000-5672-8851-b4ec-5f7397c045c6	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5672-8851-3e8f-4e88485ec991	PL	POL	616	Poland 	Poljska	\N
00040000-5672-8851-3fa8-8fd1bf697edd	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5672-8851-02bc-bd7eb2b8f465	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5672-8851-2904-7403b7718a44	QA	QAT	634	Qatar 	Katar	\N
00040000-5672-8851-af8c-5b9391c68351	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5672-8851-b022-c4d7987d866b	RO	ROU	642	Romania 	Romunija	\N
00040000-5672-8851-f19e-919f869e93fa	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5672-8851-274b-62b750341f88	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5672-8851-ee23-220f7b4c7b2c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5672-8851-0628-d9c9414b7f5f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5672-8851-7d1d-3ac9f41ce606	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5672-8851-eea9-2c727263dac8	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5672-8851-02a6-f2b50b468ec1	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5672-8851-bbb5-5dc675fd64e9	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5672-8851-0151-307231a53ff7	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5672-8851-534d-a6648978084a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5672-8851-3437-888714b54fc9	SM	SMR	674	San Marino 	San Marino	\N
00040000-5672-8851-8aee-94b15b72f1ad	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5672-8851-794f-fb5d0c3dd9b9	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5672-8851-65cd-3d3def61ece6	SN	SEN	686	Senegal 	Senegal	\N
00040000-5672-8851-b21c-44cf24331a3e	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5672-8851-90ab-61c414141057	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5672-8851-3b12-7c4fdbd27a12	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5672-8851-cffd-cbb65e2d5eec	SG	SGP	702	Singapore 	Singapur	\N
00040000-5672-8851-fce8-085f7b531df6	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5672-8851-7ab2-4940bac46f65	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5672-8851-55fe-d81ce0cb3dca	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5672-8851-d4b6-ea1f4e560458	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5672-8851-5838-d46c75832efa	SO	SOM	706	Somalia 	Somalija	\N
00040000-5672-8851-c4f4-f09453b9b503	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5672-8851-7721-72a362ec8a84	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5672-8851-07fc-46728a3a16da	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5672-8851-5698-13dc38117b4d	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5672-8851-a2a2-cf19d9a5a777	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5672-8851-b579-13c18c01562b	SD	SDN	729	Sudan 	Sudan	\N
00040000-5672-8851-3480-44a5469d12cb	SR	SUR	740	Suriname 	Surinam	\N
00040000-5672-8851-45af-83575d3e47af	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5672-8851-b66b-34a1d7aaaeb9	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5672-8851-9124-f8b76dc91293	SE	SWE	752	Sweden 	Švedska	\N
00040000-5672-8851-a3ca-a6c0734a3724	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5672-8851-b092-b6168a4dab83	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5672-8851-ce49-16ea7c58bfde	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5672-8851-ce21-a70ec97a8f9d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5672-8851-d5a1-9559b3bf2bf2	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5672-8851-a21d-2b061b3c94a0	TH	THA	764	Thailand 	Tajska	\N
00040000-5672-8851-0221-8086c0578c24	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5672-8851-34f6-2be77341b371	TG	TGO	768	Togo 	Togo	\N
00040000-5672-8851-f157-f18f6971e131	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5672-8851-c7cb-658e0ac9de21	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5672-8851-2380-95105752207f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5672-8851-eb0d-1aa915bc3548	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5672-8851-b504-c10e919dedfc	TR	TUR	792	Turkey 	Turčija	\N
00040000-5672-8851-5c98-0259c54ee7f6	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5672-8851-809c-33fa65bf5a54	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5672-8851-abc2-eb9e1ba1af83	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5672-8851-9b70-f36d53f3726e	UG	UGA	800	Uganda 	Uganda	\N
00040000-5672-8851-3997-0f75bc1f7118	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5672-8851-434b-b17113a1dbc5	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5672-8851-3b31-3c7774f9358b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5672-8851-bf61-a6aadaf490d6	US	USA	840	United States 	Združene države Amerike	\N
00040000-5672-8851-5b4c-c0ca385e609e	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5672-8851-841d-1eb66beee58f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5672-8851-f2f6-0b74a918c304	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5672-8851-c6b6-3496975bb497	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5672-8851-5d34-b4699e75b6ac	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5672-8851-985f-54bbd191a327	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5672-8851-a72b-9ace081022e2	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5672-8851-5cca-28856293ee86	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5672-8851-51ac-b6dde90cdc35	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5672-8851-1321-7a61f78cb7fb	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5672-8851-727c-212fb7c14d6a	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5672-8851-5b04-d5e25a70c488	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5672-8851-d0dd-256ce879d349	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3173 (class 0 OID 32500493)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5672-8854-34cd-eb74a72189f9	000e0000-5672-8854-d36e-24dbc24d08f4	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5672-8850-cd9e-4cb3f9b5d9a5	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5672-8854-225a-69fcab9dc3d6	000e0000-5672-8854-6327-255c4765320c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5672-8850-2332-3e3db1efdb9f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5672-8854-ee49-124c53e2e79e	000e0000-5672-8854-615d-cf908ffe1a45	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5672-8850-cd9e-4cb3f9b5d9a5	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5672-8854-ff82-a9bc03b924bb	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5672-8854-3aed-d0733a084bb9	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3158 (class 0 OID 32500293)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-5672-8854-74ec-dfce264d1bc4	000e0000-5672-8854-6327-255c4765320c	000c0000-5672-8854-70ae-11a8cf34109c	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5672-8850-5479-5c36c7a9dee4
000d0000-5672-8854-78fe-f6ca4b73b03d	000e0000-5672-8854-6327-255c4765320c	000c0000-5672-8854-a075-63029d0604ea	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-5672-8850-f6fb-61cca675293d
000d0000-5672-8854-905a-19771d974a97	000e0000-5672-8854-6327-255c4765320c	000c0000-5672-8854-b242-62786006f31e	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-5672-8850-35b5-a16e2fa18a42
000d0000-5672-8854-92f6-1e5f80e0ce07	000e0000-5672-8854-6327-255c4765320c	000c0000-5672-8854-7ddf-2978c3d502a0	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-5672-8850-d83d-0e4e6f670295
000d0000-5672-8854-b2ec-dcd3dde6052b	000e0000-5672-8854-6327-255c4765320c	000c0000-5672-8854-9c15-07dd430ac0a3	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-5672-8850-d83d-0e4e6f670295
000d0000-5672-8854-a676-242c6cc51064	000e0000-5672-8854-6327-255c4765320c	000c0000-5672-8854-d072-0ddbecf59f2c	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5672-8850-5479-5c36c7a9dee4
000d0000-5672-8854-845b-92a8e302a939	000e0000-5672-8854-6327-255c4765320c	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-5672-8850-5479-5c36c7a9dee4
000d0000-5672-8854-1d97-5581dd167a1c	000e0000-5672-8854-6327-255c4765320c	000c0000-5672-8854-7e11-8c056813e3ca	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-5672-8850-8793-8d1f55951a55
000d0000-5672-8854-f675-e2fdbc0548ae	000e0000-5672-8854-6327-255c4765320c	000c0000-5672-8854-70b8-381c60f98059	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-5672-8850-2789-54b31cf30c94
\.


--
-- TOC entry 3135 (class 0 OID 32500084)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 32500050)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 32500027)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5672-8854-e05f-b8e39d875b62	00080000-5672-8854-f8fc-ad4965f5fee7	00090000-5672-8854-cdeb-9ee6ffc2b76b	AK		igralka
\.


--
-- TOC entry 3147 (class 0 OID 32500207)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 32500763)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5672-8854-c37a-fac677b76ddf	00010000-5672-8852-8abc-47a463689257	\N	Prva mapa	Root mapa	2015-12-17 11:03:00	2015-12-17 11:03:00	R	\N	\N
\.


--
-- TOC entry 3185 (class 0 OID 32500776)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 32500798)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 32153619)
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
\.


--
-- TOC entry 3151 (class 0 OID 32500232)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 32499984)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5672-8852-ef2c-f6120aeabc64	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5672-8852-4c22-d5479130452a	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5672-8852-1e5d-14346259f09a	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5672-8852-714f-11fad8175da9	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5672-8852-bd5a-9686817313a3	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5672-8852-f7bc-3e4a5832065b	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5672-8852-44aa-e305b5f60608	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5672-8852-9aad-50566dcb8620	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5672-8852-70d4-4bc1282bcb69	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5672-8852-9eb6-bc4b1233c5ad	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5672-8852-03d1-ffbc899f7896	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5672-8852-dd25-713084db2229	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5672-8852-0c30-0e73eafd0eb9	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5672-8852-1b3d-43da44dc987d	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5672-8853-0e45-368721771f0d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5672-8853-5209-16fa4a437166	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5672-8853-31b1-7c91928e6e66	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5672-8853-378c-3e8975a4a4ee	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5672-8853-68a2-c6393a9db9da	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5672-8856-52a1-c4728a555d39	application.tenant.maticnopodjetje	string	s:36:"00080000-5672-8856-4962-23e65b52f50d";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3120 (class 0 OID 32499884)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5672-8853-7367-d57bed2dcd40	00000000-5672-8853-0e45-368721771f0d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5672-8853-f3e4-b14427d63ff3	00000000-5672-8853-0e45-368721771f0d	00010000-5672-8852-8abc-47a463689257	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5672-8853-6b3a-2623c812410b	00000000-5672-8853-5209-16fa4a437166	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3124 (class 0 OID 32499951)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5672-8854-c512-5e3ef33f02a7	\N	00100000-5672-8854-a81e-b8da47767037	00100000-5672-8854-176b-6f35ac17f0a6	01	Gledališče Nimbis
00410000-5672-8854-f1fb-cb2a2ea1e0a0	00410000-5672-8854-c512-5e3ef33f02a7	00100000-5672-8854-a81e-b8da47767037	00100000-5672-8854-176b-6f35ac17f0a6	02	Tehnika
\.


--
-- TOC entry 3121 (class 0 OID 32499895)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5672-8854-82d2-7c9f8e3db83e	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5672-8854-4e15-e62e3067e6f2	00010000-5672-8854-2ead-e4202615a8ed	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5672-8854-46bc-08e88199ee4c	00010000-5672-8854-d3db-a145387f76ea	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5672-8854-c85c-e1dd759e8b93	00010000-5672-8854-d0b8-924ee6cecb53	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5672-8854-a6db-a6d7566dea45	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5672-8854-f32a-b065aa9e6eb5	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5672-8854-3728-2cb64eb22cb1	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5672-8854-2c7b-1045826ada11	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5672-8854-cdeb-9ee6ffc2b76b	00010000-5672-8854-0e3d-0102f17ae853	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5672-8854-4402-4ef78e632931	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5672-8854-f8e6-3e0ba6c94c1d	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5672-8854-a3df-4a29d662ae2f	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5672-8854-56fb-27513b99d364	00010000-5672-8854-8c47-7e96257ad447	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5672-8854-3880-f3cf84dfc416	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5672-8854-9502-b758cb0c141e	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5672-8854-d4ed-98d36e23b854	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5672-8854-be04-b3c3778a8e00	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5672-8854-4e86-f92041786dca	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5672-8854-8f71-9e9863c9e68b	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5672-8854-44e4-37531d0d43a2	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5672-8854-2aca-aa0b2d3d2ac2	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3113 (class 0 OID 32499830)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5672-8851-6395-ca20548192f7	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5672-8851-f57e-b55d5afe7dd9	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5672-8851-cb90-b6f41512d41b	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5672-8851-3173-1fd3e4378485	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5672-8851-2ac6-3093522b63f6	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5672-8851-8d4d-95eabe854a81	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5672-8851-c4ae-5af1ed263577	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5672-8851-c09b-fe0fc50f7bf9	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5672-8851-d987-38334bb636c0	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5672-8851-d281-8ea8cb89867b	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5672-8851-86f5-9ee3edaf2ef8	Abonma-read	Abonma - branje	t
00030000-5672-8851-dcb3-6d40d558f97c	Abonma-write	Abonma - spreminjanje	t
00030000-5672-8851-c22a-e3aa47cea2ba	Alternacija-read	Alternacija - branje	t
00030000-5672-8851-e3a4-051b2229f950	Alternacija-write	Alternacija - spreminjanje	t
00030000-5672-8851-43ed-375c8a3bd1b2	Arhivalija-read	Arhivalija - branje	t
00030000-5672-8851-73cf-5537af3e1123	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5672-8851-e56f-3cd2c3acf2b6	AuthStorage-read	AuthStorage - branje	t
00030000-5672-8851-3f92-fc4011471110	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5672-8851-c2cf-a4d7378dabcc	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5672-8851-c978-520a96e71be7	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5672-8851-e4ff-5853e55d149d	Besedilo-read	Besedilo - branje	t
00030000-5672-8851-689b-dbb83fff5c30	Besedilo-write	Besedilo - spreminjanje	t
00030000-5672-8851-39cf-502a6a2ac36f	Dogodek-read	Dogodek - branje	t
00030000-5672-8851-d783-86a0187ba1dc	Dogodek-write	Dogodek - spreminjanje	t
00030000-5672-8851-55fa-026a3e923b9d	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5672-8851-1636-01e367c3d500	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5672-8851-4ea4-9fd3c5a373c7	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5672-8851-d606-285dc0fc0c89	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5672-8851-7938-f7ea4dd8c68a	DogodekTrait-read	DogodekTrait - branje	t
00030000-5672-8851-374c-ca0c652e074d	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5672-8851-f8df-5ddeb04e6ec9	DrugiVir-read	DrugiVir - branje	t
00030000-5672-8851-05ab-c37fd4c2512c	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5672-8851-3012-111b855215a4	Drzava-read	Drzava - branje	t
00030000-5672-8851-536d-5d6920ad05fd	Drzava-write	Drzava - spreminjanje	t
00030000-5672-8851-f63c-7b5dd8096eb1	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5672-8851-b86c-b3f3d0110604	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5672-8851-c3b7-bb84d01e7882	Funkcija-read	Funkcija - branje	t
00030000-5672-8851-c4c0-e8b1c49afd21	Funkcija-write	Funkcija - spreminjanje	t
00030000-5672-8851-c671-0deb63155493	Gostovanje-read	Gostovanje - branje	t
00030000-5672-8851-27d9-f14f02df59c9	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5672-8851-efc8-2ea0f56c6266	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5672-8851-c80c-4950e7aa3081	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5672-8851-03a1-d8470b597c3c	Kupec-read	Kupec - branje	t
00030000-5672-8851-6c1d-2df6b5b55ac9	Kupec-write	Kupec - spreminjanje	t
00030000-5672-8851-b2fb-167f014ba6f6	NacinPlacina-read	NacinPlacina - branje	t
00030000-5672-8851-df32-76cafc09a095	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5672-8851-ed62-44e830c4f994	Option-read	Option - branje	t
00030000-5672-8851-b543-94ff2281cc28	Option-write	Option - spreminjanje	t
00030000-5672-8851-7358-1dc6e27709ef	OptionValue-read	OptionValue - branje	t
00030000-5672-8851-b546-ffa5956ab8bc	OptionValue-write	OptionValue - spreminjanje	t
00030000-5672-8851-8158-f4953bba1242	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5672-8851-f272-aa52c5dddd4b	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5672-8851-246d-acffb83c25b8	Oseba-read	Oseba - branje	t
00030000-5672-8851-bfb9-073de1d3dac7	Oseba-write	Oseba - spreminjanje	t
00030000-5672-8851-d70b-2874ccc3c2b8	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5672-8851-0301-c05e89bac044	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5672-8851-0667-2cdce7faf069	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5672-8851-4d79-652ca0adfad2	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5672-8851-5aed-fa1ca0bacbfd	Pogodba-read	Pogodba - branje	t
00030000-5672-8851-656d-2763b57353ab	Pogodba-write	Pogodba - spreminjanje	t
00030000-5672-8851-c6e0-35ae3f67079a	Popa-read	Popa - branje	t
00030000-5672-8851-1691-a1e37d864ec9	Popa-write	Popa - spreminjanje	t
00030000-5672-8851-6c28-ab23f534f722	Posta-read	Posta - branje	t
00030000-5672-8851-5f44-8c63afd2adb1	Posta-write	Posta - spreminjanje	t
00030000-5672-8851-eb49-adf8b4363c54	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5672-8851-0eb3-f50598c9393f	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5672-8851-e0c0-78345e7c17e8	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5672-8851-728c-0414e8e546aa	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5672-8851-e6a0-025a5a8cb6e5	PostniNaslov-read	PostniNaslov - branje	t
00030000-5672-8851-e0e2-487f9b5a0261	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5672-8851-30ad-487aee917d5c	Praznik-read	Praznik - branje	t
00030000-5672-8851-59f5-545c41318d92	Praznik-write	Praznik - spreminjanje	t
00030000-5672-8851-f59d-5c7c5dbe8ec6	Predstava-read	Predstava - branje	t
00030000-5672-8851-53ff-6bcb4fae1e49	Predstava-write	Predstava - spreminjanje	t
00030000-5672-8851-fcb1-4d96119d9b65	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5672-8851-3760-4480501be8a8	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5672-8851-259e-70992dd4eeef	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5672-8851-8014-a3fbd8711188	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5672-8851-8ee0-8588baedf5a1	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5672-8851-7bef-bd7598bd8091	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5672-8851-a963-09b8726bc057	ProgramDela-read	ProgramDela - branje	t
00030000-5672-8851-e1e4-2d29759430e2	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5672-8851-8329-37e913286578	ProgramFestival-read	ProgramFestival - branje	t
00030000-5672-8851-15af-81f07c57caa7	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5672-8851-b649-dffd846f15bb	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5672-8851-e5f4-9663a2c305cd	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5672-8851-714a-749732fb1bc2	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5672-8851-25c9-c74d47298934	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5672-8851-2b3c-c2fec42b8adc	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5672-8851-43f2-d77567cd3b21	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5672-8851-34fd-68b2773cecb5	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5672-8851-2b14-8543e316af47	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5672-8851-f09f-88f1b573a249	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5672-8851-76f7-ef6047223b6e	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5672-8851-17bd-50335f767284	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5672-8851-5b48-ce7a70973990	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5672-8851-50cc-0fcc3748125e	ProgramRazno-read	ProgramRazno - branje	t
00030000-5672-8851-52d4-878131aa6742	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5672-8851-3314-138019a743ed	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5672-8851-36f0-cd3ed4aba473	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5672-8851-f02b-1dc9cef94e4a	Prostor-read	Prostor - branje	t
00030000-5672-8851-3788-61683d5ecd3a	Prostor-write	Prostor - spreminjanje	t
00030000-5672-8851-378f-ce36a09f339a	Racun-read	Racun - branje	t
00030000-5672-8851-5191-80a9520eea4e	Racun-write	Racun - spreminjanje	t
00030000-5672-8851-011b-7ba0dd78a112	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5672-8851-342e-be610caa82b9	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5672-8851-fd05-df5ee1e03b8a	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5672-8851-1d88-7cbee5c15789	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5672-8851-17ad-051b8d756da5	Rekvizit-read	Rekvizit - branje	t
00030000-5672-8851-f1c6-a5e6754f0706	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5672-8851-7c95-41b9361a7b4a	Revizija-read	Revizija - branje	t
00030000-5672-8851-d51f-fbe4dac76612	Revizija-write	Revizija - spreminjanje	t
00030000-5672-8851-cf0c-71847227d060	Rezervacija-read	Rezervacija - branje	t
00030000-5672-8851-533d-02ac7dc7445c	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5672-8851-5fd3-3dd9e91efdf0	SedezniRed-read	SedezniRed - branje	t
00030000-5672-8851-6552-a408eb4a8049	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5672-8851-5f07-7ed4f5281e85	Sedez-read	Sedez - branje	t
00030000-5672-8851-1150-4f524ad7c03e	Sedez-write	Sedez - spreminjanje	t
00030000-5672-8851-a31a-16b20ae78220	Sezona-read	Sezona - branje	t
00030000-5672-8851-9c8d-3e36b5200de9	Sezona-write	Sezona - spreminjanje	t
00030000-5672-8851-9171-51cc2483f18c	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5672-8851-1fe0-5806ac24ef5e	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5672-8851-3477-8a4ec99a97df	Telefonska-read	Telefonska - branje	t
00030000-5672-8851-f7bb-f5c83d21fcc2	Telefonska-write	Telefonska - spreminjanje	t
00030000-5672-8851-5d75-92412132fb00	TerminStoritve-read	TerminStoritve - branje	t
00030000-5672-8851-bde1-277dfbc6161a	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5672-8851-7122-bb98bad6d142	TipFunkcije-read	TipFunkcije - branje	t
00030000-5672-8851-9462-7a21a9b9c569	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5672-8851-d1cb-f204c10d4707	TipPopa-read	TipPopa - branje	t
00030000-5672-8851-4178-91febf5eeafa	TipPopa-write	TipPopa - spreminjanje	t
00030000-5672-8851-544e-fd5e2b66a8f7	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5672-8851-d5ed-2e45f6fbebfe	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5672-8851-2b96-0cf521547d89	TipVaje-read	TipVaje - branje	t
00030000-5672-8851-381f-54007ab24828	TipVaje-write	TipVaje - spreminjanje	t
00030000-5672-8851-bdde-f575e4f6f168	Trr-read	Trr - branje	t
00030000-5672-8851-0590-7b2d70ffca79	Trr-write	Trr - spreminjanje	t
00030000-5672-8851-13f0-f8b8f1296c06	Uprizoritev-read	Uprizoritev - branje	t
00030000-5672-8851-8ddd-bc405984a6df	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5672-8851-54ff-b05acad7801c	Vaja-read	Vaja - branje	t
00030000-5672-8851-0700-26fbf708a6c0	Vaja-write	Vaja - spreminjanje	t
00030000-5672-8851-c9ec-2f84c74e4f1f	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5672-8851-5e58-0ba6d05576eb	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5672-8851-5268-0af16a1cacad	VrstaStroska-read	VrstaStroska - branje	t
00030000-5672-8851-9a11-16ec4ac464f5	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5672-8851-2330-9dfd342285bd	Zaposlitev-read	Zaposlitev - branje	t
00030000-5672-8851-b33a-6b292358bab2	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5672-8851-9fbf-786adeb1fcad	Zasedenost-read	Zasedenost - branje	t
00030000-5672-8851-0f37-ad55926800b3	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5672-8851-d322-5d2b1d761031	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5672-8851-cf84-40092d1a82f6	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5672-8851-9ca7-0a8c935eb3ae	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5672-8851-4a71-98d041da1f9b	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5672-8851-306c-07882affea66	Job-read	Branje opravil - samo zase - branje	t
00030000-5672-8851-29db-737e92a9ccae	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5672-8851-a60f-0c75b0c6ae7f	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5672-8851-07e2-aa7d645ae6b3	Report-read	Report - branje	t
00030000-5672-8851-7a34-f8f8d33cd920	Report-write	Report - spreminjanje	t
00030000-5672-8851-5945-db066a3fcd5c	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5672-8851-3d82-2b91a839491b	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5672-8851-c7d6-4b70622a4888	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5672-8851-7c0b-337e9c28050c	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5672-8851-cfef-cf605096ab5e	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5672-8851-8928-97b34d216f25	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5672-8851-81f1-e41a0c06036f	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5672-8851-7d45-af2f8aa98616	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5672-8851-a0d2-f55158453cf0	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5672-8851-cfd7-0c2c17c13d4c	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5672-8851-cb24-e2c0cfe1db06	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5672-8851-0808-2f6e28c89045	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5672-8851-7e85-c9accf4535c9	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5672-8851-7d53-316d8b19a452	Datoteka-write	Datoteka - spreminjanje	t
00030000-5672-8851-f2a3-83e57890dfed	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3115 (class 0 OID 32499849)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5672-8851-3b2c-f6947b533ebf	00030000-5672-8851-f57e-b55d5afe7dd9
00020000-5672-8851-3b2c-f6947b533ebf	00030000-5672-8851-6395-ca20548192f7
00020000-5672-8851-d6d3-3726b0bdc402	00030000-5672-8851-3012-111b855215a4
00020000-5672-8851-b91c-6cac479bd629	00030000-5672-8851-c978-520a96e71be7
00020000-5672-8851-b91c-6cac479bd629	00030000-5672-8851-689b-dbb83fff5c30
00020000-5672-8851-b91c-6cac479bd629	00030000-5672-8851-7d53-316d8b19a452
00020000-5672-8851-b91c-6cac479bd629	00030000-5672-8851-bfb9-073de1d3dac7
00020000-5672-8851-b91c-6cac479bd629	00030000-5672-8851-7d45-af2f8aa98616
00020000-5672-8851-b91c-6cac479bd629	00030000-5672-8851-cfd7-0c2c17c13d4c
00020000-5672-8851-b91c-6cac479bd629	00030000-5672-8851-c2cf-a4d7378dabcc
00020000-5672-8851-b91c-6cac479bd629	00030000-5672-8851-e4ff-5853e55d149d
00020000-5672-8851-b91c-6cac479bd629	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8851-b91c-6cac479bd629	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-b91c-6cac479bd629	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-b91c-6cac479bd629	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8851-4286-b1091313adf7	00030000-5672-8851-c2cf-a4d7378dabcc
00020000-5672-8851-4286-b1091313adf7	00030000-5672-8851-e4ff-5853e55d149d
00020000-5672-8851-4286-b1091313adf7	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8851-4286-b1091313adf7	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-4286-b1091313adf7	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8851-4286-b1091313adf7	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-94c4-ec449320d154	00030000-5672-8851-2330-9dfd342285bd
00020000-5672-8851-94c4-ec449320d154	00030000-5672-8851-b33a-6b292358bab2
00020000-5672-8851-94c4-ec449320d154	00030000-5672-8851-8d4d-95eabe854a81
00020000-5672-8851-94c4-ec449320d154	00030000-5672-8851-2ac6-3093522b63f6
00020000-5672-8851-94c4-ec449320d154	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-94c4-ec449320d154	00030000-5672-8851-bfb9-073de1d3dac7
00020000-5672-8851-94c4-ec449320d154	00030000-5672-8851-8158-f4953bba1242
00020000-5672-8851-b37f-0ae489c8905c	00030000-5672-8851-2330-9dfd342285bd
00020000-5672-8851-b37f-0ae489c8905c	00030000-5672-8851-8d4d-95eabe854a81
00020000-5672-8851-b37f-0ae489c8905c	00030000-5672-8851-8158-f4953bba1242
00020000-5672-8851-faad-7bfed5678218	00030000-5672-8851-bfb9-073de1d3dac7
00020000-5672-8851-faad-7bfed5678218	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-faad-7bfed5678218	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8851-faad-7bfed5678218	00030000-5672-8851-7d53-316d8b19a452
00020000-5672-8851-faad-7bfed5678218	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8851-faad-7bfed5678218	00030000-5672-8851-cfd7-0c2c17c13d4c
00020000-5672-8851-faad-7bfed5678218	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-faad-7bfed5678218	00030000-5672-8851-7d45-af2f8aa98616
00020000-5672-8851-ca89-b3e274ccfe2f	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-ca89-b3e274ccfe2f	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8851-ca89-b3e274ccfe2f	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8851-ca89-b3e274ccfe2f	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-ed5c-e90c921465e0	00030000-5672-8851-bfb9-073de1d3dac7
00020000-5672-8851-ed5c-e90c921465e0	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-ed5c-e90c921465e0	00030000-5672-8851-8d4d-95eabe854a81
00020000-5672-8851-ed5c-e90c921465e0	00030000-5672-8851-2ac6-3093522b63f6
00020000-5672-8851-ed5c-e90c921465e0	00030000-5672-8851-bdde-f575e4f6f168
00020000-5672-8851-ed5c-e90c921465e0	00030000-5672-8851-0590-7b2d70ffca79
00020000-5672-8851-ed5c-e90c921465e0	00030000-5672-8851-e6a0-025a5a8cb6e5
00020000-5672-8851-ed5c-e90c921465e0	00030000-5672-8851-e0e2-487f9b5a0261
00020000-5672-8851-ed5c-e90c921465e0	00030000-5672-8851-3477-8a4ec99a97df
00020000-5672-8851-ed5c-e90c921465e0	00030000-5672-8851-f7bb-f5c83d21fcc2
00020000-5672-8851-ed5c-e90c921465e0	00030000-5672-8851-3012-111b855215a4
00020000-5672-8851-ed5c-e90c921465e0	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-1f1c-9175ddab593b	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-1f1c-9175ddab593b	00030000-5672-8851-8d4d-95eabe854a81
00020000-5672-8851-1f1c-9175ddab593b	00030000-5672-8851-bdde-f575e4f6f168
00020000-5672-8851-1f1c-9175ddab593b	00030000-5672-8851-e6a0-025a5a8cb6e5
00020000-5672-8851-1f1c-9175ddab593b	00030000-5672-8851-3477-8a4ec99a97df
00020000-5672-8851-1f1c-9175ddab593b	00030000-5672-8851-3012-111b855215a4
00020000-5672-8851-1f1c-9175ddab593b	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-3477-8a4ec99a97df
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-e6a0-025a5a8cb6e5
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-bdde-f575e4f6f168
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-c6e0-35ae3f67079a
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-efc8-2ea0f56c6266
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-8ee0-8588baedf5a1
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-f7bb-f5c83d21fcc2
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-e0e2-487f9b5a0261
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-7d45-af2f8aa98616
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-0590-7b2d70ffca79
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-1691-a1e37d864ec9
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-7d53-316d8b19a452
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-cfd7-0c2c17c13d4c
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-c80c-4950e7aa3081
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-7bef-bd7598bd8091
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-3012-111b855215a4
00020000-5672-8851-93c9-9bf16050a2d1	00030000-5672-8851-d1cb-f204c10d4707
00020000-5672-8851-08ca-3cb41f443a79	00030000-5672-8851-3477-8a4ec99a97df
00020000-5672-8851-08ca-3cb41f443a79	00030000-5672-8851-e6a0-025a5a8cb6e5
00020000-5672-8851-08ca-3cb41f443a79	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-08ca-3cb41f443a79	00030000-5672-8851-bdde-f575e4f6f168
00020000-5672-8851-08ca-3cb41f443a79	00030000-5672-8851-c6e0-35ae3f67079a
00020000-5672-8851-08ca-3cb41f443a79	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8851-08ca-3cb41f443a79	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8851-08ca-3cb41f443a79	00030000-5672-8851-efc8-2ea0f56c6266
00020000-5672-8851-08ca-3cb41f443a79	00030000-5672-8851-8ee0-8588baedf5a1
00020000-5672-8851-08ca-3cb41f443a79	00030000-5672-8851-3012-111b855215a4
00020000-5672-8851-08ca-3cb41f443a79	00030000-5672-8851-d1cb-f204c10d4707
00020000-5672-8851-8cf8-f4f562613429	00030000-5672-8851-d1cb-f204c10d4707
00020000-5672-8851-8cf8-f4f562613429	00030000-5672-8851-4178-91febf5eeafa
00020000-5672-8851-52d6-95ceca77f6fe	00030000-5672-8851-d1cb-f204c10d4707
00020000-5672-8851-2702-f1b55900a795	00030000-5672-8851-6c28-ab23f534f722
00020000-5672-8851-2702-f1b55900a795	00030000-5672-8851-5f44-8c63afd2adb1
00020000-5672-8851-4835-75c4b0ec4991	00030000-5672-8851-6c28-ab23f534f722
00020000-5672-8851-c52f-362b5a2c223e	00030000-5672-8851-3012-111b855215a4
00020000-5672-8851-c52f-362b5a2c223e	00030000-5672-8851-536d-5d6920ad05fd
00020000-5672-8851-9e62-6ac8e92f19ea	00030000-5672-8851-3012-111b855215a4
00020000-5672-8851-af6c-cc3cd4d05ad6	00030000-5672-8851-9ca7-0a8c935eb3ae
00020000-5672-8851-af6c-cc3cd4d05ad6	00030000-5672-8851-4a71-98d041da1f9b
00020000-5672-8851-c09a-cdf4832e3518	00030000-5672-8851-9ca7-0a8c935eb3ae
00020000-5672-8851-4d56-16911065cfa8	00030000-5672-8851-d322-5d2b1d761031
00020000-5672-8851-4d56-16911065cfa8	00030000-5672-8851-cf84-40092d1a82f6
00020000-5672-8851-d8e5-2f92f1570c24	00030000-5672-8851-d322-5d2b1d761031
00020000-5672-8851-05bb-d93fd4ffc5c7	00030000-5672-8851-86f5-9ee3edaf2ef8
00020000-5672-8851-05bb-d93fd4ffc5c7	00030000-5672-8851-dcb3-6d40d558f97c
00020000-5672-8851-b3f2-1fdc581a6b2a	00030000-5672-8851-86f5-9ee3edaf2ef8
00020000-5672-8851-a83b-e17ff6e7a4a4	00030000-5672-8851-f02b-1dc9cef94e4a
00020000-5672-8851-a83b-e17ff6e7a4a4	00030000-5672-8851-3788-61683d5ecd3a
00020000-5672-8851-a83b-e17ff6e7a4a4	00030000-5672-8851-c6e0-35ae3f67079a
00020000-5672-8851-a83b-e17ff6e7a4a4	00030000-5672-8851-e6a0-025a5a8cb6e5
00020000-5672-8851-a83b-e17ff6e7a4a4	00030000-5672-8851-e0e2-487f9b5a0261
00020000-5672-8851-a83b-e17ff6e7a4a4	00030000-5672-8851-3012-111b855215a4
00020000-5672-8851-ceb2-c6349f24d5ff	00030000-5672-8851-f02b-1dc9cef94e4a
00020000-5672-8851-ceb2-c6349f24d5ff	00030000-5672-8851-c6e0-35ae3f67079a
00020000-5672-8851-ceb2-c6349f24d5ff	00030000-5672-8851-e6a0-025a5a8cb6e5
00020000-5672-8851-d792-2d3eefafc427	00030000-5672-8851-5268-0af16a1cacad
00020000-5672-8851-d792-2d3eefafc427	00030000-5672-8851-9a11-16ec4ac464f5
00020000-5672-8851-b286-8ee0062b87d8	00030000-5672-8851-5268-0af16a1cacad
00020000-5672-8851-0afa-33741a2f2b9c	00030000-5672-8851-f272-aa52c5dddd4b
00020000-5672-8851-0afa-33741a2f2b9c	00030000-5672-8851-8158-f4953bba1242
00020000-5672-8851-0afa-33741a2f2b9c	00030000-5672-8851-2330-9dfd342285bd
00020000-5672-8851-0afa-33741a2f2b9c	00030000-5672-8851-7d53-316d8b19a452
00020000-5672-8851-0afa-33741a2f2b9c	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8851-0afa-33741a2f2b9c	00030000-5672-8851-7d45-af2f8aa98616
00020000-5672-8851-0afa-33741a2f2b9c	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-0afa-33741a2f2b9c	00030000-5672-8851-cfd7-0c2c17c13d4c
00020000-5672-8851-0afa-33741a2f2b9c	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8851-7270-21f0eaddbe40	00030000-5672-8851-8158-f4953bba1242
00020000-5672-8851-7270-21f0eaddbe40	00030000-5672-8851-2330-9dfd342285bd
00020000-5672-8851-7270-21f0eaddbe40	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8851-7270-21f0eaddbe40	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-7270-21f0eaddbe40	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8851-f9ab-8ea34ebad4da	00030000-5672-8851-2b96-0cf521547d89
00020000-5672-8851-f9ab-8ea34ebad4da	00030000-5672-8851-381f-54007ab24828
00020000-5672-8851-c3f5-9afbecb49cb9	00030000-5672-8851-2b96-0cf521547d89
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-c4ae-5af1ed263577
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-c09b-fe0fc50f7bf9
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-a963-09b8726bc057
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-e1e4-2d29759430e2
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-8329-37e913286578
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-15af-81f07c57caa7
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-b649-dffd846f15bb
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-e5f4-9663a2c305cd
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-714a-749732fb1bc2
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-25c9-c74d47298934
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-2b3c-c2fec42b8adc
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-43f2-d77567cd3b21
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-34fd-68b2773cecb5
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-2b14-8543e316af47
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-f09f-88f1b573a249
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-76f7-ef6047223b6e
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-17bd-50335f767284
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-5b48-ce7a70973990
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-50cc-0fcc3748125e
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-52d4-878131aa6742
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-3314-138019a743ed
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-36f0-cd3ed4aba473
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-8014-a3fbd8711188
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-05ab-c37fd4c2512c
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-0eb3-f50598c9393f
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-29db-737e92a9ccae
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-f8df-5ddeb04e6ec9
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-259e-70992dd4eeef
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-8ee0-8588baedf5a1
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-eb49-adf8b4363c54
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-5268-0af16a1cacad
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-13f0-f8b8f1296c06
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-9171-51cc2483f18c
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-c3b7-bb84d01e7882
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-c22a-e3aa47cea2ba
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-7122-bb98bad6d142
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-5aed-fa1ca0bacbfd
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-3012-111b855215a4
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-c6e0-35ae3f67079a
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-7d53-316d8b19a452
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-7d45-af2f8aa98616
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-cfd7-0c2c17c13d4c
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-306c-07882affea66
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-e979-569e8655cb13	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8851-aa18-365f218086af	00030000-5672-8851-a963-09b8726bc057
00020000-5672-8851-aa18-365f218086af	00030000-5672-8851-8329-37e913286578
00020000-5672-8851-aa18-365f218086af	00030000-5672-8851-b649-dffd846f15bb
00020000-5672-8851-aa18-365f218086af	00030000-5672-8851-714a-749732fb1bc2
00020000-5672-8851-aa18-365f218086af	00030000-5672-8851-2b3c-c2fec42b8adc
00020000-5672-8851-aa18-365f218086af	00030000-5672-8851-34fd-68b2773cecb5
00020000-5672-8851-aa18-365f218086af	00030000-5672-8851-f09f-88f1b573a249
00020000-5672-8851-aa18-365f218086af	00030000-5672-8851-17bd-50335f767284
00020000-5672-8851-aa18-365f218086af	00030000-5672-8851-50cc-0fcc3748125e
00020000-5672-8851-aa18-365f218086af	00030000-5672-8851-3314-138019a743ed
00020000-5672-8851-aa18-365f218086af	00030000-5672-8851-259e-70992dd4eeef
00020000-5672-8851-aa18-365f218086af	00030000-5672-8851-f8df-5ddeb04e6ec9
00020000-5672-8851-aa18-365f218086af	00030000-5672-8851-eb49-adf8b4363c54
00020000-5672-8851-aa18-365f218086af	00030000-5672-8851-3012-111b855215a4
00020000-5672-8851-aa18-365f218086af	00030000-5672-8851-306c-07882affea66
00020000-5672-8851-aa18-365f218086af	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8851-aa18-365f218086af	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-aa18-365f218086af	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8851-521e-2864c30acd25	00030000-5672-8851-13f0-f8b8f1296c06
00020000-5672-8851-521e-2864c30acd25	00030000-5672-8851-8ddd-bc405984a6df
00020000-5672-8851-521e-2864c30acd25	00030000-5672-8851-c22a-e3aa47cea2ba
00020000-5672-8851-521e-2864c30acd25	00030000-5672-8851-e3a4-051b2229f950
00020000-5672-8851-521e-2864c30acd25	00030000-5672-8851-d987-38334bb636c0
00020000-5672-8851-521e-2864c30acd25	00030000-5672-8851-e4ff-5853e55d149d
00020000-5672-8851-521e-2864c30acd25	00030000-5672-8851-c3b7-bb84d01e7882
00020000-5672-8851-521e-2864c30acd25	00030000-5672-8851-c4c0-e8b1c49afd21
00020000-5672-8851-521e-2864c30acd25	00030000-5672-8851-d281-8ea8cb89867b
00020000-5672-8851-521e-2864c30acd25	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-521e-2864c30acd25	00030000-5672-8851-8ee0-8588baedf5a1
00020000-5672-8851-521e-2864c30acd25	00030000-5672-8851-7122-bb98bad6d142
00020000-5672-8851-521e-2864c30acd25	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8851-521e-2864c30acd25	00030000-5672-8851-7d53-316d8b19a452
00020000-5672-8851-521e-2864c30acd25	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-521e-2864c30acd25	00030000-5672-8851-7d45-af2f8aa98616
00020000-5672-8851-521e-2864c30acd25	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8851-521e-2864c30acd25	00030000-5672-8851-cfd7-0c2c17c13d4c
00020000-5672-8851-f03f-1a135a52b474	00030000-5672-8851-13f0-f8b8f1296c06
00020000-5672-8851-f03f-1a135a52b474	00030000-5672-8851-c22a-e3aa47cea2ba
00020000-5672-8851-f03f-1a135a52b474	00030000-5672-8851-e4ff-5853e55d149d
00020000-5672-8851-f03f-1a135a52b474	00030000-5672-8851-c3b7-bb84d01e7882
00020000-5672-8851-f03f-1a135a52b474	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-f03f-1a135a52b474	00030000-5672-8851-8ee0-8588baedf5a1
00020000-5672-8851-f03f-1a135a52b474	00030000-5672-8851-7122-bb98bad6d142
00020000-5672-8851-f03f-1a135a52b474	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8851-f03f-1a135a52b474	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-f03f-1a135a52b474	00030000-5672-8851-7d45-af2f8aa98616
00020000-5672-8851-f03f-1a135a52b474	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8851-c253-05cd4a065c9e	00030000-5672-8851-c22a-e3aa47cea2ba
00020000-5672-8851-c253-05cd4a065c9e	00030000-5672-8851-e3a4-051b2229f950
00020000-5672-8851-c253-05cd4a065c9e	00030000-5672-8851-c3b7-bb84d01e7882
00020000-5672-8851-c253-05cd4a065c9e	00030000-5672-8851-c4c0-e8b1c49afd21
00020000-5672-8851-c253-05cd4a065c9e	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-c253-05cd4a065c9e	00030000-5672-8851-7122-bb98bad6d142
00020000-5672-8851-c253-05cd4a065c9e	00030000-5672-8851-13f0-f8b8f1296c06
00020000-5672-8851-c253-05cd4a065c9e	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-bb2f-4552d70cc9b1	00030000-5672-8851-c22a-e3aa47cea2ba
00020000-5672-8851-bb2f-4552d70cc9b1	00030000-5672-8851-e3a4-051b2229f950
00020000-5672-8851-bb2f-4552d70cc9b1	00030000-5672-8851-d987-38334bb636c0
00020000-5672-8851-bb2f-4552d70cc9b1	00030000-5672-8851-c3b7-bb84d01e7882
00020000-5672-8851-bb2f-4552d70cc9b1	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-bb2f-4552d70cc9b1	00030000-5672-8851-8d4d-95eabe854a81
00020000-5672-8851-bb2f-4552d70cc9b1	00030000-5672-8851-2ac6-3093522b63f6
00020000-5672-8851-bb2f-4552d70cc9b1	00030000-5672-8851-5aed-fa1ca0bacbfd
00020000-5672-8851-bb2f-4552d70cc9b1	00030000-5672-8851-656d-2763b57353ab
00020000-5672-8851-bb2f-4552d70cc9b1	00030000-5672-8851-c6e0-35ae3f67079a
00020000-5672-8851-bb2f-4552d70cc9b1	00030000-5672-8851-8ee0-8588baedf5a1
00020000-5672-8851-bb2f-4552d70cc9b1	00030000-5672-8851-9171-51cc2483f18c
00020000-5672-8851-bb2f-4552d70cc9b1	00030000-5672-8851-1fe0-5806ac24ef5e
00020000-5672-8851-bb2f-4552d70cc9b1	00030000-5672-8851-7122-bb98bad6d142
00020000-5672-8851-bb2f-4552d70cc9b1	00030000-5672-8851-bdde-f575e4f6f168
00020000-5672-8851-bb2f-4552d70cc9b1	00030000-5672-8851-13f0-f8b8f1296c06
00020000-5672-8851-bb2f-4552d70cc9b1	00030000-5672-8851-2330-9dfd342285bd
00020000-5672-8851-e3e7-9142cc60e059	00030000-5672-8851-c22a-e3aa47cea2ba
00020000-5672-8851-e3e7-9142cc60e059	00030000-5672-8851-c3b7-bb84d01e7882
00020000-5672-8851-e3e7-9142cc60e059	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-e3e7-9142cc60e059	00030000-5672-8851-8d4d-95eabe854a81
00020000-5672-8851-e3e7-9142cc60e059	00030000-5672-8851-5aed-fa1ca0bacbfd
00020000-5672-8851-e3e7-9142cc60e059	00030000-5672-8851-c6e0-35ae3f67079a
00020000-5672-8851-e3e7-9142cc60e059	00030000-5672-8851-8ee0-8588baedf5a1
00020000-5672-8851-e3e7-9142cc60e059	00030000-5672-8851-9171-51cc2483f18c
00020000-5672-8851-e3e7-9142cc60e059	00030000-5672-8851-7122-bb98bad6d142
00020000-5672-8851-e3e7-9142cc60e059	00030000-5672-8851-bdde-f575e4f6f168
00020000-5672-8851-e3e7-9142cc60e059	00030000-5672-8851-13f0-f8b8f1296c06
00020000-5672-8851-e3e7-9142cc60e059	00030000-5672-8851-2330-9dfd342285bd
00020000-5672-8851-19b7-814dbcda8545	00030000-5672-8851-9171-51cc2483f18c
00020000-5672-8851-19b7-814dbcda8545	00030000-5672-8851-13f0-f8b8f1296c06
00020000-5672-8851-19b7-814dbcda8545	00030000-5672-8851-c3b7-bb84d01e7882
00020000-5672-8851-19b7-814dbcda8545	00030000-5672-8851-5aed-fa1ca0bacbfd
00020000-5672-8851-19b7-814dbcda8545	00030000-5672-8851-8ee0-8588baedf5a1
00020000-5672-8851-19b7-814dbcda8545	00030000-5672-8851-7122-bb98bad6d142
00020000-5672-8851-19b7-814dbcda8545	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-f9f8-3cbfebfdd38d	00030000-5672-8851-9171-51cc2483f18c
00020000-5672-8851-f9f8-3cbfebfdd38d	00030000-5672-8851-1fe0-5806ac24ef5e
00020000-5672-8851-f9f8-3cbfebfdd38d	00030000-5672-8851-13f0-f8b8f1296c06
00020000-5672-8851-f9f8-3cbfebfdd38d	00030000-5672-8851-c6e0-35ae3f67079a
00020000-5672-8851-19de-01faa7d3454f	00030000-5672-8851-9171-51cc2483f18c
00020000-5672-8851-19de-01faa7d3454f	00030000-5672-8851-13f0-f8b8f1296c06
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-86f5-9ee3edaf2ef8
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-c22a-e3aa47cea2ba
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-e3a4-051b2229f950
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-d987-38334bb636c0
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-c2cf-a4d7378dabcc
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-c978-520a96e71be7
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-e4ff-5853e55d149d
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-689b-dbb83fff5c30
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-7d53-316d8b19a452
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-f8df-5ddeb04e6ec9
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-05ab-c37fd4c2512c
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-3012-111b855215a4
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-c3b7-bb84d01e7882
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-c4c0-e8b1c49afd21
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-d281-8ea8cb89867b
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-306c-07882affea66
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-29db-737e92a9ccae
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-efc8-2ea0f56c6266
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-8158-f4953bba1242
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-bfb9-073de1d3dac7
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-8d4d-95eabe854a81
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-2ac6-3093522b63f6
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-5aed-fa1ca0bacbfd
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-656d-2763b57353ab
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-c6e0-35ae3f67079a
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-6c28-ab23f534f722
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-eb49-adf8b4363c54
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-0eb3-f50598c9393f
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-e6a0-025a5a8cb6e5
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-259e-70992dd4eeef
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-8014-a3fbd8711188
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-8ee0-8588baedf5a1
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-c4ae-5af1ed263577
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-a963-09b8726bc057
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-c09b-fe0fc50f7bf9
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-e1e4-2d29759430e2
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-8329-37e913286578
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-15af-81f07c57caa7
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-b649-dffd846f15bb
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-e5f4-9663a2c305cd
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-714a-749732fb1bc2
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-25c9-c74d47298934
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-2b3c-c2fec42b8adc
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-43f2-d77567cd3b21
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-34fd-68b2773cecb5
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-2b14-8543e316af47
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-f09f-88f1b573a249
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-76f7-ef6047223b6e
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-17bd-50335f767284
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-5b48-ce7a70973990
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-50cc-0fcc3748125e
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-52d4-878131aa6742
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-3314-138019a743ed
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-36f0-cd3ed4aba473
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-f02b-1dc9cef94e4a
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-9171-51cc2483f18c
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-1fe0-5806ac24ef5e
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-3477-8a4ec99a97df
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-7122-bb98bad6d142
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-d1cb-f204c10d4707
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-2b96-0cf521547d89
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-bdde-f575e4f6f168
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-13f0-f8b8f1296c06
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-8ddd-bc405984a6df
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-5268-0af16a1cacad
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-cfd7-0c2c17c13d4c
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-7d45-af2f8aa98616
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-2330-9dfd342285bd
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-d322-5d2b1d761031
00020000-5672-8851-2c43-6b9c04b48c80	00030000-5672-8851-9ca7-0a8c935eb3ae
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-86f5-9ee3edaf2ef8
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-c22a-e3aa47cea2ba
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-c2cf-a4d7378dabcc
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-c978-520a96e71be7
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-e4ff-5853e55d149d
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-689b-dbb83fff5c30
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-7d53-316d8b19a452
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-3012-111b855215a4
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-c3b7-bb84d01e7882
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-efc8-2ea0f56c6266
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-8158-f4953bba1242
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-bfb9-073de1d3dac7
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-8d4d-95eabe854a81
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-c6e0-35ae3f67079a
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-6c28-ab23f534f722
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-e6a0-025a5a8cb6e5
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-8ee0-8588baedf5a1
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-f02b-1dc9cef94e4a
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-3477-8a4ec99a97df
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-7122-bb98bad6d142
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-d1cb-f204c10d4707
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-2b96-0cf521547d89
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-bdde-f575e4f6f168
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-13f0-f8b8f1296c06
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-5268-0af16a1cacad
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-cfd7-0c2c17c13d4c
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-7d45-af2f8aa98616
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-2330-9dfd342285bd
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-d322-5d2b1d761031
00020000-5672-8851-c49c-695ae9c81b14	00030000-5672-8851-9ca7-0a8c935eb3ae
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-86f5-9ee3edaf2ef8
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-c22a-e3aa47cea2ba
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-e3a4-051b2229f950
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-d987-38334bb636c0
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-c2cf-a4d7378dabcc
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-c978-520a96e71be7
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-e4ff-5853e55d149d
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-689b-dbb83fff5c30
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-7d53-316d8b19a452
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-3012-111b855215a4
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-c3b7-bb84d01e7882
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-c4c0-e8b1c49afd21
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-d281-8ea8cb89867b
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-efc8-2ea0f56c6266
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-8158-f4953bba1242
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-bfb9-073de1d3dac7
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-8d4d-95eabe854a81
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-c6e0-35ae3f67079a
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-6c28-ab23f534f722
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-e6a0-025a5a8cb6e5
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-8ee0-8588baedf5a1
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-f02b-1dc9cef94e4a
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-3477-8a4ec99a97df
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-7122-bb98bad6d142
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-d1cb-f204c10d4707
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-2b96-0cf521547d89
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-bdde-f575e4f6f168
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-13f0-f8b8f1296c06
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-8ddd-bc405984a6df
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-5268-0af16a1cacad
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-cfd7-0c2c17c13d4c
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-7d45-af2f8aa98616
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-2330-9dfd342285bd
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-d322-5d2b1d761031
00020000-5672-8851-e596-edea836b8f3b	00030000-5672-8851-9ca7-0a8c935eb3ae
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-c22a-e3aa47cea2ba
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-e3a4-051b2229f950
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-d987-38334bb636c0
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-c2cf-a4d7378dabcc
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-c978-520a96e71be7
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-e4ff-5853e55d149d
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-689b-dbb83fff5c30
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-7d53-316d8b19a452
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-f8df-5ddeb04e6ec9
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-05ab-c37fd4c2512c
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-3012-111b855215a4
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-c3b7-bb84d01e7882
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-c4c0-e8b1c49afd21
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-d281-8ea8cb89867b
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-306c-07882affea66
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-29db-737e92a9ccae
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-efc8-2ea0f56c6266
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-c80c-4950e7aa3081
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-8158-f4953bba1242
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-bfb9-073de1d3dac7
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-8d4d-95eabe854a81
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-2ac6-3093522b63f6
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-5aed-fa1ca0bacbfd
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-656d-2763b57353ab
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-c6e0-35ae3f67079a
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-1691-a1e37d864ec9
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-6c28-ab23f534f722
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-eb49-adf8b4363c54
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-0eb3-f50598c9393f
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-e6a0-025a5a8cb6e5
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-e0e2-487f9b5a0261
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-259e-70992dd4eeef
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-8014-a3fbd8711188
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-8ee0-8588baedf5a1
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-7bef-bd7598bd8091
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-c4ae-5af1ed263577
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-a963-09b8726bc057
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-c09b-fe0fc50f7bf9
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-e1e4-2d29759430e2
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-8329-37e913286578
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-15af-81f07c57caa7
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-b649-dffd846f15bb
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-e5f4-9663a2c305cd
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-714a-749732fb1bc2
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-25c9-c74d47298934
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-2b3c-c2fec42b8adc
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-43f2-d77567cd3b21
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-34fd-68b2773cecb5
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-2b14-8543e316af47
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-f09f-88f1b573a249
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-76f7-ef6047223b6e
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-17bd-50335f767284
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-5b48-ce7a70973990
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-50cc-0fcc3748125e
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-52d4-878131aa6742
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-3314-138019a743ed
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-36f0-cd3ed4aba473
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-f02b-1dc9cef94e4a
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-9171-51cc2483f18c
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-1fe0-5806ac24ef5e
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-3477-8a4ec99a97df
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-f7bb-f5c83d21fcc2
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-7122-bb98bad6d142
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-d1cb-f204c10d4707
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-bdde-f575e4f6f168
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-0590-7b2d70ffca79
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-13f0-f8b8f1296c06
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-8ddd-bc405984a6df
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-5268-0af16a1cacad
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-cfd7-0c2c17c13d4c
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-7d45-af2f8aa98616
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-2330-9dfd342285bd
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-b33a-6b292358bab2
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-d322-5d2b1d761031
00020000-5672-8851-9505-7f3ed0826b27	00030000-5672-8851-9ca7-0a8c935eb3ae
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-86f5-9ee3edaf2ef8
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-c22a-e3aa47cea2ba
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-e3a4-051b2229f950
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-d987-38334bb636c0
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-c2cf-a4d7378dabcc
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-c978-520a96e71be7
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-e4ff-5853e55d149d
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-689b-dbb83fff5c30
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-7d53-316d8b19a452
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-3012-111b855215a4
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-c3b7-bb84d01e7882
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-c4c0-e8b1c49afd21
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-d281-8ea8cb89867b
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-efc8-2ea0f56c6266
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-c80c-4950e7aa3081
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-8158-f4953bba1242
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-bfb9-073de1d3dac7
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-8d4d-95eabe854a81
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-2ac6-3093522b63f6
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-5aed-fa1ca0bacbfd
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-c6e0-35ae3f67079a
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-1691-a1e37d864ec9
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-6c28-ab23f534f722
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-e6a0-025a5a8cb6e5
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-e0e2-487f9b5a0261
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-8ee0-8588baedf5a1
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-7bef-bd7598bd8091
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-f02b-1dc9cef94e4a
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-9171-51cc2483f18c
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-3477-8a4ec99a97df
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-f7bb-f5c83d21fcc2
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-7122-bb98bad6d142
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-d1cb-f204c10d4707
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-2b96-0cf521547d89
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-bdde-f575e4f6f168
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-0590-7b2d70ffca79
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-13f0-f8b8f1296c06
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-8ddd-bc405984a6df
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-5268-0af16a1cacad
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-cfd7-0c2c17c13d4c
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-7d45-af2f8aa98616
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-2330-9dfd342285bd
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-b33a-6b292358bab2
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-d322-5d2b1d761031
00020000-5672-8851-2553-c8a6d1172f50	00030000-5672-8851-9ca7-0a8c935eb3ae
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-86f5-9ee3edaf2ef8
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-c22a-e3aa47cea2ba
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-e3a4-051b2229f950
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-c2cf-a4d7378dabcc
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-e4ff-5853e55d149d
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-3012-111b855215a4
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-c3b7-bb84d01e7882
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-c4c0-e8b1c49afd21
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-efc8-2ea0f56c6266
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-8158-f4953bba1242
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-8d4d-95eabe854a81
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-5aed-fa1ca0bacbfd
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-c6e0-35ae3f67079a
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-6c28-ab23f534f722
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-e6a0-025a5a8cb6e5
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-8ee0-8588baedf5a1
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-f02b-1dc9cef94e4a
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-9171-51cc2483f18c
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-3477-8a4ec99a97df
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-7122-bb98bad6d142
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-d1cb-f204c10d4707
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-2b96-0cf521547d89
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-bdde-f575e4f6f168
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-13f0-f8b8f1296c06
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-5268-0af16a1cacad
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-2330-9dfd342285bd
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-d322-5d2b1d761031
00020000-5672-8851-5503-b56215abfd7e	00030000-5672-8851-9ca7-0a8c935eb3ae
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-86f5-9ee3edaf2ef8
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-c22a-e3aa47cea2ba
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-e3a4-051b2229f950
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-d987-38334bb636c0
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-e4ff-5853e55d149d
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-7d53-316d8b19a452
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-f8df-5ddeb04e6ec9
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-05ab-c37fd4c2512c
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-3012-111b855215a4
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-c3b7-bb84d01e7882
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-306c-07882affea66
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-29db-737e92a9ccae
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-efc8-2ea0f56c6266
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-c80c-4950e7aa3081
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-8158-f4953bba1242
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-f272-aa52c5dddd4b
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-bfb9-073de1d3dac7
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-8d4d-95eabe854a81
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-2ac6-3093522b63f6
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-5aed-fa1ca0bacbfd
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-656d-2763b57353ab
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-c6e0-35ae3f67079a
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-1691-a1e37d864ec9
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-6c28-ab23f534f722
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-eb49-adf8b4363c54
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-0eb3-f50598c9393f
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-e6a0-025a5a8cb6e5
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-e0e2-487f9b5a0261
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-259e-70992dd4eeef
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-8014-a3fbd8711188
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-8ee0-8588baedf5a1
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-7bef-bd7598bd8091
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-c4ae-5af1ed263577
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-a963-09b8726bc057
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-c09b-fe0fc50f7bf9
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-e1e4-2d29759430e2
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-8329-37e913286578
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-15af-81f07c57caa7
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-b649-dffd846f15bb
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-e5f4-9663a2c305cd
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-714a-749732fb1bc2
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-25c9-c74d47298934
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-2b3c-c2fec42b8adc
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-43f2-d77567cd3b21
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-34fd-68b2773cecb5
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-2b14-8543e316af47
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-f09f-88f1b573a249
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-76f7-ef6047223b6e
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-17bd-50335f767284
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-5b48-ce7a70973990
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-50cc-0fcc3748125e
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-52d4-878131aa6742
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-3314-138019a743ed
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-36f0-cd3ed4aba473
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-f02b-1dc9cef94e4a
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-9171-51cc2483f18c
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-1fe0-5806ac24ef5e
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-3477-8a4ec99a97df
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-f7bb-f5c83d21fcc2
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-7122-bb98bad6d142
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-d1cb-f204c10d4707
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-2b96-0cf521547d89
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-bdde-f575e4f6f168
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-0590-7b2d70ffca79
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-13f0-f8b8f1296c06
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-5268-0af16a1cacad
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-9a11-16ec4ac464f5
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-cfd7-0c2c17c13d4c
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-7d45-af2f8aa98616
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-2330-9dfd342285bd
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-b33a-6b292358bab2
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-d322-5d2b1d761031
00020000-5672-8851-8d87-592dcc79b2ed	00030000-5672-8851-9ca7-0a8c935eb3ae
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-6395-ca20548192f7
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-f57e-b55d5afe7dd9
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-86f5-9ee3edaf2ef8
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-dcb3-6d40d558f97c
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-c22a-e3aa47cea2ba
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-d987-38334bb636c0
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-e3a4-051b2229f950
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-43ed-375c8a3bd1b2
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-73cf-5537af3e1123
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-e56f-3cd2c3acf2b6
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-3f92-fc4011471110
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-c2cf-a4d7378dabcc
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-c978-520a96e71be7
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-e4ff-5853e55d149d
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-689b-dbb83fff5c30
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-7d53-316d8b19a452
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-39cf-502a6a2ac36f
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-3173-1fd3e4378485
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-55fa-026a3e923b9d
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-1636-01e367c3d500
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-4ea4-9fd3c5a373c7
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-d606-285dc0fc0c89
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-7938-f7ea4dd8c68a
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-374c-ca0c652e074d
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-d783-86a0187ba1dc
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-f8df-5ddeb04e6ec9
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-05ab-c37fd4c2512c
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-3012-111b855215a4
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-536d-5d6920ad05fd
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-f63c-7b5dd8096eb1
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-b86c-b3f3d0110604
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-c3b7-bb84d01e7882
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-d281-8ea8cb89867b
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-c4c0-e8b1c49afd21
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-c671-0deb63155493
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-27d9-f14f02df59c9
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-a60f-0c75b0c6ae7f
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-306c-07882affea66
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-29db-737e92a9ccae
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-efc8-2ea0f56c6266
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-c80c-4950e7aa3081
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-03a1-d8470b597c3c
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-6c1d-2df6b5b55ac9
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-81f1-e41a0c06036f
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-8928-97b34d216f25
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-3d82-2b91a839491b
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-c7d6-4b70622a4888
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-7c0b-337e9c28050c
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-cfef-cf605096ab5e
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-b2fb-167f014ba6f6
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-df32-76cafc09a095
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-ed62-44e830c4f994
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-7358-1dc6e27709ef
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-b546-ffa5956ab8bc
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-b543-94ff2281cc28
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-8158-f4953bba1242
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-f272-aa52c5dddd4b
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-bfb9-073de1d3dac7
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-8d4d-95eabe854a81
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-2ac6-3093522b63f6
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-d70b-2874ccc3c2b8
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-0301-c05e89bac044
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-0667-2cdce7faf069
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-4d79-652ca0adfad2
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-5aed-fa1ca0bacbfd
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-656d-2763b57353ab
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-c6e0-35ae3f67079a
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-1691-a1e37d864ec9
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-6c28-ab23f534f722
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-eb49-adf8b4363c54
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-0eb3-f50598c9393f
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-e0c0-78345e7c17e8
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-728c-0414e8e546aa
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-5f44-8c63afd2adb1
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-e6a0-025a5a8cb6e5
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-e0e2-487f9b5a0261
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-30ad-487aee917d5c
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-59f5-545c41318d92
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-f59d-5c7c5dbe8ec6
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-53ff-6bcb4fae1e49
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-fcb1-4d96119d9b65
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-3760-4480501be8a8
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-259e-70992dd4eeef
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-8014-a3fbd8711188
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-8ee0-8588baedf5a1
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-7bef-bd7598bd8091
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-c4ae-5af1ed263577
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-a963-09b8726bc057
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-c09b-fe0fc50f7bf9
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-e1e4-2d29759430e2
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-8329-37e913286578
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-15af-81f07c57caa7
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-b649-dffd846f15bb
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-e5f4-9663a2c305cd
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-714a-749732fb1bc2
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-25c9-c74d47298934
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-2b3c-c2fec42b8adc
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-43f2-d77567cd3b21
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-34fd-68b2773cecb5
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-2b14-8543e316af47
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-f09f-88f1b573a249
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-76f7-ef6047223b6e
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-17bd-50335f767284
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-5b48-ce7a70973990
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-50cc-0fcc3748125e
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-52d4-878131aa6742
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-3314-138019a743ed
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-36f0-cd3ed4aba473
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-f02b-1dc9cef94e4a
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-3788-61683d5ecd3a
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-378f-ce36a09f339a
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-5191-80a9520eea4e
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-011b-7ba0dd78a112
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-342e-be610caa82b9
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-fd05-df5ee1e03b8a
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-1d88-7cbee5c15789
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-17ad-051b8d756da5
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-f1c6-a5e6754f0706
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-07e2-aa7d645ae6b3
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-7a34-f8f8d33cd920
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-7c95-41b9361a7b4a
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-d51f-fbe4dac76612
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-cf0c-71847227d060
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-533d-02ac7dc7445c
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-5fd3-3dd9e91efdf0
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-6552-a408eb4a8049
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-5f07-7ed4f5281e85
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-1150-4f524ad7c03e
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-a31a-16b20ae78220
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-9c8d-3e36b5200de9
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-5945-db066a3fcd5c
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-9171-51cc2483f18c
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-1fe0-5806ac24ef5e
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-3477-8a4ec99a97df
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-f7bb-f5c83d21fcc2
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-5d75-92412132fb00
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-cb90-b6f41512d41b
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-bde1-277dfbc6161a
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-7122-bb98bad6d142
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-9462-7a21a9b9c569
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-d1cb-f204c10d4707
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-4178-91febf5eeafa
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-544e-fd5e2b66a8f7
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-d5ed-2e45f6fbebfe
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-2b96-0cf521547d89
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-381f-54007ab24828
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-bdde-f575e4f6f168
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-0590-7b2d70ffca79
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-13f0-f8b8f1296c06
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-8ddd-bc405984a6df
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-54ff-b05acad7801c
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-0700-26fbf708a6c0
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-c9ec-2f84c74e4f1f
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-5e58-0ba6d05576eb
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-5268-0af16a1cacad
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-9a11-16ec4ac464f5
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-7e85-c9accf4535c9
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-0808-2f6e28c89045
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-cfd7-0c2c17c13d4c
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-7d45-af2f8aa98616
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-2330-9dfd342285bd
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-b33a-6b292358bab2
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-9fbf-786adeb1fcad
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-0f37-ad55926800b3
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-d322-5d2b1d761031
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-cf84-40092d1a82f6
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-9ca7-0a8c935eb3ae
00020000-5672-8853-867b-0a26ef9bd563	00030000-5672-8851-4a71-98d041da1f9b
00020000-5672-8853-dad1-9076dbd0e191	00030000-5672-8851-cb24-e2c0cfe1db06
00020000-5672-8853-537e-7ef8d9dc2e74	00030000-5672-8851-cfd7-0c2c17c13d4c
00020000-5672-8853-1935-d1d5eb58d54b	00030000-5672-8851-8ddd-bc405984a6df
00020000-5672-8853-be38-e276426c6ced	00030000-5672-8851-13f0-f8b8f1296c06
00020000-5672-8853-4448-d024086006d4	00030000-5672-8851-c7d6-4b70622a4888
00020000-5672-8853-980d-67d519a4acf0	00030000-5672-8851-7c0b-337e9c28050c
00020000-5672-8853-0528-562d21d4dfff	00030000-5672-8851-cfef-cf605096ab5e
00020000-5672-8853-ffdf-8064163b7a56	00030000-5672-8851-3d82-2b91a839491b
00020000-5672-8853-5b36-2311d07c89ed	00030000-5672-8851-81f1-e41a0c06036f
00020000-5672-8853-0132-b1dd0432bb87	00030000-5672-8851-8928-97b34d216f25
00020000-5672-8853-ab9f-5acbddccdff2	00030000-5672-8851-a0d2-f55158453cf0
00020000-5672-8853-59f8-dcc9f1a2f497	00030000-5672-8851-7d45-af2f8aa98616
00020000-5672-8853-cac8-1004f769d0bc	00030000-5672-8851-246d-acffb83c25b8
00020000-5672-8853-8fa7-de479c2ba30d	00030000-5672-8851-bfb9-073de1d3dac7
00020000-5672-8853-58aa-6181ba48c7cb	00030000-5672-8851-2ac6-3093522b63f6
00020000-5672-8853-9152-c9dd3844c081	00030000-5672-8851-8d4d-95eabe854a81
00020000-5672-8853-83ac-74e5b9ea50a5	00030000-5672-8851-7d53-316d8b19a452
00020000-5672-8853-3a29-0ef1f49e414b	00030000-5672-8851-f2a3-83e57890dfed
00020000-5672-8853-2db7-af8777bc2d04	00030000-5672-8851-c6e0-35ae3f67079a
00020000-5672-8853-2db7-af8777bc2d04	00030000-5672-8851-1691-a1e37d864ec9
00020000-5672-8853-2db7-af8777bc2d04	00030000-5672-8851-13f0-f8b8f1296c06
00020000-5672-8853-7353-b9bc782a5fb6	00030000-5672-8851-bdde-f575e4f6f168
00020000-5672-8853-4157-2ec5cff4023d	00030000-5672-8851-0590-7b2d70ffca79
00020000-5672-8853-15e6-221eb964652c	00030000-5672-8851-5945-db066a3fcd5c
00020000-5672-8853-9a58-4b8d8e2c0b2d	00030000-5672-8851-3477-8a4ec99a97df
00020000-5672-8853-1ca4-8dc9b941ae2a	00030000-5672-8851-f7bb-f5c83d21fcc2
00020000-5672-8853-8ec7-b7ca47d01bc2	00030000-5672-8851-e6a0-025a5a8cb6e5
00020000-5672-8853-f3c0-8f0829f5f15a	00030000-5672-8851-e0e2-487f9b5a0261
00020000-5672-8853-fa5f-023110201e67	00030000-5672-8851-2330-9dfd342285bd
00020000-5672-8853-35dd-84b1bbe7cd97	00030000-5672-8851-b33a-6b292358bab2
00020000-5672-8853-e094-cfa1a1e7ee54	00030000-5672-8851-5aed-fa1ca0bacbfd
00020000-5672-8853-4d45-30a02aa63dcb	00030000-5672-8851-656d-2763b57353ab
00020000-5672-8853-0799-f6192ae8d46c	00030000-5672-8851-9171-51cc2483f18c
00020000-5672-8853-d181-0809fdbd4ea0	00030000-5672-8851-1fe0-5806ac24ef5e
00020000-5672-8853-2d33-4a830a622e28	00030000-5672-8851-c22a-e3aa47cea2ba
00020000-5672-8853-4b4c-4d4cf9573b6f	00030000-5672-8851-e3a4-051b2229f950
00020000-5672-8853-00fc-ad2fbb125c44	00030000-5672-8851-d987-38334bb636c0
00020000-5672-8853-6c4e-c0900fde09a7	00030000-5672-8851-c3b7-bb84d01e7882
00020000-5672-8853-324e-f3adbb07e9fa	00030000-5672-8851-c4c0-e8b1c49afd21
00020000-5672-8853-29d7-07f5816b624e	00030000-5672-8851-d281-8ea8cb89867b
\.


--
-- TOC entry 3152 (class 0 OID 32500239)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 32500273)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 32500411)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5672-8854-9832-07fb70442750	00090000-5672-8854-82d2-7c9f8e3db83e	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5672-8854-0a19-92cb3a2053a4	00090000-5672-8854-f32a-b065aa9e6eb5	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5672-8854-504d-bae1f865ebe2	00090000-5672-8854-56fb-27513b99d364	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5672-8854-0cac-0e0f9391cb4c	00090000-5672-8854-4402-4ef78e632931	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3123 (class 0 OID 32499931)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5672-8854-f8fc-ad4965f5fee7	\N	00040000-5672-8851-55fe-d81ce0cb3dca	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-8854-44f1-0816e63a1fa1	\N	00040000-5672-8851-55fe-d81ce0cb3dca	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5672-8854-96e0-112e449d19ef	\N	00040000-5672-8851-55fe-d81ce0cb3dca	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-8854-809d-509432744fec	\N	00040000-5672-8851-55fe-d81ce0cb3dca	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-8854-97a0-7311b75aa9c9	\N	00040000-5672-8851-55fe-d81ce0cb3dca	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-8854-6b3f-adf84e328fb4	\N	00040000-5672-8850-579c-3f299445d1b8	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-8854-49b7-899b221a3a4e	\N	00040000-5672-8850-fb12-1779f5a10723	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-8854-0b02-eea5afac2941	\N	00040000-5672-8850-e58c-0b078e8679c0	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-8854-04bb-9bbb90ddaa30	\N	00040000-5672-8851-fcd3-6c9b8dc5fda6	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-8856-4962-23e65b52f50d	\N	00040000-5672-8851-55fe-d81ce0cb3dca	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3126 (class 0 OID 32499976)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5672-8850-1039-41b27c9c2c4d	8341	Adlešiči
00050000-5672-8850-84e4-6c81b700fc5e	5270	Ajdovščina
00050000-5672-8850-1838-7774be4e4172	6280	Ankaran/Ancarano
00050000-5672-8850-a010-cf4dc67f6099	9253	Apače
00050000-5672-8850-a65b-d6fdaa16fafc	8253	Artiče
00050000-5672-8850-c0fa-4a21dbd97e72	4275	Begunje na Gorenjskem
00050000-5672-8850-b641-7103b09fecd9	1382	Begunje pri Cerknici
00050000-5672-8850-a932-cf2823418de5	9231	Beltinci
00050000-5672-8850-9a6a-015b5b0273f5	2234	Benedikt
00050000-5672-8850-c078-ccfcd46ff80b	2345	Bistrica ob Dravi
00050000-5672-8850-c577-2f8e5be2d646	3256	Bistrica ob Sotli
00050000-5672-8850-9eae-1414d12561b9	8259	Bizeljsko
00050000-5672-8850-c861-1610e9e5d2e1	1223	Blagovica
00050000-5672-8850-5383-9c7c6c6e0018	8283	Blanca
00050000-5672-8850-3428-fb1df8f9595d	4260	Bled
00050000-5672-8850-2890-2440258f790b	4273	Blejska Dobrava
00050000-5672-8850-850e-a1243f5c6410	9265	Bodonci
00050000-5672-8850-6bd8-2043216d96cc	9222	Bogojina
00050000-5672-8850-8142-db37f33cb7eb	4263	Bohinjska Bela
00050000-5672-8850-fbb3-95a1d3290c33	4264	Bohinjska Bistrica
00050000-5672-8850-f2fe-87de56d73d84	4265	Bohinjsko jezero
00050000-5672-8850-61f0-1ac48b1299e7	1353	Borovnica
00050000-5672-8850-4f39-68c2b6e78b22	8294	Boštanj
00050000-5672-8850-b6f0-2c5bd47d8731	5230	Bovec
00050000-5672-8850-e8ad-a8b939986d13	5295	Branik
00050000-5672-8850-b16c-554cf6f6b76d	3314	Braslovče
00050000-5672-8850-376b-7f95751cd755	5223	Breginj
00050000-5672-8850-df9b-43d58909d5fe	8280	Brestanica
00050000-5672-8850-72d7-cd367d0c48c4	2354	Bresternica
00050000-5672-8850-4298-d02fc7588bdf	4243	Brezje
00050000-5672-8850-4f5b-8f4b2183484e	1351	Brezovica pri Ljubljani
00050000-5672-8850-e02b-eddafddf3e53	8250	Brežice
00050000-5672-8850-11c2-e9d7d5767c55	4210	Brnik - Aerodrom
00050000-5672-8850-5949-5fb14fc704a2	8321	Brusnice
00050000-5672-8850-57db-4e538c04cd84	3255	Buče
00050000-5672-8850-18d3-cde22fff2b07	8276	Bučka 
00050000-5672-8850-0660-4a7044ae279b	9261	Cankova
00050000-5672-8850-5153-e73708a63a69	3000	Celje 
00050000-5672-8850-d02f-319139ce5da1	3001	Celje - poštni predali
00050000-5672-8850-b71e-f5b073afa95a	4207	Cerklje na Gorenjskem
00050000-5672-8850-0eae-b4d08d666330	8263	Cerklje ob Krki
00050000-5672-8850-8bc9-965b83e0fcf0	1380	Cerknica
00050000-5672-8850-d26a-8e2a15379996	5282	Cerkno
00050000-5672-8850-aeb5-a569b77eee21	2236	Cerkvenjak
00050000-5672-8850-8313-f2dbda7a1da8	2215	Ceršak
00050000-5672-8850-bd6f-db2385a486f9	2326	Cirkovce
00050000-5672-8850-abe6-5203d15594bd	2282	Cirkulane
00050000-5672-8850-1849-e121fcde14e6	5273	Col
00050000-5672-8850-e77c-3ef6472a2ece	8251	Čatež ob Savi
00050000-5672-8850-e9da-3e5e8e68f4bd	1413	Čemšenik
00050000-5672-8850-2220-32da571e6e98	5253	Čepovan
00050000-5672-8850-f4eb-36cd03bb2778	9232	Črenšovci
00050000-5672-8850-dc95-ea5412b202fd	2393	Črna na Koroškem
00050000-5672-8850-180c-a51ec490927d	6275	Črni Kal
00050000-5672-8850-cbe8-ec316b82a864	5274	Črni Vrh nad Idrijo
00050000-5672-8850-49c0-31360c3e414c	5262	Črniče
00050000-5672-8850-e0f4-80a0f66dd2f6	8340	Črnomelj
00050000-5672-8850-bdca-d0c1f05e4e25	6271	Dekani
00050000-5672-8850-1cb7-2b90776860bd	5210	Deskle
00050000-5672-8850-fcb5-de18699db9df	2253	Destrnik
00050000-5672-8850-0570-17bdced25c8f	6215	Divača
00050000-5672-8850-7471-5f88ba93e04c	1233	Dob
00050000-5672-8850-2514-4f56365c6646	3224	Dobje pri Planini
00050000-5672-8850-ecee-d38440ee3f0a	8257	Dobova
00050000-5672-8850-d2d1-961d84e6416b	1423	Dobovec
00050000-5672-8850-cf17-2c4dcfc5c8e0	5263	Dobravlje
00050000-5672-8850-876f-320bf9e8ff42	3204	Dobrna
00050000-5672-8850-8677-7ffd83b0457c	8211	Dobrnič
00050000-5672-8850-d2ab-c075fdc32901	1356	Dobrova
00050000-5672-8850-ebbc-88608c8943cf	9223	Dobrovnik/Dobronak 
00050000-5672-8850-f179-a5feb0121805	5212	Dobrovo v Brdih
00050000-5672-8850-9240-925829af954c	1431	Dol pri Hrastniku
00050000-5672-8850-3495-85b11fdf128f	1262	Dol pri Ljubljani
00050000-5672-8850-72e3-0bc90a0d5a4e	1273	Dole pri Litiji
00050000-5672-8850-cf00-3af8cb4e119f	1331	Dolenja vas
00050000-5672-8850-cff7-30c1c3dadd75	8350	Dolenjske Toplice
00050000-5672-8850-a0f2-ce4c0f52ffba	1230	Domžale
00050000-5672-8850-fb6d-08966a236015	2252	Dornava
00050000-5672-8850-1770-01587a137b70	5294	Dornberk
00050000-5672-8850-7d06-b7ba75870e36	1319	Draga
00050000-5672-8850-db97-d395fe3590bf	8343	Dragatuš
00050000-5672-8850-d3d5-ffee517d6505	3222	Dramlje
00050000-5672-8850-5fc2-cf9df0b3519b	2370	Dravograd
00050000-5672-8850-6070-73a74d4ebdaf	4203	Duplje
00050000-5672-8850-834a-d683ef25e807	6221	Dutovlje
00050000-5672-8850-278c-41a942b1302f	8361	Dvor
00050000-5672-8850-b49c-b51ad5c1623b	2343	Fala
00050000-5672-8850-acb9-0f20092ea1da	9208	Fokovci
00050000-5672-8850-9a54-3a49bce0eaea	2313	Fram
00050000-5672-8850-4a6a-0fd19c4a9968	3213	Frankolovo
00050000-5672-8850-9379-8d0f304e96ce	1274	Gabrovka
00050000-5672-8850-3602-7aa392d008a1	8254	Globoko
00050000-5672-8850-2a73-5f11fb22c624	5275	Godovič
00050000-5672-8850-9479-a7bd36f16b99	4204	Golnik
00050000-5672-8850-9451-4f127095c33a	3303	Gomilsko
00050000-5672-8850-c753-59d3e0ce227a	4224	Gorenja vas
00050000-5672-8850-f661-9ea2cd1f9d65	3263	Gorica pri Slivnici
00050000-5672-8850-e040-30c046826fa3	2272	Gorišnica
00050000-5672-8850-6623-53c6361c7e13	9250	Gornja Radgona
00050000-5672-8850-f3e8-81efbcadb090	3342	Gornji Grad
00050000-5672-8850-6e04-593495af12b3	4282	Gozd Martuljek
00050000-5672-8850-8ca9-dab9f4dd1054	6272	Gračišče
00050000-5672-8850-dd53-abb605d9ea0d	9264	Grad
00050000-5672-8850-04ff-88ba89f11ab0	8332	Gradac
00050000-5672-8850-d147-5e5516d8c9cf	1384	Grahovo
00050000-5672-8850-532d-8e2a0f20e63e	5242	Grahovo ob Bači
00050000-5672-8850-f8b8-e9bab7c560e2	5251	Grgar
00050000-5672-8850-38df-04685c8d05d2	3302	Griže
00050000-5672-8850-1eb8-d2fab011f2d9	3231	Grobelno
00050000-5672-8850-0f52-fd4d7420875e	1290	Grosuplje
00050000-5672-8850-e6e5-4288d2f0f297	2288	Hajdina
00050000-5672-8850-4985-1381993daca4	8362	Hinje
00050000-5672-8850-c48c-960e33cc0f68	2311	Hoče
00050000-5672-8850-1b44-ae9e58d69f77	9205	Hodoš/Hodos
00050000-5672-8850-e533-c6a89408dcdc	1354	Horjul
00050000-5672-8850-b83e-a5c89d704e37	1372	Hotedršica
00050000-5672-8850-0076-e0047cdfb9f7	1430	Hrastnik
00050000-5672-8850-e9a3-ff4bd1eaaf52	6225	Hruševje
00050000-5672-8850-fbf8-b5c736633dc6	4276	Hrušica
00050000-5672-8850-1ce0-fb320fb3a5fc	5280	Idrija
00050000-5672-8850-bef2-d0b0b8a3dac4	1292	Ig
00050000-5672-8850-f01d-03426938e645	6250	Ilirska Bistrica
00050000-5672-8850-61da-dc40ac0d10bf	6251	Ilirska Bistrica-Trnovo
00050000-5672-8850-45c7-3942cd00e148	1295	Ivančna Gorica
00050000-5672-8850-b520-c0df21af4a24	2259	Ivanjkovci
00050000-5672-8850-bb7c-a5102bc3f47f	1411	Izlake
00050000-5672-8850-01ab-e4e16d02842e	6310	Izola/Isola
00050000-5672-8850-895c-8df801cf0b6e	2222	Jakobski Dol
00050000-5672-8850-5ee0-ba4a5df1d9de	2221	Jarenina
00050000-5672-8850-37a6-0046ee1665be	6254	Jelšane
00050000-5672-8850-6559-ae784cb6d4a5	4270	Jesenice
00050000-5672-8850-5149-b2f5a18880af	8261	Jesenice na Dolenjskem
00050000-5672-8850-9df3-c57efc9f1aec	3273	Jurklošter
00050000-5672-8850-81cb-f952571f87b0	2223	Jurovski Dol
00050000-5672-8850-e7bb-476e647e3ad2	2256	Juršinci
00050000-5672-8850-1af4-86f42abc793e	5214	Kal nad Kanalom
00050000-5672-8850-2123-139883a91022	3233	Kalobje
00050000-5672-8850-0d6d-5679508c30c0	4246	Kamna Gorica
00050000-5672-8850-2373-4a2c074a92e1	2351	Kamnica
00050000-5672-8850-0443-92c135578707	1241	Kamnik
00050000-5672-8850-2c09-9768e7c01e8c	5213	Kanal
00050000-5672-8850-900d-c1b683df3d45	8258	Kapele
00050000-5672-8850-e763-b7c32f371091	2362	Kapla
00050000-5672-8850-38ad-2af1abc10771	2325	Kidričevo
00050000-5672-8850-2359-bc9a3a623e4b	1412	Kisovec
00050000-5672-8850-b83c-093463ff3cd8	6253	Knežak
00050000-5672-8850-2ebc-46000d41e7db	5222	Kobarid
00050000-5672-8850-b7f8-abf85352adb3	9227	Kobilje
00050000-5672-8850-bd2f-f84185d4eeb3	1330	Kočevje
00050000-5672-8850-a1ae-4682dba20084	1338	Kočevska Reka
00050000-5672-8850-e4fd-09778f5eae87	2276	Kog
00050000-5672-8850-8882-32360f949475	5211	Kojsko
00050000-5672-8850-bd49-b98e41769f4b	6223	Komen
00050000-5672-8850-fb56-7c18dfe88e42	1218	Komenda
00050000-5672-8850-5c13-7e2869e41c44	6000	Koper/Capodistria 
00050000-5672-8850-74d4-63d6a2b2853a	6001	Koper/Capodistria - poštni predali
00050000-5672-8850-1715-572445cc824b	8282	Koprivnica
00050000-5672-8850-87ba-e44e0fd6ab60	5296	Kostanjevica na Krasu
00050000-5672-8850-831a-ba6f10e56a62	8311	Kostanjevica na Krki
00050000-5672-8850-0946-4c88c2834812	1336	Kostel
00050000-5672-8850-5dce-a3dfbfcbbfcf	6256	Košana
00050000-5672-8850-fd43-00bcf52c08c9	2394	Kotlje
00050000-5672-8850-2e88-bd68bbe4497f	6240	Kozina
00050000-5672-8850-cf6a-c266298ec57e	3260	Kozje
00050000-5672-8850-95a1-476699874c8f	4000	Kranj 
00050000-5672-8850-e8e9-f14414e02332	4001	Kranj - poštni predali
00050000-5672-8850-263f-d83882342a3e	4280	Kranjska Gora
00050000-5672-8850-7c08-5e4baca8d67f	1281	Kresnice
00050000-5672-8850-263f-c4ac31102753	4294	Križe
00050000-5672-8850-2492-4bf9fda86d15	9206	Križevci
00050000-5672-8850-1dc7-a7a762297ccc	9242	Križevci pri Ljutomeru
00050000-5672-8850-681d-566faba6fd9a	1301	Krka
00050000-5672-8850-563b-0b463473132d	8296	Krmelj
00050000-5672-8850-a8c1-bf1c6fc2250a	4245	Kropa
00050000-5672-8850-d6d0-8cd0702f4926	8262	Krška vas
00050000-5672-8850-f742-a3f8985544a0	8270	Krško
00050000-5672-8850-1f7b-44a85d560f35	9263	Kuzma
00050000-5672-8850-12f1-ee4e29b76b50	2318	Laporje
00050000-5672-8850-59b6-e5500ddc4784	3270	Laško
00050000-5672-8850-7e56-e381134f6f8b	1219	Laze v Tuhinju
00050000-5672-8850-59c1-da4332c7a5b7	2230	Lenart v Slovenskih goricah
00050000-5672-8850-5f38-db25d245251c	9220	Lendava/Lendva
00050000-5672-8850-e4f4-99f87ad622e1	4248	Lesce
00050000-5672-8850-d213-ce40f1c8db6a	3261	Lesično
00050000-5672-8850-24d3-6abdb8ee42df	8273	Leskovec pri Krškem
00050000-5672-8850-641e-f2f1a5eed4d0	2372	Libeliče
00050000-5672-8850-c92a-c56de6bf3ed7	2341	Limbuš
00050000-5672-8850-c11f-94c0ec911a63	1270	Litija
00050000-5672-8850-ec24-fabe813717ff	3202	Ljubečna
00050000-5672-8850-b1c6-b94f3896ba03	1000	Ljubljana 
00050000-5672-8850-d9b2-a793073f6c4d	1001	Ljubljana - poštni predali
00050000-5672-8850-4a8f-241e10842d78	1231	Ljubljana - Črnuče
00050000-5672-8850-1a58-8ff8df6f5fd9	1261	Ljubljana - Dobrunje
00050000-5672-8850-6fd3-ba3d57d0a1f6	1260	Ljubljana - Polje
00050000-5672-8850-5c09-cd0a455c5c16	1210	Ljubljana - Šentvid
00050000-5672-8850-3662-ce58eb966672	1211	Ljubljana - Šmartno
00050000-5672-8850-d5ae-880e7f6776f8	3333	Ljubno ob Savinji
00050000-5672-8850-53d1-185963f03b5a	9240	Ljutomer
00050000-5672-8850-dc66-25917f2b4e15	3215	Loče
00050000-5672-8850-d174-84714cc48692	5231	Log pod Mangartom
00050000-5672-8850-7351-7b164efae98b	1358	Log pri Brezovici
00050000-5672-8850-f586-0d32837b1da5	1370	Logatec
00050000-5672-8850-44c5-3101d89dea07	1371	Logatec
00050000-5672-8850-d5c1-fe6a0e779a38	1434	Loka pri Zidanem Mostu
00050000-5672-8850-cc68-efe3705ce0dd	3223	Loka pri Žusmu
00050000-5672-8850-b0b5-7ae806e5b160	6219	Lokev
00050000-5672-8850-c613-c2572c858e7d	1318	Loški Potok
00050000-5672-8850-c4d8-39340c5a6783	2324	Lovrenc na Dravskem polju
00050000-5672-8850-7e4d-8cc990f9ab1b	2344	Lovrenc na Pohorju
00050000-5672-8850-82ed-6c3da9b5a87c	3334	Luče
00050000-5672-8850-22c9-790b64ea87f3	1225	Lukovica
00050000-5672-8850-ced1-7e77ea4d288b	9202	Mačkovci
00050000-5672-8850-c308-8445d5fc8223	2322	Majšperk
00050000-5672-8850-7283-2f4944db24a7	2321	Makole
00050000-5672-8850-7b8c-86779b1cae97	9243	Mala Nedelja
00050000-5672-8850-7167-62032df3d9eb	2229	Malečnik
00050000-5672-8850-d4f7-d4497394729f	6273	Marezige
00050000-5672-8850-1860-00954065df54	2000	Maribor 
00050000-5672-8850-dc12-e5401006b45f	2001	Maribor - poštni predali
00050000-5672-8850-d96e-1ce5f987ad8b	2206	Marjeta na Dravskem polju
00050000-5672-8850-3f70-6299711db5a0	2281	Markovci
00050000-5672-8850-124e-fd67da8be2e0	9221	Martjanci
00050000-5672-8850-a64c-45f9a45b4b95	6242	Materija
00050000-5672-8850-5fe1-ab9bec006d57	4211	Mavčiče
00050000-5672-8850-5f8f-977cf40853a8	1215	Medvode
00050000-5672-8850-f056-4357419ae65b	1234	Mengeš
00050000-5672-8850-2cb4-d8f360c23468	8330	Metlika
00050000-5672-8850-215d-6c71db99f392	2392	Mežica
00050000-5672-8850-382a-127d97eee873	2204	Miklavž na Dravskem polju
00050000-5672-8850-23d7-4a529661e5a1	2275	Miklavž pri Ormožu
00050000-5672-8850-9b1d-18db19e58f5a	5291	Miren
00050000-5672-8850-6f1c-bc35588d03f8	8233	Mirna
00050000-5672-8850-11c4-bbc468a54d3e	8216	Mirna Peč
00050000-5672-8850-066d-321f3b26f53e	2382	Mislinja
00050000-5672-8850-525e-6775a5ea4a47	4281	Mojstrana
00050000-5672-8850-a49e-a764a6cddfea	8230	Mokronog
00050000-5672-8850-4d49-a6778c4f12ef	1251	Moravče
00050000-5672-8850-f5f2-f08dbaa12ad1	9226	Moravske Toplice
00050000-5672-8850-e628-e7e7aa05bd11	5216	Most na Soči
00050000-5672-8850-cfea-7194270b5715	1221	Motnik
00050000-5672-8850-64a6-521141e03265	3330	Mozirje
00050000-5672-8850-8c8e-159a7511f8a9	9000	Murska Sobota 
00050000-5672-8850-13f8-233dd133b835	9001	Murska Sobota - poštni predali
00050000-5672-8850-11db-cca6e03274a9	2366	Muta
00050000-5672-8850-b837-0eb58bc93fc6	4202	Naklo
00050000-5672-8850-db79-30f85265ed58	3331	Nazarje
00050000-5672-8850-500c-42df5f46000d	1357	Notranje Gorice
00050000-5672-8850-b0db-f8c8675cb010	3203	Nova Cerkev
00050000-5672-8850-887b-319a93365bf8	5000	Nova Gorica 
00050000-5672-8850-23a2-4dd83a3a31f9	5001	Nova Gorica - poštni predali
00050000-5672-8850-edeb-9d7afd4934ab	1385	Nova vas
00050000-5672-8850-369c-af377318ae2d	8000	Novo mesto
00050000-5672-8850-9403-49efe2411166	8001	Novo mesto - poštni predali
00050000-5672-8850-4a1a-26df1ed15c6d	6243	Obrov
00050000-5672-8850-654d-67b9269e495b	9233	Odranci
00050000-5672-8850-b5dc-e0b78dd5aa3c	2317	Oplotnica
00050000-5672-8850-bb93-cbc8c69db1b5	2312	Orehova vas
00050000-5672-8850-001d-02aef50d3a5b	2270	Ormož
00050000-5672-8850-a73a-85d1af0151c0	1316	Ortnek
00050000-5672-8850-48c9-2b201471036e	1337	Osilnica
00050000-5672-8850-ab47-4856596611aa	8222	Otočec
00050000-5672-8850-4b3b-4e7933225608	2361	Ožbalt
00050000-5672-8850-a86c-6921c48eaccc	2231	Pernica
00050000-5672-8850-6465-37d70807b913	2211	Pesnica pri Mariboru
00050000-5672-8850-e576-5d7e167c28bf	9203	Petrovci
00050000-5672-8850-4837-464ce04e33f0	3301	Petrovče
00050000-5672-8850-42f4-6c2d06a7d871	6330	Piran/Pirano
00050000-5672-8850-9866-596270885b68	8255	Pišece
00050000-5672-8850-e8a4-5212964f4ab0	6257	Pivka
00050000-5672-8850-1886-2f0bef9b63b0	6232	Planina
00050000-5672-8850-6c71-baa93e91b258	3225	Planina pri Sevnici
00050000-5672-8850-fbbf-506d6bdca1af	6276	Pobegi
00050000-5672-8850-8d60-b132a7af8028	8312	Podbočje
00050000-5672-8850-40bf-3d306c515c42	5243	Podbrdo
00050000-5672-8850-02d4-b0bac5166d90	3254	Podčetrtek
00050000-5672-8850-c0e5-08b6ba305e94	2273	Podgorci
00050000-5672-8850-4921-ec4390ff2257	6216	Podgorje
00050000-5672-8850-6af5-0a0a7078b160	2381	Podgorje pri Slovenj Gradcu
00050000-5672-8850-6272-c24b0bd8200e	6244	Podgrad
00050000-5672-8850-6966-813a2979be9a	1414	Podkum
00050000-5672-8850-7ea1-b281b133af9e	2286	Podlehnik
00050000-5672-8850-ebca-760d6c201ecf	5272	Podnanos
00050000-5672-8850-7860-974fdd11adeb	4244	Podnart
00050000-5672-8850-9185-342076ee7286	3241	Podplat
00050000-5672-8850-aa50-bfc3ffe52746	3257	Podsreda
00050000-5672-8850-e1ed-4e07d1d86585	2363	Podvelka
00050000-5672-8850-430e-4d27af33512d	2208	Pohorje
00050000-5672-8850-e81a-428d92de1dff	2257	Polenšak
00050000-5672-8850-b2bf-668974022062	1355	Polhov Gradec
00050000-5672-8850-90a8-d0a3101554f4	4223	Poljane nad Škofjo Loko
00050000-5672-8850-36fb-8c055a78379f	2319	Poljčane
00050000-5672-8850-0755-8162ca4f688b	1272	Polšnik
00050000-5672-8850-a438-e68c0f48ad14	3313	Polzela
00050000-5672-8850-749b-e1e3ddf5127e	3232	Ponikva
00050000-5672-8850-20d1-614119fb966f	6320	Portorož/Portorose
00050000-5672-8850-bedd-d6d182238415	6230	Postojna
00050000-5672-8850-3a77-6bc3ffd87065	2331	Pragersko
00050000-5672-8850-788c-473ed1310892	3312	Prebold
00050000-5672-8850-14c5-de288c8c99f2	4205	Preddvor
00050000-5672-8850-6048-113119e0a10d	6255	Prem
00050000-5672-8850-6d4d-e9e217648063	1352	Preserje
00050000-5672-8850-77ec-7b0fd2ee6691	6258	Prestranek
00050000-5672-8850-3a7b-c6c874f264e2	2391	Prevalje
00050000-5672-8850-d10c-f86b1dacf578	3262	Prevorje
00050000-5672-8850-3e41-4ec68da2c71e	1276	Primskovo 
00050000-5672-8850-b7a4-6a88fe3b2859	3253	Pristava pri Mestinju
00050000-5672-8850-11d8-f0632a722df0	9207	Prosenjakovci/Partosfalva
00050000-5672-8850-1299-19d7f168fc7b	5297	Prvačina
00050000-5672-8850-27d4-0aaff871f509	2250	Ptuj
00050000-5672-8850-beec-ca9a0c17819a	2323	Ptujska Gora
00050000-5672-8850-8541-773c4717ce75	9201	Puconci
00050000-5672-8850-722b-9758a17aa9c5	2327	Rače
00050000-5672-8850-8140-298e2dae0ad0	1433	Radeče
00050000-5672-8850-5d7e-31e3f2b3baa3	9252	Radenci
00050000-5672-8850-d07b-8ba21dea0f57	2360	Radlje ob Dravi
00050000-5672-8850-0f27-25ab2539483c	1235	Radomlje
00050000-5672-8850-653f-89f0287cb7d7	4240	Radovljica
00050000-5672-8850-0601-93ffdcd9370e	8274	Raka
00050000-5672-8850-9763-ea70db16523e	1381	Rakek
00050000-5672-8850-2c62-d9399f604b64	4283	Rateče - Planica
00050000-5672-8850-f039-e3de34b99f5b	2390	Ravne na Koroškem
00050000-5672-8850-5994-60f87bacbab9	9246	Razkrižje
00050000-5672-8850-c807-aa3c728d770c	3332	Rečica ob Savinji
00050000-5672-8850-5bb2-10500248f1b7	5292	Renče
00050000-5672-8850-9ccc-e8c95bdaddd1	1310	Ribnica
00050000-5672-8850-550e-4fa019ef51f2	2364	Ribnica na Pohorju
00050000-5672-8850-4c3b-3e53efef1724	3272	Rimske Toplice
00050000-5672-8850-d143-37d07e4a9244	1314	Rob
00050000-5672-8850-545f-1218bc6431fc	5215	Ročinj
00050000-5672-8850-f8cc-009a5675f46c	3250	Rogaška Slatina
00050000-5672-8850-a0e1-218825aed216	9262	Rogašovci
00050000-5672-8850-fffa-708c731a5b5b	3252	Rogatec
00050000-5672-8850-11e0-11060a53f696	1373	Rovte
00050000-5672-8850-1885-792b0c7ecf14	2342	Ruše
00050000-5672-8850-6813-0f1778cf0a75	1282	Sava
00050000-5672-8850-290f-310076d1de97	6333	Sečovlje/Sicciole
00050000-5672-8850-6ff2-739d4f71042d	4227	Selca
00050000-5672-8850-212e-857da3ee7d19	2352	Selnica ob Dravi
00050000-5672-8850-8a89-c0a1b291af03	8333	Semič
00050000-5672-8850-5ac8-c3ba11998367	8281	Senovo
00050000-5672-8850-0411-3851fd07787a	6224	Senožeče
00050000-5672-8850-bd54-02fbdbc9198b	8290	Sevnica
00050000-5672-8850-b55e-5912cfd475f0	6210	Sežana
00050000-5672-8850-a797-e1b7b9f58a6b	2214	Sladki Vrh
00050000-5672-8850-2d07-92dc995397e1	5283	Slap ob Idrijci
00050000-5672-8850-3ded-a0fa7f198078	2380	Slovenj Gradec
00050000-5672-8850-5692-0527d9fd0312	2310	Slovenska Bistrica
00050000-5672-8850-29f2-76e94ee33a45	3210	Slovenske Konjice
00050000-5672-8850-c858-26ed8e6d00d7	1216	Smlednik
00050000-5672-8850-3954-50c5e4bd3834	5232	Soča
00050000-5672-8850-6227-b6abba5208e5	1317	Sodražica
00050000-5672-8850-a142-9c675ef30f0d	3335	Solčava
00050000-5672-8850-ddaa-fdcaae6203f3	5250	Solkan
00050000-5672-8850-1d16-6bbae26a5610	4229	Sorica
00050000-5672-8850-4f38-e910f2234406	4225	Sovodenj
00050000-5672-8850-d669-48714c6f6a1e	5281	Spodnja Idrija
00050000-5672-8850-7759-ac99edb1e9e5	2241	Spodnji Duplek
00050000-5672-8850-69ea-9e1f62bad8fe	9245	Spodnji Ivanjci
00050000-5672-8850-841f-e0bc9898187f	2277	Središče ob Dravi
00050000-5672-8850-4492-25cb94516b57	4267	Srednja vas v Bohinju
00050000-5672-8850-f1db-f1f0d70c85c7	8256	Sromlje 
00050000-5672-8850-1a63-bf9ed7702af7	5224	Srpenica
00050000-5672-8850-7495-4b83f5390c8f	1242	Stahovica
00050000-5672-8850-51cd-b443cea9659f	1332	Stara Cerkev
00050000-5672-8850-bea6-8c388b814116	8342	Stari trg ob Kolpi
00050000-5672-8850-107b-98a36340f0aa	1386	Stari trg pri Ložu
00050000-5672-8850-48eb-575534c52265	2205	Starše
00050000-5672-8850-be90-9d6e241a90b3	2289	Stoperce
00050000-5672-8850-ddfd-22ce642839e3	8322	Stopiče
00050000-5672-8850-6d08-052475e0abb2	3206	Stranice
00050000-5672-8850-0623-0fbdd8d34602	8351	Straža
00050000-5672-8850-8b48-b55acbaf725b	1313	Struge
00050000-5672-8850-b80f-6ed5c9b7a697	8293	Studenec
00050000-5672-8850-77c5-c6745b7914ac	8331	Suhor
00050000-5672-8850-fcfe-9bca90f7810a	2233	Sv. Ana v Slovenskih goricah
00050000-5672-8850-e047-eee154b1063f	2235	Sv. Trojica v Slovenskih goricah
00050000-5672-8850-de71-57ffd3c157e7	2353	Sveti Duh na Ostrem Vrhu
00050000-5672-8850-e5d3-b60d7fcc40dd	9244	Sveti Jurij ob Ščavnici
00050000-5672-8850-e76f-69846f3986f4	3264	Sveti Štefan
00050000-5672-8850-ab52-880dc695792e	2258	Sveti Tomaž
00050000-5672-8850-02f8-43fe88563558	9204	Šalovci
00050000-5672-8850-6b70-cceddfb65f1c	5261	Šempas
00050000-5672-8850-1aa8-65c82def4c85	5290	Šempeter pri Gorici
00050000-5672-8850-2ccd-9a043caa6a0b	3311	Šempeter v Savinjski dolini
00050000-5672-8850-6c3d-88e5bbad5344	4208	Šenčur
00050000-5672-8850-ea1c-370a2c087ef0	2212	Šentilj v Slovenskih goricah
00050000-5672-8850-92aa-040ec35ff88a	8297	Šentjanž
00050000-5672-8850-8388-6fcebc58d538	2373	Šentjanž pri Dravogradu
00050000-5672-8850-c234-02301eefb9d8	8310	Šentjernej
00050000-5672-8850-b25c-5c68bf0991b1	3230	Šentjur
00050000-5672-8850-a6e7-602f8151f979	3271	Šentrupert
00050000-5672-8850-dbb6-1487c13ce687	8232	Šentrupert
00050000-5672-8850-9a62-60266615cd18	1296	Šentvid pri Stični
00050000-5672-8850-7ebe-a455790a1b1e	8275	Škocjan
00050000-5672-8850-ef36-5c39bc36d07d	6281	Škofije
00050000-5672-8850-ee45-3c95b8286549	4220	Škofja Loka
00050000-5672-8850-82b9-f9fa9c642b3c	3211	Škofja vas
00050000-5672-8850-5bfd-4a8dd1b39d7c	1291	Škofljica
00050000-5672-8850-b251-641eb492265f	6274	Šmarje
00050000-5672-8850-06f2-a7b274a06bff	1293	Šmarje - Sap
00050000-5672-8850-17b4-6231a5a3fc38	3240	Šmarje pri Jelšah
00050000-5672-8850-fda9-bab6ac46f209	8220	Šmarješke Toplice
00050000-5672-8850-63f6-732a90f26218	2315	Šmartno na Pohorju
00050000-5672-8850-75dd-6637a9b71aa4	3341	Šmartno ob Dreti
00050000-5672-8850-dbaf-419501ff3903	3327	Šmartno ob Paki
00050000-5672-8850-320c-af146d0f4efd	1275	Šmartno pri Litiji
00050000-5672-8850-1760-afb407756e3a	2383	Šmartno pri Slovenj Gradcu
00050000-5672-8850-f01a-644956859eb9	3201	Šmartno v Rožni dolini
00050000-5672-8850-7f50-3747047397eb	3325	Šoštanj
00050000-5672-8850-83a1-7f1ae0784a23	6222	Štanjel
00050000-5672-8850-eb08-c0f72001cb2e	3220	Štore
00050000-5672-8850-62a9-bcaf735924f0	3304	Tabor
00050000-5672-8850-2555-80ad4ddaa863	3221	Teharje
00050000-5672-8850-6045-328c1f46c722	9251	Tišina
00050000-5672-8850-89b0-2251683a1a8a	5220	Tolmin
00050000-5672-8850-2741-919d67e81485	3326	Topolšica
00050000-5672-8850-7414-52817440d250	2371	Trbonje
00050000-5672-8850-0907-560834ada685	1420	Trbovlje
00050000-5672-8850-87cd-b8b44356ce20	8231	Trebelno 
00050000-5672-8850-b28d-2bb9a314d164	8210	Trebnje
00050000-5672-8850-69cf-0132cb45b88e	5252	Trnovo pri Gorici
00050000-5672-8850-8115-c7e3530afbcd	2254	Trnovska vas
00050000-5672-8850-bef0-2551acaacdbc	1222	Trojane
00050000-5672-8850-3b55-18505583cbe5	1236	Trzin
00050000-5672-8850-7d14-5f93266cefbf	4290	Tržič
00050000-5672-8850-d09c-fa89a2530d02	8295	Tržišče
00050000-5672-8850-4b89-974055f31924	1311	Turjak
00050000-5672-8850-71b8-7177c8e80562	9224	Turnišče
00050000-5672-8850-418c-7cae5c9aa8e2	8323	Uršna sela
00050000-5672-8850-f17e-ee6784ef727b	1252	Vače
00050000-5672-8850-2e24-0c37ef9c0a7e	3320	Velenje 
00050000-5672-8850-cf18-7238de470b7b	3322	Velenje - poštni predali
00050000-5672-8850-4214-419af223cc7c	8212	Velika Loka
00050000-5672-8850-4f7e-8effc8d1053f	2274	Velika Nedelja
00050000-5672-8850-328e-7cfb72ef2b59	9225	Velika Polana
00050000-5672-8850-f432-4ee34bbe1b97	1315	Velike Lašče
00050000-5672-8850-1909-7abe5019a429	8213	Veliki Gaber
00050000-5672-8850-27d8-ef1ed1f3e89c	9241	Veržej
00050000-5672-8850-c37c-e366e5063ac6	1312	Videm - Dobrepolje
00050000-5672-8850-16b5-f9a7536e9119	2284	Videm pri Ptuju
00050000-5672-8850-dcaf-33ac83388773	8344	Vinica
00050000-5672-8850-a7a8-3ee96c15678a	5271	Vipava
00050000-5672-8850-c2ff-2ece671402ea	4212	Visoko
00050000-5672-8850-b38b-a0e93fdf7369	1294	Višnja Gora
00050000-5672-8850-9e24-6b826501bd43	3205	Vitanje
00050000-5672-8850-3a6a-b4604157b2e3	2255	Vitomarci
00050000-5672-8850-b013-378da8440a28	1217	Vodice
00050000-5672-8850-b172-60f37bac4f73	3212	Vojnik\t
00050000-5672-8850-835c-0462ce004e14	5293	Volčja Draga
00050000-5672-8850-e8ee-e43b9aaaf33f	2232	Voličina
00050000-5672-8850-8d37-968c65ed5d65	3305	Vransko
00050000-5672-8850-a9ad-8045bb7a48b1	6217	Vremski Britof
00050000-5672-8850-c955-3ec6d735b61a	1360	Vrhnika
00050000-5672-8850-5353-0f2892c5bec0	2365	Vuhred
00050000-5672-8850-6e1c-699d82da8db6	2367	Vuzenica
00050000-5672-8850-2f9e-b319b78b7bc6	8292	Zabukovje 
00050000-5672-8850-1fcf-70a7e12c5b88	1410	Zagorje ob Savi
00050000-5672-8850-7b21-caf4258cf9a7	1303	Zagradec
00050000-5672-8850-e9fe-b5927e3e7dd4	2283	Zavrč
00050000-5672-8850-389b-41e2822379ef	8272	Zdole 
00050000-5672-8850-3ab6-86083fca98fe	4201	Zgornja Besnica
00050000-5672-8850-0d82-749e6e28c289	2242	Zgornja Korena
00050000-5672-8850-f67c-1d14e7a1ca87	2201	Zgornja Kungota
00050000-5672-8850-c47a-09dd5d8f751e	2316	Zgornja Ložnica
00050000-5672-8850-4fd1-ad0b9d02f832	2314	Zgornja Polskava
00050000-5672-8850-a04c-68ce84331040	2213	Zgornja Velka
00050000-5672-8850-cf50-08e2403059ef	4247	Zgornje Gorje
00050000-5672-8850-73f9-6aa91c1aaf95	4206	Zgornje Jezersko
00050000-5672-8850-e003-bd3c56e40b46	2285	Zgornji Leskovec
00050000-5672-8850-782f-2bc6a5b7e47d	1432	Zidani Most
00050000-5672-8850-76cd-b9b0ec496b19	3214	Zreče
00050000-5672-8850-4492-a0aa898fde37	4209	Žabnica
00050000-5672-8850-521b-a880b956b72d	3310	Žalec
00050000-5672-8850-86ee-6a95f00b9529	4228	Železniki
00050000-5672-8850-47fe-a7050caa3564	2287	Žetale
00050000-5672-8850-514c-07a483b2d175	4226	Žiri
00050000-5672-8850-a510-b433af87b4b3	4274	Žirovnica
00050000-5672-8850-fea4-538963ac4dd2	8360	Žužemberk
\.


--
-- TOC entry 3175 (class 0 OID 32500649)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 32500213)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 32499961)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5672-8854-9d23-0c5c5c47ab70	00080000-5672-8854-f8fc-ad4965f5fee7	\N	00040000-5672-8851-55fe-d81ce0cb3dca	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5672-8854-18fd-49aceb43c412	00080000-5672-8854-f8fc-ad4965f5fee7	\N	00040000-5672-8851-55fe-d81ce0cb3dca	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5672-8854-8e1c-a9729520f4bc	00080000-5672-8854-44f1-0816e63a1fa1	\N	00040000-5672-8851-55fe-d81ce0cb3dca	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3137 (class 0 OID 32500105)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5672-8851-4f64-a24e00756c37	novo leto	1	1	\N	t
00430000-5672-8851-b7fa-89c006980df4	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5672-8851-034d-01c8393d7ea8	dan upora proti okupatorju	27	4	\N	t
00430000-5672-8851-3bca-529685eb33f9	praznik dela	1	5	\N	t
00430000-5672-8851-90d3-9e69424fb28d	praznik dela	2	5	\N	t
00430000-5672-8851-4220-80057b942482	dan Primoža Trubarja	8	6	\N	f
00430000-5672-8851-3974-87da08988882	dan državnosti	25	6	\N	t
00430000-5672-8851-d36f-01098fc388eb	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5672-8851-9119-5963435844f6	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5672-8851-3971-b8e4f7ef6bbe	dan suverenosti	25	10	\N	f
00430000-5672-8851-7614-3404d177ebfb	dan spomina na mrtve	1	11	\N	t
00430000-5672-8851-1b87-51948d2c94ff	dan Rudolfa Maistra	23	11	\N	f
00430000-5672-8851-ca7d-b7388ccbb074	božič	25	12	\N	t
00430000-5672-8851-39a4-45d6d8819235	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5672-8851-8e35-927f7b82d55a	Marijino vnebovzetje	15	8	\N	t
00430000-5672-8851-65c5-fe5e3d90f715	dan reformacije	31	10	\N	t
00430000-5672-8851-4c7a-be80d32960d6	velikonočna nedelja	27	3	2016	t
00430000-5672-8851-8636-1e0f39aa97ba	velikonočna nedelja	16	4	2017	t
00430000-5672-8851-193a-6433350a825b	velikonočna nedelja	1	4	2018	t
00430000-5672-8851-ebdd-44d9555b2e0a	velikonočna nedelja	21	4	2019	t
00430000-5672-8851-ee63-51ba695dc759	velikonočna nedelja	12	4	2020	t
00430000-5672-8851-3845-2f148b7c586d	velikonočna nedelja	4	4	2021	t
00430000-5672-8851-17d1-9fdf497882f5	velikonočna nedelja	17	4	2022	t
00430000-5672-8851-09e4-87870ea1d708	velikonočna nedelja	9	4	2023	t
00430000-5672-8851-d8e8-4351cd454d7a	velikonočna nedelja	31	3	2024	t
00430000-5672-8851-57da-6c2c2dc982c5	velikonočna nedelja	20	4	2025	t
00430000-5672-8851-aa0d-88ad01de1002	velikonočna nedelja	5	4	2026	t
00430000-5672-8851-0d4f-c43a00cbea1b	velikonočna nedelja	28	3	2027	t
00430000-5672-8851-2617-05b3523512f8	velikonočna nedelja	16	4	2028	t
00430000-5672-8851-fb3b-71987af60296	velikonočna nedelja	1	4	2029	t
00430000-5672-8851-ae6b-9548211660d3	velikonočna nedelja	21	4	2030	t
00430000-5672-8851-e6c4-8f030077b265	velikonočni ponedeljek	28	3	2016	t
00430000-5672-8851-7b24-780e528ba82a	velikonočni ponedeljek	17	4	2017	t
00430000-5672-8851-8dca-0a8a890b56d4	velikonočni ponedeljek	2	4	2018	t
00430000-5672-8851-a735-910c6420272f	velikonočni ponedeljek	22	4	2019	t
00430000-5672-8851-0acf-6ad065d34a5e	velikonočni ponedeljek	13	4	2020	t
00430000-5672-8851-d0de-226d68dacc83	velikonočni ponedeljek	5	4	2021	t
00430000-5672-8851-83ca-e3ff521e8737	velikonočni ponedeljek	18	4	2022	t
00430000-5672-8851-8df2-bf3c327217f3	velikonočni ponedeljek	10	4	2023	t
00430000-5672-8851-9031-86a3d9a9ec77	velikonočni ponedeljek	1	4	2024	t
00430000-5672-8851-8a1f-fb07cf375aa1	velikonočni ponedeljek	21	4	2025	t
00430000-5672-8851-be59-4ca714365554	velikonočni ponedeljek	6	4	2026	t
00430000-5672-8851-c154-ac302fb01d90	velikonočni ponedeljek	29	3	2027	t
00430000-5672-8851-20c5-5511866274b6	velikonočni ponedeljek	17	4	2028	t
00430000-5672-8851-5d7c-bfd6e29948f4	velikonočni ponedeljek	2	4	2029	t
00430000-5672-8851-e10a-92b1bfa5071c	velikonočni ponedeljek	22	4	2030	t
00430000-5672-8851-07a9-0ac18bb20f74	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5672-8851-c5b1-61f170826db6	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5672-8851-b137-90b8973330b1	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5672-8851-10a8-079047d1e9c7	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5672-8851-7d83-2130b0e8995f	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5672-8851-c7dd-2a05d0cacdf2	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5672-8851-456b-d2b61b15bb70	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5672-8851-3e0a-f46ffad79518	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5672-8851-878f-637408459b56	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5672-8851-6cad-32d8d1f51a48	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5672-8851-4ad2-d9cb71d2c0f4	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5672-8851-4b6e-400caa35c7ad	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5672-8851-bca8-ed7b6fa6172b	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5672-8851-ad8b-757b4c21709b	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5672-8851-5324-698eaa8af3b3	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3133 (class 0 OID 32500065)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 32500077)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 32500225)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 32500663)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 32500673)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5672-8854-220d-4244a2ce82e6	00080000-5672-8854-96e0-112e449d19ef	0987	AK
00190000-5672-8854-04ea-3f537f07b943	00080000-5672-8854-44f1-0816e63a1fa1	0989	AK
00190000-5672-8854-8c74-4a5cc3dededb	00080000-5672-8854-809d-509432744fec	0986	AK
00190000-5672-8854-5533-f0f480d1f9a5	00080000-5672-8854-6b3f-adf84e328fb4	0984	AK
00190000-5672-8854-f3e9-0d9d7c29b0a0	00080000-5672-8854-49b7-899b221a3a4e	0983	AK
00190000-5672-8854-d7e5-495409537f24	00080000-5672-8854-0b02-eea5afac2941	0982	AK
00190000-5672-8856-71d4-a33b74abdeab	00080000-5672-8856-4962-23e65b52f50d	1001	AK
\.


--
-- TOC entry 3174 (class 0 OID 32500562)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5672-8854-64ae-d28967aaa16f	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3178 (class 0 OID 32500681)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 32500254)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5672-8853-bfca-331b9e29654c	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5672-8853-f48c-0ba269e49224	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5672-8853-3f85-c969a1322d3f	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5672-8853-7198-b4851386cfb8	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5672-8853-f459-c231dc98cc9d	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5672-8853-9b62-417fb39d3999	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5672-8853-8688-cbf0ad20a6c7	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3146 (class 0 OID 32500198)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 32500188)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 32500400)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 32500330)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 32500039)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 32499801)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5672-8856-4962-23e65b52f50d	00010000-5672-8852-7486-fb2adcb56c46	2015-12-17 11:03:02	INS	a:0:{}
2	App\\Entity\\Option	00000000-5672-8856-52a1-c4728a555d39	00010000-5672-8852-7486-fb2adcb56c46	2015-12-17 11:03:02	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5672-8856-71d4-a33b74abdeab	00010000-5672-8852-7486-fb2adcb56c46	2015-12-17 11:03:02	INS	a:0:{}
\.


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3155 (class 0 OID 32500267)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 32499839)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5672-8851-3b2c-f6947b533ebf	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5672-8851-d6d3-3726b0bdc402	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5672-8851-024a-8ccedc38c8de	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5672-8851-8766-c8df2335bb25	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5672-8851-b91c-6cac479bd629	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5672-8851-4286-b1091313adf7	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5672-8851-94c4-ec449320d154	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5672-8851-b37f-0ae489c8905c	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5672-8851-faad-7bfed5678218	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5672-8851-ca89-b3e274ccfe2f	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5672-8851-ed5c-e90c921465e0	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5672-8851-1f1c-9175ddab593b	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5672-8851-93c9-9bf16050a2d1	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5672-8851-08ca-3cb41f443a79	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5672-8851-8cf8-f4f562613429	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5672-8851-52d6-95ceca77f6fe	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5672-8851-2702-f1b55900a795	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5672-8851-4835-75c4b0ec4991	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5672-8851-c52f-362b5a2c223e	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5672-8851-9e62-6ac8e92f19ea	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5672-8851-af6c-cc3cd4d05ad6	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5672-8851-c09a-cdf4832e3518	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5672-8851-4d56-16911065cfa8	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5672-8851-d8e5-2f92f1570c24	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5672-8851-05bb-d93fd4ffc5c7	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5672-8851-b3f2-1fdc581a6b2a	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5672-8851-a83b-e17ff6e7a4a4	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5672-8851-ceb2-c6349f24d5ff	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5672-8851-d792-2d3eefafc427	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5672-8851-b286-8ee0062b87d8	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5672-8851-0afa-33741a2f2b9c	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5672-8851-7270-21f0eaddbe40	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5672-8851-f9ab-8ea34ebad4da	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5672-8851-c3f5-9afbecb49cb9	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5672-8851-e979-569e8655cb13	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5672-8851-aa18-365f218086af	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5672-8851-521e-2864c30acd25	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5672-8851-f03f-1a135a52b474	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5672-8851-c253-05cd4a065c9e	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5672-8851-bb2f-4552d70cc9b1	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5672-8851-e3e7-9142cc60e059	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5672-8851-19b7-814dbcda8545	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5672-8851-f9f8-3cbfebfdd38d	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5672-8851-19de-01faa7d3454f	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5672-8851-2c43-6b9c04b48c80	direktor	minimalne pravice za direktorja	t
00020000-5672-8851-c49c-695ae9c81b14	arhivar	arhivar	t
00020000-5672-8851-e596-edea836b8f3b	dramaturg	dramaturg	t
00020000-5672-8851-9505-7f3ed0826b27	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5672-8851-2553-c8a6d1172f50	poslovni-sekretar	poslovni sekretar	t
00020000-5672-8851-5503-b56215abfd7e	vodja-tehnike	vodja tehnike	t
00020000-5672-8851-8d87-592dcc79b2ed	racunovodja	računovodja	t
00020000-5672-8853-867b-0a26ef9bd563	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5672-8853-dad1-9076dbd0e191	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5672-8853-537e-7ef8d9dc2e74	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5672-8853-1935-d1d5eb58d54b	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5672-8853-be38-e276426c6ced	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5672-8853-4448-d024086006d4	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5672-8853-980d-67d519a4acf0	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5672-8853-0528-562d21d4dfff	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5672-8853-ffdf-8064163b7a56	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5672-8853-5b36-2311d07c89ed	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5672-8853-0132-b1dd0432bb87	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5672-8853-ab9f-5acbddccdff2	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5672-8853-59f8-dcc9f1a2f497	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5672-8853-cac8-1004f769d0bc	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5672-8853-8fa7-de479c2ba30d	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5672-8853-58aa-6181ba48c7cb	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5672-8853-9152-c9dd3844c081	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5672-8853-83ac-74e5b9ea50a5	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5672-8853-3a29-0ef1f49e414b	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5672-8853-2db7-af8777bc2d04	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5672-8853-7353-b9bc782a5fb6	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5672-8853-4157-2ec5cff4023d	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5672-8853-15e6-221eb964652c	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5672-8853-9a58-4b8d8e2c0b2d	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5672-8853-1ca4-8dc9b941ae2a	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5672-8853-8ec7-b7ca47d01bc2	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5672-8853-f3c0-8f0829f5f15a	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5672-8853-fa5f-023110201e67	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5672-8853-35dd-84b1bbe7cd97	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5672-8853-e094-cfa1a1e7ee54	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5672-8853-4d45-30a02aa63dcb	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5672-8853-0799-f6192ae8d46c	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5672-8853-d181-0809fdbd4ea0	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5672-8853-2d33-4a830a622e28	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5672-8853-4b4c-4d4cf9573b6f	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5672-8853-00fc-ad2fbb125c44	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5672-8853-6c4e-c0900fde09a7	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5672-8853-324e-f3adbb07e9fa	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5672-8853-29d7-07f5816b624e	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3112 (class 0 OID 32499823)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5672-8852-8abc-47a463689257	00020000-5672-8851-024a-8ccedc38c8de
00010000-5672-8852-7486-fb2adcb56c46	00020000-5672-8851-024a-8ccedc38c8de
00010000-5672-8854-d283-cb353188cc76	00020000-5672-8853-867b-0a26ef9bd563
00010000-5672-8854-5aad-1bcd6adaee9e	00020000-5672-8853-dad1-9076dbd0e191
00010000-5672-8854-5aad-1bcd6adaee9e	00020000-5672-8853-4448-d024086006d4
00010000-5672-8854-5aad-1bcd6adaee9e	00020000-5672-8853-5b36-2311d07c89ed
00010000-5672-8854-5aad-1bcd6adaee9e	00020000-5672-8853-ab9f-5acbddccdff2
00010000-5672-8854-5aad-1bcd6adaee9e	00020000-5672-8853-cac8-1004f769d0bc
00010000-5672-8854-5aad-1bcd6adaee9e	00020000-5672-8853-3a29-0ef1f49e414b
00010000-5672-8854-5aad-1bcd6adaee9e	00020000-5672-8853-1935-d1d5eb58d54b
00010000-5672-8854-5aad-1bcd6adaee9e	00020000-5672-8853-7353-b9bc782a5fb6
00010000-5672-8854-5aad-1bcd6adaee9e	00020000-5672-8853-9a58-4b8d8e2c0b2d
00010000-5672-8854-5aad-1bcd6adaee9e	00020000-5672-8853-8ec7-b7ca47d01bc2
00010000-5672-8854-5aad-1bcd6adaee9e	00020000-5672-8853-fa5f-023110201e67
00010000-5672-8854-5aad-1bcd6adaee9e	00020000-5672-8853-e094-cfa1a1e7ee54
00010000-5672-8854-5aad-1bcd6adaee9e	00020000-5672-8853-2d33-4a830a622e28
00010000-5672-8854-220d-eee1d327f13c	00020000-5672-8853-dad1-9076dbd0e191
00010000-5672-8854-220d-eee1d327f13c	00020000-5672-8853-537e-7ef8d9dc2e74
00010000-5672-8854-220d-eee1d327f13c	00020000-5672-8853-1935-d1d5eb58d54b
00010000-5672-8854-220d-eee1d327f13c	00020000-5672-8853-be38-e276426c6ced
00010000-5672-8854-220d-eee1d327f13c	00020000-5672-8853-cac8-1004f769d0bc
00010000-5672-8854-220d-eee1d327f13c	00020000-5672-8853-9152-c9dd3844c081
00010000-5672-8854-220d-eee1d327f13c	00020000-5672-8853-7353-b9bc782a5fb6
00010000-5672-8854-220d-eee1d327f13c	00020000-5672-8853-9a58-4b8d8e2c0b2d
00010000-5672-8854-220d-eee1d327f13c	00020000-5672-8853-8ec7-b7ca47d01bc2
00010000-5672-8854-220d-eee1d327f13c	00020000-5672-8853-fa5f-023110201e67
00010000-5672-8854-220d-eee1d327f13c	00020000-5672-8853-e094-cfa1a1e7ee54
00010000-5672-8854-220d-eee1d327f13c	00020000-5672-8853-2d33-4a830a622e28
00010000-5672-8854-7705-255afdef944e	00020000-5672-8853-dad1-9076dbd0e191
00010000-5672-8854-7705-255afdef944e	00020000-5672-8853-537e-7ef8d9dc2e74
00010000-5672-8854-7705-255afdef944e	00020000-5672-8853-1935-d1d5eb58d54b
00010000-5672-8854-7705-255afdef944e	00020000-5672-8853-be38-e276426c6ced
00010000-5672-8854-7705-255afdef944e	00020000-5672-8853-ab9f-5acbddccdff2
00010000-5672-8854-7705-255afdef944e	00020000-5672-8853-cac8-1004f769d0bc
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-537e-7ef8d9dc2e74
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-980d-67d519a4acf0
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-0132-b1dd0432bb87
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-59f8-dcc9f1a2f497
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-ab9f-5acbddccdff2
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-83ac-74e5b9ea50a5
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-cac8-1004f769d0bc
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-8fa7-de479c2ba30d
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-7353-b9bc782a5fb6
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-4157-2ec5cff4023d
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-9a58-4b8d8e2c0b2d
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-1ca4-8dc9b941ae2a
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-8ec7-b7ca47d01bc2
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-f3c0-8f0829f5f15a
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-fa5f-023110201e67
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-35dd-84b1bbe7cd97
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-e094-cfa1a1e7ee54
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-4d45-30a02aa63dcb
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-2d33-4a830a622e28
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-4b4c-4d4cf9573b6f
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-6c4e-c0900fde09a7
00010000-5672-8854-6231-be0035e06bab	00020000-5672-8853-324e-f3adbb07e9fa
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-537e-7ef8d9dc2e74
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-980d-67d519a4acf0
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-ffdf-8064163b7a56
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-0132-b1dd0432bb87
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-59f8-dcc9f1a2f497
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-ab9f-5acbddccdff2
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-83ac-74e5b9ea50a5
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-cac8-1004f769d0bc
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-8fa7-de479c2ba30d
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-58aa-6181ba48c7cb
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-7353-b9bc782a5fb6
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-4157-2ec5cff4023d
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-15e6-221eb964652c
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-9a58-4b8d8e2c0b2d
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-1ca4-8dc9b941ae2a
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-8ec7-b7ca47d01bc2
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-f3c0-8f0829f5f15a
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-fa5f-023110201e67
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-35dd-84b1bbe7cd97
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-e094-cfa1a1e7ee54
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-4d45-30a02aa63dcb
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-2d33-4a830a622e28
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-4b4c-4d4cf9573b6f
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-00fc-ad2fbb125c44
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-6c4e-c0900fde09a7
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-324e-f3adbb07e9fa
00010000-5672-8854-8363-c31c55b58a7e	00020000-5672-8853-29d7-07f5816b624e
00010000-5672-8854-1c26-452fb26fa7b8	00020000-5672-8853-537e-7ef8d9dc2e74
00010000-5672-8854-1c26-452fb26fa7b8	00020000-5672-8853-1935-d1d5eb58d54b
00010000-5672-8854-1c26-452fb26fa7b8	00020000-5672-8853-980d-67d519a4acf0
00010000-5672-8854-1c26-452fb26fa7b8	00020000-5672-8853-0528-562d21d4dfff
00010000-5672-8854-1c26-452fb26fa7b8	00020000-5672-8853-ffdf-8064163b7a56
00010000-5672-8854-1c26-452fb26fa7b8	00020000-5672-8853-4448-d024086006d4
00010000-5672-8854-1c26-452fb26fa7b8	00020000-5672-8853-0132-b1dd0432bb87
00010000-5672-8854-1c26-452fb26fa7b8	00020000-5672-8853-59f8-dcc9f1a2f497
00010000-5672-8854-1c26-452fb26fa7b8	00020000-5672-8853-ab9f-5acbddccdff2
00010000-5672-8854-1c26-452fb26fa7b8	00020000-5672-8853-83ac-74e5b9ea50a5
00010000-5672-8854-19f7-1f3b4bb34d07	00020000-5672-8853-dad1-9076dbd0e191
00010000-5672-8854-19f7-1f3b4bb34d07	00020000-5672-8853-be38-e276426c6ced
00010000-5672-8854-19f7-1f3b4bb34d07	00020000-5672-8853-4448-d024086006d4
00010000-5672-8854-19f7-1f3b4bb34d07	00020000-5672-8853-5b36-2311d07c89ed
00010000-5672-8854-19f7-1f3b4bb34d07	00020000-5672-8853-ab9f-5acbddccdff2
00010000-5672-8854-19f7-1f3b4bb34d07	00020000-5672-8853-cac8-1004f769d0bc
00010000-5672-8854-19f7-1f3b4bb34d07	00020000-5672-8853-3a29-0ef1f49e414b
00010000-5672-8854-19f7-1f3b4bb34d07	00020000-5672-8853-0799-f6192ae8d46c
00010000-5672-8854-c868-58e6241b8d01	00020000-5672-8853-2db7-af8777bc2d04
00010000-5672-8854-bb27-4df0733acd52	00020000-5672-8851-2c43-6b9c04b48c80
00010000-5672-8854-5607-6e883a70819d	00020000-5672-8851-c49c-695ae9c81b14
00010000-5672-8854-23d0-e4018e4325f8	00020000-5672-8851-e596-edea836b8f3b
00010000-5672-8854-31ef-69d83c733d24	00020000-5672-8851-9505-7f3ed0826b27
00010000-5672-8854-45f6-ec51b8eb3268	00020000-5672-8851-2553-c8a6d1172f50
00010000-5672-8854-015f-5e885d119937	00020000-5672-8851-5503-b56215abfd7e
00010000-5672-8854-b88b-2fb9db0a95f8	00020000-5672-8851-8d87-592dcc79b2ed
\.


--
-- TOC entry 3157 (class 0 OID 32500281)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 32500219)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 32500165)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5672-8853-64fc-95c66b84bf6e	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5672-8853-4ae4-4ce14f589ae5	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5672-8853-1ef4-62e98f28fae8	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3108 (class 0 OID 32499788)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5672-8850-4afa-600e28743ef0	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5672-8850-f992-2f7950f4a84c	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5672-8850-acd2-49a1454bbe69	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5672-8850-2d4e-c7714ac387c6	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5672-8850-18cc-d779df2bc3df	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3107 (class 0 OID 32499780)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5672-8850-f8e6-6fe7dbc3aac2	00230000-5672-8850-2d4e-c7714ac387c6	popa
00240000-5672-8850-f6ec-a9d98b35bd07	00230000-5672-8850-2d4e-c7714ac387c6	oseba
00240000-5672-8850-45a8-c2433a47e211	00230000-5672-8850-2d4e-c7714ac387c6	tippopa
00240000-5672-8850-1957-22d2227cab58	00230000-5672-8850-2d4e-c7714ac387c6	organizacijskaenota
00240000-5672-8850-49cf-73cf2dbd55a2	00230000-5672-8850-2d4e-c7714ac387c6	sezona
00240000-5672-8850-75af-614b7c47cc8a	00230000-5672-8850-2d4e-c7714ac387c6	tipvaje
00240000-5672-8850-3629-285377220158	00230000-5672-8850-f992-2f7950f4a84c	prostor
00240000-5672-8850-7d63-c1eac348e474	00230000-5672-8850-2d4e-c7714ac387c6	besedilo
00240000-5672-8850-b141-d2c120741b01	00230000-5672-8850-2d4e-c7714ac387c6	uprizoritev
00240000-5672-8850-600e-020ade2dca57	00230000-5672-8850-2d4e-c7714ac387c6	funkcija
00240000-5672-8850-bd2e-a908c96e259d	00230000-5672-8850-2d4e-c7714ac387c6	tipfunkcije
00240000-5672-8850-d345-1a1a26abc1b5	00230000-5672-8850-2d4e-c7714ac387c6	alternacija
00240000-5672-8850-8137-d61f9b92ca0b	00230000-5672-8850-4afa-600e28743ef0	pogodba
00240000-5672-8850-c164-4866bc2f53b7	00230000-5672-8850-2d4e-c7714ac387c6	zaposlitev
00240000-5672-8850-f80b-ee738f3b9193	00230000-5672-8850-2d4e-c7714ac387c6	zvrstuprizoritve
00240000-5672-8850-a588-a68f4653a444	00230000-5672-8850-4afa-600e28743ef0	programdela
00240000-5672-8850-d78c-fab67e23e72f	00230000-5672-8850-2d4e-c7714ac387c6	zapis
\.


--
-- TOC entry 3106 (class 0 OID 32499775)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
8ba828c9-9464-401c-809e-5af49669da0f	00240000-5672-8850-f8e6-6fe7dbc3aac2	0	1001
\.


--
-- TOC entry 3163 (class 0 OID 32500347)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5672-8854-78ec-287b4b638211	000e0000-5672-8854-6327-255c4765320c	00080000-5672-8854-f8fc-ad4965f5fee7	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5672-8851-77e5-2dfdd8bea940
00270000-5672-8854-f4cb-6681d0e83e8e	000e0000-5672-8854-6327-255c4765320c	00080000-5672-8854-f8fc-ad4965f5fee7	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5672-8851-77e5-2dfdd8bea940
\.


--
-- TOC entry 3122 (class 0 OID 32499923)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 32500175)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5672-8854-1fee-5cbbfc799969	00180000-5672-8854-f6b4-c7ce5c6ed56f	000c0000-5672-8854-70ae-11a8cf34109c	00090000-5672-8854-82d2-7c9f8e3db83e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5672-8854-1d1a-b00402db522c	00180000-5672-8854-f6b4-c7ce5c6ed56f	000c0000-5672-8854-a075-63029d0604ea	00090000-5672-8854-4402-4ef78e632931	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5672-8854-9d1b-efb3f1aa64d9	00180000-5672-8854-f6b4-c7ce5c6ed56f	000c0000-5672-8854-b242-62786006f31e	00090000-5672-8854-46bc-08e88199ee4c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5672-8854-e1be-08ba73fd4b55	00180000-5672-8854-f6b4-c7ce5c6ed56f	000c0000-5672-8854-7ddf-2978c3d502a0	00090000-5672-8854-4e15-e62e3067e6f2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5672-8854-f89a-49dc7e58809f	00180000-5672-8854-f6b4-c7ce5c6ed56f	000c0000-5672-8854-9c15-07dd430ac0a3	00090000-5672-8854-a3df-4a29d662ae2f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5672-8854-ad35-9fa24d6e5af4	00180000-5672-8854-8193-77066739d692	\N	00090000-5672-8854-a3df-4a29d662ae2f	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5672-8854-ebaf-4e3169d40d05	00180000-5672-8854-8193-77066739d692	\N	00090000-5672-8854-4402-4ef78e632931	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3166 (class 0 OID 32500388)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5672-8850-2789-54b31cf30c94	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5672-8850-9eb6-b4e5f9e6f7b7	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5672-8850-3f24-efc4f6d10bba	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5672-8850-f6fb-61cca675293d	04	Režija	Režija	Režija	umetnik	30
000f0000-5672-8850-9091-9198e19c718c	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5672-8850-4f4c-92c0734faad3	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5672-8850-3134-ea372f2013b3	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5672-8850-cfa0-b82b05b9cd5d	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5672-8850-dbce-a5071e88e23d	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5672-8850-50cb-6d29a54fc767	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5672-8850-8793-8d1f55951a55	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5672-8850-e6ec-edc208a515be	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5672-8850-9643-00cb454d11f3	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5672-8850-a3f4-3782b583b441	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5672-8850-5479-5c36c7a9dee4	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5672-8850-dd1f-ca540ea14ef3	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5672-8850-d83d-0e4e6f670295	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5672-8850-35b5-a16e2fa18a42	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3119 (class 0 OID 32499874)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5672-8853-3666-01c84f4dbe17	0001	šola	osnovna ali srednja šola
00400000-5672-8853-2ddb-204140b8afd3	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5672-8853-62e5-b63f7a409638	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3179 (class 0 OID 32500693)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5672-8850-7f89-8ddf4ef1b7df	01	Velika predstava	f	1.00	1.00
002b0000-5672-8850-fe2a-d6ee94ae20d8	02	Mala predstava	f	0.50	0.50
002b0000-5672-8850-d05b-b31856d95d89	03	Mala koprodukcija	t	0.40	1.00
002b0000-5672-8850-cd9e-4cb3f9b5d9a5	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5672-8850-2332-3e3db1efdb9f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3142 (class 0 OID 32500155)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5672-8850-4dcf-51f3785d9d7c	0001	prva vaja	prva vaja
00420000-5672-8850-c65c-9b3ef6eac814	0002	tehnična vaja	tehnična vaja
00420000-5672-8850-538c-41cccbedeb3f	0003	lučna vaja	lučna vaja
00420000-5672-8850-7c66-294b0e2b6b10	0004	kostumska vaja	kostumska vaja
00420000-5672-8850-8765-97aa430c305e	0005	foto vaja	foto vaja
00420000-5672-8850-10b2-0326f9bfcffd	0006	1. glavna vaja	1. glavna vaja
00420000-5672-8850-37ce-c4a200463e71	0007	2. glavna vaja	2. glavna vaja
00420000-5672-8850-cadd-356a5782d7d6	0008	1. generalka	1. generalka
00420000-5672-8850-e015-2df2176763b3	0009	2. generalka	2. generalka
00420000-5672-8850-7e2e-934924842590	0010	odprta generalka	odprta generalka
00420000-5672-8850-11b3-4f7da9393baa	0011	obnovitvena vaja	obnovitvena vaja
00420000-5672-8850-dc23-b8f1f3a01c05	0012	italijanka	krajša "obnovitvena" vaja
00420000-5672-8850-acab-c4c1cbbf5e02	0013	pevska vaja	pevska vaja
00420000-5672-8850-e701-8777066c6f71	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5672-8850-0f7a-c67f8af9cc4d	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3128 (class 0 OID 32499996)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 32499810)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5672-8852-7486-fb2adcb56c46	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROg8CRdUIa.FNrQUa9CKfd6Uczug5hk8y	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5672-8854-d3db-a145387f76ea	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5672-8854-2ead-e4202615a8ed	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5672-8854-0e3d-0102f17ae853	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5672-8854-8c47-7e96257ad447	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5672-8854-d0b8-924ee6cecb53	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5672-8854-28a6-45c06d152708	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5672-8854-d79d-cf76b25b2ffb	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5672-8854-1718-1137bec2bee1	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5672-8854-8594-9c242b4e19f3	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5672-8854-d283-cb353188cc76	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5672-8854-f7e0-415e30a847cc	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5672-8854-5aad-1bcd6adaee9e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5672-8854-220d-eee1d327f13c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5672-8854-7705-255afdef944e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5672-8854-6231-be0035e06bab	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5672-8854-8363-c31c55b58a7e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5672-8854-1c26-452fb26fa7b8	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5672-8854-19f7-1f3b4bb34d07	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5672-8854-c868-58e6241b8d01	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5672-8854-bb27-4df0733acd52	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5672-8854-5607-6e883a70819d	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5672-8854-23d0-e4018e4325f8	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5672-8854-31ef-69d83c733d24	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5672-8854-45f6-ec51b8eb3268	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5672-8854-015f-5e885d119937	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5672-8854-b88b-2fb9db0a95f8	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5672-8852-8abc-47a463689257	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3170 (class 0 OID 32500438)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5672-8854-d36e-24dbc24d08f4	00160000-5672-8853-50a7-c944456408da	\N	00140000-5672-8850-c906-145a30eb8483	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5672-8853-f459-c231dc98cc9d
000e0000-5672-8854-6327-255c4765320c	00160000-5672-8853-1d96-50e2300a9a1f	\N	00140000-5672-8850-fd5e-3e22d6fe70f3	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5672-8853-9b62-417fb39d3999
000e0000-5672-8854-615d-cf908ffe1a45	\N	\N	00140000-5672-8850-fd5e-3e22d6fe70f3	00190000-5672-8854-220d-4244a2ce82e6	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5672-8853-f459-c231dc98cc9d
000e0000-5672-8854-a3d5-d481e9c0897c	\N	\N	00140000-5672-8850-fd5e-3e22d6fe70f3	00190000-5672-8854-220d-4244a2ce82e6	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5672-8853-f459-c231dc98cc9d
000e0000-5672-8854-ef66-094b58879171	\N	\N	00140000-5672-8850-fd5e-3e22d6fe70f3	00190000-5672-8854-220d-4244a2ce82e6	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5672-8853-bfca-331b9e29654c
000e0000-5672-8854-4ee2-350d8266ce06	\N	\N	00140000-5672-8850-fd5e-3e22d6fe70f3	00190000-5672-8854-220d-4244a2ce82e6	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5672-8853-bfca-331b9e29654c
\.


--
-- TOC entry 3136 (class 0 OID 32500095)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5672-8854-c99a-50c9f047ce58	\N	000e0000-5672-8854-6327-255c4765320c	1	
00200000-5672-8854-f8b9-f1051b1fda95	\N	000e0000-5672-8854-6327-255c4765320c	2	
00200000-5672-8854-3155-bcb4d9ab8183	\N	000e0000-5672-8854-6327-255c4765320c	3	
00200000-5672-8854-ba68-769dbac90f49	\N	000e0000-5672-8854-6327-255c4765320c	4	
00200000-5672-8854-fe2a-8ad6c78c4262	\N	000e0000-5672-8854-6327-255c4765320c	5	
\.


--
-- TOC entry 3153 (class 0 OID 32500246)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 32500361)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5672-8851-5d5e-136190ed9f23	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5672-8851-52ab-db0cba765be6	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5672-8851-a5cd-180b82884ceb	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5672-8851-46ce-35582147c750	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5672-8851-0dee-4724bba10eca	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5672-8851-3f2f-e9488d9eed71	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5672-8851-baca-6f19af730d6b	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5672-8851-1ac3-c6466fdcdae8	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5672-8851-77e5-2dfdd8bea940	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5672-8851-9b60-a878051564ee	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5672-8851-89bf-99cd7fbb1a0d	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5672-8851-9680-388043cc74fb	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5672-8851-558c-e1018853977b	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5672-8851-335d-2896a9e68441	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5672-8851-cc3a-c992e7233bf0	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5672-8851-9207-8fbe7a965fce	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5672-8851-8ae3-fece3da8b737	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5672-8851-6374-1f252917ac25	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5672-8851-cb8b-ce441e613179	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5672-8851-d6d4-2b31eaf050f3	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5672-8851-5ea0-1bc6a0ac75b4	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5672-8851-521e-0a6ac8dd2bb4	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5672-8851-41d0-1b5a72e911f8	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5672-8851-89e5-dc2a5dc3c397	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5672-8851-5d58-b53eb5192db0	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5672-8851-209e-1d9f5315c980	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5672-8851-bddc-df50ae9e305c	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5672-8851-6e67-d1738d19bbd5	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3182 (class 0 OID 32500743)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 32500712)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 32500755)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 32500319)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5672-8854-a81e-b8da47767037	00090000-5672-8854-4402-4ef78e632931	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5672-8854-176b-6f35ac17f0a6	00090000-5672-8854-46bc-08e88199ee4c	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5672-8854-d242-52c8dca66d7c	00090000-5672-8854-2c7b-1045826ada11	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5672-8854-ec55-c4982286bd7e	00090000-5672-8854-c85c-e1dd759e8b93	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5672-8854-adcc-7b97cb4e4c9f	00090000-5672-8854-cdeb-9ee6ffc2b76b	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5672-8854-a02b-2894e0454035	00090000-5672-8854-3728-2cb64eb22cb1	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3139 (class 0 OID 32500139)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 32500428)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5672-8850-c906-145a30eb8483	01	Drama	drama (SURS 01)
00140000-5672-8850-8f4b-4cf6bc3f4f30	02	Opera	opera (SURS 02)
00140000-5672-8850-aae4-8dd5712996f4	03	Balet	balet (SURS 03)
00140000-5672-8850-da4b-3199c5ee35b1	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5672-8850-289e-10da5b5b51e0	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5672-8850-fd5e-3e22d6fe70f3	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5672-8850-7195-2b94cd9c612f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3159 (class 0 OID 32500309)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2601 (class 2606 OID 32499873)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 32500487)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 32500477)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 32499864)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 32500344)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 32500386)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 32500796)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 32500127)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 32500149)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 32500154)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 32500710)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 32500022)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 32500556)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 32500305)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 32500093)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 32500060)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 32500036)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 32500211)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 32500773)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 32500780)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2882 (class 2606 OID 32500804)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 32153623)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2739 (class 2606 OID 32500238)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 32499994)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 32499892)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 32499956)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 32499919)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 32499853)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2590 (class 2606 OID 32499838)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 32500244)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 32500280)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 32500423)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 32499947)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 32499982)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 32500661)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 32500217)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 32499972)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 32500112)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 32500081)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2668 (class 2606 OID 32500073)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 32500229)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 32500670)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 32500678)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 32500648)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 32500691)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 32500262)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 32500202)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 32500193)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 32500410)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 32500337)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 32500048)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 32499809)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 32500271)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 32499827)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2592 (class 2606 OID 32499847)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 32500289)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 32500224)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 32500173)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 32499797)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 32499785)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 32499779)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 32500357)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 32499928)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 32500184)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 32500397)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 32499881)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 32500703)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 32500162)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 32500007)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 32499822)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 32500456)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 32500102)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 32500252)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 32500369)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 32500753)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 32500737)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 32500761)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 32500327)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 32500143)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 32500436)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 32500317)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 1259 OID 32500137)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2685 (class 1259 OID 32500138)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2686 (class 1259 OID 32500136)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2687 (class 1259 OID 32500135)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2688 (class 1259 OID 32500134)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2782 (class 1259 OID 32500358)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2783 (class 1259 OID 32500359)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 32500360)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2868 (class 1259 OID 32500775)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2869 (class 1259 OID 32500774)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2619 (class 1259 OID 32499949)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2620 (class 1259 OID 32499950)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2740 (class 1259 OID 32500245)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2855 (class 1259 OID 32500741)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2856 (class 1259 OID 32500740)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2857 (class 1259 OID 32500742)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2858 (class 1259 OID 32500739)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2859 (class 1259 OID 32500738)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2734 (class 1259 OID 32500231)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2735 (class 1259 OID 32500230)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2676 (class 1259 OID 32500103)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2677 (class 1259 OID 32500104)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2764 (class 1259 OID 32500306)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2765 (class 1259 OID 32500308)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2766 (class 1259 OID 32500307)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2651 (class 1259 OID 32500038)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 32500037)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2846 (class 1259 OID 32500692)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2798 (class 1259 OID 32500425)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2799 (class 1259 OID 32500426)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 32500427)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2865 (class 1259 OID 32500762)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2807 (class 1259 OID 32500461)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2808 (class 1259 OID 32500458)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2809 (class 1259 OID 32500462)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2810 (class 1259 OID 32500460)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2811 (class 1259 OID 32500459)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2641 (class 1259 OID 32500009)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 32500008)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2610 (class 1259 OID 32499922)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2752 (class 1259 OID 32500272)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2594 (class 1259 OID 32499854)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2595 (class 1259 OID 32499855)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2757 (class 1259 OID 32500292)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2758 (class 1259 OID 32500291)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2759 (class 1259 OID 32500290)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2624 (class 1259 OID 32499959)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2625 (class 1259 OID 32499958)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2626 (class 1259 OID 32499960)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2664 (class 1259 OID 32500076)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2665 (class 1259 OID 32500074)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 32500075)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2574 (class 1259 OID 32499787)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2714 (class 1259 OID 32500197)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2715 (class 1259 OID 32500195)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2716 (class 1259 OID 32500194)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2717 (class 1259 OID 32500196)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2585 (class 1259 OID 32499828)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 32499829)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2743 (class 1259 OID 32500253)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2878 (class 1259 OID 32500797)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2780 (class 1259 OID 32500346)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2781 (class 1259 OID 32500345)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2879 (class 1259 OID 32500805)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2880 (class 1259 OID 32500806)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2729 (class 1259 OID 32500218)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2774 (class 1259 OID 32500338)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2775 (class 1259 OID 32500339)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2828 (class 1259 OID 32500561)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2829 (class 1259 OID 32500560)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2830 (class 1259 OID 32500557)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2831 (class 1259 OID 32500558)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2832 (class 1259 OID 32500559)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2630 (class 1259 OID 32499974)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 32499973)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2632 (class 1259 OID 32499975)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2746 (class 1259 OID 32500266)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2747 (class 1259 OID 32500265)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2838 (class 1259 OID 32500671)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2839 (class 1259 OID 32500672)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2821 (class 1259 OID 32500491)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2822 (class 1259 OID 32500492)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2823 (class 1259 OID 32500489)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2824 (class 1259 OID 32500490)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2770 (class 1259 OID 32500328)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2771 (class 1259 OID 32500329)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2720 (class 1259 OID 32500206)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2721 (class 1259 OID 32500205)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 32500203)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2723 (class 1259 OID 32500204)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2817 (class 1259 OID 32500479)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 32500478)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2655 (class 1259 OID 32500049)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2658 (class 1259 OID 32500063)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2659 (class 1259 OID 32500062)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2660 (class 1259 OID 32500061)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2661 (class 1259 OID 32500064)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2675 (class 1259 OID 32500094)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 32500082)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2670 (class 1259 OID 32500083)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2835 (class 1259 OID 32500662)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2854 (class 1259 OID 32500711)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2872 (class 1259 OID 32500781)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2873 (class 1259 OID 32500782)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2606 (class 1259 OID 32499894)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 32499893)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2615 (class 1259 OID 32499929)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2616 (class 1259 OID 32499930)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2695 (class 1259 OID 32500144)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2709 (class 1259 OID 32500187)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 32500186)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2711 (class 1259 OID 32500185)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2689 (class 1259 OID 32500129)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2690 (class 1259 OID 32500130)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2691 (class 1259 OID 32500133)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2692 (class 1259 OID 32500128)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2693 (class 1259 OID 32500132)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2694 (class 1259 OID 32500131)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2623 (class 1259 OID 32499948)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2604 (class 1259 OID 32499882)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 32499883)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2647 (class 1259 OID 32500023)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 32500025)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2649 (class 1259 OID 32500024)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2650 (class 1259 OID 32500026)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2728 (class 1259 OID 32500212)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2803 (class 1259 OID 32500424)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 32500457)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 32500398)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 32500399)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2613 (class 1259 OID 32499920)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 32499921)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2767 (class 1259 OID 32500318)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 32499798)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 32499995)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2629 (class 1259 OID 32499957)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2577 (class 1259 OID 32499786)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2851 (class 1259 OID 32500704)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 32500264)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2751 (class 1259 OID 32500263)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 32500163)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 32500164)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2825 (class 1259 OID 32500488)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 32499983)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2804 (class 1259 OID 32500437)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2862 (class 1259 OID 32500754)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2844 (class 1259 OID 32500679)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 32500680)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2791 (class 1259 OID 32500387)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2708 (class 1259 OID 32500174)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 32499848)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2917 (class 2606 OID 32500977)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2918 (class 2606 OID 32500982)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2923 (class 2606 OID 32501007)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2921 (class 2606 OID 32500997)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2916 (class 2606 OID 32500972)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2920 (class 2606 OID 32500992)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2922 (class 2606 OID 32501002)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2919 (class 2606 OID 32500987)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2957 (class 2606 OID 32501177)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2958 (class 2606 OID 32501182)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2959 (class 2606 OID 32501187)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2992 (class 2606 OID 32501352)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2991 (class 2606 OID 32501347)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2894 (class 2606 OID 32500862)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2895 (class 2606 OID 32500867)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 32501092)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2988 (class 2606 OID 32501332)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 32501327)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2989 (class 2606 OID 32501337)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2986 (class 2606 OID 32501322)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2985 (class 2606 OID 32501317)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2939 (class 2606 OID 32501087)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2938 (class 2606 OID 32501082)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2914 (class 2606 OID 32500962)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2915 (class 2606 OID 32500967)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 32501132)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2950 (class 2606 OID 32501142)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2949 (class 2606 OID 32501137)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2905 (class 2606 OID 32500917)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2904 (class 2606 OID 32500912)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2936 (class 2606 OID 32501072)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2983 (class 2606 OID 32501307)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2960 (class 2606 OID 32501192)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2961 (class 2606 OID 32501197)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2962 (class 2606 OID 32501202)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2990 (class 2606 OID 32501342)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2966 (class 2606 OID 32501222)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2963 (class 2606 OID 32501207)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2967 (class 2606 OID 32501227)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2965 (class 2606 OID 32501217)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2964 (class 2606 OID 32501212)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2903 (class 2606 OID 32500907)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2902 (class 2606 OID 32500902)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2891 (class 2606 OID 32500847)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2890 (class 2606 OID 32500842)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 32501112)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2886 (class 2606 OID 32500822)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2887 (class 2606 OID 32500827)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2947 (class 2606 OID 32501127)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2946 (class 2606 OID 32501122)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2945 (class 2606 OID 32501117)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2897 (class 2606 OID 32500877)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2896 (class 2606 OID 32500872)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2898 (class 2606 OID 32500882)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2910 (class 2606 OID 32500942)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2908 (class 2606 OID 32500932)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 32500937)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2883 (class 2606 OID 32500807)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2931 (class 2606 OID 32501047)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2929 (class 2606 OID 32501037)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2928 (class 2606 OID 32501032)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2930 (class 2606 OID 32501042)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2884 (class 2606 OID 32500812)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2885 (class 2606 OID 32500817)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2941 (class 2606 OID 32501097)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2995 (class 2606 OID 32501367)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2956 (class 2606 OID 32501172)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2955 (class 2606 OID 32501167)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2996 (class 2606 OID 32501372)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2997 (class 2606 OID 32501377)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2937 (class 2606 OID 32501077)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2953 (class 2606 OID 32501157)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2954 (class 2606 OID 32501162)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2978 (class 2606 OID 32501282)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2977 (class 2606 OID 32501277)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2974 (class 2606 OID 32501262)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2975 (class 2606 OID 32501267)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2976 (class 2606 OID 32501272)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2900 (class 2606 OID 32500892)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 32500887)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2901 (class 2606 OID 32500897)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2943 (class 2606 OID 32501107)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2942 (class 2606 OID 32501102)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2980 (class 2606 OID 32501292)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2981 (class 2606 OID 32501297)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2972 (class 2606 OID 32501252)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2973 (class 2606 OID 32501257)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2970 (class 2606 OID 32501242)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2971 (class 2606 OID 32501247)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2951 (class 2606 OID 32501147)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2952 (class 2606 OID 32501152)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2935 (class 2606 OID 32501067)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2934 (class 2606 OID 32501062)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2932 (class 2606 OID 32501052)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2933 (class 2606 OID 32501057)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2969 (class 2606 OID 32501237)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2968 (class 2606 OID 32501232)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2906 (class 2606 OID 32500922)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2907 (class 2606 OID 32500927)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 32500957)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2911 (class 2606 OID 32500947)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2912 (class 2606 OID 32500952)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 32501287)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2982 (class 2606 OID 32501302)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2984 (class 2606 OID 32501312)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2993 (class 2606 OID 32501357)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2994 (class 2606 OID 32501362)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2889 (class 2606 OID 32500837)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2888 (class 2606 OID 32500832)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2892 (class 2606 OID 32500852)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2893 (class 2606 OID 32500857)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 32501012)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 32501027)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 32501022)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2925 (class 2606 OID 32501017)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-17 11:03:03 CET

--
-- PostgreSQL database dump complete
--

